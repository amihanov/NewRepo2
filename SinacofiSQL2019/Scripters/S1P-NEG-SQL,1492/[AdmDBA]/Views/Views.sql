
GO
--SqlScripter----[dbo].[vw_tbl_tarc_20220319].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_tbl_tarc_20220319]') IS NULL EXEC('CREATE VIEW [dbo].[vw_tbl_tarc_20220319] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_tbl_tarc_20220319]
AS select * from ft3..tbl_tarc where fec_rece > '20211231'
GO
