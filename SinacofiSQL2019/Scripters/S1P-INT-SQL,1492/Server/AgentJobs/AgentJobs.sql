
GO
--SqlScripter----[JobMonitorErrorLog].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'JobMonitorErrorLog',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'ope_sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'EjecutaSP',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'spMonitorErrorLog',
		@database_name=N'AdmDBA',
		@flags=0

GO
--SqlScripter----[JobMonitorJobFallido].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'JobMonitorJobFallido',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'ope_sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'EjecutSP',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'spMonitorJobFallido',
		@database_name=N'AdmDBA',
		@flags=0

GO
--SqlScripter----[JobAvisoCambioPassword].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'JobAvisoCambioPassword',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'ope_sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'EjecutaSp',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'spAvisoCambioPassword',
		@database_name=N'AdmDBA',
		@flags=0

GO
--SqlScripter----[syspolicy_purge_history].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'syspolicy_purge_history',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Verify that automation is enabled.',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=3,
		@on_success_step_id=0,
		@on_fail_action=1,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'IF (msdb.dbo.fn_syspolicy_is_automation_enabled() != 1)
        BEGIN
            RAISERROR(34022, 16, 1)
        END',
		@database_name=N'master',
		@flags=0

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Purge history.',
		@step_id=2,
		@cmdexec_success_code=0,
		@on_success_action=3,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'EXEC msdb.dbo.sp_syspolicy_purge_history',
		@database_name=N'master',
		@flags=0

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Erase Phantom System Health Records.',
		@step_id=3,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'PowerShell',
		@command=N'if (''$(ESCAPE_SQUOTE(INST))'' -eq ''MSSQLSERVER'') {$a = ''\DEFAULT''} ELSE {$a = ''''};
(Get-Item SQLSERVER:\SQLPolicy\$(ESCAPE_NONE(SRVR))$a).EraseSystemHealthPhantomRecords()',
		@database_name=N'master',
		@flags=0

GO
--SqlScripter----[JobSeguridadSplunk].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'JobSeguridadSplunk',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'JobSeguridadSplunk',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'CmdExec',
		@command=N'cmd.exe /c "I:\AdmDBA\Security\SAS_70.bat"',
		@database_name=N'',
		@flags=0

GO
--SqlScripter----[JobMonitorEspacioBD].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'JobMonitorEspacioBD',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'ope_sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'EjecutaSP',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=4,
		@on_success_step_id=2,
		@on_fail_action=4,
		@on_fail_step_id=2,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'spMonitorEspacioBD',
		@database_name=N'AdmDBA',
		@flags=0

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'EjecutaSpLog',
		@step_id=2,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'spMonitorEspacioBDLog',
		@database_name=N'AdmDBA',
		@flags=0

GO
--SqlScripter----[sysutility_get_cache_tables_data_into_aggregate_tables_daily].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'sysutility_get_cache_tables_data_into_aggregate_tables_daily',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'At every 12:01 AM stroke, the data of the cache tables get aggregated and put into corresponding aggregate by day tables.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Aggregate current days data from the cache tables into the server aggregation table',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=3,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'DECLARE @now DATETIME; SELECT @now = GETUTCDATE(); EXEC [sysutility_ucp_core].sp_copy_cache_table_data_into_aggregate_tables @aggregation_type=2, @endTime=@now',
		@database_name=N'DataCollector',
		@flags=0

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Purge cache table history data based on retention period',
		@step_id=2,
		@cmdexec_success_code=0,
		@on_success_action=3,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'EXEC [sysutility_ucp_core].[sp_purge_cache_tables];',
		@database_name=N'DataCollector',
		@flags=0

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Purge resource health policy evaluation history based on trailing window',
		@step_id=3,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'EXEC msdb.dbo.sp_sysutility_ucp_delete_policy_history',
		@database_name=N'msdb',
		@flags=0

GO
--SqlScripter----[Facture Alarmas].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'Facture Alarmas',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'Alarmas Suite Electrónica',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'ope_sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Ejecución script',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'begin
exec start_alarma
end',
		@database_name=N'facture',
		@flags=0

GO
--SqlScripter----[JobCycleErrorLog].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'JobCycleErrorLog',
		@enabled=1,
		@notify_level_eventlog=2,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'Recicla el archivo de ERRORLOG.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'ope_sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Create Error Log',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=2,
		@retry_interval=1,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'exec sp_cycle_errorlog
',
		@database_name=N'master',
		@flags=4

GO
--SqlScripter----[JobMonitorSesiones].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'JobMonitorSesiones',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'ope_sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'EjecutaSP',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'spMonitorSesiones',
		@database_name=N'AdmDBA',
		@flags=0

GO
--SqlScripter----[Facture Actualiza Canales y Estados ERN].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'Facture Actualiza Canales y Estados ERN',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'Actualiza Estado Canales de Transferencia y Estados ERN',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'ope_sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Ejecución Procedimientos',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'begin
exec PRC_ACTUALIZA_CANA
exec PRC_ACTUALIZA_QSE_ERN
exec PRC_ACTUALIZA_QSE_ERN_CLIE
end',
		@database_name=N'facture',
		@flags=0

GO
--SqlScripter----[JobMonitorAuditoria].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'JobMonitorAuditoria',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'ope_sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'EjecutaSP',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'spMonitorAuditoria',
		@database_name=N'AdmDBA',
		@flags=0

GO
--SqlScripter----[JobCpuMonitor].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'JobCpuMonitor',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'JobCpuMonitor',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'exec spCpuMonitor',
		@database_name=N'AdmDBA',
		@flags=0

GO
--SqlScripter----[JobSpaceDisc].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'JobSpaceDisc',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'Alerta, vía mail, el espacio disponible en disco. entre 85% y 95% WARNING y sobre 95% CRITICAL.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'JobSpaceDisc',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'exec spSpaceDisc',
		@database_name=N'AdmDBA',
		@flags=0

GO
--SqlScripter----[Facture Limpieza BD Facture].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'Facture Limpieza BD Facture',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No hay ninguna descripción.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'ope_sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Limpieza BD',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'begin
exec limpia_dbq_arch_clob
end',
		@database_name=N'facture',
		@flags=0

GO
--SqlScripter----[JobMonitorLoginFail].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'JobMonitorLoginFail',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'ope_sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'EjecutaSP',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'spMonitorLoginFail',
		@database_name=N'AdmDBA',
		@flags=0

GO
--SqlScripter----[JobPurgeMail].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'JobPurgeMail',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'ope_sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'EjecutaSP',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'spPurgeMail',
		@database_name=N'AdmDBA',
		@flags=0

GO
--SqlScripter----[JobReporteDiario].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'JobReporteDiario',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'JobReporteDiario',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'spHelpReport',
		@database_name=N'AdmDBA',
		@flags=0

GO
--SqlScripter----[sysutility_get_cache_tables_data_into_aggregate_tables_hourly].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'sysutility_get_cache_tables_data_into_aggregate_tables_hourly',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'At every hour''s stroke, the data of the cache tables get aggregated and put into corresponding aggregate by hour tables.',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Aggregate current hours data from the cache tables into the server aggregation table',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'DECLARE @now DATETIMEOFFSET(7); SELECT @now = SYSDATETIMEOFFSET(); EXEC [sysutility_ucp_core].sp_copy_cache_table_data_into_aggregate_tables @aggregation_type=1, @endTime=@now',
		@database_name=N'DataCollector',
		@flags=0

GO
--SqlScripter----[sysutility_get_views_data_into_cache_tables].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'sysutility_get_views_data_into_cache_tables',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'Gets all the views data into corresponding cache tables after every 15 minutes',
		@category_name=N'[[Uncategorized (Local)]]',
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Insert latest data from live tables into cache tables',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=3,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'EXEC [sysutility_ucp_staging].sp_copy_live_table_data_into_cache_tables',
		@database_name=N'DataCollector',
		@flags=0

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute resource health policy evaluation job',
		@step_id=2,
		@cmdexec_success_code=0,
		@on_success_action=3,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'PowerShell',
		@command=N'$serverName = ''$(ESCAPE_SQUOTE(SRVR))'';
                                   $path = Convert-UrnToPath "PolicyStore[@Name=`''$serverName`'']";
                                   dir $path\Policies -FORCE | where { $_.IsSystemObject -eq $true -and $_.Name -like ''Utility*'' } | Invoke-PolicyEvaluation -TargetServerName $serverName;',
		@database_name=N'msdb',
		@flags=0

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Compute resource health states',
		@step_id=3,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'EXEC msdb.dbo.sp_sysutility_ucp_calculate_health',
		@database_name=N'msdb',
		@flags=0

GO
--SqlScripter----[collection_set_1_noncached_collect_and_upload].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Data Collector]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Data Collector]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'collection_set_1_noncached_collect_and_upload',
		@enabled=0,
		@notify_level_eventlog=2,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'Data Collector job for collection set [Disk Usage]',
		@category_name=N'[Data Collector]',
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'collection_set_1_noncached_collect_and_upload_collect',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=3,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'CMDEXEC',
		@command=N'dcexec -c -s 1 -i "$(ESCAPE_DQUOTE(MACH))\$(ESCAPE_DQUOTE(INST))" -m 1',
		@database_name=N'',
		@flags=16

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'collection_set_1_noncached_collect_and_upload_purge_logs',
		@step_id=2,
		@cmdexec_success_code=0,
		@on_success_action=3,
		@on_success_step_id=0,
		@on_fail_action=3,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'
            EXEC [dbo].[sp_syscollector_purge_collection_logs]
            ',
		@database_name=N'msdb',
		@flags=16

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'collection_set_1_noncached_collect_and_upload_upload',
		@step_id=3,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'CMDEXEC',
		@command=N'dcexec -u -s 1 -i "$(ESCAPE_DQUOTE(MACH))\$(ESCAPE_DQUOTE(INST))"',
		@database_name=N'',
		@flags=16

GO
--SqlScripter----[collection_set_2_upload].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Data Collector]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Data Collector]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'collection_set_2_upload',
		@enabled=0,
		@notify_level_eventlog=2,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[Data Collector]',
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'collection_set_2_upload_purge_logs',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=3,
		@on_success_step_id=0,
		@on_fail_action=3,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'
            EXEC [dbo].[sp_syscollector_purge_collection_logs]
            ',
		@database_name=N'msdb',
		@flags=16

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'collection_set_2_upload_upload',
		@step_id=2,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'CMDEXEC',
		@command=N'dcexec -u -s 2 -i "$(ESCAPE_DQUOTE(MACH))\$(ESCAPE_DQUOTE(INST))"',
		@database_name=N'',
		@flags=0

GO
--SqlScripter----[mdw_purge_data_[DataCollector]].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Data Collector]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Data Collector]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'mdw_purge_data_[DataCollector]',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'Runs every day and removes data from Management Data Warehouse database that reached its expiration date.',
		@category_name=N'[Data Collector]',
		@owner_login_name=N'SKYLAB\nhuenul', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Step 1',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'exec core.sp_purge_data',
		@database_name=N'DataCollector',
		@flags=4

GO
--SqlScripter----[collection_set_3_collection].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Data Collector]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Data Collector]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'collection_set_3_collection',
		@enabled=0,
		@notify_level_eventlog=2,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[Data Collector]',
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'collection_set_3_collection_collect',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=3,
		@on_fail_step_id=0,
		@retry_attempts=3,
		@retry_interval=5,
		@os_run_priority=0,
		@subsystem=N'CMDEXEC',
		@command=N'dcexec -c -s 3 -i "$(ESCAPE_DQUOTE(MACH))\$(ESCAPE_DQUOTE(INST))" -m 0 -e $(ESCAPE_NONE(STOPEVENT))',
		@database_name=N'',
		@flags=80

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'collection_set_3_collection_autostop',
		@step_id=2,
		@cmdexec_success_code=0,
		@on_success_action=2,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'exec dbo.sp_syscollector_stop_collection_set @collection_set_id=3, @stop_collection_job = 0',
		@database_name=N'msdb',
		@flags=16

GO
--SqlScripter----[collection_set_2_collection].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Data Collector]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Data Collector]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'collection_set_2_collection',
		@enabled=0,
		@notify_level_eventlog=2,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[Data Collector]',
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'collection_set_2_collection_collect',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=3,
		@on_fail_step_id=0,
		@retry_attempts=3,
		@retry_interval=5,
		@os_run_priority=0,
		@subsystem=N'CMDEXEC',
		@command=N'dcexec -c -s 2 -i "$(ESCAPE_DQUOTE(MACH))\$(ESCAPE_DQUOTE(INST))" -m 0 -e $(ESCAPE_NONE(STOPEVENT))',
		@database_name=N'',
		@flags=80

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'collection_set_2_collection_autostop',
		@step_id=2,
		@cmdexec_success_code=0,
		@on_success_action=2,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'exec dbo.sp_syscollector_stop_collection_set @collection_set_id=2, @stop_collection_job = 0',
		@database_name=N'msdb',
		@flags=16

GO
--SqlScripter----[collection_set_3_upload].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Data Collector]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Data Collector]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'collection_set_3_upload',
		@enabled=0,
		@notify_level_eventlog=2,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[Data Collector]',
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'collection_set_3_upload_purge_logs',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=3,
		@on_success_step_id=0,
		@on_fail_action=3,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'TSQL',
		@command=N'
            EXEC [dbo].[sp_syscollector_purge_collection_logs]
            ',
		@database_name=N'msdb',
		@flags=16

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'collection_set_3_upload_upload',
		@step_id=2,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'CMDEXEC',
		@command=N'dcexec -u -s 3 -i "$(ESCAPE_DQUOTE(MACH))\$(ESCAPE_DQUOTE(INST))"',
		@database_name=N'',
		@flags=0

GO
--SqlScripter----[PlanLimpiaLog].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Database Maintenance]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Database Maintenance]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'PlanLimpiaLog',
		@enabled=1,
		@notify_level_eventlog=2,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[Database Maintenance]',
		@owner_login_name=N'SKYLAB\nhuenul', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'SSIS',
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\PlanLimpiaLog" /set "\Package\Subplan_1.Disable;false"',
		@database_name=N'',
		@flags=0

GO
--SqlScripter----[PlanBackupFull.Subplan_1].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Database Maintenance]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Database Maintenance]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'PlanBackupFull.Subplan_1',
		@enabled=0,
		@notify_level_eventlog=2,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[Database Maintenance]',
		@owner_login_name=N'ope_sa', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'SSIS',
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\PlanBackupFull" /set "\Package\Subplan_1.Disable;false"',
		@database_name=N'',
		@flags=0

GO
--SqlScripter----[PlanBackupLog].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Database Maintenance]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Database Maintenance]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'PlanBackupLog',
		@enabled=1,
		@notify_level_eventlog=2,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[Database Maintenance]',
		@owner_login_name=N'SKYLAB\nhuenul', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'SSIS',
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\PlanBackupLog" /set "\Package\Subplan_1.Disable;false"',
		@database_name=N'',
		@flags=0

GO
--SqlScripter----[PlanCheckIntegrityDB].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Database Maintenance]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Database Maintenance]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'PlanCheckIntegrityDB',
		@enabled=1,
		@notify_level_eventlog=2,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'No description available.',
		@category_name=N'[Database Maintenance]',
		@owner_login_name=N'SKYLAB\nhuenul', @job_id = @jobId OUTPUT

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0,
		@subsystem=N'SSIS',
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\PlanCheckIntegrityDB" /set "\Package\Subplan_1.Disable;false"',
		@database_name=N'',
		@flags=0
