SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblMemMonitor](
	[Fecha] [datetime] NOT NULL,
	[Database_name] [varchar](50) NOT NULL,
	[Buffer Count (8KB Pages)] [numeric](10, 0) NOT NULL,
	[Buffer Size (MB)] [numeric](10, 0) NOT NULL,
	[Buffer Size (%)] [numeric](6, 3) NOT NULL
)
ON [PRIMARY]
