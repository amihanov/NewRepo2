SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_deta_prse](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[codi_impu] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_codi] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_item] [varchar](35) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_exen] [numeric](1, 0) NULL,
	[nomb_item] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[desc_item] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[cant_item] [numeric](18, 6) NULL,
	[cant_refe] [numeric](18, 0) NULL,
	[unid_refe] [varchar](4) COLLATE Modern_Spanish_CI_AS NULL,
	[prec_refe] [numeric](18, 6) NULL,
	[unid_medi] [varchar](4) COLLATE Modern_Spanish_CI_AS NULL,
	[prec_item] [numeric](18, 6) NULL,
	[prec_mono] [numeric](18, 6) NULL,
	[codi_mone] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[fact_conv] [numeric](10, 4) NULL,
	[dcto_item] [numeric](18, 0) NULL,
	[reca_item] [numeric](18, 0) NULL,
	[neto_item] [numeric](22, 4) NULL,
	[desc_porc] [numeric](5, 2) NULL,
	[reca_porc] [numeric](5, 2) NULL,
	[fech_elab] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_vepr] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[desc_mone] [numeric](18, 4) NULL,
	[reca_mone] [numeric](18, 4) NULL,
	[valo_mone] [numeric](18, 4) NULL,
	[indi_agen] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[base_faen] [numeric](18, 0) NULL,
	[marg_comer] [numeric](18, 0) NULL,
	[prne_cofi] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]
