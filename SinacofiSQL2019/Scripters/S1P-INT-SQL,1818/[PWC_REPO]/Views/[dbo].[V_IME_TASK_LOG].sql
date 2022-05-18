SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_IME_TASK_LOG]') IS NULL EXEC('CREATE VIEW [dbo].[V_IME_TASK_LOG] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_IME_TASK_LOG]
AS
select  ' ' "REPOSITORY_ID", 
        'com.informatica.powercenter.deployment.IntegrationService' "SERVER_CLASS_ID", 
        'Integration Service_' + ltrim(str(wflow_run.SERVER_ID)) "SERVER_ID", 
	''  USER_ACCT_CLASS_ID,
	''  USER_ACCOUNT_ID,
	'com.informatica.powercenter.process.TriggerRunEvent'  EVENT_CLASS_ID,
	'PC_DEFAULT_EVENT_OBJECT'  EVENT_ID,
	taskinst_log.START_TIME "START_DATE",
	taskinst_log.END_TIME "END_DATE",
	'com.informatica.powercenter.operation.Run'  "RUN_CLASS_ID",
	'PC_RUN_' + ltrim(str(taskinst_log.WORKFLOW_RUN_ID))  "RUN_ID",
	'com.informatica.powercenter.process.' + REPLACE(otype2.OBJECT_TYPE_NAME,' ','')  "ACTIVITY_CLASS_ID",
	otype2.OBJECT_TYPE_NAME + '_' + ltrim(str(taskinst_log.WORKFLOW_ID))  "ACTIVITY_ID",
	'com.informatica.powercenter.process.' + REPLACE(otype3.OBJECT_TYPE_NAME,' ','')+'TaskInstance'  "STEP_CLASS_ID",
	'TASK_INSTANCE_' + otype3.OBJECT_TYPE_NAME + '_'+ ltrim(str(taskinst_log.INSTANCE_ID)) "STEP_ID",
	CASE WHEN task.IS_REUSABLE = 1 THEN 'com.informatica.powercenter.process.'+REPLACE(otype3.OBJECT_TYPE_NAME,' ','') ELSE
	'com.informatica.powercenter.process.' +REPLACE(otype3.OBJECT_TYPE_NAME,' ','')+'TaskInstance'  END "TASK_CLASS_ID",
	CASE WHEN task.IS_REUSABLE = 1 THEN 
	otype3.OBJECT_TYPE_NAME + '_' + ltrim(str(taskinst_log.TASK_ID)) ELSE
	'TASK_INSTANCE_' + otype3.OBJECT_TYPE_NAME + '_'+ ltrim(str(taskinst_log.INSTANCE_ID)) END "TASK_ID",
	''  "TRANSFORM_CLASS_ID",
	''  "TRANSFORM_ID",
        'com.informatica.powercenter.package' + REPLACE(otype.OBJECT_TYPE_NAME,' ','')  "FOLDER_CLASS_ID",
	otype.OBJECT_TYPE_NAME + '_' + ltrim(str(taskinst_log.SUBJECT_ID))  "FOLDER_ID",
	'com.informatica.powercenter.operation.RunStatus'  "STATUS_CLASS_ID",
	ltrim(str(taskinst_log.RUN_STATUS_CODE)) + '~' + ltrim(str(taskinst_log.RUN_ERR_CODE))  "STATUS_ID",
	taskinst_log.CHILD_RUN_ID  "STEP_RUN_NUMBER",
	0  "INPUT_ROWS",
	0  "REJECTED_ROWS",
	0  "FAILED_ROWS",
	0  "OUTPUT_ROWS",
	0  "LOG_BLOCK_READS",
	0  "PHY_BLOCK_READS",
	0  "LOG_BLOCK_WRITES",
	0  "PHY_BLOCK_WRITES",
	datediff(s,taskinst_log.START_TIME,taskinst_log.END_TIME)*1000  "EXECUTION_MSECS",
	0  "READ_MSECS",
	0  "WRITE_MSECS",
	0  "IDLE_WAIT_MSECS",
	0  "BUSY_WAIT_MSECS",
	0  "IDLE_WAIT_EVENTS",
	0  "BUSY_WAIT_EVENTS",       taskinst_log.RUN_ERR_MSG "MESSAGE",
	task.SUBJECT_ID "SUBJECT_ID"
from OPB_OBJECT_TYPE otype, OPB_OBJECT_TYPE otype1, OPB_REPOSIT repo, 
           OPB_OBJECT_TYPE otype2, OPB_OBJECT_TYPE otype3, OPB_WORKFLOW workflow,
           OPB_TASK_INST_RUN taskinst_log,OPB_WFLOW_RUN wflow_run,
           OPB_TASK task, OPB_TASK wkflow_task
	   where repo.RECID = 1 and
           otype.OBJECT_TYPE_ID = 29 and 
           taskinst_log.WORKFLOW_RUN_ID = wflow_run.WORKFLOW_RUN_ID and
           taskinst_log.WORKFLOW_ID = workflow.WORKFLOW_ID and workflow.WORKFLOW_ID = wkflow_task.TASK_ID
and workflow.VERSION_NUMBER = wkflow_task.VERSION_NUMBER
and wkflow_task.TASK_TYPE = 71
and wkflow_task.IS_VISIBLE = 1
and
           otype1.OBJECT_TYPE_ID = 41 and
           otype2.OBJECT_TYPE_ID = 71 and
           otype3.OBJECT_TYPE_ID = 70 and
           taskinst_log.TASK_TYPE = 70 and
           taskinst_log.TASK_ID = task.TASK_ID and taskinst_log.VERSION_NUMBER = task.VERSION_NUMBER
AND taskinst_log.FRAGMENT_ID IN (1,-1)
and task.IS_VISIBLE = 1
and task.TASK_TYPE = 70
UNION ALL
select  ' ' "REPOSITORY_ID", 
        'com.informatica.powercenter.deployment.IntegrationService' "SERVER_CLASS_ID", 
        'Integration Service_' + ltrim(str(wflow_run.SERVER_ID)) "SERVER_ID", 
	''  USER_ACCT_CLASS_ID,
	''  USER_ACCOUNT_ID,
	'com.informatica.powercenter.process.TriggerRunEvent'  EVENT_CLASS_ID,
	'PC_DEFAULT_EVENT_OBJECT'  EVENT_ID,
	taskinst_log.START_TIME "START_DATE",
	taskinst_log.END_TIME "END_DATE",
	'com.informatica.powercenter.operation.Run' "RUN_CLASS_ID",
	'PC_RUN_' + ltrim(str(taskinst_log.WORKFLOW_RUN_ID))  "RUN_ID",
	'com.informatica.powercenter.process.'+REPLACE(otype2.OBJECT_TYPE_NAME,' ','')   "ACTIVITY_CLASS_ID",
	otype2.OBJECT_TYPE_NAME + '_' + ltrim(str(taskinst_log.WORKFLOW_ID))  "ACTIVITY_ID",
	'com.informatica.powercenter.process.' + REPLACE(otype3.OBJECT_TYPE_NAME,' ','')+'TaskInstance'  "STEP_CLASS_ID",
	'TASK_INSTANCE_' + otype3.OBJECT_TYPE_NAME + '_' + ltrim(str(taskinst_log.INSTANCE_ID)) "STEP_ID",
	CASE WHEN task.IS_REUSABLE = 1 THEN 'com.informatica.powercenter.process.'+REPLACE(otype3.OBJECT_TYPE_NAME,' ','') ELSE
	'com.informatica.powercenter.process.' +REPLACE(otype3.OBJECT_TYPE_NAME,' ','')+'TaskInstance'  END "TASK_CLASS_ID",
	CASE WHEN task.IS_REUSABLE = 1 THEN 
	otype3.OBJECT_TYPE_NAME + '_' + ltrim(str(taskinst_log.TASK_ID)) ELSE
	'TASK_INSTANCE_' + otype3.OBJECT_TYPE_NAME + '_'+ ltrim(str(taskinst_log.INSTANCE_ID)) END "TASK_ID",
	'com.informatica.powercenter.map.'+REPLACE(otype4.OBJECT_TYPE_NAME,' ','') "TRANSFORM_CLASS_ID",
	otype4.OBJECT_TYPE_NAME + '_' + ltrim(str(sess.MAPPING_ID)) "TRANSFORM_ID",
       'com.informatica.powercenter.package.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','')  "FOLDER_CLASS_ID",
	otype.OBJECT_TYPE_NAME + '_' +  ltrim(str(taskinst_log.SUBJECT_ID))  "FOLDER_ID",
	'com.informatica.powercenter.operation.RunStatus'  "STATUS_CLASS_ID",
	ltrim(str(taskinst_log.RUN_STATUS_CODE)) + '~' + ltrim(str(taskinst_log.RUN_ERR_CODE))  "STATUS_ID",
	taskinst_log.WORKLET_RUN_ID   "STEP_RUN_NUMBER",
	sesstask_log.SRC_SUCCESS_ROWS  "INPUT_ROWS",
	sesstask_log.SRC_FAILED_ROWS  "REJECTED_ROWS",
	sesstask_log.TARG_FAILED_ROWS  "FAILED_ROWS",
	sesstask_log.TARG_SUCCESS_ROWS  "OUTPUT_ROWS",
	0  "LOG_BLOCK_READS",
	0  "PHY_BLOCK_READS",
	0  "LOG_BLOCK_WRITES",
	0  "PHY_BLOCK_WRITES",
	datediff(s,taskinst_log.START_TIME,taskinst_log.END_TIME)*1000  "EXECUTION_MSECS",
	0  "READ_MSECS",
	0  "WRITE_MSECS",
	0  "IDLE_WAIT_MSECS",
	0  "BUSY_WAIT_MSECS",
	0  "IDLE_WAIT_EVENTS",
	0  "BUSY_WAIT_EVENTS",       taskinst_log.RUN_ERR_MSG "MESSAGE",
task.SUBJECT_ID "SUBJECT_ID"
from OPB_OBJECT_TYPE otype, OPB_OBJECT_TYPE otype1, OPB_REPOSIT repo, 
           OPB_OBJECT_TYPE otype2, OPB_OBJECT_TYPE otype3, OPB_OBJECT_TYPE otype4, 
	   OPB_WORKFLOW workflow, OPB_SESSION sess, OPB_SESS_TASK_LOG sesstask_log,
           OPB_TASK_INST_RUN taskinst_log,OPB_WFLOW_RUN wflow_run,
           OPB_TASK task, OPB_TASK wkflow_task
	   where repo.RECID = 1 and
           otype.OBJECT_TYPE_ID = 29 and 
           taskinst_log.WORKFLOW_RUN_ID = wflow_run.WORKFLOW_RUN_ID and
           taskinst_log.WORKFLOW_ID = workflow.WORKFLOW_ID and workflow.WORKFLOW_ID = wkflow_task.TASK_ID
and workflow.VERSION_NUMBER = wkflow_task.VERSION_NUMBER
and wkflow_task.TASK_TYPE = 71
and wkflow_task.IS_VISIBLE = 1
and
           otype1.OBJECT_TYPE_ID = 41 and
           otype2.OBJECT_TYPE_ID = 71 and
           otype3.OBJECT_TYPE_ID = 68 and
           otype4.OBJECT_TYPE_ID = 21 and
           taskinst_log.TASK_TYPE = 68 and
           taskinst_log.TASK_ID = sess.SESSION_ID and taskinst_log.VERSION_NUMBER = sess.VERSION_NUMBER and
           taskinst_log.WORKFLOW_ID = sesstask_log.WORKFLOW_ID and
           taskinst_log.WORKFLOW_RUN_ID = sesstask_log.WORKFLOW_RUN_ID and
           taskinst_log.WORKLET_RUN_ID = sesstask_log.WORKLET_RUN_ID and
           taskinst_log.INSTANCE_ID = sesstask_log.INSTANCE_ID and           
           taskinst_log.TASK_ID = task.TASK_ID and taskinst_log.VERSION_NUMBER = task.VERSION_NUMBER
AND taskinst_log.FRAGMENT_ID IN (1,-1)
and task.IS_VISIBLE = 1
and task.TASK_TYPE = 68
GO
