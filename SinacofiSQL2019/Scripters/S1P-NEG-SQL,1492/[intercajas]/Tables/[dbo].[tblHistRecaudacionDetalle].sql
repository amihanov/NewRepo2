SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblHistRecaudacionDetalle](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaRegistro] [datetime] NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[nIdCajaOrigen] [numeric](4, 0) NOT NULL,
	[vcNumPagare] [nvarchar](15) NOT NULL,
	[vcRutEmpresa] [nvarchar](10) NOT NULL,
	[vcIdentificadorDeudor] [nvarchar](10) NOT NULL,
	[tIdTipoIdentificador] [tinyint] NOT NULL,
	[vcNombreDeudor] [nvarchar](80) NOT NULL,
	[tIdTipoAfiliado] [tinyint] NOT NULL,
	[vcRutAval] [nvarchar](15) NULL,
	[cSujetoDescuento] [nchar](1) NULL,
	[nMontoCobrar] [numeric](15, 0) NOT NULL,
	[nMontoPagado] [numeric](15, 0) NOT NULL,
	[vcFechaPago] [nvarchar](8) NOT NULL
)
ON [PRIMARY]
