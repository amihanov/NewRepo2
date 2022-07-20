
GO
--SqlScripter----[dbo].[bel_asig_foli].[beasfo_fk_rafo].sql
GO
ALTER TABLE [dbo].[bel_asig_foli] WITH NOCHECK ADD CONSTRAINT [beasfo_fk_rafo] FOREIGN KEY ([CORR_RAFO])
REFERENCES [dbo].[dte_rang_foli] ([corr_rafo])
GO
ALTER TABLE [dbo].[bel_asig_foli] WITH CHECK CHECK CONSTRAINT [beasfo_fk_rafo]
GO
--SqlScripter----[dbo].[bel_asig_foli].[beasfo_fk_unid].sql
GO
ALTER TABLE [dbo].[bel_asig_foli] WITH NOCHECK ADD CONSTRAINT [beasfo_fk_unid] FOREIGN KEY ([CODI_UNID], [CODI_EMPR], [CODI_CECO], [TIPO_ORIG])
REFERENCES [dbo].[bel_unid_cont] ([CODI_UNID], [CODI_EMPR], [CODI_CECO], [TIPO_ORIG])
GO
ALTER TABLE [dbo].[bel_asig_foli] WITH CHECK CHECK CONSTRAINT [beasfo_fk_unid]
GO
--SqlScripter----[dbo].[bel_cons_cara].[becoca_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_cons_cara] WITH NOCHECK ADD CONSTRAINT [becoca_fk_empr] FOREIGN KEY ([CODI_EMPR])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[bel_cons_cara] WITH CHECK CHECK CONSTRAINT [becoca_fk_empr]
GO
--SqlScripter----[dbo].[bel_cons_cara].[becoca_fk_envi].sql
GO
ALTER TABLE [dbo].[bel_cons_cara] WITH NOCHECK ADD CONSTRAINT [becoca_fk_envi] FOREIGN KEY ([ESTA_ENVI])
REFERENCES [dbo].[dte_esta_envi] ([esta_envi])
GO
ALTER TABLE [dbo].[bel_cons_cara] WITH CHECK CHECK CONSTRAINT [becoca_fk_envi]
GO
--SqlScripter----[dbo].[bel_cons_rang].[becora_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_cons_rang] WITH NOCHECK ADD CONSTRAINT [becora_fk_empr] FOREIGN KEY ([CODI_EMPR], [CORR_CONS], [TIPO_DOCU])
REFERENCES [dbo].[bel_cons_resu] ([CODI_EMPR], [CORR_CONS], [TIPO_DOCU])
GO
ALTER TABLE [dbo].[bel_cons_rang] WITH CHECK CHECK CONSTRAINT [becora_fk_empr]
GO
--SqlScripter----[dbo].[bel_cons_resu].[becore_fk_docu].sql
GO
ALTER TABLE [dbo].[bel_cons_resu] WITH NOCHECK ADD CONSTRAINT [becore_fk_docu] FOREIGN KEY ([TIPO_DOCU])
REFERENCES [dbo].[dte_tipo_docu] ([tipo_docu])
GO
ALTER TABLE [dbo].[bel_cons_resu] WITH CHECK CHECK CONSTRAINT [becore_fk_docu]
GO
--SqlScripter----[dbo].[bel_cons_resu].[becore_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_cons_resu] WITH NOCHECK ADD CONSTRAINT [becore_fk_empr] FOREIGN KEY ([CODI_EMPR], [CORR_CONS])
REFERENCES [dbo].[bel_cons_cara] ([CODI_EMPR], [CORR_CONS])
GO
ALTER TABLE [dbo].[bel_cons_resu] WITH CHECK CHECK CONSTRAINT [becore_fk_empr]
GO
--SqlScripter----[dbo].[bel_dato_refe].[bedare_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_dato_refe] WITH NOCHECK ADD CONSTRAINT [bedare_fk_empr] FOREIGN KEY ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
REFERENCES [dbo].[bel_enca_docu] ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
GO
ALTER TABLE [dbo].[bel_dato_refe] WITH CHECK CHECK CONSTRAINT [bedare_fk_empr]
GO
--SqlScripter----[dbo].[bel_desc_reca].[bedere_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_desc_reca] WITH NOCHECK ADD CONSTRAINT [bedere_fk_empr] FOREIGN KEY ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
REFERENCES [dbo].[bel_enca_docu] ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
GO
ALTER TABLE [dbo].[bel_desc_reca] WITH CHECK CHECK CONSTRAINT [bedere_fk_empr]
GO
--SqlScripter----[dbo].[bel_deta_codi].[bedeco_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_deta_codi] WITH NOCHECK ADD CONSTRAINT [bedeco_fk_empr] FOREIGN KEY ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU], [NUME_LINE])
REFERENCES [dbo].[bel_deta_prse] ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU], [NUME_LINE])
GO
ALTER TABLE [dbo].[bel_deta_codi] WITH CHECK CHECK CONSTRAINT [bedeco_fk_empr]
GO
--SqlScripter----[dbo].[bel_deta_prse].[bedepr_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_deta_prse] WITH NOCHECK ADD CONSTRAINT [bedepr_fk_empr] FOREIGN KEY ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
REFERENCES [dbo].[bel_enca_docu] ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
GO
ALTER TABLE [dbo].[bel_deta_prse] WITH CHECK CHECK CONSTRAINT [bedepr_fk_empr]
GO
--SqlScripter----[dbo].[bel_deta_subt].[bedesu_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_deta_subt] WITH NOCHECK ADD CONSTRAINT [bedesu_fk_empr] FOREIGN KEY ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU], [NUME_LINE])
REFERENCES [dbo].[bel_subt_info] ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU], [NUME_LINE])
GO
ALTER TABLE [dbo].[bel_deta_subt] WITH CHECK CHECK CONSTRAINT [bedesu_fk_empr]
GO
--SqlScripter----[dbo].[bel_enca_docu].[beendo_fk_docu].sql
GO
ALTER TABLE [dbo].[bel_enca_docu] WITH NOCHECK ADD CONSTRAINT [beendo_fk_docu] FOREIGN KEY ([TIPO_DOCU])
REFERENCES [dbo].[dte_tipo_docu] ([tipo_docu])
GO
ALTER TABLE [dbo].[bel_enca_docu] WITH CHECK CHECK CONSTRAINT [beendo_fk_docu]
GO
--SqlScripter----[dbo].[bel_enca_docu].[beendo_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_enca_docu] WITH NOCHECK ADD CONSTRAINT [beendo_fk_empr] FOREIGN KEY ([CODI_EMPR])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[bel_enca_docu] WITH CHECK CHECK CONSTRAINT [beendo_fk_empr]
GO
--SqlScripter----[dbo].[bel_enca_docu].[beendo_fk_envi].sql
GO
ALTER TABLE [dbo].[bel_enca_docu] WITH NOCHECK ADD CONSTRAINT [beendo_fk_envi] FOREIGN KEY ([CORR_ENVI])
REFERENCES [dbo].[bel_envi_docu] ([CORR_ENVI])
GO
ALTER TABLE [dbo].[bel_enca_docu] WITH CHECK CHECK CONSTRAINT [beendo_fk_envi]
GO
--SqlScripter----[dbo].[bel_enca_docu].[beendo_fk_rafo].sql
GO
ALTER TABLE [dbo].[bel_enca_docu] WITH NOCHECK ADD CONSTRAINT [beendo_fk_rafo] FOREIGN KEY ([CORR_RAFO])
REFERENCES [dbo].[dte_rang_foli] ([corr_rafo])
GO
ALTER TABLE [dbo].[bel_enca_docu] WITH CHECK CHECK CONSTRAINT [beendo_fk_rafo]
GO
--SqlScripter----[dbo].[bel_envi_docu].[beenvdo_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_envi_docu] WITH NOCHECK ADD CONSTRAINT [beenvdo_fk_empr] FOREIGN KEY ([CODI_EMPR])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[bel_envi_docu] WITH CHECK CHECK CONSTRAINT [beenvdo_fk_empr]
GO
--SqlScripter----[dbo].[bel_foli_anul].[befoan_fk_docu].sql
GO
ALTER TABLE [dbo].[bel_foli_anul] WITH NOCHECK ADD CONSTRAINT [befoan_fk_docu] FOREIGN KEY ([TIPO_DOCU])
REFERENCES [dbo].[dte_tipo_docu] ([tipo_docu])
GO
ALTER TABLE [dbo].[bel_foli_anul] WITH CHECK CHECK CONSTRAINT [befoan_fk_docu]
GO
--SqlScripter----[dbo].[bel_foli_anul].[befoan_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_foli_anul] WITH NOCHECK ADD CONSTRAINT [befoan_fk_empr] FOREIGN KEY ([CODI_EMPR])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[bel_foli_anul] WITH CHECK CHECK CONSTRAINT [befoan_fk_empr]
GO
--SqlScripter----[dbo].[bel_info_tick].[beinti_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_info_tick] WITH NOCHECK ADD CONSTRAINT [beinti_fk_empr] FOREIGN KEY ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
REFERENCES [dbo].[bel_enca_docu] ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
GO
ALTER TABLE [dbo].[bel_info_tick] WITH CHECK CHECK CONSTRAINT [beinti_fk_empr]
GO
--SqlScripter----[dbo].[bel_subt_info].[besuin_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_subt_info] WITH NOCHECK ADD CONSTRAINT [besuin_fk_empr] FOREIGN KEY ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
REFERENCES [dbo].[bel_enca_docu] ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
GO
ALTER TABLE [dbo].[bel_subt_info] WITH CHECK CHECK CONSTRAINT [besuin_fk_empr]
GO
--SqlScripter----[dbo].[bel_tido_envi].[betien_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_tido_envi] WITH NOCHECK ADD CONSTRAINT [betien_fk_empr] FOREIGN KEY ([CODI_EMPR])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[bel_tido_envi] WITH CHECK CHECK CONSTRAINT [betien_fk_empr]
GO
--SqlScripter----[dbo].[bel_tido_envi].[betien_fk_envi].sql
GO
ALTER TABLE [dbo].[bel_tido_envi] WITH NOCHECK ADD CONSTRAINT [betien_fk_envi] FOREIGN KEY ([CORR_ENVI])
REFERENCES [dbo].[bel_envi_docu] ([CORR_ENVI])
GO
ALTER TABLE [dbo].[bel_tido_envi] WITH CHECK CHECK CONSTRAINT [betien_fk_envi]
GO
--SqlScripter----[dbo].[bel_unid_cont].[beunco_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_unid_cont] WITH NOCHECK ADD CONSTRAINT [beunco_fk_empr] FOREIGN KEY ([CODI_EMPR], [CODI_CECO])
REFERENCES [dbo].[cent_cost] ([codi_empr], [codi_ceco])
GO
ALTER TABLE [dbo].[bel_unid_cont] WITH CHECK CHECK CONSTRAINT [beunco_fk_empr]
GO
--SqlScripter----[dbo].[bel_xml].[bexm_fk_empr].sql
GO
ALTER TABLE [dbo].[bel_xml] WITH NOCHECK ADD CONSTRAINT [bexm_fk_empr] FOREIGN KEY ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
REFERENCES [dbo].[bel_enca_docu] ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bel_xml] WITH CHECK CHECK CONSTRAINT [bexm_fk_empr]
GO
--SqlScripter----[dbo].[CARA_PEEM].[CPEM_FK_EMPR_1].sql
GO
ALTER TABLE [dbo].[CARA_PEEM] WITH NOCHECK ADD CONSTRAINT [CPEM_FK_EMPR_1] FOREIGN KEY ([CODI_EMPR])
REFERENCES [dbo].[empr] ([codi_empr])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CARA_PEEM] WITH CHECK CHECK CONSTRAINT [CPEM_FK_EMPR_1]
GO
--SqlScripter----[dbo].[CARA_PEEM].[CPEM_FK_PERS_1].sql
GO
ALTER TABLE [dbo].[CARA_PEEM] WITH NOCHECK ADD CONSTRAINT [CPEM_FK_PERS_1] FOREIGN KEY ([CODI_PERS])
REFERENCES [dbo].[personas] ([codi_pers])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CARA_PEEM] WITH CHECK CHECK CONSTRAINT [CPEM_FK_PERS_1]
GO
--SqlScripter----[dbo].[CARA_PEEM].[CPEM_FK_VACG_1].sql
GO
ALTER TABLE [dbo].[CARA_PEEM] WITH NOCHECK ADD CONSTRAINT [CPEM_FK_VACG_1] FOREIGN KEY ([CODI_CAGE], [CODI_VACG])
REFERENCES [dbo].[valo_cage] ([codi_cage], [codi_vacg])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CARA_PEEM] WITH CHECK CHECK CONSTRAINT [CPEM_FK_VACG_1]
GO
--SqlScripter----[dbo].[cara_pers].[cape_fk_pers_1].sql
GO
ALTER TABLE [dbo].[cara_pers] WITH NOCHECK ADD CONSTRAINT [cape_fk_pers_1] FOREIGN KEY ([codi_pers])
REFERENCES [dbo].[personas] ([codi_pers])
GO
ALTER TABLE [dbo].[cara_pers] WITH CHECK CHECK CONSTRAINT [cape_fk_pers_1]
GO
--SqlScripter----[dbo].[cent_cost].[ceco_fk_empr].sql
GO
ALTER TABLE [dbo].[cent_cost] WITH NOCHECK ADD CONSTRAINT [ceco_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[cent_cost] WITH CHECK CHECK CONSTRAINT [ceco_fk_empr]
GO
--SqlScripter----[dbo].[cent_cost].[ceco_fk_pers].sql
GO
ALTER TABLE [dbo].[cent_cost] WITH NOCHECK ADD CONSTRAINT [ceco_fk_pers] FOREIGN KEY ([codi_pers])
REFERENCES [dbo].[personas] ([codi_pers])
GO
ALTER TABLE [dbo].[cent_cost] WITH CHECK CHECK CONSTRAINT [ceco_fk_pers]
GO
--SqlScripter----[dbo].[dbn_list_boto].[FK_DBNLISTBOTO_DBNLISTREPO].sql
GO
ALTER TABLE [dbo].[dbn_list_boto] WITH NOCHECK ADD CONSTRAINT [FK_DBNLISTBOTO_DBNLISTREPO] FOREIGN KEY ([CODI_REPO])
REFERENCES [dbo].[dbn_list_repo] ([CODI_REPO])
GO
ALTER TABLE [dbo].[dbn_list_boto] WITH CHECK CHECK CONSTRAINT [FK_DBNLISTBOTO_DBNLISTREPO]
GO
--SqlScripter----[dbo].[dbn_list_colu].[FK_DBNLISTCOLU_DBNLISTCOLU].sql
GO
ALTER TABLE [dbo].[dbn_list_colu] WITH NOCHECK ADD CONSTRAINT [FK_DBNLISTCOLU_DBNLISTCOLU] FOREIGN KEY ([CODI_REPO])
REFERENCES [dbo].[dbn_list_repo] ([CODI_REPO])
GO
ALTER TABLE [dbo].[dbn_list_colu] WITH CHECK CHECK CONSTRAINT [FK_DBNLISTCOLU_DBNLISTCOLU]
GO
--SqlScripter----[dbo].[DBN_MONI_PROC].[DBN_MONI_PROC_DBN_SERV_SRVD].sql
GO
ALTER TABLE [dbo].[DBN_MONI_PROC] WITH NOCHECK ADD CONSTRAINT [DBN_MONI_PROC_DBN_SERV_SRVD] FOREIGN KEY ([SERV_SERV], [CODI_SERV])
REFERENCES [dbo].[DBN_SERV_SRVD] ([SERV_SERV], [CODI_SERV])
GO
ALTER TABLE [dbo].[DBN_MONI_PROC] WITH CHECK CHECK CONSTRAINT [DBN_MONI_PROC_DBN_SERV_SRVD]
GO
--SqlScripter----[dbo].[DBN_PROC_SERV].[DBN_PROC_SERV_DBN_SERVICIO].sql
GO
ALTER TABLE [dbo].[DBN_PROC_SERV] WITH NOCHECK ADD CONSTRAINT [DBN_PROC_SERV_DBN_SERVICIO] FOREIGN KEY ([CODI_SERV])
REFERENCES [dbo].[DBN_SERVICIO] ([CODI_SERV])
GO
ALTER TABLE [dbo].[DBN_PROC_SERV] WITH CHECK CHECK CONSTRAINT [DBN_PROC_SERV_DBN_SERVICIO]
GO
--SqlScripter----[dbo].[DBN_PROC_SERV].[DBN_PROC_SERV_PROCESO].sql
GO
ALTER TABLE [dbo].[DBN_PROC_SERV] WITH NOCHECK ADD CONSTRAINT [DBN_PROC_SERV_PROCESO] FOREIGN KEY ([CODI_PROC])
REFERENCES [dbo].[DBN_PROCESOS] ([CODI_PROC])
GO
ALTER TABLE [dbo].[DBN_PROC_SERV] WITH CHECK CHECK CONSTRAINT [DBN_PROC_SERV_PROCESO]
GO
--SqlScripter----[dbo].[dbn_repo_rous].[FK_DBNREPOCOLU].sql
GO
ALTER TABLE [dbo].[dbn_repo_rous] WITH NOCHECK ADD CONSTRAINT [FK_DBNREPOCOLU] FOREIGN KEY ([CODI_REPO])
REFERENCES [dbo].[dbn_list_repo] ([CODI_REPO])
GO
ALTER TABLE [dbo].[dbn_repo_rous] WITH CHECK CHECK CONSTRAINT [FK_DBNREPOCOLU]
GO
--SqlScripter----[dbo].[DBN_SERV_SRVD].[DBN_SERV_SRVD_DBN_SERVICIO].sql
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] WITH NOCHECK ADD CONSTRAINT [DBN_SERV_SRVD_DBN_SERVICIO] FOREIGN KEY ([CODI_SERV])
REFERENCES [dbo].[DBN_SERVICIO] ([CODI_SERV])
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] WITH CHECK CHECK CONSTRAINT [DBN_SERV_SRVD_DBN_SERVICIO]
GO
--SqlScripter----[dbo].[DBN_SERV_SRVD].[DBN_SERV_SRVD_DBN_SERVIDOR].sql
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] WITH NOCHECK ADD CONSTRAINT [DBN_SERV_SRVD_DBN_SERVIDOR] FOREIGN KEY ([SERV_SERV])
REFERENCES [dbo].[DBN_SERVIDOR] ([SERV_SERV])
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] WITH CHECK CHECK CONSTRAINT [DBN_SERV_SRVD_DBN_SERVIDOR]
GO
--SqlScripter----[dbo].[DBN_SESR_RANG_OPER].[DBN_RANG_OPER_DBN_SERV_SRVD].sql
GO
ALTER TABLE [dbo].[DBN_SESR_RANG_OPER] WITH NOCHECK ADD CONSTRAINT [DBN_RANG_OPER_DBN_SERV_SRVD] FOREIGN KEY ([CODI_SRVD], [CODI_SERV])
REFERENCES [dbo].[DBN_SERV_SRVD] ([SERV_SERV], [CODI_SERV])
GO
ALTER TABLE [dbo].[DBN_SESR_RANG_OPER] WITH CHECK CHECK CONSTRAINT [DBN_RANG_OPER_DBN_SERV_SRVD]
GO
--SqlScripter----[dbo].[DTE_ACCI_DOCU].[DTE_ACCI_DOCU_FK_ENCA_DOCU].sql
GO
ALTER TABLE [dbo].[DTE_ACCI_DOCU] WITH NOCHECK ADD CONSTRAINT [DTE_ACCI_DOCU_FK_ENCA_DOCU] FOREIGN KEY ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
REFERENCES [dbo].[dte_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[DTE_ACCI_DOCU] WITH CHECK CHECK CONSTRAINT [DTE_ACCI_DOCU_FK_ENCA_DOCU]
GO
--SqlScripter----[dbo].[dte_acec_empr].[dte_aemp_fk_acti].sql
GO
ALTER TABLE [dbo].[dte_acec_empr] WITH NOCHECK ADD CONSTRAINT [dte_aemp_fk_acti] FOREIGN KEY ([codi_acec])
REFERENCES [dbo].[dte_acti_econ] ([codi_acec])
GO
ALTER TABLE [dbo].[dte_acec_empr] WITH CHECK CHECK CONSTRAINT [dte_aemp_fk_acti]
GO
--SqlScripter----[dbo].[dte_acec_empr].[dte_aemp_fk_empr].sql
GO
ALTER TABLE [dbo].[dte_acec_empr] WITH NOCHECK ADD CONSTRAINT [dte_aemp_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dte_acec_empr] WITH CHECK CHECK CONSTRAINT [dte_aemp_fk_empr]
GO
--SqlScripter----[dbo].[DTE_ARCH_ADJU].[DTE_ARCH_ADJU_FK_DTE_ENCA_DOCU].sql
GO
ALTER TABLE [dbo].[DTE_ARCH_ADJU] WITH NOCHECK ADD CONSTRAINT [DTE_ARCH_ADJU_FK_DTE_ENCA_DOCU] FOREIGN KEY ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
REFERENCES [dbo].[dte_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[DTE_ARCH_ADJU] WITH CHECK CHECK CONSTRAINT [DTE_ARCH_ADJU_FK_DTE_ENCA_DOCU]
GO
--SqlScripter----[dbo].[dte_auto_pers].[dte_aupe_fk_pers].sql
GO
ALTER TABLE [dbo].[dte_auto_pers] WITH NOCHECK ADD CONSTRAINT [dte_aupe_fk_pers] FOREIGN KEY ([codi_pers])
REFERENCES [dbo].[personas] ([codi_pers])
GO
ALTER TABLE [dbo].[dte_auto_pers] WITH CHECK CHECK CONSTRAINT [dte_aupe_fk_pers]
GO
--SqlScripter----[dbo].[dte_cert_pers].[cepe_fk_orce].sql
GO
ALTER TABLE [dbo].[dte_cert_pers] WITH NOCHECK ADD CONSTRAINT [cepe_fk_orce] FOREIGN KEY ([codi_orce])
REFERENCES [dbo].[dte_orga_cert] ([codi_orce])
GO
ALTER TABLE [dbo].[dte_cert_pers] WITH CHECK CHECK CONSTRAINT [cepe_fk_orce]
GO
--SqlScripter----[dbo].[dte_cert_pers].[dte_cepe_fk_pers].sql
GO
ALTER TABLE [dbo].[dte_cert_pers] WITH NOCHECK ADD CONSTRAINT [dte_cepe_fk_pers] FOREIGN KEY ([codi_pers])
REFERENCES [dbo].[personas] ([codi_pers])
GO
ALTER TABLE [dbo].[dte_cert_pers] WITH CHECK CHECK CONSTRAINT [dte_cepe_fk_pers]
GO
--SqlScripter----[dbo].[dte_cesi_auto].[fk_dte_cesi_auto].sql
GO
ALTER TABLE [dbo].[dte_cesi_auto] WITH NOCHECK ADD CONSTRAINT [fk_dte_cesi_auto] FOREIGN KEY ([codi_empr], [corr_cesi])
REFERENCES [dbo].[dte_cesi_docu] ([codi_empr], [corr_cesi])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dte_cesi_auto] WITH CHECK CHECK CONSTRAINT [fk_dte_cesi_auto]
GO
--SqlScripter----[dbo].[dte_cesi_docu].[fk1_dte_cesi_docu].sql
GO
ALTER TABLE [dbo].[dte_cesi_docu] WITH NOCHECK ADD CONSTRAINT [fk1_dte_cesi_docu] FOREIGN KEY ([tipo_docu])
REFERENCES [dbo].[dte_tipo_docu] ([tipo_docu])
GO
ALTER TABLE [dbo].[dte_cesi_docu] WITH CHECK CHECK CONSTRAINT [fk1_dte_cesi_docu]
GO
--SqlScripter----[dbo].[dte_cesi_docu].[fk2_dte_cesi_docu].sql
GO
ALTER TABLE [dbo].[dte_cesi_docu] WITH NOCHECK ADD CONSTRAINT [fk2_dte_cesi_docu] FOREIGN KEY ([esta_docu])
REFERENCES [dbo].[dte_esta_cesi] ([esta_cesi])
GO
ALTER TABLE [dbo].[dte_cesi_docu] WITH CHECK CHECK CONSTRAINT [fk2_dte_cesi_docu]
GO
--SqlScripter----[dbo].[DTE_COMI_CARG].[FK_DTE_COMI_CARG].sql
GO
ALTER TABLE [dbo].[DTE_COMI_CARG] WITH NOCHECK ADD CONSTRAINT [FK_DTE_COMI_CARG] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[DTE_COMI_CARG] WITH CHECK CHECK CONSTRAINT [FK_DTE_COMI_CARG]
GO
--SqlScripter----[dbo].[dte_conf_orig].[btcoor_fk_docu].sql
GO
ALTER TABLE [dbo].[dte_conf_orig] WITH NOCHECK ADD CONSTRAINT [btcoor_fk_docu] FOREIGN KEY ([TIPO_DOCU])
REFERENCES [dbo].[dte_tipo_docu] ([tipo_docu])
GO
ALTER TABLE [dbo].[dte_conf_orig] WITH CHECK CHECK CONSTRAINT [btcoor_fk_docu]
GO
--SqlScripter----[dbo].[dte_conf_orig].[btcoor_fk_orig].sql
GO
ALTER TABLE [dbo].[dte_conf_orig] WITH NOCHECK ADD CONSTRAINT [btcoor_fk_orig] FOREIGN KEY ([TIPO_ORIG])
REFERENCES [dbo].[dte_tipo_orig] ([TIPO_ORIG])
GO
ALTER TABLE [dbo].[dte_conf_orig] WITH CHECK CHECK CONSTRAINT [btcoor_fk_orig]
GO
--SqlScripter----[dbo].[dte_del_cesion].[fk1_dte_del_cesion].sql
GO
ALTER TABLE [dbo].[dte_del_cesion] WITH NOCHECK ADD CONSTRAINT [fk1_dte_del_cesion] FOREIGN KEY ([tipo_docu])
REFERENCES [dbo].[dte_tipo_docu] ([tipo_docu])
GO
ALTER TABLE [dbo].[dte_del_cesion] WITH CHECK CHECK CONSTRAINT [fk1_dte_del_cesion]
GO
--SqlScripter----[dbo].[dte_del_cesion].[fk2_dte_del_cesion].sql
GO
ALTER TABLE [dbo].[dte_del_cesion] WITH NOCHECK ADD CONSTRAINT [fk2_dte_del_cesion] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dte_del_cesion] WITH CHECK CHECK CONSTRAINT [fk2_dte_del_cesion]
GO
--SqlScripter----[dbo].[dte_desc_item].[dte_deit_fk_dtpr].sql
GO
ALTER TABLE [dbo].[dte_desc_item] WITH NOCHECK ADD CONSTRAINT [dte_deit_fk_dtpr] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dte_deta_prse] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dte_desc_item] WITH CHECK CHECK CONSTRAINT [dte_deit_fk_dtpr]
GO
--SqlScripter----[dbo].[dte_desc_item_h].[DTE_DEIT_H_FK_DTPR].sql
GO
ALTER TABLE [dbo].[dte_desc_item_h] WITH NOCHECK ADD CONSTRAINT [DTE_DEIT_H_FK_DTPR] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dte_deta_prse_h] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dte_desc_item_h] WITH CHECK CHECK CONSTRAINT [DTE_DEIT_H_FK_DTPR]
GO
--SqlScripter----[dbo].[dte_desc_item_p].[dte_deit_fk_dtpr_p].sql
GO
ALTER TABLE [dbo].[dte_desc_item_p] WITH NOCHECK ADD CONSTRAINT [dte_deit_fk_dtpr_p] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dte_deta_prse_p] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dte_desc_item_p] WITH CHECK CHECK CONSTRAINT [dte_deit_fk_dtpr_p]
GO
--SqlScripter----[dbo].[dte_desc_reca].[dte_dere_fk_endo].sql
GO
ALTER TABLE [dbo].[dte_desc_reca] WITH NOCHECK ADD CONSTRAINT [dte_dere_fk_endo] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dte_desc_reca] WITH CHECK CHECK CONSTRAINT [dte_dere_fk_endo]
GO
--SqlScripter----[dbo].[dte_desc_reca_h].[DTE_DERE_H_FK_ENDO].sql
GO
ALTER TABLE [dbo].[dte_desc_reca_h] WITH NOCHECK ADD CONSTRAINT [DTE_DERE_H_FK_ENDO] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu_h] ([codi_empr], [tipo_docu], [foli_docu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dte_desc_reca_h] WITH CHECK CHECK CONSTRAINT [DTE_DERE_H_FK_ENDO]
GO
--SqlScripter----[dbo].[dte_desc_reca_p].[dte_dere_fk_endo_p].sql
GO
ALTER TABLE [dbo].[dte_desc_reca_p] WITH NOCHECK ADD CONSTRAINT [dte_dere_fk_endo_p] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu_p] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dte_desc_reca_p] WITH CHECK CHECK CONSTRAINT [dte_dere_fk_endo_p]
GO
--SqlScripter----[dbo].[dte_deta_acec].[dte_acec_fk_aemp].sql
GO
ALTER TABLE [dbo].[dte_deta_acec] WITH NOCHECK ADD CONSTRAINT [dte_acec_fk_aemp] FOREIGN KEY ([codi_empr], [codi_acec])
REFERENCES [dbo].[dte_acec_empr] ([codi_empr], [codi_acec])
GO
ALTER TABLE [dbo].[dte_deta_acec] WITH CHECK CHECK CONSTRAINT [dte_acec_fk_aemp]
GO
--SqlScripter----[dbo].[dte_deta_acec].[dte_deac_fk_endo].sql
GO
ALTER TABLE [dbo].[dte_deta_acec] WITH NOCHECK ADD CONSTRAINT [dte_deac_fk_endo] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dte_deta_acec] WITH CHECK CHECK CONSTRAINT [dte_deac_fk_endo]
GO
--SqlScripter----[dbo].[dte_deta_acec_h].[DTE_ACEC_H_FK_AEMP].sql
GO
ALTER TABLE [dbo].[dte_deta_acec_h] WITH NOCHECK ADD CONSTRAINT [DTE_ACEC_H_FK_AEMP] FOREIGN KEY ([codi_empr], [codi_acec])
REFERENCES [dbo].[dte_acec_empr] ([codi_empr], [codi_acec])
GO
ALTER TABLE [dbo].[dte_deta_acec_h] WITH CHECK CHECK CONSTRAINT [DTE_ACEC_H_FK_AEMP]
GO
--SqlScripter----[dbo].[dte_deta_acec_h].[DTE_DEAC_H_FK_ENDO].sql
GO
ALTER TABLE [dbo].[dte_deta_acec_h] WITH NOCHECK ADD CONSTRAINT [DTE_DEAC_H_FK_ENDO] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu_h] ([codi_empr], [tipo_docu], [foli_docu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dte_deta_acec_h] WITH CHECK CHECK CONSTRAINT [DTE_DEAC_H_FK_ENDO]
GO
--SqlScripter----[dbo].[dte_deta_acec_p].[dte_deac_fk_endo_p].sql
GO
ALTER TABLE [dbo].[dte_deta_acec_p] WITH NOCHECK ADD CONSTRAINT [dte_deac_fk_endo_p] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu_p] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dte_deta_acec_p] WITH CHECK CHECK CONSTRAINT [dte_deac_fk_endo_p]
GO
--SqlScripter----[dbo].[dte_deta_codi].[dte_deco_fk_deps].sql
GO
ALTER TABLE [dbo].[dte_deta_codi] WITH NOCHECK ADD CONSTRAINT [dte_deco_fk_deps] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dte_deta_prse] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dte_deta_codi] WITH CHECK CHECK CONSTRAINT [dte_deco_fk_deps]
GO
--SqlScripter----[dbo].[dte_deta_codi_h].[DTE_DECO_H_FK_DEPS].sql
GO
ALTER TABLE [dbo].[dte_deta_codi_h] WITH NOCHECK ADD CONSTRAINT [DTE_DECO_H_FK_DEPS] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dte_deta_prse_h] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dte_deta_codi_h] WITH CHECK CHECK CONSTRAINT [DTE_DECO_H_FK_DEPS]
GO
--SqlScripter----[dbo].[dte_deta_codi_p].[dte_deco_fk_deps_p].sql
GO
ALTER TABLE [dbo].[dte_deta_codi_p] WITH NOCHECK ADD CONSTRAINT [dte_deco_fk_deps_p] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dte_deta_prse_p] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dte_deta_codi_p] WITH CHECK CHECK CONSTRAINT [dte_deco_fk_deps_p]
GO
--SqlScripter----[dbo].[dte_deta_prse].[dte_deps_fk_endo].sql
GO
ALTER TABLE [dbo].[dte_deta_prse] WITH NOCHECK ADD CONSTRAINT [dte_deps_fk_endo] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dte_deta_prse] WITH CHECK CHECK CONSTRAINT [dte_deps_fk_endo]
GO
--SqlScripter----[dbo].[dte_deta_prse].[dte_deps_fk_tiim].sql
GO
ALTER TABLE [dbo].[dte_deta_prse] WITH NOCHECK ADD CONSTRAINT [dte_deps_fk_tiim] FOREIGN KEY ([codi_impu])
REFERENCES [dbo].[dte_tipo_impu] ([codi_impu])
GO
ALTER TABLE [dbo].[dte_deta_prse] NOCHECK CONSTRAINT [dte_deps_fk_tiim]
GO
--SqlScripter----[dbo].[dte_deta_prse_h].[DTE_DEPS_H_FK_ENDO].sql
GO
ALTER TABLE [dbo].[dte_deta_prse_h] WITH NOCHECK ADD CONSTRAINT [DTE_DEPS_H_FK_ENDO] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu_h] ([codi_empr], [tipo_docu], [foli_docu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dte_deta_prse_h] WITH CHECK CHECK CONSTRAINT [DTE_DEPS_H_FK_ENDO]
GO
--SqlScripter----[dbo].[dte_deta_prse_h].[DTE_DEPS_H_FK_TIIM].sql
GO
ALTER TABLE [dbo].[dte_deta_prse_h] WITH NOCHECK ADD CONSTRAINT [DTE_DEPS_H_FK_TIIM] FOREIGN KEY ([codi_impu])
REFERENCES [dbo].[dte_tipo_impu] ([codi_impu])
GO
ALTER TABLE [dbo].[dte_deta_prse_h] NOCHECK CONSTRAINT [DTE_DEPS_H_FK_TIIM]
GO
--SqlScripter----[dbo].[dte_deta_prse_p].[dte_deps_fk_endo_p].sql
GO
ALTER TABLE [dbo].[dte_deta_prse_p] WITH NOCHECK ADD CONSTRAINT [dte_deps_fk_endo_p] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu_p] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dte_deta_prse_p] WITH CHECK CHECK CONSTRAINT [dte_deps_fk_endo_p]
GO
--SqlScripter----[dbo].[DTE_DOCU_LOB].[dte_docu_lob_fk_empr].sql
GO
ALTER TABLE [dbo].[DTE_DOCU_LOB] WITH NOCHECK ADD CONSTRAINT [dte_docu_lob_fk_empr] FOREIGN KEY ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
REFERENCES [dbo].[dte_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[DTE_DOCU_LOB] WITH CHECK CHECK CONSTRAINT [dte_docu_lob_fk_empr]
GO
--SqlScripter----[dbo].[DTE_DOCU_LOB_H].[DTE_DOCLOBH_FK_ENDO].sql
GO
ALTER TABLE [dbo].[DTE_DOCU_LOB_H] WITH NOCHECK ADD CONSTRAINT [DTE_DOCLOBH_FK_ENDO] FOREIGN KEY ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU])
REFERENCES [dbo].[dte_enca_docu_h] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[DTE_DOCU_LOB_H] WITH CHECK CHECK CONSTRAINT [DTE_DOCLOBH_FK_ENDO]
GO
--SqlScripter----[dbo].[dte_docu_refe].[dte_dore_fk_endo].sql
GO
ALTER TABLE [dbo].[dte_docu_refe] WITH NOCHECK ADD CONSTRAINT [dte_dore_fk_endo] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dte_docu_refe] WITH CHECK CHECK CONSTRAINT [dte_dore_fk_endo]
GO
--SqlScripter----[dbo].[dte_docu_refe_h].[DTE_DORE_H_FK_ENDO].sql
GO
ALTER TABLE [dbo].[dte_docu_refe_h] WITH NOCHECK ADD CONSTRAINT [DTE_DORE_H_FK_ENDO] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu_h] ([codi_empr], [tipo_docu], [foli_docu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dte_docu_refe_h] WITH CHECK CHECK CONSTRAINT [DTE_DORE_H_FK_ENDO]
GO
--SqlScripter----[dbo].[dte_docu_refe_p].[dte_dore_fk_endo_p].sql
GO
ALTER TABLE [dbo].[dte_docu_refe_p] WITH NOCHECK ADD CONSTRAINT [dte_dore_fk_endo_p] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu_p] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dte_docu_refe_p] WITH CHECK CHECK CONSTRAINT [dte_dore_fk_endo_p]
GO
--SqlScripter----[dbo].[dte_enca_docu].[dte_endo_fk_empr].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] WITH NOCHECK ADD CONSTRAINT [dte_endo_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dte_enca_docu] WITH CHECK CHECK CONSTRAINT [dte_endo_fk_empr]
GO
--SqlScripter----[dbo].[dte_enca_docu].[dte_endo_fk_envi].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] WITH NOCHECK ADD CONSTRAINT [dte_endo_fk_envi] FOREIGN KEY ([corr_envi])
REFERENCES [dbo].[dte_envi_docu] ([corr_envi])
GO
ALTER TABLE [dbo].[dte_enca_docu] WITH CHECK CHECK CONSTRAINT [dte_endo_fk_envi]
GO
--SqlScripter----[dbo].[dte_enca_docu].[dte_endo_fk_envi1].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] WITH NOCHECK ADD CONSTRAINT [dte_endo_fk_envi1] FOREIGN KEY ([corr_envi1])
REFERENCES [dbo].[dte_envi_docu] ([corr_envi])
GO
ALTER TABLE [dbo].[dte_enca_docu] WITH CHECK CHECK CONSTRAINT [dte_endo_fk_envi1]
GO
--SqlScripter----[dbo].[dte_enca_docu].[dte_endo_fk_esdo].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] WITH NOCHECK ADD CONSTRAINT [dte_endo_fk_esdo] FOREIGN KEY ([esta_docu])
REFERENCES [dbo].[dte_esta_docu] ([esta_docu])
GO
ALTER TABLE [dbo].[dte_enca_docu] WITH CHECK CHECK CONSTRAINT [dte_endo_fk_esdo]
GO
--SqlScripter----[dbo].[dte_enca_docu].[dte_endo_fk_rafo].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] WITH NOCHECK ADD CONSTRAINT [dte_endo_fk_rafo] FOREIGN KEY ([corr_rafo])
REFERENCES [dbo].[dte_rang_foli] ([corr_rafo])
GO
ALTER TABLE [dbo].[dte_enca_docu] WITH CHECK CHECK CONSTRAINT [dte_endo_fk_rafo]
GO
--SqlScripter----[dbo].[dte_enca_docu].[dte_endo_fk_tido].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] WITH NOCHECK ADD CONSTRAINT [dte_endo_fk_tido] FOREIGN KEY ([tipo_docu])
REFERENCES [dbo].[dte_tipo_docu] ([tipo_docu])
GO
ALTER TABLE [dbo].[dte_enca_docu] WITH CHECK CHECK CONSTRAINT [dte_endo_fk_tido]
GO
--SqlScripter----[dbo].[dte_enca_docu_h].[DTE_ENDO_H_FK_EMPR].sql
GO
ALTER TABLE [dbo].[dte_enca_docu_h] WITH NOCHECK ADD CONSTRAINT [DTE_ENDO_H_FK_EMPR] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dte_enca_docu_h] WITH CHECK CHECK CONSTRAINT [DTE_ENDO_H_FK_EMPR]
GO
--SqlScripter----[dbo].[dte_enca_docu_h].[DTE_ENDO_H_FK_ENVI].sql
GO
ALTER TABLE [dbo].[dte_enca_docu_h] WITH NOCHECK ADD CONSTRAINT [DTE_ENDO_H_FK_ENVI] FOREIGN KEY ([corr_envi1])
REFERENCES [dbo].[dte_envi_docu_h] ([corr_envi])
GO
ALTER TABLE [dbo].[dte_enca_docu_h] WITH CHECK CHECK CONSTRAINT [DTE_ENDO_H_FK_ENVI]
GO
--SqlScripter----[dbo].[dte_enca_docu_h].[DTE_ENDO_H_FK_ENVI1].sql
GO
ALTER TABLE [dbo].[dte_enca_docu_h] WITH NOCHECK ADD CONSTRAINT [DTE_ENDO_H_FK_ENVI1] FOREIGN KEY ([corr_envi1])
REFERENCES [dbo].[dte_envi_docu_h] ([corr_envi])
GO
ALTER TABLE [dbo].[dte_enca_docu_h] WITH CHECK CHECK CONSTRAINT [DTE_ENDO_H_FK_ENVI1]
GO
--SqlScripter----[dbo].[dte_enca_docu_h].[DTE_ENDO_H_FK_ESDO].sql
GO
ALTER TABLE [dbo].[dte_enca_docu_h] WITH NOCHECK ADD CONSTRAINT [DTE_ENDO_H_FK_ESDO] FOREIGN KEY ([esta_docu])
REFERENCES [dbo].[dte_esta_docu] ([esta_docu])
GO
ALTER TABLE [dbo].[dte_enca_docu_h] WITH CHECK CHECK CONSTRAINT [DTE_ENDO_H_FK_ESDO]
GO
--SqlScripter----[dbo].[dte_enca_docu_h].[DTE_ENDO_H_FK_RAFO].sql
GO
ALTER TABLE [dbo].[dte_enca_docu_h] WITH NOCHECK ADD CONSTRAINT [DTE_ENDO_H_FK_RAFO] FOREIGN KEY ([corr_rafo])
REFERENCES [dbo].[dte_rang_foli] ([corr_rafo])
GO
ALTER TABLE [dbo].[dte_enca_docu_h] WITH CHECK CHECK CONSTRAINT [DTE_ENDO_H_FK_RAFO]
GO
--SqlScripter----[dbo].[dte_enca_docu_h].[DTE_ENDO_H_FK_TIDO].sql
GO
ALTER TABLE [dbo].[dte_enca_docu_h] WITH NOCHECK ADD CONSTRAINT [DTE_ENDO_H_FK_TIDO] FOREIGN KEY ([tipo_docu])
REFERENCES [dbo].[dte_tipo_docu] ([tipo_docu])
GO
ALTER TABLE [dbo].[dte_enca_docu_h] WITH CHECK CHECK CONSTRAINT [DTE_ENDO_H_FK_TIDO]
GO
--SqlScripter----[dbo].[dte_envi_docu].[dte_envi_fk_empr].sql
GO
ALTER TABLE [dbo].[dte_envi_docu] WITH NOCHECK ADD CONSTRAINT [dte_envi_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dte_envi_docu] WITH CHECK CHECK CONSTRAINT [dte_envi_fk_empr]
GO
--SqlScripter----[dbo].[dte_envi_docu].[dte_envi_fk_esen].sql
GO
ALTER TABLE [dbo].[dte_envi_docu] WITH NOCHECK ADD CONSTRAINT [dte_envi_fk_esen] FOREIGN KEY ([esta_envi])
REFERENCES [dbo].[dte_esta_envi] ([esta_envi])
GO
ALTER TABLE [dbo].[dte_envi_docu] WITH CHECK CHECK CONSTRAINT [dte_envi_fk_esen]
GO
--SqlScripter----[dbo].[dte_envi_docu_h].[dte_envi_h_fk_empr].sql
GO
ALTER TABLE [dbo].[dte_envi_docu_h] WITH NOCHECK ADD CONSTRAINT [dte_envi_h_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dte_envi_docu_h] WITH CHECK CHECK CONSTRAINT [dte_envi_h_fk_empr]
GO
--SqlScripter----[dbo].[dte_envi_docu_h].[dte_envi_h_fk_esen].sql
GO
ALTER TABLE [dbo].[dte_envi_docu_h] WITH NOCHECK ADD CONSTRAINT [dte_envi_h_fk_esen] FOREIGN KEY ([esta_envi])
REFERENCES [dbo].[dte_esta_envi] ([esta_envi])
GO
ALTER TABLE [dbo].[dte_envi_docu_h] WITH CHECK CHECK CONSTRAINT [dte_envi_h_fk_esen]
GO
--SqlScripter----[dbo].[dte_envi_lob].[dte_envi_lob_fk_empr].sql
GO
ALTER TABLE [dbo].[dte_envi_lob] WITH NOCHECK ADD CONSTRAINT [dte_envi_lob_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dte_envi_lob] WITH CHECK CHECK CONSTRAINT [dte_envi_lob_fk_empr]
GO
--SqlScripter----[dbo].[dte_envi_lob_h].[dte_envi_lob_hfk_empr].sql
GO
ALTER TABLE [dbo].[dte_envi_lob_h] WITH NOCHECK ADD CONSTRAINT [dte_envi_lob_hfk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dte_envi_lob_h] WITH CHECK CHECK CONSTRAINT [dte_envi_lob_hfk_empr]
GO
--SqlScripter----[dbo].[dte_envi_pdf].[fk_endo_enpdf].sql
GO
ALTER TABLE [dbo].[dte_envi_pdf] WITH NOCHECK ADD CONSTRAINT [fk_endo_enpdf] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dte_envi_pdf] WITH CHECK CHECK CONSTRAINT [fk_endo_enpdf]
GO
--SqlScripter----[dbo].[dte_rang_foli].[dte_rafo_fk_ceco].sql
GO
ALTER TABLE [dbo].[dte_rang_foli] WITH NOCHECK ADD CONSTRAINT [dte_rafo_fk_ceco] FOREIGN KEY ([codi_empr], [codi_ceco])
REFERENCES [dbo].[cent_cost] ([codi_empr], [codi_ceco])
GO
ALTER TABLE [dbo].[dte_rang_foli] WITH CHECK CHECK CONSTRAINT [dte_rafo_fk_ceco]
GO
--SqlScripter----[dbo].[dte_rang_foli].[dte_rafo_fk_empr].sql
GO
ALTER TABLE [dbo].[dte_rang_foli] WITH NOCHECK ADD CONSTRAINT [dte_rafo_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dte_rang_foli] WITH CHECK CHECK CONSTRAINT [dte_rafo_fk_empr]
GO
--SqlScripter----[dbo].[dte_rang_foli].[dte_rafo_fk_ofic].sql
GO
ALTER TABLE [dbo].[dte_rang_foli] WITH NOCHECK ADD CONSTRAINT [dte_rafo_fk_ofic] FOREIGN KEY ([codi_empr], [codi_ofic])
REFERENCES [dbo].[ofic_empr] ([codi_empr], [codi_ofic])
GO
ALTER TABLE [dbo].[dte_rang_foli] WITH CHECK CHECK CONSTRAINT [dte_rafo_fk_ofic]
GO
--SqlScripter----[dbo].[dte_rang_foli].[dte_rafo_fk_pers].sql
GO
ALTER TABLE [dbo].[dte_rang_foli] WITH NOCHECK ADD CONSTRAINT [dte_rafo_fk_pers] FOREIGN KEY ([codi_pers])
REFERENCES [dbo].[personas] ([codi_pers])
GO
ALTER TABLE [dbo].[dte_rang_foli] WITH CHECK CHECK CONSTRAINT [dte_rafo_fk_pers]
GO
--SqlScripter----[dbo].[dte_reca_item].[dte_reit_fk_dtpr].sql
GO
ALTER TABLE [dbo].[dte_reca_item] WITH NOCHECK ADD CONSTRAINT [dte_reit_fk_dtpr] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dte_deta_prse] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dte_reca_item] WITH CHECK CHECK CONSTRAINT [dte_reit_fk_dtpr]
GO
--SqlScripter----[dbo].[dte_reca_item_h].[DTE_REIT_H_FK_DTPR].sql
GO
ALTER TABLE [dbo].[dte_reca_item_h] WITH NOCHECK ADD CONSTRAINT [DTE_REIT_H_FK_DTPR] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dte_deta_prse_h] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dte_reca_item_h] WITH CHECK CHECK CONSTRAINT [DTE_REIT_H_FK_DTPR]
GO
--SqlScripter----[dbo].[dte_reca_item_p].[dte_reit_fk_dtpr_p].sql
GO
ALTER TABLE [dbo].[dte_reca_item_p] WITH NOCHECK ADD CONSTRAINT [dte_reit_fk_dtpr_p] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dte_deta_prse_p] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dte_reca_item_p] WITH CHECK CHECK CONSTRAINT [dte_reit_fk_dtpr_p]
GO
--SqlScripter----[dbo].[dte_suca_item].[dte_suit_fk_dtpr].sql
GO
ALTER TABLE [dbo].[dte_suca_item] WITH NOCHECK ADD CONSTRAINT [dte_suit_fk_dtpr] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dte_deta_prse] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dte_suca_item] WITH CHECK CHECK CONSTRAINT [dte_suit_fk_dtpr]
GO
--SqlScripter----[dbo].[dte_suca_item_h].[DTE_SUIT_H_FK_DTPR].sql
GO
ALTER TABLE [dbo].[dte_suca_item_h] WITH NOCHECK ADD CONSTRAINT [DTE_SUIT_H_FK_DTPR] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dte_deta_prse_h] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dte_suca_item_h] WITH CHECK CHECK CONSTRAINT [DTE_SUIT_H_FK_DTPR]
GO
--SqlScripter----[dbo].[dte_suca_item_p].[dte_suit_fk_dtpr_p].sql
GO
ALTER TABLE [dbo].[dte_suca_item_p] WITH NOCHECK ADD CONSTRAINT [dte_suit_fk_dtpr_p] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dte_deta_prse_p] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dte_suca_item_p] WITH CHECK CHECK CONSTRAINT [dte_suit_fk_dtpr_p]
GO
--SqlScripter----[dbo].[DTE_SUMA_IMOM].[FK__DTE_SUMA_IMOM__390E6C01].sql
GO
ALTER TABLE [dbo].[DTE_SUMA_IMOM] WITH NOCHECK ADD CONSTRAINT [FK__DTE_SUMA_IMOM__390E6C01] FOREIGN KEY ([codi_empr], [TIPO_DOCU], [FOLI_DOCU])
REFERENCES [dbo].[dte_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[DTE_SUMA_IMOM] WITH CHECK CHECK CONSTRAINT [FK__DTE_SUMA_IMOM__390E6C01]
GO
--SqlScripter----[dbo].[DTE_SUMA_IMOM].[FK__DTE_SUMA_IMOM__3A02903A].sql
GO
ALTER TABLE [dbo].[DTE_SUMA_IMOM] WITH NOCHECK ADD CONSTRAINT [FK__DTE_SUMA_IMOM__3A02903A] FOREIGN KEY ([codi_empr], [TIPO_DOCU], [FOLI_DOCU])
REFERENCES [dbo].[dte_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[DTE_SUMA_IMOM] WITH CHECK CHECK CONSTRAINT [FK__DTE_SUMA_IMOM__3A02903A]
GO
--SqlScripter----[dbo].[dte_suma_impu].[dte_suim_fk_endo].sql
GO
ALTER TABLE [dbo].[dte_suma_impu] WITH NOCHECK ADD CONSTRAINT [dte_suim_fk_endo] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dte_suma_impu] WITH CHECK CHECK CONSTRAINT [dte_suim_fk_endo]
GO
--SqlScripter----[dbo].[dte_suma_impu].[dte_suim_fk_tiim].sql
GO
ALTER TABLE [dbo].[dte_suma_impu] WITH NOCHECK ADD CONSTRAINT [dte_suim_fk_tiim] FOREIGN KEY ([codi_impu])
REFERENCES [dbo].[dte_tipo_impu] ([codi_impu])
GO
ALTER TABLE [dbo].[dte_suma_impu] WITH CHECK CHECK CONSTRAINT [dte_suim_fk_tiim]
GO
--SqlScripter----[dbo].[dte_suma_impu_h].[DTE_SUIM_H_FK_ENDO].sql
GO
ALTER TABLE [dbo].[dte_suma_impu_h] WITH NOCHECK ADD CONSTRAINT [DTE_SUIM_H_FK_ENDO] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu_h] ([codi_empr], [tipo_docu], [foli_docu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dte_suma_impu_h] WITH CHECK CHECK CONSTRAINT [DTE_SUIM_H_FK_ENDO]
GO
--SqlScripter----[dbo].[dte_suma_impu_h].[DTE_SUIM_H_FK_TIIM].sql
GO
ALTER TABLE [dbo].[dte_suma_impu_h] WITH NOCHECK ADD CONSTRAINT [DTE_SUIM_H_FK_TIIM] FOREIGN KEY ([codi_impu])
REFERENCES [dbo].[dte_tipo_impu] ([codi_impu])
GO
ALTER TABLE [dbo].[dte_suma_impu_h] WITH CHECK CHECK CONSTRAINT [DTE_SUIM_H_FK_TIIM]
GO
--SqlScripter----[dbo].[dte_suma_impu_p].[dte_suim_fk_endo_p].sql
GO
ALTER TABLE [dbo].[dte_suma_impu_p] WITH NOCHECK ADD CONSTRAINT [dte_suim_fk_endo_p] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu_p] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dte_suma_impu_p] WITH CHECK CHECK CONSTRAINT [dte_suim_fk_endo_p]
GO
--SqlScripter----[dbo].[dte_tido_envi].[dte_tien_fk_envi].sql
GO
ALTER TABLE [dbo].[dte_tido_envi] WITH NOCHECK ADD CONSTRAINT [dte_tien_fk_envi] FOREIGN KEY ([corr_envi])
REFERENCES [dbo].[dte_envi_docu] ([corr_envi])
GO
ALTER TABLE [dbo].[dte_tido_envi] WITH CHECK CHECK CONSTRAINT [dte_tien_fk_envi]
GO
--SqlScripter----[dbo].[dte_tido_envi].[dte_tien_fk_tido].sql
GO
ALTER TABLE [dbo].[dte_tido_envi] WITH NOCHECK ADD CONSTRAINT [dte_tien_fk_tido] FOREIGN KEY ([tipo_docu])
REFERENCES [dbo].[dte_tipo_docu] ([tipo_docu])
GO
ALTER TABLE [dbo].[dte_tido_envi] WITH CHECK CHECK CONSTRAINT [dte_tien_fk_tido]
GO
--SqlScripter----[dbo].[dte_tido_envi_h].[dte_tien_h_fk_envi].sql
GO
ALTER TABLE [dbo].[dte_tido_envi_h] WITH NOCHECK ADD CONSTRAINT [dte_tien_h_fk_envi] FOREIGN KEY ([corr_envi])
REFERENCES [dbo].[dte_envi_docu_h] ([corr_envi])
GO
ALTER TABLE [dbo].[dte_tido_envi_h] WITH CHECK CHECK CONSTRAINT [dte_tien_h_fk_envi]
GO
--SqlScripter----[dbo].[dte_tido_envi_h].[dte_tien_h_fk_tido].sql
GO
ALTER TABLE [dbo].[dte_tido_envi_h] WITH NOCHECK ADD CONSTRAINT [dte_tien_h_fk_tido] FOREIGN KEY ([tipo_docu])
REFERENCES [dbo].[dte_tipo_docu] ([tipo_docu])
GO
ALTER TABLE [dbo].[dte_tido_envi_h] WITH CHECK CHECK CONSTRAINT [dte_tien_h_fk_tido]
GO
--SqlScripter----[dbo].[dte_tipo_bult].[FK__dte_tipo_bult__438BFA74].sql
GO
ALTER TABLE [dbo].[dte_tipo_bult] WITH NOCHECK ADD CONSTRAINT [FK__dte_tipo_bult__438BFA74] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dte_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dte_tipo_bult] WITH CHECK CHECK CONSTRAINT [FK__dte_tipo_bult__438BFA74]
GO
--SqlScripter----[dbo].[dto_desc_item].[dto_deit_fk_dtpr].sql
GO
ALTER TABLE [dbo].[dto_desc_item] WITH NOCHECK ADD CONSTRAINT [dto_deit_fk_dtpr] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dto_deta_prse] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dto_desc_item] WITH CHECK CHECK CONSTRAINT [dto_deit_fk_dtpr]
GO
--SqlScripter----[dbo].[dto_desc_item_h].[dto_deit_h_fk_dtpr].sql
GO
ALTER TABLE [dbo].[dto_desc_item_h] WITH NOCHECK ADD CONSTRAINT [dto_deit_h_fk_dtpr] FOREIGN KEY ([corr_docu], [codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dto_deta_prse_h] ([corr_docu], [codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dto_desc_item_h] WITH CHECK CHECK CONSTRAINT [dto_deit_h_fk_dtpr]
GO
--SqlScripter----[dbo].[dto_desc_item_p].[dto_deit_fk_dtpr_p].sql
GO
ALTER TABLE [dbo].[dto_desc_item_p] WITH NOCHECK ADD CONSTRAINT [dto_deit_fk_dtpr_p] FOREIGN KEY ([corr_docu], [nume_line])
REFERENCES [dbo].[dto_deta_prse_p] ([corr_docu], [nume_line])
GO
ALTER TABLE [dbo].[dto_desc_item_p] WITH CHECK CHECK CONSTRAINT [dto_deit_fk_dtpr_p]
GO
--SqlScripter----[dbo].[dto_desc_reca].[dto_dere_fk_endo].sql
GO
ALTER TABLE [dbo].[dto_desc_reca] WITH NOCHECK ADD CONSTRAINT [dto_dere_fk_endo] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dto_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dto_desc_reca] WITH CHECK CHECK CONSTRAINT [dto_dere_fk_endo]
GO
--SqlScripter----[dbo].[dto_desc_reca_p].[dto_dere_fk_endo_p].sql
GO
ALTER TABLE [dbo].[dto_desc_reca_p] WITH NOCHECK ADD CONSTRAINT [dto_dere_fk_endo_p] FOREIGN KEY ([corr_docu])
REFERENCES [dbo].[dto_enca_docu_p] ([corr_docu])
GO
ALTER TABLE [dbo].[dto_desc_reca_p] WITH CHECK CHECK CONSTRAINT [dto_dere_fk_endo_p]
GO
--SqlScripter----[dbo].[dto_deta_acec].[dto_deac_fk_endo].sql
GO
ALTER TABLE [dbo].[dto_deta_acec] WITH NOCHECK ADD CONSTRAINT [dto_deac_fk_endo] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dto_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dto_deta_acec] WITH CHECK CHECK CONSTRAINT [dto_deac_fk_endo]
GO
--SqlScripter----[dbo].[dto_deta_acec_p].[dto_deac_fk_endo_p].sql
GO
ALTER TABLE [dbo].[dto_deta_acec_p] WITH NOCHECK ADD CONSTRAINT [dto_deac_fk_endo_p] FOREIGN KEY ([corr_docu])
REFERENCES [dbo].[dto_enca_docu_p] ([corr_docu])
GO
ALTER TABLE [dbo].[dto_deta_acec_p] WITH CHECK CHECK CONSTRAINT [dto_deac_fk_endo_p]
GO
--SqlScripter----[dbo].[dto_deta_codi].[dto_deco_fk_deps].sql
GO
ALTER TABLE [dbo].[dto_deta_codi] WITH NOCHECK ADD CONSTRAINT [dto_deco_fk_deps] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dto_deta_prse] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dto_deta_codi] WITH CHECK CHECK CONSTRAINT [dto_deco_fk_deps]
GO
--SqlScripter----[dbo].[dto_deta_codi_p].[dto_deco_fk_deps_p].sql
GO
ALTER TABLE [dbo].[dto_deta_codi_p] WITH NOCHECK ADD CONSTRAINT [dto_deco_fk_deps_p] FOREIGN KEY ([corr_docu], [nume_line])
REFERENCES [dbo].[dto_deta_prse_p] ([corr_docu], [nume_line])
GO
ALTER TABLE [dbo].[dto_deta_codi_p] WITH CHECK CHECK CONSTRAINT [dto_deco_fk_deps_p]
GO
--SqlScripter----[dbo].[dto_deta_prse].[dto_deps_fk_endo].sql
GO
ALTER TABLE [dbo].[dto_deta_prse] WITH NOCHECK ADD CONSTRAINT [dto_deps_fk_endo] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dto_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dto_deta_prse] WITH CHECK CHECK CONSTRAINT [dto_deps_fk_endo]
GO
--SqlScripter----[dbo].[dto_deta_prse].[dto_deps_fk_tiim].sql
GO
ALTER TABLE [dbo].[dto_deta_prse] WITH NOCHECK ADD CONSTRAINT [dto_deps_fk_tiim] FOREIGN KEY ([codi_impu])
REFERENCES [dbo].[dte_tipo_impu] ([codi_impu])
GO
ALTER TABLE [dbo].[dto_deta_prse] WITH CHECK CHECK CONSTRAINT [dto_deps_fk_tiim]
GO
--SqlScripter----[dbo].[dto_deta_prse_p].[dto_deps_fk_endo_p].sql
GO
ALTER TABLE [dbo].[dto_deta_prse_p] WITH NOCHECK ADD CONSTRAINT [dto_deps_fk_endo_p] FOREIGN KEY ([corr_docu])
REFERENCES [dbo].[dto_enca_docu_p] ([corr_docu])
GO
ALTER TABLE [dbo].[dto_deta_prse_p] WITH CHECK CHECK CONSTRAINT [dto_deps_fk_endo_p]
GO
--SqlScripter----[dbo].[dto_docu_lob].[dto_docu_lob_fk_empr].sql
GO
ALTER TABLE [dbo].[dto_docu_lob] WITH NOCHECK ADD CONSTRAINT [dto_docu_lob_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dto_docu_lob] WITH CHECK CHECK CONSTRAINT [dto_docu_lob_fk_empr]
GO
--SqlScripter----[dbo].[dto_docu_lob_h].[dto_docu_lob_h_fk_empr].sql
GO
ALTER TABLE [dbo].[dto_docu_lob_h] WITH NOCHECK ADD CONSTRAINT [dto_docu_lob_h_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dto_docu_lob_h] WITH CHECK CHECK CONSTRAINT [dto_docu_lob_h_fk_empr]
GO
--SqlScripter----[dbo].[dto_docu_refe].[dto_dore_fk_endo].sql
GO
ALTER TABLE [dbo].[dto_docu_refe] WITH NOCHECK ADD CONSTRAINT [dto_dore_fk_endo] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dto_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dto_docu_refe] WITH CHECK CHECK CONSTRAINT [dto_dore_fk_endo]
GO
--SqlScripter----[dbo].[dto_docu_refe_p].[dto_dore_fk_endo_p].sql
GO
ALTER TABLE [dbo].[dto_docu_refe_p] WITH NOCHECK ADD CONSTRAINT [dto_dore_fk_endo_p] FOREIGN KEY ([corr_docu])
REFERENCES [dbo].[dto_enca_docu_p] ([corr_docu])
GO
ALTER TABLE [dbo].[dto_docu_refe_p] WITH CHECK CHECK CONSTRAINT [dto_dore_fk_endo_p]
GO
--SqlScripter----[dbo].[dto_enca_docu].[dto_endo_fk_empr].sql
GO
ALTER TABLE [dbo].[dto_enca_docu] WITH NOCHECK ADD CONSTRAINT [dto_endo_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dto_enca_docu] WITH CHECK CHECK CONSTRAINT [dto_endo_fk_empr]
GO
--SqlScripter----[dbo].[dto_enca_docu].[dto_endo_fk_envi].sql
GO
ALTER TABLE [dbo].[dto_enca_docu] WITH NOCHECK ADD CONSTRAINT [dto_endo_fk_envi] FOREIGN KEY ([corr_envi])
REFERENCES [dbo].[dto_rece_docu] ([corr_envi])
GO
ALTER TABLE [dbo].[dto_enca_docu] WITH CHECK CHECK CONSTRAINT [dto_endo_fk_envi]
GO
--SqlScripter----[dbo].[dto_enca_docu].[dto_endo_fk_esdo].sql
GO
ALTER TABLE [dbo].[dto_enca_docu] WITH NOCHECK ADD CONSTRAINT [dto_endo_fk_esdo] FOREIGN KEY ([esta_docu])
REFERENCES [dbo].[dte_esta_docu] ([esta_docu])
GO
ALTER TABLE [dbo].[dto_enca_docu] WITH CHECK CHECK CONSTRAINT [dto_endo_fk_esdo]
GO
--SqlScripter----[dbo].[dto_enca_docu].[dto_endo_fk_tido].sql
GO
ALTER TABLE [dbo].[dto_enca_docu] WITH NOCHECK ADD CONSTRAINT [dto_endo_fk_tido] FOREIGN KEY ([tipo_docu])
REFERENCES [dbo].[dte_tipo_docu] ([tipo_docu])
GO
ALTER TABLE [dbo].[dto_enca_docu] WITH CHECK CHECK CONSTRAINT [dto_endo_fk_tido]
GO
--SqlScripter----[dbo].[dto_enca_docu_p].[dto_endo_fk_envi_p].sql
GO
ALTER TABLE [dbo].[dto_enca_docu_p] WITH NOCHECK ADD CONSTRAINT [dto_endo_fk_envi_p] FOREIGN KEY ([corr_envi])
REFERENCES [dbo].[dto_rece_docu] ([corr_envi])
GO
ALTER TABLE [dbo].[dto_enca_docu_p] WITH CHECK CHECK CONSTRAINT [dto_endo_fk_envi_p]
GO
--SqlScripter----[dbo].[dto_reca_item].[dto_reit_fk_dtpr].sql
GO
ALTER TABLE [dbo].[dto_reca_item] WITH NOCHECK ADD CONSTRAINT [dto_reit_fk_dtpr] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dto_deta_prse] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dto_reca_item] WITH CHECK CHECK CONSTRAINT [dto_reit_fk_dtpr]
GO
--SqlScripter----[dbo].[dto_reca_item_h].[dto_reit_h_fk_dtpr].sql
GO
ALTER TABLE [dbo].[dto_reca_item_h] WITH NOCHECK ADD CONSTRAINT [dto_reit_h_fk_dtpr] FOREIGN KEY ([corr_docu], [codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dto_deta_prse_h] ([corr_docu], [codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dto_reca_item_h] WITH CHECK CHECK CONSTRAINT [dto_reit_h_fk_dtpr]
GO
--SqlScripter----[dbo].[dto_reca_item_p].[dto_reit_fk_dtpr_p].sql
GO
ALTER TABLE [dbo].[dto_reca_item_p] WITH NOCHECK ADD CONSTRAINT [dto_reit_fk_dtpr_p] FOREIGN KEY ([corr_docu], [nume_line])
REFERENCES [dbo].[dto_deta_prse_p] ([corr_docu], [nume_line])
GO
ALTER TABLE [dbo].[dto_reca_item_p] WITH CHECK CHECK CONSTRAINT [dto_reit_fk_dtpr_p]
GO
--SqlScripter----[dbo].[dto_rece_docu].[dto_envi_fk_esen].sql
GO
ALTER TABLE [dbo].[dto_rece_docu] WITH NOCHECK ADD CONSTRAINT [dto_envi_fk_esen] FOREIGN KEY ([esta_envi])
REFERENCES [dbo].[dte_esta_envi] ([esta_envi])
GO
ALTER TABLE [dbo].[dto_rece_docu] WITH CHECK CHECK CONSTRAINT [dto_envi_fk_esen]
GO
--SqlScripter----[dbo].[dto_rece_lob].[dto_rece_lob_fk_empr].sql
GO
ALTER TABLE [dbo].[dto_rece_lob] WITH NOCHECK ADD CONSTRAINT [dto_rece_lob_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dto_rece_lob] WITH CHECK CHECK CONSTRAINT [dto_rece_lob_fk_empr]
GO
--SqlScripter----[dbo].[dto_rece_lob_h].[dto_rece_lob_h_fk_empr].sql
GO
ALTER TABLE [dbo].[dto_rece_lob_h] WITH NOCHECK ADD CONSTRAINT [dto_rece_lob_h_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[dto_rece_lob_h] WITH CHECK CHECK CONSTRAINT [dto_rece_lob_h_fk_empr]
GO
--SqlScripter----[dbo].[dto_suca_item].[dto_suit_fk_prse].sql
GO
ALTER TABLE [dbo].[dto_suca_item] WITH NOCHECK ADD CONSTRAINT [dto_suit_fk_prse] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dto_deta_prse] ([codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dto_suca_item] WITH CHECK CHECK CONSTRAINT [dto_suit_fk_prse]
GO
--SqlScripter----[dbo].[dto_suca_item_h].[dto_suit_h_fk_prse].sql
GO
ALTER TABLE [dbo].[dto_suca_item_h] WITH NOCHECK ADD CONSTRAINT [dto_suit_h_fk_prse] FOREIGN KEY ([corr_docu], [codi_empr], [tipo_docu], [foli_docu], [nume_line])
REFERENCES [dbo].[dto_deta_prse_h] ([corr_docu], [codi_empr], [tipo_docu], [foli_docu], [nume_line])
GO
ALTER TABLE [dbo].[dto_suca_item_h] WITH CHECK CHECK CONSTRAINT [dto_suit_h_fk_prse]
GO
--SqlScripter----[dbo].[dto_suca_item_p].[dto_suit_fk_dtpr_p].sql
GO
ALTER TABLE [dbo].[dto_suca_item_p] WITH NOCHECK ADD CONSTRAINT [dto_suit_fk_dtpr_p] FOREIGN KEY ([corr_docu], [nume_line])
REFERENCES [dbo].[dto_deta_prse_p] ([corr_docu], [nume_line])
GO
ALTER TABLE [dbo].[dto_suca_item_p] WITH CHECK CHECK CONSTRAINT [dto_suit_fk_dtpr_p]
GO
--SqlScripter----[dbo].[dto_suma_impu].[dto_suim_fk_endo].sql
GO
ALTER TABLE [dbo].[dto_suma_impu] WITH NOCHECK ADD CONSTRAINT [dto_suim_fk_endo] FOREIGN KEY ([codi_empr], [tipo_docu], [foli_docu])
REFERENCES [dbo].[dto_enca_docu] ([codi_empr], [tipo_docu], [foli_docu])
GO
ALTER TABLE [dbo].[dto_suma_impu] WITH CHECK CHECK CONSTRAINT [dto_suim_fk_endo]
GO
--SqlScripter----[dbo].[dto_suma_impu].[dto_suim_fk_tiim].sql
GO
ALTER TABLE [dbo].[dto_suma_impu] WITH NOCHECK ADD CONSTRAINT [dto_suim_fk_tiim] FOREIGN KEY ([codi_impu])
REFERENCES [dbo].[dte_tipo_impu] ([codi_impu])
GO
ALTER TABLE [dbo].[dto_suma_impu] WITH CHECK CHECK CONSTRAINT [dto_suim_fk_tiim]
GO
--SqlScripter----[dbo].[dto_suma_impu_p].[dto_suim_fk_endo_p].sql
GO
ALTER TABLE [dbo].[dto_suma_impu_p] WITH NOCHECK ADD CONSTRAINT [dto_suim_fk_endo_p] FOREIGN KEY ([corr_docu])
REFERENCES [dbo].[dto_enca_docu_p] ([corr_docu])
GO
ALTER TABLE [dbo].[dto_suma_impu_p] WITH CHECK CHECK CONSTRAINT [dto_suim_fk_endo_p]
GO
--SqlScripter----[dbo].[dto_tido_rece].[dto_tien_fk_envi].sql
GO
ALTER TABLE [dbo].[dto_tido_rece] WITH NOCHECK ADD CONSTRAINT [dto_tien_fk_envi] FOREIGN KEY ([corr_envi])
REFERENCES [dbo].[dto_rece_docu] ([corr_envi])
GO
ALTER TABLE [dbo].[dto_tido_rece] WITH CHECK CHECK CONSTRAINT [dto_tien_fk_envi]
GO
--SqlScripter----[dbo].[dto_tido_rece].[dto_tien_fk_tido].sql
GO
ALTER TABLE [dbo].[dto_tido_rece] WITH NOCHECK ADD CONSTRAINT [dto_tien_fk_tido] FOREIGN KEY ([tipo_docu])
REFERENCES [dbo].[dte_tipo_docu] ([tipo_docu])
GO
ALTER TABLE [dbo].[dto_tido_rece] WITH CHECK CHECK CONSTRAINT [dto_tien_fk_tido]
GO
--SqlScripter----[dbo].[empr].[empr_fk_pers].sql
GO
ALTER TABLE [dbo].[empr] WITH NOCHECK ADD CONSTRAINT [empr_fk_pers] FOREIGN KEY ([codi_pers])
REFERENCES [dbo].[personas] ([codi_pers])
GO
ALTER TABLE [dbo].[empr] WITH CHECK CHECK CONSTRAINT [empr_fk_pers]
GO
--SqlScripter----[dbo].[empr_exte].[emex_fk_empr].sql
GO
ALTER TABLE [dbo].[empr_exte] WITH NOCHECK ADD CONSTRAINT [emex_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[empr_exte] WITH CHECK CHECK CONSTRAINT [emex_fk_empr]
GO
--SqlScripter----[dbo].[foli_anul].[foan_fk_ceco].sql
GO
ALTER TABLE [dbo].[foli_anul] WITH NOCHECK ADD CONSTRAINT [foan_fk_ceco] FOREIGN KEY ([codi_empr], [codi_ceco])
REFERENCES [dbo].[cent_cost] ([codi_empr], [codi_ceco])
GO
ALTER TABLE [dbo].[foli_anul] WITH CHECK CHECK CONSTRAINT [foan_fk_ceco]
GO
--SqlScripter----[dbo].[foli_anul].[foan_fk_empr].sql
GO
ALTER TABLE [dbo].[foli_anul] WITH NOCHECK ADD CONSTRAINT [foan_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[foli_anul] WITH CHECK CHECK CONSTRAINT [foan_fk_empr]
GO
--SqlScripter----[dbo].[lbe_cara_libr].[lbcali_fk_empr].sql
GO
ALTER TABLE [dbo].[lbe_cara_libr] WITH NOCHECK ADD CONSTRAINT [lbcali_fk_empr] FOREIGN KEY ([CODI_EMPR], [FOLI_NOTI])
REFERENCES [dbo].[lbe_noti_libr] ([CODI_EMPR], [FOLI_NOTI])
GO
ALTER TABLE [dbo].[lbe_cara_libr] WITH CHECK CHECK CONSTRAINT [lbcali_fk_empr]
GO
--SqlScripter----[dbo].[lbe_deta_docu].[LBE_DETA_FK_ENCA].sql
GO
ALTER TABLE [dbo].[lbe_deta_docu] WITH NOCHECK ADD CONSTRAINT [LBE_DETA_FK_ENCA] FOREIGN KEY ([codi_soli], [corr_libe])
REFERENCES [dbo].[lbe_enca_libr] ([codi_soli], [corr_libe])
GO
ALTER TABLE [dbo].[lbe_deta_docu] WITH CHECK CHECK CONSTRAINT [LBE_DETA_FK_ENCA]
GO
--SqlScripter----[dbo].[lbe_deta_libr].[lbdeli_fk_empr].sql
GO
ALTER TABLE [dbo].[lbe_deta_libr] WITH NOCHECK ADD CONSTRAINT [lbdeli_fk_empr] FOREIGN KEY ([CODI_EMPR], [CORR_LIBE])
REFERENCES [dbo].[lbe_cara_libr] ([CODI_EMPR], [CORR_LIBE])
GO
ALTER TABLE [dbo].[lbe_deta_libr] WITH CHECK CHECK CONSTRAINT [lbdeli_fk_empr]
GO
--SqlScripter----[dbo].[lbe_enca_libr].[lbe_soli_fk_enca].sql
GO
ALTER TABLE [dbo].[lbe_enca_libr] WITH NOCHECK ADD CONSTRAINT [lbe_soli_fk_enca] FOREIGN KEY ([codi_soli])
REFERENCES [dbo].[lbe_soli_libr] ([codi_soli])
GO
ALTER TABLE [dbo].[lbe_enca_libr] WITH CHECK CHECK CONSTRAINT [lbe_soli_fk_enca]
GO
--SqlScripter----[dbo].[lbe_noti_libr].[lbnoli_fk_empr].sql
GO
ALTER TABLE [dbo].[lbe_noti_libr] WITH NOCHECK ADD CONSTRAINT [lbnoli_fk_empr] FOREIGN KEY ([CODI_EMPR])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[lbe_noti_libr] WITH CHECK CHECK CONSTRAINT [lbnoli_fk_empr]
GO
--SqlScripter----[dbo].[lbe_peri_tise].[lbpeti_fk_empr].sql
GO
ALTER TABLE [dbo].[lbe_peri_tise] WITH NOCHECK ADD CONSTRAINT [lbpeti_fk_empr] FOREIGN KEY ([CODI_EMPR], [CORR_LIBE], [TIPO_DOCU])
REFERENCES [dbo].[lbe_resu_peri] ([CODI_EMPR], [CORR_LIBE], [TIPO_DOCU])
GO
ALTER TABLE [dbo].[lbe_peri_tise] WITH CHECK CHECK CONSTRAINT [lbpeti_fk_empr]
GO
--SqlScripter----[dbo].[lbe_resu_peri].[lbrepe_fk_empr].sql
GO
ALTER TABLE [dbo].[lbe_resu_peri] WITH NOCHECK ADD CONSTRAINT [lbrepe_fk_empr] FOREIGN KEY ([CODI_EMPR], [CORR_LIBE])
REFERENCES [dbo].[lbe_cara_libr] ([CODI_EMPR], [CORR_LIBE])
GO
ALTER TABLE [dbo].[lbe_resu_peri] WITH CHECK CHECK CONSTRAINT [lbrepe_fk_empr]
GO
--SqlScripter----[dbo].[lbe_resu_segm].[lbrese_fk_empr].sql
GO
ALTER TABLE [dbo].[lbe_resu_segm] WITH NOCHECK ADD CONSTRAINT [lbrese_fk_empr] FOREIGN KEY ([CODI_EMPR], [CORR_LIBE])
REFERENCES [dbo].[lbe_cara_libr] ([CODI_EMPR], [CORR_LIBE])
GO
ALTER TABLE [dbo].[lbe_resu_segm] WITH CHECK CHECK CONSTRAINT [lbrese_fk_empr]
GO
--SqlScripter----[dbo].[lbe_segm_tise].[lbseti_fk_empr].sql
GO
ALTER TABLE [dbo].[lbe_segm_tise] WITH NOCHECK ADD CONSTRAINT [lbseti_fk_empr] FOREIGN KEY ([CODI_EMPR], [CORR_LIBE], [TIPO_DOCU])
REFERENCES [dbo].[lbe_resu_segm] ([CODI_EMPR], [CORR_LIBE], [TIPO_DOCU])
GO
ALTER TABLE [dbo].[lbe_segm_tise] WITH CHECK CHECK CONSTRAINT [lbseti_fk_empr]
GO
--SqlScripter----[dbo].[lbe_serv_peri].[LBE_SERV_FK_TOPE].sql
GO
ALTER TABLE [dbo].[lbe_serv_peri] WITH NOCHECK ADD CONSTRAINT [LBE_SERV_FK_TOPE] FOREIGN KEY ([codi_soli], [corr_libe], [tipo_docu])
REFERENCES [dbo].[lbe_tota_peri] ([codi_soli], [corr_libe], [tipo_docu])
GO
ALTER TABLE [dbo].[lbe_serv_peri] WITH CHECK CHECK CONSTRAINT [LBE_SERV_FK_TOPE]
GO
--SqlScripter----[dbo].[lbe_serv_segm].[LBE_SERV_FK_TOSE].sql
GO
ALTER TABLE [dbo].[lbe_serv_segm] WITH NOCHECK ADD CONSTRAINT [LBE_SERV_FK_TOSE] FOREIGN KEY ([codi_soli], [corr_libe], [tipo_docu])
REFERENCES [dbo].[lbe_tota_segm] ([codi_soli], [corr_libe], [tipo_docu])
GO
ALTER TABLE [dbo].[lbe_serv_segm] WITH CHECK CHECK CONSTRAINT [LBE_SERV_FK_TOSE]
GO
--SqlScripter----[dbo].[lbe_tota_peri].[LBE_TOPE_FK_ENCA].sql
GO
ALTER TABLE [dbo].[lbe_tota_peri] WITH NOCHECK ADD CONSTRAINT [LBE_TOPE_FK_ENCA] FOREIGN KEY ([codi_soli], [corr_libe])
REFERENCES [dbo].[lbe_enca_libr] ([codi_soli], [corr_libe])
GO
ALTER TABLE [dbo].[lbe_tota_peri] WITH CHECK CHECK CONSTRAINT [LBE_TOPE_FK_ENCA]
GO
--SqlScripter----[dbo].[lbe_tota_segm].[LBE_TOSE_FK_ENCA].sql
GO
ALTER TABLE [dbo].[lbe_tota_segm] WITH NOCHECK ADD CONSTRAINT [LBE_TOSE_FK_ENCA] FOREIGN KEY ([codi_soli], [corr_libe])
REFERENCES [dbo].[lbe_enca_libr] ([codi_soli], [corr_libe])
GO
ALTER TABLE [dbo].[lbe_tota_segm] WITH CHECK CHECK CONSTRAINT [LBE_TOSE_FK_ENCA]
GO
--SqlScripter----[dbo].[LCV_DIGI_DOCU].[lcvdigi_fk_docu].sql
GO
ALTER TABLE [dbo].[LCV_DIGI_DOCU] WITH NOCHECK ADD CONSTRAINT [lcvdigi_fk_docu] FOREIGN KEY ([TIPO_DOCU])
REFERENCES [dbo].[dte_tipo_docu] ([tipo_docu])
GO
ALTER TABLE [dbo].[LCV_DIGI_DOCU] WITH CHECK CHECK CONSTRAINT [lcvdigi_fk_docu]
GO
--SqlScripter----[dbo].[LCV_DIGI_DOCU].[lcvdigi_fk_empr].sql
GO
ALTER TABLE [dbo].[LCV_DIGI_DOCU] WITH NOCHECK ADD CONSTRAINT [lcvdigi_fk_empr] FOREIGN KEY ([CODI_EMPR])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[LCV_DIGI_DOCU] WITH CHECK CHECK CONSTRAINT [lcvdigi_fk_empr]
GO
--SqlScripter----[dbo].[LCV_DIGI_IMPU].[lcvdigi_fk_impu].sql
GO
ALTER TABLE [dbo].[LCV_DIGI_IMPU] WITH NOCHECK ADD CONSTRAINT [lcvdigi_fk_impu] FOREIGN KEY ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU], [TIPO_OPER], [RUTT_ASOC])
REFERENCES [dbo].[LCV_DIGI_DOCU] ([CODI_EMPR], [TIPO_DOCU], [FOLI_DOCU], [TIPO_OPER], [RUTT_ASOC])
GO
ALTER TABLE [dbo].[LCV_DIGI_IMPU] WITH CHECK CHECK CONSTRAINT [lcvdigi_fk_impu]
GO
--SqlScripter----[dbo].[lcv_nore_temp].[lcv_tmp3_fk_temp].sql
GO
ALTER TABLE [dbo].[lcv_nore_temp] WITH NOCHECK ADD CONSTRAINT [lcv_tmp3_fk_temp] FOREIGN KEY ([tipo_oper], [tipo_libr], [rutt_asoc], [peri_trib], [tipo_docu], [foli_docu], [rutt_cont])
REFERENCES [dbo].[lcv_deta_temp] ([tipo_oper], [tipo_libr], [rutt_asoc], [peri_trib], [tipo_docu], [foli_docu], [rutt_cont])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lcv_nore_temp] WITH CHECK CHECK CONSTRAINT [lcv_tmp3_fk_temp]
GO
--SqlScripter----[dbo].[lcv_resu_libr].[fk_esta_envi].sql
GO
ALTER TABLE [dbo].[lcv_resu_libr] WITH NOCHECK ADD CONSTRAINT [fk_esta_envi] FOREIGN KEY ([esta_envi])
REFERENCES [dbo].[dte_esta_envi] ([esta_envi])
GO
ALTER TABLE [dbo].[lcv_resu_libr] WITH CHECK CHECK CONSTRAINT [fk_esta_envi]
GO
--SqlScripter----[dbo].[lcv_segm_nore].[lcv_seim_fk_nore].sql
GO
ALTER TABLE [dbo].[lcv_segm_nore] WITH NOCHECK ADD CONSTRAINT [lcv_seim_fk_nore] FOREIGN KEY ([codi_empr], [corr_licv], [tipo_docu])
REFERENCES [dbo].[lcv_tota_segm] ([codi_empr], [corr_licv], [tipo_docu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lcv_segm_nore] WITH CHECK CHECK CONSTRAINT [lcv_seim_fk_nore]
GO
--SqlScripter----[dbo].[lcv_segm_nore_p].[lcv_seim_fk_nore_p].sql
GO
ALTER TABLE [dbo].[lcv_segm_nore_p] WITH NOCHECK ADD CONSTRAINT [lcv_seim_fk_nore_p] FOREIGN KEY ([codi_empr], [corr_licv], [tipo_docu])
REFERENCES [dbo].[lcv_tota_segm_p] ([codi_empr], [corr_licv], [tipo_docu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lcv_segm_nore_p] WITH CHECK CHECK CONSTRAINT [lcv_seim_fk_nore_p]
GO
--SqlScripter----[dbo].[lcv_tota_docu].[lcv_todo_fk_dedo].sql
GO
ALTER TABLE [dbo].[lcv_tota_docu] WITH NOCHECK ADD CONSTRAINT [lcv_todo_fk_dedo] FOREIGN KEY ([codi_empr], [corr_licv], [tipo_docu], [foli_docu], [rutt_asoc])
REFERENCES [dbo].[lcv_deta_docu] ([codi_empr], [corr_licv], [tipo_docu], [foli_docu], [rutt_asoc])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lcv_tota_docu] WITH CHECK CHECK CONSTRAINT [lcv_todo_fk_dedo]
GO
--SqlScripter----[dbo].[lcv_tota_docu_p].[lcv_todo_fk_dedo_p].sql
GO
ALTER TABLE [dbo].[lcv_tota_docu_p] WITH NOCHECK ADD CONSTRAINT [lcv_todo_fk_dedo_p] FOREIGN KEY ([codi_empr], [corr_licv], [tipo_docu], [foli_docu], [rutt_asoc])
REFERENCES [dbo].[lcv_deta_docu_p] ([codi_empr], [corr_licv], [tipo_docu], [foli_docu], [rutt_asoc])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lcv_tota_docu_p] WITH CHECK CHECK CONSTRAINT [lcv_todo_fk_dedo_p]
GO
--SqlScripter----[dbo].[lcv_tota_libr].[lcv_toli_fk_reli].sql
GO
ALTER TABLE [dbo].[lcv_tota_libr] WITH NOCHECK ADD CONSTRAINT [lcv_toli_fk_reli] FOREIGN KEY ([codi_empr], [corr_licv])
REFERENCES [dbo].[lcv_resu_libr] ([codi_empr], [corr_licv])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lcv_tota_libr] WITH CHECK CHECK CONSTRAINT [lcv_toli_fk_reli]
GO
--SqlScripter----[dbo].[lcv_tota_nore].[lcv_tota_fk_nore].sql
GO
ALTER TABLE [dbo].[lcv_tota_nore] WITH NOCHECK ADD CONSTRAINT [lcv_tota_fk_nore] FOREIGN KEY ([codi_empr], [corr_licv], [tipo_docu])
REFERENCES [dbo].[lcv_tota_libr] ([codi_empr], [corr_licv], [tipo_docu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lcv_tota_nore] WITH CHECK CHECK CONSTRAINT [lcv_tota_fk_nore]
GO
--SqlScripter----[dbo].[lcv_tota_segm].[lcv_tose_fk_reli].sql
GO
ALTER TABLE [dbo].[lcv_tota_segm] WITH NOCHECK ADD CONSTRAINT [lcv_tose_fk_reli] FOREIGN KEY ([codi_empr], [corr_licv])
REFERENCES [dbo].[lcv_resu_libr] ([codi_empr], [corr_licv])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lcv_tota_segm] WITH CHECK CHECK CONSTRAINT [lcv_tose_fk_reli]
GO
--SqlScripter----[dbo].[lcv_tota_segm_p].[lcv_tose_fk_reli_p].sql
GO
ALTER TABLE [dbo].[lcv_tota_segm_p] WITH NOCHECK ADD CONSTRAINT [lcv_tose_fk_reli_p] FOREIGN KEY ([codi_empr], [corr_licv])
REFERENCES [dbo].[lcv_resu_libr_p] ([codi_empr], [corr_licv])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lcv_tota_segm_p] WITH CHECK CHECK CONSTRAINT [lcv_tose_fk_reli_p]
GO
--SqlScripter----[dbo].[lcv_tota_temp].[lcv_tmp2_fk_temp].sql
GO
ALTER TABLE [dbo].[lcv_tota_temp] WITH NOCHECK ADD CONSTRAINT [lcv_tmp2_fk_temp] FOREIGN KEY ([tipo_oper], [tipo_libr], [rutt_asoc], [peri_trib], [tipo_docu], [foli_docu], [rutt_cont])
REFERENCES [dbo].[lcv_deta_temp] ([tipo_oper], [tipo_libr], [rutt_asoc], [peri_trib], [tipo_docu], [foli_docu], [rutt_cont])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lcv_tota_temp] WITH CHECK CHECK CONSTRAINT [lcv_tmp2_fk_temp]
GO
--SqlScripter----[dbo].[lgd_deta_docu].[lgd_dedo_fk_enli].sql
GO
ALTER TABLE [dbo].[lgd_deta_docu] WITH NOCHECK ADD CONSTRAINT [lgd_dedo_fk_enli] FOREIGN KEY ([corr_ligd], [codi_empr])
REFERENCES [dbo].[lgd_enca_ligd] ([corr_ligd], [codi_empr])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lgd_deta_docu] WITH CHECK CHECK CONSTRAINT [lgd_dedo_fk_enli]
GO
--SqlScripter----[dbo].[lgd_deta_docu_p].[lgd_dedo_fk_enli_p].sql
GO
ALTER TABLE [dbo].[lgd_deta_docu_p] WITH NOCHECK ADD CONSTRAINT [lgd_dedo_fk_enli_p] FOREIGN KEY ([corr_ligd], [codi_empr])
REFERENCES [dbo].[lgd_enca_ligd_p] ([corr_ligd], [codi_empr])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lgd_deta_docu_p] WITH CHECK CHECK CONSTRAINT [lgd_dedo_fk_enli_p]
GO
--SqlScripter----[dbo].[lgd_tota_peri].[lgd_tope_fk_enli].sql
GO
ALTER TABLE [dbo].[lgd_tota_peri] WITH NOCHECK ADD CONSTRAINT [lgd_tope_fk_enli] FOREIGN KEY ([corr_ligd], [codi_empr])
REFERENCES [dbo].[lgd_enca_ligd] ([corr_ligd], [codi_empr])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lgd_tota_peri] WITH CHECK CHECK CONSTRAINT [lgd_tope_fk_enli]
GO
--SqlScripter----[dbo].[lgd_tota_peri_p].[lgd_tope_fk_enli_p].sql
GO
ALTER TABLE [dbo].[lgd_tota_peri_p] WITH NOCHECK ADD CONSTRAINT [lgd_tope_fk_enli_p] FOREIGN KEY ([corr_ligd], [codi_empr])
REFERENCES [dbo].[lgd_enca_ligd_p] ([corr_ligd], [codi_empr])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lgd_tota_peri_p] WITH CHECK CHECK CONSTRAINT [lgd_tope_fk_enli_p]
GO
--SqlScripter----[dbo].[lgd_tota_segm].[lgd_tose_fk_enli].sql
GO
ALTER TABLE [dbo].[lgd_tota_segm] WITH NOCHECK ADD CONSTRAINT [lgd_tose_fk_enli] FOREIGN KEY ([corr_ligd], [codi_empr])
REFERENCES [dbo].[lgd_enca_ligd] ([corr_ligd], [codi_empr])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lgd_tota_segm] WITH CHECK CHECK CONSTRAINT [lgd_tose_fk_enli]
GO
--SqlScripter----[dbo].[lgd_tota_segm_p].[lgd_tose_fk_enli_p].sql
GO
ALTER TABLE [dbo].[lgd_tota_segm_p] WITH NOCHECK ADD CONSTRAINT [lgd_tose_fk_enli_p] FOREIGN KEY ([corr_ligd], [codi_empr])
REFERENCES [dbo].[lgd_enca_ligd_p] ([corr_ligd], [codi_empr])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lgd_tota_segm_p] WITH CHECK CHECK CONSTRAINT [lgd_tose_fk_enli_p]
GO
--SqlScripter----[dbo].[lgd_tras_peri].[lgd_trpe_fk_tope].sql
GO
ALTER TABLE [dbo].[lgd_tras_peri] WITH NOCHECK ADD CONSTRAINT [lgd_trpe_fk_tope] FOREIGN KEY ([corr_ligd], [codi_empr])
REFERENCES [dbo].[lgd_tota_peri] ([corr_ligd], [codi_empr])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lgd_tras_peri] WITH CHECK CHECK CONSTRAINT [lgd_trpe_fk_tope]
GO
--SqlScripter----[dbo].[lgd_tras_peri_p].[lgd_trpe_fk_tope_p].sql
GO
ALTER TABLE [dbo].[lgd_tras_peri_p] WITH NOCHECK ADD CONSTRAINT [lgd_trpe_fk_tope_p] FOREIGN KEY ([corr_ligd], [codi_empr])
REFERENCES [dbo].[lgd_tota_peri_p] ([corr_ligd], [codi_empr])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lgd_tras_peri_p] WITH CHECK CHECK CONSTRAINT [lgd_trpe_fk_tope_p]
GO
--SqlScripter----[dbo].[lgd_tras_segm].[lgd_trse_fk_tose].sql
GO
ALTER TABLE [dbo].[lgd_tras_segm] WITH NOCHECK ADD CONSTRAINT [lgd_trse_fk_tose] FOREIGN KEY ([corr_ligd], [codi_empr])
REFERENCES [dbo].[lgd_tota_segm] ([corr_ligd], [codi_empr])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lgd_tras_segm] WITH CHECK CHECK CONSTRAINT [lgd_trse_fk_tose]
GO
--SqlScripter----[dbo].[lgd_tras_segm_p].[lgd_trse_fk_tose_p].sql
GO
ALTER TABLE [dbo].[lgd_tras_segm_p] WITH NOCHECK ADD CONSTRAINT [lgd_trse_fk_tose_p] FOREIGN KEY ([corr_ligd], [codi_empr])
REFERENCES [dbo].[lgd_tota_segm_p] ([corr_ligd], [codi_empr])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lgd_tras_segm_p] WITH CHECK CHECK CONSTRAINT [lgd_trse_fk_tose_p]
GO
--SqlScripter----[dbo].[ofic_empr].[ofem_fk_ceco].sql
GO
ALTER TABLE [dbo].[ofic_empr] WITH NOCHECK ADD CONSTRAINT [ofem_fk_ceco] FOREIGN KEY ([codi_empr], [codi_ceco])
REFERENCES [dbo].[cent_cost] ([codi_empr], [codi_ceco])
GO
ALTER TABLE [dbo].[ofic_empr] WITH CHECK CHECK CONSTRAINT [ofem_fk_ceco]
GO
--SqlScripter----[dbo].[ofic_empr].[ofem_fk_empr].sql
GO
ALTER TABLE [dbo].[ofic_empr] WITH NOCHECK ADD CONSTRAINT [ofem_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[ofic_empr] WITH CHECK CHECK CONSTRAINT [ofem_fk_empr]
GO
--SqlScripter----[dbo].[para_pers].[PAPE_FK_EMPR].sql
GO
ALTER TABLE [dbo].[para_pers] WITH NOCHECK ADD CONSTRAINT [PAPE_FK_EMPR] FOREIGN KEY ([CODI_EMPR])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[para_pers] WITH CHECK CHECK CONSTRAINT [PAPE_FK_EMPR]
GO
--SqlScripter----[dbo].[para_pers].[PAPE_FK_PERS].sql
GO
ALTER TABLE [dbo].[para_pers] WITH NOCHECK ADD CONSTRAINT [PAPE_FK_PERS] FOREIGN KEY ([CODI_PERS])
REFERENCES [dbo].[personas] ([codi_pers])
GO
ALTER TABLE [dbo].[para_pers] WITH CHECK CHECK CONSTRAINT [PAPE_FK_PERS]
GO
--SqlScripter----[dbo].[PERS_PAIDE].[DTE_ENDO_H_FK_PAIDE].sql
GO
ALTER TABLE [dbo].[PERS_PAIDE] WITH NOCHECK ADD CONSTRAINT [DTE_ENDO_H_FK_PAIDE] FOREIGN KEY ([CONT_RUTT])
REFERENCES [dbo].[PERS_PUBL] ([CONT_RUTT])
GO
ALTER TABLE [dbo].[PERS_PAIDE] WITH CHECK CHECK CONSTRAINT [DTE_ENDO_H_FK_PAIDE]
GO
--SqlScripter----[dbo].[personas].[pers_fk_ceco].sql
GO
ALTER TABLE [dbo].[personas] WITH NOCHECK ADD CONSTRAINT [pers_fk_ceco] FOREIGN KEY ([codi_empr], [codi_ceco])
REFERENCES [dbo].[cent_cost] ([codi_empr], [codi_ceco])
GO
ALTER TABLE [dbo].[personas] WITH CHECK CHECK CONSTRAINT [pers_fk_ceco]
GO
--SqlScripter----[dbo].[personas].[pers_fk_empr].sql
GO
ALTER TABLE [dbo].[personas] WITH NOCHECK ADD CONSTRAINT [pers_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[personas] WITH CHECK CHECK CONSTRAINT [pers_fk_empr]
GO
--SqlScripter----[dbo].[personas].[pers1_fk_pers].sql
GO
ALTER TABLE [dbo].[personas] WITH NOCHECK ADD CONSTRAINT [pers1_fk_pers] FOREIGN KEY ([codi_pers1])
REFERENCES [dbo].[personas] ([codi_pers])
GO
ALTER TABLE [dbo].[personas] WITH CHECK CHECK CONSTRAINT [pers1_fk_pers]
GO
--SqlScripter----[dbo].[qse_docu_serv].[qse_docu_serv_fk_emex].sql
GO
ALTER TABLE [dbo].[qse_docu_serv] WITH NOCHECK ADD CONSTRAINT [qse_docu_serv_fk_emex] FOREIGN KEY ([CODI_EMEX])
REFERENCES [dbo].[empr_exte] ([codi_emex])
GO
ALTER TABLE [dbo].[qse_docu_serv] WITH CHECK CHECK CONSTRAINT [qse_docu_serv_fk_emex]
GO
--SqlScripter----[dbo].[qse_docu_serv_err].[qse_docu_serv_err_dte_docu].sql
GO
ALTER TABLE [dbo].[qse_docu_serv_err] WITH NOCHECK ADD CONSTRAINT [qse_docu_serv_err_dte_docu] FOREIGN KEY ([CODI_DOPR])
REFERENCES [dbo].[qse_docu_serv] ([CODI_DOPR])
GO
ALTER TABLE [dbo].[qse_docu_serv_err] WITH CHECK CHECK CONSTRAINT [qse_docu_serv_err_dte_docu]
GO
--SqlScripter----[dbo].[ramo].[RAMO_FK_EMPR].sql
GO
ALTER TABLE [dbo].[ramo] WITH NOCHECK ADD CONSTRAINT [RAMO_FK_EMPR] FOREIGN KEY ([CODI_EMPR])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[ramo] WITH CHECK CHECK CONSTRAINT [RAMO_FK_EMPR]
GO
--SqlScripter----[dbo].[sys_alar_emex].[sys_alar_emex_fk_coal].sql
GO
ALTER TABLE [dbo].[sys_alar_emex] WITH NOCHECK ADD CONSTRAINT [sys_alar_emex_fk_coal] FOREIGN KEY ([codi_alar])
REFERENCES [dbo].[sys_alar] ([codi_alar])
GO
ALTER TABLE [dbo].[sys_alar_emex] WITH CHECK CHECK CONSTRAINT [sys_alar_emex_fk_coal]
GO
--SqlScripter----[dbo].[sys_alar_empr].[sys_alar_empr_fk_coal].sql
GO
ALTER TABLE [dbo].[sys_alar_empr] WITH NOCHECK ADD CONSTRAINT [sys_alar_empr_fk_coal] FOREIGN KEY ([codi_alar])
REFERENCES [dbo].[sys_alar] ([codi_alar])
GO
ALTER TABLE [dbo].[sys_alar_empr] WITH CHECK CHECK CONSTRAINT [sys_alar_empr_fk_coal]
GO
--SqlScripter----[dbo].[sys_alin].[sys_alin_fk_alar].sql
GO
ALTER TABLE [dbo].[sys_alin] WITH NOCHECK ADD CONSTRAINT [sys_alin_fk_alar] FOREIGN KEY ([codi_alar])
REFERENCES [dbo].[sys_alar] ([codi_alar])
GO
ALTER TABLE [dbo].[sys_alin] WITH CHECK CHECK CONSTRAINT [sys_alin_fk_alar]
GO
--SqlScripter----[dbo].[sys_alri].[sys_alri_fk_alar].sql
GO
ALTER TABLE [dbo].[sys_alri] WITH NOCHECK ADD CONSTRAINT [sys_alri_fk_alar] FOREIGN KEY ([codi_alar])
REFERENCES [dbo].[sys_alar] ([codi_alar])
GO
ALTER TABLE [dbo].[sys_alri] WITH CHECK CHECK CONSTRAINT [sys_alri_fk_alar]
GO
--SqlScripter----[dbo].[sys_alro].[sys_alro_fk_alar].sql
GO
ALTER TABLE [dbo].[sys_alro] WITH NOCHECK ADD CONSTRAINT [sys_alro_fk_alar] FOREIGN KEY ([codi_alar])
REFERENCES [dbo].[sys_alar] ([codi_alar])
GO
ALTER TABLE [dbo].[sys_alro] WITH CHECK CHECK CONSTRAINT [sys_alro_fk_alar]
GO
--SqlScripter----[dbo].[sys_alus].[sys_alus_fk_alar].sql
GO
ALTER TABLE [dbo].[sys_alus] WITH NOCHECK ADD CONSTRAINT [sys_alus_fk_alar] FOREIGN KEY ([codi_alar])
REFERENCES [dbo].[sys_alar] ([codi_alar])
GO
ALTER TABLE [dbo].[sys_alus] WITH CHECK CHECK CONSTRAINT [sys_alus_fk_alar]
GO
--SqlScripter----[dbo].[sys_alus].[sys_alus_fk_usua].sql
GO
ALTER TABLE [dbo].[sys_alus] WITH NOCHECK ADD CONSTRAINT [sys_alus_fk_usua] FOREIGN KEY ([codi_usua])
REFERENCES [dbo].[usua_sist] ([codi_usua])
GO
ALTER TABLE [dbo].[sys_alus] WITH CHECK CHECK CONSTRAINT [sys_alus_fk_usua]
GO
--SqlScripter----[dbo].[sys_attr_cult].[sys_attr_cult_attr].sql
GO
ALTER TABLE [dbo].[sys_attr_cult] WITH NOCHECK ADD CONSTRAINT [sys_attr_cult_attr] FOREIGN KEY ([object_name], [attr_name])
REFERENCES [dbo].[sys_attribute] ([object_name], [attr_name])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sys_attr_cult] WITH CHECK CHECK CONSTRAINT [sys_attr_cult_attr]
GO
--SqlScripter----[dbo].[sys_code].[sys_c00108194].sql
GO
ALTER TABLE [dbo].[sys_code] WITH NOCHECK ADD CONSTRAINT [sys_c00108194] FOREIGN KEY ([domain_code])
REFERENCES [dbo].[sys_domain] ([domain_code])
GO
ALTER TABLE [dbo].[sys_code] WITH CHECK CHECK CONSTRAINT [sys_c00108194]
GO
--SqlScripter----[dbo].[sys_codi].[sys_c00108195].sql
GO
ALTER TABLE [dbo].[sys_codi] WITH NOCHECK ADD CONSTRAINT [sys_c00108195] FOREIGN KEY ([domain_code])
REFERENCES [dbo].[sys_domain] ([domain_code])
GO
ALTER TABLE [dbo].[sys_codi] WITH CHECK CHECK CONSTRAINT [sys_c00108195]
GO
--SqlScripter----[dbo].[sys_connection].[sys_connection_usua].sql
GO
ALTER TABLE [dbo].[sys_connection] WITH NOCHECK ADD CONSTRAINT [sys_connection_usua] FOREIGN KEY ([corr_sess])
REFERENCES [dbo].[sys_session] ([corr_sess])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sys_connection] WITH CHECK CHECK CONSTRAINT [sys_connection_usua]
GO
--SqlScripter----[dbo].[sys_defp].[sys_defp_fk_obje].sql
GO
ALTER TABLE [dbo].[sys_defp] WITH NOCHECK ADD CONSTRAINT [sys_defp_fk_obje] FOREIGN KEY ([object_name])
REFERENCES [dbo].[sys_object] ([object_name])
GO
ALTER TABLE [dbo].[sys_defp] WITH CHECK CHECK CONSTRAINT [sys_defp_fk_obje]
GO
--SqlScripter----[dbo].[sys_doma_cult].[sys_doma_cult_obje].sql
GO
ALTER TABLE [dbo].[sys_doma_cult] WITH NOCHECK ADD CONSTRAINT [sys_doma_cult_obje] FOREIGN KEY ([domain_code])
REFERENCES [dbo].[sys_domain] ([domain_code])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sys_doma_cult] WITH CHECK CHECK CONSTRAINT [sys_doma_cult_obje]
GO
--SqlScripter----[dbo].[sys_fupr].[sys_fupr_fk_obje].sql
GO
ALTER TABLE [dbo].[sys_fupr] WITH NOCHECK ADD CONSTRAINT [sys_fupr_fk_obje] FOREIGN KEY ([object_name])
REFERENCES [dbo].[sys_object] ([object_name])
GO
ALTER TABLE [dbo].[sys_fupr] WITH CHECK CHECK CONSTRAINT [sys_fupr_fk_obje]
GO
--SqlScripter----[dbo].[sys_fupr].[sys_fupr_fk_obre].sql
GO
ALTER TABLE [dbo].[sys_fupr] WITH NOCHECK ADD CONSTRAINT [sys_fupr_fk_obre] FOREIGN KEY ([object_rela])
REFERENCES [dbo].[sys_object] ([object_name])
GO
ALTER TABLE [dbo].[sys_fupr] WITH CHECK CHECK CONSTRAINT [sys_fupr_fk_obre]
GO
--SqlScripter----[dbo].[sys_inst].[sys_inst_fk_obje].sql
GO
ALTER TABLE [dbo].[sys_inst] WITH NOCHECK ADD CONSTRAINT [sys_inst_fk_obje] FOREIGN KEY ([object_name])
REFERENCES [dbo].[sys_object] ([object_name])
GO
ALTER TABLE [dbo].[sys_inst] WITH CHECK CHECK CONSTRAINT [sys_inst_fk_obje]
GO
--SqlScripter----[dbo].[sys_key_attr].[sys_key_attr_fk_key].sql
GO
ALTER TABLE [dbo].[sys_key_attr] WITH NOCHECK ADD CONSTRAINT [sys_key_attr_fk_key] FOREIGN KEY ([table_name], [number_key])
REFERENCES [dbo].[sys_key] ([table_name], [number_key])
GO
ALTER TABLE [dbo].[sys_key_attr] WITH CHECK CHECK CONSTRAINT [sys_key_attr_fk_key]
GO
--SqlScripter----[dbo].[sys_mess_cult].[sys_mess_cult_mess].sql
GO
ALTER TABLE [dbo].[sys_mess_cult] WITH NOCHECK ADD CONSTRAINT [sys_mess_cult_mess] FOREIGN KEY ([codi_mess])
REFERENCES [dbo].[sys_message] ([codi_mess])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sys_mess_cult] WITH CHECK CHECK CONSTRAINT [sys_mess_cult_mess]
GO
--SqlScripter----[dbo].[sys_obac].[sys_obac_fk_obje].sql
GO
ALTER TABLE [dbo].[sys_obac] WITH NOCHECK ADD CONSTRAINT [sys_obac_fk_obje] FOREIGN KEY ([object_name])
REFERENCES [dbo].[sys_object] ([object_name])
GO
ALTER TABLE [dbo].[sys_obac] WITH CHECK CHECK CONSTRAINT [sys_obac_fk_obje]
GO
--SqlScripter----[dbo].[sys_obje_cult].[sys_obje_cult_obje].sql
GO
ALTER TABLE [dbo].[sys_obje_cult] WITH NOCHECK ADD CONSTRAINT [sys_obje_cult_obje] FOREIGN KEY ([object_name])
REFERENCES [dbo].[sys_object] ([object_name])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sys_obje_cult] WITH CHECK CHECK CONSTRAINT [sys_obje_cult_obje]
GO
--SqlScripter----[dbo].[sys_usfa].[sys_usfa_fk_usua].sql
GO
ALTER TABLE [dbo].[sys_usfa] WITH NOCHECK ADD CONSTRAINT [sys_usfa_fk_usua] FOREIGN KEY ([codi_usua])
REFERENCES [dbo].[usua_sist] ([codi_usua])
GO
ALTER TABLE [dbo].[sys_usfa] WITH CHECK CHECK CONSTRAINT [sys_usfa_fk_usua]
GO
--SqlScripter----[dbo].[sys_usro].[sys_usro_fk_usua].sql
GO
ALTER TABLE [dbo].[sys_usro] WITH NOCHECK ADD CONSTRAINT [sys_usro_fk_usua] FOREIGN KEY ([codi_usua])
REFERENCES [dbo].[usua_sist] ([codi_usua])
GO
ALTER TABLE [dbo].[sys_usro] WITH CHECK CHECK CONSTRAINT [sys_usro_fk_usua]
GO
--SqlScripter----[dbo].[usem_exte].[ueex_fk_emex_1].sql
GO
ALTER TABLE [dbo].[usem_exte] WITH NOCHECK ADD CONSTRAINT [ueex_fk_emex_1] FOREIGN KEY ([codi_emex])
REFERENCES [dbo].[empr_exte] ([codi_emex])
GO
ALTER TABLE [dbo].[usem_exte] WITH CHECK CHECK CONSTRAINT [ueex_fk_emex_1]
GO
--SqlScripter----[dbo].[usem_exte].[ueex_fk_pers].sql
GO
ALTER TABLE [dbo].[usem_exte] WITH NOCHECK ADD CONSTRAINT [ueex_fk_pers] FOREIGN KEY ([codi_pers])
REFERENCES [dbo].[personas] ([codi_pers])
GO
ALTER TABLE [dbo].[usem_exte] WITH CHECK CHECK CONSTRAINT [ueex_fk_pers]
GO
--SqlScripter----[dbo].[usem_exte].[ueex_fk_usex_1].sql
GO
ALTER TABLE [dbo].[usem_exte] WITH NOCHECK ADD CONSTRAINT [ueex_fk_usex_1] FOREIGN KEY ([codi_usex])
REFERENCES [dbo].[usua_exte] ([codi_usex])
GO
ALTER TABLE [dbo].[usem_exte] WITH CHECK CHECK CONSTRAINT [ueex_fk_usex_1]
GO
--SqlScripter----[dbo].[usua_empr].[usem_fk_empr].sql
GO
ALTER TABLE [dbo].[usua_empr] WITH NOCHECK ADD CONSTRAINT [usem_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[usua_empr] WITH CHECK CHECK CONSTRAINT [usem_fk_empr]
GO
--SqlScripter----[dbo].[usua_empr].[usem_fk_usua].sql
GO
ALTER TABLE [dbo].[usua_empr] WITH NOCHECK ADD CONSTRAINT [usem_fk_usua] FOREIGN KEY ([codi_usua])
REFERENCES [dbo].[usua_sist] ([codi_usua])
GO
ALTER TABLE [dbo].[usua_empr] NOCHECK CONSTRAINT [usem_fk_usua]
GO
--SqlScripter----[dbo].[usua_exte].[usex_fk_ceco].sql
GO
ALTER TABLE [dbo].[usua_exte] WITH NOCHECK ADD CONSTRAINT [usex_fk_ceco] FOREIGN KEY ([codi_empr], [codi_ceco])
REFERENCES [dbo].[cent_cost] ([codi_empr], [codi_ceco])
GO
ALTER TABLE [dbo].[usua_exte] WITH CHECK CHECK CONSTRAINT [usex_fk_ceco]
GO
--SqlScripter----[dbo].[usua_exte].[usex_fk_emex].sql
GO
ALTER TABLE [dbo].[usua_exte] WITH NOCHECK ADD CONSTRAINT [usex_fk_emex] FOREIGN KEY ([codi_emex])
REFERENCES [dbo].[empr_exte] ([codi_emex])
GO
ALTER TABLE [dbo].[usua_exte] WITH CHECK CHECK CONSTRAINT [usex_fk_emex]
GO
--SqlScripter----[dbo].[usua_exte].[usex_fk_empr].sql
GO
ALTER TABLE [dbo].[usua_exte] WITH NOCHECK ADD CONSTRAINT [usex_fk_empr] FOREIGN KEY ([codi_empr])
REFERENCES [dbo].[empr] ([codi_empr])
GO
ALTER TABLE [dbo].[usua_exte] WITH CHECK CHECK CONSTRAINT [usex_fk_empr]
GO
--SqlScripter----[dbo].[usua_exte].[usex_fk_pers].sql
GO
ALTER TABLE [dbo].[usua_exte] WITH NOCHECK ADD CONSTRAINT [usex_fk_pers] FOREIGN KEY ([codi_pers])
REFERENCES [dbo].[personas] ([codi_pers])
GO
ALTER TABLE [dbo].[usua_exte] WITH CHECK CHECK CONSTRAINT [usex_fk_pers]
GO
--SqlScripter----[dbo].[usua_sist].[usua_fk_ceco].sql
GO
ALTER TABLE [dbo].[usua_sist] WITH NOCHECK ADD CONSTRAINT [usua_fk_ceco] FOREIGN KEY ([codi_empr], [codi_ceco])
REFERENCES [dbo].[cent_cost] ([codi_empr], [codi_ceco])
GO
ALTER TABLE [dbo].[usua_sist] NOCHECK CONSTRAINT [usua_fk_ceco]
GO
--SqlScripter----[dbo].[usua_sist].[usua_fk_pers].sql
GO
ALTER TABLE [dbo].[usua_sist] WITH NOCHECK ADD CONSTRAINT [usua_fk_pers] FOREIGN KEY ([codi_pers])
REFERENCES [dbo].[personas] ([codi_pers])
GO
ALTER TABLE [dbo].[usua_sist] WITH CHECK CHECK CONSTRAINT [usua_fk_pers]
GO
--SqlScripter----[dbo].[valo_cage].[vacg_fk_cage_1].sql
GO
ALTER TABLE [dbo].[valo_cage] WITH NOCHECK ADD CONSTRAINT [vacg_fk_cage_1] FOREIGN KEY ([codi_cage])
REFERENCES [dbo].[cara_gene] ([codi_cage])
GO
ALTER TABLE [dbo].[valo_cage] WITH CHECK CHECK CONSTRAINT [vacg_fk_cage_1]