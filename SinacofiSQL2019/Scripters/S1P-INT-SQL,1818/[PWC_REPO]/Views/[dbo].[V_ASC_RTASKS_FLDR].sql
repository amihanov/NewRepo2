SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_RTASKS_FLDR]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_RTASKS_FLDR] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_RTASKS_FLDR]
AS 
select ' ' "REPOSITORY_ID",
	   'com.informatica.powercenter.package.Folder' "FROM_CLASS_ID", 
       'Folder' +'_'+ ltrim(str(subj.SUBJ_ID)) "FROM_ELEMENT_ID",  
' ' "FROM_REPO_ID", 
'com.informatica.powercenter.process.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','') "TO_CLASS_ID", 
       otype.OBJECT_TYPE_NAME +'_'+ ltrim(str(tasks.TASK_ID)) "TO_ELEMENT_ID",
' ' "TO_REPO_ID", 
	   'org.omg.cwm.objectmodel.core.ElementOwnership' "ASSOCIATION_ID",
	    1 "ASSOCIATION_SEQ", 
         'N' "HIDDEN_FLAG", 
	   ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
subj.SUBJ_ID "SRC_SUBJECT_ID",
subj.SUBJ_ID "TGT_SUBJECT_ID"
       from OPB_TASK tasks, OPB_OBJECT_TYPE otype, 
     	    OPB_SUBJECT subj 
	   where otype.OBJECT_TYPE_ID = tasks.TASK_TYPE and subj.SUBJ_ID = tasks.SUBJECT_ID and tasks.IS_REUSABLE = 1 and tasks.IS_VISIBLE = 1
GO
