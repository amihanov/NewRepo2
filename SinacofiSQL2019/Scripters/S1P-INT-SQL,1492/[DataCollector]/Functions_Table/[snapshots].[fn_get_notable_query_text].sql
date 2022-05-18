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
