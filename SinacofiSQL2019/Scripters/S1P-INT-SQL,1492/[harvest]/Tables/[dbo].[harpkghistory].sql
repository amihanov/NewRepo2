SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[harpkghistory](
	[packageobjid] [int] NOT NULL,
	[statename] [varchar](128) COLLATE Modern_Spanish_CS_AS_KS_WS NOT NULL,
	[environmentname] [varchar](128) COLLATE Modern_Spanish_CS_AS_KS_WS NOT NULL,
	[execdtime] [datetime] NOT NULL,
	[usrobjid] [int] NOT NULL,
	[action] [varchar](128) COLLATE Modern_Spanish_CS_AS_KS_WS NOT NULL,
	[STATEOBJID] [int] NULL,
	[ENVOBJID] [int] NULL,
	[NOTE] [varchar](2000) NULL
)
ON [PRIMARY]
