
GO
--SqlScripter----[core].[snapshots_internal].[FK_snapshots_snapshots_timetable].sql
GO
ALTER TABLE [core].[snapshots_internal] WITH NOCHECK ADD CONSTRAINT [FK_snapshots_snapshots_timetable] FOREIGN KEY ([snapshot_time_id])
REFERENCES [core].[snapshot_timetable_internal] ([snapshot_time_id])
GO
ALTER TABLE [core].[snapshots_internal] WITH CHECK CHECK CONSTRAINT [FK_snapshots_snapshots_timetable]
GO
--SqlScripter----[core].[snapshots_internal].[FK_snapshots_source_info].sql
GO
ALTER TABLE [core].[snapshots_internal] WITH NOCHECK ADD CONSTRAINT [FK_snapshots_source_info] FOREIGN KEY ([source_id])
REFERENCES [core].[source_info_internal] ([source_id])
GO
ALTER TABLE [core].[snapshots_internal] WITH CHECK CHECK CONSTRAINT [FK_snapshots_source_info]
GO
--SqlScripter----[core].[wait_types].[FK_events_categories].sql
GO
ALTER TABLE [core].[wait_types] WITH NOCHECK ADD CONSTRAINT [FK_events_categories] FOREIGN KEY ([category_id])
REFERENCES [core].[wait_categories] ([category_id])
GO
ALTER TABLE [core].[wait_types] WITH CHECK CHECK CONSTRAINT [FK_events_categories]
GO
--SqlScripter----[snapshots].[active_sessions_and_requests].[FK_active_sessions_and_requests_snapshots_internal].sql
GO
ALTER TABLE [snapshots].[active_sessions_and_requests] WITH NOCHECK ADD CONSTRAINT [FK_active_sessions_and_requests_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[active_sessions_and_requests] WITH CHECK CHECK CONSTRAINT [FK_active_sessions_and_requests_snapshots_internal]
GO
--SqlScripter----[snapshots].[disk_usage].[FK_disk_usage_snapshots_internal].sql
GO
ALTER TABLE [snapshots].[disk_usage] WITH NOCHECK ADD CONSTRAINT [FK_disk_usage_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[disk_usage] WITH CHECK CHECK CONSTRAINT [FK_disk_usage_snapshots_internal]
GO
--SqlScripter----[snapshots].[distinct_queries].[FK_distinct_queries_source_info_internal].sql
GO
ALTER TABLE [snapshots].[distinct_queries] WITH NOCHECK ADD CONSTRAINT [FK_distinct_queries_source_info_internal] FOREIGN KEY ([source_id])
REFERENCES [core].[source_info_internal] ([source_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[distinct_queries] WITH CHECK CHECK CONSTRAINT [FK_distinct_queries_source_info_internal]
GO
--SqlScripter----[snapshots].[distinct_query_to_handle].[FK_distinct_query_to_handle_distinct_queries].sql
GO
ALTER TABLE [snapshots].[distinct_query_to_handle] WITH NOCHECK ADD CONSTRAINT [FK_distinct_query_to_handle_distinct_queries] FOREIGN KEY ([source_id], [distinct_query_hash])
REFERENCES [snapshots].[distinct_queries] ([source_id], [distinct_query_hash])
GO
ALTER TABLE [snapshots].[distinct_query_to_handle] WITH CHECK CHECK CONSTRAINT [FK_distinct_query_to_handle_distinct_queries]
GO
--SqlScripter----[snapshots].[distinct_query_to_handle].[FK_distinct_query_to_handle_notable_query_text].sql
GO
ALTER TABLE [snapshots].[distinct_query_to_handle] WITH NOCHECK ADD CONSTRAINT [FK_distinct_query_to_handle_notable_query_text] FOREIGN KEY ([source_id], [sql_handle])
REFERENCES [snapshots].[notable_query_text] ([source_id], [sql_handle])
GO
ALTER TABLE [snapshots].[distinct_query_to_handle] WITH CHECK CHECK CONSTRAINT [FK_distinct_query_to_handle_notable_query_text]
GO
--SqlScripter----[snapshots].[distinct_query_to_handle].[FK_distinct_query_to_handle_source_info_internal].sql
GO
ALTER TABLE [snapshots].[distinct_query_to_handle] WITH NOCHECK ADD CONSTRAINT [FK_distinct_query_to_handle_source_info_internal] FOREIGN KEY ([source_id])
REFERENCES [core].[source_info_internal] ([source_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[distinct_query_to_handle] WITH CHECK CHECK CONSTRAINT [FK_distinct_query_to_handle_source_info_internal]
GO
--SqlScripter----[snapshots].[io_virtual_file_stats].[FK_io_virtual_file_stats].sql
GO
ALTER TABLE [snapshots].[io_virtual_file_stats] WITH NOCHECK ADD CONSTRAINT [FK_io_virtual_file_stats] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[io_virtual_file_stats] WITH CHECK CHECK CONSTRAINT [FK_io_virtual_file_stats]
GO
--SqlScripter----[snapshots].[log_usage].[FK_log_usage_snapshots_internal].sql
GO
ALTER TABLE [snapshots].[log_usage] WITH NOCHECK ADD CONSTRAINT [FK_log_usage_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[log_usage] WITH CHECK CHECK CONSTRAINT [FK_log_usage_snapshots_internal]
GO
--SqlScripter----[snapshots].[notable_query_plan].[FK_notable_query_plan_source_info_internal].sql
GO
ALTER TABLE [snapshots].[notable_query_plan] WITH NOCHECK ADD CONSTRAINT [FK_notable_query_plan_source_info_internal] FOREIGN KEY ([source_id])
REFERENCES [core].[source_info_internal] ([source_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[notable_query_plan] WITH CHECK CHECK CONSTRAINT [FK_notable_query_plan_source_info_internal]
GO
--SqlScripter----[snapshots].[notable_query_text].[FK_notable_query_text_source_info_internal].sql
GO
ALTER TABLE [snapshots].[notable_query_text] WITH NOCHECK ADD CONSTRAINT [FK_notable_query_text_source_info_internal] FOREIGN KEY ([source_id])
REFERENCES [core].[source_info_internal] ([source_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[notable_query_text] WITH CHECK CHECK CONSTRAINT [FK_notable_query_text_source_info_internal]
GO
--SqlScripter----[snapshots].[os_latch_stats].[FK_os_latch_stats_snapshots_internal].sql
GO
ALTER TABLE [snapshots].[os_latch_stats] WITH NOCHECK ADD CONSTRAINT [FK_os_latch_stats_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[os_latch_stats] WITH CHECK CHECK CONSTRAINT [FK_os_latch_stats_snapshots_internal]
GO
--SqlScripter----[snapshots].[os_memory_clerks].[FK_os_memory_clerks_snapshots_internal].sql
GO
ALTER TABLE [snapshots].[os_memory_clerks] WITH NOCHECK ADD CONSTRAINT [FK_os_memory_clerks_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[os_memory_clerks] WITH CHECK CHECK CONSTRAINT [FK_os_memory_clerks_snapshots_internal]
GO
--SqlScripter----[snapshots].[os_memory_nodes].[FK_os_memory_nodes_snapshots_internal].sql
GO
ALTER TABLE [snapshots].[os_memory_nodes] WITH NOCHECK ADD CONSTRAINT [FK_os_memory_nodes_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[os_memory_nodes] WITH CHECK CHECK CONSTRAINT [FK_os_memory_nodes_snapshots_internal]
GO
--SqlScripter----[snapshots].[os_process_memory].[FK_os_process_memory_snapshots_internal].sql
GO
ALTER TABLE [snapshots].[os_process_memory] WITH NOCHECK ADD CONSTRAINT [FK_os_process_memory_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[os_process_memory] WITH CHECK CHECK CONSTRAINT [FK_os_process_memory_snapshots_internal]
GO
--SqlScripter----[snapshots].[os_schedulers].[FK_os_schedulers_snapshots_internal].sql
GO
ALTER TABLE [snapshots].[os_schedulers] WITH NOCHECK ADD CONSTRAINT [FK_os_schedulers_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[os_schedulers] WITH CHECK CHECK CONSTRAINT [FK_os_schedulers_snapshots_internal]
GO
--SqlScripter----[snapshots].[os_wait_stats].[FK_os_wait_stats_snapshots_internal].sql
GO
ALTER TABLE [snapshots].[os_wait_stats] WITH NOCHECK ADD CONSTRAINT [FK_os_wait_stats_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[os_wait_stats] WITH CHECK CHECK CONSTRAINT [FK_os_wait_stats_snapshots_internal]
GO
--SqlScripter----[snapshots].[performance_counter_values].[FK_performance_counter_values_snapshot_id].sql
GO
ALTER TABLE [snapshots].[performance_counter_values] WITH NOCHECK ADD CONSTRAINT [FK_performance_counter_values_snapshot_id] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[performance_counter_values] WITH CHECK CHECK CONSTRAINT [FK_performance_counter_values_snapshot_id]
GO
--SqlScripter----[snapshots].[query_stats].[FK_query_stats_snapshots_internal].sql
GO
ALTER TABLE [snapshots].[query_stats] WITH NOCHECK ADD CONSTRAINT [FK_query_stats_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[query_stats] WITH CHECK CHECK CONSTRAINT [FK_query_stats_snapshots_internal]
GO
--SqlScripter----[snapshots].[sql_process_and_system_memory].[FK_sql_process_and_system_memory_internal].sql
GO
ALTER TABLE [snapshots].[sql_process_and_system_memory] WITH NOCHECK ADD CONSTRAINT [FK_sql_process_and_system_memory_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[sql_process_and_system_memory] WITH CHECK CHECK CONSTRAINT [FK_sql_process_and_system_memory_internal]
GO
--SqlScripter----[snapshots].[sysutility_ucp_batch_manifests_internal].[FK_sysutility_ucp_batch_manifests_internal].sql
GO
ALTER TABLE [snapshots].[sysutility_ucp_batch_manifests_internal] WITH NOCHECK ADD CONSTRAINT [FK_sysutility_ucp_batch_manifests_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[sysutility_ucp_batch_manifests_internal] WITH CHECK CHECK CONSTRAINT [FK_sysutility_ucp_batch_manifests_internal]
GO
--SqlScripter----[snapshots].[sysutility_ucp_cpu_memory_conf].[FK_sysutility_cpu_me#526E7C97A647F354BE993F129CDFF1AB].sql
GO
ALTER TABLE [snapshots].[sysutility_ucp_cpu_memory_configurations_internal] WITH NOCHECK ADD CONSTRAINT [FK_sysutility_cpu_memory_related_info_snapshots_internal_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[sysutility_ucp_cpu_memory_configurations_internal] WITH CHECK CHECK CONSTRAINT [FK_sysutility_cpu_memory_related_info_snapshots_internal_snapshots_internal]
GO
--SqlScripter----[snapshots].[sysutility_ucp_dac_collected_e].[fk_dac_collected_exe#7A8543CC8CFECA7BE3C66D73F4FA58BA].sql
GO
ALTER TABLE [snapshots].[sysutility_ucp_dac_collected_execution_statistics_internal] WITH NOCHECK ADD CONSTRAINT [fk_dac_collected_execution_statistics_internal_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[sysutility_ucp_dac_collected_execution_statistics_internal] WITH CHECK CHECK CONSTRAINT [fk_dac_collected_execution_statistics_internal_snapshots_internal]
GO
--SqlScripter----[snapshots].[sysutility_ucp_smo_properties_].[FK_sysutility_ucp_sm#8F0CB415FB83F54B62D731D5A0091F11].sql
GO
ALTER TABLE [snapshots].[sysutility_ucp_smo_properties_internal] WITH NOCHECK ADD CONSTRAINT [FK_sysutility_ucp_smo_properties_internal_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[sysutility_ucp_smo_properties_internal] WITH CHECK CHECK CONSTRAINT [FK_sysutility_ucp_smo_properties_internal_snapshots_internal]
GO
--SqlScripter----[snapshots].[sysutility_ucp_volumes_internal].[FK_volumes_info_snapshots_internal].sql
GO
ALTER TABLE [snapshots].[sysutility_ucp_volumes_internal] WITH NOCHECK ADD CONSTRAINT [FK_volumes_info_snapshots_internal] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[sysutility_ucp_volumes_internal] WITH CHECK CHECK CONSTRAINT [FK_volumes_info_snapshots_internal]
GO
--SqlScripter----[snapshots].[trace_data].[FK_trace_data_snapshot_id].sql
GO
ALTER TABLE [snapshots].[trace_data] WITH NOCHECK ADD CONSTRAINT [FK_trace_data_snapshot_id] FOREIGN KEY ([snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[trace_data] WITH CHECK CHECK CONSTRAINT [FK_trace_data_snapshot_id]
GO
--SqlScripter----[snapshots].[trace_data].[FK_trace_data_trace_info_id].sql
GO
ALTER TABLE [snapshots].[trace_data] WITH NOCHECK ADD CONSTRAINT [FK_trace_data_trace_info_id] FOREIGN KEY ([trace_info_id])
REFERENCES [snapshots].[trace_info] ([trace_info_id])
GO
ALTER TABLE [snapshots].[trace_data] WITH CHECK CHECK CONSTRAINT [FK_trace_data_trace_info_id]
GO
--SqlScripter----[snapshots].[trace_info].[FK_trace_info_last_snapshot_id].sql
GO
ALTER TABLE [snapshots].[trace_info] WITH NOCHECK ADD CONSTRAINT [FK_trace_info_last_snapshot_id] FOREIGN KEY ([last_snapshot_id])
REFERENCES [core].[snapshots_internal] ([snapshot_id])
ON DELETE CASCADE
GO
ALTER TABLE [snapshots].[trace_info] WITH CHECK CHECK CONSTRAINT [FK_trace_info_last_snapshot_id]
GO
--SqlScripter----[snapshots].[trace_info].[FK_trace_info_source_id].sql
GO
ALTER TABLE [snapshots].[trace_info] WITH NOCHECK ADD CONSTRAINT [FK_trace_info_source_id] FOREIGN KEY ([source_id])
REFERENCES [core].[source_info_internal] ([source_id])
GO
ALTER TABLE [snapshots].[trace_info] WITH CHECK CHECK CONSTRAINT [FK_trace_info_source_id]