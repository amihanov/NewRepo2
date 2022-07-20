
GO
--SqlScripter----[dbo].[DF_tblConsolidacionCabecera_iCorrelativo].sql
GO
ALTER TABLE [dbo].[tblConsolidacionCabecera] ADD CONSTRAINT [DF_tblConsolidacionCabecera_iCorrelativo] DEFAULT (1) FOR [iCorrelativo]
GO
--SqlScripter----[dbo].[DF_tblConsolidacionCabeceraPensioando_iCorrelativo].sql
GO
ALTER TABLE [dbo].[tblConsolidacionCabeceraPensionado] ADD CONSTRAINT [DF_tblConsolidacionCabeceraPensioando_iCorrelativo] DEFAULT (1) FOR [iCorrelativo]
GO
--SqlScripter----[dbo].[DF_tblInstitucion_participa].sql
GO
ALTER TABLE [dbo].[tblInstitucion] ADD CONSTRAINT [DF_tblInstitucion_participa] DEFAULT (0) FOR [bParticipa]
GO
--SqlScripter----[dbo].[DF_sis_Menu_idMenuPadre].sql
GO
ALTER TABLE [dbo].[tblMenu] ADD CONSTRAINT [DF_sis_Menu_idMenuPadre] DEFAULT (0) FOR [iIdMenuPadre]
GO
--SqlScripter----[dbo].[DF_tblPerfil_bAsignaCaja].sql
GO
ALTER TABLE [dbo].[tblPerfil] ADD CONSTRAINT [DF_tblPerfil_bAsignaCaja] DEFAULT (0) FOR [bAsignaCaja]
GO
--SqlScripter----[dbo].[DF_tblSUSESO_TipoAfiliado_iIdEstado].sql
GO
ALTER TABLE [dbo].[tblSUSESO_TipoAfiliado] ADD CONSTRAINT [DF_tblSUSESO_TipoAfiliado_iIdEstado] DEFAULT (20) FOR [iIdEstado]
GO
--SqlScripter----[dbo].[DF_tblSUSESO_TipoIdentificador_iIdEstado].sql
GO
ALTER TABLE [dbo].[tblSUSESO_TipoIdentificador] ADD CONSTRAINT [DF_tblSUSESO_TipoIdentificador_iIdEstado] DEFAULT (20) FOR [iIdEstado]
GO
--SqlScripter----[dbo].[DF_tblUsuario_tIntentos].sql
GO
ALTER TABLE [dbo].[tblUsuario] ADD CONSTRAINT [DF_tblUsuario_tIntentos] DEFAULT (0) FOR [tIntentos]