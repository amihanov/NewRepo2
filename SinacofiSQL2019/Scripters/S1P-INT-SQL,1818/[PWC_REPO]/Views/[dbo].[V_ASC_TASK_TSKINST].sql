SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_TASK_TSKINST]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_TASK_TSKINST] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_TASK_TSKINST]
AS
select ' ' "REPOSITORY_ID",
'com.informatica.powercenter.process.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','') "FROM_CLASS_ID",
otype.OBJECT_TYPE_NAME + '_' + ltrim(str(taskinst.TASK_ID)) "FROM_ELEMENT_ID",
' ' "FROM_REPO_ID",
'com.informatica.powercenter.process.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'TaskInstance' "TO_CLASS_ID",
'TASK_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(taskinst.INSTANCE_ID)) "TO_ELEMENT_ID",
' ' "TO_REPO_ID",
'com.informatica.cwmx.reuse.TaskReuse' "ASSOCIATION_ID",
	    1 "ASSOCIATION_SEQ",
         'N' "HIDDEN_FLAG", 
	    '' "EFF_FROM_DT",  '' "EFF_TO_DT",
tasks.SUBJECT_ID "SRC_SUBJECT_ID",
tasks.SUBJECT_ID "TGT_SUBJECT_ID"
from OPB_TASK_INST taskinst, OPB_TASK tasks, OPB_OBJECT_TYPE otype, OPB_TASK wflow_or_wklet
where taskinst.TASK_TYPE = otype.OBJECT_TYPE_ID  and
      taskinst.TASK_TYPE = tasks.TASK_TYPE and
      taskinst.TASK_ID   = tasks.TASK_ID and taskinst.WORKFLOW_ID = wflow_or_wklet.TASK_ID
and taskinst.VERSION_NUMBER = wflow_or_wklet.VERSION_NUMBER
and wflow_or_wklet.IS_VISIBLE = 1
and wflow_or_wklet.TASK_TYPE IN (70,71)
and
      taskinst.TASK_TYPE = tasks.TASK_TYPE and
      tasks.IS_REUSABLE = 1 and tasks.IS_VISIBLE = 1
GO
