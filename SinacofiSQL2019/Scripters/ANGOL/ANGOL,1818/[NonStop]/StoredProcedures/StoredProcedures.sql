
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
--SqlScripter----[dbo].[uspDuplicadorActualizarJob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspDuplicadorActualizarJob]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspDuplicadorActualizarJob] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspDuplicadorActualizarJob]
    Purpose     :   Update a record in [dbo].[DuplicadorJob]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/21
    Parameter   :   @Id,@Estado shoult not be nulls or empties
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspDuplicadorActualizarJob]
@Id varchar(37),
    @Estado nvarchar(10)
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION       
        --Check if Job exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[DuplicadorJob] WHERE [Id]=@Id)
            raiserror('The value for @Id is not found', 15, 1)
        -- check if@Estado is empty
        IF  @Estado ='' 
            raiserror('The parameters @Estado should not be nulls or empties', 15, 1)
        --Update
        UPDATE [dbo].[DuplicadorJob]
           SET [Estado] =  @Estado           
         WHERE [Id]=@Id
     COMMIT
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspDuplicadorConsultarMensajeDuplicador].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspDuplicadorConsultarMensajeDuplicador]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspDuplicadorConsultarMensajeDuplicador] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspDuplicadorConsultarMensajeDuplicador]
    Purpose     :   Query all records from [DuplicadorMensaje]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/20
    Parameter   :   No parameters
    Parameter   :   
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspDuplicadorConsultarMensajeDuplicador]
AS
SET NOCOUNT ON
BEGIN TRY

    SELECT [Id]
          ,[TidOrigen]
          ,[TidDestino]
          ,[NomTidDestino]
          ,[NumCtsn]
          ,[AreaActual]
          ,[AreaOrigen]
          ,[NomUsen]
          ,[NomUspr]
          ,[FechaPrep]
          ,[HoraPrep]
          ,[Nse]
          ,[NseFecha]
          ,[NseHora]
          ,[Texto]
          ,[LargoTexto]
          ,[CodMensaje]
          ,[CodPrioridad]
          ,[IndAute]
          ,[ResAute]
          ,[CodBroadcast]
          ,[Estado]
          ,[FechaCreacion]
      FROM [dbo].[DuplicadorMensaje]

END TRY
BEGIN CATCH
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspDuplicadorConsultarNoProcesadoNoComparado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspDuplicadorConsultarNoProcesadoNoComparado]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspDuplicadorConsultarNoProcesadoNoComparado] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspDuplicadorConsultarNoProcesadoNoComparado]
    Purpose     :   Query records FROM DuplicadorMensaje LEFT JOIN DuplicadorJobDetalle
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/20
    Parameter   :   No parameters
    Parameter   :   
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspDuplicadorConsultarNoProcesadoNoComparado]
AS
SET NOCOUNT ON
BEGIN TRY
	SELECT  DM.Id
            ,DM.TidOrigen
            ,DM.NumCtsn
            ,DM.AreaActual
            ,DM.FechaPrep
            ,DM.HoraPrep
            ,DM.Texto
            ,DM.LargoTexto
	FROM DuplicadorMensaje DM
	    LEFT JOIN DuplicadorJobDetalle DJ ON DJ.MensajeId = DM.Id
	WHERE DJ.JobId IS NULL

END TRY
BEGIN CATCH
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspDuplicadorCrearJob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspDuplicadorCrearJob]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspDuplicadorCrearJob] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspDuplicadorCrearJob]
    Purpose     :   Insert a new record in [dbo].[DuplicadorJob]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/21
    Parameter   :   @Estado is optionals
    Parameter   :   @FechaCreacion must be not null or empty and a valid date
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspDuplicadorCrearJob]
@Estado nvarchar(10)=Null,
    @FechaCreacion datetime

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        DECLARE @Id uniqueidentifier =NEWID()
        --Set defaul value for @Estado
        IF @Estado IS NULL
            SET @Estado='running'
        -- Insert
        INSERT INTO [dbo].[DuplicadorJob]
                   ([Id]
                   ,[Estado]
                   ,[FechaCreacion])
             VALUES
                   (@Id
                   ,@Estado
                   ,@FechaCreacion)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspDuplicadorCrearJobDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspDuplicadorCrearJobDetalle]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspDuplicadorCrearJobDetalle] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspDuplicadorCrearJobDetalle]
    Purpose     :   Insert a new record in [dbo].[DuplicadorJobDetalle] if parameter @Detalles NOT EXISTS otherwise update record
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/21
    Parameter   :  @Error,@Detalles are optionals
    Parameter   :   @JobId,@MensajeId must be not null or empty
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspDuplicadorCrearJobDetalle]
@JobId varchar(37),
    @MensajeId varchar(37),
    @Error bit=Null,
    @Detalles text=Null

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if @Detalles exist
        
    IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[DuplicadorJobDetalle] WHERE SUBSTRING([Detalles],1,8000)=SUBSTRING(@Detalles,1,8000))
            BEGIN -- Insert
               DECLARE @JobId_New uniqueidentifier =NEWID()
                INSERT INTO [dbo].[DuplicadorJobDetalle]
                           ([JobId]
                           ,[MensajeId]
                           ,[Error]
                           ,[Detalles])
                     VALUES
                           (@JobId_New 
                           ,CONVERT(UNIQUEIDENTIFIER,@MensajeId)
                           ,@Error
                           ,@Detalles)
            END
        ELSE -- if JobDetalle exist
            BEGIN --Update
                   UPDATE [dbo].[DuplicadorJobDetalle]
                   SET [MensajeId] =CONVERT(UNIQUEIDENTIFIER,@MensajeId)
                      ,[Error]=ISNULL(@Error,[Error])
                      ,[Detalles] = ISNULL(@Detalles,[Detalles])
                 WHERE [JobId]=CONVERT(UNIQUEIDENTIFIER,@JobId) AND [MensajeId]=CONVERT(UNIQUEIDENTIFIER,@MensajeId)
            END
     COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspDuplicadorCrearMensaje].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspDuplicadorCrearMensaje]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspDuplicadorCrearMensaje] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspDuplicadorCrearMensaje]
    Purpose     :   Insert a new record in [dbo].[DuplicadorMensaje]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/20
    Parameter   :   All parameters are optionals
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspDuplicadorCrearMensaje]
@TidOrigen nvarchar(4)=NULL,
    @TidDestino nvarchar(4)= NULL,
    @NomTidDestino nvarchar(10)= NULL,
    @NumCtsn nvarchar(5)= NULL,
    @AreaActual nvarchar(2)= NULL,
    @AreaOrigen nvarchar(2)= NULL,
    @NomUsen nvarchar(12)= NULL,
    @NomUspr nvarchar(12)= NULL,
    @FechaPrep nvarchar(8)= NULL,
    @HoraPrep nvarchar(6)= NULL,
    @Nse nvarchar(5)= NULL,
    @NseFecha nvarchar(8)= NULL,
    @NseHora nvarchar(6)= NULL,
    @Texto varbinary(max)= NULL,
    @LargoTexto nvarchar(4)= NULL,
    @CodMensaje nvarchar(3)= NULL,
    @CodPrioridad nvarchar(2)= NULL,
    @IndAute nvarchar(1)= NULL,
    @ResAute nvarchar(4)= NULL,
    @CodBroadcast nvarchar(2)= NULL,
    @Estado nvarchar(2)= NULL,
    @FechaCreacion datetime= NULL

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        DECLARE @Id uniqueidentifier =NEWID()
        -- Insert
        INSERT INTO [dbo].[DuplicadorMensaje]
                   ([Id]
                   ,[TidOrigen]
                   ,[TidDestino]
                   ,[NomTidDestino]
                   ,[NumCtsn]
                   ,[AreaActual]
                   ,[AreaOrigen]
                   ,[NomUsen]
                   ,[NomUspr]
                   ,[FechaPrep]
                   ,[HoraPrep]
                   ,[Nse]
                   ,[NseFecha]
                   ,[NseHora]
                   ,[Texto]
                   ,[LargoTexto]
                   ,[CodMensaje]
                   ,[CodPrioridad]
                   ,[IndAute]
                   ,[ResAute]
                   ,[CodBroadcast]
                   ,[Estado]
                   ,[FechaCreacion])
             VALUES
                   (@Id
                   ,@TidOrigen
                   ,@TidDestino
                   ,@NomTidDestino
                   ,@NumCtsn
                   ,@AreaActual
                   ,@AreaOrigen
                   ,@NomUsen
                   ,@NomUspr
                   ,@FechaPrep
                   ,@HoraPrep
                   ,@Nse
                   ,@NseFecha
                   ,@NseHora
                   ,@Texto
                   ,@LargoTexto
                   ,@CodMensaje
                   ,@CodPrioridad
                   ,@IndAute
                   ,@ResAute
                   ,@CodBroadcast
                   ,@Estado
                   ,@FechaCreacion)

    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarBroadcast].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarBroadcast]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarBroadcast] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarBroadcast]
    Purpose     :   Update a record in [dbo].[tblBroadcast]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/13
    Parameter   :   @cIDBroadcast shoult be not null or empty
    Parameter   :   @uUsuarioModifica,@dFechaModificacion shoult not be nulls or empties
    Parameter   :   @cBroadcast,@vcNombre,@vcDescripcion,@cEstado are optionals
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarBroadcast]
@cIDBroadcast char(3),
    @cBroadcast char(3)=Null, 
	@vcNombre varchar(30)=Null,
	@vcDescripcion varchar(200)= NULL,
	@cEstado char(16)=Null,
	@uUsuarioModifica varchar(37),
    @dFechaModificacion datetime

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION       
        --Check if Broadcast exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblBroadcast] WHERE [cIDBroadcast]=@cIDBroadcast)
            raiserror('The value for @cIDBroadcast is not found', 15, 1)
        -- check if @vcNombre is empty
        IF  @vcNombre ='' 
            raiserror('The parameters @vcNombre should not be nulls or empties', 15, 1)
        -- check if @cBroadcast is empty
        IF  @cBroadcast ='' 
            raiserror('The parameters @cBroadcast should not be nulls or empties', 15, 1)
        --Update
        UPDATE [dbo].[tblBroadcast]
           SET [cIDBroadcast] = ISNULL(@cBroadcast,[cIDBroadcast] )
              ,[vcNombre] = ISNULL(@vcNombre,[vcNombre] )
              ,[vcDescripcion] = ISNULL(@vcDescripcion,[vcDescripcion]  )
              ,[cEstado] = ISNULL(@cEstado,[cEstado] )
              ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
              ,[dFechaModificacion] = @dFechaModificacion
         WHERE [cIDBroadcast]=@cIDBroadcast
        
     COMMIT
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarCalendario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarCalendario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarCalendario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarCalendario]
    Purpose     :   Update a record in tblCalendario
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/28
    Parameter   :   @vcIDCalendario shoult be not null or empty,is used as search parameter
    Parameter   :   @vcIDCalendario_New is optional and used to update [vcIDCalendario]  
    Parameter   :   @cTipo,@sdFecha is optional    
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarCalendario]
@vcIDCalendario varchar(20),
    @vcIDCalendario_New varchar(20)=Null,
    @cTipo varchar(37)=Null,
    @sdFecha smalldatetime=Null,
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Update
        UPDATE [dbo].[tblCalendario]
           SET [vcIDCalendario] = ISNULL(@vcIDCalendario_New,[vcIDCalendario])
              ,[cTipo]  = ISNULL(@cTipo,[cTipo])
              ,[sdFecha]  = ISNULL(@sdFecha,[sdFecha])
              ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
              ,[dFechaModificacion] = @dFechaModificacion
         WHERE [vcIDCalendario]=@vcIDCalendario

    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarCliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarCliente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarCliente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarCliente]
    Purpose     :   Update a record in tblClienteConmutador
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/28
    Parameter   :   @cClienteConmutadorCodigo shoult be not null or empty
    Parameter   :   @cClienteConmutadorCodigo is used as search parameter
    Parameter   :   @cClienteConmutadorCodigo_New is optional, used to update [cClienteConmutadorCodigo]    
    Parameter   :   Changes in @cCodigoInstitucion might not be allowed or generate cascade (Referential Integrity)
    Parameter   :   @cRUT,@vcNombre,@siControlIntentos,@cPuerto;@cEstado,@bVigente are optionals
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarCliente]
@cClienteConmutadorCodigo char(12) ,
    @cClienteConmutadorCodigo_New char(12)=Null,
    @cCodigoInstitucion char(4)=Null,
    @cRUT char(12)=Null,
    @vcNombre varchar(30)=Null,
    @siControlIntentos smallint=Null,
    @cPuerto char(4)=Null ,
    @cEstado char(16) = null,
    @bVigente bit=Null,
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if Cliente exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblClienteConmutador] WHERE [cClienteConmutadorCodigo]=@cClienteConmutadorCodigo)
            raiserror('The value for @cClienteConmutadorCodigo is not found', 15, 1)           
        -- check if parameters are nulls or empties
        IF  @cClienteConmutadorCodigo_New ='' OR
            @cCodigoInstitucion ='' OR
            @cRUT ='' OR
            @vcNombre ='' OR
            @siControlIntentos ='' OR
            @cPuerto =''
            raiserror('The parameters should not be nulls or empties', 15, 1)    
        --Update
        UPDATE [dbo].[tblClienteConmutador]
        SET [cClienteConmutadorCodigo] = ISNULL(@cClienteConmutadorCodigo_New,[cClienteConmutadorCodigo])
              ,[cCodigoInstitucion] = ISNULL(@cCodigoInstitucion,[cCodigoInstitucion])
              ,[cRUT] = ISNULL(@cRUT,[cRUT])
              ,[vcNombre] = ISNULL(@vcNombre,[vcNombre])
              ,[siControlIntentos] =ISNULL(@siControlIntentos,[siControlIntentos])
              ,[cPuerto] = ISNULL(@cPuerto,[cPuerto])
              ,[cEstado] = ISNULL(@cEstado,[cEstado])
              ,[bVigente]= ISNULL(@bVigente,[bVigente])
              ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
              ,[dFechaModificacion] = @dFechaModificacion
        WHERE [cClienteConmutadorCodigo]=@cClienteConmutadorCodigo
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarEstadoCliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarEstadoCliente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarEstadoCliente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarEstadoCliente]
    Purpose     :   Update Cliente status in tblClienteConmutador
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/09/29
    Parameter   :   @cIDClienteConmutadorCodigo shoult be not null or empty
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :   If @status=null and the current status of Cliente = "Suspendido" will change to "Desconectado" other wise raise a error
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarEstadoCliente]
@ClienteConmutadorCodigo char(12) ,
    @status CHAR(16)=null,
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION       
        DECLARE @CurrentStatus CHAR(16)
        SELECT @CurrentStatus = [cEstado]
        FROM [dbo].[tblClienteConmutador] 
        WHERE [cClienteConmutadorCodigo]=@ClienteConmutadorCodigo
        --Check if exist ClienteConmutador
        IF @CurrentStatus IS NULL
            raiserror('The value for @cClienteConmutadorCodigo is not found', 15, 1) 
        -- check status
        IF  @CurrentStatus = 'Suspendido' and @status is null 
             --Update by default
             UPDATE [dbo].[tblClienteConmutador]
             SET [cEstado] = 'Desconectado'
                   ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
                   ,[dFechaModificacion] = @dFechaModificacion
             WHERE [cClienteConmutadorCodigo]=@ClienteConmutadorCodigo
        IF  @CurrentStatus <> 'Suspendido' and @status is null
            RAISERROR ('Only can change from Suspendido to Desconectado', 15, 1) 
        IF @status is not null
             --Update by parameter
             UPDATE [dbo].[tblClienteConmutador]
             SET [cEstado] = @status
                   ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
                   ,[dFechaModificacion] = @dFechaModificacion
             WHERE [cClienteConmutadorCodigo]=@ClienteConmutadorCodigo
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarFormulario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarFormulario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarFormulario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarFormulario]
    Purpose     :   Update a record in [dbo].[tblFormulario]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/14
    Parameter   :   @cCodigoFormulario shoult be not null or empty
    Parameter   :   @uUsuarioModifica,@dFechaModificacion shoult not be nulls or empties
    Parameter   :   @cNCodigoFormulario,@vcNombre,@vcDescripcion,@cEstado,@hJerarquia,@vcRuta are optionals
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarFormulario]
@cCodigoFormulario char(10),
    @cNCodigoFormulario char(10)=Null,
    @vcNombre varchar(30)=Null,
    @vcDescripcion varchar(200)=Null,
    @hJerarquia HIERARCHYID=Null,
    @vcRuta varchar(255)=Null,
    @cEstado char(16)=Null,
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime  

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION       
        --Check if @cCodigoFormulario exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblFormulario] WHERE [cCodigoFormulario]=@cCodigoFormulario)
            raiserror('The value for @cCodigoFormulario is not found', 15, 1)
        -- check if @vcNombre is empty
        IF  @vcNombre ='' 
            raiserror('The parameters @vcNombre should not be null or empty', 15, 1)
        -- check if @vcRuta is empty
        IF  @vcRuta ='' 
            raiserror('The parameters @vcRuta should not be null or empty', 15, 1)
        -- check if @cNCodigoFormulario is empty
        IF  @cNCodigoFormulario ='' 
            raiserror('The parameters @cNCodigoFormulario should not be null or empty', 15, 1)
        -- check Duplicate HIERARCHYID
        IF EXISTS (SELECT [hJerarquia] FROM [dbo].[tblFormulario] WHERE [hJerarquia]=@hJerarquia)
            raiserror('The @hJerarquia value already exists', 15, 1)
        --Update

        UPDATE [dbo].[tblFormulario]
           SET [cCodigoFormulario] = ISNULL(@cNCodigoFormulario,[cCodigoFormulario])
              ,[vcNombre] = ISNULL(@vcNombre,[vcNombre])
              ,[vcDescripcion] = ISNULL(@vcDescripcion,[vcDescripcion])
              ,[hJerarquia] = ISNULL(@hJerarquia,[hJerarquia])
              ,[vcRuta] = ISNULL(@vcRuta,[vcRuta]) 
              ,[cEstado] = ISNULL(@cEstado,[cEstado]) 
              ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
              ,[dFechaModificacion] = @dFechaModificacion
         WHERE [cCodigoFormulario]=@cCodigoFormulario

        
     COMMIT
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarMensajeAutorizado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarMensajeAutorizado]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarMensajeAutorizado] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarMensajeAutorizado]
    Purpose     :   Update a record in tblClienteMensajeAutorizad
    Purpose     :   Only update the filds [bEnviar],[bRecibir]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/09/30
    Parameter   :   @cClienteConmutadorCodigo,@cIDTipoMensaje shoult be not null or empty
    Procedure   :   If @bEnviar and @bRecibir are diferent of (False, False) Update Record
    Procedure   :   If @bEnviar and @bRecibir are (False,False) Delete Record
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarMensajeAutorizado]
@cIDTipoMensaje char(5) ,
    @cClienteConmutadorCodigo char(12),
    @bEnviar bit,
    @bRecibir bit
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION       
        DECLARE @found  CHAR(12)
        SELECT TOP 1 @found = [cClienteConmutadorCodigo]
        FROM [dbo].[tblClienteMensajeAutorizad] 
        WHERE [cClienteConmutadorCodigo]=@cClienteConmutadorCodigo AND [cIDTipoMensaje] = @cIDTipoMensaje
        -- check if parameters are nulls or empties
        IF  @cClienteConmutadorCodigo is null OR @cClienteConmutadorCodigo ='' OR
            @cIDTipoMensaje is null OR @cIDTipoMensaje ='' OR
            @bEnviar is null OR 
            @bRecibir is null 
            raiserror('The parameters should not be nulls or empties', 15, 1)
        --Check if exist ClienteConmutador
        IF @found IS NULL
            raiserror('The value for @cClienteConmutadorCodigo AND @cIDTipoMensaje are not found', 15, 1)
        --Check update or delete option
        IF (@bEnviar = 0) AND (@bRecibir = 0)
        BEGIN --Delete    
            DELETE FROM [dbo].[tblClienteMensajeAutorizad] WHERE [cClienteConmutadorCodigo]=@cClienteConmutadorCodigo AND [cIDTipoMensaje] = @cIDTipoMensaje
        END
        ELSE
        BEGIN--Update
            UPDATE [dbo].[tblClienteMensajeAutorizad]
            SET [bEnviar] = @bEnviar
                ,[bRecibir] = @bRecibir
            WHERE [cClienteConmutadorCodigo]=@cClienteConmutadorCodigo AND [cIDTipoMensaje] = @cIDTipoMensaje
        END
        COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarMenu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarMenu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarMenu]
    Purpose     :   Update a record in [dbo].[tblMenu]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/14
    Parameter   :   @cCodigo shoult be not null or empty
    Parameter   :   @uUsuarioModifica,@dFechaModificacion shoult not be nulls or empties
    Parameter   :   @cNCodigo,@vcMenuNombre,@vcDescripcion,@cEstado,@hJerarquia,@vcRuta,@cCodigoFormulario are optionals
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarMenu]
@cCodigo char(18),
    @cNCodigo char(18)=Null,
	@vcMenuNombre varchar(30)=Null,
	@hJerarquia hierarchyid=Null,
	@vcDescripcion varchar(200)=Null,
	@cCodigoFormulario char(10)=Null,
	@cEstado char(16)=Null,
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime  
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION       
        --Check if @cCodigo exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblMenu] WHERE [cCodigo]=@cCodigo)
            raiserror('The value for @cCodigo is not found', 15, 1)
        -- check if @vcNombre is empty
        IF  @vcMenuNombre ='' 
            raiserror('The parameters @vcMenuNombre should not be null or empty', 15, 1)
        -- check if @cCodigoFormulario is empty
        IF  @cCodigoFormulario ='' 
            raiserror('The parameters @cCodigoFormulario should not be null or empty', 15, 1)
        -- check if @cNCodigo is empty
        IF  @cNCodigo='' 
            raiserror('The parameters @cNCodigo should not be null or empty', 15, 1)
        -- check Duplicate HIERARCHYID
        IF EXISTS (SELECT [hJerarquia] FROM [dbo].[tblFormulario] WHERE [hJerarquia]=@hJerarquia)
            raiserror('The @hJerarquia value already exists', 15, 1)
        --Update
        UPDATE [dbo].[tblMenu]
           SET [cCodigo] = ISNULL(@cNCodigo,[cCodigo] )
              ,[vcMenuNombre] = ISNULL(@vcMenuNombre,[vcMenuNombre])
              ,[hJerarquia] = ISNULL(@hJerarquia,[hJerarquia])
              ,[vcDescripcion] = ISNULL(@vcDescripcion,[vcDescripcion])
              ,[cCodigoFormulario] = ISNULL(@cCodigoFormulario,[cCodigoFormulario])
              ,[cEstado] = ISNULL(@cEstado,[cEstado]) 
              ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
              ,[dFechaModificacion] = @dFechaModificacion
         WHERE [cCodigo]=@cCodigo
     COMMIT
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarNSEMensajeSistema].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarNSEMensajeSistema]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarNSEMensajeSistema] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarNSEMensajeSistema]
    Purpose     :   Update a record in [dbo].[tblNSEMensajeSistema]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/11/03
    Parameter   :   @dFechaUltimaConexion,@cNSE must not be nulls or empties
    Parameter   : 
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarNSEMensajeSistema]
@cIDMensaje char(5),
    @cNSE int
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if NSEMensajeSistema exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblNSEMensajeSistema] WHERE [cIDMensaje] = @cIDMensaje)
            raiserror('The value for @cIDMensaje is not found', 15, 1)
        --Update
        UPDATE [dbo].[tblNSEMensajeSistema]
           SET 
              [cNSE] = @cNSE
         WHERE [cIDMensaje] = @cIDMensaje
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarParametro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarParametro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarParametro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarParametro]
    Purpose     :   Update a record in [dbo].[tblParametro]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/15
    Parameter   :   @uIDParametro shoult be not null or empty
    Parameter   :   @uUsuarioModifica,@dFechaModificacion shoult not be nulls or empties
    Parameter   :   @vcNombre,@cClase,@cSubClase,@cDivision,@hJerarquia,@vcValor,@vcDescripcion,@bReservado are optionals
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarParametro]
@uIDParametro varchar(37),
    @vcNombre varchar(50)= NULL,
    @cClase char(20)= NULL,
    @cSubClase char(20)= NULL,
    @cDivision varchar(50)= NULL,
    @hJerarquia hierarchyid=Null,
    @vcValor varchar(3000)= NULL,
    @vcDescripcion varchar(200)= NULL,
    @bReservado bit= NULL,
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION       
        --Check if parametro exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblParametro] WHERE [uIDParametro]=CONVERT(UNIQUEIDENTIFIER,@uIDParametro))
            raiserror('The value for @uIDParametro is not found', 15, 1)
        --Check if not changes are made or uptdate generate duplicate
        IF EXISTS (SELECT TOP 1 1 FROM [dbo].[tblParametro] WHERE [cClase]=@cClase AND [cSubClase]=@cSubClase AND [cDivision]=@cDivision AND [vcValor]=@vcValor)
            raiserror('No changes were made or changes generate duplicates', 15, 1)
        -- check if @vcValor is empty
        IF  @vcValor ='' 
            raiserror('The parameters @vcValor should not be nulls or empties', 15, 1)
        -- check Duplicate HIERARCHYID
        IF EXISTS (SELECT [hJerarquia] FROM [dbo].[tblParametro] WHERE [hJerarquia]=@hJerarquia)
            raiserror('The @hJerarquia value already exists', 15, 1)
        --Update
        UPDATE [dbo].[tblParametro]
           SET 
               [cClase] = ISNULL(@cClase,[cClase] )
              ,[cSubClase] = ISNULL(@cSubClase,[cSubClase])
              ,[vcValor] = ISNULL(@vcValor,[vcValor])
              ,[vcNombre] = ISNULL(@vcNombre,[vcNombre] )
              ,[vcDescripcion] = ISNULL(@vcDescripcion,[vcDescripcion])
              ,[bReservado] = ISNULL(@bReservado,[bReservado])
              ,[cDivision] = ISNULL(@cDivision,[cDivision])
              ,[hJerarquia]=ISNULL(@hJerarquia,[hJerarquia])
              ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
              ,[dFechaModificacion] = @dFechaModificacion
         WHERE [uIDParametro]=CONVERT(UNIQUEIDENTIFIER,@uIDParametro)
        COMMIT
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarPerfil]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarPerfil] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarPerfil]
    Purpose     :    Update a record in [dbo].[tblPerfil]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/26
    Parameter   :   @uIDRol,@cCodigo must not be nulls or empties
    Parameter   :   @bCrear,@bActualizar,@bConsultar,@bEliminar are optionals
    Procedure   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarPerfil]
@uIDRol varchar(37),
    @cCodigo char(18),
    @bCrear bit=Null,
    @bActualizar bit=Null,
    @bConsultar bit=Null,
    @bEliminar bit=Null

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if perfil exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].tblPerfil WHERE [uIDRol]=@uIDRol AND [cCodigo]=@cCodigo)
            raiserror('perfil is not found', 15, 1)
        UPDATE [dbo].[tblPerfil]
           SET 
              [bCrear] = ISNULL(@bCrear,[bCrear])
              ,[bActualizar] = ISNULL(@bActualizar,[bActualizar])
              ,[bConsultar] = ISNULL(@bConsultar,[bConsultar])
              ,[bEliminar] = ISNULL(@bEliminar,[bEliminar])
         WHERE [uIDRol]=@uIDRol AND [cCodigo]=@cCodigo
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarRegistroDiarioSecuencia].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarRegistroDiarioSecuencia]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarRegistroDiarioSecuencia] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarRegistroDiarioSecuencia]
    Purpose     :   Update a record in [dbo].[tblRegistroDiarioSecuencia]]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/11/02
    Parameter   :   @uIDRegistroDiario must not be null
    Parameter   :   @dFechaUltimaConexion,@cNSEFinal,@cNSRFinal,@cNSCFinal are optional
    Parameter   : 
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarRegistroDiarioSecuencia]
@uIDRegistroDiario varchar(37),
    @dFechaUltimaConexion datetime= NULL,
    @cNSEFinal int= NULL,
    @cNSRFinal int= NULL,
    @cNSCFinal char(5)= NULL

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if RegistroDiarioSecuencia exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblRegistroDiarioSecuencia] WHERE [uIDRegistroDiario]=@uIDRegistroDiario)
            raiserror('The value for @uIDRegistroDiario is not found', 15, 1)
        --Update
        UPDATE [dbo].[tblRegistroDiarioSecuencia]
           SET 
              [dFechaUltimaConexion] = ISNULL(@dFechaUltimaConexion,[dFechaUltimaConexion])
              ,[cNSEFinal] = ISNULL(@cNSEFinal,[cNSEFinal])
              ,[cNSRFinal] = ISNULL(@cNSRFinal,[cNSRFinal])
              ,[cNSCFinal] = ISNULL(@cNSCFinal,[cNSCFinal])
         WHERE [uIDRegistroDiario]=@uIDRegistroDiario
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarRegistroSesionCliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarRegistroSesionCliente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarRegistroSesionCliente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarRegistroSesionCliente]
    Purpose     :   Update a record in [dbo].[tblRegistroSesionCliente]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/11/03
    Parameter   :   @uIDRegistroSesion,@dFechaDesconexion must not be nullS or empties
    Parameter   : 
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarRegistroSesionCliente]
@uIDRegistroSesion varchar(37),
    @dFechaDesconexion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Update
        UPDATE [dbo].[tblRegistroSesionCliente]
           SET 
              [dFechaDesconexion] = @dFechaDesconexion
         WHERE [uIDRegistroSesion]=@uIDRegistroSesion
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarRol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarRol]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarRol] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarRol]
    Purpose     :   Update a record in [dbo].[tblRol]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/26
    Parameter   :   @uIDRol shoult be not null or empty
    Parameter   :   @uUsuarioModifica,@dFechaModificacion shoult not be nulls or empties
    Parameter   :   @vcNombre,@vcDescripcion,@cEstado are optionals
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarRol]
@uIDRol varchar(37),
    @vcNombre varchar(30)=Null,
	@vcDescripcion varchar(200)= NULL,
	@cEstado char(16)= NULL,
	@uUsuarioModifica varchar(37),
    @dFechaModificacion datetime

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION       
        --Check if Rol exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblRol] WHERE [uIDRol]=@uIDRol)
            raiserror('The value for @uIDRol is not found', 15, 1)
        -- check if @vcNombre is empty
        IF  @vcNombre ='' 
            raiserror('The parameters @vcNombre should not be nulls or empties', 15, 1)
        -- check if @vcDescripcion is empty
        IF  @vcDescripcion='' 
            raiserror('The parameters @vcDescripcion should not be nulls or empties', 15, 1)
        --Update
        UPDATE [dbo].[tblRol]
           SET 
              [vcNombre] = ISNULL(@vcNombre,[vcNombre] )
              ,[vcDescripcion] = ISNULL(@vcDescripcion,[vcDescripcion]  )
              ,[cEstado] = ISNULL(@cEstado,[cEstado] )
              ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
              ,[dFechaModificacion] = @dFechaModificacion
         WHERE [uIDRol]=@uIDRol
      
     COMMIT
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarTextoSistema].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarTextoSistema]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarTextoSistema] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarTextoSistema]
    Purpose     :   Update a record in [dbo].[tblTextoSistema]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/12
    Parameter   :   @cGrupo,@cCodigo shoult be not nulls or empties
    Parameter   :   @uUsuarioModifica,@dFechaModificacion shoult not be nulls or empties
    Parameter   :   @cGrupo_New,@cCodigo_New,@vcDescripcion,@bReservado are optionals
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarTextoSistema]
@cGrupo char(3),
    @cCodigo char(3),
    @cGrupo_New char(3),
    @cCodigo_New char(3),
	@vcDescripcion varchar(200)= NULL,
	@bReservado [bit],
	@uUsuarioModifica varchar(37),
    @dFechaModificacion datetime

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION       
        --Check if TextoSistema exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblTextoSistema] WHERE [cGrupo]=@cGrupo AND [cCodigo]= @cCodigo)
            raiserror('The TextoSistema is not found', 15, 1)

        --Update
 
    UPDATE [dbo].[tblTextoSistema]
       SET 
          [cGrupo] = ISNULL(CONVERT(UNIQUEIDENTIFIER,@cGrupo_New),[cGrupo] )
          ,[cCodigo] = ISNULL(CONVERT(UNIQUEIDENTIFIER,@cCodigo_New) ,[cCodigo] )
          ,[vcDescripcion] = ISNULL(@vcDescripcion,[vcDescripcion] )
          ,[bReservado] = ISNULL(@bReservado,[bReservado] )
          ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
          ,[dFechaModificacion] = @dFechaModificacion
     WHERE [cGrupo]=@cGrupo AND [cCodigo]= @cCodigo
     COMMIT
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarUsuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarUsuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarUsuario]
    Purpose     :   Update a record in tblUsuario
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/18
    Parameter   :   @uIDUsuario shoult be not null or empty
    Parameter   :   @uIDUsuario is used as search parameter
    Parameter   :   @uUsuario is used as [uIDUsuario] new value
    Parameter   :   @uUsuarioModifica,@dFechaModificacion shoult not be nulls or empties
    Parameter   :   @uUsuario,@cRUT,@vcNombre,@vcApellido,@cEstado are optionals
    Parameter   :   @cEstado only accept <'ACTIVO', 'INACTIVO','SUSPENDIDO'> 
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarUsuario]
@uIDUsuario varchar(37),
    @uUsuario varchar(37)=Null,
    @cRUT char(12)=Null,
    @vcNombre varchar(30)=Null,
    @vcApellido varchar(30)=Null,
    @cEstado char(16)=Null,
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if @uIDUsuario exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblUsuario] WHERE [uIDUsuario]=@uIDUsuario)
            raiserror('The value for @uIDUsuario is not found', 15, 1)
        -- check if @vcNombre is empty
        IF  @vcNombre ='' 
            raiserror('The parameters @vcNombre should not be null or empty', 15, 1)
        -- check if @@vcApellido is empty
        IF  @vcApellido ='' 
            raiserror('The parameters @vcApellido should not be null or empty', 15, 1)
        --Update
        UPDATE [dbo].[tblUsuario]
           SET [uIDUsuario] = ISNULL(@uUsuario,[uIDUsuario])
              ,[cRUT] = ISNULL(@cRUT,[cRUT])
              ,[vcNombre] = ISNULL(@vcNombre,[vcNombre])
              ,[vcApellido] = ISNULL(@vcApellido,[vcApellido])
              ,[cEstado] = ISNULL(@cEstado,[cEstado])
              ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
              ,[dFechaModificacion] = @dFechaModificacion
         WHERE [uIDUsuario]=@uIDUsuario
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTactualizarUsuarioRol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTactualizarUsuarioRol]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTactualizarUsuarioRol] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTactualizarUsuarioRol]
    Purpose     :   Update a record in [dbo].[tblUsuarioRol]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/26
    Parameter   :   @uIDUsuario,@uIDRol must not be nulls or empties
    Parameter   :   @dFechaActivacion,@dFechaExpiracion,@cEstado are optionals
    Procedure   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTactualizarUsuarioRol]
@uIDUsuario varchar(37),
    @uIDRol varchar(37),
    @dFechaActivacion datetime=Null,
    @dFechaExpiracion datetime=Null,
    @cEstado char(16)=Null
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if UsuarioRol exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblUsuarioRol] WHERE [uIDUsuario]=@uIDUsuario AND [uIDRol]=@uIDRol)
            raiserror('UsuarioRol is not found', 15, 1) 
        --Update       
        UPDATE [dbo].[tblUsuarioRol]
           SET 
               [dFechaActivacion] = ISNULL(@dFechaActivacion,[dFechaActivacion])
              ,[dFechaExpiracion] = ISNULL(@dFechaExpiracion,[dFechaExpiracion])
              ,[cEstado] =  ISNULL(@cEstado,[cEstado])
         WHERE 
                [uIDUsuario]=@uIDUsuario AND
                    [uIDRol]=@uIDRol
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTautorizarMensaje].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTautorizarMensaje]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTautorizarMensaje] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTautorizarMensaje]
    Purpose     :   Insert a new record in tblClienteMensajeAutorizad
    Purpose     :   authorize messages to clients
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/09/30
    Parameter   :   All parameters are not null
    Procedure   :   If @bEnviar and @bRecibir are False or 0 Raise an error
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTautorizarMensaje]
@cIDTipoMensaje char(5) ,
    @cClienteConmutadorCodigo char(12),
    @bEnviar bit,
    @bRecibir bit
  
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        
        -- check if parameters are nulls or empties
        IF  @cIDTipoMensaje is null OR @cIDTipoMensaje ='' OR
            @cClienteConmutadorCodigo is null OR @cClienteConmutadorCodigo ='' OR
            @bEnviar is null OR
            @bRecibir is null 
            raiserror('The parameters should not be nulls or empties', 15, 1)
        -- Check if @bEnviar and @bRecibir are False
        IF (@bEnviar = 0) AND (@bRecibir = 0)
            raiserror('@bEnviar or @bRecibir one of the two must be true', 15, 1)
        -- Insert
        INSERT INTO [dbo].[tblClienteMensajeAutorizad]
                   ([cIDTipoMensaje]
                   ,[bEnviar]
                   ,[bRecibir]
                   ,[cClienteConmutadorCodigo])
        VALUES
                   (@cIDTipoMensaje
                   ,@bEnviar
                   ,@bRecibir
                   ,@cClienteConmutadorCodigo)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcompararClienteDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcompararClienteDetalle]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcompararClienteDetalle] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcompararClienteDetalle]
    Purpose     :   Compare if there are changes in a ClienteConmutadorDetalle record.
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/09/29
    Parameter   :   @cClienteConmutadorCodigo,@Tipo,@cValoR must not be null
    Parameter   :   @cClienteConmutadorCodigo must exist in [dbo].[tblClienteConmutador]
    Parameter   :   @bComparar is OUTPUT parameter
    Procedure   :   Return @bComparar = true if comparation is equal, false otherwise
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcompararClienteDetalle]
@cClienteConmutadorCodigo char(12) ,
    @Tipo char(36),
    @cValor char(255),
    @bComparar bit OUTPUT
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if exist ClienteConmutador
        DECLARE @foundClienteConmutadorCodigo  CHAR(12)
        SELECT  @foundClienteConmutadorCodigo = [cClienteConmutadorCodigo]
        FROM  [dbo].[tblClienteConmutador]
        WHERE [cClienteConmutadorCodigo]=@cClienteConmutadorCodigo
        IF @foundClienteConmutadorCodigo IS NULL
            raiserror('The value for @cClienteConmutadorCodigo is not found', 15, 1)

        -- Compare
        DECLARE @cFindMatch char(12)
        SELECT top 1 @cFindMatch=[cClienteConmutadorCodigo]
        FROM [dbo].[tblClienteConmutadorDetalle]
        WHERE
           [cClienteConmutadorCodigo]=@cClienteConmutadorCodigo AND
           [Tipo]= CONVERT(UNIQUEIDENTIFIER,@Tipo) AND
           [cValor] = @cValor
        IF  @cFindMatch is null
            SET @bComparar= 0
        ELSE
            SET @bComparar= 1

    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarAviso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarAviso]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarAviso] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarAviso]
    Purpose     :   Query all records [tblAviso]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/19
    Parameter   :   @uIDUsuario, @cClienteConmutadorCodigo are optional
    Parameter   :   @uIDUsuario must exist in [dbo].[tblUsuario]
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarAviso]
@uIDUsuario varchar(37)=Null,
    @cClienteConmutadorCodigo char(12)=Null
    
AS
SET NOCOUNT ON
BEGIN TRY
        SELECT [uIDAviso]
              ,[uIDUsuario]
              ,[cClienteConmutadorCodigo]
              ,[dFechaCreacion]
              ,[vcAviso]
          FROM [dbo].[tblAviso]
            WHERE   [uIDUsuario]=ISNULL(@uIDUsuario,[uIDUsuario]) AND
                    [cClienteConmutadorCodigo]= ISNULL(@cClienteConmutadorCodigo,[cClienteConmutadorCodigo])
        ORDER BY [dFechaCreacion] DESC 
END TRY
BEGIN CATCH
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarBitacoraDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarBitacoraDetalle]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarBitacoraDetalle] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarBitacoraDetalle]
    Purpose     :   Query all records for [dbo].[tblBitacoraDetalle]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/15
    Parameter   :   @uIDBitacora must not be null or empty
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarBitacoraDetalle]
@uIDBitacora varchar(37)
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        -- check if uIDBitacora is empty
        IF  @uIDBitacora  ='' 
            raiserror('The parameters uIDBitacora  should not be null or empty', 15, 1)
        SELECT [uIDBitacora]
              ,[vcOperacion]
              ,[vcTabla]
              ,[xCamposAfectados]
              ,[dFechaModificacion]
          FROM [dbo].[tblBitacoraDetalle]
            WHERE  [uIDBitacora]=CONVERT(uniqueidentifier,@uIDBitacora)
          ORDER BY [dFechaModificacion] DESC
     COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarBroadcast].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarBroadcast]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarBroadcast] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarBroadcast]
    Purpose     :   Query all or filter records for [dbo].[tblBroadcast]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/13
    Parameter   :   @cIDBroadcast,@vcNombre,@cEstado Are optional
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarBroadcast]
@cIDBroadcast char(3)=Null, 
	@vcNombre varchar(30)=Null,
	@cEstado char(16)=Null

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
    SELECT [cIDBroadcast]
           ,[vcNombre]
           ,[vcDescripcion]
           ,[cEstado]
           ,[uUsuarioModifica]
           ,[dFechaModificacion]
      FROM [NonStop_Generate].[dbo].[tblBroadcast]
      WHERE 
          [cIDBroadcast]=ISNULL(@cIDBroadcast,[cIDBroadcast]) AND
          [vcNombre]= ISNULL(@vcNombre,[vcNombre]) AND
          [cEstado]= ISNULL(@cEstado,[cEstado]) AND
          [cEstado] <> 'ELIMINADO LOGICO'
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarBroadcastCliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarBroadcastCliente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarBroadcastCliente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarBroadcastCliente]
    Purpose     :   Query all or filter records for [dbo].[tblBroadcastCliente]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/14
    Parameter   :   @cIDBroadcast,@cClienteConmutadorCodigo Are optional
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarBroadcastCliente]
@cIDBroadcast char(3)=Null, 
	@cClienteConmutadorCodigo char(12)=Null

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
    SELECT [cIDBroadcast]
           ,[cClienteConmutadorCodigo]
      FROM [NonStop_Generate].[dbo].[tblBroadcastCliente]
      WHERE 
          [cIDBroadcast]=ISNULL(@cIDBroadcast,[cIDBroadcast]) AND
          [cClienteConmutadorCodigo]= ISNULL(@cClienteConmutadorCodigo,[cClienteConmutadorCodigo]) 
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarCliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarCliente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarCliente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarCliente]
    Purpose     :   Query all recors or filter in tblClienteConmutador where cEstado <> "ELIMINADO LOGICO"
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/28
    Parameter   :   @cClienteConmutadorCodigo is optional
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarCliente]
@cClienteConmutadorCodigo char(12)=Null
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
    SELECT [cClienteConmutadorCodigo]
      ,[cCodigoInstitucion]
      ,[cRUT]
      ,[vcNombre]
      ,[siControlIntentos]
      ,[cPuerto]
      ,[cEstado]
      ,[bVigente]  
    FROM [dbo].[tblClienteConmutador]
    WHERE [cEstado] <> 'ELIMINADO LOGICO' AND [cClienteConmutadorCodigo]=ISNULL(@cClienteConmutadorCodigo,[cClienteConmutadorCodigo])
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarClienteDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarClienteDetalle]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarClienteDetalle] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarClienteDetalle]
    Purpose     :   Query from [tblClienteConmutadorDetalle]
    Purpose     :   Query a record from each [Tipo] return the last modified value
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/09/30
    Parameter   :   No Parameters
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarClienteDetalle]
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
    SELECT  DISTINCT
      [cClienteConmutadorCodigo]
	  ,[Tipo]
      ,lAST_VALUE([cValor]) over (PARTITION BY [Tipo] ORDER BY [dFechaModificacion] ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) cValor
    FROM [dbo].[tblClienteConmutadorDetalle]
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarFormulario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarFormulario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarFormulario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarFormulario]
    Purpose     :   Query all or filter records for [dbo].[tblFormulario] where [cEstado] <> 'ELIMINADO LOGICO'
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/14
    Parameter   :   @cCodigoFormulario,@vcNombre,@cEstado Are optional
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarFormulario]
@cCodigoFormulario char(10)=Null,
    @vcNombre varchar(30)=Null,
    --@hJerarquia HIERARCHYID=Null,
    @cEstado char(16)=Null

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        -- check if @cCodigoFormulario  is empty
        IF  @cCodigoFormulario  ='' 
            raiserror('The parameters @cCodigoFormulario  should not be nulls or empties', 15, 1)
        -- check if @vcNombre is empty
        IF  @vcNombre ='' 
            raiserror('The parameters @vcNombre should not be null or empty', 15, 1)
  
            SELECT [cCodigoFormulario]
                  ,[vcNombre]
                  ,[vcDescripcion]
                  ,[hJerarquia]
                  ,CONVERT(varchar(255),[hJerarquia])  AS 'vcLevel'
                  ,[vcRuta]
                  ,[uUsuarioModifica]
                  ,[dFechaModificacion]
                  ,[cEstado]
              FROM [dbo].[tblFormulario]
                    WHERE   [cCodigoFormulario]=ISNULL(@cCodigoFormulario,[cCodigoFormulario]) AND
                            [vcNombre]=ISNULL(@vcNombre,[vcNombre]) AND
                            [cEstado] = ISNULL(@cEstado,[cEstado]) AND
                            [cEstado] <> 'ELIMINADO LOGICO'
                ORDER BY 'vcLevel'
     COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarMensajeAutorizado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarMensajeAutorizado]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarMensajeAutorizado] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarMensajeAutorizado]
    Purpose     :   Query all recors in [dbo].[tblClienteMensajeAutorizad] filtered by  @cClienteConmutadorCodigo where [dbo].[tblTipoMensaje].cEstado <> "ELIMINADO LOGICO"
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/18
    Parameter   :   @cClienteConmutadorCodigo is optional
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarMensajeAutorizado]
@cClienteConmutadorCodigo char(12)=Null
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if @cClienteConmutadorCodigo exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblClienteMensajeAutorizad] WHERE [cClienteConmutadorCodigo] = @cClienteConmutadorCodigo)
            raiserror('The value for @cClienteConmutadorCodigo is not found', 15, 1)
        SELECT  CM.[cIDTipoMensaje]
                ,CM.[bEnviar]
                ,CM.[bRecibir]
                ,CM.[cClienteConmutadorCodigo]
                ,TP.[vcNombre]
                ,TP.[vcDescripcion]
        FROM [dbo].[tblClienteMensajeAutorizad] CM INNER JOIN [dbo].[tblTipoMensaje] TP
        ON CM.cIDTipoMensaje=TP.cIDTipoMensaje
        WHERE   [cClienteConmutadorCodigo] = ISNULL(@cClienteConmutadorCodigo,[cClienteConmutadorCodigo]) AND
                TP.[cEstado] <> 'ELIMINADO LOGICO'
        ORDER BY [cIDTipoMensaje], [bEnviar] DESC,[bRecibir] DESC
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarMenu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarMenu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarMenu]
    Purpose     :   Query all or filter records for [dbo].[tblMenu] where [cEstado] <> 'ELIMINADO LOGICO'
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/14
    Parameter   :   @cCodigo,@vcMenuNombre,@cCodigoFormulario,@cEstado Are optional
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarMenu]
@cCodigo char(18)=Null,
	@vcMenuNombre varchar(30)=Null,
	@cCodigoFormulario char(10)=Null,
	@cEstado char(16)=Null

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        -- check if @cCodigo  is empty
        IF  @cCodigo  ='' 
            raiserror('The parameters @cCodigo  should not be null or empty', 15, 1)
        -- check if @cCodigoFormulario  is empty
        IF  @cCodigoFormulario  ='' 
            raiserror('The parameters @cCodigoFormulario  should not be null or empty', 15, 1)
        -- check if @vcNombre is empty
        IF  @vcMenuNombre ='' 
            raiserror('The parameters @vcMenuNombre should not be null or empty', 15, 1)

        SELECT [cCodigo]
              ,[vcMenuNombre]
              ,[hJerarquia]
              ,CONVERT(varchar(255),[hJerarquia])  AS 'vcLevel'
              ,[vcDescripcion]
              ,[cCodigoFormulario]
              ,[cEstado]
              ,[uUsuarioModifica]
              ,[dFechaModificacion]
          FROM [dbo].[tblMenu]
            WHERE
            [cCodigo]=ISNULL(@cCodigo,[cCodigo]) AND
            [vcMenuNombre]=ISNULL(@vcMenuNombre,[vcMenuNombre]) AND
            [cCodigoFormulario]=ISNULL(@cCodigoFormulario,[cCodigoFormulario]) AND
            [cEstado] = ISNULL(@cEstado,[cEstado]) AND
            [cEstado] <> 'ELIMINADO LOGICO'
          ORDER BY 'vcLevel'
     COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarNSEMensajeSistema].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarNSEMensajeSistema]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarNSEMensajeSistema] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTconsultarNSEMensajeSistema]
    Purpose     :   query records in [dbo].[tblNSEMensajeSistema]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/11/03
    Parameter   :   @cIDMensaje is optional
    Parameter   :    
    Parameter   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarNSEMensajeSistema]
@cIDMensaje char(5)=Null
AS
SET NOCOUNT ON
BEGIN TRY
    SELECT [cIDMensaje]
          ,[cNSE]
      FROM [dbo].[tblNSEMensajeSistema]
        WHERE [cIDMensaje] = ISNULL(@cIDMensaje,[cIDMensaje])

END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarParametro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarParametro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarParametro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarParametro]
    Purpose     :   Query all or filter records for [dbo].[tblParametro]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/15
    Parameter   :   @cClase,@cSubClase,@cDivision,@bReservado Are optional
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarParametro]
@cClase char(20) = Null,
@cSubClase char(20) = Null,
@cDivision varchar(50) = Null ,
@bReservado bit = Null

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION

SELECT  [uIDParametro]
        ,[vcNombre]
        ,[cClase]
        ,[cSubClase]
        ,[cDivision]
        ,[hJerarquia]
        ,CONVERT(varchar(255),[hJerarquia])  AS 'vcLevel'
        ,[vcValor]
        ,[vcDescripcion]
        ,[bReservado]      
FROM [dbo].[tblParametro]
WHERE   [cClase] = ISNULL(@cClase,[cClase]) AND
        [cSubClase] = ISNULL(@cSubClase,[cSubClase]) AND
        [cDivision] = ISNULL(@cDivision,[cDivision]) AND
        [bReservado]= ISNULL(@bReservado,[bReservado])
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarPerfil]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarPerfil] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarPerfil]
    Purpose     :   Query all or filter records for [dbo].[tblPerfil]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/26
    Parameter   :   @uIDRol ,@cCodigo  Are optional
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarPerfil]
@uIDRol varchar(37)=Null,
    @cCodigo char(18)=Null

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        SELECT [uIDRol]
              ,[cCodigo]
              ,[bCrear]
              ,[bActualizar]
              ,[bConsultar]
              ,[bEliminar]
          FROM [dbo].[tblPerfil]
        WHERE 
                [uIDRol]=ISNULL(@uIDRol,[uIDRol]) AND 
                [cCodigo]=ISNULL(@cCodigo,[cCodigo])
     COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarRegistroDiarioSecuencia].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarRegistroDiarioSecuencia]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarRegistroDiarioSecuencia] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarRegistroDiarioSecuencia]
    Purpose     :   Query a record for a specific ClienteConmuntador on the current day 
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/09/28
    Parameter   :   @cClienteConmutadorCodigo must not be null or empty
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarRegistroDiarioSecuencia]
@cClienteConmutadorCodigo char(12)
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
    -- check if parameter is null or empty
    IF  @cClienteConmutadorCodigo is null OR @cClienteConmutadorCodigo ='' 
            raiserror('The parameter should not be null or empty', 15, 1)
    -- Query match current day
    SELECT 
        [uIDRegistroDiario]
        ,[dFechaPrimeraConexion]
        ,[dFechaUltimaConexion]
        ,[dFechaResumen]
        ,[cNSEInicial]
        ,[cNSEFinal]
        ,[cNSRInicial]
        ,[cNSRFinal]
        ,[cNSCInicial]
        ,[cNSCFinal]
        ,[cClienteConmutadorCodigo]
    FROM [dbo].[tblRegistroDiarioSecuencia]
    WHERE [cClienteConmutadorCodigo] = @cClienteConmutadorCodigo
            AND CONVERT(DATE,[dFechaResumen])=CONVERT(DATE,getdate())
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarRegistroDiarioTotales].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarRegistroDiarioTotales]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarRegistroDiarioTotales] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTconsultarRegistroDiarioTotales]
    Purpose     :   query records in [dbo].[tblRegistroDiarioTotales]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/11/02
    Parameter   :   @uIDRegistroDiario must not be null or empty
    Parameter   :    
    Parameter   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarRegistroDiarioTotales]
@uIDRegistroDiario varchar(37)

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        SELECT [uIDRegistroDiario]
              ,[cConcepto]
              ,[siTotal]
          FROM [dbo].[tblRegistroDiarioTotales]
                WHERE [uIDRegistroDiario]=@uIDRegistroDiario
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarRegistroSesionCliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarRegistroSesionCliente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarRegistroSesionCliente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTconsultarRegistroSesionCliente]
    Purpose     :   query records in [dbo].[tblRegistroSesionCliente]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/11/03
    Parameter   :   all parameter are optionals
    Parameter   :    
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarRegistroSesionCliente]
@uIDRegistroSesion varchar(37)=Null,
    @cClienteConmutadorCodigo char(12)=Null,
    @dFechaConexion datetime=Null,
    @dFechaDesconexion datetime=NULL,
    @cNumeroSecuencia char(18)=Null
AS
SET NOCOUNT ON
BEGIN TRY
        SELECT [uIDRegistroSesion]
              ,[cClienteConmutadorCodigo]
              ,[dFechaConexion]
              ,[dFechaDesconexion]
              ,[cNumeroSecuencia]
          FROM [dbo].[tblRegistroSesionCliente]
            WHERE   [uIDRegistroSesion] = ISNULL(@uIDRegistroSesion,[uIDRegistroSesion])
                    AND [cClienteConmutadorCodigo] = ISNULL(@cClienteConmutadorCodigo,[cClienteConmutadorCodigo])
                    AND [dFechaConexion] = ISNULL(@dFechaConexion,[dFechaConexion])
                    AND [dFechaDesconexion] = ISNULL(@dFechaDesconexion,[dFechaDesconexion])
                    AND [cNumeroSecuencia] = ISNULL(@cNumeroSecuencia,[cNumeroSecuencia])
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarRol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarRol]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarRol] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarRol]
    Purpose     :   Query all or filter records for [dbo].[tblRol]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/26
    Parameter   :   @uIDRol,@vcNombre Are optional
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarRol]
@uIDRol varchar(37)=Null,
    @vcNombre varchar (30)=Null

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        -- check if @uIDRol  is empty
        IF  @uIDRol  ='' 
            raiserror('The parameters @uIDRol should not be null or empty', 15, 1)
        -- check if @vcNombre  is empty
        IF  @vcNombre ='' 
            raiserror('The parameters @vcNombre should not be null or empty', 15, 1)

        SELECT [uIDRol]
              ,[vcNombre]
              ,[vcDescripcion]
              ,[cEstado]
              ,[uUsuarioModifica]
              ,[dFechaModificacion]
          FROM [dbo].[tblRol]
                WHERE 
                    [uIDRol]=ISNULL(@uIDRol,[uIDRol]) AND
                    [vcNombre]=ISNULL(@vcNombre,[vcNombre]) AND
                    [cEstado]<> 'ELIMINADO LOGICO'
     COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarTextoSistema].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarTextoSistema]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarTextoSistema] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarTextoSistema]
    Purpose     :   Query all or filter records for [dbo].[tblTextoSistema]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/12
    Parameter   :   @cGrupo,@cCodigo Are optionals
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarTextoSistema]
@cGrupo char(3)=Null,
    @cCodigo char(3)=Null

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        SELECT [cGrupo]
              ,[cCodigo]
              ,[vcDescripcion]
              ,[bReservado]
              ,[uUsuarioModifica]
              ,[dFechaModificacion]
          FROM [dbo].[tblTextoSistema]
            WHERE   [cGrupo]=ISNULL(@cGrupo,[cGrupo]) AND 
                    [cCodigo]= ISNULL(@cCodigo,[cCodigo])

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarUsuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarUsuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarUsuario]
    Purpose     :   Query all records for [tblUsuario]  where cEstado <> "ELIMINADO LOGICO"
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/18
    Parameter   :   all Parameters Are optional
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarUsuario]
@uIDUsuario varchar(37)=Null,
    @cRUT char(12)=Null,
    @vcNombre varchar(30)=Null,
    @vcApellido varchar(30)=Null,
    @cEstado char(16)=Null
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION

    SELECT  [uIDUsuario]
            ,[cRUT]
            ,[vcNombre]
            ,[vcApellido]
            ,[sdFechaCreacion]
            ,[cEstado]
    FROM [dbo].[tblUsuario]
    WHERE   [uIDUsuario]=ISNULL(@uIDUsuario,[uIDUsuario]) AND
            [cRUT]=ISNULL(@cRUT,[cRUT]) AND
            [vcNombre]=ISNULL(@vcNombre,[vcNombre]) AND
            [vcApellido]=ISNULL(@vcApellido,[vcApellido]) AND
            [cEstado]=ISNULL(@cEstado,[cEstado]) AND
            [cEstado] <> 'ELIMINADO LOGICO'
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarUsuarioDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarUsuarioDetalle]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarUsuarioDetalle] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTconsultarUsuarioDetalle]
    Purpose     :   Query from [tblUsuarioDetalle]
    Purpose     :   Query a record from each [Tipo] return the last modified value
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/09/30
    Parameter   :   @uIDUsuario must not be nulls or empties
    Parameter   :   @uIDUsuario must exist in [dbo].[tblUsuario]
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarUsuarioDetalle]
@uIDUsuario varchar(37)
AS
SET NOCOUNT ON
BEGIN TRY
        WITH CTE_lastValue AS 
        (
              SELECT [uIDUsuario]
                      ,[uTipo]
                      ,lAST_VALUE([vcValor]) over (PARTITION BY [uTipo] ORDER BY [dFechaModificacion] ROWS BETWEEN UNBOUNDED PRECEDING AND      UNBOUNDED FOLLOWING) vcValor
                      ,lAST_VALUE([dFechaModificacion]) over (PARTITION BY [uTipo] ORDER BY [dFechaModificacion] ROWS BETWEEN UNBOUNDED     PRECEDING   AND UNBOUNDED FOLLOWING) dFechaModificacion
                FROM [dbo].[tblUsuarioDetalle]
                    WHERE [uIDUsuario]=@uIDUsuario
        )
        SELECT DISTINCT [uIDUsuario]
                      ,[uTipo]
                      ,[vcValor]
                      ,[dFechaModificacion]
        FROM CTE_lastValue                
        ORDER BY [dFechaModificacion] DESC 

END TRY
BEGIN CATCH
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTconsultarUsuarioRol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTconsultarUsuarioRol]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTconsultarUsuarioRol] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTconsultarUsuarioRol]
    Purpose     :   Query all or filter records for  [dbo].[tblUsuarioRol]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/26
    Parameter   :   @uIDUsuario,@uIDRol are optionals
    Procedure   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTconsultarUsuarioRol]
@uIDUsuario varchar(37)=Null,
    @uIDRol varchar(37)=Null
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        SELECT [uIDUsuario]
              ,[uIDRol]
              ,[dFechaActivacion]
              ,[dFechaExpiracion]
              ,[cEstado]
          FROM [dbo].[tblUsuarioRol]
            WHERE 
                    [uIDUsuario]=ISNULL(@uIDUsuario,[uIDUsuario]) AND
                    [uIDRol]=ISNULL(@uIDRol,[uIDRol]) 
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearAviso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearAviso]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearAviso] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearAviso]
    Purpose     :   Insert a new record in [dbo].[tblAviso]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/19
    Parameter   :   All parameters are not null
    Parameter   :   @uIDUsuario must exist in [dbo].[tblUsuario]
    Parameter   :   @cClienteConmutadorCodigo must exist in [dbo].[tblClienteConmutador]
    Parameter   :   @dFechaCreacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearAviso]
@uIDUsuario varchar(37),
    @cClienteConmutadorCodigo char(12),
    @dFechaCreacion datetime,
    @vcAviso varchar(200) 
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        DECLARE @uIDAviso uniqueidentifier =NEWID()
        --Check if @uIDUsuario exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblUsuario] WHERE [uIDUsuario]=@uIDUsuario)
            raiserror('The value for @uIDUsuario is not found', 15, 1)
        -- check if @vcAviso is empty
        IF  @vcAviso ='' 
            raiserror('The parameters @vcValor should not be null or empty', 15, 1)
        -- Insert
        INSERT INTO [dbo].[tblAviso]
                   ([uIDAviso]
                   ,[uIDUsuario]
                   ,[cClienteConmutadorCodigo]
                   ,[dFechaCreacion]
                   ,[vcAviso])
             VALUES
                   (@uIDAviso
                   ,CONVERT(uniqueidentifier,@uIDUsuario)
                   ,@cClienteConmutadorCodigo
                   ,@dFechaCreacion
                   ,@vcAviso)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearBitacora].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearBitacora]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearBitacora] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearBitacora]
    Purpose     :   Insert a new record in [dbo].[tblBitacora]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/15
    Parameter   :   all parameters must not be nulls or empties
    Procedure   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearBitacora]
@uIDUsuario varchar(37),
	@uTipo varchar(37),
	@uSubTipo varchar(37),
	@dFechaInicio datetime,
	@dFechaFinalizacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        DECLARE @uIDBitacora uniqueidentifier=NEWID()
        INSERT INTO [dbo].[tblBitacora]
                   ([uIDBitacora]
                   ,[uIDUsuario]
                   ,[uTipo]
                   ,[uSubTipo]
                   ,[dFechaInicio]
                   ,[dFechaFinalizacion])
             VALUES
                   (@uIDBitacora
                   ,CONVERT(uniqueidentifier,@uIDUsuario)
                   ,CONVERT(uniqueidentifier,@uTipo)
                   ,CONVERT(uniqueidentifier,@uSubTipo)
                   ,@dFechaInicio
                   ,@dFechaFinalizacion)

    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearBitacoraDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearBitacoraDetalle]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearBitacoraDetalle] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearBitacoraDetalle]
    Purpose     :   Insert a new record in [dbo].[tblBitacoraDetalle]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/15
    Parameter   :   all parameters must not be nulls or empties
    Procedure   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearBitacoraDetalle]
@uIDBitacora varchar(37),
	@vcOperacion varchar(30),
	@vcTabla varchar(30),
	@xCamposAfectados xml,
	@dFechaModificacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        -- check if @vcOperacion  is empty
        IF  @vcOperacion  ='' 
            raiserror('The parameters @vcOperacion should not be null or empty', 15, 1)
        -- check if @vcTabla  is empty
        IF  @vcTabla  ='' 
            raiserror('The parameters @vcTabla should not be null or empty', 15, 1)
        -- check if @vcOperacion  is empty
        IF  DATALENGTH(@xCamposAfectados)  =5 
            raiserror('The parameters @xCamposAfectados should not be null or empty', 15, 1)
        INSERT INTO [dbo].[tblBitacoraDetalle]
                   ([uIDBitacora]
                   ,[vcOperacion]
                   ,[vcTabla]
                   ,[xCamposAfectados]
                   ,[dFechaModificacion])
             VALUES
                   (CONVERT(uniqueidentifier,@uIDBitacora)
                   ,@vcOperacion
                   ,@vcTabla
                   ,@xCamposAfectados
                   ,@dFechaModificacion)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearBroadcast].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearBroadcast]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearBroadcast] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearBroadcast]
    Purpose     :   Insert a new record in [dbo].[tblBroadcast]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/13
    Parameter   :   @vcDescripcion is optional
    Parameter   :   @cIDBroadcast,@vcNombre,@cEstado,@uUsuarioModifica,@dFechaModificacion must not be nulls or empties
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearBroadcast]
@cIDBroadcast char(3), 
	@vcNombre varchar(30),
	@vcDescripcion varchar(200)= NULL,
	@cEstado char(16),
	@uUsuarioModifica varchar(37),
    @dFechaModificacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        -- check if @cIDBroadcast is empty
        IF  @cIDBroadcast ='' 
            raiserror('The parameters @cIDBroadcast should not be nulls or empties', 15, 1)
        -- check if @vcNombre is empty
        IF  @vcNombre ='' 
            raiserror('The parameters @vcNombre should not be nulls or empties', 15, 1)
        INSERT INTO [dbo].[tblBroadcast]
                   ([cIDBroadcast]
                   ,[vcNombre]
                   ,[vcDescripcion]
                   ,[cEstado]
                   ,[uUsuarioModifica]
                   ,[dFechaModificacion])
             VALUES
                   (@cIDBroadcast
                   ,@vcNombre
                   ,@vcDescripcion
                   ,@cEstado
                   ,CONVERT(uniqueidentifier,@uUsuarioModifica)
                   ,@dFechaModificacion)
     
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearBroadcastCliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearBroadcastCliente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearBroadcastCliente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearBroadcastCliente]
    Purpose     :   Insert a new record in [dbo].[tblBroadcastCliente]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/14
    Parameter   :   @cIDBroadcast,@cClienteConmutadorCodigo must not be nulls or empties
    Procedure   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearBroadcastCliente]
@cIDBroadcast char(3), 
	@cClienteConmutadorCodigo char(12)
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        -- check if @cIDBroadcast is empty
        IF  @cIDBroadcast ='' 
            raiserror('The parameters @cIDBroadcast should not be nulls or empties', 15, 1)
        -- check if @cClienteConmutadorCodigo is empty
        IF  @cClienteConmutadorCodigo ='' 
            raiserror('The parameters @cClienteConmutadorCodigo should not be nulls or empties', 15, 1)

        INSERT INTO [dbo].[tblBroadcastCliente]
                   ([cIDBroadcast]
                   ,[cClienteConmutadorCodigo])
             VALUES
                   (@cIDBroadcast
                   ,@cClienteConmutadorCodigo)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearCalendario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearCalendario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearCalendario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearCalendario]
    Purpose     :   Insert a new record in [dbo].[tblCalendario]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/19
    Parameter   :   All parameters are not null
    Parameter   :   @cTipo must exist in [dbo].[tblParametro]
    Parameter   :   @cClienteConmutadorCodigo must exist in [dbo].[tblClienteConmutador]
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearCalendario]
@vcIDCalendario varchar(20),
    @cTipo varchar(37),
    @sdFecha smalldatetime,
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if @cTipo exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblParametro] WHERE [uIDParametro]=@cTipo)
            raiserror('The value for @cTipo is not found', 15, 1)
        -- check if @vcIDCalendario is empty
        IF  @vcIDCalendario ='' 
            raiserror('The parameters @vcIDCalendario should not be null or empty', 15, 1)
        -- Insert
        INSERT INTO [dbo].[tblCalendario]
                   ([vcIDCalendario]
                   ,[cTipo]
                   ,[sdFecha]
                   ,[uUsuarioModifica]
                   ,[dFechaModificacion])
             VALUES
                   (@vcIDCalendario
                   ,@cTipo
                   ,@sdFecha
                   ,@uUsuarioModifica
                   ,@dFechaModificacion)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearCliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearCliente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearCliente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearCliente]
    Purpose     :   Insert a new record in tblClienteConmutador
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/28
    Parameter   :   All parameters are not null
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearCliente]
@cClienteConmutadorCodigo char(12) ,
    @cCodigoInstitucion char(4),
    @cRUT char(12),
    @vcNombre varchar(30),
    @siControlIntentos smallint,
    @cPuerto char(4) ,
    @cEstado char(16),
    @bVigente bit,
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO [dbo].[tblClienteConmutador]
           ([cClienteConmutadorCodigo]
           ,[cCodigoInstitucion]
           ,[cRUT]
           ,[vcNombre]
           ,[siControlIntentos]
           ,[cPuerto]
           ,[cEstado]
           ,[bVigente]
           ,[uUsuarioModifica]
           ,[dFechaModificacion])
        VALUES
           (@cClienteConmutadorCodigo
           ,@cCodigoInstitucion
           ,@cRUT
           ,@vcNombre
           ,@siControlIntentos
           ,@cPuerto
           ,@cEstado
           ,@bVigente
           ,CONVERT(uniqueidentifier,@uUsuarioModifica)
           ,@dFechaModificacion)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearClienteDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearClienteDetalle]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearClienteDetalle] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearClienteDetalle]
    Purpose     :   Insert a new record in [dbo].[tblClienteConmutadorDetalle]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/09/24
    Parameter   :   All parameters are not null
    Parameter   :   @cClienteConmutadorCodigo must exist in [dbo].[tblClienteConmutador]
    Parameter   :   @Tipo must exist in [dbo].[tblParametro]
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearClienteDetalle]
@cClienteConmutadorCodigo char(12) ,
    @Tipo char(36) ,
    @cValor char(255),
    @dFechaModificacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if exist ClienteConmutador
        DECLARE @foundClienteConmutadorCodigo  CHAR(12)
        SELECT  @foundClienteConmutadorCodigo = [cClienteConmutadorCodigo]
        FROM  [dbo].[tblClienteConmutador]
        WHERE [cClienteConmutadorCodigo]=@cClienteConmutadorCodigo
        IF @foundClienteConmutadorCodigo IS NULL
            raiserror('The value for @cClienteConmutadorCodigo is not found', 15, 1)
        --Check if exist Tipo
        DECLARE @foundTipo char(36)
        SELECT @foundTipo=[uIDParametro] FROM [dbo].[tblParametro]
        IF @foundTipo IS NULL
            raiserror('The value for @Tipo is not found', 15, 1)
        -- Insert
        INSERT INTO [dbo].[tblClienteConmutadorDetalle]
           ([cClienteConmutadorCodigo]
           ,[Tipo]
           ,[cValor] 
           ,[dFechaModificacion])
        VALUES
           (@cClienteConmutadorCodigo
           ,CONVERT(uniqueidentifier,@Tipo)
           ,@cValor
           ,@dFechaModificacion)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearFormulario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearFormulario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearFormulario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearFormulario]
    Purpose     :   Insert a new record in [dbo].[tblFormulario]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/14
    Parameter   :   @vcDescripcion is optional
    Parameter   :   @cCodigoFormulario,@vcNombre,@hJerarquia,@vcRuta,@cEstado,@uUsuarioModifica,@dFechaModificacion must not be nulls or empties
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :   IF @hJerarquia is null root node will be created
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearFormulario]
@cCodigoFormulario char(10),
    @vcNombre varchar(30),
    @vcDescripcion varchar(200)=Null,
    @hJerarquia HIERARCHYID=Null,
    @vcRuta varchar(255),
    @cEstado char(16),
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime  

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        -- check if @cCodigoFormulario  is empty
        IF  @cCodigoFormulario  ='' 
            raiserror('The parameters @cCodigoFormulario  should not be nulls or empties', 15, 1)
        -- check if @vcNombre is empty
        IF  @vcNombre ='' 
            raiserror('The parameters @vcNombre should not be null or empty', 15, 1)
        -- check if @vcRuta is empty
        IF  @vcRuta ='' 
            raiserror('The parameters @vcRuta should not be null or empty', 15, 1)
        -- check Duplicate HIERARCHYID
        IF EXISTS (SELECT [hJerarquia] FROM [dbo].[tblFormulario] WHERE [hJerarquia]=@hJerarquia)
            raiserror('The @hJerarquia value already exists', 15, 1)
        DECLARE @hPJerarquia HIERARCHYID
        IF @hJerarquia IS NULL
            SET @hPJerarquia=HIERARCHYID::GetRoot() 
        ELSE
            SET @hPJerarquia=@hJerarquia
        INSERT INTO [dbo].[tblFormulario]
                   ([cCodigoFormulario]
                   ,[vcNombre]
                   ,[vcDescripcion]
                   ,[hJerarquia]
                   ,[vcRuta]
                   ,[cEstado]
                   ,[uUsuarioModifica]
                   ,[dFechaModificacion])
             VALUES
                   (@cCodigoFormulario
                   ,@vcNombre
                   ,@vcDescripcion
                   ,@hPJerarquia
                   ,@vcRuta
                   ,@cEstado
                   ,CONVERT(uniqueidentifier,@uUsuarioModifica)
                   ,@dFechaModificacion)  
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearInformeClave].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearInformeClave]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearInformeClave] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearInformeClave]
    Purpose     :   Insert a new record in [dbo].[tblInformeClave]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/09/30
    Parameter   :   @iNumeroSolicitud,@vcSolicitante,@vcDetalleCausa are optional
    Parameter   :   @cTipoGenerador,@uGenerador,@dFechaRegistro,@uCausa,@uSubCausa, must not be null
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearInformeClave]
@iNumeroSolicitud int = Null,
    @vcSolicitante  varchar(40) = Null,
    @cTipoGenerador char(10),
    @uGenerador varchar(37),
    @dFechaRegistro datetime,
    @uCausa varchar(37),
    @uSubCausa  varchar(37),
    @vcDetalleCausa varchar = Null,
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime,
    @uIDSecuenciaClave uniqueidentifier=Null OUTPUT
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
    SET @uIDSecuenciaClave =NEWID()
    INSERT INTO [dbo].[tblInformeClave]
           ([iNumeroSolicitud]
           ,[vcSolicitante]
           ,[cTipoGenerador]
           ,[uGenerador]
           ,[dFechaRegistro]
           ,[uCausa]
           ,[uSubCausa]
           ,[vcDetalleCausa]
           ,[uIDSecuenciaClave]
           ,[uUsuarioModifica]
           ,[dFechaModificacion])
     VALUES
            (@iNumeroSolicitud
            ,@vcSolicitante
            ,@cTipoGenerador
            ,CONVERT(UNIQUEIDENTIFIER,@uGenerador)
            ,@dFechaRegistro
            ,CONVERT(UNIQUEIDENTIFIER,@uCausa)
            ,CONVERT(UNIQUEIDENTIFIER,@uSubCausa)
            ,@vcDetalleCausa
            ,@uIDSecuenciaClave
            ,@uUsuarioModifica
            ,@dFechaModificacion )
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearMenu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearMenu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearMenu]
    Purpose     :   Insert a new record in [dbo].[tblMenu]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/14
    Parameter   :   @vcDescripcion is optional
    Parameter   :   @cCodigo,@vcMenuNombre,@hJerarquia,@cCodigoFormulario,@cEstado,@uUsuarioModifica,@dFechaModificacion must not be nulls or empties
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :   IF @hJerarquia is null root node will be created
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearMenu]
@cCodigo char(18),
	@vcMenuNombre varchar(30),
	@hJerarquia hierarchyid,
	@vcDescripcion varchar(200)=Null,
	@cCodigoFormulario char(10),
	@cEstado char(16),
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime  

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        -- check if @cCodigo  is empty
        IF  @cCodigo  ='' 
            raiserror('The parameters @cCodigo should not be null or empty', 15, 1)
        -- check if @vcMenuNombre is empty
        IF  @vcMenuNombre ='' 
            raiserror('The parameters @vcMenuNombre should not be null or empty', 15, 1)
        -- check if @cCodigoFormulario is empty
        IF  @cCodigoFormulario ='' 
            raiserror('The parameters @cCodigoFormulario should not be null or empty', 15, 1)
        -- check Duplicate HIERARCHYID
        IF EXISTS (SELECT [hJerarquia] FROM [dbo].[tblFormulario] WHERE [hJerarquia]=@hJerarquia)
            raiserror('The @hJerarquia value already exists', 15, 1)
        DECLARE @hPJerarquia HIERARCHYID
        IF @hJerarquia IS NULL
            SET @hPJerarquia=HIERARCHYID::GetRoot() 
        ELSE
            SET @hPJerarquia=@hJerarquia

        INSERT INTO [dbo].[tblMenu]
                   ([cCodigo]
                   ,[vcMenuNombre]
                   ,[hJerarquia]
                   ,[vcDescripcion]
                   ,[cCodigoFormulario]
                   ,[cEstado]
                   ,[uUsuarioModifica]
                   ,[dFechaModificacion])
             VALUES
                   (@cCodigo
                   ,@vcMenuNombre
                   ,@hPJerarquia
                   ,@vcDescripcion
                   ,@cCodigoFormulario
                   ,@cEstado
                   ,CONVERT(uniqueidentifier,@uUsuarioModifica)
                   ,@dFechaModificacion)  
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearNSEMensajeSistema].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearNSEMensajeSistema]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearNSEMensajeSistema] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearNSEMensajeSistema]
    Purpose     :   Insert a new record in [dbo].[tblNSEMensajeSistema]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/11/03
    Parameter   :   @dFechaUltimaConexion,@cNSE must not be nulls or empties
    Parameter   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearNSEMensajeSistema]
@cIDMensaje char(5),
    @cNSE int
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        IF  @cIDMensaje ='' 
            raiserror('The parameters @cIDMensaje should not be nulls or empties', 15, 1)
        INSERT INTO [dbo].[tblNSEMensajeSistema]
                   ([cIDMensaje]
                   ,[cNSE])
             VALUES
                   (@cIDMensaje
                   ,@cNSE)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearParametro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearParametro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearParametro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearParametro]
    Purpose     :   Insert a new record in [dbo].[tblParametro]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/15
    Parameter   :   @vcDescripcion,@hJerarquia is optional
    Parameter   :   @vcNombre,@cClase,@cDivision,@vcValor,@bReservado,@uUsuarioModifica,@dFechaModificacion must not be nulls or empties
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearParametro]
@vcNombre [varchar](50),
    @cClase char(20),
    @cSubClase [char](20),
    @cDivision varchar(50),
    @hJerarquia hierarchyid=Null,
    @vcValor [varchar](3000),
    @vcDescripcion varchar(200)= NULL,
    @bReservado bit,
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        DECLARE @uIDParametro uniqueidentifier = NEWID()
        -- Check duplicate parameter
        IF EXISTS (SELECT TOP 1 1 FROM [dbo].[tblParametro] WHERE [cClase]=@cClase AND [cSubClase]=@cSubClase AND [cDivision]=@cDivision AND [vcValor]=@vcValor)
            raiserror('The parameters already exist', 15, 1)
        -- check Duplicate HIERARCHYID
        IF EXISTS (SELECT [hJerarquia] FROM [dbo].[tblParametro] WHERE [hJerarquia]=@hJerarquia)
            raiserror('The @hJerarquia value already exists', 15, 1)
        INSERT INTO [dbo].[tblParametro]
            ([uIDParametro]
            ,[cClase]
            ,[cSubClase]
            ,[vcValor]
            ,[vcNombre]
            ,[vcDescripcion]
            ,[bReservado]
            ,[uUsuarioModifica]
            ,[dFechaModificacion]
            ,[cDivision]
            ,[hJerarquia])
        VALUES
            (@uIDParametro
            ,@cClase
            ,@cSubClase
            ,@vcValor
            ,@vcNombre
            ,@vcDescripcion
            ,@bReservado
            ,@uUsuarioModifica
            ,@dFechaModificacion
            ,@cDivision
            ,@hJerarquia)

    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearPerfil]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearPerfil] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearPerfil]
    Purpose     :   Insert a new record in [dbo].[tblPerfil]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/26
    Parameter   :   All parameters must not be nulls or empties
    Procedure   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearPerfil]
@uIDRol varchar(37),
    @cCodigo char(18),
    @bCrear bit,
    @bActualizar bit,
    @bConsultar bit,
    @bEliminar bit

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO [dbo].[tblPerfil]
                   ([uIDRol]
                   ,[cCodigo]
                   ,[bCrear]
                   ,[bActualizar]
                   ,[bConsultar]
                   ,[bEliminar])
             VALUES
                   (CONVERT(uniqueidentifier,@uIDRol)
                   ,@cCodigo
                   ,@bCrear
                   ,@bActualizar
                   ,@bConsultar
                   ,@bEliminar)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearRegistroDiarioSecuencia].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearRegistroDiarioSecuencia]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearRegistroDiarioSecuencia] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearRegistroDiarioSecuencia]
    Purpose     :   Insert a new record in [dbo].[tblRegistroDiarioSecuencia]]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/14
    Parameter   :   @dFechaUltimaConexion is optional
    Parameter   :   @cClienteConmutadorCodigo,@dFechaResumen,@dFechaPrimeraConexion,@cNSEInicial,@cNSEFinal,@cNSRInicial,@cNSRFinal,@cNSCInicia,@cNSCFinal must not be nulls or empties
    Parameter   :   if *Final values are not available use Inicial
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearRegistroDiarioSecuencia]
@cClienteConmutadorCodigo char(12),
    @dFechaResumen datetime,
    @dFechaPrimeraConexion datetime,
    @dFechaUltimaConexion datetime= NULL,
    @cNSEInicial int,
    @cNSEFinal int,
    @cNSRInicial int,
    @cNSRFinal int,
    @cNSCInicial char(5),
    @cNSCFinal char(5)
 

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        DECLARE @uIDRegistroDiario uniqueidentifier=NewID()
        INSERT INTO [dbo].[tblRegistroDiarioSecuencia]
                   ([uIDRegistroDiario]
                   ,[cClienteConmutadorCodigo]
                   ,[dFechaResumen]
                   ,[dFechaPrimeraConexion]
                   ,[dFechaUltimaConexion]
                   ,[cNSEInicial]
                   ,[cNSEFinal]
                   ,[cNSRInicial]
                   ,[cNSRFinal]
                   ,[cNSCInicial]
                   ,[cNSCFinal])
             VALUES
                   (@uIDRegistroDiario
                   ,@cClienteConmutadorCodigo
                   ,@dFechaResumen
                   ,@dFechaPrimeraConexion
                   ,@dFechaUltimaConexion
                   ,@cNSEInicial
                   ,@cNSEFinal
                   ,@cNSRInicial
                   ,@cNSRFinal
                   ,@cNSCInicial
                   ,@cNSCFinal)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearRegistroDiarioTotales].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearRegistroDiarioTotales]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearRegistroDiarioTotales] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearRegistroDiarioTotales]
    Purpose     :   Insert a new record in [dbo].[tblRegistroDiarioTotales]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/11/02
    Parameter   :   @uIDRegistroDiario,@cConcepto,@siTotal must not be nulls or empties
    Parameter   :    
    Parameter   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearRegistroDiarioTotales]
@uIDRegistroDiario varchar(37),
    @cConcepto char(18),
    @siTotal smallint

AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO [dbo].[tblRegistroDiarioTotales]
                   ([uIDRegistroDiario]
                   ,[cConcepto]
                   ,[siTotal])
             VALUES
                   (@uIDRegistroDiario
                   ,@cConcepto
                   ,@siTotal)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearRegistroSesionCliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearRegistroSesionCliente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearRegistroSesionCliente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearRegistroSesionCliente]
    Purpose     :   Insert a new record in [dbo].[tblRegistroSesionCliente]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/11/03
    Parameter   :   @cClienteConmutadorCodigo,@dFechaConexion,@cNumeroSecuencia must not be nulls or empties
    Parameter   :   @dFechaDesconexion Is optional
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearRegistroSesionCliente]
@cClienteConmutadorCodigo char(12),
    @dFechaConexion datetime,
    @dFechaDesconexion datetime=NULL,
    @cNumeroSecuencia char(18)
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        DECLARE @uIDRegistroSesion uniqueidentifier=NEWid()
        INSERT INTO [dbo].[tblRegistroSesionCliente]
                   ([uIDRegistroSesion]
                   ,[cClienteConmutadorCodigo]
                   ,[dFechaConexion]
                   ,[dFechaDesconexion]
                   ,[cNumeroSecuencia])
             VALUES
                   (@uIDRegistroSesion
                   ,@cClienteConmutadorCodigo
                   ,@dFechaConexion
                   ,@dFechaDesconexion
                   ,@cNumeroSecuencia)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearRol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearRol]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearRol] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearRol]
    Purpose     :   Insert a new record in [dbo].[tblRol]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/26
    Parameter   :   @vcDescripcion is optional
    Parameter   :   @vcNombre,@cEstado,@uUsuarioModifica,@dFechaModificacion must not be nulls or empties
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearRol]
@vcNombre varchar(30),
	@vcDescripcion varchar(200)= NULL,
	@cEstado char(16),
	@uUsuarioModifica varchar(37),
    @dFechaModificacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        -- check if @vcDescripcion is empty
        IF  @vcDescripcion ='' 
            raiserror('The parameters @vcDescripcion should not be nulls or empties', 15, 1)
        -- check if @vcNombre is empty
        IF  @vcNombre ='' 
            raiserror('The parameters @vcNombre should not be nulls or empties', 15, 1)
        DECLARE @uIDRol uniqueidentifier=NewID()
        INSERT INTO [dbo].[tblRol]
                   ([uIDRol]
                   ,[vcNombre]
                   ,[vcDescripcion]
                   ,[cEstado]
                   ,[uUsuarioModifica]
                   ,[dFechaModificacion])
             VALUES
                   (@uIDRol
                   ,@vcNombre
                   ,@vcDescripcion
                   ,@cEstado
                   ,CONVERT(uniqueidentifier,@uUsuarioModifica)
                   ,@dFechaModificacion)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearSecuenciaClave].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearSecuenciaClave]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearSecuenciaClave] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearSecuenciaClave]
    Purpose     :   Insert a new record in [dbo].[tblSecuenciaClave]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/09/30
    Parameter   :   @iSecuencia is optional
    Parameter   :   @cClienteConmutadorCodigo,@uIDSecuenciaClave,@cClave, must not be null
    Procedure   :   If @iSecuencia get the last Secuencia
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearSecuenciaClave]
@cClienteConmutadorCodigo char(12),
    @uIDSecuenciaClave varchar(37),
    @iSecuencia int =NULL,
    @cClave char(30) 
	
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
    -- Get last Secuencia
    IF @iSecuencia IS NULL
        BEGIN
            SELECT @iSecuencia=MAX([iSecuencia])
            FROM [dbo].[tblSecuenciaClave]
            WHERE [cClienteConmutadorCodigo]=@cClienteConmutadorCodigo
            IF @iSecuencia IS NULL -- The table is empty
                SET @iSecuencia=0
        END
    SET @iSecuencia=@iSecuencia+1 --Increment Secuencia
    INSERT INTO [dbo].[tblSecuenciaClave]
           ([uIDSecuenciaClave]
           ,[cClienteConmutadorCodigo]
           ,[iSecuencia]
           ,[cClave])
     VALUES
            (CONVERT(UNIQUEIDENTIFIER,@uIDSecuenciaClave)
            ,@cClienteConmutadorCodigo
            ,@iSecuencia
            ,@cClave)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearTextoSistema].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearTextoSistema]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearTextoSistema] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearTextoSistema]
    Purpose     :   Insert a new record in [dbo].[tblTextoSistema]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/12
    Parameter   :   @vcDescripcion is optional
    Parameter   :   @cGrupo,@cCodigo,@bReservado,@uUsuarioModifica,@dFechaModificacion must not be nulls or empties
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearTextoSistema]
@cGrupo char(3),
    @cCodigo char(3),
	@vcDescripcion varchar(200)= NULL,
	@bReservado [bit],
	@uUsuarioModifica varchar(37),
    @dFechaModificacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO [dbo].[tblTextoSistema]
                   ([cGrupo]
                   ,[cCodigo]
                   ,[vcDescripcion]
                   ,[bReservado]
                   ,[uUsuarioModifica]
                   ,[dFechaModificacion])
             VALUES
                   (@cGrupo
                   ,@cCodigo
                   ,@vcDescripcion
                   ,@bReservado
                   ,CONVERT(uniqueidentifier,@uUsuarioModifica)
                   ,@dFechaModificacion)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearUsuarioDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearUsuarioDetalle]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearUsuarioDetalle] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearUsuarioDetalle]
    Purpose     :   Insert a new record in [dbo].[tblUsuarioDetalle]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/18
    Parameter   :   All parameters are not null
    Parameter   :   @uIDUsuario must exist in [dbo].[tblUsuario]
    Parameter   :   @Tipo must exist in [dbo].[tblParametro]
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    Procedure   :
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearUsuarioDetalle]
@uIDUsuario varchar(37),
    @uTipo varchar(37),
    @vcValor varchar(255),
    @dFechaModificacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if @uIDUsuario exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblUsuarioDetalle] WHERE [uIDUsuario]=@uIDUsuario)
            raiserror('The value for @uIDUsuario is not found', 15, 1)
        -- avoid duplicate values
        IF EXISTS (SELECT TOP 1 1 FROM [dbo].[tblUsuarioDetalle] WHERE [uIDUsuario]=@uIDUsuario AND [uTipo]=@uTipo AND [vcValor]=@vcValor)
            raiserror('The value its duplicated', 15, 1)
        -- check if @vcValor is empty
        IF  @vcValor ='' 
            raiserror('The parameters @vcValor should not be null or empty', 15, 1)
        -- Insert
        INSERT INTO [dbo].[tblUsuarioDetalle]
                   ([uIDUsuario]
                   ,[uTipo]
                   ,[vcValor]
                   ,[dFechaModificacion])
             VALUES
                   (CONVERT(uniqueidentifier,@uIDUsuario)
                   ,CONVERT(uniqueidentifier,@uTipo)
                   ,@vcValor
                   ,@dFechaModificacion)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTcrearUsuarioRol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTcrearUsuarioRol]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTcrearUsuarioRol] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTcrearUsuarioRol]
    Purpose     :   Insert a new record in [dbo].[tblUsuarioRol]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/26
    Parameter   :   @uIDUsuario,@uIDRol,@dFechaActivacion,@Estado must not be nulls or empties
    Parameter   :   @dFechaExpiracion is optional
    Procedure   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTcrearUsuarioRol]
@uIDUsuario varchar(37),
    @uIDRol varchar(37),
    @dFechaActivacion datetime,
    @dFechaExpiracion datetime=Null,
    @cEstado char(16)
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO [dbo].[tblUsuarioRol]
                   ([uIDUsuario]
                   ,[uIDRol]
                   ,[dFechaActivacion]
                   ,[dFechaExpiracion]
                   ,[cEstado])
             VALUES
                   (CONVERT(uniqueidentifier,@uIDUsuario)
                   ,CONVERT(uniqueidentifier,@uIDRol)
                   ,@dFechaActivacion
                   ,@dFechaExpiracion
                   ,@cEstado)
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTeliminarBroadcast].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTeliminarBroadcast]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTeliminarBroadcast] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTeliminarBroadcast]
    Purpose     :   Change status Broadcast to "ELIMINADO LOGICO" in in [dbo].[tblBroadcast]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/13
    Parameter   :   Parameter @cIDBroadcast,@uUsuarioModifica,@dFechaModificacion shoult be not null or empty
    Parameter   :   If Parameter @cIDBroadcast is not found raise an error
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    **********************  Revision Details    **********************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTeliminarBroadcast]
@cIDBroadcast char(3),
	@uUsuarioModifica varchar(37),
    @dFechaModificacion datetime 
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if Broadcast exist
        DECLARE @found  CHAR(3)
        SELECT @found = @cIDBroadcast FROM [dbo].[tblBroadcast] WHERE [cIDBroadcast]=@cIDBroadcast
        IF @found IS NULL
            raiserror('The value for @@cIDBroadcast is not found', 15, 1)
        --Update
        UPDATE [dbo].[tblBroadcast]
           SET [cEstado] = 'ELIMINADO LOGICO'
              ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
              ,[dFechaModificacion] = @dFechaModificacion
         WHERE [cIDBroadcast]=@cIDBroadcast
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTeliminarBroadcastCliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTeliminarBroadcastCliente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTeliminarBroadcastCliente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTeliminarBroadcastCliente]
    Purpose     :   delete a record in [dbo].[tblBroadcastCliente]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/14
    Parameter   :   @cIDBroadcast,@cClienteConmutadorCodigo must not be nulls or empties
    Procedure   :   
    *****************************   Revision Details    ***************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------ 
*/

ALTER PROCEDURE [dbo].[uspNSTeliminarBroadcastCliente]
@cIDBroadcast char(3), 
	@cClienteConmutadorCodigo char(12)
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        -- check if @cIDBroadcast is empty
        IF  @cIDBroadcast ='' 
            raiserror('The parameters @cIDBroadcast should not be nulls or empties', 15, 1)
        -- check if @cClienteConmutadorCodigo is empty
        IF  @cClienteConmutadorCodigo ='' 
            raiserror('The parameters @cClienteConmutadorCodigo should not be nulls or empties', 15, 1)

    DELETE FROM [dbo].[tblBroadcastCliente]
          WHERE [cIDBroadcast]=@cIDBroadcast AND
                [cClienteConmutadorCodigo]= @cClienteConmutadorCodigo
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTeliminarCalendario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTeliminarCalendario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTeliminarCalendario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTeliminarCalendario]
    Purpose     :   delete a record from in [dbo].[tblCalendario]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/28
    Parameter   :   all Parameters must not be null
    Procedure   :   
    **********************  Revision Details    **********************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
   
*/

ALTER PROCEDURE [dbo].[uspNSTeliminarCalendario]
@vcIDCalendario varchar(20),
    @cTipo varchar(37),
    @sdFecha smalldatetime,
    @uUsuarioModifica varchar(37),
    @dFechaModificacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if calendar exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblCalendario] WHERE [vcIDCalendario]=@vcIDCalendario AND [cTipo]=@cTipo AND [sdFecha]=@sdFecha)
            raiserror('The calendar is not found', 15, 1)
        --Delete
        DELETE FROM [dbo].[tblCalendario]
              WHERE [vcIDCalendario]=@vcIDCalendario AND [cTipo]=@cTipo AND [sdFecha]=@sdFecha
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTeliminarCliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTeliminarCliente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTeliminarCliente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTeliminarCliente]
    Purpose     :   Change status Clientes to "ELIMINADO LOGICO" in [dbo].[tblClienteConmutador]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/09/30
    Parameter   :   Parameter cClienteConmutadorCodigo shoult be not null
    Parameter   :   Parameter cClienteConmutadorCodigo shoult be not empty
    Parameter   :   If Parameter cClienteConmutadorCodigo is not found raise an error
    Procedure   :   
    **********************  Revision Details    **********************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTeliminarCliente]
@cClienteConmutadorCodigo CHAR(12) 
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        DECLARE @found  CHAR(12)
        SELECT @found = [cClienteConmutadorCodigo]
        FROM [dbo].[tblClienteConmutador] 
        WHERE [cClienteConmutadorCodigo]=@cClienteConmutadorCodigo 
        IF @cClienteConmutadorCodigo is null OR @cClienteConmutadorCodigo =''
            raiserror('The value for @cClienteConmutadorCodigo should not be null or empty', 15, 1)
        IF @found IS NULL
            raiserror('The value for @cClienteConmutadorCodigo is not found', 15, 1)
        UPDATE [dbo].[tblClienteConmutador]
        SET [cEstado]='ELIMINADO LOGICO'
        WHERE [cClienteConmutadorCodigo]=@cClienteConmutadorCodigo

    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTeliminarFormulario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTeliminarFormulario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTeliminarFormulario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTeliminarFormulario]
    Purpose     :   Change status Formulario to "ELIMINADO LOGICO" in in [dbo].[tblFormulario]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/14
    Parameter   :   Parameter @cCodigoFormulario ,@uUsuarioModifica,@dFechaModificacion shoult be not null or empty
    Parameter   :   If Parameter @cCodigoFormulario  is not found raise an error
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    **********************  Revision Details    **********************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTeliminarFormulario]
@cCodigoFormulario char(10),
	@uUsuarioModifica varchar(37),
    @dFechaModificacion datetime 
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if Formulario exist
        IF NOT EXISTS (SELECT 1 FROM [dbo].[tblFormulario] WHERE [cCodigoFormulario]=@cCodigoFormulario)
            raiserror('The value for @cCodigoFormulario is not found', 15, 1)
        --Update
        UPDATE [dbo].[tblFormulario]
           SET [cEstado] = 'ELIMINADO LOGICO'
              ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
              ,[dFechaModificacion] = @dFechaModificacion
         WHERE [cCodigoFormulario]=@cCodigoFormulario
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTeliminarMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTeliminarMenu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTeliminarMenu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTeliminarMenu]
    Purpose     :   Change Menu status to "ELIMINADO LOGICO" in in [dbo].[tblMenu]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/14
    Parameter   :   Parameter @cCodigo ,@uUsuarioModifica,@dFechaModificacion shoult be not null or empty
    Parameter   :   If Parameter @cCodigo is not found raise an error
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    **********************  Revision Details    **********************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTeliminarMenu]
@cCodigo char(18),
	@uUsuarioModifica varchar(37),
    @dFechaModificacion datetime 
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if Menu exist
        IF NOT EXISTS (SELECT 1 FROM [dbo].[tblMenu] WHERE [cCodigo]=@cCodigo)
            raiserror('The value for @cCodigo is not found', 15, 1)
        --Update
        UPDATE [dbo].[tblMenu]
           SET [cEstado] = 'ELIMINADO LOGICO'
              ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
              ,[dFechaModificacion] = @dFechaModificacion
         WHERE [cCodigo]=@cCodigo
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTeliminarParametro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTeliminarParametro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTeliminarParametro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTeliminarParametro]
    Purpose     :   Delete a record in [dbo].[tblParametro]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/01
    Parameter   :   Parameter @uIDParametro shoult be not null or empty
    Parameter   :   If Parameter uIDParametro is not found raise an error
    Procedure   :   If [bReservado]=1 Raise an error
    **********************  Revision Details    **********************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTeliminarParametro]
@uIDParametro varchar(37) 
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        DECLARE @bReservado bit=Null
        --Check if parametro exist
        SELECT @bReservado = [bReservado] FROM [dbo].[tblParametro] WHERE [uIDParametro]=CONVERT(UNIQUEIDENTIFIER,@uIDParametro)
        IF @bReservado IS NULL
            raiserror('The value for @uIDParametro is not found', 15, 1)
        --Check if [bReservado]=1
        IF @bReservado=1
            raiserror('The Parametro can not be changed or deleted', 15, 1)
        DELETE FROM [dbo].[tblParametro]
                WHERE [uIDParametro]=@uIDParametro


    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTeliminarPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTeliminarPerfil]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTeliminarPerfil] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************Creation Details**********************
    Stored Procedure Name : [dbo].[uspNSTeliminarPerfil]
    Purpose     :   delete a record for [dbo].[tblPerfil]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/26
    Parameter   :   @uIDRol ,@cCodigo  hoult be not nulls or empties
    Procedure   :
    *****************************Revision Details*****************************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTeliminarPerfil]
@uIDRol varchar(37),
    @cCodigo char(18)
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if perfil exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].tblPerfil WHERE [uIDRol]=@uIDRol AND [cCodigo]=@cCodigo)
            raiserror('perfil is not found', 15, 1)
        DELETE FROM [dbo].[tblPerfil]
              WHERE 
                    [uIDRol]=ISNULL(@uIDRol,[uIDRol]) AND 
                    [cCodigo]=ISNULL(@cCodigo,[cCodigo])

     COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTeliminarRol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTeliminarRol]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTeliminarRol] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTeliminarRol]
    Purpose     :   Change Rol status to "ELIMINADO LOGICO" in in [dbo].[tblRol]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/26
    Parameter   :   Parameter @uIDRol,@uUsuarioModifica,@dFechaModificacion shoult be not null or empty
    Parameter   :   If Parameter @uIDRol is not found raise an error
    Parameter   :   @uUsuarioModifica must be Current User
    Parameter   :   @dFechaModificacion must be NonStop Server current time
    **********************  Revision Details    **********************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTeliminarRol]
@uIDRol varchar(37),
	@uUsuarioModifica varchar(37),
    @dFechaModificacion datetime
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if Rol exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblRol] WHERE [uIDRol]=@uIDRol)
            raiserror('The value for @uIDRol is not found', 15, 1)
        --Update
        UPDATE [dbo].[tblRol]
           SET 
              [cEstado] = 'ELIMINADO LOGICO'
              ,[uUsuarioModifica] = CONVERT(uniqueidentifier,@uUsuarioModifica)
              ,[dFechaModificacion] = @dFechaModificacion
         WHERE [uIDRol]=@uIDRol
    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTeliminarTextoSistema].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTeliminarTextoSistema]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTeliminarTextoSistema] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTeliminarTextoSistema]
    Purpose     :   Delete a record in [dbo].[tblTextoSistema]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/12
    Parameter   :   @cGrupo,@cCodigo shoult be not null or empty
    Procedure   :   If [bReservado]=1 Raise an error
    **********************  Revision Details    **********************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTeliminarTextoSistema]
@cGrupo char(3),
    @cCodigo char(3)
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        DECLARE @bReservado bit=Null
        --Check if parametro exist
        SELECT Reservado = [bReservado] FROM [dbo].[tblTextoSistema] WHERE [cGrupo]=@cGrupo AND [cCodigo]= @cCodigo
        IF @bReservado IS NULL
            raiserror('The value TextoSistema is not found', 15, 1)
        --Check if [bReservado]=1
        IF @bReservado=1
            raiserror('The TextoSistema can not be changed or deleted', 15, 1)

        DELETE FROM [dbo].[tblTextoSistema]
            WHERE [cGrupo]=@cGrupo AND [cCodigo]= @cCodigo

    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO

GO
--SqlScripter----[dbo].[uspNSTeliminarUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[uspNSTeliminarUsuario]') IS NULL EXEC('CREATE PROCEDURE [dbo].[uspNSTeliminarUsuario] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
    **********************  Creation Details    **********************
    Stored Procedure Name : [dbo].[uspNSTeliminarUsuario]
    Purpose     :   Change status Usuario to "ELIMINADO LOGICO" in [dbo].[tblUsuario]
    Author      :   Len Drackar
    Modified by :    
    Created On  :   2021/10/18
    Parameter   :   Parameter @uIDUsuario shoult be not null
    Parameter   :   If Parameter @uIDUsuario is not found raise an error
    Procedure   :   
    **********************  Revision Details    **********************
    Project     :    Reemplazo NonStop SQL
    Revision No. Changed On  Changed By  Change Description
    ------------ ----------  ----------  ------------------
    
*/

ALTER PROCEDURE [dbo].[uspNSTeliminarUsuario]
@uIDUsuario varchar(37)
AS
SET NOCOUNT ON
BEGIN TRY
    BEGIN TRANSACTION
        --Check if @uIDUsuario exist
        IF NOT EXISTS (SELECT TOP 1 1 FROM [dbo].[tblUsuario]WHERE [uIDUsuario]=@uIDUsuario)
            raiserror('The value for uIDUsuario is not found', 15, 1)
        UPDATE [dbo].[tblUsuario]
        SET [cEstado]='ELIMINADO LOGICO'
        WHERE [uIDUsuario]=@uIDUsuario

    COMMIT TRANSACTION
END TRY
--Error Control
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT   
        ERROR_NUMBER()      AS 'ERROR_NUMBER',
        ERROR_STATE()       AS 'ERROR_STATE',
        ERROR_SEVERITY()    AS 'ERROR_SEVERITY',
        ERROR_LINE()        AS 'ERROR_LINE',
        ERROR_PROCEDURE()   AS 'ERROR_PROCEDURE',
        ERROR_MESSAGE()     AS 'ERROR_MESSAGE';
    SET NOCOUNT OFF
END CATCH
GO
