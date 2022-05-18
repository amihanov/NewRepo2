﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ELMNT_WDGTS]') IS NULL EXEC('CREATE VIEW [dbo].[V_ELMNT_WDGTS] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ELMNT_WDGTS]
AS
select ' ' "REPOSITORY_ID", 
'com.informatica.powercenter.map.' + Replace(otype.OBJECT_TYPE_NAME,' ','') "CLASS_ID", 
     otype.OBJECT_TYPE_NAME +  '_'+  ltrim(str(widg.WIDGET_ID)) "ELEMENT_ID", widg.VERSION_NUMBER "VERSION_NUM",
	   widg.WIDGET_NAME "ELEMENT_NAME", widg.WIDGET_NAME "ELEMENT_LABEL",
	   '' "ELEMENT_ALIAS", widg.COMMENTS "ELEMENT_DESC",
	   '' "ELEMENT_USAGE", 'Application' "ELEMENT_TYPE",
	   otype.OBJECT_TYPE_NAME "ELEMENT_SUBTYPE",
	   'REUSABLE' "ELEMENT_ATTR1", 'Yes' "ELEMENT_VALUE1",
	   CASE WHEN map.IS_VALID IS NULL THEN '' ELSE 'VALID' END   "ELEMENT_ATTR2", 
   	   CASE WHEN map.IS_VALID IS NULL THEN '' ELSE ( CASE WHEN  map.IS_VALID = 0 THEN 'No' ELSE 'Yes' END) END   "ELEMENT_VALUE2",  
	   '' "ELEMENT_ATTR3", '' "ELEMENT_VALUE3",
           CASE WHEN map.IS_VALID = 0 THEN 'N' ELSE 'Y' END "VALID_FLAG", 'N' "DISABLED_FLAG", 
	   '' "SRC_CREATE_DT", widg.LAST_SAVED "SRC_UPDATE_DT",
	   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	   widg.SUBJECT_ID	"SUBJECT_ID"
    from OPB_OBJECT_TYPE otype, OPB_WIDGET widg LEFT OUTER JOIN OPB_MAPPING map ON
	 widg.WIDGET_ID = map.REF_WIDGET_ID and map.IS_VISIBLE = 1
	where otype.OBJECT_TYPE_ID = WIDGET_TYPE and IS_REUSABLE = 1 and widg.IS_VISIBLE = 1
GO
