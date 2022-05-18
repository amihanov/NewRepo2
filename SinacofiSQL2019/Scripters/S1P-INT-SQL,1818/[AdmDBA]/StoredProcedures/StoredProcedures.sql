
GO
--SqlScripter----[dbo].[spAvisoCambioPassword].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spAvisoCambioPassword]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spAvisoCambioPassword] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spAvisoCambioPassword]
AS
declare @dtFechaUltimoCambio datetime
declare @vcAsunto varchar(255)
declare @vcProfileName varchar(255)
declare @vcLoginName varchar(50)
declare @vcServerName varchar(50) 
DECLARE @vcLoginExpirado varchar(2500)
declare @vcHtmlMsj varchar(4048)

select @vcServerName = rtrim(@@servername)

declare curLogin cursor for 
SELECT  p.name AS [loginname],
        s.updatedate AS [updatedate]
FROM    sys.server_principals p
        JOIN sys.syslogins s ON p.sid = s.sid
WHERE   p.type_desc IN ('SQL_LOGIN')
        -- Logins that are not process logins
        AND p.name NOT LIKE 'ope_m%'  AND p.name NOT LIKE 'ope_r%' and p.name  NOT LIKE 'ope_d%'
        -- Logins that are sysadmins
        AND s.sysadmin = 1
        and is_disabled = 0;

select @vcProfileName = name from msdb..sysmail_profile

Open curLogin
Fetch next from curLogin into @vcLoginName, @dtFechaUltimoCambio

WHILE @@FETCH_STATUS = 0
BEGIN

if DATEDIFF(day, @dtFechaUltimoCambio, getdate()) >= 45 and @vcLoginName <> 'ope_sa'
BEGIN

SET @vcAsunto = 'La cuenta ' + @vcLoginName + ' Expiro'

SET @vcLoginExpirado = '<div style="font-family:Verdana;font-size:18px">
         <p>CUENTA EXPIRADA</p>' +'<table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="15%"> <strong>LOGIN NAME</strong></td>
         <td width="15%"> <strong>FECHA EXPIRACION</strong></td>
         </tr>'
    SET @vcLoginExpirado = @vcLoginExpirado + '
         <tr style="
         FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >' + @vcLoginName   + '</td>
         <td>' +  convert(varchar(20),@dtFechaUltimoCambio) + '</td>
         </tr>'

SET @vcHtmlMsj = N'<HTML><P>' + @vcLoginExpirado + N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109)) + '.'
 + '</p>'
                exec  msdb..sp_send_dbmail
                @profile_name = @vcProfileName,
                --@recipients = N'nhuenul@sinacofi.cl', 
                @recipients = N'basedatos.chile@experian.com', 
                @importance  = N'HIGH',
                @subject  = @vcAsunto,
                @body = @vcHtmlMsj,
                @body_format  = N'HTML'
END

if DATEDIFF(day, @dtFechaUltimoCambio, getdate()) >=90 and @vcLoginName = 'ope_sa'
BEGIN

SET @vcAsunto = 'La cuenta ' + @vcLoginName + ' Expiro'

SET @vcLoginExpirado = '<div style="font-family:Verdana;font-size:18px">
         <p>CUENTA EXPIRADA</p>' +'<table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="15%"> <strong>LOGIN NAME</strong></td>
         <td width="15%"> <strong>FECHA EXPIRACION</strong></td>
         </tr>'
    SET @vcLoginExpirado = @vcLoginExpirado + '
         <tr style="
         FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >' + @vcLoginName   + '</td>
         <td>' +  convert(varchar(20),@dtFechaUltimoCambio) + '</td>
         </tr>'

SET @vcHtmlMsj = N'<HTML><P>' + @vcLoginExpirado + N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109)) + '.'
 + '</p>'
                exec  msdb..sp_send_dbmail
                @profile_name = @vcProfileName,
                --@recipients = N'nhuenul@sinacofi.cl', 
                @recipients = N'basedatos.chile@experian.com', 
                @importance  = N'HIGH',
                @subject  = @vcAsunto,
                @body = @vcHtmlMsj,
                @body_format  = N'HTML'
END


fetch next from curLogin into @vcLoginName, @dtFechaUltimoCambio
END
CLOSE curLogin
DEALLOCATE curLogin
GO

GO
--SqlScripter----[dbo].[spBackupDatabases].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spBackupDatabases]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spBackupDatabases] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spBackupDatabases]
--/****************************************************************************/
--/*Nombre         : spBackupDatabases                                        */
--/*Autor          : Nicolas Huenul Mansilla                                  */
--/*Descripci¿n    : Backup database                                          */
--/*                                                                          */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 01-Julio-2013 10:00                                      */
--/*Versi¿n        : V01.00-000                                               */
--/*Bitacora       :                                                          */
--/****************************************************************************/

AS

DECLARE @dtFecha datetime
DECLARE @vcProfileName varchar(20)
DECLARE @vcDatabaseName varchar(30)
DECLARE @vcFileName varchar(500)
DECLARE @vcAsunto varchar(200)
DECLARE @vcReporteBackup varchar(max)
DECLARE @MailSubject varchar(max)
DECLARE @dtStarTime datetime
DECLARE @dtEndTime datetime
DECLARE @iSeg int
DECLARE @iSiRespaldo int

select @vcProfileName = name from msdb..sysmail_profile

set @dtFecha = CONVERT(VARCHAR(26),GETDATE(), 109)

SET @vcAsunto = '['+ @@servername +'] REPORTE BACKUP DATABASES'

/********* CURSOR ONLINE DATABASE ***********************/
declare curDatabases cursor for 
select name from master..sysdatabases 
--where status & 512  = 0 and dbid > 5 and name in('AdmDBA','Swsnew')
where status & 512  = 0 and name not in('tempdb')
order by name asc;


SET @vcReporteBackup = '<div style="font-family:Verdana;font-size:18px">
         <p>REPORTE DE RESPALDO DE BASE DE DATOS</p>
         <table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="5%"> <strong>Fecha</strong></td>
         <td width="5%"> <strong>Database</strong></td>
		 <td width="5%"> <strong>Duracion</strong></td>
         <td width="5%"> <strong>File</strong></td>
         </tr>'

Open curDatabases
Fetch next from curDatabases into @vcDatabaseName

WHILE @@FETCH_STATUS = 0

BEGIN

SET @iSiRespaldo = (SELECT [master].sys.fn_hadr_backup_is_preferred_replica(@vcDatabaseName))

IF (@iSiRespaldo = 1)
BEGIN
SET @dtStarTime = GETDATE()
set @vcFileName = 'L:\BACKUP\BackupDatabases\' + @vcDatabaseName + '_' + convert(varchar(23), getdate(), 112) + '.bak'

BACKUP DATABASE @vcDatabaseName TO DISK = @vcFileName WITH COMPRESSION,CHECKSUM,CONTINUE_AFTER_ERROR;

RESTORE VERIFYONLY FROM DISK = @vcFileName

SET @dtEndTime = GETDATE()
SET @iSeg = DATEDIFF(ss, @dtStarTime, @dtEndTime)

    SET @vcReporteBackup = @vcReporteBackup + '
         <tr style="
         FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td>' + convert(varchar,@dtFecha) + '</td>
         <td>' +  @vcDatabaseName + '</td>
		 <td>' +  convert(varchar,@iSeg) + '</td>
         <td>' + @vcFileName + '</td>
         </tr>'
END
Fetch next from curDatabases into @vcDatabaseName

END
CLOSE curDatabases
DEALLOCATE curDatabases

SET @vcReporteBackup = N'<HTML><P>' + @vcReporteBackup +  N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109)) + '.'
 + '</p>'
           
exec  msdb..sp_send_dbmail
	@profile_name = @vcProfileName,
    --@recipients = N'svasquez@sinacofi.cl', 
    --@recipients = N'area_base_datos@sinacofi.cl',
    @recipients = N'basedatos.chile@experian.com',
	@importance  = N'HIGH',
    @subject  = @vcAsunto,
    @body = @vcReporteBackup,
    @body_format  = N'HTML'
GO

GO
--SqlScripter----[dbo].[spMonitorAuditoria].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spMonitorAuditoria]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spMonitorAuditoria] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spMonitorAuditoria]
AS

DECLARE @vcProfileName varchar(20)
DECLARE @vcMensaje varchar(max)
DECLARE @vcAsunto varchar(200)
DECLARE @iAuditEnable int
DECLARE @iEventEnable int


SET @vcAsunto = '['+ @@servername +'] AUDITORIA DESACTIVADA'

select @vcProfileName = name from msdb..sysmail_profile

select @iAuditEnable=is_state_enabled from sys.server_audits

select @iEventEnable=is_state_enabled from sys.server_audit_specifications

IF @iAuditEnable = 0 or @iEventEnable = 0
BEGIN

SET @vcMensaje = '<div style="font-family:Verdana;font-size:18px">
         <p>AUDITORIA DESACTIVADA</p>
         <table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="5%"> <strong>Fecha</strong></td>
         <td width="5%"> <strong>Audit</strong></td>
         <td width="5%"> <strong>EventosAuditados</strong></td>
         </tr>
		 <tr style="
         FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td>' +  convert(varchar(20),getdate()) + '</td>
         <td>' +  convert(varchar(20),@iAuditEnable) + '</td>
         <td>' +  convert(varchar(20),@iEventEnable) + '</td>
         </tr>'

		 
		          
SET @vcMensaje = N'<HTML><P>' + @vcMensaje +  N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109)) + '.'
 + '</p>'
           
exec  msdb..sp_send_dbmail
	@profile_name = @vcProfileName,
    --@recipients = N'nhuenul@sinacofi.cl', 
    --@recipients = N'area_base_datos@sinacofi.cl', 
    --@copy_recipients =N'area_base_datos@sinacofi.cl',
    @recipients = N'basedatos.chile@experian.com',
	@importance  = N'HIGH',
    @subject  = @vcAsunto,
    @body = @vcMensaje,
    @body_format  = N'HTML'

END
GO

GO
--SqlScripter----[dbo].[spMonitorErrorLog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spMonitorErrorLog]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spMonitorErrorLog] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spMonitorErrorLog]
--/****************************************************************************/
--/*Nombre         : SP_MonitorErrorLog                                       */
--/*Autor          : Nicolas Huenul Mansilla                                  */
--/*Descripcion    : ERRORES DEL ERROR LOG                                    */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creacion : 31-Julio-2014 10:00                                      */
--/*Version        : V01.00-000                                               */
--/*Bitacora       :                                                          */
--/****************************************************************************/
AS
DECLARE @vcAsunto varchar(200)
DECLARE @vcFechaInicio varchar(50)
DECLARE @vcFechaFin varchar(50)
DECLARE @vcLogDate varchar(50)
DECLARE @vcProfileName varchar(20)
DECLARE @vcProcessInfor varchar(10)
DECLARE @vcReporteErrorLog varchar(max)
DECLARE @vcText varchar(max)
DECLARE @iCount int

SET @vcAsunto = '['+ @@servername +'] ERROR LOG - ['+ (select CONVERT(VARCHAR(10), GETDATE(), 101) + ' ' + CONVERT(VARCHAR(8), GETDATE(), 108) ) + ']'

SELECT @vcFechaInicio = convert(varchar(50),DATEADD(minute, -10, GETDATE()))
SELECT @vcFechaFin = convert(varchar(50),GETDATE())

select @vcProfileName = name from msdb..sysmail_profile

CREATE TABLE #tmpErrorLog
(
   vcLogDate varchar(50),
   vcProcessInfor varchar(50),
   vcText  varchar(max)
)
/*
insert into #tmpErrorLog
exec xp_readerrorlog 0,1,'fail',NULL,@vcFechaInicio,@vcFechaFin
*/
insert into #tmpErrorLog
exec xp_readerrorlog 0,1,"error",NULL,@vcFechaInicio,@vcFechaFin

SELECT @iCount = COUNT(1) FROM #tmpErrorLog;    

IF @iCount > 0
BEGIN

declare curErrorLog cursor for 
select vcLogDate,
       vcProcessInfor,
       vcText
from #tmpErrorLog
order by 1 asc OPTION (RECOMPILE);

SET @vcReporteErrorLog = '<div style="font-family:Verdana;font-size:18px">
         <p>ERRORES EN LOS ULTIMOS 10 MINUTOS</p>
         <table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="5%"> <strong>Log Date</strong></td>
         <td width="5%"> <strong>ProcessInfo</strong></td>
         <td width="50%"> <strong>Text</strong></td>
         </tr>'

Open curErrorLog
Fetch next from curErrorLog into @vcLogDate, @vcProcessInfor, @vcText

WHILE @@FETCH_STATUS = 0

BEGIN
    SET @vcReporteErrorLog = @vcReporteErrorLog + '
         <tr style="
         FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >' + @vcLogDate   + '</td>
         <td>' +  @vcProcessInfor + '</td>
         <td>' +  @vcText + '</td>
         </tr>'
         
fetch next from curErrorLog into @vcLogDate, @vcProcessInfor, @vcText
END
CLOSE curErrorLog
DEALLOCATE curErrorLog

SET @vcReporteErrorLog = N'<HTML><P>' + @vcReporteErrorLog +  N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109)) + '.'
 + '</p>'
           
exec  msdb..sp_send_dbmail
	@profile_name = @vcProfileName,
    --@recipients = N'nhuenul@sinacofi.cl', 
    --@recipients = N'area_base_datos@sinacofi.cl', 
    @recipients = N'basedatos.chile@experian.com',
	@importance  = N'HIGH',
    @subject  = @vcAsunto,
    @body = @vcReporteErrorLog,
    @body_format  = N'HTML'
END
GO

GO
--SqlScripter----[dbo].[spMonitorEspacioBD].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spMonitorEspacioBD]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spMonitorEspacioBD] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spMonitorEspacioBD]
AS

DECLARE @vcReporteEspacio varchar(max)
DECLARE @vcProfileName varchar(255)
DECLARE @vcDbName varchar(255)
DECLARE @flFileSize float
DECLARE @flSpaceUsed float
DECLARE @flPerUsed float
DECLARE @vcAsunto varchar(200)
DECLARE @iCount int = 0
DECLARE @iUmbral int = 60

select @vcProfileName = name from msdb..sysmail_profile
SET @vcAsunto = '['+ @@servername +'] UMBRAL DE ESPACIO SUPERADO ' + convert(varchar(20),@iUmbral) + '%'

create table #tblDbSize
(Dbname sysname,
 vcdbstatus varchar(50),
 vcRecoveryModel varchar(40) default ('NA'), 
 flFileSizeMB float default (0),
 flSpaceUsedMB float default (0),
 flFreeSpaceMB float default (0),
 vcVolumen varchar(10),
 flTotalSpace float,
 flAvailableSpace float,
 flPercentageAvailable float
 );

 insert into #tblDbSize(Dbname,vcdbstatus,vcRecoveryModel,flFileSizeMB,flSpaceUsedMB,flFreeSpaceMB,vcVolumen,flTotalSpace,flAvailableSpace,flPercentageAvailable) 
exec sp_msforeachdb 
'use [?]; 
  select DB_NAME() AS DbName, 
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Status'')) ,  
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Recovery'')),  
    d.size/128.0 AS File_MB, 
    CAST(FILEPROPERTY(d.name, ''SpaceUsed'') AS INT)/128.0 as Space_Used_MB, 
    d.size/128.0 - CAST(FILEPROPERTY(d.name,''SpaceUsed'') AS INT)/128.0 AS Free_Space_MB,
    vs.volume_mount_point as vol, 
    vs.total_bytes/1024/1024/1024 AS [Total GB], 
    vs.available_bytes/1024/1024/1024 AS [Available GB], 
    (((vs.total_bytes-available_bytes)*100)/vs.total_bytes) AS [Space Used %]
from sys.database_files d inner join sys.master_files m on d.file_id = m.file_id
CROSS APPLY sys.dm_os_volume_stats(DB_ID(), m.file_id) AS vs
where d.type=0 
--and m.database_id NOT IN (1,2,3,4,5)
group by d.size/128.0,
      CAST(FILEPROPERTY(d.name, ''SpaceUsed'') AS INT)/128.0,
      d.type,vs.volume_mount_point,vs.total_bytes,vs.available_bytes';

SET @vcReporteEspacio = '<div style="font-family:Verdana;font-size:18px">
         <p>UMBRAL DE ESPACIO SUPERADO</p>
         <table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="15%"> <strong>Nombre BD</strong></td>
         <td width="15%"> <strong>Tamaño Base MB</strong></td>
         <td width="15%"> <strong>Usado MB</strong></td>
         <td width="15%"> <strong>% de Uso</strong></td>
         <td width="15%"> <strong>Fecha / Hora</strong></td>
         </tr>'
         
declare curDBspace cursor for
SELECT Dbname,flFileSizeMB,flSpaceUsedMB,(flSpaceUsedMB*100)/flFileSizeMB perc FROM #tblDbSize 
where (flSpaceUsedMB*100)/flFileSizeMB > 0

Open curDBspace
Fetch next from curDBspace into @vcDbName, @flFileSize , @flSpaceUsed, @flPerUsed
WHILE @@FETCH_STATUS = 0

BEGIN
IF @flPerUsed > 80
BEGIN
    SET @vcReporteEspacio = @vcReporteEspacio + '
         <tr style="FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >' + @vcDbName + '</td>
         <td>' + convert(varchar(20),@flFileSize) + '</td>
         <td>' + convert(varchar(20),@flSpaceUsed) + '</td>
         <td>' + convert(varchar(20),@flPerUsed) + '</td>
         <td>' + convert(varchar(50),GETDATE(),113) + '</td>
         </tr>'
set @iCount = @iCount + 1;    
END    
fetch next from curDBspace into @vcDbName, @flFileSize , @flSpaceUsed, @flPerUsed
END
CLOSE curDBspace
DEALLOCATE curDBspace

SET @vcReporteEspacio = N'<HTML><P>' + @vcReporteEspacio +  N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109)) + '.'
 + '</p>'

 IF @iCount > 0
 BEGIN
                set @vcReporteEspacio = @vcReporteEspacio + N'</P></HTML>'
                exec  msdb..sp_send_dbmail
                @profile_name = @vcProfileName,
                --@recipients = N'area_base_datos@sinacofi.cl', 
				--@recipients = N'nhuenul@sinacofi.cl', 
                @recipients = N'basedatos.chile@experian.com',
				@importance  = N'HIGH',
                @subject  = @vcAsunto,
                @body =  @vcReporteEspacio,
                @body_format  = N'HTML'
END
GO

GO
--SqlScripter----[dbo].[spMonitorEspacioBDLog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spMonitorEspacioBDLog]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spMonitorEspacioBDLog] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spMonitorEspacioBDLog]
AS

DECLARE @vcReporteEspacio varchar(max)
DECLARE @vcProfileName varchar(255)
DECLARE @vcDbName varchar(255)
DECLARE @flFileSize float
DECLARE @flSpaceUsed float
DECLARE @flPerUsed float
DECLARE @vcAsunto varchar(200)
DECLARE @iCount int = 0
DECLARE @iUmbral int = 50
DECLARE @nvcDBCC nvarchar(1024)
select @vcProfileName = name from msdb..sysmail_profile
SET @vcAsunto = '['+ @@servername +'] UMBRAL DE ESPACIO SUPERADO ' + convert(varchar(20),@iUmbral) + '%'

set @nvcDBCC ='DBCC SQLPERF(LOGSPACE)'

create table #tblDbLogSize
(Dbname sysname,
 flFileSizeMB float default (0),
 flPerSpaceUsed float default (0),
 iStatus int
 );

 insert into #tblDbLogSize 
 exec master..sp_executesql @nvcDBCC
  

SET @vcReporteEspacio = '<div style="font-family:Verdana;font-size:18px">
         <p>UMBRAL DE ESPACIO SUPERADO PARA LOG BD</p>
         <table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="15%"> <strong>Nombre BD</strong></td>
         <td width="15%"> <strong>Tamaño Log Base MB</strong></td>
         <td width="15%"> <strong>% de Uso</strong></td>
         <td width="15%"> <strong>Fecha / Hora</strong></td>
         </tr>'
         
declare curDBspace cursor for
SELECT Dbname,flFileSizeMB,flPerSpaceUsed FROM #tblDbLogSize 
where flPerSpaceUsed > @iUmbral

Open curDBspace
Fetch next from curDBspace into @vcDbName, @flFileSize , @flPerUsed
WHILE @@FETCH_STATUS = 0

BEGIN

IF @flPerUsed > 65
BEGIN
    SET @vcReporteEspacio = @vcReporteEspacio + '
         <tr style="FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >' + @vcDbName + '</td>
         <td>' + convert(varchar(20),@flFileSize) + '</td>
         <td>' + convert(varchar(20),@flPerUsed) + '</td>
         <td>' + convert(varchar(50),GETDATE(),113) + '</td>
         </tr>'
set @iCount = @iCount + 1;     
END   

fetch next from curDBspace into @vcDbName, @flFileSize , @flFileSize
END

CLOSE curDBspace
DEALLOCATE curDBspace

SET @vcReporteEspacio = N'<HTML><P>' + @vcReporteEspacio +  N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109)) + '.'
 + '</p>'

 IF @iCount > 0
 BEGIN
                set @vcReporteEspacio = @vcReporteEspacio + N'</P></HTML>'
                exec  msdb..sp_send_dbmail
                @profile_name = @vcProfileName,
                --@recipients = N'area_base_datos@sinacofi.cl', 
				--@recipients = N'nhuenul@sinacofi.cl', 
                @recipients = N'basedatos.chile@experian.com',
				@importance  = N'HIGH',
                @subject  = @vcAsunto,
                @body =  @vcReporteEspacio,
                @body_format  = N'HTML'
END
GO

GO
--SqlScripter----[dbo].[spMonitorJobFallido].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spMonitorJobFallido]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spMonitorJobFallido] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spMonitorJobFallido]
AS
declare @vcProfileName varchar(50)
declare @vcServerName varchar(50)
declare @vcEstado varchar(50)
declare @vcJobName varchar(50)
declare @dtUltimaEjecucion datetime
declare @vcHtmlMsj varchar(4048)
DECLARE @vcAsunto varchar(200)
DECLARE @vcReporteJobError varchar(max)
DECLARE @iCount int = 0

select @vcServerName = @@SERVERNAME
select @vcProfileName = name from msdb..sysmail_profile

SET @vcAsunto = '['+ @@servername +'] JOB CON ERROR - ['+ (select CONVERT(VARCHAR(10), GETDATE(), 101) + ' ' + CONVERT(VARCHAR(8), GETDATE(), 108) ) + ']'

declare curJob cursor for 
select a.name, 
        CASE last_run_outcome
        WHEN 0 THEN 'Failed'
        WHEN 1 THEN 'Succeeded'
        WHEN 2 THEN 'Retry'
        WHEN 3 THEN 'Canceled'
        WHEN 4 THEN 'Running' -- In Progress
      END AS [LastRunStatus],
	  --last_run_date,last_run_time
      msdb.dbo.agent_datetime(last_run_date,last_run_time) last_run
from msdb..sysjobs a, msdb..sysjobsteps b
where a.job_id = b.job_id and a.enabled = 1 
and last_run_outcome in (0,3) and last_run_date <>0
  --and (last_run_outcome = 0 or last_run_outcome = 3)
--and msdb.dbo.agent_datetime(last_run_date,last_run_time) >= DATEADD(HOUR, -1, GETDATE());

SET @vcReporteJobError = '<div style="font-family:Verdana;font-size:18px">
         <p>JOB CON ERRORES EN LOS ULTIMOS 10 MINUTOS</p>
         <table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="5%"> <strong>Job</strong></td>
         <td width="5%"> <strong>Ultima Ejecucion</strong></td>
         <td width="50%"> <strong>Estado</strong></td>
         </tr>'

Open curJob
Fetch next from curJob into @vcJobName, @vcEstado, @dtUltimaEjecucion

WHILE @@FETCH_STATUS = 0
BEGIN

    SET @vcReporteJobError = @vcReporteJobError + '
         <tr style="
         FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >' + @vcJobName   + '</td>
         <td>' +  convert(varchar(20),@dtUltimaEjecucion) + '</td>
         <td>' +  @vcEstado + '</td>
         </tr>'
set @iCount = @iCount + 1
fetch next from curJob into  @vcJobName, @vcEstado, @dtUltimaEjecucion
END
CLOSE curJob
DEALLOCATE curJob

SET @vcReporteJobError = N'<HTML><P>' + @vcReporteJobError +  N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109)) + '.'
 + '</p>'

IF @iCount > 0
  
exec  msdb..sp_send_dbmail
	@profile_name = @vcProfileName,
    --@recipients = N'nhuenul@sinacofi.cl', 
    --@recipients = N'area_base_datos@sinacofi.cl', 
    @recipients = N'basedatos.chile@experian.com',
	@importance  = N'HIGH',
    @subject  = @vcAsunto,
    @body = @vcReporteJobError,
    @body_format  = N'HTML'
GO

GO
--SqlScripter----[dbo].[spMonitorLoginFail].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spMonitorLoginFail]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spMonitorLoginFail] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spMonitorLoginFail]
--/****************************************************************************/
--/*Nombre         : SP_MonitorErrorLog                                       */
--/*Autor          : Nicolas Huenul Mansilla                                  */
--/*Descripcion    : ERRORES DEL ERROR LOG                                    */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creacion : 31-Julio-2014 10:00                                      */
--/*Version        : V01.00-000                                               */
--/*Bitacora       :                                                          */
--/****************************************************************************/
AS
DECLARE @vcAsunto varchar(200)
DECLARE @vcFechaInicio varchar(50)
DECLARE @vcFechaFin varchar(50)
DECLARE @vcLogDate varchar(50)
DECLARE @vcProfileName varchar(20)
DECLARE @vcProcessInfor varchar(10)
DECLARE @vcReporteErrorLog varchar(max)
DECLARE @vcText varchar(max)
DECLARE @iCount int

SET @vcAsunto = '['+ @@servername +'] LOGIN FAILED'

SELECT @vcFechaInicio = convert(varchar(50),DATEADD(minute, -5, GETDATE()))
SELECT @vcFechaFin = convert(varchar(50),GETDATE())

select @vcProfileName = name from msdb..sysmail_profile

CREATE TABLE #tmpErrorLog
(
   vcLogDate varchar(50),
   vcProcessInfor varchar(50),
   vcText  varchar(max)
)

/*
insert into #tmpErrorLog
exec xp_readerrorlog 0,1,'fail',NULL,@vcFechaInicio,@vcFechaFin
*/

/*
DECLARE @vcFechaInicio varchar(50)
DECLARE @vcFechaFin varchar(50)
SELECT @vcFechaInicio = convert(varchar(50),DATEADD(minute, -5, GETDATE()))
SELECT @vcFechaFin = convert(varchar(50),GETDATE())

EXEC xp_readerrorlog 0, 1,Login,NULL,@vcFechaInicio,@vcFechaFin
*/

insert into #tmpErrorLog
EXEC xp_readerrorlog 0, 1,"Login failed",NULL,@vcFechaInicio,@vcFechaFin


SELECT @iCount = COUNT(1) FROM #tmpErrorLog;    

IF @iCount > 4
BEGIN

declare curErrorLog cursor for 
select vcLogDate,
       vcProcessInfor,
       vcText
from #tmpErrorLog
order by 1 asc OPTION (RECOMPILE);

SET @vcReporteErrorLog = '<div style="font-family:Verdana;font-size:18px">
         <p>LOGIN FAILED EN LOS ULTIMOS 5 MINUTOS</p>
         <table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="5%"> <strong>Log Date</strong></td>
         <td width="5%"> <strong>ProcessInfo</strong></td>
         <td width="50%"> <strong>Text</strong></td>
         </tr>'

Open curErrorLog
Fetch next from curErrorLog into @vcLogDate, @vcProcessInfor, @vcText

WHILE @@FETCH_STATUS = 0

BEGIN
    SET @vcReporteErrorLog = @vcReporteErrorLog + '
         <tr style="
         FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >' + @vcLogDate   + '</td>
         <td>' +  @vcProcessInfor + '</td>
         <td>' +  @vcText + '</td>
         </tr>'
         
fetch next from curErrorLog into @vcLogDate, @vcProcessInfor, @vcText
END
CLOSE curErrorLog
DEALLOCATE curErrorLog

SET @vcReporteErrorLog = N'<HTML><P>' + @vcReporteErrorLog +  N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109)) + '.'
 + '</p>'
           
exec  msdb..sp_send_dbmail
	@profile_name = @vcProfileName,
    --@recipients = N'nhuenul@sinacofi.cl', 
    --@recipients = N'seginfo@sinacofi.cl;mantenimientocorrectivo@sinacofi.cl',
    --@copy_recipients =N'area_base_datos@sinacofi.cl',
    @recipients = N'seguridad.chile@experian.com;mantenimientocorrectivo.cl@experian.com;seginfo@sinacofi.cl', 
    @copy_recipients =N'basedatos.chile@experian.com',
    @importance  = N'HIGH',
    @subject  = @vcAsunto,
    @body = @vcReporteErrorLog,
    @body_format  = N'HTML'
END
GO

GO
--SqlScripter----[dbo].[spMonitorSesiones].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spMonitorSesiones]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spMonitorSesiones] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spMonitorSesiones]
--/****************************************************************************/
--/*Nombre         : SP_CUENTA_SESIONES                                       */
--/*Autor          : Nicolas Huenul Mansilla                                  */
--/*Descripci¿n    : Elimina registros de tabla  dbo.sysmail_mailitems y      */
--/*                 dbo.sysmail_log                                          */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 01-Julio-2013 10:00                                      */
--/*Versi¿n        : V01.00-000                                               */
--/*Bitacora       :                                                          */
--/****************************************************************************/

AS
DECLARE @vcLoginName varchar(30)
DECLARE @vcHostName varchar(30)
DECLARE @vcDBName varchar(30)
DECLARE @iNumberOfConnections int
DECLARE @iCountSession int
DECLARE @vcReporteSesiones varchar(max)
DECLARE @vcAlertaSesiones varchar(max)
DECLARE @vcProfileName varchar(20)
DECLARE @MailSubject varchar(max)
DECLARE @iCantidadSesiones int

/********* CURSOR SESIONES***********************/
declare curSession cursor for 
SELECT login_name,
       --host_name, 
       CASE WHEN host_name IS NULL THEN '' ELSE host_name END,
       COUNT(session_id)
FROM sys.dm_exec_sessions WITH (NOLOCK)
--WHERE session_id > 50	
--where login_name <> 'sa'
GROUP BY login_name,host_name
ORDER BY COUNT(session_id) DESC OPTION (RECOMPILE);

SELECT @iCountSession = COUNT(1) FROM sys.dm_exec_sessions;    
--SELECT @iCountSession = COUNT(dbid) FROM sys.sysprocesses;    
select @vcProfileName = name from msdb..sysmail_profile

IF @iCountSession > 200
BEGIN

SET @MailSubject = '[' + @@servername + '] ALERTA CANTIDAD DE SESIONES - ' + convert(varchar(20),@iCountSession)

SET @vcReporteSesiones = '<div style="font-family:Verdana;font-size:18px">
         <p>ESTADISTICAS DE SESIONES ACTIVAS - ' + convert(varchar(20),@iCountSession)+ '</p><table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="15%"> <strong>LOGIN NAME</strong></td>
         <td width="15%"> <strong>HOSTNAME</strong></td>
         <td width="15%"> <strong>CANTIDAD DE SESIONES</strong></td>
         </tr>'
        
Open curSession
Fetch next from curSession into @vcLoginName, @vcHostName, @iCantidadSesiones

WHILE @@FETCH_STATUS = 0

BEGIN
    SET @vcReporteSesiones = @vcReporteSesiones + '
         <tr style="
         FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >' + @vcLoginName   + '</td>
         <td>' +  @vcHostName + '</td>
         <td>' +  convert(varchar(20),@iCantidadSesiones) + '</td>
         </tr>'
fetch next from curSession into @vcLoginName, @vcHostName, @iCantidadSesiones
END
CLOSE curSession
DEALLOCATE curSession

SET @vcReporteSesiones = @vcReporteSesiones + N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109))
 + '.'
 + '</p>'

       exec  msdb..sp_send_dbmail
       @profile_name = @vcProfileName,
       --@recipients = N'nhuenul@sinacofi.cl', 
       --@recipients = N'area_base_datos@sinacofi.cl', 
       @recipients = N'basedatos.chile@experian.com',
	   @importance  = N'HIGH',
       @subject  = @MailSubject,
       @body = @vcReporteSesiones,
       @body_format  = N'HTML'
END
GO

GO
--SqlScripter----[dbo].[spPurgeMail].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spPurgeMail]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spPurgeMail] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spPurgeMail]
--/****************************************************************************/
--/*Nombre         : SP_CUENTA_SESIONES                                       */
--/*Autor          : Nicolas Huenul Mansilla                                  */
--/*Descripci¿n    : Elimina registros de tabla  dbo.sysmail_mailitems y      */
--/*                 dbo.sysmail_log                                          */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 01-Julio-2013 10:00                                      */
--/*Versi¿n        : V01.00-000                                               */
--/*Bitacora       :                                                          */
--/****************************************************************************/

AS
DECLARE @dtDeleteBeforeDate DATETIME  

 
SELECT @dtDeleteBeforeDate = Dateadd(d, -30, Getdate())  
 
EXEC msdb..sysmail_delete_mailitems_sp  
  
@sent_before = @dtDeleteBeforeDate  

--SELECT @DeleteBeforeDate = Dateadd(d, -10, Getdate())  
 
EXEC msdb..sysmail_delete_log_sp  

@logged_before = @dtDeleteBeforeDate
GO

GO
--SqlScripter----[dbo].[spSpaceDisc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spSpaceDisc]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spSpaceDisc] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spSpaceDisc]
AS
/*
Pasos:
1.drop table tb_drives 
  drop table tmp_drives
Create table tb_drives (disco  char(1), SizeInicial int default 0, SizeRealMB int, fecha datetime)
Create table tmp_drives (disco  char(1),  SizeRealMB int)

2. declare @MySql nvarchar(1024)
set @MySql = 'exec xp_fixeddrives'
insert into tb_drives (disco,SizeRealMB)
exec sp_executesql @MySql

3. Actualiza valores asignados total
update tb_drives
set SizeInicial = 122880 --120 GB * 1024
where disco = 'C'

update tb_drives
set SizeInicial = 203776 --199 GB * 1024
where disco = 'E'

update tb_drives
set SizeInicial = 81818 --79,9 GB * 1024
where disco = 'F'

update tb_drives
set SizeInicial = 203776 --199 GB * 1024
where disco = 'G'

update tb_drives
set SizeInicial = 51098 --49,9 GB * 1024
where disco = 'H'

update tb_drives
set SizeInicial = 51098 --49,9 GB * 1024
where disco = 'I'
*/

set nocount on
declare @MySql nvarchar(1024)
declare @disco char(1)
declare @MB int
declare @asig int
declare @porcenusado int
declare @men   nvarchar(1024)
DECLARE @ENVIAR_MENSAJE char(1)
DECLARE @HTML_MENSAJE varchar(4048)
DECLARE @MENSAJE varchar(4048) 
DECLARE @vcProfileName varchar(255)

select @vcProfileName = name from msdb..sysmail_profile
set @MENSAJE=''
set @HTML_MENSAJE=''

set @MySql = 'exec master..xp_fixeddrives'
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tmp_drives]') AND type in (N'U'))
    TRUNCATE TABLE [dbo].[tmp_drives]
insert into tmp_drives (disco,SizeRealMB)
exec sp_executesql @MySql
DECLARE Disco CURSOR
FOR
   SELECT disco, SizeRealMB FROM tmp_drives
   OPEN Disco
   FETCH NEXT FROM Disco into @disco,@MB
   WHILE @@FETCH_STATUS = 0
   BEGIN
        update tb_drives
        set SizeRealMB = @MB, 
        fecha =GETDATE()
        where disco = @disco
        --select  @disco as discooo
        
        FETCH NEXT FROM Disco into @disco,@MB
   END
   CLOSE Disco
   DEALLOCATE Disco

declare discspace cursor for 
   SELECT disco,SizeInicial,SizeRealMB FROM tb_drives 
   set @ENVIAR_MENSAJE = 'N'
   SET @MENSAJE = '<html><head><TITLE>Department Report</TITLE>
                    </head><body><p>
                    <font style="font-family:Tahoma;FONT-WEIGHT: bold; FONT-SIZE: 13px;COLOR: #023962">Alerta de Espacio en Disco, Servidor 
                    <table  width="70%" style="border-collapse: collapse; border-top: 3px solid #cce49d">
                    <tr><td></td></tr></table></font>' + @@servername + '</p>'
--print @MENSAJE
open discspace fetch next from discspace into @disco, @asig , @MB
          SET @MENSAJE = @MENSAJE + '<br>' +'<table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #023962;FONT-FAMILY:Tahoma; bACKGROUND-COLOR: #cce49d;TEXT-ALIGN: center">
         <td width="15%"> <strong>Nombre BD</strong></td>
         <td width="15%"> <strong>% de Espacio Ocupado</strong></td>
         <td width="15%"> <strong>Fecha</strong></td>
         </tr>'

 WHILE @@FETCH_STATUS = 0 
BEGIN
   select @porcenusado = (@asig - @MB)*100/@asig 
  -- select @asig as asig, @MB as mb, @porcenusado
   --select @porcenusado
   IF @porcenusado > 80-- and @porcenusado <= 90
   begin
        set @men = 'WARNING en Disco VALIDANDO: ' + @disco
        SET @ENVIAR_MENSAJE = 'Y' 
        SET @MENSAJE = @MENSAJE + '
         <tr>
         <td>' + @men   + '</td>
         <td>' + convert(varchar(10),@porcenusado) + '</td>
         <td>' + convert(varchar(30),getdate(),113) + '</td>
         </tr>'
   end
   ELSE IF @porcenusado > 85
   begin 
        set @men = 'CRITICAL ERROR en Disco: ' + @disco
        SET @ENVIAR_MENSAJE = 'Y' 
        SET @MENSAJE = @MENSAJE + '
         <tr>
         <td>' + @men   + '</td>
         <td>' + convert(varchar(10),@porcenusado) + '</td>
         <td>' + convert(varchar(30),getdate(),113) + '</td>
         </tr>'
   end
   fetch next from discspace into @disco, @asig , @MB 
ENd
IF @ENVIAR_MENSAJE = 'Y' 
      BEGIN
            set @HTML_MENSAJE = N'<HTML><P>' + @MENSAJE + N'</P></HTML>'
            exec  msdb..sp_send_dbmail
            @profile_name = @vcProfileName,
            --@recipients = 'area_base_datos@sinacofi.cl',   
            --@recipients = 'svasquez@sinacofi.cl',   
            @recipients = N'basedatos.chile@experian.com',
			@subject = 'Alerta de Espacio en Discos',
            @body = @HTML_MENSAJE,
            @body_format = 'HTML',
            @importance = 'HIGH',
            @sensitivity = 'NORMAL' 
      END
CLOSE discspace 
DEALLOCATE discspace
GO
