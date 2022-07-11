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
set @vcFileName = 'G:\BACKUP\BackupDatabases\' + @vcDatabaseName + '_' + convert(varchar(23), getdate(), 112) + '.bak'

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
    --@recipients = N'nhuenul@sinacofi.cl', 
    --@recipients = N'area_base_datos@sinacofi.cl',
    @recipients = N'basedatos.chile@experian.com',
	@importance  = N'HIGH',
    @subject  = @vcAsunto,
    @body = @vcReporteBackup,
    @body_format  = N'HTML'
GO
