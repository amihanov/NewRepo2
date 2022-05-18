SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaIndicadoresProyectos]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaIndicadoresProyectos] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spConsultaIndicadoresProyectos]
@dMesConsulta  VARCHAR(2),
                                                 @dAñoConsulta  VARCHAR(4)

AS

DECLARE @dFechaInicioConsulta DATETIME,
        @dFechaFinConsulta DATETIME,
        @iNumerador     INT,
        @iDenominador   INT,
        @fRendimiento   FLOAT

--Obtenemos el intervalo en el cual se va ha realizar la consulta.
--Primer día del Mes
SELECT @dFechaInicioConsulta = CONVERT(DATETIME,@dMesConsulta+'-1-'+@dAñoConsulta)
--Ultimo día del Mes
SELECT @dFechaFinConsulta = dateadd(ms,-3,DATEADD(mm, DATEDIFF(m,0,@dFechaInicioConsulta)+1, 0));

--Creamos la tablas auxiliares para realizar las consultas sobre las OTs.
CREATE TABLE #tmp_proy
(
	OTID     INT IDENTITY,  --id forma
	OTPAKGID VARCHAR(40),   --id paquete
	OTPKGNME VARCHAR(128),  --nombre paquete
	OTDENUME VARCHAR(40),   --id ot
	OTDETIPO VARCHAR(16),   --tipo requerimiento
	OTDEREQU VARCHAR(255),  --descripcion requerimiento
	OTFRECEP DATETIME,      --fecha recibida el
	OTDEUSRC VARCHAR(40),   --emisor
	OTDEFREQ DATETIME,      --fecha requerida
	OTASJEFE VARCHAR(128),  --jpy
	OTASINGP VARCHAR(128),  --ipy
	OTDEFINI DATETIME,      --fecha inicio
	OTFTERES DATETIME,      --fecha termino construccion estimado
	OTFETERR DATETIME,      --fecha termino construccion real
	OTFEREPR DATETIME,      --fecha reprogramacion
	OTFEACPE DATETIME,      --fecha aceptacion estimado
	OTFEACPR DATETIME,      --fecha aceptacion real
	OTFENTOP DATETIME,      --fecha entrega operaciones
	OTFEPROD DATETIME,      --fecha puesta en produccion
	OTESTADO VARCHAR(40),   --estado ot
	OTDEFPRO VARCHAR(30)    --familia producto
)

CREATE TABLE #tmp_proy1
(
	OTPAKGID VARCHAR(40),   --id paquete
	OTPKGNME VARCHAR(128),  --nombre paquete
	OTDENUME VARCHAR(40),   --id ot
	OTDETIPO VARCHAR(16),   --tipo requerimiento
	OTDEREQU VARCHAR(255),  --descripcion requerimiento
	OTDEUSRC VARCHAR(40),   --emisor
	OTDEFREQ DATETIME,      --fecha requerida
	OTASJEFE VARCHAR(128),  --jpy
	OTASINGP VARCHAR(128),  --ipy
	OTFTERES DATETIME,      --fecha termino construccion estimado
	OTFEREPR DATETIME,      --fecha reprogramacion
	OTFEACPE DATETIME,      --fecha aceptacion estimado
	OTESTADO VARCHAR(40),   --estado ot
	OTDEFPRO VARCHAR(30),   --familia producto
)

CREATE TABLE #tmp_fechas_proy
(
	OTDENUME VARCHAR(40),   --id ot
	OTFRECEP DATETIME,      --fecha recibida el
	OTDEFINI DATETIME,      --fecha inicio
	OTFETERR DATETIME,      --fecha termino construccion real
	OTFEACEP DATETIME,      --fecha aceptacion real
	OTFENTOP DATETIME,      --fecha entrega operaciones
	OTFEPROD DATETIME,      --fecha puesta en produccion
	OTPAKGID VARCHAR(40)    --id paquete
)

-- Tablas auxiliares para obtener el estado actual del paquete.
CREATE TABLE #tmp_fecha_estado_actual
(
	cPKGID        VARCHAR(40),
	cFechaMAXPKG  DATETIME
)

CREATE TABLE #tmp_estado_actual
(
	cPKGID    VARCHAR(40),
	vcESTADO  VARCHAR(40)
)

CREATE TABLE #tmp_nombre_paquete
(
	cPKGID       VARCHAR(40),  
	vcNombrePKG  VARCHAR(128)
)

-- Tablas auxiliares para ocupar los filtros preestablecidos.
CREATE TABLE #tmp_filtro_tipo
(
	cTipo CHAR(16)
)

CREATE TABLE #tmp_filtro_estado
(
	cEstado CHAR(40)
)

CREATE TABLE #tmp_filtro_jefe
(
	cNombreJefe CHAR(128)
)

CREATE TABLE #tmp_filtro_ingeniero
(
	cNombreIngeniero CHAR(128)
)

-- Tablas auxiliares para calcular los ciclos de QA.
CREATE TABLE #tmp_history
(
	id       INT IDENTITY,
	idpak    VARCHAR(40),
	action   VARCHAR(40),
	fecha    DATETIME,
	estado   VARCHAR(40)
)

CREATE TABLE #tmp_nciclos
(
	id       INT IDENTITY,
	idpak    VARCHAR(40),
	nciclos  INT
)

-- Rellenar los filtros para mantener concordancia con los
-- proyectos que se muestran en el sis.
-- Filtro Tipo
INSERT #tmp_filtro_tipo VALUES ('Nuevo')
INSERT #tmp_filtro_tipo VALUES ('Modificacion')
INSERT #tmp_filtro_tipo VALUES ('Falla')
INSERT #tmp_filtro_tipo VALUES ('Evaluacion')

-- Filtrp Estado
INSERT #tmp_filtro_estado VALUES ('Definicion de requerimientos')
INSERT #tmp_filtro_estado VALUES ('Requerimientos Eliminados')
INSERT #tmp_filtro_estado VALUES ('Asignacion de requerimientos')
INSERT #tmp_filtro_estado VALUES ('Diseño')
INSERT #tmp_filtro_estado VALUES ('Codificacion')
INSERT #tmp_filtro_estado VALUES ('Pruebas')
INSERT #tmp_filtro_estado VALUES ('Aseguramiento de Calidad')
INSERT #tmp_filtro_estado VALUES ('Aceptacion Usuario')
INSERT #tmp_filtro_estado VALUES ('Puesta en Produccion')
INSERT #tmp_filtro_estado VALUES ('Produccion')

-- Filtro Jefe
INSERT #tmp_filtro_jefe
SELECT realname
FROM   haruser hu, harusersingroup hig, harusergroup hug
WHERE  hu.usrobjid = hig.usrobjid
AND hig.usrgrpobjid = hug. usrgrpobjid
AND usergroupname = 'SF Jefe de Proyectos'

-- Filtro Ingeniero
INSERT #tmp_filtro_ingeniero
SELECT realname
FROM   haruser hu, harusersingroup hig, harusergroup hug
WHERE  hu.usrobjid = hig.usrobjid
       AND hig.usrgrpobjid = hug. usrgrpobjid
       AND usergroupname = 'SF Ingeniero de Proyectos'

-- Se procede a obtener el estado actual del paquete
INSERT #tmp_fecha_estado_actual
SELECT packageobjid, MAX(execdtime)
FROM   harpkghistory
GROUP BY packageobjid  
ORDER BY packageobjid

INSERT #tmp_estado_actual
SELECT packageobjid, statename
FROM   harpkghistory, #tmp_fecha_estado_actual
WHERE  packageobjid = cPKGID
       AND execdtime = cFechaMAXPKG
GROUP BY packageobjid, statename
ORDER BY packageobjid

INSERT #tmp_nombre_paquete
SELECT packageobjid, packagename
FROM   harpackage

-- Se hace las inseciones para 4 escenarios
-- Cuando el jefe y el ingeniero no son nulos
INSERT INTO #tmp_proy1
SELECT o.OTPAKGID"Id Paquete", tnp.vcNombrePKG"Nombre Paquete", o.OTDENUME"OT", o.OTDETIPO"Tipo Requerimiento", o.OTDEREQU "Descripción",  
       o.OTDEUSRC"Emisor", o.OTDEFREQ"Fecha Requerida", o.OTASJEFE"JPY", o.OTASINGP"IPY", o.OTREFTE1"Fecha Termino Construcción Estimado",
       isnull(o.OTREFRE3,isnull(o.OTREFRE2,o.OTREFRE1))"Fecha Reprogramación", o.OTREFTE2"Fecha Aceptación Estimado",
       tea.vcESTADO"Estado", o.OTDEFPRO"Familia"
FROM   ot1sinac o, #tmp_estado_actual tea, #tmp_nombre_paquete tnp
WHERE  o.OTPAKGID = tea.cPKGID
       AND tnp.cPKGID = tea.cPKGID
       AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
       AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
       AND o.OTASJEFE IN (SELECT cNombreJefe FROM #tmp_filtro_jefe)
       AND o.OTASINGP IN (SELECT cNombreIngeniero FROM #tmp_filtro_ingeniero)
GROUP BY o.OTPAKGID, tnp.vcNombrePKG, o.OTDENUME, o.OTDETIPO, o. OTDEREQU, o.OTDEUSRC, o.OTDEFREQ,   o.OTASJEFE,
         o.OTASINGP, o.OTREFTE1,      o.OTREFRE1, o.OTREFRE2, o.OTREFRE3,  o.OTREFTE2, tea.vcESTADO, o.OTDEFPRO
ORDER BY o.OTDENUME DESC

INSERT INTO #tmp_fechas_proy
SELECT o.OTDENUME"OT", MAX(hfre.execdtime)"Fecha Recibida el", MAX(hfi.execdtime)"Fecha Inicio",
       MAX(hfctr.execdtime)"Fecha Termino Construcción Real", MAX(hfar.execdtime)"Fecha Aceptación Real",
       MAX(hfeo.execdtime)"Fecha Entrega Operaciones", MAX(hfep.execdtime)"Fecha Puesta en Produccion", o.OTPAKGID"Id Paquete"
FROM   ot1sinac o, 
		 --harpkghistory hfre, 
		 --harpkghistory hfi, 
		 --harpkghistory hfctr,
		 --harpkghistory hfar, 
		 --harpkghistory hfeo, 
		 --harpkghistory hfep, 
		 #tmp_estado_actual tea
left join harpkghistory hfre on o.OTPAKGID = hfre.packageobjid AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
left join harpkghistory hfi on o.OTPAKGID = hfi.packageobjid AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
left join harpkghistory hfctr on o.OTPAKGID = hfctr.packageobjid AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
left join harpkghistory hfar on o.OTPAKGID = hfar.packageobjid AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
left join harpkghistory hfeo on o.OTPAKGID = hfeo.packageobjid AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
left join harpkghistory hfep on o.OTPAKGID = hfep.packageobjid AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
WHERE  o.OTPAKGID = tea.cPKGID
       --AND o.OTPAKGID *= hfre.packageobjid
       --AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
       --AND o.OTPAKGID *= hfi.packageobjid
      -- AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
       --AND o.OTPAKGID *= hfctr.packageobjid
       --AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
       --AND o.OTPAKGID *= hfar.packageobjid
       --AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
       --AND o.OTPAKGID *= hfeo.packageobjid
       --AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
       --AND o.OTPAKGID *= hfep.packageobjid
       --AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
       AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
       AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
       AND o.OTASJEFE IN (SELECT cNombreJefe FROM #tmp_filtro_jefe)
       AND o.OTASINGP IN (SELECT cNombreIngeniero FROM #tmp_filtro_ingeniero)
GROUP BY o.OTDENUME, o.OTPAKGID
ORDER BY o.OTDENUME DESC

-- Cuando el jefe y el ingeniero son nulos
INSERT INTO #tmp_proy1
SELECT o.OTPAKGID"Id Paquete", tnp.vcNombrePKG"Nombre Paquete", o.OTDENUME"OT", o.OTDETIPO"Tipo Requerimiento", o.OTDEREQU "Descripción",
       o.OTDEUSRC"Emisor", o.OTDEFREQ"Fecha Requerida", o.OTASJEFE"JPY", o.OTASINGP"IPY", o.OTREFTE1"Fecha Termino Construcción Estimado",
       isnull(o.OTREFRE3,isnull(o.OTREFRE2,o.OTREFRE1))"Fecha Reprogramación", o.OTREFTE2"Fecha Aceptación Estimado",
       tea.vcESTADO"Estado", o.OTDEFPRO"Familia"
FROM   ot1sinac o, #tmp_estado_actual tea, #tmp_nombre_paquete tnp
WHERE  o.OTPAKGID = tea.cPKGID
       AND tnp.cPKGID = tea.cPKGID
       AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
       AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
       AND o.OTASJEFE IS NULL
	     AND o.OTASINGP IS NULL
GROUP BY o.OTPAKGID, tnp.vcNombrePKG, o.OTDENUME, o.OTDETIPO, o. OTDEREQU, o.OTDEUSRC, o.OTDEFREQ,   o.OTASJEFE,
         o.OTASINGP, o.OTREFTE1,      o.OTREFRE1, o.OTREFRE2, o.OTREFRE3,  o.OTREFTE2, tea.vcESTADO, o.OTDEFPRO
ORDER BY o.OTDENUME DESC

INSERT INTO #tmp_fechas_proy
SELECT o.OTDENUME"OT", MAX(hfre.execdtime)"Fecha Recibida el", MAX(hfi.execdtime)"Fecha Inicio",
       MAX(hfctr.execdtime)"Fecha Termino Construcción Real", MAX(hfar.execdtime)"Fecha Aceptación Real",
       MAX(hfeo.execdtime)"Fecha Entrega Operaciones", MAX(hfep.execdtime)"Fecha Puesta en Produccion", o.OTPAKGID"Id Paquete"
FROM   ot1sinac o, 
		#tmp_estado_actual tea
left join harpkghistory hfre on o.OTPAKGID = hfre.packageobjid AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
	     
left join harpkghistory hfi on o.OTPAKGID = hfi.packageobjid AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
left join harpkghistory hfctr on o.OTPAKGID = hfctr.packageobjid AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
left join harpkghistory hfar on o.OTPAKGID = hfar.packageobjid AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
left join harpkghistory hfeo on o.OTPAKGID = hfeo.packageobjid AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
left join harpkghistory hfep on o.OTPAKGID = hfep.packageobjid AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
WHERE  o.OTPAKGID = tea.cPKGID
       --AND o.OTPAKGID *= hfre.packageobjid
	     --AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
	     --AND o.OTPAKGID *= hfi.packageobjid
	     --AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
	     --AND o.OTPAKGID *= hfctr.packageobjid
	     --AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
	     --AND o.OTPAKGID *= hfar.packageobjid
	    -- AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
	     --AND o.OTPAKGID *= hfeo.packageobjid
	     --AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
	     --AND o.OTPAKGID *= hfep.packageobjid
	     --AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
	     AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
	     AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
	     AND o.OTASJEFE IS NULL
       AND o.OTASINGP IS NULL
GROUP BY o.OTDENUME, o.OTPAKGID
		ORDER BY o.OTDENUME DESC

-- Cuando el jefe es nulo y el ingeniero no
INSERT INTO #tmp_proy1
SELECT o.OTPAKGID"Id Paquete", tnp.vcNombrePKG"Nombre Paquete", o.OTDENUME"OT", o.OTDETIPO"Tipo Requerimiento", o.OTDEREQU "Descripción",
       o.OTDEUSRC"Emisor", o.OTDEFREQ"Fecha Requerida", o.OTASJEFE"JPY", o.OTASINGP"IPY", o.OTREFTE1"Fecha Termino Construcción Estimado",
       isnull(o.OTREFRE3,isnull(o.OTREFRE2,o.OTREFRE1))"Fecha Reprogramación", o.OTREFTE2"Fecha Aceptación Estimado",
       tea.vcESTADO"Estado", o.OTDEFPRO"Familia"
FROM   ot1sinac o, #tmp_estado_actual tea, #tmp_nombre_paquete tnp
WHERE  o.OTPAKGID = tea.cPKGID
       AND tnp.cPKGID = tea.cPKGID
       AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
	     AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
	     AND o.OTASJEFE IS NULL
	     AND o.OTASINGP IN (SELECT cNombreIngeniero FROM #tmp_filtro_ingeniero)
GROUP BY o.OTPAKGID, tnp.vcNombrePKG, o.OTDENUME, o.OTDETIPO, o. OTDEREQU, o.OTDEUSRC, o.OTDEFREQ,   o.OTASJEFE,
         o.OTASINGP, o.OTREFTE1,      o.OTREFRE1, o.OTREFRE2, o.OTREFRE3,  o.OTREFTE2, tea.vcESTADO, o.OTDEFPRO
ORDER BY o.OTDENUME DESC

INSERT INTO #tmp_fechas_proy
SELECT o.OTDENUME"OT", MAX(hfre.execdtime)"Fecha Recibida el", MAX(hfi.execdtime)"Fecha Inicio",
       MAX(hfctr.execdtime)"Fecha Termino Construcción Real", MAX(hfar.execdtime)"Fecha Aceptación Real",
       MAX(hfeo.execdtime)"Fecha Entrega Operaciones", MAX(hfep.execdtime)"Fecha Puesta en Produccion", o.OTPAKGID"Id Paquete"
FROM   ot1sinac o,
		#tmp_estado_actual tea
left join harpkghistory hfre on o.OTPAKGID = hfre.packageobjid AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
left join harpkghistory hfi on o.OTPAKGID = hfi.packageobjid  AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
left join harpkghistory hfctr on o.OTPAKGID = hfctr.packageobjid AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
left join harpkghistory hfar on o.OTPAKGID = hfar.packageobjid AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
left join harpkghistory hfeo on o.OTPAKGID = hfeo.packageobjid AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
left join harpkghistory hfep on o.OTPAKGID = hfep.packageobjid AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
WHERE  o.OTPAKGID = tea.cPKGID
       --AND o.OTPAKGID *= hfre.packageobjid
       AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
       --AND o.OTPAKGID *= hfi.packageobjid
       --AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
       --AND o.OTPAKGID *= hfctr.packageobjid
       --AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
       --AND o.OTPAKGID *= hfar.packageobjid
       --AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
       --AND o.OTPAKGID *= hfeo.packageobjid
       --AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
       --AND o.OTPAKGID *= hfep.packageobjid
       --AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
       AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
       AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
       AND o.OTASJEFE IS NULL
       AND o.OTASINGP IN (SELECT cNombreIngeniero FROM #tmp_filtro_ingeniero)
GROUP BY o.OTDENUME, o.OTPAKGID
ORDER BY o.OTDENUME DESC

--Cuando el jefe no es nulo y el ingeniero si
INSERT INTO #tmp_proy1
SELECT o.OTPAKGID"Id Paquete", tnp.vcNombrePKG"Nombre Paquete", o.OTDENUME"OT", o.OTDETIPO"Tipo Requerimiento", o.OTDEREQU "Descripción",
       o.OTDEUSRC"Emisor", o.OTDEFREQ"Fecha Requerida", o.OTASJEFE"JPY", o.OTASINGP"IPY", o.OTREFTE1"Fecha Termino Construcción Estimado",
       isnull(o.OTREFRE3,isnull(o.OTREFRE2,o.OTREFRE1))"Fecha Reprogramación", o.OTREFTE2"Fecha Aceptación Estimado",
       tea.vcESTADO"Estado", o.OTDEFPRO"Familia"
FROM   ot1sinac o, #tmp_estado_actual tea, #tmp_nombre_paquete tnp
WHERE  o.OTPAKGID = tea.cPKGID
       AND tnp.cPKGID = tea.cPKGID
       AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
       AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
       AND o.OTASJEFE IN (SELECT cNombreJefe FROM #tmp_filtro_jefe)
       AND o.OTASINGP IS NULL
GROUP BY o.OTPAKGID, tnp.vcNombrePKG, o.OTDENUME, o.OTDETIPO, o. OTDEREQU, o.OTDEUSRC, o.OTDEFREQ,   o.OTASJEFE,
         o.OTASINGP, o.OTREFTE1,      o.OTREFRE1, o.OTREFRE2, o.OTREFRE3,  o.OTREFTE2, tea.vcESTADO, o.OTDEFPRO
ORDER BY o.OTDENUME DESC

INSERT INTO #tmp_fechas_proy
SELECT o.OTDENUME"OT", MAX(hfre.execdtime)"Fecha Recibida el", MAX(hfi.execdtime)"Fecha Inicio",
       MAX(hfctr.execdtime)"Fecha Termino Construcción Real", MAX(hfar.execdtime)"Fecha Aceptación Real",
       MAX(hfeo.execdtime)"Fecha Entrega Operaciones", MAX(hfep.execdtime)"Fecha Puesta en Produccion", o.OTPAKGID"Id Paquete"
FROM   ot1sinac o,
		#tmp_estado_actual tea
left join harpkghistory hfre on o.OTPAKGID = hfre.packageobjid AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
left join harpkghistory hfi on o.OTPAKGID = hfi.packageobjid AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
left join harpkghistory hfctr on o.OTPAKGID = hfctr.packageobjid AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
left join harpkghistory hfar on o.OTPAKGID = hfar.packageobjid AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
left join harpkghistory hfeo on o.OTPAKGID = hfeo.packageobjid AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
left join harpkghistory hfep on o.OTPAKGID = hfep.packageobjid AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
WHERE  o.OTPAKGID = tea.cPKGID
       --AND o.OTPAKGID *= hfre.packageobjid
	     --AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
	     --AND o.OTPAKGID *= hfi.packageobjid
	     --AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
	     --AND o.OTPAKGID *= hfctr.packageobjid
	     --AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
	     --AND o.OTPAKGID *= hfar.packageobjid
	     --AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
	     --AND o.OTPAKGID *= hfeo.packageobjid
	     --AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
	     --AND o.OTPAKGID *= hfep.packageobjid
	     --AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
	     AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
	     AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
		   AND o.OTASJEFE IN (SELECT cNombreJefe FROM #tmp_filtro_jefe)
		   AND o.OTASINGP IS NULL
GROUP BY o.OTDENUME, o.OTPAKGID
ORDER BY o.OTDENUME DESC

-- Se almacenan todos los datos de las OTs.
INSERT #tmp_proy
SELECT tp1.OTPAKGID"Id Paquete", tp1.OTPKGNME"Nombre Paquete", tp1.OTDENUME"OT", tp1.OTDETIPO"Tipo Requerimiento", tp1.OTDEREQU "Descripción",
       tf.OTFRECEP"Recibida el", tp1.OTDEUSRC"Emisor", tp1.OTDEFREQ"Fecha Requerida", tp1.OTASJEFE"JPY", tp1.OTASINGP"IPY",
       tf.OTDEFINI"Fecha Inicio", tp1.OTFTERES"Fecha Termino Construcción Estimado", tf.OTFETERR"Fecha Termino Construcción Real",
       tp1.OTFEREPR"Fecha Reprogramación", tp1.OTFEACPE"Fecha Aceptación Estimado", tf.OTFEACEP"Fecha Aceptación Real",
       tf.OTFENTOP"Fecha Entrega Operaciones", tf.OTFEPROD"Fecha Entrega Producción", tp1.OTESTADO"Estado", tp1.OTDEFPRO"Familia"
FROM   #tmp_proy1 tp1, #tmp_fechas_proy tf
WHERE  tp1.OTDENUME = tf.OTDENUME
       AND tp1.OTPAKGID = tf.OTPAKGID
ORDER BY  tp1.OTPAKGID DESC

-- Procedemos a calcular los indicadores.
-- 1er Indicador
-- % de OTs que cumplen fecha comprosiso con el cliente.
-- Numerador: Número de OTs que la Fecha Real Puesta en Produccion es menor o igual que la Fecha Estimada Puesta en Produccion dentro del mes consultado.
SELECT @iNumerador = COUNT(*)
FROM   #tmp_proy
WHERE  OTFEPROD <= OTDEFREQ
       AND OTFEPROD BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Denominador: Número de OTs con Fecha Estimada Puesta en Produccion dentro del mes consultado.
SELECT @iDenominador = COUNT(*)
FROM   #tmp_proy
WHERE  OTDEFREQ BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Se calcula el rendimiento. En caso de que no existen proyectos requeridos para la fecha de la consulta, automaticamente se entrega 0.
IF @iDenominador > 0
	SELECT @fRendimiento = (CONVERT(FLOAT,@iNumerador)*100)/CONVERT(FLOAT,@iDenominador)
ELSE
	SELECT @fRendimiento = 0

--Entregamos los valores obtenidos por el indicador
SELECT @iNumerador"Total Proyectos Puestos en Produccion a la fecha Antes de la Fecha requerida", @iDenominador"Total proyectos que requerián estar en produccion a la fecha de consulta", @fRendimiento"% de OT que cumplen la fecha de compromiso con el cliente"

-- 2ndo Indicador
-- % de OT que cumplen la planificación detallada
-- Numerador: : Número de OTs que la Fecha de Término Construcción Real es menor o igual que la Fecha de Término Construcción Estimado dentro del mes consultado.
SELECT @iNumerador = COUNT(*)
FROM   #tmp_proy
WHERE  OTFETERR <= OTFTERES
       AND OTFTERES BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Denominador: Número de OTs con Fecha de Término Construcción Estimado dentro del mes consultado.
SELECT @iDenominador = COUNT(*)
FROM   #tmp_proy
WHERE  OTFTERES BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Se calcula el rendimiento. En caso de que no existen proyectos requeridos para la fecha de la consulta, automaticamente se entrega 0.
IF @iDenominador > 0
	SELECT @fRendimiento = (CONVERT(FLOAT,@iNumerador)*100)/CONVERT(FLOAT,@iDenominador)
ELSE
	SELECT @fRendimiento = 0

--Entregamos los valores obtenidos por el indicador
SELECT @iNumerador"Total de proyectos terminados de contruir antes de la fecha requerida", @iDenominador"Total proyectos que requerián estar construidos a la fecha de consulta.", @fRendimiento"% de OT que cumplen la fecha de compromiso con el cliente"

-- Se rellenan las tablas para calcular los ciclos de QA
INSERT #tmp_history
SELECT hh.packageobjid"Id Paquete", hh.action"Accion", hh.execdtime"Fecha", hh.statename"Estado"
FROM   harpkghistory AS hh
WHERE  (hh.action = 'Demote' or hh.action = 'Promote')
ORDER BY hh.packageobjid desc, hh.execdtime ASC

INSERT #tmp_nciclos
SELECT idpak"Id Paquete", COUNT(estado)"Ciclos QA"
FROM   #tmp_history
WHERE  estado = 'Aseguramiento de Calidad'
GROUP BY idpak
ORDER BY idpak DESC

-- 3er Indicador
-- % de OT aceptadas por QA (1 ciclo)
-- Numerador: : Número de OTs Aceptadas por QA en 1 ciclo de desarrollo.
SELECT @iNumerador = COUNT(tc.idpak)
FROM   #tmp_proy tp, #tmp_nciclos tc
WHERE  tp.OTPAKGID = tc.idpak
       AND tc.nciclos = 1
       AND tp.OTFEACPR BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Denominador: Número de OTs Aceptadas por QA dentro del mes consultado.
SELECT @iDenominador = COUNT(tc.idpak)
FROM   #tmp_proy tp, #tmp_nciclos tc
WHERE  tp.OTPAKGID = tc.idpak
       AND tp.OTFEACPR BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Se calcula el rendimiento. En caso de que no existen proyectos requeridos para la fecha de la consulta, automaticamente se entrega 0.
IF @iDenominador > 0
	SELECT @fRendimiento = (CONVERT(FLOAT,@iNumerador)*100)/CONVERT(FLOAT,@iDenominador)
ELSE
	SELECT @fRendimiento = 0

--Entregamos los valores obtenidos por el indicador
SELECT @iNumerador"Total de proyectos aceptados en 1 ciclo de QA del mes", @iDenominador"Total de proyectos aceptados por QA en el mes.", @fRendimiento"% de OT que cumplen aceptadas en 1 ciclo de QA"

-- 4to Indicador
-- % de OT aceptadas por QA (2 ciclo)
-- Numerador: : Número de OTs Aceptadas por QA en 2 ciclo de desarrollo.
SELECT @iNumerador = COUNT(tc.idpak)
FROM   #tmp_proy tp, #tmp_nciclos tc
WHERE  tp.OTPAKGID = tc.idpak
       AND tc.nciclos = 2
       AND tp.OTFEACPR BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Denominador: Número de OTs Aceptadas por QA dentro del mes consultado.
SELECT @iDenominador = COUNT(tc.idpak)
FROM   #tmp_proy tp, #tmp_nciclos tc
WHERE  tp.OTPAKGID = tc.idpak
       AND tp.OTFEACPR BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Se calcula el rendimiento. En caso de que no existen proyectos requeridos para la fecha de la consulta, automaticamente se entrega 0.
IF @iDenominador > 0
	SELECT @fRendimiento = (CONVERT(FLOAT,@iNumerador)*100)/CONVERT(FLOAT,@iDenominador)
ELSE
	SELECT @fRendimiento = 0

--Entregamos los valores obtenidos por el indicador
SELECT @iNumerador"Total de proyectos aceptados en 2 ciclos de QA del mes", @iDenominador"Total de proyectos aceptados por QA en el mes.", @fRendimiento"% de OT que cumplen aceptadas en 2 ciclo de QA"

-- 5to Indicador
-- % de OT aceptadas por QA (2 o + ciclo)
-- Numerador: : Número de OTs Aceptadas por QA en 2 ciclo de desarrollo.
SELECT @iNumerador = COUNT(tc.idpak)
FROM   #tmp_proy tp, #tmp_nciclos tc
WHERE  tp.OTPAKGID = tc.idpak
       AND tc.nciclos > 2
       AND tp.OTFEACPR BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Denominador: Número de OTs Aceptadas por QA dentro del mes consultado.
SELECT @iDenominador = COUNT(tc.idpak)
FROM   #tmp_proy tp, #tmp_nciclos tc
WHERE  tp.OTPAKGID = tc.idpak
       AND tp.OTFEACPR BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Se calcula el rendimiento. En caso de que no existen proyectos requeridos para la fecha de la consulta, automaticamente se entrega 0.
IF @iDenominador > 0
	SELECT @fRendimiento = (CONVERT(FLOAT,@iNumerador)*100)/CONVERT(FLOAT,@iDenominador)
ELSE
	SELECT @fRendimiento = 0

--Entregamos los valores obtenidos por el indicador
SELECT @iNumerador"Total de proyectos aceptados en 2 o + ciclos de QA del mes", @iDenominador"Total de proyectos aceptados por QA en el mes.", @fRendimiento"% de OT que cumplen aceptadas en 2 ciclo de QA"

-- Eliminamos las tablas que ya no van a ser ocupadas.
DROP TABLE #tmp_proy1
DROP TABLE #tmp_fecha_estado_actual
DROP TABLE #tmp_estado_actual
DROP TABLE #tmp_nombre_paquete
DROP TABLE #tmp_fechas_proy
DROP TABLE #tmp_filtro_tipo
DROP TABLE #tmp_filtro_jefe
DROP TABLE #tmp_filtro_ingeniero
DROP TABLE #tmp_proy
DROP TABLE #tmp_history
DROP TABLE #tmp_nciclos
GO
