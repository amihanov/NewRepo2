SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[detalle](
	[consulta_id] [int] NOT NULL,
	[folio] [bigint] NOT NULL,
	[periodo] [varchar](10) NOT NULL,
	[tipoformulario] [varchar](3) NOT NULL,
	[estado] [tinyint] NULL
)
ON [PRIMARY]
