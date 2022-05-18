SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[archivo](
	[Id] [int] IDENTITY(1, 1),
	[idEmpresa] [int] NOT NULL,
	[rutContribuyente] [bigint] NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[fecha] [datetime] NULL,
	[codRespuesta] [float] NULL,
	[fec_carpeta] [bigint] NOT NULL,
	[data] [ntext] NULL
)
ON [PRIMARY]
