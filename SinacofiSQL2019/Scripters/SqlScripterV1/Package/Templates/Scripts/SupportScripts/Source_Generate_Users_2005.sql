
Declare @mensaje [varchar](8000)
Declare @Name varchar(400)
Declare @Orphaned varchar(400)
set nocount on
PRINT 'USE $'+'(db) -- ' + db_name()
PRINT 'GO'
-- CREATE USER_CREATION_SCRIPTS

--ROLES
Declare Roles CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR
SELECT name
FROM sysusers 
WHERE uid > 0 AND (uid not between 16380 and 16393) 
AND issqlrole = 1 

OPEN Roles
FETCH NEXT FROM Roles INTO @Name
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT '-- Role: ' + @Name 
	PRINT 'CREATE ROLE ['+ @Name +'] AUTHORIZATION [dbo]';
	PRINT 'GO'

FETCH NEXT FROM Roles INTO @Name
END

DECLARE @errStatement [varchar](8000),  @DatabaseUserID [smallint], @ServerUserName [sysname], @RoleName [varchar](8000), @ObjectID [int],@ObjectName [varchar](261) 


Declare Usuarios CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR
select s.[name] 
from sysusers s inner join master..syslogins l on s.sid = l.sid
where uid>2 and s.SID is not null

OPEN Usuarios
FETCH NEXT FROM Usuarios INTO @Name
WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @DatabaseUserName [sysname]
	SET @DatabaseUserName = @Name
	SET NOCOUNT ON
	SELECT @DatabaseUserID = [sysusers].[uid], @ServerUserName = [master].[dbo].[syslogins].[loginname]
	FROM [dbo].[sysusers] INNER JOIN [master].[dbo].[syslogins] ON [sysusers].[sid] = [master].[dbo].[syslogins].[sid]
	WHERE [sysusers].[name] = @DatabaseUserName
	IF @DatabaseUserID IS NULL
	BEGIN
		--SET @errStatement = 'El usuario ' + @DatabaseUserName + ' no existe en ' + DB_NAME() + CHAR(13) 
		--RAISERROR(@errStatement, 16, 1)
		PRINT ''
	END
	ELSE
	BEGIN
		PRINT '-- User: ' + @DatabaseUserName 
		PRINT 'EXEC [sp_grantdbaccess] @loginame = ''' + @ServerUserName + ''', @name_in_db = ''' + @DatabaseUserName + ''''
		PRINT 'GO'

		DECLARE UsuariosdelaBase CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR
		SELECT [name] FROM [dbo].[sysusers] WHERE [uid] IN
		(
			SELECT [groupuid] FROM [dbo].[sysmembers] WHERE [memberuid] = @DatabaseUserID
		)
		OPEN UsuariosdelaBase
		FETCH NEXT FROM UsuariosdelaBase INTO @RoleName
		WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT 'EXEC [sp_addrolemember] @rolename = ''' + @RoleName + ''', @membername = ''' + @DatabaseUserName + ''''
			PRINT 'GO'
			FETCH NEXT FROM UsuariosdelaBase INTO @RoleName
		END
		CLOSE UsuariosdelaBase
		DEALLOCATE UsuariosdelaBase

	END	
FETCH NEXT FROM Usuarios INTO @Name
END
CLOSE Usuarios
DEALLOCATE Usuarios

Declare Orphaned CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR
select UserName = name 
from sysusers
where (issqluser=1 or isntgroup=1 or isntuser=1) and (sid is not null and sid <> 0x0) and suser_sname(sid) is null and name <> 'dbo'
order by name
OPEN Orphaned
FETCH NEXT FROM Orphaned INTO @Orphaned
WHILE @@FETCH_STATUS = 0
BEGIN

	IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = '' + @Orphaned +'''' )
	BEGIN
		PRINT 'CREATE USER [' + @Orphaned + '] FOR LOGIN ' + @Orphaned
		PRINT 'EXEC sp_addrolemember N''db_owner'', N' + @Orphaned
		PRINT 'GO'
	END;
	ELSE
	BEGIN
		PRINT '-- User: ' + @Orphaned + ' (Orphaned)'
		PRINT 'CREATE USER [' + @Orphaned + '] WITHOUT LOGIN' 
		PRINT 'GO'
	END

	FETCH NEXT FROM Orphaned INTO @Orphaned
END
CLOSE Orphaned
DEALLOCATE Orphaned

Declare USRGUEST CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR
select name 
from sysusers
where name = 'guest' and hasdbaccess <> 0
OPEN USRGUEST
FETCH NEXT FROM USRGUEST INTO @Orphaned
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT '-- Guest' 
	PRINT 'sp_grantdbaccess ''guest''' 
	PRINT 'GO'
	FETCH NEXT FROM USRGUEST INTO @Orphaned
END
CLOSE USRGUEST
DEALLOCATE USRGUEST

EXEC SP_CHANGEDBOWNER 'sa'
GO
