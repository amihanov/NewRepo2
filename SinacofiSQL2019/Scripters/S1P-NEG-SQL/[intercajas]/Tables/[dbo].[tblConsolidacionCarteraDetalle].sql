SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblConsolidacionCarteraDetalle](
	[nIdConsolidacionDetalle] [numeric](18, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[nIdCajaOrigen] [numeric](4, 0) NOT NULL,
	[nIdCajaDestino] [numeric](4, 0) NOT NULL,
	[vcNumPagare] [nvarchar](15) NOT NULL,
	[vcRutEmpresa] [nvarchar](10) NOT NULL,
	[vcIdentificadorDeudor] [nvarchar](15) NOT NULL,
	[tIdTipoIdentificador] [tinyint] NOT NULL,
	[vcNombreDeudor] [nvarchar](80) NOT NULL,
	[tIdTipoAfiliado] [tinyint] NOT NULL,
	[vcRutAval] [nvarchar](15) NULL,
	[cSujetoDescuento] [nchar](1) NULL,
	[cIdentificador] [nchar](1) NULL,
	[nMontoOferta] [numeric](15, 0) NULL,
	[nMontoFinalCompra] [numeric](15, 0) NULL,
	[vcFechaCompra] [nvarchar](8) NULL,
	[vcFechaImpago] [varchar](8) NULL,
	[nSaldoCapital] [numeric](15, 0) NULL,
	[dFechaPrimerImpago] [date] NULL,
	[vcFechaColocacion] [nvarchar](8) NULL
)
ON [PRIMARY]
