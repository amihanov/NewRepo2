SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[autorizaform](
	[idEmpresa] [float] NOT NULL,
	[folio] [bigint] NOT NULL,
	[fecCreacion] [datetime] NOT NULL
)
ON [PRIMARY]
