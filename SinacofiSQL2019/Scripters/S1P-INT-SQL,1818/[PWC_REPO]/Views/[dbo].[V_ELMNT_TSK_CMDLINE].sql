SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ELMNT_TSK_CMDLINE]') IS NULL EXEC('CREATE VIEW [dbo].[V_ELMNT_TSK_CMDLINE] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ELMNT_TSK_CMDLINE]
AS 
select ' ' "REPOSITORY_ID", 
	'com.informatica.powercenter.process.CommandLine' "CLASS_ID", 
        'CommandLine_' + ltrim(str(tasks.TASK_ID))+'~'+
	ltrim(str(tval.INSTANCE_ID))+'~'+ltrim(str(tval.EXEC_ORDER)) "ELEMENT_ID", 
	tasks.VERSION_NUMBER "VERSION_NUM",
	CASE WHEN tval.VAL_NAME IS NULL THEN 'CommandLineTask'+ltrim(str(tval.EXEC_ORDER))
	ELSE tval.VAL_NAME END "ELEMENT_NAME", 
	CASE WHEN tval.VAL_NAME IS NULL THEN 'CommandLineTask'+ltrim(str(tval.EXEC_ORDER))
	ELSE tval.VAL_NAME END "ELEMENT_LABEL",
	'' "ELEMENT_ALIAS", DESCRIPTION "ELEMENT_DESC",
	'' "ELEMENT_USAGE", 'CommandLine' "ELEMENT_TYPE",
	'' "ELEMENT_SUBTYPE",
	'command' "ELEMENT_ATTR1", PM_VALUE "ELEMENT_VALUE1",
	'overridden' "ELEMENT_ATTR2", CASE WHEN tval.INSTANCE_ID<>0 THEN 'Yes' END "ELEMENT_VALUE2",
	'executionOrder' "ELEMENT_ATTR3", str(tval.EXEC_ORDER) "ELEMENT_VALUE3",
        'Y' "VALID_FLAG",  'N' "DISABLED_FLAG",
	'' "SRC_CREATE_DT", tasks.LAST_SAVED "SRC_UPDATE_DT",
	'' "EFF_FROM_DT",  '' "EFF_TO_DT",
	tasks.SUBJECT_ID	"SUBJECT_ID"
from 
	OPB_TASK tasks,
	OPB_TASK_VAL_LIST  tval
where  
	tasks.TASK_TYPE = 58 and
	tasks.TASK_ID =  tval.TASK_ID AND
	tasks.VERSION_NUMBER =  tval.VERSION_NUMBER AND
	tval.LINE_NO = 1 AND
	tasks.IS_VISIBLE = 1 AND
	tval.SESSION_ID = 0 AND	
	tval.INSTANCE_ID = 0
UNION ALL
select  ' ' "REPOSITORY_ID", 
	'com.informatica.powercenter.process.CommandLine' "CLASS_ID", 
	'CommandLine_' + ltrim(str(tval.TASK_ID))+'~'+
	ltrim(str(tval.INSTANCE_ID))+'~'+ltrim(str(tval.EXEC_ORDER)) "ELEMENT_ID", 
	wflow.VERSION_NUMBER "VERSION_NUM",
	CASE WHEN tval.VAL_NAME IS NULL THEN 'CommandLineTask'+ltrim(str(tval.EXEC_ORDER))
	ELSE tval.VAL_NAME END "ELEMENT_NAME", 
	CASE WHEN tval.VAL_NAME IS NULL THEN 'CommandLineTask'+ltrim(str(tval.EXEC_ORDER))
	ELSE tval.VAL_NAME END "ELEMENT_LABEL",
	'' "ELEMENT_ALIAS", DESCRIPTION "ELEMENT_DESC",
	'' "ELEMENT_USAGE", 'CommandLine' "ELEMENT_TYPE",
	'' "ELEMENT_SUBTYPE",
	'command' "ELEMENT_ATTR1", PM_VALUE "ELEMENT_VALUE1",
	'overridden' "ELEMENT_ATTR2", CASE WHEN tval.INSTANCE_ID<>0 THEN 'Yes' END "ELEMENT_VALUE2",
	'executionOrder' "ELEMENT_ATTR3", str(tval.EXEC_ORDER) "ELEMENT_VALUE3",
	'Y' "VALID_FLAG",  'N' "DISABLED_FLAG",
	'' "SRC_CREATE_DT", wflow.LAST_SAVED "SRC_UPDATE_DT",
	'' "EFF_FROM_DT",  '' "EFF_TO_DT",
	wflow.SUBJECT_ID	"SUBJECT_ID"
from 
	OPB_TASK wflow,
	OPB_TASK_INST tinst,
	OPB_TASK_VAL_LIST  tval
where  
	tval.TASK_TYPE = 58 and
	tinst.INSTANCE_ID =  tval.INSTANCE_ID AND
	tval.WORKFLOW_ID = wflow.TASK_ID AND 
	tinst.VERSION_NUMBER =  tval.VERSION_NUMBER AND
	wflow.VERSION_NUMBER =  tval.VERSION_NUMBER AND
	tval.LINE_NO = 1 AND
	wflow.IS_VISIBLE = 1
GO
