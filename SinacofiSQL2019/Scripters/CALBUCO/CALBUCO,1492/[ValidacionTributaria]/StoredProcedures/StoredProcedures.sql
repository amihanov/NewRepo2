
GO
--SqlScripter----[dbo].[sp_actualizar_lotes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_actualizar_lotes]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_actualizar_lotes] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_actualizar_lotes]
(@id INT, @estado INT) AS
BEGIN


update lotes 
set    estado = @estado 
where  id = @id

RETURN(1)

END
GO

GO
--SqlScripter----[dbo].[sp_alterdiagram].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_alterdiagram]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_alterdiagram] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_alterdiagram]
(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
GO

GO
--SqlScripter----[dbo].[Sp_buscar_actividad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[Sp_buscar_actividad]') IS NULL EXEC('CREATE PROCEDURE [dbo].[Sp_buscar_actividad] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[Sp_buscar_actividad]
(@vcCadena_Rut varchar (15)) AS
BEGIN



select *
from actividad, actividadContr
where actividadContr.rutContribuyente = @vcCadena_Rut AND actividadContr.codigo_actividad = actividad.codigo
 


END
GO

GO
--SqlScripter----[dbo].[sp_Buscar_archivo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_Buscar_archivo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_Buscar_archivo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_Buscar_archivo]
(@nvcCadena_Session_e NVARCHAR(20), 
                                    @vcCadena_Rut        varchar (15)) 
AS 
  BEGIN 
      DECLARE @sql NVARCHAR(1000) 

      select * 
      from   archivo 
      where  idEmpresa = @nvcCadena_Session_e 
         AND rutContribuyente = @vcCadena_Rut 
      ORDER  BY fecha DESC 
  END
GO

GO
--SqlScripter----[dbo].[sp_buscar_contribuyente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_contribuyente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_contribuyente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_contribuyente]
(@vcCadenaRut VARCHAR(30)) 
AS 
    DECLARE @sql NVARCHAR(1000) 

  BEGIN 
      select * 
      from   contribuyente 
      where  contribuyente.rutContribuyente = @vcCadenaRut 
  END
GO

GO
--SqlScripter----[dbo].[sp_buscar_csv_actividad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_csv_actividad]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_csv_actividad] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_csv_actividad]
(@iTipo_funcion int,@vcCadena varchar (24), @vcCadena2 varchar (24), @vcCadena3 varchar (24)) 
AS 
  BEGIN 
  IF ( @iTipo_funcion = 1 )
    begin
  
      select * 
      from   actividad
      
  
    END
   
 IF ( @iTipo_funcion = 2 )
    BEGIN
      IF (@vcCadena3 IS NULL OR @vcCadena3='')
       begin
		      
			
			SELECT consulta.fechaCons AS fecha, rutcons AS rut, actividad.nombre AS actividad,usuario.usuario FROM consulta
			INNER JOIN actividadContr ON rutContribuyente = rutCons
			INNER JOIN actividad ON codigo = codigo_actividad
			INNER JOIN usuario ON consulta.idUsuario = usuario.idUsuario 
			WHERE
			consulta.idEmpresa =@vcCadena  AND fechacons>@vcCadena2+' 00:00:00' AND fechaCons <@vcCadena2+ ' 23:59:59'
        END
        ELSE
         BEGIN
	             
				
				SELECT consulta.fechaCons AS fecha, rutcons AS rut, actividad.nombre AS actividad,usuario.usuario FROM consulta
				INNER JOIN actividadContr ON rutContribuyente = rutCons
				INNER JOIN actividad ON codigo = codigo_actividad
				INNER JOIN usuario ON consulta.idUsuario = usuario.idUsuario 
				WHERE
				consulta.idEmpresa =@vcCadena  AND fechacons>@vcCadena2+' 00:00:00' AND fechaCons <@vcCadena3+ ' 23:59:59'
         END
    END
  END
GO

GO
--SqlScripter----[dbo].[sp_buscar_csv_consulta_fdetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_csv_consulta_fdetalle]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_csv_consulta_fdetalle] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_csv_consulta_fdetalle]
(@vcIdEmpresa varchar (max), @vcfechacsv_inicio VARCHAR(24), @vcfechacsv_fin VARCHAR(24)) AS
BEGIN

                    IF (@vcfechacsv_fin IS NULL OR @vcfechacsv_fin='')
                     begin
                       SELECT CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, detalle.folio, form22.* 
						FROM consulta 
						LEFT JOIN detalle ON consulta.idCons = detalle.consulta_id 
						LEFT JOIN form22 ON detalle.folio = form22.cod_0007
						LEFT JOIN usuario ON consulta.idUsuario = usuario.idUsuario 
						WHERE consulta.idEmpresa =@vcIdEmpresa AND consulta.fechaCons >=  @vcfechacsv_inicio +' 00:00:00'  AND consulta.fechaCons<=  @vcfechacsv_inicio + ' 23:59:59'
                     end
                    else
                     begin
                       
                        SELECT CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, detalle.folio, form22.* 
						FROM consulta 
						LEFT JOIN detalle ON consulta.idCons = detalle.consulta_id 
						LEFT JOIN form22 ON detalle.folio = form22.cod_0007
						LEFT JOIN usuario ON consulta.idUsuario = usuario.idUsuario 
						WHERE consulta.idEmpresa =@vcIdEmpresa AND consulta.fechaCons >=   @vcfechacsv_inicio +' 00:00:00'  AND consulta.fechaCons<=  @vcfechacsv_fin + ' 23:59:59' 
                     end
                   


					
END
GO

GO
--SqlScripter----[dbo].[sp_buscar_csv_consulta_fdetalle29].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_csv_consulta_fdetalle29]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_csv_consulta_fdetalle29] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_csv_consulta_fdetalle29]
(@vcIdEmpresa varchar (15), @vcfechacsv_inicio VARCHAR(24), @vcfechacsv_fin VARCHAR(24)) AS
BEGIN



                    IF (@vcfechacsv_fin IS NULL OR @vcfechacsv_fin='')
                     begin
                        SELECT CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, detalle.folio, form29.* 
						FROM consulta 
						LEFT JOIN detalle ON consulta.idCons = detalle.consulta_id 
						LEFT JOIN form29 ON detalle.folio = form29.cod_0007
						LEFT JOIN usuario ON consulta.idUsuario = usuario.idUsuario 
						WHERE consulta.idEmpresa = @vcIdEmpresa AND consulta.fechaCons >=   @vcfechacsv_inicio +' 00:00:00'  AND consulta.fechaCons<=  @vcfechacsv_inicio + ' 23:59:59' 
                     end
                    else
                     begin
                      SELECT CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, detalle.folio, form29.* 
						FROM consulta 
						LEFT JOIN detalle ON consulta.idCons = detalle.consulta_id 
						LEFT JOIN form29 ON detalle.folio = form29.cod_0007
						LEFT JOIN usuario ON consulta.idUsuario = usuario.idUsuario 
						WHERE consulta.idEmpresa = @vcIdEmpresa AND consulta.fechaCons >=   @vcfechacsv_inicio +' 00:00:00'  AND consulta.fechaCons<=  @vcfechacsv_fin + ' 23:59:59'

                     end
                   


					
END
GO

GO
--SqlScripter----[dbo].[sp_buscar_csv_contribuyente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_csv_contribuyente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_csv_contribuyente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_csv_contribuyente]
(@vcIdEmpresa varchar (15), @vcfechacsv_inicio VARCHAR(24), @vcfechacsv_fin VARCHAR(24)) AS
BEGIN



DECLARE @sql NVARCHAR(1000)
DECLARE @sql2 NVARCHAR(1000)


                 IF (@vcfechacsv_fin IS NULL OR @vcfechacsv_fin='')
                     begin
                       SELECT DISTINCT consulta.rutCons AS rutContribuyente, CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fechaCons, usuario.usuario AS usuarioCons, contribuyente.razonSocial, contribuyente.paterno, contribuyente.materno, contribuyente.nombres, contribuyente.giro, contribuyente.direccion, contribuyente.comuna, situacion.fechaInicioActividades, situacion.categoria, situacion.observacion
                       FROM consulta
                       LEFT JOIN contribuyente ON consulta.rutCons = contribuyente.rutContribuyente
                       LEFT JOIN situacion ON consulta.rutCons = situacion.rutContribuyente 
                       LEFT JOIN usuario ON consulta.idUsuario = usuario.idUsuario  
                       WHERE consulta.idEmpresa =  @vcIdEmpresa AND consulta.fechaCons>= @vcfechacsv_inicio+' 00:00:00' AND consulta.fechaCons<= @vcfechacsv_inicio+' 23:59:59'
                     end
                    else
                     begin
                       SELECT DISTINCT consulta.rutCons AS rutContribuyente, CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fechaCons, usuario.usuario AS usuarioCons, contribuyente.razonSocial, contribuyente.paterno, contribuyente.materno, contribuyente.nombres, contribuyente.giro, contribuyente.direccion, contribuyente.comuna, situacion.fechaInicioActividades, situacion.categoria, situacion.observacion
                       FROM consulta
                       LEFT JOIN contribuyente ON consulta.rutCons = contribuyente.rutContribuyente
                       LEFT JOIN situacion ON consulta.rutCons = situacion.rutContribuyente 
                       LEFT JOIN usuario ON consulta.idUsuario = usuario.idUsuario  
                       WHERE consulta.idEmpresa =  @vcIdEmpresa AND consulta.fechaCons>= @vcfechacsv_inicio+' 00:00:00' AND consulta.fechaCons<=@vcfechacsv_fin +' 23:59:59'
                     end
                    
                  
  
					
END
GO

GO
--SqlScripter----[dbo].[sp_buscar_csv_empresa].sql
GO
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
                	SELECT empresa.idEmpresa, empresa.nombreFantasia
					FROM empresa, contrato
					where empresa.estado = 1 AND empresa.idEmpresa = contrato.idEmpresa AND contrato.vigente = 1
        END 

      IF ( @iTipo_funcion = 2 ) 
        BEGIN 
        
         SET @sql = 'SELECT empresa.idEmpresa, empresa.nombreFantasia
					FROM empresa, contrato
					where empresa.estado = 1 AND empresa.idEmpresa = contrato.idEmpresa AND contrato.vigente = 1 AND empresa.idEmpresa IN ('  + @vcEmpresa+')' 
                
         EXEC sp_executesql 
         @sql 

        END 

   
			
END
GO

GO
--SqlScripter----[dbo].[sp_buscar_csv_honorarios].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_csv_honorarios]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_csv_honorarios] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_csv_honorarios]
(@vcIdEmpresa varchar (15), @vcfechacsv_inicio VARCHAR(24), @vcfechacsv_fin VARCHAR(24)) AS
BEGIN


                 IF (@vcfechacsv_fin IS NULL OR @vcfechacsv_fin='')
                     begin
                     
                       SELECT DISTINCT consulta.rutCons AS rutContribuyente, CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, honorario.rutContribuyente, contribuyente.razonSocial AS NombreRazonSocial, honorario.fecha
                       from  consulta
                        INNER JOIN honorario ON consulta.rutCons = honorario.rutContribuyente
                       INNER JOIN contribuyente ON honorario.rutContribuyente = contribuyente.rutContribuyente                      
                       INNER JOIN usuario ON consulta.idUsuario = usuario.idUsuario 
                       WHERE consulta.idEmpresa =  @vcIdEmpresa  AND consulta.fechaCons >=  @vcfechacsv_inicio + ' 00:00:00' AND consulta.fechaCons<=@vcfechacsv_inicio+' 23:59:59' 
                        
                     end
                    else
                     BEGIN
                     
                       SELECT DISTINCT consulta.rutCons AS rutContribuyente, CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, honorario.rutContribuyente, contribuyente.razonSocial AS NombreRazonSocial, honorario.fecha
                       from  consulta
                        INNER JOIN honorario ON consulta.rutCons = honorario.rutContribuyente
                       INNER JOIN contribuyente ON honorario.rutContribuyente = contribuyente.rutContribuyente                      
                       INNER JOIN usuario ON consulta.idUsuario = usuario.idUsuario 
                       WHERE consulta.idEmpresa =  @vcIdEmpresa  AND consulta.fechaCons >=  @vcfechacsv_inicio + ' 00:00:00' AND consulta.fechaCons<=@vcfechacsv_fin+' 23:59:59' 
                        
                     end
  
   
   
   
                 

END
GO

GO
--SqlScripter----[dbo].[sp_buscar_csv_propiedad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_csv_propiedad]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_csv_propiedad] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_csv_propiedad]
(@vcIdEmpresa varchar (15), @vcfechacsv_inicio VARCHAR(24), @vcfechacsv_fin VARCHAR(24)) AS
BEGIN


                    IF (@vcfechacsv_fin IS NULL OR @vcfechacsv_fin='')
                     begin
                       SELECT DISTINCT consulta.rutCons AS rutContribuyente, CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, propiedad.rol, propiedad.direccion, propiedad.comuna, propiedad.destino, propiedad.avaluo, propiedad.cVencidas, propiedad.cVigentes, propiedad.condicion
                       FROM consulta
                       LEFT JOIN propiedad ON consulta.rutCons = propiedad.rutContribuyente
                       LEFT join usuario ON consulta.idUsuario = usuario.idUsuario
                       WHERE consulta.idEmpresa =  @vcIdEmpresa AND consulta.fechaCons >= @vcfechacsv_inicio+' 00:00:00' AND consulta.fechaCons <=  @vcfechacsv_inicio+' 23:59:59' 
                        
                     end
                    else
                     BEGIN
                       SELECT DISTINCT consulta.rutCons AS rutContribuyente, CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, propiedad.rol, propiedad.direccion, propiedad.comuna, propiedad.destino, propiedad.avaluo, propiedad.cVencidas, propiedad.cVigentes, propiedad.condicion
                       FROM consulta
                       LEFT JOIN propiedad ON consulta.rutCons = propiedad.rutContribuyente
                       LEFT join usuario ON consulta.idUsuario = usuario.idUsuario
                       WHERE consulta.idEmpresa = @vcIdEmpresa  AND consulta.fechaCons >= @vcfechacsv_inicio + ' 00:00:00' AND consulta.fechaCons<=  @vcfechacsv_fin + ' 23:59:59' 
                     end
  
     

 

END
GO

GO
--SqlScripter----[dbo].[sp_buscar_csv_representante].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_csv_representante]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_csv_representante] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_csv_representante]
(@vcIdEmpresa varchar (15), @vcfechacsv_inicio VARCHAR(24), @vcfechacsv_fin VARCHAR(24)) AS
BEGIN

                    

                   IF (@vcfechacsv_fin IS NULL OR @vcfechacsv_fin='')
                     begin
                     
                       SELECT DISTINCT consulta.rutCons AS rutContribuyente, CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, representante.rutRepresentante, contribuyente.razonSocial AS NombreRazonSocial, representante.fechaIncorporacion
                       from  consulta
                       LEFT JOIN contribuyente ON consulta.rutCons = contribuyente.rutContribuyente
                       LEFT JOIN representante ON representante.rutRepresentante = contribuyente.rutContribuyente
                       LEFT JOIN usuario ON consulta.idUsuario = usuario.idUsuario
                       WHERE consulta.idEmpresa =  12  AND consulta.fechaCons >=   @vcfechacsv_inicio +' 00:00:00' AND consulta.fechaCons<=@vcfechacsv_inicio +' 23:59:59'
                        
                     end
                    else
                     BEGIN
                       SELECT DISTINCT consulta.rutCons AS rutContribuyente, CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, representante.rutRepresentante, contribuyente.razonSocial AS NombreRazonSocial, representante.fechaIncorporacion
                       from  consulta
                       LEFT JOIN contribuyente ON consulta.rutCons = contribuyente.rutContribuyente
                       LEFT JOIN representante ON representante.rutRepresentante = contribuyente.rutContribuyente
                       LEFT JOIN usuario ON consulta.idUsuario = usuario.idUsuario
                       WHERE consulta.idEmpresa =  12  AND consulta.fechaCons >=   @vcfechacsv_inicio +' 00:00:00' AND consulta.fechaCons<=@vcfechacsv_fin + ' 23:59:59'  
                     end
  
   
   
   
                 

END
GO

GO
--SqlScripter----[dbo].[sp_buscar_csv_sociedad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_csv_sociedad]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_csv_sociedad] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_csv_sociedad]
(@vcIdEmpresa varchar (15), @vcfechacsv_inicio VARCHAR(24), @vcfechacsv_fin VARCHAR(24)) AS
BEGIN



                     IF (@vcfechacsv_fin IS NULL OR @vcfechacsv_fin='')
                     begin
                      SELECT DISTINCT consulta.rutCons AS rutContribuyente, sociedad.rutSociedad, consulta.idEmpresa, CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, contribuyente.razonSocial AS NombreRazonSocial, sociedad.fechaIncorporacion
                      FROM consulta                     
                      INNER JOIN sociedad ON consulta.rutCons = sociedad.rutContribuyente 
                      INNER  JOIN contribuyente ON sociedad.rutContribuyente = contribuyente.rutContribuyente 
                      INNER  JOIN usuario ON  consulta.idUsuario = usuario.idUsuario
                      WHERE consulta.idEmpresa =  @vcIdEmpresa  AND consulta.fechaCons >= @vcfechacsv_inicio + ' 00:00:00' AND consulta.fechaCons <= @vcfechacsv_inicio +' 23:59:59' 
                        
                     end
                    else
                     begin
                      SELECT DISTINCT consulta.rutCons AS rutContribuyente, sociedad.rutSociedad, consulta.idEmpresa, CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, contribuyente.razonSocial AS NombreRazonSocial, sociedad.fechaIncorporacion
                      FROM consulta    
                      INNER JOIN sociedad ON consulta.rutCons = sociedad.rutContribuyente 
                      INNER  JOIN contribuyente ON sociedad.rutContribuyente = contribuyente.rutContribuyente 
                      INNER  JOIN usuario ON  consulta.idUsuario = usuario.idUsuario
                      WHERE consulta.idEmpresa =  @vcIdEmpresa  AND consulta.fechaCons >= @vcfechacsv_inicio + ' 00:00:00' AND consulta.fechaCons <= @vcfechacsv_fin +' 23:59:59' 
                        
                     end

   
         
                           



END
GO

GO
--SqlScripter----[dbo].[sp_buscar_csv_socio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_csv_socio]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_csv_socio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_csv_socio]
(@vcIdEmpresa varchar (15), @vcfechacsv_inicio VARCHAR(24), @vcfechacsv_fin VARCHAR(24)) AS
BEGIN



                   IF (@vcfechacsv_fin IS NULL OR @vcfechacsv_fin='')
                     begin
                      SELECT DISTINCT consulta.rutCons AS rutContribuyente, socio.rutSocio, consulta.idEmpresa, CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, contribuyente.razonSocial AS NombreRazonSocial, socio.fechaIncorporacion
                      FROM consulta
                      INNER  JOIN contribuyente ON consulta.rutCons = contribuyente.rutContribuyente
                      INNER JOIN socio ON consulta.rutCons = socio.rutContribuyente 
                      INNER JOIN usuario  ON consulta.idUsuario = usuario.idUsuario
                      WHERE consulta.idEmpresa = @vcIdEmpresa AND   consulta.fechaCons >= @vcfechacsv_inicio+' 00:00:00' AND consulta.fechaCons <= @vcfechacsv_inicio+' 23:59:59' 
                        
                     end
                    else
                     begin
                        SELECT DISTINCT consulta.rutCons AS rutContribuyente, socio.rutSocio, consulta.idEmpresa, CONVERT(VARCHAR(19),consulta.fechaCons,120) AS fecha, usuario.usuario AS usuarioCons, contribuyente.razonSocial AS NombreRazonSocial, socio.fechaIncorporacion
                      FROM consulta
                      INNER  JOIN contribuyente ON consulta.rutCons = contribuyente.rutContribuyente
                      INNER JOIN socio ON consulta.rutCons = socio.rutContribuyente 
                      INNER JOIN usuario  ON consulta.idUsuario = usuario.idUsuario
                      WHERE consulta.idEmpresa = @vcIdEmpresa AND   consulta.fechaCons >= @vcfechacsv_inicio+' 00:00:00' AND consulta.fechaCons <= @vcfechacsv_fin+' 23:59:59' 
                        
                     end

   
         
                           



END
GO

GO
--SqlScripter----[dbo].[Sp_buscar_documento].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[Sp_buscar_documento]') IS NULL EXEC('CREATE PROCEDURE [dbo].[Sp_buscar_documento] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[Sp_buscar_documento]
(@vcCadena_Rut varchar (15)) AS
BEGIN

 select * from documento where rutContribuyente = @vcCadena_Rut

END
GO

GO
--SqlScripter----[dbo].[sp_buscar_empresa].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_empresa]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_empresa] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_empresa]
(@nvCadena_sesion Nvarchar (20)) 
AS
BEGIN

DECLARE @sql NVARCHAR(1000)



select empresa.idEmpresa, empresa.sufijo, empresa.token
from empresainstitucion, empresa
where empresainstitucion.institucion =  @nvCadena_sesion  AND empresainstitucion.idEmpresa= empresa.idEmpresa
END
GO

GO
--SqlScripter----[dbo].[sp_buscar_form22].sql
GO
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

GO
--SqlScripter----[dbo].[sp_buscar_form29].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_form29]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_form29] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_form29]
(@vcCadena_periodo VARCHAR(20), 
                                           @vcCadena_rut     varchar (15)) 
AS 
  BEGIN 
      DECLARE @sql NVARCHAR(1000) 

      SET @sql = 'select * from form29 where rutContribuyente = ' + @vcCadena_rut 
                 + ' periodo  = ' + @vcCadena_periodo 

      EXEC sp_executesql 
        @sql 
  END
GO

GO
--SqlScripter----[dbo].[sp_buscar_honorario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_honorario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_honorario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_honorario]
(@vcCadena_Rut varchar (15)) 
AS 
  BEGIN 
      select * 
      from   honorario 
      where  rutContribuyente = @vcCadena_Rut 
  END
GO

GO
--SqlScripter----[dbo].[sp_buscar_lotes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_lotes]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_lotes] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_lotes]
(@vcCadena_sesion varchar (255), 
                                          @dtFecha_ini     VARCHAR(24), 
                                          @dtFecha_fin     VARCHAR(24)) 
AS 
  BEGIN 
      SELECT * 
      FROM   lotes 
      WHERE  idEmpresa = @vcCadena_sesion 
             AND fec_creacion >= @dtFecha_ini + ' 00:00:00' 
             AND fec_creacion <= @dtFecha_ini + ' 23:59:59' 
  END
GO

GO
--SqlScripter----[dbo].[sp_buscar_lotes_task].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_lotes_task]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_lotes_task] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_lotes_task]
AS 
  BEGIN 
      DECLARE @sql NVARCHAR(1000) 

     select * from lotes where estado = 1 

  END
GO

GO
--SqlScripter----[dbo].[sp_buscar_propiedad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_propiedad]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_propiedad] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_propiedad]
(@vcCadena_Rut varchar (15)) 
AS 
  BEGIN 
      select * 
      from   propiedad 
      where  rutContribuyente = @vcCadena_Rut 
  END
GO

GO
--SqlScripter----[dbo].[sp_buscar_representante].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_representante]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_representante] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_representante]
(@vcCadena_Rut varchar (15)) 
AS 
  BEGIN 
      select * 
      from   representante 
      where  rutContribuyente = @vcCadena_Rut 
  END
GO

GO
--SqlScripter----[dbo].[sp_buscar_sociedad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_sociedad]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_sociedad] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_sociedad]
(@vcCadena_Rut varchar (15)) 
AS 
  BEGIN 
      select * 
      from   sociedad 
      where  rutContribuyente = @vcCadena_Rut 
  END
GO

GO
--SqlScripter----[dbo].[sp_buscar_socio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_socio]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_socio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_socio]
(@vcCadena_Rut varchar (15)) 
AS 
  BEGIN 
      select * 
      from   socio 
      where  rutContribuyente = @vcCadena_Rut 
  END
GO

GO
--SqlScripter----[dbo].[sp_buscar_solo_actividad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_solo_actividad]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_solo_actividad] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_solo_actividad]
AS 
  BEGIN 
      select * 
      from   actividad 
  END
GO

GO
--SqlScripter----[dbo].[sp_buscar_usuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_buscar_usuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_buscar_usuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_buscar_usuario]
(@nvcUsuario Nvarchar (255)) 
AS 
  BEGIN 
      DECLARE @sql NVARCHAR(1000) 

      select idusuario, 
             usuario 
      from   usuario 
      where  usuario = @nvcUsuario 
  END
GO

GO
--SqlScripter----[dbo].[sp_funciones].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[sp_funciones]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_funciones] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_funciones]
(@iTipo_funcion int,
                              @iRut int, 
                              @iEmpresa int
)

/********************************************************************************************
* Sistema        : Servicio Validaci├│n Tributaria Consulta
* Procedimiento  : sp_funciones
* Descripcion    : Se incorpora una nueva columna %NC en la secci├│n Compras y Ventas 
* Responsable    : Felipe Poveda
* Fecha Creacion : 03/04/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 07/04/2017 FPE         Se incorpora nueva columna %NC en la secci├│n Compras y Ventas
* 
*********************************************************************************************/

AS
DECLARE @tabla_resultado int 
BEGIN

 IF (@iTipo_funcion =1 )
   BEGIN
    SELECT * FROM dbo.eerr1_sql (@iRut, @iEmpresa) ORDER BY per desc
    
   END
 IF (@iTipo_funcion =2 )
   BEGIN
   SELECT * FROM dbo.eerr2_sql (@iRut, @iEmpresa) ORDER BY per desc
   END
 IF (@iTipo_funcion =3 )
   BEGIN
     SELECT * FROM dbo.balance_sql (@iRut, @iEmpresa, 0) ORDER BY per desc
   END

 IF (@iTipo_funcion =4 )
   BEGIN
     SELECT * FROM dbo.ratios_sql (@iRut, @iEmpresa) ORDER BY per desc
   END
 IF (@iTipo_funcion =5 )
   BEGIN
   SELECT * FROM dbo.ventas_sql (@iRut, @iEmpresa) ORDER BY per desc
   END
 --- Nueva vista ACF Capital
 IF (@iTipo_funcion =6 )
   BEGIN
   SELECT * FROM dbo.eerr1_acf_sql (@iRut, @iEmpresa) ORDER BY per desc
   END
 IF (@iTipo_funcion =7 )
   BEGIN
   SELECT * FROM dbo.ventas_acf_sql (@iRut, @iEmpresa) ORDER BY per desc
   END
 IF (@iTipo_funcion =8 )
   BEGIN
   SELECT * FROM dbo.rgc_sql (@iRut, @iEmpresa) ORDER BY per desc
   END  
RETURN
END
GO

GO
--SqlScripter----[dbo].[sp_insertar_actividad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_actividad]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_actividad] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_actividad]
@iCodigo  int, 
                                         @vcNombre varchar(255), 
                                         @iSalida  int output 
AS 
  BEGIN try 
      begin TRAN 

      begin 
          --IF NOT EXISTS( select 1 from representante where rutContribuyente=@vcRutContribuyente) 
          --select * from actividad 
          INSERT INTO actividad 
                      (codigo, 
                       nombre) 
          values      (@iCodigo, 
                       @vcNombre) 
      END 

      IF @@TRANCOUNT > 0 
        COMMIT TRAN; 

      SET @iSalida= 1 
  end try 

  begin catch 
      SET @iSalida= 0 

      IF @@TRANCOUNT > 0 
        ROLLBACK TRAN; 
  end catch 

    RETURN ( @iSalida )
GO

GO
--SqlScripter----[dbo].[sp_insertar_actividadContr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_actividadContr]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_actividadContr] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_actividadContr]
@vcRut       VARCHAR (20), 
                                              @vcCodigo    varchar(50), 
                                              @vcFecha     VARCHAR (25), 
                                              @vcAfecto    varchar(100), 
                                              @vcCategoria varchar(100), 
                                              @iSalida     int output 
AS 
  BEGIN try 
      begin TRAN 

      begin 
          --IF NOT EXISTS( select 1 from representante where rutContribuyente=@vcRutContribuyente) 
          --select * from actividad 
          INSERT INTO actividadContr 
          values      (@vcRut, 
                       @vcCodigo, 
                       @vcFecha, 
                       @vcAfecto, 
                       @vcCategoria) 
      END 

      IF @@TRANCOUNT > 0 
        COMMIT TRAN; 

      SET @iSalida= 1 
  end try 

  begin catch 
      SET @iSalida= 0 

      IF @@TRANCOUNT > 0 
        ROLLBACK TRAN; 
  end catch 

    RETURN ( @iSalida )
GO

GO
--SqlScripter----[dbo].[sp_insertar_archivo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_archivo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_archivo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_archivo]
@iIdEmpresa         int, 
                                       @biRutContribuyente bigint, 
                                       @biFec_carpeta      bigint, 
                                       @vcFecha            varchar(25), 
                                       @vcCodRespuesta     float, 
                                       @vcNombre           varchar(255), 
                                       @ntData             NTEXT, 
                                       @iSalida            int output 
AS 
  BEGIN try 
      begin TRAN 

      begin 
          --IF NOT EXISTS( select 1 from representante where rutContribuyente=@vcRutContribuyente) 
          --select * from archivo 
          INSERT INTO archivo 
                      (idEmpresa, 
                       rutContribuyente, 
                       fec_carpeta, 
                       fecha, 
                       codRespuesta, 
                       nombre, 
                       data) 
          values      (@iIdEmpresa, 
                       @biRutContribuyente, 
                       @biFec_carpeta, 
                       @vcFecha, 
                       @vcCodRespuesta, 
                       @vcNombre, 
                       @ntData) 
      END 

      IF @@TRANCOUNT > 0 
        COMMIT TRAN; 

      SET @iSalida= 1 
  end try 

  begin catch 
      SET @iSalida= 0 

      IF @@TRANCOUNT > 0 
        ROLLBACK TRAN; 
  end catch 

    RETURN ( @iSalida )
GO

GO
--SqlScripter----[dbo].[sp_insertar_autorizaform].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_autorizaform]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_autorizaform] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_autorizaform]
@vcIdEmpresa    varchar(53),
			@biFolio        BIGINT,
			 @iSalida           int output
	      
AS
 
BEGIN TRY

  begin TRAN 

      begin
      
		--IF NOT EXISTS( select 1 from representante where rutContribuyente=@vcRutContribuyente) 
	     IF NOT EXISTS(select 1 from   autorizaform where  idEmpresa = @vcIdEmpresa AND folio= @biFolio) 
	     begin
			--select * from autorizaform
			 INSERT INTO autorizaform  
                        (idEmpresa,
                         folio,
                         fecCreacion)
                     
             values (@vcIdEmpresa,
                     @biFolio,
                     getdate())	 
                     
             
         end            									
       
    END
      	IF @@TRANCOUNT > 0  
			COMMIT TRAN ;     
           SET @iSalida=  1
     
  end try

  begin CATCH
  
      SET @iSalida= 0
     IF @@TRANCOUNT > 0
        ROLLBACK TRAN 
    
  end CATCH
  
   RETURN (@iSalida)
GO

GO
--SqlScripter----[dbo].[sp_insertar_consulta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_consulta]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_consulta] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_consulta]
@iIdempresa    varchar(4), 
                                              @iIdcontrato   varchar(4), 
                                              @iIdusuario    varchar(4), 
                                              @iIdservicio   varchar(4), 
                                              @vcFechacons   varchar(24), 
                                              @iIpusuario    varchar(20), 
                                              @iRutcons      varchar(8), 
                                              @vcParametro   varchar(20), 
                                              @iCodRespuesta varchar(4), 
                                              @vcOrigendato  varchar(4), 
                                              @cTab          varchar(3), 
                                              @iIdMenu       varchar(1), 
                                              @IdCons        int output 
AS 
  BEGIN 
      DECLARE @idEmpresa INT 
      DECLARE @idContrato INT 
      DECLARE @idUsuario INT 
      DECLARE @idServicio INT 
      DECLARE @fechaCons DATETIME 
      DECLARE @rutCons INT 
      DECLARE @codRespuesta INT 
      DECLARE @idMenu TINYINT 

      begin try 
          SELECT @idEmpresa = CONVERT(INT, @iIdempresa) 

          SELECT @idContrato = CONVERT(INT, @iIdcontrato) 

          SELECT @idUsuario = CONVERT(INT, @iIdusuario) 

          SELECT @idservicio = CONVERT(INT, @iIdservicio) 

          SELECT @rutCons = CONVERT(INT, @iRutcons) 

          SELECT @iCodRespuesta = CONVERT(INT, @iCodRespuesta) 

          SELECT @idMenu = CONVERT(INT, @iIdMenu) 

          begin 
              INSERT INTO consulta 
              values      (@iIdempresa, 
                           @idcontrato, 
                           @idusuario, 
                           @idservicio, 
                           Getdate(), 
                           @iIpusuario, 
                           @rutcons, 
                           @vcParametro, 
                           @iCodRespuesta, 
                           @vcOrigendato, 
                           @cTab, 
                           @idMenu) 

              SELECT @IdCons = @@IDENTITY 

              return @IdCons 
          end 
      end try 

      begin catch 
          rollback 

          select ERROR_MESSAGE() AS ErrorMessage; 
      end catch 
  END
GO

GO
--SqlScripter----[dbo].[sp_insertar_contribuyente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_contribuyente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_contribuyente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_contribuyente]
@iRutContribuyente   int,
  @vcNcontribuyente    varchar(1),
  @vcRazonSocial       varchar (200),
  @vcDireccion         varchar(200),
  @vcComuna            varchar(100),
  @vcCorreo            varchar(80),
  @iTelefono           int ,
  @vcGiro              varchar(200),
  @vcPaterno           varchar(40),
  @vcMaterno           varchar(40),
  @vcNombres           varchar(60),
  @vcFecha_crea        varchar(24),
  @vcFecha_act         varchar(24),
  @vcFechaIni          VARCHAR(24),
  @vcCategoria         VARCHAR(30),
  @vcObservacion       VARCHAR(30),
  @salida           int output
AS
 
BEGIN
DECLARE @sql NVARCHAR(MAX) 
DECLARE @sql2 NVARCHAR(MAX) 
DECLARE @vacio VARCHAR

DECLARE @ultimo VARCHAR (2)
DECLARE @valor VARCHAR (2)
        SET @sql2 = ''
        SET @sql = ''
        SET @vacio =''


BEGIN try   
    
      
      IF NOT EXISTS( select 1 from contribuyente where rutContribuyente=@iRutContribuyente) 
       BEGIN
          
       INSERT INTO contribuyente 
                     (rutContribuyente,
                      nContribuyente,
                      razonSocial,
                      direccion,
                      comuna,
                      correo,
                      telefono,
                      paterno,
                      materno,
                      nombres,
                      fecCreacion,
                      fecActualizacion,
                      fechaInicioActividades,
                      categoria,
                      observacion)
                     
               values (@iRutContribuyente ,
			           @vcNcontribuyente,
			           @vcRazonSocial,
			           @vcDireccion,
			           @vcComuna,
			           @vcCorreo,
			           @iTelefono,
			           @vcPaterno,
			           @vcMaterno,
			           @vcNombres,
			           @vcFecha_crea,
			           @vcFecha_act,
			           @vcFechaIni,
			           @vcCategoria,
			           @vcObservacion)
          
            	SET @salida=  1
            END 
            Else
             BEGIN
	           
                  
			    IF ( @vcRazonSocial IS NOT NULL )  
			     IF (@vcRazonSocial <> @vacio)
	               set @sql2 =@sql2+ ' razonSocial= @vcRazonSocial ,'
			    IF ( @vcDireccion IS NOT NULL )
			     IF (@vcDireccion <> @vacio)
	              SET   @sql2 = @sql2   + ' direccion= @vcDireccion,'
	            IF ( @vcComuna IS NOT NULL )
	             IF (@vcComuna <> @vacio)
	              set @sql2 =@sql2+ ' comuna=  @vcComuna ,'
			    IF ( @vcCorreo IS NOT NULL )
			     IF ( @vcCorreo <> @vacio) 
	                SET   @sql2 = @sql2   + ' correo= @vcCorreo,'
	             IF ( @iTelefono IS NOT NULL )
	                IF ( @vcCorreo <> @vacio) 
	                  set @sql2 =@sql2+ ' telefono=' + CONVERT(VARCHAR(15), @iTelefono)+','
			    IF ( @vcGiro IS NOT NULL )	
			      IF ( @vcGiro <> @vacio) 
	                SET   @sql2 = @sql2   + ' giro= @vcGiro,'
	            IF ( @vcPaterno IS NOT NULL )
	             IF ( @vcPaterno <> @vacio) 
	             set @sql2 =@sql2+ ' paterno=@vcPaterno,'
			    IF ( @vcMaterno IS NOT NULL )
			      IF ( @vcMaterno <> @vacio) 
	              SET   @sql2 = @sql2   + ' materno= @vcMaterno,'
			    IF ( @vcNombres IS NOT NULL )
			      IF ( @vcNombres <> @vacio)  
	                set @sql2 =@sql2+ ' nombres= @vcNombres,'
			    IF ( @vcFecha_crea IS NOT NULL )
			      IF ( @vcFecha_crea <> @vacio)  
	                SET   @sql2 = @sql2   + ' fecCreacion=@vcFecha_crea,'
	             IF ( @vcFechaIni IS NOT NULL )
	               IF ( @vcFechaIni <> @vacio)  
	                set @sql2 =@sql2+ ' fechaInicioActividades=@vcFechaIni,'
			    IF ( @vcCategoria IS NOT NULL )
			      IF ( @vcCategoria <> @vacio)  
	                SET   @sql2 = @sql2   + ' categoria=@vcCategoria,'
	            IF ( @vcObservacion IS NOT NULL )
	             IF ( @vcObservacion <> @vacio)  
	               set @sql2 =@sql2+ ' observacion=@vcObservacion'
	            
	             SET @ultimo = SUBSTRING (@sql2, Len(@sql2), 1 )
	              SET @valor = char(44);
	           
	             IF (@ultimo= @valor)
	             BEGIN
	             
	                SET @sql2= SUBSTRING (@sql2, 1, Len(@sql2) - 1 )
	                
	             END
	             
	            
		
					IF  ( @sql2 IS NOT NULL )
					begin
									SET @sql = ' UPDATE contribuyente set ' +  @sql2 + ' WHERE rutContribuyente='+CONVERT(VARCHAR(15),@iRutContribuyente)
									
									 EXEC sp_executesql   @sql,   N'@vcRazonSocial nvarchar(200),       
																  @vcDireccion   nvarchar(200)  ,   
																  @vcComuna      nvarchar(200)   ,  
																  @vcCorreo     nvarchar(200)   ,   
																  @iTelefono   nvarchar(20)   ,   
																  @vcGiro      nvarchar(200)    ,   
																  @vcPaterno   nvarchar(200)     ,  
																  @vcMaterno   nvarchar(200)     ,  
																  @vcNombres    nvarchar(200)    ,  
																  @vcFecha_crea  nvarchar(200)   ,  
																  @vcFecha_act   nvarchar(200)   ,  
																  @vcFechaIni    nvarchar(200)   ,  
																  @vcCategoria    nvarchar(200)  ,  
																  @vcObservacion NVARCHAR(200)',   @vcRazonSocial,       
																					  @vcDireccion ,       
																					  @vcComuna    ,       
																					  @vcCorreo    ,       
																					  @iTelefono   ,      
																					  @vcGiro       ,      
																					  @vcPaterno     ,     
																					  @vcMaterno      ,    
																					  @vcNombres     ,     
																					  @vcFecha_crea  ,     
																					  @vcFecha_act   ,     
																					  @vcFechaIni     ,    
																					  @vcCategoria    ,    
																					  @vcObservacion ; 
									                      
                                   
									SET @salida=  1

					END
		              
        

           END
    
  end try
  begin catch

    SET @salida=  0

    
  end CATCH
  RETURN (@salida)
END
GO

GO
--SqlScripter----[dbo].[sp_insertar_documento].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_documento]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_documento] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_documento]
@vcNombre           varchar(80), 
                                         @vcFecha            varchar(10), 
                                         @vcRutContribuyente varchar(15), 
                                         @iSalida            int output 
AS 
  BEGIN try 
      begin TRAN 

      begin 
          --IF NOT EXISTS( select 1 from representante where rutContribuyente=@vcRutContribuyente) 
          --select * from documento 
          INSERT INTO documento 
                      (nombre, 
                       fecha, 
                       rutContribuyente) 
          values      (@vcNombre, 
                       @vcFecha, 
                       @vcRutContribuyente) 
      END 

      IF @@TRANCOUNT > 0 
        COMMIT TRAN; 

      SET @iSalida= 1 
  end try 

  begin catch 
      SET @iSalida= 0 

      IF @@TRANCOUNT > 0 
        ROLLBACK TRAN; 
  end catch 

    RETURN ( @iSalida )
GO

GO
--SqlScripter----[dbo].[sp_insertar_empresa].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_empresa]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_empresa] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_empresa]
@iEstado   int, 
                                       @vcSufijo  varchar(255), 
                                       @vcNombre  VARCHAR (255), 
                                       @idEmpresa int output 
AS 
  BEGIN 
      begin try 
          begin 
              --IF NOT EXISTS( select 1 from representante where rutContribuyente=@vcRutContribuyente) 
              BEGIN 
                  --select * from empresa 
                  INSERT INTO empresa 
                              (estado, 
                               nombreFantasia, 
                               sufijo) 
                  values      (@iEstado, 
                               @vcNombre, 
                               @vcSufijo) 
              END 

              SELECT @idEmpresa = @@IDENTITY 

              return @idEmpresa 
          end 
      end try 

      begin catch 
          return 0 

          rollback 
      end catch 
  END
GO

GO
--SqlScripter----[dbo].[sp_insertar_empresaInstitucion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_empresaInstitucion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_empresaInstitucion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_empresaInstitucion]
@iIdEmpresa     int, 
                                                  @vc_Institucion varchar(20), 
                                                  @iSalida        int output 
AS 
  BEGIN try 
      begin TRAN 

      --IF NOT EXISTS( select 1 from representante where rutContribuyente=@vcRutContribuyente) 
      BEGIN 
          --select * from empresainstitucion 
          INSERT INTO empresainstitucion 
                      (idEmpresa, 
                       institucion) 
          values      (@iIdEmpresa, 
                       @vc_Institucion) 
      END 

      IF @@TRANCOUNT > 0 
        COMMIT TRAN; 

      SET @iSalida= 1 
  end try 

  begin catch 
      SET @iSalida= 0 

      IF @@TRANCOUNT > 0 
        ROLLBACK TRAN; 
  end catch 

    RETURN ( @iSalida )
GO

GO
--SqlScripter----[dbo].[sp_insertar_form_detalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_form_detalle]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_form_detalle] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_form_detalle]
@iConsulta_id     int, 
                                            @biFolio          bigint, 
                                            @vcPeriodo        varchar(10), 
                                            @vcTipoformulario varchar(3),
                                            @vcEstado         VARCHAR(5),
                                            @iSalida          int OUTPUT
                                             
AS 
  BEGIN 
      begin try 
          begin 
              BEGIN 
                  --select * from detalle 
                  INSERT INTO detalle 
                              (consulta_id, 
                               folio, 
                               periodo, 
                               tipoformulario,
                               estado) 
                  values      (@iConsulta_id, 
                               @biFolio, 
                               @vcPeriodo, 
                               @vcTipoformulario,
                               @vcEstado) 
              END 

              SET @iSalida= 1 
          end 
      end try 

      begin catch 
          SET @iSalida= 0 

          rollback 
      end catch 

      RETURN ( @iSalida ) 
  END
GO

GO
--SqlScripter----[dbo].[sp_insertar_form22].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_form22]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_form22] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_form22]
@vc_Estado_codigo varchar (10), 
                                      @iPeriodo         int, 
                                      @iVigente         int,
                                      @vcCod_0315       varchar(25), 
                                      @biCod_0007       bigint, 
                                      @iRut             int, 
                                      @vcCod_9925       NVARCHAR(50), 
                                      @nvcCampos        NVARCHAR(MAX), 
                                      @nvcValores       NVARCHAR(MAX),
                                      @iSalida         INT OUTPUT 
AS 
  BEGIN 
      DECLARE @ncSeparador NCHAR(1) 
      DECLARE @vcConcatenaCampos varchar(max) 
      DECLARE @vcConcatenaValores varchar(max) 
      DECLARE @iPosicionCampos int 
      DECLARE @iPosicionValores int 
      DECLARE @ncSQL nvarchar(4000)
    
      DECLARE @cObtieneRF char(2) 
      DECLARE @vcCod_0315_Bd varchar(25) 
      
    

      SET @vcConcatenaCampos='' 
      SET @vcConcatenaValores='''' 
      SET @ncSeparador=',' 
      SET @iPosicionCampos = 1 
      SET @iPosicionValores = 1 
      SET @nvcCampos = @nvcCampos + @ncSeparador 
      SET @nvcValores = @nvcValores + @ncSeparador 

      --Recorrer y concatena Campos 
      WHILE Charindex(@ncSeparador, @nvcCampos, @iPosicionCampos) <> 0 
        BEGIN 
            set @vcConcatenaCampos += Substring(@nvcCampos, @iPosicionCampos, 
                                      Charindex( 
                                      @ncSeparador, @nvcCampos, 
                                      @iPosicionCampos)+ - @iPosicionCampos) 
                                      + ',' 
            SET @iPosicionCampos = Charindex(@ncSeparador, @nvcCampos, 
                                   @iPosicionCampos) 
                                   + 1 
        END 

      --Recorrer y concatena Valores 
      WHILE Charindex(@ncSeparador, @nvcValores, @iPosicionValores) <> 0 
        BEGIN 
            set @vcConcatenaValores += Substring(@nvcValores, @iPosicionValores, 
                                       Charindex(@ncSeparador, @nvcValores, 
                                       @iPosicionValores)+ - @iPosicionValores) 
                                       + ''',''' 
            SET @iPosicionValores = Charindex(@ncSeparador, @nvcValores, 
                                    @iPosicionValores) 
                                    + 1 
        END 

      --quito ultimo caracter 
      select @vcConcatenaCampos = Substring (@vcConcatenaCampos, 1, 
                                         Len(@vcConcatenaCampos) - 1) 

      select @vcConcatenaValores = Substring (@vcConcatenaValores, 1, 
                                          Len(@vcConcatenaValores) - 2) 

      --genero insert 
      SET @ncSQL = 'INSERT INTO form22 ' + '(' 
                   + @vcConcatenaCampos + ') VALUES ' + '(' 
                   + @vcConcatenaValores + ')' 

      select @ncSQL 
        
      
      if Cast(Rtrim(Ltrim(@vc_Estado_codigo)) as int) = 0 
        BEGIN 
          SELECT  @biCod_0007
            IF NOT EXISTS(select 1 from   form22 where  cod_0007 = @biCod_0007) 
              BEGIN --NO existe f22 
                
                 SELECT @ncSQL 
                  EXEC sp_executesql 
                   @ncSQL 
                     SELECT @iSalida = 1
                     RETURN @iSalida
                  select @cObtieneRF = Substring (@vcCod_9925, 1, 2) 

                  IF @cObtieneRF = 'RF' 
                    BEGIN 
                     
                     
                       
                        DECLARE @vcCod_0315_cur varchar(25), 
                                @iRutCur        int, 
                                @iPeriodoCur    INT,
                                @icod_0007Cur   INT 
                        DECLARE curFormulario CURSOR FOR 
                          Select cod_0315, 
                           rutContribuyente, 
                                 periodo, cod_0007
                          from   form22 
                          where  rutContribuyente = @iRut 
                             and periodo = @iPeriodo 

                        -- Apertura del cursor 
                        

                        OPEN curFormulario 

                        -- Lectura de la primera fila del cursor 
                        FETCH curFormulario INTO @vcCod_0315_cur, @iRutCur, 
                        @iPeriodoCur, @icod_0007Cur

                        WHILE ( @@FETCH_STATUS = 0 ) 
                          BEGIN 
                             
						select Cast(@vcCod_0315 as datetime) 
			
                        select Cast(@vcCod_0315_cur as datetime) 
                        
                        
                              if Cast(@vcCod_0315 as datetime) > Cast(@vcCod_0315_cur as datetime) 
                                BEGIN 
                                    SELECT 'entre fecha viene es mayor a BD ' 

                                    update form22 
                                    set    vigente = 0 
                                    where  cod_0007= @icod_0007Cur
                                END 
                                 ELSE
                                  BEGIN
                                    -- Desactivo el actual no vigente
                                    update form22 
                                    set    vigente = 0 
                                    where cod_0007= @biCod_0007
                                  END

                              -- Lectura de la siguiente fila del cursor 
                              FETCH curFormulario INTO @vcCod_0315_cur, @iRutCur 
                              , 
                              @iPeriodoCur 
                          END 

                        -- Cierre del cursor 
                        CLOSE curFormulario 

                        -- Liberar los recursos 
                        DEALLOCATE curFormulario 
                         
                    END 
                  else 
                    BEGIN 
                        SELECT 'No viene FR' 
                    END -- no RF 
              END --NO existe f22 
            else 
              BEGIN --existe f22 validamos 
                update form22
                set    vigente = 1
                where  cod_0007= @biCod_0007
                 
                      SELECT @iSalida = 0
                      RETURN @iSalida
                   --  SELECT 'Existe formulario  '
              
              END --existe f22 
        END --estado codigo 
      else 
        BEGIN --estado codigo <> 0 
           if Cast(Rtrim(Ltrim(@vc_Estado_codigo)) as int) = 1
           BEGIN 
            SET @iSalida= 0 
            update form22 
            set    vigente = 0 
            where cod_0007= @biCod_0007
            
               SELECT @iSalida = 0
               RETURN @iSalida
            END
        END 
        RETURN(@iSalida)
  END --fin
GO

GO
--SqlScripter----[dbo].[sp_insertar_form29].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_form29]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_form29] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_form29]
@vcEstado_codigo   varchar(10),
                    @iPeriodo          int,
                    @iVigente          int,
                    @iCod_chk          int,
                    @vcClase           varchar(50),
                    @vcCod_0315        varchar(25),
                    @biCod_0007        bigint,
                    @iRut              int,
                    @nvcCampos         NVARCHAR(MAX),
                    @nvcValores        NVARCHAR(MAX),
                    @iSalida            INT OUTPUT
AS
  BEGIN


      DECLARE @ncSeparador NCHAR(1)
      DECLARE @vcConcatenaCampos varchar(max)
      DECLARE @vcConcatenaValores varchar(max)
      DECLARE @iPosicionCampos int
      DECLARE @iPosicionValores int
      DECLARE @ncSQL nvarchar(4000)

      DECLARE @vcCod_0315_Bd varchar(25)

      SET @vcConcatenaCampos=''
      SET @vcConcatenaValores=''''
      SET @ncSeparador=','
      SET @iPosicionCampos = 1
      SET @iPosicionValores = 1
      SET @nvcCampos = @nvcCampos + @ncSeparador
      SET @nvcValores = @nvcValores + @ncSeparador

      --Recorrer y concatena Campos
      WHILE Charindex(@ncSeparador, @nvcCampos, @iPosicionCampos) <> 0
        BEGIN
            set @vcConcatenaCampos += Substring(@nvcCampos, @iPosicionCampos,
                                      Charindex(
                                      @ncSeparador, @nvcCampos,
                                      @iPosicionCampos)+ - @iPosicionCampos)
                                      + ','
            SET @iPosicionCampos = Charindex(@ncSeparador, @nvcCampos,
                                   @iPosicionCampos)
                                   + 1
        END

      --Recorrer y concatena Valores
      WHILE Charindex(@ncSeparador, @nvcValores, @iPosicionValores) <> 0
        BEGIN
            set @vcConcatenaValores += Substring(@nvcValores, @iPosicionValores,
                                       Charindex(@ncSeparador, @nvcValores,
                                       @iPosicionValores)+ - @iPosicionValores)
                                       + ''','''
            SET @iPosicionValores = Charindex(@ncSeparador, @nvcValores,
                                    @iPosicionValores)
                                    + 1
        END

      --quito ultimo caracter
      select @vcConcatenaCampos = Substring (@vcConcatenaCampos, 1,
                                         Len(@vcConcatenaCampos) - 1)

      select @vcConcatenaValores = Substring (@vcConcatenaValores, 1,
                                          Len(@vcConcatenaValores) - 2)

      --genero insert
      SET @ncSQL = 'INSERT INTO form29 ' + '('
                   + @vcConcatenaCampos + ') VALUES ' + '('
                   + @vcConcatenaValores + ')'

      select @ncSQL
       
      if Cast(Rtrim(Ltrim(@vcEstado_codigo)) as int) = 0
        BEGIN
            IF NOT EXISTS(select 1 from  form29 where cod_0007 = @biCod_0007)
              BEGIN --NO existe f29
                     
                  
                  EXEC sp_executesql
                              @ncSQL
                     SELECT @iSalida = 1
                     RETURN @iSalida
                  IF rtrim(ltrim(@vcClase)) <> 'PRIMITIVA'
                    BEGIN
                        DECLARE @vcCod_0315_cur varchar(25),
                                @iRutCur        int,
                                @iPeriodoCur    INT,
                                @icod_0007Cur   INT 
                        DECLARE curFormulario CURSOR FOR
                          Select cod_0315,
                                 rutContribuyente,
                                 periodo, cod_0007
                          from   form29
                          where  rutContribuyente = @iRut
                             and periodo = @iPeriodo

                        -- Apertura del cursor
                        OPEN curFormulario

                        -- Lectura de la primera fila del cursor
                        FETCH curFormulario INTO @vcCod_0315_cur, @iRutCur,@iPeriodoCur, @icod_0007Cur 

                        WHILE ( @@FETCH_STATUS = 0 )
                          BEGIN

                           select Cast(@vcCod_0315 as datetime)

                           select Cast(@vcCod_0315_cur as datetime)

                              if Cast(@vcCod_0315 as datetime) > Cast(@vcCod_0315_cur as datetime)
                                BEGIN
                                    print 'entre fecha viene es mayor a BD '

                                    update form29
                                    set    vigente = 0
                                    where  cod_0007= @icod_0007Cur
                                END
                                ELSE
                                  BEGIN
                                    -- Desactivo el actual no vigente
                                    update form29 
                                    set    vigente = 0 
                                    where cod_0007= @biCod_0007
                                  END

                              -- Lectura de la siguiente fila del cursor
                              FETCH curFormulario INTO @vcCod_0315_cur, @iRutCur
                              ,
                              @iPeriodoCur
                          END

                        -- Cierre del cursor
                        CLOSE curFormulario

                        -- Liberar los recursos
                        DEALLOCATE curFormulario

                    END
                  else
                    BEGIN
                        print 'No viene FR'
                    END -- no RF
              END --NO existe f29
            else
              BEGIN --existe f29 validamos 
                update form29
                set    vigente = 1
                where  cod_0007= @biCod_0007
                   SELECT @iSalida = 0
                     RETURN @iSalida           
                  --print 'Existe formulario  '
              END --existe f29
        END --estado codigo
      else
        BEGIN --estado codigo <> 0
          if Cast(Rtrim(Ltrim(@vcEstado_codigo)) as int) = 1
           BEGIN
            update form29
            set    vigente = 0
            where  cod_0007= @biCod_0007
               
               SELECT @iSalida = 0
                     RETURN @iSalida
             --print 'codigo distinto 1 actualizo vigente a 0  '
          END
        END
     RETURN (@iSalida)
  END --fin
GO

GO
--SqlScripter----[dbo].[sp_insertar_honorarios].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_honorarios]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_honorarios] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_honorarios]
@vcRutContribuyente varchar(53), 
                                          @vcFecha            varchar(20), 
                                          @vcBruto            float, 
                                          @vcRetencion        float, 
                                          @vcPpm              varchar(255), 
                                          @iSalida            int output 
AS 
  BEGIN try 
      begin TRAN 

      begin 
          --IF NOT EXISTS( select 1 from representante where rutContribuyente=@vcRutContribuyente) 
          --select * from honorario 
          INSERT INTO honorario 
                      (rutContribuyente, 
                       fecha, 
                       bruto, 
                       retencion, 
                       ppm) 
          values      (@vcRutContribuyente, 
                       @vcFecha, 
                       @vcBruto, 
                       @vcRetencion, 
                       @vcPpm) 
      END 

      IF @@TRANCOUNT > 0 
        COMMIT TRAN; 

      SET @iSalida= 1 
  end try 

  begin catch 
      SET @iSalida= 0 

      IF @@TRANCOUNT > 0 
        ROLLBACK TRAN; 
  end catch 

    RETURN ( @iSalida )
GO

GO
--SqlScripter----[dbo].[sp_insertar_lotes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_lotes]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_lotes] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_lotes]
@vcIdempresa     varchar(80), 
                                     @vcEstado        varchar(10), 
                                     @vcIdUsuario     VARCHAR(20), 
                                     @vcNombreCarpeta VARCHAR (255), 
                                     @vcFec_creacion  VARCHAR(25), 
                                     @ntData          NTEXT, 
                                     @id              INT output 
AS 
  BEGIN 
      DECLARE @Estado TINYINT 
      DECLARE @idUsuario BIGINT 

      begin try 
          begin 
              --IF NOT EXISTS( select 1 from representante where rutContribuyente=@vcRutContribuyente) 
              BEGIN 
                  INSERT INTO lotes 
                  values      (@vcIdempresa, 
                               1, 
                               Getdate(), 
                               @idUsuario, 
                               @vcNombreCarpeta, 
                               @vcFec_creacion, 
                               @ntData) 

                  SELECT @Id = @@IDENTITY 
              END 
          end 
      end try 

      begin catch 
          return 0 

          rollback 
      end catch 
  END
GO

GO
--SqlScripter----[dbo].[sp_insertar_propiedad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_propiedad]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_propiedad] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_propiedad]
@iRutContribuyente int, 
                                         @vcComuna          varchar(255), 
                                         @vcRol             varchar(255), 
                                         @vcDirección      varchar(255), 
                                         @vcDestino         varchar(255), 
                                         @vcAvaluo          float, 
                                         @vcCuotasVencidas  varchar(255), 
                                         @vcCuotasVigentes  varchar(255), 
                                         @vcCondicion       varchar(255), 
                                         @iSalida           int output 
AS 
  BEGIN try 
      begin TRAN 

      begin 
          --IF NOT EXISTS( select 1 from propiedad where rutContribuyente=@iRutContribuyente and rol=@vcRol ) 
         
          INSERT INTO propiedad 
                      (rutContribuyente, 
                       rol, 
                       comuna, 
                       direccion, 
                       destino, 
                       avaluo, 
                       cVencidas, 
                       cVigentes, 
                       condicion) 
          values      (@iRutContribuyente, 
                       @vcRol, 
                       @vcComuna, 
                       @vcDirección, 
                       @vcDestino, 
                       @vcAvaluo, 
                       @vcCuotasVencidas, 
                       @vcCuotasVigentes, 
                       @vcCondicion) 
      END 

      IF @@TRANCOUNT > 0 
        COMMIT TRAN; 

      SET @iSalida= 1 
  end try 

  begin catch 
      SET @iSalida= 0 

      IF @@TRANCOUNT > 0 
        ROLLBACK TRAN; 
  end catch 

    RETURN ( @iSalida )
GO

GO
--SqlScripter----[dbo].[sp_insertar_representante].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_representante]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_representante] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_representante]
@vcRutContribuyente   varchar(53), 
                                             @vcRazonSocial        varchar(80), 
                                             @vcRutRepresentante   varchar(53), 
                                             @vcFechaIncorporacion varchar(24), 
                                             @iSalida              int output 
AS 
  BEGIN try 
      begin TRAN 

      --IF NOT EXISTS( select 1 from representante where rutContribuyente=@vcRutContribuyente) 
      BEGIN 
          --select * from representante 
          INSERT INTO representante 
                      (rutContribuyente, 
                       rutRepresentante, 
                       fechaIncorporacion, 
                       razonSocial) 
          values      (@vcRutContribuyente, 
                       @vcRutRepresentante, 
                       @vcFechaIncorporacion, 
                       @vcRazonSocial) 
      END 

      IF @@TRANCOUNT > 0 
        COMMIT TRAN; 

      SET @iSalida= 1 
  end try 

  begin catch 
      SET @iSalida= 0 

      IF @@TRANCOUNT > 0 
        ROLLBACK TRAN; 
  end catch 

    RETURN ( @iSalida )
GO

GO
--SqlScripter----[dbo].[sp_insertar_sociedades].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_sociedades]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_sociedades] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_sociedades]
@vcRutContribuyente   varchar(53),
    @vcRazonSocial        varchar(80),
    @vcRutSociedad           varchar(53),
    @vcFechaIncorporacion varchar(24),
     @iSalida           int output
        
AS
 
BEGIN TRY

  begin TRAN 

      begin

		    --IF NOT EXISTS( select 1 from representante where rutContribuyente=@vcRutContribuyente) 
		  
		      --select * from socio 
		       INSERT INTO sociedad
		                        (rutContribuyente,
		                         rutSociedad,
		                         fechaIncorporacion,
		                         razonSocial)
		                     
		             values (@vcRutContribuyente ,
					           @vcRutSociedad,
					           @vcFechaIncorporacion,
					           @vcRazonSocial)                    
	  
         
		 
      END
      	IF @@TRANCOUNT > 0  
			COMMIT TRAN ;     
           
       SET @iSalida=  1
      
  end try
  begin catch

    SET @iSalida= 0
    
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN ;
  end CATCH
  
  RETURN (@iSalida)
GO

GO
--SqlScripter----[dbo].[sp_insertar_socio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_socio]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_socio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_socio]
@vcRutContribuyente   varchar(53), 
                                     @vcRazonSocial        varchar(80), 
                                     @vcRutSocio           varchar(53), 
                                     @vcFechaIncorporacion varchar(24), 
                                     @iSalida              int output 
AS 
  BEGIN try 
      begin TRAN 

      begin 
          --IF NOT EXISTS( select 1 from representante where rutContribuyente=@vcRutContribuyente) 
          --select * from socio 
          INSERT INTO socio 
                      (rutContribuyente, 
                       rutSocio, 
                       fechaIncorporacion, 
                       razonSocial) 
          values      (@vcRutContribuyente, 
                       @vcRutSocio, 
                       @vcFechaIncorporacion, 
                       @vcRazonSocial) 
      END 

      IF @@TRANCOUNT > 0 
        COMMIT TRAN; 

      SET @iSalida= 1 
  end try 

  begin catch 
      SET @iSalida= 0 

      IF @@TRANCOUNT > 0 
        ROLLBACK TRAN; 
  end catch 

    RETURN ( @iSalida )
GO

GO
--SqlScripter----[dbo].[sp_insertar_usuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_insertar_usuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_usuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_usuario]
@vcIdEmpresa VARCHAR (50), 
                                       @vcUsuario   varchar(255), 
                                       @iEstado     int, 
                                       @idUsuario   int output 
AS 
  BEGIN 
      begin try 
          begin 
              --IF NOT EXISTS( select 1 from representante where rutContribuyente=@vcRutContribuyente) 
              BEGIN 
                  --select * from usuario 
                  INSERT INTO usuario 
                              (idEmpresa, 
                               usuario, 
                               estado) 
                  values      (@vcIdEmpresa, 
                               @vcUsuario, 
                               @iEstado ) 

                  SELECT @idUsuario = @@IDENTITY 
              END 
          end 
      end try 

      begin catch 
          return 0 

          rollback 
      end catch 
  END
GO
