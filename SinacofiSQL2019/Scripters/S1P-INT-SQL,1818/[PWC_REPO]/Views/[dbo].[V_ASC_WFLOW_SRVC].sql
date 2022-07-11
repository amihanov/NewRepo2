SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_WFLOW_SRVC]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_WFLOW_SRVC] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_WFLOW_SRVC]
AS
select ' ' "REPOSITORY_ID",
'com.informatica.powercenter.deployment.IntegrationService' "FROM_CLASS_ID",
       'Integration Service_' + ltrim(str(workflow.SERVER_ID)) "FROM_ELEMENT_ID",
' ' "FROM_REPO_ID",
       'com.informatica.powercenter.process.Workflow' "TO_CLASS_ID",
       'Workflow_' + ltrim(str(workflow.WORKFLOW_ID)) "TO_ELEMENT_ID",
' ' "TO_REPO_ID",
	   'com.informatica.powercenter.operation.WorkflowRunsOnService' "ASSOCIATION_ID",
	    1 "ASSOCIATION_SEQ",
           'N' "HIDDEN_FLAG", 
	     '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	     task.SUBJECT_ID "SRC_SUBJECT_ID",
	task.SUBJECT_ID "TGT_SUBJECT_ID"
       from V_ELMNT_SERVICE server, OPB_WORKFLOW workflow, OPB_TASK task
	   where 
                 workflow.WORKFLOW_ID = task.TASK_ID and workflow.VERSION_NUMBER = task.VERSION_NUMBER
and task.IS_VISIBLE = 1
and
                 71 = task.TASK_TYPE 
AND workflow.SERVER_ID <> 0 AND
workflow.SERVER_ID =server.SERVER_ID
GO
