
GO
--SqlScripter----[dbo].[Adm_Start_Audit].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[Adm_Start_Audit]') IS NULL EXEC('CREATE PROCEDURE [dbo].[Adm_Start_Audit] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[Adm_Start_Audit]
AS
BEGIN
  declare @trac_id   int 
  declare @fecha     varchar(30)
  declare @path      nvarchar(200)
  declare @resultado int   
  declare @von       bit 

  declare @tamano bigint 
  set @tamano = 50

  set @fecha = convert(varchar, getdate(), 120)
  set @fecha = replace(@fecha, ':', '')
  set @fecha = replace(@fecha, '-', '')
  set @fecha = replace(@fecha, ' ', '')
  
  set @path = 'C:\Trace\Atlas_' + @fecha
  exec @resultado = sp_trace_create @trac_id OUTPUT, @options = 2, @tracefile = @path,  @maxfilesize = @tamano


  if @resultado <> 0 
     return(-1)

   --Inicio de sesión.
  set @von= cast(1 as bit )
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =10, @on=@von
  /*** Inicio de sesión, Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =35, @on=@von
  /*** Inicio de sesión, Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =3, @on=@von
  /*** Inicio de sesión, Username Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =11, @on=@von  
  /*** Inicio de sesión, NT Username ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =6, @on=@von
  /*** Inicio de sesión, Client Hostname ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =8, @on=@von
  /*** Inicio de sesión, Starttime  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =14, @on=@von
  /*** Inicio de sesión, End time  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =15, @on=@von
  /*** Inicio de sesión, Text Data  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =01, @on=@von

  --Termino de sesión.
  /*** Inicio de sesión, Text Data  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =01, @on=@von
  /*** Inicio de sesión, nombre de la aplicación ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =10, @on=@von
  /*** Inicio de sesión, Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =35, @on=@von
  /*** Inicio de sesión, Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =3, @on=@von
  /*** Inicio de sesión, Username Base de datos ***/ 
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =11, @on=@von 
  /*** Inicio de sesión, NT Username ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =6, @on=@von
  /*** Inicio de sesión, Client Hostname ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =8, @on=@von
  /*** Inicio de sesión, Starttime  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =14, @on=@von
  /*** Inicio de sesión, End time  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =15, @on=@von

  --Creación de objetos.
  /*** Text Data  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =01, @on=@von
  /*** nombre de la aplicación ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =10, @on=@von
  /*** Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =35, @on=@von
  /*** Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =3, @on=@von
  /*** Username Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =11, @on=@von 
  /*** NT Username ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =6, @on=@von
  /*** Client Hostname ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =8, @on=@von
  /*** Starttime  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =14, @on=@von
  /*** End time  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =15, @on=@von

  --Eliminación de objetos.
  /*** Text Data  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =01, @on=@von
  /*** nombre de la aplicación ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =10, @on=@von
  /*** Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =35, @on=@von
  /*** Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =3, @on=@von
  /*** Username Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =11, @on=@von 
  /*** NT Username ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =6, @on=@von
  /*** Client Hostname ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =8, @on=@von
  /*** Starttime  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =14, @on=@von
  /*** End time  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =15, @on=@von

  --Select, insert, updade, delete.
  /*** Text Data  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =01, @on=@von
  /*** nombre de la aplicación ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =10, @on=@von
  /*** Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =35, @on=@von
  /*** Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =3, @on=@von
  /*** Username Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =11, @on=@von 
  /*** NT Username ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =6, @on=@von
  /*** Client Hostname ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =8, @on=@von
  /*** Starttime  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =14, @on=@von
  /*** End time  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =15, @on=@von

  --Iniciar traza.
  exec sp_trace_setstatus @traceid = 1,  @status = 1
  if @@error <> 0 
     RETURN(-1)  

END;
GO

GO
--SqlScripter----[dbo].[DBA_Alerta_Backup_Log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[DBA_Alerta_Backup_Log]') IS NULL EXEC('CREATE PROCEDURE [dbo].[DBA_Alerta_Backup_Log] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[DBA_Alerta_Backup_Log]
AS

DECLARE @DIAHOY  datetime
DECLARE @HOY_MIN datetime
DECLARE @MINUTOS int 
DECLARE @ENVIAR_MENSAJE char(1)
DECLARE @HTML_MENSAJE varchar(4608)
declare @MENSAJE nvarchar(4000)

declare @db  varchar(30)
declare @tipo  varchar(30)
declare @fecha  varchar(30)

SELECT @MINUTOS = 30
SELECT @DIAHOY = GETDATE()
--SELECT @DIA_7 = CONVERT(varchar(12), @DIAHOY, 113)
select @HOY_MIN=dateadd(mi,-30,GETDATE())

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TEMP_ALERTA_BACKUP_LOG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TEMP_ALERTA_BACKUP_LOG]

select db.name nameBD, res.database_name,
       Tipo_Backup = CASE res.type
                     WHEN 'D' THEN 'Database'
                     WHEN 'I' THEN 'Database Differential'
                     WHEN 'L' THEN 'Log'
                     WHEN 'F' THEN 'File or Filegroup'
                     END,
--        res.backup_start_date,
--        res.backup_finish_date,
--        res.name    
        MAX(res.backup_start_date) FechaHora
    into TEMP_ALERTA_BACKUP_LOG
    from master..sysdatabases db left outer join msdb..backupset res 
    on db.name = res.database_name
--      and res.backup_start_date >= @HOY_MIN      
      and res.type = 'L' --No informa los respaldos LOGs
    group by db.name, res.database_name, type
    order by FechaHora desc

select @ENVIAR_MENSAJE = 'N'

if (exists (select 1 from TEMP_ALERTA_BACKUP_LOG 
                     where (FechaHora < @HOY_MIN or FechaHora is null))) 
    select @ENVIAR_MENSAJE = 'Y'

IF @ENVIAR_MENSAJE = 'Y' 
BEGIN
    
    DECLARE bases_con_problemas CURSOR
    FOR
    SELECT nameBD, Tipo_Backup, FechaHora from TEMP_ALERTA_BACKUP_LOG 
                  where (FechaHora < @HOY_MIN or FechaHora is null)

    SET @MENSAJE = '<html><head><TITLE>Reporte de error en Backup Log</TITLE>
</head><body><p>
<font style="font-family:Tahoma;FONT-WEIGHT: bold; FONT-SIZE: 13px;COLOR: #023962">Alerta de Espacio en Log Transaction, Servidor: 
<table  width="70%" style="border-collapse: collapse; border-top: 2px solid #466577">
<tr><td></td></tr></table></font>' + @@SERVERNAME + '</p>'
                    
    open bases_con_problemas

    FETCH NEXT FROM bases_con_problemas into @db, @tipo, @fecha

    SET @MENSAJE = @MENSAJE + '<br>' +'<table WIDTH="100%">
<tr style="FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Tahoma; bACKGROUND-COLOR: #466577;TEXT-ALIGN: center">
<td width="15%"> <strong>Nombre BD</strong></td>         
<td width="15%"> <strong>Tipo Backup</strong></td>         
<td width="15%"> <strong>Ultimo Respaldo</strong></td>         
</tr>'
        
    WHILE (@@FETCH_STATUS = 0)
    BEGIN
        SET @MENSAJE = @MENSAJE + N'<tr style="FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
<td >' + @db    + '</td>
<td >' + ISNULL(@tipo, 'NULL') + '</td>
<td >' + ISNULL(@fecha, 'NULL') + '</td>
</tr>'  
        
        FETCH NEXT FROM bases_con_problemas into @db, @tipo, @fecha
    END

    set @HTML_MENSAJE = N'<HTML><P>' + @MENSAJE + N'</P></HTML>'

    exec  msdb..sp_send_dbmail
    @profile_name = 'AJAX',
    @recipients = N'area_base_datos@sinacofi.cl', 
    @importance  = N'HIGH',
    @subject  = N'ALERTA de backup Log',
    @body =  @HTML_MENSAJE,
    @body_format  = N'HTML'


    CLOSE bases_con_problemas
    DEALLOCATE bases_con_problemas
END 
               
drop table [TEMP_ALERTA_BACKUP_LOG]
GO

GO
--SqlScripter----[dbo].[DBA_Alerta_Espacio_BD].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[DBA_Alerta_Espacio_BD]') IS NULL EXEC('CREATE PROCEDURE [dbo].[DBA_Alerta_Espacio_BD] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[DBA_Alerta_Espacio_BD]
AS

SET NOCOUNT ON
--truncate table spacedb	
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

insert into #tmpDbSize(Dbname,vcdbstatus,vcRecoveryModel,flFileSizeMB,flSpaceUsedMB,flFreeSpaceMB) 
exec sp_msforeachdb 
'use [?]; 
select
    DB_NAME() AS DbName, 
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Status'')) ,  
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Recovery'')), 
    sum(d.size)/1024.0 AS File_MB, 
    sum(CAST(FILEPROPERTY(d.name, ''SpaceUsed'') AS INT))/1024.0 as Space_Used_MB, 
    SUM(d.size)/1024.0 - sum(CAST(FILEPROPERTY(d.name,''SpaceUsed'') AS INT))/1024.0 AS Free_Space_MB
from sys.database_files d inner join sys.master_files m on d.file_id = m.file_id
where d.type=0 
and m.database_id NOT IN (1,2,3,4,5)
group by d.type'
      

declare dbspace cursor for
SELECT Dbname,flFileSizeMB,flSpaceUsedMB,(convert(int,flSpaceUsedMB)*100)/convert(int,flFileSizeMB) perc FROM #tmpDbSize where (convert(int,flSpaceUsedMB)*100)/convert(int,flFileSizeMB) > 85.0

set @ENVIAR_MENSAJE = 'N' 

IF (select count(1) from #tmpDbSize where (convert(int,flSpaceUsedMB)*100)/convert(int,flFileSizeMB) > 85.0)   > 0
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
                @profile_name = 'AJAX',
                @recipients = N'area_base_datos@sinacofi.cl', 
                @importance  = N'HIGH',
                @subject  = N'ALERTA de espacio en Base de Datos',
                @body =  @HTML_MENSAJE,
                @body_format  = N'HTML'
END
GO

GO
--SqlScripter----[dbo].[DBA_Alerta_Espacio_TLog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[DBA_Alerta_Espacio_TLog]') IS NULL EXEC('CREATE PROCEDURE [dbo].[DBA_Alerta_Espacio_TLog] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[DBA_Alerta_Espacio_TLog]
AS
set nocount on
 declare @xx nvarchar(1024)
 declare @ENVIAR_MENSAJE char(1)
 declare @MENSAJE nvarchar(2048)
 DECLARE @HTML_MENSAJE varchar(4048)
 declare @db  sysname
 declare @men varchar(50)
 declare @porcen_used decimal
truncate table SpaceLog
 set @xx='DBCC SQLPERF(LOGSPACE)'
insert into SpaceLog (db,LogSize,porcen_used,status)
 exec master..sp_executesql @xx
insert into SpaceLog_hist (db,LogSize,porcen_used,status,fecha)
 select db,LogSize,porcen_used,status,GETDATE() from SpaceLog
 
DECLARE consulta_log CURSOR
FOR
    SELECT db,porcen_used FROM SpaceLog
    where porcen_used > 80
    set @ENVIAR_MENSAJE = 'N'
    SET @MENSAJE = '<html><head><TITLE>Department Report</TITLE>
                    </head><body><p>
                    <font style="font-family:Tahoma;FONT-WEIGHT: bold; FONT-SIZE: 13px;COLOR: #023962">Alerta de Espacio en Log Transaction, Servidor: 
                    <table  width="70%" style="border-collapse: collapse; border-top: 2px solid #466577">
                    <tr><td></td></tr></table></font>' + @@SERVERNAME + '</p>'
    OPEN consulta_log
    FETCH NEXT FROM consulta_log into @db,@porcen_used
          SET @MENSAJE = @MENSAJE + '<br>' +'<table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Tahoma; bACKGROUND-COLOR: #466577;TEXT-ALIGN: center">
         <td width="15%"> <strong>Nombre BD</strong></td>
         <td width="15%"> <strong>% de Uso</strong></td>
         <td width="15%"> <strong>Fecha / Hora</strong></td>
         </tr>'
   WHILE @@FETCH_STATUS = 0
   BEGIN
         IF @porcen_used > 80 and @porcen_used <= 95
            set @men = 'WARNING: ' + @db
         else
            set @men = 'Critical Error: ' + @db
         SET @ENVIAR_MENSAJE = 'Y'
         SET @MENSAJE = @MENSAJE + '
         <tr style="
         FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >' + @men   + '</td>
         <td>' + convert(varchar(20),@porcen_used) + '</td>
         <td>' + convert(varchar(50),GETDATE(),113) + '</td>
         </tr>'  
       FETCH NEXT FROM consulta_log into @db,@porcen_used  
   END
  IF @ENVIAR_MENSAJE = 'Y' 
    BEGIN
                set @HTML_MENSAJE = N'<HTML><P>' + @MENSAJE + N'</P></HTML>'
                exec  msdb..sp_send_dbmail
                @profile_name = 'AJAX',
                @recipients = N'area_base_datos@sinacofi.cl', 
                @importance  = N'HIGH',
                @subject  = N'ALERTA de espacio en Transaction Log',
                @body =  @HTML_MENSAJE,
                @body_format  = N'HTML'
    END 
 CLOSE consulta_log
 DEALLOCATE consulta_log
GO

GO
--SqlScripter----[dbo].[DBA_CREA_INFO_BKP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[DBA_CREA_INFO_BKP]') IS NULL EXEC('CREATE PROCEDURE [dbo].[DBA_CREA_INFO_BKP] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[DBA_CREA_INFO_BKP]
AS
declare @database_name      nvarchar(128)
declare @Tipo_Backup        nvarchar(128)
declare @backup_start_date  datetime 
declare @backup_finish_date datetime 
declare @name               nvarchar(128)
declare @MySql              nvarchar(500)
DECLARE @ult_arch_aplic     varchar(128)
DECLARE @MENSAJE            varchar(4048)
DECLARE @DIA1		    char(8)
DECLARE @DIA11		    varchar(12)
DECLARE @DIA2		    char(8)
DECLARE @DIA22		    varchar(12)

SELECT @DIA1 = CONVERT(CHAR(8),GETDATE()-7,112)
SELECT @DIA11 = CONVERT(varchar(12),GETDATE()-7,113)
SELECT @DIA2 = CONVERT(CHAR(8),GETDATE(),112) --CONVERT(CHAR(8),GETDATE()-2,112)
SELECT @DIA22 = CONVERT(varchar(12),GETDATE(),13) --CONVERT(varchar(12),GETDATE()-3,13)

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TEMPORAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TEMPORAL]

select database_name,
       Tipo_Backup = CASE type
                    WHEN 'D' THEN 'Database'
                    WHEN 'I' THEN 'Database Differential'
                    WHEN 'L' THEN 'Log'
                    WHEN 'F' THEN 'File or Filegroup'
                    END,
        backup_start_date,
        backup_finish_date,
        name INTO TEMPORAL
    from msdb..backupset
    where convert(char(8),backup_start_date,112) >= @DIA1 and convert(char(8),backup_start_date,112) <= @DIA2 
    and type <> 'L' --No informa los respaldos LOGs
    order by database_name, backup_start_date
    DECLARE @MEN varchar(2048)
--DECLARE @ERROR varchar(1024) 
DECLARE @HTML_MENSAJE varchar(4048)
DECLARE @NOMBRE_SERVIDOR varchar(30)
DECLARE @ENVIAR_MENSAJE char(1)
select @NOMBRE_SERVIDOR = @@SERVERNAME
DECLARE CONSULTA_JOBS CURSOR
FOR
    SELECT * FROM TEMPORAL
    set @ENVIAR_MENSAJE = 'N'
    SET @MENSAJE = '<html><head><TITLE>Department Report</TITLE>
                    </head><body><p>
                    <font style="font-family:Tahoma;FONT-WEIGHT: bold; FONT-SIZE: 13px;COLOR: #023962">Nomina de backup realizados en la semana del  ' + @DIA11 + ' al ' + @DIA22 + ' en el Servidor 
                    <table  width="70%" style="border-collapse: collapse; border-top: 3px solid #466577"> 
                    <tr><td></td></tr></table></font>' + @NOMBRE_SERVIDOR + '</p>' --#cce49d
     PRINT @MENSAJE
--print @MENSAJE     
OPEN CONSULTA_JOBS
    FETCH NEXT FROM CONSULTA_JOBS INTO @database_name,@Tipo_Backup,@backup_start_date,@backup_finish_date,@name
                                                      /*@MENSAJE + '<br>' +'<table WIDTH="100%">*/
     SET @MENSAJE = '<br>' +'<table WIDTH="100%"> 
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Tahoma; bACKGROUND-COLOR: #466577;TEXT-ALIGN: center">
         <td width="15%"> <strong>Nombre BD</strong></td>
         <td width="15%"> <strong>Tipo Backup</strong></td>
         <td width="15%"> <strong>Fecha Inicio</strong></td>
         <td width="15%"> <strong>Fecha Termino</strong></td>
         <td width="15%"> <strong>Nombre</strong></td> 
         </tr>' --#023962
     PRINT @MENSAJE
   WHILE @@FETCH_STATUS = 0
   BEGIN
         SET @ENVIAR_MENSAJE = 'Y'
                        --@MENSAJE +
         SET @MENSAJE =  '
         <tr style="
         FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma;TEXT-ALIGN: center">
         <td>' + @database_name   + '</td>
         <td>' + @Tipo_Backup + '</td>
         <td>' + convert(varchar(30),@backup_start_date) + '</td>
         <td>' + convert(varchar(30),@backup_finish_date) + '</td>
         <td>' + @name + '</td>
         </tr>'
         PRINT @MENSAJE
         FETCH NEXT FROM CONSULTA_JOBS INTO @database_name,@Tipo_Backup,@backup_start_date,@backup_finish_date,@name
   END
--set @HTML_MENSAJE = N'<HTML><P>' + @MENSAJE + N'</P></HTML>'
/*
   IF @ENVIAR_MENSAJE = 'Y' 
      BEGIN
                set @HTML_MENSAJE = N'<HTML><P>' + @MENSAJE + N'</P></HTML>'
		exec  master.dbo.xp_smtp_sendmail
		@FROM			= N'Bv_Sqlserver@bicevida.cl',
		@FROM_NAME		= @@SERVERNAME,
		@TO			= N'ximena.hormazabal@sqltech.cl', --,N'Maritza.Moreno@bicevida.cl,Barbara.Sepulveda@bicevida.cl',
                @replyto                = N'',
                @CC			= N'',
                @BCC			= N'',
                @priority		= N'HIGH',
		@subject		= N'Informe Semanal Estado de los Backup',
		@message		= @HTML_MENSAJE,
                @messagefile	        = N'',
		@type			= N'text/html',
                @attachment		= N'',
                @attachments	        = N'',
                @codepage		= 0,
                @server 		= N'correo.bicevida.cl'
      END
*/
   CLOSE CONSULTA_JOBS
   DEALLOCATE CONSULTA_JOBS
PRINT @HTML_MENSAJE
DROP TABLE TEMPORAL
GO

GO
--SqlScripter----[dbo].[DBA_SpaceDisc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[DBA_SpaceDisc]') IS NULL EXEC('CREATE PROCEDURE [dbo].[DBA_SpaceDisc] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[DBA_SpaceDisc]
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
set SizeInicial = 139264 --136 GB * 1024
where disco = 'C'

update tb_drives
set SizeInicial = 10209 --9,97 GB * 1024
where disco = 'E'

update tb_drives
set SizeInicial = 25395 --24,8 GB * 1024
where disco = 'F'

update tb_drives
set SizeInicial = 10209 --9,97 GB * 1024
where disco = 'G'

update tb_drives
set SizeInicial = 20275 --19,8 GB * 1024
where disco = 'H'

update tb_drives
set SizeInicial = 152576 --149 GB *1024
where disco = 'I'

update tb_drives
set SizeInicial = 132096 --129 GB* 1024
where disco = 'J'

update tb_drives
set SizeInicial = 15258 --14,8 GB * 1024
where disco = 'K'

update tb_drives
set SizeInicial = 10209 --9,97 GB * 1024
where disco = 'L'

update tb_drives
set SizeInicial = 10209 --9,97 GB * 1024
where disco = 'M'

update tb_drives
set SizeInicial = 10209 --9,97 GB * 1024
where disco = 'N'

update tb_drives
set SizeInicial = 10209 --9,97 GB * 1024
where disco = 'O'

update tb_drives
set SizeInicial = 20275 -- 19,8 GB * 1024
where disco = 'P'

update tb_drives
set SizeInicial = 10209 --9,97 GB * 1024
where disco = 'Q'

update tb_drives
set SizeInicial = 15258 --14,9 GB * 1024
where disco = 'R'
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
DECLARE @MENSAJE            varchar(4048) 

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
                exec  msdb..sp_send_dbmail @profile_name = 'AJAX' 
					, @recipients = 'area_base_datos@sinacofi.cl'   
					, @subject = 'Alerta de Espacio en Discos' 
					, @body = @HTML_MENSAJE 
					, @body_format = 'HTML' 
					, @importance = 'HIGH' 
					, @sensitivity = 'NORMAL' 
      END
CLOSE discspace 
DEALLOCATE discspace
GO

GO
--SqlScripter----[dbo].[EnviaMailJobFallido].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[EnviaMailJobFallido]') IS NULL EXEC('CREATE PROCEDURE [dbo].[EnviaMailJobFallido] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[EnviaMailJobFallido]
AS
declare @originating_server      nvarchar(128)
declare @name        nvarchar(128)
declare @Status nvarchar(128)
declare @StatusStatus  nvarchar(128) 
declare @last_run_date nvarchar(128) 
declare @last_run_time  nvarchar(128)
declare @MySql              nvarchar(500)
DECLARE @MENSAJE            varchar(4048)
DECLARE @MEN varchar(2048)
DECLARE @HTML_MENSAJE varchar(4048)
DECLARE @NOMBRE_SERVIDOR varchar(30)
DECLARE @ENVIAR_MENSAJE char(1)
select @nombre_servidor = @@SERVERNAME

if exists (select * from dbo.sysobjects where id = object_id(N'TEMPORAL') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table TEMPORAL
CREATE TABLE #mensaje (
   mensaje varchar(4048)
)

set @ENVIAR_MENSAJE = 'N'
SET @MENSAJE =''
set @HTML_MENSAJE=''
select a.name, 
       Status = case last_run_outcome
                when 0 then 'Failed'
                when 3 then 'Canceled'
                end,
       last_run_date,
       last_run_time
into TEMPORAL
from msdb..sysjobs a, msdb..sysjobsteps b
where a.job_id = b.job_id and a.enabled = 1
  and (last_run_outcome = 0 or last_run_outcome = 3)
  and last_run_date <> 0 and last_run_date >= CONVERT(char(8),getdate(),112)


DECLARE CONSULTA_JOBS CURSOR
FOR
    SELECT * FROM TEMPORAL
    set @ENVIAR_MENSAJE = 'N'
    SET @MENSAJE = '<html><head><TITLE>Department Report</TITLE>
                    </head><body><p>
                    <font style="font-family:Tahoma;FONT-WEIGHT: bold; FONT-SIZE: 13px;COLOR: #023962">Nómina de Job Fallidos, Servidor 
                    <table  width="70%" style="border-collapse: collapse; border-top: 3px solid #466577">
                    <tr><td></td></tr></table></font>' + @nombre_servidor + '</p>'
    OPEN CONSULTA_JOBS
    FETCH NEXT FROM CONSULTA_JOBS into @name,@Status,@last_run_date ,@last_run_time
          SET @MENSAJE = @MENSAJE + '<br>' +'<table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Tahoma; bACKGROUND-COLOR: #466577;TEXT-ALIGN: center">
         <td width="15%"> <strong>Nombre Job</strong></td>
         <td width="15%"> <strong>Status</strong></td>
         <td width="15%"> <strong>Fecha Última Ejecución</strong></td>
         <td width="15%"> <strong>Hora</strong></td>
         </tr>'
   WHILE @@FETCH_STATUS = 0
   BEGIN
         SET @ENVIAR_MENSAJE = 'Y'
         SET @MENSAJE = @MENSAJE + '
         <tr style="
         FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >' + @name   + '</td>
         <td>' + @Status + '</td>
         <td>' + @last_run_date + '</td>
         <td>' + @last_run_time + '</td>
         </tr>'
         FETCH NEXT FROM CONSULTA_JOBS into @name,@Status,@last_run_date ,@last_run_time
   END
   IF @ENVIAR_MENSAJE = 'Y' 
      BEGIN
                set @HTML_MENSAJE = N'<HTML><P>' + @MENSAJE + N'</P></HTML>'
                exec msdb..sp_send_dbmail
                @profile_name = 'AJAX',
                @recipients = N'area_base_datos@sinacofi.cl;', 
                @importance  = N'HIGH',
                @subject  = N'JOB Fallidos',
                @body =  @HTML_MENSAJE,
                @body_format  = N'HTML'
      END
   CLOSE CONSULTA_JOBS
   DEALLOCATE CONSULTA_JOBS
DROP TABLE #mensaje
DROP TABLE TEMPORAL
GO

GO
--SqlScripter----[dbo].[sp_adm_sizebd_msdb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_adm_sizebd_msdb]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_adm_sizebd_msdb] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_adm_sizebd_msdb]
AS
insert into tbl_sizebd
select (size*8)/1024, getdate(),  a.* from msdb..sysfiles a
GO

GO
--SqlScripter----[dbo].[SP_CP_ObtieneCPU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_CP_ObtieneCPU]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_CP_ObtieneCPU] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_CP_ObtieneCPU]
@vcTipo nvarchar(20)
AS

declare @dtFechaIni date
declare @dtFechafin date
declare @siCpucount smallint
declare @vcServerName varchar(20)

BEGIN

select @dtFechaIni = DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)
select @dtFechafin = DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, 0)
--select @dtFechafin = DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE()), 0) 
select @vcServerName = @@SERVERNAME
    
SELECT @siCpucount = COUNT (DISTINCT pc.performance_instance_name)
FROM PerformanceDW.snapshots.performance_counters AS pc
INNER JOIN PerformanceDW.core.snapshots s ON s.snapshot_id = pc.snapshot_id 
WHERE pc.performance_object_name = 'Processor' AND pc.performance_counter_name = '% Processor Time'
AND pc.performance_instance_name != '_Total'
and pc.collection_time between @dtFechaIni and @dtFechafin
--AND s.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id 
AND s.instance_name = @vcServerName
AND pc.collection_time = 
(SELECT TOP 1 collection_time FROM PerformanceDW.snapshots.performance_counter_values pcv2 WHERE pcv2.snapshot_id = s.snapshot_id)




SELECT CONVERT(VARCHAR(10), tmp.FechaHora, 103) as FechaHora , round(max(perCPU),2) as cpu  ,tipo
FROM  (

SELECT 
--CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '+00:00')) AS FechaHora, 
CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14) AS FechaHora,
CASE pc.performance_object_name
     WHEN 'Processor' THEN 'System'
     ELSE 'SQL Server'
END AS tipo,
--CONVERT (datetime, SWITCHOFFSET (CAST (s.snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time, 
        -- Processor time on an eight proc system is 0-800% for the Process object, 
        -- but 0-100% for the Processor object
CASE pc.performance_object_name
     WHEN 'Processor' THEN ROUND (pc.formatted_value  , 2)
     ELSE ROUND (pc.formatted_value / @siCpucount,2)
END AS  perCPU
FROM PerformanceDW.snapshots.performance_counters pc
JOIN PerformanceDW.core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
WHERE s.instance_name = @vcServerName
--AND s.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
and pc.collection_time between @dtFechaIni and @dtFechafin
AND 
  (
   (pc.performance_object_name = 'Processor' AND pc.performance_counter_name = '% Processor Time' AND pc.performance_instance_name = '_Total')
    OR (pc.performance_object_name = 'Process' AND pc.performance_counter_name = '% Processor Time' AND pc.performance_instance_name = 'sqlservr')
  )          
--ORDER BY pc.collection_time, tipo

)  as tmp where tmp.tipo=@vcTipo  group by CONVERT(VARCHAR(10), tmp.FechaHora, 103)  ,tipo  order by 1 asc   


-- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
END
GO

GO
--SqlScripter----[dbo].[SP_CPUALERT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_CPUALERT]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_CPUALERT] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_CPUALERT]
--/****************************************************************************/
--/*Nombre         : SP_CPUALERT                                              */
--/*Autor          : Nicolas Huenul Mansilla                                  */
--/*Descripci¿n    : Monitor CPU al MINUTO                                    */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 01-Julio-2013 10:00                                      */
--/*Versi¿n        : V01.00-000                                               */
--/*Bitacora       :                                                          */
--/****************************************************************************/
AS
DECLARE @flAvgCPUIdle FLOAT
DECLARE @flAvgCPUUsed FLOAT
DECLARE @flAvgOtherProcess FLOAT
DECLARE @flCPUUsed FLOAT
DECLARE @vcServer VARCHAR(30)
DECLARE @vcReporte varchar(MAX)
DECLARE @flTotalMemory float
DECLARE @flPercenMemoryUsed float
DECLARE @flSqlServerUsed float
DECLARE @flAvailableMemory float
DECLARE @vcAsunto varchar(200)

SET @vcAsunto = '['+ @@servername +'] ALTO CONSUMO DE RECURSOS - ['+ (select CONVERT(VARCHAR, GETDATE(), 103) + ' ' + RIGHT(CONVERT(VARCHAR, GETDATE(), 108),8)) + ']'

delete dbo.tblCPUMonitor
where dtFechaHora < getdate()-62

/******* OBTIENE USO DE CPU ****************/

select @flAvgOtherProcess = AVG(iOtherProcess),
       @flAvgCPUUsed = AVG(iSqlCpuUse),
       @flAvgCPUIdle = AVG(iSystemIdle) 
from dbo.tblCPUMonitor
where dtFechaHora > dateadd(minute, -10, getdate())

SET @flCPUUsed = @flAvgOtherProcess + @flAvgCPUUsed

/******* OBTIENE USO DE MEMORIA ****************/

select @flSqlServerUsed = physical_memory_in_use_kb/1024
from sys.dm_os_process_memory 

select @flTotalMemory = total_physical_memory_kb/1024,
       @flAvailableMemory = available_physical_memory_kb/1024
from sys.dm_os_sys_memory;

SET @flPercenMemoryUsed = (100 * @flSqlServerUsed) / @flTotalMemory

select @vcServer = rtrim(@@servername)

if  @flCPUUsed > = 50 or @flPercenMemoryUsed > = 35

begin

SET @vcReporte = '<div style="font-family:Verdana;font-size:18px">
         <p>DETALLE CONSUMO DE CPU</p>' +'<table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="15%"> <strong>CPU SQLSERVER</strong></td>
         <td width="15%"> <strong>CPU OtherProcess</strong></td>
         <td width="15%"> <strong>CPU IDLE</strong></td>
         </tr>
         <tr style="FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td>' + convert(varchar(10),@flAvgCPUUsed) +'</td>
         <td>' + convert(varchar(10),@flAvgOtherProcess) +'</td>
         <td>' + convert(varchar(10),@flAvgCPUIdle) +'</td>
         </tr></table></HTML><hr><p>
         <p>DETALLE CONSUMO DE MEMORIA</p>' +'<table WIDTH="100%">
         <tr style="
         FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td width="15%"> <strong>TOTAL [MB]</strong></td>
         <td width="15%"> <strong>UTILIZADA MSSQL [MB]</strong></td>
         <td width="15%"> <strong>DISPONIBLE [MB]</strong></td>
         <td width="15%"> <strong>PORCENTAJE UTILIZADO [%]</strong></td>
         </tr>
         <tr style="FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td>' + convert(varchar(10),@flTotalMemory) +'</td>
         <td>' + convert(varchar(10),@flSqlServerUsed) +'</td>
         <td>' + convert(varchar(10),@flAvailableMemory) +'</td>
         <td>' + convert(varchar(10),@flPercenMemoryUsed) +'</td>
         </tr></table></HTML><hr><p>
         <div style="font-family:Verdana;font-size:10px">
         <FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109))
         + '.
         </p>'
 
                exec  msdb..sp_send_dbmail
                @profile_name = 'AJAX',
                --@recipients = N'nhuenul@sinacofi.cl', 
                @recipients = N'area_base_datos@sinacofi.cl', 
                @importance  = N'HIGH',
                @subject  = @vcAsunto,
                @body = @vcReporte,
                @body_format  = N'HTML'

END
GO

GO
--SqlScripter----[dbo].[SP_CPUMONITOR].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_CPUMONITOR]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_CPUMONITOR] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_CPUMONITOR]
--/****************************************************************************/
--/*Nombre         : SP_CPUMONITOR                                            */
--/*Autor          : Nicolas Huenul Mansilla                                  */
--/*Descripci¿n    : Monitor CPU al MINUTOR                                   */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 01-Julio-2013 10:00                                      */
--/*Versi¿n        : V01.00-000                                               */
--/*Bitacora       :                                                          */
--/****************************************************************************/
AS

DECLARE @ts_now BIGINT
SELECT @ts_now = cpu_ticks / CONVERT(FLOAT, (cpu_ticks / ms_ticks))
FROM sys.dm_os_sys_info

insert into dbo.tblCPUMonitor
SELECT TOP 1
	DATEADD(ms, -1 * (@ts_now - [TIMESTAMP]), GETDATE()) AS MonitorTime, 
	SQLProcessUtilization,
	SystemIdle,
	100 - SystemIdle - SQLProcessUtilization AS OtherProcessUtilization
FROM 
	(SELECT 
		record.value('(./Record/@id)[1]', 'int') AS record_id,
		record.value('(./Record/SchedulerMonitorEvent/SystemHealth/SystemIdle)[1]', 'int') AS SystemIdle,
		record.value('(./Record/SchedulerMonitorEvent/SystemHealth/ProcessUtilization)[1]', 'int') AS SQLProcessUtilization,
		TIMESTAMP
	FROM (
		SELECT TIMESTAMP, CONVERT(XML, record) AS record 
		FROM sys.dm_os_ring_buffers 
		WHERE ring_buffer_type = N'RING_BUFFER_SCHEDULER_MONITOR'
		AND record LIKE '%<SystemHealth>%') AS x
	) AS y 
ORDER BY record_id  DESC OPTION (RECOMPILE);


--/****************************************************************************/
--/*Autor          : Sebastián Vásquez                                        */
--/*Descripci¿n    : Monitor MEMORIA al MINUTO                                */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 24-Octubre-2014 10:00                                    */
--/*Versi¿n        : V01.00-000                                               */
--/****************************************************************************/
SET NOCOUNT ON;
DECLARE @TempMem TABLE 
(
Fecha         varchar(20),
Database_name nvarchar(50),
BufferCount   int,
BufferSizeMB  int,
BufferSizePer numeric(6,3)
);

DECLARE @total_buffer INT;
SELECT @total_buffer = cntr_value FROM sys.dm_os_performance_counters
WHERE RTRIM([object_name]) LIKE '%Buffer Manager'
AND counter_name = 'Total Pages';
;WITH BufCount AS
(
SELECT
database_id, db_buffer_pages = COUNT_BIG(*) FROM sys.dm_os_buffer_descriptors
WHERE database_id BETWEEN 5 AND 32766
GROUP BY database_id
)
INSERT @TempMem 
SELECT
GETDATE() Fecha,
[Database_Name] = CASE [database_id] WHEN 32767
                  THEN 'MSSQL System Resource DB'
                  ELSE DB_NAME([database_id]) END,
db_buffer_pages as [Buffer Count (8KB Pages)],
[Buffer Size (MB)] = db_buffer_pages / 128,
[Buffer Size (%)] = CONVERT(DECIMAL(6,3),
db_buffer_pages * 100.0 / @total_buffer)
FROM BufCount
ORDER BY [Buffer Size (MB)] DESC;

INSERT INTO [Monitor].[dbo].[tblMemMonitor] 
       SELECT * FROM @TempMem;

INSERT INTO      [Monitor].[dbo].[tblSesiones]
		SELECT   GETDATE() Fecha,COUNT(session_id) NSesiones
		FROM     sys.dm_exec_sessions WITH (NOLOCK)
		WHERE    session_id > 50	-- filter out system SPIDs
		ORDER BY COUNT(session_id) DESC OPTION (RECOMPILE);

INSERT INTO [Monitor].[dbo].[tblRequest]
       SELECT GETDATE() Fecha,COUNT(*) CantRequest
       FROM sys.dm_exec_requests
GO

GO
--SqlScripter----[dbo].[SP_HEALTHREPORT].sql
GO
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

GO
--SqlScripter----[dbo].[SP_HEALTHREPORT_20141204].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_HEALTHREPORT_20141204]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_HEALTHREPORT_20141204] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- Batch submitted through debugger: SQLQuery6.sql|7|0|C:\Users\svasquez\AppData\Local\Temp\239\~vsE5D8.sql
ALTER PROCEDURE [dbo].[SP_HEALTHREPORT_20141204]
--/****************************************************************************/
--/*Nombre         : SP_HEALTHREPORT                                          */
--/*Autor          : Nicolas Huenul Mansilla                                  */
--/*Descripci¿n    : Reporte de Canje                                         */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 01-Julio-2013 10:00                                      */
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

SET @vcAsunto = '['+ @@servername +'] Reporte de rendimiento Canje Imagen - ['+ (select CONVERT(VARCHAR(10), GETDATE(), 101) + ' ' + CONVERT(VARCHAR(8), GETDATE(), 108) ) + ']'



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

create table tbl_Espacio_Reporte
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
and m.database_id NOT IN (1,2,3,4,5,10)
group by d.size/128.0,
      CAST(FILEPROPERTY(d.name, ''SpaceUsed'') AS INT)/128.0,
      d.type,vs.volume_mount_point,vs.total_bytes,vs.available_bytes';
/*exec sp_msforeachdb 
'use [?]; 
  select DB_NAME() AS DbName, 
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Status'')) ,  
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Recovery'')),  
    sum(d.size)/128.0 AS File_MB, 
    sum(CAST(FILEPROPERTY(d.name, ''SpaceUsed'') AS INT))/128.0 as Space_Used_MB, 
    SUM(d.size)/128.0 - sum(CAST(FILEPROPERTY(d.name,''SpaceUsed'') AS INT))/128.0 AS Free_Space_MB,
    vs.volume_mount_point as vol, 
    vs.total_bytes/1024/1024/1024 AS [Total GB], 
    vs.available_bytes/1024/1024/1024 AS [Available GB], 
    (((vs.total_bytes-available_bytes)*100)/vs.total_bytes) AS [Space Used %]
 use msdb
 go  
from sys.database_files d inner join sys.master_files m on d.file_id = m.file_id
CROSS APPLY sys.dm_os_volume_stats(DB_ID(), m.file_id) AS vs
where d.type=0 
--and m.database_id NOT IN (1,2,3,4,5)
group by d.type,vs.volume_mount_point,vs.total_bytes,vs.available_bytes';
*/


declare curSpace cursor for 
select Dbname,
       round(flFileSizeMB,2) as FileSizeMB,
       round(flSpaceUsedMB,2) as SpaceUsedMB,
       round(flFreeSpaceMB,2) as FreeSpaceMB,
       round((flSpaceUsedMB*100/flFileSizeMB),2) as PorcentajeUsado,
       vcVolumen,
       round(flTotalSpace,2),
       round(flAvailableSpace,2),
       round(flPercentageAvailable,2)
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
         <td COLSPAN="4">TAMAÑO FISICO</td></tr>
         <tr style="FONT-SIZE: 10px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td>DATABASE</td>
         <td>TAMAÑO BD [MB]</td>
         <td>USADO [MB]</td>
         <td>ESPACIO DISPONIBLE[MB]</td>
         <td>PORCENTAJE USADO [%]</td>
         <td>VOLUMEN</td>
         <td>ESPACIO TOTAL[GB]</td>
         <td>ESPACIO DISPONIBLE [GB]</td>
         <td>PORCENTAJE DE UTILIZACION [%]</td>
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
Fetch next from curSpace into @vcDatabase, @flFileSizeMB, @flSpaceUsedMB, @flFreeSpaceMB, @flPorcentajeUsado,@vcVolumen,@flTotalSpace,@flAvailableSpace,@flPercentageAvailable

WHILE @@FETCH_STATUS = 0

BEGIN
    SET @vcReporteDisco = @vcReporteDisco + '
         <tr style="FONT-SIZE: 10px;COLOR: #023962;FONT-FAMILY:Tahoma; TEXT-ALIGN: center">
         <td >' + @vcDatabase   + '</td>
         <td>' +  convert(varchar(20),@flFileSizeMB) + '</td>
         <td>' +  convert(varchar(20),@flSpaceUsedMB) + '</td>
         <td>' +  convert(varchar(20),@flFreeSpaceMB) + '</td>
         <td>' +  convert(varchar(20),@flPorcentajeUsado) + '</td>
         <td>' + @vcVolumen + '</td>
         <td>' +  convert(varchar(20),@flTotalSpace) + '</td>
         <td>' +  convert(varchar(20),@flAvailableSpace) + '</td>
         <td>' +  convert(varchar(20),@flPercentageAvailable) + '</td>
         </tr>'
fetch next from curSpace into @vcDatabase, @flFileSizeMB, @flSpaceUsedMB, @flFreeSpaceMB, @flPorcentajeUsado,@vcVolumen,@flTotalSpace,@flAvailableSpace,@flPercentageAvailable
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
                --@profile_name = 'PAPUDO',
                --@recipients = 'area_base_datos@sinacofi.cl;plataforma@sinacofi.cl;esaavedra@sinacofi.cl;csandoval@sinacofi.cl;lpereira@sinacofi.cl;rguajardo@sinacofi.cl;descobarr@sinacofi.cl;aacevedo@sinacofi.cl;cfucha@sinacofi.cl;hbalbontin@sinacofi.cl;ecordova@sinacofi.cl;dkokaly@sinacofi.cl',
                @recipients = 'svasquez@sinacofi.cl',
                @importance  = N'HIGH',
                @subject  = @vcAsunto,
                @body = @vcHTML_MENSAJE,
                @body_format  = N'HTML'
GO

GO
--SqlScripter----[dbo].[SP_HEALTHREPORT_20150522].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_HEALTHREPORT_20150522]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_HEALTHREPORT_20150522] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_HEALTHREPORT_20150522]
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
 vcVolumen varchar(10)
 );
 
--CAST(CAST(vs.available_bytes AS FLOAT)/ CAST(vs.total_bytes AS FLOAT) AS DECIMAL(18,1)) * 100 AS [Space Used %]

insert into #tmpDbSize(Dbname,vcdbstatus,vcRecoveryModel,flFileSizeMB,flSpaceUsedMB,flFreeSpaceMB) 
exec sp_msforeachdb 
'use [?]; 
select
    DB_NAME() AS DbName, 
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Status'')) ,  
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Recovery'')), 
    sum(d.size)/128.0 AS File_MB, 
    sum(CAST(FILEPROPERTY(d.name, ''SpaceUsed'') AS INT))/128.0 as Space_Used_MB, 
    SUM(d.size)/128.0 - sum(CAST(FILEPROPERTY(d.name,''SpaceUsed'') AS INT))/128.0 AS Free_Space_MB
from sys.database_files d inner join sys.master_files m on d.file_id = m.file_id
where d.type=0 
and m.database_id NOT IN (1,2,3,4,5)
group by d.type'


declare curSpace cursor for 
select Dbname,
       round(flFileSizeMB,2) as FileSizeMB,
       round(flSpaceUsedMB,2) as SpaceUsedMB,
       round(flFreeSpaceMB,2) as FreeSpaceMB,
       round((flSpaceUsedMB*100/flFileSizeMB),2) as PorcentajeUsado
from #tmpDbSize
order by 1 asc OPTION (RECOMPILE);

/******* ARMA REPORTE ****************/

SET @vcReporteDisco = '<div style="font-family:Verdana;font-size:18px">
         <p>ESTADISTICAS DE USO DE DISCO POR BASE DE DATOS</p>' +'<TABLE WIDTH="100%">
         <tr style="FONT-SIZE: 11px;COLOR: #FFFFFF;FONT-FAMILY:Verdana; bACKGROUND-COLOR: BLACK;TEXT-ALIGN: center">
         <td COLSPAN="5">TAMAÑO LOGICO</td></tr>
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
                @recipients = N'svasquez@sinacofi.cl', 
                @importance  = N'HIGH',
                @subject  = @vcAsunto,
                @body = @vcHTML_MENSAJE,
                @body_format  = N'HTML'
GO

GO
--SqlScripter----[dbo].[SP_HEALTHREPORT_DATOS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_HEALTHREPORT_DATOS]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_HEALTHREPORT_DATOS] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_HEALTHREPORT_DATOS]
--/****************************************************************************/
--/*Nombre         : SP_HEALTHREPORT                                          */
--/*Autor          : Sebastián Vásquez                                        */
--/*Descripci¿n    : Reporte AJAX                                             */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 22-Mayo-2015 10:00                                       */
--/*Versi¿n        : V01.00-000                                               */
--/*Bitacora       :                                                          */
--/****************************************************************************/
AS
DECLARE @flSqlServerUsed float
DECLARE @flTotalMemory float
DECLARE @flAvailableMemory float

-- Inserta en tabla de control tblRD_Sesiones
insert into tblRD_Sesiones(Fecha,login_name,host_name,Cantidad_Sesiones)
SELECT GETDATE() Fecha,
	   login_name,
       host_name, 
       COUNT(session_id) Cantidad_Sesiones
FROM sys.dm_exec_sessions WITH (NOLOCK)
WHERE session_id > 50	-- filter out system SPIDs
GROUP BY login_name,host_name
ORDER BY COUNT(session_id) DESC OPTION (RECOMPILE);

-- Inserta en tabla de control tblRD_Memoria
select @flSqlServerUsed = physical_memory_in_use_kb/1024/1024
from sys.dm_os_process_memory 

select @flTotalMemory = total_physical_memory_kb/1024/1024,
       @flAvailableMemory = available_physical_memory_kb/1024/1024
from sys.dm_os_sys_memory;

insert into tblRD_Memoria(fecha,Total,en_Uso,Disponible)
values (GETDATE(),@flTotalMemory,@flSqlServerUsed,@flAvailableMemory)

-- Inserta en tabla de control tblRD_TamannoBD

insert into tblRD_TamannoBD(Fecha,Dbname,vcdbstatus,vcRecoveryModel,flFileSizeMB,flSpaceUsedMB,flFreeSpaceMB) 
exec sp_msforeachdb 
'use [?]; 
select getdate() as Fecha,
    DB_NAME() AS DbName, 
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Status'')) ,  
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Recovery'')), 
    sum(d.size)/1024.0 AS File_MB, 
    sum(CAST(FILEPROPERTY(d.name, ''SpaceUsed'') AS INT))/1024.0 as Space_Used_MB, 
    SUM(d.size)/1024.0 - sum(CAST(FILEPROPERTY(d.name,''SpaceUsed'') AS INT))/1024.0 AS Free_Space_MB
from sys.database_files d inner join sys.master_files m on d.file_id = m.file_id
where d.type=0 
and m.database_id NOT IN (1,2,3,4,5)
group by d.type'
GO

GO
--SqlScripter----[dbo].[SP_HEALTHREPORT_vero].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_HEALTHREPORT_vero]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_HEALTHREPORT_vero] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_HEALTHREPORT_vero]
AS PRINT 'TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED'
GO

GO
--SqlScripter----[dbo].[SP_MONITOR_UPTIME].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_MONITOR_UPTIME]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_MONITOR_UPTIME] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_MONITOR_UPTIME]
--/****************************************************************************/
--/*Nombre         : SP_CUENTA_SESIONES                                       */
--/*Autor          : Nicolas Huenul Mansilla                                  */
--/*Descripci¿n    : Monitor UPTIME                                           */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 01-Junio-2012 10:00                                      */
--/*Versi¿n        : V01.00-000                                               */
--/*Bitacora       :                                                          */
--/****************************************************************************/
AS
declare
@v_fecha     VARCHAR(8),
@v_count     float,
@v_valor     float


  select @v_fecha = convert(char(8), getdate(), 112)

  select @v_count = count(*) from tblMonitorUptime where VCFECHA=@v_fecha

     if ( @v_count > 0 )

       begin
          select @v_valor = FLCOUNT from tblMonitorUptime where VCFECHA = @v_fecha
          update tblMonitorUptime set FLCOUNT = @v_valor + 1, FLPORCENTAJE = (@v_valor * 100) / 1439  where VCFECHA = @v_fecha
       end

     else
       insert into tblMonitorUptime (VCFECHA,FLCOUNT,FLPORCENTAJE) values (@v_fecha,1,0)
GO

GO
--SqlScripter----[dbo].[SP_MonitorErrorLog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_MonitorErrorLog]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_MonitorErrorLog] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_MonitorErrorLog]
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
exec xp_readerrorlog 0,1,'error',NULL,@vcFechaInicio,@vcFechaFin

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
    @recipients = N'area_base_datos@sinacofi.cl', 
    @importance  = N'HIGH',
    @subject  = @vcAsunto,
    @body = @vcReporteErrorLog,
    @body_format  = N'HTML'
END
GO

GO
--SqlScripter----[dbo].[SP_MONITORSESIONES].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_MONITORSESIONES]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_MONITORSESIONES] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_MONITORSESIONES]
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

--SET @vcProfileName = 'AJAX\SQLPROD02'

IF @iCountSession > 150
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
       @recipients = N'area_base_datos@sinacofi.cl', 
       @importance  = N'HIGH',
       @subject  = @MailSubject,
       @body = @vcReporteSesiones,
       @body_format  = N'HTML'
END
GO

GO
--SqlScripter----[dbo].[SP_Nagios_ObtieneCPU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_Nagios_ObtieneCPU]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_Nagios_ObtieneCPU] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_Nagios_ObtieneCPU]
AS
--CPU

declare @dtFechaIni datetime
declare @dtFechafin datetime
declare @siCpucount smallint
declare @Read float
declare @Write float
declare @vcServerName varchar(20)


select @dtFechaIni = dateadd(mi, -1, getdate())
select @dtFechafin = dateadd(mi, -0, getdate())

select @vcServerName = @@SERVERNAME

SELECT 
--CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '+00:00')) AS FechaHora, 
--CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14) AS FechaHora,
CASE pc.performance_object_name
     WHEN 'Processor' THEN 'System'
     ELSE 'SQL Server'
END AS tipo,
--CONVERT (datetime, SWITCHOFFSET (CAST (s.snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time, 
        -- Processor time on an eight proc system is 0-800% for the Process object, 
        -- but 0-100% for the Processor object
CASE pc.performance_object_name
     WHEN 'Processor' THEN ROUND (pc.formatted_value  , 2)
     ELSE ROUND (pc.formatted_value / @siCpucount,2)
END AS  perCPU
FROM PerformanceDW.snapshots.performance_counters pc
JOIN PerformanceDW.core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
WHERE s.instance_name = @vcServerName
--AND s.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
and pc.collection_time between @dtFechaIni and @dtFechafin
AND 
  (
   (pc.performance_object_name = 'Processor' AND pc.performance_counter_name = '% Processor Time' AND pc.performance_instance_name = '_Total')
    OR (pc.performance_object_name = 'Process' AND pc.performance_counter_name = '% Processor Time' AND pc.performance_instance_name = 'sqlservr')
  )		
ORDER BY pc.collection_time, tipo
GO

GO
--SqlScripter----[dbo].[SP_Nagios_ObtieneIO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_Nagios_ObtieneIO]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_Nagios_ObtieneIO] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_Nagios_ObtieneIO]
AS
--IO 
declare @dtFechaIni datetime
declare @dtFechafin datetime
declare @Read float
declare @Write float
declare @vcServerName varchar(20)
select @dtFechaIni = dateadd(mi, -1, getdate())
select @dtFechafin = dateadd(mi, -0, getdate())
select @vcServerName = @@SERVERNAME

SELECT 
       -- s.snapshot_time_id,
       -- CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14) AS FechaHora,
      --  N'Read' AS tipo,
        @Read=round(AVG(pc.formatted_value/(1024*1024)),2) 
    FROM PerformanceDW.snapshots.performance_counters pc
    JOIN PerformanceDW.core.snapshots s ON (s.snapshot_id = pc.snapshot_id  ) 
    WHERE s.instance_name = @vcServerName and 
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '-03:00')) >= dateadd(mi, -15, getdate()) 
        AND (pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'IO Read Bytes/sec' AND pc.performance_instance_name = 'sqlservr')             
    GROUP BY
       s.snapshot_time_id,
        CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14)
    order by  s.snapshot_time_id desc
    
SELECT 
       -- s.snapshot_time_id,
       -- CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14) AS FechaHora,
       -- N'Read' AS tipo,
        @Write=round(AVG(pc.formatted_value/(1024*1024)),2) 
    FROM PerformanceDW.snapshots.performance_counters pc
    JOIN PerformanceDW.core.snapshots s ON (s.snapshot_id = pc.snapshot_id  ) 
    WHERE s.instance_name = @vcServerName and 
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '-03:00')) >= dateadd(mi, -15, getdate())  
        AND (pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'IO Write Bytes/sec' AND pc.performance_instance_name = 'sqlservr')             
    GROUP BY
       s.snapshot_time_id,
        CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14)
    order by  s.snapshot_time_id desc    
--select  'Write bytes/s ' +  convert (varchar(20) , @Write ) +' | '+ 'Read bytes/s ' +  convert (varchar(20) , @Read ) 
select    convert(varchar(20) , @Write ) 
select   convert(varchar(20) , @Read ) 


    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
GO

GO
--SqlScripter----[dbo].[SP_Nagios_ObtieneMEM].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_Nagios_ObtieneMEM]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_Nagios_ObtieneMEM] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_Nagios_ObtieneMEM]
AS
declare @dtFechaIni datetime
declare @dtFechafin datetime
declare @siCpucount smallint
declare @Read float
declare @Write float
declare @vcServerName varchar(20)


select @dtFechaIni = dateadd(mi, -1, getdate())
select @dtFechafin = dateadd(mi, -0, getdate())

select @vcServerName = @@SERVERNAME
    SELECT --s.snapshot_time_id,
        --CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14) AS FechaHora,
        N'SQL Server' AS series,
        round(AVG(pc.formatted_value/(1024*1024)),2) AS memMB
    FROM PerformanceDW.snapshots.performance_counters pc
    JOIN PerformanceDW.core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @vcServerName
        AND pc.collection_time BETWEEN @dtFechaIni AND @dtFechafin
        AND (pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'Working Set' AND pc.performance_instance_name = 'sqlservr')
    GROUP BY
       s.snapshot_time_id,
    CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14)
    UNION ALL
 SELECT 
		--s.snapshot_time_id,
       -- CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14) AS FechaHora,
        N'System' AS tipo,
        round(AVG(pc.formatted_value/(1024*1024)),2) AS memMB
    FROM PerformanceDW.snapshots.performance_counters pc
    JOIN PerformanceDW.core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @vcServerName
        AND pc.collection_time BETWEEN @dtFechaIni AND @dtFechafin
        AND (pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'Working Set' AND pc.performance_instance_name = '_Total')
             -- uncomment when defect 109313 is fixed
             --OR pc.path LIKE N'\Memory\Pool Nonpaged Bytes' 
             --OR pc.path LIKE N'\Memory\Cache Bytes')
    GROUP BY
		s.snapshot_time_id,
        CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14)


    --ORDER BY s.snapshot_time_id,FechaHora
    -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
GO

GO
--SqlScripter----[dbo].[sp_ObtieneLoginFailed].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_ObtieneLoginFailed]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_ObtieneLoginFailed] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_ObtieneLoginFailed]
AS

begin tran
    select isnull(MAX(lo.dtFecha), '20130101') dtFecha, ult.vcInstancia
    into #tmpMaxFecInstancias
    from tblLoginFailed lo
    right join tblLoginFailedUltRegistro ult
    on lo.vcInstancia = ult.vcInstancia
    group by ult.vcInstancia

    select lo.* 
    from tblLoginFailed lo,
         tblLoginFailedUltRegistro ult,
         #tmpMaxFecInstancias maxi
    where lo.dtFecha > ult.dtFecha
      and lo.vcInstancia = ult.vcInstancia
      and lo.dtFecha <= maxi.dtFecha
      and lo.vcInstancia = maxi.vcInstancia
    order by lo.dtFecha

    delete tblLoginFailedUltRegistro
    insert into tblLoginFailedUltRegistro
    select * from #tmpMaxFecInstancias
commit
GO

GO
--SqlScripter----[dbo].[sp_ObtieneLoginFailedFTP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_ObtieneLoginFailedFTP]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_ObtieneLoginFailedFTP] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_ObtieneLoginFailedFTP]
AS

print ''

set nocount on

    select isnull(MAX(lo.dtFecha), '20130101') dtFecha, ult.vcInstancia
    into #tmpMaxFecInstancias
    from tblLoginFailed lo
    right join tblLoginFailedUltFTP ult
    on lo.vcInstancia = ult.vcInstancia
    group by ult.vcInstancia

    select lo.* 
    from tblLoginFailed lo,
         tblLoginFailedUltFTP ult,
         #tmpMaxFecInstancias maxi
    where lo.dtFecha > ult.dtFecha
      and lo.vcInstancia = ult.vcInstancia
      and lo.dtFecha <= maxi.dtFecha
      and lo.vcInstancia = maxi.vcInstancia
    order by lo.dtFecha

    update tblLoginFailedUltFTP
    set dtFecha = tmp.dtFecha
    from #tmpMaxFecInstancias tmp, tblLoginFailedUltFTP ult
    where tmp.vcInstancia = ult.vcInstancia
GO

GO
--SqlScripter----[dbo].[sp_PRUEBA_NETAPP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_PRUEBA_NETAPP]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_PRUEBA_NETAPP] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_PRUEBA_NETAPP]
AS
  update tblContador
  set iNumero = iNumero + 1,
      iHora = GETDATE()
GO

GO
--SqlScripter----[dbo].[SP_PURGE_MAIL].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_PURGE_MAIL]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_PURGE_MAIL] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_PURGE_MAIL]
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
DECLARE @DeleteBeforeDate DATETIME  

 
SELECT @DeleteBeforeDate = Dateadd(d, -30, Getdate())  
 
EXEC msdb..sysmail_delete_mailitems_sp  
  
@sent_before = @DeleteBeforeDate  

--SELECT @DeleteBeforeDate = Dateadd(d, -10, Getdate())  
 
EXEC msdb..sysmail_delete_log_sp  

@logged_before = @DeleteBeforeDate
GO

GO
--SqlScripter----[dbo].[xpadm_avisomantencion_bdsnman2000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[xpadm_avisomantencion_bdsnman2000]') IS NULL EXEC('CREATE PROCEDURE [dbo].[xpadm_avisomantencion_bdsnman2000] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[xpadm_avisomantencion_bdsnman2000]
AS PRINT 'TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED'
GO

GO
--SqlScripter----[dbo].[xpadm_cambiocontrasena_dba].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[xpadm_cambiocontrasena_dba]') IS NULL EXEC('CREATE PROCEDURE [dbo].[xpadm_cambiocontrasena_dba] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[xpadm_cambiocontrasena_dba]
AS
declare @updatedate datetime
declare @mensaje varchar(255)
declare @asunto varchar(255)
declare @vcProfileName varchar(255)
declare @loginname varchar(50)
declare @server char(30) 
declare @MEN varchar(2048)
DECLARE @vcLoginExpirado varchar(2500)
declare @HTML_MENSAJE varchar(4048),@nombre_usuario1 varchar(30)

select @server = rtrim(@@servername)

declare curLogin cursor for 
SELECT  p.name AS [loginname],
        s.updatedate AS [updatedate]
FROM    sys.server_principals p
        JOIN sys.syslogins s ON p.sid = s.sid
WHERE   p.type_desc IN ('SQL_LOGIN')
        -- Logins that are not process logins
        AND p.name NOT LIKE 'ope_m%'  AND p.name NOT LIKE 'ope_r%'
        -- Logins that are sysadmins
        AND s.sysadmin = 1
        and is_disabled = 0;

select @vcProfileName = name from msdb..sysmail_profile

Open curLogin
Fetch next from curLogin into @loginname, @updatedate

WHILE @@FETCH_STATUS = 0
BEGIN

if DATEDIFF(day, @updatedate, getdate()) >=30 and @loginname <> 'ope_sa'
BEGIN

SET @asunto = 'La cuenta ' + @loginname + ' Expiro'

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
         <td >' + @loginname   + '</td>
         <td>' +  convert(varchar(20),@updatedate) + '</td>
         </tr>'

SET @HTML_MENSAJE = N'<HTML><P>' + @vcLoginExpirado + N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109)) + '.'
 + '</p>'
                exec  msdb..sp_send_dbmail
                @profile_name = @vcProfileName,
                --@recipients = N'nhuenul@sinacofi.cl', 
                @recipients = N'area_base_datos@sinacofi.cl', 
                @importance  = N'HIGH',
                @subject  = @asunto,
                @body = @HTML_MENSAJE,
                @body_format  = N'HTML'
END

if DATEDIFF(day, @updatedate, getdate()) >=90 and @loginname = 'ope_sa'
BEGIN

SET @asunto = 'La cuenta ' + @loginname + ' Expiro'

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
         <td >' + @loginname   + '</td>
         <td>' +  convert(varchar(20),@updatedate) + '</td>
         </tr>'

SET @HTML_MENSAJE = N'<HTML><P>' + @vcLoginExpirado + N'</P></table></HTML><hr>'
 + '<p>'
 + ' <div style="font-family:Verdana;font-size:10px">'
 + '<FONT COLOR="green">Este mensaje ha sido generado automaticamente desde '+ @@servername + ' ' + (SELECT CONVERT(VARCHAR(26), GETDATE(), 109)) + '.'
 + '</p>'
                exec  msdb..sp_send_dbmail
                @profile_name = @vcProfileName,
                --@recipients = N'nhuenul@sinacofi.cl', 
                @recipients = N'area_base_datos@sinacofi.cl', 
                @importance  = N'HIGH',
                @subject  = @asunto,
                @body = @HTML_MENSAJE,
                @body_format  = N'HTML'
END


fetch next from curLogin into @loginname, @updatedate
END
CLOSE curLogin
DEALLOCATE curLogin
GO

GO
--SqlScripter----[dbo].[xpadm_monitoreaauditoria].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[xpadm_monitoreaauditoria]') IS NULL EXEC('CREATE PROCEDURE [dbo].[xpadm_monitoreaauditoria] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[xpadm_monitoreaauditoria]
AS
declare @mensaje varchar(255)
declare @server char(30) 
declare @HTML_MENSAJE varchar(4048),  @MEN varchar(2048)
declare @icont int, @ivalor int, @error int
select @ivalor=0, @icont=0, @error =0

truncate table tbl_monitorauditoria_dia

insert into tbl_monitorauditoria_dia (trace,property,value)
SELECT traceid, property, convert(varchar(200),value) FROM ::fn_trace_getinfo(0)

insert into tbl_monitorauditoria 
SELECT * from tbl_monitorauditoria_dia

select @icont=COUNT(*) from tbl_monitorauditoria_dia
select @server = rtrim(@@servername)

if @icont < 10 
begin
  select @error=1
end

if @icont = 10 
begin
select @ivalor=value from tbl_monitorauditoria_dia 
where trace=2 and property=5

if @ivalor < 1 --menor 1
begin
 select @error=1
end
end

if  @error=1
begin
SET @MENSAJE = '<html><head><TITLE>Department Report</TITLE>
                    </head><body><p>
                    <font style="font-family:Tahoma;FONT-WEIGHT: bold; FONT-SIZE: 13px;COLOR: #023962">Auditoria SqlServer Deshabilitada -BAD, Servidor 
                    <table  width="70%" style="border-collapse: collapse; border-top: 3px solid #cce49d">
                    <tr><td></td></tr></table></font>' +  @server+ '</p>'


 SET @MENSAJE = @MENSAJE + '
         <tr>
         <td>' + @men   + '</td>
         <td>' + convert(varchar(10),'cflores') + '</td>
         <td>' + convert(varchar(30),getdate(),113) + '</td>
         </tr>'
         set @mensaje='Revisar Auditoria SqlServer (BD: Monitor, tabla: tbl_monitorauditoria) en servidor '+ @@servername
                    set @HTML_MENSAJE = N'<HTML><P>' + @MENSAJE + N'</P></HTML>'
                 exec  msdb..sp_send_dbmail
                @profile_name = 'AJAX',
                @recipients = N'area_base_datos@sinacofi.cl', 
                @importance  = N'HIGH',
                @subject  = N'Auditoria SqlServer Deshabilitada -BAD',
                @body = @mensaje,
                @body_format  = N'HTML'

end
GO

GO
--SqlScripter----[dbo].[xpadm_sizebd_files].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[xpadm_sizebd_files]') IS NULL EXEC('CREATE PROCEDURE [dbo].[xpadm_sizebd_files] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[xpadm_sizebd_files]
AS
declare @name varchar(80),
@obj varchar(50),
@op1 varchar(100),
@op2 varchar(100),
@op3 varchar(100),
@op4 varchar(100),
@dbid int

--lect ((convert(float,size)) * (8192.0/1024.0))/1024.0, name from sysfiles

create table #tbl_estadis (c1 varchar (80),c2 int null, c3 float, c4 varchar(80), fecha datetime)

DECLARE dbnames  CURSOR LOCAL FOR SELECT name, dbid FROM master..sysdatabases  --where name not in ('master','model','msdb','tempdb','pubs','Northwind')
OPEN dbnames

FETCH dbnames into @name, @dbid
   WHILE @@FETCH_STATUS = 0 BEGIN
   PRINT '** Tamaño BD ***  ' + @NAME
        insert into #tbl_estadis exec("select '' ,null, ((convert(float,size)) * (8192.0/1024.0))/1024.0, name , getdate() FROM " + @name + "..sysfiles")

        update #tbl_estadis
        set c1 =@name, c2 =@dbid

        insert into tbl_sizebd_files 
        select * from  #tbl_estadis 

	--select * from #tbl_estadis 
	truncate table #tbl_estadis 
   FETCH dbnames into @name, @dbid
   END /* bucle de captura */
   DEALLOCATE dbnames
GO
