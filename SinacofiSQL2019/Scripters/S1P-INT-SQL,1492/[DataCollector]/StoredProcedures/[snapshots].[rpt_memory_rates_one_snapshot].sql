SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_memory_rates_one_snapshot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_memory_rates_one_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_memory_rates_one_snapshot]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        pc.performance_counter_name AS series,
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        pc.collection_time,
        pc.formatted_value
    FROM snapshots.performance_counters pc
    INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id = @snapshot_time_id
        AND pc.performance_object_name = 'Memory' 
        AND pc.performance_counter_name IN ('Page Faults/sec', 'Page Reads/sec', 'Page Writes/sec', 'Cache Faults/sec')
    ORDER BY 
        pc.collection_time, series
END;
GO
