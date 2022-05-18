SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_TGTFLDS_TGTS]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_TGTFLDS_TGTS] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_TGTFLDS_TGTS]
AS
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.powercenter.map.TargetDefinition'  "FROM_CLASS_ID",
  'Target Definition_'+ ltrim(str(targ.TARGET_ID)) "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
'com.informatica.powercenter.map.TargetDefinitionPort' "TO_CLASS_ID",
  'Target Definition_' + 'Field_' + ltrim(str(targ.TARGET_ID)) + '_' + ltrim(str(fld.FLDID)) "TO_ELEMENT_ID" ,
  ' ' "TO_REPO_ID",
  'org.omg.cwm.objectmodel.core.ClassifierFeature' "ASSOCIATION_ID",
  fld.FLDNO "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
  targ.SUBJ_ID "SRC_SUBJECT_ID",
targ.SUBJ_ID "TGT_SUBJECT_ID"
FROM 
  OPB_TARG targ,
  OPB_TARG_FLD fld
WHERE 
  fld.TARGET_ID = targ.TARGET_ID and fld.VERSION_NUMBER = targ.VERSION_NUMBER
and targ.IS_VISIBLE = 1
AND
  NOT EXISTS    
  (SELECT NULL
   FROM 
   OPB_SHORTCUT scut   
   WHERE     
   scut.SUBJECT_ID = targ.SUBJ_ID AND
   scut.OBJECT_SUBTYPE = 2 AND
   scut.OBJECT_ID = targ.TARGET_ID AND scut.IS_VISIBLE = 1  )
GO
