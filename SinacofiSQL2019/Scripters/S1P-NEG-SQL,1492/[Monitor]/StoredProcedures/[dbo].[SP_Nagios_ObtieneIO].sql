SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_Nagios_ObtieneIO]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_Nagios_ObtieneIO] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_Nagios_ObtieneIO]
AS
--IO 
declare @dtFechaIni datetime
declare @dtFechafin datetime
declare @Read float
declare @Write float
declare @vcServerName varchar(20)
select @dtFechaIni = dateadd(mi, -1, getdate())
select @dtFechafin = dateadd(mi, -0, getdate())
select @vcServerName = @@SERVERNAME

SELECT 
       -- s.snapshot_time_id,
       -- CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14) AS FechaHora,
      --  N'Read' AS tipo,
        @Read=round(AVG(pc.formatted_value/(1024*1024)),2) 
    FROM PerformanceDW.snapshots.performance_counters pc
    JOIN PerformanceDW.core.snapshots s ON (s.snapshot_id = pc.snapshot_id  ) 
    WHERE s.instance_name = @vcServerName and 
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '-03:00')) >= dateadd(mi, -15, getdate()) 
        AND (pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'IO Read Bytes/sec' AND pc.performance_instance_name = 'sqlservr')             
    GROUP BY
       s.snapshot_time_id,
        CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14)
    order by  s.snapshot_time_id desc
    
SELECT 
       -- s.snapshot_time_id,
       -- CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14) AS FechaHora,
       -- N'Read' AS tipo,
        @Write=round(AVG(pc.formatted_value/(1024*1024)),2) 
    FROM PerformanceDW.snapshots.performance_counters pc
    JOIN PerformanceDW.core.snapshots s ON (s.snapshot_id = pc.snapshot_id  ) 
    WHERE s.instance_name = @vcServerName and 
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '-03:00')) >= dateadd(mi, -15, getdate())  
        AND (pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'IO Write Bytes/sec' AND pc.performance_instance_name = 'sqlservr')             
    GROUP BY
       s.snapshot_time_id,
        CONVERT(VARCHAR(10), pc.collection_time, 103) + ' '  + convert(VARCHAR(8), pc.collection_time, 14)
    order by  s.snapshot_time_id desc    
--select  'Write bytes/s ' +  convert (varchar(20) , @Write ) +' | '+ 'Read bytes/s ' +  convert (varchar(20) , @Read ) 
select    convert(varchar(20) , @Write ) 
select   convert(varchar(20) , @Read ) 


    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
GO
