SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[haritemaccess](
	[itemobjid] [int] NOT NULL,
	[usrgrpobjid] [int] NOT NULL,
	[viewaccess] [char](1) COLLATE Modern_Spanish_CS_AS_KS_WS NOT NULL
)
ON [PRIMARY]
