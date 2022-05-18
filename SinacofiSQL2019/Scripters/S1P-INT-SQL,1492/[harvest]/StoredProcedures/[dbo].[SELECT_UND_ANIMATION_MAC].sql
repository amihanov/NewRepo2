SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[SELECT_UND_ANIMATION_MAC]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SELECT_UND_ANIMATION_MAC] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.SELECT_UND_ANIMATION_MAC    Script Date: 12/1/2005 11:49:39 PM ******/

/****** Object:  Stored Procedure SELECT_UND_ANIMATION_MAC    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[SELECT_UND_ANIMATION_MAC]
( @inJobID integer )
AS

DECLARE @f_mac nvarchar(80), @t_mac nvarchar(80), @date_start datetime, @date_stop datetime

DECLARE animation_mac_cursor CURSOR FOR
SELECT DISTINCT t.from_mac, t.to_mac, t.dt_start, t.dt_stop 
   FROM und_transaction t
WHERE t.job_id = @inJobID
GROUP BY t.from_mac, t.to_mac, t.dt_start, t.dt_stop 
ORDER BY t.dt_start asc

OPEN animation_mac_cursor

FETCH NEXT FROM authors_cursor
INTO @f_mac, @t_mac, @date_start, @date_stop

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
WHILE @@FETCH_STATUS = 0
BEGIN
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM animation_mac_cursor
   INTO @f_mac, @t_mac, @date_start, @date_stop
END

CLOSE animation_mac_cursor
DEALLOCATE animation_mac_cursor
GO
