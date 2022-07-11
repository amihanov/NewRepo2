﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[OPB_WFLOW_RUN](
	[SUBJECT_ID] [int] NULL,
	[WORKFLOW_ID] [int] NULL,
	[WORKFLOW_RUN_ID] [int] NULL,
	[WORKFLOW_NAME] [varchar](240) NULL,
	[SERVER_ID] [int] NULL,
	[SERVER_NAME] [varchar](240) NULL,
	[START_TIME] [datetime] NULL,
	[END_TIME] [datetime] NULL,
	[LOG_FILE] [text] NULL,
	[RUN_ERR_CODE] [int] NULL,
	[RUN_ERR_MSG] [text] NULL,
	[RUN_STATUS_CODE] [int] NULL,
	[USER_NAME] [varchar](240) NULL,
	[RUN_TYPE] [int] NULL,
	[CODEPAGE_ID] [int] NULL,
	[VERSION_NUMBER] [int] NULL,
	[SERVER_NET_ID] [int] NULL,
	[SERVER_NET_NAME] [varchar](240) NULL,
	[HAS_FAILED_TASKS] [int] NULL,
	[HAS_INTERRUPTS] [int] NULL,
	[SERVER_NODE_ID] [int] NULL,
	[SERVER_NODE_NAME] [varchar](240) NULL,
	[OS_USER] [varchar](240) NULL,
	[RUNINST_NAME] [varchar](240) NULL
)
ON [PRIMARY]