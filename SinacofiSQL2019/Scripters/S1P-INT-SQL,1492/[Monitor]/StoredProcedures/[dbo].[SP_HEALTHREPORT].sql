SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_HEALTHREPORT]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_HEALTHREPORT] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_HEALTHREPORT]
--/****************************************************************************/
--/*Nombre         : SP_HEALTHREPORT                                          */
--/*Autor          : Nicolas Huenul Mansilla                                  */
--/*Descripci¿n    : Reporte AJAX                                             */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 31-Julio-2014 10:00                                      */
--/*Versi¿n        : V01.00-000                                               */
--/*Bitacora       :                                                          */
--/****************************************************************************/
AS
DECLARE @vcProfileName varchar(50)
DECLARE @vcDatabase varchar(30)
DECLARE @vcLoginName varchar(30)
DECLARE @vcHostName varchar(30)
DECLARE @vcAsunto varchar(200)
DECLARE @iCantidadSesiones int
DECLARE @flTotalMemory float
DECLARE @flSqlServerUsed float
DECLARE @flAvailableMemory float
DECLARE @vcVol      varchar(5)
DECLARE @flFreeSpaceMB float
DECLARE @flTotalSpace float
DECLARE @flAvailableSpace float
DECLARE @flFileSizeMB  float
DECLARE @flSpaceUsedMB float
DECLARE @flPercentageAvailable float
DECLARE @flPorcentajeUsado float
DECLARE @vcVolumen varchar(10)
DECLARE @flUsed float
DECLARE @vcReporteCPU varchar(2500)
DECLARE @vcReporteMEMORIA varchar(2500)
DECLARE @vcReporteDisco varchar(max)
DECLARE @vcReporteSesiones varchar(max)
DECLARE @vcHTML_MENSAJE varchar(max)
DECLARE @flAvgCPUIdle FLOAT,@flAvgCPUIdle30 FLOAT,@flAvgCPUIdle60 FLOAT
DECLARE @flAvgCPUUsed FLOAT,@flAvgCPUUsed30 FLOAT,@flAvgCPUUsed60 FLOAT
DECLARE @flAvgOtherProcess FLOAT,@flAvgOtherProcess30 FLOAT,@flAvgOtherProcess60 FLOAT

SET @vcAsunto = '['+ @@servername +'] Reporte de rendimiento - ['+ (select CONVERT(VARCHAR(10), GETDATE(), 101) + ' ' + CONVERT(VARCHAR(8), GETDATE(), 108) ) + ']'



/********* CURSOR SESIONES***********************/

declare curSession cursor for 
SELECT login_name,
       host_name, 
       COUNT(session_id)
FROM sys.dm_exec_sessions WITH (NOLOCK)
WHERE session_id > 50	-- filter out system SPIDs
GROUP BY login_name,host_name
ORDER BY COUNT(session_id) DESC OPTION (RECOMPILE);

/******* CPU ULTIMOS 10 MINUTOS ****************/

select @flAvgOtherProcess = AVG(iOtherProcess),
       @flAvgCPUUsed = AVG(iSqlCpuUse),
       @flAvgCPUIdle = AVG(iSystemIdle) 
from dbo.tblCPUMonitor
where dtFechaHora > dateadd(minute, -10, getdate())


/******* CPU ULTIMOS 30 MINUTOS ****************/

select @flAvgOtherProcess30 = AVG(iOtherProcess),
       @flAvgCPUUsed30 = AVG(iSqlCpuUse),
       @flAvgCPUIdle30 = AVG(iSystemIdle) 
from dbo.tblCPUMonitor
where dtFechaHora > dateadd(minute, -30, getdate())

/******* CPU ULTIMOS 60 MINUTOS ****************/

select @flAvgOtherProcess60 = AVG(iOtherProcess),
       @flAvgCPUUsed60 = AVG(iSqlCpuUse),
       @flAvgCPUIdle60 = AVG(iSystemIdle) 
from dbo.tblCPUMonitor
where dtFechaHora > dateadd(minute, -60, getdate())

/******* OBTIENE USO DE MEMORIA ****************/

/*SELECT @flSqlServerUsed = SUM(awe_allocated_kb)/1024/1024
FROM sys.dm_os_memory_clerks;*/

select @flSqlServerUsed = physical_memory_in_use_kb/1024/1024
from sys.dm_os_process_memory 

select @flTotalMemory = total_physical_memory_kb/1024/1024,
       @flAvailableMemory = available_physical_memory_kb/1024/1024
from sys.dm_os_sys_memory;

/********* CURSOR PARA ESPACIO *****************/

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
 
--CAST(CAST(vs.available_bytes AS FLOAT)/ CAST(vs.total_bytes AS FLOAT) AS DECIMAL(18,1)) * 100 AS [Space Used %]

insert into #tmpDbSize(Dbname,vcdbstatus,vcRecoveryModel,flFileSizeMB,flSpaceUsedMB,flFreeSpaceMB)--,vcVolumen,flTotalSpace,flAvailableSpace,flPercentageAvailable) 
exec sp_msforeachdb 
'use [?]; 
  select DB_NAME() AS DbName, 
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Status'')) ,  
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Recovery'')),  
    d.size/128.0 AS File_MB, 
    CAST(FILEPROPERTY(d.name, ''SpaceUsed'') AS INT)/128.0 as Space_Used_MB, 
    d.size/128.0 - CAST(FILEPROPERTY(d.name,''SpaceUsed'') AS INT)/128.0 AS Free_Space_MB
    from sys.database_files d 
where d.type=0 
--and m.database_id NOT IN (10)
--and m.database_id IN (1)
group by d.size/128.0,
      CAST(FILEPROPERTY(d.name, ''SpaceUsed'') AS INT)/128.0';
 
 declare curSpace cursor for 
select Dbname,
       round(flFileSizeMB,2) as FileSizeMB,
       round(flSpaceUsedMB,2) as SpaceUsedMB,
       round(flFreeSpaceMB,2) as FreeSpaceMB,
       round((flSpaceUsedMB*100/flFileSizeMB),2) as PorcentajeUsado
       --vcVolumen,
       --round(flTotalSpace,2),
       --round(flAvailableSpace,2),
       --round(flPercentageAvailable,2)
from #tmpDbSize
order by 1 asc OPTION (RECOMPILE);

/******* ARMA REPORTE ****************/

/*SET @vcReporteDisco = '<div style="font-family:Verdana;font-size:18px">
         <p>ESTADISTICAS DE USO DE DISCO POR BASE DE DATOS</p>' +'<table WIDTH="100%">
        <tr style="FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="15%"> <strong>DATABASE</strong></td>
         <td width="15%"> <strong>TAMAÑO BD [MB]</strong></td>
         <td width="15%"> <strong>USADO [MB]</strong></td>
         <td width="15%"> <strong>ESPACIO DISPONIBLE [MB]</strong></td>
         <td width="15%"> <strong>PORCENTAJE USADO [%]</strong></td>
         <td width="15%"> <strong>VOLUMEN</strong></td>
         <td width="15%"> <strong>ESPACIO TOTAL[GB]</strong></td>
         <td width="15%"> <strong>ESPACIO DISPONIBLE [GB]</strong></td>
         <td width="15%"> <strong>PORCENTAJE UTILIZACION [%]</strong></td>
         </tr>'
*/

SET @vcReporteDisco = '<div style="font-family:Verdana;font-size:18px">
         <p>ESTADISTICAS DE USO DE DISCO POR BASE DE DATOS</p>' +'<TABLE WIDTH="100%">
         <tr style="FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td COLSPAN="5">TAMAÑO LOGICO</td>
         <tr style="FONT-SIZE: 10px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td>DATABASE</td>
         <td>TAMAÑO BD [MB]</td>
         <td>USADO [MB]</td>
         <td>ESPACIO DISPONIBLE[MB]</td>
         <td>PORCENTAJE USADO [%]</td>
         </tr>'

SET @vcReporteSesiones = '<div style="font-family:Verdana;font-size:18px">
         <p>ESTADISTICAS DE SESIONES ACTIVAS</p>' +'<table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="15%"> <strong>LOGIN NAME</strong></td>
         <td width="15%"> <strong>HOSTNAME</strong></td>
         <td width="15%"> <strong>CANTIDAD DE SESIONES</strong></td>
         </tr>'

SET @vcReporteCPU = '<div style="font-family:Verdana;font-size:18px">
         <p>ESTADISTICAS DE USO DE CPU</p>' +'<table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="15%"> <strong>ULTIMOS MINUTOS</strong></td>
         <td width="15%"> <strong>CPU SQLSERVER</strong></td>
         <td width="15%"> <strong>CPU OTROS PROCESOS</strong></td>
         <td width="15%"> <strong>CPU LIBRE</strong></td>
         </tr>
         <tr style="FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >10</td>
         <td>' + convert(varchar(10),@flAvgCPUUsed) +'</td>
         <td>' + convert(varchar(10),@flAvgOtherProcess) +'</td>
         <td>' + convert(varchar(10),@flAvgCPUIdle) +'</td>
         </tr>
         <tr style="FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >30</td>
         <td>' + convert(varchar(10),@flAvgCPUUsed30) +'</td>
         <td>' + convert(varchar(10),@flAvgOtherProcess30) +'</td>
         <td>' + convert(varchar(10),@flAvgCPUIdle30) +'</td>
         </tr>
         <tr style="FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >60</td>
         <td>' + convert(varchar(10),@flAvgCPUUsed60) +'</td>
         <td>' + convert(varchar(10),@flAvgOtherProcess60) +'</td>
         <td>' + convert(varchar(10),@flAvgCPUIdle60) +'</td>
         </tr>'
         
SET @vcReporteMemoria = '<div style="font-family:Verdana;font-size:18px">
         <p>ESTADISTICAS DE USO DE MEMORIA</p>' +'<table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="15%"> <strong>MEMORIA TOTAL [GB]</strong></td>
         <td width="15%"> <strong>UTILIZADO POR MSSQLSERVER [GB]</strong></td>
         <td width="15%"> <strong>DISPONIBLE [GB]</strong></td>
         </tr>
         <tr style="FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td>' + convert(varchar(10),@flTotalMemory) +'</td>
         <td>' + convert(varchar(10),@flSqlServerUsed) +'</td>
         <td>' + convert(varchar(10),@flAvailableMemory) +'</td>
         </tr>'
       
Open curSpace
Fetch next from curSpace into @vcDatabase, @flFileSizeMB, @flSpaceUsedMB, @flFreeSpaceMB, @flPorcentajeUsado

WHILE @@FETCH_STATUS = 0

BEGIN
    SET @vcReporteDisco = @vcReporteDisco + '
         <tr style="FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >' + @vcDatabase   + '</td>
         <td>' +  convert(varchar(20),@flFileSizeMB) + '</td>
         <td>' +  convert(varchar(20),@flSpaceUsedMB) + '</td>
         <td>' +  convert(varchar(20),@flFreeSpaceMB) + '</td>
         <td>' +  convert(varchar(20),@flPorcentajeUsado) + '</td>
         </tr>'
fetch next from curSpace into @vcDatabase, @flFileSizeMB, @flSpaceUsedMB, @flFreeSpaceMB, @flPorcentajeUsado
END
CLOSE curSpace
DEALLOCATE curSpace

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

SET @vcHTML_MENSAJE = N'<HTML><P>' + @vcReporteCPU +  N'</P></table><P>' + @vcReporteMemoria +  N'</P></table><HTML><P>' + @vcReporteSesiones +  N'</P></table><HTML><P>' + @vcReporteDisco +  N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109)) + '.'
 + '</p>'

       select @vcProfileName = name from msdb..sysmail_profile
                exec  msdb..sp_send_dbmail
                @profile_name = @vcProfileName,
                --@recipients = N'svasquez@sinacofi.cl', 
                --@recipients = 'area_base_datos@sinacofi.cl;plataforma@sinacofi.cl;esaavedra@sinacofi.cl;csandoval@sinacofi.cl;lpereira@sinacofi.cl;rguajardo@sinacofi.cl;descobarr@sinacofi.cl;aacevedo@sinacofi.cl;cfucha@sinacofi.cl;hbalbontin@sinacofi.cl;ecordova@sinacofi.cl;dkokaly@sinacofi.cl',
                @recipients = N'area_base_datos@sinacofi.cl',
                @importance  = N'HIGH',
                @subject  = @vcAsunto,
                @body = @vcHTML_MENSAJE,
                @body_format  = N'HTML'
GO
