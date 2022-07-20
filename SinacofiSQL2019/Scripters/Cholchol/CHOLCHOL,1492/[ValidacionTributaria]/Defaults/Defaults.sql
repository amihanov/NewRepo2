
GO
--SqlScripter----[dbo].[DF__actividad__fecCr__2FBBA29F].sql
GO
ALTER TABLE [dbo].[actividadContr] ADD CONSTRAINT [DF__actividad__fecCr__2FBBA29F] DEFAULT (getdate()) FOR [fecCreacion]
GO
--SqlScripter----[dbo].[DF__autorizaf__fecCr__30AFC6D8].sql
GO
ALTER TABLE [dbo].[autorizaform] ADD CONSTRAINT [DF__autorizaf__fecCr__30AFC6D8] DEFAULT (getdate()) FOR [fecCreacion]
GO
--SqlScripter----[dbo].[DF__contribuy__autor__0CFC7647].sql
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [DF__contribuy__autor__0CFC7647] DEFAULT (NULL) FOR [autorizacionMonedaExtranjera]
GO
--SqlScripter----[dbo].[DF__contribuy__comun__0A20099C].sql
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [DF__contribuy__comun__0A20099C] DEFAULT (NULL) FOR [comuna]
GO
--SqlScripter----[dbo].[DF__contribuy__corre__0FD8E2F2].sql
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [DF__contribuy__corre__0FD8E2F2] DEFAULT (NULL) FOR [correo]
GO
--SqlScripter----[dbo].[DF__contribuy__direc__092BE563].sql
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [DF__contribuy__direc__092BE563] DEFAULT ('') FOR [direccion]
GO
--SqlScripter----[dbo].[DF__contribuy__empre__0DF09A80].sql
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [DF__contribuy__empre__0DF09A80] DEFAULT (NULL) FOR [empresaPropyme]
GO
--SqlScripter----[dbo].[DF__contribuy__fecAc__0C08520E].sql
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [DF__contribuy__fecAc__0C08520E] DEFAULT (NULL) FOR [fecActualizacion]
GO
--SqlScripter----[dbo].[DF__contribuy__fecCr__0B142DD5].sql
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [DF__contribuy__fecCr__0B142DD5] DEFAULT (NULL) FOR [fecCreacion]
GO
--SqlScripter----[dbo].[DF__contribuy__mater__064F78B8].sql
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [DF__contribuy__mater__064F78B8] DEFAULT (NULL) FOR [materno]
GO
--SqlScripter----[dbo].[DF__contribuy__nombr__07439CF1].sql
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [DF__contribuy__nombr__07439CF1] DEFAULT (NULL) FOR [nombres]
GO
--SqlScripter----[dbo].[DF__contribuy__pater__055B547F].sql
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [DF__contribuy__pater__055B547F] DEFAULT (NULL) FOR [paterno]
GO
--SqlScripter----[dbo].[DF__contribuy__rutCo__04673046].sql
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [DF__contribuy__rutCo__04673046] DEFAULT ('0') FOR [rutContribuyente]
GO
--SqlScripter----[dbo].[DF__contribuy__telef__0EE4BEB9].sql
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [DF__contribuy__telef__0EE4BEB9] DEFAULT (NULL) FOR [telefono]
GO
--SqlScripter----[dbo].[DF__contribuye__giro__0837C12A].sql
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [DF__contribuye__giro__0837C12A] DEFAULT (NULL) FOR [giro]