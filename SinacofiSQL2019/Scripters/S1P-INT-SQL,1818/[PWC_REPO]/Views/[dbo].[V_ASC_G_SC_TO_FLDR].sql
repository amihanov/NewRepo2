SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ASC_G_SC_TO_FLDR]') IS NULL EXEC('CREATE VIEW [dbo].[V_ASC_G_SC_TO_FLDR] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ASC_G_SC_TO_FLDR]
AS 
select ' ' "REPOSITORY_ID",
	  'com.informatica.powercenter.package.Folder' "FROM_CLASS_ID", 
       'Folder' +'_'+ltrim(str(subj.SUBJ_ID)) "FROM_ELEMENT_ID",  
' '  "FROM_REPO_ID", 
'com.informatica.powercenter.map.MappingShortcut' "TO_CLASS_ID", 
       'SHORTCUT_TO_PC_' +  shcut.REPOSITORY_NAME+'_Mapping_'+ ltrim(str(shcut.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str(shcut.OBJECT_ID + 2147483649)) "TO_ELEMENT_ID",
' ' "TO_REPO_ID", 
	   'org.omg.cwm.objectmodel.core.ElementOwnership' "ASSOCIATION_ID",
	    1 "ASSOCIATION_SEQ", 
         'N' "HIDDEN_FLAG", 
	   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
subj.SUBJ_ID "SRC_SUBJECT_ID",
subj.SUBJ_ID "TGT_SUBJECT_ID"
       from 
OPB_SHORTCUT shcut, 
OPB_SUBJECT subj
where 
shcut.OBJECT_ID < 0 
and shcut.OBJECT_TYPE = 21
and subj.SUBJ_ID = shcut.SUBJECT_ID
and shcut.IS_VISIBLE = 1
UNION ALL
select ' ' "REPOSITORY_ID",
	  'com.informatica.powercenter.package.Folder' "FROM_CLASS_ID", 
       'Folder'+'_'+ltrim(str(subj.SUBJ_ID)) "FROM_ELEMENT_ID",  
' ' "FROM_REPO_ID", 
'com.informatica.powercenter.map.'+REPLACE(otype.OBJECT_TYPE_NAME,' ','')+'Shortcut' "TO_CLASS_ID", 
       'SHORTCUT_TO_PC_' +  shcut.REPOSITORY_NAME+'_'+otype.OBJECT_TYPE_NAME +'_'+ ltrim(str(shcut.SUBJECT_ID))+ '_' + ltrim(str(shcut.VERSION_ID)) + '_' + ltrim(str(shcut.OBJECT_ID + 2147483649)) "TO_ELEMENT_ID",
' ' "TO_REPO_ID", 
	   'org.omg.cwm.objectmodel.core.ElementOwnership' "ASSOCIATION_ID",
	    1 "ASSOCIATION_SEQ", 
         'N' "HIDDEN_FLAG", 
	   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
subj.SUBJ_ID "SRC_SUBJECT_ID",
subj.SUBJ_ID "TGT_SUBJECT_ID"
    FROM
OPB_SHORTCUT shcut, 
OPB_OBJECT_TYPE otype, 
OPB_SUBJECT subj
WHERE
shcut.OBJECT_SUBTYPE = otype.OBJECT_TYPE_ID  
and shcut.OBJECT_ID < 0 
and shcut.OBJECT_TYPE <> 22
and subj.SUBJ_ID = shcut.SUBJECT_ID
and shcut.IS_VISIBLE = 1
GO
