SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ELMNT_FOLDERS]') IS NULL EXEC('CREATE VIEW [dbo].[V_ELMNT_FOLDERS] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ELMNT_FOLDERS]
AS
select ' ' "REPOSITORY_ID",
'com.informatica.powercenter.package.Folder' "CLASS_ID",
      'Folder_' + ltrim(str(SUBJ_ID)) "ELEMENT_ID", '1' "VERSION_NUM",
	    SUBJ_NAME "ELEMENT_NAME", SUBJ_NAME "ELEMENT_LABEL",
     '' "ELEMENT_ALIAS", SUBJ_DESC "ELEMENT_DESC",
     '' "ELEMENT_USAGE", 'Folder' "ELEMENT_TYPE",
	   '' "ELEMENT_SUBTYPE",
	   'IS_SHARED' "ELEMENT_ATTR1", (CASE WHEN IS_SHARED=1 THEN 'Yes' ELSE 'No' END) "ELEMENT_VALUE1",
	   '' "ELEMENT_ATTR2", '' "ELEMENT_VALUE2",
	   '' "ELEMENT_ATTR3", '' "ELEMENT_VALUE3",
         '' "VALID_FLAG", 'N' "DISABLED_FLAG", 
	   '' "SRC_CREATE_DT", CREATION_TIME "SRC_UPDATE_DT",
	   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	   SUBJ_ID	"SUBJECT_ID"
    from OPB_SUBJECT
GO
