SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblConsolidacionDetalle](
	[nIdConsolidacionDetalle] [numeric](18, 0) NOT NULL,
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[nIdCajaOrigen] [numeric](4, 0) NOT NULL,
	[vcNumPagare] [nvarchar](15) NOT NULL,
	[vcRutEmpresa] [nvarchar](10) NOT NULL,
	[vcIdentificadorDeudor] [nvarchar](15) NOT NULL,
	[tIdTipoIdentificador] [tinyint] NOT NULL,
	[vcNombreDeudor] [nvarchar](80) NOT NULL,
	[tIdTipoAfiliado] [tinyint] NOT NULL,
	[vcRutAval] [nvarchar](15) NULL,
	[cSujetoDescuento] [nchar](1) NULL,
	[nMontoCobrar] [numeric](15, 0) NULL,
	[nMontoPagado] [numeric](15, 0) NULL,
	[vcFechaPago] [nvarchar](8) NULL,
	[vcTipoDeuda] [nvarchar](1) NULL,
	[nSaldoCapital] [numeric](30, 0) NULL,
	[dFechaPrimerImpago] [date] NULL,
	[vcFechaColocacion] [nvarchar](8) NULL,
	[nFechaAfiliacion] [numeric](8, 0) NULL,
	[nCapitalInicial] [numeric](15, 0) NULL,
	[nMontoOfertaColocacion] [numeric](15, 0) NULL
)
ON [PRIMARY]
