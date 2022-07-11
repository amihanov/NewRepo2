SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_SWSYSTEM]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_SWSYSTEM] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_SWSYSTEM]
AS
select ' ' "REPOSITORY_ID",
   'org.omg.cwm.foundation.softwaredeployment.SoftwareSystem' "FROM_CLASS_ID",
     'PC_SWSystem_' + repo.REPOSIT_NAME "FROM_ELEMENT_ID",
     ' ' "FROM_REPO_ID",
   'org.omg.cwm.foundation.softwaredeployment.DeployedSoftwareSystem' "TO_CLASS_ID",
      'PC_DepSWSystem_' + repo.REPOSIT_NAME "TO_ELEMENT_ID",
      ' ' "TO_REPO_ID",
   'org.omg.cwm.foundation.softwaredeployment.SoftwareSystemDeployments' "ASSOCIATION_ID",
   1 "ASSOCIATION_SEQ",
   'N' "HIDDEN_FLAG", 
   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
CAST(NULL AS INT) "SRC_SUBJECT_ID",
CAST(NULL AS INT) "TGT_SUBJECT_ID"
       from  OPB_REPOSIT repo
	   where repo.RECID = 1
union all
select ' ' "REPOSITORY_ID",
   'org.omg.cwm.foundation.softwaredeployment.DeployedSoftwareSystem' "FROM_CLASS_ID",
      'PC_DepSWSystem_' + repo.REPOSIT_NAME "FROM_ELEMENT_ID",
      ' ' "FROM_REPO_ID",
   'com.informatica.powercenter.deployment.IntegrationService' "TO_CLASS_ID",
      'Integration Service_' + ltrim(str(server.SERVER_ID)) "TO_ELEMENT_ID",
      ' ' "TO_REPO_ID",
   'org.omg.cwm.foundation.softwaredeployment.DeployedSoftwareSystemComponents' "ASSOCIATION_ID",
   1 "ASSOCIATION_SEQ",
   'N' "HIDDEN_FLAG", 
   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
CAST(NULL AS INT) "SRC_SUBJECT_ID",
CAST(NULL AS INT) "TGT_SUBJECT_ID"
    from V_ELMNT_SERVICE server,OPB_REPOSIT repo
	   where repo.RECID = 1
GO
