SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spGetStaleFiles]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spGetStaleFiles] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    ENV
-- Create date: 31-07-13
-- Description: Obtiene archivos obsoletos
-- 
-- =============================================
ALTER PROCEDURE [dbo].[spGetStaleFiles]
@iCodError int = 0 out,  
  @vcMsjError varchar(50) = 'OK' out
AS BEGIN TRY


  BEGIN
    SELECT [vcNombreArchivo]
    FROM [intercajas].[dbo].[tblAfiliadoCabecera]
    where Datediff(YEAR,[dFechaIng],GETDATE()) <=5


    set @iCodError = 0;
    set @vcMsjError = 'OK';

  END

END TRY
BEGIN CATCH
  set @iCodError = -1;
  set @vcMsjError = ERROR_MESSAGE()

  
END CATCH
GO
