SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ATTRIBUTE_TASK]') IS NULL EXEC('CREATE VIEW [dbo].[V_ATTRIBUTE_TASK] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ATTRIBUTE_TASK]
AS 
select  '' "REPOSITORY_ID",	
'com.informatica.powercenter.process.'+ REPLACE(otype.OBJECT_TYPE_NAME,' ','') "ELEMENT_CLASS_ID", 
 otype.OBJECT_TYPE_NAME + '_' + ltrim(str(tasks.TASK_ID)) "ELEMENT_ID", 
'GLOBAL' "SCOPE_TYPE", 
		tattr.ATTR_NAME "ELMNT_ATTR_NAME", CASE WHEN (tattr.OBJECT_TYPE_ID=71 AND tattr.ATTR_ID IN(12,13,14,17,18)) OR (tattr.OBJECT_TYPE_ID=58 AND tattr.ATTR_ID=1) 
THEN 
  (CASE WHEN  convert(varchar(4000),tattrval.ATTR_VALUE) = 1 THEN 'Yes' ELSE 'No' END)
ELSE
CASE WHEN tattr.OBJECT_TYPE_ID=58 AND tattr.ATTR_ID=2 THEN  
  (CASE convert(varchar(4000),tattrval.ATTR_VALUE) WHEN 1 THEN 'Restart task' WHEN 0 THEN 'Fail task and continue workflow' END)  
ELSE
CASE WHEN tattr.OBJECT_TYPE_ID=68 THEN
(CASE WHEN tattr.ATTR_ID IN (17,109,110,111) THEN 
  (CASE convert(varchar(4000),tattrval.ATTR_VALUE) WHEN 1 THEN 'Yes' ELSE 'No' END)
ELSE CASE WHEN tattr.ATTR_ID=107 THEN
  (CASE convert(varchar(4000),tattrval.ATTR_VALUE) WHEN 9 THEN 'To Source with View' WHEN 11 THEN 'Full with View' WHEN 1 THEN 'To Source' WHEN 2 THEN 'To Target' WHEN
3 THEN 'Full' WHEN 4 THEN 'Configured at runtime' WHEN 0 THEN 'None' END)
ELSE CASE WHEN tattr.ATTR_ID=18 THEN 
 (CASE convert(varchar(4000),tattrval.ATTR_VALUE) WHEN 2 THEN 'Restart Task' WHEN 1 THEN 'Resume from last checkpoint' WHEN 0 THEN 'Fail task & continue workflow' END)
ELSE
  tattrval.ATTR_VALUE END END END)
ELSE tattrval.ATTR_VALUE END END END  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", tasks.LAST_SAVED "SRC_UPDATE_DT",
	 '' "EFF_FROM_DT",  '' "EFF_TO_DT",
     tasks.SUBJECT_ID "SUBJECT_ID"
   from OPB_TASK tasks, OPB_OBJECT_TYPE otype, OPB_MMD_TASK_ATTR tattr, OPB_TASK_ATTR tattrval
   where 
         tasks.TASK_TYPE = otype.OBJECT_TYPE_ID and
         tasks.IS_REUSABLE = 1 and
		 tattrval.TASK_ID = tasks.TASK_ID and tattrval.TASK_TYPE = tasks.TASK_TYPE and tattrval.VERSION_NUMBER = tasks.VERSION_NUMBER
and tasks.IS_VISIBLE = 1
and		 tattrval.WORKFLOW_ID = 0 and tattrval.INSTANCE_ID = 0 and  tattrval.REF_SESSION_ID = 0 and tattrval.GROUP_ID = 0 and 
		 tattrval.ATTR_ID = tattr.ATTR_ID and tattr.OBJECT_TYPE_ID = tasks.TASK_TYPE     
UNION ALL
select  '' "REPOSITORY_ID",	
'com.informatica.powercenter.process.'+ REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'TaskInstance' "ELEMENT_CLASS_ID", 
 'TASK_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(tinst.INSTANCE_ID)) "ELEMENT_ID", 
'GLOBAL' "SCOPE_TYPE", 
		tattr.ATTR_NAME "ELMNT_ATTR_NAME", CASE WHEN (tattr.OBJECT_TYPE_ID=71 AND tattr.ATTR_ID IN(12,13,14,17,18)) OR (tattr.OBJECT_TYPE_ID=58 AND tattr.ATTR_ID=1) 
THEN 
  (CASE WHEN  convert(varchar(4000),tattrval.ATTR_VALUE) = 1 THEN 'Yes' ELSE 'No' END)
ELSE
CASE WHEN tattr.OBJECT_TYPE_ID=58 AND tattr.ATTR_ID=2 THEN  
  (CASE convert(varchar(4000),tattrval.ATTR_VALUE) WHEN 1 THEN 'Restart task' WHEN 0 THEN 'Fail task and continue workflow' END)  
ELSE
CASE WHEN tattr.OBJECT_TYPE_ID=68 THEN
(CASE WHEN tattr.ATTR_ID IN (17,109,110,111) THEN 
  (CASE convert(varchar(4000),tattrval.ATTR_VALUE) WHEN 1 THEN 'Yes' ELSE 'No' END)
ELSE CASE WHEN tattr.ATTR_ID=107 THEN
  (CASE convert(varchar(4000),tattrval.ATTR_VALUE) WHEN 9 THEN 'To Source with View' WHEN 11 THEN 'Full with View' WHEN 1 THEN 'To Source' WHEN 2 THEN 'To Target' WHEN
3 THEN 'Full' WHEN 4 THEN 'Configured at runtime' WHEN 0 THEN 'None' END)
ELSE CASE WHEN tattr.ATTR_ID=18 THEN 
 (CASE convert(varchar(4000),tattrval.ATTR_VALUE) WHEN 2 THEN 'Restart Task' WHEN 1 THEN 'Resume from last checkpoint' WHEN 0 THEN 'Fail task & continue workflow' END)
ELSE
  tattrval.ATTR_VALUE END END END)
ELSE tattrval.ATTR_VALUE END END END  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", tasks.LAST_SAVED "SRC_UPDATE_DT",
	 '' "EFF_FROM_DT",  '' "EFF_TO_DT",
     tasks.SUBJECT_ID "SUBJECT_ID"
from 
   OPB_TASK tasks, 
   OPB_OBJECT_TYPE otype, 
   OPB_MMD_TASK_ATTR tattr, 
   OPB_TASK_ATTR tattrval,
   OPB_TASK_INST tinst,
   OPB_TASK wflow
   where 
         tinst.TASK_TYPE = otype.OBJECT_TYPE_ID and
         tattrval.TASK_ID = tinst.TASK_ID and
		 tinst.TASK_ID = tasks.TASK_ID AND
		 tinst.TASK_TYPE = tasks.TASK_TYPE AND
		 tasks.IS_VISIBLE = 1 AND
		 tinst.WORKFLOW_ID = wflow.TASK_ID AND (wflow.TASK_TYPE=71 OR wflow.TASK_TYPE=70) AND
		 tinst.VERSION_NUMBER = wflow.VERSION_NUMBER AND
		 wflow.IS_VISIBLE=1 AND
		 tattrval.TASK_TYPE = tinst.TASK_TYPE and 
		 ((tasks.IS_REUSABLE=1 AND tattrval.INSTANCE_ID=tinst.INSTANCE_ID AND tattrval.WORKFLOW_ID = tinst.WORKFLOW_ID AND tattrval.VERSION_NUMBER = tinst.VERSION_NUMBER) OR
		 (tasks.IS_REUSABLE=0 AND tattrval.INSTANCE_ID=0 AND tattrval.WORKFLOW_ID = 0 AND tattrval.VERSION_NUMBER = tasks.VERSION_NUMBER)) AND
		 tattrval.ATTR_ID = tattr.ATTR_ID and 
		 tattr.OBJECT_TYPE_ID = tasks.TASK_TYPE
GO
