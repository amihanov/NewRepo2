
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
--SqlScripter----[dbo].[tblAviso].[FK_Aviso_ClienteConmutador].sql
GO
ALTER TABLE [dbo].[tblAviso] WITH NOCHECK ADD CONSTRAINT [FK_Aviso_ClienteConmutador] FOREIGN KEY ([cClienteConmutadorCodigo])
REFERENCES [dbo].[tblClienteConmutador] ([cClienteConmutadorCodigo])
GO
ALTER TABLE [dbo].[tblAviso] WITH CHECK CHECK CONSTRAINT [FK_Aviso_ClienteConmutador]
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
ON UPDATE CASCADE
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
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblClienteConmutadorDetalle] WITH CHECK CHECK CONSTRAINT [FK_Detalle_Cliente_Conmutador]
GO
--SqlScripter----[dbo].[tblClienteConmutadorDetalle].[FK_Tipo_ClienteConmutadorDeta].sql
GO
ALTER TABLE [dbo].[tblClienteConmutadorDetalle] WITH NOCHECK ADD CONSTRAINT [FK_Tipo_ClienteConmutadorDeta] FOREIGN KEY ([Tipo])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblClienteConmutadorDetalle] WITH CHECK CHECK CONSTRAINT [FK_Tipo_ClienteConmutadorDeta]
GO
--SqlScripter----[dbo].[tblClienteMensajeAutorizad].[FK_Cliente_TipoMensaj].sql
GO
ALTER TABLE [dbo].[tblClienteMensajeAutorizad] WITH NOCHECK ADD CONSTRAINT [FK_Cliente_TipoMensaj] FOREIGN KEY ([cClienteConmutadorCodigo])
REFERENCES [dbo].[tblClienteConmutador] ([cClienteConmutadorCodigo])
ON UPDATE CASCADE
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
--SqlScripter----[dbo].[tblMensaje].[FK_Mensaje_TipoMensaje].sql
GO
ALTER TABLE [dbo].[tblMensaje] WITH NOCHECK ADD CONSTRAINT [FK_Mensaje_TipoMensaje] FOREIGN KEY ([cIDTipoMensaje])
REFERENCES [dbo].[tblTipoMensaje] ([cIDTipoMensaje])
GO
ALTER TABLE [dbo].[tblMensaje] WITH CHECK CHECK CONSTRAINT [FK_Mensaje_TipoMensaje]
GO
--SqlScripter----[dbo].[tblMensajeClasificado].[FK_Clasificacion_Mensaje].sql
GO
ALTER TABLE [dbo].[tblMensajeClasificado] WITH NOCHECK ADD CONSTRAINT [FK_Clasificacion_Mensaje] FOREIGN KEY ([cIDTipoMensaje])
REFERENCES [dbo].[tblTipoMensaje] ([cIDTipoMensaje])
GO
ALTER TABLE [dbo].[tblMensajeClasificado] WITH CHECK CHECK CONSTRAINT [FK_Clasificacion_Mensaje]
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
--SqlScripter----[dbo].[tblMensajeEstado].[FK_Estado_Mensaje].sql
GO
ALTER TABLE [dbo].[tblMensajeEstado] WITH NOCHECK ADD CONSTRAINT [FK_Estado_Mensaje] FOREIGN KEY ([uIDMensaje])
REFERENCES [dbo].[tblMensaje] ([uIDMensaje])
GO
ALTER TABLE [dbo].[tblMensajeEstado] WITH CHECK CHECK CONSTRAINT [FK_Estado_Mensaje]
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
--SqlScripter----[dbo].[tblPerfil].[FK_Rol_Menu].sql
GO
ALTER TABLE [dbo].[tblPerfil] WITH NOCHECK ADD CONSTRAINT [FK_Rol_Menu] FOREIGN KEY ([cCodigo])
REFERENCES [dbo].[tblMenu] ([cCodigo])
GO
ALTER TABLE [dbo].[tblPerfil] WITH CHECK CHECK CONSTRAINT [FK_Rol_Menu]
GO
--SqlScripter----[dbo].[tblProceso].[R_Categoria_Proceso].sql
GO
ALTER TABLE [dbo].[tblProceso] WITH NOCHECK ADD CONSTRAINT [R_Categoria_Proceso] FOREIGN KEY ([uCategoria])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblProceso] WITH CHECK CHECK CONSTRAINT [R_Categoria_Proceso]
GO
--SqlScripter----[dbo].[tblProgramacionProceso].[FK_Horario_Calendario].sql
GO
ALTER TABLE [dbo].[tblProgramacionProceso] WITH NOCHECK ADD CONSTRAINT [FK_Horario_Calendario] FOREIGN KEY ([vcIDCalendario], [cTipo], [sdFecha])
REFERENCES [dbo].[tblCalendario] ([vcIDCalendario], [cTipo], [sdFecha])
GO
ALTER TABLE [dbo].[tblProgramacionProceso] WITH CHECK CHECK CONSTRAINT [FK_Horario_Calendario]
GO
--SqlScripter----[dbo].[tblProgramacionProceso].[FK_Proceso_Horario].sql
GO
ALTER TABLE [dbo].[tblProgramacionProceso] WITH NOCHECK ADD CONSTRAINT [FK_Proceso_Horario] FOREIGN KEY ([uIDProceso])
REFERENCES [dbo].[tblProceso] ([uIDProceso])
GO
ALTER TABLE [dbo].[tblProgramacionProceso] WITH CHECK CHECK CONSTRAINT [FK_Proceso_Horario]
GO
--SqlScripter----[dbo].[tblRegistroDiarioSecuencia].[FK_ConexionResumen_UsuarioConm].sql
GO
ALTER TABLE [dbo].[tblRegistroDiarioSecuencia] WITH NOCHECK ADD CONSTRAINT [FK_ConexionResumen_UsuarioConm] FOREIGN KEY ([cClienteConmutadorCodigo])
REFERENCES [dbo].[tblClienteConmutador] ([cClienteConmutadorCodigo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblRegistroDiarioSecuencia] WITH CHECK CHECK CONSTRAINT [FK_ConexionResumen_UsuarioConm]
GO
--SqlScripter----[dbo].[tblRegistroDiarioTotales].[FK_ResumenDetalle_Conexion].sql
GO
ALTER TABLE [dbo].[tblRegistroDiarioTotales] WITH NOCHECK ADD CONSTRAINT [FK_ResumenDetalle_Conexion] FOREIGN KEY ([uIDRegistroDiario])
REFERENCES [dbo].[tblRegistroDiarioSecuencia] ([uIDRegistroDiario])
GO
ALTER TABLE [dbo].[tblRegistroDiarioTotales] WITH CHECK CHECK CONSTRAINT [FK_ResumenDetalle_Conexion]
GO
--SqlScripter----[dbo].[tblRegistroSesionCliente].[FK_Conexion_UsuarioConmutador].sql
GO
ALTER TABLE [dbo].[tblRegistroSesionCliente] WITH NOCHECK ADD CONSTRAINT [FK_Conexion_UsuarioConmutador] FOREIGN KEY ([cClienteConmutadorCodigo])
REFERENCES [dbo].[tblClienteConmutador] ([cClienteConmutadorCodigo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblRegistroSesionCliente] WITH CHECK CHECK CONSTRAINT [FK_Conexion_UsuarioConmutador]
GO
--SqlScripter----[dbo].[tblSecuenciaClave].[FK_Folio_Usuario_Conmutador].sql
GO
ALTER TABLE [dbo].[tblSecuenciaClave] WITH NOCHECK ADD CONSTRAINT [FK_Folio_Usuario_Conmutador] FOREIGN KEY ([cClienteConmutadorCodigo])
REFERENCES [dbo].[tblClienteConmutador] ([cClienteConmutadorCodigo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblSecuenciaClave] WITH CHECK CHECK CONSTRAINT [FK_Folio_Usuario_Conmutador]
GO
--SqlScripter----[dbo].[tblSecuenciaClave].[FK_Informe_SecuenciaClave].sql
GO
ALTER TABLE [dbo].[tblSecuenciaClave] WITH NOCHECK ADD CONSTRAINT [FK_Informe_SecuenciaClave] FOREIGN KEY ([uIDSecuenciaClave])
REFERENCES [dbo].[tblInformeClave] ([uIDSecuenciaClave])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblSecuenciaClave] WITH CHECK CHECK CONSTRAINT [FK_Informe_SecuenciaClave]
GO
--SqlScripter----[dbo].[tblTarea].[FK_Tarea_Proceso].sql
GO
ALTER TABLE [dbo].[tblTarea] WITH NOCHECK ADD CONSTRAINT [FK_Tarea_Proceso] FOREIGN KEY ([uIDProceso])
REFERENCES [dbo].[tblProceso] ([uIDProceso])
GO
ALTER TABLE [dbo].[tblTarea] WITH CHECK CHECK CONSTRAINT [FK_Tarea_Proceso]
GO
--SqlScripter----[dbo].[tblTarea].[R_SubTipo_Tarea].sql
GO
ALTER TABLE [dbo].[tblTarea] WITH NOCHECK ADD CONSTRAINT [R_SubTipo_Tarea] FOREIGN KEY ([uSubTipo])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblTarea] WITH CHECK CHECK CONSTRAINT [R_SubTipo_Tarea]
GO
--SqlScripter----[dbo].[tblTarea].[R_Tipo_Tarea].sql
GO
ALTER TABLE [dbo].[tblTarea] WITH NOCHECK ADD CONSTRAINT [R_Tipo_Tarea] FOREIGN KEY ([uTipo])
REFERENCES [dbo].[tblParametro] ([uIDParametro])
GO
ALTER TABLE [dbo].[tblTarea] WITH CHECK CHECK CONSTRAINT [R_Tipo_Tarea]
GO
--SqlScripter----[dbo].[tblTareaHistorial].[FK_Detalle_Tarea].sql
GO
ALTER TABLE [dbo].[tblTareaHistorial] WITH NOCHECK ADD CONSTRAINT [FK_Detalle_Tarea] FOREIGN KEY ([uIDTarea], [uIDProceso])
REFERENCES [dbo].[tblTarea] ([uIDTarea], [uIDProceso])
GO
ALTER TABLE [dbo].[tblTareaHistorial] WITH CHECK CHECK CONSTRAINT [FK_Detalle_Tarea]
GO
--SqlScripter----[dbo].[tblTransaccion].[FK_Mensaje_ConexionOperacion].sql
GO
ALTER TABLE [dbo].[tblTransaccion] WITH NOCHECK ADD CONSTRAINT [FK_Mensaje_ConexionOperacion] FOREIGN KEY ([uIDMensaje])
REFERENCES [dbo].[tblMensaje] ([uIDMensaje])
GO
ALTER TABLE [dbo].[tblTransaccion] WITH CHECK CHECK CONSTRAINT [FK_Mensaje_ConexionOperacion]
GO
--SqlScripter----[dbo].[tblTransaccion].[FK_Transaccion_Sesion].sql
GO
ALTER TABLE [dbo].[tblTransaccion] WITH NOCHECK ADD CONSTRAINT [FK_Transaccion_Sesion] FOREIGN KEY ([uIDRegistroSesion])
REFERENCES [dbo].[tblRegistroSesionCliente] ([uIDRegistroSesion])
GO
ALTER TABLE [dbo].[tblTransaccion] WITH CHECK CHECK CONSTRAINT [FK_Transaccion_Sesion]
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
ON UPDATE CASCADE
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