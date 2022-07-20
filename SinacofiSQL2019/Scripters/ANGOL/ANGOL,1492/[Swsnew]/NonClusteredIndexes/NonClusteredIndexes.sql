
GO
--SqlScripter----[dbo].[AdminLogs].[idx_AdminLogs_LogTime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_AdminLogs_LogTime] ON [dbo].[AdminLogs] (
	[LogTime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[Entidades].[idx_Entidades_EntId].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_Entidades_EntId] ON [dbo].[Entidades] (
	[EntId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ProfileMenu].[idx_ProfileMenu_nEntId].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_ProfileMenu_nEntId] ON [dbo].[ProfileMenu] (
	[EntId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ProfileTipoTransaccion].[IX_ProfileTipoTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProfileTipoTransaccion] ON [dbo].[ProfileTipoTransaccion] (
	[ProfileCod] ASC,
	[CodTran] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[TiposTransaccion].[idx_TiposTransaccion_CodTran].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_TiposTransaccion_CodTran] ON [dbo].[TiposTransaccion] (
	[CodTran] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[Usuarios].[idx_Usuarios_UserNamed].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_Usuarios_UserNamed] ON [dbo].[Usuarios] (
	[UserName] ASC
) ON [PRIMARY]
