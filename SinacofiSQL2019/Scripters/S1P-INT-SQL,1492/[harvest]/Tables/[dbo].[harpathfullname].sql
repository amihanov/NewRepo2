SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[harpathfullname](
	[itemobjid] [int] NOT NULL,
	[pathfullname] [varchar](1024) NOT NULL,
	[pathfullnameupper] [varchar](1024) NOT NULL,
	[versionobjid] [int] NOT NULL,
	[PATHBYID] [varchar](1024) NULL
)
ON [PRIMARY]
