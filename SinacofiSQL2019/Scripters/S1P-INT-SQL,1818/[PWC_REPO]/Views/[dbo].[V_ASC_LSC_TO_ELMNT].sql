SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_LSC_TO_ELMNT]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_LSC_TO_ELMNT] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_LSC_TO_ELMNT]
AS 
select ' ' "REPOSITORY_ID",
       'com.informatica.powercenter.map.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','') "FROM_CLASS_ID", 
       otype.OBJECT_TYPE_NAME + '_' + ltrim(str(shcut.OBJECT_ID)) "FROM_ELEMENT_ID", 
       ' '    "FROM_REPO_ID", 
       'com.informatica.powercenter.map.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'Shortcut' "TO_CLASS_ID", 
       'SHORTCUT_TO_PC_' +  shcut.REPOSITORY_NAME+'_'+otype.OBJECT_TYPE_NAME +'_'+ ltrim(str(shcut.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str(shcut.OBJECT_ID)) "TO_ELEMENT_ID",
       ' ' "TO_REPO_ID", 
	   'com.informatica.cwmx.import.Aliases' "ASSOCIATION_ID",
	    1 "ASSOCIATION_SEQ", 
         'N' "HIDDEN_FLAG", 
	    '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	    widget.SUBJECT_ID "SRC_SUBJECT_ID",
shcut.SUBJECT_ID "TGT_SUBJECT_ID"
FROM  
OPB_SHORTCUT shcut,  
OPB_OBJECT_TYPE otype,  
OPB_WIDGET widget
WHERE  
shcut.OBJECT_TYPE NOT IN (22,21)  
AND shcut.OBJECT_SUBTYPE = otype.OBJECT_TYPE_ID  
AND shcut.OBJECT_ID >=0  
AND shcut.IS_VISIBLE = 1  
AND widget.IS_VISIBLE = 1  
AND shcut.OBJECT_ID = widget.WIDGET_ID 
AND shcut.OBJECT_SUBTYPE = widget.WIDGET_TYPE
UNION ALL
select ' ' "REPOSITORY_ID",
       'com.informatica.powercenter.map.SourceDefinition' "FROM_CLASS_ID", 
       'Source Definition_' + ltrim(str(shcut.OBJECT_ID)) "FROM_ELEMENT_ID", 
       ' '    "FROM_REPO_ID", 
       'com.informatica.powercenter.map.SourceDefinitionShortcut' "TO_CLASS_ID", 
       'SHORTCUT_TO_PC_' +  shcut.REPOSITORY_NAME+'_Source Definition_'+ ltrim(str(shcut.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str(shcut.OBJECT_ID)) "TO_ELEMENT_ID",
       ' ' "TO_REPO_ID", 
	   'com.informatica.cwmx.import.Aliases' "ASSOCIATION_ID",
	    1 "ASSOCIATION_SEQ", 
         'N' "HIDDEN_FLAG", 
	    '' "EFF_FROM_DT",  '' "EFF_TO_DT",
src.SUBJ_ID "SRC_SUBJECT_ID",
shcut.SUBJECT_ID "TGT_SUBJECT_ID"
FROM  
OPB_SHORTCUT shcut,  
OPB_SRC src
WHERE  
shcut.OBJECT_TYPE NOT IN (22,21)  
AND shcut.OBJECT_SUBTYPE = 1
AND shcut.OBJECT_ID >=0  
AND shcut.IS_VISIBLE = 1  
AND src.IS_VISIBLE = 1  
AND shcut.OBJECT_ID = src.SRC_ID
UNION ALL
select ' ' "REPOSITORY_ID",
       'com.informatica.powercenter.map.TargetDefinition' "FROM_CLASS_ID", 
       'Target Definition_' + ltrim(str(shcut.OBJECT_ID)) "FROM_ELEMENT_ID", 
       ' '    "FROM_REPO_ID", 
       'com.informatica.powercenter.map.TargetDefinitionShortcut' "TO_CLASS_ID", 
       'SHORTCUT_TO_PC_' +  shcut.REPOSITORY_NAME+'_Target Definition_'+ ltrim(str(shcut.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str(shcut.OBJECT_ID)) "TO_ELEMENT_ID",
       ' ' "TO_REPO_ID", 
	   'com.informatica.cwmx.import.Aliases' "ASSOCIATION_ID",
	    1 "ASSOCIATION_SEQ", 
         'N' "HIDDEN_FLAG", 
	    '' "EFF_FROM_DT",  '' "EFF_TO_DT",
targ.SUBJ_ID "SRC_SUBJECT_ID",
shcut.SUBJECT_ID "TGT_SUBJECT_ID"
FROM  
OPB_SHORTCUT shcut,  
OPB_TARG targ
WHERE  
shcut.OBJECT_TYPE NOT IN (22,21)  
AND shcut.OBJECT_SUBTYPE = 2
AND shcut.OBJECT_ID >=0  
AND shcut.IS_VISIBLE = 1  
AND targ.IS_VISIBLE = 1  
AND shcut.OBJECT_ID = targ.TARGET_ID
UNION ALL
select ' ' "REPOSITORY_ID",
       'com.informatica.powercenter.map.Mapping'   "FROM_CLASS_ID", 
        'Mapping_' + ltrim(str(shcut.OBJECT_ID))   "FROM_ELEMENT_ID", 
       ' ' "FROM_REPO_ID", 
       'com.informatica.powercenter.map.MappingShortcut' "TO_CLASS_ID", 
       'SHORTCUT_TO_PC_' +  shcut.REPOSITORY_NAME+'_Mapping_'+ ltrim(str(shcut.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str(shcut.OBJECT_ID)) "TO_ELEMENT_ID",
       ' ' "TO_REPO_ID", 
       'com.informatica.cwmx.import.Aliases' "ASSOCIATION_ID",
       1 "ASSOCIATION_SEQ", 
       'N' "HIDDEN_FLAG", 
       '' "EFF_FROM_DT",  
       '' "EFF_TO_DT",
       map.SUBJECT_ID "SRC_SUBJECT_ID",
       shcut.SUBJECT_ID "TGT_SUBJECT_ID"
FROM  
 OPB_SHORTCUT shcut,  
 OPB_MAPPING map
WHERE  
 shcut.OBJECT_TYPE = 21  
 AND shcut.OBJECT_ID >=0  
 AND shcut.IS_VISIBLE = 1
 AND map.MAPPING_ID = shcut.OBJECT_ID 
 AND map.IS_VISIBLE = 1
GO
