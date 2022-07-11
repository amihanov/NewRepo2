SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[contribuyente](
	[rutContribuyente] [int] NOT NULL,
	[nContribuyente] [varchar](1) NOT NULL,
	[razonSocial] [varchar](200) NOT NULL,
	[paterno] [varchar](40) NULL,
	[materno] [varchar](40) NULL,
	[nombres] [varchar](60) NULL,
	[giro] [varchar](200) NULL,
	[direccion] [varchar](200) NULL,
	[comuna] [varchar](100) NULL,
	[fecCreacion] [date] NULL,
	[fecActualizacion] [date] NULL,
	[autorizacionMonedaExtranjera] [tinyint] NULL,
	[empresaPropyme] [tinyint] NULL,
	[telefono] [bigint] NULL,
	[correo] [varchar](80) NULL,
	[fechaInicioActividades] [nvarchar](30) NULL,
	[observacion] [nvarchar](30) NULL,
	[categoria] [nvarchar](30) NULL
)
ON [PRIMARY]
