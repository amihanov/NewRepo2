USE tempdb
GO
IF OBJECT_ID ('dbo.sp_hexadecimal') IS NOT NULL
	DROP PROCEDURE dbo.sp_hexadecimal
GO
CREATE PROCEDURE dbo.sp_hexadecimal
	@binvalue varbinary(256),
	@hexvalue varchar (514) OUTPUT
AS
DECLARE @charvalue VARCHAR (514)
DECLARE @i INT
DECLARE @length INT
DECLARE @hexstring CHAR(16)
SET @charvalue = '0x'
SET @i = 1
SET @length = DATALENGTH (@binvalue)
SET @hexstring = '0123456789ABCDEF'
WHILE @i <= @length
BEGIN
	DECLARE @tempint INT
	DECLARE @firstint INT
	DECLARE @secondint INT
	SET @tempint = CONVERT(INT, SUBSTRING(@binvalue, @i, 1))
	SET @firstint = FLOOR(@tempint / 16)
	SET @secondint = @tempint - @firstint * 16
	SET @charvalue = @charvalue
		+ SUBSTRING(@hexstring, @firstint + 1, 1)
		+ SUBSTRING(@hexstring, @secondint + 1, 1)
	SET @i = @i + 1
END

SET @hexvalue = @charvalue
GO

DECLARE @name SYSNAME
DECLARE @type VARCHAR(1)
DECLARE @hasaccess INT
DECLARE @denylogin INT
DECLARE @is_disabled INT
DECLARE @PWD_varbinary VARBINARY(256)
DECLARE @PWD_string VARCHAR(514)
DECLARE @SID_varbinary VARBINARY(85)
DECLARE @SID_string VARCHAR(514)
DECLARE @tmpstr VARCHAR(1024)
DECLARE @is_policy_checked VARCHAR(3)
DECLARE @is_expiration_checked VARCHAR(3)

DECLARE @defaultdb SYSNAME
DECLARE @defaultlang SYSNAME

DECLARE login_curs CURSOR STATIC FOR
SELECT p.sid, p.name, p.type, p.is_disabled, p.default_database_name,
	p.default_language_name, l.hasaccess, l.denylogin
FROM sys.server_principals p LEFT JOIN sys.syslogins l
	ON l.name = p.name
WHERE p.type LIKE N'[GSU]' AND p.name <> N'sa'
	AND p.name NOT LIKE N'NT SERVICE\_%'
	AND p.name NOT LIKE N'NT AUTHORITY\_%'
	AND p.name NOT LIKE N'##%'
ORDER BY CASE p.type WHEN 'S' THEN 0 END, p.name

SET @tmpstr = '-- 1. Login script generated ' + CONVERT(VARCHAR, GETDATE(), 120) + ' on ' + @@SERVERNAME
PRINT @tmpstr

OPEN login_curs
FETCH NEXT FROM login_curs INTO @SID_varbinary, @name, @type, @is_disabled, @defaultdb, @defaultlang, @hasaccess, @denylogin

WHILE @@fetch_status = 0
BEGIN
	PRINT ''
	IF @type IN ('G', 'U')
	BEGIN -- NT authenticated account/group
		SET @tmpstr = 'CREATE LOGIN ' + QUOTENAME(@name) + ' FROM WINDOWS'
			+ CASE WHEN @defaultlang IS NOT NULL THEN ' WITH DEFAULT_LANGUAGE = ' + @defaultlang ELSE '' END
	END
	ELSE
	BEGIN -- SQL Server authentication
		-- obtain password and sid
		SET @PWD_varbinary = CAST(LOGINPROPERTY(@name, 'PasswordHash') AS VARBINARY(256))
		EXEC dbo.sp_hexadecimal @PWD_varbinary, @PWD_string OUT
		EXEC dbo.sp_hexadecimal @SID_varbinary, @SID_string OUT
 
		-- obtain password policy state
		SELECT @is_policy_checked = CASE is_policy_checked WHEN 1 THEN 'ON' WHEN 0 THEN 'OFF' ELSE NULL END,
			@is_expiration_checked = CASE is_expiration_checked WHEN 1 THEN 'ON' WHEN 0 THEN 'OFF' ELSE NULL END
		FROM sys.sql_logins WHERE name = @name
 
		SET @tmpstr = 'CREATE LOGIN ' + QUOTENAME( @name ) + ' WITH PASSWORD = ' + @PWD_string + ' HASHED/*, SID = ' + @SID_string + '*/'
			+ CASE WHEN @defaultlang IS NOT NULL THEN ', DEFAULT_LANGUAGE = ' + @defaultlang ELSE '' END

		IF @is_policy_checked IS NOT NULL
		BEGIN
			SET @tmpstr = @tmpstr + ', CHECK_POLICY = ' + @is_policy_checked
		END
		IF @is_expiration_checked IS NOT NULL
		BEGIN
			SET @tmpstr = @tmpstr + ', CHECK_EXPIRATION = ' + @is_expiration_checked
		END
	END
	IF @denylogin = 1
	BEGIN -- login is denied access
		SET @tmpstr = @tmpstr + '; DENY CONNECT SQL TO ' + QUOTENAME(@name)
	END
	ELSE IF @hasaccess = 0
	BEGIN -- login exists but does not have access
		SET @tmpstr = @tmpstr + '; REVOKE CONNECT SQL TO ' + QUOTENAME(@name)
	END
	IF (@is_disabled = 1)
	BEGIN -- login is disabled
		SET @tmpstr = @tmpstr + '; ALTER LOGIN ' + QUOTENAME(@name) + ' DISABLE'
	END
	PRINT @tmpstr

	FETCH NEXT FROM login_curs INTO @SID_varbinary, @name, @type, @is_disabled, @defaultdb, @defaultlang, @hasaccess, @denylogin
END

PRINT ''
PRINT '-- 2. Setting default database'
FETCH FIRST FROM login_curs INTO @SID_varbinary, @name, @type, @is_disabled, @defaultdb, @defaultlang, @hasaccess, @denylogin
WHILE @@fetch_status = 0
BEGIN
	IF @defaultdb <> N'master'
	BEGIN
		PRINT ''
		SET @tmpstr = 'ALTER LOGIN ' + QUOTENAME(@name) + ' WITH DEFAULT_DATABASE = ' + QUOTENAME(@defaultdb)
		PRINT @tmpstr
	END
	FETCH NEXT FROM login_curs INTO @SID_varbinary, @name, @type, @is_disabled, @defaultdb, @defaultlang, @hasaccess, @denylogin
END

CLOSE login_curs
DEALLOCATE login_curs

PRINT ''
PRINT '-- 3. Setting server level role memebership'

DECLARE role_curs CURSOR FOR
SELECT r.name as RoleName, p.name as LoginName
FROM sys.server_principals AS r
	JOIN sys.server_role_members AS rm
	ON r.principal_id = rm.role_principal_id
	JOIN sys.server_principals AS p
	ON rm.member_principal_id = p.principal_id
WHERE r.principal_id BETWEEN 2 AND 10
	AND p.type LIKE '[GSU]'
	AND p.name <> N'sa'
	AND p.name NOT LIKE N'NT SERVICE\_%'
	AND p.name NOT LIKE N'NT AUTHORITY\_%'
	AND p.name NOT LIKE N'##%'
ORDER BY CASE p.type WHEN 'S' THEN 0 END, p.name

OPEN role_curs
FETCH NEXT FROM role_curs INTO @defaultdb, @name

WHILE @@fetch_status = 0
BEGIN
	PRINT ''
	--SET @tmpstr = 'ALTER SERVER ROLE ' + QUOTENAME(@defaultdb) + ' ADD MEMBER ' + QUOTENAME(@name)
	SET @tmpstr = 'EXEC sp_addsrvrolemember @loginame = N''' + @name
		+ ''', @rolename = N''' + @defaultdb + ''''
	PRINT @tmpstr

	FETCH NEXT FROM role_curs INTO @defaultdb, @name
END

CLOSE role_curs
DEALLOCATE role_curs
GO