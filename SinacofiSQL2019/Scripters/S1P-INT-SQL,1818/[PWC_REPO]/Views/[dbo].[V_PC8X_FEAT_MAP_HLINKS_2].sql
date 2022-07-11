SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_PC8X_FEAT_MAP_HLINKS_2]') IS NULL EXEC('CREATE VIEW [dbo].[V_PC8X_FEAT_MAP_HLINKS_2] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_PC8X_FEAT_MAP_HLINKS_2]
AS
SELECT 
  ' ' 	"REPOSITORY_ID",
  CAST(NULL AS VARCHAR) "TASK_ID",
  CAST(NULL AS VARCHAR) "TASK_CLASS_ID",
  'Mapping_'+ LTRIM(STR(widgdep.MAPPING_ID)) 	"TRANSFORM_ID",
  'com.informatica.powercenter.map.Mapping' 	"TRANSFORM_CLASS_ID",   
  'Default_Expression' "MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "MAP_CLASS_ID",
  'Default_FieldExpression' "FEATURE_MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "FEAT_MAP_CLASS_ID",  
  'WIDGET_INSTANCE_'+otype.OBJECT_TYPE_NAME+'_'+  LTRIM(STR(src_winst.MAPPING_ID)) + '_' +
  LTRIM(STR(src_winst.INSTANCE_ID))  	"SOURCE_ID",
  'com.informatica.powercenter.map.'+REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+'Instance' "SOURCE_CLASS_ID",     
  ' ' 		"SOURCE_REPO_ID", 
  otype.OBJECT_TYPE_NAME + '_' + 'Field_' + LTRIM(STR(src_winst.WIDGET_ID)) + 
  		'_' + LTRIM(STR(widgdep.FROM_FIELD_ID)) "SRC_FEATURE_ID",     
  'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+
  		'Port' "SRC_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "SRC_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "SRC_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "SOURCE_NAME",
  CAST(NULL AS VARCHAR) "SOURCE_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "SRC_FEATURE_NAME",  		
  'WIDGET_INSTANCE_Target Definition_'+  LTRIM(STR(tgt_winst.MAPPING_ID)) + '_' +
  LTRIM(STR(tgt_winst.INSTANCE_ID))  	"TARGET_ID",  		
    'com.informatica.powercenter.map.TargetDefinitionInstance' "TARGET_CLASS_ID",     
  ' ' 		"TARGET_REPO_ID", 
  'Target Definition_Field_' + LTRIM(STR(tgt_winst.WIDGET_ID)) + 
  		'_' + LTRIM(STR(widgdep.TO_FIELD_ID)) "TGT_FEATURE_ID",  		     
  'com.informatica.powercenter.map.TargetDefinitionPort' "TGT_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "TGT_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "TGT_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "TARGET_NAME",
  CAST(NULL AS VARCHAR) "TARGET_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "TGT_FEATURE_NAME", 
  CAST(NULL as datetime) "EFF_FROM_DT",
  CAST(NULL as datetime) "EFF_TO_DT",
  CAST(map.LAST_SAVED as datetime) MAP_UPDATE_DT,
  map.MAPPING_ID ,
    map.SUBJECT_ID "TRFN_SUBJECT_ID",
    src.SUBJECT_ID "SRC_SUBJECT_ID",
  tgt.SUBJ_ID "TGT_SUBJECT_ID"
FROM  
OPB_OBJECT_TYPE otype,
OPB_WIDGET src,  
OPB_WIDGET_INST src_winst,  
OPB_WIDGET_INST tgt_winst,  
OPB_WIDGET_DEP widgdep,  
OPB_MAPPING map,  
OPB_TARG tgt,
OPB_TARG_FLD tgt_fld
WHERE  
widgdep.FROM_INSTANCE_ID =  src_winst.INSTANCE_ID AND  
widgdep.MAPPING_ID = src_winst.MAPPING_ID AND  
widgdep.VERSION_NUMBER = src_winst.VERSION_NUMBER AND  
src_winst.WIDGET_ID =  src.WIDGET_ID AND  
src_winst.WIDGET_TYPE = src.WIDGET_TYPE AND  
src.IS_VISIBLE = 1 AND
tgt.TARGET_ID = tgt_fld.TARGET_ID AND 
tgt.VERSION_NUMBER = tgt_fld.VERSION_NUMBER AND 
widgdep.TO_FIELD_ID = tgt_fld.FLDID AND
widgdep.TO_INSTANCE_ID =  tgt_winst.INSTANCE_ID AND  
widgdep.MAPPING_ID = tgt_winst.MAPPING_ID AND  
widgdep.VERSION_NUMBER = tgt_winst.VERSION_NUMBER AND  
tgt_winst.WIDGET_ID =  tgt.TARGET_ID AND  
tgt.IS_VISIBLE = 1 AND  
tgt_winst.WIDGET_TYPE = 2  AND  
src_winst.WIDGET_TYPE = otype.OBJECT_TYPE_ID AND
widgdep.MAPPING_ID = map.MAPPING_ID AND  
widgdep.VERSION_NUMBER = map.VERSION_NUMBER AND  
map.IS_VISIBLE = 1
UNION ALL
SELECT 
  ' ' 	"REPOSITORY_ID",
  CAST(NULL AS VARCHAR) "TASK_ID",
  CAST(NULL AS VARCHAR) "TASK_CLASS_ID",
  (CASE WHEN map.REF_WIDGET_ID = 0 THEN ('Mapping_'+ LTRIM(STR(widgdep.MAPPING_ID))) 	
  ELSE ('Mapplet_'+ LTRIM(STR(map.REF_WIDGET_ID)))  END) "TRANSFORM_ID",
  (CASE WHEN map.REF_WIDGET_ID = 0 THEN 'com.informatica.powercenter.map.Mapping' 
  ELSE 'com.informatica.powercenter.map.Mapplet'   END) "TRANSFORM_CLASS_ID", 
  'Default_Expression' "MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "MAP_CLASS_ID",
  'Default_FieldExpression' "FEATURE_MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "FEAT_MAP_CLASS_ID",  
  'WIDGET_INSTANCE_Source Definition_'+  LTRIM(STR(src_winst.MAPPING_ID)) + '_' +
  LTRIM(STR(src_winst.INSTANCE_ID))  	"SOURCE_ID",
  'com.informatica.powercenter.map.SourceDefinitionInstance' "SOURCE_CLASS_ID",     
  ' ' 		"SOURCE_REPO_ID", 
  'Source Definition_Field_' + LTRIM(STR(src_winst.WIDGET_ID)) + 
  		'_' + LTRIM(STR(widgdep.FROM_FIELD_ID)) "SRC_FEATURE_ID",     
  'com.informatica.powercenter.map.SourceDefinitionPort' "SRC_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "SRC_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "SRC_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "SOURCE_NAME",
  CAST(NULL AS VARCHAR) "SOURCE_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "SRC_FEATURE_NAME",  		
  'WIDGET_INSTANCE_'+otype2.OBJECT_TYPE_NAME+'_'+  LTRIM(STR(tgt_winst.MAPPING_ID)) + '_' +
  LTRIM(STR(tgt_winst.INSTANCE_ID))  	"TARGET_ID",  		
    'com.informatica.powercenter.map.'+REPLACE(REPLACE(otype2.OBJECT_TYPE_NAME,' ',''),'-','')+'Instance' "TARGET_CLASS_ID",     
  ' ' 		"TARGET_REPO_ID", 
  otype2.OBJECT_TYPE_NAME + '_' + 'Field_' + LTRIM(STR(tgt_winst.WIDGET_ID)) + 
  		'_' + LTRIM(STR(widgdep.TO_FIELD_ID)) "TGT_FEATURE_ID",  		     
  'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype2.OBJECT_TYPE_NAME,' ',''),'-','')+
  		'Port' "TGT_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "TGT_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "TGT_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "TARGET_NAME",
  CAST(NULL AS VARCHAR) "TARGET_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "TGT_FEATURE_NAME", 
  CAST(NULL as datetime) "EFF_FROM_DT",
  CAST(NULL as datetime) "EFF_TO_DT",
  CAST(map.LAST_SAVED as datetime) MAP_UPDATE_DT,
  map.MAPPING_ID,
  map.SUBJECT_ID "TRFN_SUBJECT_ID",
  src.SUBJ_ID "SRC_SUBJECT_ID",
  tgt.SUBJECT_ID "TGT_SUBJECT_ID"
FROM  
OPB_OBJECT_TYPE otype2,  
OPB_WIDGET_INST src_winst,  
OPB_WIDGET tgt,  
OPB_WIDGET_INST tgt_winst,  
OPB_WIDGET_DEP widgdep,  
OPB_MAPPING map,  
OPB_SRC src,
OPB_SRC_FLD src_fld
WHERE  
widgdep.FROM_INSTANCE_ID =  src_winst.INSTANCE_ID AND  
widgdep.MAPPING_ID = src_winst.MAPPING_ID AND  
widgdep.VERSION_NUMBER = src_winst.VERSION_NUMBER AND  
src_winst.WIDGET_TYPE = 1 AND  
src_winst.WIDGET_ID =  src.SRC_ID AND  
src.IS_VISIBLE = 1 AND  
src.SRC_ID = src_fld.SRC_ID AND 
src.VERSION_NUMBER = src_fld.VERSION_NUMBER AND 
widgdep.FROM_FIELD_ID = src_fld.FLDID AND
widgdep.MAPPING_ID = tgt_winst.MAPPING_ID AND  
widgdep.TO_INSTANCE_ID =  tgt_winst.INSTANCE_ID AND  
widgdep.VERSION_NUMBER = tgt_winst.VERSION_NUMBER AND  
tgt_winst.WIDGET_TYPE = otype2.OBJECT_TYPE_ID AND  
tgt_winst.WIDGET_ID =  tgt.WIDGET_ID AND  
tgt.WIDGET_TYPE = tgt_winst.WIDGET_TYPE AND  
tgt.IS_VISIBLE = 1 AND  
widgdep.MAPPING_ID = map.MAPPING_ID AND  
widgdep.VERSION_NUMBER = map.VERSION_NUMBER AND  
map.IS_VISIBLE = 1
UNION ALL
SELECT 
  ' ' 	"REPOSITORY_ID",
  CAST(NULL AS VARCHAR) "TASK_ID",
  CAST(NULL AS VARCHAR) "TASK_CLASS_ID",
  'Mapping_'+ LTRIM(STR(winst.MAPPING_ID)) "TRANSFORM_ID",
  'com.informatica.powercenter.map.Mapping'   "TRANSFORM_CLASS_ID", 
  'Default_Expression' "MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "MAP_CLASS_ID",
  'Default_FieldExpression' "FEATURE_MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "FEAT_MAP_CLASS_ID",  
  'WIDGET_INSTANCE_Mapplet_'+  LTRIM(STR(winst.MAPPING_ID)) + '_' +
  LTRIM(STR(winst.INSTANCE_ID))  	"SOURCE_ID",
  'com.informatica.powercenter.map.MappletInstance' "SOURCE_CLASS_ID",     
  ' ' 		"SOURCE_REPO_ID", 
  'Mapplet_Field_' + LTRIM(STR(wfld.WIDGET_ID)) + 
  		'_' + LTRIM(STR(wfld.FIELD_ID)) "SRC_FEATURE_ID",     
  'com.informatica.powercenter.map.MappletPort' "SRC_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "SRC_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "SRC_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "SOURCE_NAME",
  CAST(NULL AS VARCHAR) "SOURCE_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "SRC_FEATURE_NAME",  		
  'WIDGET_INSTANCE_Input Transformation_'+  LTRIM(STR(mplt.MAPPING_ID)) + '_' +
  LTRIM(STR(wfld.GROUP_ID))  	"TARGET_ID",  		
  'com.informatica.powercenter.map.InputTransformationInstance' "TARGET_CLASS_ID",     
  ' ' 		"TARGET_REPO_ID", 
  'Input Transformation_' + 'Field_' + LTRIM(STR(mpltwinst.WIDGET_ID)) + 
  		'_' + LTRIM(STR(wfld.WIDGET_FLD_PROP)) "TGT_FEATURE_ID",  		     
  'com.informatica.powercenter.map.InputTransformationPort' "TGT_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "TGT_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "TGT_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "TARGET_NAME",
  CAST(NULL AS VARCHAR) "TARGET_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "TGT_FEATURE_NAME", 
  CAST(NULL as datetime) "EFF_FROM_DT",
  CAST(NULL as datetime) "EFF_TO_DT",
  CAST(map.LAST_SAVED as datetime) MAP_UPDATE_DT,
  map.MAPPING_ID,
  map.SUBJECT_ID "TRFN_SUBJECT_ID",
  map.SUBJECT_ID "SRC_SUBJECT_ID",
  widg.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
OPB_WIDGET_FIELD wfld,
OPB_MAPPING map,
OPB_WIDGET_INST winst,
OPB_WIDGET_INST mpltwinst,
OPB_MAPPING mplt,
	OPB_WIDGET widg
WHERE 
map.MAPPING_ID = winst.MAPPING_ID AND 
	map.VERSION_NUMBER = winst.VERSION_NUMBER AND
	map.IS_VISIBLE = 1 AND 
winst.WIDGET_ID = wfld.WIDGET_ID AND 
winst.WIDGET_TYPE = 44  AND
mplt.REF_WIDGET_ID = winst.WIDGET_ID AND
mplt.MAPPING_ID = mpltwinst.MAPPING_ID AND
	mplt.VERSION_NUMBER = mpltwinst.VERSION_NUMBER AND
	mplt.IS_VISIBLE = 1 AND 
wfld.GROUP_ID = mpltwinst.INSTANCE_ID AND
mpltwinst.WIDGET_TYPE = 46 AND
	wfld.WIDGET_ID = widg.WIDGET_ID AND
	wfld.VERSION_NUMBER = widg.VERSION_NUMBER AND
	widg.IS_VISIBLE = 1
UNION ALL
SELECT
  ' ' 	"REPOSITORY_ID",
  CAST(NULL AS VARCHAR) "TASK_ID",
  CAST(NULL AS VARCHAR) "TASK_CLASS_ID",
  'Mapping_'+ LTRIM(STR(winst.MAPPING_ID)) "TRANSFORM_ID",
  'com.informatica.powercenter.map.Mapping'   "TRANSFORM_CLASS_ID",
  'Default_Expression' "MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "MAP_CLASS_ID",
  'Default_FieldExpression' "FEATURE_MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "FEAT_MAP_CLASS_ID",
  'WIDGET_INSTANCE_Output Transformation_'+  LTRIM(STR(mplt.MAPPING_ID)) + '_' +
  LTRIM(STR(wfld.GROUP_ID))  	"SOURCE_ID",
  'com.informatica.powercenter.map.OutputTransformationInstance' "SOURCE_CLASS_ID",
  ' ' 		"SOURCE_REPO_ID", 
  'Output Transformation_' + 'Field_' + LTRIM(STR(mpltwinst.WIDGET_ID)) + 
  		'_' + LTRIM(STR(wfld.WIDGET_FLD_PROP)) "SRC_FEATURE_ID",  		     
  'com.informatica.powercenter.map.OutputTransformationPort' "SRC_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "SRC_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "SRC_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "SOURCE_NAME",
  CAST(NULL AS VARCHAR) "SOURCE_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "SRC_FEATURE_NAME",
  'WIDGET_INSTANCE_Mapplet_'+  LTRIM(STR(winst.MAPPING_ID)) + '_' +
  LTRIM(STR(winst.INSTANCE_ID))  	"TARGET_ID",
  'com.informatica.powercenter.map.MappletInstance' "TARGET_CLASS_ID",     
  ' ' 		"TARGET_REPO_ID", 
  'Mapplet_Field_' + LTRIM(STR(wfld.WIDGET_ID)) + 
  		'_' + LTRIM(STR(wfld.FIELD_ID)) "TGT_FEATURE_ID",     
  'com.informatica.powercenter.map.MappletPort' "TGT_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "TGT_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "TGT_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "TARGET_NAME",
  CAST(NULL AS VARCHAR) "TARGET_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "TGT_FEATURE_NAME" , 
  CAST(NULL as datetime) "EFF_FROM_DT",
  CAST(NULL as datetime) "EFF_TO_DT",
  CAST(map.LAST_SAVED as datetime) MAP_UPDATE_DT,
  map.MAPPING_ID,
      map.SUBJECT_ID "TRFN_SUBJECT_ID",
      widg.SUBJECT_ID "SRC_SUBJECT_ID",
  map.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
OPB_WIDGET_FIELD wfld,
OPB_MAPPING map,
OPB_WIDGET_INST winst,
OPB_WIDGET_INST mpltwinst,
OPB_MAPPING mplt,
	OPB_WIDGET widg
WHERE 
map.MAPPING_ID = winst.MAPPING_ID AND 
	map.VERSION_NUMBER = winst.VERSION_NUMBER AND
	map.IS_VISIBLE = 1 AND 
winst.WIDGET_ID = wfld.WIDGET_ID AND 
winst.WIDGET_TYPE = 44  AND
mplt.REF_WIDGET_ID = winst.WIDGET_ID AND
mplt.MAPPING_ID = mpltwinst.MAPPING_ID AND
	mplt.VERSION_NUMBER = mpltwinst.VERSION_NUMBER AND
	mplt.IS_VISIBLE = 1 AND 
wfld.GROUP_ID = mpltwinst.INSTANCE_ID AND
mpltwinst.WIDGET_TYPE = 47 AND
wfld.WIDGET_ID = widg.WIDGET_ID AND
wfld.VERSION_NUMBER = widg.VERSION_NUMBER AND
widg.IS_VISIBLE = 1
UNION ALL
SELECT 
  ' ' 	"REPOSITORY_ID",
  CAST(NULL AS VARCHAR) "TASK_ID",
  CAST(NULL AS VARCHAR) "TASK_CLASS_ID",
  (CASE WHEN map.REF_WIDGET_ID = 0 THEN ('Mapping_'+ LTRIM(STR(map.MAPPING_ID))) 	
  ELSE ('Mapplet_'+ LTRIM(STR(map.REF_WIDGET_ID)))  END) "TRANSFORM_ID",
  (CASE WHEN map.REF_WIDGET_ID = 0 THEN 'com.informatica.powercenter.map.Mapping' 
  ELSE 'com.informatica.powercenter.map.Mapplet'   END) "TRANSFORM_CLASS_ID",   
  'Default_Expression' "MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "MAP_CLASS_ID",
  'Default_FieldExpression' "FEATURE_MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "FEAT_MAP_CLASS_ID",  
  'WIDGET_INSTANCE_'+otype.OBJECT_TYPE_NAME+'_'+  LTRIM(STR(winst.MAPPING_ID)) + '_' +
  LTRIM(STR(winst.INSTANCE_ID))  	"SOURCE_ID",
  'com.informatica.powercenter.map.'+REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+'Instance' "SOURCE_CLASS_ID",     
  ' ' 		"SOURCE_REPO_ID", 
  otype.OBJECT_TYPE_NAME + '_' + 'Field_' + LTRIM(STR(winst.WIDGET_ID)) + 
  		'_' + LTRIM(STR(wgt_fld.WIDGET_FLD_PROP)) "SRC_FEATURE_ID",     
  'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+
  		'Port' "SRC_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "SRC_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "SRC_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "SOURCE_NAME",
  CAST(NULL AS VARCHAR) "SOURCE_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "SRC_FEATURE_NAME",  		
  'WIDGET_INSTANCE_'+otype.OBJECT_TYPE_NAME+'_'+  LTRIM(STR(winst.MAPPING_ID)) + '_' +
  LTRIM(STR(winst.INSTANCE_ID))  	"TARGET_ID",  		
    'com.informatica.powercenter.map.'+REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+'Instance' "TARGET_CLASS_ID",     
  ' ' 		"TARGET_REPO_ID", 
  otype.OBJECT_TYPE_NAME + '_' + 'Field_' + LTRIM(STR(winst.WIDGET_ID)) + 
  		'_' + LTRIM(STR(wgt_fld.FIELD_ID)) "TGT_FEATURE_ID",  		     
  'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+
  		'Port' "TGT_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "TGT_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "TGT_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "TARGET_NAME",
  CAST(NULL AS VARCHAR) "TARGET_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "TGT_FEATURE_NAME", 
  CAST(NULL as datetime) "EFF_FROM_DT",
  CAST(NULL as datetime) "EFF_TO_DT",
  CAST(map.LAST_SAVED as datetime) MAP_UPDATE_DT,
  map.MAPPING_ID,
    map.SUBJECT_ID "TRFN_SUBJECT_ID",
    wgt.SUBJECT_ID "SRC_SUBJECT_ID",
  wgt.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
  OPB_OBJECT_TYPE otype,
  OPB_WIDGET_INST winst,
  OPB_WIDGET wgt,
  OPB_WIDGET_FIELD wgt_fld,
  OPB_MAPPING map    
WHERE
 winst.WIDGET_ID = wgt.WIDGET_ID AND
 winst.WIDGET_TYPE = wgt.WIDGET_TYPE AND
 wgt.WIDGET_ID = wgt_fld.WIDGET_ID AND
 wgt.VERSION_NUMBER = wgt_fld.VERSION_NUMBER  AND
 wgt.IS_VISIBLE = 1 AND
 wgt.WIDGET_TYPE =15 AND
 wgt.WIDGET_TYPE = otype.OBJECT_TYPE_ID AND
 winst.MAPPING_ID = map.MAPPING_ID AND
 winst.VERSION_NUMBER = map.VERSION_NUMBER AND
 wgt_fld.PORTTYPE = 2 AND
 map.IS_VISIBLE = 1 AND wgt_fld.WIDGET_FLD_PROP!=0
 UNION ALL
  SELECT 
  ' ' 	"REPOSITORY_ID",
  CAST(NULL AS VARCHAR) "TASK_ID",
  CAST(NULL AS VARCHAR) "TASK_CLASS_ID",
  (CASE WHEN map.REF_WIDGET_ID = 0 THEN ('Mapping_'+ LTRIM(STR(map.MAPPING_ID))) 	
  ELSE ('Mapplet_'+ LTRIM(STR(map.REF_WIDGET_ID)))  END) "TRANSFORM_ID",
  (CASE WHEN map.REF_WIDGET_ID = 0 THEN 'com.informatica.powercenter.map.Mapping' 
  ELSE 'com.informatica.powercenter.map.Mapplet'   END) "TRANSFORM_CLASS_ID",   
  'Default_Expression' "MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "MAP_CLASS_ID",
  'Default_FieldExpression' "FEATURE_MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "FEAT_MAP_CLASS_ID",  
  'WIDGET_INSTANCE_'+otype.OBJECT_TYPE_NAME+'_'+  LTRIM(STR(winst.MAPPING_ID)) + '_' +
  LTRIM(STR(winst.INSTANCE_ID))  	"SOURCE_ID",
  'com.informatica.powercenter.map.'+REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+'Instance' "SOURCE_CLASS_ID",     
  ' ' 		"SOURCE_REPO_ID", 
  otype.OBJECT_TYPE_NAME + '_' + 'Field_' + LTRIM(STR(winst.WIDGET_ID)) + 
  		'_' + LTRIM(STR(wgt_fld.FIELD_ID)) "SRC_FEATURE_ID",     
  'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+
  		'Port' "SRC_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "SRC_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "SRC_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "SOURCE_NAME",
  CAST(NULL AS VARCHAR) "SOURCE_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "SRC_FEATURE_NAME",  		
  'WIDGET_INSTANCE_'+otype.OBJECT_TYPE_NAME+'_'+  LTRIM(STR(winst.MAPPING_ID)) + '_' +
  LTRIM(STR(winst.INSTANCE_ID))  	"TARGET_ID",  		
    'com.informatica.powercenter.map.'+REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+'Instance' "TARGET_CLASS_ID",     
  ' ' 		"TARGET_REPO_ID", 
  otype.OBJECT_TYPE_NAME + '_' + 'Field_' + LTRIM(STR(winst.WIDGET_ID)) + 
  		'_' + LTRIM(STR(tgt_fld.FIELD_ID)) "TGT_FEATURE_ID",  		     
  'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+
  		'Port' "TGT_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "TGT_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "TGT_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "TARGET_NAME",
  CAST(NULL AS VARCHAR) "TARGET_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "TGT_FEATURE_NAME", 
  CAST(NULL as datetime) "EFF_FROM_DT",
  CAST(NULL as datetime) "EFF_TO_DT",
  CAST(map.LAST_SAVED as datetime) MAP_UPDATE_DT,
  map.MAPPING_ID,
    map.SUBJECT_ID "TRFN_SUBJECT_ID",
    wgt.SUBJECT_ID "SRC_SUBJECT_ID",
  wgt.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
  OPB_OBJECT_TYPE otype,
  OPB_WIDGET_INST winst,
  OPB_WIDGET wgt,
  OPB_WIDGET_FIELD wgt_fld,
  OPB_MAPPING map,
  OPB_NORM_FLD norm_fld,
  OPB_WIDGET_FIELD tgt_fld    
WHERE
 winst.WIDGET_ID = wgt.WIDGET_ID AND
 winst.WIDGET_TYPE = wgt.WIDGET_TYPE AND
 wgt.WIDGET_ID = wgt_fld.WIDGET_ID AND
 wgt.VERSION_NUMBER = wgt_fld.VERSION_NUMBER  AND
 wgt.IS_VISIBLE = 1 AND
 winst.WIDGET_TYPE = 14 AND
 winst.WIDGET_TYPE = otype.OBJECT_TYPE_ID AND
 winst.MAPPING_ID = map.MAPPING_ID AND
 winst.VERSION_NUMBER = map.VERSION_NUMBER AND
 wgt_fld.PORTTYPE = 1 AND
 map.IS_VISIBLE = 1 AND
 norm_fld.WIDGET_ID = wgt.WIDGET_ID AND
 norm_fld.VERSION_NUMBER = wgt.VERSION_NUMBER AND
 wgt_fld.SRC_FIELD_ID = norm_fld.NORMAL_FLDID AND norm_fld.FLDTYPE=1 AND
 ltrim(rtrim(norm_fld.SRC_NAME)) = ltrim(rtrim(tgt_fld.FIELD_NAME)) AND 
 tgt_fld.WIDGET_ID = norm_fld.WIDGET_ID AND norm_fld.VERSION_NUMBER = tgt_fld.VERSION_NUMBER 
UNION ALL
SELECT 
  ' ' 	"REPOSITORY_ID",
  CAST(NULL AS VARCHAR) "TASK_ID",
  CAST(NULL AS VARCHAR) "TASK_CLASS_ID",
  (CASE WHEN map.REF_WIDGET_ID = 0 THEN ('Mapping_'+ LTRIM(STR(map.MAPPING_ID))) 	
  ELSE ('Mapplet_'+ LTRIM(STR(map.REF_WIDGET_ID)))  END) "TRANSFORM_ID",
  (CASE WHEN map.REF_WIDGET_ID = 0 THEN 'com.informatica.powercenter.map.Mapping' 
  ELSE 'com.informatica.powercenter.map.Mapplet'   END) "TRANSFORM_CLASS_ID",   
  'Default_Expression' "MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "MAP_CLASS_ID",
  'Default_FieldExpression' "FEATURE_MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "FEAT_MAP_CLASS_ID",  
  'WIDGET_INSTANCE_MQ Source Qualifier_'+  LTRIM(STR(winst.MAPPING_ID)) + '_' +
  LTRIM(STR(winst.INSTANCE_ID))  	"SOURCE_ID",
  'com.informatica.powercenter.map.MQSourceQualifierInstance' "SOURCE_CLASS_ID",     
  ' ' 		"SOURCE_REPO_ID", 
  'MQ Source Qualifier_' + 'Field_' + LTRIM(STR(winst.WIDGET_ID)) + 
  		'_' + LTRIM(STR(wgt_fld.WIDGET_FLD_PROP)) "SRC_FEATURE_ID",     
  'com.informatica.powercenter.map.MQSourceQualifierPort' "SRC_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "SRC_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "SRC_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "SOURCE_NAME",
  CAST(NULL AS VARCHAR) "SOURCE_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "SRC_FEATURE_NAME",  		
  'WIDGET_INSTANCE_'+otype.OBJECT_TYPE_NAME+'_'+  LTRIM(STR(winst1.MAPPING_ID)) + '_' +
  LTRIM(STR(winst1.INSTANCE_ID))  	"TARGET_ID",  		
    'com.informatica.powercenter.map.'+REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+'Instance' "TARGET_CLASS_ID",     
  ' ' 		"TARGET_REPO_ID", 
  otype.OBJECT_TYPE_NAME + '_' + 'Field_' + LTRIM(STR(winst1.WIDGET_ID)) + 
  		'_' + LTRIM(STR(wgt_fld1.FIELD_ID)) "TGT_FEATURE_ID",  		     
  'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+
  		'Port' "TGT_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "TGT_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "TGT_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "TARGET_NAME",
  CAST(NULL AS VARCHAR) "TARGET_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "TGT_FEATURE_NAME", 
  CAST(NULL as datetime) "EFF_FROM_DT",
  CAST(NULL as datetime) "EFF_TO_DT",
  CAST(map.LAST_SAVED as datetime) MAP_UPDATE_DT,
  map.MAPPING_ID,
    map.SUBJECT_ID "TRFN_SUBJECT_ID",
    wgt.SUBJECT_ID "SRC_SUBJECT_ID",
  wgt.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
  OPB_OBJECT_TYPE otype,
  OPB_WIDGET_INST winst,
  OPB_WIDGET_INST winst1,
  OPB_WIDGET wgt,
  OPB_WIDGET wgt1,
  OPB_WIDGET_FIELD wgt_fld,
  OPB_WIDGET_FIELD wgt_fld1,
  OPB_MAPPING map    
WHERE
 winst.WIDGET_ID = wgt.WIDGET_ID AND
 winst.WIDGET_TYPE = wgt.WIDGET_TYPE AND
 wgt.WIDGET_ID = wgt_fld.WIDGET_ID AND
 wgt.VERSION_NUMBER = wgt_fld.VERSION_NUMBER  AND
 wgt.IS_VISIBLE = 1 AND
 winst1.WIDGET_ID = wgt1.WIDGET_ID AND
 winst1.WIDGET_TYPE = wgt1.WIDGET_TYPE AND
 wgt1.WIDGET_ID = wgt_fld1.WIDGET_ID AND
 wgt1.VERSION_NUMBER = wgt_fld1.VERSION_NUMBER  AND
 wgt1.IS_VISIBLE = 1 AND
 winst.WIDGET_TYPE =56 AND
 winst.WIDGET_PROP =winst1.INSTANCE_ID AND 
 winst.MAPPING_ID =winst1.MAPPING_ID AND
 winst.VERSION_NUMBER =winst1.VERSION_NUMBER AND
 winst1.WIDGET_TYPE = otype.OBJECT_TYPE_ID AND
 winst.MAPPING_ID = map.MAPPING_ID AND
 winst.VERSION_NUMBER = map.VERSION_NUMBER AND
 wgt_fld.FIELD_NAME = 'MsgId' AND
 map.IS_VISIBLE = 1
GO
