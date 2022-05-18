SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_envi_docu](
	[codi_empr] [numeric](9, 0) NULL,
	[corr_envi] [numeric](22, 0) IDENTITY(1, 1),
	[rutt_emis] [numeric](10, 0) NULL,
	[digi_emis] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_envi] [numeric](10, 0) NULL,
	[digi_envi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[feho_envi] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[vers_envi] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_envi] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[mens_envi] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_rece] [numeric](9, 0) NULL,
	[digi_rece] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_reso] [numeric](10, 0) NULL,
	[fech_reso] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_pers] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_pers] [numeric](9, 0) NULL,
	[digi_pers] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[posi_envi] [numeric](18, 0) NULL,
	[bloc_envi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_arch] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_aten] [numeric](10, 0) NULL,
	[nume_envi] [numeric](3, 0) NULL,
	[dire_arch] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[cola_proc] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[bole_elec] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_UPLD] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]
