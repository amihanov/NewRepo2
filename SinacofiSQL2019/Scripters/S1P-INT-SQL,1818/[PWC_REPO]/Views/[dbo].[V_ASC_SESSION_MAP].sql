SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_SESSION_MAP]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_SESSION_MAP] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_SESSION_MAP]
AS 
SELECT
' ' "REPOSITORY_ID",
'com.informatica.powercenter.process.Session' "FROM_CLASS_ID", 
'Session_' + ltrim(str(sess.SESSION_ID)) "FROM_ELEMENT_ID",  
' ' "FROM_REPO_ID", 
'com.informatica.powercenter.map.Mapping' "TO_CLASS_ID", 
'Mapping_' + ltrim(str(sess.MAPPING_ID)) "TO_ELEMENT_ID",
' ' "TO_REPO_ID", 
'org.omg.cwm.analysis.transformation.TransformationTaskElement' "ASSOCIATION_ID",
 1 "ASSOCIATION_SEQ", 
'N' "HIDDEN_FLAG", 
'' "EFF_FROM_DT", 
 '' "EFF_TO_DT",
task.SUBJECT_ID "SRC_SUBJECT_ID",
task.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
OPB_SESSION sess, 
OPB_MAPPING map,
OPB_TASK task
WHERE
task.TASK_TYPE = 68 and 
sess.MAPPING_ID = map.MAPPING_ID and
map.IS_VISIBLE = 1 and
sess.SESSION_ID = task.TASK_ID and 
sess.VERSION_NUMBER = task.VERSION_NUMBER and 
task.IS_VISIBLE = 1 and
task.IS_REUSABLE = 1 and
sess.MAPPING_ID > 0 and
NOT EXISTS (SELECT NULL
             FROM
               OPB_SHORTCUT scut
             WHERE scut.SUBJECT_ID = task.SUBJECT_ID AND
                   scut.OBJECT_TYPE = 21 AND
                   scut.OBJECT_ID = sess.MAPPING_ID and scut.IS_VISIBLE = 1)
UNION ALL
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.powercenter.process.SessionTaskInstance' "FROM_CLASS_ID",
  'TASK_INSTANCE_Session_'+
          LTRIM(str(taskinst.INSTANCE_ID)) "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
  'com.informatica.powercenter.map.Mapping' "TO_CLASS_ID",
  'Mapping_' + LTRIM(str(sess.MAPPING_ID)) "TO_ELEMENT_ID",
  ' ' "TO_REPO_ID",
  'org.omg.cwm.analysis.transformation.TransformationTaskElement' "ASSOCIATION_ID",
  1 "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
task.SUBJECT_ID "SRC_SUBJECT_ID",
task.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
  OPB_SESSION sess,
  OPB_MAPPING map,
  OPB_TASK task,
  OPB_TASK_INST taskinst,
  OPB_TASK wkflow_or_wklet
WHERE 
  sess.MAPPING_ID = map.MAPPING_ID and
  map.IS_VISIBLE = 1 and
  sess.SESSION_ID = task.TASK_ID and 
  sess.VERSION_NUMBER = task.VERSION_NUMBER and 
  task.IS_VISIBLE = 1 AND
  taskinst.TASK_ID = task.TASK_ID and 
  taskinst.WORKFLOW_ID = wkflow_or_wklet.TASK_ID and 
  taskinst.VERSION_NUMBER = wkflow_or_wklet.VERSION_NUMBER and 
  wkflow_or_wklet.TASK_TYPE IN (70,71) and 
  wkflow_or_wklet.IS_VISIBLE = 1 AND
  taskinst.TASK_TYPE = 68 AND
  sess.MAPPING_ID > 0 AND
  NOT EXISTS (SELECT NULL
             FROM
               OPB_SHORTCUT scut
             WHERE scut.SUBJECT_ID = task.SUBJECT_ID AND
                   scut.OBJECT_TYPE = 21 AND
                   scut.OBJECT_ID = sess.MAPPING_ID and scut.IS_VISIBLE = 1)
UNION ALL
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.powercenter.process.Session' "FROM_CLASS_ID",
  'Session_' + ltrim(str(sess.SESSION_ID)) "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
  'com.informatica.powercenter.map.MappingShortcut' "TO_CLASS_ID",
  'SHORTCUT_TO_' + 'PC_' + shcut.REPOSITORY_NAME + '_Mapping_' + ltrim(str(shcut.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str(shcut.OBJECT_ID))  "TO_ELEMENT_ID",
  ' ' "TO_REPO_ID",
  'org.omg.cwm.analysis.transformation.TransformationTaskElement' "ASSOCIATION_ID",
  1 "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
task.SUBJECT_ID "SRC_SUBJECT_ID",
task.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
  OPB_SESSION sess,
  OPB_TASK task,
  OPB_SHORTCUT shcut
WHERE 
  task.TASK_TYPE = 68 and
  shcut.OBJECT_ID = sess.MAPPING_ID AND
  shcut.SUBJECT_ID = task.SUBJECT_ID AND
  shcut.OBJECT_TYPE = 21 AND  
  sess.SESSION_ID = task.TASK_ID and 
  sess.VERSION_NUMBER = task.VERSION_NUMBER and 
  task.IS_VISIBLE = 1 and
  task.IS_REUSABLE = 1 and
  shcut.OBJECT_ID >= 0 and 
  shcut.IS_VISIBLE = 1
UNION ALL
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.powercenter.process.SessionTaskInstance' "FROM_CLASS_ID",
  'TASK_INSTANCE_Session_' +  		 LTRIM(str(taskinst.INSTANCE_ID)) "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
  'com.informatica.powercenter.map.MappingShortcut' "TO_CLASS_ID",
  'SHORTCUT_TO_' + 'PC_' +  shcut.REPOSITORY_NAME + '_Mapping_' + ltrim(str(shcut.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str(shcut.OBJECT_ID))  "TO_ELEMENT_ID",
  ' ' "TO_REPO_ID",
  'org.omg.cwm.analysis.transformation.TransformationTaskElement' "ASSOCIATION_ID",
  1 "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT" ,
task.SUBJECT_ID "SRC_SUBJECT_ID",
task.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
  OPB_SESSION sess,
  OPB_TASK task,
  OPB_TASK_INST taskinst,
  OPB_SHORTCUT shcut, 
  OPB_TASK wkflow_or_wklet
WHERE 
  sess.SESSION_ID = task.TASK_ID and 
  sess.VERSION_NUMBER = task.VERSION_NUMBER and 
  task.IS_VISIBLE = 1 AND
  shcut.OBJECT_ID = sess.MAPPING_ID AND
  shcut.SUBJECT_ID = task.SUBJECT_ID AND
  shcut.OBJECT_TYPE = 21 AND  
  taskinst.TASK_ID = task.TASK_ID and 
  taskinst.WORKFLOW_ID = wkflow_or_wklet.TASK_ID and 
  taskinst.VERSION_NUMBER = wkflow_or_wklet.VERSION_NUMBER and 
  wkflow_or_wklet.TASK_TYPE IN (70,71) and 
  wkflow_or_wklet.IS_VISIBLE = 1 AND
  taskinst.TASK_TYPE = 68 AND
  shcut.OBJECT_ID >= 0 and 
  shcut.IS_VISIBLE = 1
UNION ALL
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.powercenter.process.Session' "FROM_CLASS_ID", 
  'Session_' + ltrim(str(sess.SESSION_ID)) "FROM_ELEMENT_ID",  
  ' ' "FROM_REPO_ID", 
  'com.informatica.powercenter.map.MappingShortcut' "TO_CLASS_ID", 
  'SHORTCUT_TO_' + 'PC_' + shcut.REPOSITORY_NAME + '_Mapping_'+ ltrim(str(task.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str((sess.MAPPING_ID + 2147483649))) "TO_ELEMENT_ID", 
  ' ' "TO_REPO_ID", 
  'org.omg.cwm.analysis.transformation.TransformationTaskElement' "ASSOCIATION_ID",
   1 "ASSOCIATION_SEQ", 
  'N' "HIDDEN_FLAG", 
  '' "EFF_FROM_DT",
   '' "EFF_TO_DT",
task.SUBJECT_ID "SRC_SUBJECT_ID",
task.SUBJECT_ID "TGT_SUBJECT_ID"
from 
  OPB_SESSION sess, 
  OPB_TASK task,
  OPB_SHORTCUT shcut
where 
  task.TASK_TYPE = 68 and 
  sess.SESSION_ID = task.TASK_ID and 
  sess.VERSION_NUMBER = task.VERSION_NUMBER and 
  task.IS_VISIBLE = 1 and
  task.IS_REUSABLE = 1 and
  sess.MAPPING_ID < 0  and
  sess.MAPPING_ID = shcut.OBJECT_ID and
  task.SUBJECT_ID = shcut.SUBJECT_ID and  
  shcut.OBJECT_TYPE = 21 AND  
  shcut.REFERENCE_TYPE = 2 and 
  shcut.IS_VISIBLE = 1
UNION ALL
SELECT 
  ' ' "REPOSITORY_ID",
  'com.informatica.powercenter.process.SessionTaskInstance' "FROM_CLASS_ID",
  'TASK_INSTANCE_Session_'+
         LTRIM(str(taskinst.INSTANCE_ID)) "FROM_ELEMENT_ID",
  ' ' "FROM_REPO_ID",
  'com.informatica.powercenter.map.MappingShortcut' "TO_CLASS_ID", 
  'SHORTCUT_TO_' + 'PC_' + shcut.REPOSITORY_NAME + '_Mapping_'+ ltrim(str(task.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str((sess.MAPPING_ID + 2147483649))) "TO_ELEMENT_ID", 
  ' ' "TO_REPO_ID",
  'org.omg.cwm.analysis.transformation.TransformationTaskElement' "ASSOCIATION_ID",
  1 "ASSOCIATION_SEQ",
  'N' "HIDDEN_FLAG",
  '' "EFF_FROM_DT",
  '' "EFF_TO_DT",
  task.SUBJECT_ID "SRC_SUBJECT_ID",
task.SUBJECT_ID "TGT_SUBJECT_ID"
FROM 
  OPB_SESSION sess,
  OPB_TASK task,
  OPB_TASK_INST taskinst,
  OPB_SHORTCUT shcut, 
  OPB_TASK wkflow_or_wklet
WHERE 
  sess.SESSION_ID = task.TASK_ID AND 
  sess.VERSION_NUMBER = task.VERSION_NUMBER AND 
  task.IS_VISIBLE = 1 AND
  taskinst.TASK_ID = task.TASK_ID AND 
  taskinst.WORKFLOW_ID = wkflow_or_wklet.TASK_ID AND 
  taskinst.VERSION_NUMBER = wkflow_or_wklet.VERSION_NUMBER and 
  wkflow_or_wklet.TASK_TYPE IN (70,71) AND 
  wkflow_or_wklet.IS_VISIBLE = 1 AND
  taskinst.TASK_TYPE = 68 AND
  sess.MAPPING_ID < 0 AND
  sess.MAPPING_ID = shcut.OBJECT_ID and
  task.SUBJECT_ID = shcut.SUBJECT_ID and  
  shcut.OBJECT_TYPE = 21 AND  
  shcut.REFERENCE_TYPE = 2 AND 
  shcut.IS_VISIBLE = 1
GO
