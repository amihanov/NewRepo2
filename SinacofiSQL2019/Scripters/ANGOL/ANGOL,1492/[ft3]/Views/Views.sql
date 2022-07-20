
GO
--SqlScripter----[dbo].[descriptor].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[descriptor]') IS NULL EXEC('CREATE VIEW [dbo].[descriptor] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[descriptor]
AS
SELECT * FROM tbl_desc WHERE cod_desc IN ('D60')
GO

GO
--SqlScripter----[dbo].[estructura].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[estructura]') IS NULL EXEC('CREATE VIEW [dbo].[estructura] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[estructura]
AS
SELECT * FROM tbl_estr WHERE nom_msg IN ('D60')
GO

GO
--SqlScripter----[dbo].[view_pasoTbl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[view_pasoTbl]') IS NULL EXEC('CREATE VIEW [dbo].[view_pasoTbl] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[view_pasoTbl]
AS 
select * from tbl_estr where cod_msg='798'
GO

GO
--SqlScripter----[dbo].[vista_e23].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vista_e23]') IS NULL EXEC('CREATE VIEW [dbo].[vista_e23] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vista_e23]
AS
SELECT * FROM tbl_estr WHERE cod_msg='724';
GO

GO
--SqlScripter----[dbo].[vw_paso11].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_paso11]') IS NULL EXEC('CREATE VIEW [dbo].[vw_paso11] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_paso11]
AS
select * from tbl_tarc where fec_rece >='2017-06-06 11:07:01.173' and fec_rece <='2017-06-06 11:56:30.883'
GO
