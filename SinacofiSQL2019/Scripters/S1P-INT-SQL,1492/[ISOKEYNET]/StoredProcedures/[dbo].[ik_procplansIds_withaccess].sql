SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_procplansIds_withaccess]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_procplansIds_withaccess] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_procplansIds_withaccess]
(
		@parameters varchar(8000) =  '', /*WHERE CONDITIONS WITHOUT WHERE CLAUSE*/
		@sort nvarchar(100), /*WITHOUT CLAUSE ORDER BY*/
		@BSPROCCAT int,
		@IKCAT int,
		@IKCDU int,
		@tmp_table nvarchar(500) = '#TMP_PROCPLANS_WITH_ACCESS_IDS',
		@L_RETURN_DATA int = 1
	)

AS

SET DATEFORMAT YMD

DECLARE @strSQL varchar(4000), @where varchar(100)


SELECT @strSQL =
CASE	
	WHEN  @IKCAT=0 OR @BSPROCCAT=2  THEN
		'SELECT PROC_PLANSID FROM PROC_PLANS WHERE 1=0' /*select nothing*/
	WHEN @IKCAT=4 OR @BSPROCCAT=0 THEN
		'SELECT PROC_PLANSID FROM PROC_PLANS' /*select all*/
	ELSE /*Select only allowed docs*/
		
		'SELECT PROC_PLANSID FROM (
		SELECT * FROM PROC_PLANS		
		WHERE PROC_PLANSID IN (SELECT PROC_PLANSID FROM VISTA_PROCPLANS_OPTIONS WHERE SEC_LEVEL>0 AND USERID='+ LTRIM(STR(@IKCDU)) +')
		OR PROC_PLANSID IN (SELECT PROC_PLANSID FROM VISTA_PROCPLANS_OPTIONS WHERE SEC_LEVEL>0 AND USERID IN (SELECT CODIGOGRUPO FROM WEBGROUPMEMBERS WHERE CODIGOUSUARIO='+ LTRIM(STR(@IKCDU)) +'))
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
