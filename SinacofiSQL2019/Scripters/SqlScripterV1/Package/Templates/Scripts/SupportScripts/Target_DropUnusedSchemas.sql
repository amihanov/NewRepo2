USE master
GO
sp_MSforeachdb N'USE [?];
DECLARE @name AS SYSNAME, @schema_id AS INT;
IF EXISTS(SELECT * FROM sys.databases WHERE name = N''?''
	AND create_date >= CAST(GETDATE() - 1 AS DATE)
	AND name NOT IN (N''master'', N''tempdb'', N''model'', N''msdb''))
BEGIN
	DECLARE schema_curs CURSOR FOR
	SELECT name, schema_id FROM sys.schemas where (schema_id > 4 and schema_id < 16384) or schema_id > 16393;
	OPEN schema_curs;
	FETCH NEXT FROM schema_curs INTO @name, @schema_id;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF NOT EXISTS(SELECT * FROM sys.all_objects WHERE schema_id = @schema_id)
		BEGIN
			EXECUTE (N''DROP SCHEMA ['' + @name + N'']'');
		END
		FETCH NEXT FROM schema_curs INTO @name, @schema_id;
	END
	CLOSE schema_curs;
	DEALLOCATE schema_curs;
END'
GO
