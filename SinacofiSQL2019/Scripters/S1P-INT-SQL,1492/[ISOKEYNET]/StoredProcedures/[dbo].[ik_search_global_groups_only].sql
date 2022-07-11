﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_search_global_groups_only]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_search_global_groups_only] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_search_global_groups_only]
@IKLANG nvarchar(10),
	@STR2SEARCH nvarchar(2000),
	@IKCDU int,
	@L_SEARCH_EXACT INT = 1,
	@ENTITIES_TYPES nvarchar(1000)='*',
	@L_SEARCH_IN_FILES tinyint = 1,
	@LINKED_SERVER nvarchar(500)='FTIndexISOKEY' ,
	@IDX_CATALOG nvarchar(500)='localhost.isokey..SCOPE()',
	@tmp_table nvarchar(500) = '#TMP_SEARCH_GLOBAL_GROUPS',
	@L_RETURN_DATA int = 1
AS

SET NOCOUNT ON

DECLARE @PageNumber AS INT, @RowspPage AS INT
SET @PageNumber = 1
SET @RowspPage = 100000



CREATE TABLE #TMP_SEARCH_GLOBAL(
	[RANK] int, 
	[ENTITY_IKURL] nvarchar(100), 	
	[ENTITY_GROUP_ID] nvarchar(100), 
	[ENTITY_ID] int,
	[ENTITY_TYPE_DESC] nvarchar(2000),  
	[ENTITY_DESC] nvarchar(MAX), 
	[ENTITY_ICON] nvarchar(1000) , 
	[ENTITY_GROUP_DESC] nvarchar(3000), 
	[ENTITY_GROUP_ICON] nvarchar(1000),
	[ENTITY_LOCATION] nvarchar(MAX)
)

EXEC dbo.[ik_search_global] @IKLANG, @PageNumber,@RowspPage, @STR2SEARCH, @IKCDU,@L_SEARCH_EXACT,@ENTITIES_TYPES, @L_SEARCH_IN_FILES,@LINKED_SERVER,@IDX_CATALOG, '#TMP_SEARCH_GLOBAL',0


CREATE TABLE #TMP_SEARCH_RESULTS([ORDEN] int, [CANT] int, [ENTITY_GROUP_ID] nvarchar(50), ENTITY_GROUP_DESC nvarchar(500), ENTITY_GROUP_ICON nvarchar(500) )


INSERT INTO #TMP_SEARCH_RESULTS(ORDEN, CANT, ENTITY_GROUP_DESC, ENTITY_GROUP_ID,ENTITY_GROUP_ICON)

SELECT 
1 AS [ORDEN],
COUNT(*) AS CANT,
MAX(#TMP_SEARCH_GLOBAL.ENTITY_GROUP_DESC) AS ENTITY_GROUP_DESC,
#TMP_SEARCH_GLOBAL.ENTITY_GROUP_ID,
MAX(#TMP_SEARCH_GLOBAL.ENTITY_GROUP_ICON) AS ENTITY_GROUP_ICON

 FROM #TMP_SEARCH_GLOBAL
 GROUP BY #TMP_SEARCH_GLOBAL.ENTITY_GROUP_ID--,#TMP_SEARCH_GLOBAL.ENTITY_GROUP_DESC,#TMP_SEARCH_GLOBAL.ENTITY_GROUP_ICON
 ORDER BY 1 DESC
 


IF (SELECT COUNT(*) FROM #TMP_SEARCH_RESULTS)>1--SI HAY MAS DE UN GRUPO, CREO EL GRUPO TODOS. 
BEGIN
	INSERT INTO #TMP_SEARCH_RESULTS(ORDEN, CANT, ENTITY_GROUP_DESC, ENTITY_GROUP_ID,ENTITY_GROUP_ICON)
	SELECT 
	0 AS [ORDEN],
	COUNT(*) AS CANT,
	'Loc_All2' AS ENTITY_GROUP_DESC,
	'*' as ENTITY_GROUP_ID,
	'Images/gradhat.png' as ENTITY_TYPE_IMG
	 FROM #TMP_SEARCH_GLOBAL
END



BEGIN TRY
	EXEC ('TRUNCATE TABLE '+ @tmp_table +'; INSERT INTO ' + @tmp_table + ' SELECT * FROM #TMP_SEARCH_RESULTS ORDER BY #TMP_SEARCH_RESULTS.[CANT] DESC, #TMP_SEARCH_RESULTS.ENTITY_TYPE_DESC ASC ')
END TRY
BEGIN CATCH
END CATCH

IF @L_RETURN_DATA=1
BEGIN
	SELECT * FROM #TMP_SEARCH_RESULTS ORDER BY #TMP_SEARCH_RESULTS.[CANT] DESC, #TMP_SEARCH_RESULTS.ENTITY_GROUP_DESC
END

DROP TABLE #TMP_SEARCH_RESULTS

RETURN
GO