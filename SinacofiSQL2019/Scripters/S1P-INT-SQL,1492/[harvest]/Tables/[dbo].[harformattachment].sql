SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[harformattachment](
	[attachmentobjid] [int] NOT NULL,
	[attachmentname] [varchar](512) COLLATE Modern_Spanish_CS_AS_KS_WS NOT NULL,
	[attachmenttype] [int] NOT NULL,
	[formobjid] [int] NOT NULL,
	[creatorid] [int] NOT NULL,
	[creationtime] [datetime] NOT NULL,
	[filesize] [int] NOT NULL,
	[filedata] [image] NULL,
	[filecompressed] [char](1) COLLATE Modern_Spanish_CS_AS_KS_WS NOT NULL
)
ON [PRIMARY]
