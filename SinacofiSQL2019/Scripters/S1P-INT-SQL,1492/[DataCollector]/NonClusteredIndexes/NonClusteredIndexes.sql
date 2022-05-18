
GO
--SqlScripter----[core].[snapshot_timetable_internal].[IDX_snapshot_time].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_snapshot_time] ON [core].[snapshot_timetable_internal] (
	[snapshot_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[core].[snapshots_internal].[IDX_snapshot_time_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_snapshot_time_id] ON [core].[snapshots_internal] (
	[snapshot_time_id] ASC,
	[source_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[core].[source_info_internal].[UQ_collection_set_uid_instance_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [core].[source_info_internal] ADD CONSTRAINT [UQ_collection_set_uid_instance_name] UNIQUE NONCLUSTERED (
	[collection_set_uid] ASC,
	[instance_name] ASC,
	[operator] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[active_sessions_and_requests].[IDX_blocking_session_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_blocking_session_id] ON [snapshots].[active_sessions_and_requests] (
	[blocking_session_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[active_sessions_and_requests].[IDX_collection_time].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_collection_time] ON [snapshots].[active_sessions_and_requests] (
	[collection_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[notable_query_plan].[IDX_notable_query_plan_plan_handle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_notable_query_plan_plan_handle] ON [snapshots].[notable_query_plan] (
	[source_id] ASC,
	[plan_handle] ASC,
	[statement_start_offset] ASC,
	[statement_end_offset] ASC,
	[creation_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_wait_stats].[IDX_os_wait_stats1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_os_wait_stats1] ON [snapshots].[os_wait_stats] (
	[collection_time] DESC,
	[snapshot_id] ASC)
INCLUDE (
	[signal_wait_time_ms],
	[wait_type]
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[os_wait_stats].[IDX_os_wait_stats2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_os_wait_stats2] ON [snapshots].[os_wait_stats] (
	[snapshot_id] ASC,
	[collection_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[performance_counter_instances].[IDX_performance_counter_instances1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_performance_counter_instances1] ON [snapshots].[performance_counter_instances] (
	[object_name] ASC,
	[counter_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[performance_counter_instances].[UN_performance_counter_path].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [snapshots].[performance_counter_instances] ADD CONSTRAINT [UN_performance_counter_path] UNIQUE NONCLUSTERED (
	[path] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[performance_counter_values].[IDX_performance_counter_values1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_performance_counter_values1] ON [snapshots].[performance_counter_values] (
	[snapshot_id] ASC,
	[performance_counter_instance_id] ASC,
	[collection_time] ASC)
INCLUDE (
	[formatted_value]
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_cpu_memory_conf].[NCI_sysutility_ucp_c#E2C2C7D9D8C93ED08AAFEF2B77313FF0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [NCI_sysutility_ucp_cpu_memory_configurations_internal] ON [snapshots].[sysutility_ucp_cpu_memory_configurations_internal] (
	[snapshot_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_dac_collected_e].[NCI_sysutility_ucp_d#6ABCDC1F26CC13C6C932D4C5BDC91627].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [NCI_sysutility_ucp_dac_collected_execution_statistics_internal] ON [snapshots].[sysutility_ucp_dac_collected_execution_statistics_internal] (
	[snapshot_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_smo_properties_internal].[NCI_sysutility_ucp_smo_properties_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [NCI_sysutility_ucp_smo_properties_internal] ON [snapshots].[sysutility_ucp_smo_properties_internal] (
	[snapshot_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[sysutility_ucp_volumes_internal].[NCI_sysutility_ucp_volumes_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [NCI_sysutility_ucp_volumes_internal] ON [snapshots].[sysutility_ucp_volumes_internal] (
	[snapshot_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[trace_data].[IDX_trace_data_StartTime_EventClass].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_trace_data_StartTime_EventClass] ON [snapshots].[trace_data] (
	[StartTime] ASC,
	[EventClass] ASC
) ON [PRIMARY]

GO
--SqlScripter----[snapshots].[trace_data].[IDX_trace_data_trace_info_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_trace_data_trace_info_id] ON [snapshots].[trace_data] (
	[trace_info_id] ASC
) ON [PRIMARY]
