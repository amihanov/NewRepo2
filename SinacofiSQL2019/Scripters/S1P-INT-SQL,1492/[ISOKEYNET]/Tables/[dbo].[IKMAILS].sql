﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IKMAILS](
	[IKMAILS_ID] [int] IDENTITY(1, 1),
	[IKMAILS_FROM] [nvarchar](320) NOT NULL,
	[IKMAILS_TO] [nvarchar](320) NOT NULL,
	[IKMAILS_SUBJECT] [nvarchar](2000) NOT NULL,
	[IKMAILS_CONTENT] [ntext] NOT NULL,
	[IKMAILS_ISURGENT] [tinyint] NOT NULL,
	[IKMAILS_INPUTDATE] [datetime] NOT NULL,
	[IKMAILS_RELATED_ERROR] [nvarchar](4000) NULL,
	[IKMAILS_LAST_TRY_DATE] [datetime] NULL,
	[IKMAILS_ATTACHMENTS] [ntext] NULL,
	[IKMAILS_FROM_DISPLAY_NAME] [nvarchar](200) NULL,
	[IKMAILS_TRYCOUNT] [int] NULL
)
ON [PRIMARY]
