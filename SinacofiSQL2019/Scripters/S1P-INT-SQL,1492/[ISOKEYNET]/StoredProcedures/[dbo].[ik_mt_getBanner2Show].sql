﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_mt_getBanner2Show]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_mt_getBanner2Show] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_mt_getBanner2Show]
(
	@IKCDU int
)

AS
SET NOCOUNT ON 


DECLARE curFNs CURSOR LOCAL FAST_FORWARD for 
SELECT FN_CALL, [CONTENT], [CONTENT_TYPE]
FROM TBL_MT_FNS_GETBANNER2SHOW
ORDER BY FN_EXECUTION_ORDER

DECLARE @FN_CALL nvarchar(1000)
DECLARE @CONTENT nvarchar(1000)
DECLARE @CONTENT_TYPE int

OPEN curFNs 

FETCH NEXT FROM curFNs INTO @FN_CALL, @CONTENT, @CONTENT_TYPE 

CREATE TABLE #TMP([CONTENT] nvarchar(1000), [CONTENT_TYPE] int )

WHILE @@FETCH_STATUS = 0
BEGIN

	DECLARE @STR_SQL nvarchar(4000)
	SET @STR_SQL = ''
	SET @STR_SQL = @STR_SQL + '		DECLARE @IKCDU int'
	SET @STR_SQL = @STR_SQL + '		SET @IKCDU = ' + STR(@IKCDU) 
	SET @STR_SQL = @STR_SQL + '		DECLARE @HOY datetime'
	SET @STR_SQL = @STR_SQL + '		SET @HOY = GETDATE()' 

	SET @STR_SQL = @STR_SQL + 'IF (SELECT ' + @FN_CALL + ')=1 '  
	SET @STR_SQL = @STR_SQL + ' BEGIN   '
	SET @STR_SQL = @STR_SQL + '		INSERT INTO #TMP SELECT ''' + @CONTENT + ''' AS [CONTENT], ' + STR(@CONTENT_TYPE) + ' AS CONTENT_TYPE '
	SET @STR_SQL = @STR_SQL + ' END   '

	--PRINT @STR_SQL
	EXEC (@STR_SQL)

	IF EXISTS(SELECT * FROM #TMP)
	BEGIN
		BREAK
	END

	FETCH NEXT FROM curFNs INTO @FN_CALL, @CONTENT, @CONTENT_TYPE 
END

CLOSE curFNs
DEALLOCATE curFNs

IF EXISTS(SELECT * FROM #TMP)
BEGIN 
	SELECT TOP 1 * FROM #TMP
END	
ELSE
BEGIN
	SELECT 'Loc_No_Tasks' AS CONTENT, 1 AS CONTENT_TYPE
END
	


/*
	IF (SELECT dbo.ik_mt_userHasNewsOnForums(@IKCDU))=1
	BEGIN
		SELECT 'bot_ik_novedades' AS CONTENT, 0 AS CONTENT_TYPE
		RETURN
	END

	IF (SELECT dbo.ik_mt_userHasNewsOnDocs(@IKCDU))=1
	BEGIN
		SELECT 'bot_ik_novedades' AS CONTENT, 0 AS CONTENT_TYPE
		RETURN
	END

	IF (SELECT dbo.ik_mt_userHasNewsOnAlerts(@IKCDU,GETDATE()))=1
	BEGIN
		SELECT 'bot_ik_novedades' AS CONTENT, 0 AS CONTENT_TYPE
		RETURN
	END
	
	
	IF (SELECT dbo.ik_mt_userHasPendingNCTasks(@IKCDU))=1
	BEGIN
		SELECT 'img_mytasks_pendingtasks' AS CONTENT, 0 AS CONTENT_TYPE
		RETURN
	END	

	IF (SELECT dbo.[ik_mt_userHasWFApprovalRequirementsInProgress](@IKCDU))=1
	BEGIN
		SELECT 'img_mytasks_pendingtasks' AS CONTENT, 0 AS CONTENT_TYPE
		RETURN
	END	
*/	

	
	RETURN
GO