SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_WFLOW_T_INST]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_WFLOW_T_INST] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_WFLOW_T_INST]
AS 
select ' ' "REPOSITORY_ID",
	 'com.informatica.powercenter.process.Workflow' "FROM_CLASS_ID", 
       'Workflow_' + ltrim(str(workflow.WORKFLOW_ID)) "FROM_ELEMENT_ID",  
' ' "FROM_REPO_ID", 
'com.informatica.powercenter.process.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'TaskInstance' "TO_CLASS_ID", 
       'TASK_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(taskinstance.INSTANCE_ID)) "TO_ELEMENT_ID",
' ' "TO_REPO_ID",
	   'org.omg.cwm.objectmodel.core.ElementOwnership' "ASSOCIATION_ID",
	    1 "ASSOCIATION_SEQ", 
         'N' "HIDDEN_FLAG", 
	   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
task.SUBJECT_ID "SRC_SUBJECT_ID",
task.SUBJECT_ID "TGT_SUBJECT_ID"
       from OPB_TASK_INST taskinstance, OPB_OBJECT_TYPE otype, OPB_TASK task,
     	    OPB_WORKFLOW workflow
	   where otype.OBJECT_TYPE_ID = taskinstance.TASK_TYPE and 
                 workflow.WORKFLOW_ID = taskinstance.WORKFLOW_ID and 
workflow.VERSION_NUMBER = taskinstance.VERSION_NUMBER and                 task.TASK_ID = workflow.WORKFLOW_ID and
                 task.TASK_TYPE = 71 and task.IS_VISIBLE = 1 and task.VERSION_NUMBER = workflow.VERSION_NUMBER
GO
