SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ATTRIBUTE_WDGT]') IS NULL EXEC('CREATE VIEW [dbo].[V_ATTRIBUTE_WDGT] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ATTRIBUTE_WDGT]
AS 
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','') "ELEMENT_CLASS_ID", 
otype.OBJECT_TYPE_NAME + '_' + ltrim(str(widgets.WIDGET_ID))"ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 CASE WHEN att.OBJECT_TYPE_ID = 11 THEN
	 (CASE WHEN att.ATTR_ID = 6 THEN 'Location Information'
	 ELSE CASE WHEN att.ATTR_ID = 17 THEN 'Recache from Database' 
	 ELSE att.ATTR_NAME END END) ELSE att.ATTR_NAME END "ELMNT_ATTR_NAME", 
       CASE WHEN att.OBJECT_TYPE_ID=97 THEN
	(CASE WHEN att.ATTR_ID=5 THEN 
	CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Locally' WHEN 2 THEN 
	'Across Grid' WHEN 0 THEN 'No' END
	ELSE CASE WHEN att.ATTR_ID IN (15,16) THEN
	 CASE WHEN  convert(varchar(4000),attrval.ATTR_VALUE) = 1 THEN 'Yes' ELSE 'No' END
	ELSE CASE WHEN att.ATTR_ID=13 THEN 
	CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 0 THEN 'Java' WHEN 1 THEN 
	'C++' WHEN 2 THEN 'C' END
	ELSE attrval.ATTR_VALUE END END END) 
	ELSE CASE WHEN (att.OBJECT_TYPE_ID=84 AND att.ATTR_ID IN (2,3)) OR (att.OBJECT_TYPE_ID=11 AND att.ATTR_ID=27) or
	(att.OBJECT_TYPE_ID=3 AND att.ATTR_ID=10) OR (att.OBJECT_TYPE_ID=56 AND att.ATTR_ID=6) or
	(att.OBJECT_TYPE_ID=8 AND att.ATTR_ID=10) or (att.OBJECT_TYPE_ID=6 AND att.ATTR_ID=9)
	THEN 
 	CASE WHEN  convert(varchar(4000),attrval.ATTR_VALUE) = 1 THEN 'Yes' ELSE 'No' END
	ELSE CASE WHEN att.OBJECT_TYPE_ID=8 AND att.ATTR_ID=7 THEN 
	CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Locally' WHEN 2 THEN 
	'Across Grid' WHEN 0 THEN 'No' END 
	ELSE CASE WHEN att.OBJECT_TYPE_ID=3 AND att.ATTR_ID=11 THEN 
		CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Always' ELSE 
	'Never' END 
	ELSE CASE WHEN (att.OBJECT_TYPE_ID=8 AND att.ATTR_ID=9) OR (att.OBJECT_TYPE_ID=6 AND att.ATTR_ID=8) THEN 
		'Based On Input Order'   
	ELSE CASE WHEN att.OBJECT_TYPE_ID=11 AND att.ATTR_ID=29 THEN 
		CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Always Allowed' WHEN 2 THEN 'Always Disallowed' 
	WHEN 0 THEN 'Auto' END 
	ELSE CASE WHEN att.OBJECT_TYPE_ID=12 AND att.ATTR_ID=16 THEN 
		CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Descending' WHEN 2 THEN 'Ascending'	END 
	ELSE attrval.ATTR_VALUE END END END END END END END "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", widgets.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
     widgets.SUBJECT_ID "SUBJECT_ID"
      from OPB_WIDGET_ATTR attrval, OPB_OBJECT_TYPE otype, OPB_ATTR att, OPB_WIDGET widgets
	  where widgets.WIDGET_ID = attrval.WIDGET_ID and widgets.VERSION_NUMBER = attrval.VERSION_NUMBER
and widgets.IS_VISIBLE = 1
and	        widgets.WIDGET_TYPE = attrval.WIDGET_TYPE and
			widgets.IS_REUSABLE = 1  and
	        otype.OBJECT_TYPE_ID = widgets.WIDGET_TYPE and
			att.ATTR_ID = attrval.ATTR_ID and
			att.OBJECT_TYPE_ID = widgets.WIDGET_TYPE and
			attrval.MAPPING_ID = 0 and attrval.INSTANCE_ID = 0 and attrval.SESSION_ID = 0 and
			attrval.PARTITION_ID = 0 and
			attrval.SESSION_TASK_ID = 0 and attrval.LINE_NO = 1 and
	(widgets.WIDGET_TYPE != 45 OR 
	(widgets.WIDGET_TYPE = 45 and 
	att.ATTR_ID NOT IN (5, 16, 3, 4, 17, 6, 19, 8, 20)))and not exists
	( select 'x' from OPB_WIDGET_ATTR attrval1 where 
	attrval.ATTR_ID         = attrval1.ATTR_ID and
	attrval.INSTANCE_ID     = attrval1.INSTANCE_ID and
	attrval.SESSION_TASK_ID = attrval1.SESSION_TASK_ID and
	attrval.WIDGET_ID       = attrval1.WIDGET_ID and
   	attrval.VERSION_NUMBER = attrval1.VERSION_NUMBER and	
	attrval.WIDGET_TYPE     = attrval1.WIDGET_TYPE and
	attrval.MAPPING_ID = attrval1.MAPPING_ID and
	attrval1.LINE_NO        = 2
)
UNION ALL
select  '' "REPOSITORY_ID", 
'com.informatica.powercenter.map.' + REPLACE(otype.OBJECT_TYPE_NAME,' ','') "ELEMENT_CLASS_ID", 
otype.OBJECT_TYPE_NAME + '_' + ltrim(str(widgets.WIDGET_ID))"ELEMENT_ID", 
	 'GLOBAL' "SCOPE_TYPE", 
	 CASE WHEN att.OBJECT_TYPE_ID = 11 THEN
	 (CASE WHEN att.ATTR_ID = 6 THEN 'Location Information'
	 ELSE CASE WHEN att.ATTR_ID = 17 THEN 'Recache from Database' 
	 ELSE att.ATTR_NAME END END) ELSE att.ATTR_NAME END "ELMNT_ATTR_NAME", 
       CASE WHEN att.OBJECT_TYPE_ID=97 THEN
	(CASE WHEN att.ATTR_ID=5 THEN 
	CASE convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000))) ) WHEN 1 THEN 'Locally' WHEN 2 THEN 
	'Across Grid' WHEN 0 THEN 'No' END
	ELSE CASE WHEN att.ATTR_ID IN (15,16) THEN
	 CASE WHEN  convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) = 1 THEN 'Yes' ELSE 'No' END
	ELSE CASE WHEN att.ATTR_ID=13 THEN 
	CASE convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) WHEN 0 THEN 'Java' WHEN 1 THEN 
	'C++' WHEN 2 THEN 'C' END
	ELSE (CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000))) END END END) 
	ELSE CASE WHEN (att.OBJECT_TYPE_ID=84 AND att.ATTR_ID IN (2,3)) OR (att.OBJECT_TYPE_ID=11 AND att.ATTR_ID=27) or
	(att.OBJECT_TYPE_ID=3 AND att.ATTR_ID=10) OR (att.OBJECT_TYPE_ID=56 AND att.ATTR_ID=6)
	THEN 
 	CASE WHEN  convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) = 1 THEN 'Yes' ELSE 'No' END
	ELSE CASE WHEN att.OBJECT_TYPE_ID=8 AND att.ATTR_ID=7 THEN 
	CASE convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) WHEN 1 THEN 'Locally' WHEN 2 THEN 
	'Across Grid' WHEN 0 THEN 'No' END 
	ELSE CASE WHEN att.OBJECT_TYPE_ID=3 AND att.ATTR_ID=11 THEN 
		CASE convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) WHEN 1 THEN 'Always' ELSE 
	'Never' END 
	ELSE (CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000))) END END END END "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
	 '' "SRC_CREATE_DT", widgets.LAST_SAVED "SRC_UPDATE_DT",
	 ''  "EFF_FROM_DT",  '' "EFF_TO_DT",
     widgets.SUBJECT_ID "SUBJECT_ID"
      from OPB_WIDGET_ATTR attrval, 
	OPB_WIDGET_ATTR attrval1,OPB_OBJECT_TYPE otype, OPB_ATTR att, OPB_WIDGET widgets
	  where widgets.WIDGET_ID = attrval.WIDGET_ID and widgets.VERSION_NUMBER = attrval.VERSION_NUMBER
and widgets.IS_VISIBLE = 1
and	        widgets.WIDGET_TYPE = attrval.WIDGET_TYPE and
			widgets.IS_REUSABLE = 1  and
	        otype.OBJECT_TYPE_ID = widgets.WIDGET_TYPE and
			att.ATTR_ID = attrval.ATTR_ID and
			att.OBJECT_TYPE_ID = widgets.WIDGET_TYPE and
			attrval.MAPPING_ID = 0 and attrval.INSTANCE_ID = 0 and attrval.SESSION_ID = 0 and
			attrval.PARTITION_ID = 0 and
			attrval.SESSION_TASK_ID = 0 and attrval.LINE_NO = 1 and
	(widgets.WIDGET_TYPE != 45 OR 
	(widgets.WIDGET_TYPE = 45 and 
	att.ATTR_ID NOT IN (5, 16, 3, 4, 17, 6, 19, 8, 20)))and	
	attrval.ATTR_ID         =  attrval1.ATTR_ID and
	attrval.INSTANCE_ID     =  attrval1.INSTANCE_ID and
	attrval.SESSION_TASK_ID =  attrval1.SESSION_TASK_ID and
	attrval.WIDGET_ID       =  attrval1.WIDGET_ID and
   	attrval.VERSION_NUMBER = attrval1.VERSION_NUMBER and	
	attrval.WIDGET_TYPE     =  attrval1.WIDGET_TYPE and
	attrval.MAPPING_ID = attrval1.MAPPING_ID and
	attrval1.LINE_NO        =  2	
UNION ALL
select 
	'' "REPOSITORY_ID", 
	'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+ 'Instance' "ELEMENT_CLASS_ID", 
	'WIDGET_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + 
	ltrim(str(winst.MAPPING_ID)) + '_' + 
	ltrim(str(winst.INSTANCE_ID)) "ELEMENT_ID", 
	'GLOBAL' "SCOPE_TYPE", 
	 CASE WHEN att.OBJECT_TYPE_ID = 11 THEN
	 (CASE WHEN att.ATTR_ID = 6 THEN 'Location Information'
	 ELSE CASE WHEN att.ATTR_ID = 17 THEN 'Recache from Database' 
	 ELSE att.ATTR_NAME END END) ELSE att.ATTR_NAME END "ELMNT_ATTR_NAME", 
	 CASE WHEN att.OBJECT_TYPE_ID=97 THEN
	(CASE WHEN att.ATTR_ID=5 THEN 
	CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Locally' WHEN 2 THEN 
	'Across Grid' WHEN 0 THEN 'No' END
	ELSE CASE WHEN att.ATTR_ID IN (15,16) THEN
	 CASE WHEN  convert(varchar(4000),attrval.ATTR_VALUE) = 1 THEN 'Yes' ELSE 'No' END
	ELSE CASE WHEN att.ATTR_ID=13 THEN 
	CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 0 THEN 'Java' WHEN 1 THEN 
	'C++' WHEN 2 THEN 'C' END
	ELSE attrval.ATTR_VALUE END END END) 
	ELSE CASE WHEN (att.OBJECT_TYPE_ID=84 AND att.ATTR_ID IN (2,3)) OR (att.OBJECT_TYPE_ID=11 AND att.ATTR_ID=27) or
	(att.OBJECT_TYPE_ID=3 AND att.ATTR_ID=10) OR (att.OBJECT_TYPE_ID=56 AND att.ATTR_ID=6) OR
	(att.OBJECT_TYPE_ID=8 AND att.ATTR_ID=10) or (att.OBJECT_TYPE_ID=6 AND att.ATTR_ID=9)
	THEN 
 	CASE WHEN  convert(varchar(4000),attrval.ATTR_VALUE) = 1 THEN 'Yes' ELSE 'No' END
	ELSE CASE WHEN att.OBJECT_TYPE_ID=8 AND att.ATTR_ID=7 THEN 
	CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Locally' WHEN 2 THEN 
	'Across Grid' WHEN 0 THEN 'No' END 
	ELSE CASE WHEN att.OBJECT_TYPE_ID=3 AND att.ATTR_ID=11 THEN 
			CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Always' ELSE 
	'Never' END 
	ELSE CASE WHEN att.OBJECT_TYPE_ID=11 AND att.ATTR_ID=29 THEN 
		CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Always Allowed' WHEN 2 THEN 'Always Disallowed' 
	WHEN 0 THEN 'Auto' END 
	ELSE CASE WHEN (att.OBJECT_TYPE_ID=8 AND att.ATTR_ID=9) OR (att.OBJECT_TYPE_ID=6 AND att.ATTR_ID=8) THEN 
		'Based On Input Order'  
	ELSE CASE WHEN att.OBJECT_TYPE_ID=12 AND att.ATTR_ID=16 THEN 
		CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Descending' WHEN 2 THEN 'Ascending'	END 
	ELSE attrval.ATTR_VALUE END END END END END END END "ELMNT_ATTR_VALUE",
	'' "ELMNT_ATTR_DESC", 
	'' "DATA_TYPE", 
	'' "SRC_CREATE_DT", 
	map.LAST_SAVED "SRC_UPDATE_DT", 
	''  "EFF_FROM_DT", 
	''  "EFF_TO_DT" ,
        widgets.SUBJECT_ID "SUBJECT_ID"
from 
	OPB_WIDGET_ATTR attrval, 
	OPB_OBJECT_TYPE otype, 
	OPB_ATTR att, 
	OPB_MAPPING map,
	OPB_WIDGET widgets, 
	OPB_WIDGET_INST winst 
where 
	widgets.WIDGET_ID = attrval.WIDGET_ID and 
	widgets.WIDGET_TYPE = attrval.WIDGET_TYPE and 
	widgets.VERSION_NUMBER = attrval.VERSION_NUMBER and
	widgets.IS_VISIBLE = 1 and	
	winst.WIDGET_ID = widgets.WIDGET_ID and 
	winst.MAPPING_ID = map.MAPPING_ID and 
	attrval.MAPPING_ID = 0 AND 
	widgets.IS_REUSABLE = 0  AND
	winst.WIDGET_TYPE = widgets.WIDGET_TYPE and 
	otype.OBJECT_TYPE_ID = widgets.WIDGET_TYPE and 
	att.ATTR_ID = attrval.ATTR_ID and 
	att.OBJECT_TYPE_ID = widgets.WIDGET_TYPE and 
	attrval.LINE_NO = 1 and 
	(widgets.WIDGET_TYPE != 45 OR 
	(widgets.WIDGET_TYPE = 45 and 
	att.ATTR_ID NOT IN (5, 16, 3, 4, 17, 6, 19, 8, 20))) and 
	map.VERSION_NUMBER = winst.VERSION_NUMBER  and 
	map.IS_VISIBLE = 1	and not exists
	( select 'x' from OPB_WIDGET_ATTR attrval1 where 
	attrval.ATTR_ID         = attrval1.ATTR_ID and
	attrval.INSTANCE_ID     = attrval1.INSTANCE_ID and
	attrval.SESSION_TASK_ID = attrval1.SESSION_TASK_ID and
	attrval.WIDGET_ID       = attrval1.WIDGET_ID and
   	attrval.VERSION_NUMBER = attrval1.VERSION_NUMBER and	
	attrval.WIDGET_TYPE     = attrval1.WIDGET_TYPE and
	attrval.MAPPING_ID = attrval1.MAPPING_ID and
	attrval1.LINE_NO        = 2
	)	
UNION ALL
select 
	'' "REPOSITORY_ID", 
	'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+ 'Instance' "ELEMENT_CLASS_ID", 
	'WIDGET_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + 
	ltrim(str(winst.MAPPING_ID)) + '_' + 
	ltrim(str(winst.INSTANCE_ID)) "ELEMENT_ID", 
	'GLOBAL' "SCOPE_TYPE", 
	 CASE WHEN att.OBJECT_TYPE_ID = 11 THEN
	 (CASE WHEN att.ATTR_ID = 6 THEN 'Location Information'
	 ELSE CASE WHEN att.ATTR_ID = 17 THEN 'Recache from Database' 
	 ELSE att.ATTR_NAME END END) ELSE att.ATTR_NAME END "ELMNT_ATTR_NAME", 
	 CASE WHEN att.OBJECT_TYPE_ID=97 THEN
	(CASE WHEN att.ATTR_ID=5 THEN 
	CASE convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) WHEN 1 THEN 'Locally' WHEN 2 THEN 
	'Across Grid' WHEN 0 THEN 'No' END
	ELSE CASE WHEN att.ATTR_ID IN (15,16) THEN
	 CASE WHEN  convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) = 1 THEN 'Yes' ELSE 'No' END
	ELSE CASE WHEN att.ATTR_ID=13 THEN 
	CASE convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) WHEN 0 THEN 'Java' WHEN 1 THEN 
	'C++' WHEN 2 THEN 'C' END
	ELSE (CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000))) END END END) 
	ELSE CASE WHEN (att.OBJECT_TYPE_ID=84 AND att.ATTR_ID IN (2,3)) OR (att.OBJECT_TYPE_ID=11 AND att.ATTR_ID=27) or
	(att.OBJECT_TYPE_ID=3 AND att.ATTR_ID=10) OR (att.OBJECT_TYPE_ID=56 AND att.ATTR_ID=6)
	THEN 
 	CASE WHEN  convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) = 1 THEN 'Yes' ELSE 'No' END
	ELSE CASE WHEN att.OBJECT_TYPE_ID=8 AND att.ATTR_ID=7 THEN 
	CASE convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) WHEN 1 THEN 'Locally' WHEN 2 THEN 
	'Across Grid' WHEN 0 THEN 'No' END 
	ELSE CASE WHEN att.OBJECT_TYPE_ID=3 AND att.ATTR_ID=11 THEN 
			CASE convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) WHEN 1 THEN 'Always' ELSE 
	'Never' END 
	ELSE (CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000))) END END END END "ELMNT_ATTR_VALUE", 
	'' "ELMNT_ATTR_DESC", 
	'' "DATA_TYPE", 
	'' "SRC_CREATE_DT", 
	map.LAST_SAVED "SRC_UPDATE_DT", 
	''  "EFF_FROM_DT", 
	''  "EFF_TO_DT" ,
        widgets.SUBJECT_ID "SUBJECT_ID"
from 
	OPB_WIDGET_ATTR attrval, 
	OPB_WIDGET_ATTR attrval1,
	OPB_OBJECT_TYPE otype, 
	OPB_ATTR att, 
	OPB_MAPPING map,
	OPB_WIDGET widgets, 
	OPB_WIDGET_INST winst 
where 
	widgets.WIDGET_ID = attrval.WIDGET_ID and 
	widgets.WIDGET_TYPE = attrval.WIDGET_TYPE and 
	widgets.VERSION_NUMBER = attrval.VERSION_NUMBER and
	widgets.IS_VISIBLE = 1 and	
	winst.WIDGET_ID = widgets.WIDGET_ID and 
	winst.MAPPING_ID = map.MAPPING_ID and 
	attrval.MAPPING_ID = 0 AND 
	widgets.IS_REUSABLE = 0  AND
	winst.WIDGET_TYPE = widgets.WIDGET_TYPE and 
	otype.OBJECT_TYPE_ID = widgets.WIDGET_TYPE and 
	att.ATTR_ID = attrval.ATTR_ID and 
	att.OBJECT_TYPE_ID = widgets.WIDGET_TYPE and 
	attrval.LINE_NO = 1 and 
	(widgets.WIDGET_TYPE != 45 OR 
	(widgets.WIDGET_TYPE = 45 and 
	att.ATTR_ID NOT IN (5, 16, 3, 4, 17, 6, 19, 8, 20))) and 
	map.VERSION_NUMBER = winst.VERSION_NUMBER  and 
	map.IS_VISIBLE = 1	and	
	attrval.ATTR_ID         =  attrval1.ATTR_ID and
	attrval.INSTANCE_ID     =  attrval1.INSTANCE_ID and
	attrval.SESSION_TASK_ID =  attrval1.SESSION_TASK_ID and
	attrval.WIDGET_ID       =  attrval1.WIDGET_ID and
   	attrval.VERSION_NUMBER = attrval1.VERSION_NUMBER and	
	attrval.WIDGET_TYPE     =  attrval1.WIDGET_TYPE and
	attrval.MAPPING_ID = attrval1.MAPPING_ID and
	attrval1.LINE_NO        =  2	
UNION ALL
select 
	'' "REPOSITORY_ID", 
	'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+ 'Instance' "ELEMENT_CLASS_ID", 
	'WIDGET_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + 
	ltrim(str(winst.MAPPING_ID)) + '_' + 
	ltrim(str(winst.INSTANCE_ID)) "ELEMENT_ID", 
	'GLOBAL' "SCOPE_TYPE", 
	 CASE WHEN att.OBJECT_TYPE_ID = 11 THEN
	 (CASE WHEN att.ATTR_ID = 6 THEN 'Location Information'
	 ELSE CASE WHEN att.ATTR_ID = 17 THEN 'Recache from Database' 
	 ELSE att.ATTR_NAME END END) ELSE att.ATTR_NAME END "ELMNT_ATTR_NAME", 
	 CASE WHEN att.OBJECT_TYPE_ID=97 THEN
	(CASE WHEN att.ATTR_ID=5 THEN 
	CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Locally' WHEN 2 THEN 
	'Across Grid' WHEN 0 THEN 'No' END
	ELSE CASE WHEN att.ATTR_ID IN (15,16) THEN
	 CASE WHEN  convert(varchar(4000),attrval.ATTR_VALUE) = 1 THEN 'Yes' ELSE 'No' END
	ELSE CASE WHEN att.ATTR_ID=13 THEN 
	CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 0 THEN 'Java' WHEN 1 THEN 
	'C++' WHEN 2 THEN 'C' END
	ELSE attrval.ATTR_VALUE END END END) 
	ELSE CASE WHEN (att.OBJECT_TYPE_ID=84 AND att.ATTR_ID IN (2,3)) OR (att.OBJECT_TYPE_ID=11 AND att.ATTR_ID=27) or
	(att.OBJECT_TYPE_ID=3 AND att.ATTR_ID=10) OR (att.OBJECT_TYPE_ID=56 AND att.ATTR_ID=6) OR
	(att.OBJECT_TYPE_ID=8 AND att.ATTR_ID=10) or (att.OBJECT_TYPE_ID=6 AND att.ATTR_ID=9)
	THEN 
 	CASE WHEN  convert(varchar(4000),attrval.ATTR_VALUE) = 1 THEN 'Yes' ELSE 'No' END
	ELSE CASE WHEN att.OBJECT_TYPE_ID=8 AND att.ATTR_ID=7 THEN 
	CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Locally' WHEN 2 THEN 
	'Across Grid' WHEN 0 THEN 'No' END 
	ELSE CASE WHEN att.OBJECT_TYPE_ID=3 AND att.ATTR_ID=11 THEN 
			CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Always' ELSE 
	'Never' END 
	ELSE CASE WHEN att.OBJECT_TYPE_ID=11 AND att.ATTR_ID=29 THEN 
		CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Always Allowed' WHEN 2 THEN 'Always Disallowed' 
	WHEN 0 THEN 'Auto' END 
	ELSE CASE WHEN (att.OBJECT_TYPE_ID=8 AND att.ATTR_ID=9) OR (att.OBJECT_TYPE_ID=6 AND att.ATTR_ID=8) THEN 
		'Based On Input Order'  
	ELSE CASE WHEN att.OBJECT_TYPE_ID=12 AND att.ATTR_ID=16 THEN 
		CASE convert(varchar(4000),attrval.ATTR_VALUE) WHEN 1 THEN 'Descending' WHEN 2 THEN 'Ascending'	END 
	ELSE attrval.ATTR_VALUE END END END END END END END "ELMNT_ATTR_VALUE",
	'' "ELMNT_ATTR_DESC", 
	'' "DATA_TYPE", 
	'' "SRC_CREATE_DT", 
	map.LAST_SAVED "SRC_UPDATE_DT", 
	''  "EFF_FROM_DT", 
	''  "EFF_TO_DT" ,
        map.SUBJECT_ID "SUBJECT_ID"
from 
	OPB_WIDGET_ATTR attrval, 
	OPB_OBJECT_TYPE otype, 
	OPB_ATTR att, 
	OPB_MAPPING map,
	OPB_WIDGET_INST winst 
where 
	winst.WIDGET_ID = attrval.WIDGET_ID and 
	winst.WIDGET_TYPE = attrval.WIDGET_TYPE and 
	winst.INSTANCE_ID = attrval.INSTANCE_ID and
	winst.MAPPING_ID = attrval.MAPPING_ID and
	winst.VERSION_NUMBER = attrval.VERSION_NUMBER and
	winst.MAPPING_ID = map.MAPPING_ID and 
	winst.VERSION_NUMBER = map.VERSION_NUMBER and
	map.IS_VISIBLE = 1 and	
	attrval.SESSION_ID = 0 AND
	attrval.SESSION_TASK_ID = 0 AND
	winst.WIDGET_TYPE = otype.OBJECT_TYPE_ID  and 
	att.ATTR_ID = attrval.ATTR_ID and 
	att.OBJECT_TYPE_ID = winst.WIDGET_TYPE and 
	attrval.LINE_NO = 1 and 
	(winst.WIDGET_TYPE != 45 OR 
	(winst.WIDGET_TYPE = 45 and 
	att.ATTR_ID NOT IN (5, 16, 3, 4, 17, 6, 19, 8, 20))) and 
	NOT EXISTS ( 
          SELECT 'x' 
            FROM OPB_WIDGET_ATTR attrval1 
           WHERE attrval.ATTR_ID = attrval1.ATTR_ID 
             AND attrval.INSTANCE_ID = attrval1.INSTANCE_ID 
             AND attrval.SESSION_TASK_ID = attrval1.SESSION_TASK_ID 
             AND attrval.WIDGET_ID = attrval1.WIDGET_ID 
   	     AND attrval.VERSION_NUMBER = attrval1.VERSION_NUMBER             
             AND attrval.WIDGET_TYPE = attrval1.WIDGET_TYPE 
             AND attrval.MAPPING_ID = attrval1.MAPPING_ID 
             AND attrval1.LINE_NO = 2) 
UNION ALL
select 
	'' "REPOSITORY_ID", 
	'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')+ 'Instance' "ELEMENT_CLASS_ID", 
	'WIDGET_INSTANCE_' + otype.OBJECT_TYPE_NAME + '_' + 
	ltrim(str(winst.MAPPING_ID)) + '_' + 
	ltrim(str(winst.INSTANCE_ID)) "ELEMENT_ID", 
	'GLOBAL' "SCOPE_TYPE", 
	 CASE WHEN att.OBJECT_TYPE_ID = 11 THEN
	 (CASE WHEN att.ATTR_ID = 6 THEN 'Location Information'
	 ELSE CASE WHEN att.ATTR_ID = 17 THEN 'Recache from Database' 
	 ELSE att.ATTR_NAME END END) ELSE att.ATTR_NAME END "ELMNT_ATTR_NAME", 
	 CASE WHEN att.OBJECT_TYPE_ID=97 THEN
	(CASE WHEN att.ATTR_ID=5 THEN 
	CASE convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) WHEN 1 THEN 'Locally' WHEN 2 THEN 
	'Across Grid' WHEN 0 THEN 'No' END
	ELSE CASE WHEN att.ATTR_ID IN (15,16) THEN
	 CASE WHEN  convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) = 1 THEN 'Yes' ELSE 'No' END
	ELSE CASE WHEN att.ATTR_ID=13 THEN 
	CASE convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) WHEN 0 THEN 'Java' WHEN 1 THEN 
	'C++' WHEN 2 THEN 'C' END
	ELSE (CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000))) END END END) 
	ELSE CASE WHEN (att.OBJECT_TYPE_ID=84 AND att.ATTR_ID IN (2,3)) OR (att.OBJECT_TYPE_ID=11 AND att.ATTR_ID=27) or
	(att.OBJECT_TYPE_ID=3 AND att.ATTR_ID=10) OR (att.OBJECT_TYPE_ID=56 AND att.ATTR_ID=6)
	THEN 
 	CASE WHEN  convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) = 1 THEN 'Yes' ELSE 'No' END
	ELSE CASE WHEN att.OBJECT_TYPE_ID=8 AND att.ATTR_ID=7 THEN 
	CASE convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) WHEN 1 THEN 'Locally' WHEN 2 THEN 
	'Across Grid' WHEN 0 THEN 'No' END 
	ELSE CASE WHEN att.OBJECT_TYPE_ID=3 AND att.ATTR_ID=11 THEN 
			CASE convert(varchar(4000),(CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000)))) WHEN 1 THEN 'Always' ELSE 
	'Never' END 
	ELSE (CAST(attrval.ATTR_VALUE AS VARCHAR(2000))+ CAST(attrval1.ATTR_VALUE AS VARCHAR(2000))) END END END END "ELMNT_ATTR_VALUE", 
	'' "ELMNT_ATTR_DESC", 
	'' "DATA_TYPE", 
	'' "SRC_CREATE_DT", 
	map.LAST_SAVED "SRC_UPDATE_DT", 
	''  "EFF_FROM_DT", 
	''  "EFF_TO_DT" ,
        map.SUBJECT_ID "SUBJECT_ID"
from 
	OPB_WIDGET_ATTR attrval, 
	OPB_WIDGET_ATTR attrval1,
	OPB_OBJECT_TYPE otype, 
	OPB_ATTR att, 
	OPB_MAPPING map,
	OPB_WIDGET_INST winst 
where 
	winst.WIDGET_ID = attrval.WIDGET_ID and 
	winst.WIDGET_TYPE = attrval.WIDGET_TYPE and 
	winst.INSTANCE_ID = attrval.INSTANCE_ID and
	winst.MAPPING_ID = attrval.MAPPING_ID and
	winst.VERSION_NUMBER = attrval.VERSION_NUMBER and
	winst.MAPPING_ID = map.MAPPING_ID and 
	winst.VERSION_NUMBER = map.VERSION_NUMBER and
	map.IS_VISIBLE = 1 and	
	attrval.SESSION_ID = 0 AND
	attrval.SESSION_TASK_ID = 0 AND 
	winst.WIDGET_TYPE = otype.OBJECT_TYPE_ID and 
	att.ATTR_ID = attrval.ATTR_ID and 
	att.OBJECT_TYPE_ID = winst.WIDGET_TYPE and 
	attrval.LINE_NO = 1 and 
   	attrval.ATTR_ID = attrval1.ATTR_ID AND 
   	attrval.INSTANCE_ID = attrval1.INSTANCE_ID AND
   	attrval.SESSION_TASK_ID = attrval1.SESSION_TASK_ID AND 
   	attrval.WIDGET_ID = attrval1.WIDGET_ID AND 
   	attrval.VERSION_NUMBER = attrval1.VERSION_NUMBER and   	
   	attrval.WIDGET_TYPE = attrval1.WIDGET_TYPE AND 
   	attrval.MAPPING_ID = attrval1.MAPPING_ID and
   	attrval1.LINE_NO = 2
GO
