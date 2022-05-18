
GO
--SqlScripter----[dbo].[tblAfiliadoCabecera].[PK_tblAfiliadoCab_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblAfiliadoCabecera] ADD CONSTRAINT [PK_tblAfiliadoCab_1] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[iCorrelativo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblAfiliadoDetalle].[PK_tblAfiliadoReg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblAfiliadoDetalle] ADD CONSTRAINT [PK_tblAfiliadoReg] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[iCorrelativo] ASC,
	[vcIdentificadorAfiliado] ASC,
	[tIdTipoIdentificador] ASC,
	[vcRutEmpresa] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblAfiliadoError].[PK_tblErrorDet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblAfiliadoError] ADD CONSTRAINT [PK_tblErrorDet] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[iCorrelativo] ASC,
	[nNumRegistro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCarteraCompradaCabecera].[PK_tblCarteraCompradaCabecera].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblCarteraCompradaCabecera] ADD CONSTRAINT [PK_tblCarteraCompradaCabecera] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[iCorrelativo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCarteraCompradaDetalle].[PK_tblcarteracompradadetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblCarteraCompradaDetalle] ADD CONSTRAINT [PK_tblcarteracompradadetalle] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[iCorrelativo] ASC,
	[nIdCajaOrigen] ASC,
	[vcNumPagare] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCarteraCompradaError].[PK_tblCarteraCompradaError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblCarteraCompradaError] ADD CONSTRAINT [PK_tblCarteraCompradaError] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[iCorrelativo] ASC,
	[nNumRegistro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCierreFueraPlazo].[PK_tblCierreFueraPlazo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblCierreFueraPlazo] ADD CONSTRAINT [PK_tblCierreFueraPlazo] PRIMARY KEY CLUSTERED (
	[iIdCierrePlazo] ASC,
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCodigoError].[PK_tblTipoError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblCodigoError] ADD CONSTRAINT [PK_tblTipoError] PRIMARY KEY CLUSTERED (
	[cCodigoError] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionCabecera].[PK_tblConsolidacionCabecera].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblConsolidacionCabecera] ADD CONSTRAINT [PK_tblConsolidacionCabecera] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionCabeceraPensionado].[PK_tblConsolidacionCabeceraPensionado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblConsolidacionCabeceraPensionado] ADD CONSTRAINT [PK_tblConsolidacionCabeceraPensionado] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionCarteraCabecera].[PK_tblConsolidacionCarteraCabecera].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblConsolidacionCarteraCabecera] ADD CONSTRAINT [PK_tblConsolidacionCarteraCabecera] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionCarteraDetalle].[PK_tblConsolidacionCarteraDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblConsolidacionCarteraDetalle] ADD CONSTRAINT [PK_tblConsolidacionCarteraDetalle] PRIMARY KEY CLUSTERED (
	[nIdConsolidacionDetalle] ASC,
	[nIdCajaOrigen] ASC,
	[nIdCajaDestino] ASC,
	[nPeriodo] ASC,
	[vcNumPagare] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionDetalle].[PK_tblAlertaDet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblConsolidacionDetalle] ADD CONSTRAINT [PK_tblAlertaDet] PRIMARY KEY CLUSTERED (
	[nIdConsolidacionDetalle] ASC,
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[vcNumPagare] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConsolidacionDetallePensionado].[PK_tblAlertaDetPensionado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblConsolidacionDetallePensionado] ADD CONSTRAINT [PK_tblAlertaDetPensionado] PRIMARY KEY CLUSTERED (
	[nIdConsolidacionDetalle] ASC,
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[vcNumPagare] ASC,
	[tIdTipoAfiliado] ASC,
	[vcEmplanillado] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblControlProceso].[PK_tblControlProceso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblControlProceso] ADD CONSTRAINT [PK_tblControlProceso] PRIMARY KEY CLUSTERED (
	[nIdControlProceso] ASC,
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblDeudaCabecera].[PK_tblDeudaCab].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblDeudaCabecera] ADD CONSTRAINT [PK_tblDeudaCab] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[iCorrelativo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblDeudaDetalle].[PK_tblDeudaDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblDeudaDetalle] ADD CONSTRAINT [PK_tblDeudaDetalle] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[iCorrelativo] ASC,
	[vcNumPagare] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblDeudaError].[PK_tblDeudaError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblDeudaError] ADD CONSTRAINT [PK_tblDeudaError] PRIMARY KEY CLUSTERED (
	[nInstitucion] ASC,
	[nPeriodo] ASC,
	[iCorrelativo] ASC,
	[nNumRegistro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblEmailOperacion].[PK_tblEmailOperacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblEmailOperacion] ADD CONSTRAINT [PK_tblEmailOperacion] PRIMARY KEY CLUSTERED (
	[vcOperacion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblEstado].[PK_sis_estado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblEstado] ADD CONSTRAINT [PK_sis_estado] PRIMARY KEY CLUSTERED (
	[iIdEstado] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblEventoAuditoria].[PK_tblEvento].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblEventoAuditoria] ADD CONSTRAINT [PK_tblEvento] PRIMARY KEY CLUSTERED (
	[nIdEvento] ASC,
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblFeriado].[PK_tblFeriado_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblFeriado] ADD CONSTRAINT [PK_tblFeriado_1] PRIMARY KEY CLUSTERED (
	[dFeriado] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblFuncionalidad].[PK_tblFuncionalidad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblFuncionalidad] ADD CONSTRAINT [PK_tblFuncionalidad] PRIMARY KEY CLUSTERED (
	[iIdFuncionalidad] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistAfiliadoDetalle].[PK_tblHistAfiliadoDetalle_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblHistAfiliadoDetalle] ADD CONSTRAINT [PK_tblHistAfiliadoDetalle_1] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[dFechaRegistro] ASC,
	[iCorrelativo] ASC,
	[vcIdentificadorAfiliado] ASC,
	[tIdTipoIdentificador] ASC,
	[vcRutEmpresa] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistAfiliadoError].[PK_tblHistErrorDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblHistAfiliadoError] ADD CONSTRAINT [PK_tblHistErrorDetalle] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[dFechaRegistro] ASC,
	[iCorrelativo] ASC,
	[nNumRegistro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistCarteraCompradaDetalle].[PK_tblHistCarteraCompradaDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaDetalle] ADD CONSTRAINT [PK_tblHistCarteraCompradaDetalle] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[dFechaRegistro] ASC,
	[iCorrelativo] ASC,
	[nIdCajaOrigen] ASC,
	[vcNumPagare] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistCarteraCompradaError].[PK_tblHistCarteraCompradaError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaError] ADD CONSTRAINT [PK_tblHistCarteraCompradaError] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[dFechaRegistro] ASC,
	[iCorrelativo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistDeudaDetalle].[PK_tblHistDeudaDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblHistDeudaDetalle] ADD CONSTRAINT [PK_tblHistDeudaDetalle] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[dFechaRegistro] ASC,
	[iCorrelativo] ASC,
	[vcNumPagare] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistDeudaError].[PK_tblHistDeudaError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblHistDeudaError] ADD CONSTRAINT [PK_tblHistDeudaError] PRIMARY KEY CLUSTERED (
	[nInstitucion] ASC,
	[nPeriodo] ASC,
	[dFechaRegistro] ASC,
	[iCorrelativo] ASC,
	[nNumRegistro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistRecaudacionDetalle].[PK_tblHistRecaudacionDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblHistRecaudacionDetalle] ADD CONSTRAINT [PK_tblHistRecaudacionDetalle] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[dFechaRegistro] ASC,
	[iCorrelativo] ASC,
	[nIdCajaOrigen] ASC,
	[vcNumPagare] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHistRecaudacionError].[PK_tblHistRecaudacionError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblHistRecaudacionError] ADD CONSTRAINT [PK_tblHistRecaudacionError] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[dFechaRegistro] ASC,
	[iCorrelativo] ASC,
	[nNumRegistro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblIndicadorResumen].[PK_tblIndicadorResumen].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblIndicadorResumen] ADD CONSTRAINT [PK_tblIndicadorResumen] PRIMARY KEY CLUSTERED (
	[iIdIndicadorResumen] ASC,
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblInstitucion].[PK_sis_institucion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblInstitucion] ADD CONSTRAINT [PK_sis_institucion] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMenu].[PK_sis_menu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblMenu] ADD CONSTRAINT [PK_sis_menu] PRIMARY KEY CLUSTERED (
	[iIdMenu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPagina].[PK_sis_pagina].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblPagina] ADD CONSTRAINT [PK_sis_pagina] PRIMARY KEY CLUSTERED (
	[iIdPagina] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblParametro].[PK_tblParametro_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblParametro] ADD CONSTRAINT [PK_tblParametro_1] PRIMARY KEY CLUSTERED (
	[iIdParametro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPassword].[PK_tblPassword].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblPassword] ADD CONSTRAINT [PK_tblPassword] PRIMARY KEY CLUSTERED (
	[nIdPassword] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPerfil].[PK_sis_perfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblPerfil] ADD CONSTRAINT [PK_sis_perfil] PRIMARY KEY CLUSTERED (
	[iIdPerfil] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPeriodo].[PK_tblPeriodo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblPeriodo] ADD CONSTRAINT [PK_tblPeriodo] PRIMARY KEY CLUSTERED (
	[nPeriodo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPeriodoMora].[PK_tblPeriodoMora].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblPeriodoMora] ADD CONSTRAINT [PK_tblPeriodoMora] PRIMARY KEY CLUSTERED (
	[iIdPeriodoMora] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRecaudacionCabecera].[PK_tblRecaudacionCab].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblRecaudacionCabecera] ADD CONSTRAINT [PK_tblRecaudacionCab] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[iCorrelativo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRecaudacionDetalle].[PK_tblRecaudacionReg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblRecaudacionDetalle] ADD CONSTRAINT [PK_tblRecaudacionReg] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[iCorrelativo] ASC,
	[nIdCajaOrigen] ASC,
	[vcNumPagare] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRecaudacionError].[PK_tblRecaudacionError].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblRecaudacionError] ADD CONSTRAINT [PK_tblRecaudacionError] PRIMARY KEY CLUSTERED (
	[nIdInstitucion] ASC,
	[nPeriodo] ASC,
	[iCorrelativo] ASC,
	[nNumRegistro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRegistroConsolidacion].[PK_tblRegistroConsolidacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblRegistroConsolidacion] ADD CONSTRAINT [PK_tblRegistroConsolidacion] PRIMARY KEY CLUSTERED (
	[nPeriodo] ASC,
	[dFechaRegistro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRel_FuncMenu].[PK_tblRel_FuncMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblRel_FuncMenu] ADD CONSTRAINT [PK_tblRel_FuncMenu] PRIMARY KEY CLUSTERED (
	[iIdFuncionalidad] ASC,
	[iIdMenu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRel_FuncPagina].[PK_tblRel_FuncPagina].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblRel_FuncPagina] ADD CONSTRAINT [PK_tblRel_FuncPagina] PRIMARY KEY CLUSTERED (
	[iIdFuncionalidad] ASC,
	[iIdPagina] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRel_PerfilFunc].[PK_tblRel_PerfilFunc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblRel_PerfilFunc] ADD CONSTRAINT [PK_tblRel_PerfilFunc] PRIMARY KEY CLUSTERED (
	[iIdPerfil] ASC,
	[iIdFuncionalidad] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRel_UsuarioPerfil].[PK_tblRel_UsuarioPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblRel_UsuarioPerfil] ADD CONSTRAINT [PK_tblRel_UsuarioPerfil] PRIMARY KEY CLUSTERED (
	[iRut] ASC,
	[iIdPerfil] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblResumenConsolidacion].[PK_tblResumenConsolidacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblResumenConsolidacion] ADD CONSTRAINT [PK_tblResumenConsolidacion] PRIMARY KEY CLUSTERED (
	[nPeriodo] ASC,
	[dFechaRegistro] ASC,
	[iIdCajaOrigen] ASC,
	[iIdCajaDestino] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblResumenConsolidacionPensionado].[PK_tblResumenConsolidacionPen].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblResumenConsolidacionPensionado] ADD CONSTRAINT [PK_tblResumenConsolidacionPen] PRIMARY KEY CLUSTERED (
	[nPeriodo] ASC,
	[dFechaRegistro] ASC,
	[iIdCajaOrigen] ASC,
	[iIdCajaDestino] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblSessionUsuario].[PK_tblSessionUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblSessionUsuario] ADD CONSTRAINT [PK_tblSessionUsuario] PRIMARY KEY CLUSTERED (
	[iRut] ASC,
	[vcIdSession] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblSUSESO_RutInhabilitado].[PK_tblSUSESO_RutInabilitado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblSUSESO_RutInhabilitado] ADD CONSTRAINT [PK_tblSUSESO_RutInabilitado] PRIMARY KEY CLUSTERED (
	[vcRutInhabilitado] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblSUSESO_TipoAfiliado].[PK_tblTipoAfiliado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblSUSESO_TipoAfiliado] ADD CONSTRAINT [PK_tblTipoAfiliado] PRIMARY KEY CLUSTERED (
	[tIdTipoAfiliado] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblSUSESO_TipoIdentificador].[PK_tblTipoIdentificador].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblSUSESO_TipoIdentificador] ADD CONSTRAINT [PK_tblTipoIdentificador] PRIMARY KEY CLUSTERED (
	[tIdTipoIdentificador] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTipoControlProceso].[PK_tblTipoControlProceso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblTipoControlProceso] ADD CONSTRAINT [PK_tblTipoControlProceso] PRIMARY KEY CLUSTERED (
	[iIdTipoControlProceso] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTipoEstado].[PK_sis_tipo_estado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblTipoEstado] ADD CONSTRAINT [PK_sis_tipo_estado] PRIMARY KEY CLUSTERED (
	[iIdTipoEstado] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTipoEventoAuditoria].[PK_tblTipoEvento].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblTipoEventoAuditoria] ADD CONSTRAINT [PK_tblTipoEvento] PRIMARY KEY CLUSTERED (
	[iIdTipoEvento] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTipoParametro].[PK_tblTipoParametro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblTipoParametro] ADD CONSTRAINT [PK_tblTipoParametro] PRIMARY KEY CLUSTERED (
	[iIdTipoParametro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUnidad].[PK_tblUnidad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblUnidad] ADD CONSTRAINT [PK_tblUnidad] PRIMARY KEY CLUSTERED (
	[iIdUnidad] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuario].[PK_sis_usuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblUsuario] ADD CONSTRAINT [PK_sis_usuario] PRIMARY KEY CLUSTERED (
	[iRut] ASC
) ON [PRIMARY]
