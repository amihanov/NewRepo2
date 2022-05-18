SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_TGT_FLDR]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_TGT_FLDR] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_TGT_FLDR]
AS 
select ' ' "REPOSITORY_ID",
'com.informatica.powercenter.package.Folder' "FROM_CLASS_ID", 
       'Folder' + '_' + ltrim(str(subj.SUBJ_ID)) "FROM_ELEMENT_ID",  
' ' "FROM_REPO_ID", 
'com.informatica.powercenter.map.TargetDefinition' "TO_CLASS_ID", 
       'Target Definition_'+ ltrim(str(targ.TARGET_ID)) "TO_ELEMENT_ID",
' ' "TO_REPO_ID", 
	   'org.omg.cwm.objectmodel.core.ElementOwnership' "ASSOCIATION_ID",
	    1 "ASSOCIATION_SEQ", 
         'N' "HIDDEN_FLAG", 
	    '' "EFF_FROM_DT",  '' "EFF_TO_DT",
subj.SUBJ_ID "SRC_SUBJECT_ID",
subj.SUBJ_ID "TGT_SUBJECT_ID"
       FROM 
OPB_TARG targ, 
OPB_SUBJECT subj
WHERE
subj.SUBJ_ID = targ.SUBJ_ID
and targ.IS_VISIBLE = 1
GO
