SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[SELECT_UND_ANIMATION_IP]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SELECT_UND_ANIMATION_IP] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.SELECT_UND_ANIMATION_IP    Script Date: 12/1/2005 11:49:39 PM ******/

/****** Object:  Stored Procedure SELECT_UND_ANIMATION_IP    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[SELECT_UND_ANIMATION_IP]
( @inJobID integer )
AS

DECLARE @f_ip nvarchar(80), @t_ip nvarchar(80), @date_start datetime, @date_stop datetime

DECLARE animation_cursor CURSOR FOR
SELECT DISTINCT t.from_ip, t.to_ip, t.dt_start, t.dt_stop 
   FROM und_transaction t
WHERE t.job_id = @inJobID
GROUP BY t.from_ip, t.to_ip, t.dt_start, t.dt_stop 
ORDER BY t.dt_start asc

OPEN animation_cursor

FETCH NEXT FROM authors_cursor
INTO @f_ip, @t_ip, @date_start, @date_stop

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
WHILE @@FETCH_STATUS = 0
BEGIN
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM animation_cursor
   INTO @f_ip, @t_ip, @date_start, @date_stop
END

CLOSE animation_cursor
DEALLOCATE animation_cursor
GO
