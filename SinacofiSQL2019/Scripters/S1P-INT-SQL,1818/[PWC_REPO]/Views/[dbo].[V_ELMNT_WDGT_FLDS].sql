﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ELMNT_WDGT_FLDS]') IS NULL EXEC('CREATE VIEW [dbo].[V_ELMNT_WDGT_FLDS] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ELMNT_WDGT_FLDS]
AS 
select ' ' "REPOSITORY_ID", 
'com.informatica.powercenter.map.' + REPLACE(REPLACE(otype.OBJECT_TYPE_NAME,' ',''),'-','') + 'Port' "CLASS_ID", 
otype.OBJECT_TYPE_NAME + '_' + 'Field_' + ltrim(str(widget.WIDGET_ID)) +
'_' + ltrim(str(fld.FIELD_ID)) "ELEMENT_ID" , 
          widget.VERSION_NUMBER "VERSION_NUM",
	   fld.FIELD_NAME "ELEMENT_NAME", fld.FIELD_NAME "ELEMENT_LABEL",
	   '' "ELEMENT_ALIAS", fld.COMMENTS "ELEMENT_DESC", 
	   '' "ELEMENT_USAGE", 
     otype.OBJECT_TYPE_NAME + ' Field' "ELEMENT_TYPE",
	   '' "ELEMENT_SUBTYPE",
	   'DEFAULT_VALUE' "ELEMENT_ATTR1", fld.DEFAULT_VALUE "ELEMENT_VALUE1",
	   '' "ELEMENT_ATTR2", '' "ELEMENT_VALUE2",
	   '' "ELEMENT_ATTR3", '' "ELEMENT_VALUE3",
     'Y' "VALID_FLAG", 'N' "DISABLED_FLAG",
	   '' "SRC_CREATE_DT", widget.LAST_SAVED "SRC_UPDATE_DT",
	   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	   widget.SUBJECT_ID	"SUBJECT_ID"
    from OPB_WIDGET widget, OPB_WIDGET_FIELD fld, OPB_OBJECT_TYPE otype
	where otype.OBJECT_TYPE_ID = widget.WIDGET_TYPE and
              widget.WIDGET_ID = fld.WIDGET_ID and
              widget.VERSION_NUMBER = fld.VERSION_NUMBER
and widget.IS_VISIBLE = 1
GO
