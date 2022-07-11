SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ATTRIBUTE_WDGFLD_1]') IS NULL EXEC('CREATE VIEW [dbo].[V_ATTRIBUTE_WDGFLD_1] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ATTRIBUTE_WDGFLD_1]
AS
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','') + 'Port' "ELEMENT_CLASS_ID", 
       otype.OBJECT_TYPE_NAME + '_' + 'Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'dataType' "ELMNT_ATTR_NAME",
        (select dtype.DTYPE_NAME from 
       REP_FLD_DATATYPE dtype where wdgfld.WGT_DATATYPE = dtype.DTYPE_NUM)  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
       '' "EFF_FROM_DT",
       '' "EFF_TO_DT",
       wdg.SUBJECT_ID "SUBJECT_ID"
FROM OPB_WIDGET wdg,
     OPB_WIDGET_FIELD wdgfld,
     OPB_OBJECT_TYPE otype,
     REP_FLD_DATATYPE dtype
WHERE wdg.WIDGET_TYPE = otype.OBJECT_TYPE_ID AND
      wdg.WIDGET_ID = wdgfld.WIDGET_ID AND wdg.VERSION_NUMBER = wdgfld.VERSION_NUMBER
AND wdg.IS_VISIBLE = 1
AND      wdgfld.WGT_DATATYPE = dtype.DTYPE_NUM 
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','') + 'Port' "ELEMENT_CLASS_ID", 
       otype.OBJECT_TYPE_NAME + '_' + 'Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'precision' "ELMNT_ATTR_NAME",
       ltrim(str(wdgfld.WGT_PREC))  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
       ''  "EFF_FROM_DT",
       '' "EFF_TO_DT",
       wdg.SUBJECT_ID "SUBJECT_ID"
FROM OPB_WIDGET wdg,
     OPB_WIDGET_FIELD wdgfld,
     OPB_OBJECT_TYPE otype
WHERE wdg.WIDGET_TYPE = otype.OBJECT_TYPE_ID AND
      wdg.WIDGET_ID = wdgfld.WIDGET_ID AND wdg.VERSION_NUMBER = wdgfld.VERSION_NUMBER
AND wdg.IS_VISIBLE = 1
UNION ALL
SELECT '' "REPOSITORY_ID", 
       'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','') + 'Port' "ELEMENT_CLASS_ID", 
       otype.OBJECT_TYPE_NAME + '_' + 'Field_' + ltrim(str(wdgfld.WIDGET_ID)) 
             + '_' + ltrim(str(wdgfld.FIELD_ID)) "ELEMENT_ID" , 
       'GLOBAL' "SCOPE_TYPE", 
       'scale' "ELMNT_ATTR_NAME",
       ltrim(str(wdgfld.WGT_SCALE))  "ELMNT_ATTR_VALUE",
       '' "ELMNT_ATTR_DESC",
       '' "DATA_TYPE",
       '' "SRC_CREATE_DT",
       wdg.LAST_SAVED "SRC_UPDATE_DT",
       ''  "EFF_FROM_DT",
       '' "EFF_TO_DT",
       wdg.SUBJECT_ID "SUBJECT_ID"
FROM OPB_WIDGET wdg,
     OPB_WIDGET_FIELD wdgfld,
     OPB_OBJECT_TYPE otype
WHERE wdg.WIDGET_TYPE = otype.OBJECT_TYPE_ID AND
      wdg.WIDGET_ID = wdgfld.WIDGET_ID AND wdg.VERSION_NUMBER = wdgfld.VERSION_NUMBER
AND wdg.IS_VISIBLE = 1
GO
