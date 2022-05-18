Use Master
GO
DECLARE @packageUID UNIQUEIDENTIFIER
DECLARE packages cursor for
SELECT DISTINCT id 
FROM msdb.dbo.sysdtspackages 
OPEN packages
FETCH NEXT FROM packages INTO @packageUID
WHILE @@FETCH_STATUS = 0
BEGIN 
 EXEC msdb.dbo.sp_drop_dtspackage NULL, @packageUID, null  
FETCH NEXT FROM packages INTO @packageUID END 
CLOSE packages
DEALLOCATE packages