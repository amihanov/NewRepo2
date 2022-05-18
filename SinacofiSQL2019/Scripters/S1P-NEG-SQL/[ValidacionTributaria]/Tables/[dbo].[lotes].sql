SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lotes](
	[id] [int] IDENTITY(1, 1),
	[idEmpresa] [nvarchar](255) NULL,
	[estado] [tinyint] NULL,
	[fecha_actualizacion] [datetime] NULL,
	[idUsuario] [bigint] NULL,
	[nombreCarpeta] [varchar](255) NULL,
	[fec_creacion] [datetime] NULL,
	[data] [ntext] NULL
)
ON [PRIMARY]
