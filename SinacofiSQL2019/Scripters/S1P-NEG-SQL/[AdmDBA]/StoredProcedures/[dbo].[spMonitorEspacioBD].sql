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
                @recipients = 'basedatos.chile@experian.com', 
				--@recipients = N'area_base_datos@sinacofi.cl', 
				--@recipients = N'nhuenul@sinacofi.cl', 
                @importance  = N'HIGH',
                @subject  = @vcAsunto,
                @body =  @vcReporteEspacio,
                @body_format  = N'HTML'
END
GO
