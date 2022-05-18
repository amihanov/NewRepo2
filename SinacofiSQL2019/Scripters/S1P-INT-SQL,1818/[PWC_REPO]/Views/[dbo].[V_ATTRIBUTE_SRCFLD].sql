SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ATTRIBUTE_SRCFLD]') IS NULL EXEC('CREATE VIEW [dbo].[V_ATTRIBUTE_SRCFLD] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ATTRIBUTE_SRCFLD]
AS
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.SourceDefinitionPort' "ELEMENT_CLASS_ID", 
       'Source Definition' + '_' + 'Field_' + ltrim(str(srcfld.SRC_ID)) 
             + '_' + ltrim(str(srcfld.FLDID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'dataType' "ELMNT_ATTR_NAME",
       CASE WHEN dtype1.DTYPE_NAME is not null THEN dtype1.DTYPE_NAME ELSE dtype2.DTYPE_NAME END "ELMNT_ATTR_VALUE",       
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       src.LAST_SAVED "SRC_UPDATE_DT",
       '' "EFF_FROM_DT",
       '' "EFF_TO_DT",
       src.SUBJ_ID "SUBJECT_ID"
FROM OPB_SRC src,
     OPB_SRC_FLD srcfld,
     OPB_PICDSC picdsc LEFT OUTER JOIN 
     REP_FLD_DATATYPE dtype1 ON dtype1.DTYPE_NUM = picdsc.SRC_NTYPE LEFT OUTER JOIN
     REP_FLD_DATATYPE dtype2 ON dtype2.DTYPE_NUM = picdsc.SRC_TYPE
WHERE 
      src.SRC_ID = srcfld.SRC_ID AND src.VERSION_NUMBER = srcfld.VERSION_NUMBER
AND src.IS_VISIBLE = 1
AND      srcfld.PICID = picdsc.PICID AND srcfld.VERSION_NUMBER = picdsc.VERSION_NUMBER 
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.SourceDefinitionPort' "ELEMENT_CLASS_ID", 
       'Source Definition' + '_' + 'Field_' + ltrim(str(srcfld.SRC_ID)) 
             + '_' + ltrim(str(srcfld.FLDID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'precision' "ELMNT_ATTR_NAME",
       ltrim(str(picdsc.SRC_PREC))  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       src.LAST_SAVED "SRC_UPDATE_DT",
       '' "EFF_FROM_DT",
       '' "EFF_TO_DT",
       src.SUBJ_ID "SUBJECT_ID"
FROM OPB_SRC src,
     OPB_SRC_FLD srcfld,
     OPB_PICDSC picdsc
WHERE 
      src.SRC_ID = srcfld.SRC_ID AND src.VERSION_NUMBER = srcfld.VERSION_NUMBER
AND src.IS_VISIBLE = 1
AND      srcfld.PICID = picdsc.PICID AND srcfld.VERSION_NUMBER = picdsc.VERSION_NUMBER
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.SourceDefinitionPort' "ELEMENT_CLASS_ID", 
       'Source Definition' + '_' + 'Field_' + ltrim(str(srcfld.SRC_ID)) 
             + '_' + ltrim(str(srcfld.FLDID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'scale' "ELMNT_ATTR_NAME",
       ltrim(str(picdsc.SRC_SCALE))  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       src.LAST_SAVED "SRC_UPDATE_DT",
       ''  "EFF_FROM_DT",
       '' "EFF_TO_DT",
       src.SUBJ_ID "SUBJECT_ID"
FROM OPB_SRC src,
     OPB_SRC_FLD srcfld,
     OPB_PICDSC picdsc
WHERE 
      src.SRC_ID = srcfld.SRC_ID AND  src.VERSION_NUMBER = srcfld.VERSION_NUMBER
AND src.IS_VISIBLE = 1
AND     srcfld.PICID = picdsc.PICID AND srcfld.VERSION_NUMBER = picdsc.VERSION_NUMBER
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.SourceDefinitionPort' "ELEMENT_CLASS_ID", 
       'Source Definition' + '_' + 'Field_' + ltrim(str(srcfld.SRC_ID)) 
             + '_' + ltrim(str(srcfld.FLDID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'GROUP_NAME' "ELMNT_ATTR_NAME",
       tgrp.ATTR_VALUE "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       src.LAST_SAVED "SRC_UPDATE_DT",
       ''  "EFF_FROM_DT",
       '' "EFF_TO_DT",
       src.SUBJ_ID "SUBJECT_ID"
FROM OPB_SRC src,
     OPB_SRC_FLD srcfld,
     OPB_TABLE_GROUP tgrp
WHERE 
      tgrp.ATTR_ID = 1 AND
      src.SRC_ID = srcfld.SRC_ID AND src.VERSION_NUMBER = srcfld.VERSION_NUMBER
AND src.IS_VISIBLE = 1
AND      tgrp.OBJECT_ID = srcfld.SRC_ID AND
      tgrp.OBJECT_TYPE = 1 AND
      tgrp.GROUP_ID = srcfld.GROUP_ID AND tgrp.VERSION_NUMBER = srcfld.VERSION_NUMBER
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.SourceDefinitionPort' "ELEMENT_CLASS_ID", 
       'Source Definition' + '_' + 'Field_' + ltrim(str(srcfld.SRC_ID)) 
             + '_' + ltrim(str(srcfld.FLDID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'KEY_TYPE' "ELMNT_ATTR_NAME",
       ktype.KEYTYPE_NAME  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       src.LAST_SAVED "SRC_UPDATE_DT",
       ''  "EFF_FROM_DT",
       '' "EFF_TO_DT",
       src.SUBJ_ID "SUBJECT_ID"
FROM OPB_SRC src,
     OPB_SRC_FLD srcfld,
     REP_SRC_KEY_TYPES ktype
WHERE 
      src.SRC_ID = srcfld.SRC_ID AND src.VERSION_NUMBER = srcfld.VERSION_NUMBER
AND src.IS_VISIBLE = 1
AND ktype.KEYTYPE_NUM = srcfld.KEYTYPE  
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.SourceDefinitionPort' "ELEMENT_CLASS_ID", 
       'Source Definition' + '_' + 'Field_' + ltrim(str(srcfld.SRC_ID)) 
             + '_' + ltrim(str(srcfld.FLDID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'isNullable' "ELMNT_ATTR_NAME",
       CASE WHEN srcfld.NULLTYPE = 0 THEN 'Yes' ELSE 'No' END "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       src.LAST_SAVED "SRC_UPDATE_DT",
       ''  "EFF_FROM_DT",
       '' "EFF_TO_DT",
       src.SUBJ_ID "SUBJECT_ID"
FROM OPB_SRC src,
     OPB_SRC_FLD srcfld
WHERE 
      src.SRC_ID = srcfld.SRC_ID AND src.VERSION_NUMBER = srcfld.VERSION_NUMBER
      AND src.IS_VISIBLE = 1
GO
