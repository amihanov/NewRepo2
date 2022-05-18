SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[HARITEMNAME](
	[itemname] [varchar](256) COLLATE Modern_Spanish_CS_AS_KS_WS NOT NULL,
	[itemnameupper] [varchar](256) COLLATE Modern_Spanish_CS_AS_KS_WS NOT NULL,
	[nameobjid] [int] NOT NULL
)
ON [PRIMARY]
