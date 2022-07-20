
GO
--SqlScripter----[dbo].[DuplicadorJobDetalle].[FK_MensajeDuplicadorResultado_DuplicadorJob].sql
GO
ALTER TABLE [dbo].[DuplicadorJobDetalle] WITH NOCHECK ADD CONSTRAINT [FK_MensajeDuplicadorResultado_DuplicadorJob] FOREIGN KEY ([JobId])
REFERENCES [dbo].[DuplicadorJob] ([Id])
GO
ALTER TABLE [dbo].[DuplicadorJobDetalle] WITH CHECK CHECK CONSTRAINT [FK_MensajeDuplicadorResultado_DuplicadorJob]
GO
--SqlScripter----[dbo].[DuplicadorJobDetalle].[FK_MensajeDuplicadorResultado_MensajeDuplicador].sql
GO
ALTER TABLE [dbo].[DuplicadorJobDetalle] WITH NOCHECK ADD CONSTRAINT [FK_MensajeDuplicadorResultado_MensajeDuplicador] FOREIGN KEY ([MensajeId])
REFERENCES [dbo].[DuplicadorMensaje] ([Id])
GO
ALTER TABLE [dbo].[DuplicadorJobDetalle] WITH CHECK CHECK CONSTRAINT [FK_MensajeDuplicadorResultado_MensajeDuplicador]
GO
--SqlScripter----[dbo].[tblBitacora].[FK_Usuario_Bitacora].sql
GO
ALTER TABLE [dbo].[tblBitacora] WITH NOCHECK ADD CONSTRAINT [FK_Usuario_Bitacora] FOREIGN KEY ([uIDUsuario])
REFERENCES [dbo].[tblUsuario] ([uIDUsuario])
GO
ALTER TABLE [dbo].[tblBitacora] WITH CHECK CHECK CONSTRAINT [FK_Usuario_Bitacora]
GO
--SqlScripter----[dbo].[tblBitacora].[R_SubTipo_Bitacora].sql
GO
ALTER TABLE [dbo].[tblBitacora] WITH NOCHECK ADD CONSTRAINT [R_SubTipo_Bitacora] FOREIGN KEY ([uSubTipo])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblBitacora] WITH CHECK CHECK CONSTRAINT [R_SubTipo_Bitacora]
GO
--SqlScripter----[dbo].[tblBitacora].[R_Tipo_Bitacora].sql
GO
ALTER TABLE [dbo].[tblBitacora] WITH NOCHECK ADD CONSTRAINT [R_Tipo_Bitacora] FOREIGN KEY ([uTipo])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblBitacora] WITH CHECK CHECK CONSTRAINT [R_Tipo_Bitacora]
GO
--SqlScripter----[dbo].[tblBitacoraDetalle].[FK_Detalle_Bitacora].sql
GO
ALTER TABLE [dbo].[tblBitacoraDetalle] WITH NOCHECK ADD CONSTRAINT [FK_Detalle_Bitacora] FOREIGN KEY ([uIDBitacora])
REFERENCES [dbo].[tblBitacora] ([uIDBitacora])
GO
ALTER TABLE [dbo].[tblBitacoraDetalle] WITH CHECK CHECK CONSTRAINT [FK_Detalle_Bitacora]
GO
--SqlScripter----[dbo].[tblBroadcastCliente].[FK_BroadCast_Cliente].sql
GO
ALTER TABLE [dbo].[tblBroadcastCliente] WITH NOCHECK ADD CONSTRAINT [FK_BroadCast_Cliente] FOREIGN KEY ([cClienteConmutadorCodigo])
REFERENCES [dbo].[tblClienteConmutador] ([cClienteConmutadorCodigo])
GO
ALTER TABLE [dbo].[tblBroadcastCliente] WITH CHECK CHECK CONSTRAINT [FK_BroadCast_Cliente]
GO
--SqlScripter----[dbo].[tblBroadcastCliente].[FK_Cliente_Broadcast].sql
GO
ALTER TABLE [dbo].[tblBroadcastCliente] WITH NOCHECK ADD CONSTRAINT [FK_Cliente_Broadcast] FOREIGN KEY ([cIDBroadcast])
REFERENCES [dbo].[tblBroadcast] ([cIDBroadcast])
GO
ALTER TABLE [dbo].[tblBroadcastCliente] WITH CHECK CHECK CONSTRAINT [FK_Cliente_Broadcast]
GO
--SqlScripter----[dbo].[tblCalendario].[FK_Tipo_Calendario].sql
GO
ALTER TABLE [dbo].[tblCalendario] WITH NOCHECK ADD CONSTRAINT [FK_Tipo_Calendario] FOREIGN KEY ([cTipo])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblCalendario] WITH CHECK CHECK CONSTRAINT [FK_Tipo_Calendario]
GO
--SqlScripter----[dbo].[tblClienteConmutadorDetalle].[FK_Detalle_Cliente_Conmutador].sql
GO
ALTER TABLE [dbo].[tblClienteConmutadorDetalle] WITH NOCHECK ADD CONSTRAINT [FK_Detalle_Cliente_Conmutador] FOREIGN KEY ([cClienteConmutadorCodigo])
REFERENCES [dbo].[tblClienteConmutador] ([cClienteConmutadorCodigo])
GO
ALTER TABLE [dbo].[tblClienteConmutadorDetalle] WITH CHECK CHECK CONSTRAINT [FK_Detalle_Cliente_Conmutador]
GO
--SqlScripter----[dbo].[tblClienteConmutadorDetalle].[R_Tipo_ClienteConmutadorDeta].sql
GO
ALTER TABLE [dbo].[tblClienteConmutadorDetalle] WITH NOCHECK ADD CONSTRAINT [R_Tipo_ClienteConmutadorDeta] FOREIGN KEY ([Tipo])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblClienteConmutadorDetalle] WITH CHECK CHECK CONSTRAINT [R_Tipo_ClienteConmutadorDeta]
GO
--SqlScripter----[dbo].[tblClienteMensajeAutorizad].[FK_Cliente_TipoMensaj].sql
GO
ALTER TABLE [dbo].[tblClienteMensajeAutorizad] WITH NOCHECK ADD CONSTRAINT [FK_Cliente_TipoMensaj] FOREIGN KEY ([cClienteConmutadorCodigo])
REFERENCES [dbo].[tblClienteConmutador] ([cClienteConmutadorCodigo])
GO
ALTER TABLE [dbo].[tblClienteMensajeAutorizad] WITH CHECK CHECK CONSTRAINT [FK_Cliente_TipoMensaj]
GO
--SqlScripter----[dbo].[tblClienteMensajeAutorizad].[FK_TipoMensaje_Cliente].sql
GO
ALTER TABLE [dbo].[tblClienteMensajeAutorizad] WITH NOCHECK ADD CONSTRAINT [FK_TipoMensaje_Cliente] FOREIGN KEY ([cIDTipoMensaje])
REFERENCES [dbo].[tblTipoMensaje] ([cIDTipoMensaje])
GO
ALTER TABLE [dbo].[tblClienteMensajeAutorizad] WITH CHECK CHECK CONSTRAINT [FK_TipoMensaje_Cliente]
GO
--SqlScripter----[dbo].[tblFormularioSeccion].[FK_Formulario_Seccion].sql
GO
ALTER TABLE [dbo].[tblFormularioSeccion] WITH NOCHECK ADD CONSTRAINT [FK_Formulario_Seccion] FOREIGN KEY ([cCodigoFormulario])
REFERENCES [dbo].[tblFormulario] ([cCodigoFormulario])
GO
ALTER TABLE [dbo].[tblFormularioSeccion] WITH CHECK CHECK CONSTRAINT [FK_Formulario_Seccion]
GO
--SqlScripter----[dbo].[tblInformeClave].[R_Causa_InformeClave].sql
GO
ALTER TABLE [dbo].[tblInformeClave] WITH NOCHECK ADD CONSTRAINT [R_Causa_InformeClave] FOREIGN KEY ([uCausa])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblInformeClave] WITH CHECK CHECK CONSTRAINT [R_Causa_InformeClave]
GO
--SqlScripter----[dbo].[tblInformeClave].[R_SubCausa_InformeClave].sql
GO
ALTER TABLE [dbo].[tblInformeClave] WITH NOCHECK ADD CONSTRAINT [R_SubCausa_InformeClave] FOREIGN KEY ([uSubCausa])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblInformeClave] WITH CHECK CHECK CONSTRAINT [R_SubCausa_InformeClave]
GO
--SqlScripter----[dbo].[tblMensajeComponente].[FK_Componente_Mensaje].sql
GO
ALTER TABLE [dbo].[tblMensajeComponente] WITH NOCHECK ADD CONSTRAINT [FK_Componente_Mensaje] FOREIGN KEY ([cIDTipoMensaje])
REFERENCES [dbo].[tblTipoMensaje] ([cIDTipoMensaje])
GO
ALTER TABLE [dbo].[tblMensajeComponente] WITH CHECK CHECK CONSTRAINT [FK_Componente_Mensaje]
GO
--SqlScripter----[dbo].[tblMensajeComponente].[FK_MensajeComponente_Detalle].sql
GO
ALTER TABLE [dbo].[tblMensajeComponente] WITH NOCHECK ADD CONSTRAINT [FK_MensajeComponente_Detalle] FOREIGN KEY ([cIDComponenteDetalle])
REFERENCES [dbo].[tblComponenteDetalle] ([cIDComponenteDetalle])
GO
ALTER TABLE [dbo].[tblMensajeComponente] WITH CHECK CHECK CONSTRAINT [FK_MensajeComponente_Detalle]
GO
--SqlScripter----[dbo].[tblMenu].[FK_Menu_Formulario].sql
GO
ALTER TABLE [dbo].[tblMenu] WITH NOCHECK ADD CONSTRAINT [FK_Menu_Formulario] FOREIGN KEY ([cCodigoFormulario])
REFERENCES [dbo].[tblFormulario] ([cCodigoFormulario])
GO
ALTER TABLE [dbo].[tblMenu] WITH CHECK CHECK CONSTRAINT [FK_Menu_Formulario]
GO
--SqlScripter----[dbo].[tblPerfil].[FK_Perfil_Rol].sql
GO
ALTER TABLE [dbo].[tblPerfil] WITH NOCHECK ADD CONSTRAINT [FK_Perfil_Rol] FOREIGN KEY ([uIDRol])
REFERENCES [dbo].[tblRol] ([uIDRol])
GO
ALTER TABLE [dbo].[tblPerfil] WITH CHECK CHECK CONSTRAINT [FK_Perfil_Rol]
GO
--SqlScripter----[dbo].[tblPerfilFormulario].[FK_Formulario_Perfil].sql
GO
ALTER TABLE [dbo].[tblPerfilFormulario] WITH NOCHECK ADD CONSTRAINT [FK_Formulario_Perfil] FOREIGN KEY ([uIDRol], [uIDPerfil])
REFERENCES [dbo].[tblPerfil] ([uIDRol], [uIDPerfil])
GO
ALTER TABLE [dbo].[tblPerfilFormulario] WITH CHECK CHECK CONSTRAINT [FK_Formulario_Perfil]
GO
--SqlScripter----[dbo].[tblPerfilFormulario].[FK_Perfil_Formulario].sql
GO
ALTER TABLE [dbo].[tblPerfilFormulario] WITH NOCHECK ADD CONSTRAINT [FK_Perfil_Formulario] FOREIGN KEY ([cCodigoFormulario])
REFERENCES [dbo].[tblFormulario] ([cCodigoFormulario])
GO
ALTER TABLE [dbo].[tblPerfilFormulario] WITH CHECK CHECK CONSTRAINT [FK_Perfil_Formulario]
GO
--SqlScripter----[dbo].[tblPerfilFormulario].[FK_Seccion_Perfil].sql
GO
ALTER TABLE [dbo].[tblPerfilFormulario] WITH NOCHECK ADD CONSTRAINT [FK_Seccion_Perfil] FOREIGN KEY ([cCodigoFormulario], [uIDFormularioSeccion])
REFERENCES [dbo].[tblFormularioSeccion] ([cCodigoFormulario], [uIDFormularioSeccion])
GO
ALTER TABLE [dbo].[tblPerfilFormulario] WITH CHECK CHECK CONSTRAINT [FK_Seccion_Perfil]
GO
--SqlScripter----[dbo].[tblSecuenciaClave].[FK_Folio_Usuario_Conmutador].sql
GO
ALTER TABLE [dbo].[tblSecuenciaClave] WITH NOCHECK ADD CONSTRAINT [FK_Folio_Usuario_Conmutador] FOREIGN KEY ([cClienteConmutadorCodigo])
REFERENCES [dbo].[tblClienteConmutador] ([cClienteConmutadorCodigo])
GO
ALTER TABLE [dbo].[tblSecuenciaClave] WITH CHECK CHECK CONSTRAINT [FK_Folio_Usuario_Conmutador]
GO
--SqlScripter----[dbo].[tblSecuenciaClave].[FK_Informe_SecuenciaClave].sql
GO
ALTER TABLE [dbo].[tblSecuenciaClave] WITH NOCHECK ADD CONSTRAINT [FK_Informe_SecuenciaClave] FOREIGN KEY ([uIDSecuenciaClave])
REFERENCES [dbo].[tblInformeClave] ([uIDSecuenciaClave])
GO
ALTER TABLE [dbo].[tblSecuenciaClave] WITH CHECK CHECK CONSTRAINT [FK_Informe_SecuenciaClave]
GO
--SqlScripter----[dbo].[tblTextoSistema].[FK_Estado_TextoSistema].sql
GO
ALTER TABLE [dbo].[tblTextoSistema] WITH NOCHECK ADD CONSTRAINT [FK_Estado_TextoSistema] FOREIGN KEY ([cEstado])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblTextoSistema] WITH CHECK CHECK CONSTRAINT [FK_Estado_TextoSistema]
GO
--SqlScripter----[dbo].[tblTextoSistema].[FK_SubTipo_TextoSistema].sql
GO
ALTER TABLE [dbo].[tblTextoSistema] WITH NOCHECK ADD CONSTRAINT [FK_SubTipo_TextoSistema] FOREIGN KEY ([uSubTipo])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblTextoSistema] WITH CHECK CHECK CONSTRAINT [FK_SubTipo_TextoSistema]
GO
--SqlScripter----[dbo].[tblTextoSistema].[FK_Tipo_TextoSistema].sql
GO
ALTER TABLE [dbo].[tblTextoSistema] WITH NOCHECK ADD CONSTRAINT [FK_Tipo_TextoSistema] FOREIGN KEY ([uTipo])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblTextoSistema] WITH CHECK CHECK CONSTRAINT [FK_Tipo_TextoSistema]
GO
--SqlScripter----[dbo].[tblUsuarioAsignacion].[FK_Asignacion_Usuario].sql
GO
ALTER TABLE [dbo].[tblUsuarioAsignacion] WITH NOCHECK ADD CONSTRAINT [FK_Asignacion_Usuario] FOREIGN KEY ([uIDUsuario])
REFERENCES [dbo].[tblUsuario] ([uIDUsuario])
GO
ALTER TABLE [dbo].[tblUsuarioAsignacion] WITH CHECK CHECK CONSTRAINT [FK_Asignacion_Usuario]
GO
--SqlScripter----[dbo].[tblUsuarioAsignacion].[R_SubTipoRecurso_Usua].sql
GO
ALTER TABLE [dbo].[tblUsuarioAsignacion] WITH NOCHECK ADD CONSTRAINT [R_SubTipoRecurso_Usua] FOREIGN KEY ([uSubTipoRecurso])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblUsuarioAsignacion] WITH CHECK CHECK CONSTRAINT [R_SubTipoRecurso_Usua]
GO
--SqlScripter----[dbo].[tblUsuarioAsignacion].[R_TipoRecurso_UsuarioAsig].sql
GO
ALTER TABLE [dbo].[tblUsuarioAsignacion] WITH NOCHECK ADD CONSTRAINT [R_TipoRecurso_UsuarioAsig] FOREIGN KEY ([uTipoRecurso])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblUsuarioAsignacion] WITH CHECK CHECK CONSTRAINT [R_TipoRecurso_UsuarioAsig]
GO
--SqlScripter----[dbo].[tblUsuarioDetalle].[FK_Detalle_Usuario].sql
GO
ALTER TABLE [dbo].[tblUsuarioDetalle] WITH NOCHECK ADD CONSTRAINT [FK_Detalle_Usuario] FOREIGN KEY ([uIDUsuario])
REFERENCES [dbo].[tblUsuario] ([uIDUsuario])
GO
ALTER TABLE [dbo].[tblUsuarioDetalle] WITH CHECK CHECK CONSTRAINT [FK_Detalle_Usuario]
GO
--SqlScripter----[dbo].[tblUsuarioDetalle].[R_Tipo_UsuarioDetalle].sql
GO
ALTER TABLE [dbo].[tblUsuarioDetalle] WITH NOCHECK ADD CONSTRAINT [R_Tipo_UsuarioDetalle] FOREIGN KEY ([uTipo])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblUsuarioDetalle] WITH CHECK CHECK CONSTRAINT [R_Tipo_UsuarioDetalle]
GO
--SqlScripter----[dbo].[tblUsuarioRol].[FK_Rol_Usuario].sql
GO
ALTER TABLE [dbo].[tblUsuarioRol] WITH NOCHECK ADD CONSTRAINT [FK_Rol_Usuario] FOREIGN KEY ([uIDUsuario])
REFERENCES [dbo].[tblUsuario] ([uIDUsuario])
GO
ALTER TABLE [dbo].[tblUsuarioRol] WITH CHECK CHECK CONSTRAINT [FK_Rol_Usuario]
GO
--SqlScripter----[dbo].[tblUsuarioRol].[FK_Usuario_Rol].sql
GO
ALTER TABLE [dbo].[tblUsuarioRol] WITH NOCHECK ADD CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY ([uIDRol])
REFERENCES [dbo].[tblRol] ([uIDRol])
GO
ALTER TABLE [dbo].[tblUsuarioRol] WITH CHECK CHECK CONSTRAINT [FK_Usuario_Rol]