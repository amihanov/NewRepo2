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
