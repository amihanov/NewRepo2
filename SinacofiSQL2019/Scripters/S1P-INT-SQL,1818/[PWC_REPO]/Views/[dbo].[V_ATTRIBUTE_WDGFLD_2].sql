SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ATTRIBUTE_WDGFLD_2]') IS NULL EXEC('CREATE VIEW [dbo].[V_ATTRIBUTE_WDGFLD_2] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ATTRIBUTE_WDGFLD_2]
AS
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','') + 'Port' "ELEMENT_CLASS_ID", 
       otype.OBJECT_TYPE_NAME + '_' + 'Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'GROUP_NAME' "ELMNT_ATTR_NAME",
       tgrp.ATTR_VALUE  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
       ''  "EFF_FROM_DT",
       '' "EFF_TO_DT",
       wdg.SUBJECT_ID "SUBJECT_ID"
FROM OPB_WIDGET wdg,
     OPB_WIDGET_FIELD wdgfld,
     OPB_OBJECT_TYPE otype,
     OPB_TABLE_GROUP tgrp
WHERE wdg.WIDGET_TYPE = otype.OBJECT_TYPE_ID AND
      wdg.WIDGET_ID = wdgfld.WIDGET_ID AND wdg.VERSION_NUMBER = wdgfld.VERSION_NUMBER
AND wdg.IS_VISIBLE = 1
AND wdgfld.WIDGET_ID = tgrp.OBJECT_ID AND
      wdgfld.GROUP_ID= tgrp.GROUP_ID AND wdgfld.VERSION_NUMBER = tgrp.VERSION_NUMBER AND
      tgrp.OBJECT_TYPE = wdg.WIDGET_TYPE AND
      tgrp.ATTR_ID = 1 
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')  + 'Port' "ELEMENT_CLASS_ID", 
       otype.OBJECT_TYPE_NAME + '_' + 'Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'portType' "ELMNT_ATTR_NAME",
       CASE WHEN wdgfld.PORTTYPE = 1 THEN 'Input Port'
        WHEN wdgfld.PORTTYPE = 2 THEN 'Output Port' 
        WHEN wdgfld.PORTTYPE = 3 THEN 'Input Output Port'  
        WHEN wdgfld.PORTTYPE = 6 THEN 'Return Port' 
        WHEN wdgfld.PORTTYPE = 7 THEN 'Input Return Port' 
        WHEN wdgfld.PORTTYPE = 8 THEN 'Lookup Port'
        WHEN wdgfld.PORTTYPE = 10 THEN 'Output Lookup Port'
        WHEN wdgfld.PORTTYPE = 14 THEN 'Lookup Return Port' 
        WHEN wdgfld.PORTTYPE = 32 THEN 'Variable Port' 
        WHEN wdgfld.PORTTYPE = 65 THEN 'Input Port and Master Detail Port' 
        WHEN wdgfld.PORTTYPE = 67 THEN 'Input Port, Output Port and Master Detail Port' 
        WHEN wdgfld.PORTTYPE = 130 THEN 'Output Port and Generated Key Port' 
        WHEN wdgfld.PORTTYPE = 258 THEN 'Output Port and Generated Column ID Port' 
        WHEN wdgfld.PORTTYPE = 515 THEN 'Input Port, Output Port and Message ID Port' 
        WHEN wdgfld.PORTTYPE = 1027 THEN 'Input Port, Output Port and Message Data Port' 
        WHEN wdgfld.PORTTYPE = 2050 THEN 'Dynamic Lookup Port' 
       ELSE 'Other'  END 	   
         "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
	 '' "EFF_FROM_DT",
       '' "EFF_TO_DT",
       wdg.SUBJECT_ID "SUBJECT_ID"
FROM 
       OPB_WIDGET wdg,
       OPB_WIDGET_FIELD wdgfld,
       OPB_OBJECT_TYPE otype
WHERE 
       wdg.WIDGET_TYPE = otype.OBJECT_TYPE_ID 
       AND wdg.WIDGET_ID = wdgfld.WIDGET_ID
       AND wdg.VERSION_NUMBER = wdgfld.VERSION_NUMBER
       AND wdg.IS_VISIBLE = 1
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')  + 'Port' "ELEMENT_CLASS_ID", 
       otype.OBJECT_TYPE_NAME + '_' + 'Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'expression' "ELMNT_ATTR_NAME",       
       expr.EXPRESSION  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
	 '' "EFF_FROM_DT",
       '' "EFF_TO_DT",
       wdg.SUBJECT_ID "SUBJECT_ID"
FROM 
       OPB_WIDGET wdg,
       OPB_WIDGET_FIELD wdgfld,
       OPB_OBJECT_TYPE otype,
       OPB_EXPRESSION expr,
       OPB_WIDGET_EXPR wdgexp
WHERE 
       wdg.WIDGET_TYPE = otype.OBJECT_TYPE_ID 
       AND wdg.WIDGET_ID = wdgfld.WIDGET_ID 
       AND wdg.VERSION_NUMBER = wdgfld.VERSION_NUMBER
       AND wdg.IS_VISIBLE = 1
       AND wdgfld.WIDGET_ID=wdgexp.WIDGET_ID 
       AND wdgfld.VERSION_NUMBER = wdgexp.VERSION_NUMBER
       AND wdgfld.FIELD_ID=wdgexp.OUTPUT_FIELD_ID 
       AND wdgexp.WIDGET_ID=expr.WIDGET_ID 
       AND wdgexp.EXPR_ID=expr.EXPR_ID 
       AND wdgexp.VERSION_NUMBER = expr.VERSION_NUMBER
       AND expr.LINE_NO=1 
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')  + 'Port' "ELEMENT_CLASS_ID", 
       otype.OBJECT_TYPE_NAME + '_' + 'Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'expression' "ELMNT_ATTR_NAME",       
       ''  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
	 '' "EFF_FROM_DT",
       '' "EFF_TO_DT",
       wdg.SUBJECT_ID "SUBJECT_ID"
FROM 
       OPB_WIDGET wdg,
       OPB_WIDGET_FIELD wdgfld,
       OPB_OBJECT_TYPE otype
WHERE 
       wdg.WIDGET_TYPE = otype.OBJECT_TYPE_ID 
       AND wdg.WIDGET_ID = wdgfld.WIDGET_ID 
       AND wdg.VERSION_NUMBER = wdgfld.VERSION_NUMBER
       AND wdg.IS_VISIBLE = 1
       AND NOT EXISTS (SELECT 'X' FROM OPB_WIDGET_EXPR wdgexp
                       WHERE wdgfld.WIDGET_ID= wdgexp.WIDGET_ID  	  
                       AND wdgfld.FIELD_ID= wdgexp.OUTPUT_FIELD_ID
                       AND wdgfld.VERSION_NUMBER = wdgexp.VERSION_NUMBER) 
                       AND wdg.WIDGET_TYPE IN (5,9,26)
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')  + 'Port' "ELEMENT_CLASS_ID", 
       otype.OBJECT_TYPE_NAME + '_' + 'Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'portComments' "ELMNT_ATTR_NAME",       
       wdgexp.COMMENTS  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
	 '' "EFF_FROM_DT",
       '' "EFF_TO_DT",
       wdg.SUBJECT_ID "SUBJECT_ID"
FROM 
       OPB_WIDGET wdg,
       OPB_WIDGET_FIELD wdgfld,
       OPB_OBJECT_TYPE otype,
       OPB_EXPRESSION expr,
       OPB_WIDGET_EXPR wdgexp
WHERE 
       wdg.WIDGET_TYPE = otype.OBJECT_TYPE_ID 
       AND wdg.WIDGET_ID = wdgfld.WIDGET_ID 
       AND wdg.VERSION_NUMBER = wdgfld.VERSION_NUMBER
       AND wdg.IS_VISIBLE = 1
       AND wdgfld.WIDGET_ID=wdgexp.WIDGET_ID 
       AND wdgfld.VERSION_NUMBER = wdgexp.VERSION_NUMBER
       AND wdgfld.FIELD_ID=wdgexp.OUTPUT_FIELD_ID 
       AND wdgexp.WIDGET_ID=expr.WIDGET_ID 
       AND wdgexp.EXPR_ID=expr.EXPR_ID 
       AND wdgexp.VERSION_NUMBER = expr.VERSION_NUMBER
       AND expr.LINE_NO=1 
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')  + 'Port' "ELEMENT_CLASS_ID", 
       otype.OBJECT_TYPE_NAME + '_' + 'Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'portComments' "ELMNT_ATTR_NAME",       
       ''  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
	 '' "EFF_FROM_DT",
       '' "EFF_TO_DT",
       wdg.SUBJECT_ID "SUBJECT_ID"
FROM 
       OPB_WIDGET wdg,
       OPB_WIDGET_FIELD wdgfld,
       OPB_OBJECT_TYPE otype
WHERE 
       wdg.WIDGET_TYPE = otype.OBJECT_TYPE_ID 
       AND wdg.WIDGET_ID = wdgfld.WIDGET_ID 
       AND wdg.VERSION_NUMBER = wdgfld.VERSION_NUMBER
       AND wdg.IS_VISIBLE = 1
       AND NOT EXISTS (SELECT 'X' FROM OPB_WIDGET_EXPR wdgexp
                       WHERE wdgfld.WIDGET_ID= wdgexp.WIDGET_ID  	  
                       AND wdgfld.FIELD_ID= wdgexp.OUTPUT_FIELD_ID
                       AND wdgfld.VERSION_NUMBER = wdgexp.VERSION_NUMBER) 
                       AND wdg.WIDGET_TYPE IN (5,9,26)
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','')  + 'Port' "ELEMENT_CLASS_ID", 
       otype.OBJECT_TYPE_NAME + '_' + 'Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'isGroupBy' "ELMNT_ATTR_NAME", 	     
       CASE WHEN wdgexp.EXPR_TYPE = 46 THEN 'Yes' ELSE 'No' END "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
	 '' "EFF_FROM_DT",
       '' "EFF_TO_DT",
       wdg.SUBJECT_ID "SUBJECT_ID"
FROM 
       OPB_WIDGET wdg,     
       OPB_OBJECT_TYPE otype,
       OPB_WIDGET_FIELD wdgfld LEFT OUTER JOIN OPB_WIDGET_EXPR wdgexp ON
       wdgfld.WIDGET_ID=wdgexp.WIDGET_ID 
       AND wdgfld.FIELD_ID=wdgexp.OUTPUT_FIELD_ID
       AND wdgfld.VERSION_NUMBER = wdgexp.VERSION_NUMBER
WHERE 
       wdg.WIDGET_TYPE = otype.OBJECT_TYPE_ID 
       AND wdg.WIDGET_ID = wdgfld.WIDGET_ID 
       AND wdg.VERSION_NUMBER = wdgfld.VERSION_NUMBER
       AND wdg.IS_VISIBLE = 1
       AND (wdg.WIDGET_TYPE = 9 OR wdg.WIDGET_TYPE = 26)
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.RankPort' "ELEMENT_CLASS_ID", 
       'Rank_' + 'Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'isRankPort' "ELMNT_ATTR_NAME", 	     
       CASE WHEN wdgexp.EXPR_TYPE = 65 THEN 'Yes' ELSE 'No' END "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
	 '' "EFF_FROM_DT",
       '' "EFF_TO_DT",
       wdg.SUBJECT_ID "SUBJECT_ID"
FROM 
       OPB_WIDGET wdg,
       OPB_WIDGET_FIELD wdgfld LEFT OUTER JOIN OPB_WIDGET_EXPR wdgexp ON
       wdgfld.WIDGET_ID=wdgexp.WIDGET_ID
       AND wdgfld.FIELD_ID=wdgexp.OUTPUT_FIELD_ID
       AND wdgfld.VERSION_NUMBER=wdgexp.VERSION_NUMBER
WHERE 
	wdg.WIDGET_ID = wdgfld.WIDGET_ID 
       AND wdg.VERSION_NUMBER = wdgfld.VERSION_NUMBER
       AND wdg.IS_VISIBLE = 1
       AND wdg.WIDGET_TYPE = 26  
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.SorterPort' "ELEMENT_CLASS_ID", 
       'Sorter_Field_' + ltrim(str(wgtfld.WIDGET_ID)) 
             + '_' + ltrim(str(wgtfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
	 'direction' "ELMNT_ATTR_NAME", 
	CASE  WIDGET_FLD_PROP%4 WHEN 1 THEN 'Ascending' WHEN 3 THEN 'Descending'  ELSE '' END   "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wgt.LAST_SAVED "SRC_UPDATE_DT",
       '' "EFF_FROM_DT",
       '' "EFF_TO_DT",
       wgt.SUBJECT_ID "SUBJECT_ID"
 FROM 
  OPB_WIDGET_FIELD wgtfld, 
  OPB_WIDGET wgt
 WHERE
  wgt.WIDGET_ID = wgtfld.WIDGET_ID and
  wgt.VERSION_NUMBER = wgtfld.VERSION_NUMBER and 
  wgt.IS_VISIBLE = 1	and
 wgt.WIDGET_TYPE = 80	
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.NormalizerPort' "ELEMENT_CLASS_ID", 
       'Normalizer_Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'level' "ELMNT_ATTR_NAME",
       str(FLDLVL)  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
	'' "EFF_FROM_DT",
       '' "EFF_TO_DT", wdg.SUBJECT_ID "SUBJECT_ID"
FROM 
OPB_WIDGET wdg,
OPB_WIDGET_FIELD wdgfld,
OPB_NORM_FLD nrmfld 
where 
nrmfld.WIDGET_ID = wdg.WIDGET_ID AND
wdg.VERSION_NUMBER = nrmfld.VERSION_NUMBER AND 
wdg.WIDGET_TYPE = 14 AND
nrmfld.WIDGET_ID = wdgfld.WIDGET_ID and 
wdgfld.VERSION_NUMBER = nrmfld.VERSION_NUMBER AND 
nrmfld.NORMAL_FLDID = wdgfld.SRC_FIELD_ID and 
wdgfld.PORTTYPE = 2 AND
wdg.IS_VISIBLE=1  
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.NormalizerPort' "ELEMENT_CLASS_ID", 
       'Normalizer_Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'occurs' "ELMNT_ATTR_NAME",
       str(OCCTIMES)  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
	'' "EFF_FROM_DT",
       '' "EFF_TO_DT", wdg.SUBJECT_ID "SUBJECT_ID"
FROM 
OPB_WIDGET wdg,
OPB_WIDGET_FIELD wdgfld,
OPB_NORM_FLD nrmfld 
where 
nrmfld.WIDGET_ID = wdg.WIDGET_ID AND
wdg.VERSION_NUMBER = nrmfld.VERSION_NUMBER AND 
wdg.WIDGET_TYPE = 14 AND
nrmfld.WIDGET_ID = wdgfld.WIDGET_ID and 
wdgfld.VERSION_NUMBER = nrmfld.VERSION_NUMBER AND 
nrmfld.NORMAL_FLDID = wdgfld.SRC_FIELD_ID and 
wdgfld.PORTTYPE = 2 AND
wdg.IS_VISIBLE=1 
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.NormalizerPort' "ELEMENT_CLASS_ID", 
       'Normalizer_Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'KEY_TYPE' "ELMNT_ATTR_NAME",
       KEY_NAME  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
	'' "EFF_FROM_DT",
       '' "EFF_TO_DT", wdg.SUBJECT_ID "SUBJECT_ID"
FROM 
OPB_WIDGET wdg,
OPB_WIDGET_FIELD wdgfld,
OPB_MMD_KEYTYPE ktype, 
OPB_NORM_FLD nrmfld 
where 
nrmfld.WIDGET_ID = wdg.WIDGET_ID AND
wdg.VERSION_NUMBER = nrmfld.VERSION_NUMBER AND 
wdg.WIDGET_TYPE = 14 AND
nrmfld.WIDGET_ID = wdgfld.WIDGET_ID and 
wdgfld.VERSION_NUMBER = nrmfld.VERSION_NUMBER AND 
nrmfld.NORMAL_FLDID = wdgfld.SRC_FIELD_ID and 
wdgfld.PORTTYPE = 2 AND
wdg.IS_VISIBLE=1 AND
ktype.DBTYPE_ID = 0 AND
ktype.KEY_FLAGS = nrmfld.KEYTYPE
GO
