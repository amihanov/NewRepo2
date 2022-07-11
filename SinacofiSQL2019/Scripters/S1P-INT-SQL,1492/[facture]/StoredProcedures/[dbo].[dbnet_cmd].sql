SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbnet_cmd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_cmd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_cmd]
@comando varchar(200), 
@parametros varchar(200) 
 as
declare
@cmd varchar(400)
begin
set @cmd = @comando + ' ' + @parametros
EXEC master..xp_cmdshell @cmd
end
GO
