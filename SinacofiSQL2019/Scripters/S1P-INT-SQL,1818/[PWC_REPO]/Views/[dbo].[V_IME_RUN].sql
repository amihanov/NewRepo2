SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_IME_RUN]') IS NULL EXEC('CREATE VIEW [dbo].[V_IME_RUN] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_IME_RUN]
AS 
select     
	' ' "REPOSITORY_ID",          
	'com.informatica.powercenter.operation.Run' "CLASS_ID",       
	'PC_RUN_' + ltrim(str(wflow_run.WORKFLOW_RUN_ID)) "RUN_ID",           
	'com.informatica.powercenter.deployment.IntegrationService' "SERVER_CLASS_ID",      
	'Integration Service_' + ltrim(str(wflow_run.SERVER_ID)) "SERVER_ID",    
	''  USER_ACCT_CLASS_ID, 	     ''  USER_ACCOUNT_ID, 	
	'com.informatica.powercenter.process.TriggerRunEvent'  EVENT_CLASS_ID, 
	'PC_DEFAULT_EVENT_OBJECT'  EVENT_ID,                    
	'com.informatica.powercenter.process.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','') "ACTIVITY_CLASS_ID",     
	otype.OBJECT_TYPE_NAME + '_' + ltrim(str(wflow_run.WORKFLOW_ID)) "ACTIVITY_ID",     
	'com.informatica.powercenter.package.Folder'  "FOLDER_CLASS_ID", 	
	otype2.OBJECT_TYPE_NAME + '_' + ltrim(str(subject.SUBJ_ID))  "FOLDER_ID",
	'com.informatica.powercenter.operation.RunStatus'  "STATUS_CLASS_ID",
	ltrim(str(wflow_run.RUN_STATUS_CODE)) + '~' + ltrim(str(wflow_run.RUN_ERR_CODE)) "STATUS_ID",   
	wflow_run.START_TIME "RUN_START_DT",       
	wflow_run.END_TIME "RUN_END_DT",       
	wflow_run.WORKFLOW_RUN_ID "RUN_NUMBER", 
	'' 	     "PARENT_RUN_NUMBER",      
	'Y' "NORMAL_RUN_FLAG",            
	wflow_run.RUN_ERR_MSG "MESSAGE",          
	wflow_run.LOG_FILE "ACTIVITY_RUN_TEXT1",        
	'' "ACTIVITY_RUN_TEXT2", 
	'' "ACTIVITY_RUN_TEXT3",         
	'' "SRC_CREATE_DT",  
	'' "SRC_UPDATE_DT",
	subject.SUBJ_ID "SUBJECT_ID"    
from 
	OPB_WFLOW_RUN wflow_run,
	OPB_OBJECT_TYPE otype,
	OPB_REPOSIT repo,
	OPB_OBJECT_TYPE otype1,
	OPB_OBJECT_TYPE otype2,
	OPB_WORKFLOW workflow,
	OPB_TASK tasks,
	OPB_SUBJECT subject      
where 
	otype.OBJECT_TYPE_ID  = 71 and         
	repo.RECID = 1 and         
	wflow_run.WORKFLOW_ID = workflow.WORKFLOW_ID and wflow_run.VERSION_NUMBER = workflow.VERSION_NUMBER and 
	otype1.OBJECT_TYPE_ID = 41 and         
	otype2.OBJECT_TYPE_ID = 29 and         
	tasks.TASK_ID = workflow.WORKFLOW_ID and tasks.VERSION_NUMBER = workflow.VERSION_NUMBER
and tasks.IS_VISIBLE = 1
and 
	tasks.TASK_TYPE = 71 and        
	tasks.SUBJECT_ID = subject.SUBJ_ID
GO
