SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[documento](
	[nombre] [varchar](80) NOT NULL,
	[fecha] [date] NOT NULL,
	[rutContribuyente] [int] NOT NULL
)
ON [PRIMARY]
