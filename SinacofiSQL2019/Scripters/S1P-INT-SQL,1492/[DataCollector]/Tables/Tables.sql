
GO
--SqlScripter----[core].[performance_counter_report_group_items].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [core].[performance_counter_report_group_items](
	[counter_group_item_id] [int] IDENTITY(1, 1),
	[counter_group_id] [nvarchar](128) NOT NULL,
	[counter_subgroup_id] [nvarchar](128) NOT NULL,
	[series_name] [nvarchar](512) NOT NULL,
	[object_name] [nvarchar](2048) NOT NULL,
	[object_name_wildcards] [bit] NOT NULL,
	[counter_name] [nvarchar](2048) NOT NULL,
	[instance_name] [nvarchar](2048) NULL,
	[not_instance_name] [nvarchar](2048) NULL,
	[multiply_by] [numeric](28, 10) NOT NULL,
	[divide_by_cpu_count] [bit] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[core].[purge_info_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [core].[purge_info_internal](
	[stop_purge] [bit] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[core].[snapshot_timetable_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [core].[snapshot_timetable_internal](
	[snapshot_time_id] [int] IDENTITY(1, 1),
	[snapshot_time] [datetimeoffset](7) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[core].[snapshots_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [core].[snapshots_internal](
	[snapshot_id] [int] IDENTITY(1, 1),
	[snapshot_time_id] [int] NOT NULL,
	[source_id] [int] NOT NULL,
	[log_id] [bigint] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[core].[source_info_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [core].[source_info_internal](
	[source_id] [int] IDENTITY(1, 1),
	[collection_set_uid] [uniqueidentifier] NOT NULL,
	[instance_name] [sysname] NOT NULL,
	[days_until_expiration] [smallint] NOT NULL,
	[operator] [sysname] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[core].[supported_collector_types_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [core].[supported_collector_types_internal](
	[collector_type_uid] [uniqueidentifier] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[core].[wait_categories].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [core].[wait_categories](
	[category_id] [smallint] NOT NULL,
	[category_name] [nvarchar](20) NOT NULL,
	[ignore] [bit] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[core].[wait_types].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [core].[wait_types](
	[category_id] [smallint] NOT NULL,
	[wait_type] [nvarchar](45) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[active_sessions_and_requests].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[active_sessions_and_requests](
	[row_id] [int] NOT NULL,
	[session_id] [smallint] NOT NULL,
	[request_id] [int] NOT NULL,
	[exec_context_id] [int] NOT NULL,
	[blocking_session_id] [smallint] NULL,
	[blocking_exec_context_id] [int] NULL,
	[scheduler_id] [int] NULL,
	[database_name] [nvarchar](128) NULL,
	[user_id] [int] NULL,
	[task_state] [nvarchar](10) NULL,
	[request_status] [nvarchar](15) NULL,
	[session_status] [nvarchar](15) NOT NULL,
	[executing_managed_code] [bit] NULL,
	[login_time] [datetimeoffset](7) NOT NULL,
	[is_user_process] [bit] NOT NULL,
	[host_name] [nvarchar](128) NOT NULL,
	[program_name] [nvarchar](128) NOT NULL,
	[login_name] [nvarchar](30) NOT NULL,
	[wait_type] [nvarchar](45) NOT NULL,
	[last_wait_type] [nvarchar](45) NOT NULL,
	[wait_duration_ms] [bigint] NOT NULL,
	[wait_resource] [nvarchar](50) NOT NULL,
	[resource_description] [nvarchar](140) NOT NULL,
	[transaction_id] [bigint] NULL,
	[open_transaction_count] [int] NOT NULL,
	[transaction_isolation_level] [smallint] NULL,
	[request_cpu_time] [int] NULL,
	[request_logical_reads] [bigint] NULL,
	[request_reads] [bigint] NULL,
	[request_writes] [bigint] NULL,
	[request_total_elapsed_time] [int] NULL,
	[request_start_time] [datetimeoffset](7) NULL,
	[memory_usage] [int] NOT NULL,
	[session_cpu_time] [int] NOT NULL,
	[session_reads] [bigint] NOT NULL,
	[session_writes] [bigint] NOT NULL,
	[session_logical_reads] [bigint] NOT NULL,
	[session_total_scheduled_time] [int] NOT NULL,
	[session_total_elapsed_time] [int] NOT NULL,
	[session_last_request_start_time] [datetimeoffset](7) NOT NULL,
	[session_last_request_end_time] [datetimeoffset](7) NULL,
	[open_resultsets] [int] NULL,
	[session_row_count] [bigint] NOT NULL,
	[prev_error] [int] NOT NULL,
	[pending_io_count] [int] NULL,
	[command] [nvarchar](32) NULL,
	[plan_handle] [varbinary](64) NULL,
	[sql_handle] [varbinary](64) NULL,
	[statement_start_offset] [int] NULL,
	[statement_end_offset] [int] NULL,
	[collection_time] [datetimeoffset](7) NOT NULL,
	[snapshot_id] [int] NOT NULL,
	[is_blocking] [bit] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[disk_usage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[disk_usage](
	[dbsize] [bigint] NULL,
	[logsize] [bigint] NULL,
	[ftsize] [bigint] NULL,
	[reservedpages] [bigint] NULL,
	[usedpages] [bigint] NULL,
	[pages] [bigint] NULL,
	[database_name] [nvarchar](128) NOT NULL,
	[collection_time] [datetimeoffset](7) NOT NULL,
	[snapshot_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[distinct_queries].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[distinct_queries](
	[distinct_query_hash] [bigint] NOT NULL,
	[distinct_sql_text] [nvarchar](512) NOT NULL,
	[source_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[distinct_query_to_handle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[distinct_query_to_handle](
	[distinct_query_hash] [bigint] NOT NULL,
	[sql_handle] [varbinary](64) NOT NULL,
	[source_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[io_virtual_file_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[io_virtual_file_stats](
	[database_name] [nvarchar](128) NOT NULL,
	[database_id] [int] NOT NULL,
	[logical_file_name] [nvarchar](128) NOT NULL,
	[file_id] [int] NOT NULL,
	[type_desc] [nvarchar](60) NULL,
	[logical_disk] [nvarchar](255) NOT NULL,
	[num_of_reads] [bigint] NULL,
	[num_of_bytes_read] [bigint] NULL,
	[io_stall_read_ms] [bigint] NULL,
	[num_of_writes] [bigint] NULL,
	[num_of_bytes_written] [bigint] NULL,
	[io_stall_write_ms] [bigint] NULL,
	[size_on_disk_bytes] [bigint] NULL,
	[collection_time] [datetimeoffset](7) NOT NULL,
	[snapshot_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[log_usage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[log_usage](
	[database_name] [nvarchar](128) NOT NULL,
	[log_size_mb] [float] NULL,
	[log_space_used] [float] NULL,
	[status] [int] NULL,
	[collection_time] [datetimeoffset](7) NOT NULL,
	[snapshot_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[notable_query_plan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[notable_query_plan](
	[sql_handle] [varbinary](64) NOT NULL,
	[plan_handle] [varbinary](64) NOT NULL,
	[statement_start_offset] [int] NOT NULL,
	[statement_end_offset] [int] NOT NULL,
	[plan_generation_num] [bigint] NOT NULL,
	[creation_time] [datetimeoffset](7) NOT NULL,
	[database_id] [smallint] NULL,
	[object_id] [int] NULL,
	[object_name] [nvarchar](128) NULL,
	[query_plan] [nvarchar](MAX) NULL,
	[source_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[notable_query_text].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[notable_query_text](
	[sql_handle] [varbinary](64) NOT NULL,
	[database_id] [smallint] NULL,
	[object_id] [int] NULL,
	[object_name] [nvarchar](128) NULL,
	[sql_text] [nvarchar](MAX) NULL,
	[source_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_latch_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[os_latch_stats](
	[latch_class] [nvarchar](45) NOT NULL,
	[waiting_requests_count] [bigint] NOT NULL,
	[wait_time_ms] [bigint] NOT NULL,
	[collection_time] [datetimeoffset](7) NOT NULL,
	[snapshot_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_memory_clerks].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[os_memory_clerks](
	[type] [nvarchar](60) NULL,
	[memory_node_id] [smallint] NULL,
	[single_pages_kb] [bigint] NULL,
	[multi_pages_kb] [bigint] NULL,
	[virtual_memory_reserved_kb] [bigint] NULL,
	[virtual_memory_committed_kb] [bigint] NULL,
	[awe_allocated_kb] [bigint] NULL,
	[shared_memory_reserved_kb] [bigint] NULL,
	[shared_memory_committed_kb] [bigint] NULL,
	[collection_time] [datetimeoffset](7) NOT NULL,
	[snapshot_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_memory_nodes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[os_memory_nodes](
	[memory_node_id] [smallint] NOT NULL,
	[virtual_address_space_reserved_kb] [bigint] NOT NULL,
	[virtual_address_space_committed_kb] [bigint] NOT NULL,
	[locked_page_allocations_kb] [bigint] NOT NULL,
	[single_pages_kb] [bigint] NOT NULL,
	[multi_pages_kb] [bigint] NOT NULL,
	[shared_memory_reserved_kb] [bigint] NOT NULL,
	[shared_memory_committed_kb] [bigint] NOT NULL,
	[collection_time] [datetimeoffset](7) NOT NULL,
	[snapshot_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_process_memory].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[os_process_memory](
	[physical_memory_in_use_kb] [bigint] NOT NULL,
	[large_page_allocations_kb] [bigint] NOT NULL,
	[locked_page_allocations_kb] [bigint] NOT NULL,
	[total_virtual_address_space_kb] [bigint] NOT NULL,
	[virtual_address_space_reserved_kb] [bigint] NOT NULL,
	[virtual_address_space_committed_kb] [bigint] NOT NULL,
	[virtual_address_space_available_kb] [bigint] NOT NULL,
	[page_fault_count] [bigint] NOT NULL,
	[memory_utilization_percentage] [int] NOT NULL,
	[available_commit_limit_kb] [bigint] NOT NULL,
	[process_physical_memory_low] [bit] NOT NULL,
	[process_virtual_memory_low] [bit] NOT NULL,
	[collection_time] [datetimeoffset](7) NOT NULL,
	[snapshot_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_schedulers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[os_schedulers](
	[parent_node_id] [int] NOT NULL,
	[scheduler_id] [int] NOT NULL,
	[cpu_id] [int] NOT NULL,
	[status] [nvarchar](60) NOT NULL,
	[is_idle] [bit] NOT NULL,
	[preemptive_switches_count] [int] NOT NULL,
	[context_switches_count] [int] NOT NULL,
	[yield_count] [int] NOT NULL,
	[current_tasks_count] [int] NOT NULL,
	[runnable_tasks_count] [int] NOT NULL,
	[work_queue_count] [bigint] NOT NULL,
	[pending_disk_io_count] [int] NOT NULL,
	[collection_time] [datetimeoffset](7) NOT NULL,
	[snapshot_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_wait_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[os_wait_stats](
	[wait_type] [nvarchar](45) NOT NULL,
	[waiting_tasks_count] [bigint] NOT NULL,
	[wait_time_ms] [bigint] NOT NULL,
	[signal_wait_time_ms] [bigint] NOT NULL,
	[collection_time] [datetimeoffset](7) NOT NULL,
	[snapshot_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[performance_counter_instances].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[performance_counter_instances](
	[performance_counter_id] [int] IDENTITY(1, 1),
	[path] [nvarchar](2048) NOT NULL,
	[object_name] [nvarchar](2048) NOT NULL,
	[counter_name] [nvarchar](2048) NOT NULL,
	[instance_name] [nvarchar](2048) NULL,
	[counter_type] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[performance_counter_values].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[performance_counter_values](
	[performance_counter_instance_id] [int] NOT NULL,
	[snapshot_id] [int] NOT NULL,
	[collection_time] [datetimeoffset](7) NOT NULL,
	[formatted_value] [float] NOT NULL,
	[raw_value_first] [bigint] NOT NULL,
	[raw_value_second] [bigint] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[query_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[query_stats](
	[sql_handle] [varbinary](64) NOT NULL,
	[statement_start_offset] [int] NOT NULL,
	[statement_end_offset] [int] NOT NULL,
	[plan_generation_num] [bigint] NOT NULL,
	[plan_handle] [varbinary](64) NOT NULL,
	[creation_time] [datetimeoffset](7) NOT NULL,
	[last_execution_time] [datetimeoffset](7) NOT NULL,
	[execution_count] [bigint] NOT NULL,
	[snapshot_execution_count] [bigint] NULL,
	[total_worker_time] [bigint] NOT NULL,
	[snapshot_worker_time] [bigint] NOT NULL,
	[min_worker_time] [bigint] NULL,
	[max_worker_time] [bigint] NOT NULL,
	[total_physical_reads] [bigint] NOT NULL,
	[snapshot_physical_reads] [bigint] NOT NULL,
	[min_physical_reads] [bigint] NULL,
	[max_physical_reads] [bigint] NOT NULL,
	[total_logical_writes] [bigint] NOT NULL,
	[snapshot_logical_writes] [bigint] NOT NULL,
	[min_logical_writes] [bigint] NULL,
	[max_logical_writes] [bigint] NOT NULL,
	[total_logical_reads] [bigint] NOT NULL,
	[snapshot_logical_reads] [bigint] NOT NULL,
	[min_logical_reads] [bigint] NULL,
	[max_logical_reads] [bigint] NOT NULL,
	[total_clr_time] [bigint] NULL,
	[snapshot_clr_time] [bigint] NULL,
	[min_clr_time] [bigint] NULL,
	[max_clr_time] [bigint] NULL,
	[total_elapsed_time] [bigint] NOT NULL,
	[snapshot_elapsed_time] [bigint] NOT NULL,
	[min_elapsed_time] [bigint] NULL,
	[max_elapsed_time] [bigint] NOT NULL,
	[collection_time] [datetimeoffset](7) NOT NULL,
	[snapshot_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sql_process_and_system_memory].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[sql_process_and_system_memory](
	[sql_physical_memory_in_use_kb] [bigint] NOT NULL,
	[sql_large_page_allocations_kb] [bigint] NOT NULL,
	[sql_locked_page_allocations_kb] [bigint] NOT NULL,
	[sql_total_virtual_address_space_kb] [bigint] NOT NULL,
	[sql_virtual_address_space_reserved_kb] [bigint] NOT NULL,
	[sql_virtual_address_space_committed_kb] [bigint] NOT NULL,
	[sql_virtual_address_space_available_kb] [bigint] NOT NULL,
	[sql_page_fault_count] [bigint] NOT NULL,
	[sql_memory_utilization_percentage] [int] NOT NULL,
	[sql_available_commit_limit_kb] [bigint] NOT NULL,
	[sql_process_physical_memory_low] [bit] NOT NULL,
	[sql_process_virtual_memory_low] [bit] NOT NULL,
	[system_total_physical_memory_kb] [bigint] NOT NULL,
	[system_available_physical_memory_kb] [bigint] NOT NULL,
	[system_total_page_file_kb] [bigint] NOT NULL,
	[system_available_page_file_kb] [bigint] NOT NULL,
	[system_cache_kb] [bigint] NOT NULL,
	[system_kernel_paged_pool_kb] [bigint] NOT NULL,
	[system_kernel_nonpaged_pool_kb] [bigint] NOT NULL,
	[system_high_memory_signal_state] [bit] NOT NULL,
	[system_low_memory_signal_state] [bit] NOT NULL,
	[bpool_commit_target] [bigint] NOT NULL,
	[bpool_committed] [bigint] NOT NULL,
	[bpool_visible] [bigint] NOT NULL,
	[collection_time] [datetimeoffset](7) NOT NULL,
	[snapshot_id] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_batch_manifests_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[sysutility_ucp_batch_manifests_internal](
	[server_instance_name] [sysname] NOT NULL,
	[batch_time] [datetimeoffset](7) NOT NULL,
	[parameter_name] [sysname] NOT NULL,
	[parameter_value] [sql_variant] NULL,
	[collection_time] [datetimeoffset](7) NULL,
	[snapshot_id] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_cpu_memory_configurations_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[sysutility_ucp_cpu_memory_configurations_internal](
	[server_instance_name] [sysname] NOT NULL,
	[is_clustered_server] [smallint] NULL,
	[virtual_server_name] [sysname] NOT NULL,
	[physical_server_name] [sysname] NOT NULL,
	[num_processors] [int] NULL,
	[server_processor_usage] [real] NULL,
	[instance_processor_usage] [real] NULL,
	[cpu_name] [nvarchar](128) NULL,
	[cpu_caption] [nvarchar](128) NULL,
	[cpu_family] [nvarchar](128) NULL,
	[cpu_architecture] [nvarchar](64) NULL,
	[cpu_max_clock_speed] [decimal](10, 0) NULL,
	[cpu_clock_speed] [decimal](10, 0) NULL,
	[l2_cache_size] [decimal](10, 0) NULL,
	[l3_cache_size] [decimal](10, 0) NULL,
	[batch_time] [datetimeoffset](7) NOT NULL,
	[collection_time] [datetimeoffset](7) NULL,
	[snapshot_id] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_dac_collected_execution_statistics_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[sysutility_ucp_dac_collected_execution_statistics_internal](
	[physical_server_name] [sysname] NOT NULL,
	[server_instance_name] [sysname] NOT NULL,
	[dac_db] [sysname] NOT NULL,
	[dac_deploy_date] [datetime] NULL,
	[dac_description] [nvarchar](4000) NULL,
	[dac_name] [sysname] NOT NULL,
	[interval_start_time] [datetimeoffset](7) NULL,
	[interval_end_time] [datetimeoffset](7) NULL,
	[interval_cpu_time_ms] [bigint] NULL,
	[interval_cpu_pct] [real] NULL,
	[lifetime_cpu_time_ms] [bigint] NULL,
	[batch_time] [datetimeoffset](7) NOT NULL,
	[collection_time] [datetimeoffset](7) NULL,
	[snapshot_id] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_smo_properties_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[sysutility_ucp_smo_properties_internal](
	[physical_server_name] [sysname] NOT NULL,
	[server_instance_name] [sysname] NOT NULL,
	[object_type] [int] NULL,
	[urn] [nvarchar](4000) NULL,
	[property_name] [nvarchar](128) NULL,
	[property_value] [sql_variant] NULL,
	[batch_time] [datetimeoffset](7) NULL,
	[collection_time] [datetimeoffset](7) NULL,
	[snapshot_id] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_volumes_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[sysutility_ucp_volumes_internal](
	[server_instance_name] [sysname] NOT NULL,
	[virtual_server_name] [sysname] NOT NULL,
	[physical_server_name] [sysname] NOT NULL,
	[volume_device_id] [sysname] NOT NULL,
	[volume_name] [nvarchar](260) NOT NULL,
	[total_space_available] [real] NULL,
	[free_space] [real] NULL,
	[batch_time] [datetimeoffset](7) NOT NULL,
	[collection_time] [datetimeoffset](7) NULL,
	[snapshot_id] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[trace_data].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[trace_data](
	[trace_info_id] [int] NOT NULL,
	[snapshot_id] [int] NOT NULL,
	[TextData] [nvarchar](MAX) NULL,
	[BinaryData] [varbinary](MAX) NULL,
	[DatabaseID] [int] NULL,
	[TransactionID] [bigint] NULL,
	[LineNumber] [int] NULL,
	[NTUserName] [nvarchar](256) NULL,
	[NTDomainName] [nvarchar](256) NULL,
	[HostName] [nvarchar](256) NULL,
	[ClientProcessID] [int] NULL,
	[ApplicationName] [nvarchar](256) NULL,
	[LoginName] [nvarchar](256) NULL,
	[SPID] [int] NULL,
	[Duration] [bigint] NULL,
	[StartTime] [datetimeoffset](7) NULL,
	[EndTime] [datetimeoffset](7) NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[CPU] [int] NULL,
	[Permissions] [bigint] NULL,
	[Severity] [int] NULL,
	[EventSubClass] [int] NULL,
	[ObjectID] [int] NULL,
	[Success] [int] NULL,
	[IndexID] [int] NULL,
	[IntegerData] [int] NULL,
	[ServerName] [nvarchar](256) NULL,
	[EventClass] [int] NULL,
	[ObjectType] [int] NULL,
	[NestLevel] [int] NULL,
	[State] [int] NULL,
	[Error] [int] NULL,
	[Mode] [int] NULL,
	[Handle] [int] NULL,
	[ObjectName] [nvarchar](256) NULL,
	[DatabaseName] [nvarchar](256) NULL,
	[FileName] [nvarchar](256) NULL,
	[OwnerName] [nvarchar](256) NULL,
	[RoleName] [nvarchar](256) NULL,
	[TargetUserName] [nvarchar](256) NULL,
	[DBUserName] [nvarchar](256) NULL,
	[LoginSid] [varbinary](MAX) NULL,
	[TargetLoginName] [nvarchar](256) NULL,
	[TargetLoginSid] [varbinary](MAX) NULL,
	[ColumnPermissions] [int] NULL,
	[LinkedServerName] [nvarchar](256) NULL,
	[ProviderName] [nvarchar](256) NULL,
	[MethodName] [nvarchar](256) NULL,
	[RowCounts] [bigint] NULL,
	[RequestID] [int] NULL,
	[XactSequence] [bigint] NULL,
	[EventSequence] [bigint] NOT NULL,
	[BigintData1] [bigint] NULL,
	[BigintData2] [bigint] NULL,
	[GUID] [uniqueidentifier] NULL,
	[IntegerData2] [int] NULL,
	[ObjectID2] [bigint] NULL,
	[Type] [int] NULL,
	[OwnerID] [int] NULL,
	[ParentName] [nvarchar](256) NULL,
	[IsSystem] [int] NULL,
	[Offset] [int] NULL,
	[SourceDatabaseID] [int] NULL,
	[SqlHandle] [varbinary](64) NULL,
	[SessionLoginName] [nvarchar](256) NULL,
	[PlanHandle] [varbinary](64) NULL,
	[GroupID] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[snapshots].[trace_info].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [snapshots].[trace_info](
	[trace_info_id] [int] IDENTITY(1, 1),
	[source_id] [int] NOT NULL,
	[collection_item_id] [int] NOT NULL,
	[last_snapshot_id] [int] NULL,
	[start_time] [datetime] NULL,
	[last_event_sequence] [bigint] NULL,
	[is_running] [bit] NULL,
	[event_count] [bigint] NULL,
	[dropped_event_count] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[computers_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [sysutility_ucp_core].[computers_internal](
	[id] [int] IDENTITY(1, 1),
	[virtual_server_name] [sysname] NOT NULL,
	[physical_server_name] [sysname] NOT NULL,
	[is_clustered_server] [int] NULL,
	[num_processors] [int] NULL,
	[cpu_name] [nvarchar](128) NULL,
	[cpu_caption] [nvarchar](128) NULL,
	[cpu_family] [nvarchar](128) NULL,
	[cpu_architecture] [nvarchar](64) NULL,
	[cpu_max_clock_speed] [decimal](10, 0) NULL,
	[cpu_clock_speed] [decimal](10, 0) NULL,
	[l2_cache_size] [decimal](10, 0) NULL,
	[l3_cache_size] [decimal](10, 0) NULL,
	[percent_total_cpu_utilization] [real] NULL,
	[urn] [nvarchar](4000) NULL,
	[powershell_path] [nvarchar](4000) NULL,
	[processing_time] [datetimeoffset](7) NOT NULL,
	[batch_time] [datetimeoffset](7) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[cpu_utilization_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [sysutility_ucp_core].[cpu_utilization_internal](
	[processing_time] [datetimeoffset](7) NOT NULL,
	[aggregation_type] [aggregationtype] NOT NULL,
	[object_type] [objecttype] NOT NULL,
	[physical_server_name] [sysname] NOT NULL,
	[server_instance_name] [sysname] NOT NULL,
	[database_name] [sysname] NOT NULL,
	[percent_total_cpu_utilization] [real] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[dacs_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [sysutility_ucp_core].[dacs_internal](
	[dac_id] [int] IDENTITY(1, 1),
	[server_instance_name] [sysname] NOT NULL,
	[dac_name] [sysname] NOT NULL,
	[urn] [nvarchar](4000) NULL,
	[powershell_path] [nvarchar](4000) NULL,
	[physical_server_name] [sysname] NOT NULL,
	[dac_deploy_date] [datetime] NULL,
	[dac_description] [nvarchar](4000) NULL,
	[dac_percent_total_cpu_utilization] [real] NULL,
	[processing_time] [datetimeoffset](7) NOT NULL,
	[batch_time] [datetimeoffset](7) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[databases_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [sysutility_ucp_core].[databases_internal](
	[urn] [nvarchar](512) NULL,
	[powershell_path] [nvarchar](MAX) NULL,
	[processing_time] [datetimeoffset](7) NOT NULL,
	[batch_time] [datetimeoffset](7) NULL,
	[server_instance_name] [sysname] NOT NULL,
	[parent_urn] [nvarchar](320) NULL,
	[Collation] [nvarchar](128) NULL,
	[CompatibilityLevel] [smallint] NULL,
	[CreateDate] [datetime] NULL,
	[EncryptionEnabled] [bit] NULL,
	[Name] [sysname] NOT NULL,
	[RecoveryModel] [smallint] NULL,
	[Trustworthy] [bit] NULL,
	[state] [tinyint] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[datafiles_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [sysutility_ucp_core].[datafiles_internal](
	[urn] [nvarchar](1500) NULL,
	[powershell_path] [nvarchar](MAX) NULL,
	[processing_time] [datetimeoffset](7) NOT NULL,
	[batch_time] [datetimeoffset](7) NULL,
	[server_instance_name] [sysname] NOT NULL,
	[database_name] [sysname] NOT NULL,
	[filegroup_name] [sysname] NOT NULL,
	[parent_urn] [nvarchar](780) NULL,
	[physical_server_name] [sysname] NOT NULL,
	[volume_name] [nvarchar](260) NULL,
	[volume_device_id] [sysname] NOT NULL,
	[Growth] [real] NULL,
	[GrowthType] [smallint] NULL,
	[MaxSize] [real] NULL,
	[Name] [sysname] NOT NULL,
	[Size] [real] NULL,
	[UsedSpace] [real] NULL,
	[FileName] [nvarchar](260) NULL,
	[VolumeFreeSpace] [bigint] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[filegroups_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [sysutility_ucp_core].[filegroups_internal](
	[urn] [nvarchar](780) NULL,
	[powershell_path] [nvarchar](MAX) NULL,
	[processing_time] [datetimeoffset](7) NOT NULL,
	[batch_time] [datetimeoffset](7) NULL,
	[server_instance_name] [sysname] NOT NULL,
	[database_name] [sysname] NOT NULL,
	[parent_urn] [nvarchar](512) NULL,
	[Name] [sysname] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[logfiles_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [sysutility_ucp_core].[logfiles_internal](
	[urn] [nvarchar](1500) NULL,
	[powershell_path] [nvarchar](MAX) NULL,
	[processing_time] [datetimeoffset](7) NOT NULL,
	[batch_time] [datetimeoffset](7) NULL,
	[server_instance_name] [sysname] NOT NULL,
	[database_name] [sysname] NOT NULL,
	[parent_urn] [nvarchar](780) NULL,
	[physical_server_name] [sysname] NOT NULL,
	[volume_name] [nvarchar](260) NULL,
	[volume_device_id] [sysname] NOT NULL,
	[Growth] [real] NULL,
	[GrowthType] [smallint] NULL,
	[MaxSize] [real] NULL,
	[Name] [sysname] NOT NULL,
	[Size] [real] NULL,
	[UsedSpace] [real] NULL,
	[FileName] [nvarchar](260) NULL,
	[VolumeFreeSpace] [bigint] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[smo_servers_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [sysutility_ucp_core].[smo_servers_internal](
	[urn] [nvarchar](320) NULL,
	[powershell_path] [nvarchar](4000) NULL,
	[processing_time] [datetimeoffset](7) NOT NULL,
	[batch_time] [datetimeoffset](7) NULL,
	[AuditLevel] [smallint] NULL,
	[BackupDirectory] [nvarchar](260) NULL,
	[BrowserServiceAccount] [nvarchar](128) NULL,
	[BrowserStartMode] [smallint] NULL,
	[BuildClrVersionString] [nvarchar](20) NULL,
	[BuildNumber] [int] NULL,
	[Collation] [nvarchar](128) NULL,
	[CollationID] [int] NULL,
	[ComparisonStyle] [int] NULL,
	[ComputerNamePhysicalNetBIOS] [nvarchar](128) NULL,
	[DefaultFile] [nvarchar](260) NULL,
	[DefaultLog] [nvarchar](260) NULL,
	[Edition] [nvarchar](64) NULL,
	[EngineEdition] [smallint] NULL,
	[ErrorLogPath] [nvarchar](260) NULL,
	[FilestreamShareName] [nvarchar](260) NULL,
	[InstallDataDirectory] [nvarchar](260) NULL,
	[InstallSharedDirectory] [nvarchar](260) NULL,
	[InstanceName] [nvarchar](128) NULL,
	[IsCaseSensitive] [bit] NULL,
	[IsClustered] [bit] NULL,
	[IsFullTextInstalled] [bit] NULL,
	[IsSingleUser] [bit] NULL,
	[Language] [nvarchar](64) NULL,
	[MailProfile] [nvarchar](128) NULL,
	[MasterDBLogPath] [nvarchar](260) NULL,
	[MasterDBPath] [nvarchar](260) NULL,
	[MaxPrecision] [tinyint] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[NamedPipesEnabled] [bit] NULL,
	[NetName] [nvarchar](128) NULL,
	[NumberOfLogFiles] [int] NULL,
	[OSVersion] [nvarchar](32) NULL,
	[PerfMonMode] [smallint] NULL,
	[PhysicalMemory] [int] NULL,
	[Platform] [nvarchar](32) NULL,
	[Processors] [smallint] NULL,
	[ProcessorUsage] [int] NULL,
	[Product] [nvarchar](48) NULL,
	[ProductLevel] [nvarchar](32) NULL,
	[ResourceVersionString] [nvarchar](32) NULL,
	[RootDirectory] [nvarchar](260) NULL,
	[ServerType] [smallint] NULL,
	[ServiceAccount] [nvarchar](128) NULL,
	[ServiceInstanceId] [nvarchar](64) NULL,
	[ServiceName] [nvarchar](64) NULL,
	[ServiceStartMode] [smallint] NULL,
	[SqlCharSet] [smallint] NULL,
	[SqlCharSetName] [nvarchar](32) NULL,
	[SqlDomainGroup] [nvarchar](260) NULL,
	[SqlSortOrder] [smallint] NULL,
	[SqlSortOrderName] [nvarchar](64) NULL,
	[Status] [smallint] NULL,
	[TapeLoadWaitTime] [int] NULL,
	[TcpEnabled] [bit] NULL,
	[VersionMajor] [int] NULL,
	[VersionMinor] [int] NULL,
	[VersionString] [nvarchar](32) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[space_utilization_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [sysutility_ucp_core].[space_utilization_internal](
	[processing_time] [datetimeoffset](7) NOT NULL,
	[aggregation_type] [aggregationtype] NOT NULL,
	[object_type] [objecttype] NOT NULL,
	[virtual_server_name] [sysname] NOT NULL,
	[server_instance_name] [sysname] NOT NULL,
	[volume_device_id] [sysname] NOT NULL,
	[database_name] [sysname] NOT NULL,
	[filegroup_name] [sysname] NOT NULL,
	[dbfile_name] [sysname] NOT NULL,
	[used_space_bytes] [real] NULL,
	[allocated_space_bytes] [real] NULL,
	[total_space_bytes] [real] NULL,
	[available_space_bytes] [real] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_core].[volumes_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [sysutility_ucp_core].[volumes_internal](
	[ID] [int] IDENTITY(1, 1),
	[virtual_server_name] [sysname] NOT NULL,
	[physical_server_name] [sysname] NOT NULL,
	[volume_device_id] [sysname] NOT NULL,
	[volume_name] [nvarchar](260) NULL,
	[total_space_available] [real] NULL,
	[free_space] [real] NULL,
	[processing_time] [datetimeoffset](7) NOT NULL,
	[batch_time] [datetimeoffset](7) NULL,
	[powershell_path] [nvarchar](4000) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[sysutility_ucp_staging].[consistent_batch_manifests_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [sysutility_ucp_staging].[consistent_batch_manifests_internal](
	[server_instance_name] [sysname] NOT NULL,
	[batch_time] [datetimeoffset](7) NOT NULL
)
ON [PRIMARY]
