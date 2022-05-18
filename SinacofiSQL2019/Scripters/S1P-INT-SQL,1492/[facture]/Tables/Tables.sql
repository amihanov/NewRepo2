
GO
--SqlScripter----[dbo].[area_geog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[area_geog](
	[codi_arge] [varchar](8) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nomb_arge] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_arge] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_peri_arge] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_arge1] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[post_arge] [numeric](4, 0) NULL,
	[marc_arge] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[genm_arge] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[genf_arge] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_asig_foli].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_asig_foli](
	[CORR_ASIG] [numeric](12, 0) NOT NULL,
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[CODI_CECO] [varchar](16) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CORR_RAFO] [numeric](18, 0) NOT NULL,
	[CODI_UNID] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ESTA_ASIG] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FOLI_DESD] [numeric](10, 0) NOT NULL,
	[FOLI_HAST] [numeric](10, 0) NOT NULL,
	[FECH_ASIG] [datetime] NOT NULL,
	[CANT_REEN] [numeric](9, 0) NULL,
	[ULTI_USAD] [numeric](10, 0) NULL,
	[TIPO_ORIG] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[STRR_ASIG] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[STRR_CAFF] [varchar](3000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_cons_cara].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_cons_cara](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[CORR_CONS] [numeric](22, 0) NOT NULL,
	[RUTT_EMIS] [numeric](9, 0) NOT NULL,
	[DIGI_EMIS] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[RUTT_ENVI] [numeric](9, 0) NOT NULL,
	[DIGI_ENVI] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FECH_RESO] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NUME_RESU] [numeric](6, 0) NOT NULL,
	[FECH_INIC] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FECH_FINA] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[SECU_ENVI] [numeric](3, 0) NULL,
	[FEHO_ENVI] [varchar](25) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ESTA_ENVI] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[NUME_ATEN] [numeric](12, 0) NULL,
	[NUME_ENVI] [numeric](3, 0) NULL,
	[MENS_ENVI] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_ssii] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[mens_ssii] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[tmst_rpta] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_resp] [text] COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_cons_rang].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_cons_rang](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[CORR_CONS] [numeric](22, 0) NOT NULL,
	[TIPO_RANG] [varchar](4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FOLI_INIC] [numeric](10, 0) NOT NULL,
	[FOLI_FINA] [numeric](10, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_cons_resu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_cons_resu](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[CORR_CONS] [numeric](22, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[TOTA_NETO] [numeric](18, 0) NULL,
	[TOTA_IVAG] [numeric](18, 0) NULL,
	[TASA_IVAG] [numeric](5, 0) NULL,
	[TOTA_EXEN] [numeric](18, 0) NULL,
	[MONT_TOTA] [numeric](18, 0) NOT NULL,
	[CANT_EMIT] [numeric](10, 0) NOT NULL,
	[CANT_ANUL] [numeric](10, 0) NOT NULL,
	[CANT_UTIL] [numeric](10, 0) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_dato_refe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_dato_refe](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[NUME_LINE] [numeric](2, 0) NOT NULL,
	[CODI_REFE] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[RAZO_REFE] [varchar](90) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_VEND] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_CAJA] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_desc_reca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_desc_reca](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[NUME_LINE] [numeric](2, 0) NOT NULL,
	[TIPO_MOV] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[GLOS_MOVI] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[TIPO_VALO] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[VALO_MOVI] [numeric](18, 2) NULL,
	[INDI_EXEN] [numeric](1, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_deta_codi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_deta_codi](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[NUME_LINE] [numeric](4, 0) NOT NULL,
	[TIPO_CODI] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_ITEM] [varchar](35) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_deta_prse].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_deta_prse](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[NUME_LINE] [numeric](4, 0) NOT NULL,
	[INDI_EXEN] [numeric](1, 0) NULL,
	[NOMB_ITEM] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DESC_ADIC] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[CANT_ITEM] [numeric](18, 6) NULL,
	[UNID_MED] [varchar](4) COLLATE Modern_Spanish_CI_AS NULL,
	[PREC_UNIC] [numeric](18, 2) NULL,
	[VALO_LINE] [numeric](18, 0) NOT NULL,
	[PORC_DESC] [numeric](5, 2) NULL,
	[MONT_DESC] [numeric](18, 0) NULL,
	[PORC_RECA] [numeric](5, 2) NULL,
	[MONT_RECA] [numeric](18, 0) NULL,
	[ITEM_ESPE] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[RUTT_MAND] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_deta_subt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_deta_subt](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[NUME_LINE] [numeric](2, 0) NOT NULL,
	[LINE_DETA] [numeric](18, 2) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_enca_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_enca_docu](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[VERS_ENCA] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CORR_ENVI] [numeric](22, 0) NULL,
	[CORR_RAFO] [numeric](18, 0) NULL,
	[ESTA_DOCU] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_EMIS] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[INDI_SERV] [numeric](1, 0) NOT NULL,
	[INDI_MONE] [numeric](1, 0) NULL,
	[PEDI_DESD] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[PERI_HAST] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_VENC] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[RUTT_EMIS] [numeric](9, 0) NOT NULL,
	[DIGI_VERI] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NOMB_EMIS] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[GIRO_EMIS] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_SUCU] [numeric](9, 0) NULL,
	[DIRE_ORIG] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[COMU_ORIG] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[CIUD_ORIG] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[RUTT_RECE] [numeric](9, 0) NULL,
	[DIGI_RECE] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_INTE] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[NOMB_RECE] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[CONT_RECE] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[DIRE_RECE] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[COMU_RECE] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[CIUD_RECE] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[DIRE_POST] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[COMU_POST] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[CIUD_POST] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[MONT_NETO] [numeric](18, 0) NULL,
	[MONT_EXEN] [numeric](18, 0) NULL,
	[TASA_VAAG] [numeric](18, 0) NULL,
	[MONT_TOTA] [numeric](18, 0) NOT NULL,
	[MONT_NOFA] [numeric](18, 0) NULL,
	[TOTA_PERI] [numeric](18, 0) NULL,
	[SALD_ANTE] [numeric](18, 0) NULL,
	[VALO_PAGA] [numeric](18, 0) NULL,
	[TMST_TIMB] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[VAL1] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[VAL2] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[VAL3] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[VAL4] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[VAL5] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[VAL6] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[VAL7] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[VAL8] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[VAL9] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[VAL10] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[cola_proc] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[impr_dest] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_impr] [numeric](3, 0) NULL,
	[foli_clie] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[VAAG_TERC] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_envi_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_envi_docu](
	[CORR_ENVI] [numeric](22, 0) NOT NULL,
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[RUTT_EMIS] [numeric](10, 0) NOT NULL,
	[DIGI_EMIS] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[RUTT_ENVI] [numeric](10, 0) NOT NULL,
	[DIGI_ENVI] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FEHO_ENVI] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[VERS_ENVI] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ESTA_ENVI] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MENS_ENVI] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[RUTT_RECE] [numeric](9, 0) NOT NULL,
	[DIGI_RECE] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NUME_RESO] [numeric](10, 0) NOT NULL,
	[FECH_RESO] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NOMB_ARCH] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[NUME_ATEN] [numeric](8, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_envi_pdf].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_envi_pdf](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[posicion_email] [numeric](2, 0) NOT NULL,
	[email_envi] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[hacer_envi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_foli_anul].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_foli_anul](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_ANUL] [numeric](10, 0) NOT NULL,
	[FECH_ANUL] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_info_tick].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_info_tick](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_TICK] [numeric](6, 0) NOT NULL,
	[FECH_TICK] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NOMB_EVEN] [varchar](90) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TIPO_TICK] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_EVEN] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FECH_EVEN] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[LUGA_EVEN] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[UBIC_EVEN] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FILA_UBIC] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[ASIE_UBIC] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_subt_info].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_subt_info](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[NUME_LINE] [numeric](2, 0) NOT NULL,
	[GLOS_SUBT] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[ORDE_IMPR] [numeric](2, 0) NULL,
	[VALO_NETO] [numeric](18, 2) NULL,
	[VALO_IVAG] [numeric](18, 2) NULL,
	[VALO_IMAD] [numeric](18, 2) NULL,
	[VALO_EXEN] [numeric](18, 2) NULL,
	[VALO_SUBT] [numeric](18, 2) NULL,
	[LINE_DETA] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_tido_envi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_tido_envi](
	[CORR_ENVI] [numeric](22, 0) NOT NULL,
	[TIPO_DOCU] [numeric](2, 0) NOT NULL,
	[CANT_DOCU] [numeric](10, 0) NOT NULL,
	[CODI_EMPR] [numeric](9, 0) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_unid_cont].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_unid_cont](
	[CODI_UNID] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NOMB_UNID] [varchar](40) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[CODI_CECO] [varchar](16) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CANT_FOLI] [numeric](7, 0) NOT NULL,
	[PORC_REPO] [numeric](3, 0) NOT NULL,
	[TIPO_ORIG] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ESTA_UNID] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[INDI_ALTA] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_usua_pos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_usua_pos](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[CODI_UNID] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NOMB_UNID] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[PASS_UNID] [varchar](12) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_CECO] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_xml].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bel_xml](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[CLOB_DOCU] [text] COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[camb_mone].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[camb_mone](
	[tipo_mone] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[fech_camb] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[valo_camb] [numeric](22, 4) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[cara_gene].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[cara_gene](
	[codi_cage] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_cage] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_cage] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_clie] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_prov] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_empl] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_empr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[CARA_PEEM].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CARA_PEEM](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[CODI_PERS] [varchar](16) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FEIN_CAPE] [datetime] NOT NULL,
	[FETE_CAPE] [datetime] NULL,
	[CODI_CAGE] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_VACG] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[VALO_CAPE] [numeric](22, 4) NULL,
	[COME_CAPE] [varchar](255) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[cara_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[cara_pers](
	[codi_pers] [varchar](16) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[fein_cape] [datetime] NOT NULL,
	[fete_cape] [datetime] NULL,
	[codi_cage] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_vacg] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[valo_cape] [numeric](22, 4) NULL,
	[come_cape] [varchar](255) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[cent_cost].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[cent_cost](
	[codi_ceco] [varchar](16) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nomb_ceco] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ceco1] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_ceco] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[nume_ceco] [numeric](6, 0) NULL,
	[resu_ceco] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[resu_ceco1] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[flag_ramo] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[leve_ceco] [numeric](2, 0) NULL,
	[oper_cuco] [varchar](5) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_zona] [numeric](4, 0) NULL,
	[codi_ofic] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[acti_ceco] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[fein_ceco] [datetime] NULL,
	[fete_ceco] [datetime] NULL,
	[codi_pers] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_ceco1] [numeric](6, 0) NULL,
	[codi_ciud] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ubic] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_exen] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[tiar_ceco] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_CTRL_ARCH].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_CTRL_ARCH](
	[ORIG_GRPO] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NOMB_ARCH] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[EXTE_ARCH] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TIPO_ARCH] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[SUBT_ARCH] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[TABL_RELA] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK01_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK02_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK03_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK04_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK05_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK06_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[TMST_REGI_ARCH] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_LIMP_ARCH].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_LIMP_ARCH](
	[GRPO_LIMP] [numeric](20, 0) NULL,
	[CODI_ARCH] [numeric](20, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_LIMP_GRPO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_LIMP_GRPO](
	[GRPO_LIMP] [numeric](20, 0) NULL,
	[CODI_GRPO] [numeric](20, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_LIMP_LOGG].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_LIMP_LOGG](
	[CORR_LOGG] [numeric](18, 0) NULL,
	[FECH_LOGG] [varchar](22) COLLATE Modern_Spanish_CI_AS NULL,
	[MENS_LOGG] [varchar](256) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbn_list_boto].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dbn_list_boto](
	[CODI_REPO] [varchar](35) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_BOTO] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NOMB_BOTO] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[DESC_BOTO] [varchar](128) COLLATE Modern_Spanish_CI_AS NULL,
	[TIPO_BOTO] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_RESX] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[CLAS_CSS] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PAGE_BOTO] [varchar](128) COLLATE Modern_Spanish_CI_AS NULL,
	[PROC_BOTO] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_PAR1] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_PAR2] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_PAR3] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_PAR4] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_PAR5] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[IMAG_BOTO] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[ORDE_BOTO] [int] NULL,
	[INDI_VISI] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[MODO_BOTO] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[LIST_DETA] [varchar](35) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbn_list_colu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dbn_list_colu](
	[CODI_REPO] [varchar](35) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_COLU] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NOMB_COLU] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[DESC_COLU] [varchar](128) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_RESX] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[CLAS_CSS] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[TIPO_COLU] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ANCH_COLU] [varchar](4) COLLATE Modern_Spanish_CI_AS NULL,
	[ALIN_COLU] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[FORM_COLU] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[INDI_VISI] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[IMAG_COLU] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[JQRY_COLU] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[ORDE_COLU] [int] NULL,
	[TIPO_BUSQ] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[INDI_BUSQ] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[COLU_BUSQ] [varchar](64) COLLATE Modern_Spanish_CI_AS NULL,
	[VERD_BUSQ] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[FALS_BUSQ] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_LIVA] [varchar](64) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbn_list_repo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dbn_list_repo](
	[CODI_REPO] [varchar](35) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TITU_REPO] [varchar](128) COLLATE Modern_Spanish_CI_AS NULL,
	[DESC_REPO] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_RESX] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PROC_REPO] [varchar](64) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_MODU] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[SCRP_SQLS] [text] COLLATE Modern_Spanish_CI_AS NULL,
	[SCRP_SQLO] [text] COLLATE Modern_Spanish_CI_AS NULL,
	[FILT_CKBB] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[PAGE_REPO] [varchar](128) COLLATE Modern_Spanish_CI_AS NULL,
	[MODO] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[CATE_LIST] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[TIPO_REPO] [varchar](64) COLLATE Modern_Spanish_CI_AS NULL,
	[SUBT_CNTX] [varchar](2048) COLLATE Modern_Spanish_CI_AS NULL,
	[MENS_ERRO] [varchar](5000) COLLATE Modern_Spanish_CI_AS NULL /*Not using ANSI TRIM*/
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_LOG_50].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_LOG_50](
	[CODI_LOGG] [numeric](20, 0) IDENTITY(1, 1),
	[TIPO_LOGG] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[TMST_REGI_LOGG] [datetime] NULL,
	[DOCU_TIPO] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_EMEX] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_EMPR] [numeric](9, 0) NULL,
	[TIPO_DOCU] [numeric](3, 0) NULL,
	[FOLI_DOCU] [numeric](10, 0) NULL,
	[CORR_REFE] [numeric](18, 0) NULL,
	[DATO_LOGG] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_SRVD] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[COLA_LOGG] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[COLA_IDQ] [numeric](20, 0) NULL,
	[MOPR_PID] [numeric](10, 0) NULL,
	[MOPR_INIC_PK] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbn_mens_erro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dbn_mens_erro](
	[corr_erro] [int] IDENTITY(1, 1),
	[codi_erro] [int] NOT NULL,
	[mens_erro] [varchar](4000) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[line_erro] [varchar](256) COLLATE Modern_Spanish_CI_AS NULL,
	[prcc_erro] [varchar](256) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_sess] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_MONI_PROC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_MONI_PROC](
	[SERV_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MOPR_PID] [numeric](10, 0) NOT NULL,
	[MOPR_INIC_PK] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MOPR_INIC_OPER] [datetime] NULL,
	[MOPR_NUME_OPER] [numeric](10, 0) NULL,
	[MOPR_NUME_SLEE] [numeric](10, 0) NULL,
	[MOPR_NUME_ERRO] [numeric](10, 0) NULL,
	[MOPR_ESTA_INST] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[MOPR_FECH_REPO] [datetime] NULL,
	[MOPR_SEMA_ESTA] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_MONI_STAT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_MONI_STAT](
	[CODI_SRVD] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MOPR_PID] [numeric](10, 0) NOT NULL,
	[MOST_PERI_OPER] [numeric](12, 0) NOT NULL,
	[MOST_SUMA_OPER] [numeric](10, 0) NOT NULL,
	[MOST_SUMA_SLEE] [numeric](10, 0) NOT NULL,
	[MOST_SUMA_ERRO] [numeric](10, 0) NOT NULL,
	[MOST_NUME_INST] [numeric](3, 0) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_PARA_OPER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_PARA_OPER](
	[PAOR_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PAOR_NOMB_PARA] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PAOR_DESC_PARA] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PAOR_VALO_PARA] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_PARA_SERV].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_PARA_SERV](
	[CODI_EMEX] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PAOR_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PAOR_NOMB_PARA] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PAOR_DESC_PARA] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PAOR_VALO_PARA] [varchar](200) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_PROC_SERV].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_PROC_SERV](
	[CODI_PROC] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ORDE_SERV] [numeric](3, 0) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_PROCESOS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_PROCESOS](
	[CODI_PROC] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DESC_PROC] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbn_repo_rous].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dbn_repo_rous](
	[CODI_REPO] [varchar](35) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_ROUS] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_MODU] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[EXPT_EXLS] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_SERV_SRVD].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_SERV_SRVD](
	[SERV_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ESTA_SERV] [varchar](12) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[SLEE_SERV] [numeric](6, 0) NOT NULL,
	[DEBU_SERV] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[HVID_SERV] [numeric](4, 0) NOT NULL,
	[MODO_SERV] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[COMA_SERV] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[QCAN_PROC] [numeric](6, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_SERVICIO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_SERVICIO](
	[CODI_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DESC_SERV] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[COMA_SERV] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DETA_SERV] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[ORIG_SERV] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[ESTA_ORIG] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[DEST_SERV] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_DESP] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[NOMB_BRIE] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[AUTO_SERV] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[DELA_SERV] [numeric](4, 0) NULL,
	[MTRY_SERV] [numeric](2, 0) NULL,
	[SERV_ORDE] [numeric](2, 0) NULL,
	[SERV_ENAB] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[SERV_ICO1] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[SERV_ICO2] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[SERV_ICO3] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_SERVIDOR].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_SERVIDOR](
	[SERV_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[SERV_DESC] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_SESR_RANG_OPER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_SESR_RANG_OPER](
	[CODI_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_SRVD] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DESD_SERO] [numeric](2, 0) NOT NULL,
	[HAST_SERO] [numeric](2, 0) NOT NULL,
	[PCTI_SERO] [numeric](5, 2) NOT NULL,
	[MINI_SERO] [numeric](3, 0) NOT NULL,
	[MAXI_SERO] [numeric](3, 0) NOT NULL,
	[QSIZ_SERO] [numeric](6, 0) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbn_traza_codi_serv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dbn_traza_codi_serv](
	[codi_serv] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_esta] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[text_serv] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_TRAZA_DOCU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBN_TRAZA_DOCU](
	[CODI_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DOCU_TIPO] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ESTA_DOCU] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FECH_ESTA] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NULL,
	[FOLI_DOCU] [numeric](10, 0) NULL,
	[CORR_REFE] [numeric](18, 0) NULL,
	[OBSE_ESTA] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[ARCH_REFE] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[LOTE_DOCU] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_EMEX] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbnet_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dbnet_server](
	[comando] [varchar](250) COLLATE Modern_Spanish_CI_AS NULL,
	[parametros] [varchar](250) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_ARCH].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBQ_ARCH](
	[CODI_ARCH] [numeric](20, 0) IDENTITY(1, 1),
	[CODI_GRPO] [numeric](20, 0) NULL,
	[ESTA_ARCH] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CTRL_ARCH] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_SERV_ORIG] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[TMST_REGI_ARCH] [datetime] NOT NULL,
	[TMST_PROC_ARCH] [datetime] NOT NULL,
	[CONT_PROC_ARCH] [numeric](6, 0) NOT NULL,
	[NOMB_ARCH] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[EXTE_ARCH] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TIPO_ARCH] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[SUBT_ARCH] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[TABL_RELA] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK01_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK02_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK03_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK04_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK05_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK06_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[TABL_ESTA] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[ULTI_ERRO] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[TIPO_REGI] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_ARCH_CLOB].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBQ_ARCH_CLOB](
	[CODI_ARCH] [numeric](20, 0) NOT NULL,
	[CLOB_ARCH] [text] COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbq_cana].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dbq_cana](
	[CODI_CANA] [numeric](10, 0) IDENTITY(1, 1),
	[TRAN_CANA] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MODO_CANA] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NOMB_CANA] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[SECU_CANA] [numeric](5, 0) NOT NULL,
	[ESTA_CANA] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[SERV_CANA] [varchar](40) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PORT_CANA] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[AUTH_CANA] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[USER_CANA] [varchar](40) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PASS_CANA] [varchar](40) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[VIGE_CANA] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TMST_PROC_CANA] [datetime] NOT NULL,
	[ULTI_ERRO] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbq_erro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dbq_erro](
	[TIPO_COLA] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_COLA] [numeric](20, 0) NOT NULL,
	[TMST_ERRO] [datetime] NOT NULL,
	[CDGO_ERRO] [numeric](6, 0) NOT NULL,
	[MSGE_ERRO] [varchar](2000) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_GRPO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBQ_GRPO](
	[CODI_GRPO] [numeric](20, 0) IDENTITY(1, 1),
	[TRPT_GRPO] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MODO_GRPO] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ESTA_GRPO] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_SERV_ORIG] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[TMST_REGI_GRPO] [datetime] NOT NULL,
	[TMST_PROC_GRPO] [datetime] NOT NULL,
	[CONT_PROC_GRPO] [numeric](6, 0) NOT NULL,
	[ORIG_GRPO] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DEST_GRPO] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NOMB_CANA] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[COPI_GRPO] [varchar](400) COLLATE Modern_Spanish_CI_AS NULL,
	[OCUL_GRPO] [varchar](400) COLLATE Modern_Spanish_CI_AS NULL,
	[REFE_GRPO] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[BODY_GRPO] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[SGNT_GRPO] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[TABL_RELA] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK01_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK02_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK03_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK04_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK05_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[PK06_TABL] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[TABL_ESTA] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[ULTI_ERRO] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_GRPO_ERRO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBQ_GRPO_ERRO](
	[CODI_ARCH] [numeric](20, 0) NULL,
	[CODI_GRPO] [numeric](20, 0) NULL,
	[TMST_ERRO] [datetime] NOT NULL,
	[CDGO_ERRO] [numeric](6, 0) NOT NULL,
	[MSGE_ERRO] [varchar](2000) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbsr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dbsr](
	[dbsr_path] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[dbsr_nmb] [varchar](40) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[dbsr_pipe] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DTE_ACCI_DOCU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DTE_ACCI_DOCU](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[CODI_ACED] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NUIM_SOLI] [numeric](3, 0) NULL,
	[NUIM_TERM] [numeric](3, 0) NULL,
	[LOGO_PUBL] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[PLAN_DOCU] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_acec_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_acec_empr](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[codi_acec] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_acti_econ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_acti_econ](
	[codi_acec] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_acec] [varchar](400) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_acec] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_acec_sup] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_anoto].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_anoto](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_tram] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[luga_rece] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_rece] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_acep] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_repa] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_TRAM] [datetime] NULL,
	[ESTA_TRAM] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DTE_ARCH_ADJU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DTE_ARCH_ADJU](
	[CODI_EMEX] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[POSI_ADJU] [numeric](3, 0) NOT NULL,
	[TIPO_ADJU] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[NMBF_ADJU] [varchar](400) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_audi_foli].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[dte_audi_foli](
	[arch_tran] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL /*Not using ANSI TRIM*/,
	[rutt_emis] [numeric](9, 0) NULL,
	[tipo_docu] [numeric](3, 0) NULL,
	[foli_docu] [numeric](10, 0) NULL,
	[esta_tran] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL /*Not using ANSI TRIM*/
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_audi_tran].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_audi_tran](
	[arch_tran] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_tran] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[cant_tran] [numeric](3, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_auto_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_auto_pers](
	[codi_pers] [varchar](16) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_auto] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[fein_auto] [datetime] NOT NULL,
	[fete_auto] [datetime] NULL,
	[esta_auto] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[defe_auto] [numeric](1, 0) NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_cert_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_cert_pers](
	[codi_pers] [varchar](16) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[fein_cert] [datetime] NOT NULL,
	[codi_orce] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[fete_cert] [datetime] NULL,
	[llav_publ] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[llav_priv] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_cert] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_cert] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_cert] [numeric](22, 0) IDENTITY(1, 1),
	[clob_cert] [text] COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_cesi_auto].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_cesi_auto](
	[codi_empr] [numeric](3, 0) NOT NULL,
	[corr_cesi] [numeric](10, 0) NOT NULL,
	[nume_auto] [numeric](1, 0) NOT NULL,
	[rutt_auto] [numeric](10, 0) NULL,
	[digi_auto] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_auto] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[firm_auto] [varchar](512) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_cesi_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_cesi_docu](
	[codi_empr] [numeric](3, 0) NOT NULL,
	[corr_cesi] [numeric](10, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NULL,
	[foli_docu] [numeric](10, 0) NULL,
	[nume_cesi] [numeric](2, 0) NULL,
	[rutt_emis] [numeric](10, 0) NULL,
	[digi_emis] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_emis] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_rece] [numeric](10, 0) NULL,
	[digi_rece] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_rece] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_emis] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_docu] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_tota] [numeric](18, 0) NULL,
	[rutt_cede] [numeric](10, 0) NULL,
	[digi_cede] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_cede] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_cede] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_cede] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[decl_jura] [varchar](512) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_cesi] [numeric](10, 0) NULL,
	[digi_cesi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_cesi] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_cesi] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_cesi] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_cesi] [numeric](18, 0) NULL,
	[fech_venc] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[otra_cond] [varchar](512) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_deud] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_envi] [numeric](10, 0) NULL,
	[time_envi] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_cesi] [varchar](256) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_UPLD] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_aten] [numeric](10, 0) NULL,
	[mens_envi] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_envi] [numeric](9, 0) NULL,
	[digi_envi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DTE_COMI_CARG].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DTE_COMI_CARG](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_coca] [numeric](2, 0) NOT NULL,
	[tipo_coca] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[glos_coca] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_coca] [numeric](4, 0) NULL,
	[valo_neto_coca] [numeric](18, 0) NULL,
	[valo_exen_coca] [numeric](18, 0) NULL,
	[valo_iva_coca] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_conf_orig].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_conf_orig](
	[CODI_EMPR] [numeric](3, 0) NOT NULL,
	[TIPO_ORIG] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[ASIG_AUTO] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PORC_REPO] [numeric](3, 0) NULL,
	[CANT_FOLI] [numeric](7, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_del_cesion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_del_cesion](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_cesi] [numeric](10, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_cesi] [numeric](2, 0) NOT NULL,
	[fech_del] [varchar](19) COLLATE Modern_Spanish_CI_AS NULL,
	[motivo] [varchar](256) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_pers] [varchar](16) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[arch_cesi_del] [varchar](256) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_desc_item](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_deit] [numeric](4, 0) NOT NULL,
	[tipo_desc] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_desc] [numeric](18, 0) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_item_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_desc_item_h](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_deit] [numeric](4, 0) NOT NULL,
	[tipo_desc] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_desc] [numeric](18, 6) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_item_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_desc_item_p](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_deit] [numeric](4, 0) NOT NULL,
	[tipo_desc] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_desc] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_reca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_desc_reca](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_dere] [numeric](2, 0) NOT NULL,
	[tipo_dere] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[glos_dere] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_valo] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_dere] [numeric](18, 2) NULL,
	[indi_exen] [numeric](1, 0) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[vomo_dere] [numeric](18, 2) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_reca_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_desc_reca_h](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_dere] [numeric](2, 0) NOT NULL,
	[tipo_dere] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[glos_dere] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_valo] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_dere] [numeric](18, 2) NULL,
	[indi_exen] [numeric](1, 0) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[vomo_dere] [numeric](18, 2) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_reca_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_desc_reca_p](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nume_dere] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_dere] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[glos_dere] [varchar](135) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_valo] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_dere] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_exen] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[vomo_dere] [numeric](18, 2) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_acec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_deta_acec](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[corr_acec] [numeric](3, 0) NOT NULL,
	[codi_acec] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_acec_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_deta_acec_h](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[corr_acec] [numeric](3, 0) NOT NULL,
	[codi_acec] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_acec_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_deta_acec_p](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[corr_acec] [numeric](3, 0) NOT NULL,
	[codi_acec] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_codi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_deta_codi](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_codi] [numeric](1, 0) NOT NULL,
	[tipo_codi] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_item] [varchar](35) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_codi_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_deta_codi_h](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_codi] [numeric](1, 0) NOT NULL,
	[tipo_codi] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_item] [varchar](35) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_codi_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_deta_codi_p](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_codi] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_codi] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_item] [varchar](105) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_prse].sql
GO
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

GO
--SqlScripter----[dbo].[dte_deta_prse_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_deta_prse_h](
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
	[neto_item] [numeric](18, 0) NULL,
	[desc_porc] [numeric](5, 2) NULL,
	[reca_porc] [numeric](5, 2) NULL,
	[fech_elab] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_vepr] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_prse_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_deta_prse_p](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[tipo_codi] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_item] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_exen] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_item] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[desc_item] [varchar](1500) COLLATE Modern_Spanish_CI_AS NULL,
	[cant_refe] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[unid_refe] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[prec_refe] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[cant_item] [varchar](36) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_elab] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_vepr] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[unid_medi] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[prec_item] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[prec_mono] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_mone] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[fact_conv] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[desc_porc] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[dcto_item] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[reca_porc] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[reca_item] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_impu] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[neto_item] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DTE_DOCU_LOB].sql
GO
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

GO
--SqlScripter----[dbo].[DTE_DOCU_LOB_H].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DTE_DOCU_LOB_H](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[TIPO_ARCH] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CLOB_DOCU] [text] COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_docu_refe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_docu_refe](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_refe] [numeric](2, 0) NOT NULL,
	[tipo_refe] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_refe] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_otro] [numeric](9, 0) NULL,
	[digi_otro] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_refe] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[razo_refe] [varchar](90) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_refe] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_regl] [numeric](1, 0) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_clie] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_docu_refe_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_docu_refe_h](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_refe] [numeric](2, 0) NOT NULL,
	[tipo_refe] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_refe] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_otro] [numeric](9, 0) NULL,
	[digi_otro] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_refe] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[razo_refe] [varchar](90) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_refe] [numeric](1, 0) NULL,
	[indi_regl] [numeric](1, 0) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_docu_refe_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_docu_refe_p](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nume_refe] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_refe] [varchar](9) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_refe] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_otro] [varchar](27) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_otro] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_refe] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[razo_refe] [varchar](90) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_refe] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_regl] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_enca_docu](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[esta_docu] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[mens_esta] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_envi] [numeric](22, 0) NULL,
	[mens_envi] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_emis] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[entr_bien] [numeric](1, 0) NULL,
	[vent_serv] [numeric](1, 0) NULL,
	[form_pago] [numeric](1, 0) NULL,
	[fech_canc] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[dias_tepa] [numeric](3, 0) NULL,
	[codi_tepa] [varchar](4) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_brut] [char](18) COLLATE Modern_Spanish_CI_AS NULL,
	[moda_pago] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_venc] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_emis] [numeric](9, 0) NULL,
	[peri_desd] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_hast] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_emis] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_emis] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[giro_emis] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_sucu] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_sucu] [numeric](9, 0) NULL,
	[dire_orig] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_orig] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_orig] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_vend] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_mand] [numeric](9, 0) NULL,
	[digi_mand] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_rece] [numeric](9, 0) NULL,
	[digi_rece] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_rece] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_rece] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[giro_rece] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[cont_rece] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_rece] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_rece] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_rece] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_post] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_post] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_post] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_sofa] [numeric](9, 0) NULL,
	[digi_sofa] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[info_tran] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_tran] [numeric](9, 0) NULL,
	[digi_tran] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_dest] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_dest] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_dest] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_neto] [numeric](18, 0) NULL,
	[mont_exen] [numeric](22, 4) NULL,
	[impu_vaag] [numeric](18, 0) NULL,
	[impu_vanr] [numeric](18, 0) NULL,
	[cred_es65] [numeric](18, 0) NULL,
	[gara_enva] [numeric](18, 0) NULL,
	[mont_tota] [numeric](22, 4) NULL,
	[mont_nofa] [numeric](18, 0) NULL,
	[valo_paga] [numeric](18, 0) NULL,
	[sald_ante] [numeric](18, 0) NULL,
	[codi_ceco] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[feho_firm] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_vegd] [numeric](1, 0) NULL,
	[vers_enca] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_rafo] [numeric](18, 0) NULL,
	[feho_ted] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[firm_ted] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_carg] [datetime] NULL,
	[usua_impr] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_impr] [numeric](3, 0) NULL,
	[fech_impr] [datetime] NULL,
	[vige_docu] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_peri] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_envi1] [numeric](22, 0) NULL,
	[esta_docu1] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_nore] [numeric](1, 0) NULL,
	[subt_vese] [numeric](18, 0) NULL,
	[dire_arch] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[impr_dest] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val1] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[val2] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[val3] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[val4] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[val5] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[val6] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[val7] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[val8] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[val9] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_vaag] [numeric](5, 2) NULL,
	[mont_base] [numeric](18, 0) NULL,
	[cola_proc] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_imme] [numeric](3, 0) NULL,
	[arch_resp] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[hace_envi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_impr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_canc] [numeric](18, 0) NULL,
	[sald_inso] [numeric](18, 0) NULL,
	[from_paex] [numeric](2, 0) NULL,
	[tipo_cupa] [numeric](2, 0) NULL,
	[cuen_pago] [numeric](20, 0) NULL,
	[banc_pago] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[glos_pago] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emtr] [numeric](1, 0) NULL,
	[foli_auto] [numeric](4, 0) NULL,
	[fech_auto] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_suad] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[iden_adem] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[iden_reex] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[naci_ext] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[iden_adre] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_rece] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_chof] [numeric](9, 0) NULL,
	[digi_chof] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_chof] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[moda_vent] [numeric](2, 0) NULL,
	[clau_expo] [numeric](2, 0) NULL,
	[tota_clex] [numeric](18, 2) NULL,
	[viaa_tran] [numeric](2, 0) NULL,
	[nomb_tran] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_citr] [numeric](8, 0) NULL,
	[digi_citr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_citr] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[iden_citr] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_book] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_oper] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_puem] [numeric](4, 0) NULL,
	[iden_puem] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_pude] [numeric](4, 0) NULL,
	[iden_pude] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[cant_tara] [numeric](7, 0) NULL,
	[umed_tara] [numeric](2, 0) NULL,
	[tota_brut] [numeric](12, 2) NULL,
	[unid_brut] [numeric](2, 0) NULL,
	[tota_neto] [numeric](12, 2) NULL,
	[unid_neto] [numeric](2, 0) NULL,
	[tota_item] [numeric](18, 0) NULL,
	[tota_bult] [numeric](18, 0) NULL,
	[mont_flet] [numeric](18, 4) NULL,
	[mont_segu] [numeric](18, 4) NULL,
	[pais_rece] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[pais_dest] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_mone] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_baco] [numeric](18, 0) NULL,
	[ivag_prop] [numeric](18, 0) NULL,
	[ivag_terc] [numeric](18, 0) NULL,
	[valo_cone] [numeric](18, 0) NULL,
	[valo_coex] [numeric](18, 0) NULL,
	[ivaag_core] [numeric](18, 0) NULL,
	[tipo_moom] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_camb] [numeric](10, 4) NULL,
	[neto_otmo] [numeric](18, 4) NULL,
	[noaf_otmo] [numeric](18, 4) NULL,
	[faca_otmo] [numeric](18, 4) NULL,
	[maco_otmo] [numeric](18, 4) NULL,
	[ivag_otmo] [numeric](18, 4) NULL,
	[ivno_otmo] [numeric](18, 4) NULL,
	[mont_otmo] [numeric](18, 4) NULL,
	[foli_clie] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_extr] [numeric](6, 0) NULL,
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[comi_neto] [numeric](18, 0) NULL,
	[comi_exen] [numeric](18, 0) NULL,
	[comi_ivaa] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[lote_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_serv] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_cert_Firm] [numeric](22, 0) NULL,
	[codi_form] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL,
	[esta_reme] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[even_recl] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[docu_escd] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[tran_vent] [numeric](1, 0) NULL,
	[tran_comp] [numeric](1, 0) NULL,
	[TIPO_FAES] [numeric](1, 0) NULL,
	[TIPO_TURI] [numeric](1, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_enca_docu_h](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[esta_docu] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[mens_esta] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_envi] [numeric](22, 0) NULL,
	[mens_envi] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_emis] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[entr_bien] [numeric](1, 0) NULL,
	[vent_serv] [numeric](1, 0) NULL,
	[form_pago] [numeric](1, 0) NULL,
	[fech_canc] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[dias_tepa] [numeric](3, 0) NULL,
	[codi_tepa] [varchar](4) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_brut] [char](18) COLLATE Modern_Spanish_CI_AS NULL,
	[moda_pago] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_venc] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_emis] [numeric](9, 0) NULL,
	[peri_desd] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_hast] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_emis] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_emis] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[giro_emis] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_sucu] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_sucu] [numeric](9, 0) NULL,
	[dire_orig] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_orig] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_orig] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_vend] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_mand] [numeric](9, 0) NULL,
	[digi_mand] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_rece] [numeric](9, 0) NULL,
	[digi_rece] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_rece] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_rece] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[giro_rece] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[cont_rece] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_rece] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_rece] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_rece] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_post] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_post] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_post] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_sofa] [numeric](9, 0) NULL,
	[digi_sofa] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[info_tran] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_tran] [numeric](9, 0) NULL,
	[digi_tran] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_dest] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_dest] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_dest] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_neto] [numeric](18, 0) NULL,
	[mont_exen] [numeric](22, 4) NULL,
	[impu_vaag] [numeric](18, 0) NULL,
	[impu_vanr] [numeric](18, 0) NULL,
	[cred_es65] [numeric](18, 0) NULL,
	[gara_enva] [numeric](18, 0) NULL,
	[mont_tota] [numeric](22, 4) NULL,
	[mont_nofa] [numeric](18, 0) NULL,
	[valo_paga] [numeric](18, 0) NULL,
	[sald_ante] [numeric](18, 0) NULL,
	[codi_ceco] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[feho_firm] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_vegd] [numeric](1, 0) NULL,
	[vers_enca] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_rafo] [numeric](18, 0) NULL,
	[feho_ted] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[firm_ted] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_carg] [datetime] NULL,
	[usua_impr] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_impr] [numeric](3, 0) NULL,
	[fech_impr] [datetime] NULL,
	[vige_docu] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_peri] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_envi1] [numeric](22, 0) NULL,
	[esta_docu1] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_nore] [numeric](1, 0) NULL,
	[subt_vese] [numeric](18, 0) NULL,
	[dire_arch] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[impr_dest] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val1] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val2] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val3] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val4] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val5] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val6] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val7] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val8] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val9] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_vaag] [numeric](5, 2) NULL,
	[mont_base] [numeric](18, 0) NULL,
	[cola_proc] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_imme] [numeric](3, 0) NULL,
	[arch_resp] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[hace_envi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_impr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_canc] [numeric](18, 0) NULL,
	[sald_inso] [numeric](18, 0) NULL,
	[from_paex] [numeric](2, 0) NULL,
	[tipo_cupa] [numeric](2, 0) NULL,
	[cuen_pago] [numeric](20, 0) NULL,
	[banc_pago] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[glos_pago] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emtr] [numeric](1, 0) NULL,
	[foli_auto] [numeric](4, 0) NULL,
	[fech_auto] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_suad] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[iden_adem] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[iden_reex] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[naci_ext] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[iden_adre] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_rece] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_chof] [numeric](9, 0) NULL,
	[digi_chof] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_chof] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[moda_vent] [numeric](2, 0) NULL,
	[clau_expo] [numeric](2, 0) NULL,
	[tota_clex] [numeric](18, 2) NULL,
	[viaa_tran] [numeric](2, 0) NULL,
	[nomb_tran] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_citr] [numeric](8, 0) NULL,
	[digi_citr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_citr] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[iden_citr] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_book] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_oper] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_puem] [numeric](4, 0) NULL,
	[iden_puem] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_pude] [numeric](4, 0) NULL,
	[iden_pude] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[cant_tara] [numeric](7, 0) NULL,
	[umed_tara] [numeric](2, 0) NULL,
	[tota_brut] [numeric](12, 2) NULL,
	[unid_brut] [numeric](2, 0) NULL,
	[tota_neto] [numeric](12, 2) NULL,
	[unid_neto] [numeric](2, 0) NULL,
	[tota_item] [numeric](18, 0) NULL,
	[tota_bult] [numeric](18, 0) NULL,
	[mont_flet] [numeric](18, 4) NULL,
	[mont_segu] [numeric](18, 4) NULL,
	[pais_rece] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[pais_dest] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_mone] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_baco] [numeric](18, 0) NULL,
	[ivag_prop] [numeric](18, 0) NULL,
	[ivag_terc] [numeric](18, 0) NULL,
	[valo_cone] [numeric](18, 0) NULL,
	[valo_coex] [numeric](18, 0) NULL,
	[ivaag_core] [numeric](18, 0) NULL,
	[tipo_moom] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_camb] [numeric](6, 4) NULL,
	[neto_otmo] [numeric](18, 4) NULL,
	[noaf_otmo] [numeric](18, 4) NULL,
	[faca_otmo] [numeric](18, 4) NULL,
	[maco_otmo] [numeric](18, 4) NULL,
	[ivag_otmo] [numeric](18, 4) NULL,
	[ivno_otmo] [numeric](18, 4) NULL,
	[mont_otmo] [numeric](18, 4) NULL,
	[CORR_EXTR] [numeric](22, 0) NULL,
	[FOLI_CLIE] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[TIPO_MOTO] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_mone] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_enca_docu_p](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[esta_docu] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mens_esta] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_envi] [varchar](66) COLLATE Modern_Spanish_CI_AS NULL,
	[mens_envi] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[vers_enca] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_emis] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[entr_bien] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_vegd] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[vent_serv] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_brut] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[form_pago] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_canc] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_desd] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_hast] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[moda_pago] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[dias_tepa] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_venc] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_tepa] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_emis] [varchar](27) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_emis] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_emis] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[giro_emis] [varchar](240) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_sucu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_sucu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_orig] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_orig] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_orig] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_vend] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_mand] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_mand] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_rece] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_rece] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_rece] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_rece] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[giro_rece] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[cont_rece] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_rece] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_rece] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_rece] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_post] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_post] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_post] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_sofa] [varchar](27) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_sofa] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[info_tran] [varchar](24) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_tran] [varchar](27) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_tran] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_dest] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_dest] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_dest] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_neto] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_exen] [numeric](22, 4) NULL,
	[impu_vaag] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[impu_vanr] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[cred_es65] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[gara_enva] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_tota] [numeric](22, 4) NULL,
	[mont_nofa] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_paga] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ceco] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[feho_firm] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[feho_ted] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[firm_ted] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_rafo] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_carg] [datetime] NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[sald_ante] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_nore] [numeric](1, 0) NULL,
	[subt_vese] [numeric](18, 0) NULL,
	[dire_arch] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[impr_dest] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val1] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val2] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val3] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val4] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val5] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val6] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val7] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val8] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val9] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_vaag] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_base] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_envi1] [numeric](22, 0) NULL,
	[esta_docu1] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_impr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_canc] [numeric](18, 0) NULL,
	[sald_inso] [numeric](18, 0) NULL,
	[from_paex] [numeric](2, 0) NULL,
	[tipo_cupa] [numeric](2, 0) NULL,
	[cuen_pago] [numeric](20, 0) NULL,
	[banc_pago] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[glos_pago] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emtr] [numeric](1, 0) NULL,
	[foli_auto] [numeric](4, 0) NULL,
	[fech_auto] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_suad] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[iden_adem] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[iden_reex] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[naci_ext] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[iden_adre] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_rece] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_chof] [numeric](9, 0) NULL,
	[digi_chof] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_chof] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[moda_vent] [numeric](2, 0) NULL,
	[clau_expo] [numeric](2, 0) NULL,
	[tota_clex] [numeric](18, 2) NULL,
	[viaa_tran] [numeric](2, 0) NULL,
	[nomb_tran] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_citr] [numeric](8, 0) NULL,
	[digi_citr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_citr] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[iden_citr] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_book] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_oper] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_puem] [numeric](4, 0) NULL,
	[iden_puem] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_pude] [numeric](4, 0) NULL,
	[iden_pude] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[cant_tara] [numeric](7, 0) NULL,
	[umed_tara] [numeric](2, 0) NULL,
	[tota_brut] [numeric](12, 2) NULL,
	[unid_brut] [numeric](2, 0) NULL,
	[tota_neto] [numeric](12, 2) NULL,
	[unid_neto] [numeric](2, 0) NULL,
	[tota_item] [numeric](18, 0) NULL,
	[tota_bult] [numeric](18, 0) NULL,
	[mont_flet] [numeric](18, 4) NULL,
	[mont_segu] [numeric](18, 4) NULL,
	[pais_rece] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[pais_dest] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_mone] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_baco] [numeric](18, 0) NULL,
	[ivag_prop] [numeric](18, 0) NULL,
	[ivag_terc] [numeric](18, 0) NULL,
	[valo_cone] [numeric](18, 0) NULL,
	[valo_coex] [numeric](18, 0) NULL,
	[ivaag_core] [numeric](18, 0) NULL,
	[tipo_moom] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_camb] [numeric](10, 4) NULL,
	[neto_otmo] [numeric](18, 4) NULL,
	[noaf_otmo] [numeric](18, 4) NULL,
	[faca_otmo] [numeric](18, 4) NULL,
	[maco_otmo] [numeric](18, 4) NULL,
	[ivag_otmo] [numeric](18, 4) NULL,
	[ivno_otmo] [numeric](18, 4) NULL,
	[mont_otmo] [numeric](18, 4) NULL,
	[foli_clie] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_extr] [numeric](6, 0) NULL,
	[comi_neto] [numeric](18, 0) NULL,
	[comi_exen] [numeric](18, 0) NULL,
	[comi_ivaa] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_docu].sql
GO
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

GO
--SqlScripter----[dbo].[dte_envi_docu_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_envi_docu_h](
	[codi_empr] [numeric](9, 0) NULL,
	[corr_envi] [numeric](22, 0) NOT NULL,
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
	[nume_aten] [numeric](8, 0) NULL,
	[nume_envi] [numeric](3, 0) NULL,
	[dire_arch] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[cola_proc] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[bole_elec] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_UPLD] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_lob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_envi_lob](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_envi] [numeric](22, 0) NOT NULL,
	[tipo_arch] [varchar](12) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[clob_docu] [text] COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_lob_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_envi_lob_h](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_envi] [numeric](22, 0) NOT NULL,
	[tipo_arch] [varchar](12) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[clob_docu] [text] COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_pdf].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_envi_pdf](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[posi_mail] [numeric](2, 0) NOT NULL,
	[mail_envi] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_cc] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_cco] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_text] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[hace_envi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[ESTA_MLPR] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MAPE_FROM] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[MAPE_REF] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_trace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_envi_trace](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_envi] [numeric](10, 0) NOT NULL,
	[feho_trac] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[esta_trac] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_esta_apro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_esta_apro](
	[codi_esap] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_esap] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_esta_cesi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_esta_cesi](
	[esta_cesi] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_cesi] [varchar](60) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_esta] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mens_esci] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_esci] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_envi] [numeric](10, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_esta_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_esta_docu](
	[esta_docu] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_esdo] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mens_esdo] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_esdo] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_cesi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_impr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[envi_cont] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[help_esdo] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[INDI_LIBR] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_clie] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_esta_envi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_esta_envi](
	[esta_envi] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_esen] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[revi_envi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[revi_docu] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[mens_esen] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_esen] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[envi_cont] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_envi] [numeric](3, 0) NULL,
	[help_esen] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_esta_recl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_esta_recl](
	[codi_recl] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_recl] [varchar](90) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_recl] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_extr_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_extr_docu](
	[CORR_EXTR] [numeric](9, 0) NOT NULL,
	[ESTA_EXTR] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_EMPR] [numeric](3, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NULL,
	[ESTA_DOCU] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[FOLI_DESD] [numeric](10, 0) NULL,
	[FOLI_HAST] [numeric](10, 0) NULL,
	[FECH_DESD] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_HAST] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[ADIC_WHERE] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[RUTT_EMIS] [numeric](10, 0) NULL,
	[RUTT_RECE] [numeric](10, 0) NULL,
	[CODI_SUCU] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_fase].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_fase](
	[fase_esdo] [numeric](3, 0) NOT NULL,
	[fase_desc] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_fase_esta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_fase_esta](
	[fase_esdo] [numeric](3, 0) NULL,
	[esta_docu] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_envi] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_docu1] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_envi1] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_desp] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[orde_esdo] [numeric](3, 0) NULL,
	[colo_esdo] [varchar](11) COLLATE Modern_Spanish_CI_AS NULL,
	[orig_esdo] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[help_esdo] [varchar](500) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_pref] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_sufi] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_exte] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_ensa] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_dire] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[HELP_ESDO2] [varchar](500) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_fase] [numeric](5, 0) IDENTITY(1, 1)
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_foli_clie].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_foli_clie](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[foli_clie] [varchar](12) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[esta_tras] [numeric](1, 0) NOT NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DTE_FORMATOS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DTE_FORMATOS](
	[CODI_EMEX] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_FORM] [numeric](30, 0) IDENTITY(1, 1),
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[TIPO_PLAN] [varchar](4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NOMB_PLAN] [varchar](100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_PLAN] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_orga_cert].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_orga_cert](
	[codi_orce] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nomb_orce] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_orce] [numeric](9, 0) NULL,
	[digi_orce] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_proc_evnt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_proc_evnt](
	[corr_evnt] [numeric](10, 0) NOT NULL,
	[esta_evnt] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[fech_evnt] [datetime] NOT NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_docu] [numeric](18, 0) NOT NULL,
	[rutt_rece] [numeric](10, 0) NOT NULL,
	[digi_rece] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[rutt_emis] [numeric](10, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[evnt_sii] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[fech_proc_evnt] [datetime] NOT NULL,
	[cont_proc_evnt] [numeric](6, 0) NOT NULL,
	[mens_erro_evnt] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_rtrn] [numeric](4, 0) NULL,
	[resp_sii] [text] COLLATE Modern_Spanish_CI_AS NULL,
	[curl_para] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_emis] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_rang_foli].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_rang_foli](
	[corr_rafo] [numeric](18, 0) IDENTITY(1, 1),
	[codi_empr] [numeric](9, 0) NULL,
	[tipo_dora] [numeric](3, 0) NULL,
	[foli_desd] [numeric](10, 0) NULL,
	[foli_hast] [numeric](10, 0) NULL,
	[fech_soli] [datetime] NULL,
	[fech_auto] [datetime] NULL,
	[codi_ceco] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_rafo] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[llav_priv_rafo] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[llav_publ_rafo] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[ulti_foli] [numeric](10, 0) NULL,
	[rutt_empr] [numeric](10, 0) NULL,
	[digi_empr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[llav_puco_modu] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[llav_puco_expo] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[llav_pusi_iden] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ofic] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_pers] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[firm_sii] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_caf] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[razo_soci] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[ulti_asig] [numeric](10, 0) NULL,
	[caf_ingr] [numeric](2, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_venc] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_rang_foli_temp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_rang_foli_temp](
	[p_spid] [numeric](11, 0) NOT NULL,
	[corr_rafo] [numeric](11, 0) NOT NULL,
	[tipo_dora] [numeric](11, 0) NOT NULL,
	[foli_inic] [numeric](11, 0) NOT NULL,
	[foli_fina] [numeric](11, 0) NOT NULL,
	[fech_actu] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_reca_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_reca_item](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_reit] [numeric](4, 0) NOT NULL,
	[tipo_reca] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_reca] [numeric](18, 6) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_reca_item_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_reca_item_h](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_reit] [numeric](4, 0) NOT NULL,
	[tipo_reca] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_reca] [numeric](18, 6) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_reca_item_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_reca_item_p](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_reit] [numeric](4, 0) NOT NULL,
	[tipo_reca] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_reca] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suca_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_suca_item](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_suca] [numeric](4, 0) NOT NULL,
	[codi_suca] [varchar](35) COLLATE Modern_Spanish_CI_AS NULL,
	[suca_dist] [numeric](18, 6) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_suca] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suca_item_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_suca_item_h](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_suca] [numeric](4, 0) NOT NULL,
	[codi_suca] [varchar](35) COLLATE Modern_Spanish_CI_AS NULL,
	[suca_dist] [numeric](18, 6) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suca_item_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_suca_item_p](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_suca] [numeric](4, 0) NOT NULL,
	[codi_suca] [varchar](105) COLLATE Modern_Spanish_CI_AS NULL,
	[suca_dist] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_sucu_emis].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_sucu_emis](
	[codi_sucu] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nomb_sucu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[diip_sucu] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[mens_esen] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_esen] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DTE_SUMA_IMOM].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DTE_SUMA_IMOM](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[CODI_IMPU] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[valo_imre] [numeric](18, 4) NULL,
	[TASA_IMPU] [numeric](5, 2) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suma_impu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_suma_impu](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[codi_impu] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mont_impu] [numeric](18, 0) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_impu] [numeric](5, 2) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suma_impu_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_suma_impu_h](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[codi_impu] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mont_impu] [numeric](18, 0) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_impu] [numeric](5, 2) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suma_impu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_suma_impu_p](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_impu] [varchar](18) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mont_impu] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_impu] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_tido_envi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_tido_envi](
	[corr_envi] [numeric](22, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[cant_docu] [numeric](10, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_tido_envi_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_tido_envi_h](
	[corr_envi] [numeric](22, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[cant_docu] [numeric](10, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_tipo_bult].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_tipo_bult](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[codi_tibu] [numeric](3, 0) NOT NULL,
	[cant_bult] [numeric](10, 0) NULL,
	[iden_marc] [varchar](255) COLLATE Modern_Spanish_CI_AS NULL,
	[iden_cont] [varchar](25) COLLATE Modern_Spanish_CI_AS NULL,
	[sello_cont] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_emis] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_tipo_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_tipo_docu](
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[desc_tido] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[docu_elec] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_impr] [numeric](3, 0) NULL,
	[orde_envi] [numeric](3, 0) NULL,
	[indi_dnte] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[docu_refe] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[bole_elec] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_imme] [numeric](3, 0) NULL,
	[indi_cesi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[INDI_RECI] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[repo_auto] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[clas_docu] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_como] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_docu] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[tram_impr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[tram_imme] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_digi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_libr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_tipo_impu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_tipo_impu](
	[codi_impu] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_impu] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[porc_impu] [numeric](5, 2) NULL,
	[nomb_impu] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_impu] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_tipo_orig].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_tipo_orig](
	[TIPO_ORIG] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DESC_ORIG] [varchar](40) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_trace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_trace](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](10, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[feho_trac] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[esta_trac] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_usua_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_usua_docu](
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_vali_erro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dte_vali_erro](
	[codi_erro] [varchar](12) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_erro] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_erro] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_sqls] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_dnte] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dtec_address].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dtec_address](
	[corr_addr] [numeric](18, 0) IDENTITY(1, 1),
	[name_addr] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[urll_addr] [varchar](120) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[meth_addr] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[user_mail] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[pswd_mail] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[user_prxy] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[pswd_prxy] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dtec_empr_auth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dtec_empr_auth](
	[corr_empr] [numeric](18, 0) IDENTITY(1, 1),
	[hold_empr] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_empr] [numeric](9, 0) NOT NULL,
	[digi_empr] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nomb_empr] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[clav_acsi] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[chng_ssii] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[cert_empr] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[tokn_empr] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[tokn_tmst] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dtec_message].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dtec_message](
	[corr_msge] [numeric](18, 0) IDENTITY(1, 1),
	[name_msge] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_msge] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tokn_used] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tmpl_msge] [varchar](120) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dtec_queue_msge].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dtec_queue_msge](
	[corr_qmsg] [numeric](18, 0) IDENTITY(1, 1),
	[name_msge] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[name_addr] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[rutt_empr] [numeric](9, 0) NOT NULL,
	[digi_empr] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[appl_name] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[curl_para] [varchar](2000) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[esta_qmsg] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tmst_regi] [datetime] NOT NULL,
	[tmst_proc] [datetime] NOT NULL,
	[tmst_resp] [datetime] NULL,
	[iden_docu] [numeric](22, 0) NULL,
	[iden_evnt] [numeric](22, 0) NULL,
	[resp_qmsg] [varchar](8000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_desc_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_desc_item](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_deit] [numeric](4, 0) NOT NULL,
	[tipo_desc] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_desc] [numeric](18, 6) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_desc_item_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_desc_item_h](
	[corr_docu] [numeric](18, 0) NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[tipo_docu] [numeric](3, 0) NULL,
	[foli_docu] [numeric](10, 0) NULL,
	[nume_line] [numeric](4, 0) NULL,
	[corr_deit] [numeric](4, 0) NULL,
	[tipo_desc] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_desc] [numeric](18, 6) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_desc_item_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_desc_item_p](
	[codi_empr] [numeric](9, 0) NULL,
	[corr_docu] [numeric](18, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_deit] [numeric](4, 0) NOT NULL,
	[tipo_desc] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_desc] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_desc_reca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_desc_reca](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_dere] [numeric](2, 0) NOT NULL,
	[tipo_dere] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[glos_dere] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_valo] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_dere] [numeric](18, 2) NULL,
	[indi_exen] [numeric](1, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_desc_reca_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_desc_reca_h](
	[corr_docu] [numeric](18, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_dere] [numeric](2, 0) NOT NULL,
	[tipo_dere] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[glos_dere] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_valo] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_dere] [numeric](18, 2) NULL,
	[indi_exen] [numeric](1, 0) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_desc_reca_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_desc_reca_p](
	[codi_empr] [numeric](9, 0) NULL,
	[corr_docu] [numeric](18, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_dere] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_dere] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[glos_dere] [varchar](135) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_valo] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_dere] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_exen] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_acec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_deta_acec](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[corr_acec] [numeric](2, 0) NOT NULL,
	[codi_acec] [varchar](5) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_acec_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_deta_acec_h](
	[corr_docu] [numeric](18, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[corr_acec] [numeric](2, 0) NOT NULL,
	[codi_acec] [varchar](5) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_acec_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_deta_acec_p](
	[codi_empr] [numeric](9, 0) NULL,
	[corr_docu] [numeric](18, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_acec] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_acec] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_codi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_deta_codi](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_codi] [numeric](1, 0) NOT NULL,
	[tipo_codi] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_item] [varchar](35) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_codi_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_deta_codi_h](
	[corr_docu] [numeric](18, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_codi] [numeric](1, 0) NOT NULL,
	[tipo_codi] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_item] [varchar](35) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_codi_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_deta_codi_p](
	[codi_empr] [numeric](9, 0) NULL,
	[corr_docu] [numeric](18, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_codi] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_codi] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_item] [varchar](105) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_prse].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_deta_prse](
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
	[neto_item] [numeric](18, 0) NULL,
	[desc_porc] [numeric](5, 2) NULL,
	[reca_porc] [numeric](5, 2) NULL,
	[fech_elab] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_vepr] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_prse_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_deta_prse_h](
	[corr_docu] [numeric](18, 0) NOT NULL,
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
	[neto_item] [numeric](18, 0) NULL,
	[desc_porc] [numeric](5, 2) NULL,
	[reca_porc] [numeric](5, 2) NULL,
	[fech_elab] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_vepr] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_prse_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_deta_prse_p](
	[codi_empr] [numeric](9, 0) NULL,
	[corr_docu] [numeric](18, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[tipo_codi] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_item] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_exen] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_item] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[desc_item] [varchar](1500) COLLATE Modern_Spanish_CI_AS NULL,
	[cant_refe] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[unid_refe] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[prec_refe] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[cant_item] [varchar](36) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_elab] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_vepr] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[unid_medi] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[prec_item] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[prec_mono] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_mone] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[fact_conv] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[desc_porc] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[dcto_item] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[reca_porc] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[reca_item] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_impu] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[neto_item] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_docu_lob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_docu_lob](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_docu] [numeric](22, 0) NOT NULL,
	[tipo_arch] [varchar](12) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[clob_docu] [text] COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_docu_lob_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_docu_lob_h](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_docu] [numeric](22, 0) NOT NULL,
	[tipo_arch] [varchar](12) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[clob_docu] [text] COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_docu_refe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_docu_refe](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_refe] [numeric](2, 0) NOT NULL,
	[tipo_refe] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_refe] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_otro] [numeric](9, 0) NULL,
	[digi_otro] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_refe] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[razo_refe] [varchar](90) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_refe] [numeric](1, 0) NULL,
	[indi_regl] [numeric](1, 0) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_docu_refe_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_docu_refe_h](
	[corr_docu] [numeric](18, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_refe] [numeric](2, 0) NOT NULL,
	[tipo_refe] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_refe] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_otro] [numeric](9, 0) NULL,
	[digi_otro] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_refe] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[razo_refe] [varchar](90) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_refe] [numeric](1, 0) NULL,
	[indi_regl] [numeric](1, 0) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_docu_refe_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_docu_refe_p](
	[codi_empr] [numeric](9, 0) NULL,
	[corr_docu] [numeric](18, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_refe] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_refe] [varchar](9) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_refe] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_otro] [varchar](27) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_otro] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_refe] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[razo_refe] [varchar](90) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_refe] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_regl] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_enca_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_enca_docu](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[esta_docu] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[mens_esta] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_envi] [numeric](22, 0) NULL,
	[mens_envi] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_emis] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[entr_bien] [numeric](1, 0) NULL,
	[vent_serv] [numeric](1, 0) NULL,
	[form_pago] [numeric](1, 0) NULL,
	[fech_canc] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_brut] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[moda_pago] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_venc] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[dias_tepa] [numeric](3, 0) NULL,
	[codi_tepa] [varchar](4) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_emis] [numeric](9, 0) NULL,
	[peri_desd] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_hast] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_emis] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_emis] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[giro_emis] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_sucu] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_sucu] [numeric](9, 0) NULL,
	[dire_orig] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_orig] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_orig] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_vend] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_mand] [numeric](9, 0) NULL,
	[digi_mand] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_rece] [numeric](9, 0) NULL,
	[digi_rece] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_rece] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_rece] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[giro_rece] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[cont_rece] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_rece] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_rece] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_rece] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_post] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_post] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_post] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_sofa] [numeric](9, 0) NULL,
	[digi_sofa] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[info_tran] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_tran] [numeric](9, 0) NULL,
	[digi_tran] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_dest] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_dest] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_dest] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_neto] [numeric](18, 0) NULL,
	[mont_exen] [numeric](18, 0) NULL,
	[impu_vaag] [numeric](18, 0) NULL,
	[impu_vanr] [numeric](18, 0) NULL,
	[cred_es65] [numeric](18, 0) NULL,
	[gara_enva] [numeric](18, 0) NULL,
	[mont_tota] [numeric](18, 0) NULL,
	[mont_nofa] [numeric](18, 0) NULL,
	[valo_paga] [numeric](18, 0) NULL,
	[sald_ante] [numeric](18, 0) NULL,
	[codi_ceco] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[feho_firm] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_vegd] [numeric](1, 0) NULL,
	[vers_enca] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_rafo] [numeric](18, 0) NULL,
	[feho_ted] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[firm_ted] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_carg] [datetime] NULL,
	[nume_impr] [numeric](3, 0) NULL,
	[fech_impr] [datetime] NULL,
	[usua_impr] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[vige_docu] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_peri] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_nore] [numeric](1, 0) NULL,
	[subt_vese] [numeric](18, 0) NULL,
	[dire_arch] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_vaag] [numeric](5, 2) NULL,
	[mont_base] [numeric](18, 0) NULL,
	[codi_esap] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_esap] [datetime] NULL,
	[usua_esap] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[razo_esap] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_enca_docu_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_enca_docu_h](
	[corr_docu] [numeric](18, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[esta_docu] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[mens_esta] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_envi] [numeric](22, 0) NULL,
	[mens_envi] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_emis] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[entr_bien] [numeric](1, 0) NULL,
	[vent_serv] [numeric](1, 0) NULL,
	[form_pago] [numeric](1, 0) NULL,
	[fech_canc] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_brut] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[moda_pago] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_venc] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[dias_tepa] [numeric](3, 0) NULL,
	[codi_tepa] [varchar](4) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_emis] [numeric](9, 0) NULL,
	[peri_desd] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_hast] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_emis] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_emis] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[giro_emis] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_sucu] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_sucu] [numeric](9, 0) NULL,
	[dire_orig] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_orig] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_orig] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_vend] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_mand] [numeric](9, 0) NULL,
	[digi_mand] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_rece] [numeric](9, 0) NULL,
	[digi_rece] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_rece] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_rece] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[giro_rece] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[cont_rece] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_rece] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_rece] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_rece] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_post] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_post] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_post] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_sofa] [numeric](9, 0) NULL,
	[digi_sofa] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[info_tran] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_tran] [numeric](9, 0) NULL,
	[digi_tran] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_dest] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_dest] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_dest] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_neto] [numeric](18, 0) NULL,
	[mont_exen] [numeric](18, 0) NULL,
	[impu_vaag] [numeric](18, 0) NULL,
	[impu_vanr] [numeric](18, 0) NULL,
	[cred_es65] [numeric](18, 0) NULL,
	[gara_enva] [numeric](18, 0) NULL,
	[mont_tota] [numeric](18, 0) NULL,
	[mont_nofa] [numeric](18, 0) NULL,
	[valo_paga] [numeric](18, 0) NULL,
	[sald_ante] [numeric](18, 0) NULL,
	[codi_ceco] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[feho_firm] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_vegd] [numeric](1, 0) NULL,
	[vers_enca] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_rafo] [numeric](18, 0) NULL,
	[feho_ted] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[firm_ted] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_carg] [datetime] NULL,
	[nume_impr] [numeric](3, 0) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_nore] [numeric](1, 0) NULL,
	[subt_vese] [numeric](18, 0) NULL,
	[dire_arch] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_vaag] [numeric](5, 2) NULL,
	[mont_base] [numeric](18, 0) NULL,
	[codi_esap] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_esap] [datetime] NULL,
	[usua_esap] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[razo_esap] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_tras] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[RECI_RECE] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_cont] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_USUA_APRO] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[MAIL_USUA_APRO] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_enca_docu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_enca_docu_p](
	[codi_empr] [numeric](9, 0) NULL,
	[corr_docu] [numeric](18, 0) IDENTITY(1, 1),
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_docu] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mens_esta] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_envi] [numeric](22, 0) NULL,
	[mens_envi] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[vers_enca] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_emis] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[entr_bien] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_vegd] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[vent_serv] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_brut] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[form_pago] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_canc] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_desd] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_hast] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[moda_pago] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[dias_tepa] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_venc] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_tepa] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_emis] [varchar](27) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_emis] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_emis] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[giro_emis] [varchar](240) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_sucu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_sucu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_orig] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_orig] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_orig] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_vend] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_mand] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_mand] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_rece] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_rece] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_rece] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_rece] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[giro_rece] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[cont_rece] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_rece] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_rece] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_rece] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_post] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_post] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_post] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_sofa] [varchar](27) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_sofa] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[info_tran] [varchar](24) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_tran] [varchar](27) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_tran] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_dest] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[comu_dest] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[ciud_dest] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_neto] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_exen] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[impu_vaag] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[impu_vanr] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[cred_es65] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[gara_enva] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_tota] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_nofa] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_paga] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[sald_ante] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ceco] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[feho_firm] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[feho_ted] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[firm_ted] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_rafo] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_carg] [datetime] NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_nore] [numeric](1, 0) NULL,
	[subt_vese] [numeric](18, 0) NULL,
	[dire_arch] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_vaag] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_base] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_impr] [numeric](3, 0) NULL,
	[codi_esap] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_esap] [datetime] NULL,
	[usua_esap] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[razo_esap] [varchar](256) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_tras] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[RECI_RECE] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_usua_apro] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_usua_apro] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_cont] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[INDI_CONTA] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_serv] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL,
	[codi_reme] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_reme] [datetime] NULL,
	[usua_reme] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_nume] [numeric](30, 0) NULL,
	[even_recl] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[usua_recl] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_recl] [datetime] NULL,
	[csii_recl] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_rece_sii] [datetime] NULL,
	[tipo_camb] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[LINK_PDF] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_extr_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_extr_docu](
	[corr_extr] [numeric](10, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[corr_docu] [numeric](22, 0) NOT NULL,
	[nomb_arch] [varchar](300) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_fase].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_fase](
	[fase_esdo] [numeric](3, 0) NOT NULL,
	[fase_desc] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_fase_esta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_fase_esta](
	[fase_esdo] [numeric](3, 0) NOT NULL,
	[esta_docu] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_envi] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_esap] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_desp] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[orde_esdo] [numeric](3, 0) NOT NULL,
	[colo_esdo] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[orig_esdo] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[help_esdo] [varchar](500) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_pref] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_sufi] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_exte] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_ensa] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[arch_dire] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_reca_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_reca_item](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_reit] [numeric](4, 0) NOT NULL,
	[tipo_reca] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_reca] [numeric](18, 6) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_reca_item_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_reca_item_h](
	[corr_docu] [numeric](18, 0) NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[tipo_docu] [numeric](3, 0) NULL,
	[foli_docu] [numeric](10, 0) NULL,
	[nume_line] [numeric](4, 0) NULL,
	[corr_reit] [numeric](4, 0) NULL,
	[tipo_reca] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_reca] [numeric](18, 6) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_reca_item_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_reca_item_p](
	[codi_empr] [numeric](9, 0) NULL,
	[corr_docu] [numeric](18, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_reit] [numeric](4, 0) NOT NULL,
	[tipo_reca] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_reca] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_rece_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_rece_docu](
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
	[posi_envi] [numeric](18, 0) NULL,
	[bloc_envi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_arch] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[inde_envi] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[firm_envi] [varchar](512) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_RECE] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[DIGI_VALU] [varchar](28) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_arch] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[NOMB_ORIG] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_serv] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_rece_docu_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_rece_docu_h](
	[codi_empr] [numeric](9, 0) NULL,
	[corr_envi] [numeric](22, 0) NOT NULL,
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
	[posi_envi] [numeric](18, 0) NULL,
	[bloc_envi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_arch] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[inde_envi] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[firm_envi] [varchar](512) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_arch] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_rece] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_valu] [varchar](28) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_rece_lob].sql
GO
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

GO
--SqlScripter----[dbo].[dto_rece_lob_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_rece_lob_h](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_rece] [numeric](22, 0) NOT NULL,
	[tipo_arch] [varchar](12) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[clob_docu] [text] COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_suca_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_suca_item](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_suca] [numeric](4, 0) NOT NULL,
	[codi_suca] [varchar](35) COLLATE Modern_Spanish_CI_AS NULL,
	[suca_dist] [numeric](18, 6) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_suca_item_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_suca_item_h](
	[corr_docu] [numeric](18, 0) NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[tipo_docu] [numeric](3, 0) NULL,
	[foli_docu] [numeric](10, 0) NULL,
	[nume_line] [numeric](4, 0) NULL,
	[corr_suca] [numeric](4, 0) NULL,
	[codi_suca] [varchar](35) COLLATE Modern_Spanish_CI_AS NULL,
	[suca_dist] [numeric](18, 6) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_suca_item_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_suca_item_p](
	[codi_empr] [numeric](9, 0) NULL,
	[corr_docu] [numeric](18, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_line] [numeric](4, 0) NOT NULL,
	[corr_suca] [numeric](4, 0) NOT NULL,
	[codi_suca] [varchar](105) COLLATE Modern_Spanish_CI_AS NULL,
	[suca_dist] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_suce_esap].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_suce_esap](
	[codi_empr] [numeric](3, 0) NOT NULL,
	[corr_docu] [numeric](18, 0) NOT NULL,
	[corr_suce] [numeric](18, 0) IDENTITY(1, 1),
	[esta_docu] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_esap] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_esap] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[usua_esap] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[razo_esap] [varchar](256) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_suma_impu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_suma_impu](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[codi_impu] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mont_impu] [numeric](18, 0) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_impu] [numeric](5, 2) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_suma_impu_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_suma_impu_h](
	[corr_docu] [numeric](18, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[codi_impu] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mont_impu] [numeric](18, 0) NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_impu] [numeric](5, 2) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_suma_impu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_suma_impu_p](
	[codi_empr] [numeric](9, 0) NULL,
	[corr_docu] [numeric](18, 0) NOT NULL,
	[tipo_docu] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_impu] [varchar](18) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mont_impu] [varchar](54) COLLATE Modern_Spanish_CI_AS NULL,
	[mnsg_erro] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_impu] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_tido_rece].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_tido_rece](
	[corr_envi] [numeric](22, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[cant_docu] [numeric](10, 0) NULL,
	[cant_info] [numeric](10, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_part] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_tido_rece_h].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_tido_rece_h](
	[corr_envi] [numeric](22, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[cant_docu] [numeric](10, 0) NULL,
	[cant_info] [numeric](10, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_trace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dto_trace](
	[rutt_emis] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[feho_trac] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[esta_trac] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dual].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dual](
	[dummy] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[empr](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[nomb_empr] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[giro_empr] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_empr] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_comu] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ciud] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_empr] [numeric](11, 0) NULL,
	[digi_empr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ramo] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[nfan_empr] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_pers] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[empr_codg] [numeric](3, 0) NULL,
	[empr_nomb] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[fono_empr] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_repl] [numeric](11, 0) NULL,
	[dgto_repl] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_repl] [varchar](35) COLLATE Modern_Spanish_CI_AS NULL,
	[caca_empr] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[mutu_empr] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[pomu_empr] [numeric](6, 2) NULL,
	[poca_empr] [numeric](6, 2) NULL,
	[feca_empr] [datetime] NULL,
	[femu_empr] [datetime] NULL,
	[cine_empr] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[cuen_empr] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[caja_empr] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[color_empr] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[logo_empr] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[clav_encr] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[asun_fact_empr] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[text_fact_empr] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[empr_exte].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[empr_exte](
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nomb_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[stat_emex] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[fein_emex] [datetime] NOT NULL,
	[fete_emex] [datetime] NULL,
	[owne_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[pass_emex] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[path_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[head_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[side_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[back_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[spla_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[logo_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[sweb_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[bann_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[urba_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[gint_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[intr_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[pagi_inic] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[stri_conn] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[habi_siti] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[colo_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[come_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[form_emex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[serv_sweb] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[serv_srep] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[serv_scgi] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[ipws_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[ptws_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[usua_dbss] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[usua_web] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[pass_usua_web] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[usua_eul] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[pass_usua_eul] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[REPO_EMEX] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[EMEX_REF] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[EMEX_BODY] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[EMEX_FROM] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[foli_anul].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[foli_anul](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[codi_zona] [numeric](4, 0) NOT NULL,
	[codi_ofic] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_como] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_foan] [numeric](10, 0) NOT NULL,
	[fech_foan] [datetime] NOT NULL,
	[codi_empl] [numeric](9, 0) NULL,
	[codi_ceco] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_conf] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_cara_libr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_cara_libr](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[CORR_LIBE] [numeric](12, 0) NOT NULL,
	[FOLI_NOTI] [numeric](10, 0) NULL,
	[RUTT_EMIS] [numeric](9, 0) NULL,
	[DIGI_EMIS] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[RUTT_ENVI] [numeric](9, 0) NULL,
	[DIGI_ENVI] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[PERI_TRIB] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_RESO] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[NUME_RESO] [numeric](6, 0) NULL,
	[TIPO_LIBR] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[TIPO_ENVI] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[NUME_SEGM] [numeric](6, 0) NULL,
	[FECH_CREA] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_INIC] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_FINA] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_ENVI] [varchar](25) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_deta_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_deta_docu](
	[corr_libe] [numeric](22, 0) NOT NULL,
	[codi_soli] [numeric](22, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[tipo_serv] [numeric](2, 0) NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[foli_anul] [numeric](1, 0) NULL,
	[fech_emis] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_venc] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_desd] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_hast] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_sucu] [numeric](8, 0) NULL,
	[rutt_asoc] [numeric](9, 0) NULL,
	[digi_asoc] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_incl] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_exen] [numeric](18, 0) NULL,
	[mont_tota] [numeric](18, 0) NULL,
	[mont_nofa] [numeric](18, 0) NULL,
	[mont_peri] [numeric](18, 0) NULL,
	[tota_saan] [numeric](18, 0) NULL,
	[tota_vapa] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_deta_libr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_deta_libr](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[CORR_LIBE] [numeric](12, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[FOLI_ANUL] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[TIPO_SERV] [numeric](1, 0) NULL,
	[FECH_EMIS] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_VENC] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[PERI_DESD] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[PERI_HAST] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_SUCU] [numeric](9, 0) NULL,
	[RUTT_RECE] [numeric](9, 0) NULL,
	[DIGI_RECE] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_INTE] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[MONT_EXEN] [numeric](18, 0) NULL,
	[MONT_TOTA] [numeric](18, 0) NULL,
	[MONT_NOFA] [numeric](18, 0) NULL,
	[TOTA_PERI] [numeric](18, 0) NULL,
	[SALD_ANTE] [numeric](18, 0) NULL,
	[VALO_PAGA] [numeric](18, 0) NULL,
	[MONT_NETO] [numeric](18, 0) NULL,
	[TASA_VAAG] [numeric](18, 0) NULL,
	[FOLI_NOTI] [numeric](10, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_enca_libr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_enca_libr](
	[corr_libe] [numeric](22, 0) NOT NULL,
	[codi_soli] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[rutt_emis] [numeric](9, 0) NULL,
	[digi_emis] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_peri] [varchar](7) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_libr] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_envi] [varchar](7) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_segm] [numeric](3, 0) NULL,
	[foli_noti] [numeric](3, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_noti_libr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_noti_libr](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[FOLI_NOTI] [numeric](10, 0) NOT NULL,
	[FECH_NOTI] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[PERI_DESD] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[PERI_HAST] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[DESC_LIBR] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_peri_tise].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_peri_tise](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[CORR_LIBE] [numeric](12, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[INDI_SERV] [numeric](1, 0) NOT NULL,
	[PERI_DEVE] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TOTA_DOCU] [numeric](18, 0) NULL,
	[TOTA_EXEN] [numeric](18, 0) NULL,
	[TOTA_NETO] [numeric](18, 0) NULL,
	[TASA_IVAA] [numeric](18, 0) NULL,
	[MONT_IVAA] [numeric](18, 0) NULL,
	[MONT_TOTA] [numeric](18, 0) NULL,
	[MONT_NOFA] [numeric](18, 0) NULL,
	[TOTA_PERI] [numeric](18, 0) NULL,
	[SALD_ANTE] [numeric](18, 0) NULL,
	[VALO_PAGA] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_resu_peri].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_resu_peri](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[CORR_LIBE] [numeric](12, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[CANT_ANUL] [numeric](10, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_resu_segm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_resu_segm](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[CORR_LIBE] [numeric](12, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[CANT_ANUL] [numeric](10, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_segm_tise].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_segm_tise](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[CORR_LIBE] [numeric](12, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[INDI_SERV] [numeric](1, 0) NOT NULL,
	[PERI_DEVE] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TOTA_DOCU] [numeric](18, 0) NULL,
	[TOTA_EXEN] [numeric](18, 0) NULL,
	[MONT_TOTA] [numeric](18, 0) NULL,
	[MONT_NOFA] [numeric](18, 0) NULL,
	[MONT_PERI] [numeric](18, 0) NULL,
	[SALD_ANTE] [numeric](18, 0) NULL,
	[VALO_PAGA] [numeric](18, 0) NULL,
	[MONT_NETO] [numeric](18, 0) NULL,
	[TASA_VAAG] [numeric](18, 0) NULL,
	[TOTA_VAAG] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_serv_peri].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_serv_peri](
	[tipo_docu] [numeric](2, 0) NOT NULL,
	[codi_soli] [numeric](22, 0) NOT NULL,
	[corr_libe] [numeric](22, 0) NOT NULL,
	[codi_serv] [numeric](2, 0) NOT NULL,
	[tipo_serv] [numeric](2, 0) NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[peri_deve] [varchar](7) COLLATE Modern_Spanish_CI_AS NULL,
	[tota_docu] [numeric](10, 0) NULL,
	[tota_exen] [numeric](18, 0) NULL,
	[mont_neto] [numeric](18, 0) NULL,
	[tasa_vaag] [numeric](5, 2) NULL,
	[mont_vaag] [numeric](18, 0) NULL,
	[mont_tota] [numeric](18, 0) NULL,
	[tota_nofa] [numeric](18, 0) NULL,
	[tota_peri] [numeric](18, 0) NULL,
	[tota_saan] [numeric](18, 0) NULL,
	[tota_vapa] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_serv_segm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_serv_segm](
	[tipo_docu] [numeric](2, 0) NOT NULL,
	[codi_soli] [numeric](22, 0) NOT NULL,
	[corr_libe] [numeric](22, 0) NOT NULL,
	[codi_serv] [numeric](2, 0) NOT NULL,
	[tipo_serv] [numeric](2, 0) NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[peri_deve] [varchar](7) COLLATE Modern_Spanish_CI_AS NULL,
	[tota_docu] [numeric](10, 0) NULL,
	[tota_exen] [numeric](18, 0) NULL,
	[mont_tota] [numeric](18, 0) NULL,
	[tota_nofa] [numeric](18, 0) NULL,
	[tota_peri] [numeric](18, 0) NULL,
	[tota_saan] [numeric](18, 0) NULL,
	[tota_vapa] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_soli_libr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_soli_libr](
	[codi_soli] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[peri_desd] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_hast] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_rece] [numeric](9, 0) NULL,
	[digi_rece] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_mini] [numeric](18, 0) NULL,
	[nume_dtes] [numeric](10, 0) NULL,
	[foli_noti] [numeric](3, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_tota_peri].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_tota_peri](
	[corr_libe] [numeric](22, 0) NOT NULL,
	[codi_soli] [numeric](22, 0) NOT NULL,
	[tipo_docu] [numeric](2, 0) NOT NULL,
	[cant_foan] [numeric](10, 0) NULL,
	[codi_empr] [numeric](9, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_tota_segm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lbe_tota_segm](
	[corr_libe] [numeric](22, 0) NOT NULL,
	[codi_soli] [numeric](22, 0) NOT NULL,
	[tipo_docu] [numeric](2, 0) NOT NULL,
	[cant_foan] [numeric](10, 0) NULL,
	[codi_empr] [numeric](9, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_comi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_deta_comi](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_licv] [numeric](22, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[rutt_asoc] [numeric](9, 0) NOT NULL,
	[codi_oper] [numeric](1, 0) NOT NULL,
	[rut_emis] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_neto] [numeric](18, 0) NOT NULL,
	[valo_exen] [numeric](18, 0) NOT NULL,
	[valo_iva] [numeric](18, 0) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_deta_docu](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_licv] [numeric](22, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[rutt_asoc] [numeric](9, 0) NOT NULL,
	[digi_asoc] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[vige_docu] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_oper] [numeric](1, 0) NULL,
	[tipo_impu] [numeric](1, 0) NULL,
	[tasa_impu] [numeric](5, 2) NULL,
	[nume_inte] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[vent_serv] [numeric](1, 0) NULL,
	[indi_sico] [numeric](1, 0) NULL,
	[fech_docu] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_sucu] [numeric](9, 0) NULL,
	[nomb_asoc] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_refe] [numeric](3, 0) NULL,
	[foli_refe] [numeric](10, 0) NULL,
	[mont_exen] [numeric](18, 0) NULL,
	[mont_neto] [numeric](18, 0) NULL,
	[mont_vaag] [numeric](18, 0) NULL,
	[mont_vafi] [numeric](18, 0) NULL,
	[mont_usco] [numeric](18, 0) NULL,
	[mont_fupl] [numeric](18, 0) NULL,
	[mont_le18] [numeric](18, 0) NULL,
	[mont_sicr] [numeric](18, 0) NULL,
	[iva_rtto] [numeric](18, 0) NULL,
	[iva_rtpa] [numeric](18, 0) NULL,
	[mont_cred] [numeric](18, 0) NULL,
	[mont_enva] [numeric](18, 0) NULL,
	[mont_tota] [numeric](18, 0) NULL,
	[mont_nret] [numeric](18, 0) NULL,
	[mont_nofa] [numeric](18, 0) NULL,
	[mont_peri] [numeric](18, 0) NULL,
	[mont_pana] [numeric](18, 0) NULL,
	[mont_pain] [numeric](18, 0) NULL,
	[mont_tapu] [numeric](18, 0) NULL,
	[mont_taci] [numeric](18, 0) NULL,
	[mont_tael] [numeric](18, 0) NULL,
	[mont_vehi] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[emis_docu] [numeric](1, 0) NULL,
	[mont_fijo] [numeric](18, 0) NULL,
	[vaag_prop] [numeric](18, 0) NULL,
	[vaag_terc] [numeric](18, 0) NULL,
	[esta_docu] [numeric](2, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_docu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_deta_docu_p](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_licv] [numeric](22, 0) NOT NULL,
	[tipo_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[rutt_asoc] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[digi_asoc] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[vige_docu] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_oper] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_impu] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_impu] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_inte] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[vent_serv] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_sico] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_docu] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_sucu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_asoc] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_refe] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_refe] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_exen] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_neto] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_vaag] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_vafi] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_usco] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_fupl] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_le18] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_sicr] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[iva_rtto] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[iva_rtpa] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_cred] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_enva] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_tota] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_nret] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_nofa] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_peri] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_pana] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_pain] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_tapu] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_taci] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_tael] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_vehi] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[emis_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_fijo] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[vaag_prop] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[vaag_terc] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_nore].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_deta_nore](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NULL,
	[rutt_asoc] [numeric](9, 0) NOT NULL,
	[codi_nore] [numeric](1, 0) NOT NULL,
	[mont_nore] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_oper] [numeric](1, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_nore_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_deta_nore_p](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_asoc] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_nore] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mont_nore] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_temp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_deta_temp](
	[tipo_oper] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_libr] [varchar](8) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[rutt_asoc] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[digi_asoc] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[peri_trib] [varchar](7) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[vige_docu] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_oper] [numeric](1, 0) NULL,
	[tipo_impu] [numeric](1, 0) NOT NULL,
	[tasa_impu] [numeric](5, 2) NOT NULL,
	[nume_inte] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[vent_serv] [numeric](1, 0) NULL,
	[indi_sico] [numeric](1, 0) NULL,
	[fech_docu] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_sucu] [numeric](8, 0) NULL,
	[rutt_cont] [numeric](9, 0) NOT NULL,
	[digi_cont] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nomb_asoc] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_refe] [numeric](3, 0) NULL,
	[foli_refe] [numeric](10, 0) NULL,
	[mont_exen] [numeric](18, 0) NULL,
	[mont_neto] [numeric](18, 0) NOT NULL,
	[mont_vaag] [numeric](18, 0) NOT NULL,
	[mont_vafi] [numeric](18, 0) NULL,
	[mont_usco] [numeric](18, 0) NULL,
	[mont_fupl] [numeric](18, 0) NULL,
	[mont_le18] [numeric](18, 0) NULL,
	[mont_sicr] [numeric](18, 0) NULL,
	[ivag_rtto] [numeric](18, 0) NULL,
	[ivag_rtpa] [numeric](18, 0) NULL,
	[mont_cred] [numeric](18, 0) NULL,
	[mont_enva] [numeric](18, 0) NULL,
	[mont_tota] [numeric](18, 0) NOT NULL,
	[mont_nret] [numeric](18, 0) NULL,
	[mont_nofa] [numeric](18, 0) NULL,
	[mont_peri] [numeric](18, 0) NULL,
	[mont_pana] [numeric](18, 0) NULL,
	[mont_pain] [numeric](18, 0) NULL,
	[mont_tapu] [numeric](18, 0) NULL,
	[mont_taci] [numeric](18, 0) NULL,
	[mont_tael] [numeric](18, 0) NULL,
	[mont_vehi] [numeric](18, 0) NULL,
	[emis_docu] [numeric](9, 0) NULL,
	[mont_fijo] [numeric](18, 0) NULL,
	[vaag_prop] [numeric](18, 0) NULL,
	[vaag_terc] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[LCV_DIGI_DOCU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[LCV_DIGI_DOCU](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[TIPO_OPER] [varchar](7) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[RUTT_ASOC] [numeric](9, 0) NOT NULL,
	[DIGI_ASOC] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TASA_IMPU] [numeric](5, 2) NOT NULL,
	[NUME_INTE] [numeric](10, 0) NULL,
	[VENT_SERV] [numeric](1, 0) NULL,
	[INDI_SICO] [numeric](1, 0) NULL,
	[FECH_DOCU] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_SUCU] [numeric](10, 0) NULL,
	[NOMB_ASOC] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[TIPO_REFE] [numeric](3, 0) NULL,
	[FOLI_REFE] [numeric](10, 0) NULL,
	[MONT_EXEN] [numeric](18, 0) NULL,
	[MONT_NETO] [numeric](18, 0) NULL,
	[MONT_VAAG] [numeric](18, 0) NULL,
	[MONT_VAFI] [numeric](18, 0) NULL,
	[MONT_USCO] [numeric](18, 0) NULL,
	[MONT_FUPO] [numeric](18, 0) NULL,
	[MONT_LE18] [numeric](18, 0) NULL,
	[MONT_SICR] [numeric](18, 0) NULL,
	[IVAG_RTTO] [numeric](18, 0) NULL,
	[IVAG_RTPA] [numeric](18, 0) NULL,
	[MONT_CRED] [numeric](18, 0) NULL,
	[MONT_ENVA] [numeric](18, 0) NULL,
	[MONT_TOTA] [numeric](18, 0) NULL,
	[MONT_NRET] [numeric](18, 0) NULL,
	[MONT_NOFA] [numeric](18, 0) NULL,
	[MONT_PERI] [numeric](18, 0) NULL,
	[MONT_PANA] [numeric](18, 0) NULL,
	[MONT_PAIN] [numeric](18, 0) NULL,
	[VAAG_PROP] [numeric](18, 0) NULL,
	[VAAG_TERC] [numeric](18, 0) NULL,
	[VIGE_DOCU] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[LCV_DIGI_IMPU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[LCV_DIGI_IMPU](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](10, 0) NOT NULL,
	[TIPO_OPER] [varchar](7) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[RUTT_ASOC] [numeric](9, 0) NOT NULL,
	[CODI_IMPU] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TASA_IMPU] [numeric](5, 2) NOT NULL,
	[MONT_IMPU] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_docu_serv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_docu_serv](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](18, 0) NOT NULL,
	[fech_anul] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_nore_temp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_nore_temp](
	[tipo_oper] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_libr] [varchar](8) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[rutt_asoc] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[peri_trib] [varchar](7) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[rutt_cont] [numeric](9, 0) NOT NULL,
	[codi_nore] [numeric](1, 0) NOT NULL,
	[mont_nore] [numeric](18, 0) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_resu_libr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_resu_libr](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[rutt_emis] [numeric](9, 0) NULL,
	[digi_emis] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_peri] [varchar](7) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_oper] [varchar](7) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_libr] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_segm] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_segm] [numeric](3, 0) NULL,
	[feho_firm] [char](20) COLLATE Modern_Spanish_CI_AS NULL,
	[vers_licv] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_noti] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_aten] [numeric](12, 0) NULL,
	[CODI_RECT] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_envi] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[mens_envi] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_envi] [numeric](3, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_resu_libr_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_resu_libr_p](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[rutt_emis] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_emis] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_peri] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_oper] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_libr] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_segm] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_segm] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[feho_firm] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[vers_licv] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_noti] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_resu_lob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[lcv_resu_lob](
	[corr_licv] [numeric](22, 0) NULL,
	[tipo_arch] [varchar](12) COLLATE Modern_Spanish_CI_AS NOT NULL /*Not using ANSI TRIM*/,
	[clob_docu] [text] COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_segm_impu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_segm_impu](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[codi_impu] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mont_impu] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_segm_impu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_segm_impu_p](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_impu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mont_impu] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_segm_nore].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_segm_nore](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[codi_nore] [numeric](1, 0) NOT NULL,
	[oper_nore] [numeric](10, 0) NULL,
	[mont_nore] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_segm_nore_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_segm_nore_p](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_nore] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[oper_nore] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_nore] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_comi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_tota_comi](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[valo_neto] [numeric](18, 0) NOT NULL,
	[valo_exen] [numeric](18, 0) NOT NULL,
	[valo_iva] [numeric](18, 0) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_tota_docu](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_licv] [numeric](22, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[rutt_asoc] [numeric](9, 0) NOT NULL,
	[codi_impu] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tas_impu] [numeric](5, 2) NULL,
	[mont_impu] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_oper] [numeric](1, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_docu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_tota_docu_p](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[corr_licv] [numeric](22, 0) NOT NULL,
	[tipo_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[rutt_asoc] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_impu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tas_impu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_impu] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_impu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_tota_impu](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[codi_impu] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mont_impu] [numeric](18, 0) NULL,
	[fact_adic] [numeric](6, 4) NULL,
	[mont_cila] [numeric](18, 0) NULL,
	[codi_emex] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_impu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_tota_impu_p](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_impu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mont_impu] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[fact_adic] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_cila] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_libr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_tota_libr](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[tipo_impu] [numeric](1, 0) NULL,
	[cant_docu] [numeric](10, 0) NULL,
	[oper_exen] [numeric](10, 0) NULL,
	[mont_exen] [numeric](18, 0) NULL,
	[mont_neto] [numeric](18, 0) NULL,
	[oper_vaag] [numeric](10, 0) NULL,
	[mont_vaag] [numeric](18, 0) NULL,
	[oper_fijo] [numeric](10, 0) NULL,
	[oper_vafi] [numeric](10, 0) NULL,
	[oper_ivac] [numeric](10, 0) NULL,
	[mont_ivac] [numeric](18, 0) NULL,
	[fact_prop] [numeric](10, 6) NULL,
	[mont_crco] [numeric](18, 0) NULL,
	[mont_le18] [numeric](18, 0) NULL,
	[impu_sicr] [numeric](18, 0) NULL,
	[oper_reto] [numeric](10, 0) NULL,
	[iva_rtto] [numeric](18, 0) NULL,
	[oper_repa] [numeric](10, 0) NULL,
	[iva_rtpa] [numeric](18, 0) NULL,
	[mont_crec] [numeric](18, 0) NULL,
	[mont_enva] [numeric](18, 0) NULL,
	[mont_tota] [numeric](18, 0) NULL,
	[mont_nret] [numeric](18, 0) NULL,
	[mont_nofa] [numeric](18, 0) NULL,
	[mont_peri] [numeric](18, 0) NULL,
	[mont_pana] [numeric](18, 0) NULL,
	[mont_pain] [numeric](18, 0) NULL,
	[mont_tapu] [numeric](18, 0) NULL,
	[mont_taci] [numeric](18, 0) NULL,
	[mont_tael] [numeric](18, 0) NULL,
	[mont_vehi] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[iva_fupl] [numeric](18, 0) NULL,
	[oper_nret] [numeric](10, 0) NULL,
	[tota_anul] [numeric](18, 0) NULL,
	[vaag_prop] [numeric](18, 0) NULL,
	[vaag_terc] [numeric](18, 0) NULL,
	[mont_fijo] [numeric](18, 0) NULL,
	[mont_vafi] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_libr_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_tota_libr_p](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_impu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[cant_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_exen] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_exen] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_neto] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_vaag] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_vaag] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_fijo] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_vafi] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_ivac] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_ivac] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[fact_prop] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_crco] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_le18] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[impu_sicr] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_reto] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[iva_rtto] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_repa] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[iva_rtpa] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_crec] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_enva] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[fact_impu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_cila] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_tota] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_nret] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_nofa] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_peri] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_pana] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_pain] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_tapu] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_taci] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_tael] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_vehi] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[iva_fupl] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_nret] [numeric](10, 0) NULL,
	[tota_anul] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[vaag_prop] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[vaag_terc] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_fijo] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_vafi] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_nore].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_tota_nore](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[codi_nore] [numeric](1, 0) NOT NULL,
	[oper_nore] [numeric](10, 0) NULL,
	[mont_nore] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_nore_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_tota_nore_p](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_nore] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[oper_nore] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_nore] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_segm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_tota_segm](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[tipo_impu] [numeric](1, 0) NULL,
	[cant_docu] [numeric](10, 0) NULL,
	[oper_exen] [numeric](10, 0) NULL,
	[mont_exen] [numeric](18, 0) NULL,
	[mont_neto] [numeric](18, 0) NULL,
	[oper_vaag] [numeric](18, 0) NULL,
	[mont_vaag] [numeric](18, 0) NULL,
	[oper_fijo] [numeric](10, 0) NULL,
	[mont_vafi] [numeric](18, 0) NULL,
	[oper_ivac] [numeric](10, 0) NULL,
	[mont_ivac] [numeric](18, 0) NULL,
	[mont_le18] [numeric](18, 0) NULL,
	[impu_sicr] [numeric](18, 0) NULL,
	[oper_reto] [numeric](18, 0) NULL,
	[iva_rtto] [numeric](18, 0) NULL,
	[oper_repa] [numeric](10, 0) NULL,
	[iva_rtpa] [numeric](18, 0) NULL,
	[mont_cred] [numeric](18, 0) NULL,
	[mont_enva] [numeric](18, 0) NULL,
	[mont_tota] [numeric](18, 0) NULL,
	[mont_nret] [numeric](18, 0) NULL,
	[mont_nofa] [numeric](18, 0) NULL,
	[mont_peri] [numeric](18, 0) NULL,
	[mont_pana] [numeric](18, 0) NULL,
	[mont_pain] [numeric](18, 0) NULL,
	[mont_tapu] [numeric](18, 0) NULL,
	[mont_taci] [numeric](18, 0) NULL,
	[mont_tael] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[iva_fupl] [numeric](18, 0) NULL,
	[oper_nret] [numeric](10, 0) NULL,
	[tota_anul] [numeric](18, 0) NULL,
	[vaag_prop] [numeric](18, 0) NULL,
	[vaag_terc] [numeric](18, 0) NULL,
	[mont_fijo] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_segm_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_tota_segm_p](
	[corr_licv] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[tipo_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_impu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[cant_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_exen] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_exen] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_neto] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_vaag] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_vaag] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_fijo] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_vafi] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_ivac] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_ivac] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_le18] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[impu_sicr] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_reto] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[iva_rtto] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_rtpa] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[iva_rtpa] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_cred] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_enva] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_tota] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_nret] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_nofa] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_peri] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_pana] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_pain] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_tapu] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_taci] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_tael] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[iva_fupl] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[oper_nret] [numeric](10, 0) NULL,
	[tota_anul] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[vaag_prop] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[vaag_terc] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_fijo] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_temp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lcv_tota_temp](
	[tipo_oper] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_libr] [varchar](8) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[rutt_asoc] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[peri_trib] [varchar](7) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_docu] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[rutt_cont] [numeric](9, 0) NOT NULL,
	[codi_impu] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tasa_impu] [numeric](5, 2) NULL,
	[mont_impu] [numeric](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_deta_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lgd_deta_docu](
	[corr_ligd] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[foli_docu] [numeric](10, 0) NOT NULL,
	[vige_docu] [numeric](1, 0) NULL,
	[tipo_oper] [numeric](1, 0) NOT NULL,
	[fech_docu] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_asoc] [numeric](9, 0) NOT NULL,
	[digi_asoc] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_asoc] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_neto] [numeric](18, 0) NULL,
	[tasa_vaag] [numeric](5, 2) NULL,
	[mont_vaag] [numeric](18, 0) NULL,
	[mont_tota] [numeric](18, 0) NULL,
	[mont_modi] [numeric](18, 0) NULL,
	[tipo_refe] [numeric](3, 0) NULL,
	[foli_refe] [numeric](10, 0) NULL,
	[fech_refe] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_deta_docu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lgd_deta_docu_p](
	[corr_ligd] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[foli_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[vige_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_oper] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[fech_docu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_asoc] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[digi_asoc] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_asoc] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_neto] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[tasa_vaag] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_vaag] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_tota] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_modi] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_refe] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_refe] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_refe] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_enca_ligd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lgd_enca_ligd](
	[corr_ligd] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[rutt_emis] [numeric](9, 0) NULL,
	[digi_emis] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_peri] [varchar](7) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_libr] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_segm] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_segm] [numeric](6, 0) NULL,
	[foli_noti] [numeric](18, 0) NULL,
	[feho_firm] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_enca_ligd_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lgd_enca_ligd_p](
	[corr_ligd] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[rutt_emis] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_emis] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_peri] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_libr] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_segm] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_segm] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[foli_noti] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[feho_firm] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tota_peri].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lgd_tota_peri](
	[corr_ligd] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[nume_foan] [numeric](10, 0) NULL,
	[nume_ganu] [numeric](10, 0) NULL,
	[tota_gvta] [numeric](10, 0) NULL,
	[mont_gvta] [numeric](18, 0) NULL,
	[mont_modi] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tota_peri_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lgd_tota_peri_p](
	[corr_ligd] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[nume_foan] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_ganu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[tota_gvta] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_gvta] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_modi] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tota_segm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lgd_tota_segm](
	[corr_ligd] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[nume_foan] [numeric](10, 0) NULL,
	[nume_ganu] [numeric](10, 0) NULL,
	[tota_gvta] [numeric](10, 0) NULL,
	[mont_gvta] [numeric](18, 0) NULL,
	[mont_modi] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tota_segm_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lgd_tota_segm_p](
	[corr_ligd] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[nume_foan] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_ganu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[tota_gvta] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_gvta] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_modi] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_peri].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lgd_tras_peri](
	[corr_ligd] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[codi_tras] [numeric](2, 0) NOT NULL,
	[tipo_tras] [numeric](1, 0) NULL,
	[cant_guia] [numeric](10, 0) NULL,
	[mont_guia] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_peri_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lgd_tras_peri_p](
	[corr_ligd] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[codi_tras] [numeric](2, 0) NOT NULL,
	[tipo_tras] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[cant_guia] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_guia] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_segm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lgd_tras_segm](
	[corr_ligd] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[codi_tras] [numeric](2, 0) NOT NULL,
	[tipo_tras] [numeric](1, 0) NULL,
	[cant_guia] [numeric](10, 0) NULL,
	[mont_guia] [numeric](18, 0) NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_segm_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lgd_tras_segm_p](
	[corr_ligd] [numeric](22, 0) NOT NULL,
	[codi_empr] [numeric](3, 0) NOT NULL,
	[codi_tras] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_tras] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[cant_guia] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mont_guia] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[log_egate].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[log_egate](
	[log_table] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[log_accion] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[log_fecha] [datetime] NULL,
	[log_user] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[log_ident] [varchar](250) COLLATE Modern_Spanish_CI_AS NULL,
	[log_desc] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[log_valold] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[log_valnew] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[log_erro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[log_erro](
	[corr_logg] [numeric](22, 0) NOT NULL,
	[proc_erro] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[msaj_erro] [varchar](150) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[fech_erro] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[hora_erro] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[binn_erro] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[tipo_docu] [numeric](3, 0) NULL,
	[foli_docu] [numeric](10, 0) NULL,
	[arch_erro] [varchar](300) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[log_usuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[log_usuario](
	[log_fecha] [datetime] NOT NULL,
	[log_usuario] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[log_accion] [varchar](250) COLLATE Modern_Spanish_CI_AS NULL,
	[log_codi_empr] [numeric](2, 0) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[mant_prod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[mant_prod](
	[prod_codi] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[prod_desc] [varchar](250) COLLATE Modern_Spanish_CI_AS NULL,
	[prod_valu] [numeric](22, 4) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[moneda].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[moneda](
	[codi_mone] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nomb_mone] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[roun_mone] [numeric](2, 0) NULL,
	[codi_pais] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[nume_mone] [varchar](4) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_mone_ante] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[fiso_mone] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[umo_round] [numeric](4, 0) NULL,
	[mnda_cdg] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[mnda_nmb] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[mtod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[mtod](
	[mtod_id] [numeric](18, 0) IDENTITY(1, 1),
	[mtod_stat] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mtod_from] [varchar](400) COLLATE Modern_Spanish_CI_AS NULL,
	[mtod_to] [varchar](400) COLLATE Modern_Spanish_CI_AS NULL,
	[mtod_cc] [varchar](400) COLLATE Modern_Spanish_CI_AS NULL,
	[mtod_subject] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[mtod_text] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[mtod_envio] [datetime] NULL,
	[mtod_errno] [numeric](18, 0) NULL,
	[mtod_errtxt] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[obj_ds2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[obj_ds2](
	[object_name] [varchar](128) COLLATE Modern_Spanish_CI_AS NULL,
	[object_type] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[ofic_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ofic_empr](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[codi_ofic] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_ofic] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ceco] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_sii] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_ofic] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ciud] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_comu] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_PAIS] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[FONO_OFIC] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[FAXX_OFIC] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[TELX_OFIC] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[p_corr_envi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[p_corr_envi](
	[corr_envi] [numeric](22, 0) IDENTITY(1, 1)
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[para_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[para_empr](
	[codi_empr] [numeric](9, 0) NOT NULL,
	[codi_paem] [varchar](4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_como] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_paem] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_paem] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[obli_paem] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[para_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[para_pers](
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[CODI_PERS] [varchar](16) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TIPO_COMO] [varchar](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_PAPE] [varchar](4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[VALO_PAPE] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[DESC_PAPE] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[PERS_PAIDE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[PERS_PAIDE](
	[CONT_RUTT] [numeric](20, 0) NOT NULL,
	[CONT_DIGI] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL /*Not using ANSI TRIM*/,
	[CONT_URLL_SII] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL /*Not using ANSI TRIM*/
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[PERS_PUBL].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PERS_PUBL](
	[CONT_RUTT] [numeric](20, 0) NOT NULL,
	[CONT_DIGI] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CONT_RAZO] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CONT_CASI_SII] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CONT_URLL_SII] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_CONF] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[PERS_PAIS] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_RESO] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[PERS_PUBL_TEMP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PERS_PUBL_TEMP](
	[CONT_RUTT] [numeric](20, 0) NOT NULL,
	[CONT_DIGI] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CONT_RAZO] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CONT_CASI_SII] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CONT_URLL_SII] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_CONF] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[PERS_PAIS] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_RESO] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[personas](
	[codi_pers] [varchar](16) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nomb_pers] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[rutt_pers] [numeric](9, 0) NULL,
	[dgto_pers] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[dire_pers] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_comu] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[fono_pers] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[clie_pers] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[prov_pers] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[comp_pers] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[empl_pers] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_pers1] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[pers_sele] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[empr_pers] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[pref_pers] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL,
	[func_pers] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ramo] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_pers] [datetime] NULL,
	[come_pers] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_pais] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ceco] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[codi_mail] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[nfan_pers] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_eciv] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_prof] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[sexo_pers] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[orig_pers] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[acci_pers] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_desc] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_MAIL1] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_MAIL2] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_MAIL3] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_MAIL4] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[modi_docu] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[auto_cesi] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[asun_fact_pers] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[text_fact_pers] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[PROC_LOGS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PROC_LOGS](
	[proceso] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[archivo] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[qse_docu_serv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[qse_docu_serv](
	[CODI_DOPR] [numeric](20, 0) IDENTITY(1, 1),
	[CODI_SERV] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_EMEX] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[TIPO_DOCU] [numeric](3, 0) NOT NULL,
	[FOLI_DOCU] [numeric](22, 0) NOT NULL,
	[ESTA_PROC] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TIME_PROC] [datetime] NOT NULL,
	[CANT_PROC] [numeric](9, 0) NULL,
	[CODI_DOCU] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CORR_REFE] [numeric](18, 0) NULL,
	[CODI_SRVD] [varchar](39) COLLATE Modern_Spanish_CI_AS NULL,
	[TABL_ORIG] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[VALO_PK1] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[VALO_PK2] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[VALO_PK3] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[VALO_PK4] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[VALO_PK5] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[TABL_ESTA] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[ULTI_ERRO] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[FLAG_DOCU] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[qse_docu_serv_err].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[qse_docu_serv_err](
	[CODI_DOPR] [numeric](20, 0) NOT NULL,
	[DOER_TIMESTAMP] [datetime] NOT NULL,
	[DOER_MSG_ERRO] [varchar](2000) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[ramo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ramo](
	[CODI_RAMO] [varchar](12) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DESC_RAMO] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_RAMO_SUP] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_EMPR] [numeric](9, 0) NOT NULL,
	[NOMB_RAMO] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[CODI_CECO] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[INDI_CLIE] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[INDI_PROV] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[INDI_EMPL] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[ORDE_RAMO] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[INDI_EMPR] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[ORDE_GEFI] [numeric](3, 0) NULL,
	[CODI_SII] [varchar](6) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[rep_dto_enca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[rep_dto_enca](
	[corr_id] [numeric](10, 0) NOT NULL,
	[rutt_rece] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_rece] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[peri_docu] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[rep_dto_sii].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[rep_dto_sii](
	[CORR_REP] [numeric](12, 0) NOT NULL,
	[RUTT_RECE] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DIGI_RECE] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[RUTT_EMIS] [varchar](27) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DIGI_EMIS] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[RAZO_EMIS] [varchar](100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TIPO_DOCU] [varchar](54) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FOLI_DOCU] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FECH_EMIS] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MONT_TOTA] [varchar](70) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FECH_RECE] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[NUME_ATEN] [numeric](30, 0) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[se_pipe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[se_pipe](
	[pipe_id] [numeric](18, 0) IDENTITY(1, 1),
	[pipe_stat] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[pipe_cmd] [varchar](400) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[pipe_fech_crea] [datetime] NULL,
	[pipe_fech_ejec] [datetime] NULL,
	[pipe_codi_usua] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[seq_asig_foli].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[seq_asig_foli](
	[seq_asig_foli] [numeric](10, 0) IDENTITY(1, 1),
	[seq_valo] [char](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[seq_boel_resu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[seq_boel_resu](
	[seq_boel_resu] [numeric](10, 0) IDENTITY(1, 1),
	[seq_valo] [char](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[seq_corr_cesi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[seq_corr_cesi](
	[seq_corr_cesi] [numeric](10, 0) IDENTITY(1, 1),
	[seq_valo] [char](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[seq_corr_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[seq_corr_docu](
	[corr] [numeric](10, 0) IDENTITY(1, 1),
	[valo] [char](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[seq_dte_lcv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[seq_dte_lcv](
	[seq_corr_libr] [numeric](10, 0) IDENTITY(1, 1),
	[seq_valo] [char](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[seq_envi_boel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[seq_envi_boel](
	[seq_envi_boel] [numeric](10, 0) IDENTITY(1, 1),
	[seq_valo] [char](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[seq_extrae].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[seq_extrae](
	[seq_extrae] [numeric](10, 0) IDENTITY(1, 1),
	[seq_valo] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[seq_libr_boel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[seq_libr_boel](
	[seq_libr_boel] [numeric](10, 0) IDENTITY(1, 1),
	[seq_valo] [char](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[seq_sys_alin].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[seq_sys_alin](
	[seq] [numeric](22, 0) IDENTITY(1, 1),
	[val] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[seq_sys_defp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[seq_sys_defp](
	[seq] [numeric](22, 0) IDENTITY(1, 1),
	[val] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[seq_sys_fupr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[seq_sys_fupr](
	[seq] [numeric](22, 0) IDENTITY(1, 1),
	[val] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[seq_unid_cons].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[seq_unid_cons](
	[seq_unid_cons] [numeric](10, 0) IDENTITY(1, 1),
	[seq_valo] [char](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[seq_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[seq_x](
	[seq] [numeric](22, 0) IDENTITY(1, 1),
	[val] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alar].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_alar](
	[codi_alar] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_alar] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_alar] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[frec_alar] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_alar] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[prio_alar] [numeric](3, 0) NULL,
	[indi_alar] [numeric](22, 0) NULL,
	[comp_alar] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_alar] [numeric](22, 0) NULL,
	[fech_alar] [datetime] NULL,
	[fesi_alar] [datetime] NULL,
	[diav_alar] [numeric](9, 0) NULL,
	[feav_alar] [datetime] NULL,
	[feas_alar] [datetime] NULL,
	[stat_alar] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[erro_alar] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[acci_alar] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[object_name1] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_modu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[sqlc_alar] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[sqli_alar] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[par1] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par2] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par3] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par4] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par5] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par6] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[des1] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[des2] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[des3] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[des4] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[des5] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[des6] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[sql2_alar] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[MAIL_INFO] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[sqld_alar] [varchar](2000) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_empr] [numeric](9, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alar_emex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_alar_emex](
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_alar] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_alar] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[frec_alar] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[esta_alar] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[prio_alar] [numeric](3, 0) NULL,
	[indi_alar] [numeric](22, 0) NOT NULL,
	[comp_alar] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[valo_alar] [numeric](22, 0) NULL,
	[fech_alar] [datetime] NULL,
	[fesi_alar] [datetime] NULL,
	[diav_alar] [numeric](9, 0) NULL,
	[feav_alar] [datetime] NULL,
	[feas_alar] [datetime] NULL,
	[stat_alar] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[erro_alar] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[sql2_alar] [varchar](2000) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mail_info] [varchar](300) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mail_cccc] [varchar](300) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alar_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_alar_empr](
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[codi_alar] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo_alar] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[frec_alar] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[esta_alar] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[prio_alar] [numeric](3, 0) NULL,
	[indi_alar] [numeric](22, 0) NOT NULL,
	[comp_alar] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[valo_alar] [numeric](22, 0) NULL,
	[fech_alar] [datetime] NULL,
	[fesi_alar] [datetime] NULL,
	[diav_alar] [numeric](9, 0) NULL,
	[feav_alar] [datetime] NULL,
	[feas_alar] [datetime] NULL,
	[stat_alar] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[erro_alar] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[sql2_alar] [varchar](2000) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mail_info] [varchar](300) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mail_cccc] [varchar](300) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alin].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_alin](
	[codi_alin] [numeric](22, 0) IDENTITY(1, 1),
	[codi_alar] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[val1] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val2] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val3] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val4] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val5] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val6] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_empr] [numeric](9, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alri].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_alri](
	[codi_alar] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_rous] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_modu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_alro](
	[codi_alar] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_rous] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_modu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[mail_alro] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alus].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_alus](
	[codi_alar] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[orig_alus] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[mail_alus] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[prio_alus] [numeric](3, 0) NULL,
	[frec_alus] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_alus] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[indi_alus] [numeric](22, 0) NULL,
	[comp_alus] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[valo_alus] [numeric](22, 0) NULL,
	[fech_alus] [datetime] NULL,
	[fesi_alus] [datetime] NULL,
	[feav_alus] [datetime] NULL,
	[diav_alus] [numeric](9, 0) NULL,
	[feas_alus] [datetime] NULL,
	[stat_alus] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[erro_alus] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_attr_cult].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_attr_cult](
	[object_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[attr_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_cult] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[object_brief] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[object_desc] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_attribute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_attribute](
	[attr_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[object_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[attr_brief] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[attr_desc] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[attr_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[attr_length] [numeric](4, 0) NULL,
	[attr_prec] [numeric](3, 0) NULL,
	[attr_scale] [numeric](3, 0) NULL,
	[attr_mand] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[attr_order] [numeric](3, 0) NULL,
	[attr_default] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[domain_code] [numeric](4, 0) NULL,
	[cond_domain] [numeric](3, 0) NULL,
	[cond_attr] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[attr_state] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[attr_date] [datetime] NULL,
	[attr_rela] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[attr_struct] [varchar](500) COLLATE Modern_Spanish_CI_AS NULL,
	[ATTR_TAG] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[ATTR_KEY] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_code].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_code](
	[code] [varchar](12) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[code_desc] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[domain_code] [numeric](4, 0) NOT NULL,
	[code_aux] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[code_dele] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_codi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_codi](
	[code] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[code_desc] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[domain_code] [numeric](4, 0) NOT NULL,
	[code_aux] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[code_dele] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_comment].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_comment](
	[object_prog] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[object_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[comment_line] [numeric](5, 0) NOT NULL,
	[comment_text] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[comment_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_connection].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_connection](
	[corr_conn] [numeric](22, 0) NOT NULL,
	[codi_usex] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[corr_sess] [numeric](22, 0) NOT NULL,
	[fein_conn] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_defp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_defp](
	[corr_defp] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[corr_fupr] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_defp] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_defp] [datetime] NULL,
	[indi_defp] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_doma_cult].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_doma_cult](
	[domain_code] [numeric](4, 0) NOT NULL,
	[codi_cult] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[domain_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_domain].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_domain](
	[domain_code] [numeric](4, 0) NOT NULL,
	[domain_name] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[domain_length] [numeric](2, 0) NULL,
	[domain_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[domain_show] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[domain_class] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[domain_low] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[domain_hight] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[domain_view] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[domain_sclass] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[domain_query] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[domain_aux] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[domain_auxlabel] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[Mantenedor] [numeric](1, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_fupr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_fupr](
	[corr_fupr] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_peri] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[object_rela] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_rous] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val1] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val2] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val3] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val4] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val5] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_fupr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_fupr] [datetime] NULL,
	[indi_fupr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[freq_fupr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[desc_fupr] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[val6] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_furo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_furo](
	[codi_rous] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[object_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[object_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[object_brief] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[table_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[table_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[appname] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[form_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[report_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[report_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[query_clause] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[order_key] [numeric](3, 0) NULL,
	[object_desc] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[alter_key] [numeric](3, 0) NULL,
	[object_code] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_single] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_rela] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[rol0] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol1] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol2] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol3] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol4] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol5] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol6] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol7] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol8] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol9] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[object_prog] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_priv] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[object_order] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_sex] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[object_state] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_date] [datetime] NULL,
	[object_pname] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_shell] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_modu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par0] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par1] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par2] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par3] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par4] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par5] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par6] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par7] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par8] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par9] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val0] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val1] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val2] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val3] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val4] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val5] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val6] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val7] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val8] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val9] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[key1] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[key2] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[object_orun] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[object_level] [numeric](22, 0) NULL,
	[object_freq] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[object_empr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_inst](
	[object_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[object_number] [numeric](4, 0) NOT NULL,
	[object_order] [numeric](4, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_key].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_key](
	[table_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[type_key] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[number_key] [numeric](2, 0) NOT NULL,
	[gen_key] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[unique_key] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[key_desc] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[key_depe] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_key_attr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_key_attr](
	[table_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[number_key] [numeric](2, 0) NOT NULL,
	[attr_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[attr_order] [numeric](2, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_mess_cult].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_mess_cult](
	[codi_mess] [numeric](22, 0) NOT NULL,
	[codi_cult] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_mess] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_mess] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_message].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_message](
	[codi_mess] [numeric](22, 0) NOT NULL,
	[codi_modu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[desc_mess] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_mess] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_modu_obje].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_modu_obje](
	[codi_modu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[object_name] [varchar](128) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[object_type] [varchar](18) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_obac].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_obac](
	[codi_acti] [numeric](22, 0) NOT NULL,
	[object_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[object_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[object_prog] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[orde_obac] [numeric](9, 0) NULL,
	[obse_obac] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[esta_obac] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_obac] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_obac] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_obje_cult].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_obje_cult](
	[object_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_cult] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[object_brief] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[object_desc] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[object_single] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_object](
	[object_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[object_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[object_brief] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[table_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[table_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[appname] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[form_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[report_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[report_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[query_clause] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[order_key] [numeric](3, 0) NULL,
	[object_desc] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[alter_key] [numeric](3, 0) NULL,
	[object_code] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_single] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_rela] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[rol0] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol1] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol2] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol3] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol4] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol5] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol6] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol7] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol8] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[rol9] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[object_prog] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_priv] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[object_order] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_sex] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[object_state] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_date] [datetime] NULL,
	[object_pname] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_shell] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_modu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par0] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par1] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par2] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par3] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par4] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par5] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par6] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par7] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par8] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par9] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val0] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val1] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val2] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val3] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val4] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val5] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val6] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val7] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val8] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val9] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_orun] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[object_level] [numeric](22, 0) NULL,
	[object_freq] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_acti] [numeric](22, 0) NULL,
	[object_empr] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_relation].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_relation](
	[source_object] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[source_desc] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[number_key] [numeric](2, 0) NOT NULL,
	[source_mand] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[source_card] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[source_dele] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[target_object] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[target_desc] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[target_mand] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[target_card] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[relation_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[key1] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[key2] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[key3] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[key4] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[key5] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[key6] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[key7] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[key8] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[key9] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[key0] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[source_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[target_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_session].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_session](
	[corr_sess] [numeric](22, 0) IDENTITY(1, 1),
	[fein_sess] [datetime] NULL,
	[fete_sess] [datetime] NULL,
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_pers] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_rous] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_modu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[codi_ceco] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_menu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_dbst] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_cult] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_user_objects].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_user_objects](
	[object_name] [varchar](128) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[object_type] [varchar](18) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[status] [varchar](7) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_usfa].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_usfa](
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[object_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[orde_usfa] [numeric](4, 0) NULL,
	[object_rela] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_type] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[object_brief] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[come_usfa] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[object_orun] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[object_level] [numeric](22, 0) NULL,
	[object_order] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[object_freq] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_usro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sys_usro](
	[codi_rous] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_modu] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[temp_rep_dto_sii].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[temp_rep_dto_sii](
	[NUME_PROC] [numeric](30, 0) NULL,
	[FECH_PROC] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[RUTT_RECE] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[TIPO_DOCU] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[FOLI_DOCU] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[RUTT_EMIS] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[DIGI_EMIS] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[RAZO_EMIS] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_EMIS] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_RECE] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[MONT_NETO] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[IMPU_VAAG] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[MONT_TOTA_SE] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[ESTA_DOCU] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[ESTA_DOCU1] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[MONT_TOTA_SII] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[usem_exte].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[usem_exte](
	[codi_usex] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[stat_ueex] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[fein_ueex] [datetime] NOT NULL,
	[fete_ueex] [datetime] NULL,
	[codi_pers] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[usua_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[usua_empr](
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_empr] [numeric](9, 0) NOT NULL,
	[codi_ofic] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[usua_exte].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[usua_exte](
	[codi_usex] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nomb_usex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[pass_usex] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[stat_usex] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[fein_usex] [datetime] NULL,
	[fete_usex] [datetime] NULL,
	[mail_usex] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[pass_usar] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[codi_ceco] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_pers] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[fono_usex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[luga_usex] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[noco_usex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nomb_tabl] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[par1] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par2] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par3] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par4] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par5] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[par6] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val1] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val2] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val3] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val4] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val5] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[val6] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[usua_sist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[usua_sist](
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nomb_usua] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_pers] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_rous] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_empr] [numeric](9, 0) NULL,
	[fech_usua] [datetime] NULL,
	[codi_impr] [varchar](25) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ofic] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ceco] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_zona] [numeric](3, 0) NULL,
	[codi_menu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[nive_usua] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[noco_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[pass_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_usua] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_ramo] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[fono_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[luga_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[digi_usua] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_dbst] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[fete_usua] [datetime] NULL,
	[mail_usua] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_emex] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[tipo_fold] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_cult] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[usua_filt] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[valo_cage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[valo_cage](
	[codi_cage] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[codi_vacg] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_vacg] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[version].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[version](
	[componente] [varchar](250) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[version] [varchar](250) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[fecha_ejecucion] [datetime] NULL,
	[responsable_ejecucion] [varchar](250) COLLATE Modern_Spanish_CI_AS NULL,
	[observacion_ejecucion] [varchar](250) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[web_esta_proc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[web_esta_proc](
	[corr_proc] [numeric](10, 0) NOT NULL,
	[nume_proc] [numeric](10, 0) NOT NULL,
	[nomb_proc] [varchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[desc_proc] [varchar](256) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_inic] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[fech_term] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[borr_mens] [varchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[codi_usua] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]
