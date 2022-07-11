SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ELMNT_LOCAL_SC]') IS NULL EXEC('CREATE VIEW [dbo].[V_ELMNT_LOCAL_SC] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ELMNT_LOCAL_SC]
AS 
select ' ' "REPOSITORY_ID", 
'com.informatica.powercenter.map.'+Replace(otype.OBJECT_TYPE_NAME,' ','')+'Shortcut' "CLASS_ID", 
       'SHORTCUT_TO_' + 'PC_' + shcut.REPOSITORY_NAME +'_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(shcut.SUBJECT_ID)) + '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str(shcut.OBJECT_ID))  "ELEMENT_ID", 
	   shcut.VERSION_NUMBER "VERSION_NUM",
	   shcut.SHORTCUT_NAME "ELEMENT_NAME", shcut.SHORTCUT_NAME "ELEMENT_LABEL",
	   '' "ELEMENT_ALIAS", shcut.COMMENTS "ELEMENT_DESC", 
	   '' "ELEMENT_USAGE", 'Local Shortcut' "ELEMENT_TYPE", 
	   otype.OBJECT_TYPE_NAME "ELEMENT_SUBTYPE",
	   'SHORTCUT_TO_REPOSITORY' "ELEMENT_ATTR1", shcut.REPOSITORY_NAME "ELEMENT_VALUE1",
	   '' "ELEMENT_ATTR2", '' "ELEMENT_VALUE2", 
	   '' "ELEMENT_ATTR3", '' "ELEMENT_VALUE3",
     '' "VALID_FLAG", 'N' "DISABLED_FLAG", 
	   '' "SRC_CREATE_DT", shcut.CREATION_TIME "SRC_UPDATE_DT",
	   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	   shcut.SUBJECT_ID	"SUBJECT_ID"
      from OPB_SHORTCUT shcut, OPB_OBJECT_TYPE otype
	  where shcut.OBJECT_TYPE not in (22,21) and shcut.OBJECT_SUBTYPE = otype.OBJECT_TYPE_ID 
	        and shcut.OBJECT_ID >= 0 and shcut.IS_VISIBLE = 1
UNION ALL
select ' ' "REPOSITORY_ID", 
'com.informatica.powercenter.map.MappingShortcut' "CLASS_ID", 
       'SHORTCUT_TO_' + 'PC_' + shcut.REPOSITORY_NAME +'_Mapping_' + ltrim(str(shcut.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str(shcut.OBJECT_ID))  "ELEMENT_ID", 
	   shcut.VERSION_NUMBER "VERSION_NUM",
	   shcut.SHORTCUT_NAME "ELEMENT_NAME", shcut.SHORTCUT_NAME "ELEMENT_LABEL",
	   '' "ELEMENT_ALIAS", shcut.COMMENTS "ELEMENT_DESC", 
	   '' "ELEMENT_USAGE", 'Local Shortcut' "ELEMENT_TYPE", 
	   'Mapping' "ELEMENT_SUBTYPE",
	   'SHORTCUT_TO_REPOSITORY' "ELEMENT_ATTR1", shcut.REPOSITORY_NAME "ELEMENT_VALUE1",
	   '' "ELEMENT_ATTR2", '' "ELEMENT_VALUE2", 
	   '' "ELEMENT_ATTR3", '' "ELEMENT_VALUE3",
     '' "VALID_FLAG", 'N' "DISABLED_FLAG", 
	   '' "SRC_CREATE_DT", shcut.CREATION_TIME "SRC_UPDATE_DT",
	   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	   shcut.SUBJECT_ID	"SUBJECT_ID"
      from OPB_SHORTCUT shcut
	  where shcut.OBJECT_TYPE = 21 
	        and shcut.OBJECT_ID >= 0 and shcut.IS_VISIBLE = 1
GO
