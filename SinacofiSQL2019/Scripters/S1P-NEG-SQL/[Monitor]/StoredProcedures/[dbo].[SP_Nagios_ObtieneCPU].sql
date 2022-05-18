SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_Nagios_ObtieneCPU]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_Nagios_ObtieneCPU] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_Nagios_ObtieneCPU]
AS
--CPU

declare @dtFechaIni datetime
declare @dtFechafin datetime
declare @siCpucount smallint
declare @Read float
declare @Write float
declare @vcServerName varchar(20)


select @dtFechaIni = dateadd(mi, -1, getdate())
select @dtFechafin = dateadd(mi, -0, getdate())


select @vcServerName = @@SERVERNAME

SELECT 
--CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '+00:00')) AS FechaHora, 
--CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14) AS FechaHora,
CASE pc.performance_object_name
     WHEN 'Processor' THEN 'System'
     ELSE 'SQL Server'
END AS tipo,
--CONVERT (datetime, SWITCHOFFSET (CAST (s.snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time, 
        -- Processor time on an eight proc system is 0-800% for the Process object, 
        -- but 0-100% for the Processor object
CASE pc.performance_object_name
     WHEN 'Processor' THEN ROUND (pc.formatted_value  , 2)
     ELSE ROUND (pc.formatted_value / @siCpucount,2)
END AS  perCPU
FROM PerformanceDW.snapshots.performance_counters pc
JOIN PerformanceDW.core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
WHERE s.instance_name = @vcServerName
--AND s.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
and pc.collection_time between @dtFechaIni and @dtFechafin
AND 
  (
   (pc.performance_object_name = 'Processor' AND pc.performance_counter_name = '% Processor Time' AND pc.performance_instance_name = '_Total')
    OR (pc.performance_object_name = 'Process' AND pc.performance_counter_name = '% Processor Time' AND pc.performance_instance_name = 'sqlservr')
  )		
ORDER BY pc.collection_time, tipo
GO
