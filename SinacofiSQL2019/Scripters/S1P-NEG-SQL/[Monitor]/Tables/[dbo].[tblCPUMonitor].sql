SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblCPUMonitor](
	[dtFechaHora] [datetime] NOT NULL,
	[iSqlCpuUse] [int] NOT NULL,
	[iSystemIdle] [int] NOT NULL,
	[iOtherProcess] [int] NULL
)
ON [PRIMARY]
