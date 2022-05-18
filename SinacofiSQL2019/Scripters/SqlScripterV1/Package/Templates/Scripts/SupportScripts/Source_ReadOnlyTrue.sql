DECLARE @DatabaseName nvarchar(50)
SET @DatabaseName = N'$(db)'

DECLARE @SQL varchar(8000)

DECLARE @intentos INT
SET @intentos = 5
WHILE (@intentos > 0)
BEGIN
	SET @intentos = @intentos - 1
	
	DECLARE @prevActiveConnections INT
	DECLARE @currActiveConnections INT
	SET @prevActiveConnections = 4000001
	SET @currActiveConnections = 4000000

	WHILE (@prevActiveConnections > @currActiveConnections AND @currActiveConnections > 0)
	BEGIN
		SET @SQL = '' 
		SELECT TOP 50 @SQL = @SQL + 'KILL ' +CAST(SPID AS VARCHAR(5))+CHAR(13) 
		FROM master..sysprocesses 
		WHERE spid != @@SPID 
		AND dbid = DB_ID(@DatabaseName) AND dbid <> 0
		AND status <> 'background' 
		AND cmd not in ('LAZY WRITER','LOG WRITER','LOCK MONITOR','SIGNAL HANDLER','CHECKPOINT SLEEP','TASK MANAGER')--'AWAITING COMMAND'
		ORDER BY spid
		OPTION(MAXDOP 1)
		
		PRINT @SQL 
		EXEC(@SQL)

		set @prevActiveConnections = @currActiveConnections
		SELECT @currActiveConnections=COUNT(1)
		FROM master..sysprocesses 
		WHERE spid != @@SPID 
		AND dbid = DB_ID(@DatabaseName) AND dbid <> 0
		AND status <> 'background' 
		AND cmd not in ('LAZY WRITER','LOG WRITER','LOCK MONITOR','SIGNAL HANDLER','CHECKPOINT SLEEP','TASK MANAGER')--'AWAITING COMMAND'

		PRINT '--Active Connections: ' + cast(@currActiveConnections as varchar(10))
	END
	SET @SQL = ''
	SET @SQL = @SQL + 'exec sp_dboption '''+@DatabaseName+''',''read only'', true'+CHAR(13) 
--	SET @SQL = @SQL + 'exec sp_dboption '''+@DatabaseName+''',''dbo use only'', true'+CHAR(13) 

	PRINT @SQL 
	EXEC(@SQL)
	
	if @@ERROR = 0
		break
END	