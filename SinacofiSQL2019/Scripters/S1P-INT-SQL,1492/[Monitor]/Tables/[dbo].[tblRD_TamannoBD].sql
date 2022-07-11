SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRD_TamannoBD](
	[Fecha] [datetime] NOT NULL,
	[Dbname] [sysname] NOT NULL,
	[vcdbstatus] [varchar](50) NULL,
	[vcRecoveryModel] [varchar](40) NULL,
	[flFileSizeMB] [float] NULL,
	[flSpaceUsedMB] [float] NULL,
	[flFreeSpaceMB] [float] NULL
)
ON [PRIMARY]
