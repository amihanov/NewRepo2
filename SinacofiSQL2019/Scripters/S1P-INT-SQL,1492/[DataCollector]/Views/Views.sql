
GO
--SqlScripter----[core].[snapshots].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[core].[snapshots]') IS NULL EXEC('CREATE VIEW [core].[snapshots] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [core].[snapshots]
AS 
    SELECT 
        s.source_id,
        s.snapshot_id, 
        s.snapshot_time_id,
        t.snapshot_time, 
        CASE src.days_until_expiration
            WHEN 0 THEN NULL
            ELSE DATEADD(DAY, src.days_until_expiration, t.snapshot_time)
        END AS valid_through,
        src.instance_name, 
        src.collection_set_uid, 
        src.operator,
        s.log_id
    FROM core.source_info_internal src, core.snapshots_internal s, core.snapshot_timetable_internal t
    WHERE src.source_id = s.source_id AND s.snapshot_time_id = t.snapshot_time_id
GO

GO
--SqlScripter----[core].[supported_collector_types].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[core].[supported_collector_types]') IS NULL EXEC('CREATE VIEW [core].[supported_collector_types] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [core].[supported_collector_types]
AS 
    SELECT collector_type_uid
    FROM core.supported_collector_types_internal
GO

GO
--SqlScripter----[core].[wait_types_categorized].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[core].[wait_types_categorized]') IS NULL EXEC('CREATE VIEW [core].[wait_types_categorized] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [core].[wait_types_categorized]
AS
    SELECT 
        ct.category_name,
        ev.wait_type, 
        ct.category_id, 
        ct.ignore
    FROM core.wait_categories ct
    INNER JOIN core.wait_types ev ON (ev.category_id = ct.category_id)
GO

GO
--SqlScripter----[snapshots].[distinct_query_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[distinct_query_stats]') IS NULL EXEC('CREATE VIEW [snapshots].[distinct_query_stats] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [snapshots].[distinct_query_stats]
AS 
    SELECT 
        dqth.distinct_query_hash,
        SUM(qs.execution_count) AS execution_count,
        SUM(qs.total_worker_time) AS total_worker_time,
        SUM(qs.total_physical_reads) AS total_physical_reads,
        SUM(qs.total_logical_reads) AS total_logical_reads,
        SUM(qs.total_logical_writes) AS total_logical_writes,
        SUM(qs.total_clr_time) AS total_clr_time,
        SUM(qs.total_elapsed_time) AS total_elapsed_time
    FROM
        [snapshots].[query_stats] qs
        JOIN [core].[snapshots_internal] s ON (s.snapshot_id = qs.snapshot_id)
        JOIN [snapshots].[distinct_query_to_handle] dqth ON (s.source_id = dqth.source_id AND qs.sql_handle = dqth.sql_handle)
    GROUP BY
        dqth.distinct_query_hash
GO

GO
--SqlScripter----[snapshots].[performance_counters].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[snapshots].[performance_counters]') IS NULL EXEC('CREATE VIEW [snapshots].[performance_counters] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [snapshots].[performance_counters]
AS
SELECT     
    pci.performance_counter_id, 
    pcv.snapshot_id AS snapshot_id, 
    pcv.collection_time AS collection_time,
    pci.path AS path, 
    pci.object_name AS performance_object_name,
    pci.counter_name AS performance_counter_name,
    pci.instance_name AS performance_instance_name,
    pcv.formatted_value AS formatted_value, 
    pcv.raw_value_first, 
    pcv.raw_value_second
FROM
    snapshots.performance_counter_instances pci
    INNER JOIN snapshots.performance_counter_values pcv ON pci.performance_counter_id = pcv.performance_counter_instance_id
GO

GO
--SqlScripter----[sysutility_ucp_core].[cpu_utilization].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_core].[cpu_utilization]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_core].[cpu_utilization] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_core].[cpu_utilization]
AS
  SELECT aggregation_type, processing_time, object_type,
         physical_server_name, server_instance_name, database_name,
         percent_total_cpu_utilization
  FROM [sysutility_ucp_core].[cpu_utilization_internal]
GO

GO
--SqlScripter----[sysutility_ucp_core].[latest_computers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_core].[latest_computers]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_core].[latest_computers] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_core].[latest_computers]
AS 
  SELECT [id], 
         virtual_server_name, 
         physical_server_name, 
         is_clustered_server,
         num_processors, 
         cpu_name, 
         cpu_caption, 
         cpu_family, 
         cpu_architecture, 
         cpu_max_clock_speed, 
         cpu_clock_speed, 
         l2_cache_size, 
         l3_cache_size, 
         urn,
         powershell_path,
         processing_time,
         batch_time,
         percent_total_cpu_utilization
  FROM [sysutility_ucp_core].[computers_internal]
  WHERE processing_time = (SELECT latest_processing_time FROM [msdb].[dbo].[sysutility_ucp_processing_state_internal]);
GO

GO
--SqlScripter----[sysutility_ucp_core].[latest_dacs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_core].[latest_dacs]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_core].[latest_dacs] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_core].[latest_dacs]
AS
   SELECT 
      dac_id, 
      server_instance_name, 
      dac_name, 
      physical_server_name, 
      dac_deploy_date, 
      dac_description, 
      urn,
      powershell_path,
      processing_time,
      batch_time,
      dac_percent_total_cpu_utilization
      FROM [sysutility_ucp_core].[dacs_internal] S
      WHERE S.processing_time =  (SELECT latest_processing_time FROM [msdb].[dbo].[sysutility_ucp_processing_state_internal])
GO

GO
--SqlScripter----[sysutility_ucp_core].[latest_databases].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_core].[latest_databases]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_core].[latest_databases] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_core].[latest_databases]
AS
    SELECT [urn]
        , [powershell_path]
        , [processing_time]
        , [batch_time]
        , [server_instance_name]
        , [parent_urn]
        , [Collation]
        , [CompatibilityLevel]
        , [CreateDate]
        , [EncryptionEnabled]
        , [Name]
        , [RecoveryModel]
        , [Trustworthy]  
        , [state]
        FROM [sysutility_ucp_core].[databases_internal] AS SI
        WHERE SI.processing_time =  (SELECT latest_processing_time FROM [msdb].[dbo].[sysutility_ucp_processing_state_internal])
GO

GO
--SqlScripter----[sysutility_ucp_core].[latest_datafiles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_core].[latest_datafiles]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_core].[latest_datafiles] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_core].[latest_datafiles]
AS
 SELECT [urn]
        , [powershell_path]
        , [processing_time]
        , [batch_time]
        , [server_instance_name]
        , [database_name] 
        , [filegroup_name]
        , [parent_urn]
        , [physical_server_name]
        , [volume_name]
        , [volume_device_id]
        , [Growth] 
        , [GrowthType]
        , [MaxSize] 
        , [Name]
        , [Size]
        , [UsedSpace] 
        , [FileName]
        , [VolumeFreeSpace]
        , [sysutility_ucp_misc].[fn_get_max_size_available]([Size], [MaxSize], [Growth], [GrowthType], [VolumeFreeSpace]) AS [available_space]
        FROM [sysutility_ucp_core].[datafiles_internal] AS SI
        WHERE SI.processing_time =  (SELECT latest_processing_time FROM [msdb].[dbo].[sysutility_ucp_processing_state_internal])
            -- Suppress for "not available" databases (state=1). We lack full filegroup/file hierarchy metadata for these databases. 
            AND EXISTS (
                SELECT * FROM sysutility_ucp_core.latest_databases AS db 
                WHERE db.server_instance_name = SI.server_instance_name AND db.Name = SI.database_name AND db.state = 0)
GO

GO
--SqlScripter----[sysutility_ucp_core].[latest_filegroups].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_core].[latest_filegroups]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_core].[latest_filegroups] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_core].[latest_filegroups]
AS
    SELECT [urn]
        , [powershell_path]
        , [processing_time]
        , [batch_time]
        , [server_instance_name]
        , [database_name]
        , [parent_urn]
        , [Name]
        FROM [sysutility_ucp_core].[filegroups_internal] AS SI
        WHERE SI.processing_time =  (SELECT latest_processing_time FROM [msdb].[dbo].[sysutility_ucp_processing_state_internal])
            -- Suppress for "not available" databases (state=1). We lack full filegroup/file hierarchy metadata for these databases. 
            AND EXISTS (
                SELECT * FROM sysutility_ucp_core.latest_databases AS db 
                WHERE db.server_instance_name = SI.server_instance_name AND db.Name = SI.database_name AND db.state = 0)
GO

GO
--SqlScripter----[sysutility_ucp_core].[latest_logfiles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_core].[latest_logfiles]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_core].[latest_logfiles] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_core].[latest_logfiles]
AS
 SELECT [urn]
        , [powershell_path]
        , [processing_time]
        , [batch_time]
        , [server_instance_name]
        , [database_name] 
        , [parent_urn]
        , [physical_server_name]
        , [volume_name]
        , [volume_device_id]
        , [Growth] 
        , [GrowthType]
        , [MaxSize] 
        , [Name]
        , [Size]
        , [UsedSpace] 
        , [FileName]
        , [VolumeFreeSpace]
        , [sysutility_ucp_misc].[fn_get_max_size_available]([Size], [MaxSize], [Growth], [GrowthType], [VolumeFreeSpace]) AS [available_space]
        FROM [sysutility_ucp_core].[logfiles_internal] AS SI
        WHERE SI.processing_time =  (SELECT latest_processing_time FROM [msdb].[dbo].[sysutility_ucp_processing_state_internal])
            -- Suppress for "not available" databases (state=1). We lack full filegroup/file hierarchy metadata for these databases. 
            AND EXISTS (
                SELECT * FROM sysutility_ucp_core.latest_databases AS db 
                WHERE db.server_instance_name = SI.server_instance_name AND db.Name = SI.database_name AND db.state = 0)
GO

GO
--SqlScripter----[sysutility_ucp_core].[latest_smo_servers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_core].[latest_smo_servers]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_core].[latest_smo_servers] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_core].[latest_smo_servers]
AS

SELECT urn
, [powershell_path]
, [processing_time]
, [batch_time]
, [AuditLevel]
, [BackupDirectory]
, [BrowserServiceAccount]
, [BrowserStartMode]
, [BuildClrVersionString]
, [BuildNumber]
, [Collation]
, [CollationID]
, [ComparisonStyle]
, [ComputerNamePhysicalNetBIOS]
, [DefaultFile]
, [DefaultLog]
, [Edition]
, [EngineEdition]
, [ErrorLogPath]
, [FilestreamShareName]
, [InstallDataDirectory]
, [InstallSharedDirectory]
, [InstanceName]
, [IsCaseSensitive]
, [IsClustered]
, [IsFullTextInstalled]
, [IsSingleUser]
, [Language]
, [MailProfile]
, [MasterDBLogPath]
, [MasterDBPath]
, [MaxPrecision]
, [Name]
, [NamedPipesEnabled]
, [NetName]
, [NumberOfLogFiles]
, [OSVersion]
, [PerfMonMode]
, [PhysicalMemory]
, [Platform]
, [Processors]
, [ProcessorUsage]
, [Product]
, [ProductLevel]
, [ResourceVersionString]
, [RootDirectory]
, [ServerType]
, [ServiceAccount]
, [ServiceInstanceId]
, [ServiceName]
, [ServiceStartMode]
, [SqlCharSet]
, [SqlCharSetName]
, [SqlDomainGroup]
, [SqlSortOrder]
, [SqlSortOrderName]
, [Status]
, [TapeLoadWaitTime]
, [TcpEnabled]
, [VersionMajor]
, [VersionMinor]
, [VersionString]
FROM [sysutility_ucp_core].[smo_servers_internal] AS SI
WHERE SI.processing_time =  (SELECT latest_processing_time FROM [msdb].[dbo].[sysutility_ucp_processing_state_internal])
GO

GO
--SqlScripter----[sysutility_ucp_core].[latest_volumes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_core].[latest_volumes]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_core].[latest_volumes] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_core].[latest_volumes]
AS
   SELECT [ID], 
          [virtual_server_name], 
          [physical_server_name], 
          [volume_device_id], 
          [volume_name], 
          [powershell_path],
          [processing_time],
          [batch_time], 
          [total_space_available], 
          (total_space_available - free_space) AS [total_space_utilized], 
          (CASE WHEN total_space_available = 0 THEN 0 ELSE (100 * (total_space_available - free_space))/total_space_available END) AS  [percent_total_space_utilization]
   FROM [sysutility_ucp_core].[volumes_internal]
   WHERE processing_time = (SELECT latest_processing_time FROM [msdb].[dbo].[sysutility_ucp_processing_state_internal])
GO

GO
--SqlScripter----[sysutility_ucp_core].[space_utilization].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_core].[space_utilization]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_core].[space_utilization] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_core].[space_utilization]
AS
  SELECT aggregation_type, 
         processing_time, 
         object_type,
         virtual_server_name, 
         volume_device_id, 
         server_instance_name, 
         database_name, 
         [filegroup_name], 
         dbfile_name,
         total_space_bytes, 
         allocated_space_bytes, 
         used_space_bytes, 
         available_space_bytes
  FROM [sysutility_ucp_core].[space_utilization_internal]
GO

GO
--SqlScripter----[sysutility_ucp_misc].[utility_objects_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_misc].[utility_objects_internal]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_misc].[utility_objects_internal] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_misc].[utility_objects_internal]
AS 
SELECT 
   SCHEMA_NAME (obj.[schema_id]) AS [object_schema], 
   obj.name AS [object_name], 
   obj.type_desc AS sql_object_type, 
   CAST (prop.value AS varchar(60)) AS utility_object_type 
FROM sys.extended_properties AS prop
INNER JOIN sys.objects AS obj ON prop.major_id = obj.[object_id]
WHERE prop.name = 'MS_UtilityObjectType';
GO

GO
--SqlScripter----[sysutility_ucp_staging].[latest_computer_cpu_memory_configuration].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_staging].[latest_computer_cpu_memory_configuration]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_staging].[latest_computer_cpu_memory_configuration] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_staging].[latest_computer_cpu_memory_configuration]
AS
   SELECT * 
   FROM
      (
        SELECT  
           ROW_NUMBER() OVER (PARTITION BY t.physical_server_name ORDER BY t.batch_time DESC) AS Rank,
           [virtual_server_name], [is_clustered_server],[physical_server_name], 
           [num_processors], [cpu_name], [cpu_caption], [cpu_family], [cpu_architecture], [cpu_max_clock_speed], [cpu_clock_speed], 
           [l2_cache_size], [l3_cache_size], 
           [server_processor_usage],
           t.[batch_time],
           N'Utility[@Name=''' + CONVERT(SYSNAME, SERVERPROPERTY(N'ServerName')) + N''']/Computer[@Name=''' + t.physical_server_name + N''']' AS urn,
           N'SQLSERVER:\Utility\'+CASE WHEN 0 = CHARINDEX(N'\', CONVERT(SYSNAME, SERVERPROPERTY(N'ServerName')), 1) THEN CONVERT(SYSNAME, SERVERPROPERTY(N'ServerName')) + N'\DEFAULT' ELSE @@SERVERNAME END 
          +N'\Computers\'+msdb.dbo.fn_encode_sqlname_for_powershell(t.physical_server_name) AS powershell_path
        FROM [snapshots].[sysutility_ucp_cpu_memory_configurations_internal] AS t
             INNER JOIN [sysutility_ucp_staging].[consistent_batch_manifests_internal] cb
             ON t.server_instance_name = cb.server_instance_name AND t.batch_time = cb.batch_time
      ) AS S
   WHERE S.Rank = 1
GO

GO
--SqlScripter----[sysutility_ucp_staging].[latest_dac_cpu_utilization].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_staging].[latest_dac_cpu_utilization]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_staging].[latest_dac_cpu_utilization] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_staging].[latest_dac_cpu_utilization]
AS
  SELECT physical_server_name, ds.server_instance_name, dac_db, dac_deploy_date, dac_description, dac_name, 
         lifetime_cpu_time_ms, interval_cpu_pct AS latest_cpu_pct, interval_cpu_time_ms AS latest_interval_cpu_time_ms, 
         interval_start_time AS latest_interval_start_time, interval_end_time AS latest_interval_end_time, 
         ds.batch_time,
         N'Utility[@Name=''' + CONVERT(SYSNAME, SERVERPROPERTY(N'ServerName')) + N''']/DeployedDac[@Name=''' + ds.dac_name + N''' and @ServerInstanceName=''' + ds.server_instance_name + N''']' AS urn,
         N'SQLSERVER:\Utility\'+CASE WHEN 0 = CHARINDEX(N'\', CONVERT(SYSNAME, SERVERPROPERTY(N'ServerName')), 1) THEN CONVERT(SYSNAME, SERVERPROPERTY(N'ServerName')) + N'\DEFAULT' ELSE CONVERT(SYSNAME, SERVERPROPERTY(N'ServerName')) END 
        +N'\DeployedDacs\'+msdb.dbo.fn_encode_sqlname_for_powershell(ds.dac_name+'.'+ds.server_instance_name) AS powershell_path
  FROM [snapshots].[sysutility_ucp_dac_collected_execution_statistics_internal] ds
        INNER JOIN [sysutility_ucp_staging].[consistent_batch_manifests_internal] cb
        ON ds.server_instance_name = cb.server_instance_name AND ds.batch_time = cb.batch_time
GO

GO
--SqlScripter----[sysutility_ucp_staging].[latest_instance_cpu_utilization].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_staging].[latest_instance_cpu_utilization]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_staging].[latest_instance_cpu_utilization] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_staging].[latest_instance_cpu_utilization]
AS
   SELECT t.[server_instance_name],  
          [instance_processor_usage],
          t.[batch_time]
   FROM [snapshots].[sysutility_ucp_cpu_memory_configurations_internal] AS t
        INNER JOIN [sysutility_ucp_staging].[consistent_batch_manifests_internal] cb
        ON t.server_instance_name = cb.server_instance_name AND t.batch_time = cb.batch_time
GO

GO
--SqlScripter----[sysutility_ucp_staging].[latest_smo_properties].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_staging].[latest_smo_properties]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_staging].[latest_smo_properties] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_staging].[latest_smo_properties]
AS
   SELECT s.physical_server_name, s.server_instance_name, s.urn, s.object_type, 
          s.property_name,s.property_value, s.snapshot_id, s.batch_time
   FROM [snapshots].[sysutility_ucp_smo_properties_internal] AS s
         INNER JOIN [sysutility_ucp_staging].[consistent_batch_manifests_internal] cb
         ON s.server_instance_name = cb.server_instance_name AND s.batch_time = cb.batch_time
GO

GO
--SqlScripter----[sysutility_ucp_staging].[latest_volumes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[sysutility_ucp_staging].[latest_volumes]') IS NULL EXEC('CREATE VIEW [sysutility_ucp_staging].[latest_volumes] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [sysutility_ucp_staging].[latest_volumes]
AS
   SELECT [virtual_server_name],
          [physical_server_name],
          [volume_device_id],
          [volume_name],
          [total_space_available],  -- in MB
          [free_space], -- in MB
          N'SQLSERVER:\Utility\'+ CASE WHEN 0 = CHARINDEX(N'\', CONVERT(SYSNAME, SERVERPROPERTY(N'ServerName')), 1) 
                                        THEN CONVERT(SYSNAME, SERVERPROPERTY(N'ServerName')) + N'\DEFAULT' 
                                        ELSE CONVERT(SYSNAME, SERVERPROPERTY(N'ServerName')) 
                                    END 
          +N'\Computers\'+msdb.dbo.fn_encode_sqlname_for_powershell(physical_server_name) 
          +N'\Volumes\'+msdb.dbo.fn_encode_sqlname_for_powershell(volume_name) AS powershell_path,
          [batch_time],
          [snapshot_id]
      FROM
      (
      SELECT 
         [virtual_server_name],
         [physical_server_name],
         [volume_device_id],
         [volume_name],
         [total_space_available],
         [free_space],
         V.[batch_time],
         [snapshot_id], 
         ROW_NUMBER() OVER (PARTITION BY physical_server_name,volume_device_id ORDER BY V.batch_time DESC) rk
      FROM [snapshots].[sysutility_ucp_volumes_internal] AS V
           INNER JOIN [sysutility_ucp_staging].[consistent_batch_manifests_internal] cb
           ON V.server_instance_name = cb.server_instance_name AND V.batch_time = cb.batch_time
      ) AS T
      WHERE T.rk = 1
GO
