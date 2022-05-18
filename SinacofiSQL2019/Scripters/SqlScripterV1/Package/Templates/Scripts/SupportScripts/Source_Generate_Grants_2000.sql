USE [$(DB)]
GO
SET NOCOUNT ON
DECLARE @Name varchar(100)
DECLARE @msg [varchar](8000)
PRINT 'USE $'+'(db)  -- ' + db_name()
PRINT 'GO'
-- CREATE GRANTS_SCRIPTS

DECLARE @DatabaseUserName [sysname], @DatabaseUserID [smallint]

CREATE TABLE #sysprotects
(
	id	int,
	uid	smallint,
	action	tinyint,
	protecttype	tinyint,
	columns varbinary(4000) null
)
CREATE UNIQUE CLUSTERED INDEX #sysprotects_pk on #sysprotects (id, uid, action, protecttype)

INSERT INTO #sysprotects
SELECT [id], [uid], [action], [protecttype] ,[columns]
FROM [dbo].[sysprotects] 
WHERE [action] IN (26, 193, 195, 196, 197, 224)
AND [protecttype] IN (204, 205, 206)


Declare Users CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR
SELECT s.name, s.uid
FROM sysusers s 
LEFT JOIN master..syslogins l ON s.name COLLATE DATABASE_DEFAULT = l.name COLLATE DATABASE_DEFAULT
WHERE (uid not between 16380 and 16393) AND l.name is not null or s.name='Public' and s.status!=16

OPEN Users
FETCH NEXT FROM Users INTO @Name, @DatabaseUserID
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @DatabaseUserName = @Name
	SET NOCOUNT ON
	DECLARE @errStatement [varchar](8000), @ServerUserName [sysname], @RoleName [varchar](8000), @ObjectID [int],@ObjectName [varchar](261) ,@ObjectOriginName [varchar](261), @column varchar(250)
	
	IF @DatabaseUserID IS NOT NULL
	BEGIN
		PRINT '-- User: ' + @DatabaseUserName

		DECLARE ObjetosBase CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR

		SELECT DISTINCT([sysobjects].[id]),'[' + USER_NAME([sysobjects].[uid]) + '].[' + [sysobjects].[name] + ']', [sysobjects].[name]
		FROM [dbo].[sysprotects]
		INNER JOIN [dbo].[sysobjects] ON [sysprotects].[id] = [sysobjects].[id]
		WHERE [sysprotects].[uid] = @DatabaseUserID  
		 and [dbo].[sysobjects].name not like ('sys%')
		 and [sysobjects].[uid] not in (select uid from sysusers where name like ('INFORMATION_SCHEMA'))
		 and [dbo].[sysobjects].name not like ('dt_%')
		
		OPEN ObjetosBase
		FETCH NEXT FROM ObjetosBase INTO @ObjectID,@ObjectName, @ObjectOriginName
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @msg = ''
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 193 AND [protecttype] = 205)
			BEGIN
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 193 AND [protecttype] = 205 AND [columns] is not null AND [columns] <>  0x01)
				BEGIN
					SET @column = ''
					SELECT @column = @column + column_name + ', ' FROM INFORMATION_SCHEMA.COLUMN_PRIVILEGES WHERE table_name = @ObjectOriginName AND privilege_type = 'SELECT'
					
					IF (LEN(@column) >0) SELECT @column = '(' + SUBSTRING(@column, 0, LEN(@column)) + ')'
					PRINT 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'GRANT SELECT' + CHAR(9) + 'ON ' + @ObjectName + @column+ CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']'
					PRINT 'GO'
				END
				ELSE
					SET @msg = @msg + 'SELECT,'
			END
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 197 AND [protecttype] = 205)
			BEGIN
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 197 AND [protecttype] = 205 AND [columns] is not null and [columns] <>  0x01)
				BEGIN
					SET @column = ''
					SELECT @column = @column + column_name + ', ' FROM INFORMATION_SCHEMA.COLUMN_PRIVILEGES WHERE table_name = @ObjectOriginName AND privilege_type = 'UPDATE'
					
					IF (LEN(@column) >0) SELECT @column = '(' + SUBSTRING(@column, 0, LEN(@column)) + ')'
					PRINT 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'GRANT UPDATE' + CHAR(9) + 'ON ' + @ObjectName + @column+ CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']'
					PRINT 'GO'
				END
				ELSE
					SET @msg = @msg + 'UPDATE,'
			END

			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 195 AND [protecttype] = 205)
				SET @msg = @msg + 'INSERT,'
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 196 AND [protecttype] = 205)
				SET @msg = @msg + 'DELETE,'
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 224 AND [protecttype] = 205)
				SET @msg = @msg + 'EXECUTE,'
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 26 AND [protecttype] = 205)
				SET @msg = @msg + 'REFERENCES,'
			IF LEN(@msg) > 0
			BEGIN
				IF RIGHT(@msg, 1) = ','
					SET @msg = LEFT(@msg, LEN(@msg) - 1)
				SET @msg = 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'GRANT ' + @msg + CHAR(9) + 'ON ' + @ObjectName + CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']'
				PRINT @msg
				PRINT 'GO'
			END
			SET @msg = ''
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 193 AND [protecttype] = 206)
			BEGIN
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 193 AND [protecttype] = 206 AND [columns] is not null and [columns] <>  0x01)
				BEGIN
					SET @column = ''
					SELECT @column = @column + column_name + ', ' FROM INFORMATION_SCHEMA.COLUMNS  a WHERE a.table_name = @ObjectOriginName AND NOT EXISTS 
					(SELECT 1 FROM INFORMATION_SCHEMA.COLUMN_PRIVILEGES b WHERE b.privilege_type = 'SELECT' AND a.table_name = b.table_name AND a.column_name = b.column_name)
					
					IF (LEN(@column) >0) SELECT @column = '(' + SUBSTRING(@column, 0, LEN(@column)) + ')'
					PRINT 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'DENY SELECT' + CHAR(9) + 'ON ' + @ObjectName + @column+ CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']'
					PRINT 'GO'
				END
				ELSE
					SET @msg = @msg + 'SELECT,'
			END
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 197 AND [protecttype] = 206)
			BEGIN
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 197 AND [protecttype] = 206 AND [columns] is not null and [columns] <>  0x01)
				BEGIN
					SET @column = ''
					SELECT @column = @column + column_name + ', ' FROM INFORMATION_SCHEMA.COLUMNS  a WHERE a.table_name = @ObjectOriginName AND NOT EXISTS 
					(SELECT 1 FROM INFORMATION_SCHEMA.COLUMN_PRIVILEGES b WHERE b.privilege_type = 'UPDATE' AND a.table_name = b.table_name AND a.column_name = b.column_name)

					IF (LEN(@column) >0) SELECT @column = '(' + SUBSTRING(@column, 0, LEN(@column)) + ')'
					PRINT 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'DENY UPDATE' + CHAR(9) + 'ON ' + @ObjectName + @column+ CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']'
					PRINT 'GO'
				END
				ELSE
					SET @msg = @msg + 'UPDATE,'
			END
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 195 AND [protecttype] = 206)
				SET @msg = @msg + 'INSERT,'
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 196 AND [protecttype] = 206)
				SET @msg = @msg + 'DELETE,'
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 224 AND [protecttype] = 206)
				SET @msg = @msg + 'EXECUTE,'
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 26 AND [protecttype] = 206)
				SET @msg = @msg + 'REFERENCES,'
			IF LEN(@msg) > 0
			BEGIN
				IF RIGHT(@msg, 1) = ','
					SET @msg = LEFT(@msg, LEN(@msg) - 1)
				SET @msg = 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'DENY ' + @msg + CHAR(9) + 'ON ' + @ObjectName+ CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']'
				PRINT @msg
				PRINT 'GO'
			END
			SET @msg = ''
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 193 AND [protecttype] = 204)
			BEGIN
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 193 AND [protecttype] = 204 AND [columns] is not null AND [columns] <>  0x01)
				BEGIN
					SET @column = ''
					SELECT @column = @column + column_name + ', ' FROM INFORMATION_SCHEMA.COLUMN_PRIVILEGES WHERE table_name = @ObjectOriginName AND privilege_type = 'SELECT'
					
					IF (LEN(@column) >0) SELECT @column = '(' + SUBSTRING(@column, 0, LEN(@column)) + ')'
					PRINT 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'GRANT SELECT' + CHAR(9) + 'ON ' + @ObjectName + @column+ CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']'
					PRINT 'GO'
				END
				ELSE
					SET @msg = @msg + 'SELECT,'
			END
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 197 AND [protecttype] = 204)
			BEGIN
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 197 AND [protecttype] = 204 AND [columns] is not null and [columns] <>  0x01)
				BEGIN
					SET @column = ''
					SELECT @column = @column + column_name + ', ' FROM INFORMATION_SCHEMA.COLUMN_PRIVILEGES WHERE table_name = @ObjectOriginName AND privilege_type = 'UPDATE'
					
					IF (LEN(@column) >0) SELECT @column = '(' + SUBSTRING(@column, 0, LEN(@column)) + ')'
					PRINT 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'GRANT UPDATE' + CHAR(9) + 'ON ' + @ObjectName + @column+ CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']'
					PRINT 'GO'
				END
				ELSE
					SET @msg = @msg + 'UPDATE,'
			END
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 195 AND [protecttype] = 204)
				SET @msg = @msg + 'INSERT,'
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 196 AND [protecttype] = 204)
				SET @msg = @msg + 'DELETE,'
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 224 AND [protecttype] = 204)
				SET @msg = @msg + 'EXECUTE,'
			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 26 AND [protecttype] = 204)
				SET @msg = @msg + 'REFERENCES,'

			IF LEN(@msg) > 0
			BEGIN
				IF RIGHT(@msg, 1) = ','
					SET @msg = LEFT(@msg, LEN(@msg) - 1)
				SET @msg = 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'GRANT ' + @msg + CHAR(9) + 'ON ' + @ObjectName+ CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']' +' WITH GRANT OPTION'
				PRINT @msg
				PRINT 'GO'
			END
			FETCH NEXT FROM ObjetosBase INTO @ObjectID, @ObjectName, @ObjectOriginName
		END
		CLOSE ObjetosBase
		DEALLOCATE ObjetosBase
		
	END	
FETCH NEXT FROM Users INTO @Name, @DatabaseUserID
END

Declare @orphaned varchar(100)
Declare orphaned CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR
select s.name, s.uid
from sysusers s 
left join master..syslogins l on s.name COLLATE DATABASE_DEFAULT = l.name COLLATE DATABASE_DEFAULT
where (uid not between 16380 and 16393)  and l.name is  null and s.name !='public' and s.status!=16
order by s.name

OPEN orphaned
FETCH NEXT FROM orphaned INTO @orphaned, @DatabaseUserID
WHILE @@FETCH_STATUS = 0
BEGIN

	SET @DatabaseUserName = @orphaned
	SET NOCOUNT ON

	IF @DatabaseUserID IS NOT NULL
	BEGIN
		PRINT '-- User: ' + @DatabaseUserName + ' (Orphaned)'
		
		DECLARE ObjetosBase CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR
		SELECT DISTINCT([sysobjects].[id]),'[' + USER_NAME([sysobjects].[uid]) + '].[' + [sysobjects].[name] + ']'
		FROM [dbo].[sysprotects]
		INNER JOIN [dbo].[sysobjects] ON [sysprotects].[id] = [sysobjects].[id]
		WHERE [sysprotects].[uid] = @DatabaseUserID 
		 and [dbo].[sysobjects].name not like ('sys%')
		 and [sysobjects].[uid] not in (select uid from sysusers where name like ('INFORMATION_SCHEMA'))
		 and [dbo].[sysobjects].name not like ('dt_%')
		
		OPEN ObjetosBase
		FETCH NEXT FROM ObjetosBase INTO @ObjectID, @ObjectName
		WHILE @@FETCH_STATUS = 0
		BEGIN

			IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID)
			BEGIN
				SET @msg = ''
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 193 AND [protecttype] = 205)
				BEGIN
					IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 193 AND [protecttype] = 205 AND [columns] is not null AND [columns] <>  0x01)
					BEGIN
						SET @column = ''
						SELECT @column = @column + column_name + ', ' FROM INFORMATION_SCHEMA.COLUMN_PRIVILEGES WHERE table_name = @ObjectOriginName AND privilege_type = 'SELECT'
						
						IF (LEN(@column) >0) SELECT @column = '(' + SUBSTRING(@column, 0, LEN(@column)) + ')'
						PRINT 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'GRANT SELECT' + CHAR(9) + 'ON ' + @ObjectName + @column+ CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']'
						PRINT 'GO'
					END
					ELSE
						SET @msg = @msg + 'SELECT,'
				END
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 197 AND [protecttype] = 205)
				BEGIN
					IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 197 AND [protecttype] = 205 AND [columns] is not null and [columns] <>  0x01)
					BEGIN
						SET @column = ''
						SELECT @column = @column + column_name + ', ' FROM INFORMATION_SCHEMA.COLUMN_PRIVILEGES WHERE table_name = @ObjectOriginName AND privilege_type = 'UPDATE'
	
						IF (LEN(@column) >0) SELECT @column = '(' + SUBSTRING(@column, 0, LEN(@column)) + ')'			
						PRINT 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'GRANT UPDATE' + CHAR(9) + 'ON ' + @ObjectName + @column+ CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']'
						PRINT 'GO'
					END
					ELSE
						SET @msg = @msg + 'UPDATE,'
				END
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 195 AND [protecttype] = 205)
				SET @msg = @msg + 'INSERT,'
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 196 AND [protecttype] = 205)
				SET @msg = @msg + 'DELETE,'
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 224 AND [protecttype] = 205)
				SET @msg = @msg + 'EXECUTE,'
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 26 AND [protecttype] = 205)
				SET @msg = @msg + 'REFERENCES,'
				IF LEN(@msg) > 0
				BEGIN
					IF RIGHT(@msg, 1) = ','
						SET @msg = LEFT(@msg, LEN(@msg) - 1)
					SET @msg = 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'GRANT ' + @msg + CHAR(9) + 'ON ' + @ObjectName + CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']'
					PRINT @msg
					PRINT 'GO'
				END
				SET @msg = ''
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 193 AND [protecttype] = 206)
				BEGIN
					IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 193 AND [protecttype] = 206 AND [columns] is not null and [columns] <>  0x01)
					BEGIN
						SET @column = ''
						SELECT @column = @column + column_name + ', ' FROM INFORMATION_SCHEMA.COLUMNS  a WHERE a.table_name = @ObjectOriginName AND NOT EXISTS 
						(SELECT 1 FROM INFORMATION_SCHEMA.COLUMN_PRIVILEGES b WHERE b.privilege_type = 'SELECT' AND a.table_name = b.table_name AND a.column_name = b.column_name)

						IF (LEN(@column) >0) SELECT @column = '(' + SUBSTRING(@column, 0, LEN(@column)) + ')'
						PRINT 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'DENY SELECT' + CHAR(9) + 'ON ' + @ObjectName + @column+ CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']'
						PRINT 'GO'
					END
					ELSE
						SET @msg = @msg + 'SELECT,'
				END
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 197 AND [protecttype] = 206)
				BEGIN
					IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 197 AND [protecttype] = 206 AND [columns] is not null and [columns] <>  0x01)
					BEGIN
						SET @column = ''
						SELECT @column = @column + column_name + ', ' FROM INFORMATION_SCHEMA.COLUMNS  a WHERE a.table_name = @ObjectOriginName AND NOT EXISTS 
						(SELECT 1 FROM INFORMATION_SCHEMA.COLUMN_PRIVILEGES b WHERE b.privilege_type = 'UPDATE' AND a.table_name = b.table_name AND a.column_name = b.column_name)

						IF (LEN(@column) >0) SELECT @column = '(' + SUBSTRING(@column, 0, LEN(@column)) + ')'
						PRINT 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'DENY UPDATE' + CHAR(9) + 'ON ' + @ObjectName + @column+ CHAR(9)+ CHAR(9) + 'TO [' + @DatabaseUserName + ']'
						PRINT 'GO'
					END
					ELSE
						SET @msg = @msg + 'UPDATE,'
				END
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 195 AND [protecttype] = 206)
				SET @msg = @msg + 'INSERT,'
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 196 AND [protecttype] = 206)
				SET @msg = @msg + 'DELETE,'
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 224 AND [protecttype] = 206)
				SET @msg = @msg + 'EXECUTE,'
				IF EXISTS(SELECT 1 FROM #sysprotects WHERE [id] = @ObjectID AND [uid] = @DatabaseUserID AND [action] = 26 AND [protecttype] = 206)
				SET @msg = @msg + 'REFERENCES,'
				IF LEN(@msg) > 0
				BEGIN
					IF RIGHT(@msg, 1) = ','
					SET @msg = LEFT(@msg, LEN(@msg) - 1)
					SET @msg = 'IF (OBJECT_ID('''+@ObjectName+''') IS NOT NULL AND USER_ID(''' + @DatabaseUserName + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'DENY ' + @msg + CHAR(9) + 'ON ' + @ObjectName + CHAR(9) + CHAR(9)+ 'TO [' + @DatabaseUserName + ']'
					PRINT @msg
					PRINT 'GO'
				END
			END
			FETCH NEXT FROM ObjetosBase INTO @ObjectID,@ObjectName
		END
		CLOSE ObjetosBase
		DEALLOCATE ObjetosBase

	END	

	FETCH NEXT FROM orphaned INTO @orphaned, @DatabaseUserID
END
CLOSE orphaned
DEALLOCATE orphaned


/*
sysprotects (T-SQL)
Contains information about permissions that have been applied to security accounts with the GRANT and DENY statements. This table is stored in each database.

Column name Data type Description 
id int ID of object to which these permissions apply. 
uid smallint ID of user or group to which these permissions apply. 
action tinyint Can have one of these permissions: 
26  = REFERENCES
193 = SELECT
195 = INSERT
196 = DELETE
197 = UPDATE
198 = CREATE TABLE
203 = CREATE DATABASE
207 = CREATE VIEW
222 = CREATE PROCEDURE
224 = EXECUTE
228 = BACKUP DATABASE
233 = CREATE DEFAULT
235 = BACKUP LOG
236 = CREATE RULE 
protecttype tinyint Can have these values:
204 = GRANT_W_GRANT
205 = GRANT
206 = REVOKE 
columns varbinary(4000) Bitmap of columns to which these SELECT or UPDATE permissions apply. Bit 0 indicates all columns; bit 1 means permissions apply to that column and NULL means no information. 
grantor smallint User ID of the user who issued the GRANT or REVOKE permissions. 
*/

	declare @Username varchar (400), @Action int

	DECLARE ObjetosBase CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR

	SELECT USER_NAME([sysprotects].[uid]) , [action]
	FROM [dbo].[sysprotects] 
	WHERE [action] in (198,207,222)

	OPEN ObjetosBase
	FETCH NEXT FROM ObjetosBase INTO @Username,@Action
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @msg = ''
		if @Action = 198
		begin
			SET @msg = 'IF (USER_ID(''' + @Username + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'GRANT CREATE TABLE TO ' 
		end
		if @Action = 207
		begin
			SET @msg = 'IF (USER_ID(''' + @Username + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'GRANT CREATE VIEW TO ' 
		end
		if @Action = 222
		begin
			SET @msg = 'IF (USER_ID(''' + @Username + ''') IS NOT NULL)'+ CHAR(13) + CHAR(10) + 'GRANT CREATE PROCEDURE TO ' 
		end
		set @msg = @msg + ' [' + @Username + ']' 
		PRINT @msg
		PRINT 'GO'
		FETCH NEXT FROM ObjetosBase INTO @Username, @Action
	END
CLOSE ObjetosBase
DEALLOCATE ObjetosBase

--CREATE ROLES
SELECT 'EXEC sp_addrolemember '''+ user_name(groupuid)+''', ''' + user_name(memberuid)+'''' FROM [sysmembers] where memberuid between 3 and 16383 --groupuid<>16384
PRINT 'GO'

DROP TABLE #sysprotects

-- Usuarios mapeados a DBO sin usuario en la base de datos
SELECT 'CREATE USER ['+nonSaLogin+'] FOR LOGIN ['+nonSaLogin+'];
ALTER ROLE [db_owner] ADD MEMBER ['+nonSaLogin+'];
GO'
FROM
(
    SELECT DB_NAME() AS nombreBD, 
           sl.name AS nonSaLogin
    FROM master.dbo.syslogins AS sl
         JOIN sysusers AS su ON sl.sid = su.sid
    WHERE su.name = 'dbo'
          AND sl.name <> 'sa'
) nonSaDbos;


-- Set Database Owner to SA
select '
-- Source Owner: ' + suser_sname(sid) + '
ALTER AUTHORIZATION ON DATABASE::$'+'(db) TO sa
go' 
from master.dbo.sysdatabases where dbid = DB_ID()