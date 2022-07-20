
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
