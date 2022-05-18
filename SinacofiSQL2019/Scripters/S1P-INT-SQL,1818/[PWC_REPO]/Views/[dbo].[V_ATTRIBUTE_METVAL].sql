SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ATTRIBUTE_METVAL]') IS NULL EXEC('CREATE VIEW [dbo].[V_ATTRIBUTE_METVAL] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ATTRIBUTE_METVAL]
AS 
SELECT '' "REPOSITORY_ID",
   'com.informatica.powercenter.map.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','') "ELEMENT_CLASS_ID",
  otype.OBJECT_TYPE_NAME + '_' + ltrim(str(metaval.OBJECT_ID)) "ELEMENT_ID",
  'ELEMENT' "SCOPE_TYPE",
  metaval.METAEXT_NAME "ELMNT_ATTR_NAME",
  metaval.PM_VALUE  "ELMNT_ATTR_VALUE",
  metaval.METAEXT_DESC "ELMNT_ATTR_DESC",
  (CASE WHEN metaval.DATA_TYPE = 1 THEN 'Integer' ELSE
    (CASE WHEN metaval.DATA_TYPE = 2 THEN 'String' ELSE
	(CASE WHEN metaval.DATA_TYPE=3 THEN 'Boolean' ELSE 
        (CASE WHEN metaval.DATA_TYPE=4 THEN 'XML' ELSE '' END) END) END) END) "DATA_TYPE",
  ''   "SRC_CREATE_DT",
  '' "SRC_UPDATE_DT",
  ''   "EFF_FROM_DT",
  '' "EFF_TO_DT",
  widget.SUBJECT_ID "SUBJECT_ID"
FROM 
  OPB_METAEXT_VAL metaval,
  OPB_OBJECT_TYPE otype,
  OPB_WIDGET widget
WHERE 
  metaval.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  widget.WIDGET_TYPE NOT IN (1, 2) AND 
  metaval.LINE_NO = 1	AND    
  widget.IS_REUSABLE = 1 AND
  metaval.OBJECT_TYPE = widget.WIDGET_TYPE AND
  metaval.OBJECT_ID = widget.WIDGET_ID and metaval.VERSION_NUMBER = widget.VERSION_NUMBER
and widget.IS_VISIBLE = 1
  AND NOT EXISTS
    (SELECT NULL
	 FROM OPB_MMD_METAEXT metaext
	 WHERE metaext.VENDOR_ID = metaval.VENDOR_ID AND metaext.DOMAIN_ID = metaval.DOMAIN_ID AND
	   metaext.METAEXT_NAME = metaval.METAEXT_NAME)
UNION ALL
SELECT '' "REPOSITORY_ID",
   'com.informatica.powercenter.map.'+REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+'Instance' "ELEMENT_CLASS_ID",
  'WIDGET_INSTANCE_'+ otype.OBJECT_TYPE_NAME + '_' + ltrim(str(winst.MAPPING_ID)) + '_' + ltrim(str(winst.INSTANCE_ID)) "ELEMENT_ID",
  'ELEMENT' "SCOPE_TYPE",
  metaval.METAEXT_NAME "ELMNT_ATTR_NAME",
  metaval.PM_VALUE  "ELMNT_ATTR_VALUE",
  metaval.METAEXT_DESC "ELMNT_ATTR_DESC",
  (CASE WHEN metaval.DATA_TYPE = 1 THEN 'Integer' ELSE
    (CASE WHEN metaval.DATA_TYPE = 2 THEN 'String' ELSE
	(CASE WHEN metaval.DATA_TYPE=3 THEN 'Boolean' ELSE 
        (CASE WHEN metaval.DATA_TYPE=4 THEN 'XML' ELSE '' END) END) END) END) "DATA_TYPE",
  ''   "SRC_CREATE_DT",
  '' "SRC_UPDATE_DT",
  ''   "EFF_FROM_DT",
  '' "EFF_TO_DT",
  map.SUBJECT_ID "SUBJECT_ID"
FROM 
  OPB_METAEXT_VAL metaval,
  OPB_OBJECT_TYPE otype,
  OPB_WIDGET widget,
  OPB_WIDGET_INST winst,
  OPB_MAPPING map
WHERE 
  metaval.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  widget.WIDGET_TYPE NOT IN (1, 2) AND 
  metaval.LINE_NO = 1	AND    
  widget.IS_REUSABLE = 0 AND
  metaval.OBJECT_ID = widget.WIDGET_ID  AND
  widget.WIDGET_ID = winst.WIDGET_ID  and metaval.VERSION_NUMBER = widget.VERSION_NUMBER
and widget.IS_VISIBLE = 1
AND  metaval.OBJECT_TYPE = widget.WIDGET_TYPE AND
  widget.WIDGET_TYPE = winst.WIDGET_TYPE AND
  winst.MAPPING_ID = map.MAPPING_ID and winst.VERSION_NUMBER = map.VERSION_NUMBER
  and metaval.PM_VALUE not like '<?xml%' and metaval.METAEXT_NAME != 'ComponentConfiguration'
and map.IS_VISIBLE = 1
  AND NOT EXISTS
    (SELECT NULL
	 FROM OPB_MMD_METAEXT metaext
	 WHERE metaext.VENDOR_ID = metaval.VENDOR_ID AND metaext.DOMAIN_ID = metaval.DOMAIN_ID AND
	   metaext.METAEXT_NAME = metaval.METAEXT_NAME)
UNION ALL
SELECT '' "REPOSITORY_ID",
   'com.informatica.powercenter.process.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','') "ELEMENT_CLASS_ID",
  otype.OBJECT_TYPE_NAME + '_' + ltrim(str(tasks.TASK_ID)) "ELEMENT_ID",
  'ELEMENT' "SCOPE_TYPE",
  metaval.METAEXT_NAME "ELMNT_ATTR_NAME",
  metaval.PM_VALUE  "ELMNT_ATTR_VALUE",
  metaval.METAEXT_DESC "ELMNT_ATTR_DESC",
  (CASE WHEN metaval.DATA_TYPE = 1 THEN 'Integer' ELSE
    (CASE WHEN metaval.DATA_TYPE = 2 THEN 'String' ELSE
	(CASE WHEN metaval.DATA_TYPE=3 THEN 'Boolean' ELSE 
        (CASE WHEN metaval.DATA_TYPE=4 THEN 'XML' ELSE '' END) END) END) END) "DATA_TYPE",
  ''   "SRC_CREATE_DT",
  '' "SRC_UPDATE_DT",
  ''   "EFF_FROM_DT",
  '' "EFF_TO_DT",
  tasks.SUBJECT_ID "SUBJECT_ID"
FROM 
  OPB_METAEXT_VAL metaval,
  OPB_OBJECT_TYPE otype,
  OPB_TASK tasks 
WHERE 
  metaval.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  otype.OBJECT_TYPE_ID = tasks.TASK_TYPE AND
  tasks.TASK_TYPE IN (68, 70, 71) AND
  metaval.LINE_NO = 1 AND
  tasks.IS_REUSABLE = 1 AND
  metaval.OBJECT_ID = tasks.TASK_ID and metaval.VERSION_NUMBER = tasks.VERSION_NUMBER
and tasks.IS_VISIBLE = 1
AND   metaval.OBJECT_TYPE =  TASK_TYPE   AND NOT EXISTS
    (SELECT NULL
         FROM OPB_MMD_METAEXT metaext
	     WHERE metaext.VENDOR_ID = metaval.VENDOR_ID AND
         metaext.DOMAIN_ID = metaval.DOMAIN_ID AND
         metaext.METAEXT_NAME = metaval.METAEXT_NAME)
UNION ALL
SELECT '' "REPOSITORY_ID",
  'com.informatica.powercenter.process.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'TaskInstance' "ELEMENT_CLASS_ID",
  'TASK_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(tinst.INSTANCE_ID)) "ELEMENT_ID",
  'ELEMENT' "SCOPE_TYPE",
  metaval.METAEXT_NAME "ELMNT_ATTR_NAME",
  metaval.PM_VALUE  "ELMNT_ATTR_VALUE",
  metaval.METAEXT_DESC "ELMNT_ATTR_DESC",
  (CASE WHEN metaval.DATA_TYPE = 1 THEN 'Integer' ELSE
    (CASE WHEN metaval.DATA_TYPE = 2 THEN 'String' ELSE
	(CASE WHEN metaval.DATA_TYPE=3 THEN 'Boolean' ELSE 
        (CASE WHEN metaval.DATA_TYPE=4 THEN 'XML' ELSE '' END) END) END) END) "DATA_TYPE",
  ''   "SRC_CREATE_DT",
  '' "SRC_UPDATE_DT",
  ''   "EFF_FROM_DT",
  '' "EFF_TO_DT",
  tasks.SUBJECT_ID "SUBJECT_ID"
FROM 
  OPB_METAEXT_VAL metaval,
  OPB_OBJECT_TYPE otype,
  OPB_TASK_INST tinst ,
  OPB_TASK tasks, OPB_TASK wkflow_or_wklet
WHERE 
  metaval.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  otype.OBJECT_TYPE_ID = tinst.TASK_TYPE AND
  tasks.TASK_ID = tinst.TASK_ID AND
  tasks.IS_REUSABLE = 0 AND
  tinst.TASK_TYPE = 68 AND
  metaval.OBJECT_ID = tinst.TASK_ID and metaval.VERSION_NUMBER = tasks.VERSION_NUMBER
and tasks.TASK_TYPE = tinst.TASK_TYPE
and tasks.IS_VISIBLE = 1
and tinst.WORKFLOW_ID = wkflow_or_wklet.TASK_ID
and tinst.VERSION_NUMBER = wkflow_or_wklet.VERSION_NUMBER
and wkflow_or_wklet.TASK_TYPE in (70,71)
and wkflow_or_wklet.IS_VISIBLE = 1
AND  metaval.LINE_NO = 1		 AND
  metaval.OBJECT_TYPE =  tinst.TASK_TYPE   AND NOT EXISTS
    (SELECT NULL
         FROM OPB_MMD_METAEXT metaext
	     WHERE metaext.VENDOR_ID = metaval.VENDOR_ID AND
         metaext.DOMAIN_ID = metaval.DOMAIN_ID AND
         metaext.METAEXT_NAME = metaval.METAEXT_NAME)
UNION ALL
SELECT '' "REPOSITORY_ID",
  'com.informatica.powercenter.map.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','') "ELEMENT_CLASS_ID",
  otype.OBJECT_TYPE_NAME + '_' + ltrim(str(src.SRC_ID)) "ELEMENT_ID",
  'ELEMENT' "SCOPE_TYPE",
  metaval.METAEXT_NAME "ELMNT_ATTR_NAME",
  metaval.PM_VALUE  "ELMNT_ATTR_VALUE",
  metaval.METAEXT_DESC "ELMNT_ATTR_DESC",
  (CASE WHEN metaval.DATA_TYPE = 1 THEN 'Integer' ELSE
    (CASE WHEN metaval.DATA_TYPE = 2 THEN 'String' ELSE
	(CASE WHEN metaval.DATA_TYPE=3 THEN 'Boolean' ELSE 
        (CASE WHEN metaval.DATA_TYPE=4 THEN 'XML' ELSE '' END) END) END) END) "DATA_TYPE",
  ''   "SRC_CREATE_DT",
  '' "SRC_UPDATE_DT",
  ''   "EFF_FROM_DT",
  '' "EFF_TO_DT",
  src.SUBJ_ID "SUBJECT_ID"
FROM 
  OPB_METAEXT_VAL metaval,
  OPB_OBJECT_TYPE otype,
  OPB_SRC src
WHERE 
  metaval.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  metaval.OBJECT_TYPE = 1 AND 
  metaval.LINE_NO = 1	AND    
  metaval.OBJECT_ID = src.SRC_ID and metaval.VERSION_NUMBER = src.VERSION_NUMBER
and src.IS_VISIBLE = 1
AND NOT EXISTS
  (SELECT NULL
         FROM OPB_MMD_METAEXT metaext
	     WHERE metaext.VENDOR_ID = metaval.VENDOR_ID AND
         metaext.DOMAIN_ID = metaval.DOMAIN_ID AND
         metaext.METAEXT_NAME = metaval.METAEXT_NAME)
UNION ALL
SELECT '' "REPOSITORY_ID",
  'com.informatica.powercenter.map.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','') "ELEMENT_CLASS_ID",
  otype.OBJECT_TYPE_NAME + '_' + ltrim(str(targ.TARGET_ID)) "ELEMENT_ID",
  'ELEMENT' "SCOPE_TYPE",
  metaval.METAEXT_NAME "ELMNT_ATTR_NAME",
  metaval.PM_VALUE  "ELMNT_ATTR_VALUE",
  metaval.METAEXT_DESC "ELMNT_ATTR_DESC",
  (CASE WHEN metaval.DATA_TYPE = 1 THEN 'Integer' ELSE
    (CASE WHEN metaval.DATA_TYPE = 2 THEN 'String' ELSE
	(CASE WHEN metaval.DATA_TYPE=3 THEN 'Boolean' ELSE 
        (CASE WHEN metaval.DATA_TYPE=4 THEN 'XML' ELSE '' END) END) END) END) "DATA_TYPE",
  ''   "SRC_CREATE_DT",
  '' "SRC_UPDATE_DT",
  ''   "EFF_FROM_DT",
  '' "EFF_TO_DT",
  targ.SUBJ_ID "SUBJECT_ID"
FROM 
  OPB_METAEXT_VAL metaval,
  OPB_OBJECT_TYPE otype,
  OPB_TARG targ
WHERE 
  metaval.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  metaval.OBJECT_TYPE = 2 AND 
  metaval.LINE_NO = 1	AND    
  metaval.OBJECT_ID = targ.TARGET_ID and metaval.VERSION_NUMBER = targ.VERSION_NUMBER
and targ.IS_VISIBLE = 1
AND NOT EXISTS
  (SELECT NULL
         FROM OPB_MMD_METAEXT metaext
	     WHERE metaext.VENDOR_ID = metaval.VENDOR_ID AND
         metaext.DOMAIN_ID = metaval.DOMAIN_ID AND
         metaext.METAEXT_NAME = metaval.METAEXT_NAME)
GO
