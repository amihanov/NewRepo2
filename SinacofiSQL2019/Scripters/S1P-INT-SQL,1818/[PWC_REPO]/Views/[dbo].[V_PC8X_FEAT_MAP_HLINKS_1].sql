SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_PC8X_FEAT_MAP_HLINKS_1]') IS NULL EXEC('CREATE VIEW [dbo].[V_PC8X_FEAT_MAP_HLINKS_1] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_PC8X_FEAT_MAP_HLINKS_1]
AS
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
  src.SUBJECT_ID "SRC_SUBJECT_ID",
  tgt.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
  OPB_WIDGET_DEP widgdep,
  OPB_WIDGET src,
  OPB_WIDGET tgt,
  OPB_OBJECT_TYPE otype,
  OPB_WIDGET_INST tgt_winst,
  OPB_OBJECT_TYPE otype2,
  OPB_WIDGET_INST src_winst,
  OPB_MAPPING map
WHERE
 widgdep.FROM_INSTANCE_ID =  src_winst.INSTANCE_ID AND
 widgdep.MAPPING_ID = src_winst.MAPPING_ID AND
	widgdep.VERSION_NUMBER = src_winst.VERSION_NUMBER AND
 src_winst.WIDGET_ID =  src.WIDGET_ID AND
 src_winst.WIDGET_TYPE = src.WIDGET_TYPE AND 
 	src.IS_VISIBLE = 1 AND
  widgdep.TO_INSTANCE_ID =  tgt_winst.INSTANCE_ID AND
 widgdep.MAPPING_ID = tgt_winst.MAPPING_ID AND
	widgdep.VERSION_NUMBER = tgt_winst.VERSION_NUMBER AND
 tgt_winst.WIDGET_ID =  tgt.WIDGET_ID AND 
 tgt_winst.WIDGET_TYPE =  tgt.WIDGET_TYPE AND 
	tgt.IS_VISIBLE = 1 AND
 src_winst.WIDGET_TYPE = otype.OBJECT_TYPE_ID AND
 tgt_winst.WIDGET_TYPE = otype2.OBJECT_TYPE_ID AND
 widgdep.MAPPING_ID = map.MAPPING_ID AND
	widgdep.VERSION_NUMBER = map.VERSION_NUMBER AND
	map.IS_VISIBLE = 1 
UNION ALL
SELECT 
  ' ' 	"REPOSITORY_ID",
  CAST(NULL AS VARCHAR) "TASK_ID",
  CAST(NULL AS VARCHAR) "TASK_CLASS_ID",
  (CASE WHEN map.REF_WIDGET_ID = 0 THEN ('Mapping_'+ LTRIM(STR(widget_inst.MAPPING_ID))) 	
  ELSE ('Mapplet_'+ LTRIM(STR(map.REF_WIDGET_ID)))  END) "TRANSFORM_ID",
  (CASE WHEN map.REF_WIDGET_ID = 0 THEN 'com.informatica.powercenter.map.Mapping' 
  ELSE 'com.informatica.powercenter.map.Mapplet'   END) "TRANSFORM_CLASS_ID",   
  'Default_Expression' "MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "MAP_CLASS_ID",
  'Default_FieldExpression' "FEATURE_MAP_ID",
  'com.informatica.powercenter.map.MapExpression' "FEAT_MAP_CLASS_ID",  
  'WIDGET_INSTANCE_'+(select otype.OBJECT_TYPE_NAME from OPB_OBJECT_TYPE otype where otype.OBJECT_TYPE_ID=widget_inst.WIDGET_TYPE)+'_'+  LTRIM(STR(widget_inst.MAPPING_ID)) + '_' +
  LTRIM(STR(widget_inst.INSTANCE_ID))  	"SOURCE_ID",
  'com.informatica.powercenter.map.'+REPLACE(REPLACE((select otype.OBJECT_TYPE_NAME from OPB_OBJECT_TYPE otype where otype.OBJECT_TYPE_ID=widget_inst.WIDGET_TYPE),' ',''),'-','')+'Instance' "SOURCE_CLASS_ID",     
  ' ' 		"SOURCE_REPO_ID", 
  (select otype.OBJECT_TYPE_NAME from OPB_OBJECT_TYPE otype where otype.OBJECT_TYPE_ID=widget_inst.WIDGET_TYPE) + '_' + 'Field_' + LTRIM(STR(widget_inst.WIDGET_ID)) + 
  		'_' + LTRIM(STR(cust_portdep.IN_FIELD_ID)) "SRC_FEATURE_ID",     
  'com.informatica.powercenter.map.' + REPLACE(REPLACE((select otype.OBJECT_TYPE_NAME from OPB_OBJECT_TYPE otype where otype.OBJECT_TYPE_ID=widget_inst.WIDGET_TYPE),' ',''),'-','')+
  		'Port' "SRC_FEAT_CLASS_ID",
  CAST(NULL AS VARCHAR) "SRC_CONNECTION_ID",
  CAST(NULL AS VARCHAR) "SRC_CONN_CLASS_ID",
  CAST(NULL AS VARCHAR) "SOURCE_NAME",
  CAST(NULL AS VARCHAR) "SOURCE_SCHEMA_NAME",
  CAST(NULL AS VARCHAR) "SRC_FEATURE_NAME",  		
  'WIDGET_INSTANCE_'+(select otype.OBJECT_TYPE_NAME from OPB_OBJECT_TYPE otype where otype.OBJECT_TYPE_ID=widget_inst.WIDGET_TYPE)+'_'+  LTRIM(STR(widget_inst.MAPPING_ID)) + '_' +
  LTRIM(STR(widget_inst.INSTANCE_ID))  	"TARGET_ID",  		
    'com.informatica.powercenter.map.'+REPLACE(REPLACE((select otype.OBJECT_TYPE_NAME from OPB_OBJECT_TYPE otype where otype.OBJECT_TYPE_ID=widget_inst.WIDGET_TYPE),' ',''),'-','')+'Instance' "TARGET_CLASS_ID",     
  ' ' 		"TARGET_REPO_ID", 
  (select otype.OBJECT_TYPE_NAME from OPB_OBJECT_TYPE otype where otype.OBJECT_TYPE_ID=widget_inst.WIDGET_TYPE) + '_' + 'Field_' + LTRIM(STR(widget_inst.WIDGET_ID)) + 
  		'_' + LTRIM(STR(cust_portdep.OUT_FIELD_ID)) "TGT_FEATURE_ID",  		     
  'com.informatica.powercenter.map.' + REPLACE(REPLACE((select otype.OBJECT_TYPE_NAME from OPB_OBJECT_TYPE otype where otype.OBJECT_TYPE_ID=widget_inst.WIDGET_TYPE),' ',''),'-','')+
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
  widget.SUBJECT_ID "SRC_SUBJECT_ID",
  widget.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
  OPB_WIDGET widget,
  OPB_WIDGET_INST widget_inst,
  OPB_MAPPING map,    
  OPB_WFLD_INOUTDEP cust_portdep  
WHERE
widget.WIDGET_ID = widget_inst.WIDGET_ID AND
widget_inst.MAPPING_ID = map.MAPPING_ID AND
widget.IS_VISIBLE = 1 AND
widget.VERSION_NUMBER = map.VERSION_NUMBER AND 
widget_inst.WIDGET_ID = cust_portdep.WIDGET_ID AND
widget_inst.WIDGET_TYPE = cust_portdep.WIDGET_TYPE AND
widget_inst.VERSION_NUMBER = map.VERSION_NUMBER AND
widget.VERSION_NUMBER = cust_portdep.VERSION_NUMBER AND map.IS_VISIBLE=1
GO
