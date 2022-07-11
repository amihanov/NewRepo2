SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_start_service]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_start_service] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_start_service    Script Date: 12/1/2005 11:49:13 PM ******/

ALTER PROCEDURE [dbo].[tng_start_service]
( @servicename  varchar(64))

as 
	declare @cmdline varchar(255)

	select @cmdline = 'net start ' + @servicename

 	exec tng_master..xp_cmdshell  @cmdline , NO_OUTPUT
GO
