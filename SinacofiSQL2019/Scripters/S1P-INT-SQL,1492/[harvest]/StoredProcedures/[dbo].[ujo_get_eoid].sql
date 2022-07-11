SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_get_eoid]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_get_eoid] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_get_eoid    Script Date: 12/1/2005 11:49:48 PM ******/

ALTER PROCEDURE [dbo].[ujo_get_eoid]
AS
    declare @digit0 VARCHAR(1),
            @digit1 VARCHAR(1),
            @digit2 VARCHAR(1),
            @digit3 VARCHAR(1),
            @digit4 VARCHAR(1),
            @digit5 VARCHAR(1),
            @digit6 VARCHAR(1),
            @last_eoid VARCHAR(12),
            @eoid VARCHAR(12),
            @test0 int,
            @test1 int,
            @test2 int,
            @test3 int,
            @test4 int,
            @test5 int,
            @test6 int
           
BEGIN TRANSACTION    
    set @last_eoid = (SELECT counter FROM ujo_last_Eoid_counter (UPDLOCK))

    set @digit0 = SUBSTRING(@last_eoid, 1, 1)
    set @digit1 = SUBSTRING(@last_eoid, 2, 1)
    set @digit2 = SUBSTRING(@last_eoid, 3, 1)
    set @digit3 = SUBSTRING(@last_eoid, 4, 1)
    set @digit4 = SUBSTRING(@last_eoid, 5, 1)
    set @digit5 = SUBSTRING(@last_eoid, 6, 1)
    set @digit6 = SUBSTRING(@last_eoid, 7, 1)
    
    exec ujo_bump_digit @digit6,@digit6 output,@test6 output
    IF @test6 = 1
      begin
      exec ujo_bump_digit @digit5,@digit5 output,@test5 output
         IF @test5 = 1
         begin
         exec ujo_bump_digit @digit4,@digit4 output,@test4 output
          IF @test4 = 1
          begin 
          exec ujo_bump_digit @digit3,@digit3 output,@test3 output
           IF @test3 = 1
           begin 
           exec ujo_bump_digit @digit2,@digit2 output,@test2 output
            IF @test2 = 1
            begin
            exec ujo_bump_digit @digit1,@digit1 output,@test1 output
             IF @test1 = 1
             begin
             exec ujo_bump_digit @digit0,@digit0 output,@test0 output 
              IF @test0 = 1
              begin                         
                set @digit0 = '0'
                set @digit1 = '0'
                set @digit2 = '0'
                set @digit3 = '0'
                set @digit4 = '1'
                set @digit5 = '0'
                set @digit6 = '0'
              end
             end
           end
         end
       end
     end
    end
    
    set @eoid = @digit0 + @digit1 + @digit2 + @digit3 + @digit4 + @digit5 + @digit6                  

    UPDATE ujo_last_Eoid_counter SET counter = @eoid 
COMMIT TRANSACTION
    SELECT @eoid      
    return -999
GO
