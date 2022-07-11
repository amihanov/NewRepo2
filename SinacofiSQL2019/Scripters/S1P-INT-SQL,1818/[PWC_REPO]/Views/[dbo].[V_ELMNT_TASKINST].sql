﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ELMNT_TASKINST]') IS NULL EXEC('CREATE VIEW [dbo].[V_ELMNT_TASKINST] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ELMNT_TASKINST]
AS
select ' ' "REPOSITORY_ID",
'com.informatica.powercenter.process.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'TaskInstance' "CLASS_ID",
     'TASK_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + ltrim(str(tinst.INSTANCE_ID)) "ELEMENT_ID",
	   tinst.VERSION_NUMBER "VERSION_NUM",
	   tinst.INSTANCE_NAME "ELEMENT_NAME", tinst.INSTANCE_NAME "ELEMENT_LABEL",
	   '' "ELEMENT_ALIAS", tinst.COMMENTS "ELEMENT_DESC",
	   '' "ELEMENT_USAGE",
           otype.OBJECT_TYPE_NAME "ELEMENT_TYPE",
	   '' "ELEMENT_SUBTYPE",
	   'WORKFLOW_NAME' "ELEMENT_ATTR1", tasks.TASK_NAME "ELEMENT_VALUE1",
	   '' "ELEMENT_ATTR2", '' "ELEMENT_VALUE2",
	   '' "ELEMENT_ATTR3", '' "ELEMENT_VALUE3",
         'Y' "VALID_FLAG", (CASE WHEN tinst.IS_ENABLED=0 THEN 'Y' ELSE 'N' END) "DISABLED_FLAG",
	   '' "SRC_CREATE_DT", tasks.LAST_SAVED "SRC_UPDATE_DT",
	   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	   tasks.SUBJECT_ID	"SUBJECT_ID"
	   from OPB_TASK_INST tinst, OPB_OBJECT_TYPE otype, OPB_TASK tasks
	   where tinst.TASK_TYPE = otype.OBJECT_TYPE_ID and 
	   tasks.TASK_ID = tinst.WORKFLOW_ID and ( tasks.TASK_TYPE = 71 OR tasks.TASK_TYPE = 70 ) 
and tasks.VERSION_NUMBER = tinst.VERSION_NUMBER
and tasks.IS_VISIBLE = 1
GO
