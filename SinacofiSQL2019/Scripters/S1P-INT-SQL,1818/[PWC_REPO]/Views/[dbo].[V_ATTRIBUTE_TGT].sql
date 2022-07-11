SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ATTRIBUTE_TGT]') IS NULL EXEC('CREATE VIEW [dbo].[V_ATTRIBUTE_TGT] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ATTRIBUTE_TGT]
AS 
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.TargetDefinition' "ELEMENT_CLASS_ID", 
'Target Definition' + '_'+ ltrim(str(targ.TARGET_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 CASE WHEN att.ATTR_NAME = 'DTD Reference' THEN 'DTD/Schema Reference' ELSE att.ATTR_NAME END "ELMNT_ATTR_NAME",
       CASE WHEN att.ATTR_ID = 17
	THEN CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Append' WHEN 2 THEN 'Truncate' 
	WHEN 0 THEN 'None' END ELSE
	CASE WHEN att.ATTR_ID = 18
	THEN CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Unix' WHEN 2 THEN 'Windows' 
	WHEN 3 THEN 'None' WHEN 0  THEN 'System Default' END ELSE
	attrval.ATTR_VALUE END END "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", targ.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
     targ.SUBJ_ID "SUBJECT_ID"
      from OPB_WIDGET_ATTR attrval, OPB_ATTR att, OPB_TARG targ
	  where 
	        targ.TARGET_ID = attrval.WIDGET_ID and targ.VERSION_NUMBER = attrval.VERSION_NUMBER
and targ.IS_VISIBLE = 1
and	        attrval.WIDGET_TYPE = 2 and
			att.ATTR_ID = attrval.ATTR_ID and
			att.OBJECT_TYPE_ID = 2 and 
			attrval.MAPPING_ID = 0 and attrval.INSTANCE_ID = 0 and attrval.SESSION_ID = 0 and attrval.PARTITION_ID = 0 and
			attrval.SESSION_TASK_ID = 0 and attrval.LINE_NO = 1
GO
