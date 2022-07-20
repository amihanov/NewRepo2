
GO
--SqlScripter----[dbo].[DF__AspNetRol__Discr__4F9CCB9E].sql
GO
ALTER TABLE [dbo].[AspNetRoles] ADD CONSTRAINT [DF__AspNetRol__Discr__4F9CCB9E] DEFAULT ('') FOR [Discriminator]
GO
--SqlScripter----[dbo].[DF__AspNetUse__Vigen__5090EFD7].sql
GO
ALTER TABLE [dbo].[AspNetUsers] ADD CONSTRAINT [DF__AspNetUse__Vigen__5090EFD7] DEFAULT (0) FOR [Vigencia]