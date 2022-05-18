
GO
--SqlScripter----[snapshots].[fn_get_performance_counter_statistics].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[fn_get_performance_counter_statistics]') IS NULL EXEC('CREATE FUNCTION [snapshots].[fn_get_performance_counter_statistics] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [snapshots].[fn_get_performance_counter_statistics]
(
    @instance_name       sysname,
    @path_pattern         nvarchar(2048),
    @start_time          datetimeoffset(7) = NULL,
    @end_time            datetimeoffset(7) = NULL
) 
RETURNS TABLE
AS
RETURN
(
    SELECT 
        pc.path                        as path,
        MIN(pc.formatted_value)        as minimum_value,
        MAX(pc.formatted_value)        as maximum_value,
        AVG(pc.formatted_value)        as average_value,
        STDEV(pc.formatted_value)    as standard_deviation,
        VAR(pc.formatted_value)        as statistical_variance
    FROM [snapshots].[performance_counters] as pc
    JOIN [core].[snapshots] s on s.snapshot_id = pc.snapshot_id
    WHERE
        s.instance_name = @instance_name AND
        pc.path LIKE @path_pattern AND
        pc.collection_time >= @start_time AND
        pc.collection_time <= @end_time
    GROUP BY pc.path
)
GO

GO
--SqlScripter----[snapshots].[fn_get_performance_counters].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[fn_get_performance_counters]') IS NULL EXEC('CREATE FUNCTION [snapshots].[fn_get_performance_counters] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [snapshots].[fn_get_performance_counters]
(
    @instance_name       sysname,
    @start_time          datetimeoffset(7) = NULL,
    @end_time            datetimeoffset(7) = NULL
) 
RETURNS TABLE
AS
RETURN
(
    SELECT 
        pc.performance_counter_id AS performance_counter_id,
        pc.collection_time AS collection_time,
        pc.path AS path,
        pc.performance_object_name AS performance_object_name,
        pc.performance_counter_name AS performance_counter_name,
        pc.performance_instance_name AS performance_instance_name,
        pc.formatted_value AS formatted_value
    FROM [snapshots].[performance_counters] as pc
    JOIN [core].[snapshots] s on s.snapshot_id = pc.snapshot_id
    WHERE
        @instance_name = s.instance_name AND
        ISNULL(@start_time,CAST (0 AS DATETIME)) <= pc.collection_time AND
        ISNULL(@end_time,GETDATE()) >= pc.collection_time
)
GO

GO
--SqlScripter----[snapshots].[fn_trace_gettable].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[fn_trace_gettable]') IS NULL EXEC('CREATE FUNCTION [snapshots].[fn_trace_gettable] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [snapshots].[fn_trace_gettable]
(
    @trace_info_id       int,
    @start_time          datetimeoffset(7) = NULL,
    @end_time            datetimeoffset(7) = NULL
) 
RETURNS TABLE
AS
RETURN
(
    SELECT 
        TextData,
        BinaryData,
        DatabaseID,
        TransactionID,
        LineNumber,
        NTUserName,
        NTDomainName,
        HostName,
        ClientProcessID,
        ApplicationName,
        LoginName,
        SPID,
        Duration,
        StartTime,
        EndTime,
        Reads,
        Writes,
        CPU,
        Permissions,
        Severity,
        EventSubClass,
        ObjectID,
        Success,
        IndexID,
        IntegerData,
        ServerName,
        EventClass,
        ObjectType,
        NestLevel,
        State,
        Error,
        Mode,
        Handle,
        ObjectName,
        DatabaseName,
        FileName,
        OwnerName,
        RoleName,
        TargetUserName,
        DBUserName,
        LoginSid,
        TargetLoginName,
        TargetLoginSid,
        ColumnPermissions,
        LinkedServerName,
        ProviderName,
        MethodName,
        RowCounts,
        RequestID,
        XactSequence,
        EventSequence,
        BigintData1,
        BigintData2,
        GUID,
        IntegerData2,
        ObjectID2,
        Type,
        OwnerID,
        ParentName,
        IsSystem,
        Offset,
        SourceDatabaseID,
        SqlHandle,
        SessionLoginName,
        PlanHandle
    FROM snapshots.trace_data
    WHERE
        trace_info_id = @trace_info_id
        AND StartTime >= ISNULL(@start_time, '1753-01-01')
        AND StartTime <= ISNULL(@end_time, '9999-12-31')
)
GO
