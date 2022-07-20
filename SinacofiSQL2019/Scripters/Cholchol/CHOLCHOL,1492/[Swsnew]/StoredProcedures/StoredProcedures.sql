
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
                WHERE ProfileCod = @UserProfile
                                                               AND EntId = @Owner


                INSERT INTO ProfileMenu (ProfileCod, EntId, MenuCod)
                SELECT  @UserProfile    ,@Owner,MenuCod
                FROM   MenuStruc WITH(NoLock)
                WHERE                 MenuCod IN (@qs)
                
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
SET QUOTED_IDENTIFIER OFF
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
--SqlScripter----[dbo].[spCsuUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
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
--SqlScripter----[dbo].[spEliminaCurrentUser].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
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
--SqlScripter----[dbo].[spInsCurrentUser].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
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
--SqlScripter----[dbo].[spInsUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
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
