
GO
--SqlScripter----[dbo].[CARA_PEEM].[IA_CPEM_FEIN].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IA_CPEM_FEIN] ON [dbo].[CARA_PEEM] (
	[FEIN_CAPE] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CARA_PEEM].[IA_CPEM_FETE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IA_CPEM_FETE] ON [dbo].[CARA_PEEM] (
	[FETE_CAPE] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CARA_PEEM].[IA_CPEM_VACG].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IA_CPEM_VACG] ON [dbo].[CARA_PEEM] (
	[CODI_EMPR] ASC,
	[CODI_CAGE] ASC,
	[CODI_VACG] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cara_pers].[ia_cape_fein].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_cape_fein] ON [dbo].[cara_pers] (
	[fein_cape] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cara_pers].[ia_cape_fete].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_cape_fete] ON [dbo].[cara_pers] (
	[fete_cape] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cara_pers].[ia_cape_vacg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_cape_vacg] ON [dbo].[cara_pers] (
	[codi_cage] ASC,
	[codi_vacg] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cent_cost].[ceco_uk_ceco_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ceco_uk_ceco_2] ON [dbo].[cent_cost] (
	[codi_empr] ASC,
	[nomb_ceco] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cent_cost].[id_ceco_tipo_ceco].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [id_ceco_tipo_ceco] ON [dbo].[cent_cost] (
	[tipo_ceco] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cent_cost].[if_ceco1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [if_ceco1] ON [dbo].[cent_cost] (
	[codi_empr] ASC,
	[codi_ceco1] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_LIMP_ARCH].[DBN_LIMP_ARCH_IDX].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [DBN_LIMP_ARCH_IDX] ON [dbo].[DBN_LIMP_ARCH] (
	[GRPO_LIMP] ASC,
	[CODI_ARCH] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_LIMP_GRPO].[DBN_LIMP_GRPO_IDX1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [DBN_LIMP_GRPO_IDX1] ON [dbo].[DBN_LIMP_GRPO] (
	[GRPO_LIMP] ASC,
	[CODI_GRPO] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_LIMP_LOGG].[DBN_LIMP_LOGG_IDX1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [DBN_LIMP_LOGG_IDX1] ON [dbo].[DBN_LIMP_LOGG] (
	[CORR_LOGG] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbn_list_colu].[DBN_LIST_COLU_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dbn_list_colu] ADD CONSTRAINT [DBN_LIST_COLU_PK] PRIMARY KEY NONCLUSTERED (
	[CODI_REPO] ASC,
	[CODI_COLU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_LOG_50].[DBN_LOG_50_LIMPIA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [DBN_LOG_50_LIMPIA] ON [dbo].[DBN_LOG_50] (
	[TMST_REGI_LOGG] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_MONI_PROC].[DBN_MONI_PROC_LIMPIA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [DBN_MONI_PROC_LIMPIA] ON [dbo].[DBN_MONI_PROC] (
	[MOPR_ESTA_INST] ASC,
	[MOPR_FECH_REPO] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBN_TRAZA_DOCU].[DBN_TRAZA_DOCU_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [DBN_TRAZA_DOCU_idx] ON [dbo].[DBN_TRAZA_DOCU] (
	[CODI_EMEX] ASC,
	[CODI_EMPR] ASC,
	[TIPO_DOCU] ASC,
	[FOLI_DOCU] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_ARCH].[codi_serv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [codi_serv] ON [dbo].[DBQ_ARCH] (
	[CODI_SERV] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_ARCH].[dbq_arch_codi_grpo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbq_arch_codi_grpo] ON [dbo].[DBQ_ARCH] (
	[CODI_GRPO] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_ARCH].[dbq_arch_esta_serv_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbq_arch_esta_serv_idx] ON [dbo].[DBQ_ARCH] (
	[ESTA_ARCH] ASC,
	[CODI_SERV] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_ARCH].[DBQ_ARCH_LIMPIA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [DBQ_ARCH_LIMPIA] ON [dbo].[DBQ_ARCH] (
	[TMST_REGI_ARCH] ASC,
	[ESTA_ARCH] ASC,
	[CODI_SERV] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_ARCH].[DBQ_ARCH_LIMPIA1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [DBQ_ARCH_LIMPIA1] ON [dbo].[DBQ_ARCH] (
	[TMST_REGI_ARCH] ASC,
	[ESTA_ARCH] ASC,
	[NOMB_ARCH] ASC,
	[CODI_GRPO] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_ARCH].[DBQ_ARCH_LIMPIA2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [DBQ_ARCH_LIMPIA2] ON [dbo].[DBQ_ARCH] (
	[ESTA_ARCH] ASC,
	[CODI_SERV] ASC,
	[CODI_SERV_ORIG] ASC,
	[TMST_REGI_ARCH] ASC)
INCLUDE (
	[CODI_ARCH],
	[NOMB_ARCH]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_ARCH].[DBQ_ARCH_PROCESOS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [DBQ_ARCH_PROCESOS] ON [dbo].[DBQ_ARCH] (
	[CODI_SERV] ASC,
	[CONT_PROC_ARCH] ASC)
INCLUDE (
	[CODI_ARCH],
	[ESTA_ARCH],
	[TMST_PROC_ARCH],
	[TMST_REGI_ARCH]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_ARCH].[DBQ_ARCH_TED].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [DBQ_ARCH_TED] ON [dbo].[DBQ_ARCH] (
	[EXTE_ARCH] ASC,
	[NOMB_ARCH] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbq_cana].[dbq_cana_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbq_cana_idx] ON [dbo].[dbq_cana] (
	[ESTA_CANA] ASC,
	[NOMB_CANA] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbq_cana].[dbq_nomb_cana].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dbq_cana] ADD CONSTRAINT [dbq_nomb_cana] UNIQUE NONCLUSTERED (
	[NOMB_CANA] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbq_erro].[DBQ_ERRO_LIMPIA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [DBQ_ERRO_LIMPIA] ON [dbo].[dbq_erro] (
	[TMST_ERRO] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_GRPO].[dbq_grpo_esta_serv_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbq_grpo_esta_serv_idx] ON [dbo].[DBQ_GRPO] (
	[ESTA_GRPO] ASC,
	[CODI_SERV] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DBQ_GRPO].[dbq_grpo_send_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbq_grpo_send_idx] ON [dbo].[DBQ_GRPO] (
	[TRPT_GRPO] ASC,
	[MODO_GRPO] ASC,
	[NOMB_CANA] ASC,
	[ESTA_GRPO] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_acec_empr].[xif26dte_acec_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif26dte_acec_empr] ON [dbo].[dte_acec_empr] (
	[codi_acec] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_cesi_docu].[ix_dte_cesi_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_dte_cesi_docu] ON [dbo].[dte_cesi_docu] (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_item_h].[DTE_DEIT_UK_H].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [DTE_DEIT_UK_H] ON [dbo].[dte_desc_item_h] (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[corr_deit] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_desc_reca_h].[DTE_DERE_UK_H].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [DTE_DERE_UK_H] ON [dbo].[dte_desc_reca_h] (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_dere] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_acec].[dte_acec_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_deta_acec] ADD CONSTRAINT [dte_acec_uk] UNIQUE NONCLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[codi_acec] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_acec_h].[DTE_ACEC_H_UK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_deta_acec_h] ADD CONSTRAINT [DTE_ACEC_H_UK] UNIQUE NONCLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[codi_acec] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_acec_h].[DTE_ACEC_UK_H].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [DTE_ACEC_UK_H] ON [dbo].[dte_deta_acec_h] (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[codi_acec] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_codi].[dte_deco_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_deta_codi] ADD CONSTRAINT [dte_deco_uk] UNIQUE NONCLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[tipo_codi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_codi_h].[DTE_DECO_H_UK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_deta_codi_h] ADD CONSTRAINT [DTE_DECO_H_UK] UNIQUE NONCLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[tipo_codi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_codi_h].[DTE_DECO_UK_H].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [DTE_DECO_UK_H] ON [dbo].[dte_deta_codi_h] (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[tipo_codi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_deta_prse_h].[DTE_DTPR_UK_H].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [DTE_DTPR_UK_H] ON [dbo].[dte_deta_prse_h] (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu].[dte_cola_proc_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dte_cola_proc_idx] ON [dbo].[dte_enca_docu] (
	[cola_proc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu].[DTE_ENCA_CORR].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [DTE_ENCA_CORR] ON [dbo].[dte_enca_docu] (
	[corr_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu].[dte_enca_UK_esta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dte_enca_UK_esta] ON [dbo].[dte_enca_docu] (
	[esta_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu].[dte_endo_uk1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_enca_docu] ADD CONSTRAINT [dte_endo_uk1] UNIQUE NONCLUSTERED (
	[rutt_emis] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu].[I2_DTE_ENCA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [I2_DTE_ENCA] ON [dbo].[dte_enca_docu] (
	[esta_docu] ASC,
	[codi_empr] ASC,
	[corr_envi] ASC,
	[cola_proc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu].[I3_DTE_ENCA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [I3_DTE_ENCA] ON [dbo].[dte_enca_docu] (
	[corr_envi] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu].[IA_ENCA_DOCU1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IA_ENCA_DOCU1] ON [dbo].[dte_enca_docu] (
	[codi_empr] ASC,
	[fech_emis] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu].[IA_ENDO_CORR_ENVI].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IA_ENDO_CORR_ENVI] ON [dbo].[dte_enca_docu] (
	[corr_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu].[IA_ENDO_CORR_ENVI1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IA_ENDO_CORR_ENVI1] ON [dbo].[dte_enca_docu] (
	[corr_envi1] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu].[IA_ENVI_CONT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IA_ENVI_CONT] ON [dbo].[dte_enca_docu] (
	[codi_empr] ASC,
	[hace_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu].[monitorESP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [monitorESP] ON [dbo].[dte_enca_docu] (
	[codi_emex] ASC,
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[rutt_rece] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu_h].[DTE_ENDO_H_UK1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_enca_docu_h] ADD CONSTRAINT [DTE_ENDO_H_UK1] UNIQUE NONCLUSTERED (
	[rutt_emis] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_enca_docu_h].[DTE_ENDO_UK1_H].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [DTE_ENDO_UK1_H] ON [dbo].[dte_enca_docu_h] (
	[rutt_emis] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_docu].[dte_envi_docu_feho].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dte_envi_docu_feho] ON [dbo].[dte_envi_docu] (
	[feho_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_docu].[dte_envi_UK_esta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dte_envi_UK_esta] ON [dbo].[dte_envi_docu] (
	[esta_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_envi_trace].[ia_dte_entra].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_dte_entra] ON [dbo].[dte_envi_trace] (
	[codi_empr] ASC,
	[corr_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_esta_apro].[dte_esap_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dte_esap_idx] ON [dbo].[dte_esta_apro] (
	[codi_esap] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_esta_docu].[dte_esdo_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_esta_docu] ADD CONSTRAINT [dte_esdo_uk] UNIQUE NONCLUSTERED (
	[desc_esdo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_esta_envi].[dte_esen_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_esta_envi] ADD CONSTRAINT [dte_esen_uk] UNIQUE NONCLUSTERED (
	[desc_esen] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_fase_esta].[IA_ESFA_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IA_ESFA_1] ON [dbo].[dte_fase_esta] (
	[fase_esdo] ASC,
	[esta_docu1] ASC,
	[esta_envi1] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_fase_esta].[IA_ESFA_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IA_ESFA_2] ON [dbo].[dte_fase_esta] (
	[fase_esdo] ASC,
	[esta_docu] ASC,
	[esta_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_proc_evnt].[dte_proc_evnt_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dte_proc_evnt_idx] ON [dbo].[dte_proc_evnt] (
	[esta_evnt] ASC,
	[fech_proc_evnt] ASC,
	[cont_proc_evnt] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_rang_foli].[dte_rafo_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_rang_foli] ADD CONSTRAINT [dte_rafo_uk] UNIQUE NONCLUSTERED (
	[codi_empr] ASC,
	[tipo_dora] ASC,
	[foli_desd] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suca_item].[dte_scit_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_suca_item] ADD CONSTRAINT [dte_scit_uk] UNIQUE NONCLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[codi_suca] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suca_item_h].[DTE_SCIT_H_UK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_suca_item_h] ADD CONSTRAINT [DTE_SCIT_H_UK] UNIQUE NONCLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[nume_line] ASC,
	[codi_suca] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_sucu_emis].[dte_sucemis_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_sucu_emis] ADD CONSTRAINT [dte_sucemis_uk] UNIQUE NONCLUSTERED (
	[diip_sucu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_suma_impu_h].[DTE_SUIM_PK_H].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [DTE_SUIM_PK_H] ON [dbo].[dte_suma_impu_h] (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_trace].[ia_dte_trace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_dte_trace] ON [dbo].[dte_trace] (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dte_vali_erro].[dte_vaer_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dte_vali_erro] ADD CONSTRAINT [dte_vaer_uk] UNIQUE NONCLUSTERED (
	[codi_sqls] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dtec_address].[idx_addr_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_addr_name] ON [dbo].[dtec_address] (
	[name_addr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dtec_empr_auth].[idx_empr_auth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_empr_auth] ON [dbo].[dtec_empr_auth] (
	[hold_empr] ASC,
	[rutt_empr] ASC,
	[digi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dtec_message].[idx_msge_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_msge_name] ON [dbo].[dtec_message] (
	[name_msge] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_deta_acec].[dto_acec_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_deta_acec] ADD CONSTRAINT [dto_acec_uk] UNIQUE NONCLUSTERED (
	[codi_empr] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[codi_acec] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_enca_docu].[dto_endo_uk1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dto_enca_docu] ADD CONSTRAINT [dto_endo_uk1] UNIQUE NONCLUSTERED (
	[rutt_emis] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_enca_docu_p].[dto_enca_UK_esta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dto_enca_UK_esta] ON [dbo].[dto_enca_docu_p] (
	[esta_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_enca_docu_p].[dto_endo_p_indx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dto_endo_p_indx1] ON [dbo].[dto_enca_docu_p] (
	[esta_tras] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_enca_docu_p].[IDX_DTO_ENCA_DOCU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_DTO_ENCA_DOCU] ON [dbo].[dto_enca_docu_p] (
	[rutt_rece] ASC,
	[rutt_emis] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[esta_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_enca_docu_p].[IDX_DTO_ENCA_DOCU_MONI].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_DTO_ENCA_DOCU_MONI] ON [dbo].[dto_enca_docu_p] (
	[codi_empr] ASC,
	[corr_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_enca_docu_p].[IDX_DTO_ENCA_DOCU_NUME].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_DTO_ENCA_DOCU_NUME] ON [dbo].[dto_enca_docu_p] (
	[rutt_rece] ASC,
	[rutt_emis] ASC,
	[tipo_docu] ASC,
	[foli_nume] ASC,
	[esta_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_fase_esta].[dto_fase_esta_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dto_fase_esta_docu] ON [dbo].[dto_fase_esta] (
	[fase_esdo] ASC,
	[esta_envi] ASC,
	[esta_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_fase_esta].[dto_fase_esta_envi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dto_fase_esta_envi] ON [dbo].[dto_fase_esta] (
	[fase_esdo] ASC,
	[esta_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_fase_esta].[dto_fase_esta_esap].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dto_fase_esta_esap] ON [dbo].[dto_fase_esta] (
	[fase_esdo] ASC,
	[esta_envi] ASC,
	[codi_esap] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_fase_esta].[dto_fase_esta_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dto_fase_esta_id] ON [dbo].[dto_fase_esta] (
	[fase_esdo] ASC,
	[esta_docu] ASC,
	[esta_envi] ASC,
	[codi_esap] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_rece_docu].[dto_rece_UK_esta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dto_rece_UK_esta] ON [dbo].[dto_rece_docu] (
	[esta_envi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dto_trace].[ia_dto_trace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_dto_trace] ON [dbo].[dto_trace] (
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[empr].[ia_empp_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_empp_2] ON [dbo].[empr] (
	[nomb_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[empr].[id_empp_codi_comu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [id_empp_codi_comu] ON [dbo].[empr] (
	[codi_comu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[empr_exte].[emex_uk_emex_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[empr_exte] ADD CONSTRAINT [emex_uk_emex_2] UNIQUE NONCLUSTERED (
	[nomb_emex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[foli_anul].[ia_foan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_foan] ON [dbo].[foli_anul] (
	[codi_empr] ASC,
	[codi_zona] ASC,
	[codi_ofic] ASC,
	[fech_foan] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[foli_anul].[ip_foan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ip_foan] ON [dbo].[foli_anul] (
	[codi_empr] ASC,
	[tipo_como] ASC,
	[foli_foan] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_deta_docu].[XAK2lbe_deta_docu_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [XAK2lbe_deta_docu_empr] ON [dbo].[lbe_deta_docu] (
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_enca_libr].[XAK1lbe_enca_libr_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [XAK1lbe_enca_libr_empr] ON [dbo].[lbe_enca_libr] (
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_serv_peri].[XAK2lbe_serv_peri_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [XAK2lbe_serv_peri_empr] ON [dbo].[lbe_serv_peri] (
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_serv_segm].[XAK2lbe_serv_segm_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [XAK2lbe_serv_segm_empr] ON [dbo].[lbe_serv_segm] (
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_soli_libr].[XIE1lbe_soli_libr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [XIE1lbe_soli_libr] ON [dbo].[lbe_soli_libr] (
	[codi_soli] ASC,
	[peri_desd] ASC,
	[rutt_rece] ASC,
	[digi_rece] ASC,
	[mont_mini] ASC,
	[nume_dtes] ASC,
	[peri_hast] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_tota_peri].[XAK1lbe_tota_peri_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [XAK1lbe_tota_peri_empr] ON [dbo].[lbe_tota_peri] (
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_tota_segm].[lbe_tose_k_enca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lbe_tose_k_enca] ON [dbo].[lbe_tota_segm] (
	[corr_libe] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_tota_segm].[lbe_tota_k_lbe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lbe_tota_k_lbe] ON [dbo].[lbe_tota_segm] (
	[corr_libe] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lbe_tota_segm].[XAK1lbe_tota_segm_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [XAK1lbe_tota_segm_empr] ON [dbo].[lbe_tota_segm] (
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_docu].[lcv_reli_k_dedo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_reli_k_dedo] ON [dbo].[lcv_deta_docu] (
	[corr_licv] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_deta_docu_p].[lcv_reli_k_dedo_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_reli_k_dedo_p] ON [dbo].[lcv_deta_docu_p] (
	[corr_licv] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_segm_impu].[lcv_impu_k_seim].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_impu_k_seim] ON [dbo].[lcv_segm_impu] (
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_segm_impu].[lcv_tose_k_seim].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_tose_k_seim] ON [dbo].[lcv_segm_impu] (
	[corr_licv] ASC,
	[codi_empr] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_segm_impu_p].[lcv_impu_k_seim_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_impu_k_seim_p] ON [dbo].[lcv_segm_impu_p] (
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_segm_impu_p].[lcv_tose_k_seim_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_tose_k_seim_p] ON [dbo].[lcv_segm_impu_p] (
	[corr_licv] ASC,
	[codi_empr] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_docu].[lcv_dedo_k_todo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_dedo_k_todo] ON [dbo].[lcv_tota_docu] (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC,
	[rutt_asoc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_docu].[lcv_impu_k_todo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_impu_k_todo] ON [dbo].[lcv_tota_docu] (
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_docu_p].[lcv_dedo_k_todo_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_dedo_k_todo_p] ON [dbo].[lcv_tota_docu_p] (
	[codi_empr] ASC,
	[corr_licv] ASC,
	[tipo_docu] ASC,
	[foli_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_docu_p].[lcv_impu_k_todo_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_impu_k_todo_p] ON [dbo].[lcv_tota_docu_p] (
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_impu].[lcv_impu_k_toim].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_impu_k_toim] ON [dbo].[lcv_tota_impu] (
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_impu].[lcv_toli_k_toim].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_toli_k_toim] ON [dbo].[lcv_tota_impu] (
	[corr_licv] ASC,
	[codi_empr] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_impu_p].[lcv_impu_k_toim_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_impu_k_toim_p] ON [dbo].[lcv_tota_impu_p] (
	[codi_impu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_impu_p].[lcv_toli_k_toim_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_toli_k_toim_p] ON [dbo].[lcv_tota_impu_p] (
	[corr_licv] ASC,
	[codi_empr] ASC,
	[tipo_docu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_libr].[lcv_reli_k_toli].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_reli_k_toli] ON [dbo].[lcv_tota_libr] (
	[corr_licv] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_segm].[lcv_reli_k_seli].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_reli_k_seli] ON [dbo].[lcv_tota_segm] (
	[corr_licv] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lcv_tota_segm_p].[lcv_reli_k_seli_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcv_reli_k_seli_p] ON [dbo].[lcv_tota_segm_p] (
	[corr_licv] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_deta_docu].[lgd_enli_k_dedo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lgd_enli_k_dedo] ON [dbo].[lgd_deta_docu] (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_deta_docu_p].[lgd_enli_k_dedo_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lgd_enli_k_dedo_p] ON [dbo].[lgd_deta_docu_p] (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tota_peri].[lgd_tope_k_enli].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lgd_tope_k_enli] ON [dbo].[lgd_tota_peri] (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tota_peri_p].[lgd_tope_k_enli_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lgd_tope_k_enli_p] ON [dbo].[lgd_tota_peri_p] (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tota_segm].[lgd_enli_k_tose].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lgd_enli_k_tose] ON [dbo].[lgd_tota_segm] (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tota_segm_p].[lgd_enli_k_tose_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lgd_enli_k_tose_p] ON [dbo].[lgd_tota_segm_p] (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_peri].[lgd_trpe_k_tope].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lgd_trpe_k_tope] ON [dbo].[lgd_tras_peri] (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_peri].[lgd_trpe_k_tras].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lgd_trpe_k_tras] ON [dbo].[lgd_tras_peri] (
	[codi_tras] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_peri_p].[lgd_trpe_k_tope_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lgd_trpe_k_tope_p] ON [dbo].[lgd_tras_peri_p] (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_peri_p].[lgd_trpe_k_tras_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lgd_trpe_k_tras_p] ON [dbo].[lgd_tras_peri_p] (
	[codi_tras] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_segm].[lgd_tose_k_trse].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lgd_tose_k_trse] ON [dbo].[lgd_tras_segm] (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lgd_tras_segm_p].[lgd_tose_k_trse_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lgd_tose_k_trse_p] ON [dbo].[lgd_tras_segm_p] (
	[corr_ligd] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[moneda].[ia_mone_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_mone_2] ON [dbo].[moneda] (
	[nomb_mone] ASC,
	[roun_mone] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ofic_empr].[ia_ofic_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_ofic_2] ON [dbo].[ofic_empr] (
	[desc_ofic] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ofic_empr].[if_ofic_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [if_ofic_1] ON [dbo].[ofic_empr] (
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[para_empr].[paem_ia_desc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [paem_ia_desc] ON [dbo].[para_empr] (
	[desc_paem] ASC,
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[ia_pers_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_pers_2] ON [dbo].[personas] (
	[nomb_pers] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[ia_pers_4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_pers_4] ON [dbo].[personas] (
	[rutt_pers] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[id_pers_clie_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [id_pers_clie_pers] ON [dbo].[personas] (
	[clie_pers] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[id_pers_codi_comu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [id_pers_codi_comu] ON [dbo].[personas] (
	[codi_comu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[id_pers_comp_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [id_pers_comp_pers] ON [dbo].[personas] (
	[comp_pers] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[id_pers_empl_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [id_pers_empl_pers] ON [dbo].[personas] (
	[empl_pers] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[id_pers_func_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [id_pers_func_pers] ON [dbo].[personas] (
	[func_pers] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[id_pers_pers_sele].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [id_pers_pers_sele] ON [dbo].[personas] (
	[pers_sele] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[id_pers_prov_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [id_pers_prov_pers] ON [dbo].[personas] (
	[prov_pers] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[if_pers_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [if_pers_1] ON [dbo].[personas] (
	[codi_pers1] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[if_pers_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [if_pers_2] ON [dbo].[personas] (
	[codi_ramo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[if_pers_3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [if_pers_3] ON [dbo].[personas] (
	[codi_pais] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[personas].[pers_rutt_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[personas] ADD CONSTRAINT [pers_rutt_uk] UNIQUE NONCLUSTERED (
	[rutt_pers] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[qse_docu_serv].[qse_docu_serv_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [qse_docu_serv_idx] ON [dbo].[qse_docu_serv] (
	[ESTA_PROC] ASC,
	[CODI_SERV] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[qse_docu_serv].[QSE_DOCU_SERV_LIMPIA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [QSE_DOCU_SERV_LIMPIA] ON [dbo].[qse_docu_serv] (
	[ESTA_PROC] ASC,
	[TIME_PROC] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[se_pipe].[se_pipe_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [se_pipe_idx1] ON [dbo].[se_pipe] (
	[pipe_stat] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alar].[alar_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_alar] ADD CONSTRAINT [alar_uk] UNIQUE NONCLUSTERED (
	[desc_alar] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alin].[alin_ak].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [alin_ak] ON [dbo].[sys_alin] (
	[codi_alar] ASC,
	[codi_usua] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_alus].[alus_ak].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [alus_ak] ON [dbo].[sys_alus] (
	[codi_usua] ASC,
	[orig_alus] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_attribute].[ia_sys_attribute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_sys_attribute] ON [dbo].[sys_attribute] (
	[attr_order] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_attribute].[if_sys_attribute1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [if_sys_attribute1] ON [dbo].[sys_attribute] (
	[cond_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_connection].[sys_connection_fein].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sys_connection_fein] ON [dbo].[sys_connection] (
	[fein_conn] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_connection].[sys_connection_sess].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sys_connection_sess] ON [dbo].[sys_connection] (
	[corr_sess] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_defp].[defp_fk_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [defp_fk_object] ON [dbo].[sys_defp] (
	[object_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_defp].[defp_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_defp] ADD CONSTRAINT [defp_uk] UNIQUE NONCLUSTERED (
	[corr_fupr] ASC,
	[object_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_fupr].[fupr_ak].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [fupr_ak] ON [dbo].[sys_fupr] (
	[object_rela] ASC,
	[corr_fupr] ASC,
	[codi_usua] ASC,
	[esta_fupr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_fupr].[fupr_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sys_fupr] ADD CONSTRAINT [fupr_uk] UNIQUE NONCLUSTERED (
	[codi_peri] ASC,
	[object_rela] ASC,
	[codi_rous] ASC,
	[codi_usua] ASC,
	[val1] ASC,
	[val2] ASC,
	[val3] ASC,
	[val4] ASC,
	[val5] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_furo].[furo_brief].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [furo_brief] ON [dbo].[sys_furo] (
	[object_brief] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_furo].[furo_code].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [furo_code] ON [dbo].[sys_furo] (
	[object_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_furo].[furo_fk_modu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [furo_fk_modu] ON [dbo].[sys_furo] (
	[codi_modu] ASC,
	[object_orun] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_furo].[furo_fk_romo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [furo_fk_romo] ON [dbo].[sys_furo] (
	[codi_rous] ASC,
	[codi_modu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_furo].[furo_rela].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [furo_rela] ON [dbo].[sys_furo] (
	[object_rela] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_furo].[furo_table].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [furo_table] ON [dbo].[sys_furo] (
	[table_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_furo].[furo_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [furo_type] ON [dbo].[sys_furo] (
	[object_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_furo].[ip_furo_desc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ip_furo_desc] ON [dbo].[sys_furo] (
	[object_desc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_key].[ia_sys_key].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_sys_key] ON [dbo].[sys_key] (
	[table_name] ASC,
	[type_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_key].[id_sys_key7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [id_sys_key7] ON [dbo].[sys_key] (
	[gen_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_key_attr].[ia_sys_key_attr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_sys_key_attr] ON [dbo].[sys_key_attr] (
	[attr_order] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_mess_cult].[sys_mess_cult_modu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sys_mess_cult_modu] ON [dbo].[sys_mess_cult] (
	[codi_cult] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_message].[sys_message_modu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sys_message_modu] ON [dbo].[sys_message] (
	[codi_modu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_obac].[sys_obac_ak].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sys_obac_ak] ON [dbo].[sys_obac] (
	[object_name] ASC,
	[codi_acti] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_object].[ia_object_code].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_object_code] ON [dbo].[sys_object] (
	[object_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_object].[ia_sys_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_sys_object] ON [dbo].[sys_object] (
	[object_brief] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_object].[id_sys_object2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [id_sys_object2] ON [dbo].[sys_object] (
	[object_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_object].[if_sys_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [if_sys_object] ON [dbo].[sys_object] (
	[table_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_object].[obje_desc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [obje_desc] ON [dbo].[sys_object] (
	[object_desc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_object].[obje_fk_modu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [obje_fk_modu] ON [dbo].[sys_object] (
	[codi_modu] ASC,
	[object_orun] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_object].[obje_rela].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [obje_rela] ON [dbo].[sys_object] (
	[object_rela] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_relation].[ia_rel_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_rel_1] ON [dbo].[sys_relation] (
	[target_object] ASC,
	[relation_type] ASC,
	[target_type] ASC,
	[number_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_relation].[ir_relation].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ir_relation] ON [dbo].[sys_relation] (
	[relation_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_relation].[is_sys_relation].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [is_sys_relation] ON [dbo].[sys_relation] (
	[source_object] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_relation].[it_sys_relation].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [it_sys_relation] ON [dbo].[sys_relation] (
	[relation_type] ASC,
	[target_object] ASC,
	[target_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_relation].[rela_targ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [rela_targ] ON [dbo].[sys_relation] (
	[target_type] ASC,
	[target_object] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_session].[sys_session_fein].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sys_session_fein] ON [dbo].[sys_session] (
	[fein_sess] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_session].[sys_session_usua].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sys_session_usua] ON [dbo].[sys_session] (
	[codi_usua] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_usfa].[usfa_fk_orun].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usfa_fk_orun] ON [dbo].[sys_usfa] (
	[codi_usua] ASC,
	[object_orun] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_usro].[ia_usro_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_usro_1] ON [dbo].[sys_usro] (
	[codi_rous] ASC,
	[codi_modu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sys_usro].[usro_fk_modu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usro_fk_modu] ON [dbo].[sys_usro] (
	[codi_modu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usua_empr].[if_usem_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [if_usem_1] ON [dbo].[usua_empr] (
	[codi_empr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usua_empr].[if_usem_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [if_usem_2] ON [dbo].[usua_empr] (
	[codi_usua] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usua_exte].[usex_uk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usua_exte] ADD CONSTRAINT [usex_uk] UNIQUE NONCLUSTERED (
	[nomb_usex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usua_sist].[ia_usua_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ia_usua_2] ON [dbo].[usua_sist] (
	[nomb_usua] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usua_sist].[if_usua_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [if_usua_1] ON [dbo].[usua_sist] (
	[codi_impr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usua_sist].[if_usua_3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [if_usua_3] ON [dbo].[usua_sist] (
	[codi_rous] ASC
) ON [PRIMARY]
