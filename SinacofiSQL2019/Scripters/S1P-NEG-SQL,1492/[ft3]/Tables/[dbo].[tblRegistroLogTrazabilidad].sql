SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRegistroLogTrazabilidad](
	[vcFechaRegistro] [varchar](8) NOT NULL,
	[vcHoraRegistro] [varchar](6) NOT NULL,
	[iIdModulo] [int] NOT NULL,
	[iIdActividad] [int] NOT NULL,
	[vcCodigoUsuario] [varchar](15) NOT NULL,
	[vcActividad] [varchar](255) NOT NULL,
	[vcIpUsuario] [varchar](20) NOT NULL,
	[vcDetalle] [varchar](255) NOT NULL
)
ON [PRIMARY]
