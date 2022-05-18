SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbnet_ejec_cmd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_ejec_cmd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_ejec_cmd]
@p_comando varchar(255),@p_parametro varchar(255), @p_entorno varchar(255),
	@p_error varchar(1) output, @p_mensaje varchar(255) output 
 as
declare @v_comando varchar(255)
begin
 set @p_error = 'N'
 set @v_comando = '%'+@p_entorno+'%\bin\'+@p_comando+' '+@p_parametro + ' -h '  + @p_entorno
print @v_comando
EXEC master..xp_cmdshell @v_comando
end
GO
