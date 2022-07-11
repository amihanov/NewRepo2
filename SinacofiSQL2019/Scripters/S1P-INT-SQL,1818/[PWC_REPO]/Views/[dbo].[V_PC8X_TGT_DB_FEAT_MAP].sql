SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_PC8X_TGT_DB_FEAT_MAP]') IS NULL EXEC('CREATE VIEW [dbo].[V_PC8X_TGT_DB_FEAT_MAP] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_PC8X_TGT_DB_FEAT_MAP]
AS 
SELECT 
  ' ' 	"REPOSITORY_ID",
  'TASK_INSTANCE_Session_'+LTRIM(STR(tinst.INSTANCE_ID)) "TASK_ID",
  'com.informatica.powercenter.process.SessionTaskInstance' "TASK_CLASS_ID",
  'Mapping_'+ LTRIM(STR(swinst.MAPPING_ID)) "TRANSFORM_ID",
  'com.informatica.powercenter.map.Mapping'   "TRANSFORM_CLASS_ID",
  'Default_Expression' "MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "MAP_CLASS_ID",
  'Default_FieldExpression' "FEATURE_MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "FEAT_MAP_CLASS_ID",
  'WIDGET_INSTANCE_Target Definition_'+  LTRIM(STR(tgtinst.MAPPING_ID)) + '_' +
  LTRIM(STR(tgtinst.INSTANCE_ID))  	"STRUCT_ID",
  'com.informatica.powercenter.map.TargetDefinitionInstance' "STRUCT_CLASS_ID",     
  'Target Definition_Field_' + LTRIM(STR(tgtfld.TARGET_ID)) + 
  		'_' + LTRIM(STR(tgtfld.FLDID)) "FEATURE_ID",     
  'com.informatica.powercenter.map.TargetDefinitionPort' "FEATURE_CLASS_ID",
  UPPER(SUBSTRING(ATTR_VALUE, 1, 255))  "REF_PACKAGE_NAME",
  UPPER(tgt.TARGET_NAME) "REF_STRUCT_NAME",
  UPPER(tgtfld.TARGET_NAME) "REF_FEATURE_NAME",
  1 "DIRECTION",
  0 "TYPE",
  otype.OBJECT_TYPE_NAME + '_' + LTRIM(STR(cnxref.REF_OBJECT_ID)) "CONNECTION_ID",
 'com.informatica.powercenter.deployment.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','') "CONNECTION_CLASS_ID",
 tsk.SUBJECT_ID "TASK_SUBJECT_ID",
 map.SUBJECT_ID "TRFN_SUBJECT_ID",
 tgt.SUBJ_ID "TGT_SUBJECT_ID"
FROM 
OPB_SWIDGET_INST swinst, 
OPB_WIDGET_INST tgtinst, 
OPB_TARG tgt, 
OPB_TARG_FLD tgtfld, 
OPB_SWIDGET_ATTR wattr,
OPB_SESS_CNX_REFS cnxref, 
OPB_OBJECT_TYPE otype,
OPB_TASK tsk,
OPB_TASK_INST tinst ,
OPB_MAPPING map,
OPB_TASK wflow
WHERE
swinst.WIDGET_TYPE =2 AND 
tinst.TASK_ID = tsk.TASK_ID AND
tinst.TASK_TYPE = 68 AND
tsk.IS_VISIBLE = 1 AND
tinst.TASK_ID = swinst.SESSION_ID AND
tinst.WORKFLOW_ID = wflow.TASK_ID AND
tinst.VERSION_NUMBER = wflow.VERSION_NUMBER AND
wflow.TASK_TYPE IN (70,71) AND
wflow.IS_VISIBLE = 1 AND
wattr.SESSION_ID = swinst.SESSION_ID AND
wattr.VERSION_NUMBER = swinst.VERSION_NUMBER AND
wattr.SESS_WIDG_INST_ID = swinst.SESS_WIDG_INST_ID AND
wattr.ATTR_ID = 3 AND wattr.ATTR_VALUE NOT LIKE('$%') AND
cnxref.REF_OBJECT_ID != 0 AND
cnxref.SESSION_ID =  swinst.SESSION_ID AND 
cnxref.SESSION_INST_ID = tinst.INSTANCE_ID AND 
cnxref.SESS_WIDG_INST_ID =  swinst.SESS_WIDG_INST_ID AND 
cnxref.VERSION_NUMBER = swinst.VERSION_NUMBER AND
cnxref.VERSION_NUMBER = tsk.VERSION_NUMBER AND
swinst.MAPPING_ID = tgtinst.MAPPING_ID AND 
swinst.INSTANCE_ID = tgtinst.INSTANCE_ID AND 
tgtinst.MAPPING_ID = map.MAPPING_ID AND
tgtinst.VERSION_NUMBER = map.VERSION_NUMBER AND
tgtinst.WIDGET_TYPE = 2 AND
map.IS_VISIBLE = 1 AND
swinst.MAPPING_ID = map.MAPPING_ID AND
tgtfld.TARGET_ID =  tgt.TARGET_ID AND
tgt.TARGET_ID =  tgtinst.WIDGET_ID AND
tgtfld.VERSION_NUMBER = tgt.VERSION_NUMBER AND
tgt.IS_VISIBLE = 1 AND 
cnxref.REF_OBJECT_TYPE = otype.OBJECT_TYPE_ID AND 
cnxref.REF_OBJECT_TYPE != 75 AND EXISTS 
( SELECT 'X' FROM OPB_WIDGET_DEP wtdep 
WHERE wtdep.MAPPING_ID = swinst.MAPPING_ID AND 
wtdep.TO_INSTANCE_ID = swinst.INSTANCE_ID AND 
wtdep.TO_FIELD_ID = tgtfld.FLDID AND
wtdep.VERSION_NUMBER = map.VERSION_NUMBER ) 
AND NOT EXISTS  
(SELECT 'X' FROM OPB_SWIDGET_ATTR sattr WHERE  
sattr.SESSION_ID=swinst.SESSION_ID AND sattr.SESS_WIDG_INST_ID =swinst.SESS_WIDG_INST_ID AND  
sattr.ATTR_ID=19 and tsk.VERSION_NUMBER = sattr.VERSION_NUMBER and sattr.ATTR_VALUE IS NOT NULL)  AND NOT EXISTS
(SELECT 'X' FROM OPB_WIDGET_ATTR wattr1 WHERE  
wattr1.MAPPING_ID=swinst.MAPPING_ID AND wattr1.INSTANCE_ID =swinst.INSTANCE_ID AND  
wattr1.ATTR_ID=19 and wattr1.VERSION_NUMBER = map.VERSION_NUMBER and wattr1.ATTR_VALUE IS NOT NULL)  
UNION ALL
SELECT 
  ' ' 	"REPOSITORY_ID",
  'TASK_INSTANCE_Session_'+LTRIM(STR(tinst.INSTANCE_ID)) "TASK_ID",
  'com.informatica.powercenter.process.SessionTaskInstance' "TASK_CLASS_ID",
  'Mapping_'+ LTRIM(STR(swinst.MAPPING_ID)) "TRANSFORM_ID",
  'com.informatica.powercenter.map.Mapping'   "TRANSFORM_CLASS_ID",
  'Default_Expression' "MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "MAP_CLASS_ID",
  'Default_FieldExpression' "FEATURE_MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "FEAT_MAP_CLASS_ID",
  'WIDGET_INSTANCE_Target Definition_'+  LTRIM(STR(tgtinst.MAPPING_ID)) + '_' +
  LTRIM(STR(tgtinst.INSTANCE_ID))  	"STRUCT_ID",
  'com.informatica.powercenter.map.TargetDefinitionInstance' "STRUCT_CLASS_ID",     
  'Target Definition_Field_' + LTRIM(STR(tgtfld.TARGET_ID)) + 
  		'_' + LTRIM(STR(tgtfld.FLDID)) "FEATURE_ID",     
  'com.informatica.powercenter.map.TargetDefinitionPort' "FEATURE_CLASS_ID",
    UPPER(SUBSTRING(ATTR_VALUE, 1, 255)) "REF_PACKAGE_NAME",
  UPPER(tgt.TARGET_NAME) "REF_STRUCT_NAME",
    UPPER(tgtfld.TARGET_NAME) "REF_FEATURE_NAME",
  1 "DIRECTION",
  0 "TYPE",
  otype.OBJECT_TYPE_NAME + '_' + LTRIM(STR(cnxref.REF_OBJECT_ID)) "CONNECTION_ID",
 'com.informatica.powercenter.deployment.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','') "CONNECTION_CLASS_ID",
 tsk.SUBJECT_ID "TASK_SUBJECT_ID",
 map.SUBJECT_ID "TRFN_SUBJECT_ID",
 tgt.SUBJ_ID "TGT_SUBJECT_ID"
FROM 
OPB_WIDGET_INST tgtinst, 
OPB_TARG tgt, 
OPB_TARG_FLD tgtfld, 
OPB_SESS_CNX_REFS cnxref, 
OPB_OBJECT_TYPE otype,
OPB_TASK tsk,
OPB_TASK_INST tinst ,
OPB_MAPPING map,
OPB_TASK wflow,
OPB_SWIDGET_INST swinst LEFT OUTER JOIN OPB_WIDGET_ATTR wattr ON
wattr.SESSION_TASK_ID = 0 AND
wattr.VERSION_NUMBER = swinst.VERSION_NUMBER AND
wattr.MAPPING_ID = swinst.MAPPING_ID AND
wattr.INSTANCE_ID = swinst.INSTANCE_ID AND
wattr.ATTR_ID = 3 AND wattr.ATTR_VALUE NOT LIKE('$%') AND
wattr.WIDGET_TYPE = 2
WHERE
swinst.WIDGET_TYPE =2 AND 
tinst.TASK_ID = tsk.TASK_ID AND
tinst.TASK_TYPE = 68 AND
tsk.IS_VISIBLE = 1 AND
tinst.TASK_ID = swinst.SESSION_ID AND
tinst.WORKFLOW_ID = wflow.TASK_ID AND
tinst.VERSION_NUMBER = wflow.VERSION_NUMBER AND
wflow.TASK_TYPE IN (70,71) AND
wflow.IS_VISIBLE = 1 AND
cnxref.REF_OBJECT_ID != 0 AND
cnxref.SESSION_ID =  swinst.SESSION_ID AND 
cnxref.SESSION_INST_ID = tinst.INSTANCE_ID AND 
cnxref.SESS_WIDG_INST_ID =  swinst.SESS_WIDG_INST_ID AND 
cnxref.VERSION_NUMBER = swinst.VERSION_NUMBER AND
cnxref.VERSION_NUMBER = tsk.VERSION_NUMBER AND
swinst.MAPPING_ID = tgtinst.MAPPING_ID AND 
swinst.INSTANCE_ID = tgtinst.INSTANCE_ID AND 
tgtinst.MAPPING_ID = map.MAPPING_ID AND
tgtinst.VERSION_NUMBER = map.VERSION_NUMBER AND
tgtinst.WIDGET_TYPE = 2 AND
map.IS_VISIBLE = 1 AND
swinst.MAPPING_ID = map.MAPPING_ID AND
tgtfld.TARGET_ID =  tgt.TARGET_ID AND
tgt.TARGET_ID =  tgtinst.WIDGET_ID AND
tgtfld.VERSION_NUMBER = tgt.VERSION_NUMBER AND
tgt.IS_VISIBLE = 1 AND 
cnxref.REF_OBJECT_TYPE = otype.OBJECT_TYPE_ID AND 
cnxref.REF_OBJECT_TYPE != 75 AND EXISTS 
( SELECT 'X' FROM OPB_WIDGET_DEP wtdep 
WHERE wtdep.MAPPING_ID = swinst.MAPPING_ID AND 
wtdep.TO_INSTANCE_ID = swinst.INSTANCE_ID AND 
wtdep.TO_FIELD_ID = tgtfld.FLDID AND
wtdep.VERSION_NUMBER = map.VERSION_NUMBER ) AND
NOT EXISTS ( SELECT 'X' FROM OPB_SWIDGET_ATTR wattr1 WHERE
wattr1.SESSION_ID = swinst.SESSION_ID AND
wattr1.VERSION_NUMBER = swinst.VERSION_NUMBER AND
wattr1.SESS_WIDG_INST_ID = swinst.SESS_WIDG_INST_ID AND
wattr1.ATTR_ID = 3 ) 
AND NOT EXISTS  
(SELECT 'X' FROM OPB_SWIDGET_ATTR sattr WHERE  
sattr.SESSION_ID=swinst.SESSION_ID AND sattr.SESS_WIDG_INST_ID =swinst.SESS_WIDG_INST_ID AND  
sattr.ATTR_ID=19 and tsk.VERSION_NUMBER = sattr.VERSION_NUMBER and sattr.ATTR_VALUE IS NOT NULL)  AND NOT EXISTS
(SELECT 'X' FROM OPB_WIDGET_ATTR wattr1 WHERE  
wattr1.MAPPING_ID=swinst.MAPPING_ID AND wattr1.INSTANCE_ID =swinst.INSTANCE_ID AND  
wattr1.ATTR_ID=19 and wattr1.VERSION_NUMBER = map.VERSION_NUMBER and wattr1.ATTR_VALUE IS NOT NULL)  
UNION ALL
SELECT 
  ' ' 	"REPOSITORY_ID",
  'TASK_INSTANCE_Session_'+LTRIM(STR(tinst.INSTANCE_ID)) "TASK_ID",
  'com.informatica.powercenter.process.SessionTaskInstance' "TASK_CLASS_ID",
  'Mapping_'+ LTRIM(STR(swinst.MAPPING_ID)) "TRANSFORM_ID",
  'com.informatica.powercenter.map.Mapping'   "TRANSFORM_CLASS_ID",
  'Default_Expression' "MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "MAP_CLASS_ID",
  'Default_FieldExpression' "FEATURE_MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "FEAT_MAP_CLASS_ID",
  'WIDGET_INSTANCE_Target Definition_'+  LTRIM(STR(tgtinst.MAPPING_ID)) + '_' +
  LTRIM(STR(tgtinst.INSTANCE_ID))  	"STRUCT_ID",
  'com.informatica.powercenter.map.TargetDefinitionInstance' "STRUCT_CLASS_ID",     
  'Target Definition_Field_' + LTRIM(STR(tgtfld.TARGET_ID)) + 
  		'_' + LTRIM(STR(tgtfld.FLDID)) "FEATURE_ID",     
  'com.informatica.powercenter.map.TargetDefinitionPort' "FEATURE_CLASS_ID",
    UPPER(SUBSTRING(ATTR_VALUE, 1, 255))  "REF_PACKAGE_NAME",
  UPPER(tgt.TARGET_NAME) "REF_STRUCT_NAME",
  UPPER(tgtfld.TARGET_NAME) "REF_FEATURE_NAME",
  1 "DIRECTION",
  0 "TYPE",
  otype.OBJECT_TYPE_NAME + '_' + LTRIM(STR(cnxref.REF_OBJECT_ID)) "CONNECTION_ID",
  'com.informatica.powercenter.deployment.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','') "CONNECTION_CLASS_ID",
 tsk.SUBJECT_ID "TASK_SUBJECT_ID",
 map.SUBJECT_ID "TRFN_SUBJECT_ID",
 tgt.SUBJ_ID "TGT_SUBJECT_ID"
FROM 
OPB_SWIDGET_INST swinst, 
OPB_WIDGET_INST tgtinst, 
OPB_TARG tgt, 
OPB_TARG_FLD tgtfld, 
OPB_SWIDGET_ATTR wattr,
OPB_OBJECT_TYPE otype,
OPB_SESS_CNX_REFS cnxref, 
OPB_TASK tsk,
OPB_TASK_INST tinst,
OPB_MAPPING map,
OPB_TASK wflow
WHERE
swinst.WIDGET_TYPE =2 AND 
tinst.TASK_ID = tsk.TASK_ID AND
tsk.IS_VISIBLE = 1 AND
tinst.TASK_TYPE = 68 AND
tinst.TASK_ID = swinst.SESSION_ID AND
tinst.VERSION_NUMBER = wflow.VERSION_NUMBER AND
tinst.WORKFLOW_ID = wflow.TASK_ID AND
wflow.TASK_TYPE IN (70,71) AND
wflow.IS_VISIBLE = 1 AND
wattr.SESSION_ID = swinst.SESSION_ID AND
wattr.VERSION_NUMBER = swinst.VERSION_NUMBER AND
wattr.SESS_WIDG_INST_ID = swinst.SESS_WIDG_INST_ID AND
wattr.ATTR_ID = 3 AND wattr.ATTR_VALUE NOT LIKE('$%') AND
cnxref.REF_OBJECT_ID != 0 AND
cnxref.SESSION_ID =  swinst.SESSION_ID AND 
cnxref.SESSION_INST_ID = 0 AND 
cnxref.SESS_WIDG_INST_ID =  swinst.SESS_WIDG_INST_ID AND 
cnxref.VERSION_NUMBER = swinst.VERSION_NUMBER AND
cnxref.VERSION_NUMBER = tsk.VERSION_NUMBER AND
swinst.MAPPING_ID = tgtinst.MAPPING_ID AND 
swinst.INSTANCE_ID = tgtinst.INSTANCE_ID AND 
tgtinst.MAPPING_ID = map.MAPPING_ID AND
tgtinst.VERSION_NUMBER = map.VERSION_NUMBER AND
map.IS_VISIBLE = 1 AND
tgtfld.TARGET_ID =  tgtinst.WIDGET_ID AND
tgtinst.WIDGET_TYPE = 2 AND 
tgt.TARGET_ID =  tgtinst.WIDGET_ID AND
tgtfld.VERSION_NUMBER = tgt.VERSION_NUMBER AND
tgt.IS_VISIBLE = 1 AND 
cnxref.REF_OBJECT_TYPE = otype.OBJECT_TYPE_ID AND 
cnxref.REF_OBJECT_TYPE != 75 AND EXISTS 
( SELECT 'X' FROM OPB_WIDGET_DEP wtdep 
WHERE wtdep.MAPPING_ID = swinst.MAPPING_ID AND 
wtdep.TO_INSTANCE_ID = swinst.INSTANCE_ID AND 
wtdep.TO_FIELD_ID = tgtfld.FLDID AND 
wtdep.VERSION_NUMBER = map.VERSION_NUMBER) AND
NOT EXISTS ( SELECT 'X' FROM OPB_SESS_CNX_REFS cnxref2 WHERE 
cnxref2.SESSION_ID  = tinst.TASK_ID AND 
cnxref2.SESSION_INST_ID  = tinst.INSTANCE_ID AND 
cnxref2.SESS_WIDG_INST_ID =  swinst.SESS_WIDG_INST_ID AND
cnxref2.VERSION_NUMBER = swinst.VERSION_NUMBER)
AND NOT EXISTS  
(SELECT 'X' FROM OPB_SWIDGET_ATTR sattr WHERE  
sattr.SESSION_ID=swinst.SESSION_ID AND sattr.SESS_WIDG_INST_ID =swinst.SESS_WIDG_INST_ID AND  
sattr.ATTR_ID=19 and tsk.VERSION_NUMBER = sattr.VERSION_NUMBER and sattr.ATTR_VALUE IS NOT NULL)  AND NOT EXISTS
(SELECT 'X' FROM OPB_WIDGET_ATTR wattr1 WHERE  
wattr1.MAPPING_ID=swinst.MAPPING_ID AND wattr1.INSTANCE_ID =swinst.INSTANCE_ID AND  
wattr1.ATTR_ID=19 and wattr1.VERSION_NUMBER = map.VERSION_NUMBER and wattr1.ATTR_VALUE IS NOT NULL) 
UNION ALL
SELECT 
  ' ' 	"REPOSITORY_ID",
  'TASK_INSTANCE_Session_'+LTRIM(STR(tinst.INSTANCE_ID)) "TASK_ID",
  'com.informatica.powercenter.process.SessionTaskInstance' "TASK_CLASS_ID",
  'Mapping_'+ LTRIM(STR(swinst.MAPPING_ID)) "TRANSFORM_ID",
  'com.informatica.powercenter.map.Mapping'   "TRANSFORM_CLASS_ID",
  'Default_Expression' "MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "MAP_CLASS_ID",
  'Default_FieldExpression' "FEATURE_MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "FEAT_MAP_CLASS_ID",
  'WIDGET_INSTANCE_Target Definition_'+  LTRIM(STR(tgtinst.MAPPING_ID)) + '_' +
  LTRIM(STR(tgtinst.INSTANCE_ID))  	"STRUCT_ID",
  'com.informatica.powercenter.map.TargetDefinitionInstance' "STRUCT_CLASS_ID",     
  'Target Definition_Field_' + LTRIM(STR(tgtfld.TARGET_ID)) + 
  		'_' + LTRIM(STR(tgtfld.FLDID)) "FEATURE_ID",     
  'com.informatica.powercenter.map.TargetDefinitionPort' "FEATURE_CLASS_ID",
  UPPER(SUBSTRING(ATTR_VALUE, 1, 255))  "REF_PACKAGE_NAME",
  UPPER(tgt.TARGET_NAME) "REF_STRUCT_NAME",
  UPPER(tgtfld.TARGET_NAME) "REF_FEATURE_NAME",
  1 "DIRECTION",
  0 "TYPE",
  otype.OBJECT_TYPE_NAME + '_' + LTRIM(STR(cnxref.REF_OBJECT_ID)) "CONNECTION_ID",
  'com.informatica.powercenter.deployment.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','') "CONNECTION_CLASS_ID",
  tsk.SUBJECT_ID "TASK_SUBJECT_ID",
  map.SUBJECT_ID "TRFN_SUBJECT_ID",
 tgt.SUBJ_ID "TGT_SUBJECT_ID"
FROM 
OPB_WIDGET_INST tgtinst, 
OPB_TARG tgt, 
OPB_TARG_FLD tgtfld, 
OPB_SESS_CNX_REFS cnxref, 
OPB_OBJECT_TYPE otype,
OPB_TASK tsk,
OPB_TASK_INST tinst,
OPB_MAPPING map,
OPB_TASK wflow,
OPB_SWIDGET_INST swinst LEFT OUTER JOIN OPB_WIDGET_ATTR wattr ON
wattr.SESSION_TASK_ID = 0 AND
wattr.VERSION_NUMBER = swinst.VERSION_NUMBER AND
wattr.MAPPING_ID = swinst.MAPPING_ID AND
wattr.INSTANCE_ID = swinst.INSTANCE_ID AND
wattr.ATTR_ID = 3 AND wattr.ATTR_VALUE NOT LIKE('$%') AND
wattr.WIDGET_TYPE = 2
WHERE
swinst.WIDGET_TYPE =2 AND 
tinst.TASK_ID = tsk.TASK_ID AND
tsk.IS_VISIBLE = 1 AND
tinst.TASK_TYPE = 68 AND
tinst.TASK_ID = swinst.SESSION_ID AND
tinst.VERSION_NUMBER = wflow.VERSION_NUMBER AND
tinst.WORKFLOW_ID = wflow.TASK_ID AND
wflow.TASK_TYPE IN (70,71) AND
wflow.IS_VISIBLE = 1 AND
cnxref.REF_OBJECT_ID != 0 AND
cnxref.SESSION_ID =  swinst.SESSION_ID AND 
cnxref.SESSION_INST_ID = 0 AND 
cnxref.SESS_WIDG_INST_ID =  swinst.SESS_WIDG_INST_ID AND 
cnxref.VERSION_NUMBER = swinst.VERSION_NUMBER AND
cnxref.VERSION_NUMBER = tsk.VERSION_NUMBER AND
swinst.MAPPING_ID = tgtinst.MAPPING_ID AND 
swinst.INSTANCE_ID = tgtinst.INSTANCE_ID AND 
tgtinst.MAPPING_ID = map.MAPPING_ID AND
tgtinst.VERSION_NUMBER = map.VERSION_NUMBER AND
map.IS_VISIBLE = 1 AND
tgtfld.TARGET_ID =  tgtinst.WIDGET_ID AND
tgtinst.WIDGET_TYPE = 2 AND 
tgt.TARGET_ID =  tgtinst.WIDGET_ID AND
tgtfld.VERSION_NUMBER = tgt.VERSION_NUMBER AND
tgt.IS_VISIBLE = 1 AND 
cnxref.REF_OBJECT_TYPE = otype.OBJECT_TYPE_ID AND 
cnxref.REF_OBJECT_TYPE != 75 AND EXISTS 
( SELECT 'X' FROM OPB_WIDGET_DEP wtdep 
WHERE wtdep.MAPPING_ID = swinst.MAPPING_ID AND 
wtdep.TO_INSTANCE_ID = swinst.INSTANCE_ID AND 
wtdep.TO_FIELD_ID = tgtfld.FLDID AND 
wtdep.VERSION_NUMBER = map.VERSION_NUMBER) AND
NOT EXISTS ( SELECT 'X' FROM OPB_SESS_CNX_REFS cnxref2 WHERE 
cnxref2.SESSION_ID  = tinst.TASK_ID AND 
cnxref2.SESSION_INST_ID  = tinst.INSTANCE_ID AND 
cnxref2.SESS_WIDG_INST_ID =  swinst.SESS_WIDG_INST_ID AND
cnxref2.VERSION_NUMBER = swinst.VERSION_NUMBER) AND
NOT EXISTS ( SELECT 'X' FROM OPB_SWIDGET_ATTR wattr1 WHERE
wattr1.SESSION_ID = swinst.SESSION_ID AND
wattr1.VERSION_NUMBER = swinst.VERSION_NUMBER AND
wattr1.SESS_WIDG_INST_ID = swinst.SESS_WIDG_INST_ID AND
wattr1.ATTR_ID = 3 ) 
AND NOT EXISTS  
(SELECT 'X' FROM OPB_SWIDGET_ATTR sattr WHERE  
sattr.SESSION_ID=swinst.SESSION_ID AND sattr.SESS_WIDG_INST_ID =swinst.SESS_WIDG_INST_ID AND  
sattr.ATTR_ID=19 and tsk.VERSION_NUMBER = sattr.VERSION_NUMBER and sattr.ATTR_VALUE IS NOT NULL)  AND NOT EXISTS
(SELECT 'X' FROM OPB_WIDGET_ATTR wattr1 WHERE  
wattr1.MAPPING_ID=swinst.MAPPING_ID AND wattr1.INSTANCE_ID =swinst.INSTANCE_ID AND  
wattr1.ATTR_ID=19 and wattr1.VERSION_NUMBER = map.VERSION_NUMBER and wattr1.ATTR_VALUE IS NOT NULL)
GO
