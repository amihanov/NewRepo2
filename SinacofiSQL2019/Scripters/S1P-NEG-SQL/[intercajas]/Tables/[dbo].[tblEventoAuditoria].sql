SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblEventoAuditoria](
	[nIdEvento] [numeric](18, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFecha] [datetime] NOT NULL,
	[iUsuario] [int] NOT NULL,
	[vcDireccionTerminal] [nvarchar](30) NOT NULL,
	[iIdTipoEvento] [int] NOT NULL,
	[cTipoRegistro] [nchar](1) NOT NULL,
	[txDescripcion] [text] NULL
)
ON [PRIMARY]
