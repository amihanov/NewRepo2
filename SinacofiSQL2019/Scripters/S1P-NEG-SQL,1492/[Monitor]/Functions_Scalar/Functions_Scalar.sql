
GO
--SqlScripter----[dbo].[fn_Date2Str].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[fn_Date2Str]') IS NULL EXEC('CREATE FUNCTION [dbo].[fn_Date2Str] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[fn_Date2Str]
(@date INT)
RETURNS VARCHAR(10)
AS
BEGIN
   DECLARE @strdate CHAR(8)
   SET @strdate = LEFT(CONVERT(VARCHAR,@date) + '00000000', 8)

   RETURN RIGHT(@strdate,2) + '/' + SUBSTRING(@strdate,5,2) + '/' + LEFT(@strdate,4) 
END
GO

GO
--SqlScripter----[dbo].[fn_freq_interval_desc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[fn_freq_interval_desc]') IS NULL EXEC('CREATE FUNCTION [dbo].[fn_freq_interval_desc] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[fn_freq_interval_desc]
(@freq_interval INT)  
RETURNS VARCHAR(1000)  
AS  
BEGIN  
   DECLARE @result VARCHAR(1000)  

   SET @result = ''
	   
   IF (@freq_interval & 1 = 1)  
      SET @result = 'Sunday, '  
   IF (@freq_interval & 2 = 2)  
      SET @result = @result + 'Monday, '  
   IF (@freq_interval & 4 = 4)  
      SET @result = @result + 'Tuesday, '  
   IF (@freq_interval & 8 = 8)  
      SET @result = @result + 'Wednesday, '  
   IF (@freq_interval & 16 = 16)  
      SET @result = @result + 'Thursday, '  
   IF (@freq_interval & 32 = 32)  
      SET @result = @result + 'Friday, '  
   IF (@freq_interval & 64 = 64)  
      SET @result = @result + 'Saturday, '  

   RETURN(LEFT(@result,LEN(@result)-1))  
END
GO

GO
--SqlScripter----[dbo].[fn_Time2Str].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[fn_Time2Str]') IS NULL EXEC('CREATE FUNCTION [dbo].[fn_Time2Str] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[fn_Time2Str]
(@time INT)
RETURNS VARCHAR(10)
AS
BEGIN
   DECLARE @strtime CHAR(6)
   SET @strtime = RIGHT('000000' + CONVERT(VARCHAR,@time),6)

   RETURN LEFT(@strtime,2) + ':' + SUBSTRING(@strtime,3,2) + ':' + RIGHT(@strtime,2)
END
GO
