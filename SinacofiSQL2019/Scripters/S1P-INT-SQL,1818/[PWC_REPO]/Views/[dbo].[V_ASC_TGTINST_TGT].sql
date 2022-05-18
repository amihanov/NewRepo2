SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_TGTINST_TGT]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_TGTINST_TGT] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_TGTINST_TGT]
AS 
SELECT 
  ' ' "REPOSITORY_ID",
   'com.informatica.powercenter.map.TargetDefinition' "FROM_CLASS_ID",
  'Target Definition_' +ltrim(str(winst.WIDGET_ID)) "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
 'com.informatica.powercenter.map.TargetDefinitionInstance' "TO_CLASS_ID",
  'WIDGET_INSTANCE_Target Definition_' +   ltrim(str(winst.MAPPING_ID)) + '_' + ltrim(str(winst.INSTANCE_ID)) "TO_ELEMENT_ID",
  ' ' "TO_REPO_ID",
  'com.informatica.cwmx.reuse.ClassReuse' "ASSOCIATION_ID",
  1 "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
targ.SUBJ_ID "SRC_SUBJECT_ID",
targ.SUBJ_ID "TGT_SUBJECT_ID"
FROM 
  OPB_WIDGET_INST winst,
  OPB_MAPPING map,
  OPB_TARG targ
WHERE 
  winst.WIDGET_ID = targ.TARGET_ID and
  winst.MAPPING_ID = map.MAPPING_ID and winst.VERSION_NUMBER = map.VERSION_NUMBER
and targ.IS_VISIBLE = 1
and map.IS_VISIBLE = 1
AND  targ.SUBJ_ID = map.SUBJECT_ID AND
  winst.WIDGET_TYPE = 2 AND
   NOT EXISTS (SELECT NULL
             FROM
               OPB_SHORTCUT scut
             WHERE scut.SUBJECT_ID = targ.SUBJ_ID AND
                   scut.OBJECT_SUBTYPE = 2 AND
                   scut.OBJECT_ID = winst.WIDGET_ID AND scut.IS_VISIBLE = 1)
UNION ALL
SELECT 
  ' ' "REPOSITORY_ID",
   'com.informatica.powercenter.map.TargetDefinitionShortcut' "FROM_CLASS_ID",
  'SHORTCUT_TO_' + 'PC_'+ shcut.REPOSITORY_NAME +'_Target Definition_' + ltrim(str(shcut.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str(shcut.OBJECT_ID))  "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
   'com.informatica.powercenter.map.TargetDefinitionInstance' "TO_CLASS_ID",
  'WIDGET_INSTANCE_Target Definition_' +   ltrim(str(winst.MAPPING_ID)) + '_' + ltrim(str(winst.INSTANCE_ID)) "TO_ELEMENT_ID",
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
  OPB_TARG targ,
  OPB_SHORTCUT shcut,
  OPB_MAPPING map
WHERE 
  winst.WIDGET_ID = targ.TARGET_ID  AND
  winst.WIDGET_TYPE = 2 AND
  winst.MAPPING_ID = map.MAPPING_ID and winst.VERSION_NUMBER = map.VERSION_NUMBER
and targ.IS_VISIBLE = 1
and map.IS_VISIBLE = 1
AND
  shcut.OBJECT_SUBTYPE = 2 AND
  shcut.OBJECT_ID = winst.WIDGET_ID AND
  shcut.SUBJECT_ID = map.SUBJECT_ID AND shcut.IS_VISIBLE = 1 AND
  shcut.OBJECT_ID >= 0
UNION ALL
SELECT 
  ' ' "REPOSITORY_ID",
   'com.informatica.powercenter.map.TargetDefinitionShortcut' "FROM_CLASS_ID", 
  'SHORTCUT_TO_' + 'PC_'+ shcut.REPOSITORY_NAME +'_Target Definition_'+ ltrim(str(map.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str((winst.WIDGET_ID + 2147483649))) "FROM_ELEMENT_ID", 
  ' ' "FROM_REPO_ID",
   'com.informatica.powercenter.map.TargetDefinitionInstance' "TO_CLASS_ID",
  'WIDGET_INSTANCE_Target Definition_' +   ltrim(str(winst.MAPPING_ID)) + '_' + ltrim(str(winst.INSTANCE_ID)) "TO_ELEMENT_ID",
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
  winst.WIDGET_TYPE = 2 and
  winst.WIDGET_ID < 0 and
  map.MAPPING_ID = winst.MAPPING_ID and winst.VERSION_NUMBER = map.VERSION_NUMBER
and map.IS_VISIBLE = 1
and
  shcut.OBJECT_SUBTYPE = 2 AND
  shcut.OBJECT_ID = winst.WIDGET_ID AND shcut.IS_VISIBLE = 1 AND
  shcut.SUBJECT_ID = map.SUBJECT_ID
GO
