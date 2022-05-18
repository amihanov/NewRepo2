use master
go
-- Generate Tests
set nocount on
Declare @Mensaje varchar(950)
Declare @srvname varchar(50)
set @Mensaje = 'use master' + char(10) + char(13) + 'GO' + char(10) + char(13)
print @Mensaje
set @Mensaje = 'declare @srvr nvarchar(128), @retval int'
print @Mensaje
Declare Linked CURSOR for
select srvname
from sysservers 
where srvid <> 0
OPEN Linked
FETCH NEXT FROM Linked INTO @srvname
WHILE @@FETCH_STATUS = 0
BEGIN
	set @Mensaje = 'set @srvr = '''+ @srvname+''''
	print @Mensaje
	set @Mensaje = 'BEGIN TRY'
	print @Mensaje
	set @Mensaje = 'exec @retval = sys.sp_testlinkedserver  @srvr '
	print @Mensaje
	set @Mensaje = 'if @retval <> 0'
	print @Mensaje
	set @Mensaje = 'PRINT (''Prueba de Linkedserver '' + @srvr + '': Fallida'' )'
	print @Mensaje
	set @Mensaje = 'ELSE'  
	print @Mensaje
	set @Mensaje = 'PRINT (''Prueba de Linkedserver '' + @srvr + '': OK'' )'
	print @Mensaje 
	set @Mensaje = 'END TRY'
	print @Mensaje
	set @Mensaje = 'BEGIN CATCH'
	print @Mensaje
	set @Mensaje = 'PRINT (''Prueba de Linkedserver '' + @srvr + '': Fallida'' )'
	print @Mensaje
	set @Mensaje = 'END CATCH'
	print @Mensaje
FETCH NEXT FROM Linked INTO @srvname
END
CLOSE Linked
DEALLOCATE Linked
go