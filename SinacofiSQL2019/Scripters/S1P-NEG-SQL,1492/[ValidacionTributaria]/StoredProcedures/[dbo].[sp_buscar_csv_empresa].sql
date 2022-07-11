SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_csv_empresa]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_csv_empresa] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_csv_empresa]
(@iTipo_funcion int, 
                                          @vcEmpresa      VARCHAR(200)) 
AS 
    DECLARE @sql NVARCHAR(1000) 

     

  BEGIN 
      IF ( @iTipo_funcion = 1 ) 
        BEGIN 
                    SELECT empresa.idEmpresa, razonSocial, nombreFantasia, sufijo
                    FROM empresa, contrato, empresainstitucion
                    where empresa.estado = 1 AND empresa.idEmpresa = contrato.idEmpresa AND empresa.idEmpresa = empresainstitucion.idEmpresa AND contrato.vigente = 1
                    group by sufijo, empresa.idEmpresa, empresa.razonSocial, nombreFantasia
        END 

      IF ( @iTipo_funcion = 2 ) 
        BEGIN 
        
         SET @sql = 'SELECT empresa.idEmpresa, razonSocial, nombreFantasia, sufijo
                    FROM empresa, contrato, empresainstitucion
                    where empresa.estado = 1 AND empresa.idEmpresa = contrato.idEmpresa AND empresa.idEmpresa = empresainstitucion.idEmpresa AND contrato.vigente = 1 AND empresa.idEmpresa IN ('  + @vcEmpresa+')
                    group by sufijo, empresa.idEmpresa, empresa.razonSocial, nombreFantasia' 
                
         EXEC sp_executesql 
         @sql 

        END 

   
            
END
GO
