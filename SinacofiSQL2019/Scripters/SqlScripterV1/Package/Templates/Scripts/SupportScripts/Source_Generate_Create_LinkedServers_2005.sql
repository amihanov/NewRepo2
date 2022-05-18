USE master
GO
-- Get Linked Servers
SET nocount ON
DECLARE @Mensaje varchar(950)
DECLARE @aux int, @aux2 int, @password varchar(30),@username varchar(30)
DECLARE @srvname varchar(4000), @srvproduct varchar(4000), @providername varchar(4000), @datasource varchar(4000)
SET @Mensaje = 'use master' + char(10) + char(13) + 'GO' + char(10) + char(13)
PRINT @Mensaje
DECLARE Linked CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR

SELECT srvname, ltrim(rtrim(srvproduct)), 'SQLNCLI11', ltrim(rtrim(datasource)) FROM sysservers WHERE srvid <> 0 

OPEN Linked
FETCH NEXT FROM Linked INTO @srvname , @srvproduct , @providername , @datasource
WHILE @@FETCH_STATUS = 0
BEGIN
	if @providername is null
	begin
		set @providername=''
	end
	if @datasource is null
	begin
		set @datasource=''
	end

	IF @srvproduct = 'SQL Server' OR @srvproduct = 'sql_server'
	begin 
		SET @Mensaje = 'if exists (select name from sys.servers where name =' + '''' + @srvname + ''')' + CHAR(10) + char(13)
		PRINT @Mensaje
		SET @Mensaje = 'exec sp_dropserver ' + '''' + @srvname + ''',''droplogins''' + CHAR(10) + char(13)
		PRINT @Mensaje
		SET @Mensaje = 'GO' + CHAR(10) + char(13)
		PRINT @Mensaje				
		SET @Mensaje = 'sp_addlinkedserver ' + '''' + @srvname + '''' + ',' + '''sql_server''' + ',' + '''' + @providername + '''' + ',' + '''' + @datasource + '''' + CHAR(10) + char(13)
		PRINT @Mensaje
		SET @Mensaje = 'GO' + CHAR(10) + char(13)
		PRINT @Mensaje
		SET @Mensaje = 'sp_addlinkedsrvlogin ' + '''' + @srvname + '''' + ',''True'',NULL,NULL,NULL' + CHAR(10) + char(13)
		PRINT @Mensaje
		SET @Mensaje = 'GO' + CHAR(10) + char(13)
		PRINT @Mensaje
	END
    PRINT 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''collation compatible'', @optvalue=N''false''' + CHAR(10) + char(13)
    PRINT 'GO' + CHAR(10) + char(13)
    PRINT 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''data access'', @optvalue=N''true''' + CHAR(10) + char(13)
    PRINT 'GO' + CHAR(10) + char(13)
    PRINT 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''rpc'', @optvalue=N''true''' + CHAR(10) + char(13)
    PRINT 'GO' + CHAR(10) + char(13)
    PRINT 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''rpc out'', @optvalue=N''true''' + CHAR(10) + char(13)
    PRINT 'GO' + CHAR(10) + char(13)
	PRINT 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''dist'', @optvalue=N''false''' + CHAR(10) + char(13)
    PRINT 'GO' + CHAR(10) + char(13)
	PRINT 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''pub'', @optvalue=N''false''' + CHAR(10) + char(13)
    PRINT 'GO' + CHAR(10) + char(13)
    PRINT 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''sub'', @optvalue=N''false''' + CHAR(10) + char(13)
    PRINT 'GO' + CHAR(10) + char(13)
    PRINT 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''connect timeout'', @optvalue=N''0''' + CHAR(10) + char(13)
    PRINT 'GO' + CHAR(10) + char(13)
    PRINT 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''collation name'', @optvalue=null' + CHAR(10) + char(13)
    PRINT 'GO' + CHAR(10) + char(13)
    PRINT 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''lazy schema validation'', @optvalue=N''true''' + CHAR(10) + char(13)
    PRINT 'GO' + CHAR(10) + char(13)
    PRINT 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''query timeout'', @optvalue=N''0''' + CHAR(10) + char(13)
    PRINT 'GO' + CHAR(10) + char(13)
    PRINT 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''use remote collation'', @optvalue=N''true''' + CHAR(10) + char(13)
    PRINT 'GO' + CHAR(10) + char(13)
    PRINT 'EXEC master.dbo.sp_serveroption @server=N''' + @srvname + ''', @optname=N''remote proc transaction promotion'', @optvalue=N''true''' + CHAR(10) + char(13)
    PRINT 'GO' + CHAR(10) + char(13)

	FETCH NEXT FROM Linked INTO @srvname , @srvproduct , @providername , @datasource
END
CLOSE Linked
DEALLOCATE Linked
GO