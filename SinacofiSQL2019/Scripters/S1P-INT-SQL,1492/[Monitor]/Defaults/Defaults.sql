
GO
--SqlScripter----[dbo].[DF__tb_drives__SizeI__18178C8A].sql
GO
ALTER TABLE [dbo].[tb_drives] ADD CONSTRAINT [DF__tb_drives__SizeI__18178C8A] DEFAULT (0) FOR [SizeInicial]
GO
--SqlScripter----[dbo].[DF__tbl_Espac__flFil__601B4DB9].sql
GO
ALTER TABLE [dbo].[tbl_Espacio_Reporte] ADD CONSTRAINT [DF__tbl_Espac__flFil__601B4DB9] DEFAULT (0) FOR [flFileSizeMB]
GO
--SqlScripter----[dbo].[DF__tbl_Espac__flFre__6203962B].sql
GO
ALTER TABLE [dbo].[tbl_Espacio_Reporte] ADD CONSTRAINT [DF__tbl_Espac__flFre__6203962B] DEFAULT (0) FOR [flFreeSpaceMB]
GO
--SqlScripter----[dbo].[DF__tbl_Espac__flSpa__610F71F2].sql
GO
ALTER TABLE [dbo].[tbl_Espacio_Reporte] ADD CONSTRAINT [DF__tbl_Espac__flSpa__610F71F2] DEFAULT (0) FOR [flSpaceUsedMB]
GO
--SqlScripter----[dbo].[DF__tbl_Espac__vcRec__5F272980].sql
GO
ALTER TABLE [dbo].[tbl_Espacio_Reporte] ADD CONSTRAINT [DF__tbl_Espac__vcRec__5F272980] DEFAULT ('NA') FOR [vcRecoveryModel]
GO
--SqlScripter----[dbo].[DF__tbl_monit__fecha__55BFB948].sql
GO
ALTER TABLE [dbo].[tbl_monitorauditoria_dia] ADD CONSTRAINT [DF__tbl_monit__fecha__55BFB948] DEFAULT (getdate()) FOR [fecha]
GO
--SqlScripter----[dbo].[DF__tbl_sizeb__fecha__69FBBC1F].sql
GO
ALTER TABLE [dbo].[tbl_sizebd_files] ADD CONSTRAINT [DF__tbl_sizeb__fecha__69FBBC1F] DEFAULT (getdate()) FOR [fecha]