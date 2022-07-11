﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ISP_RUN_LOG](
	[ABSOLUTEFILENAME] [varchar](4000) NULL,
	[NODENAME] [varchar](255) NULL,
	[INTEGRATIONSERVICE] [varchar](255) NULL,
	[REPOSITORYDOMAIN] [varchar](255) NULL,
	[REPOSITORYNAME] [varchar](255) NULL,
	[RUNCONTEXT] [varchar](50) NULL,
	[RUNID] [varchar](50) NULL,
	[ENTRYTIME] [bigint] NULL,
	[FOLDER] [varchar](255) NULL,
	[WORKFLOW] [varchar](255) NULL,
	[SESSIONPATH] [varchar](4000) NULL,
	[OSUSER] [varchar](255) NULL,
	[RUNINSTANCENAME] [varchar](255) NULL
)
ON [PRIMARY]
