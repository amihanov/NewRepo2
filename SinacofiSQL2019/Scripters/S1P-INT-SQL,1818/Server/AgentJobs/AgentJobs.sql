
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
		@command=N'$SQLServerConnection = New-Object System.Data.SqlClient.SqlConnection
$SQLServerConnection.ConnectionString = "Data Source=$(ESCAPE_NONE(SRVR));Initial Catalog=master;Integrated Security=SSPI;Application Name=$applicationName"
$PolicyStoreConnection = New-Object Microsoft.SqlServer.Management.Sdk.Sfc.SqlStoreConnection($SQLServerConnection)
$PolicyStore = New-Object Microsoft.SqlServer.Management.Dmf.PolicyStore ($PolicyStoreConnection)
$PolicyStore.EraseSystemHealthPhantomRecords()',
		@database_name=N'master',
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
--SqlScripter----[jobSpaceDisc].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[[Uncategorized (Local)]]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[[Uncategorized (Local)]]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'jobSpaceDisc',
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
		@owner_login_name=N'SKYLAB\svasquez', @job_id = @jobId OUTPUT

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
		@owner_login_name=N'SKYLAB\svasquez', @job_id = @jobId OUTPUT

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

GO
--SqlScripter----[PlanBackupFull].sql
GO
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Database Maintenance]' AND category_class=1)
   EXEC msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Database Maintenance]'

DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'PlanBackupFull',
		@enabled=1,
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
		@owner_login_name=N'SKYLAB\svasquez', @job_id = @jobId OUTPUT

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
