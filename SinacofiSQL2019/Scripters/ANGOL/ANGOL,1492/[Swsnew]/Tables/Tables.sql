
GO
--SqlScripter----[dbo].[AdminLogs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AdminLogs](
	[ALogId] [int] IDENTITY(1, 1),
	[LogTime] [varchar](14) NULL,
	[IdSesion] [varchar](60) NULL,
	[UserName] [varchar](150) NULL,
	[UserCod] [varchar](50) NULL,
	[CodTran] [varchar](10) NULL,
	[SearchData] [varchar](255) NULL,
	[LookDetails] [int] NULL,
	[TimeResponse] [float] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[CurrentUsers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CurrentUsers](
	[UserName] [varchar](150) NOT NULL,
	[UserCod] [varchar](40) NOT NULL,
	[IdSesion] [varchar](60) NULL,
	[IPaddress] [varchar](16) NULL,
	[TimeLogin] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[Entidades].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Entidades](
	[EntId] [int] IDENTITY(1, 1),
	[NombreEntidad] [varchar](200) NULL,
	[WebDirectory] [varchar](255) NULL,
	[WebHomePage] [varchar](150) NULL,
	[UseProfiles] [int] NULL,
	[ImgDir] [varchar](50) NULL,
	[ClrBackMenu] [varchar](50) NULL,
	[ClrBackTrans] [varchar](50) NULL,
	[ClrForeTrans] [varchar](50) NULL,
	[GrafMenuHome] [varchar](50) NULL,
	[GrafGoFav] [varchar](50) NULL,
	[GrafGoUp] [varchar](50) NULL,
	[GrafGoPers] [varchar](50) NULL,
	[GrafEditPers] [varchar](50) NULL,
	[GrafAddFavs] [varchar](50) NULL,
	[GrafVolver] [varchar](50) NULL,
	[CodEntidad] [int] NULL,
	[GrafFondoTrans] [varchar](50) NULL,
	[GrafFondoMenu] [varchar](50) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[Institucion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Institucion](
	[CodInst] [char](4) NOT NULL,
	[DesInst] [varchar](25) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[MacroServicios].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[MacroServicios](
	[MacroServ] [char](2) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[AspTrans] [varchar](50) NULL,
	[Imagen] [varchar](50) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[MenuStruc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[MenuStruc](
	[MenuId] [int] IDENTITY(1, 1),
	[MenuCod] [int] NULL,
	[OwnerId] [int] NULL,
	[ParentId] [int] NULL,
	[MenuName] [varchar](150) NULL,
	[CodTran] [varchar](10) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[ProfileMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ProfileMenu](
	[ProfMenuId] [int] IDENTITY(1, 1),
	[MenuCod] [int] NULL,
	[EntId] [int] NULL,
	[ProfileCod] [varchar](50) NULL,
	[CodInst] [char](4) NOT NULL,
	[ProfileName] [varchar](150) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[Profiles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Profiles](
	[ProfileId] [int] IDENTITY(1, 1),
	[ProfileName] [varchar](150) NULL,
	[ProfileCod] [varchar](50) NULL,
	[ProfileInst] [char](4) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[ProfileTipoTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ProfileTipoTransaccion](
	[RegId] [int] IDENTITY(1, 1),
	[ProfileCod] [varchar](50) NOT NULL,
	[CodTran] [varchar](10) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sysdiagrams].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1, 1),
	[version] [int] NULL,
	[definition] [varbinary](MAX) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[TiposTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TiposTransaccion](
	[RegId] [int] IDENTITY(1, 1),
	[CodTran] [varchar](10) NULL,
	[NombreTrans] [varchar](150) NULL,
	[AspTrans] [varchar](50) NULL,
	[MacroServ] [char](2) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[UserLogs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[UserLogs](
	[ULogId] [int] IDENTITY(1, 1),
	[UserRut] [varchar](50) NULL,
	[LogTime] [varchar](14) NULL,
	[CodTran] [varchar](10) NULL,
	[ResultPage] [text] NULL,
	[QryStr] [varchar](100) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[UserMenus].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[UserMenus](
	[UmId] [int] IDENTITY(1, 1),
	[UserCod] [varchar](50) NULL,
	[EntId] [int] NULL,
	[Orden] [int] NULL,
	[MenuName] [varchar](100) NULL,
	[MenuUrl] [varchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[Usuarios].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Usuarios](
	[UserId] [int] IDENTITY(1, 1),
	[UserName] [varchar](150) NULL,
	[UserCod] [varchar](50) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[Webs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Webs](
	[WbId] [int] IDENTITY(1, 1),
	[EntId] [int] NULL,
	[WebAddress] [varchar](255) NULL
)
ON [PRIMARY]
