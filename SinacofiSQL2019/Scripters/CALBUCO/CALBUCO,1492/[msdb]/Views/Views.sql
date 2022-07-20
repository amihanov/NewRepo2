
GO
--SqlScripter----[dbo].[sysdtslog90].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sysdtslog90]') IS NULL EXEC('CREATE VIEW [dbo].[sysdtslog90] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[sysdtslog90]
AS
	SELECT [id]
		  ,[event]
		  ,[computer]
		  ,[operator]
		  ,[source]
		  ,[sourceid]
		  ,[executionid]
		  ,[starttime]
		  ,[endtime]
		  ,[datacode]
		  ,[databytes]
		  ,[message]
	  FROM [msdb].[dbo].[sysssislog]
GO
