
GO
--SqlScripter----[dbo].[tblAfiliadoCabecera].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblAfiliadoCabecera](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[vcNombreArchivo] [nvarchar](25) NOT NULL,
	[dFechaIng] [datetime] NOT NULL,
	[nTotalRegistros] [bigint] NULL,
	[nTotalRentaImponible] [numeric](30, 0) NULL,
	[vcLinkArchivo] [nvarchar](250) NOT NULL,
	[iRutUsuarioEnv] [int] NULL,
	[iIdEstado] [int] NULL,
	[vcLinkError] [nvarchar](250) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblAfiliadoDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblAfiliadoDetalle](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
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

GO
--SqlScripter----[dbo].[tblAfiliadoError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblAfiliadoError](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[nNumRegistro] [numeric](9, 0) NOT NULL,
	[txCodigoError] [text] NOT NULL,
	[vcRedDat] [nvarchar](250) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCarteraCompradaCabecera].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblCarteraCompradaCabecera](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[vcNombreArchivo] [varchar](25) NOT NULL,
	[dFechaIngreso] [datetime] NOT NULL,
	[nTotalRegistros] [numeric](10, 0) NULL,
	[nTotalCarterasCompradas] [numeric](30, 0) NULL,
	[vcLinkArchivo] [nvarchar](250) NOT NULL,
	[iRutUsuarioEnv] [int] NULL,
	[iIdEstado] [int] NULL,
	[vcLinkError] [nvarchar](250) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCarteraCompradaDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblCarteraCompradaDetalle](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
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
	[nMontoPagado] [numeric](15, 0) NOT NULL,
	[vcFechaPago] [nvarchar](8) NOT NULL,
	[vcTipoDeuda] [nvarchar](1) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCarteraCompradaError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblCarteraCompradaError](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[nNumRegistro] [numeric](9, 0) NOT NULL,
	[txCodigoError] [text] NOT NULL,
	[vcRedDat] [nvarchar](250) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCierreFueraPlazo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblCierreFueraPlazo](
	[iIdCierrePlazo] [int] NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[nIdInstitucion] [numeric](4, 0) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCodigoError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblCodigoError](
	[cCodigoError] [nchar](10) NOT NULL,
	[vcGlosa] [nvarchar](50) NOT NULL,
	[vcGlosaCorta] [nvarchar](10) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionCabecera].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblConsolidacionCabecera](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaIng] [datetime] NOT NULL,
	[nTotalDeudores] [numeric](10, 0) NOT NULL,
	[nTotalSaldoCapital] [numeric](30, 0) NOT NULL,
	[nTotalMontoCobrar] [numeric](30, 0) NOT NULL,
	[vcLinkNomina] [nvarchar](250) NULL,
	[cvLinkRecaudacion] [nvarchar](250) NULL,
	[iCorrelativo] [int] NOT NULL,
	[dFechaRecaud] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionCabeceraPensionado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblConsolidacionCabeceraPensionado](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaIng] [datetime] NOT NULL,
	[nTotalDeudores] [numeric](10, 0) NOT NULL,
	[nTotalSaldoCapital] [numeric](30, 0) NOT NULL,
	[nTotalMontoCobrar] [numeric](30, 0) NOT NULL,
	[vcLinkNomina] [nvarchar](250) NULL,
	[cvLinkRecaudacion] [nvarchar](250) NULL,
	[iCorrelativo] [int] NOT NULL,
	[dFechaRecaud] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionCarteraCabecera].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblConsolidacionCarteraCabecera](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaIng] [datetime] NOT NULL,
	[nNroDeudores] [numeric](10, 0) NOT NULL,
	[vcLinkPropuesta] [nvarchar](250) NULL,
	[dFechaCompraCartera] [datetime] NULL,
	[vcLinkCompraCartera] [varchar](255) NULL,
	[iCorrelativo] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionCarteraDetalle].sql
GO
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

GO
--SqlScripter----[dbo].[tblConsolidacionDetalle].sql
GO
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

GO
--SqlScripter----[dbo].[tblConsolidacionDetallePensionado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblConsolidacionDetallePensionado](
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
	[nMontoOfertaColocacion] [numeric](15, 0) NULL,
	[vcEmplanillado] [nvarchar](2) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblControlProceso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblControlProceso](
	[nIdControlProceso] [numeric](18, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaInicio] [datetime] NOT NULL,
	[dFechaFin] [datetime] NOT NULL,
	[iIdEstado] [int] NOT NULL,
	[iIdTipoControlProceso] [int] NOT NULL,
	[vcDetalle] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblDeudaCabecera].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblDeudaCabecera](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[vcNombreArchivo] [nvarchar](25) NOT NULL,
	[dFechaIng] [datetime] NOT NULL,
	[nTotalReg] [numeric](9, 0) NULL,
	[nTotalSaldoCapital] [numeric](30, 0) NULL,
	[nTotalCapitalInicial] [numeric](30, 0) NULL,
	[nTotalMontoCobrar] [numeric](30, 0) NULL,
	[vcLinkArchivo] [nvarchar](250) NOT NULL,
	[iRutUsuarioEnv] [int] NULL,
	[iIdEstado] [int] NULL,
	[vcLinkError] [nvarchar](250) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblDeudaDetalle].sql
GO
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

GO
--SqlScripter----[dbo].[tblDeudaError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblDeudaError](
	[nInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[nNumRegistro] [numeric](9, 0) NOT NULL,
	[txCodigoError] [text] NOT NULL,
	[vcRedDat] [nvarchar](250) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblEmailOperacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblEmailOperacion](
	[vcOperacion] [nvarchar](50) NOT NULL,
	[vcEmail] [text] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblEstado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblEstado](
	[iIdEstado] [int] NOT NULL,
	[vcEstado] [nvarchar](15) NOT NULL,
	[iIdTipoEstado] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblEventoAuditoria].sql
GO
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

GO
--SqlScripter----[dbo].[tblFeriado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblFeriado](
	[dFeriado] [date] NOT NULL,
	[vcDescripcion] [nvarchar](50) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblFuncionalidad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblFuncionalidad](
	[iIdFuncionalidad] [int] NOT NULL,
	[vcFuncionalidad] [nvarchar](30) NOT NULL,
	[iIdEstado] [int] NULL,
	[vcDescripcion] [nvarchar](100) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistAfiliadoDetalle].sql
GO
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

GO
--SqlScripter----[dbo].[tblHistAfiliadoError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblHistAfiliadoError](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaRegistro] [datetime] NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[nNumRegistro] [numeric](9, 0) NOT NULL,
	[txCodigoError] [text] NOT NULL,
	[vcRedDat] [nvarchar](250) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistCarteraCompradaDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblHistCarteraCompradaDetalle](
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
	[nMontoPagado] [numeric](15, 0) NOT NULL,
	[vcFechaPago] [nvarchar](8) NOT NULL,
	[vcTipoDeuda] [varchar](1) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistCarteraCompradaError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblHistCarteraCompradaError](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaRegistro] [datetime] NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[nNumRegistro] [numeric](9, 0) NOT NULL,
	[txCodigoError] [text] NOT NULL,
	[vcRedDat] [nvarchar](250) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistDeudaDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblHistDeudaDetalle](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaRegistro] [datetime] NOT NULL,
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

GO
--SqlScripter----[dbo].[tblHistDeudaError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblHistDeudaError](
	[nInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaRegistro] [datetime] NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[nNumRegistro] [numeric](9, 0) NOT NULL,
	[txCodigoError] [text] NOT NULL,
	[vcRedDat] [nvarchar](250) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistRecaudacionDetalle].sql
GO
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

GO
--SqlScripter----[dbo].[tblHistRecaudacionError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblHistRecaudacionError](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaRegistro] [datetime] NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[nNumRegistro] [numeric](9, 0) NOT NULL,
	[txCodigoError] [text] NOT NULL,
	[vcRedDat] [nvarchar](250) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblIndicadorResumen].sql
GO
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

GO
--SqlScripter----[dbo].[tblInstitucion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblInstitucion](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[iIdSCF] [numeric](4, 0) NULL,
	[vcNombre] [nvarchar](50) NOT NULL,
	[vcNombreCorto] [nvarchar](10) NOT NULL,
	[bParticipa] [bit] NOT NULL,
	[iIdEstado] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblMenu](
	[iIdMenu] [int] NOT NULL,
	[vcMenu] [nvarchar](50) NOT NULL,
	[iIdPaginaLink] [int] NULL,
	[iIdMenuPadre] [int] NULL,
	[iOrden] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPagina].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblPagina](
	[iIdPagina] [int] NOT NULL,
	[vcUrl] [nvarchar](MAX) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblParametro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblParametro](
	[iIdParametro] [bigint] NOT NULL,
	[vcParametro] [nvarchar](50) NOT NULL,
	[iIdTipoParametro] [int] NOT NULL,
	[vcValor] [nvarchar](250) NOT NULL,
	[iIdUnidad] [int] NOT NULL,
	[vcDescripcion] [nvarchar](250) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPassword].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblPassword](
	[nIdPassword] [numeric](18, 0) NOT NULL,
	[iRut] [int] NOT NULL,
	[dFechaCreacion] [datetime] NOT NULL,
	[dFechaCaducidad] [datetime] NOT NULL,
	[vcHashClave] [nvarchar](32) NOT NULL,
	[iIdEstado] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblPerfil](
	[iIdPerfil] [int] NOT NULL,
	[vcNombrePerfil] [nvarchar](50) NOT NULL,
	[iIdEstado] [int] NOT NULL,
	[bAsignaCaja] [bit] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPeriodo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblPeriodo](
	[nPeriodo] [numeric](6, 0) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPeriodoMora].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblPeriodoMora](
	[iIdPeriodoMora] [int] NOT NULL,
	[vcPeriodoMora] [varchar](50) NOT NULL,
	[iLimiteInferior] [int] NOT NULL,
	[iLimiteSuperior] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRecaudacionCabecera].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRecaudacionCabecera](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[vcNombreArchivo] [nvarchar](25) NULL,
	[dFechaIngreso] [datetime] NOT NULL,
	[nTotalRegistros] [numeric](10, 0) NULL,
	[nTotalMontoCobrar] [numeric](30, 0) NULL,
	[nTotalMontoPendiente] [numeric](30, 0) NULL,
	[vcLinkArchivo] [nvarchar](250) NOT NULL,
	[iRutUsuarioEnv] [int] NULL,
	[iIdEstado] [int] NULL,
	[vcLinkError] [nvarchar](250) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRecaudacionDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRecaudacionDetalle](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
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

GO
--SqlScripter----[dbo].[tblRecaudacionError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRecaudacionError](
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[iCorrelativo] [int] NOT NULL,
	[nNumRegistro] [numeric](9, 0) NOT NULL,
	[txCodigoError] [text] NOT NULL,
	[vcRedDat] [nvarchar](250) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRegistroConsolidacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRegistroConsolidacion](
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaRegistro] [datetime] NOT NULL,
	[iRutUsuario] [int] NOT NULL,
	[vcTipoEjecucion] [nvarchar](10) NOT NULL,
	[vcTipoConsolidacion] [nvarchar](10) NOT NULL,
	[iIdEstado] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRel_FuncMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRel_FuncMenu](
	[iIdFuncionalidad] [int] NOT NULL,
	[iIdMenu] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRel_FuncPagina].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRel_FuncPagina](
	[iIdFuncionalidad] [int] NOT NULL,
	[iIdPagina] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRel_PerfilFunc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRel_PerfilFunc](
	[iIdPerfil] [int] NOT NULL,
	[iIdFuncionalidad] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRel_UsuarioPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRel_UsuarioPerfil](
	[iRut] [int] NOT NULL,
	[iIdPerfil] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblResumenConsolidacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblResumenConsolidacion](
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaRegistro] [datetime] NOT NULL,
	[iIdCajaOrigen] [numeric](4, 0) NOT NULL,
	[iIdCajaDestino] [numeric](4, 0) NOT NULL,
	[nTotalRegistros] [numeric](18, 0) NOT NULL,
	[nTotalSaldo] [numeric](30, 0) NULL,
	[nMontoCobrar] [numeric](30, 0) NOT NULL,
	[nMontoPagado] [numeric](30, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblResumenConsolidacionPensionado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblResumenConsolidacionPensionado](
	[nPeriodo] [numeric](6, 0) NOT NULL,
	[dFechaRegistro] [datetime] NOT NULL,
	[iIdCajaOrigen] [numeric](4, 0) NOT NULL,
	[iIdCajaDestino] [numeric](4, 0) NOT NULL,
	[nTotalRegistros] [numeric](18, 0) NOT NULL,
	[nTotalSaldo] [numeric](30, 0) NULL,
	[nMontoCobrar] [numeric](30, 0) NOT NULL,
	[nMontoPagado] [numeric](30, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblSessionUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblSessionUsuario](
	[iRut] [int] NOT NULL,
	[vcIdSession] [nvarchar](100) NOT NULL,
	[dLogin] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblSUSESO_RutInhabilitado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblSUSESO_RutInhabilitado](
	[vcRutInhabilitado] [nvarchar](15) NOT NULL,
	[vcDescripcion] [nvarchar](100) NOT NULL,
	[dFecha] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblSUSESO_TipoAfiliado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblSUSESO_TipoAfiliado](
	[tIdTipoAfiliado] [tinyint] NOT NULL,
	[vcTipoAfiliado] [nvarchar](50) NOT NULL,
	[iIdEstado] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblSUSESO_TipoIdentificador].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblSUSESO_TipoIdentificador](
	[tIdTipoIdentificador] [tinyint] NOT NULL,
	[vcTipoIdentificador] [nvarchar](50) NOT NULL,
	[iIdEstado] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTipoControlProceso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTipoControlProceso](
	[iIdTipoControlProceso] [int] NOT NULL,
	[vcDescripcion] [nvarchar](50) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTipoEstado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTipoEstado](
	[iIdTipoEstado] [int] NOT NULL,
	[vcTipoEstado] [nvarchar](15) NOT NULL,
	[vcDescripcion] [nvarchar](50) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTipoEventoAuditoria].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTipoEventoAuditoria](
	[iIdTipoEvento] [int] NOT NULL,
	[vcTipoEvento] [nvarchar](50) NOT NULL,
	[vcDescripcion] [nvarchar](100) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTipoParametro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTipoParametro](
	[iIdTipoParametro] [int] NOT NULL,
	[vcTipoParametro] [nvarchar](50) NOT NULL,
	[vcDescripcion] [nvarchar](100) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUnidad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblUnidad](
	[iIdUnidad] [int] NOT NULL,
	[vcUnidad] [nvarchar](10) NOT NULL,
	[vcDescripcion] [nvarchar](200) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblUsuario](
	[iRut] [int] NOT NULL,
	[vcNombre] [nvarchar](50) NOT NULL,
	[nIdInstitucion] [numeric](4, 0) NOT NULL,
	[vcEmail] [nvarchar](50) NOT NULL,
	[iIdEstado] [int] NOT NULL,
	[tIntentos] [tinyint] NOT NULL,
	[dFecha_ing] [datetime] NOT NULL,
	[dFecha_mod] [datetime] NOT NULL
)
ON [PRIMARY]
