SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_documents_withaccess]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_documents_withaccess] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_documents_withaccess]
(
		@parameters varchar(8000) =  '', /*WHERE CONDITIONS WITHOUT WHERE CLAUSE*/
		@sort nvarchar(100), /*WITHOUT CLAUSE ORDER BY*/
		@IKPDO int,
		@IKCAT int,
		@IKCDU int
	)

AS

SET DATEFORMAT YMD

DECLARE @strDOC varchar(4000), @where varchar(100)


SELECT @strDOC =
CASE	
	-- @IKCAT=0 es acceso denegado gral
	-- @IKPDO=2 es acceso denegado a documentos
	WHEN  @IKCAT=0 OR @IKPDO=2  THEN
		'SELECT *, '' as USUARIORESPONSABLE_DESC   FROM DOCUMENTOS WHERE CODIGO = 0' /*select nothing*/
	-- @IKCAT=4 es admin gral
	-- @IKPDO=0 es admin de docs
	WHEN @IKCAT=4 OR @IKPDO=0 THEN
		'SELECT DOCUMENTOS.* ,
		CASE
			WHEN (DOCUMENTOS.ESTADO=1) THEN ''Images/Doc_Development.gif''
			WHEN (DOCUMENTOS.ESTADO=2) THEN ''Images/Doc_Current.gif''
			ELSE ''Images/Doc_Obsolete.gif''
		END AS ICONOESTADO,
		''DOCCODE=''+LTRIM(STR(DOCUMENTOS.CODIGO))+''&STATUS=''+LTRIM(STR(DOCUMENTOS.ESTADO)) AS URL_DATA,
		TIPOSDOCUMENTOS.DESCRIPCION AS TIPO_DESCRIPCION,
		 DOCUMENTOS.CODIGOISO + '' Rev.'' + DOCUMENTOS.C_REVISION AS CODIGOREV,
		 DOCUMENTOS.CODIGOISO + '' Rev.'' + DOCUMENTOS.C_REVISION  + '' - '' + DOCUMENTOS.NOMBRE  AS NOMBRECOMPLETO, 
		 ESTADOSPROCESOS.DESCRIPCIONESTADO AS ESTADOPROCESO,
		 USUARIOS.USUARIO AS USUARIORESPONSABLE_DESC				
		 
		 FROM DOCUMENTOS 
			JOIN TIPOSDOCUMENTOS ON DOCUMENTOS.CODIGOTIPO = TIPOSDOCUMENTOS.CODIGO 
			JOIN ESTADOSPROCESOS ON ESTADOSPROCESOS.CODIGOESTADO = DOCUMENTOS.PROCESO
			LEFT JOIN USUARIOS ON USUARIOS.CODIGO=DOCUMENTOS.USUARIORESPONSABLE
			' /*select all*/
		
	ELSE /*Select only allowed docs*/
		'DECLARE @TBLDOC TABLE(CODIGODOCUMENTO INT) '+
		'INSERT INTO @TBLDOC ' +
' 
SELECT DISTINCT PERMISOSDOC.CODIGODOCUMENTO 
FROM PERMISOSDOC 
JOIN DOCUMENTOS ON DOCUMENTOS.CODIGO = PERMISOSDOC.CODIGODOCUMENTO 
WHERE (DOCUMENTOS.ESTADO=2 AND PERMISOSDOC.NIVELACCESO > 300000 AND (PERMISOSDOC.CODIGOUSUARIO =' + LTRIM(STR(@IKCDU)) + ' OR PERMISOSDOC.CODIGOUSUARIO IN (SELECT CODIGOGRUPO FROM WEBGROUPMEMBERS WHERE CODIGOUSUARIO= ' + LTRIM(STR(@IKCDU)) + ' )))
AND CODIGODOCUMENTO NOT IN 
				( SELECT CODIGODOCUMENTO FROM PERMISOSDOC JOIN DOCUMENTOS ON DOCUMENTOS.CODIGO = PERMISOSDOC.CODIGODOCUMENTO WHERE (CODIGOUSUARIO=' + LTRIM(STR(@IKCDU)) + ' AND NIVELACCESO=300000) )
UNION
SELECT DISTINCT PERMISOSDOC.CODIGODOCUMENTO 
FROM PERMISOSDOC 
JOIN DOCUMENTOS ON DOCUMENTOS.CODIGO = PERMISOSDOC.CODIGODOCUMENTO 
WHERE (DOCUMENTOS.ESTADO=1 AND PERMISOSDOC.NIVELACCESO > 300002 AND (PERMISOSDOC.CODIGOUSUARIO =' + LTRIM(STR(@IKCDU)) + ' OR PERMISOSDOC.CODIGOUSUARIO IN (SELECT CODIGOGRUPO FROM WEBGROUPMEMBERS WHERE CODIGOUSUARIO= ' + LTRIM(STR(@IKCDU)) + ' )) )
AND CODIGODOCUMENTO NOT IN 
				( SELECT CODIGODOCUMENTO FROM PERMISOSDOC JOIN DOCUMENTOS ON DOCUMENTOS.CODIGO = PERMISOSDOC.CODIGODOCUMENTO WHERE (CODIGOUSUARIO=' + LTRIM(STR(@IKCDU)) + ' AND NIVELACCESO=300000) )
' + 

		 ' SELECT DOCUMENTOS.* ,
		 CASE
			WHEN (DOCUMENTOS.ESTADO=1) THEN ''Images/Doc_Development.gif''
			WHEN (DOCUMENTOS.ESTADO=2) THEN ''Images/Doc_Current.gif''
			ELSE ''Images/Doc_Obsolete.gif''
		END AS ICONOESTADO,
		''DOCCODE=''+LTRIM(STR(CODIGODOCUMENTO))+''&STATUS=''+LTRIM(STR(ESTADO)) AS URL_DATA,
		TIPOSDOCUMENTOS.DESCRIPCION AS TIPO_DESCRIPCION,
  	        DOCUMENTOS.CODIGOISO + '' Rev.'' + DOCUMENTOS.C_REVISION AS CODIGOREV,
		 DOCUMENTOS.CODIGOISO + '' Rev.'' + DOCUMENTOS.C_REVISION  + '' - '' + DOCUMENTOS.NOMBRE  AS NOMBRECOMPLETO, 
		 ESTADOSPROCESOS.DESCRIPCIONESTADO AS ESTADOPROCESO,
		 USUARIOS.USUARIO AS USUARIORESPONSABLE_DESC		
		 
 		  FROM  
			@TBLDOC D 
			JOIN DOCUMENTOS ON D.CODIGODOCUMENTO = DOCUMENTOS.CODIGO 
			JOIN TIPOSDOCUMENTOS ON DOCUMENTOS.CODIGOTIPO = TIPOSDOCUMENTOS.CODIGO 
			JOIN ESTADOSPROCESOS ON ESTADOSPROCESOS.CODIGOESTADO = DOCUMENTOS.PROCESO
			LEFT JOIN USUARIOS ON USUARIOS.CODIGO=DOCUMENTOS.USUARIORESPONSABLE
			'	
							
		
END		

	-- @IKCAT=0 es acceso denegado gral
	-- @IKPDO=2 es acceso denegado a documentos

	-- @IKCAT=4 es admin gral
	-- @IKPDO=0 es admin de docs

SET @where = ''
IF NOT (@IKCAT=0 OR @IKPDO=2)
BEGIN
	IF @parameters <> ''
	BEGIN
		SET @where = ' WHERE '
	END

	IF @sort <> ''
	BEGIN
		SET @sort = ' ORDER BY ' + @sort
	END
	ELSE
	BEGIN
		SET @sort = ' ORDER BY DOCUMENTOS.CODIGO'
	END
END
ELSE
BEGIN
	SET @parameters = ''
	SET @sort = ''
END

--PRINT @strDOC+@where+@parameters+@sort

EXEC (@strDOC+@where+@parameters+@sort )



RETURN
GO
