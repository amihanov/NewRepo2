SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_IME_PART_SINST]') IS NULL EXEC('CREATE VIEW [dbo].[V_IME_PART_SINST] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_IME_PART_SINST]
AS
SELECT ' ' "REPOSITORY_ID",
'com.informatica.powercenter.process.' +REPLACE(otype.OBJECT_TYPE_NAME,' ','') + 
                   'Partition' "PARTITION_CLASS_ID",
         otype.OBJECT_TYPE_NAME + '_' + 'Partition' + '_' +
                   LTRIM(STR(partdef.SESSION_ID)) + '_' +
                   LTRIM(STR(partdef.SESS_WIDG_INST_ID)) + '_' +
                   LTRIM(STR(partdef.PARTITION_ID)) "PARTITION_ID",
       'TASK_INSTANCE_' + otype.OBJECT_TYPE_NAME +'_'+
	         LTRIM(STR(tinst.INSTANCE_ID)) "TASK_ID",
       'com.informatica.powercenter.process.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'TaskInstance' "TASK_CLASS_ID",
	  CASE WHEN swinst.PARTITION_TYPE = 1 THEN 'Pass-Through' ELSE (
	  CASE WHEN swinst.PARTITION_TYPE = 3 THEN 'Round-Robin' ELSE (
	  CASE WHEN swinst.PARTITION_TYPE = 4 THEN 'Key-Range' ELSE ( 
	  CASE WHEN swinst.PARTITION_TYPE = 5 THEN 'Hash-Key' 
	  ELSE 'Other' END) END) END) END "PARTITION_TYPE",
	   partdef.PARTITION_NAME "PARTITION_NAME",
	   partdef.PARTITION_NAME "PARTITION_DESC",
	   '' "PARTITION_TEXT1",
	   '' "PARTITION_TEXT2",
	   '' "PARTITION_TEXT3",
         '1' "VERSION_NUM",
	   partdef.LAST_SAVED "SRC_CREATE_DT",
         partdef.LAST_SAVED "SRC_UPDATE_DT",
 	   '' "EFF_FROM_DT",
         '' "EFF_TO_DT",
tsk.SUBJECT_ID "SUBJECT_ID"
FROM   OPB_REPOSIT repo,
       OPB_OBJECT_TYPE otype,
       OPB_PARTITION_DEF partdef,
       OPB_TASK_INST tinst,
       OPB_TASK tsk,
       OPB_SWIDGET_INST swinst, OPB_TASK wkflow_or_wklet
WHERE  
  repo.RECID = 1 AND
  otype.OBJECT_TYPE_ID = 68 AND
  otype.OBJECT_TYPE_ID = tinst.TASK_TYPE AND
  partdef.SESSION_ID = tinst.TASK_ID AND partdef.SESSION_ID = tsk.TASK_ID
AND partdef.VERSION_NUMBER = tsk.VERSION_NUMBER
AND tsk.IS_VISIBLE = 1
AND tsk.TASK_TYPE = 68
AND
  tsk.IS_REUSABLE = 0 AND
  tinst.TASK_ID = tsk.TASK_ID AND tinst.WORKFLOW_ID = wkflow_or_wklet.TASK_ID
AND tinst.VERSION_NUMBER = wkflow_or_wklet.VERSION_NUMBER
AND wkflow_or_wklet.TASK_TYPE IN (70,71)
AND wkflow_or_wklet.IS_VISIBLE = 1
AND
  swinst.SESS_WIDG_INST_ID = partdef.SESS_WIDG_INST_ID AND
  swinst.SESSION_ID = partdef.SESSION_ID AND swinst.VERSION_NUMBER = partdef.VERSION_NUMBER
GO
