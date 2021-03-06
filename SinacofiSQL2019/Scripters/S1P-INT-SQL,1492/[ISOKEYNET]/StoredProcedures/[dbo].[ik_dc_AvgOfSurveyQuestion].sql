SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_dc_AvgOfSurveyQuestion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_dc_AvgOfSurveyQuestion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_dc_AvgOfSurveyQuestion]
(
		@TIME_PERIOD AS tinyint,
		@SURVEYID AS int,
		@QUESTION as tinyint
	)

/* 

@TIME_PERIOD: 
Daily = 1
Weekly = 2
Monthly = 3
Quarterly = 4
Annualy = 5

*/

AS
SET DATEFORMAT YMD
SET DATEFIRST 7
SET NOCOUNT ON 

IF NOT EXISTS(
SELECT * FROM dbo.syscolumns WHERE name LIKE  'Q' + LTRIM(STR(@QUESTION)) AND id IN (SELECT id FROM dbo.sysobjects WHERE name LIKE 'IK_SURVEY_' + LTRIM(STR(@SURVEYID)))
)
BEGIN
	SELECT 'Incorrect survey question or survey not running' AS IK_ERROR
	RETURN
END 


DECLARE @STRSQL varchar(8000)	

SET @STRSQL = '
SELECT MIN(PDATE) AS MSR_DATE,
AVG(CAST(Q'+ LTRIM(STR(@QUESTION))  +' AS FLOAT)) AS MSR_REAL_VALUE,
NULL AS MSR_PLANNED_VALUE
FROM IK_SURVEY_' + LTRIM(STR(@SURVEYID)) + 
' GROUP BY dbo.ik_bs_Periods_Grouping('+LTRIM(STR(@TIME_PERIOD))+',PDATE)
ORDER BY dbo.ik_bs_Periods_Grouping('+LTRIM(STR(@TIME_PERIOD))+',PDATE)
'
exec (@STRSQL)
	
return
GO
