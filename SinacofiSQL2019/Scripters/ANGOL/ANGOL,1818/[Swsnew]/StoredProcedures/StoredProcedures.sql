
GO
--SqlScripter----[dbo].[MenuTree2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[MenuTree2]') IS NULL EXEC('CREATE PROCEDURE [dbo].[MenuTree2] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[MenuTree2]
@dueno int AS
SELECT MenuStruc.MenuCod AS S0Id , MenuStruc.MenuName AS S0Nm , MenuStruc.CodTran AS S0Tran
FROM MenuStruc
WHERE (MenuStruc.OwnerId=@dueno ) AND (MenuStruc.ParentId=0)
GO

GO
--SqlScripter----[dbo].[ProfMenu2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ProfMenu2]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ProfMenu2] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ProfMenu2]
@OwnId int,@ProfCod varchar(50), @inst char(4) AS
SELECT MenuStruc.MenuCod  AS S0Id, MenuStruc.MenuName   AS S0Nm, MenuStruc.CodTran    AS S0Tran
FROM MenuStruc, ProfileMenu
WHERE ProfileMenu.MenuCod = MenuStruc.MenuCod AND ((ProfileMenu.CodInst=@inst) AND
 (MenuStruc.OwnerId=@OwnId) AND 
 (ProfileMenu.EntId=1) AND 
(ProfileMenu.ProfileCod=@ProfCod))
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
--SqlScripter----[dbo].[spActProfileMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spActProfileMenu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spActProfileMenu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spActProfileMenu]
(@UserProfile VARCHAR(50), @Owner INT, @qs VARCHAR(255))
AS
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : dbo.spActProfileMenu
* Descripcion    : Actualiza Perfil de un usuario
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY

SET NOCOUNT ON
		
	DELETE FROM ProfileMenu
	WHERE	ProfileCod = @UserProfile
				AND EntId = @Owner


	INSERT INTO ProfileMenu (ProfileCod, EntId, MenuCod)
	SELECT	@UserProfile	,@Owner,MenuCod
	FROM	MenuStruc WITH(NoLock)
	WHERE 	MenuCod IN (@qs)
	
END TRY

BEGIN CATCH
SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
END CATCH
GO

GO
--SqlScripter----[dbo].[spActualizaMacroServicio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spActualizaMacroServicio]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spActualizaMacroServicio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spActualizaMacroServicio
* Descripcion    : Actualiza Macro Servicio
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
ALTER PROCEDURE [dbo].[spActualizaMacroServicio]
(@MacroServ VARCHAR(50), @Nombre VARCHAR(500), @AspTrans VARCHAR(500), @Imagen VARCHAR(255))
AS
BEGIN TRY

SET NOCOUNT ON
		
	UPDATE	MacroServicios 
	SET		Nombre = @Nombre, 
			AspTrans = @AspTrans,
			Imagen = @Imagen
	WHERE	MacroServ = @MacroServ
	
END TRY

BEGIN CATCH
SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
END CATCH
GO

GO
--SqlScripter----[dbo].[spActualizaTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spActualizaTransaccion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spActualizaTransaccion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spActualizaTransaccion
* Descripcion    : Actualiza Transaccion
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
ALTER PROCEDURE [dbo].[spActualizaTransaccion]
(@RegId INT, @CodTran VARCHAR(500), @NombreTrans VARCHAR(5000), @AspTrans VARCHAR(500), @MacroServ VARCHAR(50))
AS
BEGIN TRY

SET NOCOUNT ON
		
	UPDATE	TiposTransaccion 
	SET		CodTran = @CodTran, 
			NombreTrans = @NombreTrans,
			AspTrans = @AspTrans,
			MacroServ = @MacroServ
	WHERE	RegId = @RegId
	
END TRY

BEGIN CATCH
SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
END CATCH
GO

GO
--SqlScripter----[dbo].[spConsultaInstitucion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaInstitucion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaInstitucion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spConsultaInstitucion
* Descripcion    : Consulta institucion
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spConsultaInstitucion]
(@InstitucionId int)
AS
BEGIN
	
	SELECT	CodInst, DesInst
	FROM	Institucion
	WHERE	CodInst = @InstitucionId

END
GO

GO
--SqlScripter----[dbo].[spConsultaInstituciones].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaInstituciones]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaInstituciones] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spConsultaInstituciones 
* Descripcion    : Consulta instituciones
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spConsultaInstituciones]
AS
BEGIN

	SELECT	CodInst, DesInst
	FROM	Institucion
	ORDER	BY	CodInst asc

END
GO

GO
--SqlScripter----[dbo].[spConsultaMacroServicio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaMacroServicio]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaMacroServicio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spConsultaMacroServicio
* Descripcion    : Consulta macro servicio
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spConsultaMacroServicio]
(@MacroServicioId varchar(150))
AS
BEGIN
	
	SELECT	MacroServ, Nombre, AspTrans, Imagen
	FROM	MacroServicios
	WHERE	MacroServ = @MacroServicioId

END
GO

GO
--SqlScripter----[dbo].[spConsultaMacroServicios].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaMacroServicios]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaMacroServicios] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spConsultaMacroServicios 
* Descripcion    : Consulta macro servicios
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spConsultaMacroServicios]
AS
BEGIN
	
	SELECT	MacroServ, Nombre, AspTrans, Imagen
	FROM	MacroServicios
	ORDER	BY MacroServ asc

END
GO

GO
--SqlScripter----[dbo].[spConsultaPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaPerfil]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaPerfil] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spConsultaPerfil 
* Descripcion    : Consulta perfil
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spConsultaPerfil]
(@ProfileCod varchar(50))
AS
BEGIN
	
	SELECT	ProfileId, ProfileName, ProfileCod, ProfileInst
	FROM	Profiles
	WHERE	ProfileCod = @ProfileCod

END
GO

GO
--SqlScripter----[dbo].[spConsultaPerfiles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaPerfiles]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaPerfiles] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spConsultaPerfiles 
* Descripcion    : Consulta Perfiles
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spConsultaPerfiles]
AS
BEGIN
	
	SELECT	ProfileId, ProfileName, ProfileCod, ProfileInst
	FROM	Profiles

END
GO

GO
--SqlScripter----[dbo].[spConsultaPerfilesPorInstitucion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaPerfilesPorInstitucion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaPerfilesPorInstitucion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spConsultaPerfilesPorInstitucion 
* Descripcion    : Consulta perfiles por institucion
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spConsultaPerfilesPorInstitucion]
(@CodInst varchar(50))
AS
BEGIN
	
	SELECT	ProfileMenu.ProfMenuId,
			ProfileMenu.ProfileCod,
			ProfileMenu.ProfileName,
			ProfileInst = ProfileMenu.CodInst,
			Transacciones = (
				SELECT	Count(*)
				FROM	MenuStruc MenuStruc2
						inner join ProfileMenu ProfileMenu2 on ProfileMenu2.MenuCod = MenuStruc2.MenuCod
						inner join TiposTransaccion TiposTransaccion2 on TiposTransaccion2.CodTran = MenuStruc2.CodTran
				WHERE	((ProfileMenu2.CodInst = @CodInst) AND
						 (MenuStruc2.OwnerId = 1) AND 
						 (ProfileMenu2.EntId = 1) AND 
						 (ProfileMenu2.ProfileCod = ProfileMenu.ProfileCod)
						)
			)
	From	ProfileMenu
	Where	ProfileMenu.MenuCod = 0 
	AND		ProfileMenu.CodInst = @CodInst 

END
GO

GO
--SqlScripter----[dbo].[spConsultaTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaTransaccion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaTransaccion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spConsultaTransaccion 
* Descripcion    : Consulta transaccion
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spConsultaTransaccion]
(@TransaccionId int)
AS
BEGIN
	
	SELECT	RegId, CodTran, NombreTrans, AspTrans, MacroServ
	FROM	TiposTransaccion
	WHERE	RegId = @TransaccionId

END
GO

GO
--SqlScripter----[dbo].[spConsultaTransacciones].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaTransacciones]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaTransacciones] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spConsultaTransacciones
* Descripcion    : Consulta transacciones
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spConsultaTransacciones]
AS
BEGIN
			
	SELECT	RegId, CodTran, NombreTrans, AspTrans, MacroServ
	FROM	TiposTransaccion

END
GO

GO
--SqlScripter----[dbo].[spConsultaTransaccionesPorInstitucion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaTransaccionesPorInstitucion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaTransaccionesPorInstitucion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spConsultaTransaccionesPorInstitucion 
* Descripcion    : Consulta transacciones por institucion
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spConsultaTransaccionesPorInstitucion]
(@CodInst VARCHAR(50), @ProfileCod VARCHAR(50))
AS
BEGIN
	
	SELECT	TiposTransaccion.RegId,
			TiposTransaccion.CodTran, 
			NombreTrans, 
			AspTrans, 
			MacroServ,
			MenuStruc.MenuCod
	FROM	MenuStruc 
			inner join ProfileMenu on ProfileMenu.MenuCod = MenuStruc.MenuCod
			inner join TiposTransaccion on TiposTransaccion.CodTran = MenuStruc.CodTran
	WHERE	((ProfileMenu.CodInst = @CodInst) AND
			 (MenuStruc.OwnerId = 1) AND 
			 (ProfileMenu.EntId=1) AND 
			 (ProfileMenu.ProfileCod = @ProfileCod)
			)

END
GO

GO
--SqlScripter----[dbo].[spConsultaTransaccionesPorMacroPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaTransaccionesPorMacroPerfil]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaTransaccionesPorMacroPerfil] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spConsultaTransaccionesPorMacroPerfil 
* Descripcion    : Consulta transacciones por macro perfil
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spConsultaTransaccionesPorMacroPerfil]
(@MacroPerfilId VARCHAR(50))
AS
BEGIN
	
	SELECT	TiposTransaccion.RegId,
			TiposTransaccion.CodTran, 
			NombreTrans, 
			AspTrans, 
			MacroServ
	FROM	TiposTransaccion
			INNER JOIN ProfileTipoTransaccion on TiposTransaccion.CodTran = ProfileTipoTransaccion.CodTran 
	WHERE	ProfileTipoTransaccion.ProfileCod = @MacroPerfilId

END
GO

GO
--SqlScripter----[dbo].[spConsultaTransaccionesPorMacroServicio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaTransaccionesPorMacroServicio]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaTransaccionesPorMacroServicio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spConsultaTransaccionesPorMacroServicio
* Descripcion    : Consulta transacciones por macro servicio
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spConsultaTransaccionesPorMacroServicio]
(@MacroServicioId VARCHAR(50))
AS
BEGIN
	
	SELECT	RegId, CodTran, NombreTrans, AspTrans, MacroServ
	FROM	TiposTransaccion
	WHERE	MacroServ = @MacroServicioId

END
GO

GO
--SqlScripter----[dbo].[spCsuAdminLog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCsuAdminLog]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCsuAdminLog] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spCsuAdminLog]
(@UserName varchar(150),@Periodo varchar(4) )
As
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spCsuAdminLog
* Descripcion    : Consulta los datos de tabla AdminLogs
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
**************************************************************************************/
Begin

SET NOCOUNT ON

SELECT LogTime
	   ,IdSesion
	   ,UserName
	   ,CodTran
	   ,SearchData
	   ,LookDetails
	   ,TimeResponse 
FROM 
		dbo.AdminLogs
WHERE 
		1 = 1 
		AND UserName = @UserName  
		AND SUBSTRING(LogTime, 1, 6) = @Periodo
ORDER BY LogTime Desc 

END
GO

GO
--SqlScripter----[dbo].[spCsuAdminLogResumen].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCsuAdminLogResumen]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCsuAdminLogResumen] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spCsuAdminLogResumen]
AS
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spCsuAdminLogResumen
* Descripcion    : Consulta los datos de tabla AdminLogs
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY

SET NOCOUNT ON

SELECT 
        SUBSTRING(AdmLog.LogTime, 1, 6) as period
        ,Count(AdmLog.LogTime) AS Clogs
FROM 
        dbo.AdminLogs AS AdmLog
GROUP BY 
        SUBSTRING(AdmLog.LogTime, 1, 6)
ORDER BY 
        SUBSTRING(AdmLog.LogTime, 1, 6) Desc
END TRY

BEGIN CATCH
SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
END CATCH
GO

GO
--SqlScripter----[dbo].[spCsuAdminLogs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCsuAdminLogs]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCsuAdminLogs] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spCsuAdminLogs]
(@susr as VARCHAR (150),@sper VARCHAR(6))
As
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spCsuAdminLogs
* Descripcion    : Consulta los datos de tabla AdminLogs
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY

SET NOCOUNT ON

IF @susr = '' 
BEGIN

SELECT LogTime
       ,IdSesion
       ,UserName
       ,CodTran
       ,SearchData
       ,LookDetails
       ,TimeResponse 
FROM 
       dbo.AdminLogs
ORDER BY LogTime Desc

END 

IF @sper = ''
BEGIN

SELECT LogTime
       ,IdSesion
       ,UserName
       ,CodTran
       ,SearchData
       ,LookDetails
       ,TimeResponse 
FROM 
        dbo.AdminLogs
ORDER BY 
        LogTime Desc
END 

END TRY

BEGIN CATCH
SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
END CATCH
GO

GO
--SqlScripter----[dbo].[spCsuEntidadesPorOwner].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCsuEntidadesPorOwner]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCsuEntidadesPorOwner] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spCsuEntidadesPorOwner]
(@Owner int)
AS
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : dbo.spCsuEntidadesPorOwner
* Descripcion    : Consulta los datos de tabla Entidades
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY	
	
SET NOCOUNT ON

SELECT  
	EntId
	,NombreEntidad
	,WebDirectory
	,WebHomePage
	,UseProfiles
	,ImgDir
	,ClrBackMenu
	,ClrBackTrans
	,ClrForeTrans
	,GrafMenuHome
	,GrafGoFav
	,GrafGoUp
	,GrafGoPers
	,GrafEditPers
	,GrafAddFavs
	,GrafVolver
	,CodEntidad
	,GrafFondoTrans
	,GrafFondoMenu
FROM
    dbo.Entidades WITH(NoLock)
WHERE
    EntId = @Owner

END TRY

BEGIN CATCH

	SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
	

END CATCH
GO

GO
--SqlScripter----[dbo].[spCsuOpcionesMenuPorPerfilOwner].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCsuOpcionesMenuPorPerfilOwner]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCsuOpcionesMenuPorPerfilOwner] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spCsuOpcionesMenuPorPerfilOwner]
(@UserProfile VARCHAR(50), @Owner INT)
AS
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : dbo.spCsuOpcionesMenuPorPerfilOwner
* Descripcion    : Consulta Opciones de Menu por Perfil y Owner
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY	
	SET NOCOUNT ON
	
SELECT
    MenuCod
FROM
    ProfileMenu WITH(NoLock)
WHERE
    ProfileCod = @UserProfile
AND EntId = @Owner


END TRY
BEGIN CATCH

	SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
	

END CATCH
GO

GO
--SqlScripter----[dbo].[spCsuPrefiles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCsuPrefiles]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCsuPrefiles] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spCsuPrefiles 
* Descripcion    : Consulta perfiles
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spCsuPrefiles]
(@MenuCod int, @EntId int, @CodInst varchar(50))
AS
BEGIN
	
	SELECT	ProfMenuId, MenuCod, EntId, ProfileCod, CodInst, ProfileName
	FROM	ProfileMenu
	WHERE	MenuCod = @MenuCod AND EntId = @EntId AND CodInst = @CodInst

END
GO

GO
--SqlScripter----[dbo].[spCsuRangoRut].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCsuRangoRut]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCsuRangoRut] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spCsuRangoRut]
AS
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spCsuRangoRut
* Descripcion    : Consulta los datos de tabla tblRangoRut
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY

SET NOCOUNT ON

SELECT  rtrim(cTipoRut) as cTipoRut
        ,iRangoDesde
        ,iRangoHasta
FROM 
        dbo.tblRangoRut
END TRY

BEGIN CATCH
SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
END CATCH
GO

GO
--SqlScripter----[dbo].[spCsuTiposTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCsuTiposTransaccion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCsuTiposTransaccion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spCsuTiposTransaccion]
(@CodTran varchar(10))
As
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spCsuTiposTransaccion
* Descripcion    : Consulta los tipos de transacción 
*
* Responsable    : Sermaluc
* Fecha Creacion : 23/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY

SET NOCOUNT ON

SELECT RegId
			,CodTran
			,NombreTrans
			,AspTrans
			,MacroServ 
FROM TiposTransaccion WHERE CodTran=@CodTran

END TRY

BEGIN CATCH
SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
END CATCH
GO

GO
--SqlScripter----[dbo].[spCsuUserLogTipTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCsuUserLogTipTransaccion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCsuUserLogTipTransaccion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spCsuUserLogTipTransaccion]
(@LogId int)
As
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spCsuUserLogTipTransaccion
* Descripcion    : Consulta los datos de tabla UserLogs
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY

SET NOCOUNT ON

SELECT  usrlg.ULogId
        ,usrlg.LogTime
        ,ttran.NombreTrans
        ,usrlg.CodTran
        ,usrlg.ResultPage
        ,usrlg.QryStr
FROM 
        dbo.UserLogs AS usrlg 
INNER JOIN 
        dbo.TiposTransaccion AS ttran 
ON 
        usrlg.CodTran = ttran.CodTran
WHERE   
        usrlg.ULogId= @LogId
END TRY

BEGIN CATCH
SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
END CATCH
GO

GO
--SqlScripter----[dbo].[spCsuUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCsuUsuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCsuUsuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spCsuUsuario]
(@UserName varchar(150) )
As
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spCsuUsuario
* Descripcion    : Consulta los datos de tabla Usuarios
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY	
	SET NOCOUNT ON

    SELECT UserId,UserName,UserCod
    from Usuarios WHERE UserName = @UserName

END TRY	
BEGIN CATCH

	SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'

END CATCH
GO

GO
--SqlScripter----[dbo].[spCsuUsuarioCod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCsuUsuarioCod]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCsuUsuarioCod] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spCsuUsuarioCod]
(@UserCod varchar(150) )
As
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spCsuUsuarioCod
* Descripcion    : Consulta los datos de tabla Usuarios
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY

SET NOCOUNT ON
    SELECT UserId,UserName,UserCod
    from Usuarios WHERE UserCod = @UserCod
END TRY

BEGIN CATCH
SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
END CATCH
GO

GO
--SqlScripter----[dbo].[spCsuUsuarioPorOrden].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCsuUsuarioPorOrden]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCsuUsuarioPorOrden] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spCsuUsuarioPorOrden]
AS
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spCsuUsuarioPorOrden
* Descripcion    : Consulta los datos de tabla Usuarios
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY

SET NOCOUNT ON

SELECT 
        UserName
FROM 
        dbo.Usuarios 
Order By 
        UserName
END TRY

BEGIN CATCH
SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
END CATCH
GO

GO
--SqlScripter----[dbo].[spEliminaCurrentUser].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spEliminaCurrentUser]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spEliminaCurrentUser] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spEliminaCurrentUser]
(@UserName varchar(150))
As
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spEliminaCurrentUser
* Descripcion    : Elimina los datos de tabla CurrentUsers
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY	

SET NOCOUNT ON
	
DELETE FROM CurrentUsers 
WHERE UserName = @UserName

END TRY

BEGIN CATCH

	SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
END CATCH
GO

GO
--SqlScripter----[dbo].[spEliminaInstitucionTipoTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spEliminaInstitucionTipoTransaccion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spEliminaInstitucionTipoTransaccion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spEliminaInstitucionTipoTransaccion 
* Descripcion    : Elimina relacion entre institucion y tipo transaccion
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spEliminaInstitucionTipoTransaccion]
(@MenuCod VARCHAR(50))
AS
BEGIN
	
	DELETE	MenuStruc
	WHERE	MenuCod = @MenuCod 

	DELETE	ProfileMenu
	WHERE	MenuCod = @MenuCod 

END
GO

GO
--SqlScripter----[dbo].[spEliminaMacroServicio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spEliminaMacroServicio]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spEliminaMacroServicio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spEliminaMacroServicio 
* Descripcion    : Elimina macro servicio 
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spEliminaMacroServicio]
(@MacroServicioId varchar(2))
AS
BEGIN 

	DECLARE @TRANSACCIONES INT = (SELECT COUNT(*) FROM TiposTransaccion WHERE MacroServ = @MacroServicioId)

	IF @TRANSACCIONES > 0 
		SELECT 2
	ELSE
		DELETE FROM MacroServicios 
		WHERE  MacroServ = @MacroServicioId
		SELECT 1

END
GO

GO
--SqlScripter----[dbo].[spEliminaProfileMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spEliminaProfileMenu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spEliminaProfileMenu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spEliminaProfileMenu 
* Descripcion    : Elimina relacion profile y menu
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spEliminaProfileMenu]
(
	@CodInst VARCHAR(150), 
	@ProfileCod VARCHAR(50)
)
AS
BEGIN

	DELETE	MenuStruc
	FROM	ProfileMenu 
	WHERE	MenuStruc.MenuCod = ProfileMenu.MenuCod
	AND		ProfileCod = @ProfileCod
	AND		CodInst = @CodInst

	DELETE	ProfileMenu
	WHERE	MenuCod = 0 
	AND		ProfileCod = @ProfileCod
	AND		CodInst = @CodInst

END
GO

GO
--SqlScripter----[dbo].[spEliminaProfileTipoTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spEliminaProfileTipoTransaccion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spEliminaProfileTipoTransaccion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spEliminaProfileTipoTransaccion 
* Descripcion    : Elimina relacion profile y tipo transaccion 
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spEliminaProfileTipoTransaccion]
(
	@ProfileCod varchar(50), 
	@CodTran VARCHAR(10)
)
AS
BEGIN

	DELETE	ProfileTipoTransaccion
	WHERE	ProfileCod = @ProfileCod
	AND		CodTran = @CodTran

END
GO

GO
--SqlScripter----[dbo].[spEliminaTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spEliminaTransaccion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spEliminaTransaccion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spEliminaTransaccion 
* Descripcion    : Elimina transaccion 
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spEliminaTransaccion]
(@TransaccionId int)
AS
BEGIN 

	DELETE FROM TiposTransaccion 
	WHERE  RegId = @TransaccionId

	SELECT 1


END
GO

GO
--SqlScripter----[dbo].[spElmAdminLog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spElmAdminLog]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spElmAdminLog] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spElmAdminLog]
(@Periodo varchar(6))
As
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spElmAdminLog
* Descripcion    : Elimina los datos de tabla AdminLogs
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY	
	SET NOCOUNT ON

DELETE FROM 
			dbo.AdminLogs 
WHERE 
			SUBSTRING(LogTime, 1,6) = @Periodo

END TRY
BEGIN CATCH

	SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
	

END CATCH
GO

GO
--SqlScripter----[dbo].[spInsCurrentUser].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spInsCurrentUser]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spInsCurrentUser] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spInsCurrentUser]
(@UserName varchar(150),@Id_cliente varchar(40),@Id_sesion varchar(60),@IP_addres varchar(16))
As
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spInsCurrentUser
* Descripcion    : Inserta los datos a tabla CurrentUsers
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY

SET NOCOUNT ON

INSERT INTO 
			dbo.CurrentUsers 
			( 
			  UserName
			  ,UserCod
			  ,IdSesion
			  ,IPaddress
			  ,TimeLogin 
			)
VALUES     ( 
	          @UserName
			  ,@id_cliente
			  ,@Id_sesion
			  ,@IP_addres
			  , GetDate()
			)
END TRY

BEGIN CATCH

	SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
END CATCH
GO

GO
--SqlScripter----[dbo].[spInsertaInstitucionTipoTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spInsertaInstitucionTipoTransaccion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spInsertaInstitucionTipoTransaccion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spInsertaInstitucionTipoTransaccion 
* Descripcion    : Crea relacion entre institucion y transaccion
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
-- exec spInsertaInstitucionTipoTransaccion '0008', 'TEMP', 'atac_99021'
ALTER PROCEDURE [dbo].[spInsertaInstitucionTipoTransaccion]
(@CodInst VARCHAR(50), @ProfileCod VARCHAR(50), @CodTran VARCHAR(50))
AS
BEGIN

	IF NOT EXISTS (
		SELECT	1 
		FROM	ProfileMenu 
				INNER JOIN MenuStruc on MenuStruc.MenuCod = ProfileMenu.MenuCod
		WHERE	ProfileCod = @ProfileCod
		AND		CodInst = @CodInst
		AND		CodTran = @CodTran)
	BEGIN

		INSERT	MenuStruc (OwnerId, ParentId, CodTran, MenuName)
		SELECT  1, 0, @CodTran, NombreTrans
		FROM	TiposTransaccion
		WHERE	CodTran = @CodTran 

		DECLARE @MenuId INT = @@IDENTITY

		UPDATE	MenuStruc
		SET		MenuCod = MenuId
		WHERE	MenuId = @MenuId

		INSERT	ProfileMenu (MenuCod, EntId, ProfileCod, CodInst, ProfileName)
		SELECT  @MenuId, 1, ProfileCod, @CodInst, ProfileName
		FROM	Profiles
		WHERE	ProfileCod = @ProfileCod 

	END

	IF NOT EXISTS (
		SELECT	1 
		FROM	ProfileMenu 
		WHERE	MenuCod = 0
		AND		ProfileCod = @ProfileCod
		AND		CodInst = @CodInst)
	BEGIN

		INSERT	ProfileMenu (MenuCod, EntId, ProfileCod, CodInst, ProfileName)
		SELECT  0, 1, ProfileCod, @CodInst, ProfileName
		FROM	Profiles
		WHERE	ProfileCod = @ProfileCod 

	END

END
GO

GO
--SqlScripter----[dbo].[spInsertaMacroServicio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spInsertaMacroServicio]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spInsertaMacroServicio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spInsertaMacroServicio 
* Descripcion    : Crea un macro servicio
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spInsertaMacroServicio]
(@MacroServ VARCHAR(50), @Nombre VARCHAR(500), @AspTrans VARCHAR(500), @Imagen VARCHAR(255))
AS
BEGIN TRY

SET NOCOUNT ON
		
	IF EXISTS (SELECT * FROM MacroServicios WHERE MacroServ = @MacroServ)
	BEGIN
		SELECT	2
	END
	ELSE
	BEGIN
		INSERT	INTO MacroServicios 
		VALUES	(@MacroServ, @Nombre, @AspTrans, @Imagen)
		SELECT	1
	END
	
END TRY

BEGIN CATCH
SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
END CATCH
GO

GO
--SqlScripter----[dbo].[spInsertaProfileTipoTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spInsertaProfileTipoTransaccion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spInsertaProfileTipoTransaccion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spInsertaProfileTipoTransaccion 
* Descripcion    : Crea relacion entre perfil y transaccion
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spInsertaProfileTipoTransaccion]
(
	@ProfileCod varchar(50), 
	@CodTran VARCHAR(10)
)
AS
BEGIN

	IF NOT EXISTS (SELECT 1 from ProfileTipoTransaccion WHERE CodTran = @CodTran AND ProfileCod = @ProfileCod)
	BEGIN
		INSERT	INTO ProfileTipoTransaccion (CodTran, ProfileCod) 
		VALUES	(@CodTran, @ProfileCod)
	END

END
GO

GO
--SqlScripter----[dbo].[spInsertaTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spInsertaTransaccion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spInsertaTransaccion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spInsertaTransaccion 
* Descripcion    : Crea una transaccion
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spInsertaTransaccion]
(@CodTran VARCHAR(10), @NombreTrans VARCHAR(150), 
										   @AspTrans VARCHAR(50), @MacroServ varchar(2))
AS
BEGIN

	INSERT	INTO TiposTransaccion
	VALUES	(@CodTran, @NombreTrans, @AspTrans, @MacroServ)

END
GO

GO
--SqlScripter----[dbo].[spInsProfileMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spInsProfileMenu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spInsProfileMenu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*********************************************************************************** 
* Sistema        : Perfilador TWA 
* Procedimiento  : spInsProfileMenu 
* Descripcion    : Crea relacion entre perfil y menu
* 
* Responsable    : Claudio Blanco G. 
* Fecha Creacion : 03-03-2022 
* Observaciones  : 
* 
* 
* Control de Cambios 
* Fecha       Responsable      Observaciones 
* -----       --------------   --------------------------------------------------------- 
* 
* 
***********************************************************************************/ 
ALTER PROCEDURE [dbo].[spInsProfileMenu]
(
	@MenuCod INT,
	@EntId INT,
	@ProfileCod VARCHAR(50), 
	@CodInst VARCHAR(4), 
	@ProfileName VARCHAR(150))
AS
BEGIN

	INSERT	INTO ProfileMenu
	VALUES	(@MenuCod, @EntId, @ProfileCod, @CodInst, @ProfileName)

END
GO

GO
--SqlScripter----[dbo].[spInsUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spInsUsuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spInsUsuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spInsUsuario]
(@UserName varchar(150),@Id_cliente varchar(50))
As
/*************************************************************************************
* Sistema        : SINACOFI
* Procedimiento  : spInsUsuario
* Descripcion    : Inserta los datos a tabla Usuarios
*
* Responsable    : Sermaluc
* Fecha Creacion : 16/01/2020
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
*
*
**************************************************************************************/
BEGIN TRY	
	SET NOCOUNT ON


	
	INSERT INTO Usuarios ( UserName , UserCod  )
	Values (@UserName , @Id_cliente )
	

		Select UserID
			  ,UserName
			  ,UserCod 
		from Usuarios 
		WHERE UserCod  = @UserName
	

END TRY	
BEGIN CATCH

	SELECT 
        ERROR_NUMBER() AS 'CodError',
        ERROR_MESSAGE() AS 'MsgError'
	

END CATCH
GO
