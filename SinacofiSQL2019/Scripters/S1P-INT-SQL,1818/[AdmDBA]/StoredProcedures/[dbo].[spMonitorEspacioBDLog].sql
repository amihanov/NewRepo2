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
