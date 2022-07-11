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
	[flFreeSpaceMB] [float] NULL,
	[vcVolumen] [varchar](10) NULL,
	[flTotalSpace] [float] NULL,
	[flAvailableSpace] [float] NULL,
	[flPercentageAvailable] [float] NULL
)
ON [PRIMARY]
