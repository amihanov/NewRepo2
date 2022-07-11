SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[V_IME_EVENT]') IS NULL EXEC('CREATE VIEW [dbo].[V_IME_EVENT] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[V_IME_EVENT]
AS
select  ' ' "REPOSITORY_ID",
        'com.informatica.powercenter.process.TriggerRunEvent' "CLASS_ID",
        'PC_DEFAULT_EVENT_OBJECT' "EVENT_ID",
        'External' "EVENT_TYPE", 'Event-based' "FREQUENCY_TYPE",
        '' "EVENT_NAME", ''"EVENT_DESC", '' "EVENT_USAGE",
        '' "EVENT_TEXT1",'' "EVENT_TEXT2", '' "EVENT_TEXT3",
        '1' "VERSION_NUM", 
	      '' "SRC_CREATE_DT", '' "SRC_UPDATE_DT",
	      '' "EFF_FROM_DT", '' "EFF_TO_DT"
from OPB_REPOSIT repo where repo.RECID = 1
GO
