SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PiezaAtributoes](
	[PiezaAtributoID] [uniqueidentifier] NOT NULL,
	[AtributoID] [uniqueidentifier] NOT NULL,
	[PiezaID] [uniqueidentifier] NOT NULL,
	[Valor] [nvarchar](MAX) NULL,
	[Orden] [int] NOT NULL,
	[Version] [int] NULL,
	[Fecha] [datetime] NULL
)
ON [PRIMARY]
