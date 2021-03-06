SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_requests_and_compilations]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_requests_and_compilations] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_requests_and_compilations]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        pc.performance_counter_name AS series,
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        pc.formatted_value
    FROM snapshots.performance_counters pc
    INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id = @snapshot_time_id
        AND pc.performance_object_name LIKE '%SQL%:SQL Statistics'
        AND pc.performance_counter_name IN ('Batch Requests/sec', 'SQL Compilations/sec', 
            'SQL Re-Compilations/sec', 'Auto-Param Attempts/sec', 'Failed Auto-Params/sec')
    ORDER BY pc.collection_time, pc.performance_counter_name
END;
GO
