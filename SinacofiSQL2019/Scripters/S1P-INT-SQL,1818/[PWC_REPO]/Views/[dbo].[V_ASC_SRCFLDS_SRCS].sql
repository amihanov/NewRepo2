SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_SRCFLDS_SRCS]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_SRCFLDS_SRCS] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_SRCFLDS_SRCS]
AS
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.powercenter.map.SourceDefinition'  "FROM_CLASS_ID",
  'Source Definition_'+ ltrim(str(src.SRC_ID)) "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
  'com.informatica.powercenter.map.SourceDefinitionPort' "TO_CLASS_ID",
  'Source Definition_' + 'Field_' + ltrim(str(src.SRC_ID)) + '_' + ltrim(str(fld.FLDID)) "TO_ELEMENT_ID" ,
  ' ' "TO_REPO_ID",
  'org.omg.cwm.objectmodel.core.ClassifierFeature' "ASSOCIATION_ID",
  fld.FLDNO "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
  src.SUBJ_ID "SRC_SUBJECT_ID",
src.SUBJ_ID "TGT_SUBJECT_ID"
FROM 
  OPB_SRC src,
  OPB_SRC_FLD fld
WHERE 
  fld.SRC_ID = src.SRC_ID  and fld.VERSION_NUMBER = src.VERSION_NUMBER
and src.IS_VISIBLE = 1
AND
  NOT EXISTS 
  (SELECT NULL 
   FROM OPB_SHORTCUT scut 
   WHERE 
   scut.SUBJECT_ID = src.SUBJ_ID AND
   scut.OBJECT_SUBTYPE = 1 AND
   scut.OBJECT_ID = src.SRC_ID AND scut.IS_VISIBLE = 1
   AND scut.OBJECT_TYPE <> 22 )
GO
