SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_form22]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_form22] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_form22]
(@vcCadena_periodo VARCHAR(20), 
                                           @vcCadena_rut     varchar (15)) 
AS 
  BEGIN 
      DECLARE @sql NVARCHAR(1000) 

      SET @sql = 'select cod_0007, cod_0315 from form22 where rutContribuyente = ' + @vcCadena_rut 
                 + ' periodo  = ' + @vcCadena_periodo 

      EXEC sp_executesql 
        @sql 
  END
GO
