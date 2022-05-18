
GO
--SqlScripter----[core].[performance_counter_report_group_items].[PK__performa__FF3FA0806524953E].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [core].[performance_counter_report_group_items] ADD CONSTRAINT [PK__performa__FF3FA0806524953E] PRIMARY KEY CLUSTERED (
	[counter_group_item_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[core].[snapshot_timetable_internal].[PK_snapshots_timetable_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [core].[snapshot_timetable_internal] ADD CONSTRAINT [PK_snapshots_timetable_internal] PRIMARY KEY CLUSTERED (
	[snapshot_time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[core].[snapshots_internal].[PK_snapshots_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [core].[snapshots_internal] ADD CONSTRAINT [PK_snapshots_internal] PRIMARY KEY CLUSTERED (
	[snapshot_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[core].[source_info_internal].[PK_source_info_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [core].[source_info_internal] ADD CONSTRAINT [PK_source_info_internal] PRIMARY KEY CLUSTERED (
	[source_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[core].[supported_collector_types_internal].[PK_supported_collector_types_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [core].[supported_collector_types_internal] ADD CONSTRAINT [PK_supported_collector_types_internal] PRIMARY KEY CLUSTERED (
	[collector_type_uid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[core].[wait_categories].[PK_categories].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [core].[wait_categories] ADD CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED (
	[category_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[core].[wait_types].[PK_events].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [core].[wait_types] ADD CONSTRAINT [PK_events] PRIMARY KEY CLUSTERED (
	[wait_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[active_sessions_and_requests].[PK_active_sessions_and_requests].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[active_sessions_and_requests] ADD CONSTRAINT [PK_active_sessions_and_requests] PRIMARY KEY CLUSTERED (
	[snapshot_id] ASC,
	[collection_time] ASC,
	[row_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[disk_usage].[PK_disk_usage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[disk_usage] ADD CONSTRAINT [PK_disk_usage] PRIMARY KEY CLUSTERED (
	[snapshot_id] ASC,
	[collection_time] ASC,
	[database_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[distinct_queries].[PK_distinct_queries].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[distinct_queries] ADD CONSTRAINT [PK_distinct_queries] PRIMARY KEY CLUSTERED (
	[source_id] ASC,
	[distinct_query_hash] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[distinct_query_to_handle].[PK_distinct_query_to_handle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[distinct_query_to_handle] ADD CONSTRAINT [PK_distinct_query_to_handle] PRIMARY KEY CLUSTERED (
	[source_id] ASC,
	[distinct_query_hash] ASC,
	[sql_handle] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[io_virtual_file_stats].[PK_io_virtual_file_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[io_virtual_file_stats] ADD CONSTRAINT [PK_io_virtual_file_stats] PRIMARY KEY CLUSTERED (
	[snapshot_id] ASC,
	[collection_time] ASC,
	[logical_disk] ASC,
	[database_name] ASC,
	[file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[log_usage].[PK_log_usage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[log_usage] ADD CONSTRAINT [PK_log_usage] PRIMARY KEY CLUSTERED (
	[snapshot_id] ASC,
	[collection_time] ASC,
	[database_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[notable_query_plan].[PK_notable_query_plan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[notable_query_plan] ADD CONSTRAINT [PK_notable_query_plan] PRIMARY KEY CLUSTERED (
	[source_id] ASC,
	[sql_handle] ASC,
	[plan_handle] ASC,
	[statement_start_offset] ASC,
	[statement_end_offset] ASC,
	[creation_time] ASC,
	[plan_generation_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[notable_query_text].[PK_notable_query_text].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[notable_query_text] ADD CONSTRAINT [PK_notable_query_text] PRIMARY KEY CLUSTERED (
	[source_id] ASC,
	[sql_handle] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_latch_stats].[PK_os_latch_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[os_latch_stats] ADD CONSTRAINT [PK_os_latch_stats] PRIMARY KEY CLUSTERED (
	[snapshot_id] ASC,
	[collection_time] ASC,
	[latch_class] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_memory_clerks].[CIDX_os_memory_clerks].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [CIDX_os_memory_clerks] ON [snapshots].[os_memory_clerks] (
	[snapshot_id] ASC,
	[collection_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_memory_nodes].[PK_os_memory_nodes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[os_memory_nodes] ADD CONSTRAINT [PK_os_memory_nodes] PRIMARY KEY CLUSTERED (
	[snapshot_id] ASC,
	[collection_time] ASC,
	[memory_node_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_process_memory].[PK_os_process_memory].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[os_process_memory] ADD CONSTRAINT [PK_os_process_memory] PRIMARY KEY CLUSTERED (
	[snapshot_id] ASC,
	[collection_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_schedulers].[PK_os_schedulers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[os_schedulers] ADD CONSTRAINT [PK_os_schedulers] PRIMARY KEY CLUSTERED (
	[snapshot_id] ASC,
	[collection_time] ASC,
	[scheduler_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_wait_stats].[PK_os_wait_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[os_wait_stats] ADD CONSTRAINT [PK_os_wait_stats] PRIMARY KEY CLUSTERED (
	[snapshot_id] ASC,
	[collection_time] ASC,
	[wait_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[performance_counter_instances].[PK_performance_counter_instances].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[performance_counter_instances] ADD CONSTRAINT [PK_performance_counter_instances] PRIMARY KEY CLUSTERED (
	[performance_counter_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[performance_counter_values].[PK_performance_counter_values].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[performance_counter_values] ADD CONSTRAINT [PK_performance_counter_values] PRIMARY KEY CLUSTERED (
	[performance_counter_instance_id] ASC,
	[snapshot_id] ASC,
	[collection_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[query_stats].[CIDX_query_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [CIDX_query_stats] ON [snapshots].[query_stats] (
	[snapshot_id] ASC,
	[collection_time] ASC,
	[sql_handle] ASC,
	[statement_start_offset] ASC,
	[statement_end_offset] ASC,
	[plan_handle] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sql_process_and_system_memory].[PK_sql_process_and_system_memory].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[sql_process_and_system_memory] ADD CONSTRAINT [PK_sql_process_and_system_memory] PRIMARY KEY CLUSTERED (
	[snapshot_id] ASC,
	[collection_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_batch_manifests_internal].[CI_sysutility_ucp_batch_manifests_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [CI_sysutility_ucp_batch_manifests_internal] ON [snapshots].[sysutility_ucp_batch_manifests_internal] (
	[snapshot_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_cpu_memory_conf].[PK_sysutility_cpu_me#4A4F9635A1BEF7ED9DCF18B045657A98].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[sysutility_ucp_cpu_memory_configurations_internal] ADD CONSTRAINT [PK_sysutility_cpu_memory_related_info_internal_clustered] PRIMARY KEY CLUSTERED (
	[server_instance_name] ASC,
	[batch_time] ASC,
	[physical_server_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_dac_collected_e].[PK_sysutility_ucp_da#586021A0BAE58BC19BCE31BA26AA2E05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[sysutility_ucp_dac_collected_execution_statistics_internal] ADD CONSTRAINT [PK_sysutility_ucp_dac_collected_execution_statistics_internal] PRIMARY KEY CLUSTERED (
	[server_instance_name] ASC,
	[batch_time] ASC,
	[dac_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_smo_properties_internal].[CI_sysutility_ucp_smo_properties_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [CI_sysutility_ucp_smo_properties_internal] ON [snapshots].[sysutility_ucp_smo_properties_internal] (
	[server_instance_name] ASC,
	[batch_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_volumes_internal].[PK_sysutility_volumes_info_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[sysutility_ucp_volumes_internal] ADD CONSTRAINT [PK_sysutility_volumes_info_internal] PRIMARY KEY CLUSTERED (
	[server_instance_name] ASC,
	[batch_time] ASC,
	[volume_device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[trace_data].[IDX_trace_data_EventSequence].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [IDX_trace_data_EventSequence] ON [snapshots].[trace_data] (
	[snapshot_id] ASC,
	[EventSequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[trace_info].[PK_trace_info].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[trace_info] ADD CONSTRAINT [PK_trace_info] PRIMARY KEY CLUSTERED (
	[trace_info_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[computers_internal].[PK_computers_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [sysutility_ucp_core].[computers_internal] ADD CONSTRAINT [PK_computers_internal] PRIMARY KEY CLUSTERED (
	[processing_time] ASC,
	[physical_server_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[cpu_utilization_internal].[pk_cpu_utilization_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [sysutility_ucp_core].[cpu_utilization_internal] ADD CONSTRAINT [pk_cpu_utilization_internal] PRIMARY KEY CLUSTERED (
	[aggregation_type] ASC,
	[processing_time] ASC,
	[object_type] ASC,
	[physical_server_name] ASC,
	[server_instance_name] ASC,
	[database_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[dacs_internal].[PK_dacs_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [sysutility_ucp_core].[dacs_internal] ADD CONSTRAINT [PK_dacs_internal] PRIMARY KEY CLUSTERED (
	[processing_time] ASC,
	[server_instance_name] ASC,
	[dac_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[databases_internal].[PK_databases_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [sysutility_ucp_core].[databases_internal] ADD CONSTRAINT [PK_databases_internal] PRIMARY KEY CLUSTERED (
	[processing_time] ASC,
	[server_instance_name] ASC,
	[Name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[datafiles_internal].[PK_datafiles_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [sysutility_ucp_core].[datafiles_internal] ADD CONSTRAINT [PK_datafiles_internal] PRIMARY KEY CLUSTERED (
	[processing_time] ASC,
	[server_instance_name] ASC,
	[database_name] ASC,
	[filegroup_name] ASC,
	[Name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[filegroups_internal].[PK_filegroups_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [sysutility_ucp_core].[filegroups_internal] ADD CONSTRAINT [PK_filegroups_internal] PRIMARY KEY CLUSTERED (
	[processing_time] ASC,
	[server_instance_name] ASC,
	[database_name] ASC,
	[Name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[logfiles_internal].[PK_logfiles_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [sysutility_ucp_core].[logfiles_internal] ADD CONSTRAINT [PK_logfiles_internal] PRIMARY KEY CLUSTERED (
	[processing_time] ASC,
	[server_instance_name] ASC,
	[database_name] ASC,
	[Name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[smo_servers_internal].[PK_smo_servers_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [sysutility_ucp_core].[smo_servers_internal] ADD CONSTRAINT [PK_smo_servers_internal] PRIMARY KEY CLUSTERED (
	[processing_time] ASC,
	[Name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[space_utilization_internal].[pk_storage_utilization].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [sysutility_ucp_core].[space_utilization_internal] ADD CONSTRAINT [pk_storage_utilization] PRIMARY KEY CLUSTERED (
	[aggregation_type] ASC,
	[processing_time] ASC,
	[object_type] ASC,
	[virtual_server_name] ASC,
	[volume_device_id] ASC,
	[server_instance_name] ASC,
	[database_name] ASC,
	[filegroup_name] ASC,
	[dbfile_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[volumes_internal].[pk_volumes_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [sysutility_ucp_core].[volumes_internal] ADD CONSTRAINT [pk_volumes_internal] PRIMARY KEY CLUSTERED (
	[processing_time] ASC,
	[physical_server_name] ASC,
	[volume_device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_stagi].[consistent_batch_manifests_int].[PK_consis#E8FCDC13360103FEF14C66039F513DFF].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [sysutility_ucp_staging].[consistent_batch_manifests_internal] ADD CONSTRAINT [PK_consistent_batch_manifests_internal] PRIMARY KEY CLUSTERED (
	[server_instance_name] ASC,
	[batch_time] ASC
) ON [PRIMARY]
