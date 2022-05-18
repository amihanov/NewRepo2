SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_SRVC_REPO]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_SRVC_REPO] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_SRVC_REPO]
AS
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.superglue.repository.Repository' "FROM_CLASS_ID",
  ' ' "FROM_ELEMENT_ID",
  'IMM_MASTER_REPOSITORY' "FROM_REPO_ID",
  'com.informatica.powercenter.deployment.IntegrationService' "TO_CLASS_ID",
  'Integration Service_' + LTRIM(STR(server.SERVER_ID)) "TO_ELEMENT_ID",
  ' ' "TO_REPO_ID",
  'org.omg.cwm.objectmodel.core.ElementOwnership' "ASSOCIATION_ID",
  1 "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
CAST(NULL AS INT) "SRC_SUBJECT_ID",
CAST(NULL AS INT) "TGT_SUBJECT_ID"
FROM 
  V_ELMNT_SERVICE server
GO
