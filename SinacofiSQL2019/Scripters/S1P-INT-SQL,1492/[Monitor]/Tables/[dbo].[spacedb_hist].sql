SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[spacedb_hist](
	[DB] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DATOS] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USADO] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fecha] [datetime] NULL
)
ON [PRIMARY]
