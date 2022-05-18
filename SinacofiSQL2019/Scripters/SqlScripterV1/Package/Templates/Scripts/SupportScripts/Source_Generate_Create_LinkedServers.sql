use master
go
-- Get Linked Servers
set nocount on
Declare @Mensaje varchar(950)
declare @aux int, @aux2 int, @password varchar(30),@username varchar(30)
Declare @srvname varchar(4000), @srvproduct varchar(4000), @providername varchar(4000), @datasource varchar(4000), @location varchar(4000), @providerstring varchar(4000)
set @Mensaje = 'use master' + char(10) + char(13) + 'GO' + char(10) + char(13)
print @Mensaje
Declare Linked CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR

select srvname, ltrim(rtrim(srvproduct)), 'MSDASQL', ltrim(rtrim(datasource)), ltrim(rtrim(location)), ltrim(rtrim(providerstring))
from sysservers 
where srvid <> 0 

OPEN Linked
FETCH NEXT FROM Linked INTO @srvname , @srvproduct , @providername , @datasource , @location , @providerstring 
WHILE @@FETCH_STATUS = 0
BEGIN
	if @srvproduct = 'SQL Server'
	begin 
		set @Mensaje = 'if exists (select name from sys.servers where name =' + '''' + @srvname + ''')' + CHAR(10) + char(13)
		print @Mensaje
		set @Mensaje = 'exec sp_dropserver ' + '''' + @srvname + ''',''droplogins''' + CHAR(10) + char(13)
		print @Mensaje
		set @Mensaje = 'GO' + CHAR(10) + char(13)
		print @Mensaje				
		set @Mensaje = 'sp_addlinkedserver ' + '''' + @srvname + '''' + ',' + '''' + @srvproduct + '''' + ',NULL,NULL,NULL,NULL,NULL' + CHAR(10) + char(13)
		print @Mensaje
		set @Mensaje = 'GO' + CHAR(10) + char(13)
		print @Mensaje

	end
	else
	begin
		if @srvproduct is null
		begin
			set @srvproduct=''
		end
		if @datasource is null
		begin
			set @datasource=''
		end
		if @location is null
		begin
			set @location=''
		end
		if @ProviderString is null
		begin
			set @ProviderString=''
		end
		select @aux = charindex('PWD=',@providerstring)
		if @aux <>0
		begin
			select @aux2 = charindex(';',@providerstring,@aux)
			set @password = SUBSTRING (@providerstring,@aux+4,@aux2-@aux-4)
			select @aux = charindex('UID=',@providerstring)
			select @aux2 = charindex(';',@providerstring,@aux)
			set @username = SUBSTRING (@providerstring,@aux+4,@aux2-@aux-4)
		end
		else
		begin
			set @password = ''
		end
		set @Mensaje = 'if exists (select name from sys.servers where name =' + '''' + @srvname + ''')' + CHAR(10) + char(13)
		print @Mensaje
		set @Mensaje = 'exec sp_dropserver ' + '''' + @srvname + ''',''droplogins''' + CHAR(10) + char(13)
		print @Mensaje
		set @Mensaje = 'GO' + CHAR(10) + char(13)
		print @Mensaje				
		--set @Mensaje = 'sp_addlinkedserver ' + '''' + @srvname + '''' + ',' + '''' + @srvproduct + '''' + ',' + '''' + @providername + '''' + ',' + '''' + @datasource + '''' + ',' +  '''' + @location + '''' + ',' + '''' + @providerstring + '''' + ',NULL' + CHAR(10) + char(13)
		--POR CAMBIO A ODBC SE MODIFICA EL PROVIDERSTRING COLOCANDOSE EL @srvname - IDEM PARA DATASOURCE
		set @Mensaje = 'sp_addlinkedserver ' + '''' + @srvname + '''' + ',' + '''' + @srvproduct + '''' + ',' + '''' + @providername + '''' + ',' + '''' + @srvname + '''' + ',' +  '''' + @location + '''' + ',' + '''' + @srvname + '''' + ',NULL' + CHAR(10) + char(13)
		print @Mensaje
		set @Mensaje = 'GO' + CHAR(10) + char(13)
		print @Mensaje
		if @password <> ''
		begin
			set @Mensaje = 'sp_addlinkedsrvlogin ' + '''' + @srvname + '''' + ',' + 'False' + ',NULL,' + '''' + @username + '''' + ',' + '''' + @password + '''' + CHAR(10) + char(13)
			print @Mensaje
			set @Mensaje = 'GO' + CHAR(10) + char(13)
			print @Mensaje
		end
    print 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''collation compatible'', @optvalue=N''true''' + CHAR(10) + char(13)
    print 'GO' + CHAR(10) + char(13)
    print 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''data access'', @optvalue=N''true''' + CHAR(10) + char(13)
    print 'GO' + CHAR(10) + char(13)
    print 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''rpc'', @optvalue=N''true''' + CHAR(10) + char(13)
    print 'GO' + CHAR(10) + char(13)
    print 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''rpc out'', @optvalue=N''true''' + CHAR(10) + char(13)
    print 'GO' + CHAR(10) + char(13)
	end
	FETCH NEXT FROM Linked INTO @srvname , @srvproduct , @providername , @datasource , @location , @providerstring 
END
CLOSE Linked
DEALLOCATE Linked
go
