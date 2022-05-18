USE [$(db)]
GO
SET NOCOUNT ON
GO
SELECT 'DBCC CHECKIDENT (''['+schema_name(t.uid) +'].['+t.name+']'', RESEED, ' + cast(IDENT_CURRENT( '['+'dbo'+'].['+t.name+']') as varchar(50)) + ');' 
FROM sysobjects t 
WHERE type = 'U ' 
AND IDENT_CURRENT( '['+'dbo'+'].['+t.name+']') IS NOT NULL
GO
SELECT 'ALTER SEQUENCE ['+schema_name(schema_id)+'].['+NAME+'] RESTART WITH '+ CAST(current_value AS varchar(50))
FROM sys.sequences
WHERE is_ms_shipped = 0
GO
