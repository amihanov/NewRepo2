﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_BS_GroupBy_SUM_Forced_Data]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_BS_GroupBy_SUM_Forced_Data] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_BS_GroupBy_SUM_Forced_Data]
(
	@BS_INDICATORSID int,
	@BS_TIMEPERIOD int,
	@STARTDATE datetime,
	@ENDDATE datetime
	)
AS
	/* 
	
	  Valid @BS_TimePeriods
		Daily = 1
        Weekly = 2
        Monthly = 3
        Quarterly = 4
        Semester = 6
        Annualy = 5
        Semester = 6	
	*/

SET DATEFORMAT YMD
SET DATEFIRST 7


CREATE TABLE #TEMP_INDICATOR (
MSR_DATE datetime,
PERIOD int,
ACTUAL_VALUE float,
PLANNED_VALUE float
)


DECLARE @STARTVALUE int
DECLARE @ENDVALUE int

SET @STARTVALUE = dbo.ik_bs_Periods_Grouping(@BS_TIMEPERIOD, @STARTDATE)
SET @ENDVALUE = dbo.ik_bs_Periods_Grouping(@BS_TIMEPERIOD, @ENDDATE)

INSERT INTO #TEMP_INDICATOR
SELECT MSR_DATE, dbo.ik_bs_Periods_Grouping(@BS_TIMEPERIOD, MSR_DATE) AS PERIOD,
	   SUM(MSR_REAL_VALUE) AS ACTUAL_VALUE,
	   SUM(MSR_PLANNED_VALUE) AS PLANNED_VALUE 
FROM BS_INDICATORSDATA
WHERE BS_INDICATORSID=@BS_INDICATORSID AND dbo.ik_bs_Periods_Grouping(@BS_TIMEPERIOD, MSR_DATE) BETWEEN @STARTVALUE AND @ENDVALUE
GROUP BY dbo.ik_bs_Periods_Grouping(@BS_TIMEPERIOD, MSR_DATE),MSR_DATE
ORDER BY 1 DESC


DECLARE @FROMDATE datetime
DECLARE @TODATE datetime
DECLARE @DBDATE datetime
DECLARE @WN int

-- AGREGAR FECHAS AL PRINCIPIO
SET @FROMDATE = @STARTDATE
SET @DBDATE = (SELECT TOP 1 MSR_DATE FROM #TEMP_INDICATOR ORDER BY MSR_DATE)

IF (@DBDATE IS NULL)
BEGIN
	SET @TODATE = @ENDDATE 
END
ELSE
BEGIN
	SET @TODATE = @DBDATE
END

WHILE (DATEDIFF(day,@FROMDATE,@TODATE)> 0)
BEGIN
	INSERT INTO #TEMP_INDICATOR (MSR_DATE, PERIOD, ACTUAL_VALUE, PLANNED_VALUE)	
	VALUES (
		@FROMDATE,
		dbo.ik_bs_Periods_Grouping(@BS_TIMEPERIOD,@FROMDATE),
		NULL,NULL
		)
		
	SET @FROMDATE = dbo.ik_bs_Next_Period_Date(@BS_TIMEPERIOD,@FROMDATE)
END
-- END AGREGAR FECHAS AL PRINCIPIO



-- AGREGAR FECHAS AL FINAL
SET @TODATE = @ENDDATE 
SET @DBDATE = (SELECT TOP 1 MSR_DATE FROM #TEMP_INDICATOR ORDER BY MSR_DATE DESC)

IF (@DBDATE IS NULL)
BEGIN
	SET @FROMDATE = @STARTDATE
END
ELSE
BEGIN
	SET @FROMDATE = @DBDATE
END

--SET @FROMDATE = (DATEADD(Day, 1, @FROMDATE))
SET @FROMDATE = dbo.ik_bs_Next_Period_Date(@BS_TIMEPERIOD,@FROMDATE)
WHILE (DATEDIFF(day,@FROMDATE,@TODATE) >= 0)
BEGIN
	INSERT INTO #TEMP_INDICATOR (MSR_DATE, PERIOD, ACTUAL_VALUE, PLANNED_VALUE)	
	VALUES (
		@FROMDATE,
		dbo.ik_bs_Periods_Grouping(@BS_TIMEPERIOD,@FROMDATE),
		NULL,NULL
		)
		
	SET @FROMDATE = dbo.ik_bs_Next_Period_Date(@BS_TIMEPERIOD,@FROMDATE)
END
-- END AGREGAR FECHAS AL FINAL

SELECT * FROM #TEMP_INDICATOR ORDER BY PERIOD DESC
DROP TABLE #TEMP_INDICATOR

RETURN
GO