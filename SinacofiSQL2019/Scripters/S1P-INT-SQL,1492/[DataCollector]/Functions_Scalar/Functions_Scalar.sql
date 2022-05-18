
GO
--SqlScripter----[core].[fn_check_operator].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[core].[fn_check_operator]') IS NULL EXEC('CREATE FUNCTION [core].[fn_check_operator] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [core].[fn_check_operator]
(
        @snapshot_id int
    )
    RETURNS bit
    AS
    BEGIN
        DECLARE @retval bit;
        
        DECLARE @operator sysname;
        SELECT @operator=operator FROM core.snapshots WHERE snapshot_id = @snapshot_id;
        IF (@operator = SUSER_SNAME())
            SELECT @retval = 1;
        ELSE
            SELECT @retval = 0;
        RETURN @retval;
    END;
GO

GO
--SqlScripter----[snapshots].[fn_get_query_fragment].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[fn_get_query_fragment]') IS NULL EXEC('CREATE FUNCTION [snapshots].[fn_get_query_fragment] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [snapshots].[fn_get_query_fragment]
(
    @sqltext nvarchar(max),
    @start_offset int, 
    @end_offset int
)
RETURNS NVARCHAR(MAX)
BEGIN
    DECLARE @query_text NVARCHAR(MAX)
    
    DECLARE @query_text_length int
    SET @query_text_length = DATALENGTH(@sqltext) 

    -- If start_offset was set as null, default to starting byte 0
    IF (@start_offset IS NULL)
    BEGIN
        SET @start_offset = 0
    END 

    -- Validate start_offset, return this function if  offset is less than 0
    -- Validate sqltext, if input is NULL, we dont need to continue
    IF (@start_offset < 0 OR @sqltext IS NULL)
    BEGIN
        -- exceptions are not thrown here because caller calls this function on a report query where
        -- throwing exceptions would abort report rendering
        RETURN @query_text
    END

    -- ending position of the query that the row describes within the text of its batch or persisted object. 
    -- value of -1 indicates the end of the batch.
    IF (@end_offset IS NULL OR @end_offset = -1 )
    BEGIN
        SET @end_offset = @query_text_length
    END 

    -- Set the offset to closest even number. Ex: start_offset = 5, set as start_offset = 4th byte
    SET @start_offset = CEILING(@start_offset/2) *2
    SET @end_offset = CEILING(@end_offset/2) *2

    -- Validate start and end offsets
    IF (@start_offset <= @query_text_length    -- start offset should be  less than length of query string
        AND @end_offset <= @query_text_length      -- end offset should be  less than length of query string
        AND @start_offset <= @end_offset)          -- start offset should be less than end offset
    BEGIN
        -- start and end offsets are the byte's position as reported  in DMV sys.dm_exec_query_stats.
        -- sqltext has a NVARCHAR string where every character takes 2 bytes. SUBSTRING() deals with starting character's position 
        -- and length of characters from starting position. so, we are dividing by 2 to convert byte position to character position 
        SELECT @query_text = SUBSTRING(@sqltext, @start_offset/2, (@end_offset - @start_offset)/2 + 1)
    END

    RETURN @query_text
END
GO

GO
--SqlScripter----[snapshots].[fn_hexstrtovarbin].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[fn_hexstrtovarbin]') IS NULL EXEC('CREATE FUNCTION [snapshots].[fn_hexstrtovarbin] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [snapshots].[fn_hexstrtovarbin]
(
    @hexStr varchar(max) 
)
RETURNS varbinary(max)
AS
BEGIN
    DECLARE @ret varbinary(max)
    DECLARE @len int

    SET @ret = 0x;
    SET @len = LEN (@hexStr)-2;

    IF (@len >= 0) AND (LEFT (@hexStr, 2) = '0x')
        SET @hexStr = SUBSTRING (@hexStr, 3, @len);
    ELSE
        RETURN NULL;

    DECLARE @leftNibbleChar char(1), @rightNibbleChar char(1), @hexCharStr varchar(2)
    DECLARE @leftNibble int, @rightNibble int
    DECLARE @i int;
    SET @i = 1;
    WHILE (@i <= @len)
    BEGIN
        SET @hexCharStr = SUBSTRING (@hexStr, @i, 2)
        IF LEN (@hexCharStr) = 1 SET @hexCharStr = '0' + @hexCharStr
        SET @leftNibbleChar = LOWER (LEFT (@hexCharStr, 1))
        SET @rightNibbleChar = LOWER (RIGHT (@hexCharStr, 1))

        IF @leftNibbleChar BETWEEN 'a' AND 'f' COLLATE Latin1_General_BIN 
           SET @leftNibble = (CONVERT (int, CONVERT (binary(1), @leftNibbleChar)) - CONVERT (int, CONVERT (binary(1), 'a')) + 10) * 16;
        ELSE IF @leftNibbleChar BETWEEN '0' AND '9' COLLATE Latin1_General_BIN 
           SET @leftNibble = (CONVERT (int, CONVERT (binary(1), @leftNibbleChar)) - CONVERT (int, CONVERT (binary(1), '0'))) * 16;
        ELSE
            RETURN NULL;

        IF @rightNibbleChar BETWEEN 'a' AND 'f' COLLATE Latin1_General_BIN 
           SET @rightNibble = (CONVERT (int, CONVERT (binary(1), @rightNibbleChar)) - CONVERT (int, CONVERT (binary(1), 'a')) + 10);
        ELSE IF @rightNibbleChar  BETWEEN '0' AND '9' COLLATE Latin1_General_BIN 
           SET @rightNibble = (CONVERT (int, CONVERT (binary(1), @rightNibbleChar)) - CONVERT (int, CONVERT (binary(1), '0')));
        ELSE
            RETURN NULL;

        SET @ret = @ret + CONVERT (binary(1), @leftNibble + @rightNibble)
        SET @i = @i + 2
    END

    RETURN @ret
END
GO

GO
--SqlScripter----[sysutility_ucp_misc].[fn_get_max_size_available].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_misc].[fn_get_max_size_available]') IS NULL EXEC('CREATE FUNCTION [sysutility_ucp_misc].[fn_get_max_size_available] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [sysutility_ucp_misc].[fn_get_max_size_available]
(
                @file_size_kb REAL,
                @max_size_kb REAL, 
                @growth REAL,       --  growth is KB when type is not percentage, or a whole number percentage when percentage
                @smo_growth_type SMALLINT,  -- @smo_growth_type == 0 is KB growth, == 1 means percentage, or == 99 not supported to grow
                @free_space_on_drive_kb BIGINT)
RETURNS REAL 
AS
BEGIN
    DECLARE @max_size_available_kb REAL;
    DECLARE @projected_max_file_size_kb REAL;
    
    -- Be conservative and initialize total space to @file_size_kb (assume no autogrow)
    SELECT @max_size_available_kb  = @file_size_kb;
    
    -- Let projected size be the current file size + volume free space (assuming no one else is competing and its completely available for this file)
    SELECT @projected_max_file_size_kb = @file_size_kb + @free_space_on_drive_kb;

    -- No auto grow, return the configured file size
    IF (@smo_growth_type = 99)
    BEGIN
        SELECT @max_size_available_kb = @file_size_kb;
    END
    ELSE
    BEGIN
        IF (0 < @max_size_kb AND @max_size_kb < @projected_max_file_size_kb)
        BEGIN
            -- if maxsize is configured and it's less than the project space
            -- then we use the maxsize as the growth boundary.
            SELECT @max_size_available_kb =
                CASE
                    WHEN (@smo_growth_type = 1) -- percent growth
                    THEN sysutility_ucp_misc.fn_get_max_size_available_by_growth_type_percent(@file_size_kb, @max_size_kb, @growth)

                    WHEN (@smo_growth_type = 0) -- KB growth
                    THEN sysutility_ucp_misc.fn_get_max_size_available_by_growth_type_kb(@file_size_kb, @max_size_kb, @growth)
                    
                    ELSE @max_size_kb
                END
        END
        ELSE
        BEGIN
            -- either maxsize is not configured, in this case we use the project space
            -- or maxsize is bigger than the project space, and we suse the project space as well.
            SELECT @max_size_available_kb =
                CASE
                    WHEN (@smo_growth_type = 1) -- percent growth
                    THEN sysutility_ucp_misc.fn_get_max_size_available_by_growth_type_percent(@file_size_kb, @projected_max_file_size_kb, @growth)

                    WHEN (@smo_growth_type = 0) -- KB growth
                    THEN sysutility_ucp_misc.fn_get_max_size_available_by_growth_type_kb(@file_size_kb, @projected_max_file_size_kb, @growth)
                    
                    ELSE @projected_max_file_size_kb
                END
        END
    END

    -- VSTS 351411
    -- In SQL2008 and SQL2008 R2, unfortunately the support for file stream file
    -- in SMO and dmv aren't complete: it always return 0 for everything including 
    -- @file_size_kb, @max_size_kb, growth, thus walking through the code path above, 
    -- we'll return 0, then the our data file storage utilization property use this 
    -- value (as the denominator) to compute the percentage which would result 
    -- in divide by zero (DBZ).
    -- 
    -- So for that case, we simply return the @projected_max_file_size_kb to avoid DBZ. Of course
    -- there is a tiny chance @projected_max_file_size_kb is also 0 (due to volume free space is 0
    -- the volume is full!) so we'll simply return 1 (kb)
    --
    -- Note 1: to avoid comparing equality of double-typed variable to 0, check against 1 KB
    --         it wouldn't be any faster but readability is lower.
    IF (@max_size_available_kb < 1.0) 
    BEGIN
        SELECT @max_size_available_kb = @projected_max_file_size_kb;
        -- what if @projected_max_file_size_kb is still 0 (or near 0)? use 1 kb.
        IF (@max_size_available_kb < 1.0)
        BEGIN
            SELECT @max_size_available_kb = 1.0;
        END
    END
    
    RETURN @max_size_available_kb;
END
GO

GO
--SqlScripter----[sysutility_ucp_misc].[fn_get_max_size_available_by_growth_type_kb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_misc].[fn_get_max_size_available_by_growth_type_kb]') IS NULL EXEC('CREATE FUNCTION [sysutility_ucp_misc].[fn_get_max_size_available_by_growth_type_kb] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [sysutility_ucp_misc].[fn_get_max_size_available_by_growth_type_kb]
(
                @file_size_kb REAL,
                @max_size_kb REAL, 
                @growth_size_kb REAL)
RETURNS REAL 
AS
BEGIN
    DECLARE @max_size_available_kb REAL;
    
    SELECT @max_size_available_kb = @file_size_kb;
    
    IF (@growth_size_kb > 0 AND @max_size_kb > @file_size_kb)
    BEGIN
        SELECT @max_size_available_kb = 
            (@max_size_kb - 
              CONVERT(REAL, CONVERT(BIGINT, @max_size_kb - @file_size_kb) % CONVERT(BIGINT, @growth_size_kb)))
    END
    
    RETURN @max_size_available_kb
END
GO

GO
--SqlScripter----[sysutility_ucp_misc].[fn_get_max_size_available_by_growth_type_percent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_misc].[fn_get_max_size_available_by_growth_type_percent]') IS NULL EXEC('CREATE FUNCTION [sysutility_ucp_misc].[fn_get_max_size_available_by_growth_type_percent] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [sysutility_ucp_misc].[fn_get_max_size_available_by_growth_type_percent]
(
                @file_size_kb REAL,
                @max_size_kb REAL, 
                @growth_percent REAL)
RETURNS REAL 
AS
BEGIN
    DECLARE @max_size_available_kb REAL;
    DECLARE @one_plus_growth_percent REAL;
    DECLARE @exponent REAL;
    
    SELECT @max_size_available_kb = @file_size_kb;
    SELECT @one_plus_growth_percent = 1 + @growth_percent / 100;
    --- @file_size_kb > 0 is added to avoid the divided by zero exception. When a database is in the Emergency state, the size
    --- of its log file is zero. 
    IF (@growth_percent > 0 AND @max_size_kb > @file_size_kb AND @file_size_kb > 0)
    BEGIN
        SELECT @exponent = FLOOR(LOG10(@max_size_kb / @file_size_kb) / LOG10(@one_plus_growth_percent));
        SELECT @max_size_available_kb = @file_size_kb * POWER(@one_plus_growth_percent, @exponent);
    END
    
    RETURN @max_size_available_kb
END
GO
