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
