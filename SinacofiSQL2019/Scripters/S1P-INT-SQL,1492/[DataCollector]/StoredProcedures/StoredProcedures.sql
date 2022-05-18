
GO
--SqlScripter----[core].[sp_add_collector_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[core].[sp_add_collector_type]') IS NULL EXEC('CREATE PROCEDURE [core].[sp_add_collector_type] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [core].[sp_add_collector_type]
@collector_type_uid     uniqueidentifier
AS
BEGIN
    -- Security check (role membership)
    IF (NOT (ISNULL(IS_MEMBER(N'mdw_admin'), 0) = 1) AND NOT (ISNULL(IS_SRVROLEMEMBER(N'sysadmin'), 0) = 1))
    BEGIN
        RAISERROR(14677, 16, -1, 'mdw_admin')
        RETURN(1) -- Failure
    END

    -- Parameters check
    IF (@collector_type_uid IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@collector_type_uid')
        RETURN(1) -- Failure
    END

    -- Insert new collector type
    IF NOT EXISTS (SELECT collector_type_uid FROM core.supported_collector_types WHERE collector_type_uid = @collector_type_uid)
    BEGIN
        INSERT INTO core.supported_collector_types
        (
            collector_type_uid
        )
        VALUES
        (
            @collector_type_uid
        )
    END
    ELSE
    BEGIN
        -- Raise an info message, but do not fail
        DECLARE @collector_type_uid_as_char NVARCHAR(36)
        SELECT @collector_type_uid_as_char = CONVERT(NVARCHAR(36), @collector_type_uid)
        RAISERROR(14261, 10, -1, '@collector_type_uid', @collector_type_uid_as_char)
    END

    RETURN (0)
END
GO

GO
--SqlScripter----[core].[sp_create_snapshot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[core].[sp_create_snapshot]') IS NULL EXEC('CREATE PROCEDURE [core].[sp_create_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [core].[sp_create_snapshot]
@collection_set_uid     uniqueidentifier,
    @collector_type_uid     uniqueidentifier,
    @machine_name           sysname,
    @named_instance         sysname,
    @log_id                 bigint,
    @snapshot_id            int OUTPUT
AS 
BEGIN
    SET NOCOUNT ON
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

    -- Security check (role membership)
    IF (NOT (ISNULL(IS_MEMBER(N'mdw_writer'), 0) = 1) AND NOT (ISNULL(IS_SRVROLEMEMBER(N'sysadmin'), 0) = 1))
    BEGIN
        RAISERROR(14677, 16, -1, 'mdw_writer')
        RETURN(1) -- Failure
    END
    
    DECLARE @operator sysname;
    SELECT @operator = SUSER_SNAME();

    DECLARE @instance_name sysname
    SET @named_instance = NULLIF(RTRIM(LTRIM(@named_instance)), N'')
    IF (@named_instance = 'MSSQLSERVER')
        SET @instance_name = @machine_name
    ELSE
        SET @instance_name = @machine_name + N'\' + @named_instance

    -- Parameters check
    -- Find the source_id that matches the requested collection set and operator
    DECLARE @source_id  int
    SET @source_id = (SELECT source_id 
                        FROM core.source_info_internal
                        WHERE collection_set_uid = @collection_set_uid 
                          AND operator = @operator
                          AND instance_name = @instance_name)

    IF(@source_id IS NULL)
    BEGIN
        DECLARE @collection_set_uid_as_char NVARCHAR(36)
        SELECT @collection_set_uid_as_char = CONVERT(NVARCHAR(36), @collection_set_uid)
        RAISERROR(14679, -1, -1, N'@collection_set_uid', @collection_set_uid_as_char)
    END

    -- Make sure the collector_type is registered in this warehouse
    IF NOT EXISTS (SELECT collector_type_uid FROM core.supported_collector_types WHERE collector_type_uid = @collector_type_uid)
    BEGIN
        DECLARE @collector_type_uid_as_char NVARCHAR(36)
        SELECT @collector_type_uid_as_char = CONVERT(NVARCHAR(36), @collector_type_uid)
        RAISERROR(14679, -1, -1, N'@collector_type_uid', @collector_type_uid_as_char)
    END

    -- Get the snapshot time
    BEGIN TRY
        BEGIN TRAN
        DECLARE @snapshot_time_id int

        IF NOT EXISTS (SELECT snapshot_time_id FROM core.snapshot_timetable_internal WITH(UPDLOCK) WHERE snapshot_time > DATEADD (minute, -1, SYSDATETIMEOFFSET()))
        BEGIN
            INSERT INTO core.snapshot_timetable_internal
            (
                snapshot_time
            )
            VALUES
            (
                SYSDATETIMEOFFSET()
            )
            SET @snapshot_time_id = SCOPE_IDENTITY()
        END
        ELSE
        BEGIN
            SET @snapshot_time_id = (SELECT MAX(snapshot_time_id) FROM core.snapshot_timetable_internal)
        END

        -- Finally insert an entry into snapshots table
        INSERT INTO core.snapshots_internal
        (
            snapshot_time_id,
            source_id,
            log_id
        )
        VALUES
        (
            @snapshot_time_id,
            @source_id,
            @log_id
        )
        SET @snapshot_id = SCOPE_IDENTITY()

        IF (@snapshot_id IS NULL)
        BEGIN
            RAISERROR(14262, -1, -1, '@snapshot_id', @snapshot_id)
            RETURN(1)
        END
        ELSE
        BEGIN
            COMMIT TRAN
        END
    END TRY
    BEGIN CATCH
        IF (@@TRANCOUNT > 0) 
            ROLLBACK TRANSACTION

        -- Rethrow the error
        DECLARE @ErrorMessage   NVARCHAR(4000);
        DECLARE @ErrorSeverity  INT;
        DECLARE @ErrorState     INT;
        DECLARE @ErrorNumber    INT;
        DECLARE @ErrorLine      INT;
        DECLARE @ErrorProcedure NVARCHAR(200);
        SELECT @ErrorLine = ERROR_LINE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE(),
               @ErrorNumber = ERROR_NUMBER(),
               @ErrorMessage = ERROR_MESSAGE(),
               @ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-');

        RAISERROR (14684, -1, -1 , @ErrorNumber, @ErrorSeverity, @ErrorState, @ErrorProcedure, @ErrorLine, @ErrorMessage);
    END CATCH

END
GO

GO
--SqlScripter----[core].[sp_purge_data].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[core].[sp_purge_data]') IS NULL EXEC('CREATE PROCEDURE [core].[sp_purge_data] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [core].[sp_purge_data]
@retention_days smallint = NULL,
    @instance_name sysname = NULL,
    @collection_set_uid uniqueidentifier = NULL,
    @duration smallint = NULL,
    @delete_batch_size int = 500
AS
BEGIN
    -- Security check (role membership)
    IF (NOT (ISNULL(IS_MEMBER(N'mdw_admin'), 0) = 1) AND NOT (ISNULL(IS_SRVROLEMEMBER(N'sysadmin'), 0) = 1))
    BEGIN
        RAISERROR(14677, 16, -1, 'mdw_admin')
        RETURN(1) -- Failure
    END

    -- Validate parameters
    IF ((@retention_days IS NOT NULL) AND (@retention_days < 0))
    BEGIN
        RAISERROR(14200, -1, -1, '@retention_days')
        RETURN(1) -- Failure
    END

    IF ((@duration IS NOT NULL) AND (@duration < 0))
    BEGIN
        RAISERROR(14200, -1, -1, '@duration')
        RETURN(1) -- Failure
    END

    -- This table will contain a record if somebody requests purge to stop
    -- If user requested us to purge data - we reset the content of it - and proceed with purge
    -- If somebody in a different session wants purge operations to stop he adds a record
    -- that we will discover while purge in progress
    --
    -- We dont clear this flag when we exit since multiple purge operations with differnet
    -- filters may proceed, and we want all of them to stop.
    DELETE FROM [core].[purge_info_internal]

    SET @instance_name = NULLIF(LTRIM(RTRIM(@instance_name)), N'')

    -- Calculate the time when the operation should stop (NULL otherwise)
    DECLARE @end_time datetime
    IF (@duration IS NOT NULL)
    BEGIN
        SET @end_time = DATEADD(minute, @duration, GETUTCDATE())
    END

    -- Declare table that will be used to find what are the valid
    -- candidate snapshots that could be selected for purge
    DECLARE @purge_candidates table
    (
        snapshot_id int NOT NULL,
        snapshot_time datetime NOT NULL,
        instance_name sysname NOT NULL,
        collection_set_uid uniqueidentifier NOT NULL
    )

    -- Find candidates that match the retention_days criteria (if specified)
    IF (@retention_days IS NULL)
    BEGIN
        -- User did not specified a value for @retention_days, therfore we
        -- will use the default expiration day as marked in the source info
        INSERT INTO @purge_candidates
        SELECT s.snapshot_id, s.snapshot_time, s.instance_name, s.collection_set_uid
        FROM core.snapshots s
        WHERE (GETUTCDATE() >= s.valid_through)
    END
    ELSE
    BEGIN
        -- User specified a value for @retention_days, we will use this overriden value
        -- when deciding what means old enough to qualify for purge this overrides
        -- the days_until_expiration value specified in the source_info_internal table
        INSERT INTO @purge_candidates
        SELECT s.snapshot_id, s.snapshot_time, s.instance_name, s.collection_set_uid
        FROM core.snapshots s
        WHERE GETUTCDATE() >= DATEADD(DAY, @retention_days, s.snapshot_time)
    END

    -- Determine which is the oldest snapshot, from the list of candidates
    DECLARE oldest_snapshot_cursor CURSOR FORWARD_ONLY READ_ONLY FOR
    SELECT p.snapshot_id, p.instance_name, p.collection_set_uid
    FROM @purge_candidates p
    WHERE 
        ((@instance_name IS NULL) or (p.instance_name = @instance_name)) AND
        ((@collection_set_uid IS NULL) or (p.collection_set_uid = @collection_set_uid))
    ORDER BY p.snapshot_time ASC    

    OPEN oldest_snapshot_cursor

    DECLARE @stop_purge int
    DECLARE @oldest_snapshot_id int
    DECLARE @oldest_instance_name sysname
    DECLARE @oldest_collection_set_uid uniqueidentifier

    FETCH NEXT FROM oldest_snapshot_cursor
    INTO @oldest_snapshot_id, @oldest_instance_name, @oldest_collection_set_uid

    -- As long as there are snapshots that matched the time criteria
    WHILE @@FETCH_STATUS = 0
    BEGIN

        -- Filter out records that do not match the other filter crieria
        IF ((@instance_name IS NULL) or (@oldest_instance_name = @instance_name))
        BEGIN

            -- There was no filter specified for instance_name or the instance matches the filter
            IF ((@collection_set_uid IS NULL) or (@oldest_collection_set_uid = @collection_set_uid))
            BEGIN

                -- There was no filter specified for the collection_set_uid or the collection_set_uid matches the filter
                BEGIN TRANSACTION tran_sp_purge_data

                -- Purge data associated with this snapshot. Note: deleting this snapshot
                -- triggers cascade delete in all warehouse tables based on the foreign key 
                -- relationship to snapshots table

                -- Cascade cleanup of all data related referencing oldest snapshot
                DELETE core.snapshots_internal
                FROM core.snapshots_internal s
                WHERE s.snapshot_id = @oldest_snapshot_id

                COMMIT TRANSACTION tran_sp_purge_data

                PRINT 'Snapshot #' + CONVERT(VARCHAR, @oldest_snapshot_id) + ' purged.';
            END

        END

        -- Check if the execution of the stored proc exceeded the @duration specified
        IF (@duration IS NOT NULL)
        BEGIN
            IF (GETUTCDATE()>=@end_time)
            BEGIN
                PRINT 'Stopping purge. More than ' + CONVERT(VARCHAR, @duration) + ' minutes passed since the start of operation.';
                BREAK
            END
        END

        -- Check if somebody wanted to stop the purge operation
        SELECT @stop_purge = COUNT(stop_purge) FROM [core].[purge_info_internal]
        IF (@stop_purge > 0)
        BEGIN
                PRINT 'Stopping purge. Detected a user request to stop purge.';
            BREAK
        END

        -- Move to next oldest snapshot
        FETCH NEXT FROM oldest_snapshot_cursor
        INTO @oldest_snapshot_id, @oldest_instance_name, @oldest_collection_set_uid

    END

    CLOSE oldest_snapshot_cursor
    DEALLOCATE oldest_snapshot_cursor

    -- delete orphaned query plans
    EXEC [core].[sp_purge_orphaned_notable_query_plan] @duration = @duration, @end_time = @end_time, @delete_batch_size = @delete_batch_size

    -- delete orphaned query text
    EXEC [core].[sp_purge_orphaned_notable_query_text] @duration = @duration, @end_time = @end_time, @delete_batch_size = @delete_batch_size
       
END
GO

GO
--SqlScripter----[core].[sp_purge_orphaned_notable_query_plan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[core].[sp_purge_orphaned_notable_query_plan]') IS NULL EXEC('CREATE PROCEDURE [core].[sp_purge_orphaned_notable_query_plan] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [core].[sp_purge_orphaned_notable_query_plan]
@duration smallint = NULL,
    @end_time datetime = NULL,
    @delete_batch_size int = 500
AS
BEGIN
    PRINT 'Begin purging orphaned records in snapshots.notable_query_plan Current UTC Time:' + CONVERT(VARCHAR, GETUTCDATE())

    DECLARE @stop_purge int

    -- Delete orphaned rows from snapshots.notable_query_plan.  Query plans are not deleted by the generic purge 
    -- process that deletes other data (above) because query plan rows are not tied to a particular snapshot ID. 
    -- Purging query plans table  as a special case, by looking for plans that 
    -- are no longer referenced by any of the rows in the snapshots.query_stats table.  We need to delete these 
    -- rows in small chunks, since deleting many GB in a single delete statement would cause lock escalation and 
    -- an explosion in the size of the transaction log (individual query plans can be 10-50MB).  
    DECLARE @rows_affected int;
    -- set expected rows affected as delete batch size
    SET @rows_affected = @delete_batch_size;
    
    -- select set of orphaned query plans to be deleted into a temp table 
    SELECT qp.[sql_handle],
        qp.plan_handle,
        qp.plan_generation_num,
        qp.statement_start_offset,
        qp.statement_end_offset,
        qp.creation_time
    INTO #tmp_notable_query_plan
    FROM snapshots.notable_query_plan AS qp 
    WHERE NOT EXISTS (
        SELECT snapshot_id 
        FROM snapshots.query_stats AS qs
        WHERE qs.[sql_handle] = qp.[sql_handle] AND qs.plan_handle = qp.plan_handle 
            AND qs.plan_generation_num = qp.plan_generation_num 
            AND qs.statement_start_offset = qp.statement_start_offset 
            AND qs.statement_end_offset = qp.statement_end_offset 
            AND qs.creation_time = qp.creation_time)

    WHILE (@rows_affected = @delete_batch_size)
    BEGIN
        -- Deleting TOP N orphaned rows in query plan table by joining info from temp table variable
        -- This is done to speed up delete query. 
        DELETE TOP (@delete_batch_size) snapshots.notable_query_plan 
        FROM snapshots.notable_query_plan AS qp , #tmp_notable_query_plan AS tmp
        WHERE tmp.[sql_handle] = qp.[sql_handle] 
            AND tmp.plan_handle = qp.plan_handle 
            AND tmp.plan_generation_num = qp.plan_generation_num 
            AND tmp.statement_start_offset = qp.statement_start_offset 
            AND tmp.statement_end_offset = qp.statement_end_offset 
            AND tmp.creation_time = qp.creation_time
        
        SET @rows_affected = @@ROWCOUNT;
        IF(@rows_affected > 0)
        BEGIN
            RAISERROR ('Deleted %d orphaned rows from snapshots.notable_query_plan', 0, 1, @rows_affected) WITH NOWAIT;
        END

        -- Check if the execution of the stored proc exceeded the @duration specified
        IF (@duration IS NOT NULL)
        BEGIN
            IF (GETUTCDATE()>=@end_time)
            BEGIN
                PRINT 'Stopping purge. More than ' + CONVERT(VARCHAR, @duration) + ' minutes passed since the start of operation.';
                BREAK
            END
        END

        -- Check if somebody wanted to stop the purge operation
        SELECT @stop_purge = COUNT(stop_purge) FROM [core].[purge_info_internal]
        IF (@stop_purge > 0)
        BEGIN
            PRINT 'Stopping purge. Detected a user request to stop purge.';
            BREAK
        END
    END;
    
    PRINT 'End purging orphaned records in snapshots.notable_query_plan Current UTC Time:' + CONVERT(VARCHAR, GETUTCDATE())
END
GO

GO
--SqlScripter----[core].[sp_purge_orphaned_notable_query_text].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[core].[sp_purge_orphaned_notable_query_text]') IS NULL EXEC('CREATE PROCEDURE [core].[sp_purge_orphaned_notable_query_text] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [core].[sp_purge_orphaned_notable_query_text]
@duration smallint = NULL,
    @end_time datetime = NULL,
    @delete_batch_size int = 500
AS
BEGIN
    PRINT 'Begin purging orphaned records in snapshots.notable_query_text Current UTC Time:' + CONVERT(VARCHAR, GETUTCDATE())

    DECLARE @stop_purge int

    -- Delete orphaned rows from snapshots.notable_query_text.  Query texts are not deleted by the generic purge 
    -- process that deletes other data (above) because query text rows are not tied to a particular snapshot ID. 
    -- Purging  query text table as a special case, by looking for plans that 
    -- are no longer referenced by any of the rows in the snapshots.query_stats table.  We need to delete these 
    -- rows in small chunks, since deleting many GB in a single delete statement would cause lock escalation and 
    -- an explosion in the size of the transaction log (individual query plans can be 10-50MB).  
    DECLARE @rows_affected int;
    -- set expected rows affected as delete batch size
    SET @rows_affected = @delete_batch_size;

    SELECT qtext.[sql_handle] 
    INTO #tmp_notable_query_text
    FROM snapshots.notable_query_text AS qtext
    EXCEPT (
	SELECT qt.[sql_handle] FROM snapshots.notable_query_text AS qt 
	INNER HASH JOIN snapshots.query_stats AS qs 
	ON (qt.sql_handle = qs.sql_handle))

    WHILE (@rows_affected = @delete_batch_size)
    BEGIN
        -- Deleting TOP N orphaned rows in query text table by joining info from temp table
        -- This is done to speed up delete query. 
        DELETE TOP (@delete_batch_size) snapshots.notable_query_text 
         FROM snapshots.notable_query_text AS qt, #tmp_notable_query_text AS tmp
        WHERE tmp.[sql_handle] = qt.[sql_handle]
        
        SET @rows_affected = @@ROWCOUNT;
        IF(@rows_affected > 0)
        BEGIN
            RAISERROR ('Deleted %d orphaned rows from snapshots.notable_query_text', 0, 1, @rows_affected) WITH NOWAIT;
        END

        -- Check if the execution of the stored proc exceeded the @duration specified
        IF (@duration IS NOT NULL)
        BEGIN
            IF (GETUTCDATE()>=@end_time)
            BEGIN
                PRINT 'Stopping purge. More than ' + CONVERT(VARCHAR, @duration) + ' minutes passed since the start of operation.';
                BREAK
            END
        END

        -- Check if somebody wanted to stop the purge operation
        SELECT @stop_purge = COUNT(stop_purge) FROM [core].[purge_info_internal]
        IF (@stop_purge > 0)
        BEGIN
            PRINT 'Stopping purge. Detected a user request to stop purge.';
            BREAK
        END
    END;

    PRINT 'End purging orphaned records in snapshots.notable_query_text Current UTC Time:' + CONVERT(VARCHAR, GETUTCDATE())

END
GO

GO
--SqlScripter----[core].[sp_remove_collector_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[core].[sp_remove_collector_type]') IS NULL EXEC('CREATE PROCEDURE [core].[sp_remove_collector_type] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [core].[sp_remove_collector_type]
@collector_type_uid     uniqueidentifier
AS
BEGIN
    -- Security check (role membership)
    IF (NOT (ISNULL(IS_MEMBER(N'mdw_admin'), 0) = 1) AND NOT (ISNULL(IS_SRVROLEMEMBER(N'sysadmin'), 0) = 1))
    BEGIN
        RAISERROR(14677, 16, -1, 'mdw_admin')
        RETURN(1) -- Failure
    END

    -- Parameters check
    IF (@collector_type_uid IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@collector_type_uid')
        RETURN(1) -- Failure
    END

    -- Delete collector type
    IF EXISTS (SELECT collector_type_uid FROM core.supported_collector_types WHERE collector_type_uid = @collector_type_uid)
    BEGIN
        DELETE FROM core.supported_collector_types WHERE collector_type_uid = @collector_type_uid
    END
    ELSE
    BEGIN
        DECLARE @collector_type_uid_as_char NVARCHAR(36)
        SELECT @collector_type_uid_as_char = CONVERT(NVARCHAR(36), @collector_type_uid)
        RAISERROR(14262, -1, -1, '@collector_type_uid', @collector_type_uid_as_char)
        RETURN (1) -- Failure
    END

    RETURN (0)
END
GO

GO
--SqlScripter----[core].[sp_stop_purge].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[core].[sp_stop_purge]') IS NULL EXEC('CREATE PROCEDURE [core].[sp_stop_purge] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [core].[sp_stop_purge]
AS
BEGIN
    INSERT INTO [core].[purge_info_internal] (stop_purge) VALUES (1)
END
GO

GO
--SqlScripter----[core].[sp_update_data_source].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[core].[sp_update_data_source]') IS NULL EXEC('CREATE PROCEDURE [core].[sp_update_data_source] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [core].[sp_update_data_source]
@collection_set_uid     uniqueidentifier,
    @machine_name           sysname,
    @named_instance         sysname,
    @days_until_expiration  smallint,
    @source_id              int OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

    -- Security check (role membership)
    IF (NOT (ISNULL(IS_MEMBER(N'mdw_writer'), 0) = 1) AND NOT (ISNULL(IS_SRVROLEMEMBER(N'sysadmin'), 0) = 1))
    BEGIN
        RAISERROR(14677, 16, -1, 'mdw_writer')
        RETURN(1) -- Failure
    END

    -- Parameters check
    IF (@collection_set_uid IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@collection_set_uid')
        RETURN(1) -- Failure
    END

    SET @machine_name = NULLIF(RTRIM(LTRIM(@machine_name)), N'')
    IF (@machine_name IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@machine_name')
        RETURN(1) -- Failure
    END

    DECLARE @instance_name sysname
    SET @named_instance = NULLIF(RTRIM(LTRIM(@named_instance)), N'')
    IF (@named_instance = 'MSSQLSERVER')
        SET @instance_name = @machine_name
    ELSE
        SET @instance_name = @machine_name + N'\' + @named_instance

    IF (@days_until_expiration IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@days_until_expiration')
        RETURN(1) -- Failure
    END

    IF (@days_until_expiration < 0)
    BEGIN
        RAISERROR(14266, -1, -1, '@days_until_expiration', ' >= 0')
        RETURN (1) -- Failure
    END
    
    DECLARE @operator sysname
    SELECT @operator = SUSER_SNAME()

    BEGIN TRY
        BEGIN TRAN
        
        -- Insert data into the table
        -- We specify the lock hint, in order to keep the exlusive lock on the row from the moment we select it till we 
        -- update it
        SET @source_id = (SELECT source_id FROM core.source_info_internal WITH(UPDLOCK) WHERE collection_set_uid = @collection_set_uid AND instance_name = @instance_name AND operator = @operator)
        IF @source_id IS NULL
        BEGIN
            INSERT INTO core.source_info_internal
            (
                collection_set_uid,
                instance_name,
                days_until_expiration,
                operator
            )
            VALUES
            (
                @collection_set_uid,
                @instance_name,
                @days_until_expiration,
                @operator
            )
            SET @source_id = SCOPE_IDENTITY()
        END
        ELSE
        BEGIN
            UPDATE core.source_info_internal
            SET 
                days_until_expiration = @days_until_expiration
            WHERE source_id = @source_id;
        END
            
        COMMIT TRAN
        RETURN (0)
    END TRY
    BEGIN CATCH
        IF (@@TRANCOUNT > 0) 
            ROLLBACK TRANSACTION

        -- Rethrow the error
        DECLARE @ErrorMessage   NVARCHAR(4000);
        DECLARE @ErrorSeverity  INT;
        DECLARE @ErrorState     INT;
        DECLARE @ErrorNumber    INT;
        DECLARE @ErrorLine      INT;
        DECLARE @ErrorProcedure NVARCHAR(200);
        SELECT @ErrorLine = ERROR_LINE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE(),
               @ErrorNumber = ERROR_NUMBER(),
               @ErrorMessage = ERROR_MESSAGE(),
               @ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-');

        RAISERROR (14684, -1, -1 , @ErrorNumber, @ErrorSeverity, @ErrorState, @ErrorProcedure, @ErrorLine, @ErrorMessage);
        RETURN (1)
    END CATCH
END
GO

GO
--SqlScripter----[snapshots].[rpt_active_sessions_and_requests].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_active_sessions_and_requests]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_active_sessions_and_requests] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_active_sessions_and_requests]
@instance_name sysname, 
    @collection_time datetime
AS
BEGIN
SET NOCOUNT ON;
    -- Find the nearest collection time on or before the user-specified time
    DECLARE @current_collection_time datetimeoffset(7)
    DECLARE @current_snapshot_id int
    DECLARE @query_stats_source_id int

    -- Compensate for RS truncation of fractional seconds 
    SET @current_collection_time = DATEADD(second, 1, @collection_time)

    SELECT TOP 1 @current_collection_time = r.collection_time, @current_snapshot_id = r.snapshot_id
    FROM core.snapshots AS s
    INNER JOIN snapshots.active_sessions_and_requests AS r ON s.snapshot_id = r.snapshot_id
    WHERE s.instance_name = @instance_name
      AND r.collection_time <= @current_collection_time
    ORDER BY collection_time DESC

    -- Get the source_id for the Query Stats collection set on this server
    SELECT @query_stats_source_id = s.source_id
    FROM core.snapshots AS s
    WHERE s.instance_name = @instance_name AND s.collection_set_uid = '2DC02BD6-E230-4C05-8516-4E8C0EF21F95'

    -- Get all active sessions/requests at that time
    SELECT 
        r.session_id, r.request_id, r.exec_context_id, ISNULL (r.blocking_session_id, 0) AS blocking_session_id, r.blocking_exec_context_id, 
        r.scheduler_id, r.database_name, r.[user_id], r.task_state, r.request_status, r.session_status, 
        r.executing_managed_code, 
        CONVERT (datetime, SWITCHOFFSET (CAST (r.login_time AS datetimeoffset(7)), '+00:00')) AS login_time, 
        r.is_user_process, r.[host_name], r.[program_name], r.login_name, r.wait_type, r.last_wait_type, 
        r.wait_duration_ms, r.wait_resource, r.resource_description, r.transaction_id, 
        r.open_transaction_count, r.transaction_isolation_level, r.request_cpu_time, 
        r.request_logical_reads, r.request_reads, r.request_writes, r.request_total_elapsed_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (r.request_start_time AS datetimeoffset(7)), '+00:00')) AS request_start_time, 
        r.memory_usage, r.session_cpu_time, r.session_reads, r.session_writes, 
        r.session_logical_reads, r.session_total_scheduled_time, r.session_total_elapsed_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (r.session_last_request_start_time AS datetimeoffset(7)), '+00:00')) AS session_last_request_start_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (r.session_last_request_end_time AS datetimeoffset(7)), '+00:00')) AS session_last_request_end_time, 
        r.open_resultsets, r.session_row_count, r.prev_error, r.pending_io_count, ISNULL (r.command, 'AWAITING COMMAND') AS command, 
        r.plan_handle, r.sql_handle, r.statement_start_offset, r.statement_end_offset, 
        CONVERT (datetime, SWITCHOFFSET (CAST (r.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        r.snapshot_id, 
        wt.category_name AS wait_category, 
        sql.*, 
        master.dbo.fn_varbintohexstr (r.sql_handle) AS sql_handle_str, 
        master.dbo.fn_varbintohexstr (r.plan_handle) AS plan_handle_str, 
        REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (
            LEFT (LTRIM (sql.query_text), 100)
            , CHAR(9), ' '), CHAR(10), ' '), CHAR(13), ' '), '   ', ' '), '  ', ' '), '  ', ' ') AS flat_query_text 
    FROM snapshots.active_sessions_and_requests AS r
    LEFT OUTER JOIN core.wait_types_categorized AS wt ON r.wait_type = wt.wait_type
    OUTER APPLY snapshots.fn_get_query_text (@query_stats_source_id, r.sql_handle, r.statement_start_offset, r.statement_end_offset) AS sql
    WHERE r.snapshot_id = @current_snapshot_id AND r.collection_time = @current_collection_time
END
GO

GO
--SqlScripter----[snapshots].[rpt_blocking_chain_detail].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_blocking_chain_detail]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_blocking_chain_detail] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_blocking_chain_detail]
@instance_name sysname, 
    @blocking_time_str varchar(40), 
    @head_blocker_session_id int
AS
BEGIN
SET NOCOUNT ON;
    DECLARE @blocking_start_time datetimeoffset(7)
    DECLARE @blocking_end_time datetimeoffset(7)
    DECLARE @blocking_time datetimeoffset(7)
    -- The report passed in the blocking time as a string to avoid RS date truncation. 
    -- Convert this to a datetimeoffset value in UTC time.
    SET @blocking_time = SWITCHOFFSET (CAST (@blocking_time_str AS datetimeoffset(7)), '+00:00')

    -- The time that we were passed in may have been in the middle of the blocking incident. 
    -- Find the true start time for this blocking chain. This might be 10 seconds prior, or 
    -- might be days prior.  For perf reasons, search backwards in time one hour at a time 
    -- until we find the start of the blocking incident. 
    DECLARE @blocking_end_snapshot_id int
    DECLARE @blocking_end_source_id int
    DECLARE @hour_count int
    SET @hour_count = -1
    WHILE (@blocking_start_time IS NULL)
    BEGIN
        -- Only if we have more rows left to search for the blocking end time
        IF EXISTS (
            SELECT * 
            FROM snapshots.active_sessions_and_requests AS r 
            INNER JOIN core.snapshots AS s ON s.snapshot_id = r.snapshot_id
            WHERE s.instance_name = @instance_name 
                AND r.collection_time < DATEADD (hour, @hour_count+1, @blocking_time)
        )
        BEGIN
            SELECT TOP 1 @blocking_start_time = r.collection_time 
            FROM snapshots.active_sessions_and_requests AS r 
            INNER JOIN core.snapshots AS s ON s.snapshot_id = r.snapshot_id
            WHERE s.instance_name = @instance_name
                AND r.collection_time BETWEEN DATEADD (hour, @hour_count, @blocking_time) AND @blocking_time 
                AND NOT EXISTS 
                ( 
                    SELECT * 
                    FROM snapshots.active_sessions_and_requests AS r2 
                    WHERE r.snapshot_id = r2.snapshot_id AND r.collection_time = r2.collection_time 
                        AND r2.blocking_session_id = @head_blocker_session_id 
                ) 
            ORDER BY r.collection_time DESC
        END
        ELSE
        BEGIN
            -- We've reached the beginning of the data in the warehouse, and the blocking incident was already 
            -- in-progress at that time. Use the earliest collection time as the approx blocking start time. 
            SELECT @blocking_start_time = ISNULL (DATEADD (second, -10, MIN (r.collection_time)), GETUTCDATE())
            FROM snapshots.active_sessions_and_requests AS r 
            INNER JOIN core.snapshots AS s ON s.snapshot_id = r.snapshot_id
            WHERE s.instance_name = @instance_name
        END
        SET @hour_count = @hour_count - 1
    END
    -- We've found the collection_time just before the blocking began. Get the next collection time, 
    -- which is the first collection time where this blocking incident was detected. 
    SELECT TOP 1 @blocking_start_time = r.collection_time
    FROM snapshots.active_sessions_and_requests AS r 
    INNER JOIN core.snapshots AS s ON s.snapshot_id = r.snapshot_id
    WHERE s.instance_name = @instance_name AND r.collection_time > @blocking_start_time
    ORDER BY r.collection_time ASC

    -- Now find the end of the blocking incident.  Here, again, do an optimistic search in 1-hour blocks. 
    SET @hour_count = 1
    WHILE (@blocking_end_time IS NULL)
    BEGIN
        -- Only if we have more rows left to search for the blocking end time
        IF EXISTS (
            SELECT * 
            FROM snapshots.active_sessions_and_requests AS r 
            INNER JOIN core.snapshots AS s ON s.snapshot_id = r.snapshot_id
            WHERE s.instance_name = @instance_name 
                AND r.collection_time > DATEADD (hour, @hour_count-1, @blocking_time)
        )
        BEGIN
            SELECT TOP 1 @blocking_end_time = r.collection_time 
            FROM snapshots.active_sessions_and_requests AS r 
            INNER JOIN core.snapshots AS s ON s.snapshot_id = r.snapshot_id
            WHERE s.instance_name = @instance_name
                AND r.collection_time BETWEEN DATEADD (hour, @hour_count-1, @blocking_time) AND DATEADD (hour, @hour_count, @blocking_time)
                AND NOT EXISTS 
                ( 
                    SELECT * 
                    FROM snapshots.active_sessions_and_requests AS r2 
                    WHERE r.snapshot_id = r2.snapshot_id AND r.collection_time = r2.collection_time 
                        AND r2.blocking_session_id = @head_blocker_session_id 
                ) 
            ORDER BY r.collection_time ASC
        END
        ELSE
        BEGIN
            -- We've reached the end of the data in the warehouse, and the blocking incident is still 
            -- in-progress. Use the last collection time as the approx blocking end time. 
            SELECT @blocking_end_time = ISNULL (DATEADD (second, 10, MAX (r.collection_time)), GETUTCDATE())
            FROM snapshots.active_sessions_and_requests AS r 
            INNER JOIN core.snapshots AS s ON s.snapshot_id = r.snapshot_id
            WHERE s.instance_name = @instance_name
        END
        SET @hour_count = @hour_count + 1
    END
    -- We've found the collection_time just after before the blocking ended. Get the prior collection time, 
    -- which is the last collection time where the blocking incident was detected. 
    SELECT TOP 1 @blocking_end_time = r.collection_time, @blocking_end_snapshot_id = r.snapshot_id, @blocking_end_source_id = s.source_id
    FROM snapshots.active_sessions_and_requests AS r 
    INNER JOIN core.snapshots AS s ON s.snapshot_id = r.snapshot_id
    WHERE s.instance_name = @instance_name AND r.collection_time < @blocking_end_time
    ORDER BY r.collection_time DESC

    -- DC captures a snapshot of session state every few seconds, which would mean hundreds of samples for 
    -- moderately long-lived blocking chains.  It would be too expensive to summarize the state of the blocking 
    -- chain at every one of these points.  Instead, select 10 evenly-spaced intervals during the blocking 
    -- incident to characterize the changes in the head blocker's state over the blocking period. 
    DECLARE @interval_sec int
    SET @interval_sec = DATEDIFF (second, @blocking_start_time, @blocking_end_time) / 10
    CREATE TABLE #sample_collection_times (snapshot_id int, source_id int, collection_time datetimeoffset(7))
    DECLARE @i int
    SET @i = 0
    WHILE (@i < 9)
    BEGIN
        INSERT INTO #sample_collection_times 
        SELECT TOP 1 r.snapshot_id, s.source_id, r.collection_time
        FROM snapshots.active_sessions_and_requests AS r 
        INNER JOIN core.snapshots AS s ON s.snapshot_id = r.snapshot_id
        WHERE s.instance_name = @instance_name 
            AND r.collection_time BETWEEN DATEADD (second, @interval_sec * @i, @blocking_start_time)
                AND DATEADD (second, @interval_sec * (@i+1)-1, @blocking_start_time)
            -- Only choose collection times where we have info for the head blocker
            AND r.session_id = @head_blocker_session_id 
        ORDER BY r.collection_time ASC
        SET @i = @i + 1
    END
    -- The 10th sample time is always the blocking incident's final collection time
    INSERT INTO #sample_collection_times VALUES (@blocking_end_snapshot_id, @blocking_end_source_id, @blocking_end_time);

    -- Use a recursive CTE to walk the tree of the blocking chain at each of these collection times
    -- and get the state of all the sessions that were part of the tree
    WITH blocking_hierarchy AS  
    (
        -- Head blocker at each of the selected sample times
        SELECT t.collection_time, t.snapshot_id, t.source_id, 0 AS [level], 
            r.session_id, r.request_id, r.exec_context_id, r.request_status, r.command, 
            r.blocking_session_id, r.blocking_exec_context_id, 
            r.wait_type, r.wait_duration_ms, r.wait_resource, r.resource_description, 
            r.login_name, r.login_time, r.[program_name], r.[host_name], r.database_name, 
            r.open_transaction_count, r.transaction_isolation_level, 
            r.request_cpu_time, r.request_total_elapsed_time, r.request_start_time, r.memory_usage, 
            r.session_cpu_time, r.session_total_scheduled_time, r.session_row_count, r.pending_io_count, r.prev_error, 
            r.session_last_request_start_time, r.session_last_request_end_time, r.open_resultsets, 
            r.plan_handle, r.sql_handle, r.statement_start_offset, r.statement_end_offset 
        FROM #sample_collection_times AS t
        INNER JOIN snapshots.active_sessions_and_requests AS r
            ON t.snapshot_id = r.snapshot_id AND t.collection_time = r.collection_time
        WHERE r.session_id = @head_blocker_session_id 
            AND ISNULL (r.exec_context_id, 0) IN (-1, 0) -- for the head blocker, only return the main worker's state
        UNION ALL 
        -- Tasks blocked by the head blocker at the same times
        SELECT r2.collection_time, r2.snapshot_id, parent.source_id, parent.[level] + 1 AS [level], 
            r2.session_id, r2.request_id, r2.exec_context_id, r2.request_status, r2.command, 
            r2.blocking_session_id, r2.blocking_exec_context_id, 
            r2.wait_type, r2.wait_duration_ms, r2.wait_resource, r2.resource_description, 
            r2.login_name, r2.login_time, r2.[program_name], r2.[host_name], r2.database_name, 
            r2.open_transaction_count, r2.transaction_isolation_level, 
            r2.request_cpu_time, r2.request_total_elapsed_time, r2.request_start_time, r2.memory_usage, 
            r2.session_cpu_time, r2.session_total_scheduled_time, r2.session_row_count, r2.pending_io_count, r2.prev_error, 
            r2.session_last_request_start_time, r2.session_last_request_end_time, r2.open_resultsets, 
            r2.plan_handle, r2.sql_handle, r2.statement_start_offset, r2.statement_end_offset 
        FROM snapshots.active_sessions_and_requests AS r2
        INNER JOIN blocking_hierarchy AS parent 
            ON parent.snapshot_id = r2.snapshot_id AND parent.collection_time = r2.collection_time
                AND parent.session_id = r2.blocking_session_id
    )
    SELECT * INTO #blocking_hierarchy 
    FROM blocking_hierarchy 
    
    -- Summarize the state of the head blocker at each of the sample times, along with 
    -- some aggregate stats (# of blocked sessions, etc) describing the blocked sessions
    SELECT 
        CONVERT (datetime, SWITCHOFFSET (CAST (@blocking_start_time AS datetimeoffset(7)), '+00:00')) AS blocking_start_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (@blocking_end_time AS datetimeoffset(7)), '+00:00')) AS blocking_end_time, 
        DATEDIFF (second, @blocking_start_time, @blocking_end_time) AS blocking_duration, 
        -- Return these dates as strings to avoid RS date truncation
        CONVERT (varchar(40), SWITCHOFFSET (CAST (@blocking_start_time AS datetimeoffset(7)), '+00:00'), 126) AS blocking_start_time_str, 
        CONVERT (varchar(40), SWITCHOFFSET (CAST (@blocking_end_time AS datetimeoffset(7)), '+00:00'), 126) AS blocking_end_time_str, 
        CONVERT (datetime, SWITCHOFFSET (CAST (blocked.chart_collection_time AS datetimeoffset(7)), '+00:00')) AS chart_collection_time, 
        blocked.chart_only, 
        CONVERT (datetime, SWITCHOFFSET (CAST (blocked.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        blocked.snapshot_id, 
        CONVERT (varchar(40), SWITCHOFFSET (CAST (blocked.collection_time AS datetimeoffset(7)), '+00:00'), 126) AS collection_time_str, 
        @head_blocker_session_id AS head_blocker_session_id, 
        COUNT(DISTINCT blocked.session_id) AS blocked_session_count, 
        SUM (blocked.wait_duration_ms) AS total_wait_time, 
        AVG (blocked.wait_duration_ms) AS avg_wait_time, 
        (
            -- Get the description of the resource owned by the head blocker that 
            -- has caused the most wait time in this blocking chain
            SELECT TOP 1 resource_description
            FROM #blocking_hierarchy bh
            WHERE bh.collection_time = blocked.collection_time AND bh.snapshot_id = blocked.snapshot_id
                AND bh.blocking_session_id = @head_blocker_session_id
            GROUP BY resource_description
            ORDER BY SUM (wait_duration_ms) DESC
        ) AS primary_wait_resource_description, 
        ISNULL (blocker.command, 'AWAITING COMMAND') AS command, blocker.request_status, 
        wt.category_name, blocker.wait_type, blocker.wait_duration_ms, blocker.wait_resource, blocker.resource_description, 
        blocker.[program_name], blocker.[host_name], blocker.login_name, 
        CONVERT (datetime, SWITCHOFFSET (CAST (blocker.login_time AS datetimeoffset(7)), '+00:00')) AS login_time, 
        blocker.database_name, 
        MAX (blocker.open_transaction_count) AS open_transaction_count, MAX (blocker.transaction_isolation_level) AS transaction_isolation_level, 
        MAX (blocker.request_cpu_time) AS request_cpu_time, MAX (blocker.request_total_elapsed_time) AS request_total_elapsed_time, 
        MIN (blocker.request_start_time) AS request_start_time, MAX (blocker.memory_usage) AS memory_usage, 
        MAX (blocker.session_cpu_time) AS session_cpu_time, MAX (blocker.session_total_scheduled_time) AS session_total_scheduled_time, 
        MAX (blocker.session_row_count) AS session_row_count, MAX (blocker.pending_io_count) AS pending_io_count, 
        MAX (blocker.prev_error) AS prev_error, 
        CONVERT (datetime, SWITCHOFFSET (CAST (MAX (blocker.session_last_request_start_time) AS datetimeoffset(7)), '+00:00')) AS session_last_request_start_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (MAX (blocker.session_last_request_end_time) AS datetimeoffset(7)), '+00:00')) AS session_last_request_end_time, 
        MAX (blocker.open_resultsets) AS open_resultsets, 
        blocker.plan_handle, blocker.sql_handle, blocker.statement_start_offset, blocker.statement_end_offset, 
        -- RS can't handle binary values as parameters -- convert plan and sql handles to string types
        master.dbo.fn_varbintohexstr (blocker.plan_handle) AS plan_handle_str, 
        master.dbo.fn_varbintohexstr (blocker.sql_handle) AS sql_handle_str, 
        sql_text.[object_id], sql_text.[object_name], sql_text.query_text, 
        REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (
            LEFT (LTRIM (sql_text.query_text), 100), 
            CHAR(9), ' '), CHAR(10), ' '), CHAR(13), ' '), '   ', ' '), '  ', ' '), '  ', ' ') AS flat_query_text
    -- RS won't plot series that only have a single data point on a line graph.  Duplicate each data 
    -- point with a slight time shift, which will allow the chart to provide some visualization even if 
    -- the blocking was transient (only seen during a single sample). For performance reasons, this 
    -- same resultset feeds both a chart and a table.  The duplicate records are flagged with 
    -- chart_only=1 so that they can be filtered out in the table. 
    FROM (
        SELECT *, collection_time AS chart_collection_time, 0 AS chart_only
        FROM #blocking_hierarchy 
        WHERE blocking_session_id != 0 
        UNION ALL 
        SELECT *, DATEADD (second, 10, collection_time) AS chart_collection_time, 1 AS chart_only 
        FROM #blocking_hierarchy 
        WHERE blocking_session_id != 0 
    ) AS blocked
    INNER JOIN (
        SELECT *, collection_time AS chart_collection_time, 0 AS chart_only
        FROM #blocking_hierarchy 
        WHERE blocking_session_id = 0 
        UNION ALL 
        SELECT *, DATEADD (second, 10, collection_time) AS chart_collection_time, 1 AS chart_only
        FROM #blocking_hierarchy 
        WHERE blocking_session_id = 0 
    ) AS blocker
        ON blocked.collection_time = blocker.collection_time AND blocked.snapshot_id = blocker.snapshot_id
            AND blocked.chart_collection_time = blocker.chart_collection_time 
    OUTER APPLY [snapshots].[fn_get_query_text] (blocker.source_id, blocker.sql_handle, blocker.statement_start_offset, blocker.statement_end_offset) AS sql_text
    LEFT OUTER JOIN core.wait_types_categorized AS wt ON blocker.wait_type = wt.wait_type
    WHERE 
        blocker.blocking_session_id = 0 AND blocked.blocking_session_id != 0
    GROUP BY blocked.chart_collection_time, blocked.chart_only, blocked.collection_time, blocked.snapshot_id, 
        blocker.command, blocker.request_status, 
        wt.category_name, blocker.wait_type, blocker.wait_duration_ms, blocker.wait_resource, blocker.resource_description, 
        blocker.[program_name], blocker.[host_name], blocker.login_name, blocker.login_time, blocker.database_name, 
        blocker.plan_handle, blocker.sql_handle, blocker.statement_start_offset, blocker.statement_end_offset, 
        sql_text.[object_id], sql_text.[object_name], sql_text.query_text  
    ORDER BY blocked.collection_time ASC

END
GO

GO
--SqlScripter----[snapshots].[rpt_blocking_chains].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_blocking_chains]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_blocking_chains] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_blocking_chains]
@instance_name sysname,
    @start_time datetime = NULL, 
    @end_time datetime, 
    @WindowSize int = NULL
AS
BEGIN
SET NOCOUNT ON;

    -- Compensate for RS truncation of fractional seconds
    SET @end_time = DATEADD (second, 1, @end_time) 

    -- If @start_time is NULL, calc it using @end_time and @WindowSize
    IF @start_time IS NULL SET @start_time = DATEADD (minute, -1 * @WindowSize, @end_time)

    -- Get all collection times for the "Active Sessions and Requests" collection item
    SELECT DISTINCT r1.collection_time, r1.snapshot_id, 
        DENSE_RANK() OVER (ORDER BY r1.collection_time) AS collection_time_id
    INTO #collection_times
    FROM snapshots.active_sessions_and_requests AS r1 
    INNER JOIN core.snapshots s ON s.snapshot_id = r1.snapshot_id 
    WHERE 
        s.instance_name = @instance_name 
        AND r1.collection_time BETWEEN @start_time AND @end_time

    DECLARE @max_collection_time datetimeoffset(7)
    SELECT @max_collection_time = MAX (collection_time) FROM #collection_times

    -- Get all head blockers during the selected time window
    SELECT r1.*, times.collection_time_id
    INTO #blocking_participants 
    FROM #collection_times AS times
    LEFT OUTER JOIN snapshots.active_sessions_and_requests AS r1 
        ON r1.collection_time = times.collection_time AND r1.snapshot_id = times.snapshot_id
    WHERE r1.blocking_session_id = 0
        AND session_id IN (
            SELECT DISTINCT blocking_session_id 
            FROM snapshots.active_sessions_and_requests AS r2 
            WHERE r2.blocking_session_id != 0 AND r2.collection_time = r1.collection_time
                AND r2.snapshot_id = r1.snapshot_id
        )
    CREATE NONCLUSTERED INDEX IDX1_blocking_participants 
    ON #blocking_participants 
    (
        session_id, collection_time_id, blocking_session_id
    )

    -- List all blocking chains during this time window. 
    -- For the purposes of this overview, we define a blocking chain as a contiguous series 
    -- of samples where the same spid remains the head blocker.  Rolling blocking will be viewed 
    -- as multiple discrete chains. 
    SELECT 
        MIN (head_blockers.collection_time) AS blocking_start_time, 
        -- We know when the blocking ended within a (roughly) 10 second window. Assume it stopped approximately 
        -- at the midpoint. 
        DATEADD (second, 5, ISNULL (MAX (blocking_end_times.collection_time), @max_collection_time)) AS blocking_end_time, 
        DATEDIFF (second, MIN (head_blockers.collection_time), ISNULL (MAX (blocking_end_times.collection_time), @max_collection_time)) 
            AS blocking_duration_sec,
        head_blockers.session_id AS head_blocker_session_id, 
        MIN (head_blockers.[program_name]) AS [program_name], 
        MIN (head_blockers.[database_name]) AS [database_name], 
        COUNT(*) AS observed_sample_count,  -- Number of times we saw this blocking chain
        CASE WHEN MAX (blocking_end_times.collection_time) IS NULL THEN 1 ELSE 0 END AS still_active
    INTO #blocking_chains
    FROM 
    (
        SELECT 
            (   -- Find the end time for this blocking incident
                SELECT MIN (collection_time_id)
                FROM #collection_times AS times1
                WHERE times1.collection_time_id > blockers_start.collection_time_id 
                    AND times1.collection_time_id <= @end_time 
                    AND NOT EXISTS (
                        SELECT * FROM #blocking_participants AS blk1
                        WHERE blk1.session_id = blockers_start.session_id 
                            AND blk1.[program_name] = blockers_start.[program_name] 
                            AND blk1.login_time = blockers_start.login_time 
                            AND blk1.collection_time_id = times1.collection_time_id
                            AND blk1.blocking_session_id = 0
                    )
            ) AS blocking_end_collection_time_id, 
            *
        FROM #blocking_participants AS blockers_start 
        WHERE blockers_start.blocking_session_id = 0 
    ) AS head_blockers
    LEFT OUTER JOIN #collection_times AS blocking_end_times
        ON blocking_end_times.collection_time_id = head_blockers.blocking_end_collection_time_id - 1
    GROUP BY head_blockers.session_id, head_blockers.blocking_end_collection_time_id 
    ORDER BY MIN (head_blockers.collection_time)

    -- This proc supports two different chart elements: a table, with one row per blocking 
    -- chain, and a timeline chart, with one series per blocking chain.  The chart must 
    -- return two data points per series in order to correctly plot the blocking chain's 
    -- beginning and end times.  The chart uses the output of both of the following UNIONed 
    -- SELECT statements, while the table filters out the second resultset 
    -- ([chart_data_only]=0). Doing this avoids the need to waste time running two procs 
    -- that are almost identical.  
    SELECT 
        blocking_chain_number, 
        CONVERT (datetime, SWITCHOFFSET (CAST (blocking_start_time AS datetimeoffset(7)), '+00:00')) AS blocking_start_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (blocking_end_time AS datetimeoffset(7)), '+00:00')) AS blocking_end_time, 
        blocking_duration_sec, 
        head_blocker_session_id, 
        [program_name], 
        [database_name], 
        observed_sample_count, 
        still_active, 
        -- Represent this time as a string to avoid RS datetime truncation when the report passes it back to us on drillthrough
        CONVERT (varchar(40), SWITCHOFFSET (CAST (blocking_start_time AS datetimeoffset(7)), '+00:00'), 126) AS blocking_start_time_str, 
        CONVERT (datetime, SWITCHOFFSET (CAST (chart_time AS datetimeoffset(7)), '+00:00')) AS chart_time, 
        chart_data_only
    FROM 
    (
        SELECT TOP 10 ROW_NUMBER() OVER (ORDER BY blocking_duration_sec DESC) AS blocking_chain_number, 
            *, blocking_start_time AS chart_time, 
            0 AS chart_data_only 
        FROM #blocking_chains
        ORDER BY blocking_duration_sec DESC
        UNION ALL 
        SELECT TOP 10 ROW_NUMBER() OVER (ORDER BY blocking_duration_sec DESC) AS blocking_chain_number, 
            *, blocking_end_time AS chart_time, 
            1 AS chart_data_only 
        FROM #blocking_chains
        ORDER BY blocking_duration_sec DESC
    ) AS t
    ORDER BY blocking_chain_number, chart_data_only
END
GO

GO
--SqlScripter----[snapshots].[rpt_cpu_counters_one_snapshot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_cpu_counters_one_snapshot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_cpu_counters_one_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_cpu_counters_one_snapshot]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        N'CPU ' + CONVERT (nvarchar(10), ISNULL(pc.performance_instance_name, N'')) as series,
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        pc.formatted_value
    FROM snapshots.performance_counters pc
    JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id = @snapshot_time_id
        AND pc.performance_object_name = 'Processor' AND pc.performance_counter_name = '% Processor Time' 
        AND pc.performance_instance_name != '_Total'
    ORDER BY 
        pc.collection_time, series
    -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
END;
GO

GO
--SqlScripter----[snapshots].[rpt_cpu_queues_one_snapshot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_cpu_queues_one_snapshot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_cpu_queues_one_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_cpu_queues_one_snapshot]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        CASE pc.performance_counter_name 
            WHEN 'Processor Queue Length' THEN N'Processor Queue Length'
            ELSE N'CPU ' + CONVERT (nvarchar(10), ISNULL(pc.performance_instance_name, N'')) 
        END AS series,
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        pc.formatted_value
    FROM snapshots.performance_counters pc
    JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id = @snapshot_time_id
        AND 
        (
            (pc.performance_object_name = 'Server Work Queues' AND pc.performance_counter_name = 'Queue Length'
                AND pc.performance_instance_name != '_Total' AND ISNUMERIC (pc.performance_instance_name) = 1)
            OR (pc.performance_object_name = 'System' AND pc.performance_counter_name = 'Processor Queue Length')
        )
    ORDER BY 
        pc.collection_time, series
END;
GO

GO
--SqlScripter----[snapshots].[rpt_cpu_usage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_cpu_usage]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_cpu_usage] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_cpu_usage]
@instance_name sysname,
    @start_time datetime = NULL,
    @end_time datetime = NULL,
    @time_window_size smallint = NULL,
    @time_interval_min smallint = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Convert snapshot_time (datetimeoffset(7)) to a UTC datetime
    IF (@end_time IS NULL)
        SET @end_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MAX(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));

    IF (@start_time IS NULL)
    BEGIN
        -- If time_window_size and time_interval_min are set use them
        -- to determine the start time
        -- Otherwise use the earliest available snapshot_time
        IF @time_window_size IS NOT NULL AND @time_interval_min IS NOT NULL
        BEGIN
            SET @start_time = DATEADD(minute, @time_window_size * @time_interval_min * -1.0, @end_time);
        END
        ELSE
        BEGIN
            -- Convert min snapshot_time (datetimeoffset(7)) to a UTC datetime
            SET @start_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MIN(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));
        END
    END

    DECLARE @end_snapshot_time_id int;
    SELECT @end_snapshot_time_id = MAX(snapshot_time_id) FROM core.snapshots WHERE snapshot_time <= @end_time;

    DECLARE @start_snapshot_time_id int;
    SELECT @start_snapshot_time_id = MIN(snapshot_time_id) FROM core.snapshots WHERE snapshot_time >= @start_time;

    -- Determine the CPU count on the target system by querying the number of "Processor" 
    -- counter instances we captured in a perfmon sample that was captured around the same 
    -- time. 
    DECLARE @cpu_count smallint
        SELECT @cpu_count = COUNT (DISTINCT pc.performance_instance_name)
        FROM snapshots.performance_counters AS pc
        INNER JOIN core.snapshots s ON s.snapshot_id = pc.snapshot_id 
        WHERE pc.performance_object_name = 'Processor' AND pc.performance_counter_name = '% Processor Time'
        AND pc.performance_instance_name != '_Total'
        AND s.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id 
        AND s.instance_name = @instance_name
            AND pc.collection_time = 
                (SELECT TOP 1 collection_time FROM snapshots.performance_counter_values pcv2 WHERE pcv2.snapshot_id = s.snapshot_id)
    SELECT 
        CASE pc.performance_object_name
            WHEN 'Processor' THEN 'System'
            ELSE 'SQL Server'
        END AS series,
        s.snapshot_time_id, 
        CONVERT (datetime, SWITCHOFFSET (CAST (s.snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time, 
        -- Processor time on an eight proc system is 0-800% for the Process object, 
        -- but 0-100% for the Processor object
        CASE pc.performance_object_name
            WHEN 'Processor' THEN pc.formatted_value 
            ELSE pc.formatted_value / @cpu_count
        END AS formatted_value
    FROM snapshots.performance_counters pc
    JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
        AND 
        (
            (pc.performance_object_name = 'Processor' AND pc.performance_counter_name = '% Processor Time' AND pc.performance_instance_name = '_Total')
            OR (pc.performance_object_name = 'Process' AND pc.performance_counter_name = '% Processor Time' AND pc.performance_instance_name = 'sqlservr')
        )
    ORDER BY pc.collection_time, series
        -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
        OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
        
END;
GO

GO
--SqlScripter----[snapshots].[rpt_cpu_usage_per_process].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_cpu_usage_per_process]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_cpu_usage_per_process] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_cpu_usage_per_process]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Determine the CPU count on the target system by querying the number of "Processor" 
    -- counter instances we captured in a perfmon sample that was captured around the same 
    -- time. 
    DECLARE @cpu_count smallint
    SELECT @cpu_count = COUNT (DISTINCT pc.performance_instance_name)
    FROM snapshots.performance_counters AS pc
    INNER JOIN core.snapshots s ON s.snapshot_id = pc.snapshot_id 
    WHERE pc.performance_object_name = 'Processor' AND pc.performance_counter_name = '% Processor Time'
        AND pc.performance_instance_name != '_Total'
        AND s.snapshot_time_id = @snapshot_time_id
        AND s.instance_name = @instance_name
        AND pc.collection_time = 
            (SELECT TOP 1 collection_time FROM snapshots.performance_counter_values pcv2 WHERE pcv2.snapshot_id = s.snapshot_id)

    SELECT TOP 10
        cpu.process_name,
        cpu.minimum_value / @cpu_count AS cpu_minimum_value,
        cpu.maximum_value / @cpu_count AS cpu_maximum_value,
        cpu.average_value / @cpu_count AS cpu_average_value,
        tc.average_value AS  tc_average_value
    FROM
    (  SELECT
            ISNULL(pc.performance_instance_name, N'') AS process_name,
            MIN(pc.formatted_value)         AS minimum_value,
            MAX(pc.formatted_value)         AS maximum_value,
            AVG(pc.formatted_value)         AS average_value
        FROM [snapshots].[performance_counters] AS pc
        INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
        WHERE
            s.snapshot_time_id = @snapshot_time_id
            AND s.instance_name = @instance_name
            AND (pc.performance_object_name = 'Process' AND pc.performance_counter_name = '% Processor Time'
                AND pc.performance_instance_name NOT IN ('_Total', 'Idle'))
        GROUP BY pc.performance_instance_name
    ) AS cpu
    INNER JOIN
    (  SELECT
            ISNULL(pc.performance_instance_name, N'') AS process_name,
            MIN(pc.formatted_value)         AS minimum_value,
            MAX(pc.formatted_value)         AS maximum_value,
            AVG(pc.formatted_value)         AS average_value
        FROM [snapshots].[performance_counters] as pc
        INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
        WHERE
            s.snapshot_time_id = @snapshot_time_id
            AND s.instance_name = @instance_name
            AND (pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'Thread Count'
                AND pc.performance_instance_name NOT IN ('_Total', 'Idle'))
        GROUP BY pc.performance_instance_name
    ) AS tc ON (tc.process_name = cpu.process_name)
    ORDER BY cpu_average_value DESC

END;
GO

GO
--SqlScripter----[snapshots].[rpt_disk_queues_one_snapshot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_disk_queues_one_snapshot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_disk_queues_one_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_disk_queues_one_snapshot]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        ISNULL(pc.performance_instance_name, N'') AS disk_letter,
        pc.performance_counter_name AS counter,
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        pc.formatted_value
    FROM snapshots.performance_counters pc
    INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id = @snapshot_time_id
        AND pc.performance_object_name = 'LogicalDisk' 
        AND pc.performance_counter_name IN ('Current Disk Queue Length', 'Avg. Disk Read Queue Length', 'Avg. Disk Write Queue Length')
        AND pc.performance_instance_name != '_Total'
    ORDER BY 
        pc.collection_time, pc.performance_counter_name, ISNULL(pc.performance_instance_name, N'')
END;
GO

GO
--SqlScripter----[snapshots].[rpt_disk_ratios_one_snapshot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_disk_ratios_one_snapshot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_disk_ratios_one_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_disk_ratios_one_snapshot]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        ISNULL(pc.performance_instance_name, N'') AS disk_letter,
        pc.performance_counter_name AS counter,
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        pc.formatted_value
    FROM snapshots.performance_counters pc
    INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id = @snapshot_time_id
        AND pc.performance_object_name = 'LogicalDisk' 
        AND pc.performance_counter_name IN ('Disk Reads/sec', 'Disk Writes/sec')
        AND pc.performance_instance_name != '_Total'
    ORDER BY 
        pc.collection_time, pc.performance_counter_name, ISNULL(pc.performance_instance_name, N'')
END;
GO

GO
--SqlScripter----[snapshots].[rpt_disk_speed_one_snapshot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_disk_speed_one_snapshot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_disk_speed_one_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_disk_speed_one_snapshot]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        ISNULL(pc.performance_instance_name, N'') AS disk_letter,
        pc.performance_counter_name AS counter,
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        pc.formatted_value AS formatted_value
    FROM snapshots.performance_counters pc
    INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id = @snapshot_time_id
        AND pc.performance_object_name = 'LogicalDisk' 
        AND pc.performance_counter_name IN ('Avg. Disk sec/Read', 'Avg. Disk sec/Write')
        AND pc.performance_instance_name != '_Total'
    ORDER BY 
        pc.collection_time, pc.performance_counter_name, ISNULL(pc.performance_instance_name, N'')
END;
GO

GO
--SqlScripter----[snapshots].[rpt_disk_usage_per_process].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_disk_usage_per_process]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_disk_usage_per_process] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_disk_usage_per_process]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT TOP 10
        wb.process_name,
        wb.minimum_value AS wb_minimum_value,
        wb.maximum_value AS wb_maximum_value,
        wb.average_value AS wb_average_value,
        rb.minimum_value AS rb_minimum_value,
        rb.maximum_value AS rb_maximum_value,
        rb.average_value AS rb_average_value
    FROM
    (  SELECT
            ISNULL(pc.performance_instance_name, N'') AS process_name,
            MIN(pc.formatted_value / (1024))        as minimum_value,
            MAX(pc.formatted_value / (1024))        as maximum_value,
            AVG(pc.formatted_value / (1024))        as average_value
        FROM [snapshots].[performance_counters] as pc
        INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
        WHERE
            s.snapshot_time_id = @snapshot_time_id
            AND s.instance_name = @instance_name
            AND pc.performance_object_name = 'Process' 
            AND pc.performance_counter_name = 'IO Read Bytes/sec'
            AND pc.performance_instance_name NOT IN ('_Total', 'Idle')
        GROUP BY pc.performance_instance_name
    ) AS rb
    INNER JOIN
    (  SELECT
            ISNULL(pc.performance_instance_name, N'') AS process_name,
            MIN(pc.formatted_value / (1024))        as minimum_value,
            MAX(pc.formatted_value / (1024))        as maximum_value,
            AVG(pc.formatted_value / (1024))        as average_value
        FROM [snapshots].[performance_counters] as pc
        INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
        WHERE
            s.snapshot_time_id = @snapshot_time_id
            AND s.instance_name = @instance_name
            AND pc.performance_object_name = 'Process' 
            AND pc.performance_counter_name = 'IO Write Bytes/sec'
            AND pc.performance_instance_name NOT IN ('_Total', 'Idle')
        GROUP BY pc.performance_instance_name
    ) AS wb ON (wb.process_name = rb.process_name)
    ORDER BY wb_average_value DESC, rb_average_value DESC
END;
GO

GO
--SqlScripter----[snapshots].[rpt_generic_perfmon].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_generic_perfmon]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_generic_perfmon] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_generic_perfmon]
@ServerName sysname, 
    @EndTime datetime, 
    @WindowSize int, 
    @DataGroupID nvarchar(128), 
    @CollectionSetUid nvarchar(64), 
    @interval_count int = 40
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @start_time_internal datetimeoffset(7);
    DECLARE @end_time_internal datetimeoffset(7);
    
    -- Start time should be passed in as a UTC datetime
    IF (@EndTime IS NOT NULL)
    BEGIN
        -- Assumed time zone offset for this conversion is +00:00 (datetime must be passed in as UTC)
        SET @end_time_internal = CAST (@EndTime AS datetimeoffset(7));
    END
    ELSE BEGIN
        SELECT @end_time_internal = MAX(snapshot_time)
        FROM core.snapshots 
        WHERE instance_name = @ServerName AND collection_set_uid = @CollectionSetUid
    END
    SET @start_time_internal = DATEADD (minute, -1 * @WindowSize, @end_time_internal);
    
    -- Divide the time window up into N equal intervals.  Each interval will correspond to one 
    -- point on a line chart.  Calc the duration of one interval, in seconds. 
    DECLARE @group_interval_sec int
    IF @interval_count < 1 SET @interval_count = 1
    SET @group_interval_sec = ROUND (DATEDIFF (second, @start_time_internal, @end_time_internal) / @interval_count, 0)
    IF @group_interval_sec < 10 SET @group_interval_sec = 10

    -- For counter groups that include the "Process(abc)\% Processor Time" counter (e.g. 'ServerActivity' and 'SystemCpuUsagePivot'), 
    -- we must determine the logical CPU count on the target system by querying the number of "Processor" counter instances we 
    -- captured in a perfmon sample that was captured around the same time. 
    DECLARE @cpu_count smallint
    SET @cpu_count = 1
    IF EXISTS (
        SELECT * FROM [core].[performance_counter_report_group_items] 
        WHERE counter_group_id = @DataGroupID AND [divide_by_cpu_count] = 1
    )
    BEGIN
        SELECT @cpu_count = COUNT (DISTINCT pc.performance_instance_name)
        FROM snapshots.performance_counters AS pc
        INNER JOIN core.snapshots s ON s.snapshot_id = pc.snapshot_id 
        WHERE pc.performance_object_name = 'Processor' AND pc.performance_counter_name = '% Processor Time'
            AND pc.performance_instance_name != '_Total' AND ISNUMERIC (pc.performance_instance_name) = 1
            AND s.instance_name = @ServerName AND s.collection_set_uid = @CollectionSetUid
            AND s.snapshot_id = 
                (SELECT TOP 1 s2.snapshot_id FROM core.snapshots AS s2 
                INNER JOIN snapshots.performance_counters AS pc2 ON s2.snapshot_id = pc2.snapshot_id 
                WHERE s2.snapshot_time > @start_time_internal
                    AND s2.instance_name = @ServerName AND s2.collection_set_uid = @CollectionSetUid
                    AND pc2.performance_object_name = 'Processor' AND pc2.performance_counter_name = '% Processor Time')
            AND pc.collection_time = 
                (SELECT TOP 1 collection_time FROM snapshots.performance_counter_values pcv2 WHERE pcv2.snapshot_id = s.snapshot_id)
        -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
        OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
        
        IF ISNULL (@cpu_count, 0) = 0
        BEGIN
            -- This message will never be shown on a report. It is included here only as a troubleshooting aid. 
            RAISERROR ('Unable to determine CPU count. Assuming 1 CPU for process CPU calculations', 9, 1)
            SET @cpu_count = 1
        END
    END

    -- Get the matching performance counter instances for this data group
    SELECT 
        pci.*, 
        cl.counter_group_item_id, cl.counter_group_id, cl.counter_subgroup_id, cl.series_name, 
        cl.multiply_by, cl.divide_by_cpu_count
    INTO #pci
    FROM snapshots.performance_counter_instances AS pci
    INNER JOIN [core].[performance_counter_report_group_items] AS cl 
        ON cl.counter_group_id = @DataGroupID
        AND pci.counter_name = cl.counter_name 
        AND ISNULL(pci.instance_name, N'') LIKE cl.instance_name 
        AND 
        (
            (cl.object_name_wildcards = 0 AND pci.[object_name] = cl.[object_name])
            OR (cl.object_name_wildcards = 1 AND pci.[object_name] LIKE cl.[object_name])
        )
        AND (cl.not_instance_name IS NULL OR pci.instance_name NOT LIKE cl.not_instance_name);
    
    -- Get the perfmon counter values for these counters in each time interval. 
    -- NOTE: If you change the schema of this resultset, you must also update the CREATE TABLE in [rpt_generic_perfmon_pivot]. 
    SELECT 
        #pci.counter_subgroup_id, 
        REPLACE (#pci.series_name, '[COUNTER_INSTANCE]', ISNULL(#pci.instance_name, N'')) AS series_name, 
        -- Using our time window end time (@end_time_internal) as a reference point, divide 
        -- the time window into [@interval_count] intervals of [@group_interval_sec] duration 
        -- per interval. 
        DATEDIFF (second, @end_time_internal, SWITCHOFFSET (CONVERT (datetimeoffset(7), pc.collection_time), '+00:00')) / @group_interval_sec AS interval_id, 
        -- Find the end time for the current time interval, and return as a UTC datetime
        -- Do this by converting [collection_time] into a second count, dividing and multiplying 
        -- the count by [@group_interval_sec] to discard any fraction of an interval, then 
        -- converting the second count back into a datetime.  That datetime is the end point for 
        -- the time interval that this [collection_time] value falls within. 
        CONVERT (datetime, 
            DATEADD (
                second, 
                (DATEDIFF (second, @end_time_internal, SWITCHOFFSET (CONVERT (datetimeoffset(7), pc.collection_time), '+00:00')) / @group_interval_sec) * @group_interval_sec, 
                @end_time_internal
            ) 
        ) AS interval_end_time, 
        #pci.counter_name, 
        AVG( pc.formatted_value * #pci.multiply_by / CASE WHEN #pci.divide_by_cpu_count = 1 THEN @cpu_count ELSE 1 END ) AS avg_formatted_value, 
        MAX( pc.formatted_value * #pci.multiply_by / CASE WHEN #pci.divide_by_cpu_count = 1 THEN @cpu_count ELSE 1 END ) AS max_formatted_value, 
        MIN( pc.formatted_value * #pci.multiply_by / CASE WHEN #pci.divide_by_cpu_count = 1 THEN @cpu_count ELSE 1 END ) AS min_formatted_value, 
        -- This column can be used to simulate a "_Total" instance for multi-instance counters that lack _Total -- use a "%" for #counterlist.instance_name
        -- Expression "1.0 * pc.formatted_value * cl.multiply_by / CASE WHEN cl.divide_by_cpu_count = 1 THEN @cpu_count ELSE 1 END" is the counter value. 
        -- Expression "AVG(<counter_value>) * COUNT (DISTINCT pc.performance_instance_name)" returns the simulated "_Total" instance.
        -- Only valid for multi-instance counters that don't already have a "_Total"). 
        CONVERT (bigint, AVG( 1.0 * pc.formatted_value * #pci.multiply_by / CASE WHEN #pci.divide_by_cpu_count = 1 THEN @cpu_count ELSE 1 END)) 
            * COUNT (DISTINCT #pci.instance_name) AS multi_instance_avg_formatted_value
    FROM snapshots.performance_counter_values AS pc
    INNER JOIN #pci ON #pci.performance_counter_id = pc.performance_counter_instance_id
    INNER JOIN core.snapshots s ON s.snapshot_id = pc.snapshot_id
    WHERE s.instance_name = @ServerName AND s.collection_set_uid = @CollectionSetUid
        AND pc.collection_time BETWEEN @start_time_internal AND @end_time_internal
    GROUP BY 
        DATEDIFF (second, @end_time_internal, SWITCHOFFSET (CONVERT (datetimeoffset(7), pc.collection_time), '+00:00')) / @group_interval_sec, #pci.counter_subgroup_id, 
        #pci.counter_name, 
        REPLACE (#pci.series_name, '[COUNTER_INSTANCE]', ISNULL(#pci.instance_name, N''))
    ORDER BY #pci.counter_subgroup_id, interval_end_time, 2, #pci.counter_name
    -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
END
GO

GO
--SqlScripter----[snapshots].[rpt_generic_perfmon_pivot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_generic_perfmon_pivot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_generic_perfmon_pivot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_generic_perfmon_pivot]
@ServerName sysname, 
    @EndTime datetime, 
    @WindowSize int, 
    @DataGroupID nvarchar(128), 
    @CollectionSetUid varchar(64), 
    @interval_count int = 1
AS
BEGIN
    SET NOCOUNT ON;

    CREATE TABLE #countervalues (
        counter_subgroup_id nvarchar(512),          -- name of the data subgroup (e.g. chart or table) that requested the counter (used by a chart to filter out its rows from the larger resultset)
        series_name nvarchar(1024),                 -- chart series label 
        interval_id int,                            -- not used here
        interval_end_time datetime,                 -- not used here
        performance_counter_name nvarchar(2048),    -- perfmon counter name
        avg_formatted_value bigint,                 -- avg perfmon counter value over the time period
        max_formatted_value bigint,                 -- max perfmon counter value over the time period
        min_formatted_value bigint,                 -- min perfmon counter value over the time period
        multi_instance_avg_formatted_value bigint   -- simulated "_Total" instance value for multi-instance counters that lack _Total
    )
    
    SET @DataGroupID = @DataGroupID + 'Pivot'
    INSERT INTO #countervalues
    EXEC [snapshots].[rpt_generic_perfmon] 
        @ServerName, 
        @EndTime, 
        @WindowSize, 
        @DataGroupID, 
        @CollectionSetUid, 
        @interval_count

    IF EXISTS (SELECT * FROM #countervalues)
    BEGIN
        -- @counterlist looks like "[Counter 1], [Counter 2]"
        DECLARE @counterlist nvarchar(max)
        -- @columnlist_min_inner looks like "[Counter 1] AS [Counter 1_min], [Counter 2] AS [Counter 2_min]"
        DECLARE @columnlist_min_inner nvarchar(max)
        -- @columnlist_max_inner looks like "[Counter 1] AS [Counter 1_max], [Counter 2] AS [Counter 2_max]"
        DECLARE @columnlist_max_inner nvarchar(max)
        -- @columnlist_min_outer looks like "[Counter 1_min], [Counter 2_min]"
        DECLARE @columnlist_min_outer nvarchar(max)
        -- @columnlist_max_outer looks like "[Counter 1_max], [Counter 2_max]"
        DECLARE @columnlist_max_outer nvarchar(max)
        SET @counterlist = ''
        SET @columnlist_min_inner = ''
        SET @columnlist_min_outer = ''
        SET @columnlist_max_inner = ''
        SET @columnlist_max_outer = ''
        
        -- Build counter lists
        SELECT 
            @counterlist = @counterlist 
                -- Escape any embedded ']' chars (we can't use QUOTENAME because it can't handle strings > 128 chars)
                + ', [' + REPLACE (performance_counter_name, ']', ']]') + ']'
            , @columnlist_min_outer = @columnlist_min_outer + ', [' + REPLACE (performance_counter_name, ']', ']]') + '_min]'
            , @columnlist_min_inner = @columnlist_min_inner + ', [' + REPLACE (performance_counter_name, ']', ']]') + ']'
                + ' AS [' + REPLACE (performance_counter_name, ']', ']]') + '_min]'
            , @columnlist_max_outer = @columnlist_max_outer + ', [' + REPLACE (performance_counter_name, ']', ']]') + '_max]'
            , @columnlist_max_inner = @columnlist_max_inner + ', [' + REPLACE (performance_counter_name, ']', ']]') + ']'
                + ' AS [' + REPLACE (performance_counter_name, ']', ']]') + '_max]'
        FROM (SELECT DISTINCT performance_counter_name FROM #countervalues) AS t
        GROUP BY performance_counter_name 
        OPTION (MAXDOP 1)
        -- Remove the leading comma
        SET @counterlist = SUBSTRING (@counterlist, 3, LEN (@counterlist)-2)
        SET @columnlist_min_inner = SUBSTRING (@columnlist_min_inner, 3, LEN (@columnlist_min_inner)-2)
        SET @columnlist_min_outer = SUBSTRING (@columnlist_min_outer, 3, LEN (@columnlist_min_outer)-2)
        SET @columnlist_max_inner = SUBSTRING (@columnlist_max_inner, 3, LEN (@columnlist_max_inner)-2)
        SET @columnlist_max_outer = SUBSTRING (@columnlist_max_outer, 3, LEN (@columnlist_max_outer)-2)

        -- We have to use three PIVOTs here because SQL only allows one aggregate function 
        -- per PIVOT, and we need AVG, MIN, and MAX.  They are over a very small temp table, 
        -- though (by default just one row per counter), so the execution cost isn't 
        -- excessive. 
        DECLARE @sql nvarchar(max)
        SET @sql = '
            SELECT avg_pivot.*, ' + @columnlist_min_outer + ', ' + @columnlist_max_outer + '
            FROM 
            (
                SELECT series_name, interval_end_time, ' + @counterlist + '
                FROM 
                (
                    SELECT series_name, interval_end_time, performance_counter_name, avg_formatted_value
                    FROM #countervalues
                ) AS SourceTable
                PIVOT 
                (
                    AVG (avg_formatted_value) 
                    FOR performance_counter_name IN (' + @counterlist + ')
                ) AS PivotTable
            ) AS avg_pivot
            
            INNER JOIN 
            (
                SELECT series_name, interval_end_time, ' + @columnlist_min_inner + '
                FROM 
                (
                    SELECT series_name, interval_end_time, performance_counter_name, min_formatted_value
                    FROM #countervalues
                ) AS SourceTable
                PIVOT 
                (
                    MIN (min_formatted_value) 
                    FOR performance_counter_name IN (' + @counterlist + ')
                ) AS PivotTable
            ) AS min_pivot ON min_pivot.series_name = avg_pivot.series_name AND min_pivot.interval_end_time = avg_pivot.interval_end_time
            
            INNER JOIN 
            (
                SELECT series_name, interval_end_time, ' + @columnlist_max_inner + '
                FROM 
                (
                    SELECT series_name, interval_end_time, performance_counter_name, max_formatted_value
                    FROM #countervalues
                ) AS SourceTable
                PIVOT 
                (
                    MAX (max_formatted_value) 
                    FOR performance_counter_name IN (' + @counterlist + ')
                ) AS PivotTable
            ) AS max_pivot ON max_pivot.series_name = avg_pivot.series_name AND max_pivot.interval_end_time = avg_pivot.interval_end_time
            '
        EXEC sp_executesql @sql
    END
END;
GO

GO
--SqlScripter----[snapshots].[rpt_interval_collection_times].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_interval_collection_times]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_interval_collection_times] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_interval_collection_times]
@ServerName sysname,
    @EndTime datetime = NULL,
    @WindowSize int = NULL, 
    @TargetCollectionTable sysname, 
    @CollectionSetUid varchar(64), 
    @interval_count int = 40, 
    @include_snapshot_detail bit = 0
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @start_time_internal datetimeoffset(7);
    DECLARE @end_time_internal datetimeoffset(7);
    
    -- Start time should be passed in as a UTC datetime
    IF (@EndTime IS NOT NULL)
    BEGIN
        -- Assumed time zone offset for this conversion is +00:00 (datetime must be passed in as UTC)
        SET @end_time_internal = CAST (@EndTime AS datetimeoffset(7));
    END
    ELSE BEGIN
        SELECT @end_time_internal = MAX(snapshot_time)
        FROM core.snapshots 
        WHERE instance_name = @ServerName AND collection_set_uid = @CollectionSetUid
    END
    SET @start_time_internal = DATEADD (minute, -1 * @WindowSize, @end_time_internal);
    
    -- Get the earliest and latest snapshot_id values that could contain data for the selected time interval. 
    -- This will allow a more efficient query plan. 
    DECLARE @start_snapshot_id int;
    DECLARE @end_snapshot_id int;
    
    SELECT @start_snapshot_id = MIN (t.snapshot_id)
    FROM
    (
        SELECT TOP 2 s.snapshot_id
        FROM core.snapshots AS s 
        WHERE s.instance_name = @ServerName AND s.collection_set_uid = @CollectionSetUid
            AND s.snapshot_time < @start_time_internal
        ORDER BY s.snapshot_id DESC
    ) AS t
    
    SELECT @end_snapshot_id = MAX (t.snapshot_id) 
    FROM 
    (
        SELECT TOP 2 snapshot_id
        FROM core.snapshots AS s 
        WHERE s.instance_name = @ServerName AND s.collection_set_uid = @CollectionSetUid
            AND s.snapshot_time >= @end_time_internal
        ORDER BY s.snapshot_id ASC
    ) AS t
    
    IF @start_snapshot_id IS NULL SELECT @start_snapshot_id = MIN (snapshot_id) FROM core.snapshots
    IF @end_snapshot_id IS NULL SELECT @end_snapshot_id = MAX (snapshot_id) FROM core.snapshots
    
    -- Divide the time window up into N equal intervals.  
    -- First, calculate the duration of one interval, in minutes. 
    DECLARE @group_interval_min int
    SET @group_interval_min = ROUND (DATEDIFF (second, @start_time_internal, @end_time_internal) / 60.0 / @interval_count, 0)
    IF @group_interval_min = 0 SET @group_interval_min = 1
        
    IF (ISNULL (PARSENAME (@TargetCollectionTable, 2), 'snapshots') IN ('snapshots', 'custom_snapshots'))
    BEGIN
        /*
        Some explanation of the expressions used in the query below: 
        
        DATEDIFF (minute, ''20000101'', dataTable.collection_time) / @group_interval_min AS interval_time_id
            - @group_interval_min is the length of one time interval (one Nth of the selected time window), in minutes
            - "DATEDIFF (minute, ''20000101'', dataTable.collection_time)" converts each collection time into an integer (the # of minutes since a fixed reference date)
            - This value is divided by @group_interval_min to get an integer "interval ID".  The query uses this in the GROUP BY clause to group together all collection 
              times that fall within the same time interval.

        DATEADD (minute, (<<interval_id_expression>> * @group_interval_min, ''20000101'') AS interval_start_time
            - This uses (interval number) * (minutes/interval) + (reference date) to generate the time interval's start time 
            - The next column ([interval_end_time]) is the same as the above, except the time is calculated for the following interval ID (an interval's end time is 
              also the start time for the following time interval)
        */

        -- Get the collection times that fall within the specified time window, and compute the time interval ID for each collection time
        CREATE TABLE #snapshots (
            interval_time_id int, 
            interval_start_time datetimeoffset(7), 
            interval_end_time datetimeoffset(7), 
            interval_id int, 
            collection_time datetimeoffset(7), 
            source_id int, 
            snapshot_id int
        )

        -- Dynamic SQL will re-evaluate object permissions -- the current user must have SELECT permission on the target table. 
        DECLARE @sql nvarchar(4000)
        SET @sql = '
        INSERT INTO #snapshots 
        SELECT DISTINCT 
            DATEDIFF (minute, ''20000101'', dataTable.collection_time) / @group_interval_min AS interval_time_id, 
            DATEADD (minute, (DATEDIFF (minute, ''20000101'', dataTable.collection_time) / @group_interval_min) * @group_interval_min, ''20000101'') AS interval_start_time, 
            DATEADD (minute, (DATEDIFF (minute, ''20000101'', dataTable.collection_time) / @group_interval_min + 1) * @group_interval_min, ''20000101'') AS interval_end_time, 
            DENSE_RANK() OVER (ORDER BY DATEDIFF (minute, ''20000101'', dataTable.collection_time) / @group_interval_min) AS interval_id,  
            dataTable.collection_time, s.source_id, s.snapshot_id 
        FROM ' + ISNULL (QUOTENAME (PARSENAME (@TargetCollectionTable, 2)), '[snapshots]') + '.' + QUOTENAME (PARSENAME (@TargetCollectionTable, 1)) + ' AS dataTable
        INNER JOIN core.snapshots AS s ON dataTable.snapshot_id = s.snapshot_id
        WHERE dataTable.collection_time BETWEEN @start_time_internal AND @end_time_internal
            AND s.snapshot_id BETWEEN @start_snapshot_id AND @end_snapshot_id
            AND s.instance_name = @ServerName AND s.collection_set_uid = @CollectionSetUid'
        
        EXEC sp_executesql 
            @sql, 
            N'@ServerName sysname, @CollectionSetUid nvarchar(64), @start_time_internal datetimeoffset(7), @end_time_internal datetimeoffset(7), @group_interval_min int, 
                @start_snapshot_id int, @end_snapshot_id int', 
            @ServerName = @ServerName, @CollectionSetUid = @CollectionSetUid, @start_time_internal = @start_time_internal, @end_time_internal = @end_time_internal, 
            @group_interval_min = @group_interval_min, @start_snapshot_id = @start_snapshot_id, @end_snapshot_id = @end_snapshot_id
        
        
        -- If the caller doesn't care about anything but the interval boundaries, don't bother returning the collection_time/snapshot_id values
        -- that fall in the middle of an interval. 
        IF (@include_snapshot_detail = 0)
        BEGIN
            SELECT interval_time_id, interval_start_time, interval_end_time, interval_id, 
                MIN (collection_time) AS first_collection_time, MAX (collection_time) AS last_collection_time, 
                MIN (snapshot_id) AS first_snapshot_id, MAX (snapshot_id) AS last_snapshot_id, 
                NULL AS source_id, NULL AS snapshot_id, NULL AS collection_time, NULL AS collection_time_id
            FROM #snapshots
            GROUP BY interval_time_id, interval_start_time, interval_end_time, interval_id
            ORDER BY interval_time_id
        END
        ELSE
        BEGIN
            SELECT interval_info.*, #snapshots.source_id, #snapshots.snapshot_id, #snapshots.collection_time, 
                DENSE_RANK() OVER (ORDER BY #snapshots.collection_time) AS collection_time_id
            FROM 
            (
                SELECT interval_time_id, interval_start_time, interval_end_time, interval_id, 
                    MIN (collection_time) AS first_collection_time, MAX (collection_time) AS last_collection_time, 
                    MIN (snapshot_id) AS first_snapshot_id, MAX (snapshot_id) AS last_snapshot_id
                FROM #snapshots
                GROUP BY interval_time_id, interval_start_time, interval_end_time, interval_id
            ) AS interval_info
            INNER JOIN #snapshots ON interval_info.interval_time_id = #snapshots.interval_time_id
            ORDER BY interval_info.interval_time_id, #snapshots.collection_time
        END
    END
    ELSE BEGIN
        /* Invalid parameter %s specified for %s. */
        RAISERROR (21055, 16, -1, @TargetCollectionTable, '@TargetCollectionTable')
    END
    
END;
GO

GO
--SqlScripter----[snapshots].[rpt_io_usage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_io_usage]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_io_usage] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_io_usage]
@instance_name sysname,
    @start_time datetime = NULL,
    @end_time datetime = NULL,
    @time_window_size smallint = NULL,
    @time_interval_min smallint = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Convert snapshot_time (datetimeoffset) to a UTC datetime
    IF (@end_time IS NULL)
        SET @end_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MAX(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));

    IF (@start_time IS NULL)
    BEGIN
        -- If time_window_size and time_interval_min are set use them
        -- to determine the start time
        -- Otherwise use the earliest available snapshot_time
        IF @time_window_size IS NOT NULL AND @time_interval_min IS NOT NULL
        BEGIN
            SET @start_time = DATEADD(minute, @time_window_size * @time_interval_min * -1.0, @end_time);
        END
        ELSE
        BEGIN
            -- Convert min snapshot_time (datetimeoffset) to a UTC datetime
            SET @start_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MIN(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));
        END
    END

    DECLARE @end_snapshot_time_id int;
    SELECT @end_snapshot_time_id = MAX(snapshot_time_id) FROM core.snapshots WHERE snapshot_time <= @end_time;

    DECLARE @start_snapshot_time_id int;
    SELECT @start_snapshot_time_id = MIN(snapshot_time_id) FROM core.snapshots WHERE snapshot_time >= @start_time;

    SELECT 
        N'System' AS series,
        s.snapshot_time_id,
        CONVERT (datetime, SWITCHOFFSET (CAST (s.snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time, 
        AVG(pc.formatted_value/(1024)) AS formatted_value
    FROM snapshots.performance_counters pc
    JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
        AND (pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'IO Read Bytes/sec' AND pc.performance_instance_name = '_Total')
             -- uncomment when defect 109313 is fixed
             --OR pc.path LIKE N'\Process(!_Total)\IO Write Bytes/sec' ESCAPE N'!')
    GROUP BY
        s.snapshot_time_id,
        s.snapshot_time
    UNION ALL 
    SELECT 
        N'SQL Server' AS series,
        s.snapshot_time_id,
        CONVERT (datetime, SWITCHOFFSET (CAST (s.snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time, 
        AVG(pc.formatted_value/(1024)) AS formatted_value
    FROM snapshots.performance_counters pc
    JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
        AND (pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'IO Read Bytes/sec' AND pc.performance_instance_name = 'sqlservr')
             -- uncomment when defect 109313 is fixed
             --OR pc.path LIKE N'\Process(sqlservr)\IO Write Bytes/sec')
    GROUP BY
        s.snapshot_time_id,
        s.snapshot_time
    ORDER BY 
        snapshot_time_id, series
    -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
END;
GO

GO
--SqlScripter----[snapshots].[rpt_io_virtual_file_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_io_virtual_file_stats]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_io_virtual_file_stats] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_io_virtual_file_stats]
@ServerName sysname,
    @EndTime datetime = NULL,
    @WindowSize int,
    @LogicalDisk nvarchar(255) = NULL, 
    @Database nvarchar(255) = NULL 
AS
BEGIN
    SET NOCOUNT ON;

    -- Clean string params (on drillthrough, RS may pass in empty string instead of NULL)
    IF @LogicalDisk = '' SET @LogicalDisk = NULL
    IF @Database = '' SET @Database = NULL

    -- Divide our time window up into 40 evenly-sized time intervals, and find the last collection_time within each of these intervals
    CREATE TABLE #intervals (
        interval_time_id        int, 
        interval_start_time     datetimeoffset(7),
        interval_end_time       datetimeoffset(7),
        interval_id             int, 
        first_collection_time   datetimeoffset(7), 
        last_collection_time    datetimeoffset(7), 
        first_snapshot_id       int,
        last_snapshot_id        int, 
        source_id               int,
        snapshot_id             int, 
        collection_time         datetimeoffset(7), 
        collection_time_id      int
    )
    -- GUID 49268954-... is Server Activity
    INSERT INTO #intervals
    EXEC [snapshots].[rpt_interval_collection_times] 
        @ServerName, @EndTime, @WindowSize, 'snapshots.io_virtual_file_stats', '49268954-4FD4-4EB6-AA04-CD59D9BB5714', 40, 0

    -- Get the earliest and latest snapshot_id values that contain data for the selected time interval. 
    -- This will allow a more efficient query plan. 
    DECLARE @start_snapshot_id int;
    DECLARE @end_snapshot_id int;
    SELECT @start_snapshot_id = MIN (first_snapshot_id)
    FROM #intervals
    SELECT @end_snapshot_id = MAX (last_snapshot_id)
    FROM #intervals
    
    -- Get the file stats for these collection times
    SELECT 
        coll.interval_id, coll.interval_time_id, coll.interval_start_time, coll.interval_end_time, 
        coll.first_collection_time, coll.last_collection_time, coll.first_snapshot_id, coll.last_snapshot_id, 
        fs.*
    INTO #file_stats
    FROM snapshots.io_virtual_file_stats AS fs
    INNER JOIN #intervals AS coll ON coll.last_snapshot_id = fs.snapshot_id AND coll.last_collection_time = fs.collection_time 
    WHERE 
        fs.logical_disk = ISNULL (@LogicalDisk, fs.logical_disk)
        AND fs.database_name = ISNULL (@Database, fs.database_name)
    
    -- Get file stats deltas for each interval.  
    SELECT 
        t.*, 
        /**** Combined reads + write values ****/
        t.num_of_reads_delta + t.num_of_writes_delta                    AS num_of_transfers_delta, 
        t.num_of_reads_cumulative + t.num_of_writes_cumulative          AS num_of_transfers_cumulative,  
        t.num_of_mb_read_delta + t.num_of_mb_written_delta              AS num_of_mb_transferred_delta, 
        t.num_of_mb_read_cumulative + t.num_of_mb_written_cumulative    AS num_of_mb_transferred_cumulative, 
        /**** Calc "Disk sec/Transfer" type values ***/
        t.io_stall_read_ms_delta + t.io_stall_write_ms_delta            AS io_stall_ms_delta, 
        t.io_stall_read_ms_cumulative + t.io_stall_write_ms_cumulative  AS io_stall_ms_cumulative, 
        CASE 
            WHEN t.num_of_reads_delta = 0 THEN 0 
            ELSE t.io_stall_read_ms_delta / t.num_of_reads_delta
        END                                                             AS io_stall_ms_per_read_delta, 
        CASE 
            WHEN t.num_of_reads_cumulative = 0 THEN 0 
            ELSE t.io_stall_read_ms_cumulative / t.num_of_reads_cumulative
        END                                                             AS io_stall_ms_per_read_cumulative, 
        CASE
            WHEN t.num_of_writes_delta = 0 THEN 0
            ELSE t.io_stall_write_ms_delta / t.num_of_writes_delta
        END                                                             AS io_stall_ms_per_write_delta, 
        CASE
            WHEN t.num_of_writes_cumulative = 0 THEN 0
            ELSE t.io_stall_write_ms_cumulative / t.num_of_writes_cumulative
        END                                                             AS io_stall_ms_per_write_cumulative, 
        CASE
            WHEN (t.num_of_reads_delta + t.num_of_writes_delta) = 0 THEN 0
            ELSE (t.io_stall_read_ms_delta + t.io_stall_write_ms_delta) / (t.num_of_reads_delta + t.num_of_writes_delta)
        END                                                             AS io_stall_ms_per_transfer_delta, 
        CASE
            WHEN (t.num_of_reads_cumulative + t.num_of_writes_cumulative) = 0 THEN 0
            ELSE (t.io_stall_read_ms_cumulative + t.io_stall_write_ms_cumulative) / (t.num_of_reads_cumulative + t.num_of_writes_cumulative)
        END                                                             AS io_stall_ms_per_transfer_cumulative 
    FROM
    (
        SELECT 
            fs1.interval_id, fs1.interval_time_id, fs1.first_snapshot_id, fs1.last_snapshot_id, 
            -- Convert all datetimeoffset values to UTC datetime values before returning to Reporting Services
            CONVERT (datetime, SWITCHOFFSET (CAST (fs1.first_collection_time AS datetimeoffset(7)), '+00:00')) AS first_collection_time, 
            CONVERT (datetime, SWITCHOFFSET (CAST (fs2.first_collection_time AS datetimeoffset(7)), '+00:00')) AS last_collection_time, 
            CONVERT (datetime, SWITCHOFFSET (CAST (fs1.interval_start_time AS datetimeoffset(7)), '+00:00')) AS interval_start, 
            CONVERT (datetime, SWITCHOFFSET (CAST (fs2.interval_start_time AS datetimeoffset(7)), '+00:00')) AS interval_end, 
            fs2.database_name, fs2.database_id, fs2.logical_file_name, fs2.[file_id], fs2.type_desc, fs2.logical_disk, 
            -- All file stats will be reset to zero by a service cycle, which will cause 
            -- (snapshot2_io_time-snapshot1_io_time) calculations to produce an incorrect 
            -- negative wait time for the interval.  Detect this and avoid calculating 
            -- negative IO wait time deltas. 
            /***** READS ****/
            CASE 
                WHEN (fs2.num_of_reads - fs1.num_of_reads) < 0 THEN fs2.num_of_reads
                ELSE (fs2.num_of_reads - fs1.num_of_reads)
            END AS num_of_reads_delta,                                              -- num_of_reads_delta
            fs2.num_of_reads AS num_of_reads_cumulative,                            -- num_of_reads_cumulative
            CASE 
                WHEN (fs2.num_of_bytes_read - fs1.num_of_bytes_read) < 0 THEN fs2.num_of_bytes_read 
                ELSE (fs2.num_of_bytes_read - fs1.num_of_bytes_read)
            END / 1024 / 1024 AS num_of_mb_read_delta,                              -- num_of_mb_read_delta
            fs2.num_of_bytes_read /1024/1024 AS num_of_mb_read_cumulative,          -- num_of_mb_read_cumulative
            CASE
                WHEN (fs2.io_stall_read_ms - fs1.io_stall_read_ms) < 0 THEN fs2.io_stall_read_ms
                ELSE (fs2.io_stall_read_ms - fs1.io_stall_read_ms)
            END AS io_stall_read_ms_delta,                                          -- io_stall_read_ms_delta
            fs2.io_stall_read_ms AS io_stall_read_ms_cumulative,                    -- io_stall_read_ms_cumulative
            /**** WRITES ****/
            CASE
                WHEN (fs2.num_of_writes - fs1.num_of_writes) < 0 THEN fs2.num_of_writes
                ELSE (fs2.num_of_writes - fs1.num_of_writes)
            END AS num_of_writes_delta,                                             -- num_of_writes_delta
            fs2.num_of_writes AS num_of_writes_cumulative,                          -- num_of_writes_cumulative
            CASE
                WHEN (fs2.num_of_bytes_written - fs1.num_of_bytes_written) < 0 THEN fs2.num_of_bytes_written
                ELSE (fs2.num_of_bytes_written - fs1.num_of_bytes_written)
            END / 1024 / 1024 AS num_of_mb_written_delta,                           -- num_of_mb_written_delta
            fs2.num_of_bytes_written /1024/1024 AS num_of_mb_written_cumulative,    -- num_of_mb_written_cumulative
            CASE
                WHEN (fs2.io_stall_write_ms - fs1.io_stall_write_ms) < 0 THEN fs2.io_stall_write_ms
                ELSE (fs2.io_stall_write_ms - fs1.io_stall_write_ms)
            END AS io_stall_write_ms_delta,                                         -- io_stall_write_ms_delta
            fs2.io_stall_write_ms AS io_stall_write_ms_cumulative,                  -- io_stall_write_ms_cumulative
            fs1.size_on_disk_bytes / 1024 / 1024 AS size_on_disk_mb_interval_start, -- size_on_disk_mb_interval_start
            fs2.size_on_disk_bytes / 1024 / 1024 AS size_on_disk_mb_interval_end    -- size_on_disk_mb_interval_end
        FROM #file_stats AS fs1
        -- Self-join - fs1 represents IO stats at the beginning of the sample interval, while fs2 
        -- shows file stats at the end of the interval. 
        INNER JOIN #file_stats AS fs2 ON fs1.database_id = fs2.database_id AND fs1.[file_id] = fs2.[file_id] AND fs1.interval_id = fs2.interval_id-1 

    ) AS t
    ORDER BY t.database_name, t.logical_file_name, t.last_collection_time
END
GO

GO
--SqlScripter----[snapshots].[rpt_list_all_servers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_list_all_servers]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_list_all_servers] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_list_all_servers]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        instance_name, 
        query_statistics_last_upload, 
        disk_usage_last_upload, 
        server_activity_last_upload
    FROM 
    (
        SELECT 
            -- Name of the SQL Server instance
            instance_name, 
            -- Name of the collection set.  The names in the syscollector_collection_sets table can be localized. 
            -- We use well-known strings here because we want to defer selection of the appropriate localized 
            -- string to the client. 
            CASE 
                collection_set_uid
                WHEN '2DC02BD6-E230-4C05-8516-4E8C0EF21F95' THEN 'query_statistics_last_upload'
                WHEN '7B191952-8ECF-4E12-AEB2-EF646EF79FEF' THEN 'disk_usage_last_upload'
                WHEN '49268954-4FD4-4EB6-AA04-CD59D9BB5714' THEN 'server_activity_last_upload'
                ELSE NULL -- custom Collection set, not displayed on this report
            END AS top_level_report_name,
            -- Convert datetimeoffset to UTC datetime for RS 2005 compatibility 
            CONVERT (datetime, SWITCHOFFSET (MAX (snapshot_time), '+00:00')) AS latest_snapshot_time 
        FROM core.snapshots 
        -- For this report, only system collection sets matter
        WHERE collection_set_uid IN ('2DC02BD6-E230-4C05-8516-4E8C0EF21F95', '7B191952-8ECF-4E12-AEB2-EF646EF79FEF', '49268954-4FD4-4EB6-AA04-CD59D9BB5714')
        GROUP BY instance_name, collection_set_uid
    ) AS instance_report_list 
    PIVOT 
    (
        MAX (latest_snapshot_time)
        FOR top_level_report_name IN (query_statistics_last_upload, disk_usage_last_upload, server_activity_last_upload)
    ) AS pvt 
    ORDER BY instance_name;

END;
GO

GO
--SqlScripter----[snapshots].[rpt_mem_usage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_mem_usage]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_mem_usage] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_mem_usage]
@instance_name sysname,
    @start_time datetime = NULL,
    @end_time datetime = NULL,
    @time_window_size smallint = NULL,
    @time_interval_min smallint = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Convert snapshot_time (datetimeoffset) to a UTC datetime
    IF (@end_time IS NULL)
        SET @end_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MAX(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));

    IF (@start_time IS NULL)
    BEGIN
        -- If time_window_size and time_interval_min are set use them
        -- to determine the start time
        -- Otherwise use the earliest available snapshot_time
        IF @time_window_size IS NOT NULL AND @time_interval_min IS NOT NULL
        BEGIN
            SET @start_time = DATEADD(minute, @time_window_size * @time_interval_min * -1.0, @end_time);
        END
        ELSE
        BEGIN
            -- Convert min snapshot_time (datetimeoffset) to a UTC datetime
            SET @start_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MIN(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));
        END
    END

    DECLARE @end_snapshot_time_id int;
    SELECT @end_snapshot_time_id = MAX(snapshot_time_id) FROM core.snapshots WHERE snapshot_time <= @end_time;

    DECLARE @start_snapshot_time_id int;
    SELECT @start_snapshot_time_id = MIN(snapshot_time_id) FROM core.snapshots WHERE snapshot_time >= @start_time;

    SELECT 
        N'System' AS series,
        s.snapshot_time_id,
        CONVERT (datetime, SWITCHOFFSET (CAST (s.snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time, 
        AVG(pc.formatted_value/(1024*1024)) AS formatted_value
    FROM snapshots.performance_counters pc
    JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
        AND (pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'Working Set' AND pc.performance_instance_name = '_Total')
             -- uncomment when defect 109313 is fixed
             --OR pc.path LIKE N'\Memory\Pool Nonpaged Bytes' 
             --OR pc.path LIKE N'\Memory\Cache Bytes')
    GROUP BY
        s.snapshot_time_id,
        s.snapshot_time
    UNION ALL 
    SELECT 
        N'SQL Server' AS series,
        s.snapshot_time_id,
        CONVERT (datetime, SWITCHOFFSET (CAST (s.snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time, 
        AVG(pc.formatted_value/(1024*1024)) AS formatted_value
    FROM snapshots.performance_counters pc
    JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
        AND (pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'Working Set' AND pc.performance_instance_name = 'sqlservr')
    GROUP BY
        s.snapshot_time_id,
        s.snapshot_time
    ORDER BY 
        snapshot_time_id, series
    -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
END;
GO

GO
--SqlScripter----[snapshots].[rpt_memory_counters_one_snapshot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_memory_counters_one_snapshot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_memory_counters_one_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_memory_counters_one_snapshot]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        pc.performance_counter_name AS series,
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        pc.collection_time,
        pc.formatted_value / (1024*1024) AS formatted_value
    FROM snapshots.performance_counters pc
    INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id = @snapshot_time_id
        AND 
        (
            (pc.performance_object_name = 'Memory' AND pc.performance_counter_name IN ('Cache Bytes', 'Pool Nonpaged Bytes'))
            OR (pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'Working Set' AND pc.performance_instance_name = '_Total')
        )
    ORDER BY 
        pc.collection_time, series
END;
GO

GO
--SqlScripter----[snapshots].[rpt_memory_rates_one_snapshot].sql
GO
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

GO
--SqlScripter----[snapshots].[rpt_memory_usage_per_process].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_memory_usage_per_process]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_memory_usage_per_process] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_memory_usage_per_process]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT TOP 10
        ws.process_name,
        ws.minimum_value AS ws_minimum_value,
        ws.maximum_value AS ws_maximum_value,
        ws.average_value AS ws_average_value,
        vb.minimum_value AS vb_minimum_value,
        vb.maximum_value AS vb_maximum_value,
        vb.average_value AS vb_average_value
    FROM
    (  SELECT
            ISNULL(pc.performance_instance_name, N'') as process_name,
            MIN(pc.formatted_value / (1024*1024))        as minimum_value,
            MAX(pc.formatted_value / (1024*1024))        as maximum_value,
            AVG(pc.formatted_value / (1024*1024))        as average_value
        FROM [snapshots].[performance_counters] as pc
        INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
        WHERE
            s.snapshot_time_id = @snapshot_time_id
            AND s.instance_name = @instance_name
            AND pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'Working Set'
            AND pc.performance_instance_name NOT IN ('_Total', 'Idle')
        GROUP BY pc.performance_instance_name
    ) AS ws
    INNER JOIN
    (  SELECT
            ISNULL(pc.performance_instance_name, N'') as process_name,
            MIN(pc.formatted_value / (1024*1024))        as minimum_value,
            MAX(pc.formatted_value / (1024*1024))        as maximum_value,
            AVG(pc.formatted_value / (1024*1024))        as average_value
        FROM [snapshots].[performance_counters] as pc
        INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
        WHERE
            s.snapshot_time_id = @snapshot_time_id
            AND s.instance_name = @instance_name
            AND pc.performance_object_name = 'Process' AND pc.performance_counter_name = 'Virtual Bytes'
            AND pc.performance_instance_name NOT IN ('_Total', 'Idle')
        GROUP BY pc.performance_instance_name
    ) AS vb ON (vb.process_name = ws.process_name)
    ORDER BY ws_average_value DESC

END;
GO

GO
--SqlScripter----[snapshots].[rpt_network_usage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_network_usage]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_network_usage] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_network_usage]
@instance_name sysname,
    @start_time datetime = NULL,
    @end_time datetime = NULL,
    @time_window_size smallint = NULL,
    @time_interval_min smallint = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Convert snapshot_time (datetimeoffset) to a UTC datetime
    IF (@end_time IS NULL)
        SET @end_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MAX(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));

    IF (@start_time IS NULL)
    BEGIN
        -- If time_window_size and time_interval_min are set use them
        -- to determine the start time
        -- Otherwise use the earliest available snapshot_time
        IF @time_window_size IS NOT NULL AND @time_interval_min IS NOT NULL
        BEGIN
            SET @start_time = DATEADD(minute, @time_window_size * @time_interval_min * -1.0, @end_time);
        END
        ELSE
        BEGIN
            -- Convert min snapshot_time (datetimeoffset) to a UTC datetime
            SET @start_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MIN(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));
        END
    END

    DECLARE @end_snapshot_time_id int;
    SELECT @end_snapshot_time_id = MAX(snapshot_time_id) FROM core.snapshots WHERE snapshot_time <= @end_time;

    DECLARE @start_snapshot_time_id int;
    SELECT @start_snapshot_time_id = MIN(snapshot_time_id) FROM core.snapshots WHERE snapshot_time >= @start_time;

    SELECT 
        N'System' AS series,
        s.snapshot_time_id,
        CONVERT (datetime, SWITCHOFFSET (CAST (s.snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time, 
        AVG(pc.formatted_value/(1024)) AS formatted_value
    FROM snapshots.performance_counters pc
    JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
        -- all instances 
        AND (pc.performance_object_name = 'Network Interface' AND pc.performance_counter_name = 'Bytes Total/sec')
    GROUP BY
        s.snapshot_time_id,
        s.snapshot_time
    ORDER BY 
        snapshot_time_id
    -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
END;
GO

GO
--SqlScripter----[snapshots].[rpt_next_and_previous_collection_times].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_next_and_previous_collection_times]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_next_and_previous_collection_times] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_next_and_previous_collection_times]
@ServerName sysname, 
    @CollectionTime datetime, 
    @DataGroupID nvarchar(128)
AS
BEGIN
    DECLARE @current_collection_time datetimeoffset(7)  -- current collection time
    DECLARE @current_snapshot_id int                    -- current collection time''s snapshot ID
    DECLARE @previous_collection_time datetimeoffset(7) -- next collection time
    DECLARE @next_collection_time datetimeoffset(7)     -- prior collection time
    DECLARE @snapshot_table sysname                     -- name of the snapshot table we'll be querying
    
    -- The assumed time zone offset for this conversion is +00:00 (datetime must be passed in as UTC)
    SET @current_collection_time = CAST (@CollectionTime AS datetimeoffset(7));
    -- Compensate for RS truncation of fractional seconds 
    SET @current_collection_time = DATEADD(second, 1, @CollectionTime);
    
    -- Currently, we only call this stored procedure from one place, and that code only needs next and prev collection times for 
    -- the snapshots.active_sessions_and_requests table. If, in the future, we need to call this for other tables, the three 
    -- SELECT TOP 1 queries below will need to be converted to dynamic SQL, executed via sp_executesql with OUTPUT parameters.  
    -- The correct target table name (@snapshot_table) should be determined based on the @DataGroupID parameter.  
    IF (@DataGroupID = 'SqlActiveRequests')
    BEGIN
        SET @snapshot_table = 'snapshots.active_sessions_and_requests';
    END
    ELSE BEGIN
        /* Invalid parameter %s specified for %s. */
        RAISERROR (21055, 16, -1, @DataGroupID, '@DataGroupID');
        RETURN;
    END
    
    DECLARE @sql nvarchar(max);

    -- Find our exact collection time using the approx time passed in   
    SELECT TOP 1 @current_collection_time = r.collection_time, @current_snapshot_id = r.snapshot_id
    FROM core.snapshots AS s
    INNER JOIN snapshots.active_sessions_and_requests AS r ON s.snapshot_id = r.snapshot_id
    WHERE s.instance_name = @ServerName
        AND r.collection_time <= @current_collection_time
    ORDER BY collection_time DESC;
    
    -- Find the previous collection time
    SELECT TOP 1 @previous_collection_time = r.collection_time
    FROM core.snapshots AS s
    INNER JOIN snapshots.active_sessions_and_requests AS r ON s.snapshot_id = r.snapshot_id
    WHERE s.instance_name = @ServerName
      AND r.collection_time < @current_collection_time 
    ORDER BY collection_time DESC;
    
    -- Find the next collection time
    SELECT TOP 1 @next_collection_time = r.collection_time
    FROM core.snapshots AS s
    INNER JOIN snapshots.active_sessions_and_requests AS r ON s.snapshot_id = r.snapshot_id
    WHERE s.instance_name = @ServerName
      AND r.collection_time > @current_collection_time 
    ORDER BY collection_time ASC;

    IF @previous_collection_time IS NULL SET @previous_collection_time = @current_collection_time;
    IF @next_collection_time IS NULL SET @next_collection_time = @current_collection_time;

    SELECT 
        CONVERT (datetime, SWITCHOFFSET (@current_collection_time, '+00:00')) AS current_collection_time, 
        @current_snapshot_id AS current_snapshot_id, 
        CONVERT (datetime, SWITCHOFFSET (@previous_collection_time, '+00:00')) AS previous_collection_time, 
        CONVERT (datetime, SWITCHOFFSET (@next_collection_time, '+00:00')) AS next_collection_time;
END
GO

GO
--SqlScripter----[snapshots].[rpt_plan_cache_hit_ratio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_plan_cache_hit_ratio]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_plan_cache_hit_ratio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_plan_cache_hit_ratio]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ISNULL(pc.performance_instance_name, N'') AS series,
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        pc.formatted_value
    FROM snapshots.performance_counters pc
    INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id = @snapshot_time_id
        AND pc.performance_object_name LIKE '%SQL%:Plan Cache'
        AND pc.performance_counter_name = 'Cache Hit Ratio'
        AND pc.performance_instance_name != '_Total'
    ORDER BY pc.collection_time, ISNULL(pc.performance_instance_name, N'')
END;
GO

GO
--SqlScripter----[snapshots].[rpt_query_plan_details].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_query_plan_details]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_query_plan_details] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_query_plan_details]
@instance_name sysname, 
    @plan_handle_str varchar(130), 
    @statement_start_offset int, 
    @statement_end_offset int 
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @showplan xml
    DECLARE @plan_handle varbinary(64)

    -- We may be invoked with a NULL/empty string plan handle if the user has not yet drilled down into 
    -- a specific query plan on the query_stats_detail report. 
    IF ISNULL (@plan_handle_str, '') = '' 
    BEGIN
        RETURN
    END

    SET @plan_handle = snapshots.fn_hexstrtovarbin (@plan_handle_str)

    BEGIN TRY
        SELECT TOP 1 
            @showplan = CONVERT (xml, qp.query_plan) 
        FROM snapshots.notable_query_plan AS qp 
        INNER JOIN core.snapshots snap ON snap.source_id = qp.source_id 
        WHERE plan_handle = @plan_handle 
            AND statement_start_offset = @statement_start_offset AND statement_end_offset = @statement_end_offset 
            AND snap.instance_name = @instance_name 
            -- Get sql_handle to enable a clustered index seek on notable_query_plans
            AND qp.sql_handle = 
            (
                SELECT TOP 1 sql_handle 
                FROM snapshots.notable_query_plan AS qp
                INNER JOIN core.snapshots snap ON snap.source_id = qp.source_id 
                WHERE plan_handle = @plan_handle
                    AND statement_start_offset = @statement_start_offset AND statement_end_offset = @statement_end_offset 
                    AND snap.instance_name = @instance_name
            );
    END TRY
    BEGIN CATCH
        -- It is expected that we may end up here even under normal circumstances.  Some plans are simply too 
        -- complex to represent using T-SQL's xml datatype. Raise a low-severity message with the error details. 
        DECLARE @ErrorMessage   NVARCHAR(4000);
        DECLARE @ErrorNumber    INT;
        DECLARE @ErrorLine      INT;
        SELECT @ErrorLine = ERROR_LINE(),
               @ErrorNumber = ERROR_NUMBER(),
               @ErrorMessage = ERROR_MESSAGE();
        -- "Unable to convert showplan to XML.  Error #%d on Line %d: %s"
        RAISERROR (14697, 0, 1, @ErrorNumber, @ErrorLine, @ErrorMessage);
        RETURN
    END CATCH;

    WITH XMLNAMESPACES ('http://schemas.microsoft.com/sqlserver/2004/07/showplan' AS sp)
    SELECT TOP 10 
        CONVERT (bigint, stmt_simple.stmt_node.value('(./@StatementEstRows)[1]', 'decimal(28,10)')) AS stmt_est_rows, 
        stmt_simple.stmt_node.value('(./@StatementOptmLevel)[1]', 'varchar(30)') AS stmt_optimization_level, 
        stmt_simple.stmt_node.value('(./@StatementOptmEarlyAbortReason)[1]', 'varchar(30)') AS stmt_optimization_early_abort_reason, 
        stmt_simple.stmt_node.value('(./@StatementSubTreeCost)[1]', 'float') AS stmt_est_subtree_cost, 
        stmt_simple.stmt_node.value('(./@StatementText)[1]', 'nvarchar(max)') AS stmt_text, 
        stmt_simple.stmt_node.value('(./@ParameterizedText)[1]', 'nvarchar(max)') AS stmt_parameterized_text, 
        stmt_simple.stmt_node.value('(./@StatementType)[1]', 'varchar(30)') AS stmt_type, 
        stmt_simple.stmt_node.value('(./@PlanGuideName)[1]', 'varchar(30)') AS plan_guide_name, 
        stmt_simple.stmt_node.value('(./sp:QueryPlan/@CachedPlanSize)[1]', 'int') AS plan_size, 
        stmt_simple.stmt_node.value('(./sp:QueryPlan/@CompileTime)[1]', 'bigint') AS plan_compile_time, 
        stmt_simple.stmt_node.value('(./sp:QueryPlan/@CompileCPU)[1]', 'bigint') AS plan_compile_cpu, 
        stmt_simple.stmt_node.value('(./sp:QueryPlan/@CompileMemory)[1]', 'int') AS plan_compile_memory 
    FROM (SELECT @showplan AS query_plan) AS p
    CROSS APPLY p.query_plan.nodes ('/sp:ShowPlanXML/sp:BatchSequence/sp:Batch/sp:Statements/sp:StmtSimple') as stmt_simple (stmt_node)
END
GO

GO
--SqlScripter----[snapshots].[rpt_query_plan_missing_indexes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_query_plan_missing_indexes]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_query_plan_missing_indexes] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_query_plan_missing_indexes]
@instance_name sysname, 
    @plan_handle_str varchar(130), 
    @statement_start_offset int, 
    @statement_end_offset int 
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @showplan nvarchar(max)
    DECLARE @plan_handle varbinary(64)
    DECLARE @element nvarchar(512), @element_start nvarchar(512), @element_end nvarchar(512)
    DECLARE @xml_fragment xml
    DECLARE @start_offset int

    -- We may be invoked with a NULL/empty string plan handle if the user has not yet drilled down into 
    -- a specific query plan on the query_stats_detail report. 
    IF ISNULL (@plan_handle_str, '') = '' 
    BEGIN
        RETURN
    END

    SET @plan_handle = snapshots.fn_hexstrtovarbin (@plan_handle_str)

    SELECT TOP 1 
        @showplan = CONVERT (nvarchar(max), qp.query_plan) 
    FROM snapshots.notable_query_plan qp
    INNER JOIN core.snapshots snap ON snap.source_id = qp.source_id 
    WHERE plan_handle = @plan_handle 
        AND statement_start_offset = @statement_start_offset AND statement_end_offset = @statement_end_offset
        AND snap.instance_name = @instance_name
        -- Get sql_handle to enable a clustered index seek on notable_query_plans
        AND qp.sql_handle = 
        (
            SELECT TOP 1 sql_handle 
            FROM snapshots.notable_query_plan AS qp
            INNER JOIN core.snapshots snap ON snap.source_id = qp.source_id 
            WHERE plan_handle = @plan_handle
                AND statement_start_offset = @statement_start_offset AND statement_end_offset = @statement_end_offset 
                AND snap.instance_name = @instance_name
        );

    SET @element = 'MissingIndexes'
    -- Use non-XML methods to extract the <MissingIndexes> fragment.  Some query plans may be too complex 
    -- to represent in the T-SQL xml data type, but the <MissingIndexes> node will always be simple enough. 
    -- Doing this ensures that we will always be able to extract any missing index information from the 
    -- plan even if the plan itself is too complex for the T-SQL xml type. 
    SET @element_start = '<' + @element + '>'
    SET @element_end = '</' + @element + '>'
    SET @start_offset = ISNULL (PATINDEX ('%' + @element_start + '%', @showplan), 0)
    IF @start_offset > 0 
    BEGIN
        SET @xml_fragment = SUBSTRING (@showplan, @start_offset, PATINDEX ('%' + @element_end + '%', @showplan) - @start_offset + LEN (@element_end)); 

        --  Sample <MissingIndexes> fragment from an XML query plan: 
        --    <MissingIndexes>
        --      <MissingIndexGroup Impact="26.4126">
        --        <MissingIndex Database="[AdventureWorks]" Schema="[Sales]" Table="[CustomerAddress]">
        --          <ColumnGroup Usage="EQUALITY">
        --            <Column Name="[AddressTypeID]" ColumnId="3"/>
        --          </ColumnGroup>
        --          <ColumnGroup Usage="INCLUDE">
        --          <Column Name="[CustomerID]" ColumnId="1"/>
        --            <Column Name="[AddressID]" ColumnId="2"/>
        --          </ColumnGroup>
        --        </MissingIndex>
        --      </MissingIndexGroup>
        --    </MissingIndexes>
        SELECT 
            'CREATE INDEX [ncidx_mdw_' 
                + LEFT (target_object_name, 20)
                -- Random component to make name conflicts less likely
                + '_' + CONVERT (varchar(30), ABS (CONVERT (binary(6), NEWID()) % 1000))
                + '] ON ' + target_object_fullname 
                + ' (' + ISNULL (equality_columns, '')
                + CASE WHEN ISNULL (equality_columns, '') != '' AND ISNULL (inequality_columns, '') != '' THEN ',' ELSE '' END + ISNULL (inequality_columns, '')
                + ')'
                + CASE WHEN ISNULL (included_columns, '') != '' THEN ' INCLUDE (' + included_columns + ')' ELSE '' END
                AS create_idx_statement, 
            *
        FROM 
        (
            SELECT 
                index_node.value('(../@Impact)[1]', 'float') as index_impact,
                REPLACE (REPLACE (index_node.value('(./@Table)[1]', 'nvarchar(512)'), '[', ''), ']', '') AS target_object_name,
                CONVERT (nvarchar(1024), index_node.query('concat(
                        string((./@Database)[1]), 
                        ".",
                        string((./@Schema)[1]),
                        ".",
                        string((./@Table)[1])
                    )')) AS target_object_fullname,
                REPLACE (CONVERT (nvarchar(max), index_node.query('for $colgroup in ./ColumnGroup,
                        $col in $colgroup/Column
                        where $colgroup/@Usage = "EQUALITY"
                        return string($col/@Name)')), '] [', '],[') AS equality_columns,
                REPLACE (CONVERT (nvarchar(max), index_node.query('for $colgroup in ./ColumnGroup,
                        $col in $colgroup/Column
                        where $colgroup/@Usage = "INEQUALITY"
                        return string($col/@Name)')), '] [', '],[') AS inequality_columns,
                REPLACE (CONVERT (nvarchar(max), index_node.query('for $colgroup in .//ColumnGroup,
                        $col in $colgroup/Column
                        where $colgroup/@Usage = "INCLUDE"
                        return string($col/@Name)')), '] [', '],[') AS included_columns
            FROM (SELECT @xml_fragment AS fragment) AS missing_indexes_fragment
            CROSS APPLY missing_indexes_fragment.fragment.nodes('/MissingIndexes/MissingIndexGroup/MissingIndex') AS missing_indexes (index_node)
        ) AS t
    END
END
GO

GO
--SqlScripter----[snapshots].[rpt_query_plan_parameters].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_query_plan_parameters]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_query_plan_parameters] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_query_plan_parameters]
@instance_name sysname, 
    @plan_handle_str varchar(130), 
    @statement_start_offset int, 
    @statement_end_offset int 
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @showplan xml
    DECLARE @plan_handle varbinary(64)

    -- We may be invoked with a NULL/empty string plan handle if the user has not yet drilled down into 
    -- a specific query plan on the query_stats_detail report. 
    IF ISNULL (@plan_handle_str, '') = '' 
    BEGIN
        RETURN
    END

    SET @plan_handle = snapshots.fn_hexstrtovarbin (@plan_handle_str)

    BEGIN TRY
        SELECT TOP 1 
            @showplan = CONVERT (xml, qp.query_plan) 
        FROM snapshots.notable_query_plan qp
        INNER JOIN core.snapshots snap ON snap.source_id = qp.source_id 
        WHERE plan_handle = @plan_handle 
            AND statement_start_offset = @statement_start_offset AND statement_end_offset = @statement_end_offset 
            AND snap.instance_name = @instance_name
            -- Get sql_handle to enable a clustered index seek on notable_query_plans
            AND qp.sql_handle = 
            (
                SELECT TOP 1 sql_handle 
                FROM snapshots.notable_query_plan AS qp
                INNER JOIN core.snapshots snap ON snap.source_id = qp.source_id 
                WHERE plan_handle = @plan_handle
                    AND statement_start_offset = @statement_start_offset AND statement_end_offset = @statement_end_offset 
                    AND snap.instance_name = @instance_name
            );
    END TRY
    BEGIN CATCH
        -- It is expected that we may end up here even under normal circumstances.  Some plans are simply too 
        -- complex to represent using T-SQL's xml datatype. Raise a low-severity message with the error details. 
        DECLARE @ErrorMessage   NVARCHAR(4000);
        DECLARE @ErrorNumber    INT;
        DECLARE @ErrorLine      INT;
        SELECT @ErrorLine = ERROR_LINE(),
               @ErrorNumber = ERROR_NUMBER(),
               @ErrorMessage = ERROR_MESSAGE();
        -- "Unable to convert showplan to XML.  Error #%d on Line %d: %s"
        RAISERROR (14697, 0, 1, @ErrorNumber, @ErrorLine, @ErrorMessage);
    END CATCH;

    WITH XMLNAMESPACES ('http://schemas.microsoft.com/sqlserver/2004/07/showplan' AS sp)
    SELECT 
        param_list.param_node.value('(./@Column)[1]', 'nvarchar(512)') AS param_name,
        param_list.param_node.value('(./@ParameterCompiledValue)[1]', 'nvarchar(max)') AS param_compiled_value 
    FROM (SELECT @showplan AS query_plan) AS p
    CROSS APPLY p.query_plan.nodes ('/sp:ShowPlanXML/sp:BatchSequence/sp:Batch/sp:Statements/sp:StmtSimple/sp:QueryPlan[1]/sp:ParameterList[1]/sp:ColumnReference') as param_list (param_node)
END
GO

GO
--SqlScripter----[snapshots].[rpt_query_plan_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_query_plan_stats]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_query_plan_stats] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_query_plan_stats]
@instance_name sysname,
    @start_time datetime = NULL,
    @end_time datetime = NULL,
    @time_window_size smallint,
    @time_interval_min smallint = 1, 
    @sql_handle_str varchar(130), 
    @plan_handle_str varchar(130) = NULL, 
    @plan_creation_time datetime = NULL, 
    @statement_start_offset int, 
    @statement_end_offset int, 
    @order_by_criteria varchar(30) = 'CPU'
AS
BEGIN
    SET NOCOUNT ON;

    -- @end_time should never be NULL when we are called from the Query Stats report
    -- Convert snapshot_time (datetimeoffset) to a UTC datetime
    IF (@end_time IS NULL)
        SET @end_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MAX(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));

    IF (@start_time IS NULL)
    BEGIN
        -- If time_window_size and time_interval_min are set use them
        -- to determine the start time
        -- Otherwise use the earliest available snapshot_time
        IF @time_window_size IS NOT NULL AND @time_interval_min IS NOT NULL
        BEGIN
            SET @start_time = DATEADD(minute, @time_window_size * @time_interval_min * -1.0, @end_time);
        END
        ELSE
        BEGIN
            -- Convert min snapshot_time (datetimeoffset) to a UTC datetime
            SET @start_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MIN(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));
        END
    END

    DECLARE @end_snapshot_time_id int;
    SELECT @end_snapshot_time_id = MAX(snapshot_time_id) FROM core.snapshots WHERE snapshot_time <= @end_time;

    DECLARE @start_snapshot_time_id int;
    SELECT @start_snapshot_time_id = MIN(snapshot_time_id) FROM core.snapshots WHERE snapshot_time >= @start_time;

    DECLARE @interval_sec int;
    SET @interval_sec = DATEDIFF (s, @start_time, @end_time);

    -- SQL and plan handles are passed in as a hex-formatted string. Convert to varbinary. 
    DECLARE @sql_handle varbinary(64), @plan_handle varbinary(64)
    SET @sql_handle = snapshots.fn_hexstrtovarbin (@sql_handle_str)
    IF LEN (@plan_handle_str) > 0
    BEGIN
        SET @plan_handle = snapshots.fn_hexstrtovarbin (@plan_handle_str)
    END

    SELECT 
        t.*, 
        master.dbo.fn_varbintohexstr (t.sql_handle) AS sql_handle_str, 
        master.dbo.fn_varbintohexstr (t.plan_handle) AS plan_handle_str
    FROM 
    (
        SELECT 
            stat.sql_handle, stat.statement_start_offset, stat.statement_end_offset, stat.plan_handle, 
            CONVERT (datetime, SWITCHOFFSET (CAST (stat.creation_time AS datetimeoffset(7)), '+00:00')) AS creation_time, 
            CONVERT (varchar, CONVERT (datetime, SWITCHOFFSET (CAST (MAX (stat.creation_time) AS datetimeoffset(7)), '+00:00')), 126) AS creation_time_str, 
            CONVERT (datetime, SWITCHOFFSET (CAST (MAX (stat.last_execution_time) AS datetimeoffset(7)), '+00:00')) AS last_execution_time, 
            snap.source_id, 
            SUM (stat.snapshot_execution_count) AS execution_count, 
            SUM (stat.snapshot_execution_count) / (@interval_sec / 60) AS executions_per_min, 
            SUM (stat.snapshot_worker_time / 1000) AS total_cpu, 
            SUM (stat.snapshot_worker_time / 1000) / @interval_sec AS avg_cpu_per_sec, 
            SUM (stat.snapshot_worker_time / 1000.0) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_cpu_per_exec, 
            SUM (stat.snapshot_physical_reads) AS total_physical_reads, 
            SUM (stat.snapshot_physical_reads) / @interval_sec AS avg_physical_reads_per_sec, 
            SUM (stat.snapshot_physical_reads) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_physical_reads_per_exec, 
            SUM (stat.snapshot_logical_writes) AS total_logical_writes, 
            SUM (stat.snapshot_logical_writes) / @interval_sec AS avg_logical_writes_per_sec, 
            SUM (stat.snapshot_logical_writes) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_logical_writes_per_exec, 
            SUM (stat.snapshot_elapsed_time / 1000) AS total_elapsed_time, 
            SUM (stat.snapshot_elapsed_time / 1000) / @interval_sec AS avg_elapsed_time_per_sec, 
            SUM (stat.snapshot_elapsed_time / 1000.0) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_elapsed_time_per_exec, 
            COUNT(*) AS row_count, COUNT (DISTINCT stat.creation_time) AS plan_count, 
            SUM (charted_value) AS charted_value, 
            ROW_NUMBER() OVER (ORDER BY SUM (charted_value) DESC) as query_rank
        FROM 
        (
            SELECT *, 
                -- This is the criteria used to rank the returned rowset and determine the order within Top-N plans
                -- returned from here. It is important that this part of the query stays in sync with a similar
                -- part of the query in snapshots.rpt_query_plan_stats_timeline procedure
                CASE @order_by_criteria     
                    WHEN 'CPU' THEN ((snapshot_worker_time / 1000.0) / CASE snapshot_execution_count WHEN 0 THEN 1 ELSE snapshot_execution_count END)
                    WHEN 'Physical Reads' THEN 1.0 * (snapshot_physical_reads / CASE snapshot_execution_count WHEN 0 THEN 1 ELSE snapshot_execution_count END)
                    WHEN 'Logical Writes' THEN 1.0 * (snapshot_logical_writes / CASE snapshot_execution_count WHEN 0 THEN 1 ELSE snapshot_execution_count END)
                    WHEN 'I/O' THEN 1.0 * ((snapshot_physical_reads + snapshot_logical_writes) / CASE snapshot_execution_count WHEN 0 THEN 1 ELSE snapshot_execution_count END)
                    WHEN 'Duration' THEN ((snapshot_elapsed_time / 1000.0) / CASE snapshot_execution_count WHEN 0 THEN 1 ELSE snapshot_execution_count END)
                    ELSE ((snapshot_worker_time / 1000.0) / CASE snapshot_execution_count WHEN 0 THEN 1 ELSE snapshot_execution_count END)
                END AS charted_value
            FROM snapshots.query_stats 
            WHERE 
                sql_handle = @sql_handle 
                AND (@plan_handle IS NULL OR plan_handle = @plan_handle) 
                AND (@plan_creation_time IS NULL OR creation_time = @plan_creation_time) 
                AND statement_start_offset = @statement_start_offset 
                AND statement_end_offset = @statement_end_offset
        ) stat
        INNER JOIN core.snapshots snap ON stat.snapshot_id = snap.snapshot_id
        WHERE
            snap.instance_name = @instance_name 
            AND snap.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
        GROUP BY stat.sql_handle, stat.statement_start_offset, stat.statement_end_offset, stat.plan_handle, 
                stat.creation_time, snap.source_id
    ) t
    WHERE 
        (query_rank <= 10)
    ORDER BY query_rank ASC
    -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
END
GO

GO
--SqlScripter----[snapshots].[rpt_query_plan_stats_timeline].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_query_plan_stats_timeline]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_query_plan_stats_timeline] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_query_plan_stats_timeline]
@instance_name sysname,
    @start_time datetime = NULL,
    @end_time datetime = NULL,
    @time_window_size smallint,
    @time_interval_min smallint = 1, 
    @sql_handle_str varchar(130), 
    @plan_handle_str varchar(130) = NULL, 
    @plan_creation_time datetime = NULL, 
    @statement_start_offset int, 
    @statement_end_offset int, 
    @order_by_criteria varchar(30) = 'CPU'
AS
BEGIN
    SET NOCOUNT ON;

    -- @end_time should never be NULL when we are called from the Query Stats report
    -- Convert snapshot_time (datetimeoffset) to a UTC datetime
    IF (@end_time IS NULL)
        SET @end_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MAX(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));

    IF (@start_time IS NULL)
    BEGIN
        -- If time_window_size and time_interval_min are set use them
        -- to determine the start time
        -- Otherwise use the earliest available snapshot_time
        IF @time_window_size IS NOT NULL AND @time_interval_min IS NOT NULL
        BEGIN
            SET @start_time = DATEADD(minute, @time_window_size * @time_interval_min * -1.0, @end_time);
        END
        ELSE
        BEGIN
            -- Convert min snapshot_time (datetimeoffset) to a UTC datetime
            SET @start_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MIN(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));
        END
    END

    DECLARE @end_snapshot_time_id int;
    SELECT @end_snapshot_time_id = MAX(snapshot_time_id) FROM core.snapshots WHERE snapshot_time <= @end_time;

    DECLARE @start_snapshot_time_id int;
    SELECT @start_snapshot_time_id = MIN(snapshot_time_id) FROM core.snapshots WHERE snapshot_time >= @start_time;

    -- SQL and plan handles are passed in as a hex-formatted string. Convert to varbinary. 
    DECLARE @sql_handle varbinary(64), @plan_handle varbinary(64)
    SET @sql_handle = snapshots.fn_hexstrtovarbin (@sql_handle_str)
    IF LEN (ISNULL (@plan_handle_str, '')) > 0
    BEGIN
        SET @plan_handle = snapshots.fn_hexstrtovarbin (@plan_handle_str)
    END


    CREATE TABLE #top_plans (
        plan_handle varbinary(64), 
        creation_time datetimeoffset(7), 
        plan_rank int 
    )

    -- If we weren't told to focus on a particular plan...
    IF (@plan_handle IS NULL)
    BEGIN
        -- Get the top 10 most expensive plans for this query during the specified 
        -- time window. 
        INSERT INTO #top_plans
        SELECT * FROM
        (
            SELECT 
                plan_handle, 
                creation_time, 
                ROW_NUMBER() OVER (ORDER BY SUM (ranking_value) DESC) AS plan_rank 
            FROM 
            (
                SELECT *, 
                -- This is the criteria used to rank the returned rowset and determine the order within Top-N plans
                -- returned from here. It is important that this part of the query stays in sync with a similar
                -- part of the query in snapshots.rpt_query_plan_stats procedure
                CASE @order_by_criteria 
                    WHEN 'CPU' THEN ((snapshot_worker_time / 1000.0) / CASE snapshot_execution_count WHEN 0 THEN 1 ELSE snapshot_execution_count END)
                    WHEN 'Physical Reads' THEN 1.0 * (snapshot_physical_reads / CASE snapshot_execution_count WHEN 0 THEN 1 ELSE snapshot_execution_count END)
                    WHEN 'Logical Writes' THEN 1.0 * (snapshot_logical_writes / CASE snapshot_execution_count WHEN 0 THEN 1 ELSE snapshot_execution_count END)
                    WHEN 'I/O' THEN 1.0 * ((snapshot_physical_reads + snapshot_logical_writes) / CASE snapshot_execution_count WHEN 0 THEN 1 ELSE snapshot_execution_count END)
                    WHEN 'Duration' THEN ((snapshot_elapsed_time / 1000.0) / CASE snapshot_execution_count WHEN 0 THEN 1 ELSE snapshot_execution_count END)
                    ELSE ((snapshot_worker_time / 1000.0) / CASE snapshot_execution_count WHEN 0 THEN 1 ELSE snapshot_execution_count END)
                END AS ranking_value
            FROM snapshots.query_stats 
            WHERE 
                sql_handle = @sql_handle 
                AND statement_start_offset = @statement_start_offset 
                AND statement_end_offset = @statement_end_offset
        ) AS stat
        INNER JOIN core.snapshots snap ON stat.snapshot_id = snap.snapshot_id
        WHERE
            snap.instance_name = @instance_name 
            AND snap.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
        GROUP BY plan_handle, creation_time
    ) AS t
    WHERE t.plan_rank <= 10
    -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390);
    END
    ELSE 
    BEGIN
        -- @plan_handle is not NULL; we have been told to focus on a particular plan. 
        INSERT INTO #top_plans 
        VALUES (@plan_handle, @plan_creation_time, 1)
    END;

    -- Get statistics for these 10 plans for each collection point in the time window
    WITH raw_stat AS 
    (
        SELECT *, 
            CASE @order_by_criteria 
                WHEN 'CPU' THEN snapshot_worker_time / 1000.0
                WHEN 'Physical Reads' THEN snapshot_physical_reads 
                WHEN 'Logical Writes' THEN snapshot_logical_writes 
                WHEN 'I/O' THEN (snapshot_logical_writes + snapshot_physical_reads)
                WHEN 'Duration' THEN snapshot_elapsed_time / 1000.0
                ELSE snapshot_worker_time / 1000.0
            END AS charted_value
        FROM snapshots.query_stats AS stat
    )
    SELECT 
        t.*, 
        master.dbo.fn_varbintohexstr (t.sql_handle) AS sql_handle_str, 
        master.dbo.fn_varbintohexstr (t.plan_handle) AS plan_handle_str
    FROM 
    (
        SELECT 
            stat.sql_handle, stat.statement_start_offset, stat.statement_end_offset, stat.plan_handle, 
            CONVERT (datetime, SWITCHOFFSET (CAST (stat.creation_time AS datetimeoffset(7)), '+00:00')) AS creation_time, 
            CONVERT (varchar, CONVERT (datetime, SWITCHOFFSET (CAST (MAX (stat.creation_time) AS datetimeoffset(7)), '+00:00')), 126) AS creation_time_str,             
            CONVERT (datetime, SWITCHOFFSET (CAST (MAX (stat.last_execution_time) AS datetimeoffset(7)), '+00:00')) AS last_execution_time, 
            CONVERT (datetime, SWITCHOFFSET (CAST (stat.collection_time_chart AS datetimeoffset(7)), '+00:00')) AS collection_time, 
            snap.source_id, 
            SUM (stat.snapshot_execution_count) AS execution_count, 
            SUM (stat.snapshot_worker_time / 1000) AS total_cpu, 
            SUM (stat.snapshot_worker_time / 1000) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_cpu_per_exec, 
            SUM (stat.snapshot_physical_reads) AS total_physical_reads, 
            SUM (stat.snapshot_physical_reads) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_physical_reads_per_exec, 
            SUM (stat.snapshot_logical_writes) AS total_logical_writes, 
            SUM (stat.snapshot_logical_writes) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_logical_writes_per_exec, 
            SUM (stat.snapshot_elapsed_time / 1000) AS total_elapsed_time, 
            SUM (stat.snapshot_elapsed_time / 1000) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_elapsed_time_per_exec, 
            COUNT(*) AS row_count, COUNT (DISTINCT stat.creation_time) AS plan_count, 
            SUM (stat.charted_value) AS charted_value, 
            SUM (stat.charted_value) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS charted_value_per_exec, 
            MAX (topN.plan_rank) AS plan_rank -- same value for all rows within a group
        FROM (
            -- Work around a RS chart limitation (single data points do not plot on line charts). 
            -- Fake a second data point shortly after the first so even short-lived plans will 
            -- gets plotted. 
            SELECT *, collection_time AS collection_time_chart FROM raw_stat
            UNION ALL
            SELECT *, DATEADD (mi, 1, collection_time) AS collection_time_chart FROM raw_stat
        ) AS stat
        INNER JOIN #top_plans AS topN 
            ON topN.plan_handle = stat.plan_handle AND topN.creation_time = stat.creation_time
        INNER JOIN core.snapshots snap ON stat.snapshot_id = snap.snapshot_id
        WHERE
            stat.sql_handle = @sql_handle 
            AND statement_start_offset = @statement_start_offset 
            AND statement_end_offset = @statement_end_offset
            AND snap.instance_name = @instance_name 
            AND snap.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
        GROUP BY stat.sql_handle, stat.statement_start_offset, stat.statement_end_offset, stat.plan_handle, 
                stat.creation_time, snap.source_id, stat.collection_time_chart
    ) AS t
    WHERE 
        (plan_rank <= 10)
    ORDER BY plan_rank ASC, collection_time ASC
    -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
END
GO

GO
--SqlScripter----[snapshots].[rpt_query_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_query_stats]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_query_stats] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_query_stats]
@instance_name sysname,
    @start_time datetime = NULL,
    @end_time datetime = NULL,
    @time_window_size smallint,
    @time_interval_min smallint = 1, 
    @sql_handle_str varchar(130), 
    @statement_start_offset int, 
    @statement_end_offset int
AS
BEGIN
    SET NOCOUNT ON;

    -- @end_time should never be NULL when we are called from the Query Stats report
    -- Convert snapshot_time (datetimeoffset) to a UTC datetime
    IF (@end_time IS NULL)
        SET @end_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MAX(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));

    IF (@start_time IS NULL)
    BEGIN
        -- If time_window_size and time_interval_min are set use them
        -- to determine the start time
        -- Otherwise use the earliest available snapshot_time
        IF @time_window_size IS NOT NULL AND @time_interval_min IS NOT NULL
        BEGIN
            SET @start_time = DATEADD(minute, @time_window_size * @time_interval_min * -1.0, @end_time);
        END
        ELSE
        BEGIN
            -- Convert min snapshot_time (datetimeoffset) to a UTC datetime
            SET @start_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MIN(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));
        END
    END

    DECLARE @end_snapshot_time_id int;
    SELECT @end_snapshot_time_id = MAX(snapshot_time_id) FROM core.snapshots WHERE snapshot_time <= @end_time;

    DECLARE @start_snapshot_time_id int;
    SELECT @start_snapshot_time_id = MIN(snapshot_time_id) FROM core.snapshots WHERE snapshot_time >= @start_time;

    DECLARE @interval_sec int;
    SET @interval_sec = DATEDIFF (s, @start_time, @end_time);

    DECLARE @sql_handle varbinary(64)
    SET @sql_handle = snapshots.fn_hexstrtovarbin (@sql_handle_str)

    SELECT 
        REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (
            LEFT (LTRIM (stmtsql.query_text), 100)
            , CHAR(9), ' '), CHAR(10), ' '), CHAR(13), ' '), '   ', ' '), '  ', ' '), '  ', ' ') AS flat_query_text, 
        t.*, 
        master.dbo.fn_varbintohexstr (t.sql_handle) AS sql_handle_str, 
        stmtsql.*
    FROM 
    (
        SELECT 
            stat.sql_handle, stat.statement_start_offset, stat.statement_end_offset, snap.source_id, 
            SUM (stat.snapshot_execution_count) AS execution_count, 
            SUM (stat.snapshot_execution_count) / (@interval_sec / 60) AS executions_per_min, 
            SUM (stat.snapshot_worker_time / 1000) AS total_cpu, 
            SUM (stat.snapshot_worker_time / 1000) / @interval_sec AS avg_cpu_per_sec, 
            SUM (stat.snapshot_worker_time / 1000.0) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_cpu_per_exec, 
            SUM (stat.snapshot_physical_reads) AS total_physical_reads, 
            SUM (stat.snapshot_physical_reads) / @interval_sec AS avg_physical_reads_per_sec, 
            SUM (stat.snapshot_physical_reads) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_physical_reads_per_exec, 
            SUM (stat.snapshot_logical_writes) AS total_logical_writes, 
            SUM (stat.snapshot_logical_writes) / @interval_sec AS avg_logical_writes_per_sec, 
            SUM (stat.snapshot_logical_writes) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_logical_writes_per_exec, 
            SUM (stat.snapshot_elapsed_time / 1000) AS total_elapsed_time, 
            SUM (stat.snapshot_elapsed_time / 1000) / @interval_sec AS avg_elapsed_time_per_sec, 
            SUM (stat.snapshot_elapsed_time / 1000.0) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_elapsed_time_per_exec, 
            COUNT(*) AS row_count, COUNT(DISTINCT plan_number) AS plan_count
        FROM
        (
            SELECT *, DENSE_RANK() OVER (ORDER BY plan_handle, creation_time) AS plan_number
            FROM snapshots.query_stats
        ) AS stat
        INNER JOIN core.snapshots snap ON stat.snapshot_id = snap.snapshot_id
        WHERE
            snap.instance_name = @instance_name 
            AND stat.sql_handle = @sql_handle 
            AND stat.statement_start_offset = @statement_start_offset 
            AND stat.statement_end_offset = @statement_end_offset
            AND snap.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
        GROUP BY stat.sql_handle, stat.statement_start_offset, stat.statement_end_offset, snap.source_id
    ) t
    LEFT OUTER JOIN snapshots.notable_query_text sql ON t.sql_handle = sql.sql_handle and sql.source_id = t.source_id
    OUTER APPLY snapshots.fn_get_query_text (t.source_id, t.sql_handle, t.statement_start_offset, t.statement_end_offset) AS stmtsql
    -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
END
GO

GO
--SqlScripter----[snapshots].[rpt_requests_and_compilations].sql
GO
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

GO
--SqlScripter----[snapshots].[rpt_sampled_waits].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_sampled_waits]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_sampled_waits] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_sampled_waits]
@ServerName sysname, 
    @EndTime datetime, 
    @WindowSize int, 
    @CategoryName nvarchar(20) = NULL, 
    @WaitType nvarchar(45) = NULL, 
    @ProgramName nvarchar(50) = NULL, 
    @SqlHandleStr varchar(130) = NULL, 
    @StatementStartOffset int = NULL, 
    @StatementEndOffset int = NULL, 
    @SessionID int = NULL, 
    @Database nvarchar(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @start_time_internal datetimeoffset(7);
    DECLARE @end_time_internal datetimeoffset(7);

    -- Clean string params (on drillthrough, RS may pass in an empty string instead of NULL)
    IF @CategoryName = '' SET @CategoryName = NULL
    IF @WaitType = '' SET @WaitType = NULL
    IF @ProgramName = '' SET @ProgramName = NULL
    IF @SqlHandleStr = '' SET @SqlHandleStr = NULL
    IF @Database = '' SET @Database = NULL
    -- -1 is a potentially valid offset, but anything less is invalid. RS can't represent NULL in some places, so 
    -- translate int values that are out of range to NULL. 
    IF @StatementStartOffset < -1 SET @StatementStartOffset = NULL
    IF @StatementEndOffset < -1 SET @StatementStartOffset = NULL
    IF @SessionID < -1 SET @SessionID = NULL

    -- NOTE: The logic below is duplicated in snapshots.rpt_sampled_waits_longest.  It cannot be moved to a shared 
    -- child proc because of SQL restrictions (no nested INSERT EXECs, and table params are read only).  
    -- Also update snapshots.rpt_sampled_waits_longest if a change to this section is required. 

    /*** BEGIN DUPLICATED CODE SECTION ***/
        -- Start time should be passed in as a UTC datetime
        IF (@EndTime IS NOT NULL)
        BEGIN
            -- Assumed time zone offset for this conversion is +00:00 (datetime must be passed in as UTC)
            SET @end_time_internal = CAST (@EndTime AS datetimeoffset(7));
        END
        ELSE BEGIN
            SELECT @end_time_internal = MAX(ar.collection_time)
            FROM core.snapshots AS s
            INNER JOIN snapshots.active_sessions_and_requests AS ar ON s.snapshot_id = ar.snapshot_id
            WHERE s.instance_name = @ServerName -- AND collection_set_uid = '49268954-4FD4-4EB6-AA04-CD59D9BB5714' -- Server Activity CS
        END
        SET @start_time_internal = DATEADD (minute, -1 * @WindowSize, @end_time_internal);

        DECLARE @sql_handle varbinary(64)
        IF LEN (@SqlHandleStr) > 0
        BEGIN
            SET @sql_handle = snapshots.fn_hexstrtovarbin (@SqlHandleStr)
        END
        
        -- Divide our time window up into 40 evenly-sized time intervals, and find the first and last collection_time within each of these intervals
        CREATE TABLE #intervals (
            interval_time_id        int, 
            interval_start_time     datetimeoffset(7),
            interval_end_time       datetimeoffset(7),
            interval_id             int, 
            first_collection_time   datetimeoffset(7), 
            last_collection_time    datetimeoffset(7), 
            first_snapshot_id       int,
            last_snapshot_id        int, 
            source_id               int, 
            snapshot_id             int, 
            collection_time         datetimeoffset(7), 
            collection_time_id      int
        )
        INSERT INTO #intervals
        EXEC [snapshots].[rpt_interval_collection_times] 
            @ServerName, @EndTime, @WindowSize, 'snapshots.active_sessions_and_requests', '2dc02bd6-e230-4c05-8516-4e8c0ef21f95', 40, 1

        SELECT 
            ti.interval_id, ti.interval_time_id, ti.interval_start_time, ti.interval_end_time, 
            ti.collection_time, ti.collection_time_id, r.row_id, 
            r.snapshot_id, r.session_id, r.request_id, r.exec_context_id, r.wait_duration_ms, r.wait_resource, 
            r.login_time, r.program_name, r.sql_handle, r.statement_start_offset, r.statement_end_offset, r.plan_handle, 
            r.database_name, r.task_state, ti.source_id, wt.ignore, 
            -- Model CPU as a "wait type" in the sampling results.  Any active request without a wait type is assumed to be CPU-bound. 
            CASE -- same expression here as in the GROUP BY
                WHEN r.wait_type = '' AND r.task_state IS NOT NULL THEN 'CPU'
                ELSE wt.category_name 
            END AS category_name, 
            -- "Running" tasks are actively using the CPU.  A "runnable" task is able to run, but is momentarily waiting for the active 
            -- task to yield so the next runnable task can get scheduled. Map runnable to the SOS_SCHEDULER_YIELD wait type.
            CASE 
                WHEN r.wait_type = '' AND r.task_state = 'RUNNING' THEN 'CPU (Consumed)'
                WHEN r.wait_type = '' AND r.task_state != 'RUNNING' THEN 'SOS_SCHEDULER_YIELD'
                ELSE r.wait_type
            END AS wait_type
        INTO #waiting_tasks
        FROM snapshots.active_sessions_and_requests AS r
        LEFT OUTER JOIN core.wait_types_categorized AS wt ON wt.wait_type = r.wait_type 
        INNER JOIN #intervals AS ti ON r.collection_time = ti.collection_time AND r.snapshot_id = ti.snapshot_id 
        WHERE r.collection_time BETWEEN @start_time_internal AND @end_time_internal 
            AND r.command != 'AWAITING COMMAND' AND r.request_id != -1 -- exclude idle spids (e.g. head blockers)
            AND (r.program_name = @ProgramName OR @ProgramName IS NULL)
            AND (r.sql_handle = @sql_handle OR @SqlHandleStr IS NULL)
            AND (r.database_name = @Database OR @Database IS NULL)
            AND (r.statement_start_offset = @StatementStartOffset OR @SqlHandleStr IS NULL)
            AND (r.statement_end_offset = @StatementEndOffset OR @SqlHandleStr IS NULL)
            AND (r.session_id = @SessionID OR @SessionID IS NULL)
            AND 
            ( -- ... and wait category either matches the user-specified parameter ...
                (@CategoryName = 
                    CASE -- same expression here as in the select column list
                        WHEN r.wait_type = '' AND r.task_state IS NOT NULL THEN 'CPU'
                        ELSE wt.category_name 
                    END
                ) 
                -- ... or a filter parameter for wait category was not provided (return all categories that aren't marked as ignorable). 
                OR (@CategoryName IS NULL AND ISNULL (wt.ignore, 0) = 0)
            )
            AND 
            ( -- ... and wait type either matches the user-specified parameter ...
                (@WaitType = 
                    CASE 
                        WHEN r.wait_type = '' AND r.task_state = 'RUNNING' THEN 'CPU (Consumed)'
                        WHEN r.wait_type = '' AND r.task_state != 'RUNNING' THEN 'SOS_SCHEDULER_YIELD'
                        ELSE r.wait_type
                    END 
                )
                -- ... or a filter parameter for wait category was not provided 
                OR @WaitType IS NULL
            )            
        -- Force a recompile of this statement to take into account the actual values of @start_time_internal and 
        -- @end_time_internal, which were not available at the time of proc compilation. 
        OPTION (RECOMPILE);
        
    /*** END DUPLICATED CODE SECTION ***/
    
    -- Get query text (do this here instead of in the following query so that we don't waste time retrieving the 
    -- same query's text more than once). 
    SELECT 
        r.sql_handle, r.statement_start_offset, r.statement_end_offset, 
        REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (
            LEFT (LTRIM (qt.query_text), 100)
            , CHAR(9), ' '), CHAR(10), ' '), CHAR(13), ' '), '   ', ' '), '  ', ' '), '  ', ' ') AS flat_query_text
    INTO #queries
    FROM 
    (
        SELECT DISTINCT source_id, sql_handle, statement_start_offset, statement_end_offset
        FROM #waiting_tasks
        WHERE category_name IS NOT NULL 
    ) AS r
    OUTER APPLY snapshots.fn_get_query_text(r.source_id, r.sql_handle, r.statement_start_offset, r.statement_end_offset) AS qt

    -- Within each time interval, group the wait counts by waittype, app, db, and query. 
    SELECT 
        CONVERT (datetime, SWITCHOFFSET (r.interval_start_time, '+00:00')) AS interval_start_time, 
        CONVERT (datetime, SWITCHOFFSET (r.interval_end_time, '+00:00')) AS interval_end_time, 
        r.interval_id, r.interval_time_id, 
        r.source_id, r.category_name, r.wait_type, r.[program_name], r.database_name, 
        COUNT (*) AS wait_count, r.sql_handle, r.statement_start_offset, r.statement_end_offset,
        master.dbo.fn_varbintohexstr (r.sql_handle) AS sql_handle_str, 
        q.flat_query_text
    FROM #waiting_tasks AS r 
    LEFT OUTER JOIN #queries AS q ON r.sql_handle = q.sql_handle AND r.statement_start_offset = q.statement_start_offset 
        AND r.statement_end_offset = q.statement_end_offset 
    WHERE r.category_name IS NOT NULL 
    GROUP BY r.interval_start_time, r.interval_end_time, r.interval_id, r.interval_time_id,
        r.category_name, r.wait_type, r.[program_name], r.database_name, r.[sql_handle], 
        r.source_id, r.statement_start_offset, r.statement_end_offset, q.flat_query_text
    ORDER BY r.category_name, r.interval_id, COUNT(*) DESC

END
GO

GO
--SqlScripter----[snapshots].[rpt_sampled_waits_hottest_resources].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_sampled_waits_hottest_resources]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_sampled_waits_hottest_resources] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_sampled_waits_hottest_resources]
@ServerName sysname, 
    @EndTime datetime, 
    @WindowSize int, 
    @CategoryName nvarchar(20) = NULL, 
    @WaitType nvarchar(45) = NULL, 
    @ProgramName nvarchar(50) = NULL, 
    @SqlHandleStr varchar(130) = NULL, 
    @StatementStartOffset int = NULL, 
    @StatementEndOffset int = NULL, 
    @SessionID int = NULL, 
    @Database nvarchar(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @start_time_internal datetimeoffset(7);
    DECLARE @end_time_internal datetimeoffset(7);

    -- Clean string params (on drillthrough, RS may pass in an empty string instead of NULL)
    IF @CategoryName = '' SET @CategoryName = NULL
    IF @WaitType = '' SET @WaitType = NULL
    IF @ProgramName = '' SET @ProgramName = NULL
    IF @SqlHandleStr = '' SET @SqlHandleStr = NULL
    IF @Database = '' SET @Database = NULL
    -- -1 is a potentially valid offset, but anything less is invalid. RS can't represent NULL in some places, so 
    -- translate int values that are out of range to NULL. 
    IF @StatementStartOffset < -1 SET @StatementStartOffset = NULL
    IF @StatementEndOffset < -1 SET @StatementStartOffset = NULL
    IF @SessionID < -1 SET @SessionID = NULL

    -- Start time should be passed in as a UTC datetime
    IF (@EndTime IS NOT NULL)
    BEGIN
        -- Assumed time zone offset for this conversion is +00:00 (datetime must be passed in as UTC)
        SET @end_time_internal = CAST (@EndTime AS datetimeoffset(7));
    END
    ELSE BEGIN
        SELECT @end_time_internal = MAX(ar.collection_time)
        FROM core.snapshots AS s
        INNER JOIN snapshots.active_sessions_and_requests AS ar ON s.snapshot_id = ar.snapshot_id
        WHERE s.instance_name = @ServerName -- AND collection_set_uid = '49268954-4FD4-4EB6-AA04-CD59D9BB5714' -- Server Activity CS
    END
    SET @start_time_internal = DATEADD (minute, -1 * @WindowSize, @end_time_internal);

    DECLARE @sql_handle varbinary(64)
    IF LEN (@SqlHandleStr) > 0
    BEGIN
        SET @sql_handle = snapshots.fn_hexstrtovarbin (@SqlHandleStr)
    END
    
    SELECT TOP 10 
        wt.category_name, r.wait_type, 
        CASE 
            WHEN LEN (ISNULL (r.wait_resource, '')) = 0 THEN 
                CASE 
                    WHEN LEN (r.resource_description) > 30 THEN LEFT (r.resource_description, 27) + '...'
                    ELSE LEFT (r.resource_description, 30)
                END
            ELSE r.wait_resource
        END AS wait_resource, 
        r.resource_description, 
        CONVERT (datetime, SWITCHOFFSET (MAX (r.collection_time), '+00:00')) AS example_collection_time, 
        CONVERT (varchar(30), CONVERT (datetime, SWITCHOFFSET (MAX (r.collection_time), '+00:00')), 126) AS example_collection_time_str, 
        COUNT(*) AS wait_count
    FROM snapshots.active_sessions_and_requests AS r 
    LEFT OUTER JOIN core.wait_types_categorized AS wt ON wt.wait_type = r.wait_type 
    WHERE r.collection_time BETWEEN @start_time_internal AND @end_time_internal 
        AND r.command != 'AWAITING COMMAND' AND r.request_id != -1 -- exclude idle spids (e.g. head blockers)
        AND (r.program_name = @ProgramName OR @ProgramName IS NULL)
        AND (r.sql_handle = @sql_handle OR @SqlHandleStr IS NULL)
        AND (r.database_name = @Database OR @Database IS NULL)
        AND (r.statement_start_offset = @StatementStartOffset OR @SqlHandleStr IS NULL)
        AND (r.statement_end_offset = @StatementEndOffset OR @SqlHandleStr IS NULL)
        AND (r.session_id = @SessionID OR @SessionID IS NULL)
        AND 
        ( -- ... and wait category either matches the user-specified parameter ...
            (@CategoryName = 
                CASE -- same expression here as in the select column list
                    WHEN r.wait_type = '' AND r.task_state IS NOT NULL THEN 'CPU'
                    ELSE wt.category_name 
                END
            ) 
            -- ... or a filter parameter for wait category was not provided (return all categories that aren't marked as ignorable). 
            OR (@CategoryName IS NULL AND ISNULL (wt.ignore, 0) = 0)
        )
        AND 
        ( -- ... and wait type either matches the user-specified parameter ...
            (@WaitType = 
                CASE 
                    WHEN r.wait_type = '' AND r.task_state = 'RUNNING' THEN 'CPU (Consumed)'
                    WHEN r.wait_type = '' AND r.task_state != 'RUNNING' THEN 'SOS_SCHEDULER_YIELD'
                    ELSE r.wait_type
                END 
            )
            -- ... or a filter parameter for wait category was not provided 
            OR @WaitType IS NULL
        )
        -- Exclude rows where there is no named resource
        AND (ISNULL (r.resource_description, '') != '' OR ISNULL (r.wait_resource, '') != '')
    GROUP BY wt.category_name, r.wait_type, r.wait_resource, r.resource_description
    ORDER BY COUNT(*) DESC
    -- Force a recompile of this statement to take into account the actual values of @start_time_internal and 
    -- @end_time_internal, which were not available at the time of proc compilation. 
    OPTION (RECOMPILE);
   
END
GO

GO
--SqlScripter----[snapshots].[rpt_sampled_waits_longest].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_sampled_waits_longest]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_sampled_waits_longest] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_sampled_waits_longest]
@ServerName sysname, 
    @EndTime datetime, 
    @WindowSize int, 
    @CategoryName nvarchar(20) = NULL, 
    @WaitType nvarchar(45) = NULL, 
    @ProgramName nvarchar(50) = NULL, 
    @SqlHandleStr varchar(130) = NULL, 
    @StatementStartOffset int = NULL, 
    @StatementEndOffset int = NULL, 
    @SessionID int = NULL, 
    @Database nvarchar(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @start_time_internal datetimeoffset(7);
    DECLARE @end_time_internal datetimeoffset(7);

    -- Clean string params (on drillthrough, RS may pass in an empty string instead of NULL)
    IF @CategoryName = '' SET @CategoryName = NULL
    IF @WaitType = '' SET @WaitType = NULL
    IF @ProgramName = '' SET @ProgramName = NULL
    IF @SqlHandleStr = '' SET @SqlHandleStr = NULL
    IF @Database = '' SET @Database = NULL
    -- -1 is a potentially valid offset, but anything less is invalid. RS can't represent NULL in some places, so 
    -- translate int values that are out of range to NULL. 
    IF @StatementStartOffset < -1 SET @StatementStartOffset = NULL
    IF @StatementEndOffset < -1 SET @StatementStartOffset = NULL
    IF @SessionID < -1 SET @SessionID = NULL

    -- NOTE: The logic below is duplicated in snapshots.rpt_sampled_waits.  It cannot be moved to a shared 
    -- child proc because of SQL restrictions (no nested INSERT EXECs, and table params are read only).  
    -- Also update snapshots.rpt_sampled_waits if a change to this section is required. 

    /*** BEGIN DUPLICATED CODE SECTION ***/
        -- Start time should be passed in as a UTC datetime
        IF (@EndTime IS NOT NULL)
        BEGIN
            -- Assumed time zone offset for this conversion is +00:00 (datetime must be passed in as UTC)
            SET @end_time_internal = CAST (@EndTime AS datetimeoffset(7));
        END
        ELSE BEGIN
            SELECT @end_time_internal = MAX(ar.collection_time)
            FROM core.snapshots AS s
            INNER JOIN snapshots.active_sessions_and_requests AS ar ON s.snapshot_id = ar.snapshot_id
            WHERE s.instance_name = @ServerName -- AND collection_set_uid = '49268954-4FD4-4EB6-AA04-CD59D9BB5714' -- Server Activity CS
        END
        SET @start_time_internal = DATEADD (minute, -1 * @WindowSize, @end_time_internal);

        DECLARE @sql_handle varbinary(64)
        IF LEN (@SqlHandleStr) > 0
        BEGIN
            SET @sql_handle = snapshots.fn_hexstrtovarbin (@SqlHandleStr)
        END
        
        -- Divide our time window up into 40 evenly-sized time intervals, and find the first and last collection_time within each of these intervals
        CREATE TABLE #intervals (
            interval_time_id        int, 
            interval_start_time     datetimeoffset(7),
            interval_end_time       datetimeoffset(7),
            interval_id             int, 
            first_collection_time   datetimeoffset(7), 
            last_collection_time    datetimeoffset(7), 
            first_snapshot_id       int,
            last_snapshot_id        int, 
            source_id               int, 
            snapshot_id             int, 
            collection_time         datetimeoffset(7), 
            collection_time_id      int
        )
        INSERT INTO #intervals
        EXEC [snapshots].[rpt_interval_collection_times] 
            @ServerName, @EndTime, @WindowSize, 'snapshots.active_sessions_and_requests', '2dc02bd6-e230-4c05-8516-4e8c0ef21f95', 40, 1

        SELECT 
            ti.interval_id, ti.interval_time_id, ti.interval_start_time, ti.interval_end_time, 
            ti.collection_time, ti.collection_time_id, r.row_id, 
            r.snapshot_id, r.session_id, r.request_id, r.exec_context_id, r.wait_duration_ms, r.wait_resource, 
            r.login_time, r.program_name, r.sql_handle, r.statement_start_offset, r.statement_end_offset, r.plan_handle, 
            r.database_name, r.task_state, ti.source_id, wt.ignore, 
            -- Model CPU as a "wait type" in the sampling results.  Any active request without a wait type is assumed to be CPU-bound. 
            CASE -- same expression here as in the GROUP BY
                WHEN r.wait_type = '' AND r.task_state IS NOT NULL THEN 'CPU'
                ELSE wt.category_name 
            END AS category_name, 
            -- "Running" tasks are actively using the CPU.  A "runnable" task is able to run, but is momentarily waiting for the active 
            -- task to yield so the next runnable task can get scheduled. Map runnable to the SOS_SCHEDULER_YIELD wait type.
            CASE 
                WHEN r.wait_type = '' AND r.task_state = 'RUNNING' THEN 'CPU (Consumed)'
                WHEN r.wait_type = '' AND r.task_state != 'RUNNING' THEN 'SOS_SCHEDULER_YIELD'
                ELSE r.wait_type
            END AS wait_type
        INTO #waiting_tasks
        FROM snapshots.active_sessions_and_requests AS r
        LEFT OUTER JOIN core.wait_types_categorized AS wt ON wt.wait_type = r.wait_type 
        INNER JOIN #intervals AS ti ON r.collection_time = ti.collection_time AND r.snapshot_id = ti.snapshot_id 
        WHERE r.collection_time BETWEEN @start_time_internal AND @end_time_internal 
            AND r.command != 'AWAITING COMMAND' AND r.request_id != -1 -- exclude idle spids (e.g. head blockers)
            AND (r.program_name = @ProgramName OR @ProgramName IS NULL)
            AND (r.sql_handle = @sql_handle OR @SqlHandleStr IS NULL)
            AND (r.database_name = @Database OR @Database IS NULL)
            AND (r.statement_start_offset = @StatementStartOffset OR @SqlHandleStr IS NULL)
            AND (r.statement_end_offset = @StatementEndOffset OR @SqlHandleStr IS NULL)
            AND (r.session_id = @SessionID OR @SessionID IS NULL)
            AND 
            ( -- ... and wait category either matches the user-specified parameter ...
                (@CategoryName = 
                    CASE -- same expression here as in the select column list
                        WHEN r.wait_type = '' AND r.task_state IS NOT NULL THEN 'CPU'
                        ELSE wt.category_name 
                    END
                ) 
                -- ... or a filter parameter for wait category was not provided (return all categories that aren't marked as ignorable). 
                OR (@CategoryName IS NULL AND ISNULL (wt.ignore, 0) = 0)
            )
            AND 
            ( -- ... and wait type either matches the user-specified parameter ...
                (@WaitType = 
                    CASE 
                        WHEN r.wait_type = '' AND r.task_state = 'RUNNING' THEN 'CPU (Consumed)'
                        WHEN r.wait_type = '' AND r.task_state != 'RUNNING' THEN 'SOS_SCHEDULER_YIELD'
                        ELSE r.wait_type
                    END 
                )
                -- ... or a filter parameter for wait category was not provided 
                OR @WaitType IS NULL
            )
        -- Force a recompile of this statement to take into account the actual values of @start_time_internal and 
        -- @end_time_internal, which were not available at the time of proc compilation. 
        OPTION (RECOMPILE);
        
    /*** END DUPLICATED CODE SECTION ***/

    CREATE INDEX idx1 ON #waiting_tasks (collection_time_id, session_id)

    -- The same long-lived wait may be captured multiple times.  For a given wait, we only care about the max 
    -- wait time within the target time window. If we see that the immediately following sample shows the same 
    -- spid waiting with a wait time that spans both samples, we discard the preceding sample and keep only 
    -- the max wait time.  For example, in the data below, spid 54 was stuck in the same long-lived lock wait 
    -- from row 1 through row 3.  From this data, we would only keep rows #3 and #4. Rows #1 and #2 are 
    -- discarded to avoid reporting the same long wait several times. 
    -- 
    --     (row#)   collection_time     session_id  wait_type    wait_duration_ms  
    --              ------------------- ----------- ------------ -----------------
    --       1      2007-10-25 13:01:00          53 LCK_M_S                   8141
    --       2      2007-10-25 13:01:10          53 LCK_M_S                  18278
    --       3      2007-10-25 13:01:20          53 LCK_M_S                  28318
    --       4      2007-10-25 13:01:30          54 LCK_M_X                    755
    --
    -- Also, if there was one collection time where everyone was blocked momentarily, we want to avoid 
    -- reporting that collection time over and over w/only the spid # varying; that's not the most interesting 
    -- sampling.  Instead, report the longest wait in each of the top 10 collection times (top 10 times by max 
    -- wait duration at the collection time).  
    SELECT TOP 10
        CONVERT (datetime, SWITCHOFFSET (r1.collection_time, '+00:00')) AS collection_time, 
        CONVERT (varchar(30), CONVERT (datetime, SWITCHOFFSET (r1.collection_time, '+00:00')), 126) AS collection_time_str, 
        r1.snapshot_id, r1.row_id, 
        r1.session_id, r1.request_id, r1.exec_context_id, r1.wait_resource, 
        r1.source_id, r1.category_name, r1.wait_type, r1.wait_duration_ms, 
        r1.database_name, r1.[program_name], r1.[sql_handle], r1.statement_start_offset, r1.statement_end_offset, r1.plan_handle
    FROM #waiting_tasks AS r1
    -- Find the same spid in the next collection time
    LEFT OUTER JOIN #waiting_tasks AS r2 
        ON r2.collection_time_id = r1.collection_time_id + 1 AND r2.session_id = r1.session_id 
            AND r2.request_id = r1.request_id AND r2.exec_context_id = r1.exec_context_id AND r2.login_time = r1.login_time 
    WHERE 
        -- Prevent reporting the same wait spanning multiple collection times. 
        (   
            -- ... where the spid wasn't seen waiting at the next collection time
            r2.session_id IS NULL 
            -- ... or the wait at the next collection time is shorter than it would have been if the wait had spanned both collection times 
            OR r2.wait_duration_ms < (DATEDIFF (second, r1.collection_time, r2.collection_time) * 1000)
        )
        -- Exclude all but the longest wait in any given collection time
        AND NOT EXISTS 
        (
            SELECT * FROM #waiting_tasks AS r3
            WHERE r3.collection_time_id = r1.collection_time_id 
                AND r3.wait_duration_ms > r1.wait_duration_ms 
                OR (r3.wait_duration_ms = r1.wait_duration_ms AND r3.row_id > r1.row_id)
        )
    ORDER BY r1.wait_duration_ms DESC
   
END
GO

GO
--SqlScripter----[snapshots].[rpt_server_activity].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_server_activity]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_server_activity] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_server_activity]
@instance_name sysname,
    @start_time datetime = NULL,
    @end_time datetime = NULL,
    @time_window_size smallint = NULL,
    @time_interval_min smallint = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Convert snapshot_time (datetimeoffset) to a UTC datetime
    IF (@end_time IS NULL)
        SET @end_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MAX(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));

    IF (@start_time IS NULL)
    BEGIN
        -- If time_window_size and time_interval_min are set use them
        -- to determine the start time
        -- Otherwise use the earliest available snapshot_time
        IF @time_window_size IS NOT NULL AND @time_interval_min IS NOT NULL
        BEGIN
            SET @start_time = DATEADD(minute, @time_window_size * @time_interval_min * -1.0, @end_time);
        END
        ELSE
        BEGIN
            -- Convert min snapshot_time (datetimeoffset) to a UTC datetime
            SET @start_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MIN(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));
        END
    END

    DECLARE @end_snapshot_time_id int;
    SELECT @end_snapshot_time_id = MAX(snapshot_time_id) FROM core.snapshots WHERE snapshot_time <= @end_time;

    DECLARE @start_snapshot_time_id int;
    SELECT @start_snapshot_time_id = MIN(snapshot_time_id) FROM core.snapshots WHERE snapshot_time >= @start_time;


    SELECT 
        SUBSTRING(pc.path, CHARINDEX(N'\', pc.path, 2)+1, LEN(pc.path) - CHARINDEX(N'\', pc.path, 2)) as series,
        s.snapshot_time_id,
        CONVERT (datetime, SWITCHOFFSET (CAST (s.snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (pc.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        pc.formatted_value
    FROM snapshots.performance_counters pc
    JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
        AND (pc.performance_object_name LIKE '%SQL%:General Statistics' OR pc.performance_object_name LIKE '%SQL%:SQL Statistics')
        AND pc.performance_counter_name IN ('Logins/sec', 'Logouts/sec', 'Batch Requests/sec', 'Transactions', 
            'User Connections', 'SQL Compilations/sec', 'SQL Re-Compilations/sec')
    ORDER BY 
        pc.collection_time, series
    -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
END;
GO

GO
--SqlScripter----[snapshots].[rpt_sessions_and_connections].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_sessions_and_connections]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_sessions_and_connections] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_sessions_and_connections]
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
        AND (pc.performance_object_name LIKE '%SQL%:General Statistics' OR pc.performance_object_name LIKE '%SQL%:Databases')
        AND pc.performance_counter_name IN ('User Connections', 'Active Transactions')

    UNION ALL 

    SELECT 
        N'Active sessions' AS series,
        ar.collection_time,
        COUNT(DISTINCT ar.session_id) AS formatted_value
    FROM snapshots.active_sessions_and_requests ar
    INNER JOIN core.snapshots s ON (s.snapshot_id = ar.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id = @snapshot_time_id
    GROUP BY ar.collection_time    

    ORDER BY collection_time
END;
GO

GO
--SqlScripter----[snapshots].[rpt_snapshot_times].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_snapshot_times]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_snapshot_times] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_snapshot_times]
@ServerName sysname, 
    @EndTime datetime, 
    @WindowSize int, 
    @CollectionSetUid uniqueidentifier
AS
BEGIN
    DECLARE @end_time_internal datetimeoffset(7)
    SET @end_time_internal = TODATETIMEOFFSET (@EndTime, '+00:00')

    -- Get the time of the earliest and latest snapshots for this collection set
    DECLARE @min_snapshot_time datetimeoffset(7)
    DECLARE @max_snapshot_time datetimeoffset(7)
    DECLARE @total_data_collection_window int
    SELECT @min_snapshot_time = MIN (snapshot_time), @max_snapshot_time = MAX (snapshot_time)
    FROM core.snapshots 
    WHERE instance_name = @ServerName
        AND collection_set_uid = @CollectionSetUid
    IF @min_snapshot_time IS NULL SET @min_snapshot_time = SYSDATETIMEOFFSET()
    IF @max_snapshot_time IS NULL SET @max_snapshot_time = SYSDATETIMEOFFSET()
    SET @total_data_collection_window = DATEDIFF (minute, @min_snapshot_time, @max_snapshot_time)

    -- First return all snapshot_time values for this collection set
    SELECT DISTINCT 
        CONVERT (datetime, SWITCHOFFSET (CAST (snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time,
        1 AS value, 
        'AllSnapshotTimes' AS series_name
    FROM core.snapshots
    WHERE instance_name = @ServerName
        AND collection_set_uid = @CollectionSetUid
    UNION ALL
     
    -- Then return the snapshot_time values that are in the selected time window, with a different series label. 
    SELECT DISTINCT 
        CONVERT (datetime, SWITCHOFFSET (CAST (snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time,
        0.8 AS value, 
        'SelectedSnapshotTimes' AS series_name
    FROM core.snapshots
    WHERE instance_name = @ServerName
        AND collection_set_uid = @CollectionSetUid
        AND snapshot_time BETWEEN DATEADD (minute, -1 * @WindowSize, @end_time_internal) AND @end_time_internal 
    UNION ALL 
    SELECT DISTINCT 
        DATEADD (millisecond, 10, CONVERT (datetime, SWITCHOFFSET (CAST (snapshot_time AS datetimeoffset(7)), '+00:00'))) AS snapshot_time,
        1.2 AS value, 
        'SelectedSnapshotTimes' AS series_name
    FROM core.snapshots
    WHERE instance_name = @ServerName
        AND collection_set_uid = @CollectionSetUid
        AND snapshot_time BETWEEN DATEADD (minute, -1 * @WindowSize, @end_time_internal) AND @end_time_internal 

    -- Return a "fake" data point (will not be plotted) so that the timeline always extends to the current time
    UNION ALL 
        SELECT GETUTCDATE() AS snapshot_time,
        -1 AS value, 
        'Formatting' AS in_selected_time_window

    -- Order is important here since points are plotted in the order in which they are returned from the query. 
    -- The "SelectedSnapshotTimes" series must be drawn on top of the "AllSnapshotTimes" series, so we return it 
    -- last. 
    ORDER BY series_name ASC, snapshot_time
END
GO

GO
--SqlScripter----[snapshots].[rpt_sql_memory_clerks].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_sql_memory_clerks]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_sql_memory_clerks] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_sql_memory_clerks]
@ServerName sysname,
    @EndTime datetime = NULL,
    @WindowSize smallint = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Divide our time window up into 40 evenly-sized time intervals, and find the last collection_time within each of these intervals
    CREATE TABLE #intervals (
        interval_time_id        int, 
        interval_start_time     datetimeoffset(7),
        interval_end_time       datetimeoffset(7),
        interval_id             int, 
        first_collection_time   datetimeoffset(7), 
        last_collection_time    datetimeoffset(7), 
        first_snapshot_id       int,
        last_snapshot_id        int, 
        source_id               int, 
        snapshot_id             int, 
        collection_time         datetimeoffset(7), 
        collection_time_id      int
    )
    -- GUID 49268954-... is the Server Activity CS
    INSERT INTO #intervals
    EXEC [snapshots].[rpt_interval_collection_times] 
        @ServerName, @EndTime, @WindowSize, 'snapshots.os_memory_clerks', '49268954-4FD4-4EB6-AA04-CD59D9BB5714', 40, 0
    
    -- Get memory clerk stats for these collection times
    SELECT 
        coll.interval_time_id, 
        -- Convert datetimeoffsets to UTC datetimes
        CONVERT (datetime, SWITCHOFFSET (coll.interval_start_time, '+00:00')) AS interval_start_time, 
        CONVERT (datetime, SWITCHOFFSET (coll.interval_end_time,  '+00:00')) AS interval_end_time, 
        coll.interval_id, 
        CONVERT (datetime, SWITCHOFFSET (coll.first_collection_time, '+00:00')) AS first_collection_time, 
        CONVERT (datetime, SWITCHOFFSET (coll.last_collection_time, '+00:00')) AS last_collection_time, 
        coll.first_snapshot_id, coll.last_snapshot_id, 
        mc.[type], mc.memory_node_id, mc.single_pages_kb, mc.multi_pages_kb, mc.virtual_memory_reserved_kb, 
        mc.virtual_memory_committed_kb, mc.awe_allocated_kb, mc.shared_memory_reserved_kb, mc.shared_memory_committed_kb, 
        CONVERT (datetime, SWITCHOFFSET (mc.collection_time, '+00:00')) AS collection_time, 
        CAST (mc.single_pages_kb AS bigint) 
            + mc.multi_pages_kb 
            + (CASE WHEN type <> 'MEMORYCLERK_SQLBUFFERPOOL' THEN mc.virtual_memory_committed_kb ELSE 0 END) 
            + mc.shared_memory_committed_kb AS total_kb
    INTO #memory_clerks
    FROM snapshots.os_memory_clerks AS mc
    INNER JOIN #intervals AS coll ON coll.last_snapshot_id = mc.snapshot_id AND coll.last_collection_time = mc.collection_time 

    -- Return memory stats to the caller
    SELECT 
        mc.*, 
        mc.single_pages_kb + mc.multi_pages_kb as allocated_kb,
        ta.total_kb_all_clerks, 
        mc.total_kb / CONVERT(decimal, ta.total_kb_all_clerks) AS percent_total_kb,
        -- There are many memory clerks. We'll chart any that make up 5% of SQL memory or more; less significant clerks will be lumped into an "Other" bucket
        CASE
            WHEN mc.total_kb / CONVERT(decimal, ta.total_kb_all_clerks) > 0.05 THEN mc.[type]
            ELSE N'Other'
        END AS graph_type
    FROM #memory_clerks AS mc
    -- Use a self-join to calculate the total memory allocated for each time interval
    JOIN 
    (
        SELECT 
            mc_ta.collection_time, 
            SUM (mc_ta.total_kb) AS total_kb_all_clerks
        FROM #memory_clerks AS mc_ta
        GROUP BY mc_ta.collection_time
    ) AS ta ON (mc.collection_time = ta.collection_time)
    ORDER BY collection_time
END;
GO

GO
--SqlScripter----[snapshots].[rpt_sql_memory_clerks_one_snapshot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_sql_memory_clerks_one_snapshot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_sql_memory_clerks_one_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_sql_memory_clerks_one_snapshot]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @total_allocated TABLE (
        collection_time datetimeoffset(7),
        total_kb bigint
    );

    INSERT INTO @total_allocated 
    SELECT 
        mc.collection_time,
        SUM(mc.single_pages_kb + 
            mc.multi_pages_kb + 
            (CASE WHEN type <> N'MEMORYCLERK_SQLBUFFERPOOL' THEN mc.virtual_memory_committed_kb 
            ELSE 0 END) + 
            mc.shared_memory_committed_kb)
    FROM snapshots.os_memory_clerks mc
    JOIN core.snapshots s ON (s.snapshot_id = mc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id = @snapshot_time_id
    GROUP BY mc.collection_time

    SELECT 
        CONVERT (datetime, SWITCHOFFSET (CAST (mc.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        mc.type,
        mc.single_pages_kb + mc.multi_pages_kb as allocated_kb,
        mc.virtual_memory_reserved_kb as virtual_reserved_kb,
        mc.virtual_memory_committed_kb as virtual_committed_kb,
        mc.awe_allocated_kb as awe_allocated_kb,
        mc.shared_memory_reserved_kb as shared_reserved_kb,
        mc.shared_memory_committed_kb as shared_committed_kb,
        (mc.single_pages_kb + mc.multi_pages_kb + (CASE WHEN type <> 'MEMORYCLERK_SQLBUFFERPOOL' THEN mc.virtual_memory_committed_kb ELSE 0 END) + mc.shared_memory_committed_kb) as total_kb,
        (mc.single_pages_kb + mc.multi_pages_kb + (CASE WHEN type <> 'MEMORYCLERK_SQLBUFFERPOOL' THEN mc.virtual_memory_committed_kb ELSE 0 END) + mc.shared_memory_committed_kb) / CONVERT(decimal, ta.total_kb) AS percent_total_kb,
        CASE
            WHEN (mc.single_pages_kb + mc.multi_pages_kb + (CASE WHEN type <> 'MEMORYCLERK_SQLBUFFERPOOL' THEN mc.virtual_memory_committed_kb ELSE 0 END) + mc.shared_memory_committed_kb) / CONVERT(decimal, ta.total_kb) > 0.05 THEN mc.type
            ELSE N'Other'
        END AS graph_type
    FROM snapshots.os_memory_clerks mc
    JOIN @total_allocated ta ON (mc.collection_time = ta.collection_time)
    ORDER BY collection_time
    
END;
GO

GO
--SqlScripter----[snapshots].[rpt_sql_memory_counters_one_snapshot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_sql_memory_counters_one_snapshot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_sql_memory_counters_one_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_sql_memory_counters_one_snapshot]
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
        AND pc.performance_object_name LIKE '%SQL%:Buffer Manager'
        AND pc.performance_counter_name = 'Page life expectancy'
    ORDER BY 
        pc.collection_time, pc.performance_counter_name
END;
GO

GO
--SqlScripter----[snapshots].[rpt_sql_process_and_system_memory].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_sql_process_and_system_memory]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_sql_process_and_system_memory] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_sql_process_and_system_memory]
@ServerName sysname,
    @EndTime datetime = NULL,
    @WindowSize int
AS
BEGIN
    SET NOCOUNT ON;

    -- Divide our time window up into 40 evenly-sized time intervals, and find the last collection_time within each of these intervals
    CREATE TABLE #intervals (
        interval_time_id        int, 
        interval_start_time     datetimeoffset(7),
        interval_end_time       datetimeoffset(7),
        interval_id             int, 
        first_collection_time   datetimeoffset(7), 
        last_collection_time    datetimeoffset(7), 
        first_snapshot_id       int,
        last_snapshot_id        int, 
        source_id               int,
        snapshot_id             int, 
        collection_time         datetimeoffset(7), 
        collection_time_id      int
    )
    -- GUID 49268954-... is Server Activity
    INSERT INTO #intervals
    EXEC [snapshots].[rpt_interval_collection_times] 
        @ServerName, @EndTime, @WindowSize, 'snapshots.sql_process_and_system_memory', '49268954-4FD4-4EB6-AA04-CD59D9BB5714', 40, 0

    -- Get the earliest and latest snapshot_id values that contain data for the selected time interval. 
    -- This will allow a more efficient query plan. 
    DECLARE @start_snapshot_id int;
    DECLARE @end_snapshot_id int;
    SELECT @start_snapshot_id = MIN (first_snapshot_id)
    FROM #intervals
    SELECT @end_snapshot_id = MAX (last_snapshot_id)
    FROM #intervals
    
    -- Get sys.dm_os_process_memory for these intervals
    SELECT 
        coll.interval_time_id, coll.interval_id, 
        CONVERT (datetime, SWITCHOFFSET (CAST (coll.last_collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (coll.interval_start_time AS datetimeoffset(7)), '+00:00')) AS interval_start_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (coll.interval_end_time AS datetimeoffset(7)), '+00:00')) AS interval_end_time, 
        coll.last_snapshot_id, 
        AVG (sql_physical_memory_in_use_kb)             AS avg_sql_physical_memory_in_use_kb, 
        MAX (sql_physical_memory_in_use_kb)             AS max_sql_physical_memory_in_use_kb, 
        MIN (sql_physical_memory_in_use_kb)             AS min_sql_physical_memory_in_use_kb, 
        AVG (sql_total_virtual_address_space_kb)        AS avg_sql_total_virtual_address_space_kb, 
        AVG (sql_virtual_address_space_reserved_kb)     AS avg_sql_virtual_address_space_reserved_kb, 
        AVG (sql_virtual_address_space_committed_kb)    AS avg_sql_virtual_address_space_committed_kb, 
        AVG (sql_virtual_address_space_available_kb)    AS avg_sql_virtual_address_space_available_kb, 
        MAX (sql_virtual_address_space_available_kb)    AS max_sql_virtual_address_space_available_kb, 
        MIN (sql_virtual_address_space_available_kb)    AS min_sql_virtual_address_space_available_kb, 
        AVG (sql_memory_utilization_percentage)         AS avg_sql_memory_utilization_percentage, 
        MIN (sql_memory_utilization_percentage)         AS min_sql_memory_utilization_percentage, 
        AVG (sql_available_commit_limit_kb)             AS avg_sql_available_commit_limit_kb, 
        MIN (sql_available_commit_limit_kb)             AS min_sql_available_commit_limit_kb, 
        AVG (sql_large_page_allocations_kb)             AS avg_sql_large_page_allocations_kb, 
        AVG (sql_locked_page_allocations_kb)            AS avg_sql_locked_page_allocations_kb, 
        SUM (CAST (sql_process_physical_memory_low AS int)) AS sql_process_physical_memory_low_count, 
        SUM (CAST (sql_process_virtual_memory_low AS int))  AS sql_process_virtual_memory_low_count, 
        MAX (sql_page_fault_count) - MIN (sql_page_fault_count) AS interval_sql_page_fault_count, 
        AVG (system_total_physical_memory_kb)           AS system_total_physical_memory_kb, 
        AVG (system_available_physical_memory_kb)       AS avg_system_available_physical_memory_kb, 
        MAX (system_available_physical_memory_kb)       AS max_system_available_physical_memory_kb, 
        MIN (system_available_physical_memory_kb)       AS min_system_available_physical_memory_kb, 
        AVG (system_total_page_file_kb)                 AS avg_system_total_page_file_kb, 
        AVG (system_available_page_file_kb)             AS avg_system_available_page_file_kb, 
        MIN (system_available_page_file_kb)             AS min_system_available_page_file_kb, 
        AVG (system_cache_kb)                           AS avg_system_cache_kb, 
        AVG (system_kernel_paged_pool_kb)               AS avg_system_kernel_paged_pool_kb, 
        AVG (system_kernel_nonpaged_pool_kb)            AS avg_system_kernel_nonpaged_pool_kb, 
        SUM (CAST (system_high_memory_signal_state AS int)) AS system_high_memory_signal_state_count, 
        SUM (CAST (system_low_memory_signal_state AS int))  AS system_low_memory_signal_state_count, 
        AVG (bpool_commit_target)                       AS avg_bpool_commit_target, 
        MAX (bpool_commit_target)                       AS max_bpool_commit_target,  
        MIN (bpool_commit_target)                       AS min_bpool_commit_target, 
        AVG (bpool_committed)                           AS avg_bpool_committed, 
        MAX (bpool_committed)                           AS max_bpool_committed,  
        MIN (bpool_committed)                           AS min_bpool_committed, 
        AVG (bpool_visible)                             AS avg_bpool_visible, 
        MAX (bpool_visible)                             AS max_bpool_visible,  
        MIN (bpool_visible)                             AS min_bpool_visible 
    FROM snapshots.sql_process_and_system_memory AS pm
    INNER JOIN #intervals AS coll ON coll.last_snapshot_id = pm.snapshot_id AND coll.last_collection_time = pm.collection_time     
    GROUP BY 
        coll.interval_start_time, coll.interval_end_time, coll.interval_time_id, coll.last_collection_time, coll.interval_id, coll.last_snapshot_id
    ORDER BY coll.last_collection_time ASC;
END
GO

GO
--SqlScripter----[snapshots].[rpt_sql_process_memory].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_sql_process_memory]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_sql_process_memory] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_sql_process_memory]
@ServerName sysname,
    @EndTime datetime = NULL,
    @WindowSize int
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Divide our time window up into 40 evenly-sized time intervals, and find the last collection_time within each of these intervals
    CREATE TABLE #intervals (
        interval_time_id        int, 
        interval_start_time     datetimeoffset(7),
        interval_end_time       datetimeoffset(7),
        interval_id             int, 
        first_collection_time   datetimeoffset(7), 
        last_collection_time    datetimeoffset(7), 
        first_snapshot_id       int,
        last_snapshot_id        int, 
        source_id               int, 
        snapshot_id             int, 
        collection_time         datetimeoffset(7), 
        collection_time_id      int
    )
    -- GUID 49268954-... is the Server Activity CS
    INSERT INTO #intervals
    EXEC [snapshots].[rpt_interval_collection_times] 
        @ServerName, @EndTime, @WindowSize, 'snapshots.sql_process_and_system_memory', '49268954-4FD4-4EB6-AA04-CD59D9BB5714', 40, 0

    SELECT 
        CONVERT (datetime, SWITCHOFFSET (CAST (collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        CASE 
            WHEN series = 'sql_virtual_address_space_reserved_kb' THEN 'Virtual Memory Reserved'
            WHEN series = 'sql_virtual_address_space_committed_kb' THEN 'Virtual Memory Committed'
            WHEN series = 'sql_physical_memory_in_use_kb' THEN 'Physical Memory In Use'
            WHEN series = 'process_physical_memory_low' THEN 'Physical Memory Low'
            WHEN series = 'process_virtual_memory_low' THEN 'Virtual Memory Low'
            ELSE series
        END AS series,
        [value] / 1024 AS [value] -- convert KB to MB
    FROM 
    (
        SELECT 
            pm.collection_time,
            pm.sql_virtual_address_space_reserved_kb,
            pm.sql_virtual_address_space_committed_kb,
            pm.sql_physical_memory_in_use_kb,
            CONVERT (bigint, pm.process_physical_memory_low) AS process_physical_memory_low,
            CONVERT (bigint, pm.process_virtual_memory_low) AS process_virtual_memory_low
        FROM [snapshots].[sql_process_and_system_memory] AS pm
        INNER JOIN #intervals AS i ON (i.last_snapshot_id = pm.snapshot_id AND i.last_collection_time = pm.collection_time)
    ) AS pvt
    UNPIVOT
    (
        [value] for [series] in 
            (sql_virtual_address_space_reserved_kb, sql_virtual_address_space_committed_kb, 
            sql_physical_memory_in_use_kb)
    ) AS unpvt
END
GO

GO
--SqlScripter----[snapshots].[rpt_sql_process_memory_one_snapshot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_sql_process_memory_one_snapshot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_sql_process_memory_one_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_sql_process_memory_one_snapshot]
@instance_name sysname,
    @snapshot_time_id int
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CONVERT (datetime, SWITCHOFFSET (CAST (collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        CASE 
            WHEN series = 'virtual_address_space_reserved_kb' THEN 'Virtual Memory Reserved'
            WHEN series = 'virtual_address_space_committed_kb' THEN 'Virtual Memory Committed'
            WHEN series = 'physical_memory_in_use_kb' THEN 'Physical Memory In Use'
            WHEN series = 'process_physical_memory_low' THEN 'Physical Memory Low'
            WHEN series = 'process_virtual_memory_low' THEN 'Virtual Memory Low'
            ELSE series
        END AS series,
        [value] / 1024 AS [value] -- convert KB to MB
    FROM 
    (
        SELECT 
            pm.collection_time,
            pm.virtual_address_space_reserved_kb,
            pm.virtual_address_space_committed_kb,
            pm.physical_memory_in_use_kb,
            CONVERT (bigint, pm.process_physical_memory_low) AS process_physical_memory_low,
            CONVERT (bigint, pm.process_virtual_memory_low) AS process_virtual_memory_low
        FROM [snapshots].[os_process_memory] pm
        JOIN core.snapshots s ON (s.snapshot_id = pm.snapshot_id)
        WHERE s.instance_name = @instance_name
            AND s.snapshot_time_id = @snapshot_time_id
    ) AS pvt
    UNPIVOT
    (
        [value] for [series] in 
            (virtual_address_space_reserved_kb, virtual_address_space_committed_kb, 
            physical_memory_in_use_kb)
    ) AS unpvt
    UNION ALL 
    SELECT 
        CONVERT (datetime, SWITCHOFFSET (CAST (collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        'Stolen Buffer Pool' AS [series], 
        pc.formatted_value * 8 AS [value] -- Convert from pages to KB
    FROM snapshots.performance_counters AS pc
    INNER JOIN core.snapshots s ON (s.snapshot_id = pc.snapshot_id)
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id = @snapshot_time_id
        AND pc.performance_object_name LIKE '%SQL%:Buffer Manager'
        AND pc.performance_counter_name = 'Stolen pages'
    ORDER BY collection_time
END
GO

GO
--SqlScripter----[snapshots].[rpt_tempdb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_tempdb]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_tempdb] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_tempdb]
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
        AND (pc.performance_object_name LIKE '%SQL%:Transactions' OR pc.performance_object_name LIKE '%SQL%:General Statistics')
        AND pc.performance_counter_name IN ('Free Space in tempdb (KB)', 'Active Temp Tables')
    ORDER BY pc.collection_time, pc.performance_counter_name
END;
GO

GO
--SqlScripter----[snapshots].[rpt_top_query_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_top_query_stats]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_top_query_stats] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_top_query_stats]
@instance_name sysname,
    @start_time datetime = NULL,
    @end_time datetime = NULL,
    @time_window_size smallint = NULL,
    @time_interval_min smallint = 1, 
    @order_by_criteria varchar(30) = 'CPU', 
    @database_name nvarchar(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Clean string params (on drillthrough, RS may pass in an empty string instead of NULL)
    IF @database_name = '' SET @database_name = NULL

    -- @end_time should never be NULL when we are called from the Query Stats report
    -- Convert snapshot_time (datetimeoffset) to a UTC datetime
    IF (@end_time IS NULL)
        SET @end_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MAX(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));

    IF (@start_time IS NULL)
    BEGIN
        -- If time_window_size and time_interval_min are set use them
        -- to determine the start time
        -- Otherwise use the earliest available snapshot_time
        IF @time_window_size IS NOT NULL AND @time_interval_min IS NOT NULL
        BEGIN
            SET @start_time = DATEADD(minute, @time_window_size * @time_interval_min * -1.0, @end_time);
        END
        ELSE
        BEGIN
            -- Convert min snapshot_time (datetimeoffset) to a UTC datetime
            SET @start_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MIN(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));
        END
    END

    DECLARE @end_snapshot_time_id int;
    SELECT @end_snapshot_time_id = MAX(snapshot_time_id) FROM core.snapshots WHERE snapshot_time <= @end_time;

    DECLARE @start_snapshot_time_id int;
    SELECT @start_snapshot_time_id = MIN(snapshot_time_id) FROM core.snapshots WHERE snapshot_time >= @start_time;

    DECLARE @interval_sec int;
    SET @interval_sec = DATEDIFF (s, @start_time, @end_time)

    SELECT 
        REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (
            LEFT (LTRIM (stmtsql.query_text), 100)
            , CHAR(9), ' '), CHAR(10), ' '), CHAR(13), ' '), '   ', ' '), '  ', ' '), '  ', ' ') AS flat_query_text, 
        t.*, 
        master.dbo.fn_varbintohexstr (t.sql_handle) AS sql_handle_str, 
        stmtsql.*
    FROM 
    (
        SELECT TOP 10 
            stat.sql_handle, stat.statement_start_offset, stat.statement_end_offset, snap.source_id, 
            SUM (stat.snapshot_execution_count) AS execution_count, 
            SUM (stat.snapshot_execution_count) / (@interval_sec / 60) AS executions_per_min, 
            SUM (stat.snapshot_worker_time / 1000) AS total_cpu, 
            SUM (stat.snapshot_worker_time / 1000) / @interval_sec AS avg_cpu_per_sec, 
            SUM (stat.snapshot_worker_time / 1000.0) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_cpu_per_exec, 
            SUM (stat.snapshot_physical_reads) AS total_physical_reads, 
            SUM (stat.snapshot_physical_reads) / @interval_sec AS avg_physical_reads_per_sec, 
            SUM (stat.snapshot_physical_reads) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_physical_reads_per_exec, 
            SUM (stat.snapshot_logical_writes) AS total_logical_writes, 
            SUM (stat.snapshot_logical_writes) / @interval_sec AS avg_logical_writes_per_sec, 
            SUM (stat.snapshot_logical_writes) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_logical_writes_per_exec, 
            SUM (stat.snapshot_elapsed_time / 1000) AS total_elapsed_time, 
            SUM (stat.snapshot_elapsed_time / 1000) / @interval_sec AS avg_elapsed_time_per_sec, 
            SUM (stat.snapshot_elapsed_time / 1000.0) / CASE SUM (stat.snapshot_execution_count) WHEN 0 THEN 1 ELSE SUM (stat.snapshot_execution_count) END AS avg_elapsed_time_per_exec, 
            COUNT(*) AS row_count, COUNT (DISTINCT stat.creation_time) AS plan_count, 
            SUM (CASE @order_by_criteria WHEN 'Duration' THEN charted_value / 1000 ELSE charted_value END) AS charted_value, 
            -- TODO: Make this "sql.database_name" once database name is available in notable_query_text (VSTS #121662)
            CONVERT (nvarchar(255), '') AS database_name, 
            ROW_NUMBER() OVER (ORDER BY SUM (charted_value) DESC) as query_rank
        FROM 
        (
            SELECT *, 
                CASE @order_by_criteria 
                    WHEN 'CPU' THEN (snapshot_worker_time / 1000.0) / @interval_sec
                    WHEN 'Physical Reads' THEN 1.0 * snapshot_physical_reads / @interval_sec
                    WHEN 'Logical Writes' THEN 1.0 * snapshot_logical_writes / @interval_sec
                    WHEN 'I/O' THEN 1.0 * (snapshot_physical_reads + snapshot_logical_writes) / @interval_sec
                    WHEN 'Duration' THEN snapshot_elapsed_time / 1000.0
                    ELSE (snapshot_worker_time / 1000.0) / @interval_sec
                END AS charted_value
            FROM snapshots.query_stats 
        ) AS stat
        INNER JOIN core.snapshots snap ON stat.snapshot_id = snap.snapshot_id
        -- TODO: Uncomment this and the line in the WHERE clause once database name is available in notable_query_text (VSTS #121662)
        -- LEFT OUTER JOIN snapshots.notable_query_text AS sql ON t.sql_handle = sql.sql_handle and sql.source_id = t.source_id
        WHERE
            snap.instance_name = @instance_name 
            AND snap.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
            --  AND ISNULL (sql.database_name = ISNULL (@database_name, stat.database_name)
        GROUP BY stat.sql_handle, stat.statement_start_offset, stat.statement_end_offset, snap.source_id
        ORDER BY ROW_NUMBER() OVER (ORDER BY SUM (charted_value) DESC) ASC
    ) AS t
    LEFT OUTER JOIN snapshots.notable_query_text sql ON t.sql_handle = sql.sql_handle and sql.source_id = t.source_id
    OUTER APPLY snapshots.fn_get_query_text (t.source_id, t.sql_handle, t.statement_start_offset, t.statement_end_offset) AS stmtsql
    ORDER BY query_rank ASC
    -- These trace flags are necessary for a good plan, due to the join on ascending PK w/range filter
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390)
END
GO

GO
--SqlScripter----[snapshots].[rpt_wait_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_wait_stats]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_wait_stats] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_wait_stats]
@ServerName sysname,
    @EndTime datetime = NULL,
    @WindowSize int,
    @CategoryName nvarchar(20) = NULL, 
    @WaitType nvarchar(45) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Clean string params (on drillthrough, RS may pass in empty string instead of NULL)
    IF @CategoryName = '' SET @CategoryName = NULL
    IF @WaitType = '' SET @WaitType = NULL

    -- Divide our time window up into 40 evenly-sized time intervals, and find the last collection_time within each of these intervals
    CREATE TABLE #intervals (
        interval_time_id        int, 
        interval_start_time     datetimeoffset(7),
        interval_end_time       datetimeoffset(7),
        interval_id             int, 
        first_collection_time   datetimeoffset(7), 
        last_collection_time    datetimeoffset(7), 
        first_snapshot_id       int,
        last_snapshot_id        int, 
        source_id               int,
        snapshot_id             int, 
        collection_time         datetimeoffset(7), 
        collection_time_id      int
    )
    -- GUID 49268954-... is Server Activity
    INSERT INTO #intervals
    EXEC [snapshots].[rpt_interval_collection_times] 
        @ServerName, @EndTime, @WindowSize, 'snapshots.os_wait_stats', '49268954-4FD4-4EB6-AA04-CD59D9BB5714', 40, 0

    -- Get the earliest and latest snapshot_id values that contain data for the selected time interval. 
    -- This will allow a more efficient query plan. 
    DECLARE @start_snapshot_id int;
    DECLARE @end_snapshot_id int;
    SELECT @start_snapshot_id = MIN (first_snapshot_id)
    FROM #intervals
    SELECT @end_snapshot_id = MAX (last_snapshot_id)
    FROM #intervals
    
    -- Get the wait stats for these collection times
    SELECT 
        coll.interval_time_id, coll.interval_id, 
        last_collection_time AS collection_time, 
        coll.interval_start_time, 
        coll.interval_end_time, 
        coll.last_snapshot_id, 
        wt.category_name, ws.wait_type, ws.waiting_tasks_count, 
        ISNULL (ws.signal_wait_time_ms, 0) AS signal_wait_time_ms, 
        ISNULL (ws.wait_time_ms, 0) - ISNULL (ws.signal_wait_time_ms, 0) AS wait_time_ms, 
        wait_time_ms AS raw_wait_time_ms, 
        ISNULL (ws.wait_time_ms, 0) AS wait_time_ms_cumulative 
    INTO #wait_stats
    FROM snapshots.os_wait_stats AS ws
    INNER JOIN #intervals AS coll ON coll.last_snapshot_id = ws.snapshot_id AND coll.last_collection_time = ws.collection_time 
    INNER JOIN core.wait_types_categorized AS wt ON wt.wait_type = ws.wait_type
    WHERE wt.category_name = ISNULL (@CategoryName, wt.category_name)
        AND wt.wait_type = ISNULL (@WaitType, wt.wait_type)
        AND wt.ignore != 1

    -- Get wait times by waittype for each interval (plus CPU time, modeled as a waittype)
    ---- First get resource wait stats for this interval. We must convert all datetimeoffset values 
    ---- to UTC datetime values before returning to Reporting Services
    SELECT 
        CONVERT (datetime, SWITCHOFFSET (CAST (w1.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (w1.interval_start_time AS datetimeoffset(7)), '+00:00')) AS interval_start, 
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.interval_start_time AS datetimeoffset(7)), '+00:00')) AS interval_end, 
        w2.category_name, w2.wait_type, 
        -- All wait stats will be reset to zero by a service cycle, which will cause 
        -- (snapshot2waittime-snapshot1waittime) calculations to produce an incorrect 
        -- negative wait time for the interval.  Detect this and avoid calculating 
        -- negative wait time/wait count/signal time deltas. 
        CASE 
            WHEN (w2.waiting_tasks_count - w1.waiting_tasks_count) < 0 THEN w2.waiting_tasks_count 
            ELSE (w2.waiting_tasks_count - w1.waiting_tasks_count) 
        END AS waiting_tasks_count_delta, 
        CASE 
            WHEN (w2.raw_wait_time_ms - w1.raw_wait_time_ms) < 0 THEN w2.wait_time_ms
            ELSE (w2.wait_time_ms - w1.wait_time_ms)
        END AS resource_wait_time_delta, -- / CAST (DATEDIFF (second, w1.collection_time, w2.collection_time) AS decimal) 
        CASE 
            WHEN (w2.signal_wait_time_ms - w1.signal_wait_time_ms) < 0 THEN w2.signal_wait_time_ms 
            ELSE (w2.signal_wait_time_ms - w1.signal_wait_time_ms) 
        END AS resource_signal_time_delta, -- / CAST (DATEDIFF (second, w1.collection_time, w2.collection_time) AS decimal) 
        DATEDIFF (second, w1.collection_time, w2.collection_time) AS interval_sec, 
        w2.wait_time_ms_cumulative
    -- Self-join - w1 represents wait stats at the beginning of the sample interval, while w2 
    -- shows the wait stats at the end of the interval. 
    FROM #wait_stats AS w1 
    INNER JOIN #wait_stats AS w2 ON w1.wait_type = w2.wait_type AND w1.interval_id = w2.interval_id-1 

    UNION ALL 

    ---- Treat the sum of all signal waits as CPU "wait time"
    SELECT 
        MAX (CONVERT (datetime, SWITCHOFFSET (CAST (w1.collection_time AS datetimeoffset(7)), '+00:00'))) AS collection_time, 
        MIN (CONVERT (datetime, SWITCHOFFSET (CAST (w1.interval_start_time AS datetimeoffset(7)), '+00:00'))) AS interval_start, 
        MAX (CONVERT (datetime, SWITCHOFFSET (CAST (w2.interval_start_time AS datetimeoffset(7)), '+00:00'))) AS interval_end, 
        'CPU' AS category_name, 
        'CPU (Signal Wait)' AS wait_type, 
        0 AS waiting_tasks_count_delta, 
        -- Handle wait stats resets, as in the previous query
        SUM (
            CASE 
                WHEN (w2.signal_wait_time_ms - w1.signal_wait_time_ms) < 0 THEN w2.signal_wait_time_ms
                ELSE (w2.signal_wait_time_ms - w1.signal_wait_time_ms) 
            END -- / CAST (DATEDIFF (second, w1.collection_time, w2.collection_time) AS decimal)
        ) AS resource_wait_time_delta, 
        0 AS resource_signal_time_delta, 
        DATEDIFF (second, w1.collection_time, w2.collection_time) AS interval_sec, 
        NULL AS wait_time_ms_cumulative
    FROM #wait_stats AS w1
    INNER JOIN #wait_stats AS w2 ON w1.wait_type = w2.wait_type AND w1.interval_id = w2.interval_id-1
    -- Only return CPU stats if we were told to return the 'CPU' category or all categories
    WHERE (@CategoryName IS NULL OR @CategoryName = 'CPU')
    GROUP BY 
        w1.interval_start_time, w2.interval_start_time, w1.interval_end_time, w2.interval_end_time, w1.collection_time, w2.collection_time

    UNION ALL 

    -- Get actual used CPU time from perfmon data (average across the whole snapshot_time_id interval, 
    -- and use this average for each sample time in this interval).  Note that the "% Processor Time" 
    -- counter in the "Process" object can exceed 100% (for example, it can range from 0-800% on an 
    -- 8 CPU server). 
    SELECT
        CONVERT (datetime, SWITCHOFFSET (CAST (w1.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (w1.interval_start_time AS datetimeoffset(7)), '+00:00')) AS interval_start, 
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.interval_start_time AS datetimeoffset(7)), '+00:00')) AS interval_end, 
        'CPU' AS category_name, 
        'CPU (Consumed)' AS wait_type, 
        0 AS waiting_tasks_count_delta, 
        -- Get sqlservr %CPU usage for the perfmon sample that immediately precedes each wait stats sample.  
        -- Multiply by 10 to convert "% CPU" to "ms CPU/sec". This works because (for example) on an 8 proc 
        -- server, Process(...)\% Processor Time ranges from 0 to 800, not 0 to 100.  Multiply again by 
        -- the duration of interval in seconds to get the total ms of CPU time used in the interval. 
        DATEDIFF (second, w1.collection_time, w2.collection_time) * 10 * ( 
            SELECT TOP 1 formatted_value
            FROM snapshots.performance_counters AS pc
            INNER JOIN core.snapshots s ON pc.snapshot_id = s.snapshot_id
            WHERE pc.performance_object_name = 'Process' AND pc.performance_counter_name = '% Processor Time' 
                AND pc.performance_instance_name = '$(TARGETPROCESS)'
                AND pc.collection_time <= w2.collection_time
                AND s.instance_name = @ServerName AND s.collection_set_uid = '49268954-4FD4-4EB6-AA04-CD59D9BB5714' -- Server Activity CS
                AND s.snapshot_id BETWEEN @start_snapshot_id AND @end_snapshot_id 
            ORDER BY pc.collection_time DESC
        ) AS resource_wait_time_delta, 
        0 AS resource_signal_time_delta, 
        DATEDIFF (second, w1.collection_time, w2.collection_time) AS interval_sec, 
        NULL AS wait_time_ms_cumulative
    FROM #wait_stats AS w1
    INNER JOIN #wait_stats AS w2 ON w1.wait_type = w2.wait_type AND w1.interval_id = w2.interval_id-1
    -- Only return CPU stats if we weren't passed in a specific wait category
    WHERE (@CategoryName IS NULL OR @CategoryName = 'CPU')
    GROUP BY 
        w1.interval_start_time, w2.interval_start_time, w1.interval_end_time, w2.interval_end_time, w1.collection_time, w2.collection_time

    ORDER BY category_name, collection_time, wait_type
    -- These trace flags are necessary for a good plan, due to the join on ascending core.snapshot PK
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390);
    
END
GO

GO
--SqlScripter----[snapshots].[rpt_wait_stats_by_category_by_snapshot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_wait_stats_by_category_by_snapshot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_wait_stats_by_category_by_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_wait_stats_by_category_by_snapshot]
@instance_name sysname,
    @start_time datetime = NULL,
    @end_time datetime = NULL,
    @time_window_size smallint = NULL,
    @time_interval_min smallint = NULL, 
    @category_name nvarchar(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Convert snapshot_time (datetimeoffset) to a UTC datetime
    IF (@end_time IS NULL)
        SET @end_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MAX(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));

    IF (@start_time IS NULL)
    BEGIN
        -- If time_window_size and time_interval_min are set use them
        -- to determine the start time
        -- Otherwise use the earliest available snapshot_time
        IF @time_window_size IS NOT NULL AND @time_interval_min IS NOT NULL
        BEGIN
            SET @start_time = DATEADD(minute, @time_window_size * @time_interval_min * -1.0, @end_time);
        END
        ELSE
        BEGIN
            -- Convert min snapshot_time (datetimeoffset(7)) to a UTC datetime
            SET @start_time = CONVERT (datetime, SWITCHOFFSET (CAST ((SELECT MIN(snapshot_time) FROM core.snapshots) AS datetimeoffset(7)), '+00:00'));
        END
    END

    DECLARE @end_snapshot_time_id int;
    SELECT @end_snapshot_time_id = MAX(snapshot_time_id) FROM core.snapshots WHERE snapshot_time <= @end_time;

    DECLARE @start_snapshot_time_id int;
    SELECT @start_snapshot_time_id = MIN(snapshot_time_id) FROM core.snapshots WHERE snapshot_time >= @start_time;

    -- If the selected time window is > 1 hour, we'll chart wait times at 15 minute intervals.  If the selected 
    -- time window is < 1 hour, we'll use 5 minute intervals. 
    DECLARE @group_interval_min int
    IF DATEDIFF (minute, @start_time, @end_time) > 60
    BEGIN
        SET @group_interval_min = 15
    END 
    ELSE BEGIN
        SET @group_interval_min = 5
    END;
    -- Get wait times by waittype (plus CPU time, modeled as a waittype)
    WITH wait_times AS 
    ( 
        SELECT 
            s.snapshot_id, s.snapshot_time_id, s.snapshot_time, 
            DENSE_RANK() OVER (ORDER BY ws.collection_time) AS [rank], 
            ws.collection_time, wt.category_name, ws.wait_type, 
            ws.waiting_tasks_count, 
        ISNULL (ws.signal_wait_time_ms, 0) AS signal_wait_time_ms, 
        ISNULL (ws.wait_time_ms, 0) - ISNULL (ws.signal_wait_time_ms, 0) AS wait_time_ms, 
        ISNULL (ws.wait_time_ms, 0) AS wait_time_ms_cumulative 
    FROM snapshots.os_wait_stats AS ws
        INNER JOIN core.wait_types_categorized wt ON wt.wait_type = ws.wait_type
        INNER JOIN core.snapshots s ON ws.snapshot_id = s.snapshot_id
        WHERE s.snapshot_time_id BETWEEN @start_snapshot_time_id AND @end_snapshot_time_id
            AND s.instance_name = @instance_name
            AND wt.category_name = ISNULL (@category_name, wt.category_name)
        AND wt.ignore != 1

            AND ws.collection_time IN 
            (
                SELECT MAX(collection_time) 
                FROM snapshots.os_wait_stats ws2 
                WHERE ws2.collection_time BETWEEN @start_time AND @end_time
                GROUP BY DATEDIFF (minute, '19000101', ws2.collection_time) / @group_interval_min
            )
    )

    -- Get resource wait stats for this snapshot_time_id interval
    -- We must convert all datetimeoffset values to UTC datetime values before returning to Reporting Services
    SELECT 
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time, 
        w2.snapshot_time_id, 
        CONVERT (datetime, SWITCHOFFSET (CAST (w1.collection_time AS datetimeoffset(7)), '+00:00')) AS interval_start, 
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.collection_time AS datetimeoffset(7)), '+00:00')) AS interval_end, 
        w2.category_name, w2.wait_type, 
        -- All wait stats will be reset to zero by a service cycle, which will cause 
        -- (snapshot2waittime-snapshot1waittime) calculations to produce an incorrect 
        -- negative wait time for the interval.  Detect this and avoid calculating 
        -- negative wait time/wait count/signal time deltas. 
        CASE 
            WHEN (w2.waiting_tasks_count - w1.waiting_tasks_count) < 0 THEN w2.waiting_tasks_count 
            ELSE (w2.waiting_tasks_count - w1.waiting_tasks_count) 
        END AS waiting_tasks_count_delta, 
        CASE 
            WHEN (w2.wait_time_ms - w1.wait_time_ms) < 0 THEN w2.wait_time_ms
            ELSE (w2.wait_time_ms - w1.wait_time_ms)
        END / CAST (DATEDIFF (second, w1.collection_time, w2.collection_time) AS decimal) AS resource_wait_time_delta, 
        CASE 
            WHEN (w2.signal_wait_time_ms - w1.signal_wait_time_ms) < 0 THEN w2.signal_wait_time_ms 
            ELSE (w2.signal_wait_time_ms - w1.signal_wait_time_ms) 
        END / CAST (DATEDIFF (second, w1.collection_time, w2.collection_time) AS decimal) AS resource_signal_time_delta, 
        DATEDIFF (second, w1.collection_time, w2.collection_time) AS interval_sec, 
        w2.wait_time_ms_cumulative
    -- Self-join - w1 represents wait stats at the beginning of the sample interval, while w2 
    -- shows the wait stats at the end of the interval. 
    FROM wait_times AS w1 
    INNER JOIN wait_times AS w2 ON w1.wait_type = w2.wait_type AND w1.[rank] = w2.[rank]-1 

    UNION ALL 

    -- Treat sum of all signal waits as CPU "wait time"
    SELECT 
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time, 
        w2.snapshot_time_id, 
        CONVERT (datetime, SWITCHOFFSET (CAST (w1.collection_time AS datetimeoffset(7)), '+00:00')) AS interval_start, 
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.collection_time AS datetimeoffset(7)), '+00:00')) AS interval_end, 
        'CPU' AS category_name, 
        'CPU (Signal Wait)' AS wait_type, 
        0 AS waiting_tasks_count_delta, 
        -- Handle wait stats resets
        CASE 
            WHEN (SUM (w2.signal_wait_time_ms) - SUM (w1.signal_wait_time_ms)) < 0 THEN SUM (w2.signal_wait_time_ms)
            ELSE (SUM (w2.signal_wait_time_ms) - SUM (w1.signal_wait_time_ms)) 
        END / CAST (DATEDIFF (second, w1.collection_time, w2.collection_time) AS decimal) AS resource_wait_time_delta, 
        0 AS resource_signal_time_delta, 
        DATEDIFF (second, w1.collection_time, w2.collection_time) AS interval_sec, 
        w2.wait_time_ms_cumulative
    FROM wait_times AS w1
    INNER JOIN wait_times AS w2 ON w1.wait_type = w2.wait_type AND w1.[rank] = w2.[rank]-1
    -- Only return CPU stats if we were told to return the 'CPU' category or all categories
    WHERE (@category_name IS NULL OR @category_name = 'CPU')
    GROUP BY w1.collection_time, w1.collection_time, w2.collection_time, w2.snapshot_time, w2.snapshot_time_id, w2.wait_time_ms_cumulative

    UNION ALL 

    -- Get actual used CPU time from perfmon data (average across the whole snapshot_time_id interval, 
    -- and use this average for each sample time in this interval).  Note that the "% Processor Time" 
    -- counter in the "Process" object can exceed 100% (for example, it can range from 0-800% on an 
    -- 8 CPU server). 
    SELECT
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.snapshot_time AS datetimeoffset(7)), '+00:00')) AS snapshot_time, 
        w2.snapshot_time_id, 
        CONVERT (datetime, SWITCHOFFSET (CAST (w1.collection_time AS datetimeoffset(7)), '+00:00')) AS interval_start, 
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.collection_time AS datetimeoffset(7)), '+00:00')) AS interval_end, 
        'CPU' AS category_name, 
        'CPU (Consumed)' AS wait_type, 
        0 AS waiting_tasks_count_delta, 
        -- Get sqlservr %CPU usage for the perfmon sample that immediately precedes 
        -- each wait stats sample.  Multiply by 10 to convert "% CPU" to "ms CPU/sec". 
        10 * (  
            SELECT TOP 1 formatted_value
            FROM snapshots.performance_counters AS pc
            INNER JOIN core.snapshots s ON pc.snapshot_id = s.snapshot_id
            WHERE pc.performance_object_name = 'Process' AND pc.performance_counter_name = '% Processor Time' 
                AND pc.performance_instance_name = 'sqlservr'
                AND s.snapshot_time_id <= @end_snapshot_time_id
                AND s.instance_name = @instance_name
                AND pc.snapshot_id < w2.snapshot_id
            ORDER BY pc.snapshot_id DESC
        ) AS resource_wait_time_delta, 
        0 AS resource_signal_time_delta, 
        DATEDIFF (second, w1.collection_time, w2.collection_time) AS interval_sec, 
        NULL
    FROM wait_times AS w1
    INNER JOIN wait_times AS w2 ON w1.wait_type = w2.wait_type AND w1.[rank] = w2.[rank]-1
    -- Only return CPU stats if we weren't passed in a specific wait category
    WHERE (@category_name IS NULL OR @category_name = 'CPU')
    GROUP BY w1.collection_time, w2.collection_time, w2.snapshot_time, w2.snapshot_time_id, w2.snapshot_id

    ORDER BY collection_time, category_name, wait_type
    -- These trace flags are necessary for a good plan, due to the join on ascending core.snapshot PK
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390);
END
GO

GO
--SqlScripter----[snapshots].[rpt_wait_stats_one_snapshot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_wait_stats_one_snapshot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_wait_stats_one_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_wait_stats_one_snapshot]
@instance_name sysname,
    @snapshot_time_id int, 
    @category_name nvarchar(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Find the snapshot_id of the last wait stats data set in the following 
    -- snapshot_time_id interval
    DECLARE @current_snapshot_id int
    SELECT TOP 1 @current_snapshot_id = s.snapshot_id
    FROM core.snapshots AS s
    INNER JOIN snapshots.os_wait_stats ws ON s.snapshot_id = ws.snapshot_id
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id > @snapshot_time_id
    ORDER BY s.snapshot_time_id ASC, s.snapshot_id ASC, ws.collection_time ASC;

    -- Find the snapshot_id of the last wait stats data set in the preceding 
    -- snapshot_time_id interval
    DECLARE @previous_snapshot_id int
    SELECT TOP 1 @previous_snapshot_id = ISNULL (s.snapshot_id, 0)
    FROM core.snapshots AS s
    INNER JOIN snapshots.os_wait_stats ws ON s.snapshot_id = ws.snapshot_id
    WHERE s.instance_name = @instance_name
        AND s.snapshot_time_id < @snapshot_time_id
    ORDER BY s.snapshot_time_id DESC, s.snapshot_id DESC, ws.collection_time DESC;

    -- Get wait times by waittype (plus CPU time, modeled as a waittype)
    WITH wait_times AS 
    ( 
        SELECT 
            s.snapshot_id, s.snapshot_time_id, 
            DENSE_RANK() OVER (ORDER BY collection_time) AS [rank], 
            ws.collection_time, wt.category_name, ws.wait_type, 
            ws.waiting_tasks_count, 
            ISNULL (ws.signal_wait_time_ms, 0) AS signal_wait_time_ms, 
            ISNULL (ws.wait_time_ms - ISNULL (ws.signal_wait_time_ms, 0), 0) AS wait_time_ms, 
            ws.wait_time_ms AS wait_time_ms_cumulative
        FROM snapshots.os_wait_stats AS ws
        INNER JOIN core.wait_types_categorized wt ON wt.wait_type = ws.wait_type
        INNER JOIN core.snapshots s ON ws.snapshot_id = s.snapshot_id
        WHERE s.snapshot_id BETWEEN @previous_snapshot_id AND @current_snapshot_id
            AND s.instance_name = @instance_name
            AND (wt.category_name = ISNULL (@category_name, wt.category_name))
            AND wt.ignore != 1
    )

    -- Get resource wait stats for this snapshot_time_id interval
    SELECT 
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        w2.category_name, w2.wait_type, 
        -- All wait stats will be reset to zero by a service cycle, which will cause 
        -- (snapshot2waittime-snapshot1waittime) calculations to produce an incorrect 
        -- negative wait time for the interval.  Detect this and avoid calculating 
        -- negative wait time/wait count/signal time deltas. 
        CASE 
            WHEN (w2.waiting_tasks_count - w1.waiting_tasks_count) < 0 THEN w2.waiting_tasks_count 
            ELSE (w2.waiting_tasks_count - w1.waiting_tasks_count) 
        END AS waiting_tasks_count_delta, 
        CASE 
            WHEN (w2.wait_time_ms - w1.wait_time_ms) < 0 THEN w2.wait_time_ms
            ELSE (w2.wait_time_ms - w1.wait_time_ms)
        END / CAST (DATEDIFF (second, w1.collection_time, w2.collection_time) AS decimal) AS resource_wait_time_delta, 
        CASE 
            WHEN (w2.signal_wait_time_ms - w1.signal_wait_time_ms) < 0 THEN w2.signal_wait_time_ms 
            ELSE (w2.signal_wait_time_ms - w1.signal_wait_time_ms) 
        END / CAST (DATEDIFF (second, w1.collection_time, w2.collection_time) AS decimal) AS resource_signal_time_delta, 
        DATEDIFF (second, w1.collection_time, w2.collection_time) AS interval_sec, 
        w2.wait_time_ms_cumulative
    -- Self-join - w1 represents wait stats at the beginning of the sample interval, while w2 
    -- shows the wait stats at the end of the interval. 
    FROM wait_times AS w1 
    INNER JOIN wait_times AS w2 ON w1.wait_type = w2.wait_type AND w1.[rank] = w2.[rank]-1 

    UNION ALL 

    -- Treat sum of all signal waits as CPU "wait time"
    SELECT 
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        'CPU' AS category_name, 
        'CPU (Signal Wait)' AS wait_type, 
        0 AS waiting_tasks_count_delta, 
        -- Handle wait stats resets
        CASE 
            WHEN (SUM (w2.signal_wait_time_ms) - SUM (w1.signal_wait_time_ms)) < 0 THEN SUM (w2.signal_wait_time_ms)
            ELSE (SUM (w2.signal_wait_time_ms) - SUM (w1.signal_wait_time_ms)) 
        END / CAST (DATEDIFF (second, w1.collection_time, w2.collection_time) AS decimal) AS resource_wait_time_delta, 
        0 AS resource_signal_time_delta, 
        DATEDIFF (second, w1.collection_time, w2.collection_time) AS interval_sec, 
        w2.wait_time_ms_cumulative
    FROM wait_times AS w1
    INNER JOIN wait_times AS w2 ON w1.wait_type = w2.wait_type AND w1.[rank] = w2.[rank]-1
    -- Only return CPU stats if we weren't passed in a specific wait category
    WHERE (@category_name IS NULL OR @category_name = 'CPU')
    GROUP BY w1.collection_time, w2.collection_time, w2.wait_time_ms_cumulative

    UNION ALL 

    -- Get actual used CPU time from perfmon data (average across the whole snapshot_time_id interval, 
    -- and use this average for each sample time in this interval).  Note that the "% Processor Time" 
    -- counter in the "Process" object can exceed 100% (for example, it can range from 0-800% on an 
    -- 8 CPU server). 
    SELECT
        CONVERT (datetime, SWITCHOFFSET (CAST (w2.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        'CPU' AS category_name, 
        'CPU (Consumed)' AS wait_type, 
        0 AS waiting_tasks_count_delta, 
        -- Get sqlservr %CPU usage for the perfmon sample that immediately precedes 
        -- each wait stats sample.  Multiply by 10 to convert "% CPU" to "ms CPU/sec". 
        10 * (  
            SELECT TOP 1 formatted_value
            FROM snapshots.performance_counters AS pc
            INNER JOIN core.snapshots s ON pc.snapshot_id = s.snapshot_id
            WHERE pc.performance_object_name = 'Process' AND pc.performance_counter_name = '% Processor Time' 
                AND pc.performance_instance_name = 'sqlservr'
                AND s.snapshot_id < @current_snapshot_id
                AND s.instance_name = @instance_name
                AND pc.snapshot_id < w2.snapshot_id
            ORDER BY pc.snapshot_id DESC
        ) AS resource_wait_time_delta, 
        0 AS resource_signal_time_delta, 
        DATEDIFF (second, w1.collection_time, w2.collection_time) AS interval_sec, 
        NULL
    FROM wait_times AS w1
    INNER JOIN wait_times AS w2 ON w1.wait_type = w2.wait_type AND w1.[rank] = w2.[rank]-1
    -- Only return CPU stats if we weren't passed in a specific wait category
    WHERE (@category_name IS NULL OR @category_name = 'CPU')
    GROUP BY w1.collection_time, w2.collection_time, w2.snapshot_id

    ORDER BY collection_time, category_name, wait_type
    -- These trace flags are necessary for a good plan, due to the join on ascending core.snapshot PK
    OPTION (QUERYTRACEON 2389, QUERYTRACEON 2390);

END;
GO

GO
--SqlScripter----[snapshots].[rpt_wait_stats_one_snapshot_one_category].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_wait_stats_one_snapshot_one_category]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_wait_stats_one_snapshot_one_category] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_wait_stats_one_snapshot_one_category]
@instance_name sysname,
    @snapshot_time_id int,
    @category_name nvarchar(20)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Use CTE to select first all raw data that we neeed
    -- For each snapshot append a [rank] column, which later will be used to do the self-join
    WITH wait_times AS 
    (
    -- First part gets resource wait times for each wait_type,
    -- calculated as wait_time_ms - signal_wait_time_ms 
    SELECT 
        DENSE_RANK() OVER (ORDER BY ws1.collection_time) AS [rank],
        s.snapshot_time_id,
        ws1.collection_time, 
        ct.category_name,
        ev.wait_type,
        ws1.waiting_tasks_count,
        ws1.wait_time_ms - ws1.signal_wait_time_ms as resource_wait_time_ms
    FROM core.snapshots s
    JOIN snapshots.os_wait_stats ws1 on (ws1.snapshot_id = s.snapshot_id)
    JOIN core.wait_types ev on (ev.wait_type = ws1.wait_type)
    JOIN core.wait_categories ct on (ct.category_id = ev.category_id)
    WHERE ct.category_name = @category_name
      AND s.instance_name = @instance_name
      AND (s.snapshot_time_id = @snapshot_time_id OR s.snapshot_time_id = @snapshot_time_id - 1)
    )
    -- Do a self-join to calculate deltas between snapshots
    SELECT 
        CONVERT (datetime, SWITCHOFFSET (CAST (t1.collection_time AS datetimeoffset(7)), '+00:00')) AS collection_time, 
        t1.wait_type,
        (t1.waiting_tasks_count - t2.waiting_tasks_count) AS waiting_tasks_count_delta,
        (t1.resource_wait_time_ms - ISNULL(t2.resource_wait_time_ms,0))/CAST(DATEDIFF(second, t2.collection_time, t1.collection_time) AS decimal) AS resource_wait_time_delta
    FROM wait_times t1
    LEFT OUTER JOIN wait_times t2 on (t2.rank = t1.rank-1 and t2.wait_type = t1.wait_type)
    WHERE t1.snapshot_time_id = @snapshot_time_id
    ORDER BY collection_time, wait_type
END;
GO

GO
--SqlScripter----[snapshots].[rpt_waiting_sessions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_waiting_sessions]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_waiting_sessions] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_waiting_sessions]
@ServerName sysname, 
    @EndTime datetime, 
    @WindowSize int, 
    @CategoryName nvarchar(20)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @start_time_internal datetimeoffset(7);
    DECLARE @end_time_internal datetimeoffset(7);
    
    -- Start time should be passed in as a UTC datetime
    IF (@EndTime IS NOT NULL)
    BEGIN
        -- Assumed time zone offset for this conversion is +00:00 (datetime must be passed in as UTC)
        SET @end_time_internal = CAST (@EndTime AS datetimeoffset(7));
    END
    ELSE BEGIN
        SELECT @end_time_internal = MAX(ar.collection_time)
        FROM core.snapshots AS s
        INNER JOIN snapshots.active_sessions_and_requests AS ar ON s.snapshot_id = ar.snapshot_id
        WHERE s.instance_name = @ServerName -- AND collection_set_uid = '49268954-4FD4-4EB6-AA04-CD59D9BB5714' -- Server Activity CS
    END
    SET @start_time_internal = DATEADD (minute, -1 * @WindowSize, @end_time_internal);
    
    DECLARE @total_waits TABLE
    (
        wait_type nvarchar(45),
        wait_count bigint, 
        wait_duration_ms bigint
    )

    INSERT INTO @total_waits
    SELECT 
        ar.wait_type,
        COUNT(*) AS wait_count, 
        SUM (wait_duration_ms)
    FROM snapshots.active_sessions_and_requests ar
    JOIN core.snapshots s ON (s.snapshot_id = ar.snapshot_id)
    WHERE s.instance_name = @ServerName -- AND collection_set_uid = '49268954-4FD4-4EB6-AA04-CD59D9BB5714' -- Server Activity CS
        AND ar.collection_time BETWEEN @start_time_internal AND @end_time_internal
        AND ar.wait_type != ''
    GROUP BY ar.wait_type
    
    SELECT
        t.source_id,
        t.session_id,
        t.request_id,
        t.database_name,
        CONVERT (datetime, SWITCHOFFSET (CAST (t.login_time AS datetimeoffset(7)), '+00:00')) AS login_time, 
        t.login_name,
        t.[program_name],
        t.sql_handle,
        master.dbo.fn_varbintohexstr (t.sql_handle) AS sql_handle_str,
        t.statement_start_offset,
        t.statement_end_offset,
        t.plan_handle,
        master.dbo.fn_varbintohexstr (t.plan_handle) AS plan_handle_str,
        t.wait_type,
        t.wait_count,
        t.wait_total_percent,
        t.wait_type_wait_percent,
        qt.query_text, 
        REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (
            LEFT (LTRIM (qt.query_text), 100)
            , CHAR(9), ' '), CHAR(10), ' '), CHAR(13), ' '), '   ', ' '), '  ', ' '), '  ', ' ') AS flat_query_text
    FROM
    (
        SELECT 
            s.source_id,
            ar.session_id,
            ar.request_id,
            ar.database_name,
            ar.login_time,
            ar.login_name,
            ar.program_name,
            ar.sql_handle,
            ar.statement_start_offset,
            ar.statement_end_offset,
            ar.plan_handle,
            ar.wait_type,
            COUNT(*) AS wait_count,
            (COUNT(*)) / CONVERT(decimal, (SELECT SUM(wait_count) FROM @total_waits)) AS wait_total_percent,
            (COUNT(*)) / CONVERT(decimal, (SELECT wait_count FROM @total_waits WHERE wait_type = ar.wait_type)) AS wait_type_wait_percent
        FROM snapshots.active_sessions_and_requests AS ar
        INNER JOIN core.snapshots AS s ON (s.snapshot_id = ar.snapshot_id)
        INNER JOIN core.wait_types_categorized AS wt on (wt.wait_type = ar.wait_type)
        WHERE s.instance_name = @ServerName -- AND s.collection_set_uid = '49268954-4FD4-4EB6-AA04-CD59D9BB5714' -- Server Activity CS
            AND ar.collection_time BETWEEN @start_time_internal AND @end_time_internal
            AND wt.category_name = @CategoryName
        GROUP BY s.source_id, ar.session_id, ar.request_id, ar.database_name, ar.login_time, ar.login_name, ar.program_name, 
            ar.wait_type, ar.sql_handle, ar.statement_start_offset, ar.statement_end_offset, ar.plan_handle
    ) AS t 
    OUTER APPLY snapshots.fn_get_query_text(t.source_id, t.sql_handle, t.statement_start_offset, t.statement_end_offset) AS qt

END;
GO

GO
--SqlScripter----[snapshots].[rpt_waiting_sessions_per_snapshot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[rpt_waiting_sessions_per_snapshot]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[rpt_waiting_sessions_per_snapshot] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[rpt_waiting_sessions_per_snapshot]
@instance_name sysname,
    @snapshot_time_id int,
    @wait_category_name nvarchar(20)
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @total_waits TABLE
    (
        wait_type nvarchar(45),
        wait_count bigint
    )

    INSERT INTO @total_waits
    SELECT 
        ar.wait_type,
        COUNT(ar.wait_type) 
    FROM snapshots.active_sessions_and_requests ar
    JOIN core.snapshots s ON (s.snapshot_id = ar.snapshot_id)
    WHERE s.snapshot_time_id = @snapshot_time_id
      AND s.instance_name = @instance_name
    GROUP BY ar.wait_type
    
    SELECT
        t.source_id,
        t.session_id,
        t.request_id,
        t.database_name,
        CONVERT (datetime, SWITCHOFFSET (CAST (t.login_time AS datetimeoffset(7)), '+00:00')) AS login_time, 
        t.login_name,
        t.[program_name],
        t.sql_handle,
        master.dbo.fn_varbintohexstr (t.sql_handle) AS sql_handle_str,
        t.statement_start_offset,
        t.statement_end_offset,
        t.plan_handle,
        master.dbo.fn_varbintohexstr (t.plan_handle) AS plan_handle_str,
        t.wait_type,
        t.wait_count,
        t.wait_total_precent,
        t.wait_type_wait_precent,
        qt.query_text
    FROM
    (
        SELECT 
            s.source_id,
            ar.session_id,
            ar.request_id,
            ar.database_name,
            ar.login_time,
            ar.login_name,
            ar.program_name,
            ar.sql_handle,
            ar.statement_start_offset,
            ar.statement_end_offset,
            ar.plan_handle,
            ar.wait_type,
            COUNT(ar.wait_type) AS wait_count,
            (COUNT(ar.wait_type)) / CONVERT(decimal, (SELECT SUM(wait_count) FROM @total_waits)) AS wait_total_precent,
            (COUNT(ar.wait_type)) / CONVERT(decimal, (SELECT wait_count FROM @total_waits WHERE wait_type = ar.wait_type)) AS wait_type_wait_precent
        FROM snapshots.active_sessions_and_requests ar
        JOIN core.snapshots s ON (s.snapshot_id = ar.snapshot_id)
        JOIN core.wait_types ev on (ev.wait_type = ar.wait_type)
        JOIN core.wait_categories ct on (ct.category_id = ev.category_id)
        WHERE s.snapshot_time_id = @snapshot_time_id
          AND s.instance_name = @instance_name
          AND ct.category_name = @wait_category_name
        GROUP BY s.source_id, ar.session_id, ar.request_id, ar.database_name, ar.login_time, ar.login_name, ar.program_name, ar.wait_type, ar.sql_handle, ar.statement_start_offset, ar.statement_end_offset, ar.plan_handle
    ) t 
    OUTER APPLY snapshots.fn_get_query_text(t.source_id, t.sql_handle, t.statement_start_offset, t.statement_end_offset) AS qt

END;
GO

GO
--SqlScripter----[snapshots].[sp_get_unknown_query_plan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[sp_get_unknown_query_plan]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[sp_get_unknown_query_plan] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[sp_get_unknown_query_plan]
@source_id       int
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [source_id],
        [sql_handle],
        [plan_handle],
        [statement_start_offset],
        [statement_end_offset],
        [plan_generation_num]
    FROM
        [snapshots].[notable_query_plan]
    WHERE
        [source_id] = @source_id
        AND [query_plan] IS NULL
END;
GO

GO
--SqlScripter----[snapshots].[sp_get_unknown_query_text].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[sp_get_unknown_query_text]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[sp_get_unknown_query_text] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[sp_get_unknown_query_text]
@source_id  int
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [source_id],
        [sql_handle]
    FROM
        [snapshots].[notable_query_text]
    WHERE
        [source_id] = @source_id
        AND [sql_text] IS NULL
END;
GO

GO
--SqlScripter----[snapshots].[sp_trace_get_info].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[sp_trace_get_info]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[sp_trace_get_info] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[sp_trace_get_info]
@source_id           int,               -- references source of data from core.source_info_internal
    @collection_item_id  int,               -- idenitfies the collection item id within the source info
    @start_time          datetime,          -- time when the trace has started
    @last_event_sequence bigint OUTPUT,     -- returns the event sequence number for last trace event uploaded, or 0
    @trace_info_id       int OUTPUT         -- returns id of trace_info record
AS
BEGIN
    SET NOCOUNT ON;

    -- Security check (role membership)
    IF (NOT (ISNULL(IS_MEMBER(N'mdw_writer'), 0) = 1) AND NOT (ISNULL(IS_SRVROLEMEMBER(N'sysadmin'), 0) = 1))
    BEGIN
        RAISERROR(14677, 16, -1, 'mdw_writer');
        RETURN(1); -- Failure
    END;

    -- Parameters check - mandatory parameters
    IF (@source_id IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@source_id')
        RETURN(1) -- Failure
    END;

    IF (@collection_item_id IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@collection_item_id')
        RETURN(1) -- Failure
    END;

    IF (@start_time IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@start_time')
        RETURN(1) -- Failure
    END;

    SELECT 
        @trace_info_id = trace_info_id,
        @last_event_sequence = last_event_sequence 
    FROM snapshots.trace_info ti
    WHERE 
        ti.source_id = @source_id
        AND ti.collection_item_id = @collection_item_id
        AND ti.is_running = 1
        AND ti.start_time = @start_time;

    IF (@trace_info_id IS NULL)
    BEGIN
        SELECT @last_event_sequence = 0;

        -- Insert new record
        INSERT INTO [snapshots].[trace_info]
        (
            source_id,
            collection_item_id,
            start_time,
            is_running,
            last_event_sequence
        )
        VALUES
        (
            @source_id,
            @collection_item_id,
            @start_time,
            1,
            @last_event_sequence
        );
        SELECT @trace_info_id = SCOPE_IDENTITY();
    END;

    RETURN (0);
END
GO

GO
--SqlScripter----[snapshots].[sp_trace_update_info].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[sp_trace_update_info]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[sp_trace_update_info] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[sp_trace_update_info]
@trace_info_id       int,
    @snapshot_id         int,
    @last_event_sequence bigint,
    @is_running          bit,
    @event_count         bigint,
    @dropped_event_count int
AS
BEGIN
    SET NOCOUNT ON;

    -- Security check (role membership)
    IF (NOT (ISNULL(IS_MEMBER(N'mdw_writer'), 0) = 1) AND NOT (ISNULL(IS_SRVROLEMEMBER(N'sysadmin'), 0) = 1))
    BEGIN
        RAISERROR(14677, 16, -1, 'mdw_writer');
        RETURN(1); -- Failure
    END;

    -- Parameters check - mandatory parameters
    IF (@trace_info_id IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@trace_info_id')
        RETURN(1) -- Failure
    END;

    IF NOT EXISTS (SELECT trace_info_id from snapshots.trace_info where trace_info_id = @trace_info_id)
    BEGIN
        DECLARE @trace_info_id_as_char NVARCHAR(10)
        SELECT @trace_info_id_as_char = CONVERT(NVARCHAR(36), @trace_info_id)
        RAISERROR(14679, -1, -1, N'@trace_info_id', @trace_info_id_as_char)
        RETURN(1) -- Failure
    END;

    IF (@snapshot_id IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@snapshot_id')
        RETURN(1) -- Failure
    END;

    IF NOT EXISTS (SELECT snapshot_id from core.snapshots where snapshot_id = @snapshot_id)
    BEGIN
        DECLARE @snapshot_id_as_char NVARCHAR(36)
        SELECT @snapshot_id_as_char = CONVERT(NVARCHAR(36), @snapshot_id)
        RAISERROR(14679, -1, -1, N'@snapshot_id', @snapshot_id_as_char)
        RETURN(1) -- Failure
    END;

    IF (@last_event_sequence IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@last_event_sequence')
        RETURN(1) -- Failure
    END;

    IF (@is_running IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@is_running')
        RETURN(1) -- Failure
    END;

    IF (@event_count IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@event_count')
        RETURN(1) -- Failure
    END;

    IF (@dropped_event_count IS NULL)
    BEGIN
        RAISERROR(14200, -1, -1, '@dropped_event_count')
        RETURN(1) -- Failure
    END;

    -- Update existing record
    UPDATE [snapshots].[trace_info]
    SET
        last_snapshot_id = @snapshot_id,
        last_event_sequence = @last_event_sequence,
        is_running = @is_running,
        event_count = ISNULL(event_count,0) + @event_count,
        dropped_event_count = @dropped_event_count
    WHERE
        trace_info_id = @trace_info_id;

    RETURN(0);
END
GO

GO
--SqlScripter----[snapshots].[sp_update_query_plan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[sp_update_query_plan]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[sp_update_query_plan] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[sp_update_query_plan]
@source_id                 int,
    @sql_handle                varbinary(64),
    @plan_handle               varbinary(64),
    @statement_start_offset    int          ,
    @statement_end_offset      int          ,
    @plan_generation_num       bigint       ,
    @database_id               smallint     ,
    @object_id                 int          ,
    @object_name               nvarchar(128),
    @query_plan                nvarchar(max)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [snapshots].[notable_query_plan]
    SET
        database_id     = @database_id,
        object_id       = @object_id,
        object_name     = @object_name,
        query_plan      = @query_plan
    WHERE
        source_id = @source_id
        AND sql_handle = @sql_handle
        AND plan_handle = @plan_handle
        AND statement_start_offset = @statement_start_offset
        AND statement_end_offset = @statement_end_offset
        AND plan_generation_num = @plan_generation_num

END;
GO

GO
--SqlScripter----[snapshots].[sp_update_query_text].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[sp_update_query_text]') IS NULL EXEC('CREATE PROCEDURE [snapshots].[sp_update_query_text] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [snapshots].[sp_update_query_text]
@source_id       int,
    @sql_handle      varbinary(64),
    @database_id     smallint     ,
    @object_id       int          ,
    @object_name     nvarchar(128),
    @sql_text        nvarchar(max)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [snapshots].[notable_query_text]
    SET
        database_id = @database_id,
        object_id   = @object_id,
        object_name = @object_name,
        sql_text    = @sql_text
    WHERE
        source_id = @source_id 
        AND sql_handle = @sql_handle
        
END;
GO

GO
--SqlScripter----[sysutility_ucp_core].[sp_copy_cache_table_data_into_aggregate_tables].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_core].[sp_copy_cache_table_data_into_aggregate_tables]') IS NULL EXEC('CREATE PROCEDURE [sysutility_ucp_core].[sp_copy_cache_table_data_into_aggregate_tables] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [sysutility_ucp_core].[sp_copy_cache_table_data_into_aggregate_tables]
@aggregation_type INT,
    @endTime DATETIMEOFFSET(7)
AS
BEGIN       
    DECLARE @startTime DATETIMEOFFSET(7)
    DECLARE @lowerAggregationLevel [sysutility_ucp_core].AggregationType

    SELECT @lowerAggregationLevel = 0    -- compute from detail rows
    
    IF (@aggregation_type = 1)
       SELECT @startTime = DATEADD(hour, -1, @endTime)
    ELSE IF (@aggregation_type = 2)
       SELECT @startTime = DATEADD(day, -1, @endTime)
       -- todo (VSTS #345038) 
       -- Ideally, we would be using the hourly aggregation values to compute the 
       --   daily aggregation ("SELECT @lowerAggregationLevel = 1")
       --
    ELSE BEGIN
        -- todo. Raise an error instead
        RETURN(1)
    END
    
    INSERT INTO [sysutility_ucp_core].[cpu_utilization_internal] (
         aggregation_type, object_type, processing_time,
         physical_server_name, server_instance_name, database_name,
         percent_total_cpu_utilization)
       SELECT @aggregation_type, object_type, @endTime,
              physical_server_name, server_instance_name, database_name,
              AVG(percent_total_cpu_utilization)
       FROM [sysutility_ucp_core].[cpu_utilization_internal]
       WHERE (processing_time BETWEEN @startTime and @endTime) AND
             aggregation_type = @lowerAggregationLevel 
       GROUP BY object_type, physical_server_name, server_instance_name, database_name
    
    INSERT INTO [sysutility_ucp_core].[space_utilization_internal] (
         aggregation_type, object_type, processing_time,
         virtual_server_name, volume_device_id, server_instance_name, database_name, [filegroup_name], dbfile_name, 
         total_space_bytes, allocated_space_bytes, used_space_bytes, available_space_bytes)
       SELECT @aggregation_type, object_type, @endTime,
              virtual_server_name, volume_device_id, server_instance_name, database_name, [filegroup_name], dbfile_name,
              -- Is AVG the right aggregate to use - should this instead be LAST()
              AVG(total_space_bytes), AVG(allocated_space_bytes), AVG(used_space_bytes), AVG(available_space_bytes)
       FROM [sysutility_ucp_core].[space_utilization_internal]
       WHERE (processing_time BETWEEN @startTime and @endTime) AND
             aggregation_type = @lowerAggregationLevel
       GROUP BY object_type, virtual_server_name, volume_device_id, server_instance_name, database_name, [filegroup_name], dbfile_name 
           
END
GO

GO
--SqlScripter----[sysutility_ucp_core].[sp_initialize_mdw_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_core].[sp_initialize_mdw_internal]') IS NULL EXEC('CREATE PROCEDURE [sysutility_ucp_core].[sp_initialize_mdw_internal] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [sysutility_ucp_core].[sp_initialize_mdw_internal]
AS
BEGIN
   IF (msdb.dbo.fn_sysutility_ucp_get_edition_is_ucp_capable_internal() = 1)
   BEGIN
      RAISERROR ('Instance is able to be used as a Utility Control Point.', 0, 1) WITH NOWAIT;
   END
   ELSE BEGIN
      DECLARE @edition nvarchar(128);
      SELECT @edition = CONVERT(nvarchar(128), SERVERPROPERTY('Edition'));
      RAISERROR(37004, -1, -1, @edition);
      RETURN(1);
   END;
   
   -- The Utility schema uses two Enterprise-only engine features: compression and partitioning.  
   -- Utility is an Enterprise-only feature, but we share instmdw.sql and the MDW database with other 
   -- features that are not Enterprise only.  Therefore we can't include the following things as part 
   -- of the CREATE TABLE statements because instmdw.sql would fail when run on a non-Enterprise SKU. 
   -- To work around this, we defer this part of the UCP schema creation until Create UCP is run. 
   IF (3 = CONVERT (int, SERVERPROPERTY('EngineEdition'))) -- Enterprise/Enterprise Eval/Developer/Data Center
   BEGIN
      -- Enable data compression on tables that benefit from it the most
      RAISERROR ('Enabling compression on MDW tables', 0, 1) WITH NOWAIT;
      ALTER TABLE [snapshots].[sysutility_ucp_smo_properties_internal] REBUILD WITH (DATA_COMPRESSION = PAGE);
      ALTER TABLE [sysutility_ucp_core].[smo_servers_internal] REBUILD WITH (DATA_COMPRESSION = PAGE);
      ALTER TABLE [sysutility_ucp_core].[databases_internal] REBUILD WITH (DATA_COMPRESSION = PAGE);
      ALTER TABLE [sysutility_ucp_core].[filegroups_internal] REBUILD WITH (DATA_COMPRESSION = PAGE);
      ALTER TABLE [sysutility_ucp_core].[datafiles_internal] REBUILD WITH (DATA_COMPRESSION = PAGE);
      ALTER TABLE [sysutility_ucp_core].[logfiles_internal] REBUILD WITH (DATA_COMPRESSION = PAGE);
      ALTER TABLE [sysutility_ucp_core].[cpu_utilization_internal] REBUILD WITH (DATA_COMPRESSION = PAGE);
      ALTER TABLE [sysutility_ucp_core].[space_utilization_internal] REBUILD WITH (DATA_COMPRESSION = PAGE);
     
      -- Partitioning (and compression) on measure tables

      -- Create a partitioning scheme based on aggregationType. In effect, we'd like
      -- each aggregation-level to get its own partition. Currently, we only support
      -- 3 aggregation levels.
      --
      -- FUTURE: It would be nice to support composite partitioning in the future. 
      --   1. We could further create a sub-partition for each object-type (computer etc.)
      --   2. If we could have sliding partitions, we could avoid deletes altogether, and 
      --      instead work with truncate/drop-partition style operations
      --
      IF NOT EXISTS (SELECT name FROM sys.partition_functions WHERE name = N'sysutility_ucp_aggregation_type_partition_function')
      BEGIN
         RAISERROR ('Creating partition function [sysutility_ucp_aggregation_type_partition_function]', 0, 1) WITH NOWAIT;
         -- Use dynamic SQL here (and in the next create stmt) b/c otherwise SQL will fail the creation of this 
         -- proc on Workgroup or Standard edition. 
         EXEC ('
            CREATE PARTITION FUNCTION [sysutility_ucp_aggregation_type_partition_function](TINYINT)
               AS RANGE LEFT 
               FOR VALUES(0, 1, 2)');
      END;

      IF NOT EXISTS (SELECT name FROM sys.partition_schemes WHERE name = N'sysutility_ucp_aggregation_type_partition_scheme')
      BEGIN
         RAISERROR ('Creating partition scheme [sysutility_ucp_aggregation_type_partition_scheme]', 0, 1) WITH NOWAIT;
         EXEC ('
            CREATE PARTITION SCHEME [sysutility_ucp_aggregation_type_partition_scheme] 
               AS PARTITION [sysutility_ucp_aggregation_type_partition_function] 
               ALL TO ([PRIMARY])');
      END;

      -- ALTER INDEX can't change partition scheme.  Instead we must drop and recreate the clustered PKs. 
      IF OBJECT_ID ('[sysutility_ucp_core].[pk_cpu_utilization_internal]') IS NOT NULL
      BEGIN
         RAISERROR ('Dropping primary key [sysutility_ucp_core].[cpu_utilization_internal].[pk_cpu_utilization_internal]', 0, 1) WITH NOWAIT;
         ALTER TABLE [sysutility_ucp_core].[cpu_utilization_internal] DROP CONSTRAINT [pk_cpu_utilization_internal]; 
      END;
      RAISERROR ('Creating partitioned primary key [sysutility_ucp_core].[cpu_utilization_internal].[pk_cpu_utilization_internal]', 0, 1) WITH NOWAIT;
      ALTER TABLE [sysutility_ucp_core].[cpu_utilization_internal] ADD 
         CONSTRAINT pk_cpu_utilization_internal 
            PRIMARY KEY CLUSTERED (aggregation_type, processing_time, object_type, physical_server_name, server_instance_name, database_name) 
            WITH (DATA_COMPRESSION = PAGE)
            ON [sysutility_ucp_aggregation_type_partition_scheme](aggregation_type);
      
      IF OBJECT_ID ('[sysutility_ucp_core].[pk_storage_utilization]') IS NOT NULL
      BEGIN
         RAISERROR ('Dropping primary key [sysutility_ucp_core].[space_utilization_internal].[pk_storage_utilization]', 0, 1) WITH NOWAIT;
         ALTER TABLE [sysutility_ucp_core].[space_utilization_internal] DROP CONSTRAINT [pk_storage_utilization]; 
      END;
      RAISERROR ('Creating partitioned primary key [sysutility_ucp_core].[space_utilization_internal].[pk_storage_utilization]', 0, 1) WITH NOWAIT;
      ALTER TABLE [sysutility_ucp_core].[space_utilization_internal] ADD 
         CONSTRAINT pk_storage_utilization 
            PRIMARY KEY CLUSTERED(
               aggregation_type,
               processing_time, 
               object_type, 
               virtual_server_name, 
               volume_device_id, 
               server_instance_name, 
               database_name, 
               [filegroup_name], 
               dbfile_name) 
            WITH (DATA_COMPRESSION = PAGE) 
            ON [sysutility_ucp_aggregation_type_partition_scheme](aggregation_type);
   END;
END;
GO

GO
--SqlScripter----[sysutility_ucp_core].[sp_purge_cache_tables].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_core].[sp_purge_cache_tables]') IS NULL EXEC('CREATE PROCEDURE [sysutility_ucp_core].[sp_purge_cache_tables] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [sysutility_ucp_core].[sp_purge_cache_tables]
AS
BEGIN
    DECLARE @rows_affected bigint;
    DECLARE @delete_batch_size varchar(30);

    SET @delete_batch_size = 500;
    SET @rows_affected = -1;

    DECLARE @days_to_retain_minute_data int;
    DECLARE @days_to_retain_hour_data int;
    DECLARE @days_to_retain_day_data int;

    SELECT @days_to_retain_minute_data = CONVERT (int,current_value) 
    FROM [msdb].[dbo].[sysutility_ucp_configuration_internal] 
    WHERE name = 'MdwRetentionLengthInDaysForMinutesHistory';

    SELECT @days_to_retain_hour_data = CONVERT (int,current_value) 
    FROM [msdb].[dbo].[sysutility_ucp_configuration_internal] 
    WHERE name = 'MdwRetentionLengthInDaysForHoursHistory';

    SELECT @days_to_retain_day_data = CONVERT (int,current_value) 
    FROM [msdb].[dbo].[sysutility_ucp_configuration_internal] 
    WHERE name = 'MdwRetentionLengthInDaysForDaysHistory';

    DECLARE @date_threshold_minute_data DATETIMEOFFSET(7) = DATEADD(day, -@days_to_retain_minute_data, SYSDATETIMEOFFSET());
    DECLARE @date_threshold_hour_data DATETIMEOFFSET(7) = DATEADD(day, -@days_to_retain_hour_data, SYSDATETIMEOFFSET());
    DECLARE @date_threshold_day_data DATETIMEOFFSET(7) = DATEADD(day, -@days_to_retain_day_data, SYSDATETIMEOFFSET());
       
    DECLARE @schema sysname
    DECLARE @name sysname
    DECLARE @query NVARCHAR(MAX)

    DECLARE dimensions_cursor CURSOR FOR
    SELECT object_schema, [object_name] 
    FROM sysutility_ucp_misc.utility_objects_internal
    WHERE utility_object_type = 'DIMENSION';

    -- Purge the dimension tables. 
    -- The number of rows that can be deleted from these tables can be very large.  If we deleted 
    -- all of these rows in a single delete statement, we would hold locks for an arbitrarily-long 
    -- time (and potentially escalate to table locks), causing long-duration blocking.  This could 
    -- also lead to transaction log growth, since log records after the oldest still-open transaction 
    -- can't be truncated.  To avoid these two problems, we delete rows in batches of 500 and loop 
    -- until we've deleted all rows that we no longer need. 
    OPEN dimensions_cursor;
    FETCH NEXT FROM dimensions_cursor INTO @schema, @name;
    WHILE (@@FETCH_STATUS <> -1)
    BEGIN
        SET @rows_affected = -1;
        WHILE (@rows_affected != 0)
        BEGIN
            -- We use dynamic SQL here because the table name is variable, but this also has the benefit of 
            -- providing the optimizer with the final value for @delete_batch_size and @date_threshold. 
            SET @query = 'DELETE TOP (' + @delete_batch_size + ') FROM ' + QUOTENAME(@schema) + '.' + QUOTENAME(@name) +
                         ' WHERE processing_time < @date_threshold';
            EXEC sp_executesql @query, N'@date_threshold datetimeoffset(7)', @date_threshold = @date_threshold_minute_data;
            SET @rows_affected = @@ROWCOUNT;
        END;

        FETCH NEXT FROM dimensions_cursor INTO @schema, @name;
    END;
    CLOSE dimensions_cursor;
    DEALLOCATE dimensions_cursor;

    DECLARE measures_cursor CURSOR FOR
    SELECT object_schema, [object_name] 
    FROM sysutility_ucp_misc.utility_objects_internal
    WHERE utility_object_type = 'MEASURE';

    -- Delete "per-minute" (15 minute) data from measure tables
    OPEN measures_cursor;
    FETCH NEXT FROM measures_cursor INTO @schema, @name;
    WHILE (@@FETCH_STATUS <> -1)
    BEGIN
        SET @rows_affected = -1;
        WHILE (@rows_affected != 0)
        BEGIN
            SET @query = 'DELETE TOP (' + @delete_batch_size + ') FROM ' + QUOTENAME(@schema) + '.' + QUOTENAME(@name) +
                         ' WHERE processing_time < @date_threshold AND aggregation_type = 0';
            EXEC sp_executesql @query, N'@date_threshold datetimeoffset(7)', @date_threshold = @date_threshold_minute_data;
            SET @rows_affected = @@ROWCOUNT;
        END;            
        
        FETCH NEXT FROM measures_cursor INTO @schema, @name;
    END;
    CLOSE measures_cursor;
    
    -- Delete "per-hour" data from our measure-tables 
    OPEN measures_cursor;
    FETCH NEXT FROM measures_cursor INTO @schema, @name;
    WHILE (@@FETCH_STATUS <> -1)
    BEGIN
        SET @rows_affected = -1;
        WHILE (@rows_affected != 0)
        BEGIN
            SET @query = 'DELETE TOP (' + @delete_batch_size + ') FROM ' + QUOTENAME(@schema) + '.' + QUOTENAME(@name) +
                         ' WHERE processing_time < @date_threshold AND aggregation_type = 1';
            EXEC sp_executesql @query, N'@date_threshold datetimeoffset(7)', @date_threshold = @date_threshold_hour_data;
            SET @rows_affected = @@ROWCOUNT;
        END;    
        
        FETCH NEXT FROM measures_cursor INTO @schema, @name;
    END;
    CLOSE measures_cursor;
    
    -- Delete "per-day" data from measure tables
    OPEN measures_cursor;
    FETCH NEXT FROM measures_cursor INTO @schema, @name;
    WHILE (@@FETCH_STATUS <> -1)
    BEGIN
        SET @rows_affected = -1;
        WHILE (@rows_affected != 0)
        BEGIN
            SET @query = 'DELETE TOP (' + @delete_batch_size + ') FROM ' + QUOTENAME(@schema) + '.' + QUOTENAME(@name) +
                         ' WHERE processing_time < @date_threshold AND aggregation_type = 2';
            EXEC sp_executesql @query, N'@date_threshold datetimeoffset(7)', @date_threshold = @date_threshold_day_data;
            SET @rows_affected = @@ROWCOUNT;
        END;
        
        FETCH NEXT FROM measures_cursor INTO @schema, @name;
    END;
    CLOSE measures_cursor;
    DEALLOCATE measures_cursor;
    
END;
GO

GO
--SqlScripter----[sysutility_ucp_staging].[sp_copy_live_table_data_into_cache_tables].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_staging].[sp_copy_live_table_data_into_cache_tables]') IS NULL EXEC('CREATE PROCEDURE [sysutility_ucp_staging].[sp_copy_live_table_data_into_cache_tables] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [sysutility_ucp_staging].[sp_copy_live_table_data_into_cache_tables]
AS
BEGIN
      SET NOCOUNT ON;
      -- Snapshot isolation prevents the nightly purge jobs that delete much older data from blocking us. 
      SET TRANSACTION ISOLATION LEVEL SNAPSHOT; 

      DECLARE @max_snapshot_id INT, @num_snapshots_partitions INT
      
      SELECT @max_snapshot_id = ISNULL(MAX(snapshot_id),0) FROM [core].[snapshots]
      SELECT @num_snapshots_partitions = COUNT(*) FROM [msdb].[dbo].[sysutility_ucp_snapshot_partitions_internal]
      DECLARE @task_start_time DATETIME = GETUTCDATE();
      DECLARE @task_elapsed_ms INT;
      DECLARE @row_count INT;
      
        -- Initialize the snapshot partitions to default (0)
        IF(@num_snapshots_partitions = 0)
        BEGIN
            INSERT INTO [msdb].[dbo].[sysutility_ucp_snapshot_partitions_internal] VALUES (2, 0)
            INSERT INTO [msdb].[dbo].[sysutility_ucp_snapshot_partitions_internal] VALUES (1, 0)
            INSERT INTO [msdb].[dbo].[sysutility_ucp_snapshot_partitions_internal] VALUES (0, 0)
        END   
                
        DECLARE @processing_time_current DATETIMEOFFSET(7) = SYSDATETIMEOFFSET();

         --
         -- Stage 0:
         --  Identify the batches that were recently uploaded and are consistent 
         --  Data belonging to these batches will be copied from live to cache table.	  
         EXEC [sysutility_ucp_staging].[sp_get_consistent_batches]
         SET @task_elapsed_ms = DATEDIFF (ms, @task_start_time, GETUTCDATE());
         RAISERROR ('sp_get_consistent_batches: %d ms', 0, 1, @task_elapsed_ms);
         SET @task_start_time = GETUTCDATE();

         ----- 
         ----- Stage 1: Insert into all the dimension tables 
         -----          computers_internal, dacs_internal, volumes_internal,
         -----          smo_servers_internal, databases_internal, filegroups_internal, 
         -----          datafiles_internal, logfiles_internal
         -----   (Then move to Stage 2: the "measure" tables)
         -----

         -- A note about the expression used for [batch_time] in the INSERT queries, below: 
         -- 
         -- We want to expose batch_time w/a UCP-local time zone so it can be exposed as a UCP-local datetime 
         -- in the GUI (the GUI consumes directly from the enumerator).  The batch_time values in each of the 
         -- queries below have their time zone offset switched to produce a datetimeoffset with the local UCP 
         -- server's time zone offset.  
         -- 
         -- This works well except when the server's time zone offset has changed since the [batch_time] was 
         -- generated due to a Daylight Saving Time change.  (Unfortunately, there is no way in T-SQL to 
         -- determine what the server's time zone offset was at some arbitrary point in the past.)  The risk 
         -- of this is low since we generally do this processing within 15 minutes of timestamp generation.  
         -- This doesn't actually result in truly incorrect batch_times that would affect data processing 
         -- since the UTC time value that underlies every datetimeoffset is unchanged when you switch the 
         -- value's time zone offset. 
         
         --
         -- Insert into the "computers" dimension table
         --
         INSERT INTO [sysutility_ucp_core].[computers_internal] (
               virtual_server_name, 
               is_clustered_server,
               physical_server_name,
               num_processors, 
               cpu_name, cpu_caption, cpu_family, cpu_architecture, cpu_max_clock_speed, cpu_clock_speed, 
               l2_cache_size, l3_cache_size,
               percent_total_cpu_utilization,
               batch_time, processing_time,
               urn, powershell_path)
            SELECT virtual_server_name, is_clustered_server, physical_server_name, 
                   num_processors, 
                   cpu_name, cpu_caption, cpu_family, cpu_architecture, cpu_max_clock_speed, cpu_clock_speed,
                   l2_cache_size, l3_cache_size, 
                   server_processor_usage,
                   SWITCHOFFSET (batch_time, DATENAME(TZoffset, SYSDATETIMEOFFSET())) AS batch_time, 
                   @processing_time_current AS processing_time, 
                   urn, powershell_path
            FROM [sysutility_ucp_staging].[latest_computer_cpu_memory_configuration]
          SET @row_count = @@ROWCOUNT;
          SET @task_elapsed_ms = DATEDIFF (ms, @task_start_time, GETUTCDATE());
          RAISERROR ('Insert into [computers_internal]: %d rows, %d ms', 0, 1, @row_count, @task_elapsed_ms);
          SET @task_start_time = GETUTCDATE();
           
          --
          -- Insert into the "dacs_internal" dimension-table
          --
          INSERT INTO [sysutility_ucp_core].[dacs_internal] (
                 server_instance_name, dac_name, 
                 physical_server_name, dac_deploy_date, dac_description,
                 dac_percent_total_cpu_utilization, 
                 batch_time, processing_time,
                 urn, powershell_path)
           SELECT server_instance_name, dac_name,
                  physical_server_name, dac_deploy_date, dac_description,
                  latest_cpu_pct, 
                  SWITCHOFFSET (batch_time, DATENAME(TZoffset, SYSDATETIMEOFFSET())) AS batch_time, 
                  @processing_time_current AS processing_time, 
                  urn, powershell_path
           FROM [sysutility_ucp_staging].[latest_dac_cpu_utilization] 
          SET @row_count = @@ROWCOUNT;
          SET @task_elapsed_ms = DATEDIFF (ms, @task_start_time, GETUTCDATE());
          RAISERROR ('Insert into [dacs_internal]: %d rows, %d ms', 0, 1, @row_count, @task_elapsed_ms);
          SET @task_start_time = GETUTCDATE();
           
         --- Insert into the volumes_internal dimension table  
         INSERT INTO [sysutility_ucp_core].[volumes_internal] (
                virtual_server_name, physical_server_name, volume_device_id, volume_name,
                total_space_available, free_space, powershell_path,
                batch_time, processing_time)
           SELECT virtual_server_name, physical_server_name, volume_device_id, volume_name,
                  total_space_available, free_space, powershell_path,
                  SWITCHOFFSET (batch_time, DATENAME(TZoffset, SYSDATETIMEOFFSET())) AS batch_time, 
                  @processing_time_current AS processing_time
           FROM [sysutility_ucp_staging].[latest_volumes]
         SET @row_count = @@ROWCOUNT;
         SET @task_elapsed_ms = DATEDIFF (ms, @task_start_time, GETUTCDATE());
         RAISERROR ('Insert into [volumes_internal]: %d rows, %d ms', 0, 1, @row_count, @task_elapsed_ms);
         SET @task_start_time = GETUTCDATE();
           
         INSERT INTO [sysutility_ucp_core].[smo_servers_internal]
         (
            [urn]  
            , [powershell_path]
            , [processing_time] 
            , [batch_time]
            , [AuditLevel]  
            , [BackupDirectory]  
            , [BrowserServiceAccount]  
            , [BrowserStartMode]  
            , [BuildClrVersionString]  
            , [BuildNumber]  
            , [Collation]  
            , [CollationID]  
            , [ComparisonStyle]  
            , [ComputerNamePhysicalNetBIOS]  
            , [DefaultFile]  
            , [DefaultLog]  
            , [Edition]  
            , [EngineEdition]  
            , [ErrorLogPath]  
            , [FilestreamShareName]  
            , [InstallDataDirectory]  
            , [InstallSharedDirectory]  
            , [InstanceName]  
            , [IsCaseSensitive]  
            , [IsClustered]  
            , [IsFullTextInstalled]  
            , [IsSingleUser]  
            , [Language]  
            , [MailProfile]  
            , [MasterDBLogPath]  
            , [MasterDBPath]  
            , [MaxPrecision]  
            , [Name]  
            , [NamedPipesEnabled]  
            , [NetName]  
            , [NumberOfLogFiles]  
            , [OSVersion]  
            , [PerfMonMode]  
            , [PhysicalMemory]  
            , [Platform]  
            , [Processors]  
            , [ProcessorUsage]  
            , [Product]  
            , [ProductLevel]  
            , [ResourceVersionString]  
            , [RootDirectory]  
            , [ServerType]  
            , [ServiceAccount]  
            , [ServiceInstanceId]  
            , [ServiceName]  
            , [ServiceStartMode]  
            , [SqlCharSet]  
            , [SqlCharSetName]  
            , [SqlDomainGroup]  
            , [SqlSortOrder]  
            , [SqlSortOrderName]  
            , [Status]  
            , [TapeLoadWaitTime]  
            , [TcpEnabled]  
            , [VersionMajor]  
            , [VersionMinor]  
            , [VersionString]  
        )

        SELECT  urn
              , CONVERT(NVARCHAR(MAX), [powershell_path]) AS [powershell_path]
                , @processing_time_current AS [processing_time]  -- $FIXED: SQLBUVSTS-316258
                , SWITCHOFFSET (batch_time, DATENAME(TZoffset, SYSDATETIMEOFFSET())) AS [batch_time]  
                , CONVERT(SMALLINT,[AuditLevel]) AS [AuditLevel]
                , CONVERT(NVARCHAR(260) ,[BackupDirectory]) AS [BackupDirectory]
                , CONVERT(NVARCHAR(128) ,[BrowserServiceAccount]) AS [BrowserServiceAccount]
                , CONVERT(SMALLINT,[BrowserStartMode]) AS [BrowserStartMode]
                , CONVERT(NVARCHAR(20) ,[BuildClrVersionString]) AS [BuildClrVersionString]
                , CONVERT(INT,[BuildNumber]) AS [BuildNumber]
                , CONVERT(NVARCHAR(128),[Collation]) AS [Collation]
                , CONVERT(INT,[CollationID]) AS [CollationID]
                , CONVERT(INT,[ComparisonStyle]) AS [ComparisonStyle]
                , CONVERT(NVARCHAR(128),[ComputerNamePhysicalNetBIOS]) AS [ComputerNamePhysicalNetBIOS]
                , CONVERT(NVARCHAR(260),[DefaultFile]) AS [DefaultFile]
                , CONVERT(NVARCHAR(260),[DefaultLog]) AS [DefaultLog]
                , CONVERT(NVARCHAR(64),[Edition]) AS [Edition]
                , CONVERT(SMALLINT,[EngineEdition]) AS [EngineEdition]
                , CONVERT(NVARCHAR(260) ,[ErrorLogPath]) AS [ErrorLogPath]
                , CONVERT(NVARCHAR(260) ,[FilestreamShareName]) AS [FilestreamShareName]
                , CONVERT(NVARCHAR(260) ,[InstallDataDirectory]) AS [InstallDataDirectory]
                , CONVERT(NVARCHAR(260) ,[InstallSharedDirectory]) AS [InstallSharedDirectory]
                , CONVERT(NVARCHAR(128) ,[InstanceName]) AS [InstanceName]
                , CONVERT(BIT,[IsCaseSensitive]) AS [IsCaseSensitive]
                , CONVERT(BIT,[IsClustered]) AS [IsClustered]
                , CONVERT(BIT,[IsFullTextInstalled]) AS [IsFullTextInstalled]
                , CONVERT(BIT,[IsSingleUser]) AS [IsSingleUser]
                , CONVERT(NVARCHAR(64) ,[Language]) AS [Language]
                , CONVERT(NVARCHAR(128),[MailProfile]) AS [MailProfile]
                , CONVERT(NVARCHAR(260),[MasterDBLogPath]) AS [MasterDBLogPath]
                , CONVERT(NVARCHAR(260),[MasterDBPath]) AS [MasterDBPath]
                , CONVERT(TINYINT,[MaxPrecision]) AS [MaxPrecision]
                , CONVERT(NVARCHAR(128) ,[Name]) AS [Name]
                , CONVERT(BIT,[NamedPipesEnabled]) AS [NamedPipesEnabled]
                , CONVERT(NVARCHAR(128) ,[NetName]) AS [NetName]
                , CONVERT(INT,[NumberOfLogFiles]) AS [NumberOfLogFiles]
                , CONVERT(NVARCHAR(32) ,[OSVersion]) AS [OSVersion]
                , CONVERT(SMALLINT,[PerfMonMode]) AS [PerfMonMode]
                , CONVERT(INT,[PhysicalMemory]) AS [PhysicalMemory]
                , CONVERT(NVARCHAR(32) ,[Platform]) AS [Platform]
                , CONVERT(SMALLINT,[Processors]) AS [Processors]
                , CONVERT(INT,[ProcessorUsage]) AS [ProcessorUsage]
                , CONVERT(NVARCHAR(48) ,[Product]) AS [Product]
                , CONVERT(NVARCHAR(32) ,[ProductLevel]) AS [ProductLevel]
                , CONVERT(NVARCHAR(32) ,[ResourceVersionString]) AS [ResourceVersionString]
                , CONVERT(NVARCHAR(260) ,[RootDirectory]) AS [RootDirectory]
                , CONVERT(SMALLINT,[ServerType]) AS [ServerType]
                , CONVERT(NVARCHAR(128),[ServiceAccount]) AS [ServiceAccount]
                , CONVERT(NVARCHAR(64),[ServiceInstanceId]) AS [ServiceInstanceId]
                , CONVERT(NVARCHAR(64),[ServiceName]) AS [ServiceName]
                , CONVERT(SMALLINT,[ServiceStartMode]) AS [ServiceStartMode]
                , CONVERT(SMALLINT,[SqlCharSet]) AS [SqlCharSet]
                , CONVERT(NVARCHAR(32),[SqlCharSetName]) AS [SqlCharSetName]
                , CONVERT(NVARCHAR(128),[SqlDomainGroup]) AS [SqlDomainGroup]
                , CONVERT(SMALLINT,[SqlSortOrder]) AS [SqlSortOrder]
                , CONVERT(NVARCHAR(64),[SqlSortOrderName]) AS [SqlSortOrderName]
                , CONVERT(SMALLINT,[Status]) AS [Status]
                , CONVERT(INT,[TapeLoadWaitTime]) AS [TapeLoadWaitTime]
                , CONVERT(BIT,[TcpEnabled]) AS [TcpEnabled]
                , CONVERT(INT,[VersionMajor]) AS [VersionMajor]
                , CONVERT(INT,[VersionMinor]) AS [VersionMinor]
                , CONVERT(NVARCHAR(32),[VersionString]) AS [VersionString]
                
                FROM 
                    (SELECT urn, property_name, property_value, batch_time 
                    FROM [sysutility_ucp_staging].[latest_smo_properties]
                    WHERE object_type = 1) props     -- object_type = 1 is Server
                PIVOT
                (
                    MAX(property_value)
                    FOR property_name IN (    
                                   [powershell_path]
                                 , [AuditLevel]
                            , [BackupDirectory]
                            , [BrowserServiceAccount]
                            , [BrowserStartMode]
                            , [BuildClrVersionString]
                            , [BuildNumber]
                            , [Collation]
                            , [CollationID]
                            , [ComparisonStyle]
                            , [ComputerNamePhysicalNetBIOS]
                            , [DefaultFile]
                            , [DefaultLog]
                            , [Edition]
                            , [EngineEdition]
                            , [ErrorLogPath]
                            , [FilestreamShareName]
                            , [InstallDataDirectory]
                            , [InstallSharedDirectory]
                            , [InstanceName]
                            , [IsCaseSensitive]
                            , [IsClustered]
                            , [IsFullTextInstalled]
                            , [IsSingleUser]
                            , [Language]
                            , [MailProfile]
                            , [MasterDBLogPath]
                            , [MasterDBPath]
                            , [MaxPrecision]
                            , [Name]
                            , [NamedPipesEnabled]
                            , [NetName]
                            , [NumberOfLogFiles]
                            , [OSVersion]
                            , [PerfMonMode]
                            , [PhysicalMemory]
                            , [Platform]
                            , [Processors]
                            , [ProcessorUsage]
                            , [Product]
                            , [ProductLevel]
                            , [ResourceVersionString]
                            , [RootDirectory]
                            , [ServerType]
                            , [ServiceAccount]
                            , [ServiceInstanceId]
                            , [ServiceName]
                            , [ServiceStartMode]
                            , [SqlCharSet]
                            , [SqlCharSetName]
                            , [SqlDomainGroup]
                            , [SqlSortOrder]
                            , [SqlSortOrderName]
                            , [Status]
                            , [TapeLoadWaitTime]
                            , [TcpEnabled]
                            , [VersionMajor]
                            , [VersionMinor]
                            , [VersionString] )
                ) AS pvt         
         SET @row_count = @@ROWCOUNT;
         SET @task_elapsed_ms = DATEDIFF (ms, @task_start_time, GETUTCDATE());
         RAISERROR ('Insert into [smo_servers_internal]: %d rows, %d ms', 0, 1, @row_count, @task_elapsed_ms);
         SET @task_start_time = GETUTCDATE();
                  
         INSERT INTO [sysutility_ucp_core].[databases_internal]
                ([urn]
                , [powershell_path]
                , [processing_time]
                , [batch_time]
                , [server_instance_name]
                , [parent_urn]
                , [Collation]
                , [CompatibilityLevel]
                , [CreateDate]
                , [EncryptionEnabled]
                , [Name]
                , [RecoveryModel]
                , [Trustworthy]
                , [state])
            SELECT  [urn]
                  , CONVERT(NVARCHAR(MAX), [powershell_path]) AS [powershell_path]
                    , @processing_time_current AS processing_time  -- $FIXED: SQLBUVSTS-316258
                    , SWITCHOFFSET ([batch_time], DATENAME(TZoffset, SYSDATETIMEOFFSET())) AS [batch_time] 
                    , [server_instance_name]
                    , Left(urn, CHARINDEX('/Database[', urn, 1)-1) AS parent_urn
                    , CONVERT(NVARCHAR(128),[Collation]) AS Collation
                    , CONVERT(SMALLINT,[CompatibilityLevel]) AS CompatibilityLevel
                    -- DC (SSIS) doesn't support sql_variant, so all properties are uploaded as nvarchar(4000).  To successfully round-trip 
                    -- the property values through nvarchar, we use the same language-independent conversion style on MI and UCP. The shared 
                    -- fn_sysutility_get_culture_invariant_conversion_style_internal function gives us a consistent conversion style for each 
                    -- property data type that is language-independent and that won't cause data loss.  We also use this function on the MI 
                    -- when converting to nvarchar so that the two conversions are symmetrical.  (Ref: VSTS 361531, 359504, 12967)
                    , CONVERT(DATETIME, [CreateDate], msdb.dbo.fn_sysutility_get_culture_invariant_conversion_style_internal('datetime')) AS CreateDate
                    , CONVERT(BIT,[EncryptionEnabled]) AS EncryptionEnabled
                    , CONVERT(SYSNAME,[Name])AS [Name]
                    , CONVERT(SMALLINT,[RecoveryModel]) AS RecoveryModel
                    , CONVERT(BIT,[Trustworthy]) AS Trustworthy
                    -- Default to 0 (available) state. We'll update this to 1 (not available) for emergency/offline/etc databases later (we 
                    -- need to examine file and filegroup properties to infer whether a database should be available or not available). 
                    , 0 AS state
             FROM 
             (SELECT urn, server_instance_name, property_name, property_value, batch_time 
             FROM [sysutility_ucp_staging].[latest_smo_properties]
             WHERE object_type = 2) props -- object_type = 1 is Database
                PIVOT
                (
                    MAX(property_value)
                    FOR property_name IN ( 
                                       [powershell_path]
                                      , [ID]
                                      , [Collation]
                                            , [CompatibilityLevel]
                                            , [CreateDate]
                                            , [EncryptionEnabled]
                                            , [Name]
                                            , [RecoveryModel]
                                            , [Trustworthy] )
                ) AS pvt    
         SET @row_count = @@ROWCOUNT;
         SET @task_elapsed_ms = DATEDIFF (ms, @task_start_time, GETUTCDATE());
         RAISERROR ('Insert into [databases_internal]: %d rows, %d ms', 0, 1, @row_count, @task_elapsed_ms);
         SET @task_start_time = GETUTCDATE();
         
         
         INSERT INTO [sysutility_ucp_core].[filegroups_internal]
                ([urn]
                , [powershell_path]
                , [processing_time]
                , [batch_time]
                , [server_instance_name]
                , [database_name]
                , [parent_urn]
                , [Name])
            SELECT  [urn]
                  , CONVERT(NVARCHAR(MAX), [powershell_path]) AS [powershell_path]
                    , @processing_time_current AS processing_time  -- $FIXED: SQLBUVSTS-316258
                    , SWITCHOFFSET ([batch_time], DATENAME(TZoffset, SYSDATETIMEOFFSET())) AS [batch_time] 
                    , [server_instance_name]
                    , CONVERT(SYSNAME,[parent_name]) AS [database_name]
                    , Left(urn, CHARINDEX('/FileGroup[', urn, 1)-1) AS parent_urn
                    , CONVERT(SYSNAME,[Name]) AS Name
             FROM 
             (SELECT urn, server_instance_name, property_name, property_value, batch_time 
             FROM [sysutility_ucp_staging].[latest_smo_properties]
             WHERE object_type = 4) props -- object_type = 4 is FileGroup
                PIVOT
                (
                    MAX(property_value)
                    FOR property_name IN ( 
                                        [powershell_path]
                                      , [parent_name]
                                      , [ID]
                                            , [Name])
                ) AS pvt    
         SET @row_count = @@ROWCOUNT;
         SET @task_elapsed_ms = DATEDIFF (ms, @task_start_time, GETUTCDATE());
         RAISERROR ('Insert into [filegroups_internal]: %d rows, %d ms', 0, 1, @row_count, @task_elapsed_ms);
         SET @task_start_time = GETUTCDATE();
         
                  
         
         INSERT INTO [sysutility_ucp_core].[datafiles_internal]
                ([urn]
                , [powershell_path]
                , [processing_time]
                , [batch_time]
                , [server_instance_name]
                , [database_name]
                , [filegroup_name]
                , [parent_urn]
                , [Growth]
                , [GrowthType]
                , [MaxSize]
                , [Name]
                , [Size]
                , [UsedSpace]
                , [FileName]
                , [VolumeFreeSpace]
                , [volume_name]
                , [volume_device_id]
                , [physical_server_name])
            SELECT  [urn]
                  , CONVERT(NVARCHAR(MAX), pvt.[powershell_path]) AS [powershell_path]
                    , @processing_time_current AS processing_time  -- $FIXED: SQLBUVSTS-316258
                    , SWITCHOFFSET (pvt.[batch_time], DATENAME(TZoffset, SYSDATETIMEOFFSET())) AS [batch_time] 
                    , pvt.[server_instance_name]
                    , CONVERT(SYSNAME,[grandparent_name]) AS [database_name]
                    , CONVERT(SYSNAME,[parent_name]) AS [filegroup_name]
                    , Left(urn, CHARINDEX('/File[', urn, 1)-1) AS parent_urn
                    , CONVERT(REAL,[Growth]) AS Growth
                    , CONVERT(SMALLINT,[GrowthType]) AS GrowthType
                    , CONVERT(REAL,[MaxSize]) AS MaxSize
                    , CONVERT(SYSNAME,[Name]) AS Name
                    , CONVERT(REAL,[Size]) AS Size
                    , CONVERT(REAL,[UsedSpace]) AS UsedSpace
                    , CONVERT(NVARCHAR(260),[FileName]) AS FileName
                    , ISNULL(v.free_space, 0.0) * 1024 AS VolumeFreeSpace -- volumes_internal.free_space is MB, and VolumeFreeSpace is expected to be KB.
                    , ISNULL(v.volume_name, N'') AS volume_name
                    , v.[volume_device_id] AS [volume_device_id]
                    , pvt.[physical_server_name]
             FROM 
             (SELECT urn, physical_server_name, server_instance_name, property_name, property_value, batch_time 
             FROM [sysutility_ucp_staging].[latest_smo_properties]
             WHERE object_type = 5) props -- object_type = 5 is DataFile
                PIVOT
                (
                    MAX(property_value)
                    FOR property_name IN ( 
                                        [powershell_path]
                                      , [parent_name]
                                      , [grandparent_name]
                                      , [ID]
                                      , [Growth]
                                      , [GrowthType]
                                      , [MaxSize]
                                      , [Name]
                                      , [Size]
                                      , [UsedSpace]
                                      , [FileName] 
                                      , [volume_device_id])
                ) AS pvt
            LEFT OUTER JOIN
            [sysutility_ucp_core].[volumes_internal] v
            ON 
            v.physical_server_name = pvt.physical_server_name AND
            CONVERT(SYSNAME, pvt.[volume_device_id]) = v.volume_device_id
            WHERE v.processing_time = @processing_time_current
         SET @row_count = @@ROWCOUNT;
         SET @task_elapsed_ms = DATEDIFF (ms, @task_start_time, GETUTCDATE());
         RAISERROR ('Insert into [datafiles_internal]: %d rows, %d ms', 0, 1, @row_count, @task_elapsed_ms);
         SET @task_start_time = GETUTCDATE();
                             

         INSERT INTO [sysutility_ucp_core].[logfiles_internal]
                ([urn]
                , [powershell_path]
                , [processing_time]
                , [batch_time]
                , [server_instance_name]
                , [database_name]
                , [parent_urn]
                , [Growth]
                , [GrowthType]
                , [MaxSize]
                , [Name]
                , [Size]
                , [UsedSpace]
                , [FileName]
                , [VolumeFreeSpace]
                , [volume_name]
                , [volume_device_id]
                , [physical_server_name])
            SELECT[urn]
                  , CONVERT(NVARCHAR(MAX), pvt.[powershell_path]) AS [powershell_path]
                    , @processing_time_current AS processing_time  -- $FIXED: SQLBUVSTS-316258
                    , SWITCHOFFSET (pvt.[batch_time], DATENAME(TZoffset, SYSDATETIMEOFFSET())) AS [batch_time] 
                    , pvt.[server_instance_name]
                    , CONVERT(SYSNAME,[parent_name]) AS [database_name]
                    , Left(urn, CHARINDEX('/LogFile[', urn, 1)-1) AS parent_urn
                    , CONVERT(REAL,[Growth]) AS Growth
                    , CONVERT(SMALLINT,[GrowthType]) AS GrowthType
                    , CONVERT(REAL,[MaxSize]) AS MaxSize
                    , CONVERT(SYSNAME,[Name]) AS Name
                    , CONVERT(REAL,[Size]) AS Size
                    --- The collection data may not contain the UsedSpace property of the log file of a database in EMERGENCY state. 
                    , ISNULL(CONVERT(REAL,[UsedSpace]), 0.0) AS UsedSpace
                    , CONVERT(NVARCHAR(260),[FileName]) AS FileName
                    , ISNULL(v.free_space, 0.0) * 1024 AS VolumeFreeSpace -- volumes_internal.free_space is MB, and VolumeFreeSpace is expected to be KB.
                    , ISNULL(v.volume_name, N'') AS volume_name
                    , v.[volume_device_id] AS [volume_device_id]
                    , pvt.[physical_server_name]
             FROM 
             (SELECT urn, physical_server_name, server_instance_name, property_name, property_value, batch_time 
             FROM [sysutility_ucp_staging].[latest_smo_properties] 
             WHERE object_type = 3) props -- object_type = 3 is LogFile
                PIVOT
                (
                    MAX(property_value)
                    FOR property_name IN ( 
                                       [powershell_path]
                                      , [parent_name]
                                      , [ID]
                                      , [Growth]
                                      , [GrowthType]
                                      , [MaxSize]
                                      , [Name]
                                      , [Size]
                                      , [UsedSpace]
                                      , [FileName] 
                                      , [volume_device_id])
                ) AS pvt  
            LEFT OUTER JOIN
            [sysutility_ucp_core].[volumes_internal] v
            ON 
            v.physical_server_name = pvt.physical_server_name AND
            CONVERT(SYSNAME, pvt.[volume_device_id]) = v.volume_device_id
            WHERE v.processing_time = @processing_time_current
         SET @row_count = @@ROWCOUNT;
         SET @task_elapsed_ms = DATEDIFF (ms, @task_start_time, GETUTCDATE());
         RAISERROR ('Insert into [logfiles_internal]: %d rows, %d ms', 0, 1, @row_count, @task_elapsed_ms);
         SET @task_start_time = GETUTCDATE();
         
         -- Identify all of the databases for which we do not have all file/filegroup details because of the current 
         -- database status (db is offline, recovering, emergency mode, etc).  Update the state for these databases 
         -- to 1 ("not available"). 
         UPDATE sysutility_ucp_core.databases_internal 
         SET state = 1 
         FROM sysutility_ucp_core.databases_internal AS db
         WHERE 
             -- Case #1: Emergency mode databases are considered 'not available' -- the database is not recovered, and 
             -- we can't get correct log file metadata.  We detect this by looking for databases with a log file that 
             -- has a size of 0, which is impossible in an available database. 
            EXISTS (
                SELECT * 
                FROM sysutility_ucp_core.logfiles_internal AS lf
                WHERE lf.server_instance_name = db.server_instance_name 
                    AND lf.database_name = db.Name
                    AND lf.Size = 0
                    AND lf.processing_time = @processing_time_current)
            -- Case #2: When a database is in other "not available" states (like recovering, offline, suspect), we 
            -- cannot retrieve filegroup or file-level metadata.  We detect this case by looking for databases that seem 
            -- to have no filegroups, which is an impossible state for an online & available database. 
            OR NOT EXISTS (
                SELECT * 
                FROM sysutility_ucp_core.filegroups_internal AS fg
                WHERE fg.server_instance_name = db.server_instance_name 
                    AND fg.database_name = db.Name
                    AND fg.processing_time = @processing_time_current);
         SET @row_count = @@ROWCOUNT;
         SET @task_elapsed_ms = DATEDIFF (ms, @task_start_time, GETUTCDATE());
         RAISERROR ('Discover unavailable databases: %d rows, %d ms', 0, 1, @row_count, @task_elapsed_ms);
         SET @task_start_time = GETUTCDATE();
         
         
         ----- 
         ----- Stage 2: Insert into all the measure tables
         -----          cpu_utilization_internal (computers, instances, dacs)
         -----          space_utilization_internal (volumes, instances, databases, filegroups, datafiles, logfiles)
         ----- 
         ----- 
         INSERT INTO [sysutility_ucp_core].[cpu_utilization_internal](
              aggregation_type, object_type, processing_time,
              physical_server_name, server_instance_name, database_name,
              percent_total_cpu_utilization)
            SELECT 0,   -- No aggregation
                   1,   -- Computer Object
                   @processing_time_current,
                   physical_server_name,
                   N'', 
                   N'',
                   percent_total_cpu_utilization
            FROM [sysutility_ucp_core].[computers_internal]
            WHERE processing_time = @processing_time_current
              UNION ALL
            SELECT 0,   -- No aggregation
                   3,   -- Instance object
                   @processing_time_current, 
                   N'', 
                   server_instance_name,
                   N'',
                   instance_processor_usage
            FROM [sysutility_ucp_staging].[latest_instance_cpu_utilization]
              UNION ALL
            SELECT 0,   -- No aggregation
                   4,   -- Database/DAC object
                   @processing_time_current,
                   N'',   -- computer_name
                   server_instance_name,
                   dac_name,
                   dac_percent_total_cpu_utilization
            FROM [sysutility_ucp_core].[dacs_internal]
            WHERE processing_time = @processing_time_current
         SET @row_count = @@ROWCOUNT;
         SET @task_elapsed_ms = DATEDIFF (ms, @task_start_time, GETUTCDATE());
         RAISERROR ('Insert into [cpu_utilization_internal]: %d rows, %d ms', 0, 1, @row_count, @task_elapsed_ms);
         SET @task_start_time = GETUTCDATE();
            
         INSERT INTO [sysutility_ucp_core].[space_utilization_internal] (
               aggregation_type, object_type, processing_time,
               virtual_server_name, volume_device_id, 
               server_instance_name, database_name, [filegroup_name], dbfile_name,
               total_space_bytes, allocated_space_bytes, used_space_bytes, available_space_bytes)
            SELECT 0 AS aggregation_type,
                   CASE WHEN group_id = 0 AND [filegroup_name] = N'' THEN 7 -- logfile
                        WHEN group_id = 0 THEN 6 -- datafile
                        WHEN group_id = 1 THEN 5 -- filegroup
                        WHEN group_id = 3 THEN 4 -- database
                        WHEN group_id = 7 THEN 3 -- instance
                        ELSE NULL -- should never get here 
                   END as [object_type], 
                   @processing_time_current AS processing_time,
                   N'' as virtual_server_name, 
                   N'' as volume_device_id, 
                   ISNULL(server_instance_name, N''), -- shouldn't ever get to be null 
                   ISNULL(database_name, N''), 
                   ISNULL([filegroup_name], N''), 
                   ISNULL([dbfile_name], N''),
                   CASE WHEN group_id = 0 THEN total_space_kb * 1024 ELSE NULL END, 
                   CASE WHEN group_id = 0 THEN allocated_space_kb * 1024 ELSE NULL END, 
                   used_space_kb * 1024, 
                   CASE WHEN group_id = 0 THEN available_space_kb * 1024 ELSE NULL END
            FROM (
                SELECT server_instance_name, database_name, [filegroup_name], dbfile_name,  
                       SUM(MaxSize) AS total_space_kb,  -- Is this right?
                       SUM([Size]) AS allocated_space_kb, 
                       SUM(UsedSpace) AS used_space_kb, 
                       SUM(available_space) AS available_space_kb,
                       GROUPING_ID(server_instance_name, database_name, [filegroup_name], dbfile_name) AS group_id
                FROM (SELECT server_instance_name, database_name, [filegroup_name], [Name] as dbfile_name, 
                             MaxSize, [Size], UsedSpace,
                             [sysutility_ucp_misc].[fn_get_max_size_available]([Size], [MaxSize], [Growth], [GrowthType], [VolumeFreeSpace]) AS available_space
                       FROM [sysutility_ucp_core].[datafiles_internal] 
                       WHERE processing_time = @processing_time_current
                     UNION ALL
                      SELECT server_instance_name, database_name, N'' AS [filegroup_name], 
                             [Name] AS dbfile_name, 
                             MaxSize, [Size], UsedSpace,
                             [sysutility_ucp_misc].[fn_get_max_size_available]([Size], [MaxSize], [Growth], [GrowthType], [VolumeFreeSpace]) AS available_space
                      FROM [sysutility_ucp_core].[logfiles_internal]
                      WHERE processing_time = @processing_time_current) as dbfiles
                GROUP BY GROUPING SETS((server_instance_name), 
                                       (server_instance_name, database_name),
                                       (server_instance_name, database_name, [filegroup_name]),
                                       (server_instance_name, database_name, [filegroup_name], [dbfile_name])
                                      )
                 ) AS instance_space_utilizations
            UNION ALL       
            SELECT 0 AS aggregation_type,
                   CASE WHEN GROUPING_ID(virtual_server_name, volume_device_id) = 3 THEN 0 -- utility 
                        WHEN GROUPING_ID(virtual_server_name, volume_device_id) = 1 THEN 1 -- computer 
                        WHEN GROUPING_ID(virtual_server_name, volume_device_id) = 0 THEN 2 -- volume
                        ELSE NULL  -- should never get here
                   END AS object_type,
                   @processing_time_current as processing_time,
                   ISNULL(virtual_server_name, N''), 
                   ISNULL(volume_device_id, N'') AS volume_device_id, 
                   N'' as server_instance_name, 
                   N'' as database_name, 
                   N'' as [filegroup_name], 
                   N'' as dbfile_name,
                   SUM(total_space_available)*1048576 AS total_space_bytes,
                   SUM(total_space_available)*1048576 AS allocated_space_bytes,
                   SUM(total_space_available - free_space)*1048576  AS used_space_bytes,
                   SUM(free_space)*1048576 AS available_space_bytes
            FROM [sysutility_ucp_core].[volumes_internal] 
            WHERE processing_time = @processing_time_current
            GROUP BY GROUPING SETS ((),
                                    (virtual_server_name),
                                    (virtual_server_name, volume_device_id)
                                   )
         SET @row_count = @@ROWCOUNT;
         SET @task_elapsed_ms = DATEDIFF (ms, @task_start_time, GETUTCDATE());
         RAISERROR ('Insert into [space_utilization_internal]: %d rows, %d ms', 0, 1, @row_count, @task_elapsed_ms);

        --         
        -- State changes
        --      
        UPDATE [msdb].[dbo].[sysutility_ucp_processing_state_internal] 
          SET latest_processing_time = @processing_time_current 

        -- Update the snapshot partitions table
        -- Push down the previous snapshot partition values and 
        -- store the current max snapshot in the latest (top) record           
        UPDATE [msdb].[dbo].[sysutility_ucp_snapshot_partitions_internal] SET latest_consistent_snapshot_id = (SELECT TOP 1 latest_consistent_snapshot_id FROM [msdb].[dbo].[sysutility_ucp_snapshot_partitions_internal] WHERE time_id = 1)  WHERE time_id = 2
        UPDATE [msdb].[dbo].[sysutility_ucp_snapshot_partitions_internal] SET latest_consistent_snapshot_id = (SELECT TOP 1 latest_consistent_snapshot_id FROM [msdb].[dbo].[sysutility_ucp_snapshot_partitions_internal] WHERE time_id = 0)  WHERE time_id = 1
        UPDATE [msdb].[dbo].[sysutility_ucp_snapshot_partitions_internal] SET latest_consistent_snapshot_id = @max_snapshot_id WHERE time_id = 0

        -- As we have inserted chunk of data in the cache tables, the stats on these tables
        -- get stale there by leading to performance degradation of the health state queries
        -- Force update the stats on these tables so that the QO is able to generate a more 
        -- realisitc query execution plan
        SET @task_start_time = GETUTCDATE();
        UPDATE STATISTICS [msdb].[dbo].[sysutility_ucp_processing_state_internal];

        -- Update stats on all dimension and measure cache tables
        DECLARE @schema sysname
        DECLARE @name sysname
        DECLARE @query NVARCHAR(MAX)
 
        DECLARE cache_tables CURSOR FOR
        SELECT object_schema, [object_name]
        FROM sysutility_ucp_misc.utility_objects_internal
        WHERE utility_object_type IN ('DIMENSION', 'MEASURE');
 
        OPEN cache_tables;
        FETCH NEXT FROM cache_tables INTO @schema, @name;
        WHILE (@@FETCH_STATUS <> -1)
        BEGIN
            SET @query = 'UPDATE STATISTICS ' + QUOTENAME (@schema) + '.' + QUOTENAME (@name); 
            EXEC (@query);
            FETCH NEXT FROM cache_tables INTO @schema, @name;
        END;
        CLOSE cache_tables;
        DEALLOCATE cache_tables;
 
        SET @task_elapsed_ms = DATEDIFF (ms, @task_start_time, GETUTCDATE());
        RAISERROR ('Update statistics: %d ms', 0, 1, @task_elapsed_ms);
END
GO

GO
--SqlScripter----[sysutility_ucp_staging].[sp_get_consistent_batches].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_staging].[sp_get_consistent_batches]') IS NULL EXEC('CREATE PROCEDURE [sysutility_ucp_staging].[sp_get_consistent_batches] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [sysutility_ucp_staging].[sp_get_consistent_batches]
AS
BEGIN
    SET NOCOUNT ON;   

    -- Note: As we are not currently caching the aged-out data, this SP
    -- clears the existing records and inserts the new data. However, as a fix for 
    -- VSTS #319498 (display aged-out data) this behavior needs to be changed 
    -- to UPSERT for any existing or new data and delete the entries whose 
    -- data is purged (> 7 days). 

    -- Get the manifest information for the latest uploaded batches.  The "manifest" info includes 
    -- the expected number of rows that should have been uploaded into each live table for the 
    -- batch.  This query captures the manifest for most recent unprocessed batch (T) and the 
    -- immediately prior (T-1) unprocessed batch from each managed instance since the last execution 
    -- of the sp_copy_live_table_data_into_cache_tables stored proc. 
    -- 
    -- This rowset is staged in a temp table b/c the query optimizer cannot accurately predict the 
    -- number of rows that qualify for "WHERE bm.snapshot_id > sp.latest_consistent_snapshot_id". 
    -- 
    -- Note: This view may fetch the last 2 batch manifest rows for a given MI. The reason for 
    -- considering two batches is to use the latest one that is consistent. If the latest one is 
    -- missing (delayed upload) or inconsistent (failed or still-in-progress upload), we will use 
    -- the second-to-last batch, assuming that it is consistent. This makes the caching job 
    -- resilient to occasional delays in the MI upload job. 
    SELECT server_instance_name
        , batch_time
        , CONVERT(INT, dac_packages_row_count) AS dac_packages_row_count
        , CONVERT(INT, cpu_memory_configurations_row_count) AS cpu_memory_configurations_row_count
        , CONVERT(INT, volumes_row_count) AS volumes_row_count
        , CONVERT(INT, smo_properties_row_count) AS smo_properties_row_count        
    INTO #batch_manifests_latest
    FROM  (SELECT bm.server_instance_name, bm.batch_time, bm.parameter_name, bm.parameter_value 
           FROM snapshots.sysutility_ucp_batch_manifests_internal bm
              , msdb.dbo.sysutility_ucp_snapshot_partitions_internal AS sp
           WHERE bm.snapshot_id > sp.latest_consistent_snapshot_id 
             -- The [time_id] = 1 partition gives us the max snapshot_id the last time that the 
             -- sp_copy_live_table_data_into_cache_tables proc was executed (previous high water 
             -- mark).  We will consider for processing any snapshots that have been uploaded 
             -- since then. 
             AND sp.time_id = 1) AS lbm
    PIVOT (MAX(parameter_value) FOR parameter_name IN (dac_packages_row_count
                                                     , cpu_memory_configurations_row_count
                                                     , volumes_row_count
                                                     , smo_properties_row_count)) pvt;
    
    -- Truncate the table
    TRUNCATE TABLE [sysutility_ucp_staging].[consistent_batch_manifests_internal];
    
    -- Get the set of latest batches that are consistent with respect to the data uploaded to 
    -- each live table.  A check is made to verify that the number of rows uploaded matches the 
    -- expected row count in that batch's manifest. 
    -- 
    -- These rowsets are staged in temp tables b/c the query optimizer cannot accurately predict 
    -- the number of rows that qualify for "HAVING COUNT(*) = bm.cpu_memory_configurations_row_count". 

    SELECT bm.server_instance_name, bm.batch_time
    INTO #dac_statistics_consistent_batches
    FROM #batch_manifests_latest bm
    -- Note: No records in DAC table doesn't mean issue with upload -- a MI with no DACs is 
    -- perfectly valid; use an outer join so that we tolerate the no-DACs case.  
    LEFT JOIN [snapshots].[sysutility_ucp_dac_collected_execution_statistics_internal] ds 
        ON bm.server_instance_name = ds.server_instance_name AND bm.batch_time = ds.batch_time    
    GROUP BY bm.server_instance_name, bm.batch_time, bm.dac_packages_row_count, ds.batch_time    
    HAVING SUM(CASE WHEN ds.batch_time IS NULL THEN 0 ELSE 1 END) = bm.dac_packages_row_count

    SELECT bm.server_instance_name, bm.batch_time 
    INTO #cpu_memory_configurations_consistent_batches
    FROM #batch_manifests_latest bm
    INNER JOIN [snapshots].[sysutility_ucp_cpu_memory_configurations_internal] cm 
        ON bm.server_instance_name = cm.server_instance_name AND bm.batch_time = cm.batch_time   
    GROUP BY bm.server_instance_name, bm.batch_time, bm.cpu_memory_configurations_row_count
    HAVING COUNT(*) = bm.cpu_memory_configurations_row_count

    SELECT bm.server_instance_name, bm.batch_time 
    INTO #volumes_consistent_batches
    FROM #batch_manifests_latest bm
    INNER JOIN [snapshots].[sysutility_ucp_volumes_internal] vo 
        ON bm.server_instance_name = vo.server_instance_name AND bm.batch_time = vo.batch_time        
    GROUP BY bm.server_instance_name, bm.batch_time, bm.volumes_row_count
    HAVING COUNT(*) = bm.volumes_row_count

    SELECT bm.server_instance_name, bm.batch_time
    INTO #smo_properties_consistent_batches
    FROM #batch_manifests_latest bm
    INNER JOIN [snapshots].[sysutility_ucp_smo_properties_internal] sp 
        ON bm.server_instance_name = sp.server_instance_name AND bm.batch_time = sp.batch_time   
    GROUP BY bm.server_instance_name, bm.batch_time, bm.smo_properties_row_count
    HAVING COUNT(*) = bm.smo_properties_row_count


    -- Insert the new consistent batch information.  A consistent batch is a batch where all of 
    -- the live tables have the expected number of rows. 
    INSERT INTO [sysutility_ucp_staging].[consistent_batch_manifests_internal]
    SELECT bm.server_instance_name
        , bm.batch_time 
    FROM
    (
        -- Fetch the latest (order by DESC) consistent batches uploaded by the MI's
        SELECT ROW_NUMBER() OVER (PARTITION BY bm.server_instance_name ORDER BY bm.batch_time DESC) AS [rank]
            , bm.server_instance_name
            , bm.batch_time
        FROM #batch_manifests_latest AS bm
        INNER JOIN #dac_statistics_consistent_batches AS ds  
            ON bm.server_instance_name = ds.server_instance_name AND bm.batch_time = ds.batch_time    
        INNER JOIN #cpu_memory_configurations_consistent_batches AS cm  
            ON bm.server_instance_name = cm.server_instance_name AND bm.batch_time = cm.batch_time   
        INNER JOIN #volumes_consistent_batches AS vo 
            ON bm.server_instance_name = vo.server_instance_name AND bm.batch_time = vo.batch_time   
        INNER JOIN #smo_properties_consistent_batches AS sp 
            ON bm.server_instance_name = sp.server_instance_name AND bm.batch_time = sp.batch_time
    ) bm        
    WHERE bm.[rank] = 1;

END
GO
