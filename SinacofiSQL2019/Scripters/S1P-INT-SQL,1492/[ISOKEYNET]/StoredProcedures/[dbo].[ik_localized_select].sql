﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_localized_select]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_localized_select] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_localized_select]
@SELECTSTATEMENT varchar(8000), @DOTNET_SHORTDATEPATTERN varchar(10)  AS

	DECLARE @FORMATO varchar(3)
	DECLARE @LARGO int
	DECLARE @A int
	DECLARE @M int
	DECLARE @D int
	DECLARE @Y int
	DECLARE @CC varchar(1)
	DECLARE @TA varchar(1)

	SET @LARGO = LEN(@DOTNET_SHORTDATEPATTERN)
 	SET @A = 1
	SET @M = 0
	SET @D = 0
	SET @Y = 0
	SET @FORMATO = ''

	WHILE (@A <= @LARGO)
	BEGIN
		SET @CC =  UPPER(SUBSTRING(@DOTNET_SHORTDATEPATTERN, @A,1))
		SET @TA = ''
		IF (@CC = 'Y' AND @Y = 0)
			BEGIN
				SET @TA = 'y'
				SET @Y = 1
			END

		IF (@CC = 'M' AND @M = 0)
			BEGIN
				SET @TA = 'm'
				SET @M = 1
			END

		IF (@CC = 'D' AND @D = 0)
			BEGIN
				SET @TA = 'd'
				SET @D = 1
			END

		SET @FORMATO = @FORMATO + @TA
		
		SET @A = @A +1
	END

	SET DATEFORMAT @FORMATO
	EXEC(@SELECTSTATEMENT)
GO