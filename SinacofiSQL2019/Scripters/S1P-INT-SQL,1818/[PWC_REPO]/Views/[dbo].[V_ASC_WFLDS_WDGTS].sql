SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_WFLDS_WDGTS]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_WFLDS_WDGTS] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_WFLDS_WDGTS]
AS 
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.powercenter.map.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','')   "FROM_CLASS_ID",
  otype.OBJECT_TYPE_NAME +'_'+ ltrim(str(widget.WIDGET_ID)) "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
'com.informatica.powercenter.map.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','') + 'Port' "TO_CLASS_ID",
  otype.OBJECT_TYPE_NAME + '_' + 'Field_' + ltrim(str(widget.WIDGET_ID)) + '_' + ltrim(str(fld.FIELD_ID)) "TO_ELEMENT_ID" ,
  ' ' "TO_REPO_ID",
  'org.omg.cwm.objectmodel.core.ClassifierFeature' "ASSOCIATION_ID",
  fld.FIELD_ORDER "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
widget.SUBJECT_ID "SRC_SUBJECT_ID",
widget.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
  OPB_WIDGET widget,
  OPB_WIDGET_FIELD fld,
  OPB_OBJECT_TYPE otype
WHERE 
  otype.OBJECT_TYPE_ID = widget.WIDGET_TYPE and
  fld.WIDGET_ID = widget.WIDGET_ID and fld.VERSION_NUMBER = widget.VERSION_NUMBER
and widget.IS_VISIBLE = 1
and
  widget.IS_REUSABLE = 1 AND
  NOT EXISTS   
  (SELECT NULL 
   FROM OPB_SHORTCUT scut
   WHERE 
   scut.SUBJECT_ID = widget.SUBJECT_ID AND
   scut.OBJECT_SUBTYPE = widget.WIDGET_TYPE AND
   scut.OBJECT_ID = widget.WIDGET_ID AND scut.IS_VISIBLE = 1)
UNION ALL
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+ 'Instance'    "FROM_CLASS_ID",
  'WIDGET_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(winst.MAPPING_ID)) + '_'+ ltrim(str(winst.INSTANCE_ID)) "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','') + 'Port' "TO_CLASS_ID",
  otype.OBJECT_TYPE_NAME + '_' + 'Field_' + ltrim(str(widget.WIDGET_ID)) + '_' + ltrim(str(fld.FIELD_ID)) "TO_ELEMENT_ID" ,
  ' ' "TO_REPO_ID",
  'org.omg.cwm.objectmodel.core.ClassifierFeature' "ASSOCIATION_ID",
  fld.FIELD_ORDER "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
widget.SUBJECT_ID "SRC_SUBJECT_ID",
widget.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
  OPB_WIDGET widget,
  OPB_WIDGET_FIELD fld,
  OPB_WIDGET_INST winst, OPB_MAPPING map,
  OPB_OBJECT_TYPE otype
WHERE 
  otype.OBJECT_TYPE_ID = widget.WIDGET_TYPE and
  fld.WIDGET_ID = widget.WIDGET_ID and fld.VERSION_NUMBER = widget.VERSION_NUMBER
and widget.IS_VISIBLE = 1
and
  winst.WIDGET_TYPE = widget.WIDGET_TYPE and  
  winst.WIDGET_ID = widget.WIDGET_ID and winst.MAPPING_ID = map.MAPPING_ID
and winst.VERSION_NUMBER = map.VERSION_NUMBER
and map.IS_VISIBLE = 1
and
  widget.IS_REUSABLE = 0
GO
