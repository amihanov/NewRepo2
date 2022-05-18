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
