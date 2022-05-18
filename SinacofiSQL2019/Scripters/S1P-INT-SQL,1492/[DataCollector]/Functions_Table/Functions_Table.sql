
GO
--SqlScripter----[core].[fn_query_text_from_handle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[core].[fn_query_text_from_handle]') IS NULL EXEC('CREATE FUNCTION [core].[fn_query_text_from_handle] () RETURNS @Ret TABLE (c1 int) AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN END')
GO
ALTER FUNCTION [core].[fn_query_text_from_handle]
(
    @handle varbinary(64), 
    @statement_start_offset int, 
    @statement_end_offset int)
RETURNS @query_text TABLE (database_id smallint, object_id int, encrypted bit, query_text nvarchar(max))
BEGIN
      IF @handle IS NOT NULL
      BEGIN
            DECLARE @start int, @end int
            DECLARE @dbid smallint, @objectid int, @encrypted bit
            DECLARE @batch nvarchar(max), @query nvarchar(max)

            -- statement_end_offset is zero prior to beginning query execution (e.g., compilation)
            SELECT 
                  @start = ISNULL(@statement_start_offset, 0), 
                  @end = CASE WHEN @statement_end_offset is null or @statement_end_offset = 0 THEN -1
                                    ELSE @statement_end_offset 
                              END
 
            SELECT @dbid = t.dbid, 
                  @objectid = t.objectid, 
                  @encrypted = t.encrypted, 
                  @batch = t.text 
            FROM sys.dm_exec_sql_text(@handle) AS t

            SELECT @query = CASE 
                        WHEN @encrypted = CAST(1 as bit) THEN N'encrypted text' 
                        ELSE LTRIM(SUBSTRING(@batch, @start / 2 + 1, ((CASE WHEN @end = -1 THEN DATALENGTH(@batch) 
                                          ELSE @end END) - @start) / 2))
                  end

            -- Found internal queries (e.g., CREATE INDEX) with end offset of original batch that is 
            -- greater than the length of the internal query and thus returns nothing if we don''t do this
            IF DATALENGTH(@query) = 0
            BEGIN
                  SELECT @query = @batch
            END

            INSERT INTO @query_text (database_id, object_id, encrypted, query_text) 
            VALUES (@dbid, @objectid, @encrypted, @query)
      END
      RETURN
END
GO

GO
--SqlScripter----[snapshots].[fn_get_notable_query_plans].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[fn_get_notable_query_plans]') IS NULL EXEC('CREATE FUNCTION [snapshots].[fn_get_notable_query_plans] () RETURNS @Ret TABLE (c1 int) AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN END')
GO
ALTER FUNCTION [snapshots].[fn_get_notable_query_plans]
(
    @source_id  int
)
RETURNS @notable_queries TABLE (sql_handle varbinary(64) , 
                                plan_handle varbinary(64), 
                                statement_start_offset int, 
                                statement_end_offset int,
                                creation_time datetime)
BEGIN
    INSERT INTO @notable_queries
    SELECT  [sql_handle], 
        [plan_handle],
        [statement_start_offset],
        [statement_end_offset],
            -- Convert datetimeoffset to datetime so that SSIS can easily join the output back 
            -- to the new sys.dm_exec_query_stats data
            CONVERT (datetime, [creation_time]) AS [creation_time]
    FROM    [snapshots].[notable_query_plan]
    WHERE   [source_id] = @source_id
    ORDER BY [sql_handle] ASC, [plan_handle], [statement_start_offset], [statement_end_offset], [creation_time] ASC

    RETURN
END
GO

GO
--SqlScripter----[snapshots].[fn_get_notable_query_text].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[fn_get_notable_query_text]') IS NULL EXEC('CREATE FUNCTION [snapshots].[fn_get_notable_query_text] () RETURNS @Ret TABLE (c1 int) AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN END')
GO
ALTER FUNCTION [snapshots].[fn_get_notable_query_text]
(
    @source_id int
)
RETURNS @notable_text TABLE (sql_handle varbinary(64))
BEGIN
    INSERT INTO @notable_text
    SELECT  [sql_handle]
    FROM    [snapshots].[notable_query_text]
    WHERE   [source_id] = @source_id
    ORDER BY [sql_handle] ASC

    RETURN
END
GO

GO
--SqlScripter----[snapshots].[fn_get_query_text].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[fn_get_query_text]') IS NULL EXEC('CREATE FUNCTION [snapshots].[fn_get_query_text] () RETURNS @Ret TABLE (c1 int) AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN END')
GO
ALTER FUNCTION [snapshots].[fn_get_query_text]
(
    @source_id int,
    @sql_handle varbinary(64), 
    @statement_start_offset int, 
    @statement_end_offset int
)
RETURNS @query_text TABLE (database_id smallint NULL, object_id int NULL, object_name sysname NULL, query_text nvarchar(max) NULL)

BEGIN
    IF @sql_handle IS NOT NULL AND 
       EXISTS (SELECT sql_handle FROM snapshots.notable_query_text WHERE sql_handle = @sql_handle AND source_id = @source_id)
    BEGIN
        INSERT INTO @query_text 
        (
            database_id, 
            object_id, 
            object_name, 
            query_text
        ) 
        SELECT 
            t.database_id,
            t.object_id,
            t.object_name,
            [snapshots].[fn_get_query_fragment](t.sql_text, @statement_start_offset, @statement_end_offset)
        FROM
            snapshots.notable_query_text t
        WHERE
            t.sql_handle = @sql_handle
            AND t.source_id = @source_id
    END

    RETURN
END
GO
