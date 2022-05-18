SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_SRCINST_SRC]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_SRCINST_SRC] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_SRCINST_SRC]
AS 
SELECT 
  ' ' "REPOSITORY_ID",
    'com.informatica.powercenter.map.SourceDefinition' "FROM_CLASS_ID",
  'Source Definition_' +ltrim(str(winst.WIDGET_ID)) "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
  'com.informatica.powercenter.map.SourceDefinitionInstance' "TO_CLASS_ID",
  'WIDGET_INSTANCE_Source Definition_' +   ltrim(str(winst.MAPPING_ID)) + '_' + ltrim(str(winst.INSTANCE_ID)) "TO_ELEMENT_ID",
  ' ' "TO_REPO_ID",
  'com.informatica.cwmx.reuse.ClassReuse' "ASSOCIATION_ID",
  1 "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
src.SUBJ_ID "SRC_SUBJECT_ID",
src.SUBJ_ID "TGT_SUBJECT_ID"
FROM 
  OPB_WIDGET_INST winst,
  OPB_MAPPING map,
  OPB_SRC src
WHERE 
  winst.WIDGET_ID = src.SRC_ID and
  winst.MAPPING_ID = map.MAPPING_ID and winst.VERSION_NUMBER = map.VERSION_NUMBER
  and src.IS_VISIBLE = 1
  and map.IS_VISIBLE = 1
  AND  src.SUBJ_ID = map.SUBJECT_ID AND
  winst.WIDGET_TYPE = 1 and
  NOT EXISTS 
  (SELECT NULL FROM OPB_SHORTCUT scut
   WHERE 
   scut.SUBJECT_ID = src.SUBJ_ID AND
   scut.OBJECT_SUBTYPE = 1 AND
   scut.OBJECT_ID = winst.WIDGET_ID AND scut.IS_VISIBLE = 1
   AND scut.OBJECT_TYPE <> 22 )
UNION ALL
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.powercenter.map.SourceDefinitionShortcut' "FROM_CLASS_ID",
  'SHORTCUT_TO_' + 'PC_' + shcut.REPOSITORY_NAME +'_Source Definition_' + LTRIM(str(shcut.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + LTRIM(str(shcut.OBJECT_ID))  "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
  'com.informatica.powercenter.map.SourceDefinitionInstance' "TO_CLASS_ID",
  'WIDGET_INSTANCE_Source Definition_' +   LTRIM(str(winst.MAPPING_ID)) + '_' + LTRIM(str(winst.INSTANCE_ID)) "TO_ELEMENT_ID",
  ' ' "TO_REPO_ID",
  'com.informatica.cwmx.reuse.ClassReuse' "ASSOCIATION_ID",
  1 "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
shcut.SUBJECT_ID "SRC_SUBJECT_ID",
shcut.SUBJECT_ID "TGT_SUBJECT_ID"  
FROM 
  OPB_WIDGET_INST winst,
  OPB_SRC src,
  OPB_SHORTCUT shcut,
  OPB_MAPPING map
WHERE 
  winst.WIDGET_ID = src.SRC_ID  AND
  winst.WIDGET_TYPE = 1 AND
  winst.MAPPING_ID = map.MAPPING_ID and winst.VERSION_NUMBER = map.VERSION_NUMBER
and src.IS_VISIBLE = 1
and map.IS_VISIBLE = 1
AND  shcut.OBJECT_SUBTYPE = 1 AND
  shcut.OBJECT_ID = winst.WIDGET_ID AND shcut.IS_VISIBLE = 1 AND
  shcut.SUBJECT_ID = map.SUBJECT_ID AND
  shcut.OBJECT_ID >= 0 AND
  shcut.OBJECT_TYPE <> 22    
UNION ALL
SELECT 
  ' ' "REPOSITORY_ID",
    'com.informatica.powercenter.map.SourceDefinitionShortcut' "FROM_CLASS_ID",
  'SHORTCUT_TO_' + 'PC_' + shcut.REPOSITORY_NAME +'_Source Definition_'+ ltrim(str(map.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str((winst.WIDGET_ID + 2147483649))) "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
  'com.informatica.powercenter.map.SourceDefinitionInstance' "TO_CLASS_ID",
  'WIDGET_INSTANCE_Source Definition_' +   ltrim(str(winst.MAPPING_ID)) + '_' + ltrim(str(winst.INSTANCE_ID)) "TO_ELEMENT_ID",
  ' ' "TO_REPO_ID",
  'com.informatica.cwmx.reuse.ClassReuse' "ASSOCIATION_ID",
  1 "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
  shcut.SUBJECT_ID "SRC_SUBJECT_ID",
shcut.SUBJECT_ID "TGT_SUBJECT_ID"  
FROM 
  OPB_WIDGET_INST winst,
  OPB_MAPPING map,
  OPB_SHORTCUT shcut
WHERE 
  winst.WIDGET_TYPE = 1 and
  winst.WIDGET_ID < 0 and
  winst.MAPPING_ID = map.MAPPING_ID and winst.VERSION_NUMBER = map.VERSION_NUMBER
and map.IS_VISIBLE = 1
and   shcut.OBJECT_SUBTYPE = 1 AND
  shcut.OBJECT_ID = winst.WIDGET_ID and shcut.IS_VISIBLE = 1 AND
  shcut.SUBJECT_ID = map.SUBJECT_ID  AND
  shcut.OBJECT_TYPE <> 22
GO
