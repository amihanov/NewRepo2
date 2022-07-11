SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblDeudaDetalle](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[vcIdentificadorDeudor] [nvarchar](15) NOT NULL,
	[tIdTipoIdentificador] [tinyint] NOT NULL,
	[vcNumPagare] [nvarchar](15) NOT NULL,
	[tIdTipoAfiliado] [tinyint] NOT NULL,
	[vcFechaColocacion] [nvarchar](8) NOT NULL,
	[vcFechaPrimerImpago] [nvarchar](8) NOT NULL,
	[nCapitalInicial] [numeric](15, 0) NOT NULL,
	[nSaldoCapital] [numeric](15, 0) NOT NULL,
	[vcRutAval_1] [nvarchar](10) NULL,
	[vcRutAval_2] [nvarchar](10) NULL,
	[vcRutAval_3] [nvarchar](10) NULL,
	[vcTipoDeuda] [nvarchar](1) NOT NULL,
	[nMontoCobrar] [numeric](15, 0) NULL,
	[nMontoOfertaColocacion] [numeric](20, 0) NULL,
	[vcEmplanillado] [nvarchar](2) NOT NULL
)
ON [PRIMARY]
