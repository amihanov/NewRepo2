SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_WDGINST_WDG]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_WDGINST_WDG] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_WDGINST_WDG]
AS 
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.powercenter.map.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','') "FROM_CLASS_ID",
  otype.OBJECT_TYPE_NAME +'_' +ltrim(str(winst.WIDGET_ID)) "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
  'com.informatica.powercenter.map.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'Instance' "TO_CLASS_ID",
  'WIDGET_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(winst.MAPPING_ID)) + '_' + ltrim(str(winst.INSTANCE_ID)) "TO_ELEMENT_ID",
  ' ' "TO_REPO_ID",
  'com.informatica.cwmx.reuse.ClassReuse' "ASSOCIATION_ID",
  1 "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
widget.SUBJECT_ID "SRC_SUBJECT_ID",
widget.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
  OPB_WIDGET_INST winst,
  OPB_OBJECT_TYPE otype,
  OPB_WIDGET widget,
  OPB_MAPPING map
WHERE 
  winst.WIDGET_TYPE = otype.OBJECT_TYPE_ID and
  winst.WIDGET_ID = widget.WIDGET_ID and
  winst.WIDGET_TYPE = widget.WIDGET_TYPE and
  winst.MAPPING_ID = map.MAPPING_ID and winst.VERSION_NUMBER = map.VERSION_NUMBER
and widget.IS_VISIBLE = 1
and map.IS_VISIBLE = 1
AND
  widget.SUBJECT_ID = map. SUBJECT_ID and
  widget.IS_REUSABLE = 1 and
  NOT EXISTS 
  ( SELECT NULL
FROM 
  OPB_SHORTCUT scut
WHERE 
  scut.SUBJECT_ID = widget.SUBJECT_ID AND
  scut.OBJECT_SUBTYPE = otype.OBJECT_TYPE_ID AND
  scut.OBJECT_ID = winst.WIDGET_ID AND scut.IS_VISIBLE = 1)
UNION ALL
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.powercenter.map.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'Shortcut' "FROM_CLASS_ID",
  'SHORTCUT_TO_' + 'PC_' + + shcut.REPOSITORY_NAME +'_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(shcut.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str(shcut.OBJECT_ID))  "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
  'com.informatica.powercenter.map.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'Instance' "TO_CLASS_ID",
  'WIDGET_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(winst.MAPPING_ID)) + '_' + ltrim(str(winst.INSTANCE_ID)) "TO_ELEMENT_ID",
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
  OPB_OBJECT_TYPE otype,
  OPB_SHORTCUT shcut,
  OPB_MAPPING map,
  OPB_WIDGET widg
WHERE 
  winst.WIDGET_TYPE = otype.OBJECT_TYPE_ID and
  widg.WIDGET_ID = winst.WIDGET_ID AND
  widg.WIDGET_TYPE = winst.WIDGET_TYPE AND
  shcut.OBJECT_SUBTYPE = otype.OBJECT_TYPE_ID AND
  shcut.OBJECT_ID = winst.WIDGET_ID and
  winst.MAPPING_ID = map.MAPPING_ID and winst.VERSION_NUMBER = map.VERSION_NUMBER
and widg.IS_VISIBLE = 1
and map.IS_VISIBLE = 1
AND
  shcut.SUBJECT_ID = map. SUBJECT_ID and
  shcut.OBJECT_ID >= 0 and shcut.IS_VISIBLE = 1
UNION ALL
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.powercenter.map.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'Shortcut' "FROM_CLASS_ID",
  'SHORTCUT_TO_' + 'PC_' + shcut.REPOSITORY_NAME +'_' + otype.OBJECT_TYPE_NAME +'_'+ ltrim(str(map.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str((winst.WIDGET_ID + 2147483649))) "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
  'com.informatica.powercenter.map.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'Instance' "TO_CLASS_ID",
  'WIDGET_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(winst.MAPPING_ID)) + '_' + ltrim(str(winst.INSTANCE_ID)) "TO_ELEMENT_ID",
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
  OPB_OBJECT_TYPE otype,
  OPB_MAPPING map,
  OPB_SHORTCUT shcut
WHERE 
  winst.WIDGET_TYPE = otype.OBJECT_TYPE_ID and
  winst.WIDGET_TYPE NOT IN (1,2) and
  map.MAPPING_ID = winst.MAPPING_ID and winst.VERSION_NUMBER = map.VERSION_NUMBER
and map.IS_VISIBLE = 1
and
  winst.WIDGET_ID < 0   and
  shcut.OBJECT_SUBTYPE = otype.OBJECT_TYPE_ID AND
  shcut.OBJECT_ID = winst.WIDGET_ID and
  shcut.SUBJECT_ID = map. SUBJECT_ID and shcut.IS_VISIBLE = 1
GO
