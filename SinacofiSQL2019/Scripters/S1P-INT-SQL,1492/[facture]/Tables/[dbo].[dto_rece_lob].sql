SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_rece_lob](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_rece] [numeric](22, 0) NOT NULL,
	[tipo_arch] [varchar](12) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[clob_docu] [text] COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]
