SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_auth]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_auth] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_auth    Script Date: 12/1/2005 11:49:41 PM ******/

ALTER PROCEDURE [dbo].[tng_add_auth]
( @name varchar(20), 
							@access char(1),
							@mask varchar(15)='*.*.*.*',
							@status_on tinyint=0  )
   as
     
 insert into tng_auth ( name,  access, mask )
           values ( @name, @access, @mask )

 if @@error !=0
 begin
   if @status_on=1
     raiserror ('MSG:(90024) Insert tng_auth error, @name=%s, @access=%s.', 16, -1, @name, @access)
   return
 end
GO
