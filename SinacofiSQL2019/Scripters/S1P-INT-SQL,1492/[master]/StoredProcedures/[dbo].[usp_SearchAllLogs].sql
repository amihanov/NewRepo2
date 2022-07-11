SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usp_SearchAllLogs]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usp_SearchAllLogs] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- ================================================================
-- Author: Sebastian Vasquez
-- Create date: 07-2018
-- Procedure Name: dbo.usp_SearchAllLogs
-- Description:
--    Search for a string through all available logs where:
--    LogType = 1 (SQL Server log) 
--    LogType = 2 (SQL Agent log)
--    @filterstr is the rows filter - leave it blank for everything
-- ================================================================
ALTER PROCEDURE [dbo].[usp_SearchAllLogs]
(@LogType INT = 1, @filterstr NVARCHAR (4000) = '')
AS
BEGIN
   -- The list of all logs table
   DECLARE @LogList TABLE (LogNumber INT, StartDate DATETIME, SizeInBytes INT)
   -- All the log rows results table
   DECLARE @ALLLogRows TABLE (LogDate DATETIME, 
                              ProcessInfo NVARCHAR (4000), 
                              Test NVARCHAR (4000))
 
   -- Store in a table variable
   INSERT INTO @LogList 
   EXEC xp_enumerrorlogs @LogType
 
   -- Iterate on all the logs and collect all log rows
   DECLARE @idx INT = 0
   WHILE @idx <= (SELECT MAX (LogNumber) FROM @LogList)
   BEGIN
      INSERT INTO @ALLLogRows
      EXEC xp_readerrorlog @idx -- Log number
         , @LogType -- 1=SQL Server log, 2=SQL Agent log
         , @filterstr -- filter string
         , @filterstr
 
      SET @idx += 1
   END
   -- Return the results from the log rows table variable
   SELECT *
   FROM @ALLLogRows
   ORDER BY LogDate DESC
END
GO
