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
