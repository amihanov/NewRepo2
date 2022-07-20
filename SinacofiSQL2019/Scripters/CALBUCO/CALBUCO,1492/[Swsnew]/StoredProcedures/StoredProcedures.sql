
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
