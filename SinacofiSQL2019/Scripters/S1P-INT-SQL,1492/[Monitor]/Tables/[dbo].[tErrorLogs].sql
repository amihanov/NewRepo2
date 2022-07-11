SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tErrorLogs](
	[RowNumber] [int] IDENTITY(1, 1),
	[ErrorText] [varchar](6000) NULL,
	[continuationrow] [bit] NULL
)
ON [PRIMARY]
