SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblHistAfiliadoDetalle](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaRegistro] [datetime] NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[vcIdentificadorAfiliado] [nvarchar](15) NOT NULL,
	[tIdTipoIdentificador] [tinyint] NOT NULL,
	[vcNombreAfiliado] [nvarchar](80) NOT NULL,
	[tIdTipoAfiliado] [tinyint] NOT NULL,
	[nFechaAfiliacion] [numeric](8, 0) NOT NULL,
	[vcRutEmpresa] [nvarchar](10) NOT NULL,
	[nRentaImponible] [numeric](15, 0) NOT NULL,
	[vbRentaImponible] [varbinary](50) NULL
)
ON [PRIMARY]
