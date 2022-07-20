
GO
--SqlScripter----[dbo].[DF_DuplicadorJobs_FechaCreacion].sql
GO
ALTER TABLE [dbo].[DuplicadorJob] ADD CONSTRAINT [DF_DuplicadorJobs_FechaCreacion] DEFAULT (getdate()) FOR [FechaCreacion]
GO
--SqlScripter----[dbo].[DF_DuplicadorMensaje_FechaCreacion].sql
GO
ALTER TABLE [dbo].[DuplicadorMensaje] ADD CONSTRAINT [DF_DuplicadorMensaje_FechaCreacion] DEFAULT (getdate()) FOR [FechaCreacion]
GO
--SqlScripter----[dbo].[CURRENT_TIMESTAMP_POC].sql
GO
ALTER TABLE [dbo].[TBJJNL01A] ADD CONSTRAINT [CURRENT_TIMESTAMP_POC] DEFAULT (getdate()) FOR [CREATED_AT]
GO
--SqlScripter----[dbo].[DF_tblMensaje_dCreatedAt].sql
GO
ALTER TABLE [dbo].[tblMensaje_DU] ADD CONSTRAINT [DF_tblMensaje_dCreatedAt] DEFAULT (getdate()) FOR [dCreatedAt]
GO
--SqlScripter----[dbo].[DF_tblParametro_dCreatedAt].sql
GO
ALTER TABLE [dbo].[tblParametro_DU] ADD CONSTRAINT [DF_tblParametro_dCreatedAt] DEFAULT (getdate()) FOR [dCreatedAt]