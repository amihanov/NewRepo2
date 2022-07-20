
GO
--SqlScripter----[dbo].[__MigrationHistory].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](MAX) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetRoles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Discriminator] [nvarchar](128) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetUserClaims].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1, 1),
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](MAX) NULL,
	[ClaimValue] [nvarchar](MAX) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetUserLogins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetUserRoles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[AspNetUsers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](MAX) NULL,
	[SecurityStamp] [nvarchar](MAX) NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Nombre] [nvarchar](200) NULL,
	[Vigencia] [bit] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[Atributoes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Atributoes](
	[AtributoID] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](MAX) NULL,
	[Tipo] [int] NOT NULL,
	[Version] [int] NULL,
	[Fecha] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[Categorias].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Categorias](
	[CategoriaID] [uniqueidentifier] NOT NULL,
	[Color] [nvarchar](MAX) NULL,
	[Nombre] [nvarchar](MAX) NULL,
	[Version] [int] NULL,
	[Fecha] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[PiezaAtributoes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PiezaAtributoes](
	[PiezaAtributoID] [uniqueidentifier] NOT NULL,
	[AtributoID] [uniqueidentifier] NOT NULL,
	[PiezaID] [uniqueidentifier] NOT NULL,
	[Valor] [nvarchar](MAX) NULL,
	[Orden] [int] NOT NULL,
	[Version] [int] NULL,
	[Fecha] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[PiezaCategorias].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PiezaCategorias](
	[PiezaCategoriaID] [uniqueidentifier] NOT NULL,
	[CategoriaID] [uniqueidentifier] NOT NULL,
	[PiezaID] [uniqueidentifier] NOT NULL,
	[Version] [int] NULL,
	[Fecha] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[Piezas].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Piezas](
	[PiezaID] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](MAX) NULL,
	[Vigencia] [bit] NOT NULL,
	[Version] [int] NULL,
	[Fecha] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[PiezasTemp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PiezasTemp](
	[PiezaTempID] [uniqueidentifier] NOT NULL,
	[LlamadaPorID] [uniqueidentifier] NOT NULL,
	[Tipo] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](MAX) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[PiezasTemp2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PiezasTemp2](
	[PiezaTempID] [uniqueidentifier] NOT NULL,
	[Tipo] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](MAX) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[Relacions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Relacions](
	[RelacionID] [uniqueidentifier] NOT NULL,
	[PiezaPosteriorID] [uniqueidentifier] NOT NULL,
	[PiezaID] [uniqueidentifier] NOT NULL,
	[Version] [int] NULL,
	[Fecha] [datetime] NULL
)
ON [PRIMARY]
