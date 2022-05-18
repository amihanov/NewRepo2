
GO
--SqlScripter----[dbo].[DF__bel_envi___hacer__0797D755].sql
GO
ALTER TABLE [dbo].[bel_envi_pdf] ADD CONSTRAINT [DF__bel_envi___hacer__0797D755] DEFAULT ('S') FOR [hacer_envi]
GO
--SqlScripter----[dbo].[DF__bel_unid___TIPO___2799C73C].sql
GO
ALTER TABLE [dbo].[bel_unid_cont] ADD CONSTRAINT [DF__bel_unid___TIPO___2799C73C] DEFAULT ('0') FOR [TIPO_ORIG]
GO
--SqlScripter----[dbo].[DF__CARA_PEEM__codi___50679DFC].sql
GO
ALTER TABLE [dbo].[CARA_PEEM] ADD CONSTRAINT [DF__CARA_PEEM__codi___50679DFC] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__cara_pers__codi___515BC235].sql
GO
ALTER TABLE [dbo].[cara_pers] ADD CONSTRAINT [DF__cara_pers__codi___515BC235] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DBN_LOG_5__CODI___22A0D34C].sql
GO
ALTER TABLE [dbo].[DBN_LOG_50] ADD CONSTRAINT [DF__DBN_LOG_5__CODI___22A0D34C] DEFAULT ('PROD_0000') FOR [CODI_EMEX]
GO
--SqlScripter----[dbo].[DF__DBN_MONI___MOPR___1BF3D5BD].sql
GO
ALTER TABLE [dbo].[DBN_MONI_PROC] ADD CONSTRAINT [DF__DBN_MONI___MOPR___1BF3D5BD] DEFAULT (CONVERT([varchar](20),getdate(),(120))) FOR [MOPR_INIC_PK]
GO
--SqlScripter----[dbo].[DF__DBN_MONI___MOPR___1CE7F9F6].sql
GO
ALTER TABLE [dbo].[DBN_MONI_PROC] ADD CONSTRAINT [DF__DBN_MONI___MOPR___1CE7F9F6] DEFAULT ('ON') FOR [MOPR_SEMA_ESTA]
GO
--SqlScripter----[dbo].[DF__DBN_PARA___CODI___1A0B8D4B].sql
GO
ALTER TABLE [dbo].[DBN_PARA_SERV] ADD CONSTRAINT [DF__DBN_PARA___CODI___1A0B8D4B] DEFAULT ('PROD_0000') FOR [CODI_EMEX]
GO
--SqlScripter----[dbo].[DF__DBN_SERV___DEBU___0F8DFED8].sql
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] ADD CONSTRAINT [DF__DBN_SERV___DEBU___0F8DFED8] DEFAULT ('N') FOR [DEBU_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERV___ESTA___0DA5B666].sql
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] ADD CONSTRAINT [DF__DBN_SERV___ESTA___0DA5B666] DEFAULT ('OFF') FOR [ESTA_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERV___HVID___10822311].sql
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] ADD CONSTRAINT [DF__DBN_SERV___HVID___10822311] DEFAULT (48) FOR [HVID_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERV___MODO___1176474A].sql
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] ADD CONSTRAINT [DF__DBN_SERV___MODO___1176474A] DEFAULT ('R') FOR [MODO_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERV___SLEE___0E99DA9F].sql
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] ADD CONSTRAINT [DF__DBN_SERV___SLEE___0E99DA9F] DEFAULT (10) FOR [SLEE_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERVI__AUTO___07ECDD10].sql
GO
ALTER TABLE [dbo].[DBN_SERVICIO] ADD CONSTRAINT [DF__DBN_SERVI__AUTO___07ECDD10] DEFAULT ('N') FOR [AUTO_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERVI__DELA___08E10149].sql
GO
ALTER TABLE [dbo].[DBN_SERVICIO] ADD CONSTRAINT [DF__DBN_SERVI__DELA___08E10149] DEFAULT (5) FOR [DELA_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERVI__MTRY___09D52582].sql
GO
ALTER TABLE [dbo].[DBN_SERVICIO] ADD CONSTRAINT [DF__DBN_SERVI__MTRY___09D52582] DEFAULT (20) FOR [MTRY_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERVI__SERV___0AC949BB].sql
GO
ALTER TABLE [dbo].[DBN_SERVICIO] ADD CONSTRAINT [DF__DBN_SERVI__SERV___0AC949BB] DEFAULT ('N') FOR [SERV_ENAB]
GO
--SqlScripter----[dbo].[DF__DBN_TRAZA__CODI___398438A4].sql
GO
ALTER TABLE [dbo].[DBN_TRAZA_DOCU] ADD CONSTRAINT [DF__DBN_TRAZA__CODI___398438A4] DEFAULT ('PROD_0000') FOR [CODI_EMEX]
GO
--SqlScripter----[dbo].[DF__DBN_TRAZA__FECH___3890146B].sql
GO
ALTER TABLE [dbo].[DBN_TRAZA_DOCU] ADD CONSTRAINT [DF__DBN_TRAZA__FECH___3890146B] DEFAULT (CONVERT([varchar](100),getdate(),(121))) FOR [FECH_ESTA]
GO
--SqlScripter----[dbo].[DF__DBQ_ARCH__CONT_P__30EEF2A3].sql
GO
ALTER TABLE [dbo].[DBQ_ARCH] ADD CONSTRAINT [DF__DBQ_ARCH__CONT_P__30EEF2A3] DEFAULT (0) FOR [CONT_PROC_ARCH]
GO
--SqlScripter----[dbo].[DF__DBQ_ARCH__CTRL_A__2FFACE6A].sql
GO
ALTER TABLE [dbo].[DBQ_ARCH] ADD CONSTRAINT [DF__DBQ_ARCH__CTRL_A__2FFACE6A] DEFAULT ('N') FOR [CTRL_ARCH]
GO
--SqlScripter----[dbo].[DF__DBQ_ARCH__TIPO_R__3E73D64A].sql
GO
ALTER TABLE [dbo].[DBQ_ARCH] ADD CONSTRAINT [DF__DBQ_ARCH__TIPO_R__3E73D64A] DEFAULT ('T') FOR [TIPO_REGI]
GO
--SqlScripter----[dbo].[DF__DBQ_GRPO__CONT_P__2C2A3D86].sql
GO
ALTER TABLE [dbo].[DBQ_GRPO] ADD CONSTRAINT [DF__DBQ_GRPO__CONT_P__2C2A3D86] DEFAULT (0) FOR [CONT_PROC_GRPO]
GO
--SqlScripter----[dbo].[DF__DBQ_GRPO__NOMB_C__2D1E61BF].sql
GO
ALTER TABLE [dbo].[DBQ_GRPO] ADD CONSTRAINT [DF__DBQ_GRPO__NOMB_C__2D1E61BF] DEFAULT ('GRAL') FOR [NOMB_CANA]
GO
--SqlScripter----[dbo].[DF__DTE_ACCI___codi___5BD950A8].sql
GO
ALTER TABLE [dbo].[DTE_ACCI_DOCU] ADD CONSTRAINT [DF__DTE_ACCI___codi___5BD950A8] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTE_ACCI___NUIM___1CB22475].sql
GO
ALTER TABLE [dbo].[DTE_ACCI_DOCU] ADD CONSTRAINT [DF__DTE_ACCI___NUIM___1CB22475] DEFAULT (0) FOR [NUIM_SOLI]
GO
--SqlScripter----[dbo].[DF__DTE_ACCI___NUIM___1DA648AE].sql
GO
ALTER TABLE [dbo].[DTE_ACCI_DOCU] ADD CONSTRAINT [DF__DTE_ACCI___NUIM___1DA648AE] DEFAULT (0) FOR [NUIM_TERM]
GO
--SqlScripter----[dbo].[DF__DTE_ACCI___peri___7C46203A].sql
GO
ALTER TABLE [dbo].[DTE_ACCI_DOCU] ADD CONSTRAINT [DF__DTE_ACCI___peri___7C46203A] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_acec___codi___53440AA7].sql
GO
ALTER TABLE [dbo].[dte_acec_empr] ADD CONSTRAINT [DF__dte_acec___codi___53440AA7] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTE_ARCH___CODI___3E48EDC1].sql
GO
ALTER TABLE [dbo].[DTE_ARCH_ADJU] ADD CONSTRAINT [DF__DTE_ARCH___CODI___3E48EDC1] DEFAULT ('PROD_0000') FOR [CODI_EMEX]
GO
--SqlScripter----[dbo].[DF__dte_auto___codi___54382EE0].sql
GO
ALTER TABLE [dbo].[dte_auto_pers] ADD CONSTRAINT [DF__dte_auto___codi___54382EE0] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_cert___codi___48C67C34].sql
GO
ALTER TABLE [dbo].[dte_cert_pers] ADD CONSTRAINT [DF__dte_cert___codi___48C67C34] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTE_COMI___codi___5CCD74E1].sql
GO
ALTER TABLE [dbo].[DTE_COMI_CARG] ADD CONSTRAINT [DF__DTE_COMI___codi___5CCD74E1] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTE_COMI___peri___7D3A4473].sql
GO
ALTER TABLE [dbo].[DTE_COMI_CARG] ADD CONSTRAINT [DF__DTE_COMI___peri___7D3A4473] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_desc___codi___5DC1991A].sql
GO
ALTER TABLE [dbo].[dte_desc_item] ADD CONSTRAINT [DF__dte_desc___codi___5DC1991A] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_desc___peri___7E2E68AC].sql
GO
ALTER TABLE [dbo].[dte_desc_item] ADD CONSTRAINT [DF__dte_desc___peri___7E2E68AC] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_desc___codi___5EB5BD53].sql
GO
ALTER TABLE [dbo].[dte_desc_reca] ADD CONSTRAINT [DF__dte_desc___codi___5EB5BD53] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_desc___peri___7F228CE5].sql
GO
ALTER TABLE [dbo].[dte_desc_reca] ADD CONSTRAINT [DF__dte_desc___peri___7F228CE5] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_deta___codi___5FA9E18C].sql
GO
ALTER TABLE [dbo].[dte_deta_acec] ADD CONSTRAINT [DF__dte_deta___codi___5FA9E18C] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_deta___peri___0016B11E].sql
GO
ALTER TABLE [dbo].[dte_deta_acec] ADD CONSTRAINT [DF__dte_deta___peri___0016B11E] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_deta___codi___609E05C5].sql
GO
ALTER TABLE [dbo].[dte_deta_codi] ADD CONSTRAINT [DF__dte_deta___codi___609E05C5] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_deta___peri___010AD557].sql
GO
ALTER TABLE [dbo].[dte_deta_codi] ADD CONSTRAINT [DF__dte_deta___peri___010AD557] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_deta___codi___619229FE].sql
GO
ALTER TABLE [dbo].[dte_deta_prse] ADD CONSTRAINT [DF__dte_deta___codi___619229FE] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_deta___peri___01FEF990].sql
GO
ALTER TABLE [dbo].[dte_deta_prse] ADD CONSTRAINT [DF__dte_deta___peri___01FEF990] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__DTE_DOCU___codi___62864E37].sql
GO
ALTER TABLE [dbo].[DTE_DOCU_LOB] ADD CONSTRAINT [DF__DTE_DOCU___codi___62864E37] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTE_DOCU___peri___02F31DC9].sql
GO
ALTER TABLE [dbo].[DTE_DOCU_LOB] ADD CONSTRAINT [DF__DTE_DOCU___peri___02F31DC9] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_docu___codi___637A7270].sql
GO
ALTER TABLE [dbo].[dte_docu_refe] ADD CONSTRAINT [DF__dte_docu___codi___637A7270] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_docu___peri___03E74202].sql
GO
ALTER TABLE [dbo].[dte_docu_refe] ADD CONSTRAINT [DF__dte_docu___peri___03E74202] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_enca___codi___49BAA06D].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] ADD CONSTRAINT [DF__dte_enca___codi___49BAA06D] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_enca___hace___6F556E19].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] ADD CONSTRAINT [DF__dte_enca___hace___6F556E19] DEFAULT ('S') FOR [hace_envi]
GO
--SqlScripter----[dbo].[DF__dte_enca___lote___4AAEC4A6].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] ADD CONSTRAINT [DF__dte_enca___lote___4AAEC4A6] DEFAULT (CONVERT([varchar](7),getdate(),(120))) FOR [lote_docu]
GO
--SqlScripter----[dbo].[DF__dte_enca___peri___04DB663B].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] ADD CONSTRAINT [DF__dte_enca___peri___04DB663B] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_enca___hace___1A3FCC1E].sql
GO
ALTER TABLE [dbo].[dte_enca_docu_h] ADD CONSTRAINT [DF__dte_enca___hace___1A3FCC1E] DEFAULT ('S') FOR [hace_envi]
GO
--SqlScripter----[dbo].[DF__dte_envi___codi___646E96A9].sql
GO
ALTER TABLE [dbo].[dte_envi_docu] ADD CONSTRAINT [DF__dte_envi___codi___646E96A9] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_envi___peri___05CF8A74].sql
GO
ALTER TABLE [dbo].[dte_envi_docu] ADD CONSTRAINT [DF__dte_envi___peri___05CF8A74] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_envi___codi___6562BAE2].sql
GO
ALTER TABLE [dbo].[dte_envi_lob] ADD CONSTRAINT [DF__dte_envi___codi___6562BAE2] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_envi___peri___06C3AEAD].sql
GO
ALTER TABLE [dbo].[dte_envi_lob] ADD CONSTRAINT [DF__dte_envi___peri___06C3AEAD] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_envi___codi___46DE33C2].sql
GO
ALTER TABLE [dbo].[dte_envi_pdf] ADD CONSTRAINT [DF__dte_envi___codi___46DE33C2] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_envi___ESTA___47D257FB].sql
GO
ALTER TABLE [dbo].[dte_envi_pdf] ADD CONSTRAINT [DF__dte_envi___ESTA___47D257FB] DEFAULT ('ING') FOR [ESTA_MLPR]
GO
--SqlScripter----[dbo].[DF__dte_envi___hace___13098A01].sql
GO
ALTER TABLE [dbo].[dte_envi_pdf] ADD CONSTRAINT [DF__dte_envi___hace___13098A01] DEFAULT ('S') FOR [hace_envi]
GO
--SqlScripter----[dbo].[DF__dte_envi___peri___07B7D2E6].sql
GO
ALTER TABLE [dbo].[dte_envi_pdf] ADD CONSTRAINT [DF__dte_envi___peri___07B7D2E6] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_esta___codi___552C5319].sql
GO
ALTER TABLE [dbo].[dte_esta_cesi] ADD CONSTRAINT [DF__dte_esta___codi___552C5319] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_esta___mens___3C0B9F94].sql
GO
ALTER TABLE [dbo].[dte_esta_cesi] ADD CONSTRAINT [DF__dte_esta___mens___3C0B9F94] DEFAULT ('N') FOR [mens_esci]
GO
--SqlScripter----[dbo].[DF__dte_esta___nume___3CFFC3CD].sql
GO
ALTER TABLE [dbo].[dte_esta_cesi] ADD CONSTRAINT [DF__dte_esta___nume___3CFFC3CD] DEFAULT (0) FOR [nume_envi]
GO
--SqlScripter----[dbo].[DF__dte_esta___codi___56207752].sql
GO
ALTER TABLE [dbo].[dte_esta_docu] ADD CONSTRAINT [DF__dte_esta___codi___56207752] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_esta___indi___3D7FB211].sql
GO
ALTER TABLE [dbo].[dte_esta_docu] ADD CONSTRAINT [DF__dte_esta___indi___3D7FB211] DEFAULT ('N') FOR [indi_clie]
GO
--SqlScripter----[dbo].[DF__dte_esta___codi___57149B8B].sql
GO
ALTER TABLE [dbo].[dte_esta_envi] ADD CONSTRAINT [DF__dte_esta___codi___57149B8B] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_foli___codi___6656DF1B].sql
GO
ALTER TABLE [dbo].[dte_foli_clie] ADD CONSTRAINT [DF__dte_foli___codi___6656DF1B] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_foli___peri___08ABF71F].sql
GO
ALTER TABLE [dbo].[dte_foli_clie] ADD CONSTRAINT [DF__dte_foli___peri___08ABF71F] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__DTE_FORMA__CODI___4C02DB92].sql
GO
ALTER TABLE [dbo].[DTE_FORMATOS] ADD CONSTRAINT [DF__DTE_FORMA__CODI___4C02DB92] DEFAULT ('PROD_0000') FOR [CODI_EMEX]
GO
--SqlScripter----[dbo].[DF__DTE_FORMA__TIPO___4CF6FFCB].sql
GO
ALTER TABLE [dbo].[DTE_FORMATOS] ADD CONSTRAINT [DF__DTE_FORMA__TIPO___4CF6FFCB] DEFAULT ('XSLT') FOR [TIPO_PLAN]
GO
--SqlScripter----[dbo].[DF__dte_proc___codi___6F170DA5].sql
GO
ALTER TABLE [dbo].[dte_proc_evnt] ADD CONSTRAINT [DF__dte_proc___codi___6F170DA5] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_proc___cont___70FF5617].sql
GO
ALTER TABLE [dbo].[dte_proc_evnt] ADD CONSTRAINT [DF__dte_proc___cont___70FF5617] DEFAULT (0) FOR [cont_proc_evnt]
GO
--SqlScripter----[dbo].[DF__dte_proc___fech___6E22E96C].sql
GO
ALTER TABLE [dbo].[dte_proc_evnt] ADD CONSTRAINT [DF__dte_proc___fech___6E22E96C] DEFAULT (getdate()) FOR [fech_evnt]
GO
--SqlScripter----[dbo].[DF__dte_proc___fech___700B31DE].sql
GO
ALTER TABLE [dbo].[dte_proc_evnt] ADD CONSTRAINT [DF__dte_proc___fech___700B31DE] DEFAULT (getdate()) FOR [fech_proc_evnt]
GO
--SqlScripter----[dbo].[DF__dte_rang___codi___5808BFC4].sql
GO
ALTER TABLE [dbo].[dte_rang_foli] ADD CONSTRAINT [DF__dte_rang___codi___5808BFC4] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_reca___codi___674B0354].sql
GO
ALTER TABLE [dbo].[dte_reca_item] ADD CONSTRAINT [DF__dte_reca___codi___674B0354] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_reca___peri___09A01B58].sql
GO
ALTER TABLE [dbo].[dte_reca_item] ADD CONSTRAINT [DF__dte_reca___peri___09A01B58] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_suca___codi___683F278D].sql
GO
ALTER TABLE [dbo].[dte_suca_item] ADD CONSTRAINT [DF__dte_suca___codi___683F278D] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_suca___peri___0A943F91].sql
GO
ALTER TABLE [dbo].[dte_suca_item] ADD CONSTRAINT [DF__dte_suca___peri___0A943F91] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__DTE_SUMA___codi___69334BC6].sql
GO
ALTER TABLE [dbo].[DTE_SUMA_IMOM] ADD CONSTRAINT [DF__DTE_SUMA___codi___69334BC6] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTE_SUMA___peri___0B8863CA].sql
GO
ALTER TABLE [dbo].[DTE_SUMA_IMOM] ADD CONSTRAINT [DF__DTE_SUMA___peri___0B8863CA] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_suma___codi___6A276FFF].sql
GO
ALTER TABLE [dbo].[dte_suma_impu] ADD CONSTRAINT [DF__dte_suma___codi___6A276FFF] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_suma___peri___0C7C8803].sql
GO
ALTER TABLE [dbo].[dte_suma_impu] ADD CONSTRAINT [DF__dte_suma___peri___0C7C8803] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_tido___codi___6B1B9438].sql
GO
ALTER TABLE [dbo].[dte_tido_envi] ADD CONSTRAINT [DF__dte_tido___codi___6B1B9438] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_tido___peri___0D70AC3C].sql
GO
ALTER TABLE [dbo].[dte_tido_envi] ADD CONSTRAINT [DF__dte_tido___peri___0D70AC3C] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_tipo___codi___6C0FB871].sql
GO
ALTER TABLE [dbo].[dte_tipo_bult] ADD CONSTRAINT [DF__dte_tipo___codi___6C0FB871] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_tipo___peri___0E64D075].sql
GO
ALTER TABLE [dbo].[dte_tipo_bult] ADD CONSTRAINT [DF__dte_tipo___peri___0E64D075] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_tipo___codi___58FCE3FD].sql
GO
ALTER TABLE [dbo].[dte_tipo_docu] ADD CONSTRAINT [DF__dte_tipo___codi___58FCE3FD] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTE_TIPO___indi___27A4B434].sql
GO
ALTER TABLE [dbo].[dte_tipo_docu] ADD CONSTRAINT [DF__DTE_TIPO___indi___27A4B434] DEFAULT ('N') FOR [indi_libr]
GO
--SqlScripter----[dbo].[DF__dto_desc___codi___6D03DCAA].sql
GO
ALTER TABLE [dbo].[dto_desc_item_p] ADD CONSTRAINT [DF__dto_desc___codi___6D03DCAA] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_desc___peri___0F58F4AE].sql
GO
ALTER TABLE [dbo].[dto_desc_item_p] ADD CONSTRAINT [DF__dto_desc___peri___0F58F4AE] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_desc___codi___6DF800E3].sql
GO
ALTER TABLE [dbo].[dto_desc_reca_p] ADD CONSTRAINT [DF__dto_desc___codi___6DF800E3] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_desc___peri___104D18E7].sql
GO
ALTER TABLE [dbo].[dto_desc_reca_p] ADD CONSTRAINT [DF__dto_desc___peri___104D18E7] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_deta___codi___6EEC251C].sql
GO
ALTER TABLE [dbo].[dto_deta_acec_p] ADD CONSTRAINT [DF__dto_deta___codi___6EEC251C] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_deta___peri___11413D20].sql
GO
ALTER TABLE [dbo].[dto_deta_acec_p] ADD CONSTRAINT [DF__dto_deta___peri___11413D20] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_deta___codi___6FE04955].sql
GO
ALTER TABLE [dbo].[dto_deta_codi_p] ADD CONSTRAINT [DF__dto_deta___codi___6FE04955] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_deta___peri___12356159].sql
GO
ALTER TABLE [dbo].[dto_deta_codi_p] ADD CONSTRAINT [DF__dto_deta___peri___12356159] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_deta___codi___70D46D8E].sql
GO
ALTER TABLE [dbo].[dto_deta_prse_p] ADD CONSTRAINT [DF__dto_deta___codi___70D46D8E] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_deta___peri___13298592].sql
GO
ALTER TABLE [dbo].[dto_deta_prse_p] ADD CONSTRAINT [DF__dto_deta___peri___13298592] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_docu___codi___71C891C7].sql
GO
ALTER TABLE [dbo].[dto_docu_lob] ADD CONSTRAINT [DF__dto_docu___codi___71C891C7] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_docu___peri___141DA9CB].sql
GO
ALTER TABLE [dbo].[dto_docu_lob] ADD CONSTRAINT [DF__dto_docu___peri___141DA9CB] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_docu___codi___72BCB600].sql
GO
ALTER TABLE [dbo].[dto_docu_refe_p] ADD CONSTRAINT [DF__dto_docu___codi___72BCB600] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_docu___peri___1511CE04].sql
GO
ALTER TABLE [dbo].[dto_docu_refe_p] ADD CONSTRAINT [DF__dto_docu___peri___1511CE04] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_enca___codi___4E7F558A].sql
GO
ALTER TABLE [dbo].[dto_enca_docu_p] ADD CONSTRAINT [DF__dto_enca___codi___4E7F558A] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTO_ENCA___INDI___3F073C79].sql
GO
ALTER TABLE [dbo].[dto_enca_docu_p] ADD CONSTRAINT [DF__DTO_ENCA___INDI___3F073C79] DEFAULT ('S') FOR [INDI_CONTA]
GO
--SqlScripter----[dbo].[DF__dto_enca___peri___1605F23D].sql
GO
ALTER TABLE [dbo].[dto_enca_docu_p] ADD CONSTRAINT [DF__dto_enca___peri___1605F23D] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_reca___codi___73B0DA39].sql
GO
ALTER TABLE [dbo].[dto_reca_item_p] ADD CONSTRAINT [DF__dto_reca___codi___73B0DA39] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_reca___peri___16FA1676].sql
GO
ALTER TABLE [dbo].[dto_reca_item_p] ADD CONSTRAINT [DF__dto_reca___peri___16FA1676] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_rece___codi___4D8B3151].sql
GO
ALTER TABLE [dbo].[dto_rece_docu] ADD CONSTRAINT [DF__dto_rece___codi___4D8B3151] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_rece___peri___17EE3AAF].sql
GO
ALTER TABLE [dbo].[dto_rece_docu] ADD CONSTRAINT [DF__dto_rece___peri___17EE3AAF] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_rece___codi___74A4FE72].sql
GO
ALTER TABLE [dbo].[dto_rece_lob] ADD CONSTRAINT [DF__dto_rece___codi___74A4FE72] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_rece___peri___18E25EE8].sql
GO
ALTER TABLE [dbo].[dto_rece_lob] ADD CONSTRAINT [DF__dto_rece___peri___18E25EE8] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_suca___codi___759922AB].sql
GO
ALTER TABLE [dbo].[dto_suca_item_p] ADD CONSTRAINT [DF__dto_suca___codi___759922AB] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_suca___peri___19D68321].sql
GO
ALTER TABLE [dbo].[dto_suca_item_p] ADD CONSTRAINT [DF__dto_suca___peri___19D68321] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_suce___codi___768D46E4].sql
GO
ALTER TABLE [dbo].[dto_suce_esap] ADD CONSTRAINT [DF__dto_suce___codi___768D46E4] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_suce___peri___1ACAA75A].sql
GO
ALTER TABLE [dbo].[dto_suce_esap] ADD CONSTRAINT [DF__dto_suce___peri___1ACAA75A] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_suma___codi___77816B1D].sql
GO
ALTER TABLE [dbo].[dto_suma_impu_p] ADD CONSTRAINT [DF__dto_suma___codi___77816B1D] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_suma___peri___1BBECB93].sql
GO
ALTER TABLE [dbo].[dto_suma_impu_p] ADD CONSTRAINT [DF__dto_suma___peri___1BBECB93] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_tido___codi___78758F56].sql
GO
ALTER TABLE [dbo].[dto_tido_rece] ADD CONSTRAINT [DF__dto_tido___codi___78758F56] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_tido___peri___1CB2EFCC].sql
GO
ALTER TABLE [dbo].[dto_tido_rece] ADD CONSTRAINT [DF__dto_tido___peri___1CB2EFCC] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),0)) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__empr__codi_emex__4C970D18].sql
GO
ALTER TABLE [dbo].[empr] ADD CONSTRAINT [DF__empr__codi_emex__4C970D18] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__mtod__mtod_errno__0D2FE9C3].sql
GO
ALTER TABLE [dbo].[mtod] ADD CONSTRAINT [DF__mtod__mtod_errno__0D2FE9C3] DEFAULT (0) FOR [mtod_errno]
GO
--SqlScripter----[dbo].[DF__ofic_empr__codi___7B51FC01].sql
GO
ALTER TABLE [dbo].[ofic_empr] ADD CONSTRAINT [DF__ofic_empr__codi___7B51FC01] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__para_empr__codi___59F10836].sql
GO
ALTER TABLE [dbo].[para_empr] ADD CONSTRAINT [DF__para_empr__codi___59F10836] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__para_pers__codi___524FE66E].sql
GO
ALTER TABLE [dbo].[para_pers] ADD CONSTRAINT [DF__para_pers__codi___524FE66E] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__PERS_PUBL__PERS___4401C717].sql
GO
ALTER TABLE [dbo].[PERS_PUBL] ADD CONSTRAINT [DF__PERS_PUBL__PERS___4401C717] DEFAULT ('CL') FOR [PERS_PAIS]
GO
--SqlScripter----[dbo].[DF__PERS_PUBL__PERS___2AEC008A].sql
GO
ALTER TABLE [dbo].[PERS_PUBL_TEMP] ADD CONSTRAINT [DF__PERS_PUBL__PERS___2AEC008A] DEFAULT ('CL') FOR [PERS_PAIS]
GO
--SqlScripter----[dbo].[DF__personas__codi_e__4BA2E8DF].sql
GO
ALTER TABLE [dbo].[personas] ADD CONSTRAINT [DF__personas__codi_e__4BA2E8DF] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__PROC_LOGS__codi___5AE52C6F].sql
GO
ALTER TABLE [dbo].[PROC_LOGS] ADD CONSTRAINT [DF__PROC_LOGS__codi___5AE52C6F] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__qse_docu___CANT___208380B0].sql
GO
ALTER TABLE [dbo].[qse_docu_serv] ADD CONSTRAINT [DF__qse_docu___CANT___208380B0] DEFAULT (0) FOR [CANT_PROC]
GO
--SqlScripter----[dbo].[DF__qse_docu___CODI___1E9B383E].sql
GO
ALTER TABLE [dbo].[qse_docu_serv] ADD CONSTRAINT [DF__qse_docu___CODI___1E9B383E] DEFAULT ('PROD_0000') FOR [CODI_EMEX]
GO
--SqlScripter----[dbo].[DF__qse_docu___ESTA___1F8F5C77].sql
GO
ALTER TABLE [dbo].[qse_docu_serv] ADD CONSTRAINT [DF__qse_docu___ESTA___1F8F5C77] DEFAULT ('ING') FOR [ESTA_PROC]
GO
--SqlScripter----[dbo].[DF__sys_alar__sqld_a__74FA042D].sql
GO
ALTER TABLE [dbo].[sys_alar] ADD CONSTRAINT [DF__sys_alar__sqld_a__74FA042D] DEFAULT ('delete from sys_alin where codi_alar = ''alarma'' and codi_usua=''usuario'' and codi_emex=''holding'' and codi_empr=1010') FOR [sqld_alar]
GO
--SqlScripter----[dbo].[DF__sys_domai__Mante__7D2F577B].sql
GO
ALTER TABLE [dbo].[sys_domain] ADD CONSTRAINT [DF__sys_domai__Mante__7D2F577B] DEFAULT (0) FOR [Mantenedor]
GO
--SqlScripter----[dbo].[DF__usua_exte__codi___7969B38F].sql
GO
ALTER TABLE [dbo].[usua_exte] ADD CONSTRAINT [DF__usua_exte__codi___7969B38F] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__usua_sist__codi___7A5DD7C8].sql
GO
ALTER TABLE [dbo].[usua_sist] ADD CONSTRAINT [DF__usua_sist__codi___7A5DD7C8] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__usua_sist__usua___24C84789].sql
GO
ALTER TABLE [dbo].[usua_sist] ADD CONSTRAINT [DF__usua_sist__usua___24C84789] DEFAULT ('N') FOR [usua_filt]
GO
--SqlScripter----[dbo].[DF_version_fecha_ejecucion].sql
GO
ALTER TABLE [dbo].[version] ADD CONSTRAINT [DF_version_fecha_ejecucion] DEFAULT (getdate()) FOR [fecha_ejecucion]