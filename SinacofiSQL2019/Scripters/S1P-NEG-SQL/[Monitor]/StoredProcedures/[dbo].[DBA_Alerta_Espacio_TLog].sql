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
                @profile_name = 'AJAX\SQLPROD01',
                @recipients = N'area_base_datos@sinacofi.cl', 
                @importance  = N'HIGH',
                @subject  = N'ALERTA de espacio en Transaction Log',
                @body =  @HTML_MENSAJE,
                @body_format  = N'HTML'
    END 
 CLOSE consulta_log
 DEALLOCATE consulta_log
GO
