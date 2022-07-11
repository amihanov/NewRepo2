SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[DBA_Alerta_Espacio_BD]') IS NULL EXEC('CREATE PROCEDURE [dbo].[DBA_Alerta_Espacio_BD] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[DBA_Alerta_Espacio_BD]
AS

/*create table spacedb
(DB   nvarchar(100),
 DATOS nvarchar(20),
 USADO nvarchar(20))

create table spacedb_hist
(DB   nvarchar(100),
 DATOS nvarchar(20),
 USADO nvarchar(20),
 fecha datetime)
*/
SET NOCOUNT ON
truncate table spacedb	
declare @name sysname
declare @MySql nvarchar(2048)
declare @dato nvarchar(20)
declare @usado nvarchar(20)
declare @porcenusado int
declare @ENVIAR_MENSAJE char(1)
declare @MENSAJE nvarchar(2048)
DECLARE @HTML_MENSAJE varchar(4048)
declare @men varchar(50)

create table #tmpDbSize
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

insert into #tmpDbSize(Dbname,vcdbstatus,vcRecoveryModel,flFileSizeMB,flSpaceUsedMB,flFreeSpaceMB,vcVolumen,flTotalSpace,flAvailableSpace,flPercentageAvailable) 
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

declare dbspace cursor for
SELECT Dbname,flFileSizeMB,flSpaceUsedMB,(convert(int,flSpaceUsedMB)*100)/convert(int,flFileSizeMB) perc 
FROM #tmpDbSize where (convert(int,flSpaceUsedMB)*100)/convert(int,flFileSizeMB) > 90.0

IF (select count(1) from #tmpDbSize where (convert(int,flSpaceUsedMB)*100)/convert(int,flFileSizeMB) > 90.0)  > 0
BEGIN
set @ENVIAR_MENSAJE = 'Y'
END

SET @MENSAJE = '<html><head><TITLE>Department Report</TITLE>
                    </head><body><p>
                    <font style="font-family:Tahoma;FONT-WEIGHT: bold; FONT-SIZE: 13px;COLOR: #023962">Alerta de Espacio en Base de datos, Servidor: 
                    <table  width="70%" style="border-collapse: collapse; border-top: 2px solid #466577">
                    <tr><td></td></tr></table></font>' + @@SERVERNAME + '</p>'

SET @MENSAJE = @MENSAJE + '<br>' +'<table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Tahoma; bACKGROUND-COLOR: #466577;TEXT-ALIGN: center">
         <td width="15%"> <strong>Nombre BD</strong></td>
         <td width="15%"> <strong>Tamaño Base MB</strong></td>
         <td width="15%"> <strong>Usado MB</strong></td>
         <td width="15%"> <strong>% de Uso</strong></td>
         <td width="15%"> <strong>Fecha / Hora</strong></td>
         </tr>'

Open dbspace
Fetch next from dbspace into @name, @dato , @usado, @porcenusado

WHILE @@FETCH_STATUS = 0

BEGIN
    SET @MENSAJE = @MENSAJE + '
         <tr style="
         FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >' + @name + '</td>
         <td>' + convert(varchar(20),@dato) + '</td>
         <td>' + convert(varchar(20),@usado) + '</td>
         <td>' + convert(varchar(20),@porcenusado) + '</td>
         <td>' + convert(varchar(50),GETDATE(),113) + '</td>
         </tr>'
         
fetch next from dbspace into @name, @dato , @usado, @porcenusado
END
CLOSE dbspace
DEALLOCATE dbspace

SET @MENSAJE = N'<HTML><P>' + @MENSAJE +  N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109)) + '.'
 + '</p>'
 
IF @ENVIAR_MENSAJE = 'Y' 
BEGIN
                set @HTML_MENSAJE = @MENSAJE + N'</P></HTML>'
                exec  msdb..sp_send_dbmail
                @profile_name = 'AJAX\SQLPROD01',
                @recipients = N'area_base_datos@sinacofi.cl', 
                @importance  = N'HIGH',
                @subject  = N'ALERTA de espacio en Base de Datos',
                @body =  @HTML_MENSAJE,
                @body_format  = N'HTML'
END
GO
