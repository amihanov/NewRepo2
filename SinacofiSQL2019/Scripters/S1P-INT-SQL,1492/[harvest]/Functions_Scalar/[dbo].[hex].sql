SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[hex]') IS NULL EXEC('CREATE FUNCTION [dbo].[hex] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.hex    Script Date: 12/1/2005 11:50:34 PM ******/




/* Star 14401595 USP DASHBOARD DDL CHANGE */
-------------
--- hex ---
-------------
ALTER FUNCTION [dbo].[hex]
(@s varbinary(16))
RETURNS varchar(64) as
BEGIN
	DECLARE @out varchar(64)
	DECLARE @verNum varchar(4)
	SELECT @verNum = CAST(SERVERPROPERTY('productversion') as VARCHAR)
	IF LEFT(@verNum,1) = '8'
		EXEC master..xp_varbintohexstr @s, @out OUTPUT
	ELSE
		SET @out = master.dbo.fn_varbintohexstr(@s)
	SELECT @out = right(@out,32)
	RETURN @out
END
GO
