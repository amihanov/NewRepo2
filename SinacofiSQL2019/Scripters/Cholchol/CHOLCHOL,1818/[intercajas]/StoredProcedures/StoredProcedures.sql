
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
--SqlScripter----[dbo].[sp_creatediagram].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_creatediagram]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_creatediagram] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_creatediagram]
(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
GO

GO
--SqlScripter----[dbo].[sp_dropdiagram].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_dropdiagram]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_dropdiagram] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_dropdiagram]
(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
GO

GO
--SqlScripter----[dbo].[sp_helpdiagramdefinition].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_helpdiagramdefinition]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_helpdiagramdefinition]
(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
GO

GO
--SqlScripter----[dbo].[sp_helpdiagrams].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_helpdiagrams]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_helpdiagrams] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_helpdiagrams]
(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
GO

GO
--SqlScripter----[dbo].[sp_renamediagram].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_renamediagram]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_renamediagram] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_renamediagram]
(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
GO

GO
--SqlScripter----[dbo].[sp_upgraddiagrams].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_upgraddiagrams]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_upgraddiagrams] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_upgraddiagrams]
AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
GO

GO
--SqlScripter----[dbo].[spActualizaCabeceraUploadArchivo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spActualizaCabeceraUploadArchivo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spActualizaCabeceraUploadArchivo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 24-06-2013
-- Description: Finaliza un upload de archivo y cambia el estado a enviado WS
--              Tambien permite actualizar el estado a ENVIADO una vez que se realizó FTPS a repositorio
-- =============================================
ALTER PROCEDURE [dbo].[spActualizaCabeceraUploadArchivo]
@iRut int,  
  @iInstitucion int = 0,
  @iPeriodo int = 0,
  @vcTipoArchivo varchar(2) = '  ',     
  @iCorrelativo int,
  @vcEtapa_subida varchar(2) ='  ',-- UP: upload  FT: ftp  UA : upload Abortado
  @iCodError int = 0 out, 
  @vcMsjError varchar(50) = 'OK' out
AS
declare
  @iEstado_final as int
BEGIN
  BEGIN TRY
  -- Dependiendo del sw Subido_ftps se determina el estado final del archivo
    if @vcEtapa_subida ='FT'
      begin
        select @iEstado_final =13 -- ENVIADO
      end
    else if @vcEtapa_subida ='UP'
      begin
        select @iEstado_final =19 -- ENVIADO WS
      end
    else if @vcEtapa_subida ='UA'
      begin
        select @iEstado_final =29 -- UPLOAD ABORTADO
      end
  
  -- Se actualiza estado de archivo de cabecera a subir
    if @vcTipoArchivo = 'AA' -- Se sube archivo de AFILIADOS
    begin
      UPDATE    tblAfiliadoCabecera
      SET       iIdEstado = @iEstado_final --ESTADO ENVIADO WS / FTPS
      WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo) AND (iCorrelativo = @iCorrelativo)
      
                
      set @iCodError = 0;
      set @vcMsjError = 'OK'; 
      return
    end
  
    if @vcTipoArchivo = 'AD' -- Se sube archivo de DEUDAS 
    BEGIN
      UPDATE    tblDeudaCabecera
      SET       iIdEstado = @iEstado_final --ESTADO ENVIADO WS / FTPS
      WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo) AND (iCorrelativo = @iCorrelativo)
      
    
            
      set @iCodError = 0;
      set @vcMsjError = 'OK'; 
      return
    END
  
    if @vcTipoArchivo = 'AR' -- Se sube archivo de RECAUDACIONES
    BEGIN
    
      UPDATE    tblRecaudacionCabecera
      SET       iIdEstado = @iEstado_final --ESTADO ENVIADO WS / FTPS
      WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo) AND (iCorrelativo = @iCorrelativo)
      
    
    
      set @iCodError = 0;
      set @vcMsjError = 'OK'; 
      return
    END
  
    if @vcTipoArchivo = 'CC' -- Se sube archivo de RECAUDACIONES
    BEGIN
            
      UPDATE    tblCarteraCompradaCabecera
      SET       iIdEstado = @iEstado_final --ESTADO ENVIADO WS / FTPS
      WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo) AND (iCorrelativo = @iCorrelativo)
      
    
    
      set @iCodError = 0;
      set @vcMsjError = 'OK'; 
      return
    END
    set @iCodError = 1;
    set @vcMsjError = 'TIPO DE ARCHIVO INCORRECTO'; 
    return  
  END TRY
  BEGIN CATCH
    SET @iCodError = 1;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
  END CATCH
  
END
GO

GO
--SqlScripter----[dbo].[spActualizaCabeceraWorkflow].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spActualizaCabeceraWorkflow]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spActualizaCabeceraWorkflow] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
--
-- Author:    ENV
-- Create date: 19-07-2013
-- Description: Inserta o actualiza el estado de un registro de cabecera de archivo seg•n resultado operaci=n de workflow de carga y validaci=n.
--
-- =============================================
--
-- Fix 20140226  
-- Modificación: 26-02-2014  
-- Descripción : Se modifica para que en el proceso de contingencia inserte cabeceras con el nro de registros a procesar y no el nro de registros que trae el archivo.
--
-- =============================================
ALTER PROCEDURE [dbo].[spActualizaCabeceraWorkflow]
@iRut int = null,   
  @iInstitucion int = 0,
  @iPeriodo int = 0,
  @vcTipoArchivo varchar(2) = '  ',     
  @iCorrelativo int,
  @vcCodestado varchar(2) ='  ',
  @vcNombreArchivo varchar(23)='Sin nombre',
  @dFechaIng varchar(20) ='2013/01/01',
  @nTotalRegistros int = 0,
  @nMonto1 numeric(30,0) = 0,
  @nMonto2 numeric(30,0) = 0,
  @nMonto3 numeric(30,0) = 0,
  @vcLinkError varchar(255) = ' ',
  @iEstadoFinal as int = 0,
  @CodError int = 0 out,  
  @MsjError varchar(500) = 'OK' out
AS
BEGIN TRY

  -- Dependiendo del tipo de resultado ingresado se define el estado final del archivo
  if @vcCodestado ='P'
    begin
      select @iEstadoFinal =14
    end
  else
  if @vcCodestado ='V'
    begin
      select @iEstadoFinal =15
    end
  else
  if @vcCodestado ='RP'
    begin
      select @iEstadoFinal = 16
    end
  else
  if @vcCodestado ='RF'
    begin
      select @iEstadoFinal =17
    end
 
  
  -- Se actualiza estado de archivo de cabecera a subir
  if @vcTipoArchivo = 'AA' --  AFILIADOS
  
  begin
  
  IF @iCorrelativo = 0
  BEGIN
	SET @iCorrelativo = (Select MAX(iCorrelativo) FROM tblAfiliadoCabecera where @iPeriodo = nPeriodo ) + 1
	IF @iCorrelativo is NULL 
	BEGIN
		SET @iCorrelativo=1 
	END
  END;
  
  MERGE 
    INTO  tblAfiliadoCabecera as c
    USING (select @iInstitucion as a, @iPeriodo as b, @iCorrelativo as c) as t
    ON ( nIdInstitucion = @iInstitucion AND nPeriodo = @iPeriodo AND iCorrelativo = @iCorrelativo)
    WHEN MATCHED 
        THEN UPDATE set iIdEstado = @iEstadoFinal ,dFechaIng = @dFechaIng,vcLinkError= @vcLinkError
    WHEN NOT MATCHED 
        THEN INSERT 
         (nIdInstitucion
         ,nPeriodo
         ,iCorrelativo
         ,vcNombreArchivo
         ,dFechaIng
         ,nTotalRegistros
         ,nTotalRentaImponible
         ,vcLinkArchivo
         ,iRutUsuarioEnv
         ,iIdEstado
         ,vcLinkError)
     VALUES
         (@iInstitucion
         ,@iPeriodo
         ,@iCorrelativo
         ,@vcNombreArchivo
         ,GETDATE()
         ,@nTotalRegistros -1
         ,@nMonto1
         ,@vcNombreArchivo
         ,@iRut
         ,@iEstadoFinal,
        @vcLinkError         
        );
                
    set @CodError = 0;
    set @MsjError = 'OK'; 
    return @iCorrelativo
  end
  
  if @vcTipoArchivo = 'AD' -- DEUDAS  
  BEGIN

  IF @iCorrelativo = 0
  BEGIN
	SET @iCorrelativo = (Select MAX(iCorrelativo) FROM tblDeudaCabecera where @iPeriodo = nPeriodo ) + 1
	IF @iCorrelativo is NULL 
	BEGIN
		SET @iCorrelativo=1 
	END


  END;


MERGE 
    INTO  tblDeudaCabecera 
    USING (select @iInstitucion as a, @iPeriodo as b, @iCorrelativo as c) as t
    ON ( nIdInstitucion = @iInstitucion AND nPeriodo = @iPeriodo AND iCorrelativo = @iCorrelativo)
    WHEN MATCHED 
        THEN UPDATE set iIdEstado = @iEstadoFinal , dFechaIng = @dFechaIng, vcLinkError = @vcLinkError
    WHEN NOT MATCHED 
        THEN INSERT 
         (nIdInstitucion
         ,nPeriodo
         ,iCorrelativo
         ,vcNombreArchivo
         ,dFechaIng
         ,nTotalReg
         ,nTotalSaldoCapital
         ,nTotalCapitalInicial
         ,nTotalMontoCobrar
         ,vcLinkArchivo
         ,iRutUsuarioEnv
         ,iIdEstado
         ,vcLinkError)
     VALUES
         (@iInstitucion
         ,@iPeriodo
         ,@iCorrelativo
         ,@vcNombreArchivo
         ,GETDATE()
         ,@nTotalRegistros -1
         ,@nMonto1
         ,@nMonto2
         ,@nMonto3
         ,@vcNombreArchivo
         ,@iRut
         ,@iEstadoFinal,
        @vcLinkError         
        );
    
            
    set @CodError = 0;
    set @MsjError = 'OK'; 
    return @iCorrelativo
  END
  
  if @vcTipoArchivo = 'AR' -- RECAUDACIONES
  BEGIN
  
  IF @iCorrelativo = 0
  BEGIN
	SET @iCorrelativo = (Select MAX(iCorrelativo) FROM tblRecaudacionCabecera where @iPeriodo = nPeriodo ) + 1
	IF @iCorrelativo is NULL 
	BEGIN
		SET @iCorrelativo=1 
	END
  END;

  
  MERGE 
    INTO  tblRecaudacionCabecera 
    USING (select @iInstitucion as a, @iPeriodo as b, @iCorrelativo as c) as t
    ON ( nIdInstitucion = @iInstitucion AND nPeriodo = @iPeriodo AND iCorrelativo = @iCorrelativo)
    WHEN MATCHED 
        THEN UPDATE set iIdEstado = @iEstadoFinal , dFechaIngreso = @dFechaIng, vcLinkError= @vcLinkError
    WHEN NOT MATCHED 
        THEN INSERT 
         (nIdInstitucion
         ,nPeriodo
         ,iCorrelativo
         ,vcNombreArchivo
         ,dFechaIngreso
         ,nTotalRegistros
         ,nTotalMontoCobrar
         ,nTotalMontoPendiente
         ,vcLinkArchivo
         ,iRutUsuarioEnv
         ,iIdEstado,
         vcLinkError)
     VALUES
         (@iInstitucion
         ,@iPeriodo
         ,@iCorrelativo
         ,@vcNombreArchivo
         ,GETDATE()
         ,@nTotalRegistros -1
         ,@nMonto1
         ,@nMonto2
         ,@vcNombreArchivo
         ,@iRut
         ,@iEstadoFinal
         ,@vcLinkError);
    
    
    set @CodError = 0;
    set @MsjError = 'OK'; 
    return @iCorrelativo
  END
  if @vcTipoArchivo = 'CC' -- CARTERA COMPRADA
  BEGIN

  IF @iCorrelativo = 0
  BEGIN
	SET @iCorrelativo = (Select MAX(iCorrelativo) FROM tblCarteraCompradaCabecera where @iPeriodo = nPeriodo ) + 1
  END;



  MERGE 
    INTO  tblCarteraCompradaCabecera 
    USING (select @iInstitucion as a, @iPeriodo as b, @iCorrelativo as c) as t
    ON ( nIdInstitucion = @iInstitucion AND nPeriodo = @iPeriodo AND iCorrelativo = @iCorrelativo)
    WHEN MATCHED 
        THEN UPDATE set iIdEstado = @iEstadoFinal , dFechaIngreso = @dFechaIng
    WHEN NOT MATCHED 
        THEN INSERT 
         (nIdInstitucion
         ,nPeriodo
         ,iCorrelativo
         ,vcNombreArchivo
         ,dFechaIngreso
         ,nTotalRegistros
         ,nTotalCarterasCompradas
         ,vcLinkArchivo
         ,iRutUsuarioEnv
         ,iIdEstado)
     VALUES
         (@iInstitucion
         ,@iPeriodo
         ,@iCorrelativo
         ,@vcNombreArchivo
         ,GETDATE()
         ,@nTotalRegistros -1
         ,@nMonto1
         ,@vcNombreArchivo
         ,@iRut
         ,@iEstadoFinal);
    
    
    set @CodError = 0;
    set @MsjError = 'OK'; 
    return @iCorrelativo
  END
  
  set @CodError = 1;
  set @MsjError = ERROR_MESSAGE();
  return  -1;
  
END TRY
BEGIN CATCH
  set @MsjError = ERROR_MESSAGE();
  set @CodError = ERROR_NUMBER() ;
  return -2;
END CATCH
GO

GO
--SqlScripter----[dbo].[spActualizaControlProceso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spActualizaControlProceso]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spActualizaControlProceso] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    ENV
-- Create date: 19-07-2013
-- Description: Inserta o actualiza un registro de control de proceso dados: 
-- +el periodo en proceso
-- +idControlProceso (Si es 0 se trata de una inserción)
-- +idTipoControlProceso 
-- +idEstado (Si es 0 se trata de una inserción)
-- +vcDetalle Glosa descriptiva del estado que se ingresa o actualiza
-- +dFechaIni Fecha de inicio de proceso. Por el momento no se usa.
-- +dFechaFin Fecha de fin de proceso. Por el momento no se usa.
-- +iIdObtenido (el nuevo en el caso de inserción sino el pasado como parámetro.)

-- =============================================
ALTER PROCEDURE [dbo].[spActualizaControlProceso]
@iPeriodo int = 0,
  @iIdControlProceso int = null,
  @iIdTipoControlProceso int,
  @iIdEstado int,
  @vcDetalle varchar(255)='Sin detalle',
  @dFechaIni varchar(20) = null,
  @dFechaFin varchar(20) = null,
  @iIdObtenido int = 0 out,
  @iCodError int = 0 out,  
  @vcMsjError varchar(50) = 'OK' out
AS
BEGIN TRY
  BEGIN

          
    if @iIdControlProceso is null or @iIdControlProceso=0
    begin
      SELECT     @iIdControlProceso = MAX(nIdControlProceso) +1
      FROM         tblControlProceso
    end;

    
    MERGE INTO  tblControlProceso 
    USING (select @iIdControlProceso as id) as t
    ON ( nIdControlProceso = @iIdControlProceso)
    WHEN MATCHED 
      THEN UPDATE set iIdEstado = @iIdEstado , dFechaFin = GETDATE(),vcDetalle = @vcDetalle
    WHEN NOT MATCHED 
    THEN INSERT 
         (nIdControlProceso,
        nPeriodo 
         , dFechaInicio 
         , dFechaFin 
         , iIdEstado 
         , iIdTipoControlProceso 
         , vcDetalle )
     VALUES
         (@iIdControlProceso
         ,@iPeriodo
         ,GETDATE()
         ,GETDATE()
         ,@iIdEstado
         ,@iIdTipoControlProceso
         ,@vcDetalle);
  
    set @iCodError = 0;
    set @iIdObtenido = @iIdControlProceso
    set @vcMsjError = 'OK'; 
  END
END TRY
BEGIN CATCH
  set @iCodError = -1;
  set @iIdObtenido = 1;
  set @vcMsjError = 'ACTUALIZACION ESTADO INCORRECTO';  
END CATCH
GO

GO
--SqlScripter----[dbo].[spActualizaSueldo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spActualizaSueldo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spActualizaSueldo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author: EN
-- Create date: 23-07-2013
-- Description:  Encripta campo renta


-- =============================================
ALTER PROCEDURE [dbo].[spActualizaSueldo]
@nPeriodo numeric(6) ,
@nInstitucion numeric(4) ,
@iCorrelativo int ,
@vcClave varchar(10),
@iCodError int = 0 out,
@vcMsjError varchar(50) = 'OK' out
AS BEGIN TRY

DECLARE

 @vcIdentificadorAfiliado VARCHAR(15),
 @vcRutEmpresa VARCHAR(10),
 @iIdTipoIdentificador int,
 @iCount int=0
 BEGIN
 
   DECLARE cursor_detalle CURSOR FOR  
   SELECT vcIdentificadorAfiliado,vcRutEmpresa,tIdTipoIdentificador
   FROM tblAfiliadoDetalle
   WHERE nIdInstitucion = @nInstitucion AND nperiodo= @nPeriodo AND iCorrelativo=@iCorrelativo
   and nRentaImponible<>0 and vbRentaImponible is null
   FOR READ ONLY
   
   
   open cursor_detalle
   FETCH NEXT FROM cursor_detalle INTO @vcIdentificadorAfiliado,@vcRutEmpresa,@iIdTipoIdentificador
   
   if @@FETCH_STATUS = 0  
   BEGIN TRAN T1
   
   WHILE @@FETCH_STATUS = 0  
   BEGIN  
      
      select @iCount = @iCount+1
      UPDATE tblAfiliadoDetalle
         set vbRentaImponible = dbo.fncEnmascaraSueldo(nRentaImponible,@vcClave),
         nRentaImponible = 0 
      where 
         nIdInstitucion= @nInstitucion and
         nPeriodo = @nPeriodo and
         iCorrelativo = @iCorrelativo and 
         vcIdentificadorAfiliado = @vcIdentificadorAfiliado and 
         vcRutEmpresa = @vcRutEmpresa and 
         tIdTipoIdentificador = @iIdTipoIdentificador
      if (@iCount = 1000) 
      BEGIN
         COMMIT TRAN T1
         BEGIN TRAN T1
         select @iCount = 0
      END
      FETCH NEXT FROM cursor_detalle INTO @vcIdentificadorAfiliado,@vcRutEmpresa,@iIdTipoIdentificador
   END
   
   if (@iCount <> 0) 
   BEGIN
	COMMIT TRAN T1
   END
   
   CLOSE cursor_detalle
   deallocate cursor_detalle
   -- EJECUCION EXITOSA (OK)
   BEGIN
      set @iCodError = @iCount;
      set @vcMsjError = 'Encriptacion de sueldo efectuada exitosamente'; 
      return
   END

 END
END TRY
BEGIN CATCH 
   deallocate cursor_detalle
   set @iCodError = -1;
   set @vcMsjError = ERROR_MESSAGE()
END CATCH
GO

GO
--SqlScripter----[dbo].[spAdminSessionUser].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spAdminSessionUser]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spAdminSessionUser] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 10-07-13
-- Description: Administra las sesiones de usuarios
-- =============================================
ALTER PROCEDURE [dbo].[spAdminSessionUser]
@iRut int,
  @vcIdSession varchar(100),
  @vcOperacion varchar(1),
  @iCodError int output,
  @vcMsjError varchar(50) output,
  @iContador int = 0
AS
BEGIN
  SET NOCOUNT ON;
  set @iCodError=0
  set @vcMsjError=''
  --Crea Session
  if @vcOperacion = 'I' 
  begin
    BEGIN TRAN T1
    BEGIN TRY
      delete from tblSessionUsuario where iRut = @iRut;
      
      insert into tblSessionUsuario (iRut,vcIdSession,dLogin)
      values (@iRut,@vcIdSession,CURRENT_TIMESTAMP);
      
      COMMIT TRAN  T1
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 1;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      return
    END CATCH
    end 
    
    --Elimina Session
  if @vcOperacion = 'D' 
  begin
   BEGIN TRAN T2
    BEGIN TRY
      delete from tblSessionUsuario where vcIdSession = @vcIdSession;
      
      COMMIT TRAN T2
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 1;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      return
    END CATCH
    end
    
    --Consulta Session
  if @vcOperacion = 'S' 
  begin
    set @iContador = 0
    set @iCodError = 1
    set @vcMsjError = 'Session Invalida'
    BEGIN TRY
      Select @iContador=COUNT(*) from tblSessionUsuario 
      where iRut = @iRut and vcIdSession = @vcIdSession;
      
      if @iContador > 0
      begin
        set @iCodError = 0
        set @vcMsjError = ''
      end
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 2;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      return
    END CATCH
    end
    
END
GO

GO
--SqlScripter----[dbo].[spAdminTblEmailOperacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spAdminTblEmailOperacion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spAdminTblEmailOperacion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 18-07-13
-- Description: Administra Tabla tblEmailOperacion
-- =============================================
ALTER PROCEDURE [dbo].[spAdminTblEmailOperacion]
@vcOperacion varchar(1),
  @vcEmailOperacion varchar(50) = '',
  @vcEmail varchar(100) = '',
  @iCodError int output,
  @vcMsjError varchar(50) output,
  @iAuxCont int = 0
AS
BEGIN
  
  set @iCodError = 0
  set @vcMsjError = ''
  print @vcOperacion
  print @vcEmailOperacion
  print @vcEmail
  
  --Isertar registro
  if @vcOperacion = 'I' 
  begin
    select @iAuxCont = COUNT(vcOperacion)
    from tblEmailOperacion
    where vcOperacion = @vcEmailOperacion;
    
    if @iAuxCont > 0
    begin
      set @iCodError = 1
      set @vcMsjError = 'La operacion ya esta registrada'
    end
    else
    begin
      BEGIN TRAN T1
      BEGIN TRY
    
        INSERT INTO tblEmailOperacion
             (vcOperacion,vcEmail)
        VALUES
             (@vcEmailOperacion,@vcEmail)
        COMMIT TRAN  T1
        RETURN
      END TRY
      BEGIN CATCH
        SET @iCodError = 2;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        ROLLBACK TRAN  T1
        return
      END CATCH
    end
    end 
    --Eliminar Registro
  if @vcOperacion = 'D' 
  begin
   BEGIN TRAN T2
    BEGIN TRY
      DELETE FROM tblEmailOperacion
      WHERE vcOperacion = @vcEmailOperacion;
      
      COMMIT TRAN T2
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 1;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      ROLLBACK TRAN  T2
      return
    END CATCH
    end
    
    --Actualizar Registro
  if @vcOperacion = 'U' 
  begin
   BEGIN TRAN T3
    BEGIN TRY
      UPDATE tblEmailOperacion
      SET vcEmail = @vcEmail
      WHERE vcOperacion = @vcEmailOperacion;
      
      COMMIT TRAN T3
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 1;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      ROLLBACK TRAN  T3
      return
    END CATCH
    end
    if @vcOperacion = 'S' 
  begin
    --Listar Registro
    select vcOperacion as vcEmailOperacion, vcEmail
    from tblEmailOperacion
    where @vcEmailOperacion = '$$' or vcOperacion like '%' + @vcEmailOperacion + '%';
  return
  end
   
  
END
GO

GO
--SqlScripter----[dbo].[spAdminTblFeriado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spAdminTblFeriado]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spAdminTblFeriado] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 18-07-13
-- Description: Administra Tabla tblFeriado
-- =============================================
ALTER PROCEDURE [dbo].[spAdminTblFeriado]
@vcOperacion varchar(1),
  @vcFeriado varchar(10)='',
  @vcDescripcion varchar(50) = '',
  @iCodError int output,
  @vcMsjError varchar(50) output,
  @iAuxCont int = 0
AS
BEGIN
  
  set @iCodError = 0
  set @vcMsjError = ''
  
  --Isertar registro
  if @vcOperacion = 'I' 
  begin
    select @iAuxCont = COUNT(dFeriado)
    from tblFeriado
    where dFeriado = convert(date, @vcFeriado,111);
    
    if @iAuxCont > 0
    begin
      set @iCodError = 1
      set @vcMsjError = 'La fecha ya esta registrada'
    end
    else
    begin
      BEGIN TRAN T1
      BEGIN TRY
    
        INSERT INTO tblFeriado
             (dFeriado,vcDescripcion)
        VALUES
             (convert(date, @vcFeriado,111),@vcDescripcion)
        COMMIT TRAN  T1
        RETURN
      END TRY
      BEGIN CATCH
        SET @iCodError = 2;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        ROLLBACK TRAN  T1
        return
      END CATCH
    end
    end 
    --Eliminar Registro
  if @vcOperacion = 'D' 
  begin
   BEGIN TRAN T2
    BEGIN TRY
      DELETE FROM tblFeriado
      WHERE dFeriado = convert(date, @vcFeriado,111);
      
      COMMIT TRAN T2
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 1;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      ROLLBACK TRAN  T2
      return
    END CATCH
    end
    
    --Actualizar Registro
  if @vcOperacion = 'U' 
  begin
   BEGIN TRAN T3
    BEGIN TRY
      UPDATE tblFeriado
      SET vcDescripcion = @vcDescripcion
      WHERE dFeriado = convert(date, @vcFeriado,111);
      
      COMMIT TRAN T3
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 1;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      ROLLBACK TRAN  T3
      return
    END CATCH
    end
    if @vcOperacion = 'S' 
  begin
    --Listar Registro
    select CONVERT(VARCHAR(10), dFeriado, 111) AS vcFeriado, vcDescripcion
    from tblFeriado
    where @vcFeriado = '$$' 
    -- se realiza una busqueda de texto completo en tabla con pocos registros (aprox. 130 registros por año) 
    or dFeriado like '%' + @vcFeriado + '%';
      return
  end
   
  
END
GO

GO
--SqlScripter----[dbo].[spAdminTblInstitucion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spAdminTblInstitucion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spAdminTblInstitucion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 24-07-13
-- Description: Administra Tabla tblInstitucion
-- =============================================
ALTER PROCEDURE [dbo].[spAdminTblInstitucion]
@vcOperacion varchar(1),
  @nIdInstitucion numeric,
  @iIdSCF int = 0,
  @vcNombre varchar(50) = '',
  @vcNombreCorto varchar(10) = '',
  @bParticipa bit = 0,
  @iIdEstado int = 0,
  @iCodError int output,
  @vcMsjError varchar(50) output,
  @iAuxCont int = 0
AS
BEGIN
  
  set @iCodError = 0
  set @vcMsjError = ''
  
  --Isertar registro
  if @vcOperacion = 'I' 
  begin
    select @iAuxCont = COUNT(nIdInstitucion)
    from tblInstitucion
    where nIdInstitucion = @nIdInstitucion;
    
    if @iAuxCont > 0
    begin
      set @iCodError = 1
      set @vcMsjError = 'La institución ya está registrada'
    end
    else
    begin
      BEGIN TRAN T1
      BEGIN TRY
    
        INSERT INTO tblInstitucion
             (nIdInstitucion,iIdSCF,vcNombre,vcNombreCorto,bParticipa,iIdEstado)
        VALUES
             (@nIdInstitucion,@iIdSCF,@vcNombre,@vcNombreCorto,@bParticipa,@iIdEstado)
        if @bParticipa = 1
        begin

          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 1), 'MAX_REGISTRO_AFI_' + convert(varchar,@nIdInstitucion),3,10000000,2,@vcNombreCorto + ': Número Máximo de registros de archivo Afiliados'
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 2), 'MIN_REGISTRO_AFI_' + convert(varchar,@nIdInstitucion),3,1,2,@vcNombreCorto + ': Número Mínimo de registros de archivo Afiliados' 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 3), 'ERR_PORC_AFI_' + convert(varchar,@nIdInstitucion),3,5,3,@vcNombreCorto + ': Porcentaje de error de archivo Afiliados' 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 4), 'ERR_MAX_AFI_' + convert(varchar,@nIdInstitucion),3,100000,2,@vcNombreCorto + ': Número Máximo de errores de archivo Afiliados' 

          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 5), 'MAX_REGISTRO_DEU_' + convert(varchar,@nIdInstitucion),3,10000000,2,@vcNombreCorto + ': Número Máximo de registros de archivo Deuda' 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 6), 'MIN_REGISTRO_DEU_' + convert(varchar,@nIdInstitucion),3,1,2,@vcNombreCorto + ': Número Mínimo de registros de archivo Deuda' 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 7), 'ERR_PORC_DEU_' + convert(varchar,@nIdInstitucion),3,5,3,@vcNombreCorto + ': Porcentaje de error de archivo Deuda' 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 8), 'ERR_MAX_DEU_' + convert(varchar,@nIdInstitucion),3,100000,2,@vcNombreCorto + ': Número Máximo de errores de archivo Deuda' 

          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 9), 'MAX_REGISTRO_REC_' + convert(varchar,@nIdInstitucion),3,10000000,2,@vcNombreCorto + ': Número Máximo de registros de archivo Recaudación' 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 10), 'MIN_REGISTRO_REC_' + convert(varchar,@nIdInstitucion),3,1,2,@vcNombreCorto + ': Número Mínimo de registros de archivo Recaudación' 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 11), 'ERR_PORC_REC_' + convert(varchar,@nIdInstitucion),3,5,3,@vcNombreCorto + ': Porcentaje de error de archivo Recaudación' 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 12), 'ERR_MAX_REC_' + convert(varchar,@nIdInstitucion),3,100000,2,@vcNombreCorto + ': Número Máximo de errores de archivo Recaudación' 
          
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 13), 'MAX_REGISTRO_CC_' + convert(varchar,@nIdInstitucion),3,10000000,2,@vcNombreCorto + ': Número Máximo de registros de archivo Compra Cartera' 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 14), 'MIN_REGISTRO_CC_' + convert(varchar,@nIdInstitucion),3,1,2,@vcNombreCorto + ': Número Mínimo de registros de archivo Compra Cartera' 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 15), 'ERR_PORC_CC_' + convert(varchar,@nIdInstitucion),3,5,3,@vcNombreCorto + ': Porcentaje de error de archivo Compra Cartera' 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 16), 'ERR_MAX_CC_' + convert(varchar,@nIdInstitucion),3,100000,2,@vcNombreCorto + ': Número Máximo de errores de archivo Compra Cartera' 
          
          --Insersion de email de operaicon 
          INSERT INTO tblEmailOperacion ([vcOperacion],[vcEmail])
          select 'CONTINGENCIA_ENVIO_' + convert(varchar,@nIdInstitucion), '';
          INSERT INTO tblEmailOperacion ([vcOperacion],[vcEmail])
          select 'PENDIENTE_ENVIO_' + convert(varchar,@nIdInstitucion), '';    
        end
        COMMIT TRAN  T1
        RETURN
      END TRY
      BEGIN CATCH
        SET @iCodError = 2;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        ROLLBACK TRAN  T1
        return
      END CATCH
    end
    end 
    
    --Actualizar Registro
  if @vcOperacion = 'U' 
  begin
   BEGIN TRAN T2
    BEGIN TRY
      UPDATE tblInstitucion
      SET 
        iIdSCF = @iIdSCF,
        vcNombre = @vcNombre,
        vcNombreCorto = @vcNombreCorto,
        bParticipa = @bParticipa,
        iIdEstado = @iIdEstado
      WHERE nIdInstitucion = @nIdInstitucion;
      if @bParticipa = 1
        begin
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 1), 'MAX_REGISTRO_AFI_' + convert(varchar,@nIdInstitucion),3,10000000,2,@vcNombreCorto + ': Número Maximo de registros de archivo Afiliados' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 1)) 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 2), 'MIN_REGISTRO_AFI_' + convert(varchar,@nIdInstitucion),3,1,2,@vcNombreCorto + ': Número Minimo de registros de archivo Afiliados' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 2)) 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 3), 'ERR_PORC_AFI_' + convert(varchar,@nIdInstitucion),3,5,3,@vcNombreCorto + ': Porcentaje de error de archivo Afiliados' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 3)) 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 4), 'ERR_MAX_AFI_' + convert(varchar,@nIdInstitucion),3,100000,2,@vcNombreCorto + ': Número Maximo de errores de archivo Afiliados' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 4)) 
          
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 5), 'MAX_REGISTRO_DEU_' + convert(varchar,@nIdInstitucion),3,10000000,2,@vcNombreCorto + ': Número Maximo de registros de archivo Deuda' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 5)) 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 6), 'MIN_REGISTRO_DEU_' + convert(varchar,@nIdInstitucion),3,1,2,@vcNombreCorto + ': Número Minimo de registros de archivo Deuda' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 6)) 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 7), 'ERR_PORC_DEU_' + convert(varchar,@nIdInstitucion),3,5,3,@vcNombreCorto + ': Porcentaje de error de archivo Deuda' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 7)) 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 8), 'ERR_MAX_DEU_' + convert(varchar,@nIdInstitucion),3,100000,2,@vcNombreCorto + ': Número Maximo de errores de archivo Deuda' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 8)) 
          
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 9), 'MAX_REGISTRO_REC_' + convert(varchar,@nIdInstitucion),3,10000000,2,@vcNombreCorto + ': Número Maximo de registros de archivo Recaudación' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 9)) 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 10), 'MIN_REGISTRO_REC_' + convert(varchar,@nIdInstitucion),3,1,2,@vcNombreCorto + ': Número Minimo de registros de archivo Recaudación' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 10)) 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 11), 'ERR_PORC_REC_' + convert(varchar,@nIdInstitucion),3,5,3,@vcNombreCorto + ': Porcentaje de error de archivo Recaudación' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 11)) 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 12), 'ERR_MAX_REC_' + convert(varchar,@nIdInstitucion),3,100000,2,@vcNombreCorto + ': Número Maximo de errores de archivo Recaudación' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 12)) 
          
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 13), 'MAX_REGISTRO_CC_' + convert(varchar,@nIdInstitucion),3,10000000,2,@vcNombreCorto + ': Número Maximo de registros de archivo Compra Cartera' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 13)) 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 14), 'MIN_REGISTRO_CC_' + convert(varchar,@nIdInstitucion),3,1,2,@vcNombreCorto + ': Número Minimo de registros de archivo Compra Cartera' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 14)) 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 15), 'ERR_PORC_CC_' + convert(varchar,@nIdInstitucion),3,5,3,@vcNombreCorto + ': Porcentaje de error de archivo Compra Cartera' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 15)) 
          INSERT INTO tblParametro([iIdParametro],[vcParametro],[iIdTipoParametro],[vcValor],[iIdUnidad],[vcDescripcion])
          select (10000000 + (@nIdInstitucion*100) + 16), 'ERR_MAX_CC_' + convert(varchar,@nIdInstitucion),3,100000,2,@vcNombreCorto + ': Número Maximo de errores de archivo Compra Cartera' 
          where not exists(select iIdParametro from tblParametro where iIdParametro = (10000000 + (@nIdInstitucion*100) + 16)) 
          
          --Insersion de email de operaicon 
          INSERT INTO tblEmailOperacion ([vcOperacion],[vcEmail])
          select 'CONTINGENCIA_ENVIO_' + convert(varchar,@nIdInstitucion), ''
          where not exists(select [vcOperacion] from tblEmailOperacion where [vcOperacion] = 'CONTINGENCIA_ENVIO_' + convert(varchar,@nIdInstitucion));
          
          INSERT INTO tblEmailOperacion ([vcOperacion],[vcEmail])
          select 'PENDIENTE_ENVIO_' + convert(varchar,@nIdInstitucion), '' 
          where not exists(select [vcOperacion] from tblEmailOperacion where [vcOperacion] = 'PENDIENTE_ENVIO_' + convert(varchar,@nIdInstitucion));
          
        end
      COMMIT TRAN T2
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 1;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      ROLLBACK TRAN  T2
      return
    END CATCH
    end
    --Listar Registro
    if @vcOperacion = 'S' 
  begin
    select tblInstitucion.nIdInstitucion,
      tblInstitucion.iIdSCF,
      tblInstitucion.vcNombre,
      tblInstitucion.vcNombreCorto,
      convert(int,tblInstitucion.bParticipa) as bParticipa,
      tblInstitucion.iIdEstado,
      tblEstado.vcEstado
    from tblInstitucion
      inner join tblEstado on tblEstado.iIdEstado = tblInstitucion.iIdEstado
    where tblInstitucion.nIdInstitucion = @nIdInstitucion;
  return
  end
END
GO

GO
--SqlScripter----[dbo].[spAdminTblRutInhabilitado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spAdminTblRutInhabilitado]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spAdminTblRutInhabilitado] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 11-07-13
-- Description: Administra Tabla tblSUSESO_RutInhabilitado
-- =============================================
ALTER PROCEDURE [dbo].[spAdminTblRutInhabilitado]
@vcOperacion varchar(1),
  @vcRutInhabilitado varchar(15)='',
  @vcDescripcion varchar(100) = '',
  @vcFecha varchar(20)='',
  @iCodError int output,
  @vcMsjError varchar(50) output,
  @iAuxCont int = 0
AS
BEGIN
  
  set @iCodError = 0
  set @vcMsjError = ''
  
  --Isertar registro
  if @vcOperacion = 'I' 
  begin
    select @iAuxCont = COUNT(vcRutInhabilitado)
    from tblSUSESO_RutInhabilitado 
    where vcRutInhabilitado = @vcRutInhabilitado;
    
    if @iAuxCont > 0
    begin
      set @iCodError = 1
      set @vcMsjError = 'El rut ya está registrado'
    end
    else
    begin
      BEGIN TRAN T1
      BEGIN TRY
    
        INSERT INTO tblSUSESO_RutInhabilitado
             (vcRutInhabilitado,vcDescripcion,dFecha)
        VALUES
             (@vcRutInhabilitado,@vcDescripcion,current_timestamp)
        COMMIT TRAN  T1
        RETURN
      END TRY
      BEGIN CATCH
        SET @iCodError = 2;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        ROLLBACK TRAN  T1
        return
      END CATCH
    end
    end 
    --Eliminar Registro
  if @vcOperacion = 'D' 
  begin
   BEGIN TRAN T2
    BEGIN TRY
      DELETE FROM tblSUSESO_RutInhabilitado
      WHERE vcRutInhabilitado = @vcRutInhabilitado;
      
      COMMIT TRAN T2
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 1;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      ROLLBACK TRAN  T1
      return
    END CATCH
    end
    
    --Actualizar Registro
  if @vcOperacion = 'U' 
  begin
   BEGIN TRAN T2
    BEGIN TRY
      UPDATE tblSUSESO_RutInhabilitado
      SET vcDescripcion = @vcDescripcion
      WHERE vcRutInhabilitado = @vcRutInhabilitado;
      
      COMMIT TRAN T2
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 1;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      return
    END CATCH
    end
    if @vcOperacion = 'S' 
  begin
    --Listar Registro
    select vcRutInhabilitado, vcDescripcion, CONVERT(VARCHAR(10), dFecha, 120) AS vcFecha
    from tblSUSESO_RutInhabilitado
    where @vcRutInhabilitado = '$$' or vcRutInhabilitado like '%' + @vcRutInhabilitado + '%';
  return
  end
   
  
END
GO

GO
--SqlScripter----[dbo].[spAdminTblTipoAfiliado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spAdminTblTipoAfiliado]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spAdminTblTipoAfiliado] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 15-07-13
-- Description: Administra Tabla tblSUSESO_TipoAfiliado
-- =============================================
ALTER PROCEDURE [dbo].[spAdminTblTipoAfiliado]
@vcOperacion varchar(1),
  @tIdTipoAfiliado tinyint = 0,
  @vcTipoAfiliado varchar(50) = '',
  @iIdEstado int = 0,
  @iCodError int output,
  @vcMsjError varchar(50) output,
  @iAuxCont int = 0
AS
BEGIN
  
  set @iCodError = 0
  set @vcMsjError = ''
  
  --Isertar registro
  if @vcOperacion = 'I' 
  begin
    select @iAuxCont = COUNT(tIdTipoAfiliado)
    from tblSUSESO_TipoAfiliado
    where tIdTipoAfiliado = @tIdTipoAfiliado;
    
    if @iAuxCont > 0
    begin
      set @iCodError = 1
      set @vcMsjError = 'El id ya está registrado'
    end
    else
    begin
      BEGIN TRAN T1
      BEGIN TRY
    
        INSERT INTO tblSUSESO_TipoAfiliado
             (tIdTipoAfiliado,vcTipoAfiliado)
        VALUES
             (@tIdTipoAfiliado,@vcTipoAfiliado)
        COMMIT TRAN  T1
        RETURN
      END TRY
      BEGIN CATCH
        SET @iCodError = 2;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        ROLLBACK TRAN T1
        return
      END CATCH
    end
    end 
    
  --Actualizar Registro
  if @vcOperacion = 'U' 
  begin
   BEGIN TRAN T2
    BEGIN TRY
      UPDATE tblSUSESO_TipoAfiliado
      SET vcTipoAfiliado = @vcTipoAfiliado,
        iIdEstado = @iIdEstado
      WHERE tIdTipoAfiliado = @tIdTipoAfiliado;
      
      COMMIT TRAN T2
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 1;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      ROLLBACK TRAN T2
      return
    END CATCH
    end
    if @vcOperacion = 'S' 
  begin
    --Listar Registro
    select tIdTipoAfiliado, vcTipoAfiliado, tblSUSESO_TipoAfiliado.iIdEstado, tblEstado.vcEstado
    from tblSUSESO_TipoAfiliado 
      inner join tblEstado on tblEstado.iIdEstado = tblSUSESO_TipoAfiliado.iIdEstado;
  return
  end
   
  
END
GO

GO
--SqlScripter----[dbo].[spAdminTblTipoIdentificador].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spAdminTblTipoIdentificador]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spAdminTblTipoIdentificador] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 17-07-13
-- Description: Administra Tabla tblSUSESO_TipoIdentificador
-- =============================================
ALTER PROCEDURE [dbo].[spAdminTblTipoIdentificador]
@vcOperacion varchar(1),
  @tIdTipoIdentificador tinyint = 0,
  @vcTipoIdentificador varchar(50) = '',
  @iIdEstado int = 0,
  @iCodError int output,
  @vcMsjError varchar(50) output,
  @iAuxCont int = 0
AS
BEGIN
  
  set @iCodError = 0
  set @vcMsjError = ''
  
  --Isertar registro
  if @vcOperacion = 'I' 
  begin
    select @iAuxCont = COUNT(tIdTipoIdentificador)
    from tblSUSESO_TipoIdentificador
    where tIdTipoIdentificador = @tIdTipoIdentificador;
    
    if @iAuxCont > 0
    begin
      set @iCodError = 1
      set @vcMsjError = 'El id ya está registrado'
    end
    else
    begin
      BEGIN TRAN T1
      BEGIN TRY
        INSERT INTO tblSUSESO_TipoIdentificador
             (tIdTipoIdentificador,vcTipoIdentificador)
        VALUES
             (@tIdTipoIdentificador,@vcTipoIdentificador)
        COMMIT TRAN  T1
        RETURN
      END TRY
      BEGIN CATCH
        SET @iCodError = 2;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        ROLLBACK TRAN  T1
        return
      END CATCH
    end
  end 
  --Actualizar Registro
  if @vcOperacion = 'U' 
  begin
   BEGIN TRAN T2
    BEGIN TRY
      UPDATE tblSUSESO_TipoIdentificador
      SET vcTipoIdentificador = @vcTipoIdentificador,
        iIdEstado = @iIdEstado
      WHERE tIdTipoIdentificador = @tIdTipoIdentificador;
      COMMIT TRAN T2
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 1;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      ROLLBACK TRAN T2
      return
    END CATCH
    end
    if @vcOperacion = 'S' 
    begin
      --Listar Registro
      select tIdTipoIdentificador, vcTipoIdentificador, tblSUSESO_TipoIdentificador.iIdEstado, tblEstado.vcEstado
      from tblSUSESO_TipoIdentificador 
      inner join tblEstado on tblEstado.iIdEstado = tblSUSESO_TipoIdentificador.iIdEstado;
    return
  end
   
  
END
GO

GO
--SqlScripter----[dbo].[spBuscaDiaHabil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spBuscaDiaHabil]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spBuscaDiaHabil] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN 
-- Create date: 28-06-13  
-- Description: Verfica dias feriados
-- =============================================
ALTER PROCEDURE [dbo].[spBuscaDiaHabil]
@iOpcion int,
  @dFecha date,
  @dHabil date out,
  @iCodError int out,
  @vcMsjError varchar(50) out
AS
BEGIN
      set @iCodError = 0
      set @vcMsjError = 'ok'
	if @iOpcion = 1 -- retorna el dia habil anterior
    BEGIN
	  BEGIN TRY
        select @dHabil=dbo.fncDiaHabil(@dFecha)
        RETURN
      END TRY
      BEGIN CATCH
        SET @iCodError = 1;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        return
      END CATCH
    END
	if @iOpcion = 2 -- fverifica si la fecha es feriado
	BEGIN
		select count(dFeriado) as feriados from tblFeriado where dFeriado = @dFecha
	END
END
GO

GO
--SqlScripter----[dbo].[spCambioClaveUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCambioClaveUsuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCambioClaveUsuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 14-06-13
-- Description: Valida el acceso de un usuario
-- Codigo de Error:
--          0 = ok
--          1 = Usuario no registrado
--          2 = Usuario bloqueado o eliminado
--          3 = Password Bloqueada por intentos
--          4 = Password erronea
--          5 = Password erronea, supera numero de intentos
-- Estado de usuario:
--          5 = Activo
--          6 = Bloqueado
--          7 = Eliminado
-- Estado de Password:
--      8 = Activa
--          9 = Caduca
--          10 = Creada
-- =============================================
ALTER PROCEDURE [dbo].[spCambioClaveUsuario]
@iRut int, 
  @vcHashActual varchar(32),
  @vcHashNueva varchar(32),
  @iCodError int out,
  @vcMsjError varchar(50) out,
  @iUser_estado int = 0,
  @iUser_intentos int = 0,
  @vcClave varchar(32) = '',
  @nClave_id numeric(18,0) = 0,
  @iClave_estado int = 0,
  @iNum_claves_hist int = 0,
  @iNum_claves_antiguas int = 0,
  @iDias_caducidad_clave int = 0
  
AS
BEGIN
  set @iCodError = 0
  set @vcMsjError = 'OK'
  
  -- Se recuperan datos de configuracion
  select @iNum_claves_hist = convert(integer, vcValor) 
  from tblParametro
  where iIdParametro = 6
  
  select @iDias_caducidad_clave = convert(integer, vcValor)
  from tblParametro
  where iIdParametro = 7
  
  set @iUser_estado = 0
  -- Se recatan los datos del usuario
  SELECT 
    @iUser_estado = tblUsuario.iIdEstado,
    @iUser_intentos = tblUsuario.tIntentos
  from tblUsuario 
    inner join tblInstitucion on tblUsuario.nIdInstitucion = tblInstitucion.nIdInstitucion
  where tblUsuario.iRut = @iRut;
  
  if @iUser_estado = 0 -- se compruba que el usuario existe
  begin
    set @iCodError = 1;
    set @vcMsjError = 'Datos no validos' ;
    return
  end
  if @iUser_estado = 6 -- clave bloqueada
  BEGIN
    set @iCodError = 2;
    set @vcMsjError = 'Usuario bloqueado';
    return
  END
  if @iUser_estado = 7 -- se comprueba que el usuario este activo
  begin
    set @iCodError = 3;
    set @vcMsjError = 'Usuario Eliminado.';
    return
  end
  
  -- Se recatan los datos de la password
  SELECT TOP 1
    @vcClave = tblPassword.vcHashClave,
    @nClave_id = tblPassword.nIdPassword,
    @iClave_estado = tblPassword.iIdEstado
  from tblPassword
  where tblPassword.iRut = @iRut
    and tblPassword.iIdEstado <> 9  --no se evaluan las claves caducas 
  ORDER BY tblPassword.dFechaCreacion desc
  
  -- si @vcHashActual = '$$' no se valida clave actual (administrador)
  if @vcHashActual <> '$$' and @vcClave <> @vcHashActual -- Clave actual erronea
  BEGIN
    set @iCodError = 4;
    set @vcMsjError = 'Clave Actual Erronea';
    return
  END
  --se verifica que la nueva contraseña no este registrada 
  select @iNum_claves_antiguas = COUNT(vcHashClave) from (
      select nIdPassword,
        vcHashClave,
        ROW_NUMBER() OVER(ORDER BY nIdPassword DESC) AS NumRegistro
      from tblPassword
      where iRut = @iRut
      ) as tbl_Claves 
    where NumRegistro <= @iNum_claves_hist
      and vcHashClave = @vcHashNueva
  if @iNum_claves_antiguas > 0
  BEGIN
    set @iCodError = 5;
    set @vcMsjError = 'La nueva clave ya esta registrada';
    return
  END
  else    
  BEGIN TRAN T1
    BEGIN TRY
    -- Se elimina las claves antiguas
    delete from tblPassword where nIdPassword in (
      select nIdPassword from (
        select nIdPassword, 
          ROW_NUMBER() OVER(ORDER BY nIdPassword DESC) AS NumRegistro
        from tblPassword
        where iRut = @iRut
        ) as tbl_Claves 
      where NumRegistro > @iNum_claves_hist - 1
    )
    -- se actualiza el estado de las claves
    update tblPassword set iIdEstado = 9 where iRut= @iRut;
    -- se inserta nueva clave
    insert into tblPassword (nIdPassword,iRut,dFechaCreacion,dFechaCaducidad,vcHashClave,iIdEstado)
    select MAX(nIdPassword) + 1,@iRut,current_timestamp,current_timestamp + @iDias_caducidad_clave day, @vcHashNueva, 8 from tblPassword
    -- se actualizan los intetos del usuario
    update tblUsuario set tIntentos = 0 where iRut= @iRut;
    
    COMMIT TRAN T1
    return
  END TRY
  BEGIN CATCH
    SET @iCodError = 6;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    ROLLBACK TRAN T1
    return
  END CATCH
END
GO

GO
--SqlScripter----[dbo].[spConsolidaAfiliadoDeuda].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsolidaAfiliadoDeuda]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsolidaAfiliadoDeuda] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 23-07-2013
-- Description: Realiza la consolidacion de afiliados y deudas para la generacion de nominas y alertas
-- 
-- Posibles salidas:          
--   0 OK - Se ha realizado la consolidacion OK
--   -1 NOK - (VERIFICACION ARCHIVOS) Faltan archivos afiliados
--   -2 NOK - (VERIFICACION ARCHIVOS) Faltan archivos deuda
--   -3 NOK - (VERIFICACION ARCHIVOS) Faltan archivos recaudacion
--   -4 NOK - OTROS
--   -5 NOK - Parametros incorrectos
--  v 1.2
--     corregido bug de no insercion de registros que no se encuentran en ninguna caja
--     corregido bug de datos intercambiados cuando un afiliado deudor se encuentra en varias cajas
-- Mod: Optimisa
-- Mod date: 27-07-2016
-- Description: Agrega el campo fecha de colocacion
-- Mod: MSB-IT
-- Mod date: 20-08-2021
-- Description: Se modifica consolidacion para procesar a pensionados y no emplanillados
-- =============================================
ALTER PROCEDURE [dbo].[spConsolidaAfiliadoDeuda]
@iPeriodo int = 0,  
  @iIdUsuario int = 0,
  @vcLlave varchar(50), --Llave de desencriptacion del sueldo
  @vcTipoEjecucion varchar(1) = 'M',
  @iCodError int = 0 out, 
  @vcMsjError varchar(50) = 'OK' out
AS
declare
  @iIdControlProceso as int,  
  @dFechahoraConsolidacion as datetime,
  @iIdInstitucion as int,
  @vcNombreCorto as nvarchar(10),
  @iCorrelativoAfiliado as int,
  @iCorrelativoDeuda as int,
  @iCorrelativoConsolidacion as int,
  --VARIABLES PARA CURSOR QUE RECORRE DEUDA
  @iIdConsolidacionDetalle int,
  @iIdConsolidacionDetallePensionado int,
  @iCantidad int, 
  @iIdInstitucionDestino int,
  @iPeriodoDeuda int,
  @iIdCajaOrigen int,
  @vcNumPagare nvarchar(15),
  @vcRutEmpresa nvarchar(10),     
  @vcIdentificadorDeudor nvarchar(15), 
  @iIdTipoIdentificador int,
  @vcNombreDeudor nvarchar(80),
  @iIdTipoAfiliado int, 
  @vcSujetoDescuento varchar(1),
  @nMontoCobrar numeric(15,0),
  @vcRutAval nvarchar(10),  
  @vcRutAval_1 nvarchar(10),     
  @vcRutAval_2 nvarchar(10),     
  @vcRutAval_3 nvarchar(10),
  @vcTipoDeuda nvarchar(1),
  @nSaldoCapital numeric(15,0),
  @dFechaPrimerImpago date,
  @iCantRegistros as int,
  @iCorrelativoFueraPlazo as int,
  @vcFechaColocacion nvarchar(8),
  @nFechaAfiliacion numeric(8,0),
  @nCapitalInicial numeric(15,0),
  @nMontoOfertaColocacion numeric(15,0),
  @vcEmplanillado nvarchar(2),
  @esTrabajador INT
  
  declare
  @iInstitucionesParticipantes TABLE
    (
    nPeriodo int,
    nIdInstitucion int,
    vcNombreCorto nvarchar(10),
    iCorrelativoAfiliado int,
    iCorrelativoDeuda int,
    iCorrelativoConsolidacion int
    ) 
BEGIN
  SET DATEFORMAT ymd

  -- VALIDAR PERIODO,  ES NECESARIO QUE SEA VALIDO PARA QUE SE PUEDA REALIZAR EL RESTO DEL PROCESO
  select @iCantRegistros=count(*) from tblperiodo where nperiodo=@iPeriodo
  if @iCantRegistros=0
  begin
    set @iCodError = -4;
    set @vcMsjError = 'PERIODO INDICADO INEXISTENTE'; 
    return
  end
  
  
  -- OBTENER ID DE CONTROL DE PROCESO E INSERTAR NUEVO REGISTRO (OK)  
  -- TAMBIEN SE INSERTA REGISTROCONSOLIDACION
  BEGIN
    -- CONTROL DE PROCESO, OBTENER ID DE CONTROL DE PROCESO
    SELECT     @iIdControlProceso = coalesce(MAX(nIdControlProceso) + 1,1)
    FROM         tblControlProceso
    WHERE     (nPeriodo = @iPeriodo)
    
    -- INSERTAR REGISTRO DE CONTROL DE PROCESO
    INSERT INTO tblControlProceso
         (nIdControlProceso,nPeriodo,dFechaInicio,dFechaFin
         ,iIdEstado,iIdTipoControlProceso,vcDetalle)
     VALUES
         (@iIdControlProceso
         ,@iPeriodo
         ,GETDATE() --FECHA INICIO
         ,GETDATE() -- FECHA TERMINO
         ,22 -- ESTADO INICIADO
         ,1 -- CONSOLIDACION DEUDA
         ,'Ejecutada consolidacion de deuda')
    -- Tambien Insertar registro de consolidacion
    select @dFechahoraConsolidacion=GETDATE()
    INSERT INTO tblRegistroConsolidacion
                      (nPeriodo, dFechaRegistro, iRutUsuario, vcTipoEjecucion, vcTipoConsolidacion, iIdEstado)
    VALUES     (@iPeriodo, @dFechahoraConsolidacion, @iIdUsuario, @vcTipoEjecucion, N'CD', N'26')
    
  end
  
  -- VERIFICANDO FACTIBILIDAD DE CONSOLIDACION (OK) 
  begin
  -- CONTROL DE PROCESO = VERIFICANDO FACTIBILIDAD
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Verificando Factibilidad de consolidacion'
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo

  -- REVERIFICAR QUE ES FACTIBLE CONSOLIDAR
  
    EXEC  [dbo].[spVerificaEnvioArchivos]
    @iPeriodo = @iPeriodo,
    @vcTipocons = N'CD',
    @iCodError = @iCodError OUTPUT,
    @vcMsjError = @vcMsjError OUTPUT
    if @iCodError<>0
    begin
      if @vcTipoEjecucion = 'A'
      BEGIN
        --VERIFICACION ERRONEA SE ABORTA EJECUCION
        UPDATE tblControlProceso
        SET iIdEstado=25 ,vcDetalle='Consolidacion abortada,  no pasa verificacion de envio de archivos'
        WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo

        --INSERTAR REGISTROS DE CIERRE FUERA DE PLAZO INDICANDO RAZON DEL ABORTAR EL PROCESO
        declare cursor_instituciones_fuera_plazo cursor for
                select tblInstitucion.nIdInstitucion from 
                (SELECT tblInstitucion.nIdInstitucion,
                      MAX(CASE WHEN vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AA' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoAfi, 
                      MAX(CASE WHEN vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoDeuda
                FROM      vwUltimoArchivoEnviadoValidado RIGHT OUTER JOIN
                            tblInstitucion ON vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblInstitucion.nIdInstitucion
                WHERE      (vwUltimoArchivoEnviadoValidado.nPeriodo = @iPeriodo) OR
                            (vwUltimoArchivoEnviadoValidado.nIdInstitucion IS NULL) AND (tblInstitucion.bParticipa = 1) AND (tblInstitucion.iIdEstado = 11)
                GROUP BY tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto) ConArchivo
                          RIGHT OUTER JOIN
                          tblInstitucion ON ConArchivo.nIdInstitucion = tblInstitucion.nIdInstitucion
                          where tblInstitucion.bParticipa = 1 AND tblInstitucion.iIdEstado = 11 and (iCorrelativoAfi is null or iCorrelativoDeuda is null or iCorrelativoAfi=0 or iCorrelativoDeuda =0)                      
                for read only

                --Abrir cursor de instituciones fuera de plazo para insertar sus registros en tabla de cierres fuera de plazo
            
          OPEN cursor_instituciones_fuera_plazo
          FETCH NEXT FROM cursor_instituciones_fuera_plazo INTO @iIdInstitucion 
      
                select @iCorrelativoFueraPlazo=coalesce(MAX(iidcierreplazo) + 1,1) from tblCierreFueraPlazo where nPeriodo=@iPeriodo 
                WHILE @@FETCH_STATUS = 0  
                BEGIN                                 
                    -- Insertar registro
                    insert into tblCierreFueraPlazo (iidcierreplazo,nPeriodo,nIdInstitucion) values (@iCorrelativoFueraPlazo,@iPeriodo,@iIdInstitucion)
                    select @iCorrelativoFueraPlazo=@iCorrelativoFueraPlazo+1
                    FETCH NEXT FROM cursor_instituciones_fuera_plazo INTO @iIdInstitucion 
                END
          close cursor_instituciones_fuera_plazo
          deallocate cursor_instituciones_fuera_plazo
      END
      UPDATE tblControlProceso      
      SET iIdEstado=25 ,vcDetalle='Consolidacion de compra de cartera abortada,  no pasa verificacion de envio de archivos'
      WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
      return
    end
  end
    
  -- OBTENER LISTA DE CAJAS PARTICIPANTES (OK)  
  BEGIN   
    -- CONTROL DE PROCESO = OBTENIENDO LISTA DE CAJAS PARTICIPANTES
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Obteniendo lista de cajas participantes'
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo   
    -- Obtener lista de cajas participantes para el periodo y sus archivos de Afiliados y de deudas
    --*********************************************************************************************
    insert into @iInstitucionesParticipantes
      (nPeriodo,nIdInstitucion ,vcNombreCorto,iCorrelativoAfiliado ,iCorrelativoDeuda, iCorrelativoConsolidacion)
      select @iPeriodo,tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto, iCorrelativoAfi,iCorrelativoDeuda,iCorrelativoConsolidacion from 
           (SELECT tblInstitucion.nIdInstitucion,
                      MAX(CASE WHEN vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AA' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoAfi, 
                      MAX(CASE WHEN vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoDeuda,
                          (SELECT     MAX(iCorrelativo) AS Expr1
                            FROM          tblConsolidacionCabecera
                            WHERE      (nIdInstitucion = tblInstitucion.nIdInstitucion) AND (nPeriodo = @iPeriodo)) AS iCorrelativoConsolidacion
            FROM         vwUltimoArchivoEnviadoValidado RIGHT OUTER JOIN
                         tblInstitucion ON vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblInstitucion.nIdInstitucion
            WHERE     (vwUltimoArchivoEnviadoValidado.nPeriodo = @iPeriodo) OR
                      (vwUltimoArchivoEnviadoValidado.nIdInstitucion IS NULL) AND (tblInstitucion.bParticipa = 1) AND (tblInstitucion.iIdEstado = 11)
            GROUP BY tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto) ConArchivo
                      RIGHT OUTER JOIN
                      tblInstitucion ON ConArchivo.nIdInstitucion = tblInstitucion.nIdInstitucion
                      where tblInstitucion.bParticipa = 1 AND tblInstitucion.iIdEstado = 11
        
    
    --DECLARAR CURSOR PARA UTILIZAR MAS ADELANTE
    DECLARE cursor_instituciones CURSOR FOR
    SELECT nIdInstitucion,vcNombreCorto,iCorrelativoAfiliado,iCorrelativoDeuda,iCorrelativoConsolidacion
    FROM @iInstitucionesParticipantes
    FOR  read only
    
  END
  
  -- LIMPIAR ARCHIVOS DE CONSOLIDACION (OK)
  BEGIN
  -- CONTROL DE PROCESO = LIMPIANDO ARCHIVOS DE CONSOLIDACION
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Limpiando archivos de consolidacion'
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
  -- BUSCAR ARCHIVOS DE CONSOLIDACION Y LIMPIAR,  en bloques de 10.000 registros
    -- LIMPIANDO DETALLE CONSOLIDACION
    while (1=1)
    begin
      delete top(10000) from tblConsolidacionDetalle where nPeriodo=@iPeriodo
      if @@ROWCOUNT=0 break
    end

    -- LIMPIANDO DETALLE CONSOLIDACION PENSIONADOS
    while (1=1)
    begin
      delete top(10000) from tblConsolidacionDetallePensionado where nPeriodo=@iPeriodo
      if @@ROWCOUNT=0 break
    end
      
    -- LIMPIANDO CABECERA CONSOLIDACION
    while (1=1)
    begin
      delete top(10000) from tblConsolidacionCabecera where nPeriodo=@iPeriodo
      if @@ROWCOUNT=0 break
    end   

    -- LIMPIANDO CABECERA CONSOLIDACION PENSIONADOS
    while (1=1)
    begin
      delete top(10000) from tblConsolidacionCabeceraPensionado where nPeriodo=@iPeriodo
      if @@ROWCOUNT=0 break
    end   
  END
  
  -- MARCAR REGISTROS CON AFILIADO EN MISMA CAJA (TABLA DEUDA) (OK)
  BEGIN
    -- CONTROL DE PROCESO = MARCANDO REGISTROS CON AUTORUT  
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Descartando registros con RUT deudor en misma caja'
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
  -- MARCAR AUTORUT     
    OPEN cursor_instituciones
    FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativoAfiliado,@iCorrelativoDeuda,@iCorrelativoConsolidacion    
    WHILE @@FETCH_STATUS = 0  
    BEGIN                 
        --DESHABILITAR TODOS LOS REGISTROS AUTOREFERENTES CAMBIANDOLES ATRIBUTO ENPLANILLADO
      update tblDeudaDetalle set vcEmplanillado='AR'
      where
      nIdInstitucion=@iIdInstitucion and nPeriodo=@iPeriodo and iCorrelativo=@iCorrelativoDeuda
      --and vcNumPagare in (SELECT tblDeudaDetalle.vcNumPagare
      and vcIdentificadorDeudor  in (SELECT tblDeudaDetalle.vcIdentificadorDeudor 
        FROM tblDeudaDetalle INNER JOIN
                tblAfiliadoDetalle ON tblDeudaDetalle.vcIdentificadorDeudor = tblAfiliadoDetalle.vcIdentificadorAfiliado
                and tblDeudaDetalle.nPeriodo = tblAfiliadoDetalle.nPeriodo
        WHERE 
        tblDeudaDetalle.vcEmplanillado = N'SI' and 
        tblDeudaDetalle.nIdInstitucion = @iIdInstitucion and
        tblDeudaDetalle.iCorrelativo = @iCorrelativoDeuda
        AND 
        tblAfiliadoDetalle.iCorrelativo=@iCorrelativoAfiliado and
        tblAfiliadoDetalle.nIdInstitucion = @iIdInstitucion AND 
        tblDeudaDetalle.nPeriodo = @iPeriodo 
        )
               
      FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativoAfiliado,@iCorrelativoDeuda,@iCorrelativoConsolidacion
    END  

    CLOSE cursor_instituciones      
  END
  
  -- INSERTAR CABECERA DE CONSOLIDACION (OK)
  begin
  -- CONTROL DE PROCESO = MARCANDO REGISTROS CON AUTORUT  
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Generando cabeceras de consolidacion'
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
  -- INSERTANDO/ACUALIZANDO CABECERAS   
    OPEN cursor_instituciones
    FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativoAfiliado,@iCorrelativoDeuda,@iCorrelativoConsolidacion
    WHILE @@FETCH_STATUS = 0  
    BEGIN  
    
    if @iCorrelativoConsolidacion is NULL set @iCorrelativoConsolidacion =1
    
    
    INSERT INTO tblConsolidacionCabecera
         (nIdInstitucion,nPeriodo,dFechaIng,nTotalDeudores
         ,nTotalSaldoCapital,nTotalMontoCobrar,vcLinkNomina,cvLinkRecaudacion,iCorrelativo)
    VALUES( 
         @iIdInstitucion
         ,@iPeriodo
         ,@dFechahoraConsolidacion
         ,0 -- nTotalDeudores
         ,0 -- nTotalSaldoCapital
         ,0 -- nTotalMontoCobrar
         ,'' -- vcLinkNomina
         ,'' -- cvLinkRecaudacion 
         ,@iCorrelativoConsolidacion + 1 
        )

    INSERT INTO tblConsolidacionCabeceraPensionado
         (nIdInstitucion,nPeriodo,dFechaIng,nTotalDeudores
         ,nTotalSaldoCapital,nTotalMontoCobrar,vcLinkNomina,cvLinkRecaudacion,iCorrelativo)
    VALUES( 
         @iIdInstitucion
         ,@iPeriodo
         ,@dFechahoraConsolidacion
         ,0 -- nTotalDeudores
         ,0 -- nTotalSaldoCapital
         ,0 -- nTotalMontoCobrar
         ,'' -- vcLinkNomina
         ,'' -- cvLinkRecaudacion 
         ,@iCorrelativoConsolidacion + 1 
        )

      FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativoAfiliado,@iCorrelativoDeuda,@iCorrelativoConsolidacion
    END  
    CLOSE cursor_instituciones  
    
  end
  
  
  -- GENERAR detalle consolidacion (OK)
  BEGIN

    -- CONTROL DE PROCESO = GENERANDO ALERTAS   
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Generando informacion de alertas'
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
  -- GENERAR DETALLE CONSOLIDACION
  
    OPEN cursor_instituciones
    FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativoAfiliado,@iCorrelativoDeuda,@iCorrelativoConsolidacion
    WHILE @@FETCH_STATUS = 0  
    BEGIN  
      --DECLARAR CURSOR PARA RECORRER DEUDA,  ESTE CURSOR RETORNA LOS DATOS LISTOS PARA ACTUALIZAR
      DECLARE cursor_deuda CURSOR FOR         
        SELECT     COUNT(*) AS cantidad, MAX(afiliados_activos.nIdInstitucion) AS nIdInstitucion, tblDeudaDetalle.nperiodo , 
          tblDeudaDetalle.nIdInstitucion AS nIdCajaOrigen, tblDeudaDetalle.vcNumPagare, MAX(afiliados_activos.vcRutEmpresa) AS vcRutEmpresa, 
          tblDeudaDetalle.vcIdentificadorDeudor AS vcIdentificadorDeudor, max(tblDeudaDetalle.tIdTipoIdentificador), MAX(afiliados_activos.vcNombreAfiliado) 
          AS vcNombreDeudor, MAX(afiliados_activos.tIdTipoAfiliado) AS tIdTipoAfiliado, 'D' AS cSujetoDescuento, tblDeudaDetalle.nMontoCobrar, 
                  max(tblDeudaDetalle.vcRutAval_1) as vcRutAval_1, max(tblDeudaDetalle.vcRutAval_2) as vcRutAval_2, 
				  max(tblDeudaDetalle.vcRutAval_3) as vcRutAval_3, tblDeudaDetalle.vcTipoDeuda as vcTipoDeuda,tblDeudaDetalle.nSaldoCapital as nSaldoCapital,
        case when ISDATE(tblDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblDeudaDetalle.vcFechaPrimerImpago) else    null end as dFechaPrimerImpago,
		tblDeudaDetalle.vcFechaColocacion,afiliados_activos.nFechaAfiliacion,tblDeudaDetalle.nCapitalInicial,tblDeudaDetalle.nMontoOfertaColocacion,
		tblDeudaDetalle.vcEmplanillado, SUM(CASE WHEN afiliados_activos.tIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END) AS esTrabajador
        FROM
          (
          SELECT     instituciones.nperiodo, instituciones.nIdInstitucion, instituciones.iCorrelativoAfiliado, instituciones.icorrelativoDeuda, 
          tblAfiliadoDetalle.vcIdentificadorAfiliado, tblAfiliadoDetalle.tIdTipoIdentificador, tblAfiliadoDetalle.vcRutEmpresa, 
          tblAfiliadoDetalle.vcNombreAfiliado, tblAfiliadoDetalle.tIdTipoAfiliado,0 as nFechaAfiliacion
          FROM (
            select nPeriodo ,nIdInstitucion ,vcNombreCorto ,iCorrelativoAfiliado ,iCorrelativoDeuda from @iInstitucionesParticipantes
            ) AS instituciones 
            INNER JOIN tblAfiliadoDetalle ON instituciones.nIdInstitucion = tblAfiliadoDetalle.nIdInstitucion AND instituciones.nperiodo = tblAfiliadoDetalle.nPeriodo AND instituciones.iCorrelativoAfiliado = tblAfiliadoDetalle.iCorrelativo
          ) 
          AS afiliados_activos 
          RIGHT OUTER JOIN tblDeudaDetalle ON afiliados_activos.vcIdentificadorAfiliado = tblDeudaDetalle.vcIdentificadorDeudor AND afiliados_activos.tIdTipoIdentificador = tblDeudaDetalle.tIdTipoIdentificador AND afiliados_activos.nperiodo = tblDeudaDetalle.nPeriodo           
          right join 
          (
            select nPeriodo ,nIdInstitucion ,vcNombreCorto ,iCorrelativoAfiliado ,iCorrelativoDeuda from @iInstitucionesParticipantes
            ) AS instituciones2 
          ON tblDeudaDetalle.nIdInstitucion = instituciones2.nIdInstitucion and tblDeudaDetalle.iCorrelativo =instituciones2.iCorrelativoDeuda
          where tblDeudaDetalle.nIdInstitucion = @iIdInstitucion AND tblDeudaDetalle.nperiodo = @iPeriodo 
          GROUP BY tblDeudaDetalle.iCorrelativo , tblDeudaDetalle.vcEmplanillado,tblDeudaDetalle.nIdInstitucion, tblDeudaDetalle.nperiodo, tblDeudaDetalle.vcIdentificadorDeudor, afiliados_activos.tIdTipoIdentificador, tblDeudaDetalle.vcNumPagare, tblDeudaDetalle.nMontoCobrar, tblDeudaDetalle.vcTipoDeuda, tblDeudaDetalle.nSaldoCapital,tblDeudaDetalle.vcFechaPrimerImpago,tblDeudaDetalle.vcFechaColocacion,afiliados_activos.nFechaAfiliacion,tblDeudaDetalle.nCapitalInicial,tblDeudaDetalle.nMontoOfertaColocacion 
          HAVING (MAX(afiliados_activos.nIdInstitucion) <> @iIdInstitucion) OR (tblDeudaDetalle.nIdInstitucion = @iIdInstitucion) AND (MAX(afiliados_activos.nIdInstitucion) IS NULL)       
        for read only
      
      OPEN cursor_deuda 
        FETCH NEXT FROM cursor_deuda  INTO    
        @iCantidad ,@iIdInstitucionDestino,@iPeriodoDeuda ,@iIdCajaOrigen ,@vcNumPagare ,@vcRutEmpresa ,@vcIdentificadorDeudor ,@iIdTipoIdentificador ,@vcNombreDeudor ,@iIdTipoAfiliado , @vcSujetoDescuento ,@nMontoCobrar,@vcRutAval_1 ,@vcRutAval_2,@vcRutAval_3,@vcTipoDeuda,@nSaldoCapital, @dFechaPrimerImpago,@vcFechaColocacion,@nFechaAfiliacion,@nCapitalInicial,@nMontoOfertaColocacion, @vcEmplanillado,@esTrabajador
        
        select @vcTipoDeuda;
  
        WHILE @@FETCH_STATUS = 0  
        BEGIN  
          --VERIFICAR EL TIPO DE REGISTRO OBTENIDO
          if @iCantidad=1 and @iIdInstitucionDestino is not null
          begin
          --Deudor encontrado en otra caja,  se inserta registro normalmente
            set @vcSujetoDescuento = 'D'

            -- Emplanillado NO o Emplanillado SI con tipo de afiliado Pensionado
            IF @vcEmplanillado = 'NO' OR (@vcEmplanillado = 'SI' AND (@iIdTipoAfiliado != 1 AND @iIdTipoAfiliado != 2 AND @iIdTipoAfiliado != 9))
              BEGIN
               --IdConsolidacionDetallePensionado
               select @iIdConsolidacionDetallePensionado=MAX(nIdConsolidacionDetalle)+1
               from tblConsolidacionDetallePensionado where nIdInstitucion=@iIdInstitucionDestino and nPeriodo=@iPeriodo     
               AND vcEmplanillado = @vcEmplanillado AND (CASE WHEN @iIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END) = (CASE WHEN tIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END)                
         
               if @iIdConsolidacionDetallePensionado is NULL set @iIdConsolidacionDetallePensionado =1

               INSERT INTO tblConsolidacionDetallePensionado
                 (nIdConsolidacionDetalle,nIdInstitucion,nPeriodo
                 ,nIdCajaOrigen,vcNumPagare,vcRutEmpresa,vcIdentificadorDeudor
                 ,tIdTipoIdentificador,vcNombreDeudor,tIdTipoAfiliado
                 ,vcRutAval,cSujetoDescuento,nMontoCobrar,nMontoPagado,vcTipoDeuda,nSaldoCapital,dFechaPrimerImpago,vcFechaColocacion,nFechaAfiliacion,nCapitalInicial,nMontoOfertaColocacion,vcEmplanillado) 

               VALUES
                 (@iIdConsolidacionDetallePensionado,
                 @iIdInstitucionDestino,
                 @iPeriodo, 
                 @iIdCajaOrigen,
                 @vcNumPagare,
                 @vcRutEmpresa,
                 @vcIdentificadorDeudor,
                 @iIdTipoIdentificador,
                 @vcNombreDeudor,
                 @iIdTipoAfiliado,
                 NULL,
                 @vcSujetoDescuento,
                 @nMontoCobrar,
                 0,--nMontoPagado                   
                 @vcTipoDeuda,
                 @nSaldoCapital,
                 @dFechaPrimerImpago,
				 @vcFechaColocacion,
				 @nFechaAfiliacion,
				 @nCapitalInicial,
				 @nMontoOfertaColocacion,
				 @vcEmplanillado
                 )
               END

			   -- Se agrega adicionalmente en nominas solo si es Emplanillado SI
			   IF @vcEmplanillado = 'SI'
			   	BEGIN
               		--IdConsolidacionDetalle
               		select @iIdConsolidacionDetalle=MAX(nIdConsolidacionDetalle)+1
               		from tblConsolidacionDetalle where nIdInstitucion=@iIdInstitucionDestino and nPeriodo=@iPeriodo 
               		                 
               		if @iIdConsolidacionDetalle is NULL set @iIdConsolidacionDetalle =1
               		
               		INSERT INTO tblConsolidacionDetalle
               		  (nIdConsolidacionDetalle,nIdInstitucion,nPeriodo
               		  ,nIdCajaOrigen,vcNumPagare,vcRutEmpresa,vcIdentificadorDeudor
               		  ,tIdTipoIdentificador,vcNombreDeudor,tIdTipoAfiliado
               		  ,vcRutAval,cSujetoDescuento,nMontoCobrar,nMontoPagado,vcTipoDeuda,nSaldoCapital,dFechaPrimerImpago,vcFechaColocacion,nFechaAfiliacion,nCapitalInicial,nMontoOfertaColocacion) 
               		
               		VALUES
               		  (@iIdConsolidacionDetalle,
               		  @iIdInstitucionDestino,
               		  @iPeriodo, 
               		  @iIdCajaOrigen,
               		  @vcNumPagare,
               		  @vcRutEmpresa,
               		  @vcIdentificadorDeudor,
               		  @iIdTipoIdentificador,
               		  @vcNombreDeudor,
               		  @iIdTipoAfiliado,
               		  NULL,
               		  @vcSujetoDescuento,
               		  @nMontoCobrar,
               		  0,--nMontoPagado                   
               		  @vcTipoDeuda,
               		  @nSaldoCapital,
               		  @dFechaPrimerImpago,
			   		  @vcFechaColocacion,
			   		  @nFechaAfiliacion,
			   		  @nCapitalInicial,
			   		  @nMontoOfertaColocacion 
               		  )    
               	END           
          end
          else if @iCantidad=1 and @iIdInstitucionDestino is null
          begin
            --Deudor no encontrado en otras cajas,  Buscar los Avales
            --************************************************************            
            -- SE OBTIENE EL RUT DEL AVAL CON MAYOR SUELDO EN OTRAS INSTITUCIONES           
            set @vcSujetoDescuento = 'A'
            -- VERIFICACION RAPIDA DE QUE VIENE AL MENOS UN CAMPO AVAL
            if @vcRutAval_1<>'' or @vcRutAval_2<>''or @vcRutAval_3<>''
            BEGIN
              -- Se verifica antes si aval esta como trabajador y pensionado
              SELECT 
              @iCantidad=count(1),
              @esTrabajador=SUM(CASE WHEN tblAfiliadoDetalle.tIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END)
              FROM (
              select nPeriodo ,nIdInstitucion ,vcNombreCorto ,iCorrelativoAfiliado ,iCorrelativoDeuda from @iInstitucionesParticipantes
              ) AS instituciones 
              INNER JOIN tblAfiliadoDetalle ON instituciones.nIdInstitucion = tblAfiliadoDetalle.nIdInstitucion AND instituciones.nperiodo = tblAfiliadoDetalle.nPeriodo AND instituciones.iCorrelativoAfiliado = tblAfiliadoDetalle.iCorrelativo
              where instituciones.nPeriodo=@iPeriodo and instituciones.nIdInstitucion<>@iIdInstitucion and (vcIdentificadorAfiliado=@vcRutAval_1 or vcIdentificadorAfiliado=@vcRutAval_2 or vcIdentificadorAfiliado=@vcRutAval_3) and tblAfiliadoDetalle.tIdTipoIdentificador=1 
              
              -- Busca datos del aval ordenandolo y priorizandolo si es que es trabajador
              SELECT top 1 
              @vcRutAval=tblAfiliadoDetalle.vcIdentificadorAfiliado,
              @iIdInstitucionDestino= instituciones.nIdInstitucion, 
              @vcRutEmpresa=tblAfiliadoDetalle.vcRutEmpresa,
              @vcNombreDeudor=tblAfiliadoDetalle.vcNombreAfiliado,
              @iIdTipoAfiliado=tblAfiliadoDetalle.tIdTipoAfiliado
              FROM (
              select nPeriodo ,nIdInstitucion ,vcNombreCorto ,iCorrelativoAfiliado ,iCorrelativoDeuda from @iInstitucionesParticipantes
              ) AS instituciones 
              INNER JOIN tblAfiliadoDetalle ON instituciones.nIdInstitucion = tblAfiliadoDetalle.nIdInstitucion AND instituciones.nperiodo = tblAfiliadoDetalle.nPeriodo AND instituciones.iCorrelativoAfiliado = tblAfiliadoDetalle.iCorrelativo
              where instituciones.nPeriodo=@iPeriodo and instituciones.nIdInstitucion<>@iIdInstitucion and (vcIdentificadorAfiliado=@vcRutAval_1 or vcIdentificadorAfiliado=@vcRutAval_2 or vcIdentificadorAfiliado=@vcRutAval_3) and tblAfiliadoDetalle.tIdTipoIdentificador=1 
              order by CASE WHEN tblAfiliadoDetalle.tIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END desc, dbo.fncDesEnmascaraSueldo(vbRentaImponible,@vcLlave) desc,nFechaAfiliacion desc
                
                if @@ROWCOUNT>0
                BEGIN
                    -- Emplanillado NO o Emplanillado SI con tipo de afiliado Pensionado
                	IF @vcEmplanillado = 'NO' OR (@vcEmplanillado = 'SI' AND (@iIdTipoAfiliado != 1 AND @iIdTipoAfiliado != 2 AND @iIdTipoAfiliado != 9))
                    BEGIN
                      --IdConsolidacionDetallePensionado
                      select @iIdConsolidacionDetallePensionado=MAX(nIdConsolidacionDetalle)+1
                      from tblConsolidacionDetallePensionado where nIdInstitucion=@iIdInstitucionDestino and nPeriodo=@iPeriodo  
                      AND vcEmplanillado = @vcEmplanillado AND (CASE WHEN @iIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END) = (CASE WHEN tIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END)                   
    
                      if @iIdConsolidacionDetallePensionado is NULL set @iIdConsolidacionDetallePensionado =1

                      INSERT INTO tblConsolidacionDetallePensionado
                        (nIdConsolidacionDetalle,nIdInstitucion,nPeriodo,
                        nIdCajaOrigen,vcNumPagare,
                        vcRutEmpresa,vcIdentificadorDeudor,tIdTipoIdentificador,
                        vcNombreDeudor,tIdTipoAfiliado,vcRutAval,
                        cSujetoDescuento,nMontoCobrar,nMontoPagado,
                        vcTipoDeuda,nSaldoCapital,dFechaPrimerImpago,vcFechaColocacion,  nFechaAfiliacion,nCapitalInicial,nMontoOfertaColocacion, vcEmplanillado)
                      VALUES
                        (@iIdConsolidacionDetallePensionado,@iIdInstitucionDestino,@iPeriodo, 
                        @iIdCajaOrigen,@vcNumPagare,
                        @vcRutEmpresa,@vcIdentificadorDeudor,@iIdTipoIdentificador,
                        @vcNombreDeudor,@iIdTipoAfiliado,@vcRutAval,
                        @vcSujetoDescuento,@nMontoCobrar,0,--nMontoPagado                   
                        @vcTipoDeuda,@nSaldoCapital,@dFechaPrimerImpago,@vcFechaColocacion,  @nFechaAfiliacion,@nCapitalInicial,@nMontoOfertaColocacion, @vcEmplanillado )
				  
					END
				  -- Se agrega adicionalmente para nominas solo si es Emplanillado SI
			   	  -- Quedara registrado con el mayor sueldo priorizado si es trabajador
			   	  IF @vcEmplanillado = 'SI'
                    BEGIN
                      		--IdConsolidacionDetalle
                      		select @iIdConsolidacionDetalle=MAX(nIdConsolidacionDetalle)+1
                      		from tblConsolidacionDetalle where nIdInstitucion=@iIdInstitucionDestino and nPeriodo=@iPeriodo                     
                      		
                      		if @iIdConsolidacionDetalle is NULL set @iIdConsolidacionDetalle =1
                      		
                      		INSERT INTO tblConsolidacionDetalle
                      		  (nIdConsolidacionDetalle,nIdInstitucion,nPeriodo,
                      		  nIdCajaOrigen,vcNumPagare,
                      		  vcRutEmpresa,vcIdentificadorDeudor,tIdTipoIdentificador,
                      		  vcNombreDeudor,tIdTipoAfiliado,vcRutAval,
                      		  cSujetoDescuento,nMontoCobrar,nMontoPagado,
                      		  vcTipoDeuda,nSaldoCapital,dFechaPrimerImpago,vcFechaColocacion,  nFechaAfiliacion,nCapitalInicial,nMontoOfertaColocacion)
                      		VALUES
                      		  (@iIdConsolidacionDetalle,@iIdInstitucionDestino,@iPeriodo, 
                      		  @iIdCajaOrigen,@vcNumPagare,
                      		  @vcRutEmpresa,@vcIdentificadorDeudor,@iIdTipoIdentificador,
                      		  @vcNombreDeudor,@iIdTipoAfiliado,@vcRutAval,
                      		  @vcSujetoDescuento,@nMontoCobrar,0,--nMontoPagado                   
                      		  @vcTipoDeuda,@nSaldoCapital,@dFechaPrimerImpago,@vcFechaColocacion,  @nFechaAfiliacion,@nCapitalInicial,@nMontoOfertaColocacion)
                    END
                    
                    -- Si tambien fue encontrado como pensionado, se busca la mayor renta como este               
                    IF @iCantidad <> @esTrabajador AND @esTrabajador > 0
              		BEGIN
              		    -- Aval encontrado en varias cajas,  se debe obtener mayor sueldo  
              			-- Busca datos del aval ordenandolo y priorizandolo como pensionado
              			SELECT top 1 
              			@vcRutAval=tblAfiliadoDetalle.vcIdentificadorAfiliado,
              			@iIdInstitucionDestino= instituciones.nIdInstitucion, 
              			@vcRutEmpresa=tblAfiliadoDetalle.vcRutEmpresa,
              			@vcNombreDeudor=tblAfiliadoDetalle.vcNombreAfiliado,
              			@iIdTipoAfiliado=tblAfiliadoDetalle.tIdTipoAfiliado
              			FROM (
              			select nPeriodo ,nIdInstitucion ,vcNombreCorto ,iCorrelativoAfiliado ,iCorrelativoDeuda from @iInstitucionesParticipantes
              			) AS instituciones 
              			INNER JOIN tblAfiliadoDetalle ON instituciones.nIdInstitucion = tblAfiliadoDetalle.nIdInstitucion AND instituciones.nperiodo = tblAfiliadoDetalle.nPeriodo AND instituciones.iCorrelativoAfiliado = tblAfiliadoDetalle.iCorrelativo
              			where instituciones.nPeriodo=@iPeriodo and instituciones.nIdInstitucion<>@iIdInstitucion and (vcIdentificadorAfiliado=@vcRutAval_1 or vcIdentificadorAfiliado=@vcRutAval_2 or vcIdentificadorAfiliado=@vcRutAval_3) and tblAfiliadoDetalle.tIdTipoIdentificador=1 
              			order by CASE WHEN tblAfiliadoDetalle.tIdTipoAfiliado NOT IN (1,2,9) THEN 1 ELSE 0 END desc, dbo.fncDesEnmascaraSueldo(vbRentaImponible,@vcLlave) desc,nFechaAfiliacion desc
              			
              			if @@ROWCOUNT>0
              			begin
              	   			-- Emplanillado NO o Emplanillado SI con tipo de afiliado Pensionado
                   			IF @vcEmplanillado = 'NO' OR (@vcEmplanillado = 'SI' AND (@iIdTipoAfiliado != 1 AND @iIdTipoAfiliado != 2 AND @iIdTipoAfiliado != 9))
                   			 BEGIN
                   			   --IdConsolidacionDetallePensionado
                   			   select @iIdConsolidacionDetallePensionado=MAX(nIdConsolidacionDetalle)+1
                   			   from tblConsolidacionDetallePensionado where nIdInstitucion=@iIdInstitucionDestino and nPeriodo=@iPeriodo  
                   			   AND vcEmplanillado = @vcEmplanillado AND (CASE WHEN @iIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END) = (CASE WHEN tIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END)                   
                   			
                   			   if @iIdConsolidacionDetallePensionado is NULL set @iIdConsolidacionDetallePensionado =1
                   			
                   			   INSERT INTO tblConsolidacionDetallePensionado
                   			     (nIdConsolidacionDetalle,nIdInstitucion,nPeriodo,
                   			     nIdCajaOrigen,vcNumPagare,
                   			     vcRutEmpresa,vcIdentificadorDeudor,tIdTipoIdentificador,
                   			     vcNombreDeudor,tIdTipoAfiliado,vcRutAval,
                   			     cSujetoDescuento,nMontoCobrar,nMontoPagado,
                   			     vcTipoDeuda,nSaldoCapital,dFechaPrimerImpago,vcFechaColocacion,  nFechaAfiliacion,nCapitalInicial,nMontoOfertaColocacion, vcEmplanillado)
                   			   VALUES
                   			     (@iIdConsolidacionDetallePensionado,@iIdInstitucionDestino,@iPeriodo, 
                   			     @iIdCajaOrigen,@vcNumPagare,
                   			     @vcRutEmpresa,@vcIdentificadorDeudor,@iIdTipoIdentificador,
                   			     @vcNombreDeudor,@iIdTipoAfiliado,@vcRutAval,
                   			     @vcSujetoDescuento,@nMontoCobrar,0,--nMontoPagado                   
                   			     @vcTipoDeuda,@nSaldoCapital,@dFechaPrimerImpago,@vcFechaColocacion,  @nFechaAfiliacion,@nCapitalInicial,@nMontoOfertaColocacion, @vcEmplanillado )
				   			
				   			 END
		  				
			  				-- No se agrega a alertas ya que si fue encontrado como pensionado y trabajador, quedo registrado
			  				-- para nominas con mayor renta como trabajador , con emplanillado SI
              			END          
              		END
                END
             END   
          end
          else if @iCantidad>1 and @iIdInstitucionDestino is not null
          begin
            -- Deudor encontrado en varias cajas,  se debe obtener mayor sueldo  
            -- Busca datos del afiliado ordenandolo y priorizandolo si es que es trabajador
              SELECT top 1 @iIdInstitucionDestino= instituciones.nIdInstitucion, 
                          @vcRutEmpresa=tblAfiliadoDetalle.vcRutEmpresa,
                          @vcIdentificadorDeudor=tblAfiliadoDetalle.vcIdentificadorAfiliado,
                          @iIdTipoIdentificador=tblAfiliadoDetalle.tIdTipoIdentificador,
                          @vcNombreDeudor=tblAfiliadoDetalle.vcNombreAfiliado,
                          @iIdTipoAfiliado=tblAfiliadoDetalle.tIdTipoAfiliado
              FROM (
              select nPeriodo ,nIdInstitucion ,vcNombreCorto ,iCorrelativoAfiliado ,iCorrelativoDeuda from @iInstitucionesParticipantes
              ) AS instituciones 
              INNER JOIN tblAfiliadoDetalle ON instituciones.nIdInstitucion = tblAfiliadoDetalle.nIdInstitucion AND instituciones.nperiodo = tblAfiliadoDetalle.nPeriodo AND instituciones.iCorrelativoAfiliado = tblAfiliadoDetalle.iCorrelativo
              where instituciones.nPeriodo=@iPeriodo and instituciones.nIdInstitucion<>@iIdInstitucion and (vcIdentificadorAfiliado=@vcIdentificadorDeudor) 
              order by CASE WHEN tblAfiliadoDetalle.tIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END desc, dbo.fncDesEnmascaraSueldo(vbRentaImponible,@vcLlave) desc,nFechaAfiliacion desc
  
              if @@ROWCOUNT>0
              begin
                -- Emplanillado NO o Emplanillado SI con tipo de afiliado Pensionado
                IF @vcEmplanillado = 'NO' OR (@vcEmplanillado = 'SI' AND (@iIdTipoAfiliado != 1 AND @iIdTipoAfiliado != 2 AND @iIdTipoAfiliado != 9)) 
                  BEGIN
                    --IdConsolidacionDetallePensionado
                    select @iIdConsolidacionDetallePensionado=MAX(nIdConsolidacionDetalle)+1
                    from tblConsolidacionDetallePensionado where nIdInstitucion=@iIdInstitucionDestino and nPeriodo=@iPeriodo  
                    AND vcEmplanillado = @vcEmplanillado AND (CASE WHEN @iIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END) = (CASE WHEN tIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END)                   
    
                    if @iIdConsolidacionDetallePensionado is NULL set @iIdConsolidacionDetallePensionado =1

                    INSERT INTO tblConsolidacionDetallePensionado
                     (nIdConsolidacionDetalle,nIdInstitucion,nPeriodo
                     ,nIdCajaOrigen,vcNumPagare,vcRutEmpresa,vcIdentificadorDeudor
                     ,tIdTipoIdentificador,vcNombreDeudor,tIdTipoAfiliado
                     ,vcRutAval,cSujetoDescuento,nMontoCobrar,nMontoPagado,vcTipoDeuda,nSaldoCapital,dFechaPrimerImpago,vcFechaColocacion,  nFechaAfiliacion,nCapitalInicial,nMontoOfertaColocacion, vcEmplanillado)
                    VALUES
                     (@iIdConsolidacionDetallePensionado,
                     @iIdInstitucionDestino,
                     @iPeriodo, 
                     @iIdCajaOrigen,
                     @vcNumPagare,
                     @vcRutEmpresa,
                     @vcIdentificadorDeudor,
                     @iIdTipoIdentificador,
                     @vcNombreDeudor,
                     @iIdTipoAfiliado,
                     NULL,
                     @vcSujetoDescuento,
                     @nMontoCobrar,
                     0,--nMontoPagado                   
                     @vcTipoDeuda,
                     @nSaldoCapital,
                     @dFechaPrimerImpago,
				     @vcFechaColocacion,  
			         @nFechaAfiliacion,
				     @nCapitalInicial,
				     @nMontoOfertaColocacion,
				     @vcEmplanillado )	
				  
				  END
				    
				-- Se agrega adicionalmente en nominas solo si es Emplanillado SI
			   	-- Quedara registrado con el mayor sueldo priorizado si es trabajador
			   	IF @vcEmplanillado = 'SI'
					BEGIN
						--IdConsolidacionDetalle
                    	select @iIdConsolidacionDetalle=MAX(nIdConsolidacionDetalle)+1
                    	from tblConsolidacionDetalle where nIdInstitucion=@iIdInstitucionDestino and nPeriodo=@iPeriodo                     
                    	
                    	if @iIdConsolidacionDetalle is NULL set @iIdConsolidacionDetalle =1
                    	
                    	INSERT INTO tblConsolidacionDetalle
                    	 (nIdConsolidacionDetalle,nIdInstitucion,nPeriodo
                    	 ,nIdCajaOrigen,vcNumPagare,vcRutEmpresa,vcIdentificadorDeudor
                    	 ,tIdTipoIdentificador,vcNombreDeudor,tIdTipoAfiliado
                    	 ,vcRutAval,cSujetoDescuento,nMontoCobrar,nMontoPagado,vcTipoDeuda,nSaldoCapital,dFechaPrimerImpago,vcFechaColocacion,  nFechaAfiliacion,nCapitalInicial,nMontoOfertaColocacion)
                    	VALUES
                    	 (@iIdConsolidacionDetalle,
                    	 @iIdInstitucionDestino,
                    	 @iPeriodo, 
                    	 @iIdCajaOrigen,
                    	 @vcNumPagare,
                    	 @vcRutEmpresa,
                    	 @vcIdentificadorDeudor,
                    	 @iIdTipoIdentificador,
                    	 @vcNombreDeudor,
                    	 @iIdTipoAfiliado,
                    	 NULL,
                    	 @vcSujetoDescuento,
                    	 @nMontoCobrar,
                    	 0,--nMontoPagado                   
                    	 @vcTipoDeuda,
                    	 @nSaldoCapital,
                    	 @dFechaPrimerImpago,
				    	 @vcFechaColocacion,  
			        	 @nFechaAfiliacion,
				    	 @nCapitalInicial,
				    	 @nMontoOfertaColocacion )	
                  	END	
              END
              -- Si tambien fue encontrado como pensionado, se busca la mayor renta como este               
              IF @iCantidad <> @esTrabajador AND @esTrabajador > 0
              	BEGIN
              	    -- Deudor encontrado en varias cajas,  se debe obtener mayor sueldo  
            		-- Busca datos del afiliado ordenandolo y priorizandolo como pensionado
              		SELECT top 1 @iIdInstitucionDestino= instituciones.nIdInstitucion, 
              		            @vcRutEmpresa=tblAfiliadoDetalle.vcRutEmpresa,
              		            @vcIdentificadorDeudor=tblAfiliadoDetalle.vcIdentificadorAfiliado,
              		            @iIdTipoIdentificador=tblAfiliadoDetalle.tIdTipoIdentificador,
              		            @vcNombreDeudor=tblAfiliadoDetalle.vcNombreAfiliado,
              		            @iIdTipoAfiliado=tblAfiliadoDetalle.tIdTipoAfiliado
              		FROM (
              		select nPeriodo ,nIdInstitucion ,vcNombreCorto ,iCorrelativoAfiliado ,iCorrelativoDeuda from @iInstitucionesParticipantes
              		) AS instituciones 
              		INNER JOIN tblAfiliadoDetalle ON instituciones.nIdInstitucion = tblAfiliadoDetalle.nIdInstitucion AND instituciones.nperiodo = tblAfiliadoDetalle.nPeriodo AND instituciones.iCorrelativoAfiliado = tblAfiliadoDetalle.iCorrelativo
              		where instituciones.nPeriodo=@iPeriodo and instituciones.nIdInstitucion<>@iIdInstitucion and (vcIdentificadorAfiliado=@vcIdentificadorDeudor) 
              		order by CASE WHEN tblAfiliadoDetalle.tIdTipoAfiliado NOT IN (1,2,9) THEN 1 ELSE 0 END desc, dbo.fncDesEnmascaraSueldo(vbRentaImponible,@vcLlave) desc,nFechaAfiliacion desc
              		
              		if @@ROWCOUNT>0
              		begin
              		  -- Emplanillado NO o Emplanillado SI con tipo de afiliado Pensionado
              		  IF @vcEmplanillado = 'NO' OR (@vcEmplanillado = 'SI' AND (@iIdTipoAfiliado != 1 AND @iIdTipoAfiliado != 2 AND @iIdTipoAfiliado != 9))
              		    BEGIN
              		      --IdConsolidacionDetallePensionado
              		      select @iIdConsolidacionDetallePensionado=MAX(nIdConsolidacionDetalle)+1
              		      from tblConsolidacionDetallePensionado where nIdInstitucion=@iIdInstitucionDestino and nPeriodo=@iPeriodo  
              		      AND vcEmplanillado = @vcEmplanillado AND (CASE WHEN @iIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END) = (CASE WHEN tIdTipoAfiliado IN (1,2,9) THEN 1 ELSE 0 END)                   
              		
              		      if @iIdConsolidacionDetallePensionado is NULL set @iIdConsolidacionDetallePensionado =1
              		
              		      INSERT INTO tblConsolidacionDetallePensionado
              		       (nIdConsolidacionDetalle,nIdInstitucion,nPeriodo
              		       ,nIdCajaOrigen,vcNumPagare,vcRutEmpresa,vcIdentificadorDeudor
              		       ,tIdTipoIdentificador,vcNombreDeudor,tIdTipoAfiliado
              		       ,vcRutAval,cSujetoDescuento,nMontoCobrar,nMontoPagado,vcTipoDeuda,nSaldoCapital,dFechaPrimerImpago,vcFechaColocacion,  nFechaAfiliacion,nCapitalInicial,nMontoOfertaColocacion, vcEmplanillado)
              		      VALUES
              		       (@iIdConsolidacionDetallePensionado,
              		       @iIdInstitucionDestino,
              		       @iPeriodo, 
              		       @iIdCajaOrigen,
              		       @vcNumPagare,
              		       @vcRutEmpresa,
              		       @vcIdentificadorDeudor,
              		       @iIdTipoIdentificador,
              		       @vcNombreDeudor,
              		       @iIdTipoAfiliado,
              		       NULL,
              		       @vcSujetoDescuento,
              		       @nMontoCobrar,
              		       0,--nMontoPagado                   
              		       @vcTipoDeuda,
              		       @nSaldoCapital,
              		       @dFechaPrimerImpago,
			  			     @vcFechaColocacion,  
			  		       @nFechaAfiliacion,
			  			     @nCapitalInicial,
			  			     @nMontoOfertaColocacion,
			  			     @vcEmplanillado )	
			  			  
			  			  END
			  			
			  			-- No se agrega a alertas ya que si fue encontrado como pensionado y trabajador, quedo registrado
			  			-- para nominas con mayor renta como trabajador , con emplanillado SI
              		END          
              	END
          end
        
          FETCH NEXT FROM cursor_deuda  INTO    
          @iCantidad ,@iIdInstitucionDestino,@iPeriodoDeuda ,@iIdCajaOrigen ,@vcNumPagare ,@vcRutEmpresa ,@vcIdentificadorDeudor ,@iIdTipoIdentificador ,@vcNombreDeudor ,@iIdTipoAfiliado , @vcSujetoDescuento ,@nMontoCobrar,@vcRutAval_1 ,@vcRutAval_2,@vcRutAval_3,@vcTipoDeuda,@nSaldoCapital,@dFechaPrimerImpago,@vcFechaColocacion,  @nFechaAfiliacion,@nCapitalInicial,@nMontoOfertaColocacion, @vcEmplanillado,@esTrabajador
        END 
        close cursor_Deuda
        deallocate cursor_Deuda
      FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativoAfiliado,@iCorrelativoDeuda,@iCorrelativoConsolidacion
    END  
    CLOSE cursor_instituciones                  
  END

  -- INSERTAR EN RESUMEN CONSOLIDACION y ACTUALIZAR CABECERA (OK)
  begin
    --insertar resumen de consolidacion
    INSERT INTO tblResumenConsolidacion
    (nPeriodo,dFechaRegistro,iIdCajaOrigen,iIdCajaDestino,nTotalRegistros,nTotalSaldo,nMontoCobrar)
    SELECT nPeriodo, @dFechahoraConsolidacion AS FechaRegistro, nIdCajaOrigen AS IdCajaOrigen, nIdInstitucion AS idCajaDestino, COUNT(*) AS nroRegistros, 
                      SUM(nSaldoCapital) AS Saldo, SUM(nMontoCobrar) AS MontoCobrar
    FROM         tblConsolidacionDetalle
    where (nPeriodo = @iPeriodo)
    AND (tblConsolidacionDetalle.tIdTipoAfiliado IN (1,2,9) )
    GROUP BY nIdInstitucion, nPeriodo, nIdCajaOrigen

    --insertar resumen de consolidacion Pensionado
    INSERT INTO tblResumenConsolidacionPensionado
    (nPeriodo,dFechaRegistro,iIdCajaOrigen,iIdCajaDestino,nTotalRegistros,nTotalSaldo,nMontoCobrar)
    SELECT nPeriodo, @dFechahoraConsolidacion AS FechaRegistro, nIdCajaOrigen AS IdCajaOrigen, nIdInstitucion AS idCajaDestino, COUNT(*) AS nroRegistros, 
                      SUM(nSaldoCapital) AS Saldo, SUM(nMontoCobrar) AS MontoCobrar
    FROM         tblConsolidacionDetallePensionado
    where (nPeriodo = @iPeriodo)
    GROUP BY nIdInstitucion, nPeriodo, nIdCajaOrigen  
    
    -- Actualizar totales en cabecera
    update t1
    set t1.nTotalDeudores=t2.nroRegistros, 
    t1.nTotalMontoCobrar=t2.MontoCobrar, 
    t1.nTotalSaldoCapital=t2.Saldo
    from tblConsolidacionCabecera t1 inner join 
    (SELECT nIdInstitucion ,COUNT(distinct vcIdentificadorDeudor) AS nroRegistros, 
                      SUM(nSaldoCapital) AS Saldo, SUM(nMontoCobrar) AS MontoCobrar
    FROM         tblConsolidacionDetalle
    where nPeriodo = @iPeriodo 
    GROUP BY nIdInstitucion) t2
    on t1.nIdInstitucion=t2.nIdInstitucion
    where t1.nPeriodo=@iPeriodo 

    -- Actualizar totales en cabecera Pensionado
    update t1
    set t1.nTotalDeudores=t2.nroRegistros, 
    t1.nTotalMontoCobrar=t2.MontoCobrar, 
    t1.nTotalSaldoCapital=t2.Saldo
    from tblConsolidacionCabeceraPensionado t1 inner join 
    (SELECT nIdInstitucion ,COUNT(distinct vcIdentificadorDeudor) AS nroRegistros, 
                      SUM(nSaldoCapital) AS Saldo, SUM(nMontoCobrar) AS MontoCobrar
    FROM         tblConsolidacionDetallePensionado
    where nPeriodo = @iPeriodo 
    GROUP BY nIdInstitucion) t2
    on t1.nIdInstitucion=t2.nIdInstitucion
    where t1.nPeriodo=@iPeriodo 
        
  end


  -- EJECUCION EXITOSA (OK)
  BEGIN
    deallocate cursor_instituciones
    -- CONTROL DE PROCESO = FINALIZACION DE CONSOLIDACION DE DEUDA
    UPDATE tblControlProceso
    SET iIdEstado=24 ,vcDetalle='Consolidacion de deuda efectuada exitosamente',
    dFechaFin=GETDATE()
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
    
    -- Se marca registro de consolidacion como finalizado
    update tblRegistroConsolidacion
    set iIdEstado=27
    where nPeriodo=@iPeriodo and dFechaRegistro=@dFechahoraConsolidacion
    
    
    set @iCodError = 0;
    set @vcMsjError = 'Consolidacion de deuda efectuada exitosamente';  
    return
  END
  
END
GO

GO
--SqlScripter----[dbo].[spConsolidaCompraCarteras].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsolidaCompraCarteras]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsolidaCompraCarteras] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 05-11-2013
-- Description: Realiza la consolidacion de compra de carteras
-- 
-- Posibles salidas:          
--   0 OK - Se ha realizado la consolidacion de compra de carteras OK
--   -3 NOK - (VERIFICACION ARCHIVOS) Faltan archivos compra de carteras
--   -4 NOK - OTROS
--   -5 NOK - Parametros incorrectos

-- =============================================
ALTER PROCEDURE [dbo].[spConsolidaCompraCarteras]
@iPeriodo int = 0,  
  @iIdUsuario int,
  @vcTipoEjecucion varchar(1) = 'A',
  @iCodError int = 0 out, 
  @vcMsjError varchar(50) = 'OK' out  
AS
declare
  @iId_control_proceso as int,
  @iCant_instituciones_participantes as int,    
  @iCant_instituciones_consolidadas as int=0,
  @dFechahora_consolidacion as datetime,
  @iIdInstitucionOrigen as int,
  @vcNombreCorto as nvarchar(10),
  @iCorrelativoCompraCartera as int,  
  @iCantRegistros as int,
  @dFechaIng as datetime, 
  @iIdInstitucion as int,
  @iCorrelativoFueraPlazo as int   
declare
  @tInstitucionesParticipantes TABLE
    (
    iPeriodo int,
    iIdInstitucionOrigen int,
    vcNombreCorto nvarchar(10),
    iCorrelativoCompraCartera int   
    ) 
BEGIN
  -- VALIDAR PERIODO,  ES NECESARIO QUE SEA VALIDO PARA QUE SE PUEDA REALIZAR EL RESTO DEL PROCESO
  select @iCantRegistros=count(*) from tblperiodo where nperiodo=@iPeriodo
  if @iCantRegistros=0
  begin
    set @iCodError = -4;
    set @vcMsjError = 'PERIODO INDICADO INEXISTENTE'; 
    return
  end
  
  
  -- OBTENER ID DE CONTROL DE PROCESO E INSERTAR NUEVO REGISTRO (OK)  
  -- TAMBIEN SE INSERTA REGISTROCONSOLIDACION
  BEGIN
    -- CONTROL DE PROCESO, OBTENER ID DE CONTROL DE PROCESO
    SELECT     @iId_control_proceso = coalesce( MAX(nIdControlProceso) +1,1)
    FROM         tblControlProceso
    WHERE     (nPeriodo = @iPeriodo)
    
    -- INSERTAR REGISTRO DE CONTROL DE PROCESO
    INSERT INTO tblControlProceso
         (nIdControlProceso,nPeriodo,dFechaInicio,dFechaFin
         ,iIdEstado,iIdTipoControlProceso,vcDetalle)
     VALUES
         (@iId_control_proceso
         ,@iPeriodo
         ,GETDATE() --FECHA INICIO
         ,GETDATE() -- FECHA TERMINO
         ,22 -- ESTADO INICIADO
         ,6 -- CONSOLIDACION COMPRA CARTERA
         ,'Ejecutada consolidacion de compra de cartera')
    -- Tambien Insertar registro de consolidacion
    select @dFechahora_consolidacion=GETDATE()
    INSERT INTO tblRegistroConsolidacion
                      (nPeriodo, dFechaRegistro, iRutUsuario, vcTipoEjecucion, vcTipoConsolidacion, iIdEstado)
    VALUES     (@iPeriodo, @dFechahora_consolidacion, @iIdUsuario, N'A', N'CC', N'26')
    
  end
  
  -- VERIFICANDO FACTIBILIDAD DE CONSOLIDACION DE COMPRA DE CARTERA (OK)  
  begin
  -- CONTROL DE PROCESO = VERIFICANDO FACTIBILIDAD
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Verificando Factibilidad de consolidacion de compra de cartera'
    WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo

  -- REVERIFICAR QUE ES FACTIBLE CONSOLIDAR
  
    EXEC  [dbo].[spVerificaEnvioArchivos]
    @iPeriodo = @iPeriodo,
    @vctipoCons = 'CC',
    @iCodError = @iCodError OUTPUT,
    @vcMsjError = @vcMsjError OUTPUT
    if @iCodError<>0
    begin
      if @vcTipoEjecucion = 'A'
      BEGIN
       --VERIFICACION ERRONEA SE ABORTA EJECUCION
        UPDATE tblControlProceso
        SET iIdEstado=25 ,vcDetalle='Consolidacion compra de cartera abortada,  no pasa verificacion de envio de archivos'
        WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo
      
      --INSERTAR REGISTROS DE CIERRE FUERA DE PLAZO INDICANDO RAZON DEL ABORTAR EL PROCESO
        declare cursor_instituciones_fuera_plazo cursor for
                select tblInstitucion.nIdInstitucion from 
                (SELECT tblInstitucion.nIdInstitucion,
                      MAX(CASE WHEN vwUltimoArchivoEnviadoValidado.tipoArchivo = 'CC' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoCC
                FROM      vwUltimoArchivoEnviadoValidado RIGHT OUTER JOIN
                            tblInstitucion ON vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblInstitucion.nIdInstitucion
                WHERE      (vwUltimoArchivoEnviadoValidado.nPeriodo = @iPeriodo) OR
                            (vwUltimoArchivoEnviadoValidado.nIdInstitucion IS NULL) AND (tblInstitucion.bParticipa = 1) AND (tblInstitucion.iIdEstado = 11)
                GROUP BY tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto) ConArchivo
                          RIGHT OUTER JOIN
                          tblInstitucion ON ConArchivo.nIdInstitucion = tblInstitucion.nIdInstitucion
                          where tblInstitucion.bParticipa = 1 AND tblInstitucion.iIdEstado = 11 and (iCorrelativoCC is null or iCorrelativoCC=0 )                      
                for read only

                --Abrir cursor de instituciones fuera de plazo para insertar sus registros en tabla de cierres fuera de plazo
            
          OPEN cursor_instituciones_fuera_plazo
          FETCH NEXT FROM cursor_instituciones_fuera_plazo INTO @iIdInstitucion 
      
                select @iCorrelativoFueraPlazo=coalesce(MAX(iidcierreplazo) + 1,1) from tblCierreFueraPlazo where nPeriodo=@iPeriodo 
                WHILE @@FETCH_STATUS = 0  
                BEGIN                                 
                    -- Insertar registro
                    insert into tblCierreFueraPlazo (iidcierreplazo,nPeriodo,nIdInstitucion) values (@iCorrelativoFueraPlazo,@iPeriodo,@iIdInstitucion)
                    select @iCorrelativoFueraPlazo=@iCorrelativoFueraPlazo+1
                    FETCH NEXT FROM cursor_instituciones_fuera_plazo INTO @iIdInstitucion 
                END
          close cursor_instituciones_fuera_plazo
          deallocate cursor_instituciones_fuera_plazo          
      END
      UPDATE tblControlProceso      
      SET iIdEstado=25 ,vcDetalle='Consolidacion de compra de cartera abortada,  no pasa verificacion de envio de archivos'
      WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo
      return
    end
  -- VERIFICAR SI EXISTEN REGISTROS DE CONSOLIDACION  
    SELECT @iCant_instituciones_consolidadas= COUNT(*)
      FROM tblConsolidacionCarteraCabecera
      where nIdInstitucion=@iPeriodo
    
    -- abortar ejecucion por datos inexistentes
    if @iCant_instituciones_consolidadas is null
    begin
      set @iCodError = -4;
      set @vcMsjError = 'No hay datos de consolidacion propuesta de carteras para actualizar en este proceso(Compra de Cartera)'; 
      --2DA VERIFICACION ERRONEA SE ABORTA EJECUCION
      UPDATE tblControlProceso
      SET iIdEstado=25 ,vcDetalle='No hay datos de consolidacion de compra de carteras'
      WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo
      return
    end
    
    
    
  end
  
  
    
  -- OBTENER LISTA DE CAJAS PARTICIPANTES (PDTE)  
  BEGIN   
    -- CONTROL DE PROCESO = OBTENIENDO LISTA DE CAJAS PARTICIPANTES
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Obteniendo lista de cajas participantes'
    WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo   
    -- Obtener lista de cajas participantes para el periodo y sus archivos de recaudacion
    --*********************************************************************************************
    insert into @tInstitucionesParticipantes
      (iPeriodo,iIdInstitucionOrigen ,vcNombreCorto,iCorrelativoCompraCartera )
    SELECT     @iPeriodo,tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto, 
                   MAX(CASE WHEN vwUltimoArchivoEnviadoValidado.tipoArchivo = 'CC' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoCompraCartera
    FROM         vwUltimoArchivoEnviadoValidado RIGHT OUTER JOIN
                   tblInstitucion ON vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblInstitucion.nIdInstitucion
    WHERE     (vwUltimoArchivoEnviadoValidado.nPeriodo = @iPeriodo) OR
                   (vwUltimoArchivoEnviadoValidado.nIdInstitucion IS NULL and tblInstitucion.bParticipa=1 and tblInstitucion.iIdEstado=11)
    GROUP BY tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto
        
    
    --DECLARAR CURSOR PARA UTILIZAR MAS ADELANTE
    DECLARE cursor_instituciones CURSOR FOR  
    SELECT iIdInstitucionOrigen,vcNombreCorto,iCorrelativoCompraCartera
    FROM @tInstitucionesParticipantes
    for read only
    
  END
    
  -- GENERAR detalle consolidacion (PDTE)
  BEGIN
    -- CONTROL DE PROCESO = GENERANDO ALERTAS   
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Actualizando registros de consolidacion con compra de cartera'
    WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo
  -- GENERAR DETALLE CONSOLIDACION
    UPDATE tblConsolidacionCarteraDetalle
        SET 
        nMontoFinalCompra=0, vcFechaCompra=NULL  
        where nPeriodo=@iPeriodo 
  
    --RECORRER CURSOR DE INSTITUCIONES
    OPEN cursor_instituciones
    FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucionOrigen,@vcNombreCorto,@iCorrelativoCompraCartera
    WHILE @@FETCH_STATUS = 0  
    BEGIN      
      if @iCorrelativoCompraCartera<>0
      begin
                
        UPDATE tblConsolidacionCarteraDetalle
        SET 
        nMontoFinalCompra=cartera.nMontoPagado, vcFechaCompra=cartera.vcFechaPago
        FROM  tblCarteraCompradaDetalle AS cartera INNER JOIN
                      tblConsolidacionCarteraDetalle tcon ON 
                      cartera.nIdCajaOrigen = tcon.nIdCajaOrigen AND 
                      cartera.nIdInstitucion = tcon.nIdCajaDestino AND 
                      cartera.nPeriodo = tcon.nPeriodo AND 
                      cartera.vcNumPagare = tcon.vcNumPagare and 
                      cartera.vcIdentificadorDeudor = tcon.vcIdentificadorDeudor and 
                      cartera.tidtipoidentificador = tcon.tidtipoidentificador and
                      cartera.vcrutempresa = tcon.vcrutempresa and
					  (cartera.cSujetoDescuento='A' and cartera.vcRutAval=tcon.vcRutAval or cartera.cSujetoDescuento='D')
        where 
        cartera.nPeriodo=@iPeriodo and 
        cartera.nIdInstitucion= @iIdInstitucionOrigen and 
        cartera.iCorrelativo=@iCorrelativoCompraCartera 
        and tcon.nMontoFinalCompra=0
        
      end
    
    FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucionOrigen,@vcNombreCorto,@iCorrelativoCompraCartera     
    END  
    CLOSE cursor_instituciones                  
    
  END
  
  select 'Instituciones participantes' as cur,* from @tInstitucionesParticipantes
         

  -- INSERTAR EN RESUMEN CONSOLIDACION y ACTUALIZAR CABECERA (OK)
  begin 
    
    --insertar resumen de consolidacion GRN
    INSERT INTO tblResumenConsolidacion
    (nPeriodo,dFechaRegistro,iIdCajaOrigen,iIdCajaDestino,nTotalRegistros,nMontoCobrar,nMontoPagado)
     SELECT nPeriodo, 
        @dFechahora_consolidacion AS FechaRegistro, 
        nIdCajaOrigen AS IdCajaOrigen, 
        nIdCajaDestino AS idCajaDestino, 
        COUNT(*) AS nroRegistros, 
                SUM(nMontoOferta) AS MontoOferta,  --SE almacena en montocobrar el montooferta
                SUM(nMontoFinalCompra) AS MontoFinalCompra --SE almacena en montopagado el montofinalcompra
    FROM    tblConsolidacionCarteraDetalle
    WHERE nMontoOferta > 0
      AND nPeriodo = @iPeriodo
    GROUP BY nIdCajaDestino, nPeriodo, nIdCajaOrigen
    


    
    -- Actualizar totales en cabecera
    update tconcab
    set tconcab.iCorrelativo=case when tconcab.dFechaCompraCartera IS null then 1 else tconcab.iCorrelativo+1 end, tconcab.dFechaCompraCartera=@dFechahora_consolidacion
    from tblConsolidacionCarteraCabecera tconcab inner join 
    (SELECT nIdCajaDestino,@dFechahora_consolidacion AS FechaRegistro, nIdCajaOrigen AS IdCajaOrigen, nIdCajaDestino AS idCajaDestino, COUNT(*) AS nroRegistros                      
    FROM         tblConsolidacionCarteraDetalle
    where  nPeriodo = @iPeriodo
    GROUP BY nIdCajaDestino, nPeriodo, nIdCajaOrigen    ) TconDet
    on tconcab.nIdInstitucion=TconDet.idCajaDestino
    where tconcab.nPeriodo=@iPeriodo 
     
        
  end

        
  -- EJECUCION EXITOSA (OK)
  BEGIN
    deallocate cursor_instituciones
    -- CONTROL DE PROCESO = FINALIZACION DE CONSOLIDACION DE DEUDA
    UPDATE tblControlProceso
    SET iIdEstado=24 ,vcDetalle='Consolidacion de compra de cartera efectuada exitosamente',
    dFechaFin=GETDATE()
    WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo
    
    -- Se marca registro de consolidacion como finalizado
    update tblRegistroConsolidacion
    set iIdEstado=27
    where nPeriodo=@iPeriodo and dFechaRegistro=@dFechahora_consolidacion
    
    
    
    set @iCodError = 0;
    set @vcMsjError = 'Consolidacion de compra de cartera efectuada exitosamente';  
    return
  END
  
END
GO

GO
--SqlScripter----[dbo].[spConsolidaPropuestaCarteras].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsolidaPropuestaCarteras]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsolidaPropuestaCarteras] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 07-10-2013
-- Description: Realiza la consolidacion de afiliados y deudas para la generacion de propuestas de cartera
-- 
-- Recibe:
--  @iPeriodo : Periodo que se desea consolidar 
--  @iIdUsuario: Id del usuario que gatilla el proceso de consolidacion

-- Posibles salidas:          
--  @iCodError: parametro de salida
--   0 OK - Se ha realizado la consolidacion OK
--   -1 NOK - (VERIFICACION ARCHIVOS) Faltan archivos afiliados
--   -2 NOK - (VERIFICACION ARCHIVOS) Faltan archivos deuda
--   -3 NOK - (VERIFICACION ARCHIVOS) Faltan archivos recaudacion
--   -4 NOK - OTROS
--   -5 NOK - Parametros incorrectos
--  @vcMsjError: Descripción del error en caso de icoderror distinto de 0
--  
-- Mod: Optimisa
-- Mod date: 27-07-2016
-- Description: Agrega el campo fecha de colocacion
-- =============================================
ALTER PROCEDURE [dbo].[spConsolidaPropuestaCarteras]
@iPeriodo int = 0,  
  @iIdUsuario int = 0,  
  @vcTipoEjecucion varchar(10), 
  @iCodError int = 0 out, 
  @vcMsjError varchar(50) = 'OK' out
AS
declare
  @iIdControlProceso as int,  
  @dFechahoraConsolidacion as datetime,
  @iIdInstitucion as int,
  @vcNombreCorto as nvarchar(10),
  @iCorrelativoAfiliado as int,
  @iCorrelativoDeuda as int,
  @iCorrelativoConsolidacion as int,
  --VARIABLES PARA CURSOR QUE RECORRE DEUDA
  @iIdConsolidacionDetalle int,
  @iCantidad int, 
  @iIdInstitucionDestino int,
  @iPeriodoDeuda int,
  
  @iIdCajaOrigen int,
  @vcNumPagare nvarchar(15),
  @vcRutEmpresa nvarchar(10),     
  @vcIdentificadorDeudor nvarchar(15), 
  @iIdTipoIdentificador int,
  @vcNombreDeudor nvarchar(80),
  @iIdTipoAfiliado int, 
  @vcSujetoDescuento varchar(1),
  @nMontoOfertaColocacion numeric(15,0),
  @vcFechaColocacion varchar(8),
  @vcFechaPrimerImpago varchar(15),
  @vcRutAval nvarchar(10),  
  @vcRutAval_1 nvarchar(10),     
  @vcRutAval_2 nvarchar(10),     
  @vcRutAval_3 nvarchar(10),
  @vcTipoDeuda nvarchar(1),
  @nSaldoCapital numeric(15,0),
  @iCantRegistros as int,
  @iCorrelativoFueraPlazo as int,
  @dFechaPrimerImpago date
declare
  @iInstitucionesParticipantes TABLE
    (
    nPeriodo int,
    nIdInstitucion int,
    vcNombreCorto nvarchar(10),
    iCorrelativoAfiliado int,
    iCorrelativoDeuda int,
    iCorrelativoConsolidacion int
    ) 
BEGIN
  SET DATEFORMAT ymd
  
  -- VALIDAR PERIODO,  ES NECESARIO QUE SEA VALIDO PARA QUE SE PUEDA REALIZAR EL RESTO DEL PROCESO
  select @iCantRegistros=count(*) from tblperiodo where nperiodo=@iPeriodo
  if @iCantRegistros=0
  begin
    set @iCodError = -4;
    set @vcMsjError = 'PERIODO INDICADO INEXISTENTE'; 
    return
  end
  
  
  -- OBTENER ID DE CONTROL DE PROCESO E INSERTAR NUEVO REGISTRO (OK)
  -- TAMBIEN SE INSERTA REGISTROCONSOLIDACION
  BEGIN
    -- CONTROL DE PROCESO, OBTENER ID DE CONTROL DE PROCESO
    SELECT     @iIdControlProceso = coalesce(MAX(nIdControlProceso) + 1,1)
    FROM         tblControlProceso
    WHERE     (nPeriodo = @iPeriodo)
    
    -- INSERTAR REGISTRO DE CONTROL DE PROCESO
    INSERT INTO tblControlProceso
         (nIdControlProceso,nPeriodo,dFechaInicio,dFechaFin
         ,iIdEstado,iIdTipoControlProceso,vcDetalle)
     VALUES
         (@iIdControlProceso
         ,@iPeriodo
         ,GETDATE() --FECHA INICIO
         ,GETDATE() -- FECHA TERMINO
         ,22 -- ESTADO INICIADO
         ,5 -- CONSOLIDACION PROPUESTA CARTERA
         ,'Ejecutada consolidacion propuesta cartera')
    -- Tambien Insertar registro de consolidacion
    select @dFechahoraConsolidacion=GETDATE()
    INSERT INTO tblRegistroConsolidacion
                      (nPeriodo, dFechaRegistro, iRutUsuario, vcTipoEjecucion, vcTipoConsolidacion, iIdEstado)
    VALUES     (@iPeriodo, @dFechahoraConsolidacion, @iIdUsuario, @vcTipoEjecucion, N'CPC', N'26')
    
  end
  
  -- VERIFICANDO FACTIBILIDAD DE CONSOLIDACION (OK)
  BEGIN
  -- CONTROL DE PROCESO = VERIFICANDO FACTIBILIDAD
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Verificando Factibilidad de consolidacion cartera'
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
    
  
  -- REVERIFICAR QUE ES FACTIBLE CONSOLIDAR ,  e insertar registros de Cierre fuera de plazo en caso de ser necesario
    EXEC  [dbo].[spVerificaEnvioArchivos]
    @iPeriodo = @iPeriodo,
    @vcTipoCons = N'CP',
    @iCodError = @iCodError OUTPUT,
    @vcMsjError = @vcMsjError OUTPUT
    if @iCodError<>0
    begin

      if @vcTipoEjecucion = 'A'
      BEGIN
        --VERIFICACION ERRONEA SE ABORTA EJECUCION
        UPDATE tblControlProceso
        SET iIdEstado=25 ,vcDetalle='Actualizando cierres fuera de plazo'
        WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
      
        --INSERTAR REGISTROS DE CIERRE FUERA DE PLAZO INDICANDO RAZON DEL ABORTAR EL PROCESO
        declare cursor_instituciones_fuera_plazo cursor for
                select tblInstitucion.nIdInstitucion from 
                (SELECT tblInstitucion.nIdInstitucion,
                      MAX(CASE WHEN vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AA' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoAfi, 
                      MAX(CASE WHEN vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoDeuda
                FROM      vwUltimoArchivoEnviadoValidado RIGHT OUTER JOIN
                            tblInstitucion ON vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblInstitucion.nIdInstitucion
                WHERE      (vwUltimoArchivoEnviadoValidado.nPeriodo = @iPeriodo) OR
                            (vwUltimoArchivoEnviadoValidado.nIdInstitucion IS NULL) AND (tblInstitucion.bParticipa = 1) AND (tblInstitucion.iIdEstado = 11)
                GROUP BY tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto) ConArchivo
                          RIGHT OUTER JOIN
                          tblInstitucion ON ConArchivo.nIdInstitucion = tblInstitucion.nIdInstitucion
                          where tblInstitucion.bParticipa = 1 AND tblInstitucion.iIdEstado = 11 and (iCorrelativoAfi is null or iCorrelativoDeuda is null or iCorrelativoAfi=0 or iCorrelativoDeuda =0)                      
                for read only

                --Abrir cursor de instituciones fuera de plazo para insertar sus registros en tabla de cierres fuera de plazo
            
          OPEN cursor_instituciones_fuera_plazo
          FETCH NEXT FROM cursor_instituciones_fuera_plazo INTO @iIdInstitucion 
      
                select @iCorrelativoFueraPlazo=coalesce(MAX(iidcierreplazo) + 1,1) from tblCierreFueraPlazo where nPeriodo=@iPeriodo 
                WHILE @@FETCH_STATUS = 0  
                BEGIN                                 
                    -- Insertar registro
                    insert into tblCierreFueraPlazo (iidcierreplazo,nPeriodo,nIdInstitucion) values (@iCorrelativoFueraPlazo,@iPeriodo,@iIdInstitucion)
                    select @iCorrelativoFueraPlazo=@iCorrelativoFueraPlazo+1
                    FETCH NEXT FROM cursor_instituciones_fuera_plazo INTO @iIdInstitucion 
                END
          close cursor_instituciones_fuera_plazo
          deallocate cursor_instituciones_fuera_plazo
      END
      UPDATE tblControlProceso      
      SET iIdEstado=25 ,vcDetalle='Consolidacion de compra de cartera abortada,  no pasa verificacion de envio de archivos'
      WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
      return
    END 

  END

  
  -- OBTENER LISTA DE CAJAS PARTICIPANTES (OK)
  BEGIN   
    -- CONTROL DE PROCESO = OBTENIENDO LISTA DE CAJAS PARTICIPANTES
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Obteniendo lista de cajas participantes'
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo   
    -- Obtener lista de cajas participantes para el periodo y sus archivos de Afiliados y de deudas
    --*********************************************************************************************
   insert into @iInstitucionesParticipantes
      (nPeriodo,nIdInstitucion ,vcNombreCorto,iCorrelativoAfiliado ,iCorrelativoDeuda, iCorrelativoConsolidacion)
      select @iPeriodo,tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto, iCorrelativoAfi,iCorrelativoDeuda,iCorrelativoConsolidacion from 
           (SELECT tblInstitucion.nIdInstitucion,
                      MAX(CASE WHEN vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AA' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoAfi, 
                      MAX(CASE WHEN vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoDeuda,
                          (SELECT     coalesce(MAX(iCorrelativo),0) AS Expr1
                            FROM          tblConsolidacionCarteraCabecera
                            WHERE      (nIdInstitucion = tblInstitucion.nIdInstitucion) AND (nPeriodo = @iPeriodo)) AS iCorrelativoConsolidacion
            FROM         vwUltimoArchivoEnviadoValidado RIGHT OUTER JOIN
                         tblInstitucion ON vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblInstitucion.nIdInstitucion
            WHERE     (vwUltimoArchivoEnviadoValidado.nPeriodo = @iPeriodo) OR
                      (vwUltimoArchivoEnviadoValidado.nIdInstitucion IS NULL) AND (tblInstitucion.bParticipa = 1) AND (tblInstitucion.iIdEstado = 11)
            GROUP BY tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto) ConArchivo
                      RIGHT OUTER JOIN
                      tblInstitucion ON ConArchivo.nIdInstitucion = tblInstitucion.nIdInstitucion
                      where tblInstitucion.bParticipa = 1 AND tblInstitucion.iIdEstado = 11
        
    
    --DECLARAR CURSOR PARA UTILIZAR MAS ADELANTE
    DECLARE cursor_instituciones CURSOR FOR
    SELECT nIdInstitucion,vcNombreCorto,iCorrelativoAfiliado,iCorrelativoDeuda,iCorrelativoConsolidacion
    FROM @iInstitucionesParticipantes
    FOR  read only
    
  END
  
  -- LIMPIAR ARCHIVOS DE CONSOLIDACION PROPUESTA CARTERAS (OK)
  BEGIN
  -- CONTROL DE PROCESO = LIMPIANDO ARCHIVOS DE CONSOLIDACION
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Limpiando archivos de consolidacion propuesta cartera'
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
  -- BUSCAR ARCHIVOS DE CONSOLIDACION Y LIMPIAR,  en bloques de 10.000 registros
    -- LIMPIANDO DETALLE CONSOLIDACION
    while (1=1)
    begin
      delete top(10000) from tblConsolidacionCarteraDetalle where nPeriodo=@iPeriodo
      if @@ROWCOUNT=0 break
    end
      
    -- LIMPIANDO CABECERA CONSOLIDACION
    while (1=1)
    begin
      delete top(10000) from tblConsolidacionCarteraCabecera where nPeriodo=@iPeriodo
      if @@ROWCOUNT=0 break
    end   
  END
  
  -- MARCAR REGISTROS CON AFILIADO EN MISMA CAJA (OK)
  BEGIN
    -- CONTROL DE PROCESO = MARCANDO REGISTROS CON AUTORUT  
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Descartando registros con RUT deudor en misma caja'
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
  -- MARCAR AUTORUT     
    OPEN cursor_instituciones
    FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativoAfiliado,@iCorrelativoDeuda,@iCorrelativoConsolidacion    
    WHILE @@FETCH_STATUS = 0  
    BEGIN                 
        --DESHABILITAR TODOS LOS REGISTROS AUTOREFERENTES CAMBIANDOLES ATRIBUTO ENPLANILLADO
      update tblDeudaDetalle set vcEmplanillado='AR'
      where
      nIdInstitucion=@iIdInstitucion and nPeriodo=@iPeriodo and iCorrelativo=@iCorrelativoDeuda
      --and vcNumPagare in (SELECT tblDeudaDetalle.vcNumPagare
      and vcIdentificadorDeudor  in (SELECT tblDeudaDetalle.vcIdentificadorDeudor 
        FROM tblDeudaDetalle INNER JOIN
                tblAfiliadoDetalle ON tblDeudaDetalle.vcIdentificadorDeudor = tblAfiliadoDetalle.vcIdentificadorAfiliado
                and tblDeudaDetalle.nPeriodo = tblAfiliadoDetalle.nPeriodo
        WHERE 
        tblDeudaDetalle.vcEmplanillado = N'SI' and 
        tblDeudaDetalle.nIdInstitucion = @iIdInstitucion and
        tblDeudaDetalle.iCorrelativo = @iCorrelativoDeuda
        AND 
        tblAfiliadoDetalle.iCorrelativo=@iCorrelativoAfiliado and
        tblAfiliadoDetalle.nIdInstitucion = @iIdInstitucion AND 
        tblDeudaDetalle.nPeriodo = @iPeriodo 
        )
               
      FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativoAfiliado,@iCorrelativoDeuda,@iCorrelativoConsolidacion
    END  

    CLOSE cursor_instituciones      
  END
  
  -- INSERTAR CABECERA DE CONSOLIDACION (OK)
  begin
  -- CONTROL DE PROCESO = MARCANDO REGISTROS CON AUTORUT  
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Generando cabeceras de consolidacion de propuesta de cartera'
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
  -- INSERTANDO/ACUALIZANDO CABECERAS   
    OPEN cursor_instituciones
    FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativoAfiliado,@iCorrelativoDeuda,@iCorrelativoConsolidacion
    WHILE @@FETCH_STATUS = 0  
    BEGIN  
    
    if @iCorrelativoConsolidacion is NULL set @iCorrelativoConsolidacion =1
    
    
    INSERT INTO tblConsolidacionCarteraCabecera
         (nIdInstitucion,nPeriodo,dFechaIng
         ,vcLinkPropuesta,iCorrelativo,nNroDeudores)
    VALUES( 
         @iIdInstitucion
         ,@iPeriodo
         ,@dFechahoraConsolidacion                  
         ,'' -- vcLinkPropuesta         
         ,@iCorrelativoConsolidacion + 1 
         ,0 --nNroDedudores
        )
      FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativoAfiliado,@iCorrelativoDeuda,@iCorrelativoConsolidacion
    END  
    CLOSE cursor_instituciones  
    
  end
    

  -- GENERAR detalle consolidacion (OK)
  BEGIN
    -- CONTROL DE PROCESO = GENERANDO PROPUESTAS
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Generando informacion de propuestas'
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
  -- GENERAR DETALLE CONSOLIDACION
  
    OPEN cursor_instituciones
    FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativoAfiliado,@iCorrelativoDeuda,@iCorrelativoConsolidacion
    WHILE @@FETCH_STATUS = 0  
    BEGIN 
   
    
     
      --DECLARAR CURSOR PARA RECORRER DEUDA,  ESTE CURSOR RETORNA LOS DATOS LISTOS PARA INSERTAR
      DECLARE cursor_deuda CURSOR FOR         
        SELECT     COUNT(*) AS cantidad, MAX(afiliados_activos.nIdInstitucion) AS nIdInstitucion, tblDeudaDetalle.nperiodo , 
          tblDeudaDetalle.nIdInstitucion AS nIdCajaOrigen, tblDeudaDetalle.vcNumPagare, MAX(afiliados_activos.vcRutEmpresa) AS vcRutEmpresa, 
          tblDeudaDetalle.vcIdentificadorDeudor AS vcIdentificadorDeudor, max(tblDeudaDetalle.tIdTipoIdentificador), 
		  coalesce(MAX(afiliados_activos.vcNombreAfiliado) ,'')
          AS vcNombreDeudor, coalesce(MAX(afiliados_activos.tIdTipoAfiliado),
		  max(tblDeudaDetalle.tIdTipoAfiliado)) AS tIdTipoAfiliado, 'D' AS cSujetoDescuento, 
		  tblDeudaDetalle.nMontoOfertaColocacion, tblDeudaDetalle.vcFechaColocacion,tblDeudaDetalle.vcFechaPrimerImpago,
                  max(tblDeudaDetalle.vcRutAval_1) as vcRutAval_1, max(tblDeudaDetalle.vcRutAval_2) as vcRutAval_2, max(tblDeudaDetalle.vcRutAval_3) as vcRutAval_3, tblDeudaDetalle.vcTipoDeuda as vcTipoDeuda,tblDeudaDetalle.nSaldoCapital as nSaldoCapital,
          case when ISDATE(tblDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblDeudaDetalle.vcFechaPrimerImpago) else    null end as dFechaPrimerImpago
		 
        FROM
          (
          SELECT     instituciones.nperiodo, instituciones.nIdInstitucion, instituciones.iCorrelativoAfiliado, instituciones.icorrelativoDeuda, 
          tblAfiliadoDetalle.vcIdentificadorAfiliado, tblAfiliadoDetalle.tIdTipoIdentificador, tblAfiliadoDetalle.vcRutEmpresa, 
          tblAfiliadoDetalle.vcNombreAfiliado, tblAfiliadoDetalle.tIdTipoAfiliado
          FROM (
            select nPeriodo ,nIdInstitucion ,vcNombreCorto ,iCorrelativoAfiliado ,iCorrelativoDeuda from @iInstitucionesParticipantes
            ) AS instituciones 
            INNER JOIN tblAfiliadoDetalle ON instituciones.nIdInstitucion = tblAfiliadoDetalle.nIdInstitucion AND instituciones.nperiodo = tblAfiliadoDetalle.nPeriodo AND instituciones.iCorrelativoAfiliado = tblAfiliadoDetalle.iCorrelativo
          ) 
          AS afiliados_activos 
          RIGHT OUTER JOIN tblDeudaDetalle ON afiliados_activos.vcIdentificadorAfiliado = tblDeudaDetalle.vcIdentificadorDeudor AND afiliados_activos.tIdTipoIdentificador = tblDeudaDetalle.tIdTipoIdentificador AND afiliados_activos.nperiodo = tblDeudaDetalle.nPeriodo           
          right join 
          (
            select nPeriodo ,nIdInstitucion ,vcNombreCorto ,iCorrelativoAfiliado ,iCorrelativoDeuda from @iInstitucionesParticipantes
            ) AS instituciones2 
          ON tblDeudaDetalle.nIdInstitucion = instituciones2.nIdInstitucion and tblDeudaDetalle.iCorrelativo =instituciones2.iCorrelativoDeuda
          where --tblDeudaDetalle.vcEmplanillado='SI'and  NO SE REQUIERE QUE ESTE EMPLANILLADO PARA OFRECER COMPRA DE CARTERA
          tblDeudaDetalle.nIdInstitucion = @iIdInstitucion AND tblDeudaDetalle.nperiodo = @iPeriodo 
          GROUP BY tblDeudaDetalle.iCorrelativo , tblDeudaDetalle.vcEmplanillado,tblDeudaDetalle.nIdInstitucion, tblDeudaDetalle.nperiodo, tblDeudaDetalle.vcIdentificadorDeudor, afiliados_activos.tIdTipoIdentificador, tblDeudaDetalle.vcNumPagare, tblDeudaDetalle.nMontoOfertaColocacion, tblDeudaDetalle.vcFechaColocacion,tblDeudaDetalle.vcFechaPrimerImpago, tblDeudaDetalle.vcTipoDeuda, tblDeudaDetalle.nSaldoCapital,tblDeudaDetalle.vcFechaColocacion
          HAVING (MAX(afiliados_activos.nIdInstitucion) <> @iIdInstitucion) OR (tblDeudaDetalle.nIdInstitucion = @iIdInstitucion) AND (MAX(afiliados_activos.nIdInstitucion) IS NULL)       
        for read only

      OPEN cursor_deuda 
        FETCH NEXT FROM cursor_deuda  INTO    
        @iCantidad ,@iIdInstitucionDestino,@iPeriodoDeuda ,@iIdCajaOrigen ,@vcNumPagare ,@vcRutEmpresa ,@vcIdentificadorDeudor ,@iIdTipoIdentificador ,@vcNombreDeudor ,@iIdTipoAfiliado , @vcSujetoDescuento ,@nMontoOfertaColocacion, @vcFechaColocacion ,  @vcFechaPrimerImpago,@vcRutAval_1 ,@vcRutAval_2,@vcRutAval_3,@vcTipoDeuda,@nSaldoCapital, @dFechaPrimerImpago
        
        select @vcTipoDeuda;
  
        WHILE @@FETCH_STATUS = 0  
        BEGIN  
          --VERIFICAR EL TIPO DE REGISTRO OBTENIDO
          if @iCantidad=1 and @iIdInstitucionDestino is not null
          begin
          --Deudor encontrado en otra caja,  se inserta registro normalmente
            set @vcSujetoDescuento = 'D'
            select @iIdConsolidacionDetalle=MAX(nIdConsolidacionDetalle)+1 
            from dbo.tblConsolidacionDetalle where nIdInstitucion=@iIdInstitucionDestino and nPeriodo=@iPeriodo                     
        
            if @iIdConsolidacionDetalle is NULL set @iIdConsolidacionDetalle =1
            
            INSERT INTO dbo.tblConsolidacionCarteraDetalle                
                 (nIdConsolidacionDetalle, nPeriodo,              nIdCajaOrigen
                 ,nIdCajaDestino,          vcNumPagare,           vcRutEmpresa
                 ,vcIdentificadorDeudor,   tIdTipoIdentificador,  vcNombreDeudor
                 ,tIdTipoAfiliado,         vcRutAval,             cSujetoDescuento

                 ,cIdentificador,          nMontoOferta,          nMontoFinalCompra
                 ,vcFechaCompra,           vcFechaImpago,         nSaldoCapital
                 , dFechaPrimerImpago,vcFechaColocacion)


             VALUES
                 (@iIdConsolidacionDetalle,@iPeriodo, @iIdCajaOrigen,
                 @iIdInstitucionDestino, @vcNumPagare,@vcRutEmpresa,                 
                 @vcIdentificadorDeudor,@iIdTipoIdentificador,@vcNombreDeudor,
                 @iIdTipoAfiliado,NULL,@vcSujetoDescuento,                 
                 @vcTipoDeuda,  @nMontoOfertaColocacion ,0,
                 NULL,           @vcFechaPrimerImpago,         @nSaldoCapital
                 , @dFechaPrimerImpago,@vcFechaColocacion)
          end
          else if @iCantidad=1 and @iIdInstitucionDestino is null
          begin
            --Deudor no encontrado en otras cajas,  Buscar los Avales
            --************************************************************            
            -- SE OBTIENE EL RUT DEL AVAL CON MAYOR SUELDO EN OTRAS INSTITUCIONES           
            set @vcSujetoDescuento = 'A'
            -- VERIFICACION RAPIDA DE QUE VIENE AL MENOS UN CAMPO AVAL
            if @vcRutAval_1<>'' or @vcRutAval_2<>''or @vcRutAval_3<>''
            begin
              select @iIdConsolidacionDetalle=coalesce(MAX(nIdConsolidacionDetalle),0)
              from tblConsolidacionDetalle where nIdInstitucion=@iIdInstitucionDestino and nPeriodo=@iPeriodo    


              INSERT INTO dbo.tblConsolidacionCarteraDetalle
              (nIdConsolidacionDetalle,nPeriodo,nIdCajaOrigen,nIdCajaDestino
              ,vcNumPagare,vcRutEmpresa,vcIdentificadorDeudor,tIdTipoIdentificador
              ,vcNombreDeudor,tIdTipoAfiliado,vcRutAval,cSujetoDescuento
              ,cIdentificador,nMontoOferta,nMontoFinalCompra,vcFechaCompra
              ,vcFechaImpago,nSaldoCapital, dFechaPrimerImpago,vcFechaColocacion)                         
              SELECT @iIdConsolidacionDetalle+ row_number() over (order by tblAfiliadoDetalle.nIdInstitucion ) iIdConsolidacionDetalle,     @iPeriodo nPeriodo, @iIdInstitucion nIdCajaOrigen
                 ,instituciones.nIdInstitucion nIdCajaDestino,          @vcNumPagare vcNumPagare, max(vcRutEmpresa) vcRutEmpresa
                 ,@vcIdentificadorDeudor vcIdentificadorDeudor,   @iIdTipoIdentificador tIdTipoIdentificador,   max(vcNombreAfiliado) vcNombreAfiliado
                 ,max(tIdTipoAfiliado),   tblAfiliadoDetalle.vcIdentificadorAfiliado vcRutAval,             'A' cSujetoDescuento
                 ,@vcTipoDeuda cIdentificador,          @nMontoOfertaColocacion nMontoOferta,          0 nMontoFinalCompra
                 ,NULL vcFechaCompra,           @vcFechaPrimerImpago vcFechaImpago, @nSaldoCapital nSaldoCapital, @dFechaPrimerImpago,@vcFechaColocacion
                 FROM (
                 select nPeriodo ,nIdInstitucion ,vcNombreCorto ,iCorrelativoAfiliado ,iCorrelativoDeuda from @iInstitucionesParticipantes
                 ) AS instituciones 
                 INNER JOIN tblAfiliadoDetalle ON instituciones.nIdInstitucion = tblAfiliadoDetalle.nIdInstitucion AND instituciones.nperiodo = tblAfiliadoDetalle.nPeriodo AND instituciones.iCorrelativoAfiliado = tblAfiliadoDetalle.iCorrelativo
                 where instituciones.nPeriodo=@iPeriodo and 
                 instituciones.nIdInstitucion<>@iIdInstitucion 
                 and (vcIdentificadorAfiliado=@vcRutAval_1 or vcIdentificadorAfiliado=@vcRutAval_2 or vcIdentificadorAfiliado=@vcRutAval_3) and tblAfiliadoDetalle.tIdTipoIdentificador=1 				 
				 group by tblAfiliadoDetalle.nIdInstitucion,instituciones.nIdInstitucion,tblAfiliadoDetalle.vcIdentificadorAfiliado
            end
            
          end
          else if @iCantidad>1 and @iIdInstitucionDestino is not null
          begin
            --Deudor encontrado en varias cajas,  se debe insertar en todas las cajas donde fue encontrado
            --********************************************************************************************
            
             select @iIdConsolidacionDetalle=coalesce(MAX(nIdConsolidacionDetalle),1)
             from tblConsolidacionDetalle where nIdInstitucion=@iIdInstitucionDestino and nPeriodo=@iPeriodo    


             INSERT INTO dbo.tblConsolidacionCarteraDetalle
             (nIdConsolidacionDetalle,nPeriodo,nIdCajaOrigen,nIdCajaDestino
             ,vcNumPagare,vcRutEmpresa,vcIdentificadorDeudor,tIdTipoIdentificador
             ,vcNombreDeudor,tIdTipoAfiliado,vcRutAval,cSujetoDescuento
             ,cIdentificador,nMontoOferta,nMontoFinalCompra,vcFechaCompra
             ,vcFechaImpago,nSaldoCapital,dFechaPrimerImpago,vcFechaColocacion)                         
             SELECT @iIdConsolidacionDetalle+ row_number() over (order by tblAfiliadoDetalle.nIdInstitucion ) iIdConsolidacionDetalle,     @iPeriodo nPeriodo, @iIdInstitucion nIdCajaOrigen
                 ,instituciones.nIdInstitucion nIdCajaDestino,          @vcNumPagare vcNumPagare,  max(vcRutEmpresa)
                 ,@vcIdentificadorDeudor vcIdentificadorDeudor,   @iIdTipoIdentificador tIdTipoIdentificador,   max (vcNombreAfiliado) vcNombreAfiliado
                 ,max(tIdTipoAfiliado), NULL vcRutAval, 'D' cSujetoDescuento
                 ,@vcTipoDeuda cIdentificador, @nMontoOfertaColocacion nMontoOferta, 0 nMontoFinalCompra
                 ,NULL vcFechaCompra, @vcFechaPrimerImpago vcFechaImpago, @nSaldoCapital nSaldoCapital, @dFechaPrimerImpago,@vcFechaColocacion
                 FROM (
                 select nPeriodo ,nIdInstitucion ,vcNombreCorto ,iCorrelativoAfiliado ,iCorrelativoDeuda from @iInstitucionesParticipantes
                 ) AS instituciones 
                 INNER JOIN tblAfiliadoDetalle ON instituciones.nIdInstitucion = tblAfiliadoDetalle.nIdInstitucion AND instituciones.nperiodo = tblAfiliadoDetalle.nPeriodo AND instituciones.iCorrelativoAfiliado = tblAfiliadoDetalle.iCorrelativo
                 where instituciones.nPeriodo=@iPeriodo and 
                 instituciones.nIdInstitucion<>@iIdInstitucion 
                 and (tblAfiliadoDetalle.vcIdentificadorAfiliado=@vcIdentificadorDeudor and tblAfiliadoDetalle.tIdTipoIdentificador=@iIdTipoIdentificador)            
                 group by tblAfiliadoDetalle.nIdInstitucion,instituciones.nIdInstitucion
          end
        
          FETCH NEXT FROM cursor_deuda  INTO    
          @iCantidad ,@iIdInstitucionDestino,@iPeriodoDeuda ,@iIdCajaOrigen ,@vcNumPagare ,@vcRutEmpresa ,@vcIdentificadorDeudor ,@iIdTipoIdentificador ,@vcNombreDeudor ,@iIdTipoAfiliado , @vcSujetoDescuento ,@nMontoOfertaColocacion, @vcFechaColocacion ,  @vcFechaPrimerImpago,@vcRutAval_1 ,@vcRutAval_2,@vcRutAval_3,@vcTipoDeuda,@nSaldoCapital, @dFechaPrimerImpago
        END 
        close cursor_Deuda
        deallocate cursor_Deuda
      FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativoAfiliado,@iCorrelativoDeuda,@iCorrelativoConsolidacion
    END  
    CLOSE cursor_instituciones                  
  END
  
  
  -- INSERTAR EN RESUMEN CONSOLIDACION y ACTUALIZAR CABECERA (PDTE)
  begin
    --insertar resumen de consolidacion
    INSERT INTO tblResumenConsolidacion
    (nPeriodo,dFechaRegistro,iIdCajaOrigen,iIdCajaDestino,nTotalRegistros,nTotalSaldo,nMontoCobrar,nMontoPagado)
    SELECT nPeriodo, @dFechahoraConsolidacion AS FechaRegistro, nIdCajaOrigen AS IdCajaOrigen, nIdCajaDestino AS idCajaDestino, COUNT(*) AS nroRegistros, 
                      SUM(nsaldoCapital) AS Saldo, SUM(nMontoOferta) AS MontoCobrar, SUM(nMontoFinalCompra) as nMontopagado
    FROM         tblConsolidacionCarteraDetalle
    where (nPeriodo = @iPeriodo)
    GROUP BY nIdCajaDestino, nPeriodo, nIdCajaOrigen
    
    
    -- Actualizar totales en cabecera
    update t1
    set t1.nNroDeudores=t2.nroRegistros
    from tblConsolidacionCarteraCabecera t1 inner join 
    (SELECT nIdCajaDestino ,COUNT(distinct vcIdentificadorDeudor) AS nroRegistros                      
    FROM         tblConsolidacionCarteraDetalle
    where nPeriodo = @iPeriodo 
    GROUP BY nIdCajaDestino) t2
    on t1.nIdInstitucion=t2.nIdCajaDestino
    where t1.nPeriodo=@iPeriodo 
        
  end


  -- EJECUCION EXITOSA (OK)
  BEGIN
    deallocate cursor_instituciones
    -- CONTROL DE PROCESO = FINALIZACION DE CONSOLIDACION DE DEUDA
    UPDATE tblControlProceso
    SET iIdEstado=24 ,vcDetalle='Consolidacion de propuesta de cartera efectuada exitosamente',
    dFechaFin=GETDATE()
    WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@iPeriodo
    
    -- Se marca registro de consolidacion como finalizado
    update tblRegistroConsolidacion
    set iIdEstado=27
    where nPeriodo=@iPeriodo and dFechaRegistro=@dFechahoraConsolidacion
    
    
    set @iCodError = 0;
    set @vcMsjError = 'Consolidacion de propuesta de cartera efectuada exitosamente';  
    return
  END

  end
GO

GO
--SqlScripter----[dbo].[spConsolidaRecaudacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsolidaRecaudacion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsolidaRecaudacion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 23-07-2013
-- Update date: 26-08-2013 - GRN
-- Description: Realiza la consolidacion de recaudacion
-- 
-- Posibles salidas:          
--   0 OK - Se ha realizado la consolidacion OK
--   -3 NOK - (VERIFICACION ARCHIVOS) Faltan archivos recaudacion
--   -4 NOK - OTROS
--   -5 NOK - Parametros incorrectos

-- =============================================
ALTER PROCEDURE [dbo].[spConsolidaRecaudacion]
@iPeriodo int = 0,  
  @iIdUsuario as int,
  @vcTipoEjecucion varchar(1),
  @iCodError int = 0 out, 
  @vcMsjError varchar(50) = 'OK' out  
AS
declare
  @iId_control_proceso as int,
  @iCant_instituciones_participantes as int,    
  @iCant_instituciones_consolidadas as int=0,
  @dFechahora_consolidacion as datetime,
  @iIdInstitucion as int,
  @vcNombreCorto as nvarchar(10),
  @iCorrelativoRecaudacion as int,  
  @iCantRegistros as int,
  @dFechaIng as datetime,
  @iCorrelativoFueraPlazo as int  
declare
  @tInstitucionesParticipantes TABLE
    (
    iPeriodo int,
    iIdInstitucion int,
    vcNombreCorto nvarchar(10),
    iCorrelativoRecaudacion int   
    ) 
BEGIN
  -- VALIDAR PERIODO,  ES NECESARIO QUE SEA VALIDO PARA QUE SE PUEDA REALIZAR EL RESTO DEL PROCESO
  select @iCantRegistros=count(*) from tblperiodo where nperiodo=@iPeriodo
  if @iCantRegistros=0
  begin
    set @iCodError = -4;
    set @vcMsjError = 'PERIODO INDICADO INEXISTENTE'; 
    return
  end
  
  
  -- OBTENER ID DE CONTROL DE PROCESO E INSERTAR NUEVO REGISTRO (OK)  
  -- TAMBIEN SE INSERTA REGISTROCONSOLIDACION
  BEGIN
    -- CONTROL DE PROCESO, OBTENER ID DE CONTROL DE PROCESO
    SELECT     @iId_control_proceso = MAX(nIdControlProceso) +1
    FROM         tblControlProceso
    WHERE     (nPeriodo = @iPeriodo)
        
    -- En caso de que no hallan procesos para el periodo actual,  generar ID 1
    if @iId_control_proceso is null
    begin
      select @iId_control_proceso=1
    end
    
    -- INSERTAR REGISTRO DE CONTROL DE PROCESO
    INSERT INTO tblControlProceso
         (nIdControlProceso,nPeriodo,dFechaInicio,dFechaFin
         ,iIdEstado,iIdTipoControlProceso,vcDetalle)
     VALUES
         (@iId_control_proceso
         ,@iPeriodo
         ,GETDATE() --FECHA INICIO
         ,GETDATE() -- FECHA TERMINO
         ,22 -- ESTADO INICIADO
         ,2 -- CONSOLIDACION RECAUDACION
         ,'Ejecutada consolidacion de recaudacion')
    -- Tambien Insertar registro de consolidacion
    select @dFechahora_consolidacion=GETDATE()
    INSERT INTO tblRegistroConsolidacion
                      (nPeriodo, dFechaRegistro, iRutUsuario, vcTipoEjecucion, vcTipoConsolidacion, iIdEstado)
    VALUES     (@iPeriodo, @dFechahora_consolidacion, @iIdUsuario, N'A', N'CR', N'26')
    
  end
  
  -- VERIFICANDO FACTIBILIDAD DE CONSOLIDACION DE RECAUDACION (OK)  
  begin
  -- CONTROL DE PROCESO = VERIFICANDO FACTIBILIDAD
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Verificando Factibilidad de consolidacion de Recaudacion'
    WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo

  -- REVERIFICAR QUE ES FACTIBLE CONSOLIDAR
  
    EXEC  [dbo].[spVerificaEnvioArchivos]
    @iPeriodo = @iPeriodo,
    @vctipoCons = N'CR',
    @iCodError = @iCodError OUTPUT,
    @vcMsjError = @vcMsjError OUTPUT
    if @iCodError<>0
    begin
      if @vcTipoEjecucion = 'A'
	  BEGIN
	  --VERIFICACION ERRONEA SE ABORTA EJECUCION
        UPDATE tblControlProceso
        SET iIdEstado=25 ,vcDetalle='Consolidacion recaudacion abortada,  no pasa verificacion de envio de archivos'
        WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo
	  
	    declare cursor_instituciones_fuera_plazo cursor for
				select tblInstitucion.nIdInstitucion from 
				(SELECT tblInstitucion.nIdInstitucion,
					  MAX(CASE WHEN vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AR' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoR
				FROM      vwUltimoArchivoEnviadoValidado RIGHT OUTER JOIN
							tblInstitucion ON vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblInstitucion.nIdInstitucion
				WHERE      (vwUltimoArchivoEnviadoValidado.nPeriodo = @iPeriodo) OR
							(vwUltimoArchivoEnviadoValidado.nIdInstitucion IS NULL) AND (tblInstitucion.bParticipa = 1) AND (tblInstitucion.iIdEstado = 11)
				GROUP BY tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto) ConArchivo
						  RIGHT OUTER JOIN
						  tblInstitucion ON ConArchivo.nIdInstitucion = tblInstitucion.nIdInstitucion
						  where tblInstitucion.bParticipa = 1 AND tblInstitucion.iIdEstado = 11 and (iCorrelativoR is null or iCorrelativoR=0)                      
				for read only

				--Abrir cursor de instituciones fuera de plazo para insertar sus registros en tabla de cierres fuera de plazo
	  	  
		  OPEN cursor_instituciones_fuera_plazo
		  FETCH NEXT FROM cursor_instituciones_fuera_plazo INTO @iIdInstitucion 
	  
				select @iCorrelativoFueraPlazo=coalesce(MAX(iidcierreplazo) + 1,1) from tblCierreFueraPlazo where nPeriodo=@iPeriodo 
				WHILE @@FETCH_STATUS = 0  
				BEGIN 								
					-- Insertar registro
					insert into tblCierreFueraPlazo (iidcierreplazo,nPeriodo,nIdInstitucion) values (@iCorrelativoFueraPlazo,@iPeriodo,@iIdInstitucion)
					select @iCorrelativoFueraPlazo=@iCorrelativoFueraPlazo+1
					FETCH NEXT FROM cursor_instituciones_fuera_plazo INTO @iIdInstitucion 
				END
		  close cursor_instituciones_fuera_plazo
		  deallocate cursor_instituciones_fuera_plazo
		END
	  UPDATE tblControlProceso      
	  SET iIdEstado=25 ,vcDetalle='Consolidacion de compra de cartera abortada,  no pasa verificacion de envio de archivos'
	  WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo
      return
    end
  -- VERIFICAR SI EXISTEN REGISTROS DE CONSOLIDACION  
    SELECT @iCant_instituciones_consolidadas= COUNT(*)
      FROM tblConsolidacionCabecera
      where nIdInstitucion=@iPeriodo
    
    -- En caso de que no hallan procesos para el periodo actual,  generar ID 1
    if @iCant_instituciones_consolidadas is null
    begin
      set @iCodError = -4;
      set @vcMsjError = 'No hay datos de consolidacion de deudas para actualizar en este proceso(Recaudacion)'; 
      --2DA VERIFICACION ERRONEA SE ABORTA EJECUCION
      UPDATE tblControlProceso
      SET iIdEstado=25 ,vcDetalle='No hay datos de consolidacion de deudas'
      WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo
      return
    end
    
    
    
    
  end
  
  
  
  
  
    
  -- OBTENER LISTA DE CAJAS PARTICIPANTES (OK)  
  BEGIN   
    -- CONTROL DE PROCESO = OBTENIENDO LISTA DE CAJAS PARTICIPANTES
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Obteniendo lista de cajas participantes'
    WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo   
    -- Obtener lista de cajas participantes para el periodo y sus archivos de recaudacion
    --*********************************************************************************************
    insert into @tInstitucionesParticipantes
      (iPeriodo,iIdInstitucion ,vcNombreCorto,iCorrelativoRecaudacion )
    SELECT     @iPeriodo,tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto, 
                   MAX(CASE WHEN vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AR' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoRecaudacion
    FROM         vwUltimoArchivoEnviadoValidado RIGHT OUTER JOIN
                   tblInstitucion ON vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblInstitucion.nIdInstitucion
    WHERE     (vwUltimoArchivoEnviadoValidado.nPeriodo = @iPeriodo) OR
                   (vwUltimoArchivoEnviadoValidado.nIdInstitucion IS NULL and tblInstitucion.bParticipa=1 and tblInstitucion.iIdEstado=11)
    GROUP BY tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto
        
    
    --DECLARAR CURSOR PARA UTILIZAR MAS ADELANTE
    DECLARE cursor_instituciones CURSOR FOR  
    SELECT iIdInstitucion,vcNombreCorto,iCorrelativoRecaudacion
    FROM @tInstitucionesParticipantes
    for read only
    
  END
        
  
  -- GENERAR detalle consolidacion (PDTE)
  BEGIN
    -- CONTROL DE PROCESO = GENERANDO ALERTAS   
    UPDATE tblControlProceso
    SET iIdEstado=23 ,vcDetalle='Actualizando registros de consolidacion con recaudacion'
    WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo
  -- GENERAR DETALLE CONSOLIDACION
  
  
  
  
      --RECORRER CURSOR DE INSTITUCIONES
    OPEN cursor_instituciones
    FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativorecaudacion
    WHILE @@FETCH_STATUS = 0  
    BEGIN      
      if @iCorrelativoRecaudacion<>0
      begin
        UPDATE tblConsolidacionDetalle
        SET 
        nMontoPagado=0, vcFechaPago=NULL  
        where nIdInstitucion=@iIdInstitucion and nPeriodo=@iPeriodo 
        
        UPDATE tblConsolidacionDetalle
        SET 
        nMontoPagado=trd.nMontoPagado, vcFechaPago=trd.vcFechaPago      
        FROM  tblRecaudacionDetalle AS trd INNER JOIN
                      tblConsolidacionDetalle tcd ON trd.nIdInstitucion = tcd.nIdInstitucion AND trd.nPeriodo = tcd.nPeriodo AND 
                      trd.vcNumPagare = tcd.vcNumPagare and trd.vcIdentificadorDeudor = tcd.vcIdentificadorDeudor
        where trd.nPeriodo=@iPeriodo and trd.nIdInstitucion= @iIdInstitucion and trd.iCorrelativo=@iCorrelativoRecaudacion
        
      end
    
    FETCH NEXT FROM cursor_instituciones INTO @iIdInstitucion,@vcNombreCorto,@iCorrelativoRecaudacion     
    END  
    CLOSE cursor_instituciones                  
    
  END
  
  

  -- INSERTAR EN RESUMEN CONSOLIDACION y ACTUALIZAR CABECERA (OK)
  begin 
    
    --insertar resumen de consolidacion GRN
    INSERT INTO tblResumenConsolidacion
    (nPeriodo,dFechaRegistro,iIdCajaOrigen,iIdCajaDestino,nTotalRegistros,nMontoCobrar,nMontoPagado)
    SELECT nPeriodo, 
        @dFechahora_consolidacion AS FechaRegistro, 
        nIdCajaOrigen AS IdCajaOrigen, 
        nIdInstitucion AS idCajaDestino, 
        COUNT(*) AS nroRegistros, 
                SUM(nMontoCobrar) AS MontoCobrar,
                SUM(nMontoPagado) AS MontoPagado
    FROM    tblConsolidacionDetalle
    WHERE nMontoPagado > 0
      AND nPeriodo = @iPeriodo
    GROUP BY nIdInstitucion, nPeriodo, nIdCajaOrigen
    
    -- Actualizar totales en cabecera
    update t1
    set t1.iCorrelativo=case when t1.dFechaRecaud IS null then 1 else t1.iCorrelativo+1 end,t1.nTotalSaldoCapital=t2.nTotalSaldo, t1.dFechaRecaud=@dFechahora_consolidacion
    from tblConsolidacionCabecera t1 inner join 
    (SELECT nIdInstitucion,@dFechahora_consolidacion AS FechaRegistro, nIdCajaOrigen AS IdCajaOrigen, nIdInstitucion AS idCajaDestino, COUNT(*) AS nroRegistros, 
                      SUM(nMontoCobrar) - SUM(nMontoPagado) AS nTotalSaldo
    FROM         tblConsolidacionDetalle
    where  nPeriodo = @iPeriodo
    GROUP BY nIdInstitucion, nPeriodo, nIdCajaOrigen    ) t2
    on t1.nIdInstitucion=t2.nIdInstitucion
    where t1.nPeriodo=@iPeriodo 
      
        
  end


  -- EJECUCION EXITOSA (OK)
  BEGIN
    deallocate cursor_instituciones
    -- CONTROL DE PROCESO = FINALIZACION DE CONSOLIDACION DE DEUDA
    UPDATE tblControlProceso
    SET iIdEstado=24 ,vcDetalle='Consolidacion de recaudacion efectuada exitosamente',
    dFechaFin=GETDATE()
    WHERE nIdControlProceso=@iId_control_proceso and nPeriodo=@iPeriodo
    
    -- Se marca registro de consolidacion como finalizado
    update tblRegistroConsolidacion
    set iIdEstado=27
    where nPeriodo=@iPeriodo and dFechaRegistro=@dFechahora_consolidacion
    
    
    
    set @iCodError = 0;
    set @vcMsjError = 'Consolidacion de recaudacion efectuada exitosamente';  
    return
  END
  
END
GO

GO
--SqlScripter----[dbo].[spConsultaAlertas].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaAlertas]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaAlertas] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    <MSC,,Mauricio Soto>
-- Create date: <21/06/2013>
-- Description:   <Obtiene Alertas>
-- Mod: Optimisa
-- Mod date: 27-07-2016
-- Description: Agrega en consulta de alerta el campo fecha de colocacion
-- Mod: MSB-IT
-- Mod date: 20-08-2021
-- Description: Se modifica alerta para no mostrar pensionados
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaAlertas]
@iPeriodo int,
      @iInstitucion int  ,
      @iCoderror int out,
      @vcMsjError varchar(50) out
AS
declare
@dFechaConsolidacion as datetime
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
    SET NOCOUNT ON;
    BEGIN TRY
     
      -- Obtener fecha de ejecuci├│n de la ultima consolidacion en estado v├ílido para el periodo
      SELECT     @dFechaConsolidacion = MAX(dFechaRegistro)
      FROM         tblRegistroConsolidacion
      GROUP BY nPeriodo, vcTipoEjecucion, vcTipoConsolidacion, iIdEstado
      HAVING      (nPeriodo = @iPeriodo) AND (iIdEstado = 27) AND (vcTipoConsolidacion = N'CD');
     
      if (@@ROWCOUNT=0)
            begin
                  select @iCoderror=-1
                  select @vcMsjError='1.- NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'    
            end  
      else
            begin
                  --Obtener la primera tabla,  totales por institucion y periodo
                  SELECT     iIdCajaOrigen, SUM(nTotalRegistros) AS Nro_Deudores, SUM(nMontoCobrar) AS Suma_monto
                  FROM         tblResumenConsolidacion
                  WHERE     (nPeriodo = @iPeriodo) AND (dFechaRegistro = @dFechaConsolidacion)
                  and (iIdCajaOrigen = @iInstitucion OR iIdCajaOrigen IS NULL)
                  GROUP BY iIdCajaOrigen
                  
                 
                  if (@@ROWCOUNT=0)
                  begin
                             select @iCoderror=-1
                             select @vcMsjError='2.- NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'   
                  end  
                        else
                  begin
                        -- Obtener segunda tabla,  resumenes
                        SELECT     IntsDestino.nIdInstitucion, IntsDestino.vcNombre AS Encontrado_En, isnull(tblResumenConsolidacion.nTotalRegistros,0) AS Nro_Deudores,
                                     isnull(tblResumenConsolidacion.nTotalSaldo,0) AS Suma_saldo, isnull(tblResumenConsolidacion.nMontoCobrar,0) AS Suma_monto
                        FROM         tblResumenConsolidacion RIGHT OUTER JOIN
                                     tblInstitucion AS IntsDestino ON tblResumenConsolidacion.iIdCajaDestino = IntsDestino.nIdInstitucion
                        WHERE     (tblResumenConsolidacion.nPeriodo = @iPeriodo) AND (tblResumenConsolidacion.dFechaRegistro = @dFechaConsolidacion) AND
                                     (tblResumenConsolidacion.iIdCajaOrigen = @iInstitucion) OR
                                     (tblResumenConsolidacion.iIdCajaOrigen IS NULL and IntsDestino.bParticipa=1)
                       
                       
                       
                        -- FILAS DE DETALLE
                        SELECT     tblConsolidacionDetalle.nIdCajaOrigen AS Caja_Origen, tblInstitucion_1.vcNombreCorto AS DCajaOrigen, tblConsolidacionDetalle.nIdInstitucion AS Caja_Destino,
                                                 tblInstitucion.vcNombreCorto AS DCaja_Destino, tblConsolidacionDetalle.vcNumPagare AS Num_pagare,
                                                 tblConsolidacionDetalle.vcRutEmpresa AS Rut_Empresa, tblConsolidacionDetalle.vcIdentificadorDeudor AS Id_Deudor,
                                                 tblConsolidacionDetalle.vcNombreDeudor AS Nombre_Deudor, tblConsolidacionDetalle.vcRutAval AS Id_Aval,
                                                 tblConsolidacionDetalle.cSujetoDescuento AS Sujeto_Descuento, tblConsolidacionDetalle.tIdTipoIdentificador AS tipo_Identificador,
                                                 tblConsolidacionDetalle.tIdTipoAfiliado AS Tipo_Afiliado, tblConsolidacionDetalle.nIdConsolidacionDetalle AS Identificador,
                                                 tblConsolidacionDetalle.nMontoCobrar,tblConsolidacionDetalle.vcFechaColocacion as vcFechaColocacion 
                        FROM         tblConsolidacionDetalle INNER JOIN
                                                 tblInstitucion ON tblConsolidacionDetalle.nIdInstitucion = tblInstitucion.nIdInstitucion INNER JOIN
                                                 tblInstitucion AS tblInstitucion_1 ON tblConsolidacionDetalle.nIdCajaOrigen = tblInstitucion_1.nIdInstitucion
                        WHERE     (tblConsolidacionDetalle.nPeriodo = @iPeriodo) 
                        		  AND (tblConsolidacionDetalle.nIdCajaOrigen  = @iInstitucion)
                        		  AND (tblConsolidacionDetalle.tIdTipoAfiliado IN (1,2,9) )
           
                        select @iCoderror=0
                        select @vcMsjError='3.- Consulta efectuada exitosamente'  
                  end
            end
    END TRY
    BEGIN CATCH
        SET @iCoderror = 1;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        return
    END CATCH
 
END
GO

GO
--SqlScripter----[dbo].[spConsultaAlertasNoEmpNoPen].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaAlertasNoEmpNoPen]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaAlertasNoEmpNoPen] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    RAV
-- Create date: 20-08-2021
-- Description: Despliegue de nuevas alertas : No emplanillado No pensionado
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaAlertasNoEmpNoPen]
@nPeriodo NUMERIC,
      @nInstitucion NUMERIC  ,
      @iCoderror int out,
      @vcMsjError varchar(50) out
AS
declare
@dFechaConsolidacion as datetime
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
    SET NOCOUNT ON;
    BEGIN TRY
     
      -- Obtener fecha de ejecuci├│n de la ultima consolidacion en estado v├ílido para el periodo
      SELECT     @dFechaConsolidacion = MAX(dFechaRegistro)
      FROM         tblRegistroConsolidacion
      WHERE      (nPeriodo = @nPeriodo) AND (iIdEstado = 27) AND (vcTipoConsolidacion = N'CD')
      GROUP BY nPeriodo, vcTipoEjecucion, vcTipoConsolidacion, iIdEstado;
     
      if (@@ROWCOUNT=0)
            begin
                  select @iCoderror=-1
                  select @vcMsjError='1.- NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'    
            end  
      else
            begin
                  --Obtener la primera tabla,  totales por institucion y periodo
                  SELECT nIdCajaOrigen AS iIdCajaOrigen, COUNT(*) AS Nro_Deudores, SUM(nMontoCobrar) AS Suma_monto
	 				FROM         tblConsolidacionDetallePensionado
    				where (nPeriodo = @nPeriodo) 
    				AND (tblConsolidacionDetallePensionado.vcEmplanillado  = 'NO')
                    AND (tblConsolidacionDetallePensionado.tIdTipoAfiliado IN (1,2,9) )
                    AND (nIdCajaOrigen = @nInstitucion OR nIdCajaOrigen IS NULL)
    				GROUP BY nIdCajaOrigen  
    				
                
                 
                  if (@@ROWCOUNT=0)
                  begin
                             select @iCoderror=-1
                             select @vcMsjError='2.- NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'   
                  end  
                        else
                  begin
                        -- Obtener segunda tabla,  resumenes
                        SELECT     IntsDestino.nIdInstitucion, IntsDestino.vcNombre AS Encontrado_En, 
                        			isnull(COUNT(tblConsolidacionDetallePensionado.nSaldoCapital),0) AS Nro_Deudores,
                                    isnull(SUM(tblConsolidacionDetallePensionado.nSaldoCapital),0) AS Suma_saldo, 
                                    isnull(SUM(tblConsolidacionDetallePensionado.nMontoCobrar) ,0) AS Suma_monto
                        FROM         tblConsolidacionDetallePensionado JOIN
                                     tblInstitucion AS IntsDestino ON tblConsolidacionDetallePensionado.nIdInstitucion = IntsDestino.nIdInstitucion
                        WHERE     	(tblConsolidacionDetallePensionado.nPeriodo = @nPeriodo) 
                        			AND (tblConsolidacionDetallePensionado.vcEmplanillado  = 'NO')
                    				AND (tblConsolidacionDetallePensionado.tIdTipoAfiliado IN (1,2,9) )
                        		   	AND (tblConsolidacionDetallePensionado.nIdCajaOrigen = @nInstitucion) 
                        			OR  (tblConsolidacionDetallePensionado.nIdCajaOrigen IS NULL and IntsDestino.bParticipa=1)
                        			
                  	GROUP BY IntsDestino.nIdInstitucion, IntsDestino.vcNombre
                       
                       
                        -- FILAS DE DETALLE
                        SELECT     tblConsolidacionDetallePensionado.nIdCajaOrigen AS Caja_Origen, tblInstitucion_1.vcNombreCorto AS DCajaOrigen, tblConsolidacionDetallePensionado.nIdInstitucion AS Caja_Destino,
                                                 tblInstitucion.vcNombreCorto AS DCaja_Destino, tblConsolidacionDetallePensionado.vcNumPagare AS Num_pagare,
                                                 tblConsolidacionDetallePensionado.vcRutEmpresa AS Rut_Empresa, tblConsolidacionDetallePensionado.vcIdentificadorDeudor AS Id_Deudor,
                                                 tblConsolidacionDetallePensionado.vcNombreDeudor AS Nombre_Deudor, tblConsolidacionDetallePensionado.vcRutAval AS Id_Aval,
                                                 tblConsolidacionDetallePensionado.cSujetoDescuento AS Sujeto_Descuento, tblConsolidacionDetallePensionado.tIdTipoIdentificador AS tipo_Identificador,
                                                 tblConsolidacionDetallePensionado.tIdTipoAfiliado AS Tipo_Afiliado, tblConsolidacionDetallePensionado.nIdConsolidacionDetalle AS Identificador,
                                                 tblConsolidacionDetallePensionado.nMontoCobrar,tblConsolidacionDetallePensionado.vcFechaColocacion as vcFechaColocacion 
                        FROM         tblConsolidacionDetallePensionado INNER JOIN
                                                 tblInstitucion ON tblConsolidacionDetallePensionado.nIdInstitucion = tblInstitucion.nIdInstitucion INNER JOIN
                                                 tblInstitucion AS tblInstitucion_1 ON tblConsolidacionDetallePensionado.nIdCajaOrigen = tblInstitucion_1.nIdInstitucion
                        WHERE     (tblConsolidacionDetallePensionado.nPeriodo = @nPeriodo) 
                        			AND (tblConsolidacionDetallePensionado.nIdCajaOrigen  = @nInstitucion)
                        			AND (tblConsolidacionDetallePensionado.vcEmplanillado  = 'NO')
                        			AND (tblConsolidacionDetallePensionado.tIdTipoAfiliado IN (1,2,9) )
           
                        select @iCoderror=0
                        select @vcMsjError='3.- Consulta efectuada exitosamente'   
                  end
            end
    END TRY
    BEGIN CATCH
        SET @iCoderror = 1;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        return
    END CATCH
 
END
GO

GO
--SqlScripter----[dbo].[spConsultaAlertasNoEmpPen].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaAlertasNoEmpPen]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaAlertasNoEmpPen] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    RAV
-- Create date: 20-08-2021
-- Description: Despliegue de nuevas alertas : No emplanillado Si pensionado
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaAlertasNoEmpPen]
@nPeriodo NUMERIC,
      @nInstitucion NUMERIC  ,
      @iCoderror int out,
      @vcMsjError varchar(50) out
AS
declare
@dFechaConsolidacion as datetime
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
    SET NOCOUNT ON;
    BEGIN TRY
     
      -- Obtener fecha de ejecuci├│n de la ultima consolidacion en estado v├ílido para el periodo
      SELECT     @dFechaConsolidacion = MAX(dFechaRegistro)
      FROM         tblRegistroConsolidacion
      WHERE      (nPeriodo = @nPeriodo) AND (iIdEstado = 27) AND (vcTipoConsolidacion = N'CD')
      GROUP BY nPeriodo, vcTipoEjecucion, vcTipoConsolidacion, iIdEstado;
     
      if (@@ROWCOUNT=0)
            begin
                  select @iCoderror=-1
                  select @vcMsjError='1.- NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'    
            end  
      else
            begin
                  --Obtener la primera tabla,  totales por institucion y periodo
                  SELECT nIdCajaOrigen AS iIdCajaOrigen, COUNT(*) AS Nro_Deudores, SUM(nMontoCobrar) AS Suma_monto
	 				FROM         tblConsolidacionDetallePensionado
    				where (nPeriodo = @nPeriodo) 
    				AND (tblConsolidacionDetallePensionado.vcEmplanillado  = 'NO')
                    AND (tblConsolidacionDetallePensionado.tIdTipoAfiliado NOT IN (1,2,9) )
                    AND (nIdCajaOrigen = @nInstitucion OR nIdCajaOrigen IS NULL)
    				GROUP BY nIdCajaOrigen  
    				
                  
                 
                  if (@@ROWCOUNT=0)
                  begin
                             select @iCoderror=-1
                             select @vcMsjError='2.- NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'   
                  end  
                        else
                  begin
                        -- Obtener segunda tabla,  resumenes
                        SELECT     IntsDestino.nIdInstitucion, IntsDestino.vcNombre AS Encontrado_En, 
                        			isnull(COUNT(tblConsolidacionDetallePensionado.nSaldoCapital),0) AS Nro_Deudores,
                                    isnull(SUM(tblConsolidacionDetallePensionado.nSaldoCapital),0) AS Suma_saldo, 
                                    isnull(SUM(tblConsolidacionDetallePensionado.nMontoCobrar) ,0) AS Suma_monto
                        FROM         tblConsolidacionDetallePensionado JOIN
                                     tblInstitucion AS IntsDestino ON tblConsolidacionDetallePensionado.nIdInstitucion = IntsDestino.nIdInstitucion
                        WHERE     	(tblConsolidacionDetallePensionado.nPeriodo = @nPeriodo) 
                        			AND (tblConsolidacionDetallePensionado.vcEmplanillado  = 'NO')
                    				AND (tblConsolidacionDetallePensionado.tIdTipoAfiliado NOT IN (1,2,9)) 
                        			AND (tblConsolidacionDetallePensionado.nIdCajaOrigen = @nInstitucion) 
                        			OR  (tblConsolidacionDetallePensionado.nIdCajaOrigen IS NULL and IntsDestino.bParticipa=1)
                        			
        							GROUP BY IntsDestino.nIdInstitucion, IntsDestino.vcNombre
                       
                       
                        -- FILAS DE DETALLE
                        SELECT     tblConsolidacionDetallePensionado.nIdCajaOrigen AS Caja_Origen, tblInstitucion_1.vcNombreCorto AS DCajaOrigen, tblConsolidacionDetallePensionado.nIdInstitucion AS Caja_Destino,
                                                 tblInstitucion.vcNombreCorto AS DCaja_Destino, tblConsolidacionDetallePensionado.vcNumPagare AS Num_pagare,
                                                 tblConsolidacionDetallePensionado.vcRutEmpresa AS Rut_Empresa, tblConsolidacionDetallePensionado.vcIdentificadorDeudor AS Id_Deudor,
                                                 tblConsolidacionDetallePensionado.vcNombreDeudor AS Nombre_Deudor, tblConsolidacionDetallePensionado.vcRutAval AS Id_Aval,
                                                 tblConsolidacionDetallePensionado.cSujetoDescuento AS Sujeto_Descuento, tblConsolidacionDetallePensionado.tIdTipoIdentificador AS tipo_Identificador,
                                                 tblConsolidacionDetallePensionado.tIdTipoAfiliado AS Tipo_Afiliado, tblConsolidacionDetallePensionado.nIdConsolidacionDetalle AS Identificador,
                                                 tblConsolidacionDetallePensionado.nMontoCobrar,tblConsolidacionDetallePensionado.vcFechaColocacion as vcFechaColocacion 
                        FROM         tblConsolidacionDetallePensionado INNER JOIN
                                                 tblInstitucion ON tblConsolidacionDetallePensionado.nIdInstitucion = tblInstitucion.nIdInstitucion INNER JOIN
                                                 tblInstitucion AS tblInstitucion_1 ON tblConsolidacionDetallePensionado.nIdCajaOrigen = tblInstitucion_1.nIdInstitucion
                        WHERE     (tblConsolidacionDetallePensionado.nPeriodo = @nPeriodo) 
                        			AND (tblConsolidacionDetallePensionado.nIdCajaOrigen  = @nInstitucion)
                        			AND (tblConsolidacionDetallePensionado.vcEmplanillado  = 'NO')
                        			AND (tblConsolidacionDetallePensionado.tIdTipoAfiliado NOT IN (1,2,9) )
           
                        select @iCoderror=0
                        select @vcMsjError='3.- Consulta efectuada exitosamente'   
                  end
            end
    END TRY
    BEGIN CATCH
        SET @iCoderror = 1;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        return
    END CATCH
 
END
GO

GO
--SqlScripter----[dbo].[spConsultaAlertasPen].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaAlertasPen]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaAlertasPen] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    RAV
-- Create date: 20-08-2021
-- Description: Despliegue de nuevas alertas : Si emplanillado Si pensionado
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaAlertasPen]
@nPeriodo NUMERIC,
      @nInstitucion NUMERIC  ,
      @iCoderror int out,
      @vcMsjError varchar(50) out
AS
declare
@dFechaConsolidacion as datetime
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
    SET NOCOUNT ON;
    BEGIN TRY
     
      -- Obtener fecha de ejecuci├│n de la ultima consolidacion en estado v├ílido para el periodo
      SELECT     @dFechaConsolidacion = MAX(dFechaRegistro)
      FROM         tblRegistroConsolidacion
      WHERE      (nPeriodo = @nPeriodo) AND (iIdEstado = 27) AND (vcTipoConsolidacion = N'CD')
      GROUP BY nPeriodo, vcTipoEjecucion, vcTipoConsolidacion, iIdEstado;
     
      if (@@ROWCOUNT=0)
            begin
                  select @iCoderror=-1
                  select @vcMsjError='1.- NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'    
            end  
      else
            begin
                  --Obtener la primera tabla,  totales por institucion y periodo
                  SELECT nIdCajaOrigen AS iIdCajaOrigen, COUNT(*) AS Nro_Deudores, SUM(nMontoCobrar) AS Suma_monto
	 				FROM         tblConsolidacionDetallePensionado
    				where (nPeriodo = @nPeriodo) 
    				AND (tblConsolidacionDetallePensionado.vcEmplanillado  = 'SI')
                    AND (tblConsolidacionDetallePensionado.tIdTipoAfiliado NOT IN (1,2,9))
                    AND (nIdCajaOrigen = @nInstitucion OR nIdCajaOrigen IS NULL)
    				GROUP BY nIdCajaOrigen  
    				
                
                 
                  if (@@ROWCOUNT=0)
                  begin
                             select @iCoderror=-1
                             select @vcMsjError='2.- NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'   
                  end  
                        else
                  begin
                        -- Obtener segunda tabla,  resumenes
                        SELECT     IntsDestino.nIdInstitucion, IntsDestino.vcNombre AS Encontrado_En, 
                        			isnull(COUNT(tblConsolidacionDetallePensionado.nSaldoCapital),0) AS Nro_Deudores,
                                    isnull(SUM(tblConsolidacionDetallePensionado.nSaldoCapital),0) AS Suma_saldo, 
                                    isnull(SUM(tblConsolidacionDetallePensionado.nMontoCobrar) ,0) AS Suma_monto
                        FROM         tblConsolidacionDetallePensionado JOIN
                                     tblInstitucion AS IntsDestino ON tblConsolidacionDetallePensionado.nIdInstitucion = IntsDestino.nIdInstitucion
                        WHERE     	(tblConsolidacionDetallePensionado.nPeriodo = @nPeriodo) 
                        			AND (tblConsolidacionDetallePensionado.vcEmplanillado  = 'SI')
                    				AND (tblConsolidacionDetallePensionado.tIdTipoAfiliado NOT IN (1,2,9) )
                        			AND (tblConsolidacionDetallePensionado.nIdCajaOrigen = @nInstitucion) 
                        			OR  (tblConsolidacionDetallePensionado.nIdCajaOrigen IS NULL and IntsDestino.bParticipa=1)
                        			
   	GROUP BY IntsDestino.nIdInstitucion, IntsDestino.vcNombre
                       
                       
                        -- FILAS DE DETALLE
                        SELECT     tblConsolidacionDetallePensionado.nIdCajaOrigen AS Caja_Origen, tblInstitucion_1.vcNombreCorto AS DCajaOrigen, tblConsolidacionDetallePensionado.nIdInstitucion AS Caja_Destino,
                                                 tblInstitucion.vcNombreCorto AS DCaja_Destino, tblConsolidacionDetallePensionado.vcNumPagare AS Num_pagare,
                                                 tblConsolidacionDetallePensionado.vcRutEmpresa AS Rut_Empresa, tblConsolidacionDetallePensionado.vcIdentificadorDeudor AS Id_Deudor,
                                                 tblConsolidacionDetallePensionado.vcNombreDeudor AS Nombre_Deudor, tblConsolidacionDetallePensionado.vcRutAval AS Id_Aval,
                                                 tblConsolidacionDetallePensionado.cSujetoDescuento AS Sujeto_Descuento, tblConsolidacionDetallePensionado.tIdTipoIdentificador AS tipo_Identificador,
                                                 tblConsolidacionDetallePensionado.tIdTipoAfiliado AS Tipo_Afiliado, tblConsolidacionDetallePensionado.nIdConsolidacionDetalle AS Identificador,
                                                 tblConsolidacionDetallePensionado.nMontoCobrar,tblConsolidacionDetallePensionado.vcFechaColocacion as vcFechaColocacion 
                        FROM         tblConsolidacionDetallePensionado INNER JOIN
                                                 tblInstitucion ON tblConsolidacionDetallePensionado.nIdInstitucion = tblInstitucion.nIdInstitucion INNER JOIN
                                                 tblInstitucion AS tblInstitucion_1 ON tblConsolidacionDetallePensionado.nIdCajaOrigen = tblInstitucion_1.nIdInstitucion
                        WHERE     (tblConsolidacionDetallePensionado.nPeriodo = @nPeriodo) 
                        			AND (tblConsolidacionDetallePensionado.nIdCajaOrigen  = @nInstitucion)
                        			AND (tblConsolidacionDetallePensionado.vcEmplanillado  = 'SI')
                        			AND (tblConsolidacionDetallePensionado.tIdTipoAfiliado NOT IN (1,2,9) )
           
                        select @iCoderror=0
                        select @vcMsjError='3.- Consulta efectuada exitosamente'   
                  end
            end
    END TRY
    BEGIN CATCH
        SET @iCoderror = 1;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        return
    END CATCH
 
END
GO

GO
--SqlScripter----[dbo].[spConsultaCarteraPropuesta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaCarteraPropuesta]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaCarteraPropuesta] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:      GRN
-- Create date: 11/06/2013>
-- Description:   Obtiene Cartera Propuesta
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaCarteraPropuesta]
@nCajaOrigen numeric(4,0),
      @nCajaDestino numeric(4,0),
      @vcRutDeudor varchar(12) = '$$',
      @vcFechaImpago varchar(8) = '$$',
	  @nPeriodo numeric(6,0),
	  @iTipoConsulta int,
      @iCoderror int out,
      @vcMsjError varchar(50) out,
      @iFrom bigint = -1,
      @iLength int = -1,
      @vcSort varchar(100) = ''
AS
declare
@dFechaConsolidacion as datetime
      
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
    SET NOCOUNT ON;
    BEGIN TRY
     
      -- Obtener fecha de ejecución de la ultima consolidacion en estado válido para el periodo
      SELECT     @dFechaConsolidacion = MAX(dFechaRegistro)
      FROM         tblRegistroConsolidacion
	  WHERE nPeriodo = @nPeriodo
      GROUP BY vcTipoEjecucion, vcTipoConsolidacion, iIdEstado
      HAVING   (iIdEstado = 27) AND (vcTipoConsolidacion = N'CPC');

     
      if (@@ROWCOUNT=0)
            begin
                  select @iCoderror=-1
                  select @vcMsjError='1.- NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'    
            end  
      else
            begin
                set @iCoderror=0
                set @vcMsjError='3.- Consulta efectuada exitosamente' 
                if @iTipoConsulta = 1
                begin
                -- resumenes
                		SELECT   
								count(tblConsolidacionCarteraDetalle.vcIdentificadorDeudor) as nDeudores,
								sum(tblConsolidacionCarteraDetalle.nSaldoCapital) as saldoCapital,
								sum(tblConsolidacionCarteraDetalle.nMontoOferta) as montoOferta,
								tblConsolidacionCarteraDetalle.nIdCajaDestino AS Caja_Origen,
								tblInstitucion_1.vcNombreCorto AS DCaja_Origen,
								tblConsolidacionCarteraDetalle.nIdCajaDestino AS Caja_Destino,
								tblInstitucion.vcNombreCorto AS DCaja_Destino
						FROM tblConsolidacionCarteraDetalle INNER JOIN
								tblInstitucion ON tblConsolidacionCarteraDetalle.nIdCajaDestino = tblInstitucion.nIdInstitucion INNER JOIN
								tblInstitucion AS tblInstitucion_1 ON tblConsolidacionCarteraDetalle.nIdCajaOrigen = tblInstitucion_1.nIdInstitucion
						WHERE (tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) 
								AND (@nCajaOrigen = 0 or tblConsolidacionCarteraDetalle.nIdCajaOrigen = @nCajaOrigen)
								AND (@nCajaDestino = 0 or tblConsolidacionCarteraDetalle.nIdCajaDestino = @nCajaDestino)
								AND (@vcRutDeudor='$$' or tblConsolidacionCarteraDetalle.vcIdentificadorDeudor = @vcRutDeudor)
								AND (@vcFechaImpago='$$' or tblConsolidacionCarteraDetalle.vcFechaImpago >= @vcFechaImpago)
						GROUP BY
								tblConsolidacionCarteraDetalle.nIdCajaDestino,
								tblInstitucion.vcNombreCorto,
								tblConsolidacionCarteraDetalle.nIdCajaOrigen,
								tblInstitucion_1.vcNombreCorto
						
				end
				else if @iTipoConsulta=2
				begin
                -- FILAS DE DETALLE
                select Caja_Origen, 
					DCaja_Origen, 
					Caja_Destino,
					DCaja_Destino, 
					Num_pagare,
					Rut_Empresa, 
					Id_Deudor,
					Nombre_Deudor, 
					Tipo_Afiliado, 
					Fecha_Impago,
					Id_Aval,
					Sujeto_Descuento, 
					Monto_Oferta,
					Saldo_Capital
                FROM(
					SELECT tblConsolidacionCarteraDetalle.nIdCajaOrigen AS Caja_Origen, 
								tblInstitucion_1.vcNombreCorto AS DCaja_Origen, 
								tblConsolidacionCarteraDetalle.nIdCajaDestino AS Caja_Destino,
								tblInstitucion.vcNombreCorto AS DCaja_Destino, 
								tblConsolidacionCarteraDetalle.vcNumPagare AS Num_pagare,
								tblConsolidacionCarteraDetalle.vcRutEmpresa AS Rut_Empresa, 
								tblConsolidacionCarteraDetalle.vcIdentificadorDeudor AS Id_Deudor,
								tblConsolidacionCarteraDetalle.vcNombreDeudor AS Nombre_Deudor, 
								tblConsolidacionCarteraDetalle.tIdTipoAfiliado AS Tipo_Afiliado, 
								tblConsolidacionCarteraDetalle.vcFechaImpago as Fecha_Impago,
								tblConsolidacionCarteraDetalle.vcRutAval AS Id_Aval,
								tblConsolidacionCarteraDetalle.cSujetoDescuento AS Sujeto_Descuento, 
								tblConsolidacionCarteraDetalle.nMontoOferta as Monto_Oferta,
								tblConsolidacionCarteraDetalle.nSaldoCapital as Saldo_Capital,
								ROW_NUMBER() OVER (ORDER BY 
														case when @vcSort = 'Caja_Origen' then tblConsolidacionCarteraDetalle.nIdCajaOrigen end asc,
														case when @vcSort = 'Caja_Origen DESC' then tblConsolidacionCarteraDetalle.nIdCajaOrigen end desc,
														case when @vcSort = 'DCaja_Origen' then tblInstitucion_1.vcNombreCorto end asc,
														case when @vcSort = 'DCaja_Origen DESC' then tblInstitucion_1.vcNombreCorto end desc,
														case when @vcSort = 'Caja_Destino' then tblConsolidacionCarteraDetalle.nIdCajaDestino end asc,
														case when @vcSort = 'Caja_Destino DESC' then tblConsolidacionCarteraDetalle.nIdCajaDestino end desc,
														case when @vcSort = 'DCaja_Destino' then tblConsolidacionCarteraDetalle.vcNumPagare end asc,
														case when @vcSort = 'DCaja_Destino DESC' then tblConsolidacionCarteraDetalle.vcNumPagare end desc,
														case when @vcSort = 'Num_pagare' then tblConsolidacionCarteraDetalle.vcNumPagare end asc,
														case when @vcSort = 'Num_pagare DESC' then tblConsolidacionCarteraDetalle.vcNumPagare end desc,
														case when @vcSort = 'Rut_Empresa' then tblConsolidacionCarteraDetalle.vcRutEmpresa end asc,
														case when @vcSort = 'Rut_Empresa DESC' then tblConsolidacionCarteraDetalle.vcRutEmpresa end desc,
														case when @vcSort = 'Id_Deudor' then tblConsolidacionCarteraDetalle.vcIdentificadorDeudor end asc,
														case when @vcSort = 'Id_Deudor DESC' then tblConsolidacionCarteraDetalle.vcIdentificadorDeudor end desc,
														case when @vcSort = 'Nombre_Deudor' then tblConsolidacionCarteraDetalle.vcNombreDeudor end asc,
														case when @vcSort = 'Nombre_Deudor DESC' then tblConsolidacionCarteraDetalle.vcNombreDeudor end desc,
														case when @vcSort = 'Tipo_Afiliado' then tblConsolidacionCarteraDetalle.tIdTipoAfiliado end asc,
														case when @vcSort = 'Tipo_Afiliado DESC' then tblConsolidacionCarteraDetalle.tIdTipoAfiliado end desc,
														case when @vcSort = 'Fecha_Impago' then tblConsolidacionCarteraDetalle.vcFechaImpago end asc,
														case when @vcSort = 'Fecha_Impago DESC' then tblConsolidacionCarteraDetalle.vcFechaImpago end desc,
														case when @vcSort = 'Id_Aval' then tblConsolidacionCarteraDetalle.vcRutAval end asc,
														case when @vcSort = 'Id_Aval DESC' then tblConsolidacionCarteraDetalle.vcRutAval end desc,
														case when @vcSort = 'Sujeto_Descuento' then tblConsolidacionCarteraDetalle.cSujetoDescuento end asc,
														case when @vcSort = 'Sujeto_Descuento DESC' then tblConsolidacionCarteraDetalle.cSujetoDescuento end desc,
														case when @vcSort = 'Monto_Oferta' then tblConsolidacionCarteraDetalle.nMontoOferta end asc,
														case when @vcSort = 'Monto_Oferta DESC' then tblConsolidacionCarteraDetalle.nMontoOferta end desc,
														case when @vcSort = 'Saldo_Capital' then tblConsolidacionCarteraDetalle.nSaldoCapital end asc,
														case when @vcSort = 'Saldo_Capital DESC' then tblConsolidacionCarteraDetalle.nSaldoCapital end desc
								) AS RowNo 
						FROM tblConsolidacionCarteraDetalle INNER JOIN
								tblInstitucion ON tblConsolidacionCarteraDetalle.nIdCajaDestino = tblInstitucion.nIdInstitucion INNER JOIN
								tblInstitucion AS tblInstitucion_1 ON tblConsolidacionCarteraDetalle.nIdCajaOrigen = tblInstitucion_1.nIdInstitucion
						WHERE (tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) 
								AND (@nCajaOrigen = 0 or tblConsolidacionCarteraDetalle.nIdCajaOrigen  = @nCajaOrigen)
								AND (@nCajaDestino = 0 or tblConsolidacionCarteraDetalle.nIdCajaDestino = @nCajaDestino)
								AND (@vcRutDeudor='$$' or tblConsolidacionCarteraDetalle.vcIdentificadorDeudor = @vcRutDeudor)
								AND (@vcFechaImpago='$$' or tblConsolidacionCarteraDetalle.vcFechaImpago >= @vcFechaImpago)
					)tbl
				where (@iFrom = -1 and @iLength = -1) 
						or (RowNo between @iFrom + 1 and @iFrom + @iLength)
					
					
				end
				else if @iTipoConsulta=3
				begin
                -- TOTAL FILAS DE DETALLE
                SELECT 
					Count(tblConsolidacionCarteraDetalle.nIdConsolidacionDetalle) as Total
				FROM tblConsolidacionCarteraDetalle INNER JOIN
						tblInstitucion ON tblConsolidacionCarteraDetalle.nIdCajaDestino = tblInstitucion.nIdInstitucion INNER JOIN
						tblInstitucion AS tblInstitucion_1 ON tblConsolidacionCarteraDetalle.nIdCajaOrigen = tblInstitucion_1.nIdInstitucion
				WHERE (tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) 
						AND (@nCajaOrigen = 0 or tblConsolidacionCarteraDetalle.nIdCajaOrigen  = @nCajaOrigen)
						AND (@nCajaDestino = 0 or tblConsolidacionCarteraDetalle.nIdCajaDestino = @nCajaDestino)
						AND (@vcRutDeudor='$$' or tblConsolidacionCarteraDetalle.vcIdentificadorDeudor = @vcRutDeudor)
						AND (@vcFechaImpago='$$' or tblConsolidacionCarteraDetalle.vcFechaImpago >= @vcFechaImpago)
				end 
            end
    END TRY
	BEGIN CATCH
		SET @iCoderror = 1;
		SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
		return
	END CATCH
 
END
GO

GO
--SqlScripter----[dbo].[spConsultaCarteraVendida].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaCarteraVendida]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaCarteraVendida] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:      GRN
-- Create date: 15/10/2013
-- Description:   Obtiene Cartera Vendida
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaCarteraVendida]
@nCajaOrigen numeric(4,0),
      @nCajaDestino numeric(4,0),
      @vcRutDeudor varchar(12) = '$$',
      @vcFechaImpago varchar(8) = '$$',
      @nPeriodo numeric(6,0),
      @iCoderror int out,
      @vcMsjError varchar(50) out
AS
declare
@dFechaConsolidacion as datetime
      
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
    SET NOCOUNT ON;
    BEGIN TRY
     
      -- Obtener fecha de ejecución de la ultima consolidacion en estado válido para el periodo
      SELECT     @dFechaConsolidacion = MAX(dFechaRegistro)
      FROM         tblRegistroConsolidacion
      WHERE nPeriodo = @nPeriodo
      GROUP BY vcTipoEjecucion, vcTipoConsolidacion, iIdEstado
      HAVING   (iIdEstado = 27) AND (vcTipoConsolidacion = N'CC');

     
      if (@@ROWCOUNT=0)
            begin
                  select @iCoderror=-1
                  select @vcMsjError='1.- NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'    
            end  
      else
            begin
                -- resumenes
                SELECT   
                        count(tblConsolidacionCarteraDetalle.vcIdentificadorDeudor) as nDeudores,
                        sum(tblConsolidacionCarteraDetalle.nSaldoCapital) as saldoCapital,
                        sum(tblConsolidacionCarteraDetalle.nMontoOferta) as montoOferta,
                        sum(tblConsolidacionCarteraDetalle.nMontoFinalCompra) as montoCompra,
                        tblConsolidacionCarteraDetalle.nIdCajaDestino AS Caja_Origen,
                        tblInstitucion_1.vcNombreCorto AS DCaja_Origen,
                        tblConsolidacionCarteraDetalle.nIdCajaDestino AS Caja_Destino,
                        tblInstitucion.vcNombreCorto AS DCaja_Destino
                FROM tblConsolidacionCarteraDetalle INNER JOIN
                        tblInstitucion ON tblConsolidacionCarteraDetalle.nIdCajaDestino = tblInstitucion.nIdInstitucion INNER JOIN
                        tblInstitucion AS tblInstitucion_1 ON tblConsolidacionCarteraDetalle.nIdCajaOrigen = tblInstitucion_1.nIdInstitucion
                WHERE (tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) 
                        AND (tblConsolidacionCarteraDetalle.nMontoFinalCompra > 0 or tblConsolidacionCarteraDetalle.nMontoFinalCompra is not null)
                        AND (tblConsolidacionCarteraDetalle.vcFechaCompra <> '' or tblConsolidacionCarteraDetalle.vcFechaCompra is not null)
                        AND (@nCajaOrigen = 0 or tblConsolidacionCarteraDetalle.nIdCajaOrigen = @nCajaOrigen)
                        AND (@nCajaDestino = 0 or tblConsolidacionCarteraDetalle.nIdCajaDestino = @nCajaDestino)
                        AND (@vcRutDeudor='$$' or tblConsolidacionCarteraDetalle.vcIdentificadorDeudor = @vcRutDeudor)
                        AND (@vcFechaImpago='$$' or tblConsolidacionCarteraDetalle.vcFechaImpago >= @vcFechaImpago)
                GROUP BY
                        tblConsolidacionCarteraDetalle.nIdCajaDestino,
                        tblInstitucion.vcNombreCorto,
                        tblConsolidacionCarteraDetalle.nIdCajaOrigen,
                        tblInstitucion_1.vcNombreCorto

                -- FILAS DE DETALLE
                SELECT tblConsolidacionCarteraDetalle.nIdCajaOrigen AS Caja_Origen, 
                        tblInstitucion_1.vcNombreCorto AS DCaja_Origen, 
                        tblConsolidacionCarteraDetalle.nIdCajaDestino AS Caja_Destino,
                        tblInstitucion.vcNombreCorto AS DCaja_Destino, 
                        tblConsolidacionCarteraDetalle.vcNumPagare AS Num_pagare,
                        tblConsolidacionCarteraDetalle.vcRutEmpresa AS Rut_Empresa, 
                        tblConsolidacionCarteraDetalle.vcIdentificadorDeudor AS Id_Deudor,
                        tblConsolidacionCarteraDetalle.vcNombreDeudor AS Nombre_Deudor, 
                        tblConsolidacionCarteraDetalle.tIdTipoAfiliado AS Tipo_Afiliado, 
                        tblConsolidacionCarteraDetalle.vcFechaImpago as Fecha_Impago,
                        tblConsolidacionCarteraDetalle.vcRutAval AS Id_Aval,
                        tblConsolidacionCarteraDetalle.cSujetoDescuento AS Sujeto_Descuento, 
                        tblConsolidacionCarteraDetalle.nMontoOferta as Monto_Oferta,
                        tblConsolidacionCarteraDetalle.nSaldoCapital as Saldo_Capital,
                        tblConsolidacionCarteraDetalle.nMontoFinalCompra as Monto_Compra,
                        tblConsolidacionCarteraDetalle.vcFechaCompra as Fecha_Compra
                FROM tblConsolidacionCarteraDetalle INNER JOIN
                        tblInstitucion ON tblConsolidacionCarteraDetalle.nIdCajaDestino = tblInstitucion.nIdInstitucion INNER JOIN
                        tblInstitucion AS tblInstitucion_1 ON tblConsolidacionCarteraDetalle.nIdCajaOrigen = tblInstitucion_1.nIdInstitucion
                WHERE (tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) 
                        AND (tblConsolidacionCarteraDetalle.nMontoFinalCompra > 0 or tblConsolidacionCarteraDetalle.nMontoFinalCompra is not null)
                        AND (tblConsolidacionCarteraDetalle.vcFechaCompra <> '' or tblConsolidacionCarteraDetalle.vcFechaCompra is not null)
                        AND (@nCajaOrigen = 0 or tblConsolidacionCarteraDetalle.nIdCajaOrigen  = @nCajaOrigen)
                        AND (@nCajaDestino = 0 or tblConsolidacionCarteraDetalle.nIdCajaDestino = @nCajaDestino)
                        AND (@vcRutDeudor='$$' or tblConsolidacionCarteraDetalle.vcIdentificadorDeudor = @vcRutDeudor)
                        AND (@vcFechaImpago='$$' or tblConsolidacionCarteraDetalle.vcFechaImpago >= @vcFechaImpago)
                select @iCoderror=0
                select @vcMsjError='3.- Consulta efectuada exitosamente'  
            end
    END TRY
    BEGIN CATCH
        SET @iCoderror = 1;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        return
    END CATCH
 
END
GO

GO
--SqlScripter----[dbo].[spConsultaCompraCarteraCabecera].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaCompraCarteraCabecera]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaCompraCarteraCabecera] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:        <Mauricio Soto MSC>
-- Create date: <25/07/2013>
-- Description:   <Obtiene Alertas>
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaCompraCarteraCabecera]
@iPeriodo int,
      @iInstitucion int  ,
      @iCoderror int out,
      @vcMsjError varchar(50) out
AS
declare
@dFechaConsolidacion as datetime
BEGIN   
   -- FILAS DE DETALLE
   SELECT     tblConsolidacionCarteraCabecera.nPeriodo ,tblConsolidacionCarteraCabecera.dFechaCompraCartera dFechaIng, tblConsolidacionCarteraCabecera.nIdInstitucion, tblConsolidacionCarteraCabecera.vcLinkCompraCartera, 
                      tblInstitucion.vcNombreCorto AS DCajaOrigen
   FROM         tblConsolidacionCarteraCabecera INNER JOIN
                      tblInstitucion ON tblConsolidacionCarteraCabecera.nIdInstitucion = tblInstitucion.nIdInstitucion
   WHERE     (tblConsolidacionCarteraCabecera.nPeriodo = @iPeriodo) AND (tblConsolidacionCarteraCabecera.nIdInstitucion = @iInstitucion or @iInstitucion  =0)
           
                  
   if (@@ROWCOUNT=0)
   begin
     select @iCoderror=-1
     select @vcMsjError='NO SE ENCONTRARON DATOS DE CONSOLIDACION DE PROPUESTA DE CARTERA PARA EL CRITERIO ESPECIFICADO'   
   end  
   else
   begin
     select @iCoderror=0
     select @vcMsjError='Consulta efectuada exitosamente'
   end

END
GO

GO
--SqlScripter----[dbo].[spConsultaIndicadores].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaIndicadores]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaIndicadores] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 07-10-2013
-- Description: Realiza la consolidacion de afiliados y deudas para la generacion de propuestas de cartera
-- 
-- Tipos de Indicador:
--  @iIndicador :
--   - 1 - Consulta por rango por Periodos
--   - 2 - Consulta por Periodo Mora
--   - 3 - Consulta por Caja vs Caja
--   - 4 - Consulta por Procesos
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaIndicadores]
@vcTipoIndicador varchar(3) = '', 
  @iTipoConsulta int,
  @nPeriodoInicial numeric(6,0) = 0,
  @nPeriodoFinal numeric(6,0) = 0,
  @vcCriterio varchar(3) = '',
  @vcUbicados varchar(3) = 'T',
  @vcRecaudados varchar(2) = 'T',
  @iPeriodoMora int = '0',
  @cTipoDeudor char(1) = 'T',
  @nIdCajaOrigen as numeric (4,0) = 0,
  @nIdCajaDestino as numeric (4,0) = 0,
  @iCodError int out, 
  @vcMsjError varchar(50) out
AS
BEGIN
  set @iCodError = 0;
  set @vcMsjError = 'OK'; 

  
  BEGIN TRY
  
  if @iTipoConsulta = 1 -- Número de deudores por rango por Industria
  Begin
    
    Select 
       tblInstitucion.nIdInstitucion as IdCajaOrigen,
       tblInstitucion.vcNombreCorto as CajaOrigen, 
       nperiodo as Periodo, 
    Case 
       When cTipoDeudor = 'D' THEN 'Directo'
       When cTipoDeudor = 'A' THEN 'Aval' 
    END as TipoDeudor,
    SUM(nValor) as Valor
    from tblIndicadorResumen left join tblInstitucion 
       on tblIndicadorResumen.nIdCajaOrigen = tblInstitucion.nIdInstitucion
    where tblIndicadorResumen.nPeriodo between @nPeriodoInicial and @nPeriodoFinal
       and tblIndicadorResumen.vcTipoIndicador = @vcTipoIndicador
	   and tblIndicadorResumen.vcCriterio = @vcCriterio
       and (@vcUbicados = 'T' or tblIndicadorResumen.vcUbicados = @vcUbicados)
       and (
            (tblIndicadorResumen.vcUbicados = 'SI' and (@vcRecaudados = 'T' or tblIndicadorResumen.vcRecaudados = @vcRecaudados))
            or
            (tblIndicadorResumen.vcUbicados = 'NO' and (@vcRecaudados ='T' or @vcRecaudados = 'NO') and tblIndicadorResumen.vcRecaudados = 'NO')
       )
       and (@nIdCajaOrigen = 0 or tblIndicadorResumen.nIdCajaOrigen = @nIdCajaOrigen)
       and (@vcUbicados = 'NO' or @nIdCajaDestino = 0 or tblIndicadorResumen.nIdCajaDestino = @nIdCajaDestino)
       and (@cTipoDeudor = 'T' or tblIndicadorResumen.cTipoDeudor = @cTipoDeudor)
       and ((@vcCriterio = 'DEU' and tblIndicadorResumen.iIdPeriodoMora = -1)
			or
	       (@vcCriterio <> 'DEU' and tblIndicadorResumen.iIdPeriodoMora > -1))
    group by tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto, nPeriodo, cTipoDeudor
    order by tblInstitucion.vcNombreCorto, nPeriodo, cTipoDeudor

    if @@ROWCOUNT = 0
    begin
      set @iCodError = -1;
      set @vcMsjError = 'No se encontraron datos para esta consulta.'; 
    end
    return
  END
  if @iTipoConsulta = 2
  Begin
     Select 
       tblPeriodoMora.iIdPeriodoMora as IdPeriodoMora,
       tblPeriodoMora.vcPeriodoMora as PeriodoMora,
       tblInstitucion.nIdInstitucion as IdCaja,
       tblInstitucion.vcNombreCorto as Caja, 
    Case 
       When cTipoDeudor = 'D' THEN 'Directo'
       When cTipoDeudor = 'A' THEN 'Aval' 
    END as TipoDeudor,
    SUM(nValor) as Valor
    from tblIndicadorResumen inner join tblInstitucion 
       on tblIndicadorResumen.nIdCajaOrigen = tblInstitucion.nIdInstitucion
       inner join tblPeriodoMora 
       on tblIndicadorResumen.iIdPeriodoMora = tblPeriodoMora.iIdPeriodoMora
    where tblIndicadorResumen.nPeriodo = @nPeriodoInicial
       and tblIndicadorResumen.vcTipoIndicador = @vcTipoIndicador
       and tblIndicadorResumen.vcCriterio = @vcCriterio
       and (@vcUbicados = 'T' or tblIndicadorResumen.vcUbicados = @vcUbicados)
       and (
            (tblIndicadorResumen.vcUbicados = 'SI' and (@vcRecaudados = 'T' or tblIndicadorResumen.vcRecaudados = @vcRecaudados))
            or
            (tblIndicadorResumen.vcUbicados = 'NO' and (@vcRecaudados ='T' or @vcRecaudados = 'NO') and tblIndicadorResumen.vcRecaudados = 'NO')
       )
       and (@iPeriodoMora = 0 or tblIndicadorResumen.iIdPeriodoMora = @iPeriodoMora)
       and (@nIdCajaOrigen = 0 or tblIndicadorResumen.nIdCajaOrigen = @nIdCajaOrigen)
       and (@vcUbicados = 'NO' or @nIdCajaDestino = 0 or tblIndicadorResumen.nIdCajaDestino = @nIdCajaDestino)
       and (@cTipoDeudor = 'T' or tblIndicadorResumen.cTipoDeudor = @cTipoDeudor)
	   and tblIndicadorResumen.iIdPeriodoMora > -1
    group by tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto, nPeriodo, cTipoDeudor, tblPeriodoMora.iIdPeriodoMora, tblPeriodoMora.vcPeriodoMora
    order by tblPeriodoMora.iIdPeriodoMora, tblInstitucion.vcNombreCorto, nPeriodo, cTipoDeudor
  
    if @@ROWCOUNT = 0
    begin
      set @iCodError = -2;
      set @vcMsjError = 'No se encontraron datos para esta consulta.'; 
    end
    return
    END
    if @iTipoConsulta = 3
    Begin
     Select 
       InstOrigen.nIdInstitucion as IdCajaOrigen,
       InstOrigen.vcNombreCorto as CajaOrigen, 
       InstDestino.nIdInstitucion as IdCajaDestino,
       InstDestino.vcNombreCorto as CajaDestino, 
     Case 
       When cTipoDeudor = 'D' THEN 'Directo'
       When cTipoDeudor = 'A' THEN 'Aval' 
     END as TipoDeudor,
       SUM(nValor) as Valor
     from tblIndicadorResumen left join tblInstitucion InstOrigen
       on tblIndicadorResumen.nIdCajaOrigen = InstOrigen.nIdInstitucion
       left join tblInstitucion InstDestino
       on tblIndicadorResumen.nIdCajaDestino = InstDestino.nIdInstitucion
     where tblIndicadorResumen.nPeriodo = @nPeriodoInicial
       and tblIndicadorResumen.vcTipoIndicador = @vcTipoIndicador
       and tblIndicadorResumen.vcCriterio = @vcCriterio
       and (@vcUbicados = 'SI' or tblIndicadorResumen.vcUbicados = @vcUbicados)
       and (
            (tblIndicadorResumen.vcUbicados = 'SI' and (@vcRecaudados = 'T' or tblIndicadorResumen.vcRecaudados = @vcRecaudados))
       )
       and (@nIdCajaOrigen = 0 or tblIndicadorResumen.nIdCajaOrigen = @nIdCajaOrigen)
       and (@nIdCajaDestino = 0 or tblIndicadorResumen.nIdCajaDestino = @nIdCajaDestino)
       and (@cTipoDeudor = 'T' or tblIndicadorResumen.cTipoDeudor = @cTipoDeudor)
       and ((@vcCriterio = 'DEU' and tblIndicadorResumen.iIdPeriodoMora = -1)
			or
	       (@vcCriterio <> 'DEU' and tblIndicadorResumen.iIdPeriodoMora > -1))
     group by InstOrigen.nIdInstitucion, InstOrigen.vcNombreCorto, InstDestino.nIdInstitucion, InstDestino.vcNombreCorto,
            nPeriodo, cTipoDeudor
     order by InstOrigen.vcNombreCorto,InstDestino.vcNombreCorto, cTipoDeudor
  
    if @@ROWCOUNT = 0
    begin
      set @iCodError = -3;
      set @vcMsjError = 'No se encontraron datos para esta consulta.'; 
    end
    return
  END
  if @iTipoConsulta = 4 --Indicadores de Periodos (Cajas vs Cajas)
    Begin
     Select 
       tblPeriodoMora.iIdPeriodoMora as IdPeriodoMora,
       tblPeriodoMora.vcPeriodoMora as PeriodoMora,
       tblInstitucion.nIdInstitucion as IdCaja,
       tblInstitucion.vcNombreCorto as Caja, 
    Case 
       When cTipoDeudor = 'D' THEN 'Directo'
       When cTipoDeudor = 'A' THEN 'Aval' 
    END as TipoDeudor,
    SUM(nValor) as Valor
    from tblIndicadorResumen left join tblInstitucion 
       on tblIndicadorResumen.nIdCajaDestino = tblInstitucion.nIdInstitucion
       left join tblPeriodoMora 
       on tblIndicadorResumen.iIdPeriodoMora = tblPeriodoMora.iIdPeriodoMora
    where tblIndicadorResumen.nPeriodo = @nPeriodoInicial
       and tblIndicadorResumen.vcTipoIndicador = @vcTipoIndicador
       and tblIndicadorResumen.vcCriterio = @vcCriterio
       and (@vcUbicados = 'SI' and tblIndicadorResumen.vcUbicados = @vcUbicados)
       and (
            (tblIndicadorResumen.vcUbicados = 'SI' and (@vcRecaudados = 'T' or tblIndicadorResumen.vcRecaudados = @vcRecaudados))
       )
       and (@iPeriodoMora = 0 or tblIndicadorResumen.iIdPeriodoMora = @iPeriodoMora)
       and (@nIdCajaOrigen = 0 or tblIndicadorResumen.nIdCajaOrigen = @nIdCajaOrigen)
       and (@nIdCajaDestino = 0 or tblIndicadorResumen.nIdCajaDestino = @nIdCajaDestino)
       and (@cTipoDeudor = 'T' or tblIndicadorResumen.cTipoDeudor = @cTipoDeudor)
	   and tblIndicadorResumen.iIdPeriodoMora > -1
    group by tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto, nPeriodo, cTipoDeudor, tblPeriodoMora.iIdPeriodoMora, tblPeriodoMora.vcPeriodoMora
    order by tblPeriodoMora.iIdPeriodoMora, tblInstitucion.vcNombreCorto, nPeriodo, cTipoDeudor
  
    if @@ROWCOUNT = 0
    begin
      set @iCodError = -3;
      set @vcMsjError = 'No se encontraron datos para esta consulta.'; 
    end
    return
  END

  if @iTipoConsulta = 5 --Indicadores de Procesos
    Begin
     Select 
       tablaTmp.nIdInstitucion as IdCaja,
       tablaTmp.vcNombreCorto as Caja,
       COUNT(tblCierreFueraPlazo.iIdCierrePlazo) as Valor,
       tablaTmp.nPeriodo as Periodo
     from  tblCierreFueraPlazo right outer join 
           (select tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto, tblPeriodo.nPeriodo
           From tblInstitucion, tblPeriodo
           where tblInstitucion.bParticipa = 1 and tblInstitucion.iIdEstado = 11
            and (@nIdCajaOrigen = 0 or tblInstitucion.nIdInstitucion = @nIdCajaOrigen)
            and tblPeriodo.nPeriodo between  @nPeriodoInicial and @nPeriodoFinal
            ) tablaTmp 
            on tblCierreFueraPlazo.nIdInstitucion = tablaTmp.nIdInstitucion
            and tblCierreFueraPlazo.nPeriodo = tablaTmp.nPeriodo
     group by tablaTmp.nIdInstitucion, tablaTmp.vcNombreCorto, tablaTmp.nPeriodo
     order by tablaTmp.nIdInstitucion, tablaTmp.vcNombreCorto, tablaTmp.nPeriodo
  
    if @@ROWCOUNT = 0
    begin
      set @iCodError = -3;
      set @vcMsjError = 'No se encontraron datos para esta consulta.'; 
    end
    return
  END

  END TRY
  BEGIN CATCH
    SET @iCodError = -4;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
  END CATCH
END
GO

GO
--SqlScripter----[dbo].[spConsultaInformeNominas].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaInformeNominas]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaInformeNominas] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- ===========================================
-- Author:        <APM>
-- Create date: <12/11/2013>
-- Description:   <Obtiene Alertas Cobrar >
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaInformeNominas]
@iPeriodo int,
      @iInstitucion int  ,
      @iCoderror int out,
      @vcMsjError varchar(50) out
AS
declare
@dFechaConsolidacion as datetime
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
    SET NOCOUNT ON;
    BEGIN TRY
     
      -- Obtener fecha de ejecuci≤n de la ultima consolidacion en estado vßlido para el periodo
      SELECT     @dFechaConsolidacion = MAX(dFechaRegistro)
      FROM         tblRegistroConsolidacion
      GROUP BY nPeriodo, vcTipoEjecucion, vcTipoConsolidacion, iIdEstado
      HAVING      (nPeriodo = @iPeriodo) AND (iIdEstado = 27) AND (vcTipoConsolidacion = N'CD');
     
      if (@@ROWCOUNT=0)
            begin
                  select @iCoderror=-1
                  select @vcMsjError='1.- NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'    
            end  
      else
            begin
              -- Obtener Primera tabla,  Encabezado
    SELECT  iIdCajaDestino, SUM(nTotalRegistros) AS Nro_Deudores, SUM(nMontoCobrar) AS Suma_monto
    FROM    tblResumenConsolidacion
    WHERE   (nPeriodo = @iPeriodo) AND (dFechaRegistro = @dFechaConsolidacion)
    and (iIdCajaDestino = @iInstitucion OR iIdCajaDestino IS NULL)
    GROUP BY iIdCajaDestino
                  
                 
                  if (@@ROWCOUNT=0)
                  begin
                             select @iCoderror=-1
                             select @vcMsjError='2.- NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'   
                  end  
                        else
                  begin
                        -- Obtener segunda tabla,  resumenes
                                     
                              SELECT  IntsDestino.nIdInstitucion, IntsDestino.vcNombre AS Encontrado_En, isnull(tblResumenConsolidacion.nTotalRegistros,0) AS Nro_Deudores,
                                     isnull(tblResumenConsolidacion.nTotalSaldo,0) AS Suma_saldo, isnull(tblResumenConsolidacion.nMontoCobrar,0) AS Suma_monto
                        FROM         tblResumenConsolidacion LEFT OUTER JOIN
                                     tblInstitucion AS IntsDestino ON tblResumenConsolidacion.iIdCajaOrigen = IntsDestino.nIdInstitucion
                        WHERE     (tblResumenConsolidacion.nPeriodo = @iPeriodo) AND (tblResumenConsolidacion.dFechaRegistro = @dFechaConsolidacion) AND
                                     (tblResumenConsolidacion.iIdCajaDestino = @iInstitucion) OR
                                     (tblResumenConsolidacion.iIdCajaDestino IS NULL and IntsDestino.bParticipa=1)
           
                        select @iCoderror=0
                        select @vcMsjError='3.- Consulta efectuada exitosamente'  
                  end
            end
    END TRY
  BEGIN CATCH
    SET @iCoderror = 1;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
  END CATCH
 END
GO

GO
--SqlScripter----[dbo].[spConsultaInfRecaudacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaInfRecaudacion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaInfRecaudacion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    <MSC,,Mauricio Soto>
-- Create date: <21/06/2013>
-- Description: <Obtiene informes recaudacion>
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaInfRecaudacion]
@iPeriodo int, 
  @iInstitucion int  ,
  @iCoderror int out,
  @vcMsjError varchar(50) out
AS
BEGIN
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  SET NOCOUNT ON;
  
  
  -- Obtener fecha de ejecuci≤n de la ultima consolidacion en estado vßlido para el periodo
  SELECT     TOP (200) tblConsolidacionCabecera.nIdInstitucion, tblInstitucion.vcNombre, tblConsolidacionCabecera.dFechaRecaud dFechaIng, tblConsolidacionCabecera.cvLinkRecaudacion, 
                      tblConsolidacionCabecera.nPeriodo
  FROM         tblConsolidacionCabecera INNER JOIN
                      tblInstitucion ON tblConsolidacionCabecera.nIdInstitucion = tblInstitucion.nIdInstitucion
  WHERE     (tblConsolidacionCabecera.nIdInstitucion = @iInstitucion) AND (tblConsolidacionCabecera.nPeriodo = @iPeriodo) AND 
                      (tblConsolidacionCabecera.cvLinkRecaudacion <> N'') OR
                      (tblConsolidacionCabecera.nPeriodo = @iPeriodo) AND (@iInstitucion = 0) AND (tblConsolidacionCabecera.cvLinkRecaudacion <> N'')
  
  if (@@ROWCOUNT=0)
    begin
      select @iCoderror=-1
      select @vcMsjError='NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO' 
    end 
  else
    begin
      select @iCoderror=0     
    end
  

END
GO

GO
--SqlScripter----[dbo].[spConsultaNominas].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaNominas]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaNominas] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:        <RAV,,Roberto Álvarez>
-- Create date: <25/07/2013>
-- Description:   <Obtiene Alertas>
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaNominas]
@iPeriodo int,
      @iInstitucion int  ,
      @iCoderror int out,
      @vcMsjError varchar(50) out
AS
declare
@dFechaConsolidacion as datetime
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    BEGIN TRY
                
                       
                        -- FILAS DE DETALLE
                        SELECT     TOP (200) tblConsolidacionDetalle.nIdCajaOrigen AS Caja_Origen, tblInstitucion.vcNombre AS DCajaOrigen, tblConsolidacionDetalle.nIdInstitucion AS Caja_Destino,
                                                 tblInstitucion_1.vcNombre AS DCaja_Destino, tblConsolidacionDetalle.vcNumPagare AS Num_pagare,
                                                 tblConsolidacionDetalle.vcRutEmpresa AS Rut_Empresa, tblConsolidacionDetalle.vcIdentificadorDeudor AS Id_Deudor,
                                                 tblConsolidacionDetalle.vcNombreDeudor AS Nombre_Deudor, tblConsolidacionDetalle.vcRutAval AS Id_Aval,
                                                 tblConsolidacionDetalle.cSujetoDescuento AS Sujeto_Descuento, tblConsolidacionDetalle.tIdTipoIdentificador AS tipo_Identificador,
                                                 tblConsolidacionDetalle.tIdTipoAfiliado AS Tipo_Afiliado, tblConsolidacionDetalle.nIdConsolidacionDetalle AS Identificador,
                                                 tblConsolidacionDetalle.nMontoCobrar
                        FROM         tblConsolidacionDetalle INNER JOIN
                                                 tblInstitucion ON tblConsolidacionDetalle.nIdCajaOrigen = tblInstitucion.nIdInstitucion INNER JOIN
                                                 tblInstitucion AS tblInstitucion_1 ON tblConsolidacionDetalle.nIdInstitucion = tblInstitucion_1.nIdInstitucion
                        WHERE     (tblConsolidacionDetalle.nPeriodo = @iPeriodo) AND (tblConsolidacionDetalle.nIdInstitucion = @iInstitucion)
           
                  
                  if (@@ROWCOUNT=0)
                  begin
                             select @iCoderror=-1
                             select @vcMsjError='NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'   
                  end  
                  else
                  begin
                            select @iCoderror=0
                            select @vcMsjError='Consulta efectuada exitosamente'  
                    end
    END TRY
    BEGIN CATCH
        SET @iCoderror = 1;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        return
    END CATCH
 
END
GO

GO
--SqlScripter----[dbo].[spConsultaNominasCabecera].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaNominasCabecera]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaNominasCabecera] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:        <Mauricio Soto MSC>
-- Create date: <25/07/2013>
-- Description:   <Obtiene Alertas>
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaNominasCabecera]
@iPeriodo int,
      @iInstitucion int  ,
      @iCoderror int out,
      @vcMsjError varchar(50) out
AS
declare
@dFechaConsolidacion as datetime
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

                
                       
                        -- FILAS DE DETALLE
SELECT     tblConsolidacionCabecera.nPeriodo ,tblConsolidacionCabecera.dFechaIng, tblConsolidacionCabecera.nIdInstitucion, tblConsolidacionCabecera.vcLinkNomina, 
                      tblInstitucion.vcNombreCorto AS DCajaOrigen
FROM         tblConsolidacionCabecera INNER JOIN
                      tblInstitucion ON tblConsolidacionCabecera.nIdInstitucion = tblInstitucion.nIdInstitucion
WHERE     (tblConsolidacionCabecera.nPeriodo = @iPeriodo) AND (tblConsolidacionCabecera.nIdInstitucion = @iInstitucion or @iInstitucion  =0)
           
                  
                  if (@@ROWCOUNT=0)
                  begin
                             select @iCoderror=-1
                             select @vcMsjError='NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'   
                  end  
                  else
                  begin
                            select @iCoderror=0
              select @vcMsjError='Consulta efectuada exitosamente'  
          end
 
END
GO

GO
--SqlScripter----[dbo].[spConsultaPropuestasCarteraCabecera].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaPropuestasCarteraCabecera]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaPropuestasCarteraCabecera] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:        <Mauricio Soto MSC>
-- Create date: <21-11-2013>
-- Description:   <Obtiene propuestas de cartera>
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaPropuestasCarteraCabecera]
@iPeriodo int,
      @iInstitucion int  ,
      @iCoderror int out,
      @vcMsjError varchar(50) out
AS
declare
@dFechaConsolidacion as datetime
BEGIN   
   -- FILAS DE DETALLE
   SELECT     tblConsolidacionCarteraCabecera.nPeriodo ,tblConsolidacionCarteraCabecera.dFechaIng, tblConsolidacionCarteraCabecera.nIdInstitucion, tblConsolidacionCarteraCabecera.vcLinkPropuesta, 
                      tblInstitucion.vcNombreCorto AS DCajaOrigen
   FROM         tblConsolidacionCarteraCabecera INNER JOIN
                      tblInstitucion ON tblConsolidacionCarteraCabecera.nIdInstitucion = tblInstitucion.nIdInstitucion
   WHERE     (tblConsolidacionCarteraCabecera.nPeriodo = @iPeriodo) AND (tblConsolidacionCarteraCabecera.nIdInstitucion = @iInstitucion or @iInstitucion  =0)
           
                  
   if (@@ROWCOUNT=0)
   begin
     select @iCoderror=-1
     select @vcMsjError='NO SE ENCONTRARON DATOS DE CONSOLIDACION DE PROPUESTA DE CARTERA PARA EL CRITERIO ESPECIFICADO'   
   end  
   else
   begin
     select @iCoderror=0
     select @vcMsjError='Consulta efectuada exitosamente'
   end
 
END
GO

GO
--SqlScripter----[dbo].[spConsultaRecaudacionEfectiva].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaRecaudacionEfectiva]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaRecaudacionEfectiva] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:        GRN
-- Create date:   05-08-13
-- Description:   Obtiene archivos de Recaudacion
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaRecaudacionEfectiva]
@iOperacion int,
      @iPeriodo int,
      @iInstitucion int,
      @iCoderror int out,
      @vcMsjError varchar(50) out
AS
declare
@dFechaConsolidacion as datetime
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    
    select @iCoderror=0
    select @vcMsjError='Consulta efectuada exitosamente'  
          
    
    -- Obtener fecha de ejecución de la ultima consolidacion en estado válido para el periodo
    select @dFechaConsolidacion = tbl.dFechaRegistro
    from (
        SELECT MAX(dFechaRegistro) as dFechaRegistro
        FROM   tblRegistroConsolidacion 
        where (vcTipoConsolidacion = 'CR')
          AND  (nPeriodo = @iPeriodo)
      )tbl inner join tblRegistroConsolidacion 
      on  tblRegistroConsolidacion.dFechaRegistro =  tbl.dFechaRegistro
    where tblRegistroConsolidacion.iIdEstado = 27;

    if (@@ROWCOUNT=0)
    begin
      select @iCoderror=3
      select @vcMsjError='NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'  
      return
    end  
    else
    begin
      if @iOperacion = 1
      begin
        SELECT InstOrigen, 
            InstDestino, 
            sum(Nro_deudores) AS Nro_deudores,
            sum(MontoCobrar) AS MontoCobrar,
            sum(MontoPagado) AS MontoPagado
        FROM( 
          SELECT  InstOrigen.vcNombre AS InstOrigen, 
                      InstDestino.vcNombre AS InstDestino, 
                      0AS Nro_deudores, 
                      0 AS MontoCobrar,
                      0 AS MontoPagado
          FROM tblInstitucion AS InstOrigen,
          tblInstitucion AS InstDestino 
          where InstOrigen.bParticipa = 1 and InstOrigen.iIdEstado = 11
            and InstDestino.bParticipa = 1 and InstDestino.iIdEstado = 11
            and InstDestino.nIdInstitucion <> InstOrigen.nIdInstitucion 
            and (InstOrigen.nIdInstitucion = @iInstitucion or @iInstitucion=0 )
          union ALL
          SELECT  InstOrigen.vcNombre AS InstOrigen, 
                      InstDestino.vcNombre AS InstDestino, 
                      tbl.nTotalRegistros AS Nro_deudores, 
                      tbl.nMontoCobrar AS MontoCobrar,
                      tbl.nMontoPagado AS MontoPagado
          FROM(
            select * 
            FROM        tblResumenConsolidacion 
            where tblResumenConsolidacion.nPeriodo = @iPeriodo
              AND tblResumenConsolidacion.dFechaRegistro = @dFechaConsolidacion
            )tbl
            INNER JOIN tblInstitucion AS InstOrigen 
              ON tbl.iIdCajaOrigen = InstOrigen.nIdInstitucion
            INNER JOIN tblInstitucion AS InstDestino 
              ON tbl.iIdCajaDestino = InstDestino.nIdInstitucion
          WHERE InstOrigen.nIdInstitucion = @iInstitucion or @iInstitucion=0  
        )datos
        GROUP BY InstOrigen, InstDestino
        ORDER BY InstOrigen, InstDestino
                      
        if (@@ROWCOUNT=0)
        begin
          select @iCoderror=1
          select @vcMsjError='NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'   
          return
        end 
      end     
            
            if @iOperacion = 2
      begin 
        -- FILAS DE DETALLE
        SELECT  
              InstOrigen.vcNombreCorto AS DCajaOrigen, 
              InstDestino.vcNombreCorto AS DCaja_Destino, 
              tblConsolidacionDetalle.vcIdentificadorDeudor AS Id_Deudor,
              tblConsolidacionDetalle.vcNumPagare AS Num_pagare,
              tblConsolidacionDetalle.vcRutEmpresa AS Rut_Empresa,  
              tblConsolidacionDetalle.vcRutAval AS Id_Aval,
              tblConsolidacionDetalle.nMontoCobrar as MontoCobrar,
              tblConsolidacionDetalle.nMontoPagado as MontoPagado,
              tblConsolidacionDetalle.nMontoCobrar - tblConsolidacionDetalle.nMontoPagado as MontoDiferencia
        FROM        tblConsolidacionDetalle 
              INNER JOIN tblInstitucion as InstOrigen
                ON tblConsolidacionDetalle.nIdCajaOrigen = InstOrigen.nIdInstitucion 
              INNER JOIN tblInstitucion AS InstDestino 
                ON tblConsolidacionDetalle.nIdInstitucion = InstDestino.nIdInstitucion
        WHERE   (tblConsolidacionDetalle.nPeriodo = @iPeriodo) 
          AND (tblConsolidacionDetalle.nIdCajaOrigen = @iInstitucion or @iInstitucion=0)
          AND nMontoPagado > 0

        if (@@ROWCOUNT=0)
        begin
          select @iCoderror = 2
          select @vcMsjError = 'NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO'   
          return
        end 
      end
    end
END
GO

GO
--SqlScripter----[dbo].[spDespliegaEstados].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spDespliegaEstados]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spDespliegaEstados] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 01-07-13
-- Description: Lista los estados de un tipo de estado
-- =============================================
ALTER PROCEDURE [dbo].[spDespliegaEstados]
@iIdTipoEstado int
AS
BEGIN
  SET NOCOUNT ON;
  Select iIdEstado, vcEstado from tblEstado where iIdTipoEstado = @iIdTipoEstado;
END
GO

GO
--SqlScripter----[dbo].[spDespliegaFuncionalidad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spDespliegaFuncionalidad]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spDespliegaFuncionalidad] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 01-07-13
-- Description: Rescata datos de funcionalidad
-- =============================================
ALTER PROCEDURE [dbo].[spDespliegaFuncionalidad]
@iIdFuncionalidad int
AS
BEGIN
  SET NOCOUNT ON;

    -- Insert statements for procedure here
  SELECT iIdFuncionalidad, iIdEstado,vcFuncionalidad, vcDescripcion  
  from tblFuncionalidad 
  where iIdFuncionalidad = @iIdFuncionalidad
END
GO

GO
--SqlScripter----[dbo].[spDespliegaMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spDespliegaMenu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spDespliegaMenu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 12-06-13
-- Description: Despliega Menus permitidos para un usuario
-- =============================================
ALTER PROCEDURE [dbo].[spDespliegaMenu]
@iRut int
AS
BEGIN
  SET NOCOUNT ON;
    --Select Menu de 3 Niveles
  select distinct Menu, vcMenu, vcUrl as link, len(Menu)-len(replace(Menu,'.','')) as Nivel
  from
  (
    select 
      Niv2.iIdMenu,
    replace(
      cast(coalesce(Niv0.iOrden,'') as varchar(10)) + '.' + 
      cast(coalesce(Niv1.iOrden,'') as varchar(10)) + '.' + 
      cast(coalesce(Niv2.iOrden,'') as varchar(10)), 
    '0.','')
    as Menu
    from tblMenu Niv2 left join tblMenu Niv1 
    on Niv1.iIdMenu = Niv2.iIdMenuPadre 
    left join tblMenu Niv0
    on Niv0.iIdMenu = Niv1.iIdMenuPadre 
  ) TabMenu 
  inner join tblMenu on tblMenu.iIdMenu = TabMenu.iIdMenu 
  left join tblPagina on tblMenu.iIdPaginaLink = tblPagina.iIdPagina
  inner join tblRel_FuncMenu on tblRel_FuncMenu.iIdMenu = tblMenu.iIdMenu
  inner join tblFuncionalidad on tblFuncionalidad.iIdFuncionalidad = tblRel_FuncMenu.iIdFuncionalidad
  inner join tblRel_PerfilFunc on tblRel_PerfilFunc.iIdFuncionalidad = tblFuncionalidad.iIdFuncionalidad
  inner join tblPerfil on tblPerfil.iIdPerfil = tblRel_PerfilFunc.iIdPerfil
  inner join tblRel_UsuarioPerfil on tblRel_UsuarioPerfil.iIdPerfil = tblPerfil.iIdPerfil
  inner join tblUsuario on tblUsuario.iRut = tblRel_UsuarioPerfil.iRut 
  where tblUsuario.iRut = @iRut
    and tblFuncionalidad.iIdEstado = 1 --Funcionalidad Activa
  order by TabMenu.Menu; 
END
GO

GO
--SqlScripter----[dbo].[spDespliegaUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spDespliegaUsuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spDespliegaUsuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 04-07-13
-- Description: Rescata los datos de usuario
-- =============================================
ALTER PROCEDURE [dbo].[spDespliegaUsuario]
@iRut int,
  @iParamPermiso int,
    @vcRut varchar(12) out,
    @vcNombre varchar(50) out,
    @vcEmail varchar(50) out,
    @iInstitucion int out,
    @iEstado int out
AS
BEGIN
  select @vcRut = convert(varchar,tblUsuario.iRut) + '-' + dbo.fncDV(convert(varchar,tblUsuario.iRut)),
    @vcNombre = vcNombre,
    @vcEmail = vcEmail,
    @iInstitucion = nIdInstitucion,
    @iEstado = iIdEstado 
  from tblUsuario 
  where iRut = @iRut;
  
  if @iParamPermiso = 0 --El usuario no tieme permisos para desplegar todos los perfiles
  begin
    select tblRel_UsuarioPerfil.iIdPerfil from tblRel_UsuarioPerfil 
    inner join tblPerfil on tblPerfil.iIdPerfil = tblRel_UsuarioPerfil.iIdPerfil
    where tblRel_UsuarioPerfil.iRut = @iRut 
    and tblPerfil.bAsignaCaja = 1;
  end
  else
  begin
    select iIdPerfil from tblRel_UsuarioPerfil
    where iRut = @iRut;
  end
END
GO

GO
--SqlScripter----[dbo].[spEliminacionDatosHistoricos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spEliminacionDatosHistoricos]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spEliminacionDatosHistoricos] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 24-06-2013
-- Description: Realiza la eliminación de datos en tablas historicas y de encabezado,  dado un criterio de meses a mantener en el sistema.
-- Author: HMF
-- Modificacion: Se realiza modificacion en el calculo de la fecha @iUltPeriodoEliminar, para la mantencion de datos historicos.
-- =============================================
ALTER PROCEDURE [dbo].[spEliminacionDatosHistoricos]
@iRutUsuario int,     
  @vcTerminal varchar(30),
  @iCodError int = 0 out, 
  @vcMsjError varchar(50) = 'OK' out
AS
declare 
  @iUltPeriodoEliminar int,
  @dFechaRegistro datetime, 
  @iFilasProcesadas int=0,
  @iTamanoBloqueEliminar int=10000,  
  @iPeriodoActual int,   
  @dFechaTope date,
  @vcAnio varchar(4),
  @vcMes varchar(2), 
  @vcFechaPeriodoActual varchar(6)

  
BEGIN
  BEGIN TRY       
    exec dbo.spRegistraEventoAuditoria getdate,'4','I',@iRutUsuario ,@vcTerminal ,'EJECUTA ELIMINACION DE DATOS ANTIGUOS',@vcMsjError 
    
    select @iPeriodoActual =MAX (nperiodo)
    FROM [INTERCAJAS].[dbo].[tblPeriodo]
    
    IF @iPeriodoActual  is null
    begin
      set @iCodError = -1;
      set @vcMsjError = 'No hay periodos ingresados en tabla periodo';  
      return
    end   
    
    select @vcFechaPeriodoActual = CAST(@iPeriodoActual as varchar(6))

    select @dFechaTope = DATEADD(MM, -6,convert(date,@vcFechaPeriodoActual+'01',106))

    select @vcAnio = cast (year(@dFechaTope) as varchar(4))
    select @vcMes =  right('00' + cast (month(@dFechaTope) as varchar(2)), 2)

    select @iUltPeriodoEliminar = cast(@vcAnio+''+@vcMes as int)
    select @iUltPeriodoEliminar as a
      
    -- Eliminando historicos tablas Afiliados
    --***************************************
    begin
      while (1=1)
      begin
      Begin TRAN  T1      
        delete top (@iTamanoBloqueEliminar) tblHistAfiliadoDetalle 
        where nPeriodo<=@iUltPeriodoEliminar      
        set @iFilasProcesadas =@@ROWCOUNT
        if @iFilasProcesadas =0 
          begin
            COMMIT TRAN T1
            break
          end           
        -- FIN TRANSACCION    
        COMMIT TRAN T1
      end   
    -- Fin eliminacion datos historicos TBLHISTAFILIADODETALLE
    --*********************************************************************
    
    -- Eliminando historicos tabla TBLHISTAFILIADOERROR 
    --*********************************************************************   
    while (1=1)
      begin
      Begin TRAN  T1      
        delete top (@iTamanoBloqueEliminar) tblHistAfiliadoError 
        where nPeriodo<=@iUltPeriodoEliminar      
        set @iFilasProcesadas =@@ROWCOUNT
        if @iFilasProcesadas =0 
          begin
            COMMIT TRAN T1
            break
          end           
        -- FIN TRANSACCION    
        COMMIT TRAN T1
      end   
    
    
    -- Eliminacion datos historicos TBLAFILIADOCABECERA
      while (1=1)
        begin
          Begin TRAN  T1      
          delete top (@iTamanoBloqueEliminar) tblAfiliadoCabecera
          where nPeriodo<=@iUltPeriodoEliminar      
          set @iFilasProcesadas =@@ROWCOUNT
          if @iFilasProcesadas =0 
            begin
              COMMIT TRAN T1
              break
            end           
          -- FIN TRANSACCION    
          COMMIT TRAN T1
        end 
    -- Fin eliminacion datos historicos TBLAFILIADOCABECERA
    --*********************************************************************
    end   
    
    -- Eliminando historicos tablas Cartera Comprada
  --**********************************************
    begin
  -- Procediendo a realizar limpieza tabla tblHistCarteraCompradaDetalle
    --*********************************************************************
      while (1=1)
      begin
      Begin TRAN  T1      
        delete top (@iTamanoBloqueEliminar) tblHistCarteraCompradaDetalle
        where nPeriodo<=@iUltPeriodoEliminar      
        set @iFilasProcesadas =@@ROWCOUNT
        if @iFilasProcesadas =0 
          begin
            COMMIT TRAN T1
            break
          end           
        -- FIN TRANSACCION    
        COMMIT TRAN T1
      end   
    -- Fin eliminacion datos historicos tblHistCarteraCompradaDetalle
    --*********************************************************************
    
    -- Eliminando historicos tabla tblHistCarteraCompradaError 
    --*********************************************************************   
    while (1=1)
      begin
      Begin TRAN  T1      
        delete top (@iTamanoBloqueEliminar) tblHistCarteraCompradaError
        where nPeriodo<=@iUltPeriodoEliminar      
        set @iFilasProcesadas =@@ROWCOUNT
        if @iFilasProcesadas =0 
          begin
            COMMIT TRAN T1
            break
          end           
        -- FIN TRANSACCION    
        COMMIT TRAN T1
      end   
    -- Fin eliminacion datos historicos tblHistCarteraCompradaError
    --*********************************************************************
    
    -- Eliminacion datos historicos tblCarteraCompradaCabecera
      while (1=1)
        begin
          Begin TRAN  T1      
          delete top (@iTamanoBloqueEliminar) tblCarteraCompradaCabecera
          where nPeriodo<=@iUltPeriodoEliminar      
          set @iFilasProcesadas =@@ROWCOUNT
          if @iFilasProcesadas =0 
            begin
              COMMIT TRAN T1
              break
            end           
          -- FIN TRANSACCION    
          COMMIT TRAN T1
        end 
    -- Fin eliminacion datos historicos tblCarteraCompradaCabecera
    --*********************************************************************
    end  

    
    -- Eliminando historicos tablas Deuda
    --***********************************
    begin
  -- OK Procediendo a realizar limpieza tabla tblHistDeudaDetalle
    --*********************************************************************   
      while (1=1)
      begin
      Begin TRAN  T1      
        delete top (@iTamanoBloqueEliminar) tblHistDeudaDetalle 
        where nPeriodo<=@iUltPeriodoEliminar      
        set @iFilasProcesadas =@@ROWCOUNT
        if @iFilasProcesadas =0 
          begin
            COMMIT TRAN T1
            break
          end           
        -- FIN TRANSACCION    
        COMMIT TRAN T1
      end   
    -- Fin eliminacion datos historicos tblHistDeudaDetalle
    --*********************************************************************
    
    -- Eliminando historicos tabla tblHistDeudaError 
    --*********************************************************************   
    while (1=1)
      begin
      Begin TRAN  T1      
        delete top (@iTamanoBloqueEliminar) tblHistDeudaError 
        where nPeriodo<=@iUltPeriodoEliminar      
        set @iFilasProcesadas =@@ROWCOUNT
        if @iFilasProcesadas =0 
          begin
            COMMIT TRAN T1
            break
          end           
        -- FIN TRANSACCION    
        COMMIT TRAN T1
      end   
    
    
    -- Eliminacion datos historicos TBLDEUDACABECERA
    --*********************************************************************   
      while (1=1)
        begin
          Begin TRAN  T1      
          delete top (@iTamanoBloqueEliminar) TBLDEUDACABECERA
          where nPeriodo<=@iUltPeriodoEliminar      
          set @iFilasProcesadas =@@ROWCOUNT
          if @iFilasProcesadas =0 
            begin
              COMMIT TRAN T1
              break
            end           
          -- FIN TRANSACCION    
          COMMIT TRAN T1
        end 
    -- Fin eliminacion datos historicos TBLDEUDACABECERA
    --*********************************************************************
    end 
    
        
    
    -- Eliminando historicos tablas Recaudacion
  --*****************************************
    begin
  -- Procediendo a realizar limpieza tabla tblHistRecaudacionDetalle
    --*********************************************************************   
      while (1=1)
      begin
      Begin TRAN  T1      
        delete top (@iTamanoBloqueEliminar) tblHistRecaudacionDetalle 
        where nPeriodo<=@iUltPeriodoEliminar      
        set @iFilasProcesadas =@@ROWCOUNT
        if @iFilasProcesadas =0 
          begin
            COMMIT TRAN T1
            break
          end           
        -- FIN TRANSACCION    
        COMMIT TRAN T1
      end   
    -- Fin eliminacion datos historicos tblHistRecaudacionDetalle
    --*********************************************************************
    
    -- Eliminando historicos tabla tblHistRecaudacionError 
    --*********************************************************************   
    while (1=1)
      begin
      Begin TRAN  T1      
        delete top (@iTamanoBloqueEliminar) tblHistRecaudacionError  
        where nPeriodo<=@iUltPeriodoEliminar      
        set @iFilasProcesadas =@@ROWCOUNT
        if @iFilasProcesadas =0 
          begin
            COMMIT TRAN T1
            break
          end           
        -- FIN TRANSACCION    
        COMMIT TRAN T1
      end   
    
    
    -- Eliminacion datos historicos TBLRECAUDACIONCABECERA
    --*********************************************************************   
      while (1=1)
        begin
          Begin TRAN  T1      
          delete top (@iTamanoBloqueEliminar) TBLRECAUDACIONCABECERA
          where nPeriodo<=@iUltPeriodoEliminar      
          set @iFilasProcesadas =@@ROWCOUNT
          if @iFilasProcesadas =0 
            begin
              COMMIT TRAN T1
              break
            end           
          -- FIN TRANSACCION    
          COMMIT TRAN T1
        end 
    -- Fin eliminacion datos historicos TBLRECAUDACIONCABECERA
    --*********************************************************************
    end 
    
          
    -- Eliminando historicos tablas Consolidación
  --*******************************************
    begin
  -- Procediendo a eliminar datos historicos tabla tblConsolidacionDetalle
    --*********************************************************************   
      while (1=1)
      begin
      Begin TRAN  T1      
        delete top (@iTamanoBloqueEliminar) tblConsolidacionDetalle 
        where nPeriodo<=@iUltPeriodoEliminar      
        set @iFilasProcesadas =@@ROWCOUNT
        if @iFilasProcesadas =0 
          begin
            COMMIT TRAN T1
            break
          end           
        -- FIN TRANSACCION    
        COMMIT TRAN T1
      end   
    -- Fin eliminacion datos historicos tblConsolidacionDetalle
    --*********************************************************************

    -- Eliminacion datos historicos tblConsolidacionCabecera
    --*********************************************************************   
      while (1=1)
        begin
          Begin TRAN  T1      
          delete top (@iTamanoBloqueEliminar) tblConsolidacionCabecera
          where nPeriodo<=@iUltPeriodoEliminar      
          set @iFilasProcesadas =@@ROWCOUNT
          if @iFilasProcesadas =0 
            begin
              COMMIT TRAN T1
              break
            end           
          -- FIN TRANSACCION    
          COMMIT TRAN T1
        end 
    -- Fin eliminacion datos historicos tblConsolidacionCabecera
    --*********************************************************************


  -- Procediendo a eliminar datos historicos tabla tblConsolidacionCarteraDetalle
    --*****************************************************************************
      while (1=1)
      begin
      Begin TRAN  T1      
        delete top (@iTamanoBloqueEliminar) tblConsolidacionCarteraDetalle
        where nPeriodo<=@iUltPeriodoEliminar      
        set @iFilasProcesadas =@@ROWCOUNT
        if @iFilasProcesadas =0 
          begin
            COMMIT TRAN T1
            break
          end           
        -- FIN TRANSACCION    
        COMMIT TRAN T1
      end   
    -- Fin eliminacion datos historicos tblConsolidacionCarteraDetalle
    --*********************************************************************

    -- Eliminacion datos historicos tblConsolidacionCarteraCabecera
    --*********************************************************************   
      while (1=1)
        begin
          Begin TRAN  T1      
          delete top (@iTamanoBloqueEliminar) tblConsolidacionCarteraCabecera
          where nPeriodo<=@iUltPeriodoEliminar      
          set @iFilasProcesadas =@@ROWCOUNT
          if @iFilasProcesadas =0 
            begin
              COMMIT TRAN T1
              break
            end           
          -- FIN TRANSACCION    
          COMMIT TRAN T1
        end 
    -- Fin eliminacion datos historicos tblConsolidacionCarteraCabecera
    --*********************************************************************




    end 
  
      
    
    
    set @iCodError = 0;
    set @vcMsjError = 'Eliminación de datos historicos realizada exitosamente';   
    return  
  END TRY
  BEGIN CATCH
    IF @@TRANCOUNT > 0
      begin
        rollback tran T1 -- ROLLBACK
      end
    
    SET @iCodError = -1;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
  END CATCH
  
END
GO

GO
--SqlScripter----[dbo].[spGeneraIndicadoresCompraCartera].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spGeneraIndicadoresCompraCartera]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spGeneraIndicadoresCompraCartera] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 28-11-2013
-- Description: Genera el resumen de indicadores de Compra Cartera
-- 
-- Posibles salidas:          
--   0 OK - Se ha realizado la consolidacion OK
--     -1 NOK - Periodo Inexistente
--     -2 NOK - Insercion Control Proceso
--     -3 NOK - Update Control Proceso
--   1 NOK - Limpieza de periodo
--   2 NOK - Deudores encontrados y no recaudados
--   3 NOK - Deudores encontrados y recaudados
--   4 NOK - Deudores no encontrados
--   5 NOK - Colocaciones encontrados y no recaudados
--   6 NOK - Colocaciones encontrados y recaudados
--   7 NOK - Colocaciones no encontradas
--   8 NOK - Total Monto encontrados y no recaudados
--   9 NOK - Total Monto encontrados y recaudados
--   10 NOK - Total Monto no encontradas
-- =============================================
ALTER PROCEDURE [dbo].[spGeneraIndicadoresCompraCartera]
@nPeriodo numeric(6,0),
    @iCodError int = 0 out,
    @vcMsjError varchar (100) = '' out
AS
declare
    @iIdIndicador int = 0,
    @iFilasProcesadas int = 0,
    @iIdControlProceso int = 0,
    @iCantRegistros int = 0,
    @dFechaConsolidacion date = null,
	@vcMensajeControProc varchar(100)=''
BEGIN
    SET DATEFORMAT ymd
    BEGIN TRY

    -- VALIDAR PERIODO,  ES NECESARIO QUE SEA VALIDO PARA QUE SE PUEDA REALIZAR EL RESTO DEL PROCESO
    select @iCantRegistros=count(*) from tblperiodo where nperiodo=@nPeriodo
    if @iCantRegistros=0
    begin
        set @iCodError = -1;
        set @vcMsjError = 'PERIODO INDICADO INEXISTENTE'; 
        return
    end

    -- VALIDAR PERIODO,  ES NECESARIO QUE SEA VALIDO PARA QUE SE PUEDA REALIZAR EL RESTO DEL PROCESO
    select @dFechaConsolidacion=DATEADD(MM, DATEDIFF(MM, -1, CONVERT(date,CONVERT(varchar,@nPeriodo) + '01',112)), 0) - 1
    if @dFechaConsolidacion=null
    begin
        set @iCodError = -1;
        set @vcMsjError = 'NO SE ENCONTRO UNA CONSOLIDACION DE AFILIADO Y DEUDA PARA EL PERIODO ' + @nPeriodo; 
        return
    end
    
    set @iCodError = -2;
        
    -- OBTENER ID DE CONTROL DE PROCESO E INSERTAR NUEVO REGISTRO (OK)  
    -- TAMBIEN SE INSERTA REGISTROCONSOLIDACION
    BEGIN
    -- CONTROL DE PROCESO, OBTENER ID DE CONTROL DE PROCESO
    SELECT     @iIdControlProceso = coalesce(MAX(nIdControlProceso) + 1,1)
    FROM         tblControlProceso
    WHERE     (nPeriodo = @nPeriodo)
    
    -- INSERTAR REGISTRO DE CONTROL DE PROCESO
    INSERT INTO tblControlProceso
            (nIdControlProceso,nPeriodo,dFechaInicio,dFechaFin,iIdEstado,iIdTipoControlProceso,vcDetalle)
        VALUES
            (@iIdControlProceso,@nPeriodo,GETDATE(),GETDATE(),22,8,'Ejecucion Generacion Indicadores Compra Cartera')
    end
        
        SET @iCodError = 1
        SET @vcMensajeControProc='Eliminando Indicadores CC Anteriores'
		while (1=1)
            begin
            Begin TRAN  T1      
            delete top (1000) tblIndicadorResumen
            where nPeriodo = @nPeriodo 
            and vcTipoIndicador = 'CC'      
            set @iFilasProcesadas =@@ROWCOUNT
            if @iFilasProcesadas =0 
              begin
                COMMIT TRAN T1
                break
              end           
            COMMIT TRAN T1
        end  
    
        /*Deudores encontrados y no recaudados*/
        SET @iCodError = 2
        SET @vcMensajeControProc='CC: Buscando Deudores Ofertados:SI Comprados:NO'
		
		BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'CC' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'SI' as vcUbicado,
            'NO' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdCajaDestino as nIdCajaDestino,
            cSujetoDescuento,
			case when cSujetoDescuento = 'D' then 
				count(distinct (tblConsolidacionCarteraDetalle.vcIdentificadorDeudor + convert(varchar,tblConsolidacionCarteraDetalle.tIdTipoIdentificador)))
			when cSujetoDescuento = 'A' then
				count(distinct tblConsolidacionCarteraDetalle.vcRutAval)
			end as Valor
        from (select * from tblConsolidacionCarteraDetalle where tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) as tblConsolidacionCarteraDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where tblConsolidacionCarteraDetalle.nMontoFinalCompra = 0 or tblConsolidacionCarteraDetalle.nMontoFinalCompra is Null
            and nPeriodo = @nPeriodo
        group by nIdCajaDestino,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Deudores encontrados y no recaudados*/
    
        /*Deudores encontrados y recaudados*/
        SET @iCodError = 3
        SET @vcMensajeControProc='CC: Buscando Deudores Ofertados:SI Comprados:SI'
		
		BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'CC' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'SI' as vcUbicado,
            'SI' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdCajaDestino as nIdCajaDestino,
            cSujetoDescuento,
			case when cSujetoDescuento = 'D' then 
				count(distinct (tblConsolidacionCarteraDetalle.vcIdentificadorDeudor + convert(varchar,tblConsolidacionCarteraDetalle.tIdTipoIdentificador)))
			when cSujetoDescuento = 'A' then
				count(distinct tblConsolidacionCarteraDetalle.vcRutAval)
			end as Valor
		from (select * from tblConsolidacionCarteraDetalle where tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) as tblConsolidacionCarteraDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where tblConsolidacionCarteraDetalle.nMontoFinalCompra > 0
            and tblConsolidacionCarteraDetalle.vcFechaCompra is not null
            and nPeriodo = @nPeriodo
        group by nIdCajaDestino,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Deudores encontrados y recaudados*/
    
        /*Deudores no encontrados */
        SET @iCodError = 4
        SET @vcMensajeControProc='CC: Buscando Deudores Ofertados:NO Comprados:NO'
		BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY  tblTabla1.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'CC' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'NO' as vcUbicado,
            'NO' as vcRecuadado,
            tblTabla1.iIdPeriodoMora,
            tblTabla1.nIdCajaOrigen as nIdCajaOrigen,
            null as nIdCajaDestino,
            'D' as cSujetoDescuento,
            count(distinct (convert(varchar,tblTabla1.vcIdentificadorDeudor)+ convert(varchar,tblTabla1.tIdTipoIdentificador)))as valor
        from(select 
                tblHistDeudaDetalle.vcIdentificadorDeudor as DeudoresTotal,
                tblHistDeudaDetalle.nIdInstitucion as nIdCajaOrigen,
                tblPeriodoMora.iIdPeriodoMora,
                tblHistDeudaDetalle.vcNumPagare,
                tblHistDeudaDetalle.vcIdentificadorDeudor,
                tblHistDeudaDetalle.tIdTipoIdentificador
            from tblHistDeudaDetalle inner join vwUltimoArchivoEnviadoValidado
                on vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblHistDeudaDetalle.nIdInstitucion
                and vwUltimoArchivoEnviadoValidado.nPeriodo = tblHistDeudaDetalle.nPeriodo
                and vwUltimoArchivoEnviadoValidado.iCorrelativo = tblHistDeudaDetalle.iCorrelativo
                left outer join tblPeriodoMora 
                    on COALESCE(DATEDIFF(day, case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                    and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where vwUltimoArchivoEnviadoValidado.nPeriodo = @nPeriodo
                 and vwUltimoArchivoEnviadoValidado.iIdEstado = 15
                 and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD'
            group by tblHistDeudaDetalle.nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,tblHistDeudaDetalle.vcNumPagare,tblHistDeudaDetalle.vcIdentificadorDeudor,tblHistDeudaDetalle.tIdTipoIdentificador
            ) tblTabla1 left join
            (select 
                nIdCajaOrigen as nIdCajaOrigen,
                vcIdentificadorDeudor as DeudoresEncontrados,
                tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionCarteraDetalle.vcNumPagare,
                tblConsolidacionCarteraDetalle.vcIdentificadorDeudor,
                tblConsolidacionCarteraDetalle.tIdTipoIdentificador
            from (select * from tblConsolidacionCarteraDetalle where tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) as tblConsolidacionCarteraDetalle
                left outer join tblPeriodoMora 
                on COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where nPeriodo = @nPeriodo
            group by nIdCajaOrigen,tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionCarteraDetalle.vcNumPagare,
                tblConsolidacionCarteraDetalle.vcIdentificadorDeudor,
                tblConsolidacionCarteraDetalle.tIdTipoIdentificador
            )tblTabla2 
            on tblTabla1.nIdCajaOrigen = tblTabla2.nIdCajaOrigen
            and tblTabla1.iIdPeriodoMora = tblTabla2.iIdPeriodoMora
            and tblTabla1.vcIdentificadorDeudor = tblTabla2.vcIdentificadorDeudor
            and tblTabla1.tIdTipoIdentificador = tblTabla2.tIdTipoIdentificador
            and tblTabla1.vcNumPagare = tblTabla2.vcNumPagare
        WHERE DeudoresEncontrados is null
        group by tblTabla1.iIdPeriodoMora, tblTabla1.nIdCajaOrigen
        COMMIT TRAN
        /*FIN Deudores no encontrados */

/*** FIX TOTAL DEUDORES EN PERIODO - GRN 03-03-2014***/

/*Total Deudores encontrados y no recaudados por periodo*/
        SET @iCodError = 22
        SET @vcMensajeControProc='CC: Buscando Deudores Ofertados:SI Comprados:NO'
		
		BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY nIdCajaOrigen ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'CC' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'SI' as vcUbicado,
            'NO' as vcRecuadado,
            -1 as iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdCajaDestino as nIdCajaDestino,
            cSujetoDescuento,
			case when cSujetoDescuento = 'D' then 
				count(distinct (tblConsolidacionCarteraDetalle.vcIdentificadorDeudor + convert(varchar,tblConsolidacionCarteraDetalle.tIdTipoIdentificador)))
			when cSujetoDescuento = 'A' then
				count(distinct tblConsolidacionCarteraDetalle.vcRutAval)
			end as Valor
		from (select * from tblConsolidacionCarteraDetalle where tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) as tblConsolidacionCarteraDetalle
            where tblConsolidacionCarteraDetalle.nMontoFinalCompra = 0 or tblConsolidacionCarteraDetalle.nMontoFinalCompra is Null
            and nPeriodo = @nPeriodo
        group by nIdCajaDestino,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Total Deudores encontrados y no recaudados por periodo*/
    
        /*Total Deudores encontrados y recaudados por periodo*/
        SET @iCodError = 23
        SET @vcMensajeControProc='CC: Buscando Deudores Ofertados:SI Comprados:SI'
		
		BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY nIdCajaOrigen ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'CC' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'SI' as vcUbicado,
            'SI' as vcRecuadado,
            -1 as iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdCajaDestino as nIdCajaDestino,
            cSujetoDescuento,      
			case when cSujetoDescuento = 'D' then 
				count(distinct (tblConsolidacionCarteraDetalle.vcIdentificadorDeudor + convert(varchar,tblConsolidacionCarteraDetalle.tIdTipoIdentificador)))
			when cSujetoDescuento = 'A' then
				count(distinct tblConsolidacionCarteraDetalle.vcRutAval)
			end as Valor
		from (select * from tblConsolidacionCarteraDetalle where tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) as tblConsolidacionCarteraDetalle
        where tblConsolidacionCarteraDetalle.nMontoFinalCompra > 0
            and tblConsolidacionCarteraDetalle.vcFechaCompra is not null
            and nPeriodo = @nPeriodo
        group by nIdCajaDestino,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Total Deudores encontrados y recaudados por periodo*/
    
        /*Total Deudores no encontrados por periodo*/
        SET @iCodError = 24
        SET @vcMensajeControProc='CC: Buscando Deudores Ofertados:NO Comprados:NO'
		BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY  tblTabla1.nIdCajaOrigen ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'CC' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'NO' as vcUbicado,
            'NO' as vcRecuadado,
            -1 as iIdPeriodoMora,
            tblTabla1.nIdCajaOrigen as nIdCajaOrigen,
            null as nIdCajaDestino,
            'D' as cSujetoDescuento,
            count(distinct (convert(varchar,tblTabla1.vcIdentificadorDeudor)+ convert(varchar,tblTabla1.tIdTipoIdentificador)))as valor
        from(select 
                tblHistDeudaDetalle.vcIdentificadorDeudor as DeudoresTotal,
                tblHistDeudaDetalle.nIdInstitucion as nIdCajaOrigen,
                tblHistDeudaDetalle.vcNumPagare,
                tblHistDeudaDetalle.vcIdentificadorDeudor,
                tblHistDeudaDetalle.tIdTipoIdentificador
            from tblHistDeudaDetalle inner join vwUltimoArchivoEnviadoValidado
                on vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblHistDeudaDetalle.nIdInstitucion
                and vwUltimoArchivoEnviadoValidado.nPeriodo = tblHistDeudaDetalle.nPeriodo
                and vwUltimoArchivoEnviadoValidado.iCorrelativo = tblHistDeudaDetalle.iCorrelativo
            where vwUltimoArchivoEnviadoValidado.nPeriodo = @nPeriodo
                 and vwUltimoArchivoEnviadoValidado.iIdEstado = 15
                 and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD'
            group by tblHistDeudaDetalle.nIdInstitucion,tblHistDeudaDetalle.vcNumPagare,tblHistDeudaDetalle.vcIdentificadorDeudor,tblHistDeudaDetalle.tIdTipoIdentificador
            ) tblTabla1 left join
            (select 
                nIdCajaOrigen as nIdCajaOrigen,
                vcIdentificadorDeudor as DeudoresEncontrados,
                tblConsolidacionCarteraDetalle.vcNumPagare,
                tblConsolidacionCarteraDetalle.vcIdentificadorDeudor,
                tblConsolidacionCarteraDetalle.tIdTipoIdentificador
            from (select * from tblConsolidacionCarteraDetalle where tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) as tblConsolidacionCarteraDetalle
            where nPeriodo = @nPeriodo
            group by nIdCajaOrigen,
                tblConsolidacionCarteraDetalle.vcNumPagare,
                tblConsolidacionCarteraDetalle.vcIdentificadorDeudor,
                tblConsolidacionCarteraDetalle.tIdTipoIdentificador
            )tblTabla2 
            on tblTabla1.nIdCajaOrigen = tblTabla2.nIdCajaOrigen
            and tblTabla1.vcIdentificadorDeudor = tblTabla2.vcIdentificadorDeudor
            and tblTabla1.tIdTipoIdentificador = tblTabla2.tIdTipoIdentificador
            and tblTabla1.vcNumPagare = tblTabla2.vcNumPagare
        WHERE DeudoresEncontrados is null
        group by tblTabla1.nIdCajaOrigen
        COMMIT TRAN
        /*FIN Total Deudores no encontrados por periodo*/

/*** FIN FIX ***/


    
        /*Colocaciones encontrados y no recaudados*/
        SET @iCodError = 5
        SET @vcMensajeControProc='CC: Buscando Colocaciones Ofertados:SI Comprados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'CC' as vcTipoIndicador,
            'COL' as vcCriterio,
            'SI' as vcUbicado,
            'NO' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdCajaDestino as nIdCajaDestino,
            cSujetoDescuento,
            count(distinct tblConsolidacionCarteraDetalle.vcNumPagare) as Valor
        from (select * from tblConsolidacionCarteraDetalle where tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) as tblConsolidacionCarteraDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where nMontoFinalCompra = 0 or nMontoFinalCompra is Null
            and nPeriodo = @nPeriodo
        group by nIdCajaDestino,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Colocaciones encontrados y no recaudados*/
    
        /*Colocaciones encontrados y recaudados*/
        SET @iCodError = 6
        SET @vcMensajeControProc='CC: Buscando Colocaciones Ofertados:SI Comprados:SI'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'CC' as vcTipoIndicador,
            'COL' as vcCriterio,
            'SI' as vcUbicado,
            'SI' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdCajaDestino as nIdCajaDestino,
            cSujetoDescuento,
            count(distinct tblConsolidacionCarteraDetalle.vcNumPagare) as Valor
        from (select * from tblConsolidacionCarteraDetalle where tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) as tblConsolidacionCarteraDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where tblConsolidacionCarteraDetalle.nMontoFinalCompra > 0
            and tblConsolidacionCarteraDetalle.vcFechaCompra is not null
            and nPeriodo = @nPeriodo
        group by nIdCajaDestino,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Colocaciones encontrados y recaudados*/
    
        /*Colocaciones no encontrados */
        SET @iCodError = 7
        SET @vcMensajeControProc='CC: Buscando Colocaciones Ofertados:NO Comprados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY  tblTabla1.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'CC' as vcTipoIndicador,
            'COL' as vcCriterio,
            'NO' as vcUbicado,
            'NO' as vcRecuadado,
            tblTabla1.iIdPeriodoMora,
            tblTabla1.nIdCajaOrigen as nIdCajaOrigen,
            null as nIdCajaDestino,
            'D' as cSujetoDescuento,
            count(distinct tblTabla1.vcNumPagare)as valor
        from(select 
                tblHistDeudaDetalle.vcIdentificadorDeudor as DeudoresTotal,
                tblHistDeudaDetalle.nIdInstitucion as nIdCajaOrigen,
                tblPeriodoMora.iIdPeriodoMora,
                tblHistDeudaDetalle.vcNumPagare,
                tblHistDeudaDetalle.vcIdentificadorDeudor,
                tblHistDeudaDetalle.tIdTipoIdentificador
            from tblHistDeudaDetalle inner join vwUltimoArchivoEnviadoValidado
                on vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblHistDeudaDetalle.nIdInstitucion
                and vwUltimoArchivoEnviadoValidado.nPeriodo = tblHistDeudaDetalle.nPeriodo
                and vwUltimoArchivoEnviadoValidado.iCorrelativo = tblHistDeudaDetalle.iCorrelativo
                left outer join tblPeriodoMora 
                    on COALESCE(DATEDIFF(day, case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                    and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where vwUltimoArchivoEnviadoValidado.nPeriodo = @nPeriodo
                 and vwUltimoArchivoEnviadoValidado.iIdEstado = 15
                 and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD'
            group by tblHistDeudaDetalle.nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,tblHistDeudaDetalle.vcNumPagare,tblHistDeudaDetalle.vcIdentificadorDeudor,tblHistDeudaDetalle.tIdTipoIdentificador
            ) tblTabla1 left join
            (select 
                nIdCajaOrigen as nIdCajaOrigen,
                vcIdentificadorDeudor as DeudoresEncontrados,
                tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionCarteraDetalle.vcNumPagare,
                tblConsolidacionCarteraDetalle.vcIdentificadorDeudor,
                tblConsolidacionCarteraDetalle.tIdTipoIdentificador
            from (select * from tblConsolidacionCarteraDetalle where tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) as tblConsolidacionCarteraDetalle
                left outer join tblPeriodoMora 
                on COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where nPeriodo = @nPeriodo
            group by nIdCajaOrigen,tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionCarteraDetalle.vcNumPagare,
                tblConsolidacionCarteraDetalle.vcIdentificadorDeudor,
                tblConsolidacionCarteraDetalle.tIdTipoIdentificador
            )tblTabla2 
            on tblTabla1.nIdCajaOrigen = tblTabla2.nIdCajaOrigen
            and tblTabla1.iIdPeriodoMora = tblTabla2.iIdPeriodoMora
            and tblTabla1.vcIdentificadorDeudor = tblTabla2.vcIdentificadorDeudor
            and tblTabla1.tIdTipoIdentificador = tblTabla2.tIdTipoIdentificador
            and tblTabla1.vcNumPagare = tblTabla2.vcNumPagare
        WHERE DeudoresEncontrados is null
        group by tblTabla1.iIdPeriodoMora, tblTabla1.nIdCajaOrigen
        COMMIT TRAN
        /*FIN Colocaciones no encontrados */

        /*Total Montos encontrados y no recaudados*/
        SET @iCodError = 8
        SET @vcMensajeControProc='CC: Buscando MontoTot Ofertados:SI Comprados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'CC' as vcTipoIndicador,
            'MT' as vcCriterio,
            'SI' as vcUbicado,
            'NO' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdCajaDestino as nIdCajaDestino,
            cSujetoDescuento,
            sum(coalesce(nMontoOferta,0)) as Valor
        from (select * from tblConsolidacionCarteraDetalle where tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) as tblConsolidacionCarteraDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where nMontoFinalCompra = 0 or nMontoFinalCompra is Null
            and nPeriodo = @nPeriodo
        group by nIdCajaDestino,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Total Montos encontrados y no recaudados*/
    
        /*Total Montos  encontrados y recaudados*/
        SET @iCodError = 9
        SET @vcMensajeControProc='CC: Buscando MontoTot Ofertados:SI Comprados:SI'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'CC' as vcTipoIndicador,
            'MT' as vcCriterio,
            'SI' as vcUbicado,
            'SI' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdCajaDestino as nIdCajaDestino,
            cSujetoDescuento,
            sum(coalesce(nMontoOferta,0)) as Valor
        from (select * from tblConsolidacionCarteraDetalle where tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) as tblConsolidacionCarteraDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where tblConsolidacionCarteraDetalle.nMontoFinalCompra > 0
            and tblConsolidacionCarteraDetalle.vcFechaCompra is not null
            and nPeriodo = @nPeriodo
        group by nIdCajaDestino,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Total Montos encontrados y recaudados*/
    
        /*Total Montos  no encontrados */
        SET @iCodError = 10
        SET @vcMensajeControProc='CC: Buscando MontoTot Ofertados:NO Comprados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY  tblTabla1.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'CC' as vcTipoIndicador,
            'MT' as vcCriterio,
            'NO' as vcUbicado,
            'NO' as vcRecuadado,
            tblTabla1.iIdPeriodoMora,
            tblTabla1.nIdCajaOrigen as nIdCajaOrigen,
            null as nIdCajaDestino,
            'D' as cSujetoDescuento,
            Sum(tblTabla1.nMontoOfertaColocacion)as valor
        from(select 
                tblHistDeudaDetalle.vcIdentificadorDeudor as DeudoresTotal,
                tblHistDeudaDetalle.nIdInstitucion as nIdCajaOrigen,
                tblPeriodoMora.iIdPeriodoMora,
                tblHistDeudaDetalle.vcNumPagare,
                tblHistDeudaDetalle.vcIdentificadorDeudor,
                tblHistDeudaDetalle.tIdTipoIdentificador,
                tblHistDeudaDetalle.nMontoOfertaColocacion
            from tblHistDeudaDetalle inner join vwUltimoArchivoEnviadoValidado
                on vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblHistDeudaDetalle.nIdInstitucion
                and vwUltimoArchivoEnviadoValidado.nPeriodo = tblHistDeudaDetalle.nPeriodo
                and vwUltimoArchivoEnviadoValidado.iCorrelativo = tblHistDeudaDetalle.iCorrelativo
                left outer join tblPeriodoMora 
                    on COALESCE(DATEDIFF(day, case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                    and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where vwUltimoArchivoEnviadoValidado.nPeriodo = @nPeriodo
                 and vwUltimoArchivoEnviadoValidado.iIdEstado = 15
                 and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD'
            group by tblHistDeudaDetalle.nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,tblHistDeudaDetalle.vcNumPagare,tblHistDeudaDetalle.vcIdentificadorDeudor,tblHistDeudaDetalle.tIdTipoIdentificador, tblHistDeudaDetalle.nMontoOfertaColocacion
            ) tblTabla1 left join
            (select 
                nIdCajaOrigen as nIdCajaOrigen,
                vcIdentificadorDeudor as DeudoresEncontrados,
                tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionCarteraDetalle.vcNumPagare,
                tblConsolidacionCarteraDetalle.vcIdentificadorDeudor,
                tblConsolidacionCarteraDetalle.tIdTipoIdentificador
            from (select * from tblConsolidacionCarteraDetalle where tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo) as tblConsolidacionCarteraDetalle
                left outer join tblPeriodoMora 
                on COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionCarteraDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where nPeriodo = @nPeriodo
            group by nIdCajaOrigen,tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionCarteraDetalle.vcNumPagare,
                tblConsolidacionCarteraDetalle.vcIdentificadorDeudor,
                tblConsolidacionCarteraDetalle.tIdTipoIdentificador
            )tblTabla2 
            on tblTabla1.nIdCajaOrigen = tblTabla2.nIdCajaOrigen
            and tblTabla1.iIdPeriodoMora = tblTabla2.iIdPeriodoMora
            and tblTabla1.vcIdentificadorDeudor = tblTabla2.vcIdentificadorDeudor
            and tblTabla1.tIdTipoIdentificador = tblTabla2.tIdTipoIdentificador
            and tblTabla1.vcNumPagare = tblTabla2.vcNumPagare
        WHERE DeudoresEncontrados is null
        group by tblTabla1.iIdPeriodoMora, tblTabla1.nIdCajaOrigen, tblTabla1.vcIdentificadorDeudor,tblTabla1.vcNumPagare

        COMMIT TRAN
        /*FIN Total Montos no encontrados */

        SET @iCodError = -3
		
        SET @vcMensajeControProc='CC: Finalizando';
        -- CONTROL DE PROCESO = FINALIZACION DE CONSOLIDACION DE DEUDA
        UPDATE tblControlProceso
        SET iIdEstado=24 ,vcDetalle='Generacion Indicadores Compra Cartera Terminada Exitosamente',
        dFechaFin=GETDATE()
        WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@nPeriodo
    
        SET @iCodError = 0
        SET @vcMsjError = 'Generacion Indicadores Compra Cartera Terminada Exitosamente'
    END TRY
    BEGIN CATCH
		SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        UPDATE tblControlProceso
        SET iIdEstado=25 ,vcDetalle=@vcMensajeControProc+' ['+@vcMsjError+']',
        dFechaFin=GETDATE()
        WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@nPeriodo
        return
    END CATCH
  
END
GO

GO
--SqlScripter----[dbo].[spGeneraIndicadoresProceso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spGeneraIndicadoresProceso]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spGeneraIndicadoresProceso] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 28-11-2013
-- Description: Genera el resumen de indicadores de Proceso
-- =============================================
ALTER PROCEDURE [dbo].[spGeneraIndicadoresProceso]
@nPeriodo numeric(6,0),
    @vcTipoEjecucion varchar(1),
	@vcConsolidacion varchar(2),
    @iCodError int = 0 out,
    @vcMsjError varchar (100) = '' out
AS
declare
    @iFilasProcesadas int = 0,
    @iIdControlProceso int = 0,
    @iCantRegistros int = 0,
    @dFechaConsolidacion date = null,
    @iCorrelativoFueraPlazo as int,
    @iIdInstitucion as int
BEGIN
    SET DATEFORMAT ymd
    BEGIN TRY

    -- VALIDAR PERIODO,  ES NECESARIO QUE SEA VALIDO PARA QUE SE PUEDA REALIZAR EL RESTO DEL PROCESO
    select @iCantRegistros=count(*) from tblperiodo where nperiodo=@nPeriodo
    if @iCantRegistros=0
    begin
        set @iCodError = -1;
        set @vcMsjError = 'PERIODO INDICADO INEXISTENTE'; 
        return
    end

    -- VALIDAR PERIODO,  ES NECESARIO QUE SEA VALIDO PARA QUE SE PUEDA REALIZAR EL RESTO DEL PROCESO
    select @dFechaConsolidacion=DATEADD(MM, DATEDIFF(MM, -1, CONVERT(date,CONVERT(varchar,@nPeriodo) + '01',112)), 0) - 1
    if @dFechaConsolidacion=null
    begin
        set @iCodError = -1;
        set @vcMsjError = 'NO SE ENCONTRO UNA CONSOLIDACION DE AFILIADO Y DEUDA PARA EL PERIODO ' + @nPeriodo; 
        return
    end
    
    set @iCodError = -2;
        
    -- OBTENER ID DE CONTROL DE PROCESO E INSERTAR NUEVO REGISTRO (OK)  
    -- TAMBIEN SE INSERTA REGISTROCONSOLIDACION
    BEGIN
    -- CONTROL DE PROCESO, OBTENER ID DE CONTROL DE PROCESO
    SELECT     @iIdControlProceso = coalesce(MAX(nIdControlProceso) + 1,1)
    FROM         tblControlProceso
    WHERE     (nPeriodo = @nPeriodo)
    
    -- INSERTAR REGISTRO DE CONTROL DE PROCESO
    INSERT INTO tblControlProceso
            (nIdControlProceso,nPeriodo,dFechaInicio,dFechaFin,iIdEstado,iIdTipoControlProceso,vcDetalle)
        VALUES
            (@iIdControlProceso,@nPeriodo,GETDATE(),GETDATE(),22,9,'Ejecucion Generacion Indicadores Procesos')
    end
    if @vcTipoEjecucion = 'A'
      BEGIN

		set @vcMsjError = 'Actualizando cierres fuera de plazo'
        --VERIFICACION ERRONEA SE ABORTA EJECUCION
        UPDATE tblControlProceso
        SET iIdEstado=25 ,vcDetalle=@vcMsjError
        WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@nPeriodo
      
        --INSERTAR REGISTROS DE CIERRE FUERA DE PLAZO INDICANDO RAZON DEL ABORTAR EL PROCESO
        declare cursor_instituciones_fuera_plazo cursor for
                select tblInstitucion.nIdInstitucion from 
                (SELECT tblInstitucion.nIdInstitucion,
                      MAX(CASE WHEN (@vcConsolidacion='AD' or @vcConsolidacion='CP') and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AA' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoAfi, 
                      MAX(CASE WHEN (@vcConsolidacion='AD' or @vcConsolidacion='CP') and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoDeuda,
                      MAX(CASE WHEN (@vcConsolidacion='AR') and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AR' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoRec, 
                      MAX(CASE WHEN (@vcConsolidacion='CC') and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'CC' THEN vwUltimoArchivoEnviadoValidado.iCorrelativo ELSE 0 END) AS iCorrelativoCC
                FROM      vwUltimoArchivoEnviadoValidado RIGHT OUTER JOIN
                            tblInstitucion ON vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblInstitucion.nIdInstitucion
                WHERE      (vwUltimoArchivoEnviadoValidado.nPeriodo = @nPeriodo) OR
                            (vwUltimoArchivoEnviadoValidado.nIdInstitucion IS NULL) 
							AND (tblInstitucion.bParticipa = 1) 
							AND (tblInstitucion.iIdEstado = 11)
                GROUP BY tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto) ConArchivo
                          RIGHT OUTER JOIN
                          tblInstitucion ON ConArchivo.nIdInstitucion = tblInstitucion.nIdInstitucion
                          where tblInstitucion.bParticipa = 1 
						  AND tblInstitucion.iIdEstado = 11 
						  and (iCorrelativoAfi is null 
						  or iCorrelativoDeuda is null 
						  or (iCorrelativoAfi=0 and (@vcConsolidacion='AD' or @vcConsolidacion='CP'))
						  or (iCorrelativoDeuda =0 and (@vcConsolidacion='AD' or @vcConsolidacion='CP'))
						  or (iCorrelativoRec=0 and @vcConsolidacion='AR')
						  or (iCorrelativoCC =0 and @vcConsolidacion='CC')
						  )                      
                for read only

                --Abrir cursor de instituciones fuera de plazo para insertar sus registros en tabla de cierres fuera de plazo
            
          OPEN cursor_instituciones_fuera_plazo
          FETCH NEXT FROM cursor_instituciones_fuera_plazo INTO @iIdInstitucion 
      
                select @iCorrelativoFueraPlazo=coalesce(MAX(iidcierreplazo) + 1,1) from tblCierreFueraPlazo where nPeriodo=@nPeriodo 
                WHILE @@FETCH_STATUS = 0  
                BEGIN                                 
                    -- Insertar registro
                    insert into tblCierreFueraPlazo (iidcierreplazo,nPeriodo,nIdInstitucion) values (@iCorrelativoFueraPlazo,@nPeriodo,@iIdInstitucion)
                    select @iCorrelativoFueraPlazo=@iCorrelativoFueraPlazo+1
                    FETCH NEXT FROM cursor_instituciones_fuera_plazo INTO @iIdInstitucion 
                END
          close cursor_instituciones_fuera_plazo
          deallocate cursor_instituciones_fuera_plazo
      END
      set @iCodError = 0;
      set @vcMsjError = 'Generacion de indicadores de proceso generada correctamente.';  
      
	  UPDATE tblControlProceso      
      SET iIdEstado=27 ,vcDetalle=@vcMsjError
      WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@nPeriodo
      
	  return
    END TRY
    BEGIN CATCH
		SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        UPDATE tblControlProceso
        SET iIdEstado=25 ,vcDetalle=@vcMsjError,
        dFechaFin=GETDATE()
        WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@nPeriodo
        return
    END CATCH
  
END
GO

GO
--SqlScripter----[dbo].[spGeneraIndicadoresRecaudacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spGeneraIndicadoresRecaudacion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spGeneraIndicadoresRecaudacion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 28-11-2013
-- Description: Genera el resumen de indicadores de reacaudacion
-- 
-- Posibles salidas:          
--   0 OK - Se ha realizado la consolidacion OK
--     -1 NOK - Periodo Inexistente
--     -2 NOK - Insercion Control Proceso
--     -3 NOK - Update Control Proceso
--   1 NOK - Limpieza de periodo
--   2 NOK - Deudores encontrados y no recaudados
--   3 NOK - Deudores encontrados y recaudados
--   4 NOK - Deudores no encontrados
--   5 NOK - Colocaciones encontrados y no recaudados
--   6 NOK - Colocaciones encontrados y recaudados
--   7 NOK - Colocaciones no encontradas
--   8 NOK - Total Monto encontrados y no recaudados
--   9 NOK - Total Monto encontrados y recaudados
--   10 NOK - Total Monto no encontradas
-- =============================================
ALTER PROCEDURE [dbo].[spGeneraIndicadoresRecaudacion]
@nPeriodo numeric(6,0),
    @iCodError int = 0 out,
    @vcMsjError varchar (100) = '' out
AS
declare
    @iIdIndicador int = 0,
    @iFilasProcesadas int = 0,
    @iIdControlProceso int = 0,
    @iCantRegistros int = 0,
    @dFechaConsolidacion date = null,
	@vcMensajeControProc varchar(100)=''
BEGIN
    SET DATEFORMAT ymd
    BEGIN TRY
    
    -- VALIDAR PERIODO,  ES NECESARIO QUE SEA VALIDO PARA QUE SE PUEDA REALIZAR EL RESTO DEL PROCESO
    select @dFechaConsolidacion=DATEADD(MM, DATEDIFF(MM, -1, CONVERT(date,CONVERT(varchar,@nPeriodo) + '01',112)), 0) - 1
    if @dFechaConsolidacion=null
    begin
        set @iCodError = -1;
        set @vcMsjError = 'NO SE ENCONTRO UNA CONSOLIDACION DE AFILIADO Y DEUDA PARA EL PERIODO ' + @nPeriodo; 
        return
    end
    
    -- ENCONTRAR ULTIMA CONSOLIDACION DE AFILIADO DEUDA
    select @iCantRegistros=count(*) from tblperiodo where nperiodo=@nPeriodo
    if @iCantRegistros=0
    begin
        set @iCodError = -1;
        set @vcMsjError = 'PERIODO INDICADO INEXISTENTE'; 
        return
    end

    set @iCodError = -2;
        
    -- OBTENER ID DE CONTROL DE PROCESO E INSERTAR NUEVO REGISTRO (OK)  
    -- TAMBIEN SE INSERTA REGISTROCONSOLIDACION
    BEGIN
    -- CONTROL DE PROCESO, OBTENER ID DE CONTROL DE PROCESO
    SELECT     @iIdControlProceso = coalesce(MAX(nIdControlProceso) + 1,1)
    FROM         tblControlProceso
    WHERE     (nPeriodo = @nPeriodo)
    
    -- INSERTAR REGISTRO DE CONTROL DE PROCESO
    INSERT INTO tblControlProceso
            (nIdControlProceso,nPeriodo,dFechaInicio,dFechaFin,iIdEstado,iIdTipoControlProceso,vcDetalle)
        VALUES
            (@iIdControlProceso,@nPeriodo,GETDATE(),GETDATE(),22,7,'Ejecucion Generacion Indicadores Recaudacion')
    end
        
        SET @iCodError = 1
        SET @vcMensajeControProc='Eliminando Indicadores RE Anteriores'
        while (1=1)
            begin
            Begin TRAN  T1      
            delete top (1000) tblIndicadorResumen
            where nPeriodo = @nPeriodo
            and vcTipoIndicador = 'RE'       
            set @iFilasProcesadas =@@ROWCOUNT
            if @iFilasProcesadas =0 
              begin
                COMMIT TRAN T1
                break
              end           
            COMMIT TRAN T1
        end  
    
        /*Deudores encontrados y no recaudados*/
        SET @iCodError = 2
        SET @vcMensajeControProc='RE: Buscando Deudores Ubicados:SI Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'SI' as vcUbicado,
            'NO' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
			case when cSujetoDescuento = 'D' then
				count(distinct (tblConsolidacionDetalle.vcIdentificadorDeudor + convert(varchar,tblConsolidacionDetalle.tIdTipoIdentificador))) 
			when cSujetoDescuento = 'A' then
				count(distinct tblConsolidacionDetalle.vcRutAval) 
			end as Valor
		from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where nMontoPagado = 0 or nMontoPagado is Null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Deudores encontrados y no recaudados*/
    
        /*Deudores encontrados y recaudados*/
        SET @iCodError = 3
        SET @vcMensajeControProc='RE: Buscando Deudores Ubicados:SI Recaudados:SI'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'SI' as vcUbicado,
            'SI' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
			case when cSujetoDescuento = 'D' then
				count(distinct (tblConsolidacionDetalle.vcIdentificadorDeudor + convert(varchar,tblConsolidacionDetalle.tIdTipoIdentificador))) 
			when cSujetoDescuento = 'A' then
				count(distinct tblConsolidacionDetalle.vcRutAval) 
			end as Valor
		from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where tblConsolidacionDetalle.nMontoPagado > 0
            and tblConsolidacionDetalle.vcFechaPago is not null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Deudores encontrados y recaudados*/
    
        /*Deudores no encontrados */
        SET @iCodError = 4
        SET @vcMensajeControProc='RE: Buscando Deudores Ubicados:NO Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY  tblTabla1.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'NO' as vcUbicado,
            'NO' as vcRecuadado,
            tblTabla1.iIdPeriodoMora,
            tblTabla1.nIdCajaOrigen as nIdCajaOrigen,
            null as nIdCajaDestino,
            'D' as cSujetoDescuento,
            count(distinct (convert(varchar,tblTabla1.vcIdentificadorDeudor)+convert(varchar,tblTabla1.tIdTipoIdentificador)))as valor
        from(select 
                tblHistDeudaDetalle.vcIdentificadorDeudor as DeudoresTotal,
                tblHistDeudaDetalle.nIdInstitucion as nIdCajaOrigen,
                tblPeriodoMora.iIdPeriodoMora,
                tblHistDeudaDetalle.vcNumPagare,
                tblHistDeudaDetalle.vcIdentificadorDeudor,
                tblHistDeudaDetalle.tIdTipoIdentificador
            from tblHistDeudaDetalle inner join vwUltimoArchivoEnviadoValidado
                on vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblHistDeudaDetalle.nIdInstitucion
                and vwUltimoArchivoEnviadoValidado.nPeriodo = tblHistDeudaDetalle.nPeriodo
                and vwUltimoArchivoEnviadoValidado.iCorrelativo = tblHistDeudaDetalle.iCorrelativo
                left outer join tblPeriodoMora 
                    on COALESCE(DATEDIFF(day, case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                    and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where vwUltimoArchivoEnviadoValidado.nPeriodo = @nPeriodo
                 and vwUltimoArchivoEnviadoValidado.iIdEstado = 15
                 and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD'
            group by tblHistDeudaDetalle.nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,tblHistDeudaDetalle.vcNumPagare,tblHistDeudaDetalle.vcIdentificadorDeudor,tblHistDeudaDetalle.tIdTipoIdentificador
            ) tblTabla1 left join
            (select 
                nIdCajaOrigen as nIdCajaOrigen,
                vcIdentificadorDeudor as DeudoresEncontrados,
                tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
                left outer join tblPeriodoMora 
                on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where nPeriodo = @nPeriodo
            group by nIdCajaOrigen,tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            )tblTabla2 
            on tblTabla1.nIdCajaOrigen = tblTabla2.nIdCajaOrigen
            and tblTabla1.iIdPeriodoMora = tblTabla2.iIdPeriodoMora
            and tblTabla1.vcIdentificadorDeudor = tblTabla2.vcIdentificadorDeudor
            and tblTabla1.tIdTipoIdentificador = tblTabla2.tIdTipoIdentificador
            and tblTabla1.vcNumPagare = tblTabla2.vcNumPagare
        WHERE DeudoresEncontrados is null
        group by tblTabla1.iIdPeriodoMora, tblTabla1.nIdCajaOrigen
        COMMIT TRAN
        /*FIN Deudores no encontrados */
/*** FIX Total Deudores por period - GRN 03-03-2014***/

        /*Total Deudores encontrados y no recaudados por periodo*/
        SET @iCodError = 22
        SET @vcMensajeControProc='RE: Buscando Deudores Ubicados:SI Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY nIdCajaOrigen ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'SI' as vcUbicado,
            'NO' as vcRecuadado,
            -1 as iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
			case when cSujetoDescuento = 'D' then
				count(distinct (tblConsolidacionDetalle.vcIdentificadorDeudor + convert(varchar,tblConsolidacionDetalle.tIdTipoIdentificador))) 
			when cSujetoDescuento = 'A' then
				count(distinct tblConsolidacionDetalle.vcRutAval) 
			end as Valor
        from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
        where nMontoPagado = 0 or nMontoPagado is Null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Total Deudores encontrados y no recaudados por pariodo*/
    
        /*Total Deudores encontrados y recaudados por periodo*/
        SET @iCodError = 23
        SET @vcMensajeControProc='RE: Buscando Deudores Ubicados:SI Recaudados:SI'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY nIdCajaOrigen ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'SI' as vcUbicado,
            'SI' as vcRecuadado,
            -1 as iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
  			case when cSujetoDescuento = 'D' then
				count(distinct (tblConsolidacionDetalle.vcIdentificadorDeudor + convert(varchar,tblConsolidacionDetalle.tIdTipoIdentificador))) 
			when cSujetoDescuento = 'A' then
				count(distinct tblConsolidacionDetalle.vcRutAval) 
			end as Valor
           from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
        where tblConsolidacionDetalle.nMontoPagado > 0
            and tblConsolidacionDetalle.vcFechaPago is not null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Total Deudores encontrados y recaudados por periodo*/
    
        /*Total Deudores no encontrados por periodo*/
        SET @iCodError = 24
        SET @vcMensajeControProc='RE: Buscando Deudores Ubicados:NO Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY  tblTabla1.nIdCajaOrigen ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'NO' as vcUbicado,
            'NO' as vcRecuadado,
            -1 as iIdPeriodoMora,
            tblTabla1.nIdCajaOrigen as nIdCajaOrigen,
            null as nIdCajaDestino,
            'D' as cSujetoDescuento,
		    count(distinct (convert(varchar,tblTabla1.vcIdentificadorDeudor)+convert(varchar,tblTabla1.tIdTipoIdentificador)))as valor
        from(select 
                tblHistDeudaDetalle.vcIdentificadorDeudor as DeudoresTotal,
                tblHistDeudaDetalle.nIdInstitucion as nIdCajaOrigen,
                tblHistDeudaDetalle.vcNumPagare,
                tblHistDeudaDetalle.vcIdentificadorDeudor,
                tblHistDeudaDetalle.tIdTipoIdentificador
            from tblHistDeudaDetalle inner join vwUltimoArchivoEnviadoValidado
                on vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblHistDeudaDetalle.nIdInstitucion
                and vwUltimoArchivoEnviadoValidado.nPeriodo = tblHistDeudaDetalle.nPeriodo
                and vwUltimoArchivoEnviadoValidado.iCorrelativo = tblHistDeudaDetalle.iCorrelativo
            where vwUltimoArchivoEnviadoValidado.nPeriodo = @nPeriodo
                 and vwUltimoArchivoEnviadoValidado.iIdEstado = 15
                 and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD'
            group by tblHistDeudaDetalle.nIdInstitucion,tblHistDeudaDetalle.vcNumPagare,tblHistDeudaDetalle.vcIdentificadorDeudor,tblHistDeudaDetalle.tIdTipoIdentificador
            ) tblTabla1 left join
            (select 
                nIdCajaOrigen as nIdCajaOrigen,
                vcIdentificadorDeudor as DeudoresEncontrados,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            where nPeriodo = @nPeriodo
            group by nIdCajaOrigen,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            )tblTabla2 
            on tblTabla1.nIdCajaOrigen = tblTabla2.nIdCajaOrigen
            and tblTabla1.vcIdentificadorDeudor = tblTabla2.vcIdentificadorDeudor
            and tblTabla1.tIdTipoIdentificador = tblTabla2.tIdTipoIdentificador
            and tblTabla1.vcNumPagare = tblTabla2.vcNumPagare
        WHERE DeudoresEncontrados is null
        group by tblTabla1.nIdCajaOrigen
        COMMIT TRAN
        /*FIN Total Deudores no encontrados por periodo*/

/*** FIN FIX ***/


    
        /*Colocaciones encontrados y no recaudados*/
        SET @iCodError = 5
        SET @vcMensajeControProc='RE: Buscando Colocaciones Ubicados:SI Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'COL' as vcCriterio,
            'SI' as vcUbicado,
            'NO' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
            count(distinct tblConsolidacionDetalle.vcNumPagare) as Valor
        from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where nMontoPagado = 0 or nMontoPagado is Null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Colocaciones encontrados y no recaudados*/
    
        /*Colocaciones encontrados y recaudados*/
        SET @iCodError = 6
        SET @vcMensajeControProc='RE: Buscando Colocaciones Ubicados:SI Recaudados:SI'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'COL' as vcCriterio,
            'SI' as vcUbicado,
            'SI' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
            count(distinct tblConsolidacionDetalle.vcNumPagare) as Valor
        from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where tblConsolidacionDetalle.nMontoPagado > 0
            and tblConsolidacionDetalle.vcFechaPago is not null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Colocaciones encontrados y recaudados*/
    
        /*Colocaciones no encontrados */
        SET @iCodError = 7
        SET @vcMensajeControProc='RE: Buscando Colocaciones Ubicados:NO Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY  tblTabla1.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'COL' as vcCriterio,
            'NO' as vcUbicado,
            'NO' as vcRecuadado,
            tblTabla1.iIdPeriodoMora,
            tblTabla1.nIdCajaOrigen as nIdCajaOrigen,
            null as nIdCajaDestino,
            'D' as cSujetoDescuento,
            count(distinct tblTabla1.vcNumPagare)as valor
        from(select 
                tblHistDeudaDetalle.vcIdentificadorDeudor as DeudoresTotal,
                tblHistDeudaDetalle.nIdInstitucion as nIdCajaOrigen,
                tblPeriodoMora.iIdPeriodoMora,
                tblHistDeudaDetalle.vcNumPagare,
                tblHistDeudaDetalle.vcIdentificadorDeudor,
                tblHistDeudaDetalle.tIdTipoIdentificador
            from tblHistDeudaDetalle inner join vwUltimoArchivoEnviadoValidado
                on vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblHistDeudaDetalle.nIdInstitucion
                and vwUltimoArchivoEnviadoValidado.nPeriodo = tblHistDeudaDetalle.nPeriodo
                and vwUltimoArchivoEnviadoValidado.iCorrelativo = tblHistDeudaDetalle.iCorrelativo
                left outer join tblPeriodoMora 
                    on COALESCE(DATEDIFF(day, case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                    and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where vwUltimoArchivoEnviadoValidado.nPeriodo = @nPeriodo
                 and vwUltimoArchivoEnviadoValidado.iIdEstado = 15
                 and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD'
            group by tblHistDeudaDetalle.nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,tblHistDeudaDetalle.vcNumPagare,tblHistDeudaDetalle.vcIdentificadorDeudor,tblHistDeudaDetalle.tIdTipoIdentificador
            ) tblTabla1 left join
            (select 
                nIdCajaOrigen as nIdCajaOrigen,
                vcIdentificadorDeudor as DeudoresEncontrados,
                tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
                left outer join tblPeriodoMora 
                on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where nPeriodo = @nPeriodo
            group by nIdCajaOrigen,tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            )tblTabla2 
            on tblTabla1.nIdCajaOrigen = tblTabla2.nIdCajaOrigen
            and tblTabla1.iIdPeriodoMora = tblTabla2.iIdPeriodoMora
            and tblTabla1.vcIdentificadorDeudor = tblTabla2.vcIdentificadorDeudor
            and tblTabla1.tIdTipoIdentificador = tblTabla2.tIdTipoIdentificador
            and tblTabla1.vcNumPagare = tblTabla2.vcNumPagare
        WHERE DeudoresEncontrados is null
        group by tblTabla1.iIdPeriodoMora, tblTabla1.nIdCajaOrigen
        COMMIT TRAN
        /*FIN Colocaciones no encontrados */

        /*Total Montos encontrados y no recaudados*/
        SET @iCodError = 8
        SET @vcMensajeControProc='RE: Buscando MontoTot Ubicados:SI Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'MT' as vcCriterio,
            'SI' as vcUbicado,
            'NO' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
            sum(coalesce(nMontoCobrar,0)) as Valor
        from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where nMontoPagado = 0 or nMontoPagado is Null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Total Montos encontrados y no recaudados*/
    
        /*Total Montos  encontrados y recaudados*/
        SET @iCodError = 9
        SET @vcMensajeControProc='RE: Buscando MontoTot Ubicados:SI Recaudados:SI'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'MT' as vcCriterio,
            'SI' as vcUbicado,
            'SI' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
            sum(coalesce(nMontoCobrar,0)) as Valor
        from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where tblConsolidacionDetalle.nMontoPagado > 0
            and tblConsolidacionDetalle.vcFechaPago is not null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Total Montos encontrados y recaudados*/
    
        /*Total Montos  no encontrados */
        SET @iCodError = 10
        SET @vcMensajeControProc='RE: Buscando MontoTot Ubicados:NO Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY  tblTabla1.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'MT' as vcCriterio,
            'NO' as vcUbicado,
            'NO' as vcRecuadado,
            tblTabla1.iIdPeriodoMora,
            tblTabla1.nIdCajaOrigen as nIdCajaOrigen,
            null as nIdCajaDestino,
            'D' as cSujetoDescuento,
            Sum(tblTabla1.nMontoCobrar)as valor
        from(select 
                tblHistDeudaDetalle.vcIdentificadorDeudor as DeudoresTotal,
                tblHistDeudaDetalle.nIdInstitucion as nIdCajaOrigen,
                tblPeriodoMora.iIdPeriodoMora,
                tblHistDeudaDetalle.vcNumPagare,
                tblHistDeudaDetalle.vcIdentificadorDeudor,
                tblHistDeudaDetalle.tIdTipoIdentificador,
                tblHistDeudaDetalle.nMontoCobrar
            from tblHistDeudaDetalle inner join vwUltimoArchivoEnviadoValidado
                on vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblHistDeudaDetalle.nIdInstitucion
                and vwUltimoArchivoEnviadoValidado.nPeriodo = tblHistDeudaDetalle.nPeriodo
                and vwUltimoArchivoEnviadoValidado.iCorrelativo = tblHistDeudaDetalle.iCorrelativo
                left outer join tblPeriodoMora 
                    on COALESCE(DATEDIFF(day, case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                    and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where vwUltimoArchivoEnviadoValidado.nPeriodo = @nPeriodo
                 and vwUltimoArchivoEnviadoValidado.iIdEstado = 15
                 and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD'
            group by tblHistDeudaDetalle.nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,tblHistDeudaDetalle.vcNumPagare,tblHistDeudaDetalle.vcIdentificadorDeudor,tblHistDeudaDetalle.tIdTipoIdentificador, tblHistDeudaDetalle.nMontoCobrar
            ) tblTabla1 left join
            (select 
                nIdCajaOrigen as nIdCajaOrigen,
                vcIdentificadorDeudor as DeudoresEncontrados,
                tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
                left outer join tblPeriodoMora 
                on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where nPeriodo = @nPeriodo
            group by nIdCajaOrigen,tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            )tblTabla2 
            on tblTabla1.nIdCajaOrigen = tblTabla2.nIdCajaOrigen
            and tblTabla1.iIdPeriodoMora = tblTabla2.iIdPeriodoMora
            and tblTabla1.vcIdentificadorDeudor = tblTabla2.vcIdentificadorDeudor
            and tblTabla1.tIdTipoIdentificador = tblTabla2.tIdTipoIdentificador
            and tblTabla1.vcNumPagare = tblTabla2.vcNumPagare
        WHERE DeudoresEncontrados is null
        group by tblTabla1.iIdPeriodoMora, tblTabla1.nIdCajaOrigen, tblTabla1.vcIdentificadorDeudor,tblTabla1.vcNumPagare

        COMMIT TRAN
        /*FIN Total Montos no encontrados */

        SET @iCodError = -3
        SET @vcMensajeControProc='RE: Finalizando'
        -- CONTROL DE PROCESO = FINALIZACION DE CONSOLIDACION DE DEUDA
        UPDATE tblControlProceso
        SET iIdEstado=24 ,vcDetalle='Generacion Indicadores Recaudacion Terminada Exitosamente',
        dFechaFin=GETDATE()
        WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@nPeriodo
    
        SET @iCodError = 0
        SET @vcMsjError = 'Generacion Indicadores Recaudacion Terminada Exitosamente'
    END TRY
    BEGIN CATCH
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        UPDATE tblControlProceso
        SET iIdEstado=25 ,vcDetalle=@vcMensajeControProc+' ['+@vcMsjError+']',
        dFechaFin=GETDATE()
        WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@nPeriodo
		return
    END CATCH
  
END
GO

GO
--SqlScripter----[dbo].[spGetCabeceraWorkflow].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spGetCabeceraWorkflow]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spGetCabeceraWorkflow] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    ENV
-- Create date: 22-10-2013
-- Description: Recupera un registro de cabecera según institucion,perido, correaltivo y tipo de archivo.
-- 
-- =============================================
ALTER PROCEDURE [dbo].[spGetCabeceraWorkflow]
@iInstitucion int = 0,
  @iPeriodo int = 0,
  @vcTipoArchivo varchar(2) = '  ',     
  @iCorrelativo int,
  @iRutUsuarioEnv int = null out,   
  @vcNombreArchivo varchar(23) out,
  @dFechaIng varchar(20) ='2013/01/01' out ,
  @nTotalRegistros int = 0 out,
  @nMonto1 numeric(30,0) = 0 out,
  @nMonto2 numeric(30,0) = 0 out,
  @nMonto3 numeric(30,0) = 0 out,
  @vcLinkError varchar(255) = ' ' out,
  @vcLinkArchivo varchar(255) = ' ' out,
  @iIdEstado as int = 0 out,
  @CodError int = 0 out,  
  @MsjError varchar(500) = 'OK' out
  
AS
BEGIN TRY

  
  -- Dependiendo del tipo de resultado ingresado se define el estado final del archivo

  
  -- Se actualiza estado de archivo de cabecera a subir
  if @vcTipoArchivo = 'AA' --  AFILIADOS

  begin
    SELECT  @vcNombreArchivo=[vcNombreArchivo]
      ,@dFechaIng = [dFechaIng]
      ,@nTotalRegistros =[nTotalRegistros]
      ,@nmonto1 = [nTotalRentaImponible]
      ,@vcLinkArchivo = [vcLinkArchivo]
      ,@iRutUsuarioEnv =  [iRutUsuarioEnv]
      ,@iIdEstado = [iIdEstado]
      ,@vcLinkError = [vcLinkError]
  FROM [dbo].[tblAfiliadoCabecera]
            
    set @CodError = 0;
    set @MsjError = 'OK'; 
    return @iCorrelativo
  end
  
  if @vcTipoArchivo = 'AD' -- DEUDAS  
  BEGIN

    SELECT  @vcNombreArchivo=[vcNombreArchivo]
      ,@dFechaIng = [dFechaIng]
      ,@nTotalRegistros =[nTotalReg]
      ,@nmonto1 = [nTotalSaldoCapital]
      ,@nmonto2 = [nTotalCapitalInicial]
      ,@nmonto3 = [nTotalMontoCobrar]
      ,@vcLinkArchivo = [vcLinkArchivo]
      ,@iRutUsuarioEnv =  [iRutUsuarioEnv]
      ,@iIdEstado = [iIdEstado]
      ,@vcLinkError = [vcLinkError]
  FROM [dbo].[tblDeudaCabecera]
            
    set @CodError = 0;
    set @MsjError = 'OK'; 
    return @iCorrelativo
  END
  
  if @vcTipoArchivo = 'AR' -- RECAUDACIONES
  BEGIN
    SELECT  @vcNombreArchivo=[vcNombreArchivo]
      ,@dFechaIng = [dFechaIngreso]
      ,@nTotalRegistros =[nTotalRegistros]
      ,@nmonto1 = [nTotalMontoCobrar]
      ,@nmonto2 = [nTotalMontoPendiente]
      ,@vcLinkArchivo = [vcLinkArchivo]
      ,@iRutUsuarioEnv =  [iRutUsuarioEnv]
      ,@iIdEstado = [iIdEstado]
      ,@vcLinkError = [vcLinkError]
  FROM [dbo].[tblRecaudacionCabecera]


    
    set @CodError = 0;
    set @MsjError = 'OK'; 
    return @iCorrelativo
  END
  if @vcTipoArchivo = 'CC' -- CARTERA COMPRADA
  BEGIN
    SELECT  @vcNombreArchivo=[vcNombreArchivo]
      ,@dFechaIng = [dFechaIngreso]
      ,@nTotalRegistros =[nTotalRegistros]
      ,@nmonto1 = [nTotalCarterasCompradas]
      ,@vcLinkArchivo = [vcLinkArchivo]
      ,@iRutUsuarioEnv =  [iRutUsuarioEnv]
      ,@iIdEstado = [iIdEstado]
      ,@vcLinkError = [vcLinkError]
  FROM [dbo].[tblCarteraCompradaCabecera]
 
    set @CodError = 0;
    set @MsjError = 'OK'; 
    return @iCorrelativo
  END
  
  set @CodError = 1;
  set @MsjError = ERROR_MESSAGE();
  return  -1;
  
END TRY
BEGIN CATCH
  set @MsjError = ERROR_MESSAGE();
  set @CodError = ERROR_NUMBER() ;
  return -2;
END CATCH
GO

GO
--SqlScripter----[dbo].[spGetDescEstado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spGetDescEstado]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spGetDescEstado] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    ENV
-- Create date: 31-07-13
-- Description: Obtiene desde la tabla de estados  la descrici≤n correspondiente al par identificador y tipo pasados como parßmetros.  
-- =============================================
ALTER PROCEDURE [dbo].[spGetDescEstado]
@iIdEstado int ,
  @iIdTipoEstado int ,
  @vcEstado varchar(50) output,
  @iCodError int output,
  @vcMsjError varchar(50) output
  
AS
BEGIN TRY 
Declare 

 @condicion varchar(100)
  
  set @vcEstado= ( select vcEstado from  tblEstado where iIdEstado =  @iIdEstado AND  iIdTipoEstado =  @iIdTipoEstado)
  
  
  if @vcEstado is null  
  begin
    set @iCodError = -2;
    set @vcMsjError = 'Institucion no existe';
    return
  end

  set @iCodError = 0;
  set @vcMsjError = 'OK';
  
    return
END TRY
BEGIN CATCH
    SET @iCodError = -1;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
END CATCH
GO

GO
--SqlScripter----[dbo].[spGetInstitucionxRUT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spGetInstitucionxRUT]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spGetInstitucionxRUT] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:		E Nicholls
-- Create date: 08-10-2013
-- Description:	Recupera Cod Institucion dado el RUT de un usuario
-- =============================================
ALTER PROCEDURE [dbo].[spGetInstitucionxRUT]
@iIdRut int = null,
  @nIdInstucion numeric(4,0) = -1 out ,
  @iCodError int = 0 out,  
  @vcMsjError varchar(50) = 'OK' out
AS
BEGIN TRY


BEGIN
  set @nIdInstucion =( SELECT [nIdInstitucion]
  FROM [intercajas].[dbo].[tblUsuario]
  WHERE [iRut] = @iIdRut)

    set @iCodError = 0;
    set @vcMsjError = 'OK';

	IF @nIdInstucion is null
	BEGIN
	    set @iCodError = -1;
		set @vcMsjError = 'NOK';
	END
END
END TRY
BEGIN CATCH
  set @iCodError = -1;
  set @vcMsjError = ERROR_MESSAGE()

  
END CATCH
GO

GO
--SqlScripter----[dbo].[spGetMailAdmin].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spGetMailAdmin]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spGetMailAdmin] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    ENV
-- Create date: 11-09-13
-- Description: Obtiene el mail de administraci╛n (µintercajas╞) desde la tabla de emailoperacion
-- =============================================
ALTER PROCEDURE [dbo].[spGetMailAdmin]
@vcEmail varchar(50) output,
  @iCodError int output,
  @vcMsjError varchar(50) output
  
AS
BEGIN TRY 
Declare 
 @result int 
  
  exec dbo.spGetParamInstitucion 0, 'MAILTO' , @vcEmail OUTPUT, @iCodError OUTPUT , @vcMsjError OUTPUT
  
  set @iCodError = 0;
  set @vcMsjError = 'OK';
return
END TRY
BEGIN CATCH
    SET @iCodError = -1;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
END CATCH
GO

GO
--SqlScripter----[dbo].[spGetMailOperacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spGetMailOperacion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spGetMailOperacion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    ENV
-- Create date: 31-07-13
-- Description: Obtiene desde la tabla de emailoperacion  el mail para una operacion y una instituci0n dada.  
-- =============================================
ALTER PROCEDURE [dbo].[spGetMailOperacion]
@iInstitucion int ,
  @vcPrefijoOperacion varchar(50),
  @vcEmail varchar(50) output,
  @iCodError int output,
  @vcMsjError varchar(50) output
  
AS
BEGIN TRY 
Declare 

 @condicion varchar(100)
  
  set @vcEmail = ''
  if (@iInstitucion = 0) 
  BEGIN
  set @condicion = @vcPrefijoOperacion + '%'
  END
  else
  BEGIN
  set @condicion = @vcPrefijoOperacion + '%' + CAST(@iInstitucion AS VARCHAR(4))
  END
  -- Se recupera mail
  set @vcEmail= ( select vcEmail from  tblEmailOperacion where vcOperacion LIKE (@condicion) )
  
  
  if @vcEmail is null  
  begin
    set @iCodError = -2;
    set @vcMsjError = 'Operacion no existe';
    return
  end

  set @iCodError = 0;
  set @vcMsjError = 'OK';
  
    return
END TRY
BEGIN CATCH
    SET @iCodError = -1;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
END CATCH
GO

GO
--SqlScripter----[dbo].[spGetMailxRUT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spGetMailxRUT]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spGetMailxRUT] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:		E Nicholls
-- Create date: 17-10-2013
-- Description:	Recupera email dado el RUT de un usuario
-- =============================================
ALTER PROCEDURE [dbo].[spGetMailxRUT]
@iIdRut int = null,
  @vcEmail varchar(50) = '' out ,
  @iCodError int = 0 out,  
  @vcMsjError varchar(50) = 'OK' out
AS
BEGIN TRY


BEGIN
  set @vcEmail =( SELECT [vcEmail]
  FROM [intercajas].[dbo].[tblUsuario]
  WHERE [iRut] = @iIdRut)

    set @iCodError = 0;
    set @vcMsjError = 'OK';

	IF @vcEmail is null
	BEGIN
	    set @iCodError = -1;
		set @vcMsjError = 'NOK';
	END
END
END TRY
BEGIN CATCH
  set @iCodError = -1;
  set @vcMsjError = ERROR_MESSAGE()
END CATCH
GO

GO
--SqlScripter----[dbo].[spGetNombreInstitucion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spGetNombreInstitucion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spGetNombreInstitucion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    ENV
-- Create date: 31-07-13
-- Description: Obtiene el nombre de una instituci≤n dada.  
-- =============================================
ALTER PROCEDURE [dbo].[spGetNombreInstitucion]
@iInstitucion int ,
  @vcNombre varchar(50) output,
  @iCodError int output,
  @vcMsjError varchar(50) output
  
AS
BEGIN TRY 
Declare 

 @condicion varchar(100)
  
  set @vcNombre= ( select vcNombre from  tblInstitucion where nIdInstitucion =  @iInstitucion )
  
  
  if @vcNombre is null  
  begin
    set @iCodError = -2;
    set @vcMsjError = 'Institucion no existe';
    return
  end

  set @iCodError = 0;
  set @vcMsjError = 'OK';
  
    return
END TRY
BEGIN CATCH
    SET @iCodError = -1;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
END CATCH
GO

GO
--SqlScripter----[dbo].[spGetParamInstitucion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spGetParamInstitucion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spGetParamInstitucion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    ENV
-- Create date: 25-09-2013
-- Description: Obtiene desde la tabla de parametros  el su valor para una instituci≤n dada.  Si institucion es 0, busca no por institucion
-- =============================================
ALTER PROCEDURE [dbo].[spGetParamInstitucion]
@iInstitucion int = 0,
  @vcPrefijoParametro varchar(50)  = '',
  @vcValor varchar(250) output,
  @iCodError int output,
  @vcMsjError varchar(50) output
  
AS
BEGIN TRY 
Declare 

 @condicion varchar(100)
  
  set @vcValor = ''
  if (@iInstitucion = 0) 
  BEGIN
  set @condicion = @vcPrefijoParametro + '%'
  END
  else
  BEGIN
  set @condicion = @vcPrefijoParametro + '%' + CAST(@iInstitucion AS VARCHAR(4))
  END
  -- Se recupera mail
  set @vcValor= ( select vcValor from  tblParametro where tblParametro.vcParametro LIKE (@condicion) )
  
  
  if @vcValor is null  
  begin
    set @iCodError = -2;
    set @vcMsjError = @condicion;
    return
  end

  set @iCodError = 0;
  set @vcMsjError = 'OK';
  
    return
END TRY
BEGIN CATCH
    SET @iCodError = -1;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
END CATCH
GO

GO
--SqlScripter----[dbo].[spGetStaleFiles].sql
GO
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

GO
--SqlScripter----[dbo].[spInsertaCabeceraUploadArchivo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spInsertaCabeceraUploadArchivo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spInsertaCabeceraUploadArchivo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 24-06-2013
-- Description: Valida que se puede realizar un upload de archivo
-- =============================================
ALTER PROCEDURE [dbo].[spInsertaCabeceraUploadArchivo]
@iRut int,  
  @iInstitucion int = 0,
  @iPeriodo int = 0,
  @vcTipoArchivo varchar(2) = '  ',
  @vcNombreArchivo varchar(20) ,
  @biCantidadRegistros bigint,
  @iCorrelativo int=1 out,
  @iCodError int = 0 out, 
  @vcMsjError varchar(50) = 'OK' out
AS

BEGIN
  
  -- Se inserta cabecera de archivo que se procedera a subir
  if @vcTipoArchivo = 'AA' -- Se sube archivo de AFILIADOS
  begin
    select @iCorrelativo= (select max (t.correlativo) from (
      SELECT     max(iCorrelativo)+1 as correlativo
      FROM         tblAfiliadoCabecera
      WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo) 
      union select 1 )  t)
    -- Se inserta registro de cabecera en estado INGRESADO
    INSERT INTO tblAfiliadoCabecera
      (nIdInstitucion, nPeriodo, iCorrelativo, vcNombreArchivo, dFechaIng, 
      nTotalRegistros, nTotalRentaImponible, vcLinkArchivo, iRutUsuarioEnv, iIdEstado)
    VALUES     
      (@iInstitucion, @iPeriodo, @iCorrelativo, @vcNombreArchivo +  cast(@iCorrelativo as varchar)+'.csv' ,     
      GETDATE(), @biCantidadRegistros , 0, '', @iRut, 18)       
            
    set @iCodError = 0;
    set @vcMsjError = 'OK'; 
    return
  end
  
  if @vcTipoArchivo = 'AD' -- Se sube archivo de DEUDAS 
  BEGIN
    select @iCorrelativo= (select max (t.correlativo) from (
      SELECT     max(iCorrelativo)+1 as correlativo
      FROM         tblDeudaCabecera
      WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo)  
      union select 1 )  t)
  -- Se inserta registro de cabecera en estado INGRESADO
    INSERT INTO tblDeudaCabecera
      (nIdInstitucion, nPeriodo, iCorrelativo, vcNombreArchivo, dFechaIng, nTotalReg, vcLinkArchivo, 
      iRutUsuarioEnv, iIdEstado, nTotalSaldoCapital, nTotalCapitalInicial, 
            nTotalMontoCobrar)
    VALUES  (@iInstitucion,@iPeriodo,@iCorrelativo,
      @vcNombreArchivo +  cast(@iCorrelativo as varchar)+'.csv', GETDATE(),@biCantidadRegistros, '',@iRut, 18, 0, 0, 0)   
            
    set @iCodError = 0;
    set @vcMsjError = 'OK'; 
    return
  END
  
  if @vcTipoArchivo = 'AR' -- Se sube archivo de RECAUDACIONES
  BEGIN
  
    select @iCorrelativo= (select max (t.correlativo) from (
      SELECT     max(iCorrelativo)+1 as correlativo
      FROM         tblRecaudacionCabecera     
      WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo)         
      union select 1 )  t)
  
  -- Se inserta registro de cabecera en estado INGRESADO
    INSERT INTO tblRecaudacionCabecera
      (nIdInstitucion, nPeriodo, iCorrelativo, vcNombreArchivo, dFechaIngreso, nTotalRegistros, vcLinkArchivo, iRutUsuarioEnv, iIdEstado, nTotalMontoCobrar, 
            nTotalMontoPendiente)
    VALUES     (@iInstitucion,@iPeriodo,@iCorrelativo,@vcNombreArchivo +  cast(@iCorrelativo as varchar)+'.csv', GETDATE(),@biCantidadRegistros, '',@iRut, 18, 0, 0)
    
    set @iCodError = 0;
    set @vcMsjError = 'OK'; 
    return
  END
  
  
  if @vcTipoArchivo = 'CC' -- Se sube archivo de Compra de Cartera
  BEGIN
    
    select @iCorrelativo= (select max (t.correlativo) from (
      SELECT     max(iCorrelativo)+1 as correlativo
      FROM         tblCarteraCompradaCabecera     
      WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo)         
      union select 1 )  t)
  
  -- Se inserta registro de cabecera en estado INGRESADO
    INSERT INTO tblCarteraCompradaCabecera
      (nIdInstitucion, nPeriodo, iCorrelativo, vcNombreArchivo, dFechaIngreso, nTotalRegistros, vcLinkArchivo, iRutUsuarioEnv, iIdEstado, nTotalCarterasCompradas)
    VALUES     (@iInstitucion,@iPeriodo,@iCorrelativo,@vcNombreArchivo +  cast(@iCorrelativo as varchar)+'.csv', GETDATE(),@biCantidadRegistros, '',@iRut, 18, 0)
    
    set @iCodError = 0;
    set @vcMsjError = 'OK'; 
    return
  END

  set @iCodError = 1;
  set @vcMsjError = 'TIPO DE ARCHIVO INCORRECTO'; 
  return  
  
END
GO

GO
--SqlScripter----[dbo].[spInsertUpdatePerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spInsertUpdatePerfil]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spInsertUpdatePerfil] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 01-07-13
-- Description: Inserta y Actualiza Perfil
-- =============================================
ALTER PROCEDURE [dbo].[spInsertUpdatePerfil]
@iIdPerfil int,
  @iEstadoPerfil int,
  @iAsignaCaja int,
  @idsFuncionalidad typeIntegerListTable readonly,
  @vcNombrePerfil varchar(50),
  @iCodError int out,
  @vcMsjError varchar(50) out
  
AS
BEGIN
  set @iCodError = 0
  set @vcMsjError = ''
    
  BEGIN TRAN T1
  BEGIN TRY
    
    if @iIdPerfil = -1 
    begin
      select @iIdPerfil=coalesce(MAX(iIdPerfil)+1,1) from tblPerfil;
    
      insert into tblPerfil (iIdPerfil, vcNombrePerfil, iIdEstado, bAsignaCaja)
      values (@iIdPerfil , @vcNombrePerfil, 3,@iAsignaCaja);
    end
    else
    begin
      update tblPerfil 
      set vcNombrePerfil = @vcNombrePerfil,
        iIdEstado = @iEstadoPerfil,
        bAsignaCaja = @iAsignaCaja
      where iIdPerfil = @iIdPerfil
    end
    -- Se elimina todas las realaciones PerfilFuncioanalidad
    delete from tblRel_PerfilFunc where iIdPerfil = @iIdPerfil;
    
    -- se insertan las relaciones PerfilFuncioanalidad
    insert into tblRel_PerfilFunc (iIdPerfil, iIdFuncionalidad)
    select @iIdPerfil, Entero as iIdFuncionalidad  from @idsFuncionalidad;
  
    COMMIT TRAN T1
    return
  END TRY
  BEGIN CATCH
    SET @iCodError = 1;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    ROLLBACK TRAN T1
    return
  END CATCH
  
  
END
GO

GO
--SqlScripter----[dbo].[spInsertUpdateUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spInsertUpdateUsuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spInsertUpdateUsuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 04-07-13  
-- Description: Crea y Actualiza usuarios
-- =============================================
ALTER PROCEDURE [dbo].[spInsertUpdateUsuario]
@vcTipoOperacion varchar(1),
    @iParamPermiso int,
    @iRut Int,
    @vcNombre VarChar(50),
    @vcEmail VarChar(50),
    @iInstitucion Int,
    @iEstado Int,
    @iDsPerfiles typeIntegerListTable readonly,
    @vcPassword varchar(8) out,
    @iCodError Int out,
    @vcMsjError VarChar(50) out,
    @iCont int = 0,
    @iDias_caducidad_clave int = 0,
    @vcHashPassword varchar(32) = ''
AS
BEGIN
  set @iCodError = 0
  set @vcMsjError = ''
  set @vcPassword = ''  

  -- Se recuperan datos de configuracion
      select @iDias_caducidad_clave = vcValor 
      from tblParametro
      where iIdParametro = 7;

    if @vcTipoOperacion = 'I'
    --Insert----------------------------------------------------------------------------------------
    begin
      select @iCont=COUNT(iRut) from tblUsuario where iRut = @iRut;
      if @iCont > 0 -- se compruba que el usuario no existe
      begin
        set @iCodError = 1;
        set @vcMsjError = 'El usuario ya está registrado en la base de datos' ;
        return
      end
      
      select @iCont=COUNT(iRut) from tblUsuario where vcEmail = @vcEmail;
      if @iCont > 0 -- se compruba que el email no este registrado
      begin
        set @iCodError = 1;
        set @vcMsjError = 'El email ya está registrado en la base de datos.' ;
        return
      end
      
      -- Se genera una clave aleatorea
      SELECT  @vcPassword= LEFT(CAST(NEWID() AS VARCHAR(1000)), 8)
      SELECT @vcHashPassword=CONVERT(NVARCHAR(32),HashBytes('MD5', @vcPassword),2)
      
      BEGIN TRAN T1
      BEGIN TRY 
        --Se inserta Usuario
        insert into tblUsuario (iRut, vcNombre, vcEmail,nIdInstitucion,iIdEstado,tIntentos,dFecha_ing,dFecha_mod)
        values (@iRut , @vcNombre, @vcEmail, @iInstitucion, @iEstado,0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
        
        --Se inserta la password con estado Creada
        insert into tblPassword (nIdPassword,iRut,dFechaCreacion,dFechaCaducidad,vcHashClave,iIdEstado)
        select MAX(nIdPassword) + 1,@iRut,current_timestamp,current_timestamp + @iDias_caducidad_clave day, @vcHashPassword, 10 from tblPassword
        
        -- se insertan las relaciones PerfilFuncioanalidad
        insert into tblRel_UsuarioPerfil (iRut, iIdPerfil)
        select @iRut, Entero as iIdFuncionalidad  from @idsPerfiles;
        
        COMMIT TRAN T1
        return
      END TRY
      BEGIN CATCH
        SET @iCodError = 1;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        ROLLBACK TRAN T1
        return
      END CATCH
      
    end  
    --End Insert----------------------------------------------------------------------------------------
    else 
    --Update--------------------------------------------------------------------------------------------
    begin
      select @iCont=COUNT(iRut) from tblUsuario where vcEmail = @vcEmail and iRut <> @iRut;
      if @iCont > 0 -- se compruba que el email no este registrado
      begin
        set @iCodError = 2;
        set @vcMsjError = 'El email ya está registrado en la base de datos.' ;
        return
      end
      BEGIN TRAN T2
      BEGIN TRY 
	    
        --Se Actualiza Usuario
        update tblUsuario
        set vcNombre = @vcNombre, 
          vcEmail = @vcEmail,
          nIdInstitucion = @iInstitucion,
          iIdEstado = @iEstado,
          dFecha_mod = CURRENT_TIMESTAMP,
		  tIntentos = CASE WHEN @iEstado = 5 THEN 0 ELSE tIntentos END
		where iRut = @iRut; 
        
		--se actualiza la fehca de caducidad de la clave activa
		if @iEstado = 5
		BEGIN
			update tblPassword
				set dFechaCaducidad = (select current_timestamp + @iDias_caducidad_clave day)
			where iRut = @iRut and iIdEstado = 8
        END

        if @iParamPermiso = 0 --El usuario NO tiene permisos para modificar usuarios de todas las instituciocnes
        begin
          -- Se elimina todas las realaciones PerfilFuncioanalidad
          DELETE FROM tblRel_UsuarioPerfil
          FROM         tblRel_UsuarioPerfil INNER JOIN
                      tblPerfil ON tblRel_UsuarioPerfil.iIdPerfil = tblPerfil.iIdPerfil
          WHERE     (tblPerfil.bAsignaCaja = 1) AND (tblRel_UsuarioPerfil.iRut = @iRut) 
        end
        else
        begin
          -- Se elimina todas las realaciones PerfilFuncioanalidad
          delete from tblRel_UsuarioPerfil where iRut = @iRut;
        end
        -- se insertan las relaciones PerfilFuncioanalidad
        insert into tblRel_UsuarioPerfil (iRut, iIdPerfil)
        select @iRut, Entero as iIdFuncionalidad  from @idsPerfiles;
        COMMIT TRAN T2
        return
      END TRY
      BEGIN CATCH
        SET @iCodError = 2;
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        ROLLBACK TRAN T2
        return
      END CATCH
    end
    --End Update--------------------------------------------------------------------------------------------
    
END
GO

GO
--SqlScripter----[dbo].[spListaArchivosSubidos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spListaArchivosSubidos]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spListaArchivosSubidos] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    <MSC,,Mauricio Soto>
-- Create date: <21/06/2013>
-- Description: <Obtiene lista de archivos en proceso desde cabeceras de afiliados, deudas y recaudaciones para el period0 indicado e institucion.
-- GRN	31-07-2014 - Se implemento busqueda en archivos Historicos
-- =============================================
ALTER PROCEDURE [dbo].[spListaArchivosSubidos]
@iPeriodo int, 
  @iInstitucion int,
  @vcTipoArchivos varchar(2) --Dependiendo del tipo de archivos se listan TODOS o SOLO LOS DEL CRITERIO
AS
DECLARE
  @iAA_Historica int,
  @iAD_Historica int,
  @iAR_Historica int,
  @iCC_Historica int,
  @iCD int,
  @iCR int,
  @iCC int,
  @dfechaRegistro as datetime,
  @nPeriodoActual numeric(6,0),
  @nDifPeriodo int
BEGIN
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  SET NOCOUNT ON;
    select @nPeriodoActual=MAX(nPeriodo) from tblPeriodo
    select @nDifPeriodo=((convert(int,@nPeriodoActual)/100)-(@iPeriodo/100))*12 + ((convert(int,@nPeriodoActual)%100)-(@iPeriodo%100))
    set @iAA_Historica =0
	set @iAD_Historica =0
	set @iAR_Historica =0
	set @iCC_Historica =0
	set @iCD = 0
	set @iCR = 0
	set @iCC = 0
    
    if @nDifPeriodo > 0
    begin
		set @iAA_Historica =1
		set @iAD_Historica =1
		
		set @dfechaRegistro = null
		SELECT @dfechaRegistro =max(dFechaRegistro)      
		FROM dbo.tblRegistroConsolidacion
		where nPeriodo=@iPeriodo
		and iIdEstado=27
		and vcTipoConsolidacion='CD'
		
		if @dfechaRegistro is not null
			set @iCD = 1
    end
    if @nDifPeriodo > 2
    begin
		set @iAR_Historica = 1
		
		set @dfechaRegistro = null
		SELECT @dfechaRegistro =max(dFechaRegistro)      
		FROM dbo.tblRegistroConsolidacion
		where nPeriodo=@iPeriodo
		and iIdEstado=27
		and vcTipoConsolidacion='CR'
		
		if @dfechaRegistro is not null
			set @iCR = 1
    end
    if @nDifPeriodo > 1
    begin
		set @iCC_Historica = 1
		
		set @dfechaRegistro = null
		SELECT @dfechaRegistro =max(dFechaRegistro)      
		FROM dbo.tblRegistroConsolidacion
		where nPeriodo=@iPeriodo
		and iIdEstado=27
		and vcTipoConsolidacion='CC'
		
		if @dfechaRegistro is not null
			set @iCC = 1
    end
    
    select * from (
    SELECT     'AFILIADO' AS tipo_archivo,'AA' as tipArch, tblAfiliadoCabecera.nPeriodo as periodo ,tblAfiliadoCabecera.iCorrelativo AS Correlativo, tblAfiliadoCabecera.vcNombreArchivo, tblAfiliadoCabecera.dFechaIng, 
                      tblAfiliadoCabecera.nTotalRegistros, tblAfiliadoCabecera.iRutUsuarioEnv, tblAfiliadoCabecera.iIdEstado, tblEstado.vcEstado, tblAfiliadoCabecera.nIdInstitucion, 
                      COUNT(tblAfiliadoError.nNumRegistro) AS nErrores, 
                      tblAfiliadoCabecera.nTotalRegistros - COUNT(tblAfiliadoError.nNumRegistro) AS exitosos, 
					  case when tblAfiliadoCabecera.nTotalRegistros > 0 then 1.0 * COUNT(tblAfiliadoError.nNumRegistro) / tblAfiliadoCabecera.nTotalRegistros * 1.0 else 0  end AS porcentaje_error,tblAfiliadoCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblAfiliadoCabecera on tblInstitucion.nIdInstitucion=tblAfiliadoCabecera.nIdInstitucion
           INNER JOIN
                      tblEstado ON tblAfiliadoCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblAfiliadoError ON tblAfiliadoCabecera.nIdInstitucion = tblAfiliadoError.nIdInstitucion AND tblAfiliadoCabecera.nPeriodo = tblAfiliadoError.nPeriodo AND 
                      tblAfiliadoCabecera.iCorrelativo = tblAfiliadoError.iCorrelativo
    WHERE     ((tblAfiliadoCabecera.nPeriodo = @iPeriodo) AND (@vcTipoArchivos = 'AA' OR
                      @vcTipoArchivos = 'T') AND (tblAfiliadoCabecera.nIdInstitucion = @iInstitucion) OR
                      (tblAfiliadoCabecera.nPeriodo = @iPeriodo) AND (@vcTipoArchivos = 'AA' OR
                      @vcTipoArchivos = 'T') AND (@iInstitucion = 0)
                      ) and @iAA_Historica = 0
    GROUP BY tblAfiliadoCabecera.iCorrelativo, tblAfiliadoCabecera.nPeriodo ,tblAfiliadoCabecera.vcNombreArchivo, tblAfiliadoCabecera.dFechaIng, tblAfiliadoCabecera.nTotalRegistros, 
                      tblAfiliadoCabecera.iRutUsuarioEnv, tblAfiliadoCabecera.iIdEstado, tblEstado.vcEstado, tblAfiliadoCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblAfiliadoCabecera.vcLinkError
  union all
  SELECT     'AFILIADO' AS tipo_archivo,'AA' as tipArch, tblAfiliadoCabecera.nPeriodo as periodo ,tblAfiliadoCabecera.iCorrelativo AS Correlativo, tblAfiliadoCabecera.vcNombreArchivo, tblAfiliadoCabecera.dFechaIng, 
                      tblAfiliadoCabecera.nTotalRegistros, tblAfiliadoCabecera.iRutUsuarioEnv, tblAfiliadoCabecera.iIdEstado, tblEstado.vcEstado, tblAfiliadoCabecera.nIdInstitucion, 
                      COUNT(tblHistAfiliadoError.nNumRegistro) AS nErrores, 
                      tblAfiliadoCabecera.nTotalRegistros - COUNT(tblHistAfiliadoError.nNumRegistro) AS exitosos, 
					  case when tblAfiliadoCabecera.nTotalRegistros > 0 then 1.0 * COUNT(tblHistAfiliadoError.nNumRegistro) / tblAfiliadoCabecera.nTotalRegistros * 1.0 else 0  end AS porcentaje_error,tblAfiliadoCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblAfiliadoCabecera on tblInstitucion.nIdInstitucion=tblAfiliadoCabecera.nIdInstitucion
           INNER JOIN
                      tblEstado ON tblAfiliadoCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblHistAfiliadoError ON tblAfiliadoCabecera.nIdInstitucion = tblHistAfiliadoError.nIdInstitucion AND tblAfiliadoCabecera.nPeriodo = tblHistAfiliadoError.nPeriodo AND 
                      tblAfiliadoCabecera.iCorrelativo = tblHistAfiliadoError.iCorrelativo
			inner join vwUltimoArchivoEnviadoValidado 
				ON vwUltimoArchivoEnviadoValidado.tipoArchivo='AA' and vwUltimoArchivoEnviadoValidado.nPeriodo = tblAfiliadoCabecera.nPeriodo
				and vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblAfiliadoCabecera.nIdInstitucion and vwUltimoArchivoEnviadoValidado.iCorrelativo=tblAfiliadoCabecera.iCorrelativo
    WHERE     ((tblAfiliadoCabecera.nPeriodo = @iPeriodo) AND (@vcTipoArchivos = 'AA' OR
                      @vcTipoArchivos = 'T') AND (tblAfiliadoCabecera.nIdInstitucion = @iInstitucion) OR
                      (tblAfiliadoCabecera.nPeriodo = @iPeriodo) AND (@vcTipoArchivos = 'AA' OR
                      @vcTipoArchivos = 'T') AND (@iInstitucion = 0)
                      ) and @iAA_Historica = 1 and @iCD = 1
    GROUP BY tblAfiliadoCabecera.iCorrelativo, tblAfiliadoCabecera.nPeriodo ,tblAfiliadoCabecera.vcNombreArchivo, tblAfiliadoCabecera.dFechaIng, tblAfiliadoCabecera.nTotalRegistros, 
                      tblAfiliadoCabecera.iRutUsuarioEnv, tblAfiliadoCabecera.iIdEstado, tblEstado.vcEstado, tblAfiliadoCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblAfiliadoCabecera.vcLinkError
  union all
    SELECT     'DEUDA' AS tipo_archivo,'AD' as tipArch,tblDeudaCabecera.nPeriodo as periodo , tblDeudaCabecera.iCorrelativo AS Correlativo, tblDeudaCabecera.vcNombreArchivo, tblDeudaCabecera.dFechaIng, 
                      tblDeudaCabecera.nTotalReg, tblDeudaCabecera.iRutUsuarioEnv, tblDeudaCabecera.iIdEstado, tblEstado.vcEstado, tblDeudaCabecera.nIdInstitucion, 
                      COUNT(tblDeudaError.nNumRegistro) AS nErrores, 
                      tblDeudaCabecera.nTotalReg - COUNT(tblDeudaError.nNumRegistro) AS exitosos, 
					  case when tblDeudaCabecera.nTotalReg > 0 then 1.0 * COUNT(tblDeudaError.nNumRegistro) / tblDeudaCabecera.nTotalReg else 0 end  AS porcentaje_error ,tblDeudaCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblDeudaCabecera  on tblInstitucion.nIdInstitucion=tblDeudaCabecera.nIdInstitucion
            INNER JOIN
                      tblEstado ON tblDeudaCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblDeudaError ON tblDeudaCabecera.nIdInstitucion = tblDeudaError.nInstitucion AND tblDeudaCabecera.nPeriodo = tblDeudaError.nPeriodo AND 
                      tblDeudaCabecera.iCorrelativo = tblDeudaError.iCorrelativo
    WHERE     ((@vcTipoArchivos = 'AD' OR
                      @vcTipoArchivos = 'T') AND (tblDeudaCabecera.nPeriodo = @iPeriodo) AND (tblDeudaCabecera.nIdInstitucion = @iInstitucion) OR
                      (@vcTipoArchivos = 'AD' OR
                      @vcTipoArchivos = 'T') AND (@iInstitucion = 0) AND (tblDeudaCabecera.nPeriodo = @iPeriodo)
                      ) and @iAD_Historica = 0
    GROUP BY tblDeudaCabecera.iCorrelativo,tblDeudaCabecera.nPeriodo , tblDeudaCabecera.vcNombreArchivo, tblDeudaCabecera.dFechaIng, tblDeudaCabecera.nTotalReg, 
                      tblDeudaCabecera.iRutUsuarioEnv, tblDeudaCabecera.iIdEstado, tblEstado.vcEstado, tblDeudaCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblDeudaCabecera.vcLinkError
  union all
    SELECT     'DEUDA' AS tipo_archivo,'AD' as tipArch,tblDeudaCabecera.nPeriodo as periodo , tblDeudaCabecera.iCorrelativo AS Correlativo, tblDeudaCabecera.vcNombreArchivo, tblDeudaCabecera.dFechaIng, 
                      tblDeudaCabecera.nTotalReg, tblDeudaCabecera.iRutUsuarioEnv, tblDeudaCabecera.iIdEstado, tblEstado.vcEstado, tblDeudaCabecera.nIdInstitucion, 
                      COUNT(tblHistDeudaError.nNumRegistro) AS nErrores, 
                      tblDeudaCabecera.nTotalReg - COUNT(tblHistDeudaError.nNumRegistro) AS exitosos, 
					  case when tblDeudaCabecera.nTotalReg > 0 then 1.0 * COUNT(tblHistDeudaError.nNumRegistro) / tblDeudaCabecera.nTotalReg else 0 end  AS porcentaje_error ,tblDeudaCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblDeudaCabecera  on tblInstitucion.nIdInstitucion=tblDeudaCabecera.nIdInstitucion
            INNER JOIN
                      tblEstado ON tblDeudaCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblHistDeudaError ON tblDeudaCabecera.nIdInstitucion = tblHistDeudaError.nInstitucion AND tblDeudaCabecera.nPeriodo = tblHistDeudaError.nPeriodo AND 
                      tblDeudaCabecera.iCorrelativo = tblHistDeudaError.iCorrelativo
			inner join vwUltimoArchivoEnviadoValidado 
				ON vwUltimoArchivoEnviadoValidado.tipoArchivo='AD' and vwUltimoArchivoEnviadoValidado.nPeriodo = tblDeudaCabecera.nPeriodo
				and vwUltimoArchivoEnviadoValidado.nIdInstitucion=tblDeudaCabecera.nIdInstitucion and vwUltimoArchivoEnviadoValidado.iCorrelativo=tblDeudaCabecera.iCorrelativo
    WHERE     ((@vcTipoArchivos = 'AD' OR
                      @vcTipoArchivos = 'T') AND (tblDeudaCabecera.nPeriodo = @iPeriodo) AND (tblDeudaCabecera.nIdInstitucion = @iInstitucion) OR
                      (@vcTipoArchivos = 'AD' OR
                      @vcTipoArchivos = 'T') AND (@iInstitucion = 0) AND (tblDeudaCabecera.nPeriodo = @iPeriodo)
                      ) and @iAD_Historica = 1 and @iCD = 1
    GROUP BY tblDeudaCabecera.iCorrelativo,tblDeudaCabecera.nPeriodo , tblDeudaCabecera.vcNombreArchivo, tblDeudaCabecera.dFechaIng, tblDeudaCabecera.nTotalReg, 
                      tblDeudaCabecera.iRutUsuarioEnv, tblDeudaCabecera.iIdEstado, tblEstado.vcEstado, tblDeudaCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblDeudaCabecera.vcLinkError
  union all
    SELECT     'RECAUDACIÓN' AS tipo_archivo,'AR' as tipArch,tblRecaudacionCabecera.nPeriodo as periodo, tblRecaudacionCabecera.iCorrelativo AS Correlativo, tblRecaudacionCabecera.vcNombreArchivo, 
                      tblRecaudacionCabecera.dFechaIngreso, tblRecaudacionCabecera.nTotalRegistros, tblRecaudacionCabecera.iRutUsuarioEnv, tblRecaudacionCabecera.iIdEstado, 
                      tblEstado.vcEstado, tblRecaudacionCabecera.nIdInstitucion, COUNT(tblRecaudacionError.nNumRegistro) AS nErrores, 
                      tblRecaudacionCabecera.nTotalRegistros - COUNT(tblRecaudacionError.nNumRegistro) AS exitosos,
					  case when tblRecaudacionCabecera.nTotalRegistros > 0 then 1.0 *  COUNT(tblRecaudacionError.nNumRegistro) / tblRecaudacionCabecera.nTotalRegistros else 0 end  AS porcentaje_error,tblRecaudacionCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblRecaudacionCabecera   on tblInstitucion.nIdInstitucion=tblRecaudacionCabecera.nIdInstitucion
            INNER JOIN    
                      tblEstado ON tblRecaudacionCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblRecaudacionError ON tblRecaudacionCabecera.nIdInstitucion = tblRecaudacionError.nIdInstitucion AND 
                      tblRecaudacionCabecera.nPeriodo = tblRecaudacionError.nPeriodo AND tblRecaudacionCabecera.iCorrelativo = tblRecaudacionError.iCorrelativo
    WHERE     ((@vcTipoArchivos = 'AR' OR
                      @vcTipoArchivos = 'T') AND (tblRecaudacionCabecera.nPeriodo = @iPeriodo) AND (tblRecaudacionCabecera.nIdInstitucion = @iInstitucion) OR
                      (@vcTipoArchivos = 'AR' OR
                      @vcTipoArchivos = 'T') AND (tblRecaudacionCabecera.nPeriodo = @iPeriodo) AND (@iInstitucion = 0)
                      ) and @iAR_Historica = 0
    GROUP BY tblRecaudacionCabecera.iCorrelativo,tblRecaudacionCabecera.nPeriodo , tblRecaudacionCabecera.vcNombreArchivo, tblRecaudacionCabecera.dFechaIngreso, 
                      tblRecaudacionCabecera.nTotalRegistros, tblRecaudacionCabecera.iRutUsuarioEnv, tblRecaudacionCabecera.iIdEstado, tblEstado.vcEstado, 
                      tblRecaudacionCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblRecaudacionCabecera.vcLinkError
    union all
    SELECT     'RECAUDACIÓN' AS tipo_archivo,'AR' as tipArch,tblRecaudacionCabecera.nPeriodo as periodo, tblRecaudacionCabecera.iCorrelativo AS Correlativo, tblRecaudacionCabecera.vcNombreArchivo, 
                      tblRecaudacionCabecera.dFechaIngreso, tblRecaudacionCabecera.nTotalRegistros, tblRecaudacionCabecera.iRutUsuarioEnv, tblRecaudacionCabecera.iIdEstado, 
                      tblEstado.vcEstado, tblRecaudacionCabecera.nIdInstitucion, COUNT(tblHistRecaudacionError.nNumRegistro) AS nErrores, 
                      tblRecaudacionCabecera.nTotalRegistros - COUNT(tblHistRecaudacionError.nNumRegistro) AS exitosos,
					  case when tblRecaudacionCabecera.nTotalRegistros > 0 then 1.0 *  COUNT(tblHistRecaudacionError.nNumRegistro) / tblRecaudacionCabecera.nTotalRegistros else 0 end  AS porcentaje_error,tblRecaudacionCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblRecaudacionCabecera   on tblInstitucion.nIdInstitucion=tblRecaudacionCabecera.nIdInstitucion
            INNER JOIN    
                      tblEstado ON tblRecaudacionCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblHistRecaudacionError ON tblRecaudacionCabecera.nIdInstitucion = tblHistRecaudacionError.nIdInstitucion AND 
                      tblRecaudacionCabecera.nPeriodo = tblHistRecaudacionError.nPeriodo AND tblRecaudacionCabecera.iCorrelativo = tblHistRecaudacionError.iCorrelativo
    		inner join vwUltimoArchivoEnviadoValidado 
				ON vwUltimoArchivoEnviadoValidado.tipoArchivo='AR' and vwUltimoArchivoEnviadoValidado.nPeriodo = tblRecaudacionCabecera.nPeriodo
				and vwUltimoArchivoEnviadoValidado.nIdInstitucion=tblRecaudacionCabecera.nIdInstitucion and vwUltimoArchivoEnviadoValidado.iCorrelativo=tblRecaudacionCabecera.iCorrelativo
	WHERE     ((@vcTipoArchivos = 'AR' OR
                      @vcTipoArchivos = 'T') AND (tblRecaudacionCabecera.nPeriodo = @iPeriodo) AND (tblRecaudacionCabecera.nIdInstitucion = @iInstitucion) OR
                      (@vcTipoArchivos = 'AR' OR
                      @vcTipoArchivos = 'T') AND (tblRecaudacionCabecera.nPeriodo = @iPeriodo) AND (@iInstitucion = 0)
                      ) and @iAR_Historica = 1 and @iCR = 1
    GROUP BY tblRecaudacionCabecera.iCorrelativo,tblRecaudacionCabecera.nPeriodo , tblRecaudacionCabecera.vcNombreArchivo, tblRecaudacionCabecera.dFechaIngreso, 
                      tblRecaudacionCabecera.nTotalRegistros, tblRecaudacionCabecera.iRutUsuarioEnv, tblRecaudacionCabecera.iIdEstado, tblEstado.vcEstado, 
                      tblRecaudacionCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblRecaudacionCabecera.vcLinkError
    union all
    SELECT     'CARTERA COMPRADA' AS tipo_archivo,'CC' as tipArch,tblCarteraCompradaCabecera.nPeriodo as periodo, tblCarteraCompradaCabecera.iCorrelativo AS Correlativo, tblCarteraCompradaCabecera.vcNombreArchivo, 
                      tblCarteraCompradaCabecera.dFechaIngreso, tblCarteraCompradaCabecera.nTotalRegistros, tblCarteraCompradaCabecera.iRutUsuarioEnv, tblCarteraCompradaCabecera.iIdEstado, 
                      tblEstado.vcEstado, tblCarteraCompradaCabecera.nIdInstitucion, COUNT(tblCarteraCompradaError.nNumRegistro) AS nErrores, 
                      tblCarteraCompradaCabecera.nTotalRegistros - COUNT(tblCarteraCompradaError.nNumRegistro) AS exitosos,
					  case when tblCarteraCompradaCabecera.nTotalRegistros > 0 then 1.0 *  COUNT(tblCarteraCompradaError.nNumRegistro) / tblCarteraCompradaCabecera.nTotalRegistros else 0 end  AS porcentaje_error,tblCarteraCompradaCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblCarteraCompradaCabecera   on tblInstitucion.nIdInstitucion=tblCarteraCompradaCabecera.nIdInstitucion
            INNER JOIN    
                      tblEstado ON tblCarteraCompradaCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblCarteraCompradaError ON tblCarteraCompradaCabecera.nIdInstitucion = tblCarteraCompradaError.nIdInstitucion AND 
                      tblCarteraCompradaCabecera.nPeriodo = tblCarteraCompradaError.nPeriodo AND tblCarteraCompradaCabecera.iCorrelativo = tblCarteraCompradaError.iCorrelativo
    WHERE     ((@vcTipoArchivos = 'CC' OR
                      @vcTipoArchivos = 'T') AND (tblCarteraCompradaCabecera.nPeriodo = @iPeriodo) AND (tblCarteraCompradaCabecera.nIdInstitucion = @iInstitucion) OR
                      (@vcTipoArchivos = 'CC' OR
                      @vcTipoArchivos = 'T') AND (tblCarteraCompradaCabecera.nPeriodo = @iPeriodo) AND (@iInstitucion = 0)
                      ) and @iCC_Historica = 0
    GROUP BY tblCarteraCompradaCabecera.iCorrelativo,tblCarteraCompradaCabecera.nPeriodo , tblCarteraCompradaCabecera.vcNombreArchivo, tblCarteraCompradaCabecera.dFechaIngreso, 
                      tblCarteraCompradaCabecera.nTotalRegistros, tblCarteraCompradaCabecera.iRutUsuarioEnv, tblCarteraCompradaCabecera.iIdEstado, tblEstado.vcEstado, 
                      tblCarteraCompradaCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblCarteraCompradaCabecera.vcLinkError
    union all
    SELECT     'CARTERA COMPRADA' AS tipo_archivo,'CC' as tipArch,tblCarteraCompradaCabecera.nPeriodo as periodo, tblCarteraCompradaCabecera.iCorrelativo AS Correlativo, tblCarteraCompradaCabecera.vcNombreArchivo, 
                      tblCarteraCompradaCabecera.dFechaIngreso, tblCarteraCompradaCabecera.nTotalRegistros, tblCarteraCompradaCabecera.iRutUsuarioEnv, tblCarteraCompradaCabecera.iIdEstado, 
                      tblEstado.vcEstado, tblCarteraCompradaCabecera.nIdInstitucion, COUNT(tblHistCarteraCompradaError.nNumRegistro) AS nErrores, 
                      tblCarteraCompradaCabecera.nTotalRegistros - COUNT(tblHistCarteraCompradaError.nNumRegistro) AS exitosos,
					  case when tblCarteraCompradaCabecera.nTotalRegistros > 0 then 1.0 *  COUNT(tblHistCarteraCompradaError.nNumRegistro) / tblCarteraCompradaCabecera.nTotalRegistros else 0 end  AS porcentaje_error,tblCarteraCompradaCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblCarteraCompradaCabecera   on tblInstitucion.nIdInstitucion=tblCarteraCompradaCabecera.nIdInstitucion
            INNER JOIN    
                      tblEstado ON tblCarteraCompradaCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblHistCarteraCompradaError ON tblCarteraCompradaCabecera.nIdInstitucion = tblHistCarteraCompradaError.nIdInstitucion AND 
                      tblCarteraCompradaCabecera.nPeriodo = tblHistCarteraCompradaError.nPeriodo AND tblCarteraCompradaCabecera.iCorrelativo = tblHistCarteraCompradaError.iCorrelativo
     		inner join vwUltimoArchivoEnviadoValidado 
				ON vwUltimoArchivoEnviadoValidado.tipoArchivo='CC' and vwUltimoArchivoEnviadoValidado.nPeriodo = tblCarteraCompradaCabecera.nPeriodo
				and vwUltimoArchivoEnviadoValidado.nIdInstitucion=tblCarteraCompradaCabecera.nIdInstitucion and vwUltimoArchivoEnviadoValidado.iCorrelativo=tblCarteraCompradaCabecera.iCorrelativo
	WHERE     ((@vcTipoArchivos = 'CC' OR
                      @vcTipoArchivos = 'T') AND (tblCarteraCompradaCabecera.nPeriodo = @iPeriodo) AND (tblCarteraCompradaCabecera.nIdInstitucion = @iInstitucion) OR
                      (@vcTipoArchivos = 'CC' OR
                      @vcTipoArchivos = 'T') AND (tblCarteraCompradaCabecera.nPeriodo = @iPeriodo) AND (@iInstitucion = 0)
                      ) and @iCC_Historica = 1 and @iCC = 1
    GROUP BY tblCarteraCompradaCabecera.iCorrelativo,tblCarteraCompradaCabecera.nPeriodo , tblCarteraCompradaCabecera.vcNombreArchivo, tblCarteraCompradaCabecera.dFechaIngreso, 
                      tblCarteraCompradaCabecera.nTotalRegistros, tblCarteraCompradaCabecera.iRutUsuarioEnv, tblCarteraCompradaCabecera.iIdEstado, tblEstado.vcEstado, 
                      tblCarteraCompradaCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblCarteraCompradaCabecera.vcLinkError
	)archivos
    order by archivos.dFechaIng desc
END
GO

GO
--SqlScripter----[dbo].[spListaCodigoError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spListaCodigoError]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spListaCodigoError] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 01-09-2013
-- Description: Lista Tabla tblCodigoError
-- =============================================
ALTER PROCEDURE [dbo].[spListaCodigoError]
AS
BEGIN
  SELECT convert(int,cCodigoError) as cCodigoError,vcGlosa,vcGlosaCorta
  FROM tblCodigoError;
END
GO

GO
--SqlScripter----[dbo].[spListaErroresArchivo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spListaErroresArchivo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spListaErroresArchivo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    <MSC,,Mauricio Soto>
-- Create date: <21/06/2013>
-- Description: <Obtiene lista de errores para un archivo cargado en especifico.
-- GRN	31-07-2014 - Se implemento busqueda en archivos Historicos
-- =============================================
ALTER PROCEDURE [dbo].[spListaErroresArchivo]
@iPeriodo int, 
  @iInstitucion int,
  @iIdArchivo int,
  @vcTipoArchivo varchar(2) --Dependiendo del tipo de archivos se listan TODOS o SOLO LOS DEL CRITERIO
AS
DECLARE
  @iAA_Historica int,
  @iAD_Historica int,
  @iAR_Historica int,
  @iCC_Historica int,
  @nPeriodoActual numeric(6,0),
  @nDifPeriodo int
BEGIN
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  SET NOCOUNT ON;
    select @nPeriodoActual=MAX(nPeriodo) from tblPeriodo
    select @nDifPeriodo=((convert(int,@nPeriodoActual)/100)-(@iPeriodo/100))*12 + ((convert(int,@nPeriodoActual)%100)-(@iPeriodo%100))
    set @iAA_Historica =0
	set @iAD_Historica =0
	set @iAR_Historica =0
	set @iCC_Historica =0
    if @nDifPeriodo > 0
    begin
		set @iAA_Historica =1
		set @iAD_Historica =1
    end
    if @nDifPeriodo > 2
    begin
		set @iAR_Historica = 1
    end
    if @nDifPeriodo > 1
    begin
		set @iCC_Historica = 1
    end
    
  if @vcTipoArchivo='AA'
  begin
  SELECT     TOP (200) nNumRegistro, txCodigoError, vcRedDat
    FROM         tblAfiliadoError
    WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo) AND (iCorrelativo = @iIdArchivo) and @iAA_Historica = 0
  union all
  SELECT     TOP (200) nNumRegistro, txCodigoError, vcRedDat
    FROM         tblHistAfiliadoError
    WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo) AND (iCorrelativo = @iIdArchivo) and @iAA_Historica = 1
		
  ORDER BY nNumRegistro
  end
  else if @vcTipoArchivo='AD'
  begin
    SELECT     TOP (200) nNumRegistro, txCodigoError, vcRedDat
    FROM         tblDeudaError
    WHERE     (nInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo) AND (iCorrelativo = @iIdArchivo) and @iAD_Historica =0
    union all
    SELECT     TOP (200) nNumRegistro, txCodigoError, vcRedDat
    FROM         tblHistDeudaError
    WHERE     (nInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo) AND (iCorrelativo = @iIdArchivo) and @iAD_Historica =1
    ORDER BY nNumRegistro 
  end
  else if @vcTipoArchivo='AR'
  begin
    SELECT     TOP (200) nNumRegistro, txCodigoError, vcRedDat
    FROM         tblRecaudacionError
    WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo) AND (iCorrelativo = @iIdArchivo) and @iAR_Historica = 0
    union all
    SELECT     TOP (200) nNumRegistro, txCodigoError, vcRedDat
    FROM         tblHistRecaudacionError
    WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo) AND (iCorrelativo = @iIdArchivo) and @iAR_Historica = 1
    ORDER BY nNumRegistro
  end
  else if @vcTipoArchivo='CC'
  begin
    SELECT     TOP (200) nNumRegistro, txCodigoError, vcRedDat
    FROM         tblCarteraCompradaError
    WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo) AND (iCorrelativo = @iIdArchivo) and @iCC_Historica = 0
    union all
    SELECT     TOP (200) nNumRegistro, txCodigoError, vcRedDat
    FROM         tblHistCarteraCompradaError
    WHERE     (nIdInstitucion = @iInstitucion) AND (nPeriodo = @iPeriodo) AND (iCorrelativo = @iIdArchivo) and @iCC_Historica = 1
    ORDER BY nNumRegistro
  end
END
GO

GO
--SqlScripter----[dbo].[spListaFuncionalidadesPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spListaFuncionalidadesPerfil]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spListaFuncionalidadesPerfil] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 28-06-13
-- Description: Lista funcionalidades y las asocia a un perfil
-- =============================================
ALTER PROCEDURE [dbo].[spListaFuncionalidadesPerfil]
@iPerfil int,
  @iEstado int out,
  @iAsignaCaja int out
AS
BEGIN
  
  if @iPerfil > 0
  begin
    select @iEstado = iIdEstado, @iAsignaCaja = bAsignaCaja from tblPerfil where iIdPerfil = @iPerfil
    
    SELECT distinct  tblFuncionalidad.iIdFuncionalidad, 
      tblFuncionalidad.vcDescripcion, 
      tblFuncionalidad.vcFuncionalidad
    FROM    tblPerfil RIGHT OUTER JOIN
        tblRel_PerfilFunc ON tblPerfil.iIdPerfil = tblRel_PerfilFunc.iIdPerfil RIGHT OUTER JOIN
        tblFuncionalidad ON tblRel_PerfilFunc.iIdFuncionalidad = tblFuncionalidad.iIdFuncionalidad
    WHERE tblPerfil.iIdPerfil = @iPerfil
    order by tblFuncionalidad.vcFuncionalidad
  end
  else 
  begin
    select iIdFuncionalidad,vcDescripcion,vcFuncionalidad
    from (
      select 1 as orden, 
      0 as iIdFuncionalidad, 
      '' vcDescripcion, 
      '-- Seleccione Funcionalidad --' vcFuncionalidad
      where @iPerfil = -2
      union
      SELECT distinct
        2 as orden,  
        tblFuncionalidad.iIdFuncionalidad, 
        tblFuncionalidad.vcDescripcion, 
        tblFuncionalidad.vcFuncionalidad
      FROM    tblFuncionalidad
    )tbl
    order by orden, vcFuncionalidad;
  end 
  
END
GO

GO
--SqlScripter----[dbo].[spListaInstituciones].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spListaInstituciones]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spListaInstituciones] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    <MSC,,Mauricio Soto>
-- Create date: <21/06/2013>
-- Description: <Obtiene lista de instituciones activas>
-- Parametro @iInstitucion_consultante:
--         0: "Todas" + Inst. Participantes activas
--        -1: "--Seleccione--" + Inst. Todas avtivas
--        -2: Inst. Participantes activas
--        -3: "--Seleccione--" + Inst. Todas + "--Nueva Institucion--"
-- =============================================
ALTER PROCEDURE [dbo].[spListaInstituciones]
@iInstitucion_consultante int 
AS
BEGIN
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  if @iInstitucion_consultante=0 
  begin
  SET NOCOUNT ON;
      select 0 as orden, 0 as nIdInstitucion,0 as iIdSCF, 'Todas' as vcNombre, 'Todas' as vcNombreCorto, 0 as bParticipa, 0 as iIdEstado
    union
    SELECT TOP 1000 1 as orden, nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
    FROM         INTERCAJAS.dbo.tblInstitucion
    WHERE     (bParticipa = 1) AND (iIdEstado = 11)
    
    order by orden,vcNombre
  end
  else IF @iInstitucion_consultante = -1 
  begin     
    SET NOCOUNT ON;
    select 0 as nIdInstitucion,0 as iIdSCF, '-- Seleccione --' as vcNombre, '-- Seleccione --' as vcNombreCorto, 0 as bParticipa, 0 as iIdEstado
    union
    SELECT     TOP (1000) nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
    FROM         INTERCAJAS.dbo.tblInstitucion
    WHERE     (iIdEstado = 11)
    order by vcNombre
  end
  else IF @iInstitucion_consultante = -2
  begin     
    SET NOCOUNT ON;   
    SELECT     TOP (1000) nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
    FROM         INTERCAJAS.dbo.tblInstitucion
    WHERE     (bParticipa = 1 AND iIdEstado = 11)
    order by vcNombre
  end
  else IF @iInstitucion_consultante = -3
  begin     
    SET NOCOUNT ON;   
    select nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
    from(
      select 0 as orden, 0 as nIdInstitucion,0 as iIdSCF, '-- Seleccione --' as vcNombre, '-- Seleccione --' as vcNombreCorto, 0 as bParticipa, 0 as iIdEstado
      union
      SELECT TOP (1000) 
        1 as orden, nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
      FROM         INTERCAJAS.dbo.tblInstitucion
      order by vcNombre
      union
      select 2 as orden, -1 as nIdInstitucion,0 as iIdSCF, '-- Nueva Institución --' as vcNombre, '-- Nueva Institución --' as vcNombreCorto ,0 as bParticipa, 0 as iIdEstado
    )tbl
    order by tbl.orden, tbl.vcNombre
  end
  else IF @iInstitucion_consultante = -4
  begin     
    SET NOCOUNT ON;   
    select nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
    from(
      select 0 as orden, 0 as nIdInstitucion,0 as iIdSCF, '-- Seleccione --' as vcNombre, '-- Seleccione --' as vcNombreCorto, 0 as bParticipa, 0 as iIdEstado
      union
      SELECT TOP (1000) 
        1 as orden, nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
      FROM         INTERCAJAS.dbo.tblInstitucion
      where (bParticipa = 1 AND iIdEstado = 11)
      order by vcNombre
    )tbl
    order by tbl.orden, tbl.vcNombre
  end
  else
  begin
    SET NOCOUNT ON;
    SELECT     TOP (1000) nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
    FROM         INTERCAJAS.dbo.tblInstitucion
    WHERE     (iIdEstado = 11) AND (nIdInstitucion = @iInstitucion_consultante );
  end
  
END
GO

GO
--SqlScripter----[dbo].[spListaParametros].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spListaParametros]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spListaParametros] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 09-07-13
-- Description: Lista Parametros
-- =============================================
ALTER PROCEDURE [dbo].[spListaParametros]
@iTipoParametro int,
  @vcParametro varchar(50)
AS
BEGIN
  SET NOCOUNT ON;

  if @iTipoParametro = 0
  begin
    SELECT     tblParametro.iIdParametro, tblParametro.vcParametro, tblParametro.vcValor, tblParametro.iIdUnidad, tblUnidad.vcUnidad, tblParametro.vcDescripcion
    FROM         tblParametro INNER JOIN
                      tblTipoParametro ON tblParametro.iIdTipoParametro = tblTipoParametro.iIdTipoParametro
			   INNER JOIN tblUnidad ON tblParametro.iIdUnidad = tblUnidad.iIdUnidad
    WHERE (@vcParametro = '&&' or tblParametro.vcParametro like '%'+@vcParametro+'%')
      and tblParametro.iIdTipoParametro <> 4
    ORDER BY tblParametro.iIdTipoParametro, tblParametro.vcParametro
  end
  else
  begin
    SELECT     tblParametro.iIdParametro, tblParametro.vcParametro, tblParametro.vcValor, tblParametro.iIdUnidad, tblUnidad.vcUnidad, tblParametro.vcDescripcion
    FROM         tblParametro INNER JOIN
                      tblTipoParametro ON tblParametro.iIdTipoParametro = tblTipoParametro.iIdTipoParametro
			   INNER JOIN tblUnidad ON tblParametro.iIdUnidad = tblUnidad.iIdUnidad
    WHERE tblTipoParametro.iIdTipoParametro = @iTipoParametro
      and (@vcParametro = '&&' or tblParametro.vcParametro like '%'+@vcParametro+'%')
    ORDER BY tblParametro.iIdTipoParametro, tblParametro.vcParametro
  end
END
GO

GO
--SqlScripter----[dbo].[spListaPerfiles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spListaPerfiles]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spListaPerfiles] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN 
-- Create date: 28-06-13  
-- Description: Lista los perfiles del Sistema
-- =============================================
ALTER PROCEDURE [dbo].[spListaPerfiles]
@iLista int = 0
AS
BEGIN
  SET NOCOUNT ON;
  if @iLista = 2
  begin
    Select 2 as orden, iIdPerfil, vcNombrePerfil, iIdEstado from tblPerfil where bAsignaCaja = 1
  end
  else
  begin
    select * from (
      Select 1 as orden, 0 as iIdPerfil, '-- Seleccione Perfil --' as vcNombrePerfil, 4 as iIdEstado 
      where @iLista = 0
      union
      Select 2 as orden, iIdPerfil, vcNombrePerfil, iIdEstado from tblPerfil
      union
      Select 3 as orden, -1 as iIdPerfil, '-- Nuevo Perfil --' as vcNombrePerfil, 4 as iIdEstado
      where @iLista = 0 
    )tbl 
    order by orden, vcNombrePerfil
    end
END
GO

GO
--SqlScripter----[dbo].[spListaPeriodos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spListaPeriodos]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spListaPeriodos] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:        GRN
-- Create date: 23/09/2013
-- Description:   Lista los periodos del sistema
-- =============================================
ALTER PROCEDURE [dbo].[spListaPeriodos]
@iPosPeriodoInicial int = 0
AS
BEGIN
      
	  select nperiodo 
	  from
	  (select top 6 ROW_NUMBER() OVER(ORDER BY nPeriodo DESC) AS num, nPeriodo from tblPeriodo) periodos
	  where num > @iPosPeriodoInicial
END
GO

GO
--SqlScripter----[dbo].[spListaPlazosCalendarios].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spListaPlazosCalendarios]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spListaPlazosCalendarios] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 26-07_2013
-- Description: Lista Alerta Cumplimiento Plazos Calendario del periodo Actual
-- =============================================
ALTER PROCEDURE [dbo].[spListaPlazosCalendarios]
@nPeriodo numeric = 0,
  @dCompromisoAFI_DEU datetime = '',
  @dCompromisoREC datetime = '',
  @dCompromisoCC datetime = ''
AS
DECLARE
@nPeriodo_1 numeric = 0,
@nPeriodo_2 numeric = 0,
@ultimoDia int = 0
BEGIN


  
  select @nPeriodo=max(nPeriodo) from tblPeriodo; 

  select @nPeriodo_1 = SUBSTRING(CONVERT(varchar, dateadd(month,-1,convert(date,convert(varchar,@nPeriodo) + '01',112)),112),1,6);
  select @nPeriodo_2 = SUBSTRING(CONVERT(varchar, dateadd(month,-2,convert(date,convert(varchar,@nPeriodo) + '01',112)),112),1,6);
  
  SELECT @ultimoDia = DAY(DATEADD(d,-1,DATEADD(M,1,CONVERT(date,convert(varchar,@nPeriodo)+'01',112)))) 

  select @dCompromisoAFI_DEU=CONVERT(Datetime, convert(varchar,@nPeriodo*100 + case when convert(int,vcValor) > @ultimoDia then @ultimoDia else vcValor end ), 112)from tblParametro where iIdParametro = 20;
  select @dCompromisoREC=CONVERT(Datetime, convert(varchar, @nPeriodo*100 + case when convert(int,vcValor) > @ultimoDia then @ultimoDia else vcValor end), 112)from tblParametro where iIdParametro = 22;
  select @dCompromisoCC=CONVERT(Datetime, convert(varchar, @nPeriodo*100 + case when convert(int,vcValor) > @ultimoDia then @ultimoDia else vcValor end), 112)from tblParametro where iIdParametro = 34;
  
  select * from (
  select 
    tblInstitucion.vcNombre as Institucion, 
    tblAfiliadoCabecera.vcNombreArchivo as NombreArchivo,
    'Afiliado' as TipoArchivo,
    coalesce(tblEstado.vcEstado,'Sin archivo') as Estado,
    case when tblEstado.vcEstado is null then 'Red' else '' end as ColorEstado,
    tblUsuario.vcNombre as Usuario,
    @dCompromisoAFI_DEU As Fecha
  from tblAfiliadoCabecera
    inner join vwUltimoArchivoEnviado
      on vwUltimoArchivoEnviado.nIdInstitucion = tblAfiliadoCabecera.nIdInstitucion
      and vwUltimoArchivoEnviado.nPeriodo = tblAfiliadoCabecera.nPeriodo
      and vwUltimoArchivoEnviado.iCorrelativo = tblAfiliadoCabecera.iCorrelativo
      and vwUltimoArchivoEnviado.tipoArchivo = 'AA'
    inner join tblEstado 
      on tblEstado.iIdEstado = tblAfiliadoCabecera.iIdEstado
    inner join tblUsuario
      on tblUsuario.iRut= tblAfiliadoCabecera.iRutUsuarioEnv
    inner join tblPeriodo 
      on tblPeriodo.nPeriodo = tblAfiliadoCabecera.nPeriodo
      and tblPeriodo.nPeriodo = @nPeriodo
    right join tblInstitucion  
      on tblAfiliadoCabecera.nIdInstitucion = tblInstitucion.nIdInstitucion
  where tblInstitucion.bParticipa = 1
    
  union
  select 
    tblInstitucion.vcNombre as Institucion, 
    tblDeudaCabecera.vcNombreArchivo as NombreArchivo,
    'Deuda' as TipoArchivo,
    coalesce(tblEstado.vcEstado,'Sin archivo') as Estado,
    case when tblEstado.vcEstado is null then 'Red' else '' end as ColorEstado,
    tblUsuario.vcNombre as Usuario,
    @dCompromisoAFI_DEU As Fecha
  from tblDeudaCabecera
    inner join vwUltimoArchivoEnviado
      on vwUltimoArchivoEnviado.nIdInstitucion = tblDeudaCabecera.nIdInstitucion
      and vwUltimoArchivoEnviado.nPeriodo = tblDeudaCabecera.nPeriodo
      and vwUltimoArchivoEnviado.iCorrelativo = tblDeudaCabecera.iCorrelativo
      and vwUltimoArchivoEnviado.tipoArchivo = 'AD'
    inner join tblEstado 
      on tblEstado.iIdEstado = tblDeudaCabecera.iIdEstado
    inner join tblUsuario
      on tblUsuario.iRut= tblDeudaCabecera.iRutUsuarioEnv
    inner join tblPeriodo 
      on tblPeriodo.nPeriodo = tblDeudaCabecera.nPeriodo
      and tblPeriodo.nPeriodo = @nPeriodo
    right join tblInstitucion  
      on tblDeudaCabecera.nIdInstitucion = tblInstitucion.nIdInstitucion
  where tblInstitucion.bParticipa = 1
  union
  select 
    tblInstitucion.vcNombre as Institucion, 
    tblRecaudacionCabecera.vcNombreArchivo as NombreArchivo,
    'Recaudación' as TipoArchivo,
    coalesce(tblEstado.vcEstado,'Sin archivo') as Estado,
    case when tblEstado.vcEstado is null then 'Red' else '' end as ColorEstado,
    tblUsuario.vcNombre as Usuario,
    @dCompromisoREC As Fecha
  from tblRecaudacionCabecera
    inner join vwUltimoArchivoEnviado
      on vwUltimoArchivoEnviado.nIdInstitucion = tblRecaudacionCabecera.nIdInstitucion
      and vwUltimoArchivoEnviado.nPeriodo = tblRecaudacionCabecera.nPeriodo
      and vwUltimoArchivoEnviado.iCorrelativo = tblRecaudacionCabecera.iCorrelativo
      and vwUltimoArchivoEnviado.tipoArchivo = 'AR'
    inner join tblEstado 
      on tblEstado.iIdEstado = tblRecaudacionCabecera.iIdEstado
    inner join tblUsuario
      on tblUsuario.iRut= tblRecaudacionCabecera.iRutUsuarioEnv
    inner join tblPeriodo 
      on tblPeriodo.nPeriodo = tblRecaudacionCabecera.nPeriodo
      and tblPeriodo.nPeriodo = @nPeriodo_2
    right join tblInstitucion  
      on tblRecaudacionCabecera.nIdInstitucion = tblInstitucion.nIdInstitucion
  where tblInstitucion.bParticipa = 1
  union
  select 
    tblInstitucion.vcNombre as Institucion, 
    tblCarteraCompradaCabecera.vcNombreArchivo as NombreArchivo,
    'Compra Cartera' as TipoArchivo,
    coalesce(tblEstado.vcEstado,'Sin archivo') as Estado,
    case when tblEstado.vcEstado is null then 'Red' else '' end as ColorEstado,
    tblUsuario.vcNombre as Usuario,
    @dCompromisoCC As Fecha
  from tblCarteraCompradaCabecera
    inner join vwUltimoArchivoEnviado
      on vwUltimoArchivoEnviado.nIdInstitucion = tblCarteraCompradaCabecera.nIdInstitucion
      and vwUltimoArchivoEnviado.nPeriodo = tblCarteraCompradaCabecera.nPeriodo
      and vwUltimoArchivoEnviado.iCorrelativo = tblCarteraCompradaCabecera.iCorrelativo
      and vwUltimoArchivoEnviado.tipoArchivo = 'CC'
    inner join tblEstado 
      on tblEstado.iIdEstado = tblCarteraCompradaCabecera.iIdEstado
    inner join tblUsuario
      on tblUsuario.iRut= tblCarteraCompradaCabecera.iRutUsuarioEnv
    inner join tblPeriodo 
      on tblPeriodo.nPeriodo = tblCarteraCompradaCabecera.nPeriodo
      and tblPeriodo.nPeriodo = @nPeriodo_1
    right join tblInstitucion  
      on tblCarteraCompradaCabecera.nIdInstitucion = tblInstitucion.nIdInstitucion
  where tblInstitucion.bParticipa = 1
    ) tbl order by TipoArchivo, Institucion
END
GO

GO
--SqlScripter----[dbo].[spListaTipoParametro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spListaTipoParametro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spListaTipoParametro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 09-07-13  
-- Description: Lista Tipos de parametros
-- =============================================
ALTER PROCEDURE [dbo].[spListaTipoParametro]
AS
BEGIN
  Select 0 as iIdTipoParametro,'Todos' as vcTipoParametro,'Todos' as vcDescripcion 
  union
  Select iIdTipoParametro, vcTipoParametro, vcDescripcion from tblTipoParametro where iIdTipoParametro <> 4
END
GO

GO
--SqlScripter----[dbo].[spListaUsuarios].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spListaUsuarios]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spListaUsuarios] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 03-07-13
-- Description: Lista los usuarios del sistema
-- =============================================
ALTER PROCEDURE [dbo].[spListaUsuarios]
@iId_institucion int,
  @vcRut varchar (12)= '-1',
  @vcNombre varchar(50)= '-1',
  @iInstitucion int = 0
AS
BEGIN
  
  if @iId_institucion = 0
  begin
    SELECT     tblUsuario.iRut as iRut,
          convert(varchar,tblUsuario.iRut) + '-' + dbo.fncDV(convert(varchar,tblUsuario.iRut)) AS Rut, 
          tblUsuario.vcNombre AS Nombre, 
          tblInstitucion.vcNombreCorto AS Institucion, 
          tblEstado.vcEstado AS Estado, 
          tblUsuario.tIntentos AS Intentos, 
          tblUsuario.dFecha_ing AS FechaIngreso, 
          tblUsuario.dFecha_mod AS FechaModificacion
    FROM        tblUsuario INNER JOIN
              tblEstado ON tblUsuario.iIdEstado = tblEstado.iIdEstado INNER JOIN
              tblInstitucion ON tblUsuario.nIdInstitucion = tblInstitucion.nIdInstitucion
    WHERE (@vcRut = '-1' or convert(varchar,tblUsuario.iRut) + '-' + dbo.fncDV(convert(varchar,tblUsuario.iRut)) like '%'+@vcRut+'%')
      and (@vcNombre = '-1' or tblUsuario.vcNombre like '%'+@vcNombre+'%')
      and (@iInstitucion=0 or tblUsuario.nIdInstitucion = @iInstitucion)
  end
  else
  begin
    SELECT     tblUsuario.iRut as iRut,
          convert(varchar,tblUsuario.iRut) + '-' + dbo.fncDV(convert(varchar,tblUsuario.iRut)) AS Rut, 
          tblUsuario.vcNombre AS Nombre, 
          tblInstitucion.vcNombreCorto AS Institucion, 
          tblEstado.vcEstado AS Estado, 
          tblUsuario.tIntentos AS Intentos, 
          tblUsuario.dFecha_ing AS FechaIngreso, 
          tblUsuario.dFecha_mod AS FechaModificacion
    FROM        tblUsuario INNER JOIN
              tblEstado ON tblUsuario.iIdEstado = tblEstado.iIdEstado INNER JOIN
              tblInstitucion ON tblUsuario.nIdInstitucion = tblInstitucion.nIdInstitucion
    where tblInstitucion.nIdInstitucion = @iId_institucion
    and (@vcRut = '-1' or convert(varchar,tblUsuario.iRut) + '-' + dbo.fncDV(convert(varchar,tblUsuario.iRut)) like '%'+@vcRut+'%')
    and (@vcNombre = '-1' or tblUsuario.vcNombre like '%'+@vcNombre+'%')
      
  
  end
END
GO

GO
--SqlScripter----[dbo].[spLogAuditoria].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spLogAuditoria]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spLogAuditoria] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN 
-- Create date: 22-07-13
-- Description: Despliega Log de Auditoria
-- =============================================
ALTER PROCEDURE [dbo].[spLogAuditoria]
@iOperacion int,
  @vcDesde varchar(20),
  @vcHasta varchar(20),
  @vcRut as varchar(12) = '$$',
  @iIdTipoEvento int = 0,
  @cTipoRegistro varchar(1) = '$',
  @vcDesc varchar(1000) = '$$'
AS
declare @dDesde datetime
declare @dHasta datetime
BEGIN
  If @iOperacion = 1 -- ListaEventoAuditoria
  BEGIN
	select @dDesde=CONVERT(datetime,@vcDesde+':00',120)
    select @dHasta=CONVERT(datetime,@vcHasta+':00',120)
    Select top 10000 nIdEvento, 
      nPeriodo, 
      dFecha, 
      CASE 
      WHEN (iUsuario > 0) 
        THEN Convert(varchar,iUsuario) + '-' + dbo.fncDV(iUsuario)
      ELSE Convert(varchar,iUsuario)
      end as iRut,
      (select tblUsuario.vcNombre from tblUsuario where iRut = tblEventoAuditoria.iUsuario) as NombreUsuario,
      iIdTipoEvento,
      (select vcTipoEvento from tblTipoEventoAuditoria where tblEventoAuditoria.iIdTipoEvento = tblTipoEventoAuditoria.iIdTipoEvento) as vcTipoEvento,
      Case cTipoRegistro
      WHEN 'I' THEN 'INFO'
      WHEN 'D' THEN 'DEBUG'
      WHEN 'E' THEN 'ERROR'
      END as vcTipoRegistro,
      vcDireccionTerminal,
      txDescripcion
    From tblEventoAuditoria 
    where dFecha between @dDesde and @dHasta
      and (@vcRut = '$$' or Convert(varchar,iUsuario) + '-' + dbo.fncDV(iUsuario)  like '%' + @vcRut + '%')
      and (@iIdTipoEvento=0 or iIdTipoEvento = @iIdTipoEvento)
      and (@cTipoRegistro = '$' or cTipoRegistro = @cTipoRegistro)
      and (@vcDesc = '$$' or txDescripcion like '%' + @vcDesc + '%')
    order by dFecha desc;
    return
  END
  
  if @iOperacion = 2 --Lista TipoEventoAuditoria
  BEGIN
    select 0 as orden, 0 as iIdTipoEvento, 'Todos' vcTipoEvento
    union
    Select 1 as orden, iIdTipoEvento, vcTipoEvento
    From tblTipoEventoAuditoria
    order by orden,vcTipoEvento
    return
  END
  
END
GO

GO
--SqlScripter----[dbo].[spRecuperaClave].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spRecuperaClave]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spRecuperaClave] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 31-07-13
-- Description: Recupera la clave de usuario
-- =============================================
ALTER PROCEDURE [dbo].[spRecuperaClave]
@iRut int,
  @iCodError int output,
  @vcMsjError varchar(50) output,
  @vcPassword varchar(8) output,
  @vcNombre varchar(50) output,
  @vcEmail varchar(50) output,
  @vcHashPassword varchar(32) = '',
  @iEstado int = 0,
  @iNum_claves_hist int = 0
  
AS
BEGIN
  
  set @vcPassword = ''
  set @vcNombre = ''
  set @vcEmail = ''

  -- Se recuperan datos de configuracion
  select @iNum_claves_hist = vcValor 
  from tblParametro
  where iIdParametro = 6
  
  -- Se comprueba el estado del usuario
  select @iEstado=iIdEstado, 
    @vcNombre=vcNombre,
    @vcEmail=vcEmail
  from tblUsuario where iRut = @iRut;
  if @iEstado = 0 -- se compruba que el usuario existe
  begin
    set @iCodError = 1;
    set @vcMsjError = 'Datos Incorrectos.' ;
    return
  end
  if @iEstado <> 5 -- se comprueba que el usuario este activo
  begin
    set @iCodError = 2;
    set @vcMsjError = 'Datos Incorrectos.';
    return
  end
  
  --Recuperacion de clave
  
  -- Se genera una clave aleatorea
  SELECT @vcPassword= LEFT(CAST(NEWID() AS VARCHAR(1000)), 8)
  SELECT @vcHashPassword=CONVERT(VARCHAR(32),HashBytes('MD5', @vcPassword),2)
  
  BEGIN TRAN T1
    BEGIN TRY
    -- Se elimina las claves antiguas
    delete from tblPassword where nIdPassword in (
      select nIdPassword from (
        select nIdPassword, 
          ROW_NUMBER() OVER(ORDER BY nIdPassword DESC) AS Row
        from tblPassword
        where iRut = @iRut
        ) as tbl 
      where Row > @iNum_claves_hist - 1
    )
    -- se actualiza el estado de las claves
    update tblPassword set iIdEstado = 9 where iRut= @iRut;
    -- se inserta nueva clave con caducidad de 1 dia
    insert into tblPassword (nIdPassword,iRut,dFechaCreacion,dFechaCaducidad,vcHashClave,iIdEstado)
    select MAX(nIdPassword) + 1,@iRut,current_timestamp,current_timestamp + 1 day, @vcHashPassword, 10 from tblPassword
    -- se actualizan los intetos y el estado del usuario
    update tblUsuario set tIntentos = 0, iIdEstado = 5 where iRut= @iRut;
    
    set @iCodError = 0;
    set @vcMsjError = '' ;
    
    COMMIT TRAN T1
    return
  END TRY
  BEGIN CATCH
    SET @iCodError = 6;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
  END CATCH
END
GO

GO
--SqlScripter----[dbo].[spRegistraControlProceso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spRegistraControlProceso]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spRegistraControlProceso] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 31/07/2013
-- Description: Registra datos en tabla de control de proceso
-- =============================================
ALTER PROCEDURE [dbo].[spRegistraControlProceso]
@iPeriodo int,
  @iEstado_control_proceso int,
  @iIdTipoControlProceso int,
  @vcDetalle varchar(255),
  @iId_control_proceso int output,
  @iCodError int output,
  @vcMsjError varchar(50) output,
  @iContador int = 0
AS
BEGIN
  SET NOCOUNT ON;
  set @iCodError=0
  set @vcMsjError=''
  if @iId_control_proceso = 0 or @iId_control_proceso is null 
  BEGIN 
    BEGIN TRAN T1
    BEGIN TRY
      -- CONTROL DE PROCESO, OBTENER ID DE CONTROL DE PROCESO
      SELECT     @iId_control_proceso = MAX(nIdControlProceso) +1
      FROM         tblControlProceso
      WHERE     (nPeriodo = @iPeriodo)
          
      -- En caso de que no hallan procesos para el periodo actual,  generar ID 1
      if @iId_control_proceso is null
      begin
        select @iId_control_proceso=1
      end
      
      -- INSERTAR REGISTRO DE CONTROL DE PROCESO
      INSERT INTO tblControlProceso
           (nIdControlProceso,nPeriodo,dFechaInicio,dFechaFin
           ,iIdEstado,iIdTipoControlProceso,vcDetalle)
       VALUES
           (@iId_control_proceso
           ,@iPeriodo
           ,GETDATE() --FECHA INICIO
           ,GETDATE() -- FECHA TERMINO
           ,@iEstado_control_proceso  
           ,@iIdTipoControlProceso 
           ,@vcDetalle)
      
      COMMIT TRAN  T1
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 1;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      return
    END CATCH
    END
    else
    BEGIN
    BEGIN TRAN T2
    BEGIN TRY
      -- INSERTAR REGISTRO DE CONTROL DE PROCESO
      UPDATE tblControlProceso
      SET    dFechaFin = CURRENT_TIMESTAMP,
           iIdEstado = @iEstado_control_proceso,
           vcDetalle = @vcDetalle
      WHERE
          nIdControlProceso = @iId_control_proceso
      
      COMMIT TRAN  T2
      RETURN
    END TRY
    BEGIN CATCH
      SET @iCodError = 1;
      SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
      return
    END CATCH
    END
    
    
END
GO

GO
--SqlScripter----[dbo].[spRegistraEventoAuditoria].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spRegistraEventoAuditoria]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spRegistraEventoAuditoria] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 10-06-13
-- Description: Registra eventos del sistema
-- =============================================
ALTER PROCEDURE [dbo].[spRegistraEventoAuditoria]
@vcFechaHora varchar(23), -- yyyy-MM-dd hh:mm:ss.fff
  @iTipoEvento int, 
  @vcTipoRegistro varchar(1), 
  @iUsuario int, 
  @vcTerminal varchar(30), 
  @txInfo text,
  @vcSalida varchar(50)output
  
AS
BEGIN TRY 
  set @vcTipoRegistro = UPPER(@vcTipoRegistro);
  set @vcSalida = 'OK';
  if @vcTipoRegistro = 'I' or @vcTipoRegistro = 'D' or @vcTipoRegistro = 'W' or @vcTipoRegistro = 'E'
    insert into tblEventoAuditoria
      (nIdEvento, 
      nPeriodo, 
      dFecha, 
      iUsuario, 
      vcDireccionTerminal,
      iIdTipoEvento, 
      cTipoRegistro, 
      txDescripcion)
    select 
      coalesce (max(nIdEvento)+1, 1),
      dbo.fncPeriodo(),
      current_timestamp,
      @iUsuario,
      @vcTerminal,
      @iTipoEvento,
      @vcTipoRegistro,
      @txInfo
    from tblEventoAuditoria
    where nPeriodo = dbo.fncPeriodo()   
  else
    set @vcSalida = 'TipoRegistro no valido (' + @vcTipoRegistro + ')';
END TRY
BEGIN CATCH
  set @vcSalida = 'Error ' + ERROR_NUMBER() + ' ' + ERROR_MESSAGE()
END CATCH
GO

GO
--SqlScripter----[dbo].[spRescataParametro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spRescataParametro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spRescataParametro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 17-06-2013
-- Description: Retorna el valor de un parametro
-- =============================================
ALTER PROCEDURE [dbo].[spRescataParametro]
@iIdParam int, 
  @vcValorParam varchar (250) output,
  @iContador int output,
  @iIdTipoParam int = -1
AS
BEGIN
  set @iContador = 0;
  select @iContador = COUNT(iIdParametro)
  from tblParametro 
  where iIdParametro = @iIdParam
  and (@iIdTipoParam=-1 or iIdTipoParametro = @iIdTipoParam);
  
  if @iContador = 1 
  begin
    select @vcValorParam = vcValor
    from tblParametro 
    where iIdParametro = @iIdParam
    and (@iIdTipoParam=-1 or iIdTipoParametro = @iIdTipoParam);
  end
  else
  begin
    set @vcValorParam = '';
  end
END
GO

GO
--SqlScripter----[dbo].[spRespaldaDatosAHistorico].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spRespaldaDatosAHistorico]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spRespaldaDatosAHistorico] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 24-06-2013
-- Description: Realiza el respaldo de información a tablas historicas para proceder a limpieza de tablas.
--              El proceso se puede retomar pues realiza eliminación de datos de manera transaccional.
-- =============================================
ALTER PROCEDURE [dbo].[spRespaldaDatosAHistorico]
@iRutUsuario int,   
  @iPeriodoaRespaldar int = 0,
  @vcTerminal varchar(30),
  @iCodError int = 0 out, 
  @vcMsjError varchar(100) = 'OK' out
AS
declare 
  @dFechaRegistro datetime, 
  @dfechaRegistro_1 datetime,
  @dfechaRegistro_2 datetime,
  @iFilasProcesadas int=0,
  @iTamanoBloqueEliminar int=10000,
  @biCantidadCiclos bigint=0,
  @iPeriodoActual int,
  @iPeriodoaRespaldar_1 int,
  @iPeriodoaRespaldar_2 int
BEGIN
  BEGIN TRY       
    exec dbo.spRegistraEventoAuditoria getdate,'4','I',@iRutUsuario ,@vcTerminal ,'EJECUTA RESPALDO DATOS HISTORICOS',@vcMsjError 
  
    select @iPeriodoActual =MAX (nperiodo)
    FROM [dbo].[tblPeriodo]
    
    IF @iPeriodoActual  is null
    begin
      set @iCodError = -1;
      set @vcMsjError = 'No hay periodos ingresados en tabla periodo';  
      return
    end

    --GRN --- Se calcula periodo - 1 y period - 2 
    select @iPeriodoaRespaldar_1 = SUBSTRING(CONVERT(varchar, dateadd(month,-1,convert(date,convert(varchar,@iPeriodoaRespaldar) + '01',112)),112),1,6);
    select @iPeriodoaRespaldar_2 = SUBSTRING(CONVERT(varchar, dateadd(month,-2,convert(date,convert(varchar,@iPeriodoaRespaldar) + '01',112)),112),1,6);
    
    select COUNT(nperiodo) from tblPeriodo where nPeriodo = @iPeriodoaRespaldar_1
    if @@ROWCOUNT = 0
    begin
      set @iCodError = -1;
      set @vcMsjError = 'No se encuentra el periodo de recaudacion (n-1)'; 
      return
    end
    select COUNT(nperiodo) from tblPeriodo where nPeriodo = @iPeriodoaRespaldar_2
    if @@ROWCOUNT = 0
    begin
      set @iCodError = -1;
      set @vcMsjError = 'No se encuentra el periodo de recaudacion (n-2)'; 
      return
    end
    --FIN GRN---
    SELECT @dfechaRegistro =max(dFechaRegistro)      
    FROM dbo.tblRegistroConsolidacion
    where nPeriodo=@iPeriodoaRespaldar
    and iIdEstado=27
    and vcTipoConsolidacion='CD'
    IF @dfechaRegistro is not null
    begin
    -- OK Procediendo a realizar respaldo tabla TBLAFILIADODETALLE
    --*********************************************************************   
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA DETALLE AFILIADO HISTORICO
      INSERT INTO tblHistAfiliadoDetalle
                      (nIdInstitucion, nPeriodo, dFechaRegistro, iCorrelativo, vcIdentificadorAfiliado, tIdTipoIdentificador, vcNombreAfiliado, tIdTipoAfiliado, nFechaAfiliacion, vcRutEmpresa, 
                      nRentaImponible, vbRentaImponible)
      SELECT     TOP (@iTamanoBloqueEliminar ) tblAfiliadoDetalle.nIdInstitucion, tblAfiliadoDetalle.nPeriodo, @dfechaRegistro , tblAfiliadoDetalle.iCorrelativo, 
                      tblAfiliadoDetalle.vcIdentificadorAfiliado, tblAfiliadoDetalle.tIdTipoIdentificador, tblAfiliadoDetalle.vcNombreAfiliado, tblAfiliadoDetalle.tIdTipoAfiliado, 
                      tblAfiliadoDetalle.nFechaAfiliacion, tblAfiliadoDetalle.vcRutEmpresa, tblAfiliadoDetalle.nRentaImponible, tblAfiliadoDetalle.vbRentaImponible
      FROM         tblAfiliadoDetalle INNER JOIN
                      tblAfiliadoCabecera ON tblAfiliadoDetalle.nIdInstitucion = tblAfiliadoCabecera.nIdInstitucion AND tblAfiliadoDetalle.nPeriodo = tblAfiliadoCabecera.nPeriodo AND 
                      tblAfiliadoDetalle.iCorrelativo = tblAfiliadoCabecera.iCorrelativo
      WHERE     (tblAfiliadoDetalle.nPeriodo = @iPeriodoaRespaldar) AND (tblAfiliadoCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblAfiliadoDetalle.nIdInstitucion, tblAfiliadoDetalle.nPeriodo, tblAfiliadoDetalle.iCorrelativo, tblAfiliadoDetalle.vcIdentificadorAfiliado, 
                      tblAfiliadoDetalle.tIdTipoIdentificador
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
      set @biCantidadCiclos=@biCantidadCiclos+1     
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar )
        tblAfiliadoDetalle.nIdInstitucion, tblAfiliadoDetalle.nPeriodo, tblAfiliadoDetalle.iCorrelativo, tblAfiliadoDetalle.vcIdentificadorAfiliado, tblAfiliadoDetalle.tIdTipoIdentificador,
		tblAfiliadoDetalle.vcRutEmpresa
      FROM tblAfiliadoDetalle INNER JOIN
                 tblAfiliadoCabecera ON tblAfiliadoDetalle.nIdInstitucion = tblAfiliadoCabecera.nIdInstitucion AND tblAfiliadoDetalle.nPeriodo = tblAfiliadoCabecera.nPeriodo AND
                 tblAfiliadoDetalle.iCorrelativo = tblAfiliadoCabecera.iCorrelativo
      WHERE (tblAfiliadoDetalle.nPeriodo = @iPeriodoaRespaldar) AND (tblAfiliadoCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblAfiliadoDetalle.nIdInstitucion, tblAfiliadoDetalle.nPeriodo, tblAfiliadoDetalle.iCorrelativo, tblAfiliadoDetalle.vcIdentificadorAfiliado,
                  tblAfiliadoDetalle.tIdTipoIdentificador
     )
      delete tad from tblAfiliadoDetalle AS tad
      inner join CTE on cte.nIdInstitucion=tad.nIdInstitucion
      and cte.nPeriodo=tad.nPeriodo
      and cte.iCorrelativo=tad.iCorrelativo
      and cte.vcIdentificadorAfiliado=tad.vcIdentificadorAfiliado
      and cte.tIdTipoIdentificador=tad.tIdTipoIdentificador
	  and cte.vcRutEmpresa=tad.vcRutEmpresa
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de afiliados';  
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end   
    -- Fin respaldo tabla TBLAFILIADODETALLE
    --*********************************************************************
      
    -- Procediendo a realizar respaldo tabla TBLAFILIADOERROR
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA AFILIADO ERROR
      INSERT INTO tblHistAfiliadoError
                      (nIdInstitucion, nPeriodo, dFechaRegistro, iCorrelativo, nNumRegistro, txCodigoError, vcRedDat)
      SELECT     TOP (@iTamanoBloqueEliminar ) tblAfiliadoError.nIdInstitucion, tblAfiliadoError.nPeriodo, @dFechaRegistro, 
      tblAfiliadoError.iCorrelativo, tblAfiliadoError.nNumRegistro, tblAfiliadoError.txCodigoError, tblAfiliadoError.vcRedDat
      FROM         tblAfiliadoError INNER JOIN
                      tblAfiliadoCabecera ON tblAfiliadoError.nIdInstitucion = tblAfiliadoCabecera.nIdInstitucion AND tblAfiliadoError.nPeriodo = tblAfiliadoCabecera.nPeriodo AND 
                      tblAfiliadoError.iCorrelativo = tblAfiliadoCabecera.iCorrelativo
      WHERE     (tblAfiliadoError.nPeriodo = @iPeriodoaRespaldar) AND (tblAfiliadoCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblAfiliadoError.nIdInstitucion, tblAfiliadoError.nPeriodo, tblAfiliadoError.iCorrelativo ,tblAfiliadoError.nNumRegistro
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
        
      set @biCantidadCiclos=@biCantidadCiclos+1
      
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar ) tblAfiliadoError.nIdInstitucion, tblAfiliadoError.nPeriodo, @dFechaRegistro fechaRegistro, 
        tblAfiliadoError.iCorrelativo, tblAfiliadoError.nNumRegistro
      FROM         tblAfiliadoError INNER JOIN
                      tblAfiliadoCabecera ON tblAfiliadoError.nIdInstitucion = tblAfiliadoCabecera.nIdInstitucion AND tblAfiliadoError.nPeriodo = tblAfiliadoCabecera.nPeriodo AND 
                      tblAfiliadoError.iCorrelativo = tblAfiliadoCabecera.iCorrelativo
      WHERE     (tblAfiliadoError.nPeriodo = @iPeriodoaRespaldar) AND (tblAfiliadoCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblAfiliadoError.nIdInstitucion, tblAfiliadoError.nPeriodo, tblAfiliadoError.iCorrelativo ,tblAfiliadoError.nNumRegistro
      )
      delete tae from tblAfiliadoError AS tae
      inner join CTE on cte.nIdInstitucion=tae.nIdInstitucion
      and cte.nPeriodo=tae.nPeriodo
      and cte.iCorrelativo=tae.iCorrelativo
      and cte.nNumRegistro=tae.nNumRegistro
      
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de error afiliados';  
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end 
    -- Fin respaldo tabla TBLAFILIADODETALLE
    --*********************************************************************

	-- Procediendo a realizar respaldo tabla tblDeudaDetalle
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA AFILIADO ERROR
      INSERT INTO tblHistDeudaDetalle
                      (nIdInstitucion, nPeriodo, dFechaRegistro, iCorrelativo, vcIdentificadorDeudor, tIdTipoIdentificador, vcNumPagare, tIdTipoAfiliado, vcFechaColocacion, 
                      vcFechaPrimerImpago, nCapitalInicial, nSaldoCapital, vcRutAval_1, vcRutAval_2, vcRutAval_3, vcTipoDeuda, nMontoCobrar, nMontoOfertaColocacion, 
                      vcEmplanillado)
      SELECT     TOP (@iTamanoBloqueEliminar ) tblDeudaDetalle.nIdInstitucion,tblDeudaDetalle.nPeriodo, @dFechaRegistro, tblDeudaDetalle.iCorrelativo, vcIdentificadorDeudor, tIdTipoIdentificador, vcNumPagare, tIdTipoAfiliado, vcFechaColocacion, 
                      vcFechaPrimerImpago, nCapitalInicial, nSaldoCapital, vcRutAval_1, vcRutAval_2, vcRutAval_3, vcTipoDeuda, nMontoCobrar, nMontoOfertaColocacion, 
                      vcEmplanillado
      FROM      tblDeudaDetalle INNER JOIN
                      tblDeudaCabecera ON tblDeudaDetalle.nIdInstitucion = tblDeudaCabecera.nIdInstitucion AND tblDeudaDetalle.nPeriodo = tblDeudaCabecera.nPeriodo AND 
                      tblDeudaDetalle.iCorrelativo = tblDeudaCabecera.iCorrelativo
      WHERE     (tblDeudaDetalle.nPeriodo = @iPeriodoaRespaldar) AND (tblDeudaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblDeudaDetalle.nIdInstitucion, tblDeudaDetalle.nPeriodo, tblDeudaDetalle.iCorrelativo ,tblDeudaDetalle.vcNumPagare
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
        
      set @biCantidadCiclos=@biCantidadCiclos+1
      
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar ) tblDeudaDetalle.nIdInstitucion,tblDeudaDetalle.nPeriodo, tblDeudaDetalle.iCorrelativo, vcNumPagare
      FROM      tblDeudaDetalle INNER JOIN
                      tblDeudaCabecera ON tblDeudaDetalle.nIdInstitucion = tblDeudaCabecera.nIdInstitucion AND tblDeudaDetalle.nPeriodo = tblDeudaCabecera.nPeriodo AND 
                      tblDeudaDetalle.iCorrelativo = tblDeudaCabecera.iCorrelativo
      WHERE     (tblDeudaDetalle.nPeriodo = @iPeriodoaRespaldar) AND (tblDeudaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblDeudaDetalle.nIdInstitucion, tblDeudaDetalle.nPeriodo, tblDeudaDetalle.iCorrelativo ,tblDeudaDetalle.vcNumPagare
      )
      delete tdd from tblDeudaDetalle AS tdd
      inner join CTE on cte.nIdInstitucion=tdd.nIdInstitucion
      and cte.nPeriodo=tdd.nPeriodo
      and cte.iCorrelativo=tdd.iCorrelativo
      and cte.vcNumPagare=tdd.vcNumPagare
      
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de detalle de deuda'; 
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end 
    -- Fin respaldo tabla tblDeudaDetalle
    --*********************************************************************
        
    -- Procediendo a realizar respaldo tabla tblDeudaError
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA AFILIADO ERROR
      INSERT INTO tblHistDeudaError
                      ( nInstitucion, nPeriodo, dFechaRegistro, iCorrelativo, nNumRegistro, txCodigoError, vcRedDat)
      SELECT     TOP (@iTamanoBloqueEliminar )  nInstitucion, tblDeudaError.nPeriodo, @dFechaRegistro, tblDeudaError.iCorrelativo, nNumRegistro, txCodigoError, vcRedDat
      FROM      tblDeudaError INNER JOIN
                      tblDeudaCabecera ON tblDeudaError.nInstitucion = tblDeudaCabecera.nIdInstitucion AND tblDeudaError.nPeriodo = tblDeudaCabecera.nPeriodo AND 
                      tblDeudaError.iCorrelativo = tblDeudaCabecera.iCorrelativo
      WHERE     (tblDeudaError.nPeriodo = @iPeriodoaRespaldar) AND (tblDeudaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblDeudaError.nInstitucion, tblDeudaError.nPeriodo, tblDeudaError.iCorrelativo ,tblDeudaError.nNumRegistro
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
        
      set @biCantidadCiclos=@biCantidadCiclos+1
      
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar )  nInstitucion, tblDeudaError.nPeriodo, @dFechaRegistro dFechaRegistro, tblDeudaError.iCorrelativo, nNumRegistro
      FROM      tblDeudaError INNER JOIN
                      tblDeudaCabecera ON tblDeudaError.nInstitucion = tblDeudaCabecera.nIdInstitucion AND tblDeudaError.nPeriodo = tblDeudaCabecera.nPeriodo AND 
                      tblDeudaError.iCorrelativo = tblDeudaCabecera.iCorrelativo
      WHERE     (tblDeudaError.nPeriodo = @iPeriodoaRespaldar) AND (tblDeudaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblDeudaError.nInstitucion, tblDeudaError.nPeriodo, tblDeudaError.iCorrelativo ,tblDeudaError.nNumRegistro
      )
      delete tde from tblDeudaError AS tde
      inner join CTE on cte.nInstitucion=tde.nInstitucion
      and cte.nPeriodo=tde.nPeriodo
      and cte.iCorrelativo=tde.iCorrelativo
      and cte.nNumRegistro=tde.nNumRegistro
      
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de errores de deuda'; 
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end 
    -- Fin respaldo tabla tblDeudaError
    --*********************************************************************
	end
    
    SELECT @dfechaRegistro_1 =max(dFechaRegistro)      
    FROM dbo.tblRegistroConsolidacion
    where nPeriodo=@iPeriodoaRespaldar_1
    and iIdEstado=27
    and vcTipoConsolidacion='CC'
    IF @dfechaRegistro_1 is not null
    begin
       -- Procediendo a realizar respaldo tabla TBLCARTERACOMPRADADETALLE
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA DETALLE AFILIADO HISTORICO
      INSERT INTO tblHistCarteraCompradaDetalle
                 (nIdInstitucion, nPeriodo,dFechaRegistro,iCorrelativo,nIdCajaOrigen,vcNumPagare,vcRutEmpresa,vcIdentificadorDeudor,
                 tIdTipoIdentificador,vcNombreDeudor,tIdTipoAfiliado,vcRutAval,cSujetoDescuento,nMontoPagado,vcFechaPago,vcTipoDeuda)
      SELECT     TOP (@iTamanoBloqueEliminar ) tblCarteraCompradaDetalle.nIdInstitucion, tblCarteraCompradaDetalle.nPeriodo,@dfechaRegistro_1,tblCarteraCompradaDetalle.iCorrelativo,tblCarteraCompradaDetalle.nIdCajaOrigen,tblCarteraCompradaDetalle.vcNumPagare,tblCarteraCompradaDetalle.vcRutEmpresa,tblCarteraCompradaDetalle.vcIdentificadorDeudor,
                 tblCarteraCompradaDetalle.tIdTipoIdentificador,tblCarteraCompradaDetalle.vcNombreDeudor,tblCarteraCompradaDetalle.tIdTipoAfiliado,tblCarteraCompradaDetalle.vcRutAval,tblCarteraCompradaDetalle.cSujetoDescuento,tblCarteraCompradaDetalle.nMontoPagado,tblCarteraCompradaDetalle.vcFechaPago,
				 tblCarteraCompradaDetalle.vcTipoDeuda
      FROM       tblCarteraCompradaDetalle INNER JOIN
                 tblCarteraCompradaCabecera ON tblCarteraCompradaDetalle .nIdInstitucion = tblCarteraCompradaCabecera.nIdInstitucion AND tblCarteraCompradaDetalle .nPeriodo = tblCarteraCompradaCabecera.nPeriodo AND 
                 tblCarteraCompradaDetalle .iCorrelativo = tblCarteraCompradaCabecera.iCorrelativo
      WHERE     (tblCarteraCompradaDetalle.nPeriodo = @iPeriodoaRespaldar_1) AND (tblCarteraCompradaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblCarteraCompradaDetalle.nIdInstitucion, tblCarteraCompradaDetalle.nPeriodo, tblCarteraCompradaDetalle.iCorrelativo, tblCarteraCompradaDetalle.vcIdentificadorDeudor, 
                      tblCarteraCompradaDetalle.tIdTipoIdentificador
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
      set @biCantidadCiclos=@biCantidadCiclos+1     
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar ) 
        tblCarteraCompradaDetalle.nIdInstitucion, tblCarteraCompradaDetalle.nPeriodo, tblCarteraCompradaDetalle.iCorrelativo, tblCarteraCompradaDetalle.vcIdentificadorDeudor, tblCarteraCompradaDetalle.tIdTipoIdentificador
      FROM tblCarteraCompradaDetalle INNER JOIN
                 tblCarteraCompradaCabecera ON tblCarteraCompradaDetalle.nIdInstitucion = tblCarteraCompradaCabecera.nIdInstitucion AND tblCarteraCompradaDetalle.nPeriodo = tblCarteraCompradaCabecera.nPeriodo AND 
                 tblCarteraCompradaDetalle.iCorrelativo = tblCarteraCompradaCabecera.iCorrelativo
      WHERE (tblCarteraCompradaDetalle.nPeriodo = @iPeriodoaRespaldar_1) AND (tblCarteraCompradaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblCarteraCompradaDetalle.nIdInstitucion, tblCarteraCompradaDetalle.nPeriodo, tblCarteraCompradaDetalle.iCorrelativo, tblCarteraCompradaDetalle.vcIdentificadorDeudor, 
                  tblCarteraCompradaDetalle.tIdTipoIdentificador
      )
      delete tad from tblCarteraCompradaDetalle AS tad
      inner join CTE on cte.nIdInstitucion=tad.nIdInstitucion
      and cte.nPeriodo=tad.nPeriodo
      and cte.iCorrelativo=tad.iCorrelativo
      and cte.vcIdentificadorDeudor=tad.vcIdentificadorDeudor
      and cte.tIdTipoIdentificador=tad.tIdTipoIdentificador
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de afiliados';  
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end   
    -- Fin respaldo tabla TBLCARTERACOMPRADADETALLE
    --*********************************************************************
    
    -- Procediendo a realizar respaldo tabla tblCarteraCompradaError
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA DETALLE COMPRA CARTERA HISTORICO
      INSERT INTO tblHistCarteraCompradaError
                 (nIdInstitucion,nPeriodo,dFechaRegistro,iCorrelativo,nNumRegistro,txCodigoError,vcRedDat)
      SELECT     TOP (@iTamanoBloqueEliminar)  tblCarteraCompradaError.nIdInstitucion , tblCarteraCompradaError.nPeriodo,@dfechaRegistro_1,tblCarteraCompradaError.iCorrelativo,tblCarteraCompradaError.nNumRegistro,tblCarteraCompradaError.txCodigoError,tblCarteraCompradaError.vcRedDat
     FROM         tblCarteraCompradaError INNER JOIN
                      tblCarteraCompradaCabecera ON tblCarteraCompradaError.nIdInstitucion = tblCarteraCompradaCabecera.nIdInstitucion AND tblCarteraCompradaError.nPeriodo = tblCarteraCompradaCabecera.nPeriodo AND 
                      tblCarteraCompradaError.iCorrelativo = tblCarteraCompradaCabecera.iCorrelativo
      WHERE  tblCarteraCompradaError.nPeriodo = @iPeriodoaRespaldar_1 AND tblCarteraCompradaCabecera.iIdEstado = 15 --ESTADO VALIDADO
      ORDER BY tblCarteraCompradaError.nIdInstitucion, tblCarteraCompradaError.nPeriodo, tblCarteraCompradaError.iCorrelativo
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
      set @biCantidadCiclos=@biCantidadCiclos+1     
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar ) 
        tblCarteraCompradaError.nIdInstitucion, tblCarteraCompradaError.nPeriodo, tblCarteraCompradaError.iCorrelativo
      FROM tblCarteraCompradaError INNER JOIN
                 tblCarteraCompradaCabecera ON tblCarteraCompradaError.nIdInstitucion = tblCarteraCompradaCabecera.nIdInstitucion AND tblCarteraCompradaError.nPeriodo = tblCarteraCompradaCabecera.nPeriodo AND 
                 tblCarteraCompradaError.iCorrelativo = tblCarteraCompradaCabecera.iCorrelativo
      WHERE (tblCarteraCompradaError.nPeriodo = @iPeriodoaRespaldar_1) AND (tblCarteraCompradaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblCarteraCompradaError.nIdInstitucion, tblCarteraCompradaError.nPeriodo, tblCarteraCompradaError.iCorrelativo
      )
      delete tad from tblCarteraCompradaError AS tad
      inner join CTE on cte.nIdInstitucion=tad.nIdInstitucion
      and cte.nPeriodo=tad.nPeriodo
      and cte.iCorrelativo=tad.iCorrelativo
      
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de afiliados';  
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end   
    -- Fin respaldo tabla tblCarteraCompradaError
    --*********************************************************************
    end

    SELECT @dfechaRegistro_2 =max(dFechaRegistro)      
    FROM dbo.tblRegistroConsolidacion
    where nPeriodo=@iPeriodoaRespaldar_2
    and iIdEstado=27
    and vcTipoConsolidacion='CR'
    IF @dfechaRegistro_2 is not null
    begin
    -- Procediendo a realizar respaldo tabla tblRecaudacionDetalle
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA AFILIADO ERROR
      INSERT INTO tblHistRecaudacionDetalle
                      (nIdInstitucion, nPeriodo, dFechaRegistro, iCorrelativo, nIdCajaOrigen, vcNumPagare, vcRutEmpresa, vcIdentificadorDeudor, tIdTipoIdentificador, 
                      vcNombreDeudor, tIdTipoAfiliado, vcRutAval, cSujetoDescuento, nMontoCobrar, nMontoPagado, vcFechaPago)
      SELECT     TOP (@iTamanoBloqueEliminar ) tblRecaudacionDetalle.nIdInstitucion, tblRecaudacionDetalle.nPeriodo, @dFechaRegistro_2, tblRecaudacionDetalle.iCorrelativo, nIdCajaOrigen, vcNumPagare, vcRutEmpresa, vcIdentificadorDeudor, tIdTipoIdentificador, 
                      vcNombreDeudor, tIdTipoAfiliado, vcRutAval, cSujetoDescuento, nMontoCobrar, nMontoPagado, vcFechaPago
      FROM      tblRecaudacionDetalle INNER JOIN
                      tblRecaudacionCabecera ON tblRecaudacionDetalle.nIdInstitucion = tblRecaudacionCabecera.nIdInstitucion AND tblRecaudacionDetalle.nPeriodo = tblRecaudacionCabecera.nPeriodo AND 
                      tblRecaudacionDetalle.iCorrelativo = tblRecaudacionCabecera.iCorrelativo
      WHERE     (tblRecaudacionDetalle.nPeriodo = @iPeriodoaRespaldar_2) AND (tblRecaudacionCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblRecaudacionDetalle.nIdInstitucion, tblRecaudacionDetalle.nPeriodo, tblRecaudacionDetalle.iCorrelativo ,tblRecaudacionDetalle.nIdCajaOrigen, tblRecaudacionDetalle.vcNumPagare
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
        
      set @biCantidadCiclos=@biCantidadCiclos+1
      
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar ) tblRecaudacionDetalle.nIdInstitucion, tblRecaudacionDetalle.nPeriodo, @dFechaRegistro_2 dFechaRegistro, tblRecaudacionDetalle.iCorrelativo, nIdCajaOrigen, vcNumPagare, vcRutEmpresa, vcIdentificadorDeudor, tIdTipoIdentificador, 
                      vcNombreDeudor, tIdTipoAfiliado, vcRutAval, cSujetoDescuento, nMontoCobrar, nMontoPagado, vcFechaPago
      FROM      tblRecaudacionDetalle INNER JOIN
                      tblRecaudacionCabecera ON tblRecaudacionDetalle.nIdInstitucion = tblRecaudacionCabecera.nIdInstitucion AND tblRecaudacionDetalle.nPeriodo = tblRecaudacionCabecera.nPeriodo AND 
                      tblRecaudacionDetalle.iCorrelativo = tblRecaudacionCabecera.iCorrelativo
      WHERE     (tblRecaudacionDetalle.nPeriodo = @iPeriodoaRespaldar_2) AND (tblRecaudacionCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblRecaudacionDetalle.nIdInstitucion, tblRecaudacionDetalle.nPeriodo, tblRecaudacionDetalle.iCorrelativo ,tblRecaudacionDetalle.nIdCajaOrigen, tblRecaudacionDetalle.vcNumPagare
      )
      delete trd from tblRecaudacionDetalle AS trd
      inner join CTE on cte.nIdInstitucion=trd.nIdInstitucion
      and cte.nPeriodo=trd.nPeriodo
      and cte.iCorrelativo=trd.iCorrelativo
      and cte.nIdCajaOrigen=trd.nIdCajaOrigen
      and cte.vcNumPagare=trd.vcNumPagare
      
      
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de detalle recaudacion';  
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end 
    -- Fin respaldo tabla tblRecaudacionDetalle
    --*********************************************************************
    
    -- Procediendo a realizar respaldo tabla tblRecaudacionError
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA AFILIADO ERROR
      INSERT INTO tblHistRecaudacionError
                      (nIdInstitucion, nPeriodo, dFechaRegistro, iCorrelativo, nNumRegistro, txCodigoError, vcRedDat)
      SELECT     TOP (@iTamanoBloqueEliminar ) tblRecaudacionError.nIdInstitucion, tblRecaudacionError.nPeriodo, @dFechaRegistro_2, tblRecaudacionError.iCorrelativo, nNumRegistro, txCodigoError, vcRedDat
      FROM      tblRecaudacionError INNER JOIN
                      tblRecaudacionCabecera ON tblRecaudacionError.nIdInstitucion = tblRecaudacionCabecera.nIdInstitucion AND tblRecaudacionError.nPeriodo = tblRecaudacionCabecera.nPeriodo AND 
                      tblRecaudacionError.iCorrelativo = tblRecaudacionCabecera.iCorrelativo
      WHERE     (tblRecaudacionError.nPeriodo = @iPeriodoaRespaldar_2) AND (tblRecaudacionCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblRecaudacionError.nIdInstitucion, tblRecaudacionError.nPeriodo, tblRecaudacionError.iCorrelativo ,tblRecaudacionError.nNumRegistro
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
        
      set @biCantidadCiclos=@biCantidadCiclos+1
      
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar ) tblRecaudacionError.nIdInstitucion, tblRecaudacionError.nPeriodo, @dFechaRegistro_2 dFechaRegistro, tblRecaudacionError.iCorrelativo, nNumRegistro, txCodigoError, vcRedDat
      FROM      tblRecaudacionError INNER JOIN
                      tblRecaudacionCabecera ON tblRecaudacionError.nIdInstitucion = tblRecaudacionCabecera.nIdInstitucion AND tblRecaudacionError.nPeriodo = tblRecaudacionCabecera.nPeriodo AND 
                      tblRecaudacionError.iCorrelativo = tblRecaudacionCabecera.iCorrelativo
      WHERE     (tblRecaudacionError.nPeriodo = @iPeriodoaRespaldar_2) AND (tblRecaudacionCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblRecaudacionError.nIdInstitucion, tblRecaudacionError.nPeriodo, tblRecaudacionError.iCorrelativo ,tblRecaudacionError.nNumRegistro
      )
      delete tre from tblRecaudacionError AS tre
      inner join CTE on cte.nIdInstitucion=tre.nIdInstitucion
      and cte.nPeriodo=tre.nPeriodo
      and cte.iCorrelativo=tre.iCorrelativo
      and cte.nNumRegistro=tre.nNumRegistro
            
      
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de errores recaudacion';  
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end     
    -- Fin respaldo tabla tblRecaudacionError
    --*********************************************************************
    end

    set @iCodError = 0;
    set @vcMsjError = 'Respaldo de datos al historico realizado exitosamente';  
    return  
  END TRY
  BEGIN CATCH
    IF @@TRANCOUNT > 0
      begin
        rollback tran T1 -- ROLLBACK
      end
    
    SET @iCodError = -1;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
  END CATCH
  
END
GO

GO
--SqlScripter----[dbo].[spRetornaHashUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spRetornaHashUsuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spRetornaHashUsuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 24-06-2013
-- Description: Valida que un usuario especifico puede ejecutar un upload
-- =============================================
ALTER PROCEDURE [dbo].[spRetornaHashUsuario]
@iRut int,  
  @vcHashClave varchar(32) out, 
  @iCodError int = 0 out, 
  @vcMsjError varchar(50) = 'OK' out
AS
declare
@iClave_estado int
BEGIN   
  -- Se rescatan los datos de la password
  SELECT 
    @vcHashClave = tblPassword.vcHashClave,   
    @iClave_estado = tblPassword.iIdEstado
  from tblPassword
  where tblPassword.iRut = @iRut
    and tblPassword.iIdEstado <> 10 --no se evaluan las claves caducas 
  ORDER BY tblPassword.dFechaCreacion desc
  
  set @iCodError = 0;
  set @vcMsjError = 'OK';
  return
END
GO

GO
--SqlScripter----[dbo].[spTruncaTablasDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spTruncaTablasDetalle]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spTruncaTablasDetalle] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 08-08-2013
-- Description: Trunca el contenido de las tablas de detalle para proceder a limpieza
--              quedan sin datos.
-- =============================================
ALTER PROCEDURE [dbo].[spTruncaTablasDetalle]
@iRutUsuario int,     
  @vcTerminal varchar(30),
  @iCodError int = 0 out, 
  @vcMsjError varchar(50) = 'OK' out  
AS
declare
  @iEstado_final as int,
  @iCantidadRegistros as int
BEGIN
  begin try 
    exec dbo.spRegistraEventoAuditoria getdate,'4','I',@iRutUsuario,@vcTerminal ,'EJECUTA TRUNCADO DE DETALLE',@vcMsjError 
    
    truncate table tblAfiliadoDetalle
    truncate table tblAfiliadoError
    truncate table tblCarteraCompradaDetalle
    truncate table tblCarteraCompradaError
    truncate table tblDeudaDetalle
    truncate table tblDeudaError
    truncate table tblRecaudacionDetalle
    truncate table tblRecaudacionError
    
    select @iCantidadRegistros=count(*) from tblPeriodo where nPeriodo=convert(int,CONVERT(VARCHAR(6), DATEADD(month,-1,SYSDATETIME()), 112))
    if @iCantidadRegistros<> 1
    begin
        print 'Insertando nuevo registro de periodo'
        INSERT INTO tblPeriodo(nPeriodo) SELECT convert(int,CONVERT(VARCHAR(6), DATEADD(month,-1,SYSDATETIME()), 112))
    end
    else
    begin
        print 'No es necesario insertar registro de periodo'
    end

    set @iCodError = 0;
    set @vcMsjError = 'Truncado Exitoso'; 
    return  
  end try
  begin catch
    set @iCodError = -1;
    set @vcMsjError = 'Error durante el truncado de tablas';
  
  end catch
END
GO

GO
--SqlScripter----[dbo].[spUpdateFuncionalidad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spUpdateFuncionalidad]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spUpdateFuncionalidad] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 02-07-13
-- Description: Acrualiza las funcionalidades
-- =============================================
ALTER PROCEDURE [dbo].[spUpdateFuncionalidad]
@iIdFuncionalidad int,
  @vcDescripcion varchar(50),
  @iEstado int,
  @iCodError int out,
  @vcMsjError varchar(50) out
AS
BEGIN
  BEGIN TRY
    
    set @iCodError = 0
    set @vcMsjError = ''
    
    BEGIN TRAN T1
    
    update tblFuncionalidad 
    set iIdEstado = @iEstado,
      vcDescripcion = @vcDescripcion
    where iIdFuncionalidad = @iIdFuncionalidad
    
    COMMIT TRAN T1
    return
  END TRY
  BEGIN CATCH
    SET @iCodError = 1;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
  END CATCH
END
GO

GO
--SqlScripter----[dbo].[spUpdateParametro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spUpdateParametro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spUpdateParametro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 09-07-13
-- Description: Actualiza la tabla tblParametros
-- =============================================
ALTER PROCEDURE [dbo].[spUpdateParametro]
@iIdParametro int,
  @iIdUnidad int,
  @vcParametro varchar(50),
  @vcValor varchar(250),
  @vcUnidad varchar (10),
  @vcDescripcion varchar(250),
  @iCodError int output,
  @vcMsjError varchar(50) output
AS
BEGIN
  
  BEGIN TRY
  set @iCodError = 0
  set @vcMsjError = ''
    BEGIN TRAN T1
      update tblParametro set vcValor = @vcValor
      where tblParametro.iIdParametro = @iIdParametro
    COMMIT TRAN T1
    return
  END TRY
  BEGIN CATCH
    SET @iCodError = 1;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
  END CATCH
END
GO

GO
--SqlScripter----[dbo].[spValidaFuncionalidadUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spValidaFuncionalidadUsuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spValidaFuncionalidadUsuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 03-07-13
-- Description: Valida si un usuario tiene acceso a una funcionalidad
-- Codigo de Error:
--          0 = ok
--          1 = Usuario no registrado
--          2 = Usuario bloqueado o eliminado

-- =============================================
ALTER PROCEDURE [dbo].[spValidaFuncionalidadUsuario]
@iRut int, 
  @iFuncionalidad int = 0,  
  @iCodError int out,
  @vcMsjError varchar(50) out 
AS
declare @iCantidad int
BEGIN
  set @iCodError = 0
  set @vcMsjError = 'OK'
  
  SELECT     @iCantidad =COUNT(*) 
  FROM         tblFuncionalidad INNER JOIN
                      tblRel_PerfilFunc ON tblFuncionalidad.iIdFuncionalidad = tblRel_PerfilFunc.iIdFuncionalidad INNER JOIN
                      tblRel_UsuarioPerfil ON tblRel_PerfilFunc.iIdPerfil = tblRel_UsuarioPerfil.iIdPerfil
  WHERE     (tblFuncionalidad.iIdEstado = 1) AND (tblRel_UsuarioPerfil.iRut = @iRut) AND (tblFuncionalidad.iIdFuncionalidad = @iFuncionalidad)
  
  
  if @iCantidad = 0 -- no tiene acceso a la funcionalidad
  begin
    set @iCodError = 1;
    set @vcMsjError = 'No tiene acceso a la funcionalidad' ;
    return
  end
  
  
  return
END
GO

GO
--SqlScripter----[dbo].[spValidaUploadArchivo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spValidaUploadArchivo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spValidaUploadArchivo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 24-06-2013
-- Description: Valida que se puede realizar un upload de archivo
-- =============================================
ALTER PROCEDURE [dbo].[spValidaUploadArchivo]
@iRut int,  
  @iInstitucion int = 0,
  @iPeriodo int=0,
  @vcTipoArchivo varchar(2) = '  ',
  @vcNombreArchivo varchar(50) ,
  @iCodError int = 0 out, 
  @vcMsjError varchar(50) = 'OK' out
AS
declare
@iCantidad int
BEGIN
  
  -- Se crea este procedimiento almacenado para realizar validaciones extras de CICLO que impidan subir alguno de los 3 tipos de archivo
  if @vcTipoArchivo = 'AA' -- Validaciones de archivo de AFILIADOS
  begin
    select @iCantidad=COUNT(*) from tblAfiliadoCabecera 
    where tblAfiliadoCabecera.nPeriodo=@iPeriodo and tblAfiliadoCabecera.nIdInstitucion=@iInstitucion
    and tblAfiliadoCabecera.iIdEstado in (13,14,19) --enviado, validando, enviado ws
    if @iCantidad>0 
      begin
        set @iCodError = -1; -- DEBE IR UN -1 CON EL CICLO COMPLETO
        set @vcMsjError = 'Ya hay un archivo en proceso no validado'; 
      end
    else
      begin   
        set @iCodError = 0;
        set @vcMsjError = 'OK'; 
      end
    return
  end
  if @vcTipoArchivo = 'AD' -- Validaciones de archivo de DEUDAS
  BEGIN
    select @iCantidad=COUNT(*) from tblDeudaCabecera 
    where tblDeudaCabecera.nPeriodo=@iPeriodo and tblDeudaCabecera.nIdInstitucion=@iInstitucion
    and tblDeudaCabecera.iIdEstado in (13,14,19) --enviado, validando, enviado ws
    if @iCantidad>0 
      begin
        set @iCodError = -1; -- DEBE IR UN -1 CON EL CICLO COMPLETO
        set @vcMsjError = 'Ya hay un archivo en proceso no validado'; 
      end
    else
      begin   
        set @iCodError = 0;
        set @vcMsjError = 'OK'; 
      end
    return
  END
  
  if @vcTipoArchivo = 'AR' -- Validaciones de archivo de RECAUDACIONES
  BEGIN
    select @iCantidad=COUNT(*) from tblRecaudacionCabecera
    where tblRecaudacionCabecera.nPeriodo=@iPeriodo and tblRecaudacionCabecera.nIdInstitucion=@iInstitucion
    and tblRecaudacionCabecera.iIdEstado in (13,14,19) --enviado, validando, enviado ws
    if @iCantidad>0 
      begin
        set @iCodError = -1; -- DEBE IR UN -1 CON EL CICLO COMPLETO
        set @vcMsjError = 'Ya hay un archivo en proceso no validado'; 
      end
    else
      begin   
        set @iCodError = 0;
        set @vcMsjError = 'OK'; 
      end
    return
  END
  
  if @vcTipoArchivo = 'CC' -- Validaciones de archivo de COMPRA CARTERA
  BEGIN
    select @iCantidad=COUNT(*) from tblCarteraCompradaCabecera
    where tblCarteraCompradaCabecera.nPeriodo=@iPeriodo and tblCarteraCompradaCabecera.nIdInstitucion=@iInstitucion
    and tblCarteraCompradaCabecera.iIdEstado in (13,14,19) --enviado, validando, enviado ws
    if @iCantidad>0 
      begin
        set @iCodError = -1; -- DEBE IR UN -1 CON EL CICLO COMPLETO
        set @vcMsjError = 'Ya hay un archivo en proceso no validado'; 
      end
    else
      begin   
        set @iCodError = 0;
        set @vcMsjError = 'OK'; 
      end
    return
  END

  set @iCodError = 1;
  set @vcMsjError = 'TIPO DE ARCHIVO INCORRECTO'; 
  return  
  
END
GO

GO
--SqlScripter----[dbo].[spValidaUploadUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spValidaUploadUsuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spValidaUploadUsuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 24-06-2013
-- Description: Valida que un usuario especifico puede ejecutar un upload
-- =============================================
ALTER PROCEDURE [dbo].[spValidaUploadUsuario]
@iRut int, 
  @vcHashClave varchar(32), 
  @iInstitucion int = 0,
  @iCodError int = 0 out, 
  @vcMsjError varchar(50) = 'OK' out
AS
declare
@iUser_estado int,
@vcHashActual varchar(32),
@iClave_estado int
BEGIN
  
  set @iUser_estado = 0
  -- Se recatan los datos del usuario
  SELECT 
    @iUser_estado = tblUsuario.iIdEstado   
  from tblUsuario 
    inner join tblInstitucion on tblUsuario.nIdInstitucion = tblInstitucion.nIdInstitucion
  where tblUsuario.iRut = @iRut and tblInstitucion.nIdInstitucion=@iInstitucion;
    
  if @iUser_estado = 0 -- se compruba que el usuario existe
  begin
    set @iCodError = 1;
    set @vcMsjError = 'Usuario no existe o no asociado a la institución' ;
    return
  end
  if @iUser_estado = 6 -- clave bloqueada
  BEGIN
    set @iCodError = 2;
    set @vcMsjError = 'Usuario bloqueado';
    return
  END
  if @iUser_estado = 7 -- se comprueba que el usuario este activo
  begin
    set @iCodError = 3;
    set @vcMsjError = 'Usuario Eliminado.';
    return
  end
  
  -- Se rescatan los datos de la password
  SELECT 
    @vcHashActual = tblPassword.vcHashClave,    
    @iClave_estado = tblPassword.iIdEstado
  from tblPassword
  where tblPassword.iRut = @iRut
    and tblPassword.iIdEstado <> 10 --no se evaluan las claves caducas 
  ORDER BY tblPassword.dFechaCreacion desc
  
  if @vcHashClave <> @vcHashActual -- clave erronea
  BEGIN
    set @iCodError = 4;
    set @vcMsjError = 'Clave Erronea';    
    return
  END
    
  set @iCodError = 0;
  set @vcMsjError = 'OK';
  return
END
GO

GO
--SqlScripter----[dbo].[spValidaUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spValidaUsuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spValidaUsuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 14-06-13
-- Description: Valida el acceso de un usuario
-- Codigo de Error:
--          0 = ok
--          1 = Usuario no registrado
--          2 = Usuario bloqueado o eliminado
--          3 = Password Bloqueada por intentos
--          4 = Password erronea
--          5 = Password erronea, supera numero de intentos
--          6 = Institucion Inactiva o eliminada
-- Estado de usuario:
--          5 = Activo
--          6 = Bloqueado
--          7 = Eliminado
-- Estado de Password:
--      8 = Activa
--          9 = Caduca
--          10 = Creada

-- =============================================
ALTER PROCEDURE [dbo].[spValidaUsuario]
@iRut int, 
  @vcHashClave varchar(32),
  @iCodError int out,
  @vcMsjError varchar(100) out,
  @iUser_estado int = 0,
  @iUser_intentos int = 0,
  @vcClave varchar(32) = '',
  @nClave_id numeric(18,0) = 0,
  @iClave_estado int = 0,
  @iParametro_intentos int = 0,
  @iEstado_institucion int = 0
AS
BEGIN
  set @iCodError = 0
  set @vcMsjError = 'OK'

  -- Se recuperan datos de configuracion
  select @iParametro_intentos = vcValor 
  from tblParametro
  where iIdParametro = 5
  
  set @iUser_estado = 0
  -- Se recatan los datos del usuario
  SELECT 
    @iUser_estado = tblUsuario.iIdEstado,
    @iUser_intentos = tblUsuario.tIntentos,
    @iEstado_institucion = tblInstitucion.iIdEstado
  from tblUsuario 
    inner join tblInstitucion on tblUsuario.nIdInstitucion = tblInstitucion.nIdInstitucion
  where tblUsuario.iRut = @iRut;
  
  if @iUser_estado = 0 -- se compruba que el usuario existe
  begin
    set @iCodError = 1;
    set @vcMsjError = 'Datos no válidos';
    return
  end
  if @iUser_estado = 6 -- clave bloqueada
  BEGIN
    set @iCodError = 2;
    set @vcMsjError = 'Usuario bloqueado';
    return
  END
  if @iUser_estado = 7 -- se comprueba que el usuario este activo
  begin
    set @iCodError = 3;
    set @vcMsjError = 'Usuario Eliminado.';
    return
  end
  if @iEstado_institucion <> 11 -- se comprueba que institucion este activa
  begin
    set @iCodError = 6;
    set @vcMsjError = 'Datos no válidos';
    return
  end
  -- Se recatan los datos de la password
  SELECT 
    @vcClave = tblPassword.vcHashClave,
    @nClave_id = tblPassword.nIdPassword,
    @iClave_estado = tblPassword.iIdEstado
  from tblPassword
  where tblPassword.iRut = @iRut
    and tblPassword.iIdEstado <> 9  --no se evaluan las claves caducas 
  ORDER BY tblPassword.dFechaCreacion desc
  
  if @vcClave <> @vcHashClave -- clave bloqueada
  BEGIN
    set @iCodError = 4;
    set @vcMsjError = 'Datos no válidos';
    if @iUser_intentos < @iParametro_intentos - 1 -- se incrementan los intentos
    BEGIN
      update tblUsuario set tIntentos = tIntentos + 1 where iRut = @iRut;
    END
    else -- se incrementa los intentos y se bloquea la clave
    BEGIN
      update tblUsuario set tIntentos = tIntentos + 1, iIdEstado = 6 where iRut  = @iRut;
      set @iCodError = 5;
      set @vcMsjError = 'Se superó la cantidad de intentos. <br> Usuario bloqueado';
    END
    return
  END
  -- se actualiza la cantidad de intentos a 0
  update tblUsuario set tIntentos = 0 where iRut= @iRut;
  -- se retornan los datos de usuario
  SELECT  tblUsuario.vcNombre AS Nombre, 
      tblUsuario.vcEmail AS Email, 
      tblPassword.iIdEstado AS Estado, 
      DATEDIFF (day,current_timestamp, tblPassword.dFechaCaducidad) AS DiasCaduca, 
      tblUsuario.nIdInstitucion AS IdInstitucion,
      (SELECT MAX(nPeriodo) FROM tblPeriodo) AS Periodo,  
      tblInstitucion.vcNombre as Institucion,
	  tblInstitucion.bParticipa as Participa
FROM        tblUsuario INNER JOIN
      tblPassword ON tblUsuario.iRut = tblPassword.iRut INNER JOIN
            tblInstitucion ON tblUsuario.nIdInstitucion = tblInstitucion.nIdInstitucion
WHERE     tblPassword.nIdPassword = @nClave_id
  set @iCodError = 0;
  set @vcMsjError = 'OK';
  return
END
GO

GO
--SqlScripter----[dbo].[spVerificaClaveUser_Form].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spVerificaClaveUser_Form]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spVerificaClaveUser_Form] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 30-07-13
-- Description: Verifica Clave de Usuario
-- Codigo de Error:
--          0 = ok
--          1 = Usuario no registrado
--          2 = Usuario bloqueado o eliminado
--          3 = Password Bloqueada por intentos
--          4 = Password erronea
--          5 = Password erronea, supera numero de intentos
--          6 = Institucion Inactiva o eliminada
-- Estado de usuario:
--          5 = Activo
--          6 = Bloqueado
--          7 = Eliminado
-- Estado de Password:
--      8 = Activa
--          9 = Caduca
--          10 = Creada

-- =============================================
ALTER PROCEDURE [dbo].[spVerificaClaveUser_Form]
@iRut int, 
  @vcHashClave varchar(32),
  @iCodError int out,
  @vcMsjError varchar(50) out,
  @iCont int = 0
AS
BEGIN
  set @iCodError = 1
  set @vcMsjError = 'Clave incorrecta.'

  SELECT  @iCont=COUNT(tblPassword.nIdPassword)
  FROM    tblUsuario INNER JOIN
      tblPassword ON tblUsuario.iRut = tblPassword.iRut INNER JOIN
      tblInstitucion ON tblUsuario.nIdInstitucion = tblInstitucion.nIdInstitucion
  WHERE   tblPassword.vcHashClave = @vcHashClave
    and tblUsuario.iRut=@iRut
    and tblPassword.iIdEstado=8
  
  if @iCont > 0
  begin
    set @iCodError = 0
    set @vcMsjError = 'OK'
  end
END
GO

GO
--SqlScripter----[dbo].[spVerificaDiaConsolidacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spVerificaDiaConsolidacion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spVerificaDiaConsolidacion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    ENV
-- Create date: 12/09/2013
-- Description: Verifica si se debe hacer o no una consolidacion el dia en curso.
-- =============================================
ALTER PROCEDURE [dbo].[spVerificaDiaConsolidacion]
@vcTipoCons varchar(1) = '',  
  @dtProxConsDate DateTime,
  @iCodError int = 0 out,  
  @vcMsjError varchar(50) = 'OK' out
AS

BEGIN
DECLARE

 @dFeriado DateTime,
 @dPivote DateTime,
 @bHayFeriado bit,
 @bConsolidar bit,
 @iDiaConsDeuda int = 0,
 @iDiaConsRecauda int = 0, 
 @iDia int = 0,
 @iRes int = 0
 
 BEGIN TRY
    set @dPivote = GETDATE()
 
    DECLARE cursor_feriados CURSOR FOR  
    SELECT [dFeriado] 
    FROM [intercajas].[dbo].[tblFeriado] 
    where [dFeriado] > @dPivote
    
    open cursor_feriados
    FETCH NEXT FROM cursor_feriados INTO @dFeriado
    WHILE (@@FETCH_STATUS = 0  AND @bHayFeriado = 1 AND @bConsolidar= 0)
    BEGIN  
    
       set @dPivote = DATEADD (DAY , 1 , @dPivote )   
    
       IF (@dPivote = @dFeriado)
       BEGIN
       
        IF (@dFeriado = @dtProxConsDate)
        BEGIN
          set @bConsolidar = 1
        END

        FETCH NEXT FROM cursor_feriados INTO @dFeriado
        
        set @bHayFeriado = 1
       END
       ELSE
       BEGIN
        set @bHayFeriado = 0
       END
    END     
    CLOSE cursor_feriados
    deallocate cursor_feriados

    
    set @iCodError = 0;
    set @vcMsjError = 'OK'; 
    if (@bConsolidar = 0) return 0
    
    return 1

END TRY   
BEGIN CATCH
    set @iCodError = -1;
    set @vcMsjError = 'No se pudo verificar periodo'; 

  
END CATCH
END
GO

GO
--SqlScripter----[dbo].[spVerificaEjecConsolidacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spVerificaEjecConsolidacion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spVerificaEjecConsolidacion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 09-08-2013
-- Description: Verifica si se esta ejecuta alguna consolidación de archivos
-- =============================================
ALTER PROCEDURE [dbo].[spVerificaEjecConsolidacion]
@iValor_retorno int output
AS
BEGIN
  set @iValor_retorno=1;
  
  select @iValor_retorno=COUNT(nidControlProceso)
  from tblControlProceso
  where iIdEstado in (22,23) -- Estados iniciado, corriendo
  and iIdTipoControlProceso in (1,2,3,4,5,6,7,8) -- consolidaciones ETL y SP
END
GO

GO
--SqlScripter----[dbo].[spVerificaEnvioArchivos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spVerificaEnvioArchivos]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spVerificaEnvioArchivos] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 23-07-2013
-- Description: Verifica que para un tipo de consolidacion se hallan recibido todos los archivos necesarios.
-- Entradas_
--   Periodo : Periodo a consultar
--   tipocons: CD o CR para consolidacion de deuda o consolidacion de recaudacion efectiva
-- Posibles salidas:          
--   0 OK - Se han recibido todos los archivos
--   1 OK - está activado el bypass de archivos pendientes
--   -1 NOK - Faltan archivos afiliados
--   -2 NOK - Faltan archivos deuda
--   -3 NOK - Faltan archivos recaudacion
--   -4 NOK - OTROS
--   -5 NOK - Parametros incorrectos
-- =============================================
ALTER PROCEDURE [dbo].[spVerificaEnvioArchivos]
@iPeriodo int = 0,
  @vcTipoCons varchar(2) = '  ',      --CD : Consolidacion deuda    CR : Consolidacion recaudacion efectiva. -CP: Consolidacion Propuesta Cartera CC: Consolidacion compra cartera
  @iCodError int = 0 out, 
  @vcMsjError varchar(50) = 'OK' out
AS
declare
  @iCant_instituciones_participantes as int,
  @vcParam_autorizaConsolidacion as varchar(2),
  @iCant_archivos_afiliados_enviados as int,
  @iCant_archivos_deuda_enviados as int,
  @iCant_archivos_recaudacion_enviados as int,
  @iCant_archivos_compra_cartera_enviados as int
BEGIN
  if @vcTipoCons ='CD'  -- CONSOLIDACION DE DEUDA 
    begin
      -- Obtener lista de cajas participantes para el periodo y sus archivos de Afiliados y de deudas
      --*********************************************************************************************
      SELECT     @iCant_instituciones_participantes=COUNT(*) 
      FROM         tblInstitucion
      WHERE     (bParticipa = 1) AND (iIdEstado = 11);
      
      
      -- Obtener Existencia del parametro que permite consolidar sin todos los Archivos de afiliados y deudas
      --*****************************************************************************************************
      SELECT     @vcParam_autorizaConsolidacion =vcValor
      FROM         tblParametro
      WHERE     (iIdParametro = 60) -- AUTORIZA CONSOLIDACION DE DEUDA SIN TODOS LOS ARCHIVOS (DEUDA)
      if @@ROWCOUNT=0
      begin 
        set @iCodError = -4;
        set @vcMsjError = 'No se encontro parametro de autorizacion manual en bdd(Deuda)';  
        return
      end     
      
      
      -- Obtener cantidad de archivos validos enviados de afiliados   
      --***********************************************************
      SELECT vcNombreArchivo
      FROM vwUltimoArchivoEnviadoValidado
      where nperiodo=@iPeriodo and tipoarchivo='AA'
                            
      select @iCant_archivos_afiliados_enviados=@@ROWCOUNT
                      
            -- Validar cantidades de archivos de afiliados
            --********************************************
      if @iCant_archivos_afiliados_enviados<>@iCant_instituciones_participantes and @vcParam_autorizaConsolidacion<>'SI'
      begin       
        set @iCodError = -1;
        set @vcMsjError = 'No se han enviado todos los archivos de afiliados';  
        return
      end
      
      -- Validar que no se hallan enviado archivos de afiliados
      --*******************************************************
      if @iCant_archivos_afiliados_enviados=0
      begin
        set @iCodError = -1;
        set @vcMsjError = 'No se ha enviado ningun archivo de afiliados'; 
        return
      end
      
      
      
      
      
      -- Obtener cantidad de archivos validos enviados de deuda
      SELECT vcNombreArchivo
      FROM vwUltimoArchivoEnviadoValidado
      where nperiodo=@iPeriodo and tipoarchivo='AD'
                      
      
      -- Validar cantidades de archivos de deuda    
      select @iCant_archivos_deuda_enviados=@@ROWCOUNT
                      
            -- Validar cantidades de archivos de deuda
            --****************************************
      if @iCant_archivos_deuda_enviados<>@iCant_instituciones_participantes and @vcParam_autorizaConsolidacion<>'SI'
      begin       
        set @iCodError = -2;
        set @vcMsjError = 'No se han enviado todos los archivos de deuda';  
        return
      end
      
      -- Validar archivos de deuda validos dentro del sistema
      --*****************************************************
      if @iCant_archivos_deuda_enviados=0
      begin
        set @iCodError = -2;
        set @vcMsjError = 'No se ha enviado ningun archivo de deuda'; 
        return
      end
      
      
      set @iCodError = 0;
      set @vcMsjError = 'Validacion exitosa,  se puede consolidar'; 
            
    end
  else if @vcTipoCons ='CP' -- CONSOLIDACION DE PROPUESTA CARTERAS
    begin
      -- Obtener lista de cajas participantes para el periodo y sus archivos de Afiliados y de deudas
      --*********************************************************************************************
      SELECT     @iCant_instituciones_participantes=COUNT(*) 
      FROM         tblInstitucion
      WHERE     (bParticipa = 1) AND (iIdEstado = 11);
      
      
      -- Obtener Existencia del parametro que permite consolidar sin todos los Archivos de afiliados y deudas
      --*****************************************************************************************************
      SELECT     @vcParam_autorizaConsolidacion =vcValor
      FROM         tblParametro
      WHERE     (iIdParametro = 80) -- AUTORIZA CONSOLIDACION POROPUESTA DE CARTERAS SIN TODOS LOS ARCHIVOS (DEUDAS y AFILIADOS)
      if @@ROWCOUNT=0
      begin 
        set @iCodError = -4;
        set @vcMsjError = 'No se encontro parametro de autorizacion manual en bdd(Deuda)';  
        return
      end     
      
      
      -- Obtener cantidad de archivos validos enviados de afiliados   
      --***********************************************************
      SELECT vcNombreArchivo
      FROM vwUltimoArchivoEnviadoValidado
      where nperiodo=@iPeriodo and tipoarchivo='AA'
                            
      select @iCant_archivos_afiliados_enviados=@@ROWCOUNT
                      
            -- Validar cantidades de archivos de afiliados
            --********************************************
      if @iCant_archivos_afiliados_enviados<>@iCant_instituciones_participantes and @vcParam_autorizaConsolidacion<>'SI'
      begin       
        set @iCodError = -1;
        set @vcMsjError = 'No se han enviado todos los archivos de afiliados';  
        return
      end
      
      -- Validar que no se hallan enviado archivos de afiliados
      --*******************************************************
      if @iCant_archivos_afiliados_enviados=0
      begin
        set @iCodError = -1;
        set @vcMsjError = 'No se ha enviado ningun archivo de afiliados'; 
        return
      end
      
      
      
      
      
      -- Obtener cantidad de archivos validos enviados de deuda
      SELECT vcNombreArchivo
      FROM vwUltimoArchivoEnviadoValidado
      where nperiodo=@iPeriodo and tipoarchivo='AD'
                      
      
      -- Validar cantidades de archivos de deuda    
      select @iCant_archivos_deuda_enviados=@@ROWCOUNT
                      
            -- Validar cantidades de archivos de deuda
            --****************************************
      if @iCant_archivos_deuda_enviados<>@iCant_instituciones_participantes and @vcParam_autorizaConsolidacion<>'SI'
      begin       
        set @iCodError = -2;
        set @vcMsjError = 'No se han enviado todos los archivos de deuda';  
        return
      end
      
      -- Validar archivos de deuda validos dentro del sistema
      --*****************************************************
      if @iCant_archivos_deuda_enviados=0
      begin
        set @iCodError = -2;
        set @vcMsjError = 'No se ha enviado ningun archivo de deuda'; 
        return
      end
      
      
      set @iCodError = 0;
      set @vcMsjError = 'Validacion exitosa,  se puede consolidar'; 
            
    end
  else if @vcTipoCons ='CR' -- CONSOLIDACION DE RECAUDACIONES
    begin
      -- Obtener lista de cajas participantes para el periodo y sus archivos de Afiliados y de deudas
      SELECT     @iCant_instituciones_participantes=COUNT(*) 
      FROM         tblInstitucion
      WHERE     (bParticipa = 1) AND (iIdEstado = 11);
      
      -- Obtener Existencia del parametro que permite consolidar sin todos los Archivos de recaudacion      
      SELECT     @vcParam_autorizaConsolidacion =vcValor
      FROM         tblParametro
      WHERE     (iIdParametro = 61) -- AUTORIZA CONSOLIDACION CON ARCHIVOS FALTANTES (RECAUDACION)
      if @@ROWCOUNT=0
      begin 
        set @iCodError = -4;
        set @vcMsjError = 'No se encontro parametro de autorizacion manual en bdd (recaudacion)'; 
        return
      end   
                  
      -- Obtener cantidad de archivos validos enviados de recaudacion
      SELECT vcNombreArchivo
      FROM vwUltimoArchivoEnviadoValidado
      where nperiodo=@iPeriodo and tipoarchivo='AR'
      
      -- Validar cantidades de archivos de recaudacion
      select @iCant_archivos_recaudacion_enviados=@@ROWCOUNT
                      
            -- Validar cantidades de archivos de recaudacion
            --****************************************
      if @iCant_archivos_recaudacion_enviados<>@iCant_instituciones_participantes and @vcParam_autorizaConsolidacion<>'SI'
      begin       
        set @iCodError = -2;
        set @vcMsjError = 'No se han enviado todos los archivos de recaudacion';  
        return
      end
      
      -- Validar archivos de deuda validos dentro del sistema
      --*****************************************************
      if @iCant_archivos_recaudacion_enviados=0
      begin
        set @iCodError = -2;
        set @vcMsjError = 'No se ha enviado ningun archivo de recaudacion'; 
        return
      end
      
      -- Pasó todas las validaciones,  permitir consolidar.
      set @iCodError = 0;
      set @vcMsjError = 'Validacion exitosa,  se puede consolidar recaudacion';       
      return
    end
  else if @vcTipoCons ='CC' -- CONSOLIDACION DE COMPRA DE CARTERA
    begin
      -- Obtener lista de cajas participantes para el periodo y sus archivos de Afiliados y de deudas
      --*********************************************************************************************
      SELECT     @iCant_instituciones_participantes=COUNT(*) 
      FROM         tblInstitucion
      WHERE     (bParticipa = 1) AND (iIdEstado = 11);
      
      
       -- Obtener Existencia del parametro que permite consolidar sin todos los Archivos de afiliados y deudas      
      SELECT     @vcParam_autorizaConsolidacion =vcValor
      FROM         tblParametro
      WHERE     (iIdParametro = 81) -- AUTORIZA CONSOLIDACION CON ARCHIVOS FALTANTES (compra cartera)
      if @@ROWCOUNT=0
      begin 
        set @iCodError = -4;
        set @vcMsjError = 'No se encontro parametro de autorizacion manual en bdd (compra cartera)'; 
        return
      end   
      
      
      -- Obtener cantidad de archivos validos enviados de afiliados   
      --***********************************************************
      SELECT vcNombreArchivo
      FROM vwUltimoArchivoEnviadoValidado
      where nperiodo=@iPeriodo and tipoarchivo='AA'
                            
      select @iCant_archivos_afiliados_enviados=@@ROWCOUNT
                      
            -- Validar cantidades de archivos de afiliados
            --********************************************
      if @iCant_archivos_afiliados_enviados<>@iCant_instituciones_participantes and @vcParam_autorizaConsolidacion<>'SI'
      begin       
        set @iCodError = -1;
        set @vcMsjError = 'No se han enviado todos los archivos de afiliados';  
        return
      end
      -- Validar que no se hallan enviado archivos de afiliados
      --*******************************************************
      if @iCant_archivos_afiliados_enviados=0
      begin
        set @iCodError = -1;
        set @vcMsjError = 'No se ha enviado ningun archivo de afiliados'; 
        return
      end
      
      
      -- Obtener cantidad de archivos validos enviados de Compra Cartera
      SELECT vcNombreArchivo
      FROM vwUltimoArchivoEnviadoValidado
      where nperiodo=@iPeriodo and tipoarchivo='AD'
      -- Validar cantidades de archivos de deuda    
      select @iCant_archivos_deuda_enviados=@@ROWCOUNT
                      
            -- Validar cantidades de archivos de deuda
            --****************************************
      if @iCant_archivos_deuda_enviados<>@iCant_instituciones_participantes and @vcParam_autorizaConsolidacion<>'SI'
      begin       
        set @iCodError = -2;
        set @vcMsjError = 'No se han enviado todos los archivos de deuda';  
        return
      end
      
      -- Validar archivos de compra cartera validos dentro del sistema
      --*****************************************************
      if @iCant_archivos_deuda_enviados=0
      begin
        set @iCodError = -2;
        set @vcMsjError = 'No se ha enviado ningun archivo de deuda'; 
        return
      end
                
     -- Obtener cantidad de archivos validos enviados de deuda
      SELECT vcNombreArchivo
      FROM vwUltimoArchivoEnviadoValidado
      where nperiodo=@iPeriodo and tipoarchivo='CC'
      -- Validar cantidades de archivos de deuda    
      select @iCant_archivos_compra_cartera_enviados=@@ROWCOUNT
                      
            -- Validar cantidades de archivos de deuda
            --****************************************
      if @iCant_archivos_compra_cartera_enviados<>@iCant_instituciones_participantes and @vcParam_autorizaConsolidacion<>'SI'
      begin       
        set @iCodError = -2;
        set @vcMsjError = 'No se han enviado todos los archivos de compra cartera';  
        return
      end
      
      -- Validar archivos de deuda validos dentro del sistema
      --*****************************************************
      if @iCant_archivos_compra_cartera_enviados=0
      begin
        set @iCodError = -2;
        set @vcMsjError = 'No se ha enviado ningun archivo de compra cartera'; 
        return
      end
      
      -- Pasó todas las validaciones,  permitir consolidar.
      set @iCodError = 0;
      set @vcMsjError = 'Validacion exitosa, se puede consolidar compra cartera';       
      return
    end
  else
    begin
      set @iCodError = -5;
      set @vcMsjError = 'TIPO DE CONSOLIDACION INCORRECTA'; 
      return
    end   
  return  
  
END
GO

GO
--SqlScripter----[dbo].[spVerificaPeriodoCargaValidacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spVerificaPeriodoCargaValidacion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spVerificaPeriodoCargaValidacion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    ENV
-- Create date: 19-07-2013
-- Description: Verifica si el dia en curso corresponde a un dia en perioodo de carga y validacion de compra
-- 
-- =============================================
ALTER PROCEDURE [dbo].[spVerificaPeriodoCargaValidacion]
@vcTipo varchar(2),
  @iCodError int = 0 out,  
  @vcMsjError varchar(50) = 'OK' out
AS
BEGIN
Declare 

@iDiaIni int = 0,
@iDiaFin int = 0, 
@iDia  int = 0

BEGIN TRY

IF (@vcTipo ='AD')
	BEGIN
	set  @iDiaIni = (
		 SELECT vcValor 
		  FROM [dbo].[tblParametro]
		  where vcParametro = 'PERIODO_AFI_DEU_INI');
		  
		  set  @iDiaFin = (SELECT vcValor 
		  FROM [dbo].[tblParametro]
		  where vcParametro = 'PERIODO_AFI_DEU_FIN');
	END
ELSE
	BEGIN
		set  @iDiaIni = (
		 SELECT vcValor 
		  FROM [dbo].[tblParametro]
		  where vcParametro = 'PERIODO_CC_INI');
		  
		  set  @iDiaFin = (SELECT vcValor 
		  FROM [dbo].[tblParametro]
		  where vcParametro = 'PERIODO_CC_FIN');
	END

 
  set @iDia = DAY(GETDATE());
 


  IF (@iDiaIni <= @iDiaFin) 
  BEGIN
  IF (@iDiaIni <= @iDia) AND  (@iDia <= @iDiaFin)
    return 1
  ELSE
    return 0
  END

  IF ((@iDiaIni <= @iDia) OR (@iDia <= @iDiaFin))
    return 1
  ELSE   
	return 0
END TRY
BEGIN CATCH
    set @iCodError = -1;
    set @vcMsjError = 'No se pudo verificar periodo'; 
END CATCH

END
GO

GO
--SqlScripter----[dbo].[spVerificaPeriodoConsolidacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spVerificaPeriodoConsolidacion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spVerificaPeriodoConsolidacion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    ENV
-- Create date: 11-11-2013
-- Description: Veririfca si el día en curso corresponde hacer una consolidación de compra o propuesta
-- +tipoCons: corresponde al tipo de consolidación consultada: C: compra, P: propuesta , A: ambas.
--
-- Devuelve:
-- 0: no hay
-- 1: hay consolidación de compra
-- 2: hay consolidación de propuesta
-- 3: hay ambas consolidaciones 
-- -1: error
-- =============================================
ALTER PROCEDURE [dbo].[spVerificaPeriodoConsolidacion]
@tipoCons varchar(1) = '',	
	@CodError int = 0 out,	
	@MsjError varchar(50) = 'OK' out
AS
BEGIN
Declare 

@diaConsDeuda int = 0,
@diaConsRecauda int = 0, 
@diaConsCompra int = 0,
@diaConsPropuesta int = 0, 
@dia	int = 0,
@res int = 0

BEGIN TRY

set  @diaConsCompra = (
 SELECT vcValor 
  FROM [dbo].[tblParametro]
  where vcParametro = 'CONSOLIDACION_CART_VEND');
  
	set  @diaConsPropuesta = (SELECT vcValor 
  FROM [dbo].[tblParametro]
  where vcParametro = 'CONSOLIDACION_CART_PROP');

set  @diaConsDeuda = (
 SELECT vcValor 
  FROM [dbo].[tblParametro]
  where vcParametro = 'CONSOLIDACION_AFI_DEU');

set  @diaConsRecauda = (
 SELECT vcValor 
  FROM [dbo].[tblParametro]
  where vcParametro = 'CONSOLIDACION_REC');

  
   set @dia = DAY(GETDATE());
 

	IF ((@tipocons != 'C') AND (@tipocons != 'P') AND (@tipocons != 'A') AND (@tipocons != 'D') AND (@tipocons != 'R') AND (@tipocons != 'B'))
	BEGIN
		set @CodError = 0;
		set @MsjError = @tipocons;	
		return -1
    END


	IF ((@tipocons = 'C') OR (@tipocons != 'P') OR (@tipocons != 'B') )
	BEGIN
	
		IF ((@diaConsCompra = @dia) AND ((@tipocons = 'C') OR (@tipocons = 'B') ))
		BEGIN
			set @res =1
		END
		
		IF ((@diaConsPropuesta = @dia) AND ((@tipocons = 'P')OR (@tipocons = 'B') ))
		BEGIN
			set @res = @res  + 2
		END
	
	END
	
	IF ((@tipocons = 'D') OR (@tipocons != 'R') OR (@tipocons != 'A') )
	BEGIN
	
		IF ((@diaConsDeuda = @dia) AND ((@tipocons = 'D') OR (@tipocons = 'A') ))
		BEGIN
			set @res =1
		END
		
		IF ((@diaConsRecauda = @dia) AND ((@tipocons = 'R')OR (@tipocons = 'A') ))
		BEGIN
			set @res = @res  + 2
		END
	
	END
	
		set @CodError = @diaConsPropuesta;
		set @MsjError = @tipocons;	
	return @res
	
	
	
	
END TRY
BEGIN CATCH
		set @CodError = -1;
		set @MsjError = 'No se pudo verificar periodo';	

	
END CATCH

END
GO

GO
--SqlScripter----[dbo].[spVerificaPermisosPagina].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spVerificaPermisosPagina]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spVerificaPermisosPagina] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 27-06-13
-- Description: Verfica si el usuario tiene permisos para ver una pagina
-- =============================================
ALTER PROCEDURE [dbo].[spVerificaPermisosPagina]
@vcUrl varchar(max),
  @iRut integer,
  @iSalida int = 0 out,
  @vcMensaje varchar(100) = '' out,
  @iCont int = 0
AS
BEGIN
  
  
  SELECT  @iCont = count(tblPagina.vcUrl)
  FROM  tblPagina INNER JOIN
    tblRel_FuncPagina ON tblPagina.iIdPagina = tblRel_FuncPagina.iIdPagina INNER JOIN
    tblFuncionalidad ON tblRel_FuncPagina.iIdFuncionalidad = tblFuncionalidad.iIdFuncionalidad INNER JOIN
    tblRel_PerfilFunc ON tblFuncionalidad.iIdFuncionalidad = tblRel_PerfilFunc.iIdFuncionalidad INNER JOIN
    tblPerfil ON tblRel_PerfilFunc.iIdPerfil = tblPerfil.iIdPerfil INNER JOIN
    tblRel_UsuarioPerfil ON tblPerfil.iIdPerfil = tblRel_UsuarioPerfil.iIdPerfil INNER JOIN
    tblUsuario ON tblRel_UsuarioPerfil.iRut = tblUsuario.iRut
    where tblUsuario.iRut = @iRut
      and tblPagina.vcUrl = @vcUrl
      and tblFuncionalidad.iIdEstado = 1 --Funcionalidad Activa;
  if @iCont = 0
  begin
    set @iSalida = 0
    set @vcMensaje = 'El usuario no tiene permisos para visulizar esta pagina'
  end
  else
  begin
    set @iSalida = 1 
    set @vcMensaje = 'Acceso OK'
  end

END
GO

GO
--SqlScripter----[dbo].[spWS_ConsultaDeudaAfiliado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spWS_ConsultaDeudaAfiliado]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spWS_ConsultaDeudaAfiliado] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 04/10/2013
-- Description: Obtiene deudas de un afiliado
--	GRN         28-04-2014	   Se agrupa detalle de deudas para 
--                             que no muestre registros duplicados.
-- =============================================
ALTER PROCEDURE [dbo].[spWS_ConsultaDeudaAfiliado]
@vcIdAfiliado varchar(12), 
  @nInstitucionDestino numeric(4,0),
  @iCodError int out,
  @vcMsjError varchar(50) out
AS
DECLARE
  @nPeriodo as numeric (6,0),
  @iCorrelativo as int
BEGIN
  set @iCoderror=1
  set @vcMsjError='NO SE ENCONTRARON DATOS DE CONSOLIDACION PARA EL CRITERIO ESPECIFICADO' 

  --Se recupera el ultimo periodo consolidado
  select @nPeriodo=MAX(nperiodo) from tblRegistroConsolidacion 
	where vcTipoConsolidacion = 'CPC' and iIdEstado = 27
  
  --Se rescata la ultima consolidacion
  select @iCorrelativo=MAX(iCorrelativo) from tblConsolidacionCarteraCabecera where nPeriodo = @nPeriodo and nIdInstitucion = @nInstitucionDestino
  
  -- CONSULTA RESUMEN DEUDA DIRECTA
  select 
     COUNT(tblConsolidacionCarteraDetalle.nIdConsolidacionDetalle) as numCreditos,
     coalesce(SUM (tblConsolidacionCarteraDetalle.nMontoOferta),0) AS montoTotal
  from tblConsolidacionCarteraDetalle 
    inner join tblConsolidacionCarteraCabecera
	  on tblConsolidacionCarteraDetalle.nPeriodo = tblConsolidacionCarteraCabecera.nPeriodo
	  and tblConsolidacionCarteraDetalle.nIdCajaDestino = tblConsolidacionCarteraCabecera.nIdInstitucion
  where tblConsolidacionCarteraDetalle.vcIdentificadorDeudor = @vcIdAfiliado
  and tblConsolidacionCarteraDetalle.nIdCajaDestino = @nInstitucionDestino
  and tblConsolidacionCarteraCabecera.iCorrelativo = @iCorrelativo
  and tblConsolidacionCarteraDetalle.cSujetoDescuento = 'D' --DEUDORES
  and tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo
  if (@@ROWCOUNT > 0)
    begin
      select @iCoderror=0
      select @vcMsjError='0' 
    end 


  -- CONSULTA RESUMEN DEUDA INDIRECTA
  select 
     COUNT(tblConsolidacionCarteraDetalle.nIdConsolidacionDetalle) as numCreditos,
     coalesce(SUM (tblConsolidacionCarteraDetalle.nMontoOferta),0) AS montoTotal
  from tblConsolidacionCarteraDetalle 
    inner join tblConsolidacionCarteraCabecera
	  on tblConsolidacionCarteraDetalle.nPeriodo = tblConsolidacionCarteraCabecera.nPeriodo
	  and tblConsolidacionCarteraDetalle.nIdCajaDestino = tblConsolidacionCarteraCabecera.nIdInstitucion
  where tblConsolidacionCarteraDetalle.vcRutAval = @vcIdAfiliado
  and tblConsolidacionCarteraDetalle.nIdCajaDestino = @nInstitucionDestino
  and tblConsolidacionCarteraCabecera.iCorrelativo = @iCorrelativo
  and tblConsolidacionCarteraDetalle.cSujetoDescuento = 'A' --AVAL
  and tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo
    begin
      select @iCoderror=0
      select @vcMsjError='0' 
    end 

  -- CONSULTA DETALLE DEUDA DIRECTA
  select 
     tblConsolidacionCarteraDetalle.nIdCajaOrigen as nIdCajaOrigen,
     tblConsolidacionCarteraDetalle.vcNumPagare as vcNumPagare,
     tblConsolidacionCarteraDetalle.vcIdentificadorDeudor as vcIdentificadorDeudor,
	 tblConsolidacionCarteraDetalle.vcNombreDeudor as vcNombreDeudor,
	 tblConsolidacionCarteraDetalle.tIdTipoAfiliado as tIdTipoAfiliado,
	 tblConsolidacionCarteraDetalle.vcFechaImpago as vcFechaImpago,
	 tblConsolidacionCarteraDetalle.nMontoOferta as nMontoOferta
  from tblConsolidacionCarteraDetalle 
    inner join tblConsolidacionCarteraCabecera
	  on tblConsolidacionCarteraDetalle.nPeriodo = tblConsolidacionCarteraCabecera.nPeriodo
	  and tblConsolidacionCarteraDetalle.nIdCajaDestino = tblConsolidacionCarteraCabecera.nIdInstitucion
  where tblConsolidacionCarteraDetalle.vcIdentificadorDeudor = @vcIdAfiliado
  and tblConsolidacionCarteraDetalle.nIdCajaDestino = @nInstitucionDestino
  and tblConsolidacionCarteraCabecera.iCorrelativo = @iCorrelativo
  and tblConsolidacionCarteraDetalle.cSujetoDescuento = 'D' --DEUDORES
  and tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo
  Group by
	tblConsolidacionCarteraDetalle.nIdCajaOrigen,
     tblConsolidacionCarteraDetalle.vcNumPagare,
     tblConsolidacionCarteraDetalle.vcIdentificadorDeudor,
	 tblConsolidacionCarteraDetalle.vcNombreDeudor,
	 tblConsolidacionCarteraDetalle.tIdTipoAfiliado,
	 tblConsolidacionCarteraDetalle.vcFechaImpago,
	 tblConsolidacionCarteraDetalle.nMontoOferta
  if (@@ROWCOUNT > 0)
    begin
      select @iCoderror=0
      select @vcMsjError='0' 
    end 

  -- CONSULTA DETALLE DEUDA DIRECTA
  select 
     tblConsolidacionCarteraDetalle.nIdCajaOrigen as nIdCajaOrigen,
     tblConsolidacionCarteraDetalle.vcNumPagare as vcNumPagare,
     tblConsolidacionCarteraDetalle.vcIdentificadorDeudor as vcIdentificadorDeudor,
	 tblConsolidacionCarteraDetalle.vcNombreDeudor as vcNombreDeudor,
	 tblConsolidacionCarteraDetalle.tIdTipoAfiliado as tIdTipoAfiliado,
	 tblConsolidacionCarteraDetalle.vcFechaImpago as vcFechaImpago,
	 tblConsolidacionCarteraDetalle.nMontoOferta as nMontoOferta
  from tblConsolidacionCarteraDetalle 
    inner join tblConsolidacionCarteraCabecera
	  on tblConsolidacionCarteraDetalle.nPeriodo = tblConsolidacionCarteraCabecera.nPeriodo
	  and tblConsolidacionCarteraDetalle.nIdCajaDestino = tblConsolidacionCarteraCabecera.nIdInstitucion
  where tblConsolidacionCarteraDetalle.vcRutAval = @vcIdAfiliado
  and tblConsolidacionCarteraDetalle.nIdCajaDestino = @nInstitucionDestino
  and tblConsolidacionCarteraCabecera.iCorrelativo = @iCorrelativo
  and tblConsolidacionCarteraDetalle.cSujetoDescuento = 'A' --AVAL
  and tblConsolidacionCarteraDetalle.nPeriodo = @nPeriodo
  Group by
	tblConsolidacionCarteraDetalle.nIdCajaOrigen,
     tblConsolidacionCarteraDetalle.vcNumPagare,
     tblConsolidacionCarteraDetalle.vcIdentificadorDeudor,
	 tblConsolidacionCarteraDetalle.vcNombreDeudor,
	 tblConsolidacionCarteraDetalle.tIdTipoAfiliado,
	 tblConsolidacionCarteraDetalle.vcFechaImpago,
	 tblConsolidacionCarteraDetalle.nMontoOferta
  if (@@ROWCOUNT > 0)
    begin
      select @iCoderror=0
      select @vcMsjError='0' 
    end 

END
GO
