IF  EXISTS (SELECT * FROM master.sys.server_triggers WHERE parent_class_desc = 'SERVER' AND name = N'ddltrg_DbChangeLog')
	DISABLE TRIGGER [ddltrg_DbChangeLog] ON ALL SERVER
GO

EXEC sp_configure 'show advanced options', 1
RECONFIGURE WITH OVERRIDE;
GO

IF OBJECT_ID('tempdb..#ajustememmig') IS NOT NULL 
    DROP TABLE #ajustememmig

IF OBJECT_ID('tempdb..#currentMaxMemory') IS NOT NULL 
    DROP TABLE #currentMaxMemory

GO

CREATE TABLE #currentMaxMemory (name varchar(100),minimum int, maximum int, config_value int, run_value int)
INSERT INTO #currentMaxMemory EXEC sp_configure 'max server memory'; 

DECLARE @currentMaxMemory int = (select run_value from #currentMaxMemory)

-- Is Max Memory non default value
IF (@currentMaxMemory = 2147483647)
BEGIN
	CREATE TABLE #ajustememmig (vindex int,name varchar(100),value int,valuechar varchar(100))
	INSERT INTO #ajustememmig exec xp_msver N'PhysicalMemory' 
	DECLARE @vmem int
	SELECT @vmem=value from #ajustememmig

	IF OBJECT_ID('tempdb..#ajustememmig') IS NOT NULL 
		drop table #ajustememmig

	SELECT @vmem=CASE 
			 WHEN @vmem<=2048   THEN (floor(@vmem*0.5))
			 ELSE (floor(@vmem*0.75))
		  END 

	EXEC sp_configure 'max server memory' ,@vmem;
END
EXEC sp_configure 'max server memory';

-- Permitir utilizar todos los procesadores durante el proceso de carga
EXEC sp_configure 'max degree of parallelism', 0; 
EXEC sp_configure 'max degree of parallelism';
EXEC sp_configure 'show advanced options', 0;
GO
RECONFIGURE WITH OVERRIDE
GO
