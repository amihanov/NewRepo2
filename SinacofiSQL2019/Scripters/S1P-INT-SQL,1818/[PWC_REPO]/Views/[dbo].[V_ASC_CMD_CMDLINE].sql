SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_CMD_CMDLINE]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_CMD_CMDLINE] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_CMD_CMDLINE]
AS
SELECT  
' '                                                               "REPOSITORY_ID",  
'com.informatica.powercenter.process.Command'		"FROM_CLASS_ID",  
'Command_'+ltrim(str(tasks.TASK_ID))     "FROM_ELEMENT_ID",  
' '                                                                "FROM_REPO_ID",  
'com.informatica.powercenter.process.CommandLine'                                    "TO_CLASS_ID",  
 'CommandLine_' + ltrim(str(tasks.TASK_ID))+'~'+
 ltrim(str(tval.INSTANCE_ID))+'~'+ltrim(str(tval.EXEC_ORDER))        "TO_ELEMENT_ID",  
' '                                                                "TO_REPO_ID",  
'org.omg.cwm.objectmodel.core.ClassifierFeature'                              "ASSOCIATION_ID",  
EXEC_ORDER                                                                                                               "ASSOCIATION_SEQ",  
'N'                                                                                                              "HIDDEN_FLAG",  
''                                                                                                                 "EFF_FROM_DT",  
''                                                                                                                 "EFF_TO_DT"  ,
tasks.SUBJECT_ID "SRC_SUBJECT_ID",
tasks.SUBJECT_ID "TGT_SUBJECT_ID"
FROM  
	    OPB_TASK tasks,
	    OPB_TASK_VAL_LIST  tval
where  
	 	tasks.TASK_TYPE = 58 and
	  	tasks.TASK_ID =  tval.TASK_ID AND
	  	tasks.TASK_TYPE =  tval.TASK_TYPE AND	
		tasks.VERSION_NUMBER =  tval.VERSION_NUMBER AND
		tval.LINE_NO = 1 AND
		tasks.IS_VISIBLE = 1 AND
		tasks.IS_REUSABLE = 1 AND
		tval.SESSION_ID = 0 AND		
		tval.INSTANCE_ID = 0
UNION ALL
SELECT  
' '                                                               "REPOSITORY_ID",  
'com.informatica.powercenter.process.CommandTaskInstance'		"FROM_CLASS_ID",  
'TASK_INSTANCE_Command_' + ltrim(str(tval.INSTANCE_ID))   "FROM_ELEMENT_ID",  
' '                                                                "FROM_REPO_ID",  
'com.informatica.powercenter.process.CommandLine'                                    "TO_CLASS_ID",  
 'CommandLine_' + ltrim(str(tval.TASK_ID))+'~'+
 ltrim(str(tval.INSTANCE_ID))+'~'+ltrim(str(tval.EXEC_ORDER))        "TO_ELEMENT_ID",  
' '                                                                "TO_REPO_ID",  
'org.omg.cwm.objectmodel.core.ClassifierFeature'                              "ASSOCIATION_ID",  
EXEC_ORDER                                                                                                               "ASSOCIATION_SEQ",  
'N'                                                                                                              "HIDDEN_FLAG",  
''                                                                                                                 "EFF_FROM_DT",  
''                                                                                                                 "EFF_TO_DT"  ,
wflow.SUBJECT_ID "SRC_SUBJECT_ID",
wflow.SUBJECT_ID "TGT_SUBJECT_ID"
     from 
	    OPB_TASK wflow,
		OPB_TASK_INST tinst,
	    OPB_TASK_VAL_LIST  tval
	 where  
	 	tval.TASK_TYPE = 58 and
	  	tinst.INSTANCE_ID =  tval.INSTANCE_ID AND
	 	tval.TASK_TYPE = tinst.TASK_TYPE and	  	
		tval.WORKFLOW_ID = wflow.TASK_ID AND 
		tinst.VERSION_NUMBER =  tval.VERSION_NUMBER AND
		wflow.VERSION_NUMBER =  tval.VERSION_NUMBER AND
		tval.LINE_NO = 1 AND
		wflow.IS_VISIBLE = 1
UNION ALL
SELECT  
' '                                                               "REPOSITORY_ID",  
'com.informatica.powercenter.process.CommandTaskInstance'		"FROM_CLASS_ID",  
'TASK_INSTANCE_Command_' + ltrim(str(tinst.INSTANCE_ID))   "FROM_ELEMENT_ID",  
' '                                                                "FROM_REPO_ID",  
'com.informatica.powercenter.process.CommandLine'                                    "TO_CLASS_ID",  
 'CommandLine_' + ltrim(str(tval.TASK_ID))+'~'+
 ltrim(str(tval.INSTANCE_ID))+'~'+ltrim(str(tval.EXEC_ORDER))        "TO_ELEMENT_ID",  
' '                                                                "TO_REPO_ID",  
'org.omg.cwm.objectmodel.core.ClassifierFeature'                              "ASSOCIATION_ID",  
EXEC_ORDER                                                                                                               "ASSOCIATION_SEQ",  
'N'                                                                                                              "HIDDEN_FLAG",  
''                                                                                                                 "EFF_FROM_DT",  
''                                                                                                                 "EFF_TO_DT"  ,
wflow.SUBJECT_ID "SRC_SUBJECT_ID",
wflow.SUBJECT_ID "TGT_SUBJECT_ID"
     from 
	    OPB_TASK wflow,
	    OPB_TASK tasks,
		OPB_TASK_INST tinst,
	    OPB_TASK_VAL_LIST  tval
	 where  
	 	tval.TASK_TYPE = 58 and
	  	tinst.TASK_ID =  tval.TASK_ID AND
	 	tval.TASK_TYPE = tinst.TASK_TYPE and
		tinst.WORKFLOW_ID = wflow.TASK_ID AND 
		tinst.VERSION_NUMBER =  wflow.VERSION_NUMBER AND
		wflow.IS_VISIBLE = 1 AND
		tval.TASK_ID = tasks.TASK_ID AND
		tasks.VERSION_NUMBER =  tval.VERSION_NUMBER AND
		tval.LINE_NO = 1 AND
		tasks.IS_VISIBLE = 1 AND
		tasks.IS_REUSABLE = 0
GO
