SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_bsindicatorsIds_withaccess]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_bsindicatorsIds_withaccess] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_bsindicatorsIds_withaccess]
(
		@parameters varchar(8000) =  '', /*WHERE CONDITIONS WITHOUT WHERE CLAUSE*/
		@sort nvarchar(100), /*WITHOUT CLAUSE ORDER BY*/
		@BSPROCCAT int,
		@IKCAT int,
		@IKCDU int,
		@tmp_table nvarchar(500) = '#TMP_IND_WITH_ACCESS_IDS',
		@L_RETURN_DATA int = 1
	)

AS

SET DATEFORMAT YMD

DECLARE @strSQL varchar(4000), @where varchar(100)


SELECT @strSQL =
CASE	
	WHEN  @IKCAT=0 OR @BSPROCCAT=2  THEN
		'SELECT BS_INDICATORSID FROM VISTA_BS_INDICATORS WHERE 1=0' /*select nothing*/
	WHEN @IKCAT=4 OR @BSPROCCAT=0 THEN
		'SELECT BS_INDICATORSID FROM VISTA_BS_INDICATORS' /*select all*/
	ELSE /*Select only allowed */
		
		'SELECT BS_INDICATORSID FROM (
		SELECT * FROM VISTA_BS_INDICATORS
		WHERE BS_INDICATORSID IN (SELECT BS_INDICATORSID FROM VISTA_BS_INDICATORS_OPTIONS WHERE SEC_LEVEL>0 AND USERID='+ LTRIM(STR(@IKCDU)) +')
		OR BS_INDICATORSID IN (SELECT BS_INDICATORSID FROM VISTA_BS_INDICATORS_OPTIONS WHERE SEC_LEVEL>0 AND USERID IN (SELECT CODIGOGRUPO FROM WEBGROUPMEMBERS WHERE CODIGOUSUARIO='+ LTRIM(STR(@IKCDU)) +'))
		) AS SEC
		' 

END		

SET @where = ''
IF NOT (@IKCAT=0 OR @BSPROCCAT=2)
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
		SET @sort = ' ORDER BY [DESCRIPTION]'
	END
END


BEGIN TRY
	EXEC ('TRUNCATE TABLE ' + @tmp_table + '; ' + 'INSERT INTO '+ @tmp_table + ' ' +  @strSQL+@where+@parameters+@sort)
END TRY
BEGIN CATCH	
END CATCH



IF @L_RETURN_DATA = 1
BEGIN
	EXEC (@strSQL+@where+@parameters+@sort)
END



RETURN
GO
