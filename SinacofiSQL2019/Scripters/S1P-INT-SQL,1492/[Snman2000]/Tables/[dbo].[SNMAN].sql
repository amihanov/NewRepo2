SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SNMAN](
	[SENOR] [nvarchar](50) NULL,
	[CARGO] [nvarchar](50) NULL,
	[INST] [nvarchar](50) NULL,
	[REFERENCIA] [nvarchar](232) NULL,
	[SN_DADO] [nvarchar](10) NULL,
	[FECHA] [smalldatetime] NULL,
	[RESPONSABL] [nvarchar](50) NULL
)
ON [PRIMARY]
