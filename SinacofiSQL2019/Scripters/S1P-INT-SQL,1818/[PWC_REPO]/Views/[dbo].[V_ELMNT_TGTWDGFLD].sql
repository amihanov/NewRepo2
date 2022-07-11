SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_ELMNT_TGTWDGFLD]') IS NULL EXEC('CREATE VIEW [dbo].[V_ELMNT_TGTWDGFLD] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_ELMNT_TGTWDGFLD]
AS 
select ' ' "REPOSITORY_ID", 
     'com.informatica.powercenter.map.TargetDefinitionPort' "CLASS_ID",
     'Target Definition_' + 'Field_' +
     ltrim(str(targ.TARGET_ID)) + '_' + ltrim(str(fld.FLDID)) "ELEMENT_ID" ,
     targ.VERSION_NUMBER "VERSION_NUM",
	   fld.TARGET_NAME "ELEMENT_NAME", fld.TARGET_NAME "ELEMENT_LABEL",
	   '' "ELEMENT_ALIAS", fld.TARGET_DESC "ELEMENT_DESC", 
	   '' "ELEMENT_USAGE", 
           'Target Definition Field' "ELEMENT_TYPE",
	   '' "ELEMENT_SUBTYPE", 
	   'BUSINESS_NAME' "ELEMENT_ATTR1", fld.BUSINESS_NAME "ELEMENT_VALUE1",
	   'precision' "ELEMENT_ATTR2",  LTRIM(STR(fld.DPREC)) "ELEMENT_VALUE2", 
	   'scale' "ELEMENT_ATTR3", LTRIM(STR(fld.DSCALE)) "ELEMENT_VALUE3",
     'Y' "VALID_FLAG", 'N' "DISABLED_FLAG", 
	   '' "SRC_CREATE_DT", targ.LAST_SAVED "SRC_UPDATE_DT",
	   '' "EFF_FROM_DT",  '' "EFF_TO_DT",
	   targ.SUBJ_ID	"SUBJECT_ID"
    from OPB_TARG targ, OPB_TARG_FLD fld
	where 
              fld.TARGET_ID = targ.TARGET_ID and targ.VERSION_NUMBER = fld.VERSION_NUMBER
and targ.IS_VISIBLE = 1
GO
