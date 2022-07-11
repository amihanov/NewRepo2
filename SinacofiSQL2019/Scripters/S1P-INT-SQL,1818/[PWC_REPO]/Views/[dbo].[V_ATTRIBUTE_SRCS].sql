SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ATTRIBUTE_SRCS]') IS NULL EXEC('CREATE VIEW [dbo].[V_ATTRIBUTE_SRCS] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ATTRIBUTE_SRCS]
AS 
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition' + '_' + ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 att.ATTR_NAME "ELMNT_ATTR_NAME", attrval.ATTR_VALUE  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
      from OPB_WIDGET_ATTR attrval, OPB_ATTR att, OPB_SRC src
	  where 
	  src.SRC_ID = attrval.WIDGET_ID and src.VERSION_NUMBER = attrval.VERSION_NUMBER
and src.IS_VISIBLE = 1
and	    attrval.WIDGET_TYPE = 1 and
			att.ATTR_ID = attrval.ATTR_ID and
			att.OBJECT_TYPE_ID = 1 and 
      attrval.MAPPING_ID = 0 and attrval.INSTANCE_ID = 0
      and attrval.SESSION_ID = 0 and
			attrval.PARTITION_ID = 0 and
			attrval.SESSION_TASK_ID = 0 and attrval.LINE_NO = 1 and
			att.ATTR_ID NOT IN (4, 13, 7, 14, 3, 15, 11, 16)
UNION ALL
SELECT  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition' +'_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'DATABASE_TYPE' "ELMNT_ATTR_NAME", mtype.DBTYPE_NAME  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
    FROM OPB_SRC src, 
         OPB_DBD dbd, OPB_MMD_DBTYPE mtype
	WHERE 
	      dbd.DBDID = src.DBDID AND src.VERSION_NUMBER = dbd.VERSION_NUMBER
AND src.IS_VISIBLE = 1
AND		  mtype.DBTYPE_ID = dbd.DBTYPE
UNION ALL
SELECT  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition' +'_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'DBD_NAME' "ELMNT_ATTR_NAME", dbd.DBDNAM  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
    FROM OPB_SRC src, 
         OPB_DBD dbd
	WHERE 
	      dbd.DBDID = src.DBDID AND src.VERSION_NUMBER = dbd.VERSION_NUMBER
AND src.IS_VISIBLE = 1
UNION ALL
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'flatFileType' "ELMNT_ATTR_NAME", 
	 CASE WHEN FILE_PROPERTIES & 128 = 128 THEN 'Delimited' ELSE 'Fixed width' END   "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
      from   OPB_SRC src,
			 OPB_FILE_DESC fdesc
	  where  
	  src.SUBJ_ID = fdesc.SUBJECT_ID and
      src.FILE_ID = fdesc.FILE_ID and 
	  src.VERSION_NUMBER = fdesc.VERSION_NUMBER	and 
	  src.IS_VISIBLE = 1 
UNION ALL
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'delimiters' "ELMNT_ATTR_NAME", 
	  STR_DELIMITER   "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
      from   OPB_SRC src,
			 OPB_FILE_DESC fdesc
	  where  
	  src.SUBJ_ID = fdesc.SUBJECT_ID and
      src.FILE_ID = fdesc.FILE_ID and 
	  src.VERSION_NUMBER = fdesc.VERSION_NUMBER	and 
	  src.IS_VISIBLE = 1  AND
	  FILE_PROPERTIES & 128= 128
UNION ALL
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'treatConsecutiveDelimitersAsOne' "ELMNT_ATTR_NAME", 
	  CASE WHEN FILE_PROPERTIES & 2= 2 THEN 'Yes' ELSE 'No' END   "ELMNT_ATTR_VALUE",
      ''  "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
      from   OPB_SRC src,
			 OPB_FILE_DESC fdesc
	  where  
	  src.SUBJ_ID = fdesc.SUBJECT_ID and
      src.FILE_ID = fdesc.FILE_ID and 
	  src.VERSION_NUMBER = fdesc.VERSION_NUMBER	and 
	  src.IS_VISIBLE = 1  AND
	  FILE_PROPERTIES & 128= 128
UNION ALL
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'optionalQuotes' "ELMNT_ATTR_NAME", 
	  CASE OPT_QUOTES WHEN 1 THEN 'Single' WHEN 2 THEN 'Double' ELSE 'None' END   "ELMNT_ATTR_VALUE",
      ''  "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
      from   OPB_SRC src,
			 OPB_FILE_DESC fdesc
	  where  
	  src.SUBJ_ID = fdesc.SUBJECT_ID and
      src.FILE_ID = fdesc.FILE_ID and 
	  src.VERSION_NUMBER = fdesc.VERSION_NUMBER	and 
	  src.IS_VISIBLE = 1  AND
	  FILE_PROPERTIES & 128= 128
UNION ALL
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'removeEscapeCharFromData' "ELMNT_ATTR_NAME", 
	  CASE WHEN FILE_PROPERTIES & 32 = 32 THEN 'No' ELSE 'Yes' END   "ELMNT_ATTR_VALUE",
      ''  "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
      from   OPB_SRC src,
			 OPB_FILE_DESC fdesc
	  where  
	  src.SUBJ_ID = fdesc.SUBJECT_ID and
      src.FILE_ID = fdesc.FILE_ID and 
	  src.VERSION_NUMBER = fdesc.VERSION_NUMBER	and 
	  src.IS_VISIBLE = 1  AND
	  FILE_PROPERTIES & 128= 128
UNION ALL
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'numOfInitialRowsToSkip' "ELMNT_ATTR_NAME", 
	  str(ROWS_TO_SKIP)  "ELMNT_ATTR_VALUE",
      ''  "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
      from   OPB_SRC src,
	 OPB_FILE_DESC fdesc
	  where  
	  src.SUBJ_ID = fdesc.SUBJECT_ID and
	  src.FILE_ID = fdesc.FILE_ID and 
	  src.VERSION_NUMBER = fdesc.VERSION_NUMBER	and 
	  src.IS_VISIBLE = 1 
UNION ALL
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'nullCharTextOrBinary' "ELMNT_ATTR_NAME", 
	  CASE WHEN FILE_PROPERTIES & 1 = 1 THEN 'Binary' ELSE 'Text' END   "ELMNT_ATTR_VALUE",
      ''  "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
      from   OPB_SRC src,
	 OPB_FILE_DESC fdesc
	  where  
	  src.SUBJ_ID = fdesc.SUBJECT_ID and
      src.FILE_ID = fdesc.FILE_ID and 
	  src.VERSION_NUMBER = fdesc.VERSION_NUMBER	and 
	  src.IS_VISIBLE = 1    AND
	  FILE_PROPERTIES & 128= 0
UNION ALL
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'repeatNullChars' "ELMNT_ATTR_NAME", 
	  CASE WHEN FILE_PROPERTIES & 64 = 64 THEN 'Yes' ELSE 'No' END   "ELMNT_ATTR_VALUE",
      ''  "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
      from   OPB_SRC src,
	 OPB_FILE_DESC fdesc
	  where  
	  src.SUBJ_ID = fdesc.SUBJECT_ID and
      src.FILE_ID = fdesc.FILE_ID and 
	  src.VERSION_NUMBER = fdesc.VERSION_NUMBER	and 
	  src.IS_VISIBLE = 1    AND
	  FILE_PROPERTIES & 128= 0
UNION ALL
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'fileFormatLineSequential' "ELMNT_ATTR_NAME", 
	  CASE WHEN FILE_PROPERTIES & 256 = 256 THEN 'Yes' ELSE 'No' END   "ELMNT_ATTR_VALUE",
      ''  "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
      from   OPB_SRC src,
	 OPB_FILE_DESC fdesc
	  where  
	  src.SUBJ_ID = fdesc.SUBJECT_ID and
      src.FILE_ID = fdesc.FILE_ID and 
	  src.VERSION_NUMBER = fdesc.VERSION_NUMBER	and 
	  src.IS_VISIBLE = 1    AND
	  FILE_PROPERTIES & 128= 0
UNION ALL
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'bytesToSkipBetweenRecs' "ELMNT_ATTR_NAME", 
	  str(NUM_OF_PAD_BYTES)  "ELMNT_ATTR_VALUE",
      ''  "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
      from   OPB_SRC src,
	 OPB_FILE_DESC fdesc
	  where  
	  src.SUBJ_ID = fdesc.SUBJECT_ID and
      src.FILE_ID = fdesc.FILE_ID and 
	  src.VERSION_NUMBER = fdesc.VERSION_NUMBER	and 
	  src.IS_VISIBLE = 1    AND
	  FILE_PROPERTIES & 128= 0
UNION ALL
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'stripTrailingBlanks' "ELMNT_ATTR_NAME", 
	 CASE WHEN FILE_PROPERTIES & 16 = 16 THEN 'Yes' ELSE 'No' END   "ELMNT_ATTR_VALUE",
      ''  "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
      from   OPB_SRC src,
	 OPB_FILE_DESC fdesc
	  where  
	  src.SUBJ_ID = fdesc.SUBJECT_ID and
      src.FILE_ID = fdesc.FILE_ID and 
	  src.VERSION_NUMBER = fdesc.VERSION_NUMBER	and 
	  src.IS_VISIBLE = 1    AND
	  FILE_PROPERTIES & 128= 0
UNION ALL
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.SourceDefinition' "ELEMENT_CLASS_ID", 
'Source Definition_'+ ltrim(str(src.SRC_ID)) "ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 'userDefinedShiftState' "ELMNT_ATTR_NAME", 
	 CASE WHEN FILE_PROPERTIES & 512 = 512 THEN 'Yes' ELSE 'No' END   "ELMNT_ATTR_VALUE",
      ''  "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", src.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
	   src.SUBJ_ID "SUBJECT_ID"
      from   OPB_SRC src,
	 OPB_FILE_DESC fdesc
	  where  
	  src.SUBJ_ID = fdesc.SUBJECT_ID and
      src.FILE_ID = fdesc.FILE_ID and 
	  src.VERSION_NUMBER = fdesc.VERSION_NUMBER	and 
	  src.IS_VISIBLE = 1    AND
	  FILE_PROPERTIES & 128= 0
GO
