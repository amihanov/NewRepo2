SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[harallchildrenpath](
	[itemobjid] [int] NOT NULL,
	[childitemid] [int] NOT NULL,
	[versionobjid] [int] NOT NULL,
	[childversionobjid] [int] NOT NULL
)
ON [PRIMARY]
