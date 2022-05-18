SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ATTRIBUTE_TRGFLD]') IS NULL EXEC('CREATE VIEW [dbo].[V_ATTRIBUTE_TRGFLD] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ATTRIBUTE_TRGFLD]
AS
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.TargetDefinitionPort' "ELEMENT_CLASS_ID", 
       'Target Definition_' + 'Field_' + ltrim(str(targfld.TARGET_ID)) 
             + '_' + ltrim(str(targfld.FLDID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'dataType' "ELMNT_ATTR_NAME",
       (select MIN(dtype.DTYPE_NAME) from 
     REP_FLD_DATATYPE dtype where targfld.NDTYPE = dtype.DTYPE_NUM OR targfld.DTYPE = dtype.DTYPE_NUM) "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       targ.LAST_SAVED "SRC_UPDATE_DT",
       ''  "EFF_FROM_DT",
       '' "EFF_TO_DT",
       targ.SUBJ_ID "SUBJECT_ID"
FROM OPB_TARG targ,
     OPB_TARG_FLD targfld
WHERE 
      targ.TARGET_ID = targfld.TARGET_ID AND targ.VERSION_NUMBER = targfld.VERSION_NUMBER
AND targ.IS_VISIBLE = 1 
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.TargetDefinitionPort' "ELEMENT_CLASS_ID", 
       'Target Definition_' + 'Field_' + ltrim(str(targfld.TARGET_ID)) 
             + '_' + ltrim(str(targfld.FLDID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'GROUP_NAME' "ELMNT_ATTR_NAME",
       tgrp.ATTR_VALUE "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       targ.LAST_SAVED "SRC_UPDATE_DT",
       ''  "EFF_FROM_DT",
       '' "EFF_TO_DT",
       targ.SUBJ_ID "SUBJECT_ID"
FROM OPB_TARG targ,
     OPB_TARG_FLD targfld,
     OPB_TABLE_GROUP tgrp
WHERE 
      tgrp.ATTR_ID = 1 AND
      targ.TARGET_ID = targfld.TARGET_ID AND targ.VERSION_NUMBER = targfld.VERSION_NUMBER
AND targ.IS_VISIBLE = 1
AND      tgrp.OBJECT_ID = targfld.TARGET_ID AND
      tgrp.OBJECT_TYPE = 2 AND
      tgrp.GROUP_ID = targfld.GROUP_ID AND tgrp.VERSION_NUMBER = targfld.VERSION_NUMBER
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.TargetDefinitionPort' "ELEMENT_CLASS_ID", 
       'Target Definition_' + 'Field_' + ltrim(str(targfld.TARGET_ID)) 
             + '_' + ltrim(str(targfld.FLDID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'KEY_TYPE' "ELMNT_ATTR_NAME",
       ktype.KEYTYPE_NAME  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       targ.LAST_SAVED "SRC_UPDATE_DT",
       ''  "EFF_FROM_DT",
       '' "EFF_TO_DT",
       targ.SUBJ_ID "SUBJECT_ID"
FROM OPB_TARG targ,
     OPB_TARG_FLD targfld,
     REP_TARG_KEY_TYPES ktype
WHERE 
targ.TARGET_ID = targfld.TARGET_ID AND targ.VERSION_NUMBER = targfld.VERSION_NUMBER
AND targ.IS_VISIBLE = 1
AND   targfld.KEYTYPE = ktype.KEYTYPE_NUM
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.TargetDefinitionPort' "ELEMENT_CLASS_ID", 
       'Target Definition_' + 'Field_' + ltrim(str(targfld.TARGET_ID)) 
             + '_' + ltrim(str(targfld.FLDID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'isNullable' "ELMNT_ATTR_NAME",
       CASE WHEN targfld.NULLTYPE = 0 THEN 'Yes' ELSE 'No' END "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       targ.LAST_SAVED "SRC_UPDATE_DT",
	'' "EFF_FROM_DT",
       '' "EFF_TO_DT",
       targ.SUBJ_ID "SUBJECT_ID"
FROM OPB_TARG targ,
     OPB_TARG_FLD targfld
WHERE 
      targ.TARGET_ID = targfld.TARGET_ID AND targ.VERSION_NUMBER = targfld.VERSION_NUMBER
AND targ.IS_VISIBLE = 1
GO
