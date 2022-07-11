SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ELMNT_SW_COMP]') IS NULL EXEC('CREATE VIEW [dbo].[V_ELMNT_SW_COMP] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ELMNT_SW_COMP]
AS
select  ' ' "REPOSITORY_ID", 
'org.omg.cwm.foundation.softwaredeployment.SoftwareSystem' "CLASS_ID", 
'PC_SWSystem_' + repo.REPOSIT_NAME  "ELEMENT_ID", 
   '8' "VERSION_NUM",
	   'PowerCenter Software System' "ELEMENT_NAME", 'PowerCenter Software System' "ELEMENT_LABEL",
	   '' "ELEMENT_ALIAS", 'This is PowerCenter software system' "ELEMENT_DESC", 
	   '' "ELEMENT_USAGE", 'Data Integration' "ELEMENT_TYPE", 
	   '' "ELEMENT_SUBTYPE", 
	   'type' "ELEMENT_ATTR1", 'Data Integration' "ELEMENT_VALUE1",
	   'supplier' "ELEMENT_ATTR2", 'Informatica' "ELEMENT_VALUE2", 
	   'version' "ELEMENT_ATTR3", '8.x' "ELEMENT_VALUE3",
       'Y' "VALID_FLAG", 'N' "DISABLED_FLAG", 
	   '' "SRC_CREATE_DT", '' "SRC_UPDATE_DT",
	   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	   CAST(NULL AS INT) "SUBJECT_ID"
    from OPB_REPOSIT repo
	where  repo.RECID = 1
union all
select  ' ' "REPOSITORY_ID", 
'org.omg.cwm.foundation.softwaredeployment.DeployedSoftwareSystem' "CLASS_ID", 
'PC_DepSWSystem_' + repo.REPOSIT_NAME  "ELEMENT_ID", 
   '8' "VERSION_NUM",
	   'Installed PowerCenter' "ELEMENT_NAME", 'Installed PowerCenter' "ELEMENT_LABEL",
	   '' "ELEMENT_ALIAS", 'This is the installed PowerCenter software system' "ELEMENT_DESC", 
	   '' "ELEMENT_USAGE", 'Data Integration' "ELEMENT_TYPE", 
	   '' "ELEMENT_SUBTYPE", 
	   '' "ELEMENT_ATTR1", '' "ELEMENT_VALUE1",
	   '' "ELEMENT_ATTR2", '' "ELEMENT_VALUE2", 
	   '' "ELEMENT_ATTR3", '' "ELEMENT_VALUE3",
       'Y' "VALID_FLAG", 'N' "DISABLED_FLAG", 
	   '' "SRC_CREATE_DT", '' "SRC_UPDATE_DT",
	   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	   CAST(NULL AS INT) "SUBJECT_ID"
    from OPB_REPOSIT repo
	where  repo.RECID = 1
GO
