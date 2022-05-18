EXEC sp_configure 'show advanced options', 1
RECONFIGURE WITH OVERRIDE;
GO

EXEC sp_configure 'max degree of parallelism', 8;
EXEC sp_configure 'max degree of parallelism'
GO

EXEC sys.sp_configure N'cost threshold for parallelism', N'50'
EXEC sys.sp_configure N'cost threshold for parallelism'
GO

RECONFIGURE WITH OVERRIDE;
GO
EXEC sp_configure 'show advanced options', 0
RECONFIGURE WITH OVERRIDE;
GO
DBCC FREEPROCCACHE;
GO
EXEC sp_updatestats;
GO
