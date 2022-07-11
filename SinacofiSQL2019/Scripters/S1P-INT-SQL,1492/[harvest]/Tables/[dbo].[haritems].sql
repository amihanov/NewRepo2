SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[haritems](
	[itemobjid] [int] NOT NULL,
	[itemname] [varchar](256) COLLATE Modern_Spanish_CS_AS_KS_WS NOT NULL,
	[itemtype] [int] NOT NULL,
	[parentobjid] [int] NOT NULL,
	[repositobjid] [int] NOT NULL,
	[creationtime] [datetime] NOT NULL,
	[creatorid] [int] NOT NULL,
	[modifiedtime] [datetime] NOT NULL,
	[modifierid] [int] NOT NULL,
	[itemnameupper] [varchar](256) COLLATE Modern_Spanish_CS_AS_KS_WS NOT NULL
)
ON [PRIMARY]
