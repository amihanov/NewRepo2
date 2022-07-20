
GO
--SqlScripter----[BroadCastEstado].sql
GO
ALTER TABLE [dbo].[tblBroadcast] WITH NOCHECK ADD CONSTRAINT [BroadCastEstado] CHECK (([cEstado]='ACTIVO' OR [cEstado]='INACTIVO' OR [cEstado]='ELIMINADO LOGICO'))
GO
ALTER TABLE [dbo].[tblBroadcast] WITH CHECK CHECK CONSTRAINT [BroadCastEstado]
GO
--SqlScripter----[Cliente_ConmutadorEstado].sql
GO
ALTER TABLE [dbo].[tblClienteConmutador] WITH NOCHECK ADD CONSTRAINT [Cliente_ConmutadorEstado] CHECK (([cEstado]='ACTIVO' OR [cEstado]='INACTIVO' OR [cEstado]='ELIMINADO LOGICO' OR [cEstado]='CONECTADO' OR [cEstado]='DESCONECTADO' OR [cEstado]='SUSPENDIDO'))
GO
ALTER TABLE [dbo].[tblClienteConmutador] WITH CHECK CHECK CONSTRAINT [Cliente_ConmutadorEstado]
GO
--SqlScripter----[FormularioEstado].sql
GO
ALTER TABLE [dbo].[tblFormulario] WITH NOCHECK ADD CONSTRAINT [FormularioEstado] CHECK (([cEstado]='ACTIVO' OR [cEstado]='INACTIVO' OR [cEstado]='EN DESARROLLO' OR [cEstado]='ELIMINADO LOGICO'))
GO
ALTER TABLE [dbo].[tblFormulario] WITH CHECK CHECK CONSTRAINT [FormularioEstado]
GO
--SqlScripter----[Informe_Clave_TipoGenerador].sql
GO
ALTER TABLE [dbo].[tblInformeClave] WITH NOCHECK ADD CONSTRAINT [Informe_Clave_TipoGenerador] CHECK (([cTipoGenerador]='AUTOMATICO' OR [cTipoGenerador]='OPERADOR'))
GO
ALTER TABLE [dbo].[tblInformeClave] WITH CHECK CHECK CONSTRAINT [Informe_Clave_TipoGenerador]
GO
--SqlScripter----[MenuEstado_1720339802].sql
GO
ALTER TABLE [dbo].[tblMenu] WITH NOCHECK ADD CONSTRAINT [MenuEstado_1720339802] CHECK (([cEstado]='ACTIVO' OR [cEstado]='INACTIVO' OR [cEstado]='ELIMINADO LOGICO'))
GO
ALTER TABLE [dbo].[tblMenu] WITH CHECK CHECK CONSTRAINT [MenuEstado_1720339802]
GO
--SqlScripter----[ParametroClase].sql
GO
ALTER TABLE [dbo].[tblParametro] WITH NOCHECK ADD CONSTRAINT [ParametroClase] CHECK (([cClase]='OPERATIVOS' OR [cClase]='SISTEMA' OR [cClase]='ADMINISTRATIVOS'))
GO
ALTER TABLE [dbo].[tblParametro] WITH CHECK CHECK CONSTRAINT [ParametroClase]
GO
--SqlScripter----[ParametroSubClase].sql
GO
ALTER TABLE [dbo].[tblParametro] WITH NOCHECK ADD CONSTRAINT [ParametroSubClase] CHECK (([cSubClase]='MANTENEDORES' OR [cSubClase]='ESTADOS' OR [cSubClase]='OPCIONES' OR [cSubClase]='CONFIGURACIONES' OR [cSubClase]='PARAMETROS'))
GO
ALTER TABLE [dbo].[tblParametro] WITH CHECK CHECK CONSTRAINT [ParametroSubClase]
GO
--SqlScripter----[RolEstado].sql
GO
ALTER TABLE [dbo].[tblRol] WITH NOCHECK ADD CONSTRAINT [RolEstado] CHECK (([cEstado]='ACTIVO' OR [cEstado]='INACTIVO' OR [cEstado]='ELIMINADO LOGICO'))
GO
ALTER TABLE [dbo].[tblRol] WITH CHECK CHECK CONSTRAINT [RolEstado]
GO
--SqlScripter----[UsuarioEstado].sql
GO
ALTER TABLE [dbo].[tblUsuario] WITH NOCHECK ADD CONSTRAINT [UsuarioEstado] CHECK (([cEstado]='ACTIVO' OR [cEstado]='INACTIVO' OR [cEstado]='ELIMINADO LOGICO' OR [cEstado]='SUSPENDIDO'))
GO
ALTER TABLE [dbo].[tblUsuario] WITH CHECK CHECK CONSTRAINT [UsuarioEstado]
GO
--SqlScripter----[UsuarioRolEstado].sql
GO
ALTER TABLE [dbo].[tblUsuarioRol] WITH NOCHECK ADD CONSTRAINT [UsuarioRolEstado] CHECK (([cEstado]='ACTIVO' OR [cEstado]='INACTIVO' OR [cEstado]='ELIMINADO LOGICO'))
GO
ALTER TABLE [dbo].[tblUsuarioRol] WITH CHECK CHECK CONSTRAINT [UsuarioRolEstado]