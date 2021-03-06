SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ATTR_RMETVAL_SRCS]') IS NULL EXEC('CREATE VIEW [dbo].[V_ATTR_RMETVAL_SRCS] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ATTR_RMETVAL_SRCS]
AS	  
SELECT 
  src.SOURCE_NAME,
  '' "REPOSITORY_ID",
  'com.informatica.powercenter.map.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','') "ELEMENT_CLASS_ID",
  otype.OBJECT_TYPE_NAME + '_' + ltrim(str(src.SRC_ID)) "ELEMENT_ID",
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
  src.SUBJ_ID "SUBJECT_ID"
FROM 
  OPB_MMD_METAEXT metaext,
  OPB_METAEXT_VAL metaval,
  OPB_OBJECT_TYPE otype,
  OPB_SRC src,
  OPB_MMD_DBTYPE mtype,
  OPB_DBD dbd
WHERE 
  metaext.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  otype.OBJECT_TYPE_ID = 1 AND
  metaext.VENDOR_ID = metaval.VENDOR_ID AND
  metaext.DOMAIN_ID = metaval.DOMAIN_ID AND
  metaext.METAEXT_NAME = metaval.METAEXT_NAME AND
  metaext.OBJECT_TYPE = metaval.OBJECT_TYPE AND
  metaext.DBTYPE = mtype.DBTYPE_ID AND
  metaval.OBJECT_ID = src.SRC_ID and metaval.VERSION_NUMBER = src.VERSION_NUMBER
and src.IS_VISIBLE = 1
AND  metaval.LINE_NO = 1 AND
  dbd.DBDID = src.DBDID and dbd.VERSION_NUMBER = src.VERSION_NUMBER AND
  mtype.DBTYPE_ID = dbd.DBTYPE
UNION ALL
SELECT 
  src.SOURCE_NAME,
  '' "REPOSITORY_ID",
  'com.informatica.powercenter.map.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','') "ELEMENT_CLASS_ID",
  otype.OBJECT_TYPE_NAME + '_' + ltrim(str(src.SRC_ID)) "ELEMENT_ID",
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
  src.SUBJ_ID "SUBJECT_ID"
FROM 
  OPB_MMD_METAEXT metaext,
  OPB_OBJECT_TYPE otype,
  OPB_SRC src,
  OPB_MMD_DBTYPE mtype,
  OPB_DBD dbd
WHERE 
  metaext.OBJECT_TYPE = otype.OBJECT_TYPE_ID AND
  otype.OBJECT_TYPE_ID = 1 AND
  metaext.DBTYPE = mtype.DBTYPE_ID AND
  metaext.LINE_NO = 1
  and NOT EXISTS
(SELECT metaval.OBJECT_ID
FROM OPB_METAEXT_VAL metaval
WHERE metaval.OBJECT_ID = src.SRC_ID
and metaval.OBJECT_TYPE = 1 and 
	metaext.METAEXT_NAME  = metaval.METAEXT_NAME) 
and dbd.DBDID = src.DBDID 
and dbd.VERSION_NUMBER = src.VERSION_NUMBER
and src.IS_VISIBLE = 1
and mtype.DBTYPE_ID = dbd.DBTYPE
GO
