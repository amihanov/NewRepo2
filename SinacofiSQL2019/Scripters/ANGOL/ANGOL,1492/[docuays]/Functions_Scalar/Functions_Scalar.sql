
GO
--SqlScripter----[dbo].[CadenaLike].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[CadenaLike]') IS NULL EXEC('CREATE FUNCTION [dbo].[CadenaLike] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[CadenaLike]
(
	@cadena nvarchar(max)
)
RETURNS nvarchar(max)
AS
BEGIN
	RETURN '%' + @cadena + '%'
END
GO
