
GO
--SqlScripter----[dbo].[AspNetRoles].[RoleNameIndex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles] (
	[Name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetUserClaims].[IX_UserId].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims] (
	[UserId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetUserLogins].[IX_UserId].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins] (
	[UserId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetUserRoles].[IX_RoleId].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles] (
	[RoleId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetUserRoles].[IX_UserId].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles] (
	[UserId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetUsers].[UserNameIndex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers] (
	[UserName] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[PiezaAtributoes].[IX_AtributoID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_AtributoID] ON [dbo].[PiezaAtributoes] (
	[AtributoID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[PiezaAtributoes].[IX_PiezaID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_PiezaID] ON [dbo].[PiezaAtributoes] (
	[PiezaID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[PiezaCategorias].[IX_CategoriaID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_CategoriaID] ON [dbo].[PiezaCategorias] (
	[CategoriaID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[PiezaCategorias].[IX_PiezaID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_PiezaID] ON [dbo].[PiezaCategorias] (
	[PiezaID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[Relacions].[IX_PiezaID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_PiezaID] ON [dbo].[Relacions] (
	[PiezaID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[Relacions].[IX_PiezaPosteriorID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_PiezaPosteriorID] ON [dbo].[Relacions] (
	[PiezaPosteriorID] ASC
) ON [PRIMARY]
