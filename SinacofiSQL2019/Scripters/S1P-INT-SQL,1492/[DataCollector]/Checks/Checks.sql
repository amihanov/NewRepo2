
GO
--SqlScripter----[CHK_active_sessions_and_requests_check_operator].sql
GO
ALTER TABLE [snapshots].[active_sessions_and_requests] WITH NOCHECK ADD CONSTRAINT [CHK_active_sessions_and_requests_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[active_sessions_and_requests] WITH CHECK CHECK CONSTRAINT [CHK_active_sessions_and_requests_check_operator]
GO
--SqlScripter----[CHK_disk_usage_check_operator].sql
GO
ALTER TABLE [snapshots].[disk_usage] WITH NOCHECK ADD CONSTRAINT [CHK_disk_usage_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[disk_usage] WITH CHECK CHECK CONSTRAINT [CHK_disk_usage_check_operator]
GO
--SqlScripter----[CHK_io_virtual_file_stats_check_operator].sql
GO
ALTER TABLE [snapshots].[io_virtual_file_stats] WITH NOCHECK ADD CONSTRAINT [CHK_io_virtual_file_stats_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[io_virtual_file_stats] WITH CHECK CHECK CONSTRAINT [CHK_io_virtual_file_stats_check_operator]
GO
--SqlScripter----[CHK_log_usage_check_operator].sql
GO
ALTER TABLE [snapshots].[log_usage] WITH NOCHECK ADD CONSTRAINT [CHK_log_usage_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[log_usage] WITH CHECK CHECK CONSTRAINT [CHK_log_usage_check_operator]
GO
--SqlScripter----[CHK_os_latch_stats_check_operator].sql
GO
ALTER TABLE [snapshots].[os_latch_stats] WITH NOCHECK ADD CONSTRAINT [CHK_os_latch_stats_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[os_latch_stats] WITH CHECK CHECK CONSTRAINT [CHK_os_latch_stats_check_operator]
GO
--SqlScripter----[CHK_os_memory_clerks_check_operator].sql
GO
ALTER TABLE [snapshots].[os_memory_clerks] WITH NOCHECK ADD CONSTRAINT [CHK_os_memory_clerks_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[os_memory_clerks] WITH CHECK CHECK CONSTRAINT [CHK_os_memory_clerks_check_operator]
GO
--SqlScripter----[CHK_os_memory_nodes_check_operator].sql
GO
ALTER TABLE [snapshots].[os_memory_nodes] WITH NOCHECK ADD CONSTRAINT [CHK_os_memory_nodes_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[os_memory_nodes] WITH CHECK CHECK CONSTRAINT [CHK_os_memory_nodes_check_operator]
GO
--SqlScripter----[CHK_os_process_memory_check_operator].sql
GO
ALTER TABLE [snapshots].[os_process_memory] WITH NOCHECK ADD CONSTRAINT [CHK_os_process_memory_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[os_process_memory] WITH CHECK CHECK CONSTRAINT [CHK_os_process_memory_check_operator]
GO
--SqlScripter----[CHK_os_schedulers_check_operator].sql
GO
ALTER TABLE [snapshots].[os_schedulers] WITH NOCHECK ADD CONSTRAINT [CHK_os_schedulers_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[os_schedulers] WITH CHECK CHECK CONSTRAINT [CHK_os_schedulers_check_operator]
GO
--SqlScripter----[CHK_os_wait_stats_check_operator].sql
GO
ALTER TABLE [snapshots].[os_wait_stats] WITH NOCHECK ADD CONSTRAINT [CHK_os_wait_stats_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[os_wait_stats] WITH CHECK CHECK CONSTRAINT [CHK_os_wait_stats_check_operator]
GO
--SqlScripter----[CHK_performance_counter_values_check_operator].sql
GO
ALTER TABLE [snapshots].[performance_counter_values] WITH NOCHECK ADD CONSTRAINT [CHK_performance_counter_values_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[performance_counter_values] WITH CHECK CHECK CONSTRAINT [CHK_performance_counter_values_check_operator]
GO
--SqlScripter----[CHK_query_stats_check_operator].sql
GO
ALTER TABLE [snapshots].[query_stats] WITH NOCHECK ADD CONSTRAINT [CHK_query_stats_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[query_stats] WITH CHECK CHECK CONSTRAINT [CHK_query_stats_check_operator]
GO
--SqlScripter----[CHK_sql_process_and_system_memory_check_operator].sql
GO
ALTER TABLE [snapshots].[sql_process_and_system_memory] WITH NOCHECK ADD CONSTRAINT [CHK_sql_process_and_system_memory_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[sql_process_and_system_memory] WITH CHECK CHECK CONSTRAINT [CHK_sql_process_and_system_memory_check_operator]
GO
--SqlScripter----[CHK_check_operator_E4F8A95D-2C44-48B6-85BA-E78E47C7ACCE].sql
GO
ALTER TABLE [snapshots].[sysutility_ucp_batch_manifests_internal] WITH NOCHECK ADD CONSTRAINT [CHK_check_operator_E4F8A95D-2C44-48B6-85BA-E78E47C7ACCE] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[sysutility_ucp_batch_manifests_internal] WITH CHECK CHECK CONSTRAINT [CHK_check_operator_E4F8A95D-2C44-48B6-85BA-E78E47C7ACCE]
GO
--SqlScripter----[CHK_check_operator_9DAA9ACC-F1E1-44F8-8B74-D081734E5F39].sql
GO
ALTER TABLE [snapshots].[sysutility_ucp_cpu_memory_configurations_internal] WITH NOCHECK ADD CONSTRAINT [CHK_check_operator_9DAA9ACC-F1E1-44F8-8B74-D081734E5F39] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[sysutility_ucp_cpu_memory_configurations_internal] WITH CHECK CHECK CONSTRAINT [CHK_check_operator_9DAA9ACC-F1E1-44F8-8B74-D081734E5F39]
GO
--SqlScripter----[CHK_check_operator_D79F8519-D243-4176-8291-6F3BA8EF776D].sql
GO
ALTER TABLE [snapshots].[sysutility_ucp_volumes_internal] WITH NOCHECK ADD CONSTRAINT [CHK_check_operator_D79F8519-D243-4176-8291-6F3BA8EF776D] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[sysutility_ucp_volumes_internal] WITH CHECK CHECK CONSTRAINT [CHK_check_operator_D79F8519-D243-4176-8291-6F3BA8EF776D]
GO
--SqlScripter----[CHK_trace_data_check_operator].sql
GO
ALTER TABLE [snapshots].[trace_data] WITH NOCHECK ADD CONSTRAINT [CHK_trace_data_check_operator] CHECK (([core].[fn_check_operator]([snapshot_id])=(1)))
GO
ALTER TABLE [snapshots].[trace_data] WITH CHECK CHECK CONSTRAINT [CHK_trace_data_check_operator]
GO
--SqlScripter----[chk_databases_internal_state].sql
GO
ALTER TABLE [sysutility_ucp_core].[databases_internal] WITH NOCHECK ADD CONSTRAINT [chk_databases_internal_state] CHECK (([state]>=(0) AND [state]<=(1)))
GO
ALTER TABLE [sysutility_ucp_core].[databases_internal] WITH CHECK CHECK CONSTRAINT [chk_databases_internal_state]