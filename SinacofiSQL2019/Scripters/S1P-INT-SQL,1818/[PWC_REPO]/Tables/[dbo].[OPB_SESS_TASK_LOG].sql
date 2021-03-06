SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[OPB_SESS_TASK_LOG](
	[WORKFLOW_ID] [int] NULL,
	[WORKFLOW_RUN_ID] [int] NULL,
	[WORKLET_RUN_ID] [int] NULL,
	[INSTANCE_ID] [int] NULL,
	[MAPPING_NAME] [varchar](240) NULL,
	[LOG_FILE] [text] NULL,
	[SRC_SUCCESS_ROWS] [int] NULL,
	[SRC_FAILED_ROWS] [int] NULL,
	[TARG_SUCCESS_ROWS] [int] NULL,
	[TARG_FAILED_ROWS] [int] NULL,
	[TOTAL_TRANS_ERRS] [int] NULL,
	[FIRST_ERROR_CODE] [int] NULL,
	[FIRST_ERROR_MSG] [text] NULL,
	[CODEPAGE_ID] [int] NULL,
	[VERSION_NUMBER] [int] NULL,
	[ERROR_LOG_FILE] [text] NULL
)
ON [PRIMARY]
