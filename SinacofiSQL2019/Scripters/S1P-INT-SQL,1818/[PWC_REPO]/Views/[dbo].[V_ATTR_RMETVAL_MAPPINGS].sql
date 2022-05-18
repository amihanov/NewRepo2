﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ATTR_RMETVAL_MAPPINGS]') IS NULL EXEC('CREATE VIEW [dbo].[V_ATTR_RMETVAL_MAPPINGS] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ATTR_RMETVAL_MAPPINGS]
AS
SELECT 
  map.MAPPING_NAME,
  '' "REPOSITORY_ID",
  'com.informatica.powercenter.map.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','') "ELEMENT_CLASS_ID",
  otype.OBJECT_TYPE_NAME + '_' + ltrim(str(map.MAPPING_ID)) "ELEMENT_ID",
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
  OPB_MAPPING map
WHERE 
  metaext.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  otype.OBJECT_TYPE_ID = 21 AND
  metaext.VENDOR_ID = metaval.VENDOR_ID AND
  metaext.DOMAIN_ID = metaval.DOMAIN_ID AND
  metaext.METAEXT_NAME = metaval.METAEXT_NAME AND
  metaext.OBJECT_TYPE = metaval.OBJECT_TYPE AND
  metaval.OBJECT_ID = map.MAPPING_ID and metaval.VERSION_NUMBER = map.VERSION_NUMBER
and map.IS_VISIBLE = 1
AND  metaval.LINE_NO = 1 AND map.REF_WIDGET_ID=0
UNION ALL
SELECT 
  map.MAPPING_NAME,
  '' "REPOSITORY_ID",
  'com.informatica.powercenter.map.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','') "ELEMENT_CLASS_ID",
  otype.OBJECT_TYPE_NAME + '_' + ltrim(str(map.MAPPING_ID)) "ELEMENT_ID",
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
  OPB_MAPPING map
WHERE 
  metaext.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  otype.OBJECT_TYPE_ID = 21 AND
  metaext.LINE_NO = 1
 and map.IS_VISIBLE = 1 and map.REF_WIDGET_ID=0
and NOT EXISTS
(SELECT metaval.OBJECT_ID
FROM OPB_METAEXT_VAL metaval
WHERE metaval.OBJECT_ID = map.MAPPING_ID 
and metaval.OBJECT_TYPE = 21 and 
	metaext.METAEXT_NAME  = metaval.METAEXT_NAME)
GO
