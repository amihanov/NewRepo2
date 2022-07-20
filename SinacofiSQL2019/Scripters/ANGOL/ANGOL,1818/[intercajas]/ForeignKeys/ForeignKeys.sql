
GO
--SqlScripter----[dbo].[tblAfiliadoCabecera].[FK_tblAfiliadoCab_tblEstado].sql
GO
ALTER TABLE [dbo].[tblAfiliadoCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblAfiliadoCab_tblEstado] FOREIGN KEY ([iIdEstado])
REFERENCES [dbo].[tblEstado] ([iIdEstado])
GO
ALTER TABLE [dbo].[tblAfiliadoCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblAfiliadoCab_tblEstado]
GO
--SqlScripter----[dbo].[tblAfiliadoCabecera].[FK_tblAfiliadoCab_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblAfiliadoCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblAfiliadoCab_tblInstitucion] FOREIGN KEY ([nIdInstitucion])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblAfiliadoCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblAfiliadoCab_tblInstitucion]
GO
--SqlScripter----[dbo].[tblAfiliadoCabecera].[FK_tblAfiliadoCab_tblPeriodo].sql
GO
ALTER TABLE [dbo].[tblAfiliadoCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblAfiliadoCab_tblPeriodo] FOREIGN KEY ([nPeriodo])
REFERENCES [dbo].[tblPeriodo] ([nPeriodo])
GO
ALTER TABLE [dbo].[tblAfiliadoCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblAfiliadoCab_tblPeriodo]
GO
--SqlScripter----[dbo].[tblAfiliadoCabecera].[FK_tblAfiliadoCab_tblUsuario].sql
GO
ALTER TABLE [dbo].[tblAfiliadoCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblAfiliadoCab_tblUsuario] FOREIGN KEY ([iRutUsuarioEnv])
REFERENCES [dbo].[tblUsuario] ([iRut])
GO
ALTER TABLE [dbo].[tblAfiliadoCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblAfiliadoCab_tblUsuario]
GO
--SqlScripter----[dbo].[tblAfiliadoDetalle].[FK_tblAfiliadoReg_tblAfiliadoCab].sql
GO
ALTER TABLE [dbo].[tblAfiliadoDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblAfiliadoReg_tblAfiliadoCab] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblAfiliadoCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblAfiliadoDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblAfiliadoReg_tblAfiliadoCab]
GO
--SqlScripter----[dbo].[tblAfiliadoDetalle].[FK_tblAfiliadoReg_tblTipoAfiliado].sql
GO
ALTER TABLE [dbo].[tblAfiliadoDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblAfiliadoReg_tblTipoAfiliado] FOREIGN KEY ([tIdTipoAfiliado])
REFERENCES [dbo].[tblSUSESO_TipoAfiliado] ([tIdTipoAfiliado])
GO
ALTER TABLE [dbo].[tblAfiliadoDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblAfiliadoReg_tblTipoAfiliado]
GO
--SqlScripter----[dbo].[tblAfiliadoDetalle].[FK_tblAfiliadoReg_tblTipoIdentificador].sql
GO
ALTER TABLE [dbo].[tblAfiliadoDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblAfiliadoReg_tblTipoIdentificador] FOREIGN KEY ([tIdTipoIdentificador])
REFERENCES [dbo].[tblSUSESO_TipoIdentificador] ([tIdTipoIdentificador])
GO
ALTER TABLE [dbo].[tblAfiliadoDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblAfiliadoReg_tblTipoIdentificador]
GO
--SqlScripter----[dbo].[tblAfiliadoError].[FK_tblAfiliadoError_tblAfiliadoCab].sql
GO
ALTER TABLE [dbo].[tblAfiliadoError] WITH NOCHECK ADD CONSTRAINT [FK_tblAfiliadoError_tblAfiliadoCab] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblAfiliadoCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblAfiliadoError] WITH CHECK CHECK CONSTRAINT [FK_tblAfiliadoError_tblAfiliadoCab]
GO
--SqlScripter----[dbo].[tblCarteraCompradaCabecera].[FK_tblCarteraCompradaCabecera_tblEstado].sql
GO
ALTER TABLE [dbo].[tblCarteraCompradaCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblCarteraCompradaCabecera_tblEstado] FOREIGN KEY ([iIdEstado])
REFERENCES [dbo].[tblEstado] ([iIdEstado])
GO
ALTER TABLE [dbo].[tblCarteraCompradaCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblCarteraCompradaCabecera_tblEstado]
GO
--SqlScripter----[dbo].[tblCarteraCompradaCabecera].[FK_tblCarteraCompradaCabecera_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblCarteraCompradaCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblCarteraCompradaCabecera_tblInstitucion] FOREIGN KEY ([nIdInstitucion])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblCarteraCompradaCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblCarteraCompradaCabecera_tblInstitucion]
GO
--SqlScripter----[dbo].[tblCarteraCompradaCabecera].[FK_tblCarteraCompradaCabecera_tblPeriodo].sql
GO
ALTER TABLE [dbo].[tblCarteraCompradaCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblCarteraCompradaCabecera_tblPeriodo] FOREIGN KEY ([nPeriodo])
REFERENCES [dbo].[tblPeriodo] ([nPeriodo])
GO
ALTER TABLE [dbo].[tblCarteraCompradaCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblCarteraCompradaCabecera_tblPeriodo]
GO
--SqlScripter----[dbo].[tblCarteraCompradaCabecera].[FK_tblCarteraCompradaCabecera_tblUsuario].sql
GO
ALTER TABLE [dbo].[tblCarteraCompradaCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblCarteraCompradaCabecera_tblUsuario] FOREIGN KEY ([iRutUsuarioEnv])
REFERENCES [dbo].[tblUsuario] ([iRut])
GO
ALTER TABLE [dbo].[tblCarteraCompradaCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblCarteraCompradaCabecera_tblUsuario]
GO
--SqlScripter----[dbo].[tblCarteraCompradaDetalle].[FK_tblCarteraCompradaDetalle_tblCarteraCompradaCabecera].sql
GO
ALTER TABLE [dbo].[tblCarteraCompradaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblCarteraCompradaDetalle_tblCarteraCompradaCabecera] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblCarteraCompradaCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblCarteraCompradaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblCarteraCompradaDetalle_tblCarteraCompradaCabecera]
GO
--SqlScripter----[dbo].[tblCarteraCompradaDetalle].[FK_tblCarteraCompradaDetalle_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblCarteraCompradaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblCarteraCompradaDetalle_tblInstitucion] FOREIGN KEY ([nIdCajaOrigen])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblCarteraCompradaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblCarteraCompradaDetalle_tblInstitucion]
GO
--SqlScripter----[dbo].[tblCarteraCompradaDetalle].[FK_tblCarteraCompradaDetalle_tblTipoAfiliado].sql
GO
ALTER TABLE [dbo].[tblCarteraCompradaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblCarteraCompradaDetalle_tblTipoAfiliado] FOREIGN KEY ([tIdTipoAfiliado])
REFERENCES [dbo].[tblSUSESO_TipoAfiliado] ([tIdTipoAfiliado])
GO
ALTER TABLE [dbo].[tblCarteraCompradaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblCarteraCompradaDetalle_tblTipoAfiliado]
GO
--SqlScripter----[dbo].[tblCarteraCompradaDetalle].[FK_tblCarteraCompradaDetalle_tblTipoIdentificador].sql
GO
ALTER TABLE [dbo].[tblCarteraCompradaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblCarteraCompradaDetalle_tblTipoIdentificador] FOREIGN KEY ([tIdTipoIdentificador])
REFERENCES [dbo].[tblSUSESO_TipoIdentificador] ([tIdTipoIdentificador])
GO
ALTER TABLE [dbo].[tblCarteraCompradaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblCarteraCompradaDetalle_tblTipoIdentificador]
GO
--SqlScripter----[dbo].[tblCarteraCompradaError].[FK_tblCarteraCompradaError_tblRecaudacionCab].sql
GO
ALTER TABLE [dbo].[tblCarteraCompradaError] WITH NOCHECK ADD CONSTRAINT [FK_tblCarteraCompradaError_tblRecaudacionCab] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblCarteraCompradaCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblCarteraCompradaError] WITH CHECK CHECK CONSTRAINT [FK_tblCarteraCompradaError_tblRecaudacionCab]
GO
--SqlScripter----[dbo].[tblCierreFueraPlazo].[FK_tblCierreFueraPlazo_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblCierreFueraPlazo] WITH NOCHECK ADD CONSTRAINT [FK_tblCierreFueraPlazo_tblInstitucion] FOREIGN KEY ([nIdInstitucion])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblCierreFueraPlazo] WITH CHECK CHECK CONSTRAINT [FK_tblCierreFueraPlazo_tblInstitucion]
GO
--SqlScripter----[dbo].[tblCierreFueraPlazo].[FK_tblCierreFueraPlazo_tblPeriodo].sql
GO
ALTER TABLE [dbo].[tblCierreFueraPlazo] WITH NOCHECK ADD CONSTRAINT [FK_tblCierreFueraPlazo_tblPeriodo] FOREIGN KEY ([nPeriodo])
REFERENCES [dbo].[tblPeriodo] ([nPeriodo])
GO
ALTER TABLE [dbo].[tblCierreFueraPlazo] WITH CHECK CHECK CONSTRAINT [FK_tblCierreFueraPlazo_tblPeriodo]
GO
--SqlScripter----[dbo].[tblConsolidacionCabecera].[FK_tblAlertaCab_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblConsolidacionCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblAlertaCab_tblInstitucion] FOREIGN KEY ([nIdInstitucion])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])

GO
--SqlScripter----[dbo].[tblConsolidacionCabecera].[FK_tblAlertaCab_tblPeriodo].sql
GO
ALTER TABLE [dbo].[tblConsolidacionCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblAlertaCab_tblPeriodo] FOREIGN KEY ([nPeriodo])
REFERENCES [dbo].[tblPeriodo] ([nPeriodo])

GO
--SqlScripter----[dbo].[tblConsolidacionCabeceraPensionado].[FK_tblAlertaCabPen_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblConsolidacionCabeceraPensionado] WITH NOCHECK ADD CONSTRAINT [FK_tblAlertaCabPen_tblInstitucion] FOREIGN KEY ([nIdInstitucion])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblConsolidacionCabeceraPensionado] WITH CHECK CHECK CONSTRAINT [FK_tblAlertaCabPen_tblInstitucion]
GO
--SqlScripter----[dbo].[tblConsolidacionCabeceraPensionado].[FK_tblAlertaCabPen_tblPeriodo].sql
GO
ALTER TABLE [dbo].[tblConsolidacionCabeceraPensionado] WITH NOCHECK ADD CONSTRAINT [FK_tblAlertaCabPen_tblPeriodo] FOREIGN KEY ([nPeriodo])
REFERENCES [dbo].[tblPeriodo] ([nPeriodo])
GO
ALTER TABLE [dbo].[tblConsolidacionCabeceraPensionado] WITH CHECK CHECK CONSTRAINT [FK_tblAlertaCabPen_tblPeriodo]
GO
--SqlScripter----[dbo].[tblConsolidacionCarteraCabecera].[FK_tblConsolidacionCarteraCabecera_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblConsolidacionCarteraCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblConsolidacionCarteraCabecera_tblInstitucion] FOREIGN KEY ([nIdInstitucion])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])

GO
--SqlScripter----[dbo].[tblConsolidacionCarteraCabecera].[FK_tblConsolidacionCarteraCabecera_tblPeriodo].sql
GO
ALTER TABLE [dbo].[tblConsolidacionCarteraCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblConsolidacionCarteraCabecera_tblPeriodo] FOREIGN KEY ([nPeriodo])
REFERENCES [dbo].[tblPeriodo] ([nPeriodo])

GO
--SqlScripter----[dbo].[tblConsolidacionCarteraDetalle].[FK_tblConsolidacionCarteraDetalle_tblAlertaCab].sql
GO
ALTER TABLE [dbo].[tblConsolidacionCarteraDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblConsolidacionCarteraDetalle_tblAlertaCab] FOREIGN KEY ([nIdCajaDestino], [nPeriodo])
REFERENCES [dbo].[tblConsolidacionCarteraCabecera] ([nIdInstitucion], [nPeriodo])

GO
--SqlScripter----[dbo].[tblConsolidacionCarteraDetalle].[FK_tblConsolidacionCarteraDetalle_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblConsolidacionCarteraDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblConsolidacionCarteraDetalle_tblInstitucion] FOREIGN KEY ([nIdCajaOrigen])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])

GO
--SqlScripter----[dbo].[tblConsolidacionCarteraDetalle].[FK_tblConsolidacionCarteraDetalle_tblTipoAfiliado].sql
GO
ALTER TABLE [dbo].[tblConsolidacionCarteraDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblConsolidacionCarteraDetalle_tblTipoAfiliado] FOREIGN KEY ([tIdTipoAfiliado])
REFERENCES [dbo].[tblSUSESO_TipoAfiliado] ([tIdTipoAfiliado])

GO
--SqlScripter----[dbo].[tblConsolidacionCarteraDetalle].[FK_tblConsolidacionCarteraDetalle_tblTipoIdentificador].sql
GO
ALTER TABLE [dbo].[tblConsolidacionCarteraDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblConsolidacionCarteraDetalle_tblTipoIdentificador] FOREIGN KEY ([tIdTipoIdentificador])
REFERENCES [dbo].[tblSUSESO_TipoIdentificador] ([tIdTipoIdentificador])

GO
--SqlScripter----[dbo].[tblConsolidacionDetalle].[FK_tblAlertaDet_tblAlertaCab].sql
GO
ALTER TABLE [dbo].[tblConsolidacionDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblAlertaDet_tblAlertaCab] FOREIGN KEY ([nIdInstitucion], [nPeriodo])
REFERENCES [dbo].[tblConsolidacionCabecera] ([nIdInstitucion], [nPeriodo])

GO
--SqlScripter----[dbo].[tblConsolidacionDetalle].[FK_tblAlertaDet_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblConsolidacionDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblAlertaDet_tblInstitucion] FOREIGN KEY ([nIdCajaOrigen])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])

GO
--SqlScripter----[dbo].[tblConsolidacionDetalle].[FK_tblAlertaDet_tblTipoAfiliado].sql
GO
ALTER TABLE [dbo].[tblConsolidacionDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblAlertaDet_tblTipoAfiliado] FOREIGN KEY ([tIdTipoAfiliado])
REFERENCES [dbo].[tblSUSESO_TipoAfiliado] ([tIdTipoAfiliado])

GO
--SqlScripter----[dbo].[tblConsolidacionDetalle].[FK_tblAlertaDet_tblTipoIdentificador].sql
GO
ALTER TABLE [dbo].[tblConsolidacionDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblAlertaDet_tblTipoIdentificador] FOREIGN KEY ([tIdTipoIdentificador])
REFERENCES [dbo].[tblSUSESO_TipoIdentificador] ([tIdTipoIdentificador])

GO
--SqlScripter----[dbo].[tblConsolidacionDetallePensionado].[FK_tblAlertaDetPensionado_tblAlertaCab].sql
GO
ALTER TABLE [dbo].[tblConsolidacionDetallePensionado] WITH NOCHECK ADD CONSTRAINT [FK_tblAlertaDetPensionado_tblAlertaCab] FOREIGN KEY ([nIdInstitucion], [nPeriodo])
REFERENCES [dbo].[tblConsolidacionCabeceraPensionado] ([nIdInstitucion], [nPeriodo])
GO
ALTER TABLE [dbo].[tblConsolidacionDetallePensionado] WITH CHECK CHECK CONSTRAINT [FK_tblAlertaDetPensionado_tblAlertaCab]
GO
--SqlScripter----[dbo].[tblConsolidacionDetallePensionado].[FK_tblAlertaDetPensionado_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblConsolidacionDetallePensionado] WITH NOCHECK ADD CONSTRAINT [FK_tblAlertaDetPensionado_tblInstitucion] FOREIGN KEY ([nIdCajaOrigen])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblConsolidacionDetallePensionado] WITH CHECK CHECK CONSTRAINT [FK_tblAlertaDetPensionado_tblInstitucion]
GO
--SqlScripter----[dbo].[tblConsolidacionDetallePensionado].[FK_tblAlertaDetPensionado_tblTipoAfiliado].sql
GO
ALTER TABLE [dbo].[tblConsolidacionDetallePensionado] WITH NOCHECK ADD CONSTRAINT [FK_tblAlertaDetPensionado_tblTipoAfiliado] FOREIGN KEY ([tIdTipoAfiliado])
REFERENCES [dbo].[tblSUSESO_TipoAfiliado] ([tIdTipoAfiliado])
GO
ALTER TABLE [dbo].[tblConsolidacionDetallePensionado] WITH CHECK CHECK CONSTRAINT [FK_tblAlertaDetPensionado_tblTipoAfiliado]
GO
--SqlScripter----[dbo].[tblConsolidacionDetallePensionado].[FK_tblAlertaDetPensionado_tblTipoIdentificador].sql
GO
ALTER TABLE [dbo].[tblConsolidacionDetallePensionado] WITH NOCHECK ADD CONSTRAINT [FK_tblAlertaDetPensionado_tblTipoIdentificador] FOREIGN KEY ([tIdTipoIdentificador])
REFERENCES [dbo].[tblSUSESO_TipoIdentificador] ([tIdTipoIdentificador])
GO
ALTER TABLE [dbo].[tblConsolidacionDetallePensionado] WITH CHECK CHECK CONSTRAINT [FK_tblAlertaDetPensionado_tblTipoIdentificador]
GO
--SqlScripter----[dbo].[tblControlProceso].[FK_tblControlProceso_tblPeriodo].sql
GO
ALTER TABLE [dbo].[tblControlProceso] WITH NOCHECK ADD CONSTRAINT [FK_tblControlProceso_tblPeriodo] FOREIGN KEY ([nPeriodo])
REFERENCES [dbo].[tblPeriodo] ([nPeriodo])
GO
ALTER TABLE [dbo].[tblControlProceso] WITH CHECK CHECK CONSTRAINT [FK_tblControlProceso_tblPeriodo]
GO
--SqlScripter----[dbo].[tblControlProceso].[FK_tblControlProceso_tblTipoControlProceso].sql
GO
ALTER TABLE [dbo].[tblControlProceso] WITH NOCHECK ADD CONSTRAINT [FK_tblControlProceso_tblTipoControlProceso] FOREIGN KEY ([iIdTipoControlProceso])
REFERENCES [dbo].[tblTipoControlProceso] ([iIdTipoControlProceso])
GO
ALTER TABLE [dbo].[tblControlProceso] WITH CHECK CHECK CONSTRAINT [FK_tblControlProceso_tblTipoControlProceso]
GO
--SqlScripter----[dbo].[tblDeudaCabecera].[FK_tblDeudaCab_tblEstado].sql
GO
ALTER TABLE [dbo].[tblDeudaCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblDeudaCab_tblEstado] FOREIGN KEY ([iIdEstado])
REFERENCES [dbo].[tblEstado] ([iIdEstado])
GO
ALTER TABLE [dbo].[tblDeudaCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblDeudaCab_tblEstado]
GO
--SqlScripter----[dbo].[tblDeudaCabecera].[FK_tblDeudaCab_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblDeudaCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblDeudaCab_tblInstitucion] FOREIGN KEY ([nIdInstitucion])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblDeudaCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblDeudaCab_tblInstitucion]
GO
--SqlScripter----[dbo].[tblDeudaCabecera].[FK_tblDeudaCab_tblPeriodo].sql
GO
ALTER TABLE [dbo].[tblDeudaCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblDeudaCab_tblPeriodo] FOREIGN KEY ([nPeriodo])
REFERENCES [dbo].[tblPeriodo] ([nPeriodo])
GO
ALTER TABLE [dbo].[tblDeudaCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblDeudaCab_tblPeriodo]
GO
--SqlScripter----[dbo].[tblDeudaCabecera].[FK_tblDeudaCab_tblUsuario].sql
GO
ALTER TABLE [dbo].[tblDeudaCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblDeudaCab_tblUsuario] FOREIGN KEY ([iRutUsuarioEnv])
REFERENCES [dbo].[tblUsuario] ([iRut])
GO
ALTER TABLE [dbo].[tblDeudaCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblDeudaCab_tblUsuario]
GO
--SqlScripter----[dbo].[tblDeudaDetalle].[FK_tblDeudaReg_tblDeudaCab].sql
GO
ALTER TABLE [dbo].[tblDeudaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblDeudaReg_tblDeudaCab] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblDeudaCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblDeudaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblDeudaReg_tblDeudaCab]
GO
--SqlScripter----[dbo].[tblDeudaDetalle].[FK_tblDeudaReg_tblTipoAfiliado].sql
GO
ALTER TABLE [dbo].[tblDeudaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblDeudaReg_tblTipoAfiliado] FOREIGN KEY ([tIdTipoAfiliado])
REFERENCES [dbo].[tblSUSESO_TipoAfiliado] ([tIdTipoAfiliado])
GO
ALTER TABLE [dbo].[tblDeudaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblDeudaReg_tblTipoAfiliado]
GO
--SqlScripter----[dbo].[tblDeudaDetalle].[FK_tblDeudaReg_tblTipoIdentificador].sql
GO
ALTER TABLE [dbo].[tblDeudaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblDeudaReg_tblTipoIdentificador] FOREIGN KEY ([tIdTipoIdentificador])
REFERENCES [dbo].[tblSUSESO_TipoIdentificador] ([tIdTipoIdentificador])
GO
ALTER TABLE [dbo].[tblDeudaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblDeudaReg_tblTipoIdentificador]
GO
--SqlScripter----[dbo].[tblDeudaError].[FK_tblDeudaError_tblDeudaCab].sql
GO
ALTER TABLE [dbo].[tblDeudaError] WITH NOCHECK ADD CONSTRAINT [FK_tblDeudaError_tblDeudaCab] FOREIGN KEY ([nInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblDeudaCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblDeudaError] WITH CHECK CHECK CONSTRAINT [FK_tblDeudaError_tblDeudaCab]
GO
--SqlScripter----[dbo].[tblEstado].[FK_tblEstado_tblTipoEstado].sql
GO
ALTER TABLE [dbo].[tblEstado] WITH NOCHECK ADD CONSTRAINT [FK_tblEstado_tblTipoEstado] FOREIGN KEY ([iIdTipoEstado])
REFERENCES [dbo].[tblTipoEstado] ([iIdTipoEstado])
GO
ALTER TABLE [dbo].[tblEstado] WITH CHECK CHECK CONSTRAINT [FK_tblEstado_tblTipoEstado]
GO
--SqlScripter----[dbo].[tblEventoAuditoria].[FK_tblEvento_tblPeriodo].sql
GO
ALTER TABLE [dbo].[tblEventoAuditoria] WITH NOCHECK ADD CONSTRAINT [FK_tblEvento_tblPeriodo] FOREIGN KEY ([nPeriodo])
REFERENCES [dbo].[tblPeriodo] ([nPeriodo])
GO
ALTER TABLE [dbo].[tblEventoAuditoria] WITH CHECK CHECK CONSTRAINT [FK_tblEvento_tblPeriodo]
GO
--SqlScripter----[dbo].[tblEventoAuditoria].[FK_tblEvento_tblTipoEvento].sql
GO
ALTER TABLE [dbo].[tblEventoAuditoria] WITH NOCHECK ADD CONSTRAINT [FK_tblEvento_tblTipoEvento] FOREIGN KEY ([iIdTipoEvento])
REFERENCES [dbo].[tblTipoEventoAuditoria] ([iIdTipoEvento])
GO
ALTER TABLE [dbo].[tblEventoAuditoria] WITH CHECK CHECK CONSTRAINT [FK_tblEvento_tblTipoEvento]
GO
--SqlScripter----[dbo].[tblFuncionalidad].[FK_tblFuncionalidad_tblEstado].sql
GO
ALTER TABLE [dbo].[tblFuncionalidad] WITH NOCHECK ADD CONSTRAINT [FK_tblFuncionalidad_tblEstado] FOREIGN KEY ([iIdEstado])
REFERENCES [dbo].[tblEstado] ([iIdEstado])
GO
ALTER TABLE [dbo].[tblFuncionalidad] WITH CHECK CHECK CONSTRAINT [FK_tblFuncionalidad_tblEstado]
GO
--SqlScripter----[dbo].[tblHistAfiliadoDetalle].[FK_tblHistAfiliadoDetalle_tblAfiliadoCab].sql
GO
ALTER TABLE [dbo].[tblHistAfiliadoDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistAfiliadoDetalle_tblAfiliadoCab] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblAfiliadoCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblHistAfiliadoDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistAfiliadoDetalle_tblAfiliadoCab]
GO
--SqlScripter----[dbo].[tblHistAfiliadoDetalle].[FK_tblHistAfiliadoDetalle_tblRegistroConsolidacion].sql
GO
ALTER TABLE [dbo].[tblHistAfiliadoDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistAfiliadoDetalle_tblRegistroConsolidacion] FOREIGN KEY ([nPeriodo], [dFechaRegistro])
REFERENCES [dbo].[tblRegistroConsolidacion] ([nPeriodo], [dFechaRegistro])
GO
ALTER TABLE [dbo].[tblHistAfiliadoDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistAfiliadoDetalle_tblRegistroConsolidacion]
GO
--SqlScripter----[dbo].[tblHistAfiliadoDetalle].[FK_tblHistAfiliadoDetalle_tblTipoAfiliado].sql
GO
ALTER TABLE [dbo].[tblHistAfiliadoDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistAfiliadoDetalle_tblTipoAfiliado] FOREIGN KEY ([tIdTipoAfiliado])
REFERENCES [dbo].[tblSUSESO_TipoAfiliado] ([tIdTipoAfiliado])
GO
ALTER TABLE [dbo].[tblHistAfiliadoDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistAfiliadoDetalle_tblTipoAfiliado]
GO
--SqlScripter----[dbo].[tblHistAfiliadoDetalle].[FK_tblHistAfiliadoDetalle_tblTipoIdentificador].sql
GO
ALTER TABLE [dbo].[tblHistAfiliadoDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistAfiliadoDetalle_tblTipoIdentificador] FOREIGN KEY ([tIdTipoIdentificador])
REFERENCES [dbo].[tblSUSESO_TipoIdentificador] ([tIdTipoIdentificador])
GO
ALTER TABLE [dbo].[tblHistAfiliadoDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistAfiliadoDetalle_tblTipoIdentificador]
GO
--SqlScripter----[dbo].[tblHistAfiliadoError].[FK_tblHistAfiliadoError_tblAfiliadoCab].sql
GO
ALTER TABLE [dbo].[tblHistAfiliadoError] WITH NOCHECK ADD CONSTRAINT [FK_tblHistAfiliadoError_tblAfiliadoCab] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblAfiliadoCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblHistAfiliadoError] WITH CHECK CHECK CONSTRAINT [FK_tblHistAfiliadoError_tblAfiliadoCab]
GO
--SqlScripter----[dbo].[tblHistAfiliadoError].[FK_tblHistAfiliadoError_tblRegistroConsolidacion].sql
GO
ALTER TABLE [dbo].[tblHistAfiliadoError] WITH NOCHECK ADD CONSTRAINT [FK_tblHistAfiliadoError_tblRegistroConsolidacion] FOREIGN KEY ([nPeriodo], [dFechaRegistro])
REFERENCES [dbo].[tblRegistroConsolidacion] ([nPeriodo], [dFechaRegistro])
GO
ALTER TABLE [dbo].[tblHistAfiliadoError] WITH CHECK CHECK CONSTRAINT [FK_tblHistAfiliadoError_tblRegistroConsolidacion]
GO
--SqlScripter----[dbo].[tblHistCarteraCompradaDetalle].[FK_tblHistCarteraCompradaDetalle_tblCarteraCompradaCabecera].sql
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistCarteraCompradaDetalle_tblCarteraCompradaCabecera] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblCarteraCompradaCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistCarteraCompradaDetalle_tblCarteraCompradaCabecera]
GO
--SqlScripter----[dbo].[tblHistCarteraCompradaDetalle].[FK_tblHistCarteraCompradaDetalle_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistCarteraCompradaDetalle_tblInstitucion] FOREIGN KEY ([nIdCajaOrigen])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistCarteraCompradaDetalle_tblInstitucion]
GO
--SqlScripter----[dbo].[tblHistCarteraCompradaDetalle].[FK_tblHistCarteraCompradaDetalle_tblRegistroConsolidacion].sql
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistCarteraCompradaDetalle_tblRegistroConsolidacion] FOREIGN KEY ([nPeriodo], [dFechaRegistro])
REFERENCES [dbo].[tblRegistroConsolidacion] ([nPeriodo], [dFechaRegistro])
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistCarteraCompradaDetalle_tblRegistroConsolidacion]
GO
--SqlScripter----[dbo].[tblHistCarteraCompradaDetalle].[FK_tblHistCarteraCompradaDetalle_tblTipoAfiliado].sql
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistCarteraCompradaDetalle_tblTipoAfiliado] FOREIGN KEY ([tIdTipoAfiliado])
REFERENCES [dbo].[tblSUSESO_TipoAfiliado] ([tIdTipoAfiliado])
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistCarteraCompradaDetalle_tblTipoAfiliado]
GO
--SqlScripter----[dbo].[tblHistCarteraCompradaDetalle].[FK_tblHistCarteraCompradaDetalle_tblTipoIdentificador].sql
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistCarteraCompradaDetalle_tblTipoIdentificador] FOREIGN KEY ([tIdTipoIdentificador])
REFERENCES [dbo].[tblSUSESO_TipoIdentificador] ([tIdTipoIdentificador])
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistCarteraCompradaDetalle_tblTipoIdentificador]
GO
--SqlScripter----[dbo].[tblHistCarteraCompradaError].[FK_tblHistCarteraCompradaError_tblCarteraCompradaCabecera].sql
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaError] WITH NOCHECK ADD CONSTRAINT [FK_tblHistCarteraCompradaError_tblCarteraCompradaCabecera] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblCarteraCompradaCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaError] WITH CHECK CHECK CONSTRAINT [FK_tblHistCarteraCompradaError_tblCarteraCompradaCabecera]
GO
--SqlScripter----[dbo].[tblHistCarteraCompradaError].[FK_tblHistCarteraCompradaError_tblRegistroConsolidacion].sql
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaError] WITH NOCHECK ADD CONSTRAINT [FK_tblHistCarteraCompradaError_tblRegistroConsolidacion] FOREIGN KEY ([nPeriodo], [dFechaRegistro])
REFERENCES [dbo].[tblRegistroConsolidacion] ([nPeriodo], [dFechaRegistro])
GO
ALTER TABLE [dbo].[tblHistCarteraCompradaError] WITH CHECK CHECK CONSTRAINT [FK_tblHistCarteraCompradaError_tblRegistroConsolidacion]
GO
--SqlScripter----[dbo].[tblHistDeudaDetalle].[FK_tblHistDeudaDetalle_tblDeudaCab].sql
GO
ALTER TABLE [dbo].[tblHistDeudaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistDeudaDetalle_tblDeudaCab] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblDeudaCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblHistDeudaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistDeudaDetalle_tblDeudaCab]
GO
--SqlScripter----[dbo].[tblHistDeudaDetalle].[FK_tblHistDeudaDetalle_tblRegistroConsolidacion].sql
GO
ALTER TABLE [dbo].[tblHistDeudaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistDeudaDetalle_tblRegistroConsolidacion] FOREIGN KEY ([nPeriodo], [dFechaRegistro])
REFERENCES [dbo].[tblRegistroConsolidacion] ([nPeriodo], [dFechaRegistro])
GO
ALTER TABLE [dbo].[tblHistDeudaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistDeudaDetalle_tblRegistroConsolidacion]
GO
--SqlScripter----[dbo].[tblHistDeudaDetalle].[FK_tblHistDeudaDetalle_tblTipoAfiliado].sql
GO
ALTER TABLE [dbo].[tblHistDeudaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistDeudaDetalle_tblTipoAfiliado] FOREIGN KEY ([tIdTipoAfiliado])
REFERENCES [dbo].[tblSUSESO_TipoAfiliado] ([tIdTipoAfiliado])
GO
ALTER TABLE [dbo].[tblHistDeudaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistDeudaDetalle_tblTipoAfiliado]
GO
--SqlScripter----[dbo].[tblHistDeudaDetalle].[FK_tblHistDeudaDetalle_tblTipoIdentificador].sql
GO
ALTER TABLE [dbo].[tblHistDeudaDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistDeudaDetalle_tblTipoIdentificador] FOREIGN KEY ([tIdTipoIdentificador])
REFERENCES [dbo].[tblSUSESO_TipoIdentificador] ([tIdTipoIdentificador])
GO
ALTER TABLE [dbo].[tblHistDeudaDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistDeudaDetalle_tblTipoIdentificador]
GO
--SqlScripter----[dbo].[tblHistDeudaError].[FK_tblHistDeudaError_tblDeudaCab].sql
GO
ALTER TABLE [dbo].[tblHistDeudaError] WITH NOCHECK ADD CONSTRAINT [FK_tblHistDeudaError_tblDeudaCab] FOREIGN KEY ([nInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblDeudaCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblHistDeudaError] WITH CHECK CHECK CONSTRAINT [FK_tblHistDeudaError_tblDeudaCab]
GO
--SqlScripter----[dbo].[tblHistDeudaError].[FK_tblHistDeudaError_tblRegistroConsolidacion].sql
GO
ALTER TABLE [dbo].[tblHistDeudaError] WITH NOCHECK ADD CONSTRAINT [FK_tblHistDeudaError_tblRegistroConsolidacion] FOREIGN KEY ([nPeriodo], [dFechaRegistro])
REFERENCES [dbo].[tblRegistroConsolidacion] ([nPeriodo], [dFechaRegistro])
GO
ALTER TABLE [dbo].[tblHistDeudaError] WITH CHECK CHECK CONSTRAINT [FK_tblHistDeudaError_tblRegistroConsolidacion]
GO
--SqlScripter----[dbo].[tblHistRecaudacionDetalle].[FK_tblHistRecaudacionDetalle_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblHistRecaudacionDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistRecaudacionDetalle_tblInstitucion] FOREIGN KEY ([nIdCajaOrigen])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblHistRecaudacionDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistRecaudacionDetalle_tblInstitucion]
GO
--SqlScripter----[dbo].[tblHistRecaudacionDetalle].[FK_tblHistRecaudacionDetalle_tblRecaudacionCab].sql
GO
ALTER TABLE [dbo].[tblHistRecaudacionDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistRecaudacionDetalle_tblRecaudacionCab] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblRecaudacionCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblHistRecaudacionDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistRecaudacionDetalle_tblRecaudacionCab]
GO
--SqlScripter----[dbo].[tblHistRecaudacionDetalle].[FK_tblHistRecaudacionDetalle_tblRegistroConsolidacion].sql
GO
ALTER TABLE [dbo].[tblHistRecaudacionDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistRecaudacionDetalle_tblRegistroConsolidacion] FOREIGN KEY ([nPeriodo], [dFechaRegistro])
REFERENCES [dbo].[tblRegistroConsolidacion] ([nPeriodo], [dFechaRegistro])
GO
ALTER TABLE [dbo].[tblHistRecaudacionDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistRecaudacionDetalle_tblRegistroConsolidacion]
GO
--SqlScripter----[dbo].[tblHistRecaudacionDetalle].[FK_tblHistRecaudacionDetalle_tblTipoAfiliado].sql
GO
ALTER TABLE [dbo].[tblHistRecaudacionDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistRecaudacionDetalle_tblTipoAfiliado] FOREIGN KEY ([tIdTipoAfiliado])
REFERENCES [dbo].[tblSUSESO_TipoAfiliado] ([tIdTipoAfiliado])
GO
ALTER TABLE [dbo].[tblHistRecaudacionDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistRecaudacionDetalle_tblTipoAfiliado]
GO
--SqlScripter----[dbo].[tblHistRecaudacionDetalle].[FK_tblHistRecaudacionDetalle_tblTipoIdentificador].sql
GO
ALTER TABLE [dbo].[tblHistRecaudacionDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblHistRecaudacionDetalle_tblTipoIdentificador] FOREIGN KEY ([tIdTipoIdentificador])
REFERENCES [dbo].[tblSUSESO_TipoIdentificador] ([tIdTipoIdentificador])
GO
ALTER TABLE [dbo].[tblHistRecaudacionDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblHistRecaudacionDetalle_tblTipoIdentificador]
GO
--SqlScripter----[dbo].[tblHistRecaudacionError].[FK_tblHistRecaudacionError_tblRecaudacionCab].sql
GO
ALTER TABLE [dbo].[tblHistRecaudacionError] WITH NOCHECK ADD CONSTRAINT [FK_tblHistRecaudacionError_tblRecaudacionCab] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblRecaudacionCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblHistRecaudacionError] WITH CHECK CHECK CONSTRAINT [FK_tblHistRecaudacionError_tblRecaudacionCab]
GO
--SqlScripter----[dbo].[tblHistRecaudacionError].[FK_tblHistRecaudacionError_tblRegistroConsolidacion].sql
GO
ALTER TABLE [dbo].[tblHistRecaudacionError] WITH NOCHECK ADD CONSTRAINT [FK_tblHistRecaudacionError_tblRegistroConsolidacion] FOREIGN KEY ([nPeriodo], [dFechaRegistro])
REFERENCES [dbo].[tblRegistroConsolidacion] ([nPeriodo], [dFechaRegistro])
GO
ALTER TABLE [dbo].[tblHistRecaudacionError] WITH CHECK CHECK CONSTRAINT [FK_tblHistRecaudacionError_tblRegistroConsolidacion]
GO
--SqlScripter----[dbo].[tblIndicadorResumen].[FK_tblIndicadorResumen_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblIndicadorResumen] WITH NOCHECK ADD CONSTRAINT [FK_tblIndicadorResumen_tblInstitucion] FOREIGN KEY ([nIdCajaDestino])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])

GO
--SqlScripter----[dbo].[tblIndicadorResumen].[FK_tblIndicadorResumen_tblInstitucion1].sql
GO
ALTER TABLE [dbo].[tblIndicadorResumen] WITH NOCHECK ADD CONSTRAINT [FK_tblIndicadorResumen_tblInstitucion1] FOREIGN KEY ([nIdCajaOrigen])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])

GO
--SqlScripter----[dbo].[tblIndicadorResumen].[FK_tblIndicadorResumen_tblPeriodo].sql
GO
ALTER TABLE [dbo].[tblIndicadorResumen] WITH NOCHECK ADD CONSTRAINT [FK_tblIndicadorResumen_tblPeriodo] FOREIGN KEY ([nPeriodo])
REFERENCES [dbo].[tblPeriodo] ([nPeriodo])

GO
--SqlScripter----[dbo].[tblIndicadorResumen].[FK_tblIndicadorResumen_tblPeriodoMora].sql
GO
ALTER TABLE [dbo].[tblIndicadorResumen] WITH NOCHECK ADD CONSTRAINT [FK_tblIndicadorResumen_tblPeriodoMora] FOREIGN KEY ([iIdPeriodoMora])
REFERENCES [dbo].[tblPeriodoMora] ([iIdPeriodoMora])

GO
--SqlScripter----[dbo].[tblInstitucion].[FK_tblInstitucion_tblEstado].sql
GO
ALTER TABLE [dbo].[tblInstitucion] WITH NOCHECK ADD CONSTRAINT [FK_tblInstitucion_tblEstado] FOREIGN KEY ([iIdEstado])
REFERENCES [dbo].[tblEstado] ([iIdEstado])
GO
ALTER TABLE [dbo].[tblInstitucion] WITH CHECK CHECK CONSTRAINT [FK_tblInstitucion_tblEstado]
GO
--SqlScripter----[dbo].[tblMenu].[FK_tblMenu_sisPagina].sql
GO
ALTER TABLE [dbo].[tblMenu] WITH NOCHECK ADD CONSTRAINT [FK_tblMenu_sisPagina] FOREIGN KEY ([iIdPaginaLink])
REFERENCES [dbo].[tblPagina] ([iIdPagina])
GO
ALTER TABLE [dbo].[tblMenu] WITH CHECK CHECK CONSTRAINT [FK_tblMenu_sisPagina]
GO
--SqlScripter----[dbo].[tblMenu].[FK_tblMenu_tblMenu].sql
GO
ALTER TABLE [dbo].[tblMenu] WITH NOCHECK ADD CONSTRAINT [FK_tblMenu_tblMenu] FOREIGN KEY ([iIdMenuPadre])
REFERENCES [dbo].[tblMenu] ([iIdMenu])
GO
ALTER TABLE [dbo].[tblMenu] WITH CHECK CHECK CONSTRAINT [FK_tblMenu_tblMenu]
GO
--SqlScripter----[dbo].[tblParametro].[FK_tblParametro_tblTipoParametro].sql
GO
ALTER TABLE [dbo].[tblParametro] WITH NOCHECK ADD CONSTRAINT [FK_tblParametro_tblTipoParametro] FOREIGN KEY ([iIdTipoParametro])
REFERENCES [dbo].[tblTipoParametro] ([iIdTipoParametro])
GO
ALTER TABLE [dbo].[tblParametro] WITH CHECK CHECK CONSTRAINT [FK_tblParametro_tblTipoParametro]
GO
--SqlScripter----[dbo].[tblParametro].[FK_tblParametro_tblUnidad].sql
GO
ALTER TABLE [dbo].[tblParametro] WITH NOCHECK ADD CONSTRAINT [FK_tblParametro_tblUnidad] FOREIGN KEY ([iIdUnidad])
REFERENCES [dbo].[tblUnidad] ([iIdUnidad])
GO
ALTER TABLE [dbo].[tblParametro] WITH CHECK CHECK CONSTRAINT [FK_tblParametro_tblUnidad]
GO
--SqlScripter----[dbo].[tblPassword].[FK_tblPassword_tblEstado].sql
GO
ALTER TABLE [dbo].[tblPassword] WITH NOCHECK ADD CONSTRAINT [FK_tblPassword_tblEstado] FOREIGN KEY ([iIdEstado])
REFERENCES [dbo].[tblEstado] ([iIdEstado])
GO
ALTER TABLE [dbo].[tblPassword] WITH CHECK CHECK CONSTRAINT [FK_tblPassword_tblEstado]
GO
--SqlScripter----[dbo].[tblPassword].[FK_tblPassword_tblUsuario].sql
GO
ALTER TABLE [dbo].[tblPassword] WITH NOCHECK ADD CONSTRAINT [FK_tblPassword_tblUsuario] FOREIGN KEY ([iRut])
REFERENCES [dbo].[tblUsuario] ([iRut])
GO
ALTER TABLE [dbo].[tblPassword] WITH CHECK CHECK CONSTRAINT [FK_tblPassword_tblUsuario]
GO
--SqlScripter----[dbo].[tblPerfil].[FK_tblPerfil_tblEstado].sql
GO
ALTER TABLE [dbo].[tblPerfil] WITH NOCHECK ADD CONSTRAINT [FK_tblPerfil_tblEstado] FOREIGN KEY ([iIdEstado])
REFERENCES [dbo].[tblEstado] ([iIdEstado])
GO
ALTER TABLE [dbo].[tblPerfil] WITH CHECK CHECK CONSTRAINT [FK_tblPerfil_tblEstado]
GO
--SqlScripter----[dbo].[tblRecaudacionCabecera].[FK_tblRecaudacionCab_tblEstado].sql
GO
ALTER TABLE [dbo].[tblRecaudacionCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblRecaudacionCab_tblEstado] FOREIGN KEY ([iIdEstado])
REFERENCES [dbo].[tblEstado] ([iIdEstado])
GO
ALTER TABLE [dbo].[tblRecaudacionCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblRecaudacionCab_tblEstado]
GO
--SqlScripter----[dbo].[tblRecaudacionCabecera].[FK_tblRecaudacionCab_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblRecaudacionCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblRecaudacionCab_tblInstitucion] FOREIGN KEY ([nIdInstitucion])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblRecaudacionCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblRecaudacionCab_tblInstitucion]
GO
--SqlScripter----[dbo].[tblRecaudacionCabecera].[FK_tblRecaudacionCab_tblPeriodo].sql
GO
ALTER TABLE [dbo].[tblRecaudacionCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblRecaudacionCab_tblPeriodo] FOREIGN KEY ([nPeriodo])
REFERENCES [dbo].[tblPeriodo] ([nPeriodo])
GO
ALTER TABLE [dbo].[tblRecaudacionCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblRecaudacionCab_tblPeriodo]
GO
--SqlScripter----[dbo].[tblRecaudacionCabecera].[FK_tblRecaudacionCab_tblUsuario].sql
GO
ALTER TABLE [dbo].[tblRecaudacionCabecera] WITH NOCHECK ADD CONSTRAINT [FK_tblRecaudacionCab_tblUsuario] FOREIGN KEY ([iRutUsuarioEnv])
REFERENCES [dbo].[tblUsuario] ([iRut])
GO
ALTER TABLE [dbo].[tblRecaudacionCabecera] WITH CHECK CHECK CONSTRAINT [FK_tblRecaudacionCab_tblUsuario]
GO
--SqlScripter----[dbo].[tblRecaudacionDetalle].[FK_tblRecaudacionReg_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblRecaudacionDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblRecaudacionReg_tblInstitucion] FOREIGN KEY ([nIdCajaOrigen])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblRecaudacionDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblRecaudacionReg_tblInstitucion]
GO
--SqlScripter----[dbo].[tblRecaudacionDetalle].[FK_tblRecaudacionReg_tblRecaudacionCab].sql
GO
ALTER TABLE [dbo].[tblRecaudacionDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblRecaudacionReg_tblRecaudacionCab] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblRecaudacionCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblRecaudacionDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblRecaudacionReg_tblRecaudacionCab]
GO
--SqlScripter----[dbo].[tblRecaudacionDetalle].[FK_tblRecaudacionReg_tblTipoAfiliado].sql
GO
ALTER TABLE [dbo].[tblRecaudacionDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblRecaudacionReg_tblTipoAfiliado] FOREIGN KEY ([tIdTipoAfiliado])
REFERENCES [dbo].[tblSUSESO_TipoAfiliado] ([tIdTipoAfiliado])
GO
ALTER TABLE [dbo].[tblRecaudacionDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblRecaudacionReg_tblTipoAfiliado]
GO
--SqlScripter----[dbo].[tblRecaudacionDetalle].[FK_tblRecaudacionReg_tblTipoIdentificador].sql
GO
ALTER TABLE [dbo].[tblRecaudacionDetalle] WITH NOCHECK ADD CONSTRAINT [FK_tblRecaudacionReg_tblTipoIdentificador] FOREIGN KEY ([tIdTipoIdentificador])
REFERENCES [dbo].[tblSUSESO_TipoIdentificador] ([tIdTipoIdentificador])
GO
ALTER TABLE [dbo].[tblRecaudacionDetalle] WITH CHECK CHECK CONSTRAINT [FK_tblRecaudacionReg_tblTipoIdentificador]
GO
--SqlScripter----[dbo].[tblRecaudacionError].[FK_tblRecaudacionError_tblRecaudacionCab].sql
GO
ALTER TABLE [dbo].[tblRecaudacionError] WITH NOCHECK ADD CONSTRAINT [FK_tblRecaudacionError_tblRecaudacionCab] FOREIGN KEY ([nIdInstitucion], [nPeriodo], [iCorrelativo])
REFERENCES [dbo].[tblRecaudacionCabecera] ([nIdInstitucion], [nPeriodo], [iCorrelativo])
GO
ALTER TABLE [dbo].[tblRecaudacionError] WITH CHECK CHECK CONSTRAINT [FK_tblRecaudacionError_tblRecaudacionCab]
GO
--SqlScripter----[dbo].[tblRegistroConsolidacion].[FK_tblRegistroConsolidacion_tblEstado].sql
GO
ALTER TABLE [dbo].[tblRegistroConsolidacion] WITH NOCHECK ADD CONSTRAINT [FK_tblRegistroConsolidacion_tblEstado] FOREIGN KEY ([iIdEstado])
REFERENCES [dbo].[tblEstado] ([iIdEstado])

GO
--SqlScripter----[dbo].[tblRegistroConsolidacion].[FK_tblRegistroConsolidacion_tblPeriodo].sql
GO
ALTER TABLE [dbo].[tblRegistroConsolidacion] WITH NOCHECK ADD CONSTRAINT [FK_tblRegistroConsolidacion_tblPeriodo] FOREIGN KEY ([nPeriodo])
REFERENCES [dbo].[tblPeriodo] ([nPeriodo])

GO
--SqlScripter----[dbo].[tblRegistroConsolidacion].[FK_tblRegistroConsolidacion_tblUsuario].sql
GO
ALTER TABLE [dbo].[tblRegistroConsolidacion] WITH NOCHECK ADD CONSTRAINT [FK_tblRegistroConsolidacion_tblUsuario] FOREIGN KEY ([iRutUsuario])
REFERENCES [dbo].[tblUsuario] ([iRut])

GO
--SqlScripter----[dbo].[tblRel_FuncMenu].[FK_tblRel_FuncMenu_tblFuncionalidad].sql
GO
ALTER TABLE [dbo].[tblRel_FuncMenu] WITH NOCHECK ADD CONSTRAINT [FK_tblRel_FuncMenu_tblFuncionalidad] FOREIGN KEY ([iIdFuncionalidad])
REFERENCES [dbo].[tblFuncionalidad] ([iIdFuncionalidad])
GO
ALTER TABLE [dbo].[tblRel_FuncMenu] WITH CHECK CHECK CONSTRAINT [FK_tblRel_FuncMenu_tblFuncionalidad]
GO
--SqlScripter----[dbo].[tblRel_FuncMenu].[FK_tblRel_FuncMenu_tblMenu].sql
GO
ALTER TABLE [dbo].[tblRel_FuncMenu] WITH NOCHECK ADD CONSTRAINT [FK_tblRel_FuncMenu_tblMenu] FOREIGN KEY ([iIdMenu])
REFERENCES [dbo].[tblMenu] ([iIdMenu])
GO
ALTER TABLE [dbo].[tblRel_FuncMenu] WITH CHECK CHECK CONSTRAINT [FK_tblRel_FuncMenu_tblMenu]
GO
--SqlScripter----[dbo].[tblRel_FuncPagina].[FK_tblRel_FuncPagina_sisPagina].sql
GO
ALTER TABLE [dbo].[tblRel_FuncPagina] WITH NOCHECK ADD CONSTRAINT [FK_tblRel_FuncPagina_sisPagina] FOREIGN KEY ([iIdPagina])
REFERENCES [dbo].[tblPagina] ([iIdPagina])
GO
ALTER TABLE [dbo].[tblRel_FuncPagina] WITH CHECK CHECK CONSTRAINT [FK_tblRel_FuncPagina_sisPagina]
GO
--SqlScripter----[dbo].[tblRel_FuncPagina].[FK_tblRel_FuncPagina_tblFuncionalidad].sql
GO
ALTER TABLE [dbo].[tblRel_FuncPagina] WITH NOCHECK ADD CONSTRAINT [FK_tblRel_FuncPagina_tblFuncionalidad] FOREIGN KEY ([iIdFuncionalidad])
REFERENCES [dbo].[tblFuncionalidad] ([iIdFuncionalidad])
GO
ALTER TABLE [dbo].[tblRel_FuncPagina] WITH CHECK CHECK CONSTRAINT [FK_tblRel_FuncPagina_tblFuncionalidad]
GO
--SqlScripter----[dbo].[tblRel_PerfilFunc].[FK_tblRel_PerfilFunc_tblFuncionalidad].sql
GO
ALTER TABLE [dbo].[tblRel_PerfilFunc] WITH NOCHECK ADD CONSTRAINT [FK_tblRel_PerfilFunc_tblFuncionalidad] FOREIGN KEY ([iIdFuncionalidad])
REFERENCES [dbo].[tblFuncionalidad] ([iIdFuncionalidad])
GO
ALTER TABLE [dbo].[tblRel_PerfilFunc] WITH CHECK CHECK CONSTRAINT [FK_tblRel_PerfilFunc_tblFuncionalidad]
GO
--SqlScripter----[dbo].[tblRel_PerfilFunc].[FK_tblRel_PerfilFunc_tblPerfil].sql
GO
ALTER TABLE [dbo].[tblRel_PerfilFunc] WITH NOCHECK ADD CONSTRAINT [FK_tblRel_PerfilFunc_tblPerfil] FOREIGN KEY ([iIdPerfil])
REFERENCES [dbo].[tblPerfil] ([iIdPerfil])
GO
ALTER TABLE [dbo].[tblRel_PerfilFunc] WITH CHECK CHECK CONSTRAINT [FK_tblRel_PerfilFunc_tblPerfil]
GO
--SqlScripter----[dbo].[tblRel_UsuarioPerfil].[FK_tblRel_UsuarioPerfil_tblPerfil].sql
GO
ALTER TABLE [dbo].[tblRel_UsuarioPerfil] WITH NOCHECK ADD CONSTRAINT [FK_tblRel_UsuarioPerfil_tblPerfil] FOREIGN KEY ([iIdPerfil])
REFERENCES [dbo].[tblPerfil] ([iIdPerfil])
GO
ALTER TABLE [dbo].[tblRel_UsuarioPerfil] WITH CHECK CHECK CONSTRAINT [FK_tblRel_UsuarioPerfil_tblPerfil]
GO
--SqlScripter----[dbo].[tblRel_UsuarioPerfil].[FK_tblRel_UsuarioPerfil_tblUsuario].sql
GO
ALTER TABLE [dbo].[tblRel_UsuarioPerfil] WITH NOCHECK ADD CONSTRAINT [FK_tblRel_UsuarioPerfil_tblUsuario] FOREIGN KEY ([iRut])
REFERENCES [dbo].[tblUsuario] ([iRut])
GO
ALTER TABLE [dbo].[tblRel_UsuarioPerfil] WITH CHECK CHECK CONSTRAINT [FK_tblRel_UsuarioPerfil_tblUsuario]
GO
--SqlScripter----[dbo].[tblResumenConsolidacion].[FK_tblResumenConsolidacion_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblResumenConsolidacion] WITH NOCHECK ADD CONSTRAINT [FK_tblResumenConsolidacion_tblInstitucion] FOREIGN KEY ([iIdCajaOrigen])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])

GO
--SqlScripter----[dbo].[tblResumenConsolidacion].[FK_tblResumenConsolidacion_tblInstitucion1].sql
GO
ALTER TABLE [dbo].[tblResumenConsolidacion] WITH NOCHECK ADD CONSTRAINT [FK_tblResumenConsolidacion_tblInstitucion1] FOREIGN KEY ([iIdCajaDestino])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])

GO
--SqlScripter----[dbo].[tblResumenConsolidacion].[FK_tblResumenConsolidacion_tblRegistroConsolidacion].sql
GO
ALTER TABLE [dbo].[tblResumenConsolidacion] WITH NOCHECK ADD CONSTRAINT [FK_tblResumenConsolidacion_tblRegistroConsolidacion] FOREIGN KEY ([nPeriodo], [dFechaRegistro])
REFERENCES [dbo].[tblRegistroConsolidacion] ([nPeriodo], [dFechaRegistro])

GO
--SqlScripter----[dbo].[tblResumenConsolidacionPensionado].[FK_tblResumenConsolidacionPen_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblResumenConsolidacionPensionado] WITH NOCHECK ADD CONSTRAINT [FK_tblResumenConsolidacionPen_tblInstitucion] FOREIGN KEY ([iIdCajaOrigen])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblResumenConsolidacionPensionado] WITH CHECK CHECK CONSTRAINT [FK_tblResumenConsolidacionPen_tblInstitucion]
GO
--SqlScripter----[dbo].[tblResumenConsolidacionPensionado].[FK_tblResumenConsolidacionPen_tblInstitucion1].sql
GO
ALTER TABLE [dbo].[tblResumenConsolidacionPensionado] WITH NOCHECK ADD CONSTRAINT [FK_tblResumenConsolidacionPen_tblInstitucion1] FOREIGN KEY ([iIdCajaDestino])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblResumenConsolidacionPensionado] WITH CHECK CHECK CONSTRAINT [FK_tblResumenConsolidacionPen_tblInstitucion1]
GO
--SqlScripter----[dbo].[tblResumenConsolidacionPensionado].[FK_tblResumenConsolidacionPen_tblRegistroConsolidacion].sql
GO
ALTER TABLE [dbo].[tblResumenConsolidacionPensionado] WITH NOCHECK ADD CONSTRAINT [FK_tblResumenConsolidacionPen_tblRegistroConsolidacion] FOREIGN KEY ([nPeriodo], [dFechaRegistro])
REFERENCES [dbo].[tblRegistroConsolidacion] ([nPeriodo], [dFechaRegistro])
GO
ALTER TABLE [dbo].[tblResumenConsolidacionPensionado] WITH CHECK CHECK CONSTRAINT [FK_tblResumenConsolidacionPen_tblRegistroConsolidacion]
GO
--SqlScripter----[dbo].[tblSUSESO_TipoAfiliado].[FK_tblSUSESO_TipoAfiliado_tblEstado].sql
GO
ALTER TABLE [dbo].[tblSUSESO_TipoAfiliado] WITH NOCHECK ADD CONSTRAINT [FK_tblSUSESO_TipoAfiliado_tblEstado] FOREIGN KEY ([iIdEstado])
REFERENCES [dbo].[tblEstado] ([iIdEstado])
GO
ALTER TABLE [dbo].[tblSUSESO_TipoAfiliado] WITH CHECK CHECK CONSTRAINT [FK_tblSUSESO_TipoAfiliado_tblEstado]
GO
--SqlScripter----[dbo].[tblSUSESO_TipoIdentificador].[FK_tblSUSESO_TipoIdentificador_tblEstado].sql
GO
ALTER TABLE [dbo].[tblSUSESO_TipoIdentificador] WITH NOCHECK ADD CONSTRAINT [FK_tblSUSESO_TipoIdentificador_tblEstado] FOREIGN KEY ([iIdEstado])
REFERENCES [dbo].[tblEstado] ([iIdEstado])
GO
ALTER TABLE [dbo].[tblSUSESO_TipoIdentificador] WITH CHECK CHECK CONSTRAINT [FK_tblSUSESO_TipoIdentificador_tblEstado]
GO
--SqlScripter----[dbo].[tblUsuario].[FK_tblUsuario_tblEstado].sql
GO
ALTER TABLE [dbo].[tblUsuario] WITH NOCHECK ADD CONSTRAINT [FK_tblUsuario_tblEstado] FOREIGN KEY ([iIdEstado])
REFERENCES [dbo].[tblEstado] ([iIdEstado])
GO
ALTER TABLE [dbo].[tblUsuario] WITH CHECK CHECK CONSTRAINT [FK_tblUsuario_tblEstado]
GO
--SqlScripter----[dbo].[tblUsuario].[FK_tblUsuario_tblInstitucion].sql
GO
ALTER TABLE [dbo].[tblUsuario] WITH NOCHECK ADD CONSTRAINT [FK_tblUsuario_tblInstitucion] FOREIGN KEY ([nIdInstitucion])
REFERENCES [dbo].[tblInstitucion] ([nIdInstitucion])
GO
ALTER TABLE [dbo].[tblUsuario] WITH CHECK CHECK CONSTRAINT [FK_tblUsuario_tblInstitucion]