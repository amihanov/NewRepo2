
GO
--SqlScripter----[sysutility_ucp_core].[DF__cpu_utili__datab__2610A626].sql
GO
ALTER TABLE [sysutility_ucp_core].[cpu_utilization_internal] ADD CONSTRAINT [DF__cpu_utili__datab__2610A626] DEFAULT (N'') FOR [database_name]
GO
--SqlScripter----[sysutility_ucp_core].[DF__cpu_utili__physi__24285DB4].sql
GO
ALTER TABLE [sysutility_ucp_core].[cpu_utilization_internal] ADD CONSTRAINT [DF__cpu_utili__physi__24285DB4] DEFAULT (N'') FOR [physical_server_name]
GO
--SqlScripter----[sysutility_ucp_core].[DF__cpu_utili__serve__251C81ED].sql
GO
ALTER TABLE [sysutility_ucp_core].[cpu_utilization_internal] ADD CONSTRAINT [DF__cpu_utili__serve__251C81ED] DEFAULT (N'') FOR [server_instance_name]
GO
--SqlScripter----[sysutility_ucp_core].[DF__space_uti__datab__2CBDA3B5].sql
GO
ALTER TABLE [sysutility_ucp_core].[space_utilization_internal] ADD CONSTRAINT [DF__space_uti__datab__2CBDA3B5] DEFAULT (N'') FOR [database_name]
GO
--SqlScripter----[sysutility_ucp_core].[DF__space_uti__dbfil__2EA5EC27].sql
GO
ALTER TABLE [sysutility_ucp_core].[space_utilization_internal] ADD CONSTRAINT [DF__space_uti__dbfil__2EA5EC27] DEFAULT (N'') FOR [dbfile_name]
GO
--SqlScripter----[sysutility_ucp_core].[DF__space_uti__fileg__2DB1C7EE].sql
GO
ALTER TABLE [sysutility_ucp_core].[space_utilization_internal] ADD CONSTRAINT [DF__space_uti__fileg__2DB1C7EE] DEFAULT (N'') FOR [filegroup_name]
GO
--SqlScripter----[sysutility_ucp_core].[DF__space_uti__serve__2AD55B43].sql
GO
ALTER TABLE [sysutility_ucp_core].[space_utilization_internal] ADD CONSTRAINT [DF__space_uti__serve__2AD55B43] DEFAULT (N'') FOR [server_instance_name]
GO
--SqlScripter----[sysutility_ucp_core].[DF__space_uti__virtu__29E1370A].sql
GO
ALTER TABLE [sysutility_ucp_core].[space_utilization_internal] ADD CONSTRAINT [DF__space_uti__virtu__29E1370A] DEFAULT (N'') FOR [virtual_server_name]
GO
--SqlScripter----[sysutility_ucp_core].[DF__space_uti__volum__2BC97F7C].sql
GO
ALTER TABLE [sysutility_ucp_core].[space_utilization_internal] ADD CONSTRAINT [DF__space_uti__volum__2BC97F7C] DEFAULT (N'') FOR [volume_device_id]