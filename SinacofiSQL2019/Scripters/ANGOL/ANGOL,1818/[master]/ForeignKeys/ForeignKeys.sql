
GO
--SqlScripter----[dbo].[AspNetUserClaims].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId].sql
GO
ALTER TABLE [dbo].[AspNetUserClaims] WITH NOCHECK ADD CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] WITH CHECK CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
--SqlScripter----[dbo].[AspNetUserLogins].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId].sql
GO
ALTER TABLE [dbo].[AspNetUserLogins] WITH NOCHECK ADD CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] WITH CHECK CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
--SqlScripter----[dbo].[AspNetUserRoles].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId].sql
GO
ALTER TABLE [dbo].[AspNetUserRoles] WITH NOCHECK ADD CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY ([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] WITH CHECK CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
--SqlScripter----[dbo].[AspNetUserRoles].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId].sql
GO
ALTER TABLE [dbo].[AspNetUserRoles] WITH NOCHECK ADD CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] WITH CHECK CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
--SqlScripter----[dbo].[PiezaAtributoes].[FK_dbo.PiezaAtributoes_dbo.Atributoes_AtributoID].sql
GO
ALTER TABLE [dbo].[PiezaAtributoes] WITH NOCHECK ADD CONSTRAINT [FK_dbo.PiezaAtributoes_dbo.Atributoes_AtributoID] FOREIGN KEY ([AtributoID])
REFERENCES [dbo].[Atributoes] ([AtributoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PiezaAtributoes] WITH CHECK CHECK CONSTRAINT [FK_dbo.PiezaAtributoes_dbo.Atributoes_AtributoID]
GO
--SqlScripter----[dbo].[PiezaAtributoes].[FK_dbo.PiezaAtributoes_dbo.Piezas_PiezaID].sql
GO
ALTER TABLE [dbo].[PiezaAtributoes] WITH NOCHECK ADD CONSTRAINT [FK_dbo.PiezaAtributoes_dbo.Piezas_PiezaID] FOREIGN KEY ([PiezaID])
REFERENCES [dbo].[Piezas] ([PiezaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PiezaAtributoes] WITH CHECK CHECK CONSTRAINT [FK_dbo.PiezaAtributoes_dbo.Piezas_PiezaID]
GO
--SqlScripter----[dbo].[PiezaCategorias].[FK_dbo.PiezaCategorias_dbo.Categorias_CategoriaID].sql
GO
ALTER TABLE [dbo].[PiezaCategorias] WITH NOCHECK ADD CONSTRAINT [FK_dbo.PiezaCategorias_dbo.Categorias_CategoriaID] FOREIGN KEY ([CategoriaID])
REFERENCES [dbo].[Categorias] ([CategoriaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PiezaCategorias] WITH CHECK CHECK CONSTRAINT [FK_dbo.PiezaCategorias_dbo.Categorias_CategoriaID]
GO
--SqlScripter----[dbo].[PiezaCategorias].[FK_dbo.PiezaCategorias_dbo.Piezas_PiezaID].sql
GO
ALTER TABLE [dbo].[PiezaCategorias] WITH NOCHECK ADD CONSTRAINT [FK_dbo.PiezaCategorias_dbo.Piezas_PiezaID] FOREIGN KEY ([PiezaID])
REFERENCES [dbo].[Piezas] ([PiezaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PiezaCategorias] WITH CHECK CHECK CONSTRAINT [FK_dbo.PiezaCategorias_dbo.Piezas_PiezaID]
GO
--SqlScripter----[dbo].[Relacions].[FK_dbo.Relacions_dbo.Piezas_PiezaID].sql
GO
ALTER TABLE [dbo].[Relacions] WITH NOCHECK ADD CONSTRAINT [FK_dbo.Relacions_dbo.Piezas_PiezaID] FOREIGN KEY ([PiezaID])
REFERENCES [dbo].[Piezas] ([PiezaID])
GO
ALTER TABLE [dbo].[Relacions] WITH CHECK CHECK CONSTRAINT [FK_dbo.Relacions_dbo.Piezas_PiezaID]
GO
--SqlScripter----[dbo].[Relacions].[FK_dbo.Relacions_dbo.Piezas_PiezaPosteriorID].sql
GO
ALTER TABLE [dbo].[Relacions] WITH NOCHECK ADD CONSTRAINT [FK_dbo.Relacions_dbo.Piezas_PiezaPosteriorID] FOREIGN KEY ([PiezaPosteriorID])
REFERENCES [dbo].[Piezas] ([PiezaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Relacions] WITH CHECK CHECK CONSTRAINT [FK_dbo.Relacions_dbo.Piezas_PiezaPosteriorID]