
GO
--SqlScripter----[dbo].[Split].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[Split]') IS NULL EXEC('CREATE FUNCTION [dbo].[Split] () RETURNS @Ret TABLE (c1 int) AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN END')
GO
ALTER FUNCTION [dbo].[Split]
(@String varchar(150), @Delimiter char(1))
RETURNS @Results table (word varchar(50))
AS
BEGIN
DECLARE @INDEX INT

DECLARE @SLICE varchar(200)
-- Asignar 1 a la variable que utilizaremos en el loop para no iniciar en 0. 
SELECT @INDEX = 1

WHILE @INDEX !=0
BEGIN
-- Obtenemos el �ndice de la primera ocurrencia del split de caracteres. 
SELECT @INDEX = CHARINDEX(@Delimiter,@STRING)
-- Ahora ponemos todo a la izquierda de el slice de la variable. 
IF @INDEX != 0
SELECT @SLICE = LEFT(@STRING,@INDEX - 1)
ELSE
SELECT @SLICE = @STRING

insert into @Results(word) values(@SLICE)

SELECT @STRING = RIGHT(@STRING,LEN(@STRING) - @INDEX)
-- Salimos del loop si terminamos la b�squeda 
IF LEN(@STRING) = 0 BREAK
END

RETURN
END
GO
