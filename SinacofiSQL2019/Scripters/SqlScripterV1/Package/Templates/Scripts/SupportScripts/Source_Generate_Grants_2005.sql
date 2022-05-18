USE [$(db)];
GO
SET NOCOUNT ON;

PRINT 'USE $'+'(db)  -- ' + db_name();
PRINT 'GO';

SELECT 
	CASE dp.class
	    WHEN 1 THEN 'IF (OBJECT_ID(''' + QUOTENAME(SCHEMA_NAME(o.schema_id)) + '.' + QUOTENAME(o.[name]) + ''') IS NOT NULL AND USER_ID(''' + p.name + ''') IS NOT NULL) ' 
		ELSE 'IF (USER_ID(''' + p.name + ''') IS NOT NULL) ' 
	END + CHAR(13) + CHAR(10) + 
    CASE dp.state
		WHEN 'W' THEN 'GRANT' -- WITH GRANT OPTION
		ELSE dp.state_desc
	END
	+ ' ' + dp.permission_name + ' ON ' + 
	CASE dp.class
		WHEN 0 THEN 'DATABASE::' + QUOTENAME(DB_NAME())
		WHEN 1 THEN 'OBJECT::' + QUOTENAME(SCHEMA_NAME(o.schema_id)) + '.' + QUOTENAME(o.[name])
		WHEN 3 THEN 'SCHEMA::' + QUOTENAME(SCHEMA_NAME(dp.major_id))
		WHEN 6 THEN 'TYPE::' + QUOTENAME(SCHEMA_NAME(t.schema_id)) + '.' + QUOTENAME(t.[name])
	END
	+ ' TO ' + QUOTENAME(p.name) +
	CASE dp.state
		WHEN 'W' THEN ' WITH GRANT OPTION;'
		ELSE ';'
	END
	+ CHAR(13) + CHAR(10) + 'GO'
	COLLATE DATABASE_DEFAULT
FROM sys.database_permissions dp
	JOIN sys.database_principals p
	ON dp.grantee_principal_id = p.principal_id
	LEFT JOIN sys.all_objects o
	ON dp.major_id = o.object_id
		AND dp.class = 1
	LEFT JOIN sys.types t
	ON dp.major_id = t.user_type_id
		AND dp.class = 6
WHERE dp.class IN (0, 1, 3, 6)
	AND major_id >= 0
	AND grantee_principal_id <> 1
ORDER BY p.name, dp.permission_name;