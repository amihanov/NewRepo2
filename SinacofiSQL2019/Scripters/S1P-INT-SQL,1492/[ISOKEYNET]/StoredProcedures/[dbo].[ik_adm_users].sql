SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_adm_users]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_adm_users] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_adm_users]
(
	@parameters nvarchar(1000) =  '', /*WHERE CONDITIONS WITHOUT WHERE CLAUSE*/
	@sort nvarchar(50) /*WITHOUT CLAUSE ORDER BY*/
)
AS
BEGIN
	SET NOCOUNT ON;

DECLARE @strSQL varchar(4000)

SET @strSQL=

'SELECT USUARIOS.*,' + 

'			CASE' + 
'			WHEN L_WEBGROUP=1 THEN N''Group''' + 
'			ELSE N''User''' + 
'			END AS ITEM_TYPE ,' + 

'			CASE' + 
'			WHEN L_WEBGROUP=1 THEN dbo.CONCAT(N''IKBase.aspx?VIEW=ADMINGROUPPROPERTIESREPORT&MODE=EDIT&USRCODE='', LTRIM(STR(CODIGO)))' + 
'			ELSE dbo.CONCAT(N''IKBase.aspx?VIEW=ADMINUSERPROPERTIESREPORT&USRCODE='', LTRIM(STR(CODIGO)))' + 
'           END AS URLEDIT,' + 

'            CASE' + 
'            WHEN L_WEBGROUP=1 THEN ''N/A''' + 
'            WHEN CATEGORIA = 4 THEN ''Loc_Administrator''' + 
'            WHEN CATEGORIA = 3 THEN ''Loc_Power_User''' + 
'            WHEN CATEGORIA = 1 THEN ''Loc_User''' + 
'            WHEN CATEGORIA = 0 THEN ''Loc_AccessDenied''' + 
'            END AS LEVELDESCRIP,' + 

'            CASE' + 
'            WHEN L_WEBGROUP=1 THEN ''n/a''' + 
'            WHEN PERMISOSDOCUMENTOS = 0 THEN ''Loc_Administrator''' + 
'            WHEN PERMISOSDOCUMENTOS = 1 THEN ''Loc_User''' + 
'            WHEN PERMISOSDOCUMENTOS = 2 THEN ''Loc_AccessDenied''' + 
'            END AS DOCLEVELDESCRIP,' + 

'            CASE' + 
'            WHEN L_WEBGROUP=1 THEN ''n/a''' + 
'            WHEN PERMISOSBSPROC = 0 THEN ''Administrator''' + 
'            WHEN PERMISOSBSPROC = 1 THEN ''Loc_User''' + 
'            WHEN PERMISOSBSPROC = 2 THEN ''Loc_AccessDenied''' + 
'            END AS BSPROCLEVELDESCRIP,' + 

'            CASE' + 
'            WHEN NOT LOGINNAME IS NULL AND USUARIO != LOGINNAME THEN dbo.CONCAT4(USUARIO,'' ('', LOGINNAME, '')'')'+
'            ELSE USUARIO' + 
'            END AS FULLUSERNAME' + 

'            FROM USUARIOS' + 
'            LEFT OUTER JOIN dbo.ik_getFullUsersIds() F ON F.CODIGOUSUARIO=USUARIOS.CODIGO'

IF @parameters <> ''
	BEGIN
		SET @strSQL = @strSQL + ' WHERE ' + @parameters
	END

	IF @sort <> ''
	BEGIN
		SET @strSQL = @strSQL + ' ORDER BY ' + @sort
	END
	ELSE
	BEGIN
		SET @strSQL = @strSQL + ' ORDER BY USUARIO '
	END

EXEC (@strSQL)

END
GO
