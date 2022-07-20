
GO
--SqlScripter----[r_macaddr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_macaddr]') IS NOT NULL EXEC('DROP RULE [dbo].[r_macaddr]')
GO
/****** Object:  Rule dbo.r_macaddr    Script Date: 12/1/2005 11:19:26 PM ******/

CREATE RULE [dbo].[r_macaddr]
AS @value like '[0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F]'
GO
