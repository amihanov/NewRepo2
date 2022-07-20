
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
