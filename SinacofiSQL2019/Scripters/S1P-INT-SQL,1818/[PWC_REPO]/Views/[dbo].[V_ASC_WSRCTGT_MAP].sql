SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_WSRCTGT_MAP]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_WSRCTGT_MAP] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_WSRCTGT_MAP]
AS 
SELECT ' ' "REPOSITORY_ID",
	  'com.informatica.powercenter.map.Mapping' "FROM_CLASS_ID",
       'Mapping_' + ltrim(str(mapping.MAPPING_ID)) "FROM_ELEMENT_ID",
       ' ' "FROM_REPO_ID",
       'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+'Instance' "TO_CLASS_ID",
       'WIDGET_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' +
       ltrim(str(mapping.MAPPING_ID)) + '_' +
       ltrim(str(widgetinstance.INSTANCE_ID)) "TO_ELEMENT_ID",
       ' ' "TO_REPO_ID",
	     'org.omg.cwm.objectmodel.core.ElementOwnership' "ASSOCIATION_ID",
	     1 "ASSOCIATION_SEQ",
         'N' "HIDDEN_FLAG", 
	    '' "EFF_FROM_DT",  '' "EFF_TO_DT",
mapping.SUBJECT_ID "SRC_SUBJECT_ID",
mapping.SUBJECT_ID "TGT_SUBJECT_ID"
       FROM OPB_WIDGET_INST widgetinstance, OPB_OBJECT_TYPE otype, 
     	   OPB_MAPPING mapping
	     WHERE otype.OBJECT_TYPE_ID = widgetinstance.WIDGET_TYPE AND 
		   mapping.MAPPING_ID = widgetinstance.MAPPING_ID AND mapping.VERSION_NUMBER = widgetinstance.VERSION_NUMBER
	AND mapping.IS_VISIBLE = 1
AND
			   mapping.REF_WIDGET_ID = 0
UNION ALL
SELECT ' ' "REPOSITORY_ID",
	  'com.informatica.powercenter.map.Mapplet' "FROM_CLASS_ID",
       'Mapplet_' + ltrim(str(mapping.REF_WIDGET_ID)) "FROM_ELEMENT_ID",
       ' ' "FROM_REPO_ID",
       'com.informatica.powercenter.map.'+REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+'Instance' "TO_CLASS_ID",
       'WIDGET_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' +
       ltrim(str(mapping.MAPPING_ID)) + '_' +
       ltrim(str(widgetinstance.INSTANCE_ID)) "TO_ELEMENT_ID",
       ' ' "TO_REPO_ID",
	     'org.omg.cwm.objectmodel.core.ElementOwnership' "ASSOCIATION_ID",
	     1 "ASSOCIATION_SEQ",
         'N' "HIDDEN_FLAG", 
	     '' "EFF_FROM_DT",  '' "EFF_TO_DT",
mapping.SUBJECT_ID "SRC_SUBJECT_ID",
mapping.SUBJECT_ID "TGT_SUBJECT_ID"
       FROM OPB_WIDGET_INST widgetinstance, OPB_OBJECT_TYPE otype, 
     	    OPB_MAPPING mapping
	     WHERE otype.OBJECT_TYPE_ID = widgetinstance.WIDGET_TYPE AND 
			   mapping.MAPPING_ID = widgetinstance.MAPPING_ID AND mapping.VERSION_NUMBER = widgetinstance.VERSION_NUMBER
AND mapping.IS_VISIBLE = 1
AND
			   mapping.REF_WIDGET_ID <> 0
GO
