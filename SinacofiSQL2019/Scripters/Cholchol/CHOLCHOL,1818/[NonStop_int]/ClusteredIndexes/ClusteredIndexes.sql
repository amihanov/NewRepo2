
GO
--SqlScripter----[dbo].[DuplicadorJob].[PK_DuplicadorJob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DuplicadorJob] ADD CONSTRAINT [PK_DuplicadorJob] PRIMARY KEY CLUSTERED (
	[Id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DuplicadorJobDetalle].[PK_MensajeDuplicadorResultado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DuplicadorJobDetalle] ADD CONSTRAINT [PK_MensajeDuplicadorResultado] PRIMARY KEY CLUSTERED (
	[JobId] ASC,
	[MensajeId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DuplicadorMensaje].[PK_DuplicadorMensajes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DuplicadorMensaje] ADD CONSTRAINT [PK_DuplicadorMensajes] PRIMARY KEY CLUSTERED (
	[Id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblBitacora].[XPKBitacora].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblBitacora] ADD CONSTRAINT [XPKBitacora] PRIMARY KEY CLUSTERED (
	[uIDBitacora] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblBitacoraDetalle].[XPKBitacora_Detalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblBitacoraDetalle] ADD CONSTRAINT [XPKBitacora_Detalle] PRIMARY KEY CLUSTERED (
	[uIDBitacora] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblBroadcast].[XPKBroadcast].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblBroadcast] ADD CONSTRAINT [XPKBroadcast] PRIMARY KEY CLUSTERED (
	[cIDBroadcast] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblBroadcastCliente].[XPKBroadcast_Cliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblBroadcastCliente] ADD CONSTRAINT [XPKBroadcast_Cliente] PRIMARY KEY CLUSTERED (
	[cIDBroadcast] ASC,
	[cClienteConmutadorCodigo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCalendario].[XPKCalendario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblCalendario] ADD CONSTRAINT [XPKCalendario] PRIMARY KEY CLUSTERED (
	[vcIDCalendario] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblClienteConmutador].[XPKCliente_Conmutador].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblClienteConmutador] ADD CONSTRAINT [XPKCliente_Conmutador] PRIMARY KEY CLUSTERED (
	[cClienteConmutadorCodigo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblClienteConmutadorDetalle].[XPKCliente_Conmutador_Detalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblClienteConmutadorDetalle] ADD CONSTRAINT [XPKCliente_Conmutador_Detalle] PRIMARY KEY CLUSTERED (
	[cClienteConmutadorCodigo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblClienteMensajeAutorizad].[XPKCliente_Mensaje_Autorizado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblClienteMensajeAutorizad] ADD CONSTRAINT [XPKCliente_Mensaje_Autorizado] PRIMARY KEY CLUSTERED (
	[cIDTipoMensaje] ASC,
	[cClienteConmutadorCodigo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblComponenteDetalle].[XPKComponente_Detalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblComponenteDetalle] ADD CONSTRAINT [XPKComponente_Detalle] PRIMARY KEY CLUSTERED (
	[cIDComponenteDetalle] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblFormulario].[XPKFormulario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblFormulario] ADD CONSTRAINT [XPKFormulario] PRIMARY KEY CLUSTERED (
	[cCodigoFormulario] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblFormularioSeccion].[XPKFormulario_Seccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblFormularioSeccion] ADD CONSTRAINT [XPKFormulario_Seccion] PRIMARY KEY CLUSTERED (
	[cCodigoFormulario] ASC,
	[uIDFormularioSeccion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblInformeClave].[XPKInforme_Clave].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblInformeClave] ADD CONSTRAINT [XPKInforme_Clave] PRIMARY KEY CLUSTERED (
	[uIDSecuenciaClave] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMensajeComponente].[XPKMensaje_Componente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblMensajeComponente] ADD CONSTRAINT [XPKMensaje_Componente] PRIMARY KEY CLUSTERED (
	[IDMensajeComponente] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMenu].[XPKMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblMenu] ADD CONSTRAINT [XPKMenu] PRIMARY KEY CLUSTERED (
	[cCodigo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblParametro].[XPKParametro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblParametro] ADD CONSTRAINT [XPKParametro] PRIMARY KEY CLUSTERED (
	[uIDParametro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPerfil].[XPKPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblPerfil] ADD CONSTRAINT [XPKPerfil] PRIMARY KEY CLUSTERED (
	[uIDRol] ASC,
	[uIDPerfil] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPerfilFormulario].[XPKPerfil_Formulario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblPerfilFormulario] ADD CONSTRAINT [XPKPerfil_Formulario] PRIMARY KEY CLUSTERED (
	[uIDRol] ASC,
	[uIDPerfil] ASC,
	[cCodigoFormulario] ASC,
	[uIDFormularioSeccion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRol].[XPKRol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblRol] ADD CONSTRAINT [XPKRol] PRIMARY KEY CLUSTERED (
	[uIDRol] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblSecuenciaClave].[XPKSecuencia_Clave].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblSecuenciaClave] ADD CONSTRAINT [XPKSecuencia_Clave] PRIMARY KEY CLUSTERED (
	[uIDSecuenciaClave] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTextoSistema].[XPKTextoSistema].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblTextoSistema] ADD CONSTRAINT [XPKTextoSistema] PRIMARY KEY CLUSTERED (
	[uIDTextoSistema] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTipoMensaje].[XPKTipo_Mensaje].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblTipoMensaje] ADD CONSTRAINT [XPKTipo_Mensaje] PRIMARY KEY CLUSTERED (
	[cIDTipoMensaje] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuario].[XPKUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblUsuario] ADD CONSTRAINT [XPKUsuario] PRIMARY KEY CLUSTERED (
	[uIDUsuario] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuarioAsignacion].[XPKUsuario_Asignacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblUsuarioAsignacion] ADD CONSTRAINT [XPKUsuario_Asignacion] PRIMARY KEY CLUSTERED (
	[uIDUsuario] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuarioDetalle].[XPKUsuario_Detalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblUsuarioDetalle] ADD CONSTRAINT [XPKUsuario_Detalle] PRIMARY KEY CLUSTERED (
	[uIDUsuario] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuarioRol].[XPKUsuario_Rol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tblUsuarioRol] ADD CONSTRAINT [XPKUsuario_Rol] PRIMARY KEY CLUSTERED (
	[uIDUsuario] ASC,
	[uIDRol] ASC
) ON [PRIMARY]
