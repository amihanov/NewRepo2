
GO
--SqlScripter----[dbo].[tblAviso].[XPKAviso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKAviso] ON [dbo].[tblAviso] (
	[uIDAviso] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblBitacora].[XPKBitacora].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKBitacora] ON [dbo].[tblBitacora] (
	[uIDBitacora] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblBroadcast].[XAKBroadcast_Nombre].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblBroadcast] ADD CONSTRAINT [XAKBroadcast_Nombre] UNIQUE NONCLUSTERED (
	[vcNombre] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblBroadcast].[XPKBroadcast].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKBroadcast] ON [dbo].[tblBroadcast] (
	[cIDBroadcast] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblBroadcastCliente].[XPKBroadcast_Cliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKBroadcast_Cliente] ON [dbo].[tblBroadcastCliente] (
	[cIDBroadcast] ASC,
	[cClienteConmutadorCodigo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCalendario].[XPKCalendario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKCalendario] ON [dbo].[tblCalendario] (
	[vcIDCalendario] ASC,
	[cTipo] ASC,
	[sdFecha] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblClienteConmutador].[XAKCliente_Conmutador_Puerto].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblClienteConmutador] ADD CONSTRAINT [XAKCliente_Conmutador_Puerto] UNIQUE NONCLUSTERED (
	[cPuerto] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblClienteConmutador].[XPKCliente_Conmutador].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKCliente_Conmutador] ON [dbo].[tblClienteConmutador] (
	[cClienteConmutadorCodigo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblClienteMensajeAutorizad].[XPKCliente_Mensaje_Autorizado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKCliente_Mensaje_Autorizado] ON [dbo].[tblClienteMensajeAutorizad] (
	[cIDTipoMensaje] ASC,
	[cClienteConmutadorCodigo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblComponenteDetalle].[XPKComponente_Detalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKComponente_Detalle] ON [dbo].[tblComponenteDetalle] (
	[cIDComponenteDetalle] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblFormulario].[XAKFormulario_Nombre].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblFormulario] ADD CONSTRAINT [XAKFormulario_Nombre] UNIQUE NONCLUSTERED (
	[vcNombre] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblFormulario].[XPKFormulario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKFormulario] ON [dbo].[tblFormulario] (
	[cCodigoFormulario] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblInformeClave].[XPKInforme_Clave].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKInforme_Clave] ON [dbo].[tblInformeClave] (
	[uIDSecuenciaClave] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMensaje].[XAKUMensaje_Entrega].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblMensaje] ADD CONSTRAINT [XAKUMensaje_Entrega] UNIQUE NONCLUSTERED (
	[cDestino] ASC,
	[dFechaEntrega] ASC,
	[cNSR] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMensaje].[XAKUMensaje_Envio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblMensaje] ADD CONSTRAINT [XAKUMensaje_Envio] UNIQUE NONCLUSTERED (
	[cEmisor] ASC,
	[dFechaIngreso] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMensaje].[XPKMENSAJE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKMENSAJE] ON [dbo].[tblMensaje] (
	[uIDMensaje] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMensajeComponente].[XPKMensaje_Componente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKMensaje_Componente] ON [dbo].[tblMensajeComponente] (
	[IDMensajeComponente] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMensajeEstado].[XPKMensaje_Estado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKMensaje_Estado] ON [dbo].[tblMensajeEstado] (
	[uIDMensaje] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMenu].[XAKMenu_CodigoFormulario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblMenu] ADD CONSTRAINT [XAKMenu_CodigoFormulario] UNIQUE NONCLUSTERED (
	[cCodigoFormulario] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMenu].[XAKMenu_Nombre].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblMenu] ADD CONSTRAINT [XAKMenu_Nombre] UNIQUE NONCLUSTERED (
	[vcMenuNombre] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMenu].[XPKMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKMenu] ON [dbo].[tblMenu] (
	[cCodigo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblParametro].[XPKParametro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKParametro] ON [dbo].[tblParametro] (
	[uIDParametro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPerfil].[XPKPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKPerfil] ON [dbo].[tblPerfil] (
	[uIDRol] ASC,
	[cCodigo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblProceso].[XPKProceso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKProceso] ON [dbo].[tblProceso] (
	[uIDProceso] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblProgramacionProceso].[XPKProgramacion_Proceso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKProgramacion_Proceso] ON [dbo].[tblProgramacionProceso] (
	[vcIDCalendario] ASC,
	[cTipo] ASC,
	[sdFecha] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRegistroDiarioSecuencia].[XPKRegistro_Diario_Secuencia].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKRegistro_Diario_Secuencia] ON [dbo].[tblRegistroDiarioSecuencia] (
	[uIDRegistroDiario] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRegistroDiarioTotales].[XPKRegistro_Diario_Totales].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKRegistro_Diario_Totales] ON [dbo].[tblRegistroDiarioTotales] (
	[uIDRegistroDiario] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRegistroSesionCliente].[XPKRegistro_Sesion_Cliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKRegistro_Sesion_Cliente] ON [dbo].[tblRegistroSesionCliente] (
	[uIDRegistroSesion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRol].[XPKRol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKRol] ON [dbo].[tblRol] (
	[uIDRol] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblSecuenciaClave].[XAKSecuencia_Clave_Secuencia].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblSecuenciaClave] ADD CONSTRAINT [XAKSecuencia_Clave_Secuencia] UNIQUE NONCLUSTERED (
	[iSecuencia] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTarea].[XPKTarea].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKTarea] ON [dbo].[tblTarea] (
	[uIDTarea] ASC,
	[uIDProceso] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTareaHistorial].[XPKTarea_Historial].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKTarea_Historial] ON [dbo].[tblTareaHistorial] (
	[uIDTarea] ASC,
	[uIDProceso] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTextoSistema].[XPKTextoSistema].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKTextoSistema] ON [dbo].[tblTextoSistema] (
	[cGrupo] ASC,
	[cCodigo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTipoMensaje].[XPKTipo_Mensaje].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKTipo_Mensaje] ON [dbo].[tblTipoMensaje] (
	[cIDTipoMensaje] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuario].[XAKUsuario_Rut].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblUsuario] ADD CONSTRAINT [XAKUsuario_Rut] UNIQUE NONCLUSTERED (
	[cRUT] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuario].[XAKUsuario_RUTNombreApellido].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblUsuario] ADD CONSTRAINT [XAKUsuario_RUTNombreApellido] UNIQUE NONCLUSTERED (
	[cRUT] ASC,
	[vcNombre] ASC,
	[vcApellido] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuario].[XPKUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKUsuario] ON [dbo].[tblUsuario] (
	[uIDUsuario] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuarioRol].[XPKUsuario_Rol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKUsuario_Rol] ON [dbo].[tblUsuarioRol] (
	[uIDUsuario] ASC,
	[uIDRol] ASC
) ON [PRIMARY]
