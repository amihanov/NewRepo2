SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblIndicadorResumen](
	[iIdIndicadorResumen] [int] NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[vcTipoIndicador] [varchar](3) NOT NULL,
	[vcCriterio] [varchar](3) NOT NULL,
	[vcUbicados] [varchar](2) NOT NULL,
	[vcRecaudados] [varchar](2) NOT NULL,
	[iIdPeriodoMora] [int] NOT NULL,
	[nIdCajaOrigen] [numeric](4, 0) NOT NULL,
	[nIdCajaDestino] [numeric](4, 0) NULL,
	[cTipoDeudor] [char](1) NOT NULL,
	[nValor] [numeric](15, 0) NOT NULL
)
ON [PRIMARY]
