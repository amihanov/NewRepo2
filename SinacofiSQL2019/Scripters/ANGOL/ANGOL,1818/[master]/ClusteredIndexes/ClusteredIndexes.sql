
GO
--SqlScripter----[dbo].[__MigrationHistory].[PK_dbo.__MigrationHistory].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[__MigrationHistory] ADD CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED (
	[MigrationId] ASC,
	[ContextKey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetRoles].[PK_dbo.AspNetRoles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[AspNetRoles] ADD CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED (
	[Id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetUserClaims].[PK_dbo.AspNetUserClaims].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[AspNetUserClaims] ADD CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED (
	[Id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetUserLogins].[PK_dbo.AspNetUserLogins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[AspNetUserLogins] ADD CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED (
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetUserRoles].[PK_dbo.AspNetUserRoles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED (
	[UserId] ASC,
	[RoleId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetUsers].[PK_dbo.AspNetUsers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[AspNetUsers] ADD CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED (
	[Id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[Atributoes].[PK_dbo.Atributoes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[Atributoes] ADD CONSTRAINT [PK_dbo.Atributoes] PRIMARY KEY CLUSTERED (
	[AtributoID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[Categorias].[PK_dbo.Categorias].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[Categorias] ADD CONSTRAINT [PK_dbo.Categorias] PRIMARY KEY CLUSTERED (
	[CategoriaID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[PiezaAtributoes].[PK_dbo.PiezaAtributoes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[PiezaAtributoes] ADD CONSTRAINT [PK_dbo.PiezaAtributoes] PRIMARY KEY CLUSTERED (
	[PiezaAtributoID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[PiezaCategorias].[PK_dbo.PiezaCategorias].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[PiezaCategorias] ADD CONSTRAINT [PK_dbo.PiezaCategorias] PRIMARY KEY CLUSTERED (
	[PiezaCategoriaID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[Piezas].[PK_dbo.Piezas].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[Piezas] ADD CONSTRAINT [PK_dbo.Piezas] PRIMARY KEY CLUSTERED (
	[PiezaID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[Relacions].[PK_dbo.Relacions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[Relacions] ADD CONSTRAINT [PK_dbo.Relacions] PRIMARY KEY CLUSTERED (
	[RelacionID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[RoleViewModels].[PK_dbo.RoleViewModels].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[RoleViewModels] ADD CONSTRAINT [PK_dbo.RoleViewModels] PRIMARY KEY CLUSTERED (
	[Id] ASC
) ON [PRIMARY]
