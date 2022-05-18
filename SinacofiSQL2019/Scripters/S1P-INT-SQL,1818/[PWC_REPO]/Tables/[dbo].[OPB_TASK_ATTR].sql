﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[OPB_TASK_ATTR](
	[WORKFLOW_ID] [int] NULL,
	[INSTANCE_ID] [int] NULL,
	[TASK_ID] [int] NULL,
	[TASK_TYPE] [int] NULL,
	[REF_SESSION_ID] [int] NULL,
	[COMPONENT_TYPE] [int] NULL,
	[ATTR_ID] [int] NULL,
	[ATTR_VALUE] [text] NULL,
	[LINE_NO] [int] NULL,
	[GROUP_ID] [int] NULL,
	[OPB_OBJECT_ID] [int] NULL,
	[VERSION_NUMBER] [int] NULL
)
ON [PRIMARY]
