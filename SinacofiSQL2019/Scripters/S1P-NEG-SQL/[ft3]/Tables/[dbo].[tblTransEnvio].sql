SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTransEnvio](
	[vcFechaEnvio] [varchar](8) NOT NULL,
	[vcHoraEnvio] [varchar](6) NOT NULL,
	[vcUsuarioEnvio] [varchar](15) NOT NULL,
	[iRegistrosEnviados] [int] NOT NULL,
	[vcCodigoInstitucionOrigen] [varchar](4) NOT NULL,
	[vcCodigoInstitucionDestino] [varchar](4) NOT NULL,
	[vcCodigoCasilla] [varchar](8) NOT NULL,
	[vcCodigoTipoArchivo] [varchar](6) NOT NULL,
	[vcNombreArchivo] [varchar](50) NOT NULL,
	[vcNombreArchivoOriginal] [varchar](255) NOT NULL,
	[vcEstadoEnvio] [varchar](2) NOT NULL,
	[vcUsuarioRescate] [varchar](15) NULL,
	[vcFechaRescate] [varchar](8) NULL,
	[vcHoraRescate] [varchar](6) NULL,
	[vcEstadoRescate] [varchar](2) NULL,
	[vcTicket] [varchar](9) NULL
)
ON [PRIMARY]
