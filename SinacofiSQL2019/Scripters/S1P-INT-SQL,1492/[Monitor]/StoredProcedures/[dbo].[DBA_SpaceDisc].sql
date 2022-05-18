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
