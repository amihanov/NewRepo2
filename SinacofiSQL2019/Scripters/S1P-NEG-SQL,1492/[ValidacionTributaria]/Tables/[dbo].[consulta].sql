SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[consulta](
	[idCons] [int] IDENTITY(1, 1),
	[idEmpresa] [int] NULL,
	[idContrato] [int] NULL,
	[idUsuario] [int] NULL,
	[idServicio] [int] NULL,
	[fechaCons] [datetime] NULL,
	[ipUsuario] [nvarchar](20) NULL,
	[rutCons] [int] NULL,
	[parametro] [nvarchar](20) NULL,
	[codRespuesta] [int] NULL,
	[origenDato] [nvarchar](4) NULL,
	[tab] [char](3) NULL,
	[idMenu] [tinyint] NULL
)
ON [PRIMARY]
