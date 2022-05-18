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
