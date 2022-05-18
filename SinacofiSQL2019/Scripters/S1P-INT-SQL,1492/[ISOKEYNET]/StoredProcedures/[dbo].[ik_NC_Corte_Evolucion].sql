SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_NC_Corte_Evolucion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_NC_Corte_Evolucion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- ik_NC_Corte_Evolucion 'Loc_Type', '*', '*','*','*','*','*','1,2','1,2','*'
ALTER PROCEDURE [dbo].[ik_NC_Corte_Evolucion]
(
		@corte nvarchar(400) = 'Loc_Type',
		@filtro_caracter nvarchar(400) = '*',
		@filtro_area nvarchar(400)= '*',
		@filtro_proceso nvarchar(400)= '*',
		@filtro_causa1 nvarchar(400)= '*',
		@filtro_causa2 nvarchar(400)= '*',
		@filtro_causa3 nvarchar(400)= '*',
		@filtro_col_matriz nvarchar(400)= '*',
		@filtro_fila_matriz nvarchar(400)= '*',
		@filtro_contenido_matriz nvarchar(400)= '*'
	)

AS
SET NOCOUNT ON 
	


if @corte is null or len(@corte)=0
set @corte='Loc_Type'

DECLARE @ASTERISCO NVARCHAR(400)
SET @ASTERISCO = '*                                                                                                                                      '

DECLARE @CARACTER NVARCHAR(400)
if @filtro_caracter is null or len(@filtro_caracter)=0
set @filtro_caracter=@ASTERISCO

DECLARE @AREA NVARCHAR(400)
if @filtro_area is null or len(@filtro_area)=0
set @filtro_area=@ASTERISCO

DECLARE @PROCESO NVARCHAR(400)
if @filtro_proceso is null or len(@filtro_proceso)=0
set @filtro_proceso=@ASTERISCO

DECLARE @CAUSA1 NVARCHAR(400)
if @filtro_causa1 is null or len(@filtro_causa1)=0
set @filtro_causa1=@ASTERISCO

DECLARE @CAUSA2 NVARCHAR(400)
if @filtro_causa2 is null or len(@filtro_causa2)=0
set @filtro_causa2=@ASTERISCO

DECLARE @CAUSA3 NVARCHAR(400)
if @filtro_causa3 is null or len(@filtro_causa3)=0
set @filtro_causa3=@ASTERISCO


DECLARE @AREAPERDIDA NVARCHAR(400)
if @filtro_col_matriz is null or len(@filtro_col_matriz)=0
set @filtro_col_matriz=@ASTERISCO

DECLARE @CLASIFICACION NVARCHAR(400)
if @filtro_fila_matriz is null or len(@filtro_fila_matriz)=0
set @filtro_fila_matriz=@ASTERISCO
	
DECLARE @MATRIZ NVARCHAR(400)
if @filtro_contenido_matriz is null or len(@filtro_contenido_matriz)=0
set @filtro_contenido_matriz=@ASTERISCO



			
			CREATE TABLE #TablaT (
				CODIGO int,	
				DESCRIPCION nvarchar(4000),
				DESC_NIVEL1 nvarchar(4000),
				DESC_NIVEL2 nvarchar(4000)
			)

			DECLARE @CODIGO int
			DECLARE @PADRE INT
			DECLARE @DESCRIPCION NVARCHAR(4000)
			DECLARE @CODIGOH int
			DECLARE @NOMBRE NVARCHAR(400)
			DECLARE @NIVEL INT
	
		
			INSERT INTO #TablaT(CODIGO, DESCRIPCION, DESC_NIVEL1, DESC_NIVEL2) 
			SELECT  CODIGO, DESCRIPCION ,'No asignada', 'No asignada' FROM tbl_no_conformidades_causas WHERE NIVEL=3
			UNION
			SELECT CODIGO, 'No asignada','No asignada', DESCRIPCION FROM tbl_no_conformidades_causas WHERE NIVEL=2
			UNION
			SELECT CODIGO, 'No asignada' ,DESCRIPCION, 'No asignada' FROM tbl_no_conformidades_causas WHERE NIVEL=1
		
			DECLARE CurNodos CURSOR LOCAL FAST_FORWARD for 
			SELECT CODIGO
			FROM tbl_no_conformidades_causas
			WHERE NIVEL = 3
			open CurNodos
			fetch next from CurNodos into @CODIGO
			while @@FETCH_STATUS = 0
			begin				
				SELECT @DESCRIPCION = DESCRIPCION
				FROM tbl_no_conformidades_causas
				WHERE CODIGO = (SELECT CODIGO_PADRE FROM tbl_no_conformidades_causas WHERE CODIGO = @CODIGO)
				UPDATE #TablaT
				SET DESC_NIVEL2 = @DESCRIPCION
				WHERE CODIGO = @CODIGO
				fetch next from CurNodos into @CODIGO
			end
			close CurNodos
			deallocate CurNodos
		
		
			DECLARE CurNodos CURSOR LOCAL FAST_FORWARD for 
			SELECT CODIGO
			FROM tbl_no_conformidades_causas
			WHERE NIVEL = 2
			open CurNodos
			fetch next from CurNodos into @CODIGO
			while @@FETCH_STATUS = 0
			begin
				SELECT @DESCRIPCION = DESCRIPCION
				FROM tbl_no_conformidades_causas
				WHERE CODIGO = (SELECT CODIGO_PADRE FROM tbl_no_conformidades_causas WHERE CODIGO = @CODIGO)
				UPDATE #TablaT
				SET DESC_NIVEL1 = @DESCRIPCION
				WHERE CODIGO = @CODIGO
				fetch next from CurNodos into @CODIGO
			end
			close CurNodos
			deallocate CurNodos
			DECLARE CurNodos CURSOR LOCAL FAST_FORWARD for 
			SELECT CODIGO 
			FROM tbl_no_conformidades_causas
			WHERE NIVEL = 3
			Open CurNodos
			fetch next from CurNodos into @CODIGO
			while @@FETCH_STATUS = 0
			begin
				SELECT @DESCRIPCION = DESC_NIVEL1
				FROM #TablaT
				WHERE CODIGO = (SELECT CODIGO_PADRE FROM tbl_no_conformidades_causas WHERE CODIGO = @CODIGO)
				UPDATE #TablaT
				SET DESC_NIVEL1 = @DESCRIPCION
				WHERE CODIGO = @CODIGO
				fetch next from CurNodos into @CODIGO
			end


DECLARE @str nvarchar(4000)

SELECT @str = ' '
IF  (@corte = 'Loc_Type') OR (@corte = 'Loc_Category')
		SET @str = @str + ' SELECT  V_DESCRIPCION AS CAUSA1, V_DESCRIPCION AS CAUSA2, V_DESCRIPCION AS CAUSA3, V_DESCRIPCION AS AREA,
							V_DESCRIPCION AS PROCESO, V_DESCRIPCION AS MATRIZ_C, V_DESCRIPCION AS MATRIZ_F, 
							V_DESCRIPCION AS MATRIZ,
							V_CODIGO, V_ESTADO, V_DESCRIPCION, V_CATEGORIADESC, CODIGONC, 
							CARACTER, FECHADETECCION, TIPONC,SIN_VIENE_DE_AUDIT,SIN_ORIGEN_NC,SIN_TIPO_NC
							FROM VAR_NOCONFORMIDADES_VIEW '

IF  (@corte = 'Usr_CausaPrimerNivel')  
		
		SET @str = @str + 'SELECT distinct #TablaT.DESC_NIVEL1 AS CAUSA1, V_DESCRIPCION AS CAUSA2,
							V_DESCRIPCION AS CAUSA3, V_DESCRIPCION AS AREA,
							V_DESCRIPCION AS PROCESO, V_DESCRIPCION AS MATRIZ_C, V_DESCRIPCION AS MATRIZ_F, 
							V_DESCRIPCION AS MATRIZ,
							V_CODIGO, V_ESTADO, V_DESCRIPCION, V_CATEGORIADESC, VAR_NOCONFORMIDADES_VIEW.CODIGONC, 
							CARACTER, FECHADETECCION, TIPONC,SIN_VIENE_DE_AUDIT,SIN_ORIGEN_NC,SIN_TIPO_NC
			FROM VAR_NOCONFORMIDADES_VIEW
			LEFT OUTER JOIN VARCHILD_CAUSAS_NOCONFORMIDADES 
			ON VAR_NOCONFORMIDADES_VIEW.CODIGONC = VARCHILD_CAUSAS_NOCONFORMIDADES.CODIGONC
			LEFT OUTER JOIN #TablaT ON VARCHILD_CAUSAS_NOCONFORMIDADES.CODIGO_CAUSA = #TablaT.CODIGO  ' 

IF  (@corte = 'Usr_CausaSegundoNivel') 

		SET @str = @str + ' SELECT distinct V_DESCRIPCION AS CAUSA1, #TablaT.DESC_NIVEL2 AS CAUSA2,
							V_DESCRIPCION AS CAUSA3, V_DESCRIPCION AS AREA,
							V_DESCRIPCION AS PROCESO, V_DESCRIPCION AS MATRIZ_C, V_DESCRIPCION AS MATRIZ_F,
							V_DESCRIPCION AS MATRIZ, 
							V_CODIGO, V_ESTADO, V_DESCRIPCION, V_CATEGORIADESC, VAR_NOCONFORMIDADES_VIEW.CODIGONC, 
							CARACTER, FECHADETECCION, TIPONC,SIN_VIENE_DE_AUDIT,SIN_ORIGEN_NC,SIN_TIPO_NC
			FROM VAR_NOCONFORMIDADES_VIEW
			LEFT OUTER JOIN VARCHILD_CAUSAS_NOCONFORMIDADES 
			ON VAR_NOCONFORMIDADES_VIEW.CODIGONC = VARCHILD_CAUSAS_NOCONFORMIDADES.CODIGONC
			LEFT OUTER JOIN #TablaT ON VARCHILD_CAUSAS_NOCONFORMIDADES.CODIGO_CAUSA = #TablaT.CODIGO  ' 


IF (@corte = 'Usr_CausaTercerNivel')

	SET @str = @str + ' SELECT distinct V_DESCRIPCION AS CAUSA1, V_DESCRIPCION AS CAUSA2,
							 #TablaT.DESCRIPCION AS CAUSA3, V_DESCRIPCION AS AREA,
							V_DESCRIPCION AS PROCESO, V_DESCRIPCION AS MATRIZ_C, V_DESCRIPCION AS MATRIZ_F, 
							V_DESCRIPCION AS MATRIZ,
							V_CODIGO, V_ESTADO, V_DESCRIPCION, V_CATEGORIADESC, VAR_NOCONFORMIDADES_VIEW.CODIGONC, 
							CARACTER, FECHADETECCION, TIPONC,SIN_VIENE_DE_AUDIT,SIN_ORIGEN_NC,SIN_TIPO_NC
			FROM VAR_NOCONFORMIDADES_VIEW
			LEFT OUTER JOIN VARCHILD_CAUSAS_NOCONFORMIDADES 
			ON VAR_NOCONFORMIDADES_VIEW.CODIGONC = VARCHILD_CAUSAS_NOCONFORMIDADES.CODIGONC
			LEFT OUTER JOIN #TablaT ON VARCHILD_CAUSAS_NOCONFORMIDADES.CODIGO_CAUSA = #TablaT.CODIGO  ' 


IF (@corte = 'Usr_AreaResponsable') 
	
		SET @str = @str + ' SELECT  V_DESCRIPCION AS CAUSA1, V_DESCRIPCION AS CAUSA2,
							V_DESCRIPCION AS CAUSA3, TBL_AREA_CAUSAS.DESCRIPCION AS AREA,
							V_DESCRIPCION AS PROCESO, V_DESCRIPCION AS MATRIZ_C, V_DESCRIPCION AS MATRIZ_F, 
							V_DESCRIPCION AS MATRIZ,
							V_CODIGO, V_ESTADO, V_DESCRIPCION, V_CATEGORIADESC, VAR_NOCONFORMIDADES_VIEW.CODIGONC, 
							CARACTER, FECHADETECCION, TIPONC,SIN_VIENE_DE_AUDIT,SIN_ORIGEN_NC,SIN_TIPO_NC
		FROM VAR_NOCONFORMIDADES_VIEW LEFT OUTER JOIN VARCHILD_AREAS_CAUSAS_NOCONFORMIDADES
		ON VAR_NOCONFORMIDADES_VIEW.CODIGONC = VARCHILD_AREAS_CAUSAS_NOCONFORMIDADES.CODIGONC
		LEFT OUTER JOIN TBL_AREA_CAUSAS ON  VARCHILD_AREAS_CAUSAS_NOCONFORMIDADES.CODIGOAREA = TBL_AREA_CAUSAS.CODIGO '

IF (@corte = 'Usr_Proceso') 
	
		SET @str = @str + '  SELECT V_DESCRIPCION AS CAUSA1, V_DESCRIPCION AS CAUSA2,
							V_DESCRIPCION AS CAUSA3, V_DESCRIPCION AS AREA,
							PROC_NODES.DESCRIPTION AS PROCESO, V_DESCRIPCION AS MATRIZ_C, V_DESCRIPCION AS MATRIZ_F, 
							V_DESCRIPCION AS MATRIZ,
							V_CODIGO, V_ESTADO, V_DESCRIPCION, V_CATEGORIADESC, VAR_NOCONFORMIDADES_VIEW.CODIGONC, 
							CARACTER, FECHADETECCION, TIPONC,SIN_VIENE_DE_AUDIT,SIN_ORIGEN_NC,SIN_TIPO_NC
			FROM VAR_NOCONFORMIDADES_VIEW LEFT OUTER JOIN VARCHILD_PROCESOSAFECTADOS_NOCONFORMIDADES 
			ON VAR_NOCONFORMIDADES_VIEW.CODIGONC = VARCHILD_PROCESOSAFECTADOS_NOCONFORMIDADES.CODIGONC
			LEFT OUTER JOIN PROC_NODES 
			ON  VARCHILD_PROCESOSAFECTADOS_NOCONFORMIDADES.CODIGO_PROCESO = PROC_NODES.PROC_NODESID '
		



IF (@corte = 'Usr_PerdidaConsecuencias') 
BEGIN
		CREATE TABLE #TablaC (
			CODIGO int,	
			DESCRIPCION nvarchar(4000),
		)

		INSERT INTO #TablaC(CODIGO, DESCRIPCION) 
		select DISTINCT varchild_registromatriz_noconformidades.codigoNC, tbl_consecuencias_columnas.DESCRIPCION
		from tbl_consecuencias_columnas
		left outer join tbl_tablasconsecuencias
		on tbl_consecuencias_columnas.codigo = tbl_tablasconsecuencias.codigo_cuadro_columna
		left outer join varchild_registromatriz_noconformidades
		on tbl_tablasconsecuencias.codigo = varchild_registromatriz_noconformidades.codigo_registro_matriz

		SET @str = @str + '  SELECT  V_DESCRIPCION AS CAUSA1, V_DESCRIPCION AS CAUSA2,
							V_DESCRIPCION AS CAUSA3, V_DESCRIPCION AS AREA,
							V_DESCRIPCION AS PROCESO, #TablaC.DESCRIPCION AS MATRIZ_C, V_DESCRIPCION  AS MATRIZ_F, 
							V_DESCRIPCION AS MATRIZ,
							V_CODIGO, V_ESTADO, V_DESCRIPCION, V_CATEGORIADESC, VAR_NOCONFORMIDADES_VIEW.CODIGONC, 
							CARACTER, FECHADETECCION, TIPONC,SIN_VIENE_DE_AUDIT,SIN_ORIGEN_NC,SIN_TIPO_NC
		 FROM VAR_NOCONFORMIDADES_VIEW LEFT OUTER JOIN #TablaC
		ON VAR_NOCONFORMIDADES_VIEW.CODIGONC = #TablaC.CODIGO'

END
IF (@corte = 'Usr_ClasificacionConsecuencias') 
BEGIN
		CREATE TABLE #TablaA (
			CODIGO int,	
			DESCRIPCION nvarchar(4000),
		)

		INSERT INTO #TablaA(CODIGO, DESCRIPCION) 
		select DISTINCT varchild_registromatriz_noconformidades.codigoNC, tbl_consecuencias_filas.DESCRIPCION
		from tbl_consecuencias_filas
		left outer join tbl_tablasconsecuencias
		on tbl_consecuencias_filas.codigo = tbl_tablasconsecuencias.codigo_cuadro_fila
		left outer join varchild_registromatriz_noconformidades
		on tbl_tablasconsecuencias.codigo = varchild_registromatriz_noconformidades.codigo_registro_matriz

		SET @str = @str + ' SELECT 	V_DESCRIPCION AS CAUSA1, V_DESCRIPCION AS CAUSA2,
							V_DESCRIPCION AS CAUSA3, V_DESCRIPCION AS AREA,
							V_DESCRIPCION AS PROCESO,  V_DESCRIPCION AS MATRIZ_C, #TablaA.DESCRIPCION AS MATRIZ_F, 
							V_DESCRIPCION AS MATRIZ,
							V_CODIGO, V_ESTADO, V_DESCRIPCION, V_CATEGORIADESC, VAR_NOCONFORMIDADES_VIEW.CODIGONC, 
							CARACTER, FECHADETECCION, TIPONC,SIN_VIENE_DE_AUDIT,SIN_ORIGEN_NC,SIN_TIPO_NC
		FROM VAR_NOCONFORMIDADES_VIEW LEFT OUTER JOIN #TablaA
		ON VAR_NOCONFORMIDADES_VIEW.CODIGONC = #TablaA.CODIGO '

END
IF (@corte = 'Usr_Matriz') 
BEGIN
	SET @str = @str + ' SELECT 	V_DESCRIPCION AS CAUSA1, V_DESCRIPCION AS CAUSA2,
							V_DESCRIPCION AS CAUSA3, V_DESCRIPCION AS AREA,
							V_DESCRIPCION AS PROCESO, V_DESCRIPCION AS MATRIZ_C,  V_DESCRIPCION AS MATRIZ_F, 
							tbl_tablasconsecuencias.DESCRIPCION AS MATRIZ,
							V_CODIGO, V_ESTADO, V_DESCRIPCION, V_CATEGORIADESC, VAR_NOCONFORMIDADES_VIEW.CODIGONC, 
							CARACTER, FECHADETECCION, TIPONC,SIN_VIENE_DE_AUDIT,SIN_ORIGEN_NC,SIN_TIPO_NC
	FROM VAR_NOCONFORMIDADES_VIEW
	LEFT OUTER JOIN VARCHILD_REGISTROMATRIZ_NOCONFORMIDADES
	ON VAR_NOCONFORMIDADES_VIEW.CODIGONC = VARCHILD_REGISTROMATRIZ_NOCONFORMIDADES.CODIGONC
	LEFT OUTER JOIN tbl_tablasconsecuencias
	ON VARCHILD_REGISTROMATRIZ_NOCONFORMIDADES.CODIGO_REGISTRO_MATRIZ = tbl_tablasconsecuencias.CODIGO '

END


--- ************ FILTROS ************ ---	

SET @str = @str + ' WHERE 1=1 '

IF (@filtro_col_matriz <> '*')
BEGIN
		CREATE TABLE #TablaM (
			CODIGO_COL int,
			CODIGO int,	
			DESCRIPCION nvarchar(4000),
		)

		INSERT INTO #TablaM(CODIGO_COL, CODIGO, DESCRIPCION) 
		select DISTINCT tbl_consecuencias_columnas.CODIGO, varchild_registromatriz_noconformidades.codigoNC, tbl_consecuencias_columnas.DESCRIPCION
		from tbl_consecuencias_columnas
		left outer join tbl_tablasconsecuencias
		on tbl_consecuencias_columnas.codigo = tbl_tablasconsecuencias.codigo_cuadro_columna
		left outer join varchild_registromatriz_noconformidades
		on tbl_tablasconsecuencias.codigo = varchild_registromatriz_noconformidades.codigo_registro_matriz
		

		SET @str = @str + 'AND VAR_NOCONFORMIDADES_VIEW.CODIGONC IN  
				(	SELECT #TablaM.CODIGO 	
					FROM  #TablaM
					WHERE #TablaM.CODIGO_COL IN ( '+ @filtro_col_matriz +')
				) '

END

IF (@filtro_fila_matriz <> '*')
BEGIN
		CREATE TABLE #TablaFM (
			CODIGO_FILA int,
			CODIGO int,	
			DESCRIPCION nvarchar(4000),
		)

		INSERT INTO #TablaFM(CODIGO_FILA, CODIGO, DESCRIPCION) 
		select DISTINCT tbl_consecuencias_filas.CODIGO, varchild_registromatriz_noconformidades.codigoNC, tbl_consecuencias_filas.DESCRIPCION
		from tbl_consecuencias_filas
		left outer join tbl_tablasconsecuencias
		on tbl_consecuencias_filas.codigo = tbl_tablasconsecuencias.codigo_cuadro_fila
		left outer join varchild_registromatriz_noconformidades
		on tbl_tablasconsecuencias.codigo = varchild_registromatriz_noconformidades.codigo_registro_matriz
		
		SET @str = @str + 'AND VAR_NOCONFORMIDADES_VIEW.CODIGONC IN 
				 (  
					SELECT #TablaFM.CODIGO 
					FROM #TablaFM
					WHERE #TablaFM.CODIGO_FILA IN ('+ @filtro_fila_matriz + ')
				 ) '

END

IF (@filtro_caracter <> '*')
	SET @str = @str + ' AND VAR_NOCONFORMIDADES_VIEW.CARACTER = ' + @filtro_caracter


IF (@filtro_area <> '*')
	SET @str = @str + ' AND VAR_NOCONFORMIDADES_VIEW.CODIGONC IN 
								( SELECT VARCHILD_AREAS_CAUSAS_NOCONFORMIDADES.CODIGONC
							      FROM VARCHILD_AREAS_CAUSAS_NOCONFORMIDADES
						          LEFT OUTER JOIN TBL_AREA_CAUSAS 
                                  ON  VARCHILD_AREAS_CAUSAS_NOCONFORMIDADES.CODIGOAREA = TBL_AREA_CAUSAS.CODIGO  
								  WHERE TBL_AREA_CAUSAS.CODIGO IN (' + @filtro_area	+ ')
		
						) '


IF (@filtro_proceso <> '*')
	SET @str = @str + ' AND VAR_NOCONFORMIDADES_VIEW.CODIGONC IN 
						(	SELECT VARCHILD_PROCESOSAFECTADOS_NOCONFORMIDADES.CODIGONC
							FROM VARCHILD_PROCESOSAFECTADOS_NOCONFORMIDADES 
							LEFT OUTER JOIN PROC_NODES 
							ON  VARCHILD_PROCESOSAFECTADOS_NOCONFORMIDADES.CODIGO_PROCESO = PROC_NODES.PROC_NODESID
							WHERE PROC_NODES.PROC_NODESID IN (' + @filtro_proceso + ')
						 ) '

IF (@filtro_contenido_matriz <> '*')
		SET @str = @str + ' AND VAR_NOCONFORMIDADES_VIEW.CODIGONC IN
						(
							SELECT CODIGONC
							FROM VARCHILD_REGISTROMATRIZ_NOCONFORMIDADES
							LEFT OUTER JOIN tbl_tablasconsecuencias
							ON 	VARCHILD_REGISTROMATRIZ_NOCONFORMIDADES.CODIGO_REGISTRO_MATRIZ = tbl_tablasconsecuencias.CODIGO
							WHERE tbl_tablasconsecuencias.CODIGO IN (' + @filtro_contenido_matriz + ')
						)'

IF (@filtro_causa3 <> '*')
	
	SET @str = @str + ' AND VAR_NOCONFORMIDADES_VIEW.CODIGONC IN
						(
							SELECT CODIGONC
							FROM VARCHILD_CAUSAS_NOCONFORMIDADES
							LEFT OUTER JOIN TBL_NO_CONFORMIDADES_CAUSAS
							ON VARCHILD_CAUSAS_NOCONFORMIDADES.CODIGO_CAUSA = TBL_NO_CONFORMIDADES_CAUSAS.CODIGO
							WHERE TBL_NO_CONFORMIDADES_CAUSAS.NIVEL = 3 
							AND TBL_NO_CONFORMIDADES_CAUSAS.CODIGO IN ( '+ @filtro_causa3 + ') 
						)'

IF (@filtro_causa2 <> '*')
	SET @str = @str + ' 	AND VAR_NOCONFORMIDADES_VIEW.CODIGONC 
							IN (SELECT CODIGONC
								FROM VARCHILD_CAUSAS_NOCONFORMIDADES
								WHERE CODIGO_CAUSA IN ( SELECT CODIGO FROM TBL_NO_CONFORMIDADES_CAUSAS
														WHERE CODIGO_PADRE IN ( '+ @filtro_causa2 +')				
														UNION 
														SELECT CODIGO 
														FROM TBL_NO_CONFORMIDADES_CAUSAS 
														WHERE DESCRIPCION IN ( SELECT DESCRIPCION 
													   							FROM 
																				TBL_NO_CONFORMIDADES_CAUSAS 
																				WHERE CODIGO IN (' + @filtro_causa2 + ')
																				AND (NIVEL = 2 OR NIVEL = 3)
														  					 )
											
													)
							)'


IF (@filtro_causa1 <> '*')
BEGIN  


	CREATE TABLE #TablaCausa(
				CODIGO int,	
				DESCRIPCION nvarchar(4000)
	)
			
	DECLARE @CODIGOC INT
	DECLARE @DESCC NVARCHAR(4000)
	
	INSERT INTO #TablaCausa(CODIGO, DESCRIPCION)
	SELECT CODIGO, DESCRIPCION FROM TBL_NO_CONFORMIDADES_CAUSAS WHERE CODIGO in (2) 

	DECLARE CurNodos1 CURSOR LOCAL FAST_FORWARD for 
	-- Estos son los de nivel 2
	SELECT CODIGO FROM TBL_NO_CONFORMIDADES_CAUSAS
	WHERE CODIGO_PADRE in (2) 
	open CurNodos1
	fetch next from CurNodos1 into @CODIGO
		while @@FETCH_STATUS = 0
			begin				
				INSERT INTO #TablaCausa(CODIGO, DESCRIPCION)
				SELECT CODIGO, DESCRIPCION 
				FROM tbl_no_conformidades_causas
				WHERE CODIGO = @CODIGO


				DECLARE CurNodos2 CURSOR LOCAL FAST_FORWARD for 
				-- Estos son los de nivel 3
				SELECT CODIGO FROM TBL_NO_CONFORMIDADES_CAUSAS
				WHERE CODIGO_PADRE = @CODIGO
				open CurNodos2
				fetch next from CurNodos2 into @CODIGO
				while @@FETCH_STATUS = 0
				begin	
					INSERT INTO #TablaCausa(CODIGO, DESCRIPCION)
					SELECT CODIGO, DESCRIPCION 			
					FROM tbl_no_conformidades_causas
					WHERE CODIGO = @CODIGO	
			
						fetch next from CurNodos2 into @CODIGO
				end
				close CurNodos2
				deallocate CurNodos2

				fetch next from CurNodos1 into @CODIGO
			end
	close CurNodos1
	deallocate CurNodos1

SET @str = @str + ' AND VAR_NOCONFORMIDADES_VIEW.CODIGONC IN 
						(	SELECT VARCHILD_CAUSAS_NOCONFORMIDADES.CODIGONC
							FROM VARCHILD_CAUSAS_NOCONFORMIDADES
							LEFT OUTER JOIN #TablaCausa 
							ON VARCHILD_CAUSAS_NOCONFORMIDADES.CODIGO_CAUSA = #TablaCausa.CODIGO  
						)'
	
END		

EXEC (@str)

RETURN
GO
