
GO
--SqlScripter----[dbo].[DF__AspNetRol__Discr__4D94879B].sql
GO
ALTER TABLE [dbo].[AspNetRoles] ADD CONSTRAINT [DF__AspNetRol__Discr__4D94879B] DEFAULT ('') FOR [Discriminator]
GO
--SqlScripter----[dbo].[DF__AspNetUse__Vigen__4E88ABD4].sql
GO
ALTER TABLE [dbo].[AspNetUsers] ADD CONSTRAINT [DF__AspNetUse__Vigen__4E88ABD4] DEFAULT (0) FOR [Vigencia]