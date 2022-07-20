
GO
--SqlScripter----[dbo].[Split].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[Split]') IS NULL EXEC('CREATE FUNCTION [dbo].[Split] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [dbo].[Split]
(
@String NVARCHAR(4000),
@Delimiter NCHAR(1)
)
RETURNS TABLE 
AS
RETURN 
(
WITH Split(stpos,endpos) 
AS(
SELECT 0 AS stpos, CHARINDEX(@Delimiter,@String) AS endpos
UNION ALL
SELECT endpos+1, CHARINDEX(@Delimiter,@String,endpos+1)
FROM Split
WHERE endpos > 0
)
SELECT 'Id' = ROW_NUMBER() OVER (ORDER BY (SELECT 1)),
'Data' = SUBSTRING(@String,stpos,COALESCE(NULLIF(endpos,0),LEN(@String)+1)-stpos)
FROM Split
)
GO

GO
--SqlScripter----[dbo].[Split3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[Split3]') IS NULL EXEC('CREATE FUNCTION [dbo].[Split3] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [dbo].[Split3]
(
@String NVARCHAR(4000),
@Delimiter NCHAR(1)
)
RETURNS TABLE 
AS
RETURN 
(
WITH Split(stpos,endpos) 
AS(
SELECT 0 AS stpos, CHARINDEX(@Delimiter,@String) AS endpos
UNION ALL
SELECT endpos+1, CHARINDEX(@Delimiter,@String,endpos+1)
FROM Split
WHERE endpos > 0
)
SELECT 'Id' = ROW_NUMBER() OVER (ORDER BY (SELECT 1)),
'Data' = SUBSTRING(@String,stpos,COALESCE(NULLIF(endpos,0),LEN(@String)+1)-stpos)
FROM Split
)
GO
