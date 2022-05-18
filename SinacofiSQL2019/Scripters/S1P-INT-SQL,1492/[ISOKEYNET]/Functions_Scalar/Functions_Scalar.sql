
GO
--SqlScripter----[dbo].[ax_search_translate].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ax_search_translate]') IS NULL EXEC('CREATE FUNCTION [dbo].[ax_search_translate] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ax_search_translate]
(
		@txt nvarchar(max)
	
	)

RETURNS nvarchar(MAX)
AS
BEGIN


DECLARE @QueParse nvarchar(max)
--set @QueParse='Esto sería el Loc_Yes: "{@LOC Loc_Yes}" y esto otro sería el Loc_Issues: {@LOC Loc_Issues}'
set @QueParse=@txt

DECLARE @BegVarChar NVARCHAR(2) = '{'
DECLARE @EndVarChar NVARCHAR(2) = '}'
DECLARE @ReturnVal NVARCHAR(max) = ''
DECLARE @LargoParse INT = LEN(@QueParse)


DECLARE @ParsePtr INT = 1


DECLARE @CurrentChar NVARCHAR(2)=''
DECLARE @CurrentVar NVARCHAR(max)=''
DECLARE @NombreQS   NVARCHAR(200)=''


WHILE (1=1)
BEGIN
	SET @CurrentChar = SUBSTRING(@QueParse, @ParsePtr, 1)
	If (@CurrentChar = @BegVarChar )
	BEGIN                
		SET @CurrentVar = @CurrentChar
		WHILE (1=1)
		BEGIN
			SET @ParsePtr = @ParsePtr + 1
			If (@ParsePtr > @LargoParse )
			BEGIN
				SET @ReturnVal = '!Error'
				RETURN @ReturnVal
			END
			SET @CurrentChar = SUBSTRING(@QueParse, @ParsePtr, 1)
			If (@CurrentChar = @EndVarChar )
			BEGIN
				SET @CurrentVar = @CurrentVar + @CurrentChar
				SET @NombreQS = Replace(@CurrentVar, '{', '')
                SET @NombreQS = Replace(@NombreQS, '}', '')
				If (SUBSTRING(@NombreQS,1,4)= '@LOC')
				BEGIN
					SET @ReturnVal = @ReturnVal +   dbo.translate(REPLACE(@NombreQS,'@LOC ',''))
				END
				ELSE
				BEGIN
					SET @ReturnVal = @ReturnVal + @CurrentVar
				END
				SET @ParsePtr = @ParsePtr + 1
				BREAK;
			END
			ELSE
			BEGIN
				SET @CurrentVar = @CurrentVar + @CurrentChar
			END
		END
	END
	ELSE
	BEGIN
	 SET @ReturnVal = @ReturnVal + @CurrentChar
	 SET @ParsePtr = @ParsePtr + 1
	END
	If (@ParsePtr > @LargoParse)
	BEGIN
        BREAK;  
	END
END

RETURN   @ReturnVal


END
GO

GO
--SqlScripter----[dbo].[ax_search_translate_EN].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ax_search_translate_EN]') IS NULL EXEC('CREATE FUNCTION [dbo].[ax_search_translate_EN] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ax_search_translate_EN]
(
		@txt nvarchar(max)
	
	)

RETURNS nvarchar(MAX)
AS
BEGIN


DECLARE @QueParse nvarchar(max)
--set @QueParse='Esto sería el Loc_Yes: "{@LOC Loc_Yes}" y esto otro sería el Loc_Issues: {@LOC Loc_Issues}'
set @QueParse=@txt

DECLARE @BegVarChar NVARCHAR(2) = '{'
DECLARE @EndVarChar NVARCHAR(2) = '}'
DECLARE @ReturnVal NVARCHAR(max) = ''
DECLARE @LargoParse INT = LEN(@QueParse)


DECLARE @ParsePtr INT = 1


DECLARE @CurrentChar NVARCHAR(2)=''
DECLARE @CurrentVar NVARCHAR(max)=''
DECLARE @NombreQS   NVARCHAR(200)=''


WHILE (1=1)
BEGIN
	SET @CurrentChar = SUBSTRING(@QueParse, @ParsePtr, 1)
	If (@CurrentChar = @BegVarChar )
	BEGIN                
		SET @CurrentVar = @CurrentChar
		WHILE (1=1)
		BEGIN
			SET @ParsePtr = @ParsePtr + 1
			If (@ParsePtr > @LargoParse )
			BEGIN
				SET @ReturnVal = '!Error'
				RETURN @ReturnVal
			END
			SET @CurrentChar = SUBSTRING(@QueParse, @ParsePtr, 1)
			If (@CurrentChar = @EndVarChar )
			BEGIN
				SET @CurrentVar = @CurrentVar + @CurrentChar
				SET @NombreQS = Replace(@CurrentVar, '{', '')
                SET @NombreQS = Replace(@NombreQS, '}', '')
				If (SUBSTRING(@NombreQS,1,4)= '@LOC')
				BEGIN
					SET @ReturnVal = @ReturnVal +   dbo.ax_translate_EN(REPLACE(@NombreQS,'@LOC ',''))
				END
				ELSE
				BEGIN
					SET @ReturnVal = @ReturnVal + @CurrentVar
				END
				SET @ParsePtr = @ParsePtr + 1
				BREAK;
			END
			ELSE
			BEGIN
				SET @CurrentVar = @CurrentVar + @CurrentChar
			END
		END
	END
	ELSE
	BEGIN
	 SET @ReturnVal = @ReturnVal + @CurrentChar
	 SET @ParsePtr = @ParsePtr + 1
	END
	If (@ParsePtr > @LargoParse)
	BEGIN
        BREAK;  
	END
END

RETURN   @ReturnVal


END
GO

GO
--SqlScripter----[dbo].[ax_search_translate_ES].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ax_search_translate_ES]') IS NULL EXEC('CREATE FUNCTION [dbo].[ax_search_translate_ES] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ax_search_translate_ES]
(
		@txt nvarchar(max)
	
	)

RETURNS nvarchar(MAX)
AS
BEGIN


DECLARE @QueParse nvarchar(max)
--set @QueParse='Esto sería el Loc_Yes: "{@LOC Loc_Yes}" y esto otro sería el Loc_Issues: {@LOC Loc_Issues}'
set @QueParse=@txt

DECLARE @BegVarChar NVARCHAR(2) = '{'
DECLARE @EndVarChar NVARCHAR(2) = '}'
DECLARE @ReturnVal NVARCHAR(max) = ''
DECLARE @LargoParse INT = LEN(@QueParse)


DECLARE @ParsePtr INT = 1


DECLARE @CurrentChar NVARCHAR(2)=''
DECLARE @CurrentVar NVARCHAR(max)=''
DECLARE @NombreQS   NVARCHAR(200)=''


WHILE (1=1)
BEGIN
	SET @CurrentChar = SUBSTRING(@QueParse, @ParsePtr, 1)
	If (@CurrentChar = @BegVarChar )
	BEGIN                
		SET @CurrentVar = @CurrentChar
		WHILE (1=1)
		BEGIN
			SET @ParsePtr = @ParsePtr + 1
			If (@ParsePtr > @LargoParse )
			BEGIN
				SET @ReturnVal = '!Error'
				RETURN @ReturnVal
			END
			SET @CurrentChar = SUBSTRING(@QueParse, @ParsePtr, 1)
			If (@CurrentChar = @EndVarChar )
			BEGIN
				SET @CurrentVar = @CurrentVar + @CurrentChar
				SET @NombreQS = Replace(@CurrentVar, '{', '')
                SET @NombreQS = Replace(@NombreQS, '}', '')
				If (SUBSTRING(@NombreQS,1,4)= '@LOC')
				BEGIN
					SET @ReturnVal = @ReturnVal  +   dbo.ax_translate_ES(REPLACE(@NombreQS,'@LOC ',''))
				END
				ELSE
				BEGIN
					SET @ReturnVal = @ReturnVal + @CurrentVar
				END
				SET @ParsePtr = @ParsePtr + 1
				BREAK;
			END
			ELSE
			BEGIN
				SET @CurrentVar = @CurrentVar + @CurrentChar
			END
		END
	END
	ELSE
	BEGIN
	 SET @ReturnVal = @ReturnVal + @CurrentChar
	 SET @ParsePtr = @ParsePtr + 1
	END
	If (@ParsePtr > @LargoParse)
	BEGIN
        BREAK;  
	END
END

RETURN   @ReturnVal


END
GO

GO
--SqlScripter----[dbo].[ax_search_translate_PT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ax_search_translate_PT]') IS NULL EXEC('CREATE FUNCTION [dbo].[ax_search_translate_PT] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ax_search_translate_PT]
(
		@txt nvarchar(max)
	
	)

RETURNS nvarchar(MAX)
AS
BEGIN


DECLARE @QueParse nvarchar(max)
--set @QueParse='Esto sería el Loc_Yes: "{@LOC Loc_Yes}" y esto otro sería el Loc_Issues: {@LOC Loc_Issues}'
set @QueParse=@txt

DECLARE @BegVarChar NVARCHAR(2) = '{'
DECLARE @EndVarChar NVARCHAR(2) = '}'
DECLARE @ReturnVal NVARCHAR(max) = ''
DECLARE @LargoParse INT = LEN(@QueParse)


DECLARE @ParsePtr INT = 1


DECLARE @CurrentChar NVARCHAR(2)=''
DECLARE @CurrentVar NVARCHAR(max)=''
DECLARE @NombreQS   NVARCHAR(200)=''


WHILE (1=1)
BEGIN
	SET @CurrentChar = SUBSTRING(@QueParse, @ParsePtr, 1)
	If (@CurrentChar = @BegVarChar )
	BEGIN                
		SET @CurrentVar = @CurrentChar
		WHILE (1=1)
		BEGIN
			SET @ParsePtr = @ParsePtr + 1
			If (@ParsePtr > @LargoParse )
			BEGIN
				SET @ReturnVal = '!Error'
				RETURN @ReturnVal
			END
			SET @CurrentChar = SUBSTRING(@QueParse, @ParsePtr, 1)
			If (@CurrentChar = @EndVarChar )
			BEGIN
				SET @CurrentVar = @CurrentVar + @CurrentChar
				SET @NombreQS = Replace(@CurrentVar, '{', '')
                SET @NombreQS = Replace(@NombreQS, '}', '')
				If (SUBSTRING(@NombreQS,1,4)= '@LOC')
				BEGIN
					SET @ReturnVal = @ReturnVal +   dbo.ax_translate_PT(REPLACE(@NombreQS,'@LOC ',''))
				END
				ELSE
				BEGIN
					SET @ReturnVal = @ReturnVal + @CurrentVar
				END
				SET @ParsePtr = @ParsePtr + 1
				BREAK;
			END
			ELSE
			BEGIN
				SET @CurrentVar = @CurrentVar + @CurrentChar
			END
		END
	END
	ELSE
	BEGIN
	 SET @ReturnVal = @ReturnVal + @CurrentChar
	 SET @ParsePtr = @ParsePtr + 1
	END
	If (@ParsePtr > @LargoParse)
	BEGIN
        BREAK;  
	END
END

RETURN   @ReturnVal


END
GO

GO
--SqlScripter----[dbo].[ax_translate_EN].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ax_translate_EN]') IS NULL EXEC('CREATE FUNCTION [dbo].[ax_translate_EN] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ax_translate_EN]
(
		@LOC nvarchar(200)
	
	)
RETURNS nvarchar(MAX)
AS
BEGIN

DECLARE @VALUE nvarchar(MAX)
SET @VALUE = ISNULL((SELECT VALUE FROM NAX_RESOURCES_EN WHERE NAME=@LOC),@LOC) 

IF @VALUE = @LOC
	SET @VALUE = ISNULL((SELECT VALUELONG FROM NAX_RESOURCES_EN WHERE NAME=@LOC),@LOC)  

RETURN (@VALUE)
END
GO

GO
--SqlScripter----[dbo].[ax_translate_ES].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ax_translate_ES]') IS NULL EXEC('CREATE FUNCTION [dbo].[ax_translate_ES] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ax_translate_ES]
(
		@LOC nvarchar(200)
	
	)
RETURNS nvarchar(MAX)
AS
BEGIN

DECLARE @VALUE nvarchar(MAX)
SET @VALUE = ISNULL((SELECT VALUE FROM NAX_RESOURCES_ES WHERE NAME=@LOC),@LOC) 

IF @VALUE = @LOC
	SET @VALUE = ISNULL((SELECT VALUELONG FROM NAX_RESOURCES_ES WHERE NAME=@LOC),@LOC)  

RETURN (@VALUE)
END
GO

GO
--SqlScripter----[dbo].[ax_translate_PT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ax_translate_PT]') IS NULL EXEC('CREATE FUNCTION [dbo].[ax_translate_PT] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ax_translate_PT]
(
		@LOC nvarchar(200)
	
	)
RETURNS nvarchar(MAX)
AS
BEGIN

DECLARE @VALUE nvarchar(MAX)
SET @VALUE = ISNULL((SELECT VALUE FROM NAX_RESOURCES_PT WHERE NAME=@LOC),@LOC) 

IF @VALUE = @LOC
	SET @VALUE = ISNULL((SELECT VALUELONG FROM NAX_RESOURCES_PT WHERE NAME=@LOC),@LOC)  

RETURN (@VALUE)
END
GO

GO
--SqlScripter----[dbo].[CONCAT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[CONCAT]') IS NULL EXEC('CREATE FUNCTION [dbo].[CONCAT] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[CONCAT]
(
		@s1 varchar(4000),
		@s2 varchar(4000)
	)
RETURNS varchar(8000)
AS
	BEGIN
	
	
	RETURN @s1 + @s2

	END
GO

GO
--SqlScripter----[dbo].[CONCAT3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[CONCAT3]') IS NULL EXEC('CREATE FUNCTION [dbo].[CONCAT3] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[CONCAT3]
(
		@s1 varchar(2500),
		@s2 varchar(2500),
		@s3 varchar(2500)
	)
RETURNS varchar(8000)
AS
	BEGIN
	
	
	RETURN @s1 + @s2 + @s3

	END
GO

GO
--SqlScripter----[dbo].[CONCAT4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[CONCAT4]') IS NULL EXEC('CREATE FUNCTION [dbo].[CONCAT4] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[CONCAT4]
(
		@s1 varchar(1000),
		@s2 varchar(1000),
		@s3 varchar(1000),
		@s4 varchar(1000)
	)
RETURNS varchar(8000)
AS
	BEGIN
	
	
	RETURN @s1 + @s2 + @s3 + @s4

	END
GO

GO
--SqlScripter----[dbo].[CONCAT5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[CONCAT5]') IS NULL EXEC('CREATE FUNCTION [dbo].[CONCAT5] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[CONCAT5]
(
		@s1 varchar(1000),
		@s2 varchar(1000),
		@s3 varchar(1000),
		@s4 varchar(1000),
		@s5 varchar(1000)
	)
RETURNS varchar(8000)
AS
	BEGIN
	
	
	RETURN @s1 + @s2 + @s3 + @s4 + @s5

	END
GO

GO
--SqlScripter----[dbo].[CONCAT6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[CONCAT6]') IS NULL EXEC('CREATE FUNCTION [dbo].[CONCAT6] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[CONCAT6]
(
		@s1 varchar(1000),
		@s2 varchar(1000),
		@s3 varchar(1000),
		@s4 varchar(1000),
		@s5 varchar(1000),
		@s6 varchar(1000)
	)
RETURNS varchar(8000)
AS
	BEGIN
	
	
	RETURN @s1 + @s2 + @s3 + @s4 + @s5 + @s6

	END
GO

GO
--SqlScripter----[dbo].[CONCAT7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[CONCAT7]') IS NULL EXEC('CREATE FUNCTION [dbo].[CONCAT7] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[CONCAT7]
(
		@s1 varchar(1000),
		@s2 varchar(1000),
		@s3 varchar(1000),
		@s4 varchar(1000),
		@s5 varchar(1000),
		@s6 varchar(1000),
		@s7 varchar(1000)
	)
RETURNS varchar(8000)
AS
	BEGIN
	
	
	RETURN @s1 + @s2 + @s3 + @s4 + @s5 + @s6 + @s7

	END
GO

GO
--SqlScripter----[dbo].[CONCAT8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[CONCAT8]') IS NULL EXEC('CREATE FUNCTION [dbo].[CONCAT8] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[CONCAT8]
(
		@s1 varchar(1000),
		@s2 varchar(1000),
		@s3 varchar(1000),
		@s4 varchar(1000),
		@s5 varchar(1000),
		@s6 varchar(1000),
		@s7 varchar(1000),
		@s8 varchar(1000)
	)
RETURNS varchar(8000)
AS
	BEGIN
	
	
	RETURN @s1 + @s2 + @s3 + @s4 + @s5 + @s6 + @s7 + @s8

	END
GO

GO
--SqlScripter----[dbo].[DATEMAX].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[DATEMAX]') IS NULL EXEC('CREATE FUNCTION [dbo].[DATEMAX] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[DATEMAX]
(
		@d1 datetime ,
		@d2 datetime 
	)
RETURNS datetime
AS
	BEGIN
	
	if (@d1 is null) return @d2
	if (@d2 is null) return @d1
	if (@d1>@d2) return @d1 

	return @d2
	

	END
GO

GO
--SqlScripter----[dbo].[GET_proxima_tarea_Sinacofi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GET_proxima_tarea_Sinacofi]') IS NULL EXEC('CREATE FUNCTION [dbo].[GET_proxima_tarea_Sinacofi] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[GET_proxima_tarea_Sinacofi]
(
	@CODIGONC int,
	@ETAPA int
)
RETURNS nvarchar(600)
AS
BEGIN

DECLARE @DESCRIPCION AS nvarchar(400)
DECLARE @CODIGO AS int

SELECT TOP 1 @CODIGO = CODIGO, @DESCRIPCION = DESCRIPCION FROM NCTAREAS
WHERE MANDARENFECHA >= GETDATE() AND L_CUMPLIDA=0 AND CODIGONC= @CODIGONC AND ETAPA = @ETAPA
ORDER BY MANDARENFECHA

RETURN @DESCRIPCION
--IF (DESCRIPCION IS NULL) THEN SET @ ''
--ELSE RETURN ''

END
GO

GO
--SqlScripter----[dbo].[getInitials].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[getInitials]') IS NULL EXEC('CREATE FUNCTION [dbo].[getInitials] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[getInitials]
(@str NVARCHAR(4000))
RETURNS NVARCHAR(2000)
AS
BEGIN
    DECLARE @retval NVARCHAR(2000);

    SET @str=RTRIM(LTRIM(@str));
    SET @retval= UPPER(LEFT(@str,1));

       WHILE CHARINDEX(' ',@str,1)>0 OR CHARINDEX('/',@str,1)>0  BEGIN		
		IF CHARINDEX(' ',@str,1)>0 AND CHARINDEX('/',@str,1)>0
		BEGIN
			IF CHARINDEX(' ',@str,1)>0 AND CHARINDEX(' ',@str,1) < CHARINDEX('/',@str,1)
			BEGIN
				SET @str=LTRIM(RIGHT(@str,LEN(@str)-CHARINDEX(' ',@str,1)));
			END
			ELSE
			BEGIN
				SET @str=LTRIM(RIGHT(@str,LEN(@str)-CHARINDEX('/',@str,1)));
			END 		
		END
		ELSE IF CHARINDEX(' ',@str,1)>0 AND CHARINDEX('/',@str,1)=0
		BEGIN
			SET @str=LTRIM(RIGHT(@str,LEN(@str)-CHARINDEX(' ',@str,1)));
		END
		ELSE IF CHARINDEX('/',@str,1)>0 AND CHARINDEX(' ',@str,1)=0
		BEGIN
			SET @str=LTRIM(RIGHT(@str,LEN(@str)-CHARINDEX('/',@str,1)));
		END
		
		IF CHARINDEX(' ',@str,1)>0 and CHARINDEX(' ',@str,1)<4
		BEGIN
			SET @str=LTRIM(RIGHT(@str,LEN(@str)-CHARINDEX(' ',@str,1)));
		END

		IF CHARINDEX('/',@str,1)>0 and CHARINDEX('/',@str,1)<4
		BEGIN
			SET @str=LTRIM(RIGHT(@str,LEN(@str)-CHARINDEX('/',@str,1)));
		END

        SET @retval = @retval + UPPER(LEFT(@str,1));
    END


    RETURN @retval;
END
GO

GO
--SqlScripter----[dbo].[getOrganigramaYCargo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[getOrganigramaYCargo]') IS NULL EXEC('CREATE FUNCTION [dbo].[getOrganigramaYCargo] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[getOrganigramaYCargo]
(
		@Organigrama nvarchar(200)
	
	)
RETURNS nvarchar(200)
AS
BEGIN

DECLARE @RETVAL nvarchar(200)
DECLARE @POS int
set @Organigrama = rtrim(ltrim(@Organigrama))
SET @POS = CHARINDEX('\', @Organigrama)
IF @POS > 0 
	SET @RETVAL = SUBSTRING(@Organigrama,1,@POS-1)
ELSE
	SET @RETVAL = @Organigrama

RETURN (@RETVAL)
END
GO

GO
--SqlScripter----[dbo].[ik_AddWorkingDays].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_AddWorkingDays]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_AddWorkingDays] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_AddWorkingDays]
(
	@STARTDATE datetime,
	@DAYS int
	)
RETURNS datetime
AS
BEGIN

DECLARE @Saturday int, @Sunday int

DECLARE @satDate datetime
DECLARE @sunDate datetime

SET @satDate = '2006-08-26'
SET @sunDate = '2006-08-27'


SET @Saturday = (select datepart(weekday,@satDate))
SET @Sunday = (select datepart(weekday,@sunDate))

DECLARE @DOW int
DECLARE @WORKING tinyint
DECLARE @CODIGO int

IF @DAYS > 0
BEGIN
	WHILE @DAYS > 0
	BEGIN
		SET @WORKING = 1
		SET @DOW = DATEPART(WEEKDAY,@STARTDATE)
		IF (@DOW = @Saturday OR @DOW = @Sunday) SET @WORKING = 0
		ELSE
			BEGIN
			SET @CODIGO = (SELECT CODIGO FROM NCTASKS_NOT_WORKING_DAYS WHERE
						   DATEPART(day,FECHA) = DATEPART(day,@STARTDATE) AND
						   DATEPART(month,FECHA) = DATEPART(month,@STARTDATE) AND
						   DATEPART(year,FECHA) = DATEPART(year,@STARTDATE))
			IF NOT @CODIGO IS NULL SET @WORKING = 0
			END
		SET @STARTDATE = @STARTDATE + 1
		SET @DAYS = @DAYS - @WORKING
	END

	SET @WORKING = 0
	WHILE @WORKING = 0
	BEGIN
		SET @WORKING = 1
		SET @DOW = DATEPART(WEEKDAY,@STARTDATE)
		IF (@DOW = @Saturday OR @DOW = @Sunday) SET @WORKING = 0
		ELSE
			BEGIN
			SET @CODIGO = (SELECT CODIGO FROM NCTASKS_NOT_WORKING_DAYS WHERE
						   DATEPART(day,FECHA) = DATEPART(day,@STARTDATE) AND
						   DATEPART(month,FECHA) = DATEPART(month,@STARTDATE) AND
						   DATEPART(year,FECHA) = DATEPART(year,@STARTDATE))
			IF NOT @CODIGO IS NULL SET @WORKING = 0
			END
		IF @WORKING=0 SET @STARTDATE = @STARTDATE + 1
	END
END
ELSE
BEGIN
	WHILE @DAYS < 0
	BEGIN
		SET @WORKING = 1
		SET @DOW = DATEPART(WEEKDAY,@STARTDATE)
		IF (@DOW = @Saturday OR @DOW = @Sunday) SET @WORKING = 0
		ELSE
			BEGIN
			SET @CODIGO = (SELECT CODIGO FROM NCTASKS_NOT_WORKING_DAYS WHERE
						   DATEPART(day,FECHA) = DATEPART(day,@STARTDATE) AND
						   DATEPART(month,FECHA) = DATEPART(month,@STARTDATE) AND
						   DATEPART(year,FECHA) = DATEPART(year,@STARTDATE))
			IF NOT @CODIGO IS NULL SET @WORKING = 0
			END
		SET @STARTDATE = @STARTDATE - 1
		SET @DAYS = @DAYS + @WORKING
	END

	SET @WORKING = 0
	WHILE @WORKING = 0
	BEGIN
		SET @WORKING = 1
		SET @DOW = DATEPART(WEEKDAY,@STARTDATE)
		IF (@DOW = @Saturday OR @DOW = @Sunday) SET @WORKING = 0
		ELSE
			BEGIN
			SET @CODIGO = (SELECT CODIGO FROM NCTASKS_NOT_WORKING_DAYS WHERE
						   DATEPART(day,FECHA) = DATEPART(day,@STARTDATE) AND
						   DATEPART(month,FECHA) = DATEPART(month,@STARTDATE) AND
						   DATEPART(year,FECHA) = DATEPART(year,@STARTDATE))
			IF NOT @CODIGO IS NULL SET @WORKING = 0
			END
		IF @WORKING=0 SET @STARTDATE = @STARTDATE - 1
	END
END

RETURN @STARTDATE

END
GO

GO
--SqlScripter----[dbo].[ik_bs_Custom_Periods_Shift].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_bs_Custom_Periods_Shift]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_bs_Custom_Periods_Shift] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_bs_Custom_Periods_Shift]
()

RETURNS int
AS
BEGIN
	RETURN 0
END
GO

GO
--SqlScripter----[dbo].[ik_bs_Dates_Are_Same_Period].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_bs_Dates_Are_Same_Period]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_bs_Dates_Are_Same_Period] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_bs_Dates_Are_Same_Period]
(
		@TIME_PERIOD int,
		@DATE1 datetime,
		@DATE2 datetime
	)
RETURNS int
AS
BEGIN

DECLARE @RETVAL int
SET @RETVAL = 0

IF (@TIME_PERIOD=1 AND @DATE1 = @DATE2) SET @RETVAL = 1
ELSE IF (@TIME_PERIOD=2 AND dbo.ik_ISOweek(@DATE1)=dbo.ik_ISOweek(@DATE2)) SET @RETVAL = 1
ELSE IF (@TIME_PERIOD=3 AND DATEPART(yyyy,@DATE1)=DATEPART(yyyy,@DATE2) AND DATEPART(m,@DATE1)=DATEPART(m,@DATE2)) SET @RETVAL = 1
ELSE IF (@TIME_PERIOD=4 AND DATEPART(yyyy,@DATE1)=DATEPART(yyyy,@DATE2) AND DATEPART(q,@DATE1)=DATEPART(q,@DATE2)) SET @RETVAL = 1
ELSE IF (@TIME_PERIOD=6 AND DATEPART(yyyy,@DATE1)=DATEPART(yyyy,@DATE2) AND FLOOR((DATEPART(q,@DATE1)+1)/2)=FLOOR((DATEPART(q,@DATE2)+1)/2)) SET @RETVAL = 1
ELSE IF (@TIME_PERIOD=5 AND DATEPART(yyyy,@DATE1)=DATEPART(yyyy,@DATE2)) SET @RETVAL = 1
ELSE IF (@TIME_PERIOD=104 AND dbo.ik_CustomQuarter(@DATE1)=dbo.ik_CustomQuarter(@DATE2)) SET @RETVAL = 1
ELSE IF (@TIME_PERIOD=106 AND dbo.ik_CustomSemester(@DATE1)=dbo.ik_CustomSemester(@DATE2)) SET @RETVAL = 1
ELSE IF (@TIME_PERIOD=105 AND dbo.ik_CustomYear(@DATE1)=dbo.ik_CustomYear(@DATE2)) SET @RETVAL = 1

RETURN (@RETVAL)
END
GO

GO
--SqlScripter----[dbo].[ik_bs_Next_Period_Date].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_bs_Next_Period_Date]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_bs_Next_Period_Date] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_bs_Next_Period_Date]
(
		@TIME_PERIOD int,
		@FROMDATE datetime
	)
	
RETURNS datetime
AS
BEGIN

DECLARE @RETVAL datetime

IF @TIME_PERIOD=1 SET @RETVAL = (DATEADD(Day, 1, @FROMDATE))
ELSE IF @TIME_PERIOD=2 SET @RETVAL = dbo.ik_getFirstDateOfISOWeek(DBO.ik_ISOweek (DATEADD(Day, 7, @FROMDATE)))
ELSE IF @TIME_PERIOD=3 SET @RETVAL = (DATEADD(Month, 1, @FROMDATE))
ELSE IF @TIME_PERIOD=4 SET @RETVAL = (DATEADD(quarter, 1, @FROMDATE))
ELSE IF @TIME_PERIOD=6 SET @RETVAL = (DATEADD(quarter, 2, @FROMDATE))
ELSE IF @TIME_PERIOD=5 SET @RETVAL = (DATEADD(Year, 1, @FROMDATE))
/*
ELSE IF @TIME_PERIOD=104 SET @RETVAL = DBO.ik_CustomQuarter (DATEADD(Month, 3, @FROMDATE))
ELSE IF @TIME_PERIOD=106 SET @RETVAL = DBO.ik_CustomSemester (DATEADD(Month, 6, @FROMDATE))
ELSE IF @TIME_PERIOD=105 SET @RETVAL = DBO.ik_CustomYear (DATEADD(Month, 12, @FROMDATE))
*/
ELSE IF @TIME_PERIOD=104 SET @RETVAL = DATEADD(Month, 3, @FROMDATE)
ELSE IF @TIME_PERIOD=106 SET @RETVAL = DATEADD(Month, 6, @FROMDATE)
ELSE IF @TIME_PERIOD=105 SET @RETVAL = DATEADD(Month, 12, @FROMDATE)
RETURN (@RETVAL)
END
GO

GO
--SqlScripter----[dbo].[ik_bs_Periods_GroupExp_ToDate].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_bs_Periods_GroupExp_ToDate]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_bs_Periods_GroupExp_ToDate] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_bs_Periods_GroupExp_ToDate]
(
		@TIME_PERIOD int,
		@GROUP_EXP_PERIOD int
	)
RETURNS datetime
AS
BEGIN

DECLARE @RETVAL datetime
DECLARE @YEAR int
DECLARE @SHIFT int
SET @SHIFT = dbo.ik_bs_Custom_Periods_Shift()

IF @TIME_PERIOD=1 SET @RETVAL = 
		CONVERT(datetime,
		substring(CONVERT(varchar,@GROUP_EXP_PERIOD),1,4) + '/' + 
		substring(CONVERT(varchar,@GROUP_EXP_PERIOD),5,2) + '/' + 
		substring(CONVERT(varchar,@GROUP_EXP_PERIOD),7,2)
	)
	
ELSE IF @TIME_PERIOD=2 SET @RETVAL = 
	dbo.ik_getFirstDateOfISOWeek(@GROUP_EXP_PERIOD)
	
ELSE IF @TIME_PERIOD=3 SET @RETVAL = 
	CONVERT(datetime,
		substring(CONVERT(varchar,@GROUP_EXP_PERIOD),1,4)+'/'+
		substring(CONVERT(varchar,@GROUP_EXP_PERIOD),5,2)+'/'+
		'1')

ELSE IF @TIME_PERIOD=4 SET @RETVAL = 
	CONVERT(datetime,
		substring(CONVERT(varchar,@GROUP_EXP_PERIOD),1,4)+'/'+
		CONVERT(varchar,CONVERT(int,substring(CONVERT(varchar,@GROUP_EXP_PERIOD),5,2)) * 3)+'/'+
		'1')

ELSE IF @TIME_PERIOD=6 SET @RETVAL = 
	CONVERT(datetime,
		substring(CONVERT(varchar,@GROUP_EXP_PERIOD),1,4)+'/'+
		CONVERT(varchar,CONVERT(int,substring(CONVERT(varchar,@GROUP_EXP_PERIOD),5,2)) * 6)+'/'+
		'1')

ELSE IF @TIME_PERIOD=5 SET @RETVAL = 
	CONVERT(datetime,
		CONVERT(varchar,@GROUP_EXP_PERIOD)+'/'+
		'1'+'/'+
		'1')

ELSE IF @TIME_PERIOD=104 
	BEGIN
		SET @RETVAL = 
		CONVERT(datetime,
			substring(CONVERT(varchar,@GROUP_EXP_PERIOD),1,4)+'/'+
			CONVERT(varchar,CONVERT(int,substring(CONVERT(varchar,@GROUP_EXP_PERIOD),5,2)) * 3)+'/'+
			'1')
		SET @RETVAL = DATEADD(m,@SHIFT*-1,@RETVAL)
	END
ELSE IF @TIME_PERIOD=106
	BEGIN
		SET @RETVAL = 
		CONVERT(datetime,
			substring(CONVERT(varchar,@GROUP_EXP_PERIOD),1,4)+'/'+
			CONVERT(varchar,CONVERT(int,substring(CONVERT(varchar,@GROUP_EXP_PERIOD),5,2)) * 6)+'/'+
			'1')

		SET @RETVAL = DATEADD(m,@SHIFT*-1,@RETVAL)
	END

ELSE IF @TIME_PERIOD=105 
	BEGIN
		SET @RETVAL = 
		CONVERT(datetime,
			CONVERT(varchar,@GROUP_EXP_PERIOD)+'/'+
			'1'+'/'+
			'1')

		SET @RETVAL = DATEADD(m,@SHIFT*-1,@RETVAL)

	END		
RETURN (@RETVAL)
END
GO

GO
--SqlScripter----[dbo].[ik_bs_Periods_Grouping].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_bs_Periods_Grouping]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_bs_Periods_Grouping] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_bs_Periods_Grouping]
(
		@TIME_PERIOD int,
		@DATE datetime
	)
RETURNS int
AS
BEGIN

DECLARE @RETVAL int

IF @TIME_PERIOD=1 SET @RETVAL = DATEPART(yyyy,@DATE) * 10000 + DATEPART(m,@DATE)* 100 + DATEPART(day,@DATE)
ELSE IF @TIME_PERIOD=2 SET @RETVAL = dbo.ik_ISOweek(@DATE)
ELSE IF @TIME_PERIOD=3 SET @RETVAL = DATEPART(yyyy,@DATE)*100+DATEPART(m,@DATE)
ELSE IF @TIME_PERIOD=4 SET @RETVAL = DATEPART(yyyy,@DATE)*100+DATEPART(q,@DATE)
ELSE IF @TIME_PERIOD=6 SET @RETVAL = DATEPART(yyyy,@DATE)*100+FLOOR((DATEPART(q,@DATE)+1)/2)
ELSE IF @TIME_PERIOD=5 SET @RETVAL = DATEPART(yyyy,@DATE)
ELSE IF @TIME_PERIOD=104 SET @RETVAL = dbo.ik_CustomQuarter(@DATE)
ELSE IF @TIME_PERIOD=106 SET @RETVAL = dbo.ik_CustomSemester(@DATE)
ELSE IF @TIME_PERIOD=105 SET @RETVAL = dbo.ik_CustomYear(@DATE)


RETURN (@RETVAL)
END
GO

GO
--SqlScripter----[dbo].[ik_CustomQuarter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_CustomQuarter]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_CustomQuarter] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_CustomQuarter]
(
		@THEDATE datetime
	)
RETURNS int
AS
BEGIN

DECLARE @SHIFT int
SET @SHIFT = dbo.ik_bs_Custom_Periods_Shift()

DECLARE @RETVAL int
DECLARE @YEAR int
DECLARE @YEARSTART datetime
DECLARE @TRIMESTER int

SET @YEAR = dbo.ik_CustomYear(@THEDATE)
SET @YEARSTART = LTRIM(STR(@YEAR)) +'/1/1'
SET @YEARSTART = DATEADD(m,@SHIFT*-1,@YEARSTART)

IF @THEDATE <= DATEADD(d,-1,DATEADD(m,3,@YEARSTART)) SET @TRIMESTER = 1
ELSE IF @THEDATE <=  DATEADD(d,-1,DATEADD(m,6,@YEARSTART)) SET @TRIMESTER = 2
ELSE IF @THEDATE <=  DATEADD(d,-1,DATEADD(m,9,@YEARSTART)) SET @TRIMESTER = 3
ELSE SET @TRIMESTER = 4

SET @RETVAL = @YEAR * 100 + @TRIMESTER

RETURN (@RETVAL)
END
GO

GO
--SqlScripter----[dbo].[ik_CustomSemester].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_CustomSemester]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_CustomSemester] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_CustomSemester]
(
		@THEDATE datetime
	)
RETURNS int
AS
BEGIN

DECLARE @SHIFT int
SET @SHIFT = dbo.ik_bs_Custom_Periods_Shift()

DECLARE @RETVAL int
DECLARE @YEAR int
DECLARE @YEARSTART datetime
DECLARE @SEMESTER int

SET @YEAR = dbo.ik_CustomYear(@THEDATE)
SET @YEARSTART = LTRIM(STR(@YEAR)) +'/1/1'
SET @YEARSTART = DATEADD(m,@SHIFT*-1,@YEARSTART)
SET @YEARSTART = DATEADD(m,6,@YEARSTART)
SET @YEARSTART = DATEADD(d,-1,@YEARSTART)

IF @THEDATE <=  @YEARSTART SET @SEMESTER = 1
ELSE SET @SEMESTER = 2

SET @RETVAL = @YEAR * 100 + @SEMESTER

RETURN (@RETVAL)
END
GO

GO
--SqlScripter----[dbo].[ik_CustomYear].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_CustomYear]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_CustomYear] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_CustomYear]
(
		@THEDATE datetime
	)
RETURNS int
AS
BEGIN

DECLARE @SHIFT int
SET @SHIFT = dbo.ik_bs_Custom_Periods_Shift()

DECLARE @RETVAL int

DECLARE @NEWDATE datetime
SET @NEWDATE = DATEADD(m,@SHIFT,@THEDATE)
SET @RETVAL = DATEPART(yyyy,@NEWDATE)
	
RETURN (@RETVAL)
END
GO

GO
--SqlScripter----[dbo].[ik_DateFirst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_DateFirst]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_DateFirst] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_DateFirst]
() RETURNS INT
   AS
BEGIN
   RETURN 7
END
GO

GO
--SqlScripter----[dbo].[ik_doc_getCurrentProcess].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_doc_getCurrentProcess]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_doc_getCurrentProcess] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_doc_getCurrentProcess]
(
	@DOCCODE int
	)
RETURNS int
AS
BEGIN


DECLARE @PROCESO int
DECLARE @PROCESOREVISA int
DECLARE @PROCESOAPRUEBA int

DECLARE @RESULTADOREVISA int
DECLARE @RESULTADOAPRUEBA int
DECLARE @RESULTADODISTRIBUYE int

DECLARE @L_ISSURVEY int

SELECT @PROCESO=PROCESO,@PROCESOREVISA=PROCESOREVISA,@PROCESOAPRUEBA=PROCESOAPRUEBA,@RESULTADOREVISA=RESULTADOREVISA,@RESULTADOAPRUEBA=RESULTADOAPRUEBA,@RESULTADODISTRIBUYE=RESULTADODISTRIBUYE,@L_ISSURVEY=L_ISSURVEY   FROM DOCUMENTOS WHERE CODIGO=@DOCCODE

DECLARE @DOCUMENTCURRENTPROCESS_ENUM tinyint
SET @DOCUMENTCURRENTPROCESS_ENUM=6-- ProcessType.None

IF @PROCESO=1 
BEGIN
	IF @PROCESOREVISA<>0
	BEGIN
		IF @RESULTADOREVISA=0
		BEGIN
			SET @DOCUMENTCURRENTPROCESS_ENUM=1--ProcessType.Revision
		END		
	END
END
ELSE IF @PROCESO=2
BEGIN
	IF @PROCESOAPRUEBA<>0
	BEGIN
		IF @RESULTADOAPRUEBA =0
		BEGIN
			SET @DOCUMENTCURRENTPROCESS_ENUM=2--ProcessType.Approval
		END		
	END
END

ELSE IF @PROCESO=5 OR @PROCESO=6
BEGIN
	IF @L_ISSURVEY=0
	BEGIN
		IF @RESULTADODISTRIBUYE=0
		BEGIN
			SET @DOCUMENTCURRENTPROCESS_ENUM=3--ProcessType.Distribution
		END
	END
END

RETURN @DOCUMENTCURRENTPROCESS_ENUM

END
GO

GO
--SqlScripter----[dbo].[ik_doc_getIsoIdFromMask].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_doc_getIsoIdFromMask]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_doc_getIsoIdFromMask] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_doc_getIsoIdFromMask]
(
	@CODIGO_TIPO_DOC int
)
RETURNS nvarchar(25)
AS
BEGIN

	DECLARE @COSIGOISO nvarchar(250)
	SET @COSIGOISO=NULL

	DECLARE @MASCARA nvarchar(500)
	DECLARE @TIPODOC nvarchar(10)
	DECLARE @CANT INT

	SELECT @MASCARA=MASCARA, @TIPODOC=TIPO, @CANT =ISNULL(CANT,0) FROM TIPOSDOCUMENTOS WHERE CODIGO=@CODIGO_TIPO_DOC

	IF (LEN(ISNULL(@MASCARA,''))>0)
	BEGIN
		SET @COSIGOISO = REPLACE(@MASCARA,'[DT]',@TIPODOC)
		SET @COSIGOISO = REPLACE(@COSIGOISO ,'[ORD]',LTRIM(STR(@CANT)) )
		SET @COSIGOISO = REPLACE(@COSIGOISO ,'[YMD]',LTRIM(STR(DATEPART(yy,GETDATE()))) + LTRIM(STR(DATEPART(mm,GETDATE()))) + LTRIM(STR(DATEPART(dd,GETDATE()))) )
		SET @COSIGOISO = REPLACE(@COSIGOISO ,'[MD]', LTRIM(STR(DATEPART(mm,GETDATE()))) + LTRIM(STR(DATEPART(dd,GETDATE()))) )
	END
	RETURN @COSIGOISO	

END
GO

GO
--SqlScripter----[dbo].[ik_FormatPeriod4Reports].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_FormatPeriod4Reports]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_FormatPeriod4Reports] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_FormatPeriod4Reports]
(
		@TIME_PERIOD int,
		@DATE datetime
	)
RETURNS nvarchar(100)
AS
BEGIN

DECLARE @RETVAL nvarchar(100)

IF @TIME_PERIOD=1 
	SET @RETVAL = FORMAT(@DATE, 'd' )
IF @TIME_PERIOD=2 
BEGIN
	SET @RETVAL =  dbo.ik_bs_Periods_Grouping(@TIME_PERIOD,@DATE)
	SET @RETVAL = 'W ' + SUBSTRING(@RETVAL, 5,2) + '-' + SUBSTRING(@RETVAL,1,4) 
END
ELSE IF @TIME_PERIOD=3 
	SET @RETVAL =  FORMAT(@DATE, 'MMM yyyy') 
ELSE IF @TIME_PERIOD=4 
BEGIN
	SET @RETVAL =  dbo.ik_bs_Periods_Grouping(@TIME_PERIOD,@DATE)
	SET @RETVAL =  'Q ' + SUBSTRING(@RETVAL,5,2) + '-' + SUBSTRING(@RETVAL,1,4) 
END
ELSE IF @TIME_PERIOD=6 
BEGIN
	SET @RETVAL =  dbo.ik_bs_Periods_Grouping(@TIME_PERIOD,@DATE)
	SET @RETVAL =  'S ' + SUBSTRING(@RETVAL,5,2) + '-' + SUBSTRING(@RETVAL,1,4) 
END
ELSE IF @TIME_PERIOD=5 SET 
	@RETVAL = 'Y ' + CONVERT(nvarchar(100),DATEPART(yyyy,@DATE))
ELSE
	SET @RETVAL = FORMAT(@DATE, 'd' )


RETURN (@RETVAL)
END
GO

GO
--SqlScripter----[dbo].[IK_Get_ConsecuenciaCodeCell_NoConformidades].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[IK_Get_ConsecuenciaCodeCell_NoConformidades]') IS NULL EXEC('CREATE FUNCTION [dbo].[IK_Get_ConsecuenciaCodeCell_NoConformidades] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[IK_Get_ConsecuenciaCodeCell_NoConformidades]
(
		@CODIGO_NC INT,
		@CODIGO_MATRIZ INT,
		@NIVEL_NC INT
	)
RETURNS INT
AS
BEGIN

	DECLARE @MIN_NIVEL_MATRIZ INT
	SELECT @MIN_NIVEL_MATRIZ = MIN_NIVEL FROM TBL_MATRICES_CONSECUENCIAS WHERE CODIGO = @CODIGO_MATRIZ

	DECLARE @CODIGO_NIVEL INT
		SELECT	@CODIGO_NIVEL = CODIGO
		FROM	TBL_CONSECUENCIAS_FILAS 
		WHERE	CODIGO_CUADRO_FILA = @CODIGO_MATRIZ AND NIVEL = @NIVEL_NC

	RETURN @CODIGO_NIVEL

END
GO

GO
--SqlScripter----[dbo].[ik_GET_ConsequenceCell_NCCC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_GET_ConsequenceCell_NCCC]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_GET_ConsequenceCell_NCCC] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_GET_ConsequenceCell_NCCC]
(
		@CODIGO_NC INT,
		@CODIGO_MATRIZ INT,
		@NIVEL_NC INT
	)
RETURNS NVARCHAR(400)
AS
BEGIN
	DECLARE @Resultado NVARCHAR(400)

	DECLARE @MIN_NIVEL_MATRIZ INT
	SELECT @MIN_NIVEL_MATRIZ = MIN_NIVEL FROM TBL_MATRICES_CONSECUENCIAS WHERE CODIGO = @CODIGO_MATRIZ

	DECLARE @CODIGO_NIVEL INT
	DECLARE @DESCRIPCION_NIVEL NVARCHAR(100)
		SELECT	@CODIGO_NIVEL = CODIGO, @DESCRIPCION_NIVEL = DESCRIPCION
		FROM	TBL_CONSECUENCIAS_FILAS 
		WHERE	CODIGO_CUADRO_FILA = @CODIGO_MATRIZ AND NIVEL = @NIVEL_NC

	IF (@NIVEL_NC > @MIN_NIVEL_MATRIZ)
		SET @Resultado = dbo.CONCAT5('<SPAN style="display:block; color:white; background-color:#FF493F; font-weight:bold; text-align:center;">', @DESCRIPCION_NIVEL, '(', CONVERT(nvarchar(4), @NIVEL_NC), ')</SPAN>')
	ELSE
		SET @Resultado = dbo.CONCAT4(@DESCRIPCION_NIVEL, '(', CONVERT(nvarchar(50), @NIVEL_NC), ')')

	RETURN @Resultado
END
GO

GO
--SqlScripter----[dbo].[ik_GET_ConsequenceCode_NCCC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_GET_ConsequenceCode_NCCC]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_GET_ConsequenceCode_NCCC] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_GET_ConsequenceCode_NCCC]
(
		@CODIGO_NC INT,
		@CODIGO_MATRIZ INT,
		@NIVEL_NC INT
	)
RETURNS INT
AS
BEGIN

	DECLARE @MIN_NIVEL_MATRIZ INT
	SELECT @MIN_NIVEL_MATRIZ = MIN_NIVEL FROM TBL_MATRICES_CONSECUENCIAS WHERE CODIGO = @CODIGO_MATRIZ

	DECLARE @CODIGO_NIVEL INT
		SELECT	@CODIGO_NIVEL = CODIGO
		FROM	TBL_CONSECUENCIAS_FILAS 
		WHERE	CODIGO_CUADRO_FILA = @CODIGO_MATRIZ AND NIVEL = @NIVEL_NC

	RETURN @CODIGO_NIVEL

END
GO

GO
--SqlScripter----[dbo].[ik_GET_DateCell_NCCC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_GET_DateCell_NCCC]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_GET_DateCell_NCCC] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_GET_DateCell_NCCC]
(
		@CODIGONC INT,
		@FECHA_TOPE DATETIME,
		@ETAPA INT,
		@CUMPLIDA INT
	)
RETURNS NVARCHAR(400)
AS
BEGIN
	DECLARE @Resultado NVARCHAR(400)
	
	IF (@FECHA_TOPE IS NULL) 
	Begin
		SET @Resultado = 'N/A'
		RETURN @Resultado;
	End
	
	IF (@CUMPLIDA = 0)
	Begin
		IF (@FECHA_TOPE < getdate())
			Begin
				SET @Resultado = dbo.CONCAT7('<SPAN style="display:block; color:FF493F; font-weight:bold; text-align:center;">'
									, CAST(Day(@FECHA_TOPE) AS NVarChar(10)), '/' 
									, CAST(Month(@FECHA_TOPE) AS NVarChar(10)), '/' 
									, CAST(Year(@FECHA_TOPE) AS NVarChar(10)),
								 '</SPAN>')
			End
		ELSE 
			Begin
				IF ((SELECT MAX(FECHALIMITE) FROM VISTA_NCTAREAS WHERE CODIGONC = @CODIGONC AND ETAPA = @ETAPA AND L_CUMPLIDA = 0) > @FECHA_TOPE) 
					Begin
						SET @Resultado = dbo.CONCAT7('<SPAN style="display:block; color:black; background-color:yellow; font-weight:bold; text-align:center;">'
											, CAST(Day(@FECHA_TOPE) AS NVarChar(10)), '/' 
											, CAST(Month(@FECHA_TOPE) AS NVarChar(10)), '/' 
											, CAST(Year(@FECHA_TOPE) AS NVarChar(10)),
										 '</SPAN>')
					End
				ELSE
					Begin
						SET @Resultado = dbo.CONCAT7('<SPAN style="display:block; color:black; text-align:center;">'
											, CAST(Day(@FECHA_TOPE) AS NVarChar(10)), '/' 
											, CAST(Month(@FECHA_TOPE) AS NVarChar(10)), '/' 
											, CAST(Year(@FECHA_TOPE) AS NVarChar(10)),
										 '</SPAN>')
					End
			End
	End
	ELSE
	Begin
		SET @Resultado = dbo.CONCAT7('<SPAN style="display:block; color:black; text-align:center;">'
						, CAST(Day(@FECHA_TOPE) AS NVarChar(10)), '/' 
						, CAST(Month(@FECHA_TOPE) AS NVarChar(10)), '/' 
						, CAST(Year(@FECHA_TOPE) AS NVarChar(10)),
						 '</SPAN>')
	End 
	RETURN @Resultado
END
GO

GO
--SqlScripter----[dbo].[ik_GET_RespCell_ACC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_GET_RespCell_ACC]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_GET_RespCell_ACC] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_GET_RespCell_ACC]
(
	@CODIGO_NC INT,
	@CO_L_IS_IKUSER INT,
	@CO_USUARIO NVARCHAR(200),
	@CO_NOMBRES NVARCHAR(200),
	@CO_APELLIDOS NVARCHAR(200),
	@CO_L_DELETED INT,
	@CO_L_IS_IKPERSON_DELETED INT
) 
RETURNS NVARCHAR(4000) AS
BEGIN
	DECLARE @STR_CO NVARCHAR(300)
	SET @STR_CO = 'N/A'
	IF (@CO_USUARIO IS NOT NULL) SET @STR_CO = @CO_USUARIO
	IF (@CO_L_IS_IKUSER = 1 AND @CO_L_DELETED = 0)  SET @STR_CO = @CO_USUARIO
	IF (@CO_L_IS_IKUSER = 1 AND @CO_L_DELETED = 1)  SET @STR_CO = 'N/A - ' + @CO_USUARIO
	IF (@CO_L_IS_IKUSER = 0 AND @CO_L_IS_IKPERSON_DELETED = 0)  SET @STR_CO = ISNULL(@CO_NOMBRES, '') + ' ' + ISNULL(@CO_APELLIDOS, '')
	IF (@CO_L_IS_IKUSER = 0 AND @CO_L_IS_IKPERSON_DELETED = 1)  SET @STR_CO = 'N/A - ' + ISNULL(@CO_NOMBRES, '') + ' ' + ISNULL(@CO_APELLIDOS, '')
		
	DECLARE @STR_HTML NVARCHAR(4000)
	SET @STR_HTML = '<TABLE style="width:100%">'
	SET @STR_HTML = @STR_HTML + '<TR>'
	SET @STR_HTML = @STR_HTML + '<TD width="49%" >&nbsp;</TD>'
	SET @STR_HTML = @STR_HTML + '<TD class="BrowserItem" width="2%" align="center" valign="middle">'
	SET @STR_HTML = @STR_HTML + '<IMG onClick="var obj;'
	SET @STR_HTML = @STR_HTML + 'obj=getElementById(''TablaResponsables_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + ''');'
	SET @STR_HTML = @STR_HTML + 'if(obj.style.display==''none''){obj.style.display='''';}else{obj.style.display=''none'';} '
	SET @STR_HTML = @STR_HTML + 'var objAux=getElementById(''DescCelda_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + ''');'
	SET @STR_HTML = @STR_HTML + 'if(obj.style.display==''none''){objAux.innerText=''...'';}else{objAux.innerText='''';} '
	SET @STR_HTML = @STR_HTML + 'var image = this.src; var arrayString = image.split(''/'');'
	SET @STR_HTML = @STR_HTML + 'if (arrayString[arrayString.length-1]==''plusSinMargen.png''){this.src=''Images/minusSinMargen.png'';}else{this.src=''Images/plusSinMargen.png''};" '
	SET @STR_HTML = @STR_HTML + 'src="Images/plusSinMargen.png" height="9" width="9" border="0" />'
	SET @STR_HTML = @STR_HTML + '</TD>'
	SET @STR_HTML = @STR_HTML + '<TD width="49%" id="DescCelda_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + '" name="DescCelda_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + '" align="left" valign="middle">...</TD>'
	SET @STR_HTML = @STR_HTML + '</TR>'	
	SET @STR_HTML = @STR_HTML + '<TR id="TablaResponsables_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + '" name="TablaResponsables_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + '" style="display:none;">'
	SET @STR_HTML = @STR_HTML + '<TD class="BrowserItem" colspan="3" align="center" >'
	SET @STR_HTML = @STR_HTML + '<TABLE style="width:100%">'
	SET @STR_HTML = @STR_HTML + '<TR>'
	SET @STR_HTML = @STR_HTML + '<TD class="BrowserItem"><B>CO&nbsp;-&nbsp;</B>' + @STR_CO + '</TD>'
	SET @STR_HTML = @STR_HTML + '</TR>'
	
	DECLARE @STR_AUX NVARCHAR(300)
	DECLARE @ETAPA INT
	DECLARE @NOMBRE_ETAPA NVARCHAR(300)
	DECLARE @CODIGO_RESPONSABLE INT
	DECLARE @L_IS_IKUSER INT
	DECLARE @USUARIO NVARCHAR(300)
	DECLARE @NOMBRES NVARCHAR(300)
	DECLARE @APELLIDOS NVARCHAR(300)
	DECLARE @L_DELETED INT
	DECLARE @L_IS_IKPERSON_DELETED INT
	
	DECLARE PTR CURSOR LOCAL FAST_FORWARD FOR 
		SELECT 	T_NCETAPAS.ETAPA, T_NCETAPAS.DESCRIPCIONCORTA
				, T1.CODIGO_CARGO_RESPONSABLE
				, T3.L_IS_IKUSER, T3.USUARIO, T3.NOMBRES, T3.APELLIDOS, T3.L_DELETED, T3.L_IS_IKPERSON_DELETED
		FROM	NC_WF_ETAPAS T1
					INNER JOIN NCETAPAS T_NCETAPAS
						ON T1.CODIGO_NCETAPAS = T_NCETAPAS.CODIGO
					LEFT OUTER JOIN VISTA_CARGOSUSUARIOS T2
						ON T1.CODIGO_CARGO_RESPONSABLE = T2.CODIGOCARGO
					LEFT OUTER JOIN PERSONAS T3
						ON T2.CODIGOUSUARIO = T3.CODIGO
		WHERE	T1.L_EXCLUIDA = 0 AND T1.CODIGO_NC = @CODIGO_NC AND T_NCETAPAS.ETAPA IN (1,2,3)
		ORDER BY ETAPA
	
	OPEN PTR 
	FETCH NEXT FROM PTR INTO @ETAPA, @NOMBRE_ETAPA, @CODIGO_RESPONSABLE, @L_IS_IKUSER, @USUARIO, @NOMBRES, @APELLIDOS, @L_DELETED, @L_IS_IKPERSON_DELETED

	DECLARE @NN NVARCHAR(20)
	DECLARE @I INT
	SET @I = 1
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @NN = 'ACC'
		IF (@I = 2)
			SET @NN = 'IMP'
		IF (@I = 3)
			SET @NN = 'EFI'
		SET @I = @I + 1
		
		SET @STR_AUX = 'N/A'
		IF (@CODIGO_RESPONSABLE IS NOT NULL) SET @STR_AUX = @USUARIO
		IF (@L_IS_IKUSER = 1 AND @L_DELETED = 0)  SET @STR_AUX = @USUARIO
		IF (@L_IS_IKUSER = 1 AND @L_DELETED = 1)  SET @STR_AUX = 'N/A - ' + @USUARIO
		IF (@L_IS_IKUSER = 0 AND @L_IS_IKPERSON_DELETED = 0)  SET @STR_AUX = ISNULL(@NOMBRES, '') + ' ' + ISNULL(@APELLIDOS, '')
		IF (@L_IS_IKUSER = 0 AND @L_IS_IKPERSON_DELETED = 1)  SET @STR_AUX = 'N/A - ' + ISNULL(@NOMBRES, '') + ' ' + ISNULL(@APELLIDOS, '')
		
		SET @STR_HTML = @STR_HTML + '<TR>'
		SET @STR_HTML = @STR_HTML + '<TD class="BrowserItem"><B>' + @NN + '&nbsp;-&nbsp;</B>' + @STR_AUX + '</TD>'
		SET @STR_HTML = @STR_HTML + '</TR>'
		
		FETCH NEXT FROM PTR INTO @ETAPA, @NOMBRE_ETAPA, @CODIGO_RESPONSABLE, @L_IS_IKUSER, @USUARIO, @NOMBRES, @APELLIDOS, @L_DELETED, @L_IS_IKPERSON_DELETED
	END
	CLOSE PTR
	DEALLOCATE PTR
	
	SET @STR_HTML = @STR_HTML + '</TABLE>'
	SET @STR_HTML = @STR_HTML + '</TD>'
	SET @STR_HTML = @STR_HTML + '</TR>'
	SET @STR_HTML = @STR_HTML + '</TABLE>'
	RETURN @STR_HTML
END
GO

GO
--SqlScripter----[dbo].[ik_GET_RespCell_INC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_GET_RespCell_INC]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_GET_RespCell_INC] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_GET_RespCell_INC]
(
	@CODIGO_NC INT,
	@CO_L_IS_IKUSER INT,
	@CO_USUARIO NVARCHAR(200),
	@CO_NOMBRES NVARCHAR(200),
	@CO_APELLIDOS NVARCHAR(200),
	@CO_L_DELETED INT,
	@CO_L_IS_IKPERSON_DELETED INT
) 
RETURNS NVARCHAR(4000) AS
BEGIN
	DECLARE @STR_CO NVARCHAR(300)
	SET @STR_CO = 'N/A'
	IF (@CO_USUARIO IS NOT NULL) SET @STR_CO = @CO_USUARIO
	IF (@CO_L_IS_IKUSER = 1 AND @CO_L_DELETED = 0)  SET @STR_CO = @CO_USUARIO
	IF (@CO_L_IS_IKUSER = 1 AND @CO_L_DELETED = 1)  SET @STR_CO = 'N/A - ' + @CO_USUARIO
	IF (@CO_L_IS_IKUSER = 0 AND @CO_L_IS_IKPERSON_DELETED = 0)  SET @STR_CO = ISNULL(@CO_NOMBRES, '') + ' ' + ISNULL(@CO_APELLIDOS, '')
	IF (@CO_L_IS_IKUSER = 0 AND @CO_L_IS_IKPERSON_DELETED = 1)  SET @STR_CO = 'N/A - ' + ISNULL(@CO_NOMBRES, '') + ' ' + ISNULL(@CO_APELLIDOS, '')
		
	DECLARE @STR_HTML NVARCHAR(4000)
	SET @STR_HTML = '<TABLE style="width:100%">'
	SET @STR_HTML = @STR_HTML + '<TR>'
	SET @STR_HTML = @STR_HTML + '<TD width="49%" >&nbsp;</TD>'
	SET @STR_HTML = @STR_HTML + '<TD class="BrowserItem" width="2%" align="center" valign="middle">'
	SET @STR_HTML = @STR_HTML + '<IMG onClick="var obj;'
	SET @STR_HTML = @STR_HTML + 'obj=getElementById(''TablaResponsables_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + ''');'
	SET @STR_HTML = @STR_HTML + 'if(obj.style.display==''none''){obj.style.display='''';}else{obj.style.display=''none'';} '
	SET @STR_HTML = @STR_HTML + 'var objAux=getElementById(''DescCelda_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + ''');'
	SET @STR_HTML = @STR_HTML + 'if(obj.style.display==''none''){objAux.innerText=''...'';}else{objAux.innerText='''';} '
	SET @STR_HTML = @STR_HTML + 'var image = this.src; var arrayString = image.split(''/'');'
	SET @STR_HTML = @STR_HTML + 'if (arrayString[arrayString.length-1]==''plusSinMargen.png''){this.src=''Images/minusSinMargen.png'';}else{this.src=''Images/plusSinMargen.png''};" '
	SET @STR_HTML = @STR_HTML + 'src="Images/plusSinMargen.png" height="9" width="9" border="0" />'
	SET @STR_HTML = @STR_HTML + '</TD>'
	SET @STR_HTML = @STR_HTML + '<TD width="49%" id="DescCelda_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + '" name="DescCelda_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + '" align="left" valign="middle">...</TD>'
	SET @STR_HTML = @STR_HTML + '</TR>'	
	SET @STR_HTML = @STR_HTML + '<TR id="TablaResponsables_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + '" name="TablaResponsables_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + '" style="display:none;">'
	SET @STR_HTML = @STR_HTML + '<TD class="BrowserItem" colspan="3" align="center" >'
	SET @STR_HTML = @STR_HTML + '<TABLE style="width:100%">'
	SET @STR_HTML = @STR_HTML + '<TR>'
	SET @STR_HTML = @STR_HTML + '<TD class="BrowserItem"><B>CO&nbsp;-&nbsp;</B>' + @STR_CO + '</TD>'
	SET @STR_HTML = @STR_HTML + '</TR>'
	
	DECLARE @STR_AUX NVARCHAR(300)
	DECLARE @ETAPA INT
	DECLARE @NOMBRE_ETAPA NVARCHAR(300)
	DECLARE @CODIGO_RESPONSABLE INT
	DECLARE @L_IS_IKUSER INT
	DECLARE @USUARIO NVARCHAR(300)
	DECLARE @NOMBRES NVARCHAR(300)
	DECLARE @APELLIDOS NVARCHAR(300)
	DECLARE @L_DELETED INT
	DECLARE @L_IS_IKPERSON_DELETED INT
	
	DECLARE PTR CURSOR LOCAL FAST_FORWARD FOR 
		SELECT 	T_NCETAPAS.ETAPA, T_NCETAPAS.DESCRIPCIONCORTA
				, T1.CODIGO_CARGO_RESPONSABLE
				, T3.L_IS_IKUSER, T3.USUARIO, T3.NOMBRES, T3.APELLIDOS, T3.L_DELETED, T3.L_IS_IKPERSON_DELETED
		FROM	NC_WF_ETAPAS T1
					INNER JOIN NCETAPAS T_NCETAPAS
						ON T1.CODIGO_NCETAPAS = T_NCETAPAS.CODIGO
					LEFT OUTER JOIN VISTA_CARGOSUSUARIOS T2
						ON T1.CODIGO_CARGO_RESPONSABLE = T2.CODIGOCARGO
					LEFT OUTER JOIN PERSONAS T3
						ON T2.CODIGOUSUARIO = T3.CODIGO
		WHERE	T1.L_EXCLUIDA = 0 AND T1.CODIGO_NC = @CODIGO_NC AND T_NCETAPAS.ETAPA IN (1)
		ORDER BY ETAPA
	
	OPEN PTR 
	FETCH NEXT FROM PTR INTO @ETAPA, @NOMBRE_ETAPA, @CODIGO_RESPONSABLE, @L_IS_IKUSER, @USUARIO, @NOMBRES, @APELLIDOS, @L_DELETED, @L_IS_IKPERSON_DELETED

	DECLARE @NN NVARCHAR(20)
	DECLARE @I INT
	SET @I = 1
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @NN = 'ACC'
		
		SET @I = @I + 1
		
		SET @STR_AUX = 'N/A'
		IF (@CODIGO_RESPONSABLE IS NOT NULL) SET @STR_AUX = @USUARIO
		IF (@L_IS_IKUSER = 1 AND @L_DELETED = 0)  SET @STR_AUX = @USUARIO
		IF (@L_IS_IKUSER = 1 AND @L_DELETED = 1)  SET @STR_AUX = 'N/A - ' + @USUARIO
		IF (@L_IS_IKUSER = 0 AND @L_IS_IKPERSON_DELETED = 0)  SET @STR_AUX = ISNULL(@NOMBRES, '') + ' ' + ISNULL(@APELLIDOS, '')
		IF (@L_IS_IKUSER = 0 AND @L_IS_IKPERSON_DELETED = 1)  SET @STR_AUX = 'N/A - ' + ISNULL(@NOMBRES, '') + ' ' + ISNULL(@APELLIDOS, '')
		
		SET @STR_HTML = @STR_HTML + '<TR>'
		SET @STR_HTML = @STR_HTML + '<TD class="BrowserItem"><B>' + @NN + '&nbsp;-&nbsp;</B>' + @STR_AUX + '</TD>'
		SET @STR_HTML = @STR_HTML + '</TR>'
		
		FETCH NEXT FROM PTR INTO @ETAPA, @NOMBRE_ETAPA, @CODIGO_RESPONSABLE, @L_IS_IKUSER, @USUARIO, @NOMBRES, @APELLIDOS, @L_DELETED, @L_IS_IKPERSON_DELETED
	END
	CLOSE PTR
	DEALLOCATE PTR
	
	SET @STR_HTML = @STR_HTML + '</TABLE>'
	SET @STR_HTML = @STR_HTML + '</TD>'
	SET @STR_HTML = @STR_HTML + '</TR>'
	SET @STR_HTML = @STR_HTML + '</TABLE>'
	RETURN @STR_HTML
END
GO

GO
--SqlScripter----[dbo].[ik_GET_RespCell_NC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_GET_RespCell_NC]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_GET_RespCell_NC] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_GET_RespCell_NC]
(
	@CODIGO_NC INT,
	@CO_L_IS_IKUSER INT,
	@CO_USUARIO NVARCHAR(200),
	@CO_NOMBRES NVARCHAR(200),
	@CO_APELLIDOS NVARCHAR(200),
	@CO_L_DELETED INT,
	@CO_L_IS_IKPERSON_DELETED INT
) 
RETURNS NVARCHAR(4000) AS
BEGIN
	DECLARE @STR_CO NVARCHAR(300)
	SET @STR_CO = 'N/A'
	IF (@CO_USUARIO IS NOT NULL) SET @STR_CO = @CO_USUARIO
	IF (@CO_L_IS_IKUSER = 1 AND @CO_L_DELETED = 0)  SET @STR_CO = @CO_USUARIO
	IF (@CO_L_IS_IKUSER = 1 AND @CO_L_DELETED = 1)  SET @STR_CO = 'N/A - ' + @CO_USUARIO
	IF (@CO_L_IS_IKUSER = 0 AND @CO_L_IS_IKPERSON_DELETED = 0)  SET @STR_CO = ISNULL(@CO_NOMBRES, '') + ' ' + ISNULL(@CO_APELLIDOS, '')
	IF (@CO_L_IS_IKUSER = 0 AND @CO_L_IS_IKPERSON_DELETED = 1)  SET @STR_CO = 'N/A - ' + ISNULL(@CO_NOMBRES, '') + ' ' + ISNULL(@CO_APELLIDOS, '')
		
	DECLARE @STR_HTML NVARCHAR(4000)
	SET @STR_HTML = '<TABLE style="width:100%">'
	SET @STR_HTML = @STR_HTML + '<TR>'
	SET @STR_HTML = @STR_HTML + '<TD width="49%" >&nbsp;</TD>'
	SET @STR_HTML = @STR_HTML + '<TD class="BrowserItem" width="2%" align="center" valign="middle">'
	SET @STR_HTML = @STR_HTML + '<IMG onClick="var obj;'
	SET @STR_HTML = @STR_HTML + 'obj=getElementById(''TablaResponsables_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + ''');'
	SET @STR_HTML = @STR_HTML + 'if(obj.style.display==''none''){obj.style.display='''';}else{obj.style.display=''none'';} '
	SET @STR_HTML = @STR_HTML + 'var objAux=getElementById(''DescCelda_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + ''');'
	SET @STR_HTML = @STR_HTML + 'if(obj.style.display==''none''){objAux.innerText=''...'';}else{objAux.innerText='''';} '
	SET @STR_HTML = @STR_HTML + 'var image = this.src; var arrayString = image.split(''/'');'
	SET @STR_HTML = @STR_HTML + 'if (arrayString[arrayString.length-1]==''plusSinMargen.png''){this.src=''Images/minusSinMargen.png'';}else{this.src=''Images/plusSinMargen.png''};" '
	SET @STR_HTML = @STR_HTML + 'src="Images/plusSinMargen.png" height="9" width="9" border="0" />'
	SET @STR_HTML = @STR_HTML + '</TD>'
	SET @STR_HTML = @STR_HTML + '<TD width="49%" id="DescCelda_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + '" name="DescCelda_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + '" align="left" valign="middle">...</TD>'
	SET @STR_HTML = @STR_HTML + '</TR>'	
	SET @STR_HTML = @STR_HTML + '<TR id="TablaResponsables_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + '" name="TablaResponsables_' + CAST(@CODIGO_NC AS NVARCHAR(10)) + '" style="display:none;">'
	SET @STR_HTML = @STR_HTML + '<TD class="BrowserItem" colspan="3" align="center" >'
	SET @STR_HTML = @STR_HTML + '<TABLE style="width:100%">'
	SET @STR_HTML = @STR_HTML + '<TR>'
	SET @STR_HTML = @STR_HTML + '<TD class="BrowserItem"><B>CO&nbsp;-&nbsp;</B>' + @STR_CO + '</TD>'
	SET @STR_HTML = @STR_HTML + '</TR>'
	
	DECLARE @STR_AUX NVARCHAR(300)
	DECLARE @ETAPA INT
	DECLARE @NOMBRE_ETAPA NVARCHAR(300)
	DECLARE @CODIGO_RESPONSABLE INT
	DECLARE @L_IS_IKUSER INT
	DECLARE @USUARIO NVARCHAR(300)
	DECLARE @NOMBRES NVARCHAR(300)
	DECLARE @APELLIDOS NVARCHAR(300)
	DECLARE @L_DELETED INT
	DECLARE @L_IS_IKPERSON_DELETED INT
	
	DECLARE PTR CURSOR LOCAL FAST_FORWARD FOR 
		SELECT 	T_NCETAPAS.ETAPA, T_NCETAPAS.DESCRIPCIONCORTA
				, T1.CODIGO_CARGO_RESPONSABLE
				, T3.L_IS_IKUSER, T3.USUARIO, T3.NOMBRES, T3.APELLIDOS, T3.L_DELETED, T3.L_IS_IKPERSON_DELETED
		FROM	NC_WF_ETAPAS T1
					INNER JOIN NCETAPAS T_NCETAPAS
						ON T1.CODIGO_NCETAPAS = T_NCETAPAS.CODIGO
					LEFT OUTER JOIN VISTA_CARGOSUSUARIOS T2
						ON T1.CODIGO_CARGO_RESPONSABLE = T2.CODIGOCARGO
					LEFT OUTER JOIN PERSONAS T3
						ON T2.CODIGOUSUARIO = T3.CODIGO
		WHERE	T1.L_EXCLUIDA = 0 AND T1.CODIGO_NC = @CODIGO_NC AND T_NCETAPAS.ETAPA IN (1,2,3,5)
		ORDER BY ETAPA
	
	OPEN PTR 
	FETCH NEXT FROM PTR INTO @ETAPA, @NOMBRE_ETAPA, @CODIGO_RESPONSABLE, @L_IS_IKUSER, @USUARIO, @NOMBRES, @APELLIDOS, @L_DELETED, @L_IS_IKPERSON_DELETED

	DECLARE @NN NVARCHAR(20)
	DECLARE @I INT
	SET @I = 1
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @NN = 'AI'
		IF (@I = 2)
			SET @NN = 'AC'
		IF (@I = 3)
			SET @NN = 'ACP'
		IF (@I = 4)
			SET @NN = 'EE'
		SET @I = @I + 1
		
		SET @STR_AUX = 'N/A'
		IF (@CODIGO_RESPONSABLE IS NOT NULL) SET @STR_AUX = @USUARIO
		IF (@L_IS_IKUSER = 1 AND @L_DELETED = 0)  SET @STR_AUX = @USUARIO
		IF (@L_IS_IKUSER = 1 AND @L_DELETED = 1)  SET @STR_AUX = 'N/A - ' + @USUARIO
		IF (@L_IS_IKUSER = 0 AND @L_IS_IKPERSON_DELETED = 0)  SET @STR_AUX = ISNULL(@NOMBRES, '') + ' ' + ISNULL(@APELLIDOS, '')
		IF (@L_IS_IKUSER = 0 AND @L_IS_IKPERSON_DELETED = 1)  SET @STR_AUX = 'N/A - ' + ISNULL(@NOMBRES, '') + ' ' + ISNULL(@APELLIDOS, '')
		
		SET @STR_HTML = @STR_HTML + '<TR>'
		SET @STR_HTML = @STR_HTML + '<TD class="BrowserItem"><B>' + @NN + '&nbsp;-&nbsp;</B>' + @STR_AUX + '</TD>'
		SET @STR_HTML = @STR_HTML + '</TR>'
		
		FETCH NEXT FROM PTR INTO @ETAPA, @NOMBRE_ETAPA, @CODIGO_RESPONSABLE, @L_IS_IKUSER, @USUARIO, @NOMBRES, @APELLIDOS, @L_DELETED, @L_IS_IKPERSON_DELETED
	END
	CLOSE PTR
	DEALLOCATE PTR
	
	SET @STR_HTML = @STR_HTML + '</TABLE>'
	SET @STR_HTML = @STR_HTML + '</TD>'
	SET @STR_HTML = @STR_HTML + '</TR>'
	SET @STR_HTML = @STR_HTML + '</TABLE>'
	RETURN @STR_HTML
END
GO

GO
--SqlScripter----[dbo].[ik_GET_State_NCCC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_GET_State_NCCC]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_GET_State_NCCC] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_GET_State_NCCC]
(
		@CODIGO_NC INT
	)
RETURNS NVARCHAR(100)
AS
BEGIN
	RETURN
	(
		SELECT 	TOP 1 T_NCETAPAS.DESCRIPCIONCORTA AS ESTADO
		FROM	NC_WF_ETAPAS T1
					INNER JOIN NCETAPAS T_NCETAPAS
						ON T1.CODIGO_NCETAPAS = T_NCETAPAS.CODIGO
		WHERE	T1.L_EXCLUIDA = 0 AND T1.CODIGO_NC = @CODIGO_NC AND (T1.CODIGO_CARGO_RESPONSABLE IS NOT NULL) AND (T1.SYSTEM_CUMPLIDA IS NULL OR T1.SYSTEM_CUMPLIDA = 0)
		ORDER BY ETAPA
	)
END
GO

GO
--SqlScripter----[dbo].[ik_getAccidentTotLostDays].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_getAccidentTotLostDays]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_getAccidentTotLostDays] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_getAccidentTotLostDays]
(
		@ISSUE_ID int
	)
RETURNS int
AS
BEGIN

DECLARE @TotLostDays int

SELECT @TotLostDays=SUM(VARCHILD_ACCIDENTADOS_XT.DIAS_PERDIDOS) FROM VARCHILD_ACCIDENTADOS_XT WHERE VARCHILD_ACCIDENTADOS_XT.CODIGONC=@ISSUE_ID

RETURN @TotLostDays
END
GO

GO
--SqlScripter----[dbo].[ik_getDateOnly].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_getDateOnly]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_getDateOnly] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_getDateOnly]
(@fecha DATETIME) RETURNS DATETIME
   AS
BEGIN
   RETURN CONVERT(DATETIME, FLOOR(CONVERT(FLOAT, @fecha))) 
END
GO

GO
--SqlScripter----[dbo].[ik_getFirstDateOfISOWeek].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_getFirstDateOfISOWeek]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_getFirstDateOfISOWeek] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_getFirstDateOfISOWeek]
(	
		@ISOWEEK int
	)
	
RETURNS datetime
AS
BEGIN

	DECLARE @YEAR int
	DECLARE @WEEKNUM int	
	
	SET @YEAR = ROUND(@ISOWEEK  / 100 ,0)
	SET @WEEKNUM = @ISOWEEK - @YEAR * 100
	
	DECLARE @FDATE datetime

	DECLARE @TDAYS int
	DECLARE @BDAYS int
	DECLARE @RDAYS int
	
	SET @TDAYS = (@WEEKNUM * 7) - 7
	
	DECLARE @TMPD datetime
	SET @BDAYS = 0
	
	WHILE 1=1
	BEGIN
		SET @TMPD = CONVERT(datetime,
			CONVERT(varchar,@YEAR) + '/1/' + CONVERT(varchar,@BDAYS+1))
			
		IF dbo.ik_ISOweek(@TMPD) = @YEAR * 100 + 1 BREAK
		
		SET @BDAYS = @BDAYS  + 1
	END
	
	SET @RDAYS = @TDAYS + @BDAYS
	
	SET @FDATE = DATEADD(day, @RDAYS ,CONVERT(datetime,
			CONVERT(varchar,@YEAR) + '/' +
			'1/1'))
	
	SET @FDATE = DATEADD(day, (DATEPART(weekday, @FDATE)-1) * -1 , @FDATE)


	RETURN @FDATE
END
GO

GO
--SqlScripter----[dbo].[ik_getIssueStatus].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_getIssueStatus]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_getIssueStatus] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_getIssueStatus]
(
		@CODIGONC INT
	)
RETURNS int
AS
BEGIN

	DECLARE @ISSUE_STATUS int
	
	SELECT @ISSUE_STATUS=ESTADO FROM NCMAINPROD WHERE CODIGO=@CODIGONC 

	RETURN (@ISSUE_STATUS)
END
GO

GO
--SqlScripter----[dbo].[ik_getWorkingDays].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_getWorkingDays]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_getWorkingDays] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_getWorkingDays]
(
	@STARTDATE datetime,
	@ENDDATE datetime
	)
RETURNS int
AS
BEGIN


DECLARE @Saturday int, @Sunday int
DECLARE @satDate datetime
DECLARE @sunDate datetime

SET @satDate = '2006-08-26'
SET @sunDate = '2006-08-27'

SET @Saturday = (select datepart(weekday,@satDate))
SET @Sunday = (select datepart(weekday,@sunDate))

/*
IF @@DATEFIRST = 1
BEGIN
	SET @Saturday = 6
	SET @Sunday = 7
END
ELSE
BEGIN
	SET @Saturday = 7
	SET @Sunday = 1
END
*/

DECLARE @DAYS int
SET @DAYS=DATEDIFF(day, @STARTDATE, @ENDDATE)

IF @DAYS<0 RETURN 0


DECLARE @DOW int
DECLARE @NOTWORKING tinyint
DECLARE @CODIGO int

WHILE DATEDIFF(day, @ENDDATE, @STARTDATE)<> 0
BEGIN
	SET @NOTWORKING = 0
	SET @DOW = DATEPART(WEEKDAY,@STARTDATE)
	IF (@DOW = @Saturday OR @DOW = @Sunday) SET @NOTWORKING = 1
	ELSE
		BEGIN
		SET @CODIGO = (SELECT CODIGO FROM NCTASKS_NOT_WORKING_DAYS WHERE
					   DATEPART(day,FECHA) = DATEPART(day,@STARTDATE) AND
					   DATEPART(month,FECHA) = DATEPART(month,@STARTDATE) AND
					   DATEPART(year,FECHA) = DATEPART(year,@STARTDATE))
		IF NOT @CODIGO IS NULL SET @NOTWORKING = 1
		END
	SET @STARTDATE = @STARTDATE + 1
	SET @DAYS = @DAYS - @NOTWORKING
END

/*SET @WORKING = 0
WHILE @WORKING = 0
BEGIN
	SET @WORKING = 1
	SET @DOW = DATEPART(WEEKDAY,@STARTDATE)
	IF (@DOW = @Saturday OR @DOW = @Sunday) SET @WORKING = 0
	ELSE
		BEGIN
		SET @CODIGO = (SELECT CODIGO FROM NCTASKS_NOT_WORKING_DAYS WHERE
					   DATEPART(day,FECHA) = DATEPART(day,@STARTDATE) AND
					   DATEPART(month,FECHA) = DATEPART(month,@STARTDATE) AND
					   DATEPART(year,FECHA) = DATEPART(year,@STARTDATE))
		IF NOT @CODIGO IS NULL SET @WORKING = 0
		END
	IF @WORKING=0 SET @STARTDATE = @STARTDATE + 1
END
*/

RETURN @DAYS

END
GO

GO
--SqlScripter----[dbo].[ik_ImageOfFile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_ImageOfFile]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_ImageOfFile] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_ImageOfFile]
(
		@fileName nvarchar(3000)
	)
RETURNS varchar(100)
AS
BEGIN

DECLARE @FILE_EXT nvarchar(100)
SET @FILE_EXT  = REVERSE(SUBSTRING(REVERSE(@fileName),0,CHARINDEX('.',REVERSE(@fileName))+1))

		DECLARE @IMG varchar(100)
		
		SELECT @IMG=
		CASE
			WHEN @FILE_EXT = '.TXT' then 'Images/ico_txt.gif'
			WHEN @FILE_EXT = '.DOC' OR @FILE_EXT = '.DOCX' then 'Images/ico_doc.gif'
			WHEN @FILE_EXT = '.HTM' OR @FILE_EXT = '.HTML' then 'Images/ico_htm.gif'
			WHEN @FILE_EXT = '.MDB' then 'Images/ico_mdb.gif'
			WHEN @FILE_EXT = '.XLS' OR @FILE_EXT = '.XLSX' then 'Images/ico_xls.gif'
			WHEN @FILE_EXT = '.ZIP'OR @FILE_EXT = '.RAR' then 'Images/ico_zip.gif'		
			WHEN @FILE_EXT = '.PDF'then 'Images/i/document-pdf.png'		
			ELSE 	'Images/ico_other.gif'
		END
	RETURN @IMG
END
GO

GO
--SqlScripter----[dbo].[ik_IndicatorCalculatedStatus].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_IndicatorCalculatedStatus]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_IndicatorCalculatedStatus] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_IndicatorCalculatedStatus]
(
	@BS_MetMODES_Enum int,
	@MSR_REAL_VALUE float,
	@MSR_PLANNED_VALUE float,
	@PERC_TO_RED int
	)
RETURNS int
AS
/*
    Public Enum Colors
        Undefined = -1
        Green = 1
        Yellow = 2
        Red = 3
    End Enum

    Public Enum BS_MetMODES
        MoreIsBetter = 1
        LessIsBetter = 2
    End Enum
*/
BEGIN
	DECLARE @COLOR int
	SET @COLOR = -1
	
	IF @BS_MetMODES_Enum IS NULL OR
	   @MSR_REAL_VALUE IS NULL OR
	   @MSR_PLANNED_VALUE IS NULL OR
	   @PERC_TO_RED IS NULL
	BEGIN
		RETURN @COLOR
	END
	
	DECLARE @CRITICAL float
	
	IF @BS_MetMODES_Enum = 1
	BEGIN
		SET @CRITICAL = @MSR_PLANNED_VALUE - @MSR_PLANNED_VALUE * @PERC_TO_RED / 100
		IF @MSR_REAL_VALUE >= @MSR_PLANNED_VALUE SET @COLOR=1
		ELSE IF @MSR_REAL_VALUE >= @CRITICAL SET @COLOR = 2
		ELSE SET @COLOR = 3
	END
	ELSE
	BEGIN
		SET @CRITICAL = @MSR_PLANNED_VALUE + @MSR_PLANNED_VALUE * @PERC_TO_RED / 100
		IF @MSR_REAL_VALUE <= @MSR_PLANNED_VALUE SET @COLOR=1
		ELSE IF @MSR_REAL_VALUE <= @CRITICAL SET @COLOR = 2
		ELSE SET @COLOR = 3
	END

	RETURN @COLOR
END
GO

GO
--SqlScripter----[dbo].[ik_ISOweek].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_ISOweek]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_ISOweek] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_ISOweek]
(
		@THEDATE datetime
	)
RETURNS int
AS
	BEGIN

DECLARE @WN int

SET @WN = (

SELECT CASE

 -- Exception where <date expression> is part of week 52 (or 53) of the previous year
 WHEN @THEDATE  < CASE (DATEPART(dw, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04') + @@DATEFIRST) % 7
  WHEN 1 THEN CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04'
  WHEN 2 THEN DATEADD(d, -1, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04')
  WHEN 3 THEN DATEADD(d, -2, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04')
  WHEN 4 THEN DATEADD(d, -3, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04')
  WHEN 5 THEN DATEADD(d, -4, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04')
  WHEN 6 THEN DATEADD(d, -5, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04')
  ELSE DATEADD(d, -6, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04')
  END
 THEN
  (DATEDIFF(d,
   CASE (DATEPART(dw, CAST(YEAR(@THEDATE ) - 1 AS CHAR(4)) + '-01-04') + @@DATEFIRST) % 7
   WHEN 1 THEN CAST(YEAR(@THEDATE ) - 1 AS CHAR(4)) + '-01-04'
   WHEN 2 THEN DATEADD(d, -1, CAST(YEAR(@THEDATE ) - 1 AS CHAR(4)) + '-01-04')
   WHEN 3 THEN DATEADD(d, -2, CAST(YEAR(@THEDATE ) - 1 AS CHAR(4)) + '-01-04')
   WHEN 4 THEN DATEADD(d, -3, CAST(YEAR(@THEDATE ) - 1 AS CHAR(4)) + '-01-04')
   WHEN 5 THEN DATEADD(d, -4, CAST(YEAR(@THEDATE ) - 1 AS CHAR(4)) + '-01-04')
   WHEN 6 THEN DATEADD(d, -5, CAST(YEAR(@THEDATE ) - 1 AS CHAR(4)) + '-01-04')
   ELSE DATEADD(d, -6, CAST(YEAR(@THEDATE ) - 1 AS CHAR(4)) + '-01-04')
   END,
   @THEDATE 
  ) / 7) + 1 + ((YEAR(@THEDATE)-1)*100)

 -- Exception where @THEDATE  is part of week 1 of the following year
 WHEN @THEDATE  >= CASE (DATEPART(dw, CAST(YEAR(@THEDATE ) + 1 AS CHAR(4)) + '-01-04') + @@DATEFIRST) % 7
  WHEN 1 THEN CAST(YEAR(@THEDATE ) + 1 AS CHAR(4)) + '-01-04'
  WHEN 2 THEN DATEADD(d, -1, CAST(YEAR(@THEDATE ) + 1 AS CHAR(4)) + '-01-04')
  WHEN 3 THEN DATEADD(d, -2, CAST(YEAR(@THEDATE ) + 1 AS CHAR(4)) + '-01-04')
  WHEN 4 THEN DATEADD(d, -3, CAST(YEAR(@THEDATE ) + 1 AS CHAR(4)) + '-01-04')
  WHEN 5 THEN DATEADD(d, -4, CAST(YEAR(@THEDATE ) + 1 AS CHAR(4)) + '-01-04')
  WHEN 6 THEN DATEADD(d, -5, CAST(YEAR(@THEDATE ) + 1 AS CHAR(4)) + '-01-04')
  ELSE DATEADD(d, -6, CAST(YEAR(@THEDATE ) + 1 AS CHAR(4)) + '-01-04')
  END
 THEN 1 + ((YEAR(@THEDATE)+1)*100)

 ELSE
  -- Calculate the ISO week number for all dates that are not part of the exceptions above
  (DATEDIFF(d,
  CASE (DATEPART(dw, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04') + @@DATEFIRST) % 7
  WHEN 1 THEN CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04'
  WHEN 2 THEN DATEADD(d, -1, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04')
  WHEN 3 THEN DATEADD(d, -2, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04')
  WHEN 4 THEN DATEADD(d, -3, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04')
  WHEN 5 THEN DATEADD(d, -4, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04')
  WHEN 6 THEN DATEADD(d, -5, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04')
  ELSE DATEADD(d, -6, CAST(YEAR(@THEDATE ) AS CHAR(4)) + '-01-04')
  END,
  @THEDATE 
  ) / 7) + 1 + (YEAR(@THEDATE)*100)
 END AS IsoWeek

)

	

	RETURN (@WN)
	END
GO

GO
--SqlScripter----[dbo].[ik_IsPeriodSmallerOrEqual].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_IsPeriodSmallerOrEqual]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_IsPeriodSmallerOrEqual] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_IsPeriodSmallerOrEqual]
(

	@PeriodMustBeSmallerOrEqual int,
	@PeriodMustBeBiggerOrEqual int

	)
RETURNS TINYINT
AS
/* 
	
	  Valid @BS_TimePeriods
	    Daily = 1
        Weekly = 2
        Monthly = 3
        Quarterly = 4
        Annualy = 5
        Semester = 6
	
	*/

BEGIN
	IF (@PeriodMustBeSmallerOrEqual >= 4 AND @PeriodMustBeSmallerOrEqual <= 6)
	AND @PeriodMustBeBiggerOrEqual > 100 RETURN (0)

	IF @PeriodMustBeSmallerOrEqual = 106 SET @PeriodMustBeSmallerOrEqual=105
    ELSE IF @PeriodMustBeSmallerOrEqual = 105 SET @PeriodMustBeSmallerOrEqual=106
    
	IF @PeriodMustBeBiggerOrEqual = 106 SET @PeriodMustBeBiggerOrEqual=105
    ELSE IF @PeriodMustBeBiggerOrEqual = 105 SET @PeriodMustBeBiggerOrEqual=106
    
	IF @PeriodMustBeSmallerOrEqual = 6 SET @PeriodMustBeSmallerOrEqual=5
    ELSE IF @PeriodMustBeSmallerOrEqual = 5 SET @PeriodMustBeSmallerOrEqual=6
    
	IF @PeriodMustBeBiggerOrEqual = 6 SET @PeriodMustBeBiggerOrEqual=5
    ELSE IF @PeriodMustBeBiggerOrEqual = 5 SET @PeriodMustBeBiggerOrEqual=6
    
	DECLARE @RESULT TINYINT
    IF @PeriodMustBeSmallerOrEqual <= @PeriodMustBeBiggerOrEqual SET @RESULT=1
    ELSE SET @RESULT=0
    
    RETURN (@RESULT)
END
GO

GO
--SqlScripter----[dbo].[ik_mt_userHasNewsOnAlerts].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_mt_userHasNewsOnAlerts]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_mt_userHasNewsOnAlerts] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_mt_userHasNewsOnAlerts]
(
	@IKCDU int,
	@NOWDATE datetime 
	)
RETURNS int
AS
	BEGIN
		DECLARE @HASNEWS int
		/*
		IF (SELECT TOP 1 IKALERTS_ID FROM IKALERTS 
			WHERE L_READ=0 AND 
			DATEDIFF(DAY,DATE_EFFECTIVE,@NOWDATE )>=0 AND 
			USERID_TARGET= @IKCDU) >0
		*/
		IF (SELECT TOP 1 IKALERTS_ID FROM IKALERTS_USERS_OPTIONS
			WHERE ALERT_L_ISPINNED=1 AND 
			IKALERTS_USERS_OPTIONS.USERID= @IKCDU) >0
		BEGIN
			SET @HASNEWS=1
		END
		ELSE
		BEGIN
			SET @HASNEWS=0
		END
		
	RETURN @HASNEWS
	END
GO

GO
--SqlScripter----[dbo].[ik_mt_userHasNewsOnDocs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_mt_userHasNewsOnDocs]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_mt_userHasNewsOnDocs] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_mt_userHasNewsOnDocs]
(
	@IKCDU int
	)
RETURNS int
AS
	BEGIN
		DECLARE @HASNEWS int
		
		IF (SELECT TOP 1 CODIGODOCUMENTO FROM VISTA_CONDOCTAREASUSUARIOS WHERE CODIGOUSUARIO = @IKCDU) >0
		BEGIN
			SET @HASNEWS=1
		END
		ELSE
		BEGIN
			SET @HASNEWS=0
		END
		
	RETURN @HASNEWS
	END
GO

GO
--SqlScripter----[dbo].[ik_mt_userHasNewsOnForums].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_mt_userHasNewsOnForums]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_mt_userHasNewsOnForums] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_mt_userHasNewsOnForums]
(
	@IKCDU int
	)
RETURNS int
AS
	BEGIN
		DECLARE @HASNEWS int
		
		IF (
			SELECT TOP 1 CODIGO FROM IKFOROSNOVEDADES 
			WHERE 
				L_LEIDO=0 AND 
				--FECHAULTNOTIF>= (SELECT TOP 1 INPUTDATE FROM IKUSERLOGINS WHERE USERID=@IKCDU ORDER BY INPUTDATE DESC) AND
				CODIGOUSUARIO=@IKCDU
			
		)>0
		BEGIN
			SET @HASNEWS=1
		END
		ELSE
		BEGIN
			SET @HASNEWS=0
		END
		
	RETURN @HASNEWS
	END
GO

GO
--SqlScripter----[dbo].[ik_mt_userHasPendingNCTasks].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_mt_userHasPendingNCTasks]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_mt_userHasPendingNCTasks] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_mt_userHasPendingNCTasks]
(
	@IKCDU int
	)
RETURNS int
AS
	BEGIN
		DECLARE @HASNEWS int
		
		IF (SELECT TOP 1 NCTAREAS_CODIGO FROM VISTA_NCTAREASUSUARIOS 
			WHERE L_NOMOSTRAR=0 AND CODIGOCARGO IN (SELECT CODIGOCARGO FROM CARGOSUSUARIOS WHERE CODIGOUSUARIO= @IKCDU)) >0
		BEGIN
			SET @HASNEWS=1
		END
		ELSE
		BEGIN
			SET @HASNEWS=0
		END
		
	RETURN @HASNEWS
	END
GO

GO
--SqlScripter----[dbo].[ik_mt_userHasWFApprovalRequirementsInProgress].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_mt_userHasWFApprovalRequirementsInProgress]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_mt_userHasWFApprovalRequirementsInProgress] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_mt_userHasWFApprovalRequirementsInProgress]
(
	@IKCDU int
	)
RETURNS int
AS
	BEGIN
		DECLARE @HASNEWS int
		
		IF (SELECT TOP 1 WF_APPROVAL_RECORDS_ID FROM VISTA_WF_APPROVAL_RECORDS 
				WHERE WF_APPROVAL_RECORDS_STATUS_ID=2
					AND IKPERSON_ID= @IKCDU) >0
		BEGIN
			SET @HASNEWS=1
		END
		ELSE
		BEGIN
			SET @HASNEWS=0
		END
		
	RETURN @HASNEWS
	END
GO

GO
--SqlScripter----[dbo].[ik_org_get_Sector].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_org_get_Sector]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_org_get_Sector] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_org_get_Sector]
(
		@NODECODE int
	
	)
RETURNS nvarchar(200)
AS
BEGIN

DECLARE @RETVAL nvarchar(200)


	declare @DescripPadres varchar(4000), @Padre int , @Descrip varchar(50), @Tipo int, @fin int
	set @DescripPadres=''

             select @Padre=CODIGOPADRE from ORGANIGRAMA where CODIGO=@NODECODE
	set @NODECODE=@Padre
             set @fin=1

	while  (@NODECODE is not null) and @NODECODE > 0  and @fin=1 begin
		select @Padre=CODIGOPADRE, @Tipo=TIPO, @Descrip=DESCRIPCION from ORGANIGRAMA where CODIGO=@NODECODE
                           if @Tipo=0 AND @Padre>0
                               Begin
			set @DescripPadres=  rtrim(ltrim(@Descrip)) 
			set @fin=0
		    end
		set @NODECODE=@Padre
	end
	set @RETVAL=CASE WHEN LEN(@DescripPadres)>0 THEN @DescripPadres ELSE 'N/A' END





RETURN (@RETVAL)
END
GO

GO
--SqlScripter----[dbo].[ik_org_get_Superior].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_org_get_Superior]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_org_get_Superior] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_org_get_Superior]
(
		@NODECODE int
	
	)
RETURNS nvarchar(200)
AS
BEGIN

DECLARE @RETVAL nvarchar(200)

declare @DescripPadres varchar(4000), @Padre int , @Descrip varchar(50), @Tipo int, @fin int
	set @DescripPadres=''

             select @Padre=CODIGOPADRE from ORGANIGRAMA where CODIGO=@NODECODE
	set @NODECODE=@Padre
             set @fin=1

	while  (@NODECODE is not null) and @NODECODE > 0  and @fin=1 begin
		select @Padre=CODIGOPADRE, @Tipo=TIPO, @Descrip=DESCRIPCION from ORGANIGRAMA where CODIGO=@NODECODE
                           if @Tipo=1 OR @Tipo=4
                               Begin
					set @DescripPadres=  rtrim(ltrim(@Descrip)) 
					set @fin=0
		    		end
		set @NODECODE=@Padre
	end
	
	set @RETVAL=CASE WHEN LEN(@DescripPadres)>0 THEN @DescripPadres ELSE 'N/A' END





RETURN (@RETVAL)
END
GO

GO
--SqlScripter----[dbo].[ik_org_ImageOfNode].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_org_ImageOfNode]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_org_ImageOfNode] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_org_ImageOfNode]
(
		@ORGNODETYPE int,
		@CODIGOPADRE int,
		@CODIGORAIZ int,
		@VIRTUAL int
	)
RETURNS varchar(50)
AS
	BEGIN
		DECLARE @IMG varchar(50)
		
		SELECT @IMG=
		CASE
			WHEN @CODIGOPADRE=0 AND @CODIGORAIZ<>-1 AND @CODIGOPADRE=0 AND @VIRTUAL=0  then 'Images/i/sitemap-image.png' --org chart
			WHEN @CODIGOPADRE=0 AND @CODIGORAIZ<>-1 AND @CODIGOPADRE=0 AND @VIRTUAL>0  then 'Images/i/users.png' --org chart virtual
			WHEN @ORGNODETYPE=0 AND @CODIGOPADRE>0  then 'Images/i/wall.png'  --sector int 
			WHEN @ORGNODETYPE=1 then 'Images/i/user.png' -- cargo simple
			WHEN @ORGNODETYPE=2 then 'Images/i/wall-brick.png' --sector ext
			WHEN @ORGNODETYPE=4 then 'Images/i/users.png' --cargo multi
			WHEN @ORGNODETYPE=5 then 'Images/i/user-green.png' --cargo multi single
			WHEN @ORGNODETYPE=-1 then 'Images/i/sitemap-image.png' --organigrama archivado
		END
	RETURN @IMG
	END
GO

GO
--SqlScripter----[dbo].[ik_s3_userIsMemberOfGroup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_s3_userIsMemberOfGroup]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_s3_userIsMemberOfGroup] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_s3_userIsMemberOfGroup]
(
		@SUSER_ID int,
		@SGROUP_ID int
	)
	
RETURNS TINYINT
AS
BEGIN

	DECLARE @Q INT
	DECLARE @RETVAL TINYINT

	SET @Q = (SELECT CODIGO FROM SURVEYGROUPSMEMBERS WHERE CODIGOSURVEYUSER=@SUSER_ID AND CODIGOSURVEYGROUP=@SGROUP_ID )
	IF @Q IS NULL SET @RETVAL = 0
	ELSE SET @RETVAL = 1

	RETURN @RETVAL
END
GO

GO
--SqlScripter----[dbo].[ik_wf_approval_get_record_level_description].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_wf_approval_get_record_level_description]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_wf_approval_get_record_level_description] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_wf_approval_get_record_level_description]
(
		@WF_NODE_ID int,
		@WF_APPROVAL_RECORDS_LEVEL int
	)
RETURNS nvarchar(100)
AS
	BEGIN

DECLARE @WF_APPROVAL_RECORDS_LEVEL_DESCRIPTION nvarchar(100)

SELECT 
	@WF_APPROVAL_RECORDS_LEVEL_DESCRIPTION=WF_APPROVAL_RECORDS_LEVEL_DESCRIPTION
FROM dbo.ik_wf_approval_get_records_levels(@WF_NODE_ID)
WHERE WF_APPROVAL_RECORDS_LEVEL=@WF_APPROVAL_RECORDS_LEVEL

IF @WF_APPROVAL_RECORDS_LEVEL_DESCRIPTION IS NULL
BEGIN
	SET @WF_APPROVAL_RECORDS_LEVEL_DESCRIPTION='*Unkown'
END

RETURN (@WF_APPROVAL_RECORDS_LEVEL_DESCRIPTION)
END
GO

GO
--SqlScripter----[dbo].[ik_wf_get_CurrentNodeIsDelayed].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_wf_get_CurrentNodeIsDelayed]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_wf_get_CurrentNodeIsDelayed] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_wf_get_CurrentNodeIsDelayed]
(
		@WF_ID int
	)
RETURNS nvarchar(100)
AS
	BEGIN
		DECLARE @atrasado int
		SET @atrasado = 0
		
		SELECT @atrasado = 
			CASE 
				WHEN DATEDIFF(day, WF_SCHEDDATES_STARTDATE_REAL, GETDATE()) > DATEDIFF(day, D.WF_SCHEDDATES_STARTDATE, D.WF_SCHEDDATES_DATE) THEN 
					1
				ELSE 
					0 
			END
		FROM
			dbo.WF_SCHEDDATES D LEFT OUTER JOIN dbo.WF_NODE N 
				ON D.WF_XMLNODE_ID = N.WF_NODE_XMLNODE_ID AND D.WF_ID = N.WF_ID
		WHERE     
			(N.WF_NODE_STATE = 4) AND (D.WF_SCHEDDATES_ENABLED = 1) AND D.WF_ID = @WF_ID

		RETURN @atrasado

	END
GO

GO
--SqlScripter----[dbo].[ik_wf_getCurrentNode].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_wf_getCurrentNode]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_wf_getCurrentNode] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_wf_getCurrentNode]
(
		@WF_ID int
	)
RETURNS nvarchar(100)
AS
	BEGIN
		DECLARE @etapa nvarchar(100)
		SET @etapa = ''
				
		IF @WF_ID IS NULL
		BEGIN 
			SET  @etapa = 'SIN INICIAR'
			RETURN @etapa
		END

		IF EXISTS (SELECT WF_XMLNODE_ID FROM WF_SCHEDDATES WHERE WF_ID=@WF_ID AND WF_SCHEDDATES_DONE=2)
		BEGIN
			SET  @etapa = 'DETENIDO'
			RETURN @etapa
		END

		IF EXISTS(SELECT WF_XMLNODE_ID FROM WF_SCHEDDATES WHERE WF_ID=@WF_ID ) AND NOT EXISTS (SELECT WF_XMLNODE_ID FROM WF_SCHEDDATES WHERE WF_ID=@WF_ID AND (WF_SCHEDDATES_DONE = 0 OR WF_SCHEDDATES_DONE = 2 ))
		BEGIN
			SET  @etapa = 'FINALIZADO'
			RETURN @etapa
		END
		
		IF (SELECT COUNT(*) FROM WF_NODE WHERE  WF_NODE_STATE=4 AND WF_ID = @WF_ID ) > 0
		BEGIN
			SELECT TOP 1 @etapa = WF_NODE_XMLNODE_ID 
			FROM WF_NODE
			WHERE WF_NODE_STATE=4 AND 
			WF_ID = @WF_ID 
			ORDER BY WF_NODE_STARTDATE
		END
		ELSE
		BEGIN
			SELECT TOP 1 @etapa = WF_NODE_XMLNODE_ID 
			FROM WF_NODE
			WHERE WF_NODE_STATE=5 AND 
			WF_ID = @WF_ID 
			ORDER BY WF_NODE_ENDDATE DESC
		END

		RETURN @etapa

	END
GO

GO
--SqlScripter----[dbo].[ik_wf_getSheduledEndDate].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_wf_getSheduledEndDate]') IS NULL EXEC('CREATE FUNCTION [dbo].[ik_wf_getSheduledEndDate] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ik_wf_getSheduledEndDate]
(	
		@CODIGONC int
	)
	
RETURNS datetime
AS
BEGIN
	
	DECLARE @FDATE datetime

DECLARE @WF_ID INT
SET @WF_ID=(SELECT WF_ID FROM NCMAINPROD WHERE CODIGO=@CODIGONC)


SET @FDATE=(SELECT TOP 1 WF_SCHEDDATES_DATE FROM WF_SCHEDDATES WHERE WF_ID=@WF_ID ORDER BY WF_SCHEDDATES_DATE DESC)

	RETURN @FDATE
END
GO

GO
--SqlScripter----[dbo].[iki_ParticleFromTable].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[iki_ParticleFromTable]') IS NULL EXEC('CREATE FUNCTION [dbo].[iki_ParticleFromTable] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[iki_ParticleFromTable]
(
		@Table nvarchar(300)
	)
RETURNS nvarchar(10)
AS
BEGIN

DECLARE @PARTICLE nvarchar(10)
SET @PARTICLE = 
CASE 
	WHEN @Table = 'BS_INDICATORS' THEN 'I'
	WHEN @Table = 'BS_STRAT_NODES' THEN 'S'
	WHEN @Table = 'BS_STRAT_PLANS' THEN 'SP'
	WHEN @Table = 'DOCUMENTOS' THEN 'D'
	WHEN @Table = 'NCMAINPROD' THEN 'N'
	WHEN @Table = 'NCTAREAS' THEN 'T'	
	WHEN @Table = 'ORGANIGRAMA' THEN 'O'
	WHEN @Table = 'PERSONAS' THEN 'PE'
	WHEN @Table = 'PROC_NODES' THEN 'P'
	WHEN @Table = 'PROC_PLANS' THEN 'PP'
	WHEN @Table = 'BS_SVG' THEN 'SVG'
END


RETURN @PARTICLE
END
GO

GO
--SqlScripter----[dbo].[STRTODATE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[STRTODATE]') IS NULL EXEC('CREATE FUNCTION [dbo].[STRTODATE] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[STRTODATE]
(
		@STRDATE varchar(10)
	)
RETURNS datetime
AS
	BEGIN
	
DECLARE @RETVAL DATETIME
SET @RETVAL=CAST(@STRDATE AS DATETIME)
	
	RETURN @RETVAL

	END
GO

GO
--SqlScripter----[dbo].[TO_NCLOB].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[TO_NCLOB]') IS NULL EXEC('CREATE FUNCTION [dbo].[TO_NCLOB] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[TO_NCLOB]
(
		@s1 nvarchar(1000)
	)
RETURNS nvarchar(1000)
AS
	BEGIN
	
	
	RETURN @s1

	END
GO

GO
--SqlScripter----[dbo].[translate].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[translate]') IS NULL EXEC('CREATE FUNCTION [dbo].[translate] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[translate]
(
		@LOC nvarchar(200)
	
	)
RETURNS nvarchar(MAX)
AS
BEGIN

DECLARE @VALUE nvarchar(MAX)
SET @VALUE = ISNULL((SELECT VALUE FROM NAX_RESOURCES WHERE NAME=@LOC),@LOC) 

IF @VALUE = @LOC
	SET @VALUE = ISNULL((SELECT VALUELONG FROM NAX_RESOURCES WHERE NAME=@LOC),@LOC)  

RETURN (@VALUE)
END
GO
