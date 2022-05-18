SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_REPO_FOLDER]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_REPO_FOLDER] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_REPO_FOLDER]
AS
select ' ' "REPOSITORY_ID",
	   'com.informatica.superglue.repository.Repository' "FROM_CLASS_ID",
        ' ' "FROM_ELEMENT_ID",
        'IMM_MASTER_REPOSITORY' "FROM_REPO_ID",
	  'com.informatica.powercenter.package.Folder' "TO_CLASS_ID",
       'Folder_'+ ltrim(str(subj.SUBJ_ID)) "TO_ELEMENT_ID",
     ' ' "TO_REPO_ID",
	   'org.omg.cwm.objectmodel.core.ElementOwnership' "ASSOCIATION_ID",
	    1 "ASSOCIATION_SEQ",
         'N' "HIDDEN_FLAG", 
	    '' "EFF_FROM_DT",  '' "EFF_TO_DT",
subj.SUBJ_ID "SRC_SUBJECT_ID",
subj.SUBJ_ID "TGT_SUBJECT_ID"
FROM 
  OPB_SUBJECT subj
GO
