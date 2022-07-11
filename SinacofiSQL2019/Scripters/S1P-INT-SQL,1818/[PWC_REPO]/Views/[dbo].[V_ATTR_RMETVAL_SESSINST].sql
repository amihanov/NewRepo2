SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ATTR_RMETVAL_SESSINST]') IS NULL EXEC('CREATE VIEW [dbo].[V_ATTR_RMETVAL_SESSINST] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ATTR_RMETVAL_SESSINST]
AS
SELECT 
  tinst.INSTANCE_NAME,
  '' "REPOSITORY_ID",
'com.informatica.powercenter.process.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'TaskInstance' "ELEMENT_CLASS_ID",
  'TASK_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(tinst.INSTANCE_ID)) "ELEMENT_ID",
  'REPOSITORY' "SCOPE_TYPE",
  metaext.METAEXT_NAME "ELMNT_ATTR_NAME",
  metaval.PM_VALUE  "ELMNT_ATTR_VALUE",
  metaext.METAEXT_DESC "ELMNT_ATTR_DESC",
  (CASE WHEN metaext.DATA_TYPE = 1 THEN 'Integer' ELSE
  (CASE WHEN metaext.DATA_TYPE = 2 THEN 'String' ELSE
  (CASE WHEN metaext.DATA_TYPE=3 THEN 'Boolean' ELSE 
  (CASE WHEN metaext.DATA_TYPE=4 THEN 'XML' ELSE '' END) END) END) END) "DATA_TYPE",
  '' "SRC_CREATE_DT",
  '' "SRC_UPDATE_DT",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
  task.SUBJECT_ID "SUBJECT_ID"
FROM 
  OPB_MMD_METAEXT metaext,
  OPB_METAEXT_VAL metaval,
  OPB_OBJECT_TYPE otype,
  OPB_TASK_INST tinst, OPB_TASK wkflow_or_wklet,
OPB_TASK task
WHERE 
  metaext.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  otype.OBJECT_TYPE_ID = tinst.TASK_TYPE AND
  tinst.TASK_TYPE = 68 AND
  metaext.VENDOR_ID = metaval.VENDOR_ID AND
  metaext.DOMAIN_ID = metaval.DOMAIN_ID AND
  metaext.METAEXT_NAME = metaval.METAEXT_NAME AND
  metaext.OBJECT_TYPE = metaval.OBJECT_TYPE AND
  metaval.OBJECT_ID = tinst.TASK_ID and metaval.VERSION_NUMBER = task.VERSION_NUMBER
and metaval.OBJECT_TYPE = task.TASK_TYPE
and tinst.TASK_ID = task.TASK_ID
and tinst.TASK_TYPE = task.TASK_TYPE
and task.IS_VISIBLE = 1
and tinst.WORKFLOW_ID = wkflow_or_wklet.TASK_ID
and tinst.VERSION_NUMBER = wkflow_or_wklet.VERSION_NUMBER
and wkflow_or_wklet.TASK_TYPE in (70,71)
and wkflow_or_wklet.IS_VISIBLE = 1
AND  metaval.LINE_NO = 1
UNION ALL  
SELECT 
  tinst.INSTANCE_NAME,
  '' "REPOSITORY_ID",
'com.informatica.powercenter.process.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'TaskInstance' "ELEMENT_CLASS_ID",
  'TASK_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(tinst.INSTANCE_ID)) "ELEMENT_ID",
  'REPOSITORY' "SCOPE_TYPE",
  metaext.METAEXT_NAME "ELMNT_ATTR_NAME",
  metaext.DEFAULT_VALUE  "ELMNT_ATTR_VALUE",
  metaext.METAEXT_DESC "ELMNT_ATTR_DESC",
  (CASE WHEN metaext.DATA_TYPE = 1 THEN 'Integer' ELSE
  (CASE WHEN metaext.DATA_TYPE = 2 THEN 'String' ELSE
  (CASE WHEN metaext.DATA_TYPE=3 THEN 'Boolean' ELSE 
  (CASE WHEN metaext.DATA_TYPE=4 THEN 'XML' ELSE '' END) END) END) END) "DATA_TYPE",
  '' "SRC_CREATE_DT",
  '' "SRC_UPDATE_DT",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
  task.SUBJECT_ID "SUBJECT_ID"
FROM 
  OPB_MMD_METAEXT metaext,
  OPB_OBJECT_TYPE otype,
  OPB_TASK_INST tinst, OPB_TASK wkflow_or_wklet,
OPB_TASK task
WHERE 
  metaext.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  otype.OBJECT_TYPE_ID = tinst.TASK_TYPE AND
  tinst.TASK_TYPE = 68 AND
  metaext.LINE_NO = 1
  and tinst.TASK_ID = task.TASK_ID
and tinst.TASK_TYPE = task.TASK_TYPE
and task.IS_VISIBLE = 1
and tinst.WORKFLOW_ID = wkflow_or_wklet.TASK_ID
and tinst.VERSION_NUMBER = wkflow_or_wklet.VERSION_NUMBER
and wkflow_or_wklet.TASK_TYPE in (70,71)
and wkflow_or_wklet.IS_VISIBLE = 1
and NOT EXISTS
(SELECT metaval.OBJECT_ID
FROM OPB_METAEXT_VAL metaval
WHERE metaval.OBJECT_ID = tinst.TASK_ID
and metaval.OBJECT_TYPE = tinst.TASK_TYPE and 
	metaext.METAEXT_NAME  = metaval.METAEXT_NAME)
GO
