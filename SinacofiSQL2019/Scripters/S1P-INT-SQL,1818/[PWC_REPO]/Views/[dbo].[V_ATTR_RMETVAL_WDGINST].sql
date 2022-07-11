SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ATTR_RMETVAL_WDGINST]') IS NULL EXEC('CREATE VIEW [dbo].[V_ATTR_RMETVAL_WDGINST] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ATTR_RMETVAL_WDGINST]
AS
SELECT 
  winst.INSTANCE_NAME,
  '' "REPOSITORY_ID",
   'com.informatica.powercenter.map.'+REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+'Instance' "ELEMENT_CLASS_ID",
  'WIDGET_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(winst.MAPPING_ID)) + '_' + ltrim(str(winst.INSTANCE_ID)) "ELEMENT_ID",
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
  map.SUBJECT_ID "SUBJECT_ID"
FROM 
  OPB_MMD_METAEXT metaext,
  OPB_METAEXT_VAL metaval,
  OPB_OBJECT_TYPE otype,
  OPB_WIDGET_INST winst,OPB_MAPPING map,
	OPB_WIDGET widget
WHERE 
  metaext.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  otype.OBJECT_TYPE_ID = winst.WIDGET_TYPE AND
  winst.WIDGET_TYPE NOT IN (1, 2) AND
  metaext.VENDOR_ID = metaval.VENDOR_ID AND
  metaext.DOMAIN_ID = metaval.DOMAIN_ID AND
  metaext.METAEXT_NAME = metaval.METAEXT_NAME AND
  metaext.OBJECT_TYPE = metaval.OBJECT_TYPE AND
  metaval.OBJECT_ID = winst.WIDGET_ID and metaval.VERSION_NUMBER = widget.VERSION_NUMBER AND
  ((metaext.OBJECT_TYPE != 97 ) OR ( metaext.OBJECT_TYPE = 97 and widget.TEMPLATE_ID =metaext.SUBTYPE ))
and metaval.OBJECT_TYPE = widget.WIDGET_TYPE
and winst.WIDGET_ID = widget.WIDGET_ID
and winst.WIDGET_TYPE = widget.WIDGET_TYPE
and widget.IS_VISIBLE = 1
and winst.MAPPING_ID = map.MAPPING_ID
and winst.VERSION_NUMBER = map.VERSION_NUMBER
and metaval.PM_VALUE not like '<?xml%' and metaval.METAEXT_NAME != 'ComponentConfiguration'
and map.IS_VISIBLE = 1
AND  metaval.LINE_NO = 1
UNION ALL  
SELECT 
  winst.INSTANCE_NAME,
  '' "REPOSITORY_ID",
   'com.informatica.powercenter.map.'+REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+'Instance' "ELEMENT_CLASS_ID",
  'WIDGET_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(winst.MAPPING_ID)) + '_' + ltrim(str(winst.INSTANCE_ID)) "ELEMENT_ID",
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
  map.SUBJECT_ID "SUBJECT_ID"
FROM 
  OPB_MMD_METAEXT metaext,
  OPB_OBJECT_TYPE otype,
  OPB_WIDGET_INST winst,OPB_MAPPING map,
OPB_WIDGET widget
WHERE 
  metaext.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  ((metaext.OBJECT_TYPE != 97 ) OR ( metaext.OBJECT_TYPE = 97 and widget.TEMPLATE_ID =metaext.SUBTYPE )) AND
  otype.OBJECT_TYPE_ID = winst.WIDGET_TYPE AND
  winst.WIDGET_TYPE NOT IN (1, 2) AND
  metaext.LINE_NO = 1
  and winst.MAPPING_ID = map.MAPPING_ID
and winst.VERSION_NUMBER = map.VERSION_NUMBER
and map.IS_VISIBLE = 1
and winst.WIDGET_ID = widget.WIDGET_ID
and winst.WIDGET_TYPE = widget.WIDGET_TYPE
and widget.IS_VISIBLE = 1
and NOT EXISTS
(SELECT metaval.OBJECT_ID
  FROM OPB_METAEXT_VAL metaval
  WHERE metaval.OBJECT_ID = winst.WIDGET_ID
  and metaval.OBJECT_TYPE = winst.WIDGET_TYPE  and
  metaext.VENDOR_ID = metaval.VENDOR_ID AND
  metaext.DOMAIN_ID = metaval.DOMAIN_ID AND
  metaext.METAEXT_NAME  = metaval.METAEXT_NAME)
GO
