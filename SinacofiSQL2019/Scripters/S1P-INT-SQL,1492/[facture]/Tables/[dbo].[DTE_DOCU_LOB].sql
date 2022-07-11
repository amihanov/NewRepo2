SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DTE_DOCU_LOB](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[TIPO_ARCH] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CLOB_DOCU] [text] COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]
