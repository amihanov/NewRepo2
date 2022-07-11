SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_FLDR_MAP]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_FLDR_MAP] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_FLDR_MAP]
AS 
select ' ' "REPOSITORY_ID",
	   'com.informatica.powercenter.package.Folder' "FROM_CLASS_ID", 
       'Folder_' + ltrim(str(subj.SUBJ_ID)) "FROM_ELEMENT_ID",  
' ' "FROM_REPO_ID", 
'com.informatica.powercenter.map.Mapping' "TO_CLASS_ID", 
       'Mapping_'+ ltrim(str(mapping.MAPPING_ID)) "TO_ELEMENT_ID",
' ' "TO_REPO_ID", 
	   'org.omg.cwm.objectmodel.core.ElementOwnership' "ASSOCIATION_ID",
	    1 "ASSOCIATION_SEQ",
         'N' "HIDDEN_FLAG", 
	   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
subj.SUBJ_ID "SRC_SUBJECT_ID",
subj.SUBJ_ID "TGT_SUBJECT_ID"
       FROM
OPB_MAPPING mapping, 
OPB_SUBJECT subj
WHERE
mapping.REF_WIDGET_ID = 0 
and subj.SUBJ_ID = mapping.SUBJECT_ID
and mapping.IS_VISIBLE = 1
GO
