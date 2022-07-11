﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PR_RESOURCE](
	[PRR_ID] [numeric](19, 0) NOT NULL,
	[PRR_VERSION] [int] NOT NULL,
	[PRR_PARENTPATH] [varchar](595) COLLATE Latin1_General_CS_AS NULL,
	[PRR_RELROOT] [numeric](19, 0) NOT NULL,
	[PRR_MAXIID] [numeric](19, 0) NOT NULL,
	[PRR_NUMOBJECTS] [numeric](19, 0) NOT NULL,
	[PRR_NSID] [int] NOT NULL,
	[PRR_PARENTID] [numeric](19, 0) NOT NULL,
	[PRR_PARENTCONTAINER] [numeric](19, 0) NULL,
	[PRR_NAME] [varchar](255) COLLATE Latin1_General_CS_AS NOT NULL,
	[PRR_TYPENAME] [nvarchar](765) COLLATE Latin1_General_CS_AS NULL,
	[PRR_OID] [numeric](19, 0) NULL
)
ON [PRIMARY]