SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[socio](
	[rutContribuyente] [float] NOT NULL,
	[rutSocio] [float] NOT NULL,
	[fechaIncorporacion] [datetime] NULL,
	[razonSocial] [nvarchar](80) NULL
)
ON [PRIMARY]
