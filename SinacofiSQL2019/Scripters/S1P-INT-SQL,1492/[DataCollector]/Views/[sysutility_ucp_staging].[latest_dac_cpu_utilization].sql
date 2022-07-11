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
