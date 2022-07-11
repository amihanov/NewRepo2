SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[harversiondata](
	[versiondataobjid] [int] NOT NULL,
	[refcounter] [int] NOT NULL,
	[datasize] [bigint] NULL,
	[compressed] [char](1) COLLATE Modern_Spanish_CS_AS_KS_WS NOT NULL,
	[compdatasize] [bigint] NULL,
	[fileaccess] [char](9) COLLATE Modern_Spanish_CS_AS_KS_WS NULL,
	[modifytime] [datetime] NULL,
	[createtime] [datetime] NULL,
	[dcb] [varchar](256) COLLATE Modern_Spanish_CS_AS_KS_WS NULL,
	[textfile] [int] NOT NULL,
	[itemobjid] [int] NOT NULL,
	[versiondata] [image] NULL,
	[ISDATAINCHUNKS] [char](1) NOT NULL
)
ON [PRIMARY]
