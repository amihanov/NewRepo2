
GO
--SqlScripter----[dbo].[Vloginexitoso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[Vloginexitoso]') IS NULL EXEC('CREATE VIEW [dbo].[Vloginexitoso] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[Vloginexitoso]
AS
SELECT     *
FROM         dbo.LogFailed
WHERE     (SUBSTRING(Description, 1, 5) <> '18456') AND (SUBSTRING(Description, 1, 5) <> '18452')
GO

GO
--SqlScripter----[dbo].[Vloginfiled].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[Vloginfiled]') IS NULL EXEC('CREATE VIEW [dbo].[Vloginfiled] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[Vloginfiled]
AS
SELECT     *
FROM         dbo.LogFailed
WHERE     (SUBSTRING(Description, 1, 5) = '18456') OR
                      (SUBSTRING(Description, 1, 5) = '18452')
GO

GO
--SqlScripter----[dbo].[vwLoginFailed].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vwLoginFailed]') IS NULL EXEC('CREATE VIEW [dbo].[vwLoginFailed] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vwLoginFailed]
AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1
GO
