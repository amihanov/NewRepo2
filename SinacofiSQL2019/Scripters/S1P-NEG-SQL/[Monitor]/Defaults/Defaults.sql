
GO
--SqlScripter----[dbo].[DF__tb_drives__SizeI__429E30F3].sql
GO
ALTER TABLE [dbo].[tb_drives] ADD CONSTRAINT [DF__tb_drives__SizeI__429E30F3] DEFAULT (0) FOR [SizeInicial]
GO
--SqlScripter----[dbo].[DF__tbl_monit__fecha__11158940].sql
GO
ALTER TABLE [dbo].[tbl_monitorauditoria_dia] ADD CONSTRAINT [DF__tbl_monit__fecha__11158940] DEFAULT (getdate()) FOR [fecha]
GO
--SqlScripter----[dbo].[DF__tbl_sizeb__fecha__69FBBC1F].sql
GO
ALTER TABLE [dbo].[tbl_sizebd_files] ADD CONSTRAINT [DF__tbl_sizeb__fecha__69FBBC1F] DEFAULT (getdate()) FOR [fecha]