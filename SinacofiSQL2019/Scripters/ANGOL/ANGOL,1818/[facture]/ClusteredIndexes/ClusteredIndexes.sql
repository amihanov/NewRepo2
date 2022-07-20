
GO
--SqlScripter----[dbo].[area_geog].[arge_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[area_geog] ADD CONSTRAINT [arge_pk] PRIMARY KEY CLUSTERED (
	[codi_arge] ASC,
	[tipo_arge] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_asig_foli].[BEASFO_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_asig_foli] ADD CONSTRAINT [BEASFO_PK] PRIMARY KEY CLUSTERED (
	[CORR_ASIG] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_cons_cara].[BECOCA_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_cons_cara] ADD CONSTRAINT [BECOCA_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[CORR_CONS] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_cons_rang].[BECORA_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_cons_rang] ADD CONSTRAINT [BECORA_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[CORR_CONS] ASC,
	[TIPO_RANG] ASC,
	[FOLI_INIC] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_cons_resu].[BECORE_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_cons_resu] ADD CONSTRAINT [BECORE_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[CORR_CONS] ASC,
	[TIPO_DOCU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_dato_refe].[BEDARE_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_dato_refe] ADD CONSTRAINT [BEDARE_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[NUME_LINE] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_desc_reca].[BEDERE_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_desc_reca] ADD CONSTRAINT [BEDERE_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[NUME_LINE] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_deta_codi].[BEDECO_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_deta_codi] ADD CONSTRAINT [BEDECO_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[NUME_LINE] ASC,
	[TIPO_CODI] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_deta_prse].[BEDEPR_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_deta_prse] ADD CONSTRAINT [BEDEPR_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[NUME_LINE] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_deta_subt].[BEDESU_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_deta_subt] ADD CONSTRAINT [BEDESU_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[NUME_LINE] ASC,
	[LINE_DETA] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_enca_docu].[BEENCDO_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_enca_docu] ADD CONSTRAINT [BEENCDO_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_envi_docu].[BEENVDO_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_envi_docu] ADD CONSTRAINT [BEENVDO_PK] PRIMARY KEY CLUSTERED (
	[CORR_ENVI] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_envi_pdf].[bel_envi_pdf_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_envi_pdf] ADD CONSTRAINT [bel_envi_pdf_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[posicion_email] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_foli_anul].[BEFOAN_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_foli_anul] ADD CONSTRAINT [BEFOAN_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_ANUL] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_info_tick].[BEINTI_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_info_tick] ADD CONSTRAINT [BEINTI_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[FOLI_TICK] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_subt_info].[BESUIN_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_subt_info] ADD CONSTRAINT [BESUIN_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[NUME_LINE] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_tido_envi].[BETIEN_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_tido_envi] ADD CONSTRAINT [BETIEN_PK] PRIMARY KEY CLUSTERED (
	[CORR_ENVI] ASC,
	[TIPO_DOCU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_unid_cont].[BEUNCO_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_unid_cont] ADD CONSTRAINT [BEUNCO_PK] PRIMARY KEY CLUSTERED (
	[CODI_UNID] ASC,
	[CODI_EMPR] ASC,
	[CODI_CECO] ASC,
	[TIPO_ORIG] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bel_xml].[BEXM_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bel_xml] ADD CONSTRAINT [BEXM_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[camb_mone].[camb_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[camb_mone] ADD CONSTRAINT [camb_pk] PRIMARY KEY CLUSTERED (
	[tipo_mone] ASC,
	[fech_camb] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cara_gene].[cage_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[cara_gene] ADD CONSTRAINT [cage_pk] PRIMARY KEY CLUSTERED (
	[codi_cage] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CARA_PEEM].[CPEM_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CARA_PEEM] ADD CONSTRAINT [CPEM_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[CODI_PERS] ASC,
	[FEIN_CAPE] ASC,
	[CODI_CAGE] ASC,
	[CODI_VACG] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cara_pers].[cape_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[cara_pers] ADD CONSTRAINT [cape_pk] PRIMARY KEY CLUSTERED (
	[codi_pers] ASC,
	[fein_cape] ASC,
	[codi_cage] ASC,
	[codi_vacg] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cent_cost].[ceco_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[cent_cost] ADD CONSTRAINT [ceco_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[codi_ceco] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_CTRL_ARCH].[pk_ctrl_arch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DBN_CTRL_ARCH] ADD CONSTRAINT [pk_ctrl_arch] PRIMARY KEY CLUSTERED (
	[ORIG_GRPO] ASC,
	[NOMB_ARCH] ASC,
	[EXTE_ARCH] ASC,
	[TMST_REGI_ARCH] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbn_list_boto].[PK_DBNLISTBOTO_CODIBOTO_CODIREPO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dbn_list_boto] ADD CONSTRAINT [PK_DBNLISTBOTO_CODIBOTO_CODIREPO] PRIMARY KEY CLUSTERED (
	[CODI_REPO] ASC,
	[CODI_BOTO] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbn_list_repo].[PK_DBNLISTREPO_CODIREPO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dbn_list_repo] ADD CONSTRAINT [PK_DBNLISTREPO_CODIREPO] PRIMARY KEY CLUSTERED (
	[CODI_REPO] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbn_mens_erro].[corr_erro_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dbn_mens_erro] ADD CONSTRAINT [corr_erro_pk] PRIMARY KEY CLUSTERED (
	[corr_erro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_MONI_PROC].[DBN_MONI_PROC_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DBN_MONI_PROC] ADD CONSTRAINT [DBN_MONI_PROC_PK] PRIMARY KEY CLUSTERED (
	[SERV_SERV] ASC,
	[CODI_SERV] ASC,
	[MOPR_PID] ASC,
	[MOPR_INIC_PK] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_MONI_STAT].[DBN_MONI_STAT_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DBN_MONI_STAT] ADD CONSTRAINT [DBN_MONI_STAT_PK] PRIMARY KEY CLUSTERED (
	[CODI_SRVD] ASC,
	[CODI_SERV] ASC,
	[MOPR_PID] ASC,
	[MOST_PERI_OPER] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_PROCESOS].[DBN_PROCESOS_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DBN_PROCESOS] ADD CONSTRAINT [DBN_PROCESOS_PK] PRIMARY KEY CLUSTERED (
	[CODI_PROC] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbn_repo_rous].[PK_DBNREPOROUS_CODIREPO_CODIROUS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dbn_repo_rous] ADD CONSTRAINT [PK_DBNREPOROUS_CODIREPO_CODIROUS] PRIMARY KEY CLUSTERED (
	[CODI_REPO] ASC,
	[CODI_ROUS] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_SERV_SRVD].[DBN_SERV_SRVD_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] ADD CONSTRAINT [DBN_SERV_SRVD_PK] PRIMARY KEY CLUSTERED (
	[SERV_SERV] ASC,
	[CODI_SERV] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_SERVICIO].[DBN_SERVICIO_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DBN_SERVICIO] ADD CONSTRAINT [DBN_SERVICIO_PK] PRIMARY KEY CLUSTERED (
	[CODI_SERV] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_SERVIDOR].[DBN_SERVIDOR_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DBN_SERVIDOR] ADD CONSTRAINT [DBN_SERVIDOR_PK] PRIMARY KEY CLUSTERED (
	[SERV_SERV] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_SESR_RANG_OPER].[DBN_SESR_RANG_OPER_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DBN_SESR_RANG_OPER] ADD CONSTRAINT [DBN_SESR_RANG_OPER_PK] PRIMARY KEY CLUSTERED (
	[CODI_SRVD] ASC,
	[CODI_SERV] ASC,
	[DESD_SERO] ASC,
	[HAST_SERO] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbn_traza_codi_serv].[PK__dbn_traz__CBE71E32A71B8A91].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dbn_traza_codi_serv] ADD CONSTRAINT [PK__dbn_traz__CBE71E32A71B8A91] PRIMARY KEY CLUSTERED (
	[codi_serv] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_ARCH].[DBQ_ARCH_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DBQ_ARCH] ADD CONSTRAINT [DBQ_ARCH_PK] PRIMARY KEY CLUSTERED (
	[CODI_ARCH] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_ARCH_CLOB].[DBQ_ARCHLOB_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DBQ_ARCH_CLOB] ADD CONSTRAINT [DBQ_ARCHLOB_PK] PRIMARY KEY CLUSTERED (
	[CODI_ARCH] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_GRPO].[DBQ_GRPO_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DBQ_GRPO] ADD CONSTRAINT [DBQ_GRPO_PK] PRIMARY KEY CLUSTERED (
	[CODI_GRPO] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbsr].[dbsr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dbsr] ADD CONSTRAINT [dbsr_pk] PRIMARY KEY CLUSTERED (
	[dbsr_nmb] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DTE_ACCI_DOCU].[DTE_ACCI_DOCU_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DTE_ACCI_DOCU] ADD CONSTRAINT [DTE_ACCI_DOCU_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[CODI_ACED] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_acec_empr].[dte_aemp_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_acec_empr] ADD CONSTRAINT [dte_aemp_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[codi_acec] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_acti_econ].[dte_acti_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_acti_econ] ADD CONSTRAINT [dte_acti_pk] PRIMARY KEY CLUSTERED (
	[codi_acec] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_anoto].[DTE_ANOTO_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_anoto] ADD CONSTRAINT [DTE_ANOTO_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[foli_docu] ASC,
	[nume_tram] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DTE_ARCH_ADJU].[PK_DTE_ARCHADJU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DTE_ARCH_ADJU] ADD CONSTRAINT [PK_DTE_ARCHADJU] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[POSI_ADJU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_auto_pers].[DTE_AUPE_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_auto_pers] ADD CONSTRAINT [DTE_AUPE_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[codi_pers] ASC,
	[tipo_auto] ASC,
	[fein_auto] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_cert_pers].[dte_cepe_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_cert_pers] ADD CONSTRAINT [dte_cepe_pk] PRIMARY KEY CLUSTERED (
	[codi_pers] ASC,
	[codi_orce] ASC,
	[fein_cert] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_cesi_auto].[pk_dte_cesi_auto].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_cesi_auto] ADD CONSTRAINT [pk_dte_cesi_auto] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_cesi] ASC,
	[nume_auto] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_cesi_docu].[pk_dte_cesi_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_cesi_docu] ADD CONSTRAINT [pk_dte_cesi_docu] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_cesi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DTE_COMI_CARG].[PK_DTE_COMI_CARG].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DTE_COMI_CARG] ADD CONSTRAINT [PK_DTE_COMI_CARG] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_coca] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_conf_orig].[DTCOOR_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_conf_orig] ADD CONSTRAINT [DTCOOR_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_ORIG] ASC,
	[TIPO_DOCU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_del_cesion].[pk_dte_del_cesion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_del_cesion] ADD CONSTRAINT [pk_dte_del_cesion] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_cesi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_item].[dte_deit_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_desc_item] ADD CONSTRAINT [dte_deit_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_deit] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_item_h].[DTE_DEIT_H_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_desc_item_h] ADD CONSTRAINT [DTE_DEIT_H_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_deit] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_item_p].[dte_deit_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_desc_item_p] ADD CONSTRAINT [dte_deit_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_deit] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_reca].[dte_dere_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_desc_reca] ADD CONSTRAINT [dte_dere_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_dere] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_reca_h].[DTE_DERE_H_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_desc_reca_h] ADD CONSTRAINT [DTE_DERE_H_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_dere] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_reca_p].[dte_dere_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_desc_reca_p] ADD CONSTRAINT [dte_dere_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_dere] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_acec].[dte_acec_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_deta_acec] ADD CONSTRAINT [dte_acec_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[corr_acec] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_acec_h].[DTE_ACEC_H_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_deta_acec_h] ADD CONSTRAINT [DTE_ACEC_H_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[corr_acec] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_acec_p].[DTE_ACEC_P_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_deta_acec_p] ADD CONSTRAINT [DTE_ACEC_P_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[corr_acec] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_codi].[dte_deco_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_deta_codi] ADD CONSTRAINT [dte_deco_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_codi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_codi_h].[DTE_DECO_H_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_deta_codi_h] ADD CONSTRAINT [DTE_DECO_H_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_codi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_codi_p].[dte_deco_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_deta_codi_p] ADD CONSTRAINT [dte_deco_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_codi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_prse].[dte_dtpr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_deta_prse] ADD CONSTRAINT [dte_dtpr_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_prse_h].[DTE_DTPR_H_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_deta_prse_h] ADD CONSTRAINT [DTE_DTPR_H_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_prse_p].[dte_dtpr_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_deta_prse_p] ADD CONSTRAINT [dte_dtpr_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DTE_DOCU_LOB].[DTE_DOCU_LOB_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DTE_DOCU_LOB] ADD CONSTRAINT [DTE_DOCU_LOB_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[TIPO_ARCH] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DTE_DOCU_LOB_H].[DTE_DOCU_LOB_H_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DTE_DOCU_LOB_H] ADD CONSTRAINT [DTE_DOCU_LOB_H_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[TIPO_ARCH] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_docu_refe].[dte_dore_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_docu_refe] ADD CONSTRAINT [dte_dore_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_refe] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_docu_refe_h].[DTE_DORE_H_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_docu_refe_h] ADD CONSTRAINT [DTE_DORE_H_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_refe] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_docu_refe_p].[dte_dore_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_docu_refe_p] ADD CONSTRAINT [dte_dore_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_refe] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu].[dte_endo_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_enca_docu] ADD CONSTRAINT [dte_endo_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu_h].[DTE_ENDO_H_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_enca_docu_h] ADD CONSTRAINT [DTE_ENDO_H_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu_p].[dte_endo_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_enca_docu_p] ADD CONSTRAINT [dte_endo_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_docu].[dte_envi_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_envi_docu] ADD CONSTRAINT [dte_envi_pk] PRIMARY KEY CLUSTERED (
	[corr_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_docu_h].[dte_envi_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_envi_docu_h] ADD CONSTRAINT [dte_envi_h_pk] PRIMARY KEY CLUSTERED (
	[corr_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_lob].[dte_envi_lob_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_envi_lob] ADD CONSTRAINT [dte_envi_lob_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_envi] ASC,
	[tipo_arch] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_lob_h].[dte_envi_lob_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_envi_lob_h] ADD CONSTRAINT [dte_envi_lob_h_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_envi] ASC,
	[tipo_arch] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_pdf].[dte_envi_pdf_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_envi_pdf] ADD CONSTRAINT [dte_envi_pdf_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[posi_mail] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_trace].[dte_entr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_envi_trace] ADD CONSTRAINT [dte_entr_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_envi] ASC,
	[feho_trac] ASC,
	[esta_trac] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_esta_apro].[dte_esap_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_esta_apro] ADD CONSTRAINT [dte_esap_pk] PRIMARY KEY CLUSTERED (
	[codi_esap] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_esta_cesi].[dte_esci_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_esta_cesi] ADD CONSTRAINT [dte_esci_pk] PRIMARY KEY CLUSTERED (
	[esta_cesi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_esta_docu].[dte_esdo_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_esta_docu] ADD CONSTRAINT [dte_esdo_pk] PRIMARY KEY CLUSTERED (
	[esta_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_esta_envi].[dte_esen_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_esta_envi] ADD CONSTRAINT [dte_esen_pk] PRIMARY KEY CLUSTERED (
	[esta_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_esta_recl].[PK_dte_esta_recl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_esta_recl] ADD CONSTRAINT [PK_dte_esta_recl] PRIMARY KEY CLUSTERED (
	[codi_recl] ASC,
	[tipo_recl] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_fase].[dte_fase_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_fase] ADD CONSTRAINT [dte_fase_pk] PRIMARY KEY CLUSTERED (
	[fase_esdo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_foli_clie].[dtfocl_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_foli_clie] ADD CONSTRAINT [dtfocl_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DTE_FORMATOS].[PK_CODI_FORM].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DTE_FORMATOS] ADD CONSTRAINT [PK_CODI_FORM] PRIMARY KEY CLUSTERED (
	[CODI_FORM] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_orga_cert].[dte_orce_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_orga_cert] ADD CONSTRAINT [dte_orce_pk] PRIMARY KEY CLUSTERED (
	[codi_orce] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_proc_evnt].[dte_proc_evnt_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_proc_evnt] ADD CONSTRAINT [dte_proc_evnt_pk] PRIMARY KEY CLUSTERED (
	[corr_evnt] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_rang_foli].[dte_rafo_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_rang_foli] ADD CONSTRAINT [dte_rafo_pk] PRIMARY KEY CLUSTERED (
	[corr_rafo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_reca_item].[dte_reit_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_reca_item] ADD CONSTRAINT [dte_reit_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_reit] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_reca_item_h].[DTE_REIT_H_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_reca_item_h] ADD CONSTRAINT [DTE_REIT_H_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_reit] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_reca_item_p].[dte_reit_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_reca_item_p] ADD CONSTRAINT [dte_reit_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_reit] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suca_item].[dte_scit_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_suca_item] ADD CONSTRAINT [dte_scit_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_suca] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suca_item_h].[DTE_SCIT_H_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_suca_item_h] ADD CONSTRAINT [DTE_SCIT_H_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_suca] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suca_item_p].[dte_scit_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_suca_item_p] ADD CONSTRAINT [dte_scit_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_suca] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_sucu_emis].[dte_sucemis_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_sucu_emis] ADD CONSTRAINT [dte_sucemis_pk] PRIMARY KEY CLUSTERED (
	[codi_sucu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DTE_SUMA_IMOM].[PK__DTE_SUMA__AA97B14125860398].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DTE_SUMA_IMOM] ADD CONSTRAINT [PK__DTE_SUMA__AA97B14125860398] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[CODI_IMPU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suma_impu].[dte_suim_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_suma_impu] ADD CONSTRAINT [dte_suim_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suma_impu_h].[DTE_SUIM_H_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_suma_impu_h] ADD CONSTRAINT [DTE_SUIM_H_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suma_impu_p].[dte_suim_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_suma_impu_p] ADD CONSTRAINT [dte_suim_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_tido_envi].[dte_tdev_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_tido_envi] ADD CONSTRAINT [dte_tdev_pk] PRIMARY KEY CLUSTERED (
	[corr_envi] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_tido_envi_h].[dte_tdev_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_tido_envi_h] ADD CONSTRAINT [dte_tdev_h_pk] PRIMARY KEY CLUSTERED (
	[corr_envi] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_tipo_bult].[PK__dte_tipo__A864475251825BD1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_tipo_bult] ADD CONSTRAINT [PK__dte_tipo__A864475251825BD1] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[codi_tibu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_tipo_docu].[dte_tido_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_tipo_docu] ADD CONSTRAINT [dte_tido_pk] PRIMARY KEY CLUSTERED (
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_tipo_impu].[dte_tiim_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_tipo_impu] ADD CONSTRAINT [dte_tiim_pk] PRIMARY KEY CLUSTERED (
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_tipo_orig].[DTTIOR_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_tipo_orig] ADD CONSTRAINT [DTTIOR_PK] PRIMARY KEY CLUSTERED (
	[TIPO_ORIG] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_trace].[dte_trace_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_trace] ADD CONSTRAINT [dte_trace_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[feho_trac] ASC,
	[esta_trac] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_usua_docu].[DTCODITIP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_usua_docu] ADD CONSTRAINT [DTCODITIP] PRIMARY KEY CLUSTERED (
	[codi_usua] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_vali_erro].[dte_vaer_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_vali_erro] ADD CONSTRAINT [dte_vaer_pk] PRIMARY KEY CLUSTERED (
	[codi_erro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dtec_address].[PK_address].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dtec_address] ADD CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED (
	[corr_addr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dtec_empr_auth].[PK_empr_auth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dtec_empr_auth] ADD CONSTRAINT [PK_empr_auth] PRIMARY KEY CLUSTERED (
	[corr_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dtec_message].[PK_message].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dtec_message] ADD CONSTRAINT [PK_message] PRIMARY KEY CLUSTERED (
	[corr_msge] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dtec_queue_msge].[PK_qmsg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dtec_queue_msge] ADD CONSTRAINT [PK_qmsg] PRIMARY KEY CLUSTERED (
	[corr_qmsg] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_desc_item].[DTO_DEIT_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_desc_item] ADD CONSTRAINT [DTO_DEIT_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_deit] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_desc_item_p].[DTO_DEIT_P_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_desc_item_p] ADD CONSTRAINT [DTO_DEIT_P_PK] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[nume_line] ASC,
	[corr_deit] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_desc_reca].[dto_dere_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_desc_reca] ADD CONSTRAINT [dto_dere_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_dere] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_desc_reca_h].[dto_dere_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_desc_reca_h] ADD CONSTRAINT [dto_dere_h_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_dere] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_desc_reca_p].[dto_dere_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_desc_reca_p] ADD CONSTRAINT [dto_dere_p_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[nume_dere] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_acec].[dto_acec_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_deta_acec] ADD CONSTRAINT [dto_acec_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[corr_acec] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_acec_h].[dto_acec_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_deta_acec_h] ADD CONSTRAINT [dto_acec_h_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[corr_acec] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_acec_p].[dto_acec_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_deta_acec_p] ADD CONSTRAINT [dto_acec_p_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[corr_acec] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_codi].[dto_deco_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_deta_codi] ADD CONSTRAINT [dto_deco_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_codi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_codi_h].[dto_deco_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_deta_codi_h] ADD CONSTRAINT [dto_deco_h_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_codi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_codi_p].[dto_deco_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_deta_codi_p] ADD CONSTRAINT [dto_deco_p_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[nume_line] ASC,
	[corr_codi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_prse].[dto_dtpr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_deta_prse] ADD CONSTRAINT [dto_dtpr_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_prse_h].[dto_dtpr_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_deta_prse_h] ADD CONSTRAINT [dto_dtpr_h_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_prse_p].[dto_dtpr_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_deta_prse_p] ADD CONSTRAINT [dto_dtpr_p_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[nume_line] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_docu_lob].[dto_docu_lob_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_docu_lob] ADD CONSTRAINT [dto_docu_lob_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_docu] ASC,
	[tipo_arch] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_docu_lob_h].[dto_docu_lob_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_docu_lob_h] ADD CONSTRAINT [dto_docu_lob_h_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_docu] ASC,
	[tipo_arch] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_docu_refe].[dto_dore_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_docu_refe] ADD CONSTRAINT [dto_dore_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_refe] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_docu_refe_h].[dto_dore_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_docu_refe_h] ADD CONSTRAINT [dto_dore_h_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_refe] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_docu_refe_p].[dto_dore_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_docu_refe_p] ADD CONSTRAINT [dto_dore_p_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[nume_refe] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_enca_docu].[dto_endo_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_enca_docu] ADD CONSTRAINT [dto_endo_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_enca_docu_h].[dto_endo_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_enca_docu_h] ADD CONSTRAINT [dto_endo_h_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_enca_docu_p].[dto_endo_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_enca_docu_p] ADD CONSTRAINT [dto_endo_p_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_extr_docu].[PK_dto_extr_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_extr_docu] ADD CONSTRAINT [PK_dto_extr_docu] PRIMARY KEY CLUSTERED (
	[corr_extr] DESC,
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[corr_docu] ASC,
	[nomb_arch] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_fase].[dto_fase_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_fase] ADD CONSTRAINT [dto_fase_pk] PRIMARY KEY CLUSTERED (
	[fase_esdo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_reca_item].[DTO_REIT_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_reca_item] ADD CONSTRAINT [DTO_REIT_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_reit] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_reca_item_p].[DTO_REIT_P_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_reca_item_p] ADD CONSTRAINT [DTO_REIT_P_PK] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[nume_line] ASC,
	[corr_reit] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_rece_docu].[dtp_redo_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_rece_docu] ADD CONSTRAINT [dtp_redo_pk] PRIMARY KEY CLUSTERED (
	[corr_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_rece_docu_h].[dto_redo_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_rece_docu_h] ADD CONSTRAINT [dto_redo_h_pk] PRIMARY KEY CLUSTERED (
	[corr_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_rece_lob].[dto_rece_lob_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_rece_lob] ADD CONSTRAINT [dto_rece_lob_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_rece] ASC,
	[tipo_arch] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_rece_lob_h].[dto_rece_lob_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_rece_lob_h] ADD CONSTRAINT [dto_rece_lob_h_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_rece] ASC,
	[tipo_arch] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_suca_item].[DTO_SUIT_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_suca_item] ADD CONSTRAINT [DTO_SUIT_PK] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_suca] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_suca_item_p].[DTO_SUIT_P_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_suca_item_p] ADD CONSTRAINT [DTO_SUIT_P_PK] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[nume_line] ASC,
	[corr_suca] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_suce_esap].[dto_suce_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_suce_esap] ADD CONSTRAINT [dto_suce_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_docu] ASC,
	[corr_suce] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_suma_impu].[dto_suim_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_suma_impu] ADD CONSTRAINT [dto_suim_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_suma_impu_h].[dto_suim_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_suma_impu_h] ADD CONSTRAINT [dto_suim_h_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_suma_impu_p].[dto_suim_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_suma_impu_p] ADD CONSTRAINT [dto_suim_p_pk] PRIMARY KEY CLUSTERED (
	[corr_docu] ASC,
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_tido_rece].[dto_tdev_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_tido_rece] ADD CONSTRAINT [dto_tdev_pk] PRIMARY KEY CLUSTERED (
	[corr_envi] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_tido_rece_h].[dto_tdev_h_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_tido_rece_h] ADD CONSTRAINT [dto_tdev_h_pk] PRIMARY KEY CLUSTERED (
	[corr_envi] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_trace].[DTO_TRACE_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_trace] ADD CONSTRAINT [DTO_TRACE_PK] PRIMARY KEY CLUSTERED (
	[rutt_emis] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[feho_trac] ASC,
	[esta_trac] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[empr].[empp_pk_empp_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[empr] ADD CONSTRAINT [empp_pk_empp_1] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[empr_exte].[emex_pk_emex_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[empr_exte] ADD CONSTRAINT [emex_pk_emex_1] PRIMARY KEY CLUSTERED (
	[codi_emex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[foli_anul].[foan_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[foli_anul] ADD CONSTRAINT [foan_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[codi_zona] ASC,
	[codi_ofic] ASC,
	[tipo_como] ASC,
	[foli_foan] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_cara_libr].[LBCALI_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_cara_libr] ADD CONSTRAINT [LBCALI_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[CORR_LIBE] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_deta_docu].[lbe_deta_docu_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_deta_docu] ADD CONSTRAINT [lbe_deta_docu_pk] PRIMARY KEY CLUSTERED (
	[codi_soli] ASC,
	[corr_libe] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_deta_libr].[LBDELI_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_deta_libr] ADD CONSTRAINT [LBDELI_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[CORR_LIBE] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_enca_libr].[lbe_enca_libr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_enca_libr] ADD CONSTRAINT [lbe_enca_libr_pk] PRIMARY KEY CLUSTERED (
	[codi_soli] ASC,
	[corr_libe] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_noti_libr].[LBNOLI_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_noti_libr] ADD CONSTRAINT [LBNOLI_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[FOLI_NOTI] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_peri_tise].[LBPETI_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_peri_tise] ADD CONSTRAINT [LBPETI_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[CORR_LIBE] ASC,
	[TIPO_DOCU] ASC,
	[INDI_SERV] ASC,
	[PERI_DEVE] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_resu_peri].[LBREPE_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_resu_peri] ADD CONSTRAINT [LBREPE_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[CORR_LIBE] ASC,
	[TIPO_DOCU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_resu_segm].[LBRESE_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_resu_segm] ADD CONSTRAINT [LBRESE_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[CORR_LIBE] ASC,
	[TIPO_DOCU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_segm_tise].[LBSETI_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_segm_tise] ADD CONSTRAINT [LBSETI_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[CORR_LIBE] ASC,
	[TIPO_DOCU] ASC,
	[INDI_SERV] ASC,
	[PERI_DEVE] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_serv_peri].[lbe_serv_peri_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_serv_peri] ADD CONSTRAINT [lbe_serv_peri_pk] PRIMARY KEY CLUSTERED (
	[codi_soli] ASC,
	[tipo_docu] ASC,
	[corr_libe] ASC,
	[codi_serv] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_serv_segm].[lbe_serv_segm_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_serv_segm] ADD CONSTRAINT [lbe_serv_segm_pk] PRIMARY KEY CLUSTERED (
	[codi_soli] ASC,
	[tipo_docu] ASC,
	[corr_libe] ASC,
	[codi_serv] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_soli_libr].[lbe_soli_libr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_soli_libr] ADD CONSTRAINT [lbe_soli_libr_pk] PRIMARY KEY CLUSTERED (
	[codi_soli] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_tota_peri].[lbe_tota_peri_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_tota_peri] ADD CONSTRAINT [lbe_tota_peri_pk] PRIMARY KEY CLUSTERED (
	[codi_soli] ASC,
	[corr_libe] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_tota_segm].[lbe_tota_segm_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lbe_tota_segm] ADD CONSTRAINT [lbe_tota_segm_pk] PRIMARY KEY CLUSTERED (
	[codi_soli] ASC,
	[corr_libe] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_comi].[lcv_deco_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_deta_comi] ADD CONSTRAINT [lcv_deco_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[rutt_asoc] ASC,
	[codi_oper] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_docu].[lcv_dedo_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_deta_docu] ADD CONSTRAINT [lcv_dedo_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[rutt_asoc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_docu_p].[lcv_dedo_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_deta_docu_p] ADD CONSTRAINT [lcv_dedo_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[rutt_asoc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_nore].[lcv_denr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [lcv_denr_pk] ON [dbo].[lcv_deta_nore] (
	[corr_licv] ASC,
	[codi_empr] ASC,
	[codi_nore] ASC,
	[tipo_docu] ASC,
	[rutt_asoc] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_nore_p].[lcv_denr_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_deta_nore_p] ADD CONSTRAINT [lcv_denr_p_pk] PRIMARY KEY CLUSTERED (
	[corr_licv] ASC,
	[codi_empr] ASC,
	[codi_nore] ASC,
	[tipo_docu] ASC,
	[rutt_asoc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_temp].[lcv_temp_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_deta_temp] ADD CONSTRAINT [lcv_temp_pk] PRIMARY KEY CLUSTERED (
	[tipo_oper] ASC,
	[tipo_libr] ASC,
	[rutt_asoc] ASC,
	[peri_trib] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[rutt_cont] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[LCV_DIGI_DOCU].[LCVDIGI_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[LCV_DIGI_DOCU] ADD CONSTRAINT [LCVDIGI_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[TIPO_OPER] ASC,
	[RUTT_ASOC] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[LCV_DIGI_IMPU].[LCVIMPU_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[LCV_DIGI_IMPU] ADD CONSTRAINT [LCVIMPU_PK] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC,
	[TIPO_OPER] ASC,
	[RUTT_ASOC] ASC,
	[CODI_IMPU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_docu_serv].[lcv_Docu_serv_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_docu_serv] ADD CONSTRAINT [lcv_Docu_serv_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_nore_temp].[lcv_tmp3_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_nore_temp] ADD CONSTRAINT [lcv_tmp3_pk] PRIMARY KEY CLUSTERED (
	[tipo_oper] ASC,
	[tipo_libr] ASC,
	[rutt_asoc] ASC,
	[peri_trib] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[rutt_cont] ASC,
	[codi_nore] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_resu_libr].[lcv_reli_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_resu_libr] ADD CONSTRAINT [lcv_reli_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_resu_libr_p].[lcv_reli_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_resu_libr_p] ADD CONSTRAINT [lcv_reli_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_segm_impu].[lcv_seim_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_segm_impu] ADD CONSTRAINT [lcv_seim_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC,
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_segm_impu_p].[lcv_seim_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_segm_impu_p] ADD CONSTRAINT [lcv_seim_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC,
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_segm_nore].[lcv_senr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_segm_nore] ADD CONSTRAINT [lcv_senr_pk] PRIMARY KEY CLUSTERED (
	[corr_licv] ASC,
	[codi_empr] ASC,
	[codi_nore] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_segm_nore_p].[lcv_senr_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_segm_nore_p] ADD CONSTRAINT [lcv_senr_p_pk] PRIMARY KEY CLUSTERED (
	[corr_licv] ASC,
	[codi_empr] ASC,
	[codi_nore] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_comi].[lcv_toco_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_tota_comi] ADD CONSTRAINT [lcv_toco_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_docu].[lcv_todo_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_tota_docu] ADD CONSTRAINT [lcv_todo_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[rutt_asoc] ASC,
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_docu_p].[lcv_todo_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_tota_docu_p] ADD CONSTRAINT [lcv_todo_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[codi_impu] ASC,
	[rutt_asoc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_impu].[lcv_toim_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_tota_impu] ADD CONSTRAINT [lcv_toim_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC,
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_impu_p].[lcv_toim_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_tota_impu_p] ADD CONSTRAINT [lcv_toim_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC,
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_libr].[lcv_toli_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_tota_libr] ADD CONSTRAINT [lcv_toli_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_libr_p].[lcv_toli_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_tota_libr_p] ADD CONSTRAINT [lcv_toli_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_nore].[lcv_tonr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_tota_nore] ADD CONSTRAINT [lcv_tonr_pk] PRIMARY KEY CLUSTERED (
	[corr_licv] ASC,
	[codi_empr] ASC,
	[codi_nore] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_nore_p].[lcv_tonr_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_tota_nore_p] ADD CONSTRAINT [lcv_tonr_p_pk] PRIMARY KEY CLUSTERED (
	[corr_licv] ASC,
	[codi_empr] ASC,
	[codi_nore] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_segm].[lcv_tose_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_tota_segm] ADD CONSTRAINT [lcv_tose_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_segm_p].[lcv_tose_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_tota_segm_p] ADD CONSTRAINT [lcv_tose_p_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_temp].[lcv_tmp2_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lcv_tota_temp] ADD CONSTRAINT [lcv_tmp2_pk] PRIMARY KEY CLUSTERED (
	[tipo_oper] ASC,
	[tipo_libr] ASC,
	[rutt_asoc] ASC,
	[peri_trib] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[rutt_cont] ASC,
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_deta_docu].[lgd_deta_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lgd_deta_docu] ADD CONSTRAINT [lgd_deta_pk] PRIMARY KEY CLUSTERED (
	[corr_ligd] ASC,
	[codi_empr] ASC,
	[foli_docu] ASC,
	[tipo_oper] ASC,
	[rutt_asoc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_deta_docu_p].[lgd_deta_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lgd_deta_docu_p] ADD CONSTRAINT [lgd_deta_p_pk] PRIMARY KEY CLUSTERED (
	[corr_ligd] ASC,
	[codi_empr] ASC,
	[tipo_oper] ASC,
	[rutt_asoc] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_enca_ligd].[lgd_enca_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lgd_enca_ligd] ADD CONSTRAINT [lgd_enca_pk] PRIMARY KEY CLUSTERED (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_enca_ligd_p].[lgd_enca_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lgd_enca_ligd_p] ADD CONSTRAINT [lgd_enca_p_pk] PRIMARY KEY CLUSTERED (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tota_peri].[lgd_tope_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lgd_tota_peri] ADD CONSTRAINT [lgd_tope_pk] PRIMARY KEY CLUSTERED (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tota_peri_p].[lgd_tope_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lgd_tota_peri_p] ADD CONSTRAINT [lgd_tope_p_pk] PRIMARY KEY CLUSTERED (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tota_segm].[lgd_tose_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lgd_tota_segm] ADD CONSTRAINT [lgd_tose_pk] PRIMARY KEY CLUSTERED (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tota_segm_p].[lgd_tose_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lgd_tota_segm_p] ADD CONSTRAINT [lgd_tose_p_pk] PRIMARY KEY CLUSTERED (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_peri].[lgd_trpe_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lgd_tras_peri] ADD CONSTRAINT [lgd_trpe_pk] PRIMARY KEY CLUSTERED (
	[corr_ligd] ASC,
	[codi_empr] ASC,
	[codi_tras] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_peri_p].[lgd_trpe_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lgd_tras_peri_p] ADD CONSTRAINT [lgd_trpe_p_pk] PRIMARY KEY CLUSTERED (
	[corr_ligd] ASC,
	[codi_empr] ASC,
	[codi_tras] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_segm].[lgd_trse_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lgd_tras_segm] ADD CONSTRAINT [lgd_trse_pk] PRIMARY KEY CLUSTERED (
	[corr_ligd] ASC,
	[codi_empr] ASC,
	[codi_tras] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_segm_p].[lgd_trse_p_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lgd_tras_segm_p] ADD CONSTRAINT [lgd_trse_p_pk] PRIMARY KEY CLUSTERED (
	[corr_ligd] ASC,
	[codi_empr] ASC,
	[codi_tras] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[log_erro].[PK_log_erro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[log_erro] ADD CONSTRAINT [PK_log_erro] PRIMARY KEY CLUSTERED (
	[corr_logg] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[log_usuario].[PK_log_usuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[log_usuario] ADD CONSTRAINT [PK_log_usuario] PRIMARY KEY CLUSTERED (
	[log_fecha] ASC,
	[log_usuario] ASC,
	[log_codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mant_prod].[PK_mant_prod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mant_prod] ADD CONSTRAINT [PK_mant_prod] PRIMARY KEY CLUSTERED (
	[prod_codi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[moneda].[mone_pk_mone_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[moneda] ADD CONSTRAINT [mone_pk_mone_1] PRIMARY KEY CLUSTERED (
	[codi_mone] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mtod].[mtod_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mtod] ADD CONSTRAINT [mtod_pk] PRIMARY KEY CLUSTERED (
	[mtod_id] ASC,
	[mtod_stat] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ofic_empr].[ofic_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ofic_empr] ADD CONSTRAINT [ofic_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[codi_ofic] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[para_empr].[paem_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[para_empr] ADD CONSTRAINT [paem_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[tipo_como] ASC,
	[codi_paem] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[para_pers].[PAPE_PK_EMPR].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[para_pers] ADD CONSTRAINT [PAPE_PK_EMPR] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[CODI_PERS] ASC,
	[TIPO_COMO] ASC,
	[CODI_PAPE] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[PERS_PAIDE].[PERS_PAIDE_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[PERS_PAIDE] ADD CONSTRAINT [PERS_PAIDE_PK] PRIMARY KEY CLUSTERED (
	[CONT_RUTT] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[PERS_PUBL].[PERS_PUBL_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[PERS_PUBL] ADD CONSTRAINT [PERS_PUBL_PK] PRIMARY KEY CLUSTERED (
	[CONT_RUTT] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[PERS_PUBL_TEMP].[PERS_PUBL_TEMP_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[PERS_PUBL_TEMP] ADD CONSTRAINT [PERS_PUBL_TEMP_PK] PRIMARY KEY CLUSTERED (
	[CONT_RUTT] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[pers_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[personas] ADD CONSTRAINT [pers_pk] PRIMARY KEY CLUSTERED (
	[codi_pers] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[PROC_LOGS].[PK_PROC_LOGS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[PROC_LOGS] ADD CONSTRAINT [PK_PROC_LOGS] PRIMARY KEY CLUSTERED (
	[proceso] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[qse_docu_serv].[qse_docu_serv_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[qse_docu_serv] ADD CONSTRAINT [qse_docu_serv_pk] PRIMARY KEY CLUSTERED (
	[CODI_DOPR] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ramo].[RAMO_PK_RAMO_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ramo] ADD CONSTRAINT [RAMO_PK_RAMO_1] PRIMARY KEY CLUSTERED (
	[CODI_EMPR] ASC,
	[CODI_RAMO] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rep_dto_enca].[PK_RDTO_ENCA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rep_dto_enca] ADD CONSTRAINT [PK_RDTO_ENCA] PRIMARY KEY CLUSTERED (
	[corr_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rep_dto_sii].[IDX_REP_DTO_SII].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [IDX_REP_DTO_SII] ON [dbo].[rep_dto_sii] (
	[FECH_RECE] ASC,
	[FECH_EMIS] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[se_pipe].[PK__se_pipe__9A6DB7F6E0A4BCF0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[se_pipe] ADD CONSTRAINT [PK__se_pipe__9A6DB7F6E0A4BCF0] PRIMARY KEY CLUSTERED (
	[pipe_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alar].[sys_alar_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_alar] ADD CONSTRAINT [sys_alar_pk] PRIMARY KEY CLUSTERED (
	[codi_alar] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alar_emex].[sys_alar_emex_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_alar_emex] ADD CONSTRAINT [sys_alar_emex_pk] PRIMARY KEY CLUSTERED (
	[codi_emex] ASC,
	[codi_alar] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alar_empr].[sys_alar_empr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_alar_empr] ADD CONSTRAINT [sys_alar_empr_pk] PRIMARY KEY CLUSTERED (
	[codi_emex] ASC,
	[codi_empr] ASC,
	[codi_alar] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alin].[sys_alin_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_alin] ADD CONSTRAINT [sys_alin_pk] PRIMARY KEY CLUSTERED (
	[codi_alin] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alri].[sys_alri_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_alri] ADD CONSTRAINT [sys_alri_pk] PRIMARY KEY CLUSTERED (
	[codi_alar] ASC,
	[codi_rous] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alro].[sys_alro_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_alro] ADD CONSTRAINT [sys_alro_pk] PRIMARY KEY CLUSTERED (
	[codi_alar] ASC,
	[codi_rous] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alus].[sys_alus_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_alus] ADD CONSTRAINT [sys_alus_pk] PRIMARY KEY CLUSTERED (
	[codi_alar] ASC,
	[codi_usua] ASC,
	[orig_alus] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_attr_cult].[sys_attr_cult_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_attr_cult] ADD CONSTRAINT [sys_attr_cult_pk] PRIMARY KEY CLUSTERED (
	[object_name] ASC,
	[attr_name] ASC,
	[codi_cult] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_attribute].[sys_attrribute_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_attribute] ADD CONSTRAINT [sys_attrribute_pk] PRIMARY KEY CLUSTERED (
	[object_name] ASC,
	[attr_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_code].[sys_code_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_code] ADD CONSTRAINT [sys_code_pk] PRIMARY KEY CLUSTERED (
	[domain_code] ASC,
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_codi].[sys_codi_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_codi] ADD CONSTRAINT [sys_codi_pk] PRIMARY KEY CLUSTERED (
	[domain_code] ASC,
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_comment].[ip_sys_comment].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_comment] ADD CONSTRAINT [ip_sys_comment] PRIMARY KEY CLUSTERED (
	[object_prog] ASC,
	[object_type] ASC,
	[comment_line] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_connection].[PK_sys_connection].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_connection] ADD CONSTRAINT [PK_sys_connection] PRIMARY KEY CLUSTERED (
	[corr_conn] ASC,
	[codi_usex] ASC,
	[corr_sess] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_defp].[sys_defp_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_defp] ADD CONSTRAINT [sys_defp_pk] PRIMARY KEY CLUSTERED (
	[corr_defp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_doma_cult].[sys_doma_cult_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_doma_cult] ADD CONSTRAINT [sys_doma_cult_pk] PRIMARY KEY CLUSTERED (
	[domain_code] ASC,
	[codi_cult] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_domain].[sys_domain_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_domain] ADD CONSTRAINT [sys_domain_pk] PRIMARY KEY CLUSTERED (
	[domain_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_fupr].[sys_fupr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_fupr] ADD CONSTRAINT [sys_fupr_pk] PRIMARY KEY CLUSTERED (
	[corr_fupr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_furo].[sys_furo_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_furo] ADD CONSTRAINT [sys_furo_pk] PRIMARY KEY CLUSTERED (
	[codi_rous] ASC,
	[object_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_inst].[sys_inst_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_inst] ADD CONSTRAINT [sys_inst_pk] PRIMARY KEY CLUSTERED (
	[object_name] ASC,
	[object_number] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_key].[sys_key_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_key] ADD CONSTRAINT [sys_key_pk] PRIMARY KEY CLUSTERED (
	[table_name] ASC,
	[number_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_key_attr].[sys_key_attr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_key_attr] ADD CONSTRAINT [sys_key_attr_pk] PRIMARY KEY CLUSTERED (
	[table_name] ASC,
	[number_key] ASC,
	[attr_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_mess_cult].[sys_mess_cult_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_mess_cult] ADD CONSTRAINT [sys_mess_cult_pk] PRIMARY KEY CLUSTERED (
	[codi_mess] ASC,
	[codi_cult] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_message].[sys_message_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_message] ADD CONSTRAINT [sys_message_pk] PRIMARY KEY CLUSTERED (
	[codi_mess] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_modu_obje].[sys_modu_obje_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_modu_obje] ADD CONSTRAINT [sys_modu_obje_pk] PRIMARY KEY CLUSTERED (
	[codi_modu] ASC,
	[object_name] ASC,
	[object_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_obac].[sys_obac_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_obac] ADD CONSTRAINT [sys_obac_pk] PRIMARY KEY CLUSTERED (
	[codi_acti] ASC,
	[object_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_obje_cult].[sys_obje_cult_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_obje_cult] ADD CONSTRAINT [sys_obje_cult_pk] PRIMARY KEY CLUSTERED (
	[object_name] ASC,
	[codi_cult] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_object].[sys_obje_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_object] ADD CONSTRAINT [sys_obje_pk] PRIMARY KEY CLUSTERED (
	[object_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_relation].[sys_rela_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_relation] ADD CONSTRAINT [sys_rela_pk] PRIMARY KEY CLUSTERED (
	[source_object] ASC,
	[source_type] ASC,
	[target_object] ASC,
	[target_type] ASC,
	[relation_type] ASC,
	[number_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_session].[sys_session_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_session] ADD CONSTRAINT [sys_session_pk] PRIMARY KEY CLUSTERED (
	[corr_sess] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_user_objects].[sys_users_objects_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_user_objects] ADD CONSTRAINT [sys_users_objects_pk] PRIMARY KEY CLUSTERED (
	[object_name] ASC,
	[object_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_usfa].[sys_usfa_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_usfa] ADD CONSTRAINT [sys_usfa_pk] PRIMARY KEY CLUSTERED (
	[codi_usua] ASC,
	[object_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_usro].[sys_usro_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_usro] ADD CONSTRAINT [sys_usro_pk] PRIMARY KEY CLUSTERED (
	[codi_usua] ASC,
	[codi_modu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usem_exte].[ueex_pk_ueex_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usem_exte] ADD CONSTRAINT [ueex_pk_ueex_1] PRIMARY KEY CLUSTERED (
	[codi_usex] ASC,
	[codi_emex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usua_empr].[emus_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usua_empr] ADD CONSTRAINT [emus_pk] PRIMARY KEY CLUSTERED (
	[codi_empr] ASC,
	[codi_usua] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usua_exte].[usex_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usua_exte] ADD CONSTRAINT [usex_pk] PRIMARY KEY CLUSTERED (
	[codi_usex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usua_sist].[usua_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usua_sist] ADD CONSTRAINT [usua_pk] PRIMARY KEY CLUSTERED (
	[codi_usua] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[valo_cage].[vacg_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[valo_cage] ADD CONSTRAINT [vacg_pk] PRIMARY KEY CLUSTERED (
	[codi_cage] ASC,
	[codi_vacg] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[version].[PK_version].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[version] ADD CONSTRAINT [PK_version] PRIMARY KEY CLUSTERED (
	[componente] ASC,
	[version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[web_esta_proc].[PK_web_esta_proc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[web_esta_proc] ADD CONSTRAINT [PK_web_esta_proc] PRIMARY KEY CLUSTERED (
	[corr_proc] ASC
) ON [PRIMARY]
