
GO
--SqlScripter----[dbo].[tblAfiliadoCabecera].[idx_tblAfiliadoCabecera_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblAfiliadoCabecera_per] ON [dbo].[tblAfiliadoCabecera] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblAfiliadoDetalle].[idx_tblAfiliadoDetalle_per_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblAfiliadoDetalle_per_inst] ON [dbo].[tblAfiliadoDetalle] (
	[nPeriodo] ASC,
	[nIdInstitucion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblAfiliadoError].[idx_tblAfiliadoError_per_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblAfiliadoError_per_inst] ON [dbo].[tblAfiliadoError] (
	[nPeriodo] ASC,
	[nIdInstitucion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCarteraCompradaDetalle].[idx_tblCarteraCompradaDetalle_inst_per_corr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblCarteraCompradaDetalle_inst_per_corr] ON [dbo].[tblCarteraCompradaDetalle] (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[iCorrelativo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionCabecera].[idx_tblConsolidacionCabecera_nPer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblConsolidacionCabecera_nPer] ON [dbo].[tblConsolidacionCabecera] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionCabeceraPensionado].[idx_tblConsolidacionCabecera_nPer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblConsolidacionCabecera_nPer] ON [dbo].[tblConsolidacionCabeceraPensionado] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionCarteraCabecera].[idx_tblConsolidacionCarteraCabecera_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblConsolidacionCarteraCabecera_per] ON [dbo].[tblConsolidacionCarteraCabecera] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionCarteraDetalle].[idx_tblConsolidacionCarteraDetalle_IdDeud_vFechaImp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblConsolidacionCarteraDetalle_IdDeud_vFechaImp] ON [dbo].[tblConsolidacionCarteraDetalle] (
	[vcIdentificadorDeudor] ASC,
	[vcFechaImpago] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionCarteraDetalle].[idx_tblConsolidacionCarteraDetalle_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblConsolidacionCarteraDetalle_per] ON [dbo].[tblConsolidacionCarteraDetalle] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionDetalle].[idx_tblConsolidacionDetalle_inst_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblConsolidacionDetalle_inst_per] ON [dbo].[tblConsolidacionDetalle] (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC)
INCLUDE (
	[nIdConsolidacionDetalle],
	[nMontoPagado],
	[vcNumPagare]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionDetalle].[idx_tblConsolidacionDetalle_inst_per_pag].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblConsolidacionDetalle_inst_per_pag] ON [dbo].[tblConsolidacionDetalle] (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[vcNumPagare] ASC)
INCLUDE (
	[nIdConsolidacionDetalle],
	[nMontoPagado]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionDetalle].[idx_tblConsolidacionDetalle_inst_per2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblConsolidacionDetalle_inst_per2] ON [dbo].[tblConsolidacionDetalle] (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC)
INCLUDE (
	[nMontoCobrar],
	[nSaldoCapital],
	[vcIdentificadorDeudor]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionDetalle].[idx_tblConsolidacionDetalle_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblConsolidacionDetalle_per] ON [dbo].[tblConsolidacionDetalle] (
	[nPeriodo] ASC)
INCLUDE (
	[nIdCajaOrigen],
	[nIdInstitucion],
	[nMontoCobrar],
	[nSaldoCapital]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionDetalle].[idx_tblConsolidacionDetalle_per_mon].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblConsolidacionDetalle_per_mon] ON [dbo].[tblConsolidacionDetalle] (
	[nPeriodo] ASC,
	[nMontoPagado] ASC)
INCLUDE (
	[nIdCajaOrigen],
	[nIdInstitucion],
	[nMontoCobrar],
	[vcIdentificadorDeudor],
	[vcNumPagare],
	[vcRutAval],
	[vcRutEmpresa]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionDetalle].[idx_tblConsolidacionDetalle_per2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblConsolidacionDetalle_per2] ON [dbo].[tblConsolidacionDetalle] (
	[nPeriodo] ASC)
INCLUDE (
	[nIdInstitucion],
	[nMontoCobrar],
	[nSaldoCapital],
	[vcIdentificadorDeudor]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblControlProceso].[idx_tblControlProceso_est_tip].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblControlProceso_est_tip] ON [dbo].[tblControlProceso] (
	[iIdEstado] ASC,
	[iIdTipoControlProceso] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblControlProceso].[idx_tblControlProceso_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblControlProceso_per] ON [dbo].[tblControlProceso] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblDeudaCabecera].[idx_tblDeudaCabecera_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblDeudaCabecera_per] ON [dbo].[tblDeudaCabecera] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblDeudaDetalle].[idx_tblDeudaDetalle_per_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblDeudaDetalle_per_inst] ON [dbo].[tblDeudaDetalle] (
	[nPeriodo] ASC,
	[nIdInstitucion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblDeudaError].[idx_tblDeudaError_per_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblDeudaError_per_inst] ON [dbo].[tblDeudaError] (
	[nPeriodo] ASC,
	[nInstitucion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblEstado].[idx_tblEstado_tipest].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblEstado_tipest] ON [dbo].[tblEstado] (
	[iIdTipoEstado] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblEventoAuditoria].[idx_tblEventoAuditoria_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblEventoAuditoria_per] ON [dbo].[tblEventoAuditoria] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblEventoAuditoria].[IX_tblEvento].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_tblEvento] ON [dbo].[tblEventoAuditoria] (
	[cTipoRegistro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistAfiliadoDetalle].[idx_tblHistAfiliadoDetalle_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblHistAfiliadoDetalle_per] ON [dbo].[tblHistAfiliadoDetalle] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistAfiliadoError].[idx_tblHistAfiliadoError_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblHistAfiliadoError_per] ON [dbo].[tblHistAfiliadoError] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistDeudaError].[idx_tblHistDeudaError_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblHistDeudaError_per] ON [dbo].[tblHistDeudaError] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistRecaudacionDetalle].[idx_tblHistRecaudacionDetalle_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblHistRecaudacionDetalle_per] ON [dbo].[tblHistRecaudacionDetalle] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistRecaudacionError].[idx_tblHistRecaudacionError_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblHistRecaudacionError_per] ON [dbo].[tblHistRecaudacionError] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPassword].[idx_tblPassword_rut_est].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblPassword_rut_est] ON [dbo].[tblPassword] (
	[iRut] ASC,
	[iIdEstado] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRecaudacionCabecera].[idx_tblRecaudacionCabecera_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblRecaudacionCabecera_per] ON [dbo].[tblRecaudacionCabecera] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRecaudacionCabecera].[idx_tblRecaudacionCabecera_per_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblRecaudacionCabecera_per_inst] ON [dbo].[tblRecaudacionCabecera] (
	[nPeriodo] ASC,
	[nIdInstitucion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRecaudacionDetalle].[idx_tblRecaudacionDetalle_per_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblRecaudacionDetalle_per_inst] ON [dbo].[tblRecaudacionDetalle] (
	[nPeriodo] ASC,
	[nIdInstitucion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRecaudacionError].[idx_tblRecaudacionError_per_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblRecaudacionError_per_inst] ON [dbo].[tblRecaudacionError] (
	[nPeriodo] ASC,
	[nIdInstitucion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRegistroConsolidacion].[idx_tblRegistroConsolidacion_per].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblRegistroConsolidacion_per] ON [dbo].[tblRegistroConsolidacion] (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblSessionUsuario].[idx_tblSessionUsuario_idsess].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblSessionUsuario_idsess] ON [dbo].[tblSessionUsuario] (
	[vcIdSession] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuario].[IX_tblUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblUsuario] ON [dbo].[tblUsuario] (
	[vcEmail] ASC
) ON [PRIMARY]
