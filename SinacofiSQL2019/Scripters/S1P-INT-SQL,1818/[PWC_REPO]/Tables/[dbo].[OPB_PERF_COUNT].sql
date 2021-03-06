SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[OPB_PERF_COUNT](
	[SUBJECT_ID] [int] NULL,
	[WORKFLOW_ID] [int] NULL,
	[WORKFLOW_RUN_ID] [int] NULL,
	[WORKLET_ID] [int] NULL,
	[TASK_ID] [int] NULL,
	[TASK_INST_ID] [int] NULL,
	[WIDGET_ID] [int] NULL,
	[WIDGET_INST_ID] [int] NULL,
	[PARTITION_ID] [int] NULL,
	[FRAGMENT_ID] [int] NULL,
	[GROUP_ID] [int] NULL,
	[ATTR_ID] [int] NULL,
	[ATTR_VALUE] [text] NULL,
	[TIME_STAMP] [datetime] NULL
)
ON [PRIMARY]
