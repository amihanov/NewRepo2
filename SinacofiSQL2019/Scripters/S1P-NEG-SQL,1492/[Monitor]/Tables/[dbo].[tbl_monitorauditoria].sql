SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_monitorauditoria](
	[trace] [int] NULL,
	[property] [int] NULL,
	[value] [varchar](200) NULL,
	[fecha] [datetime] NULL
)
ON [PRIMARY]
