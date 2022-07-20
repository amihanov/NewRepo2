
GO
--SqlScripter----[dbo].[DF__bel_envi___hacer__618671AF].sql
GO
ALTER TABLE [dbo].[bel_envi_pdf] ADD CONSTRAINT [DF__bel_envi___hacer__618671AF] DEFAULT ('S') FOR [hacer_envi]
GO
--SqlScripter----[dbo].[DF__bel_unid___TIPO___627A95E8].sql
GO
ALTER TABLE [dbo].[bel_unid_cont] ADD CONSTRAINT [DF__bel_unid___TIPO___627A95E8] DEFAULT ('0') FOR [TIPO_ORIG]
GO
--SqlScripter----[dbo].[DF__CARA_PEEM__codi___636EBA21].sql
GO
ALTER TABLE [dbo].[CARA_PEEM] ADD CONSTRAINT [DF__CARA_PEEM__codi___636EBA21] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__cara_pers__codi___6462DE5A].sql
GO
ALTER TABLE [dbo].[cara_pers] ADD CONSTRAINT [DF__cara_pers__codi___6462DE5A] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DBN_LOG_5__CODI___65570293].sql
GO
ALTER TABLE [dbo].[DBN_LOG_50] ADD CONSTRAINT [DF__DBN_LOG_5__CODI___65570293] DEFAULT ('PROD_0000') FOR [CODI_EMEX]
GO
--SqlScripter----[dbo].[DF__DBN_MONI___MOPR___664B26CC].sql
GO
ALTER TABLE [dbo].[DBN_MONI_PROC] ADD CONSTRAINT [DF__DBN_MONI___MOPR___664B26CC] DEFAULT (CONVERT([varchar](20),getdate(),(120))) FOR [MOPR_INIC_PK]
GO
--SqlScripter----[dbo].[DF__DBN_MONI___MOPR___673F4B05].sql
GO
ALTER TABLE [dbo].[DBN_MONI_PROC] ADD CONSTRAINT [DF__DBN_MONI___MOPR___673F4B05] DEFAULT ('ON') FOR [MOPR_SEMA_ESTA]
GO
--SqlScripter----[dbo].[DF__DBN_PARA___CODI___68336F3E].sql
GO
ALTER TABLE [dbo].[DBN_PARA_SERV] ADD CONSTRAINT [DF__DBN_PARA___CODI___68336F3E] DEFAULT ('PROD_0000') FOR [CODI_EMEX]
GO
--SqlScripter----[dbo].[DF__DBN_SERV___DEBU___6B0FDBE9].sql
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] ADD CONSTRAINT [DF__DBN_SERV___DEBU___6B0FDBE9] DEFAULT ('N') FOR [DEBU_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERV___ESTA___69279377].sql
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] ADD CONSTRAINT [DF__DBN_SERV___ESTA___69279377] DEFAULT ('OFF') FOR [ESTA_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERV___HVID___6C040022].sql
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] ADD CONSTRAINT [DF__DBN_SERV___HVID___6C040022] DEFAULT (48) FOR [HVID_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERV___MODO___6CF8245B].sql
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] ADD CONSTRAINT [DF__DBN_SERV___MODO___6CF8245B] DEFAULT ('R') FOR [MODO_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERV___SLEE___6A1BB7B0].sql
GO
ALTER TABLE [dbo].[DBN_SERV_SRVD] ADD CONSTRAINT [DF__DBN_SERV___SLEE___6A1BB7B0] DEFAULT (10) FOR [SLEE_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERVI__AUTO___18EBB532].sql
GO
ALTER TABLE [dbo].[DBN_SERVICIO] ADD CONSTRAINT [DF__DBN_SERVI__AUTO___18EBB532] DEFAULT ('N') FOR [AUTO_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERVI__DELA___19DFD96B].sql
GO
ALTER TABLE [dbo].[DBN_SERVICIO] ADD CONSTRAINT [DF__DBN_SERVI__DELA___19DFD96B] DEFAULT (5) FOR [DELA_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERVI__MTRY___1AD3FDA4].sql
GO
ALTER TABLE [dbo].[DBN_SERVICIO] ADD CONSTRAINT [DF__DBN_SERVI__MTRY___1AD3FDA4] DEFAULT (20) FOR [MTRY_SERV]
GO
--SqlScripter----[dbo].[DF__DBN_SERVI__SERV___1BC821DD].sql
GO
ALTER TABLE [dbo].[DBN_SERVICIO] ADD CONSTRAINT [DF__DBN_SERVI__SERV___1BC821DD] DEFAULT ('N') FOR [SERV_ENAB]
GO
--SqlScripter----[dbo].[DF__DBN_TRAZA__CODI___6EE06CCD].sql
GO
ALTER TABLE [dbo].[DBN_TRAZA_DOCU] ADD CONSTRAINT [DF__DBN_TRAZA__CODI___6EE06CCD] DEFAULT ('PROD_0000') FOR [CODI_EMEX]
GO
--SqlScripter----[dbo].[DF__DBN_TRAZA__FECH___6DEC4894].sql
GO
ALTER TABLE [dbo].[DBN_TRAZA_DOCU] ADD CONSTRAINT [DF__DBN_TRAZA__FECH___6DEC4894] DEFAULT (CONVERT([varchar](100),getdate(),(121))) FOR [FECH_ESTA]
GO
--SqlScripter----[dbo].[DF__DBQ_ARCH__CONT_P__70C8B53F].sql
GO
ALTER TABLE [dbo].[DBQ_ARCH] ADD CONSTRAINT [DF__DBQ_ARCH__CONT_P__70C8B53F] DEFAULT (0) FOR [CONT_PROC_ARCH]
GO
--SqlScripter----[dbo].[DF__DBQ_ARCH__CTRL_A__6FD49106].sql
GO
ALTER TABLE [dbo].[DBQ_ARCH] ADD CONSTRAINT [DF__DBQ_ARCH__CTRL_A__6FD49106] DEFAULT ('N') FOR [CTRL_ARCH]
GO
--SqlScripter----[dbo].[DF__DBQ_ARCH__TIPO_R__71BCD978].sql
GO
ALTER TABLE [dbo].[DBQ_ARCH] ADD CONSTRAINT [DF__DBQ_ARCH__TIPO_R__71BCD978] DEFAULT ('T') FOR [TIPO_REGI]
GO
--SqlScripter----[dbo].[DF__DBQ_GRPO__CONT_P__72B0FDB1].sql
GO
ALTER TABLE [dbo].[DBQ_GRPO] ADD CONSTRAINT [DF__DBQ_GRPO__CONT_P__72B0FDB1] DEFAULT (0) FOR [CONT_PROC_GRPO]
GO
--SqlScripter----[dbo].[DF__DBQ_GRPO__NOMB_C__73A521EA].sql
GO
ALTER TABLE [dbo].[DBQ_GRPO] ADD CONSTRAINT [DF__DBQ_GRPO__NOMB_C__73A521EA] DEFAULT ('GRAL') FOR [NOMB_CANA]
GO
--SqlScripter----[dbo].[DF__DTE_ACCI___codi___76818E95].sql
GO
ALTER TABLE [dbo].[DTE_ACCI_DOCU] ADD CONSTRAINT [DF__DTE_ACCI___codi___76818E95] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTE_ACCI___NUIM___74994623].sql
GO
ALTER TABLE [dbo].[DTE_ACCI_DOCU] ADD CONSTRAINT [DF__DTE_ACCI___NUIM___74994623] DEFAULT (0) FOR [NUIM_SOLI]
GO
--SqlScripter----[dbo].[DF__DTE_ACCI___NUIM___758D6A5C].sql
GO
ALTER TABLE [dbo].[DTE_ACCI_DOCU] ADD CONSTRAINT [DF__DTE_ACCI___NUIM___758D6A5C] DEFAULT (0) FOR [NUIM_TERM]
GO
--SqlScripter----[dbo].[DF__DTE_ACCI___peri___7775B2CE].sql
GO
ALTER TABLE [dbo].[DTE_ACCI_DOCU] ADD CONSTRAINT [DF__DTE_ACCI___peri___7775B2CE] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_acec___codi___32AB8735].sql
GO
ALTER TABLE [dbo].[dte_acec_empr] ADD CONSTRAINT [DF__dte_acec___codi___32AB8735] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTE_ARCH___CODI___7869D707].sql
GO
ALTER TABLE [dbo].[DTE_ARCH_ADJU] ADD CONSTRAINT [DF__DTE_ARCH___CODI___7869D707] DEFAULT ('PROD_0000') FOR [CODI_EMEX]
GO
--SqlScripter----[dbo].[DF__dte_auto___codi___795DFB40].sql
GO
ALTER TABLE [dbo].[dte_auto_pers] ADD CONSTRAINT [DF__dte_auto___codi___795DFB40] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_cert___codi___7A521F79].sql
GO
ALTER TABLE [dbo].[dte_cert_pers] ADD CONSTRAINT [DF__dte_cert___codi___7A521F79] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTE_COMI___codi___7B4643B2].sql
GO
ALTER TABLE [dbo].[DTE_COMI_CARG] ADD CONSTRAINT [DF__DTE_COMI___codi___7B4643B2] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTE_COMI___peri___7C3A67EB].sql
GO
ALTER TABLE [dbo].[DTE_COMI_CARG] ADD CONSTRAINT [DF__DTE_COMI___peri___7C3A67EB] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_desc___codi___7D2E8C24].sql
GO
ALTER TABLE [dbo].[dte_desc_item] ADD CONSTRAINT [DF__dte_desc___codi___7D2E8C24] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_desc___peri___7E22B05D].sql
GO
ALTER TABLE [dbo].[dte_desc_item] ADD CONSTRAINT [DF__dte_desc___peri___7E22B05D] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_desc___codi___7F16D496].sql
GO
ALTER TABLE [dbo].[dte_desc_reca] ADD CONSTRAINT [DF__dte_desc___codi___7F16D496] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_desc___peri___000AF8CF].sql
GO
ALTER TABLE [dbo].[dte_desc_reca] ADD CONSTRAINT [DF__dte_desc___peri___000AF8CF] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_deta___codi___00FF1D08].sql
GO
ALTER TABLE [dbo].[dte_deta_acec] ADD CONSTRAINT [DF__dte_deta___codi___00FF1D08] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_deta___peri___01F34141].sql
GO
ALTER TABLE [dbo].[dte_deta_acec] ADD CONSTRAINT [DF__dte_deta___peri___01F34141] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_deta___codi___02E7657A].sql
GO
ALTER TABLE [dbo].[dte_deta_codi] ADD CONSTRAINT [DF__dte_deta___codi___02E7657A] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_deta___peri___03DB89B3].sql
GO
ALTER TABLE [dbo].[dte_deta_codi] ADD CONSTRAINT [DF__dte_deta___peri___03DB89B3] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_deta___codi___04CFADEC].sql
GO
ALTER TABLE [dbo].[dte_deta_prse] ADD CONSTRAINT [DF__dte_deta___codi___04CFADEC] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_deta___peri___05C3D225].sql
GO
ALTER TABLE [dbo].[dte_deta_prse] ADD CONSTRAINT [DF__dte_deta___peri___05C3D225] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__DTE_DOCU___codi___06B7F65E].sql
GO
ALTER TABLE [dbo].[DTE_DOCU_LOB] ADD CONSTRAINT [DF__DTE_DOCU___codi___06B7F65E] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTE_DOCU___peri___07AC1A97].sql
GO
ALTER TABLE [dbo].[DTE_DOCU_LOB] ADD CONSTRAINT [DF__DTE_DOCU___peri___07AC1A97] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_docu___codi___08A03ED0].sql
GO
ALTER TABLE [dbo].[dte_docu_refe] ADD CONSTRAINT [DF__dte_docu___codi___08A03ED0] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_docu___peri___09946309].sql
GO
ALTER TABLE [dbo].[dte_docu_refe] ADD CONSTRAINT [DF__dte_docu___peri___09946309] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_enca___codi___0B7CAB7B].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] ADD CONSTRAINT [DF__dte_enca___codi___0B7CAB7B] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_enca___hace___0A888742].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] ADD CONSTRAINT [DF__dte_enca___hace___0A888742] DEFAULT ('S') FOR [hace_envi]
GO
--SqlScripter----[dbo].[DF__dte_enca___lote___0C70CFB4].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] ADD CONSTRAINT [DF__dte_enca___lote___0C70CFB4] DEFAULT (CONVERT([varchar](7),getdate(),(120))) FOR [lote_docu]
GO
--SqlScripter----[dbo].[DF__dte_enca___peri___0D64F3ED].sql
GO
ALTER TABLE [dbo].[dte_enca_docu] ADD CONSTRAINT [DF__dte_enca___peri___0D64F3ED] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_enca___hace___0E591826].sql
GO
ALTER TABLE [dbo].[dte_enca_docu_h] ADD CONSTRAINT [DF__dte_enca___hace___0E591826] DEFAULT ('S') FOR [hace_envi]
GO
--SqlScripter----[dbo].[DF__dte_envi___codi___0F4D3C5F].sql
GO
ALTER TABLE [dbo].[dte_envi_docu] ADD CONSTRAINT [DF__dte_envi___codi___0F4D3C5F] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_envi___peri___10416098].sql
GO
ALTER TABLE [dbo].[dte_envi_docu] ADD CONSTRAINT [DF__dte_envi___peri___10416098] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_envi___codi___113584D1].sql
GO
ALTER TABLE [dbo].[dte_envi_lob] ADD CONSTRAINT [DF__dte_envi___codi___113584D1] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_envi___peri___1229A90A].sql
GO
ALTER TABLE [dbo].[dte_envi_lob] ADD CONSTRAINT [DF__dte_envi___peri___1229A90A] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_envi___codi___1411F17C].sql
GO
ALTER TABLE [dbo].[dte_envi_pdf] ADD CONSTRAINT [DF__dte_envi___codi___1411F17C] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_envi___ESTA___150615B5].sql
GO
ALTER TABLE [dbo].[dte_envi_pdf] ADD CONSTRAINT [DF__dte_envi___ESTA___150615B5] DEFAULT ('ING') FOR [ESTA_MLPR]
GO
--SqlScripter----[dbo].[DF__dte_envi___hace___131DCD43].sql
GO
ALTER TABLE [dbo].[dte_envi_pdf] ADD CONSTRAINT [DF__dte_envi___hace___131DCD43] DEFAULT ('S') FOR [hace_envi]
GO
--SqlScripter----[dbo].[DF__dte_envi___peri___15FA39EE].sql
GO
ALTER TABLE [dbo].[dte_envi_pdf] ADD CONSTRAINT [DF__dte_envi___peri___15FA39EE] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_esta___codi___05A3D694].sql
GO
ALTER TABLE [dbo].[dte_esta_cesi] ADD CONSTRAINT [DF__dte_esta___codi___05A3D694] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_esta___mens___03BB8E22].sql
GO
ALTER TABLE [dbo].[dte_esta_cesi] ADD CONSTRAINT [DF__dte_esta___mens___03BB8E22] DEFAULT ('N') FOR [mens_esci]
GO
--SqlScripter----[dbo].[DF__dte_esta___nume___04AFB25B].sql
GO
ALTER TABLE [dbo].[dte_esta_cesi] ADD CONSTRAINT [DF__dte_esta___nume___04AFB25B] DEFAULT (0) FOR [nume_envi]
GO
--SqlScripter----[dbo].[DF__dte_esta___codi___0880433F].sql
GO
ALTER TABLE [dbo].[dte_esta_docu] ADD CONSTRAINT [DF__dte_esta___codi___0880433F] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_esta___indi___09746778].sql
GO
ALTER TABLE [dbo].[dte_esta_docu] ADD CONSTRAINT [DF__dte_esta___indi___09746778] DEFAULT ('N') FOR [indi_clie]
GO
--SqlScripter----[dbo].[DF__dte_esta___codi___0C50D423].sql
GO
ALTER TABLE [dbo].[dte_esta_envi] ADD CONSTRAINT [DF__dte_esta___codi___0C50D423] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_foli___codi___16EE5E27].sql
GO
ALTER TABLE [dbo].[dte_foli_clie] ADD CONSTRAINT [DF__dte_foli___codi___16EE5E27] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_foli___peri___17E28260].sql
GO
ALTER TABLE [dbo].[dte_foli_clie] ADD CONSTRAINT [DF__dte_foli___peri___17E28260] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__DTE_FORMA__CODI___18D6A699].sql
GO
ALTER TABLE [dbo].[DTE_FORMATOS] ADD CONSTRAINT [DF__DTE_FORMA__CODI___18D6A699] DEFAULT ('PROD_0000') FOR [CODI_EMEX]
GO
--SqlScripter----[dbo].[DF__DTE_FORMA__TIPO___19CACAD2].sql
GO
ALTER TABLE [dbo].[DTE_FORMATOS] ADD CONSTRAINT [DF__DTE_FORMA__TIPO___19CACAD2] DEFAULT ('XSLT') FOR [TIPO_PLAN]
GO
--SqlScripter----[dbo].[DF__dte_proc___codi___1BB31344].sql
GO
ALTER TABLE [dbo].[dte_proc_evnt] ADD CONSTRAINT [DF__dte_proc___codi___1BB31344] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_proc___cont___1D9B5BB6].sql
GO
ALTER TABLE [dbo].[dte_proc_evnt] ADD CONSTRAINT [DF__dte_proc___cont___1D9B5BB6] DEFAULT (0) FOR [cont_proc_evnt]
GO
--SqlScripter----[dbo].[DF__dte_proc___fech___1ABEEF0B].sql
GO
ALTER TABLE [dbo].[dte_proc_evnt] ADD CONSTRAINT [DF__dte_proc___fech___1ABEEF0B] DEFAULT (getdate()) FOR [fech_evnt]
GO
--SqlScripter----[dbo].[DF__dte_proc___fech___1CA7377D].sql
GO
ALTER TABLE [dbo].[dte_proc_evnt] ADD CONSTRAINT [DF__dte_proc___fech___1CA7377D] DEFAULT (getdate()) FOR [fech_proc_evnt]
GO
--SqlScripter----[dbo].[DF__dte_rang___codi___1E8F7FEF].sql
GO
ALTER TABLE [dbo].[dte_rang_foli] ADD CONSTRAINT [DF__dte_rang___codi___1E8F7FEF] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_reca___codi___1F83A428].sql
GO
ALTER TABLE [dbo].[dte_reca_item] ADD CONSTRAINT [DF__dte_reca___codi___1F83A428] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_reca___peri___2077C861].sql
GO
ALTER TABLE [dbo].[dte_reca_item] ADD CONSTRAINT [DF__dte_reca___peri___2077C861] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_suca___codi___216BEC9A].sql
GO
ALTER TABLE [dbo].[dte_suca_item] ADD CONSTRAINT [DF__dte_suca___codi___216BEC9A] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_suca___peri___226010D3].sql
GO
ALTER TABLE [dbo].[dte_suca_item] ADD CONSTRAINT [DF__dte_suca___peri___226010D3] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__DTE_SUMA___codi___2354350C].sql
GO
ALTER TABLE [dbo].[DTE_SUMA_IMOM] ADD CONSTRAINT [DF__DTE_SUMA___codi___2354350C] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__DTE_SUMA___peri___24485945].sql
GO
ALTER TABLE [dbo].[DTE_SUMA_IMOM] ADD CONSTRAINT [DF__DTE_SUMA___peri___24485945] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_suma___codi___253C7D7E].sql
GO
ALTER TABLE [dbo].[dte_suma_impu] ADD CONSTRAINT [DF__dte_suma___codi___253C7D7E] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_suma___peri___2630A1B7].sql
GO
ALTER TABLE [dbo].[dte_suma_impu] ADD CONSTRAINT [DF__dte_suma___peri___2630A1B7] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_tido___codi___2724C5F0].sql
GO
ALTER TABLE [dbo].[dte_tido_envi] ADD CONSTRAINT [DF__dte_tido___codi___2724C5F0] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_tido___peri___2818EA29].sql
GO
ALTER TABLE [dbo].[dte_tido_envi] ADD CONSTRAINT [DF__dte_tido___peri___2818EA29] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_tipo___codi___290D0E62].sql
GO
ALTER TABLE [dbo].[dte_tipo_bult] ADD CONSTRAINT [DF__dte_tipo___codi___290D0E62] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_tipo___peri___2A01329B].sql
GO
ALTER TABLE [dbo].[dte_tipo_bult] ADD CONSTRAINT [DF__dte_tipo___peri___2A01329B] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dte_tipo___codi___3B0BC30C].sql
GO
ALTER TABLE [dbo].[dte_tipo_docu] ADD CONSTRAINT [DF__dte_tipo___codi___3B0BC30C] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dte_tipo___indi___3A179ED3].sql
GO
ALTER TABLE [dbo].[dte_tipo_docu] ADD CONSTRAINT [DF__dte_tipo___indi___3A179ED3] DEFAULT ('N') FOR [indi_libr]
GO
--SqlScripter----[dbo].[DF__dto_desc___codi___2AF556D4].sql
GO
ALTER TABLE [dbo].[dto_desc_item_p] ADD CONSTRAINT [DF__dto_desc___codi___2AF556D4] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_desc___peri___2BE97B0D].sql
GO
ALTER TABLE [dbo].[dto_desc_item_p] ADD CONSTRAINT [DF__dto_desc___peri___2BE97B0D] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_desc___codi___2CDD9F46].sql
GO
ALTER TABLE [dbo].[dto_desc_reca_p] ADD CONSTRAINT [DF__dto_desc___codi___2CDD9F46] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_desc___peri___2DD1C37F].sql
GO
ALTER TABLE [dbo].[dto_desc_reca_p] ADD CONSTRAINT [DF__dto_desc___peri___2DD1C37F] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_deta___codi___2EC5E7B8].sql
GO
ALTER TABLE [dbo].[dto_deta_acec_p] ADD CONSTRAINT [DF__dto_deta___codi___2EC5E7B8] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_deta___peri___2FBA0BF1].sql
GO
ALTER TABLE [dbo].[dto_deta_acec_p] ADD CONSTRAINT [DF__dto_deta___peri___2FBA0BF1] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_deta___codi___30AE302A].sql
GO
ALTER TABLE [dbo].[dto_deta_codi_p] ADD CONSTRAINT [DF__dto_deta___codi___30AE302A] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_deta___peri___31A25463].sql
GO
ALTER TABLE [dbo].[dto_deta_codi_p] ADD CONSTRAINT [DF__dto_deta___peri___31A25463] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_deta___codi___3296789C].sql
GO
ALTER TABLE [dbo].[dto_deta_prse_p] ADD CONSTRAINT [DF__dto_deta___codi___3296789C] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_deta___peri___338A9CD5].sql
GO
ALTER TABLE [dbo].[dto_deta_prse_p] ADD CONSTRAINT [DF__dto_deta___peri___338A9CD5] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_docu___codi___347EC10E].sql
GO
ALTER TABLE [dbo].[dto_docu_lob] ADD CONSTRAINT [DF__dto_docu___codi___347EC10E] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_docu___peri___3572E547].sql
GO
ALTER TABLE [dbo].[dto_docu_lob] ADD CONSTRAINT [DF__dto_docu___peri___3572E547] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_docu___codi___36670980].sql
GO
ALTER TABLE [dbo].[dto_docu_refe_p] ADD CONSTRAINT [DF__dto_docu___codi___36670980] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_docu___peri___375B2DB9].sql
GO
ALTER TABLE [dbo].[dto_docu_refe_p] ADD CONSTRAINT [DF__dto_docu___peri___375B2DB9] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_enca___codi___3943762B].sql
GO
ALTER TABLE [dbo].[dto_enca_docu_p] ADD CONSTRAINT [DF__dto_enca___codi___3943762B] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_enca___INDI___384F51F2].sql
GO
ALTER TABLE [dbo].[dto_enca_docu_p] ADD CONSTRAINT [DF__dto_enca___INDI___384F51F2] DEFAULT ('S') FOR [INDI_CONTA]
GO
--SqlScripter----[dbo].[DF__dto_enca___peri___3A379A64].sql
GO
ALTER TABLE [dbo].[dto_enca_docu_p] ADD CONSTRAINT [DF__dto_enca___peri___3A379A64] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_reca___codi___3B2BBE9D].sql
GO
ALTER TABLE [dbo].[dto_reca_item_p] ADD CONSTRAINT [DF__dto_reca___codi___3B2BBE9D] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_reca___peri___3C1FE2D6].sql
GO
ALTER TABLE [dbo].[dto_reca_item_p] ADD CONSTRAINT [DF__dto_reca___peri___3C1FE2D6] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_rece___codi___3D14070F].sql
GO
ALTER TABLE [dbo].[dto_rece_docu] ADD CONSTRAINT [DF__dto_rece___codi___3D14070F] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_rece___peri___3E082B48].sql
GO
ALTER TABLE [dbo].[dto_rece_docu] ADD CONSTRAINT [DF__dto_rece___peri___3E082B48] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_rece___codi___3EFC4F81].sql
GO
ALTER TABLE [dbo].[dto_rece_lob] ADD CONSTRAINT [DF__dto_rece___codi___3EFC4F81] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_rece___peri___3FF073BA].sql
GO
ALTER TABLE [dbo].[dto_rece_lob] ADD CONSTRAINT [DF__dto_rece___peri___3FF073BA] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_suca___codi___40E497F3].sql
GO
ALTER TABLE [dbo].[dto_suca_item_p] ADD CONSTRAINT [DF__dto_suca___codi___40E497F3] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_suca___peri___41D8BC2C].sql
GO
ALTER TABLE [dbo].[dto_suca_item_p] ADD CONSTRAINT [DF__dto_suca___peri___41D8BC2C] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_suce___codi___42CCE065].sql
GO
ALTER TABLE [dbo].[dto_suce_esap] ADD CONSTRAINT [DF__dto_suce___codi___42CCE065] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_suce___peri___43C1049E].sql
GO
ALTER TABLE [dbo].[dto_suce_esap] ADD CONSTRAINT [DF__dto_suce___peri___43C1049E] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_suma___codi___44B528D7].sql
GO
ALTER TABLE [dbo].[dto_suma_impu_p] ADD CONSTRAINT [DF__dto_suma___codi___44B528D7] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_suma___peri___45A94D10].sql
GO
ALTER TABLE [dbo].[dto_suma_impu_p] ADD CONSTRAINT [DF__dto_suma___peri___45A94D10] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__dto_tido___codi___469D7149].sql
GO
ALTER TABLE [dbo].[dto_tido_rece] ADD CONSTRAINT [DF__dto_tido___codi___469D7149] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__dto_tido___peri___47919582].sql
GO
ALTER TABLE [dbo].[dto_tido_rece] ADD CONSTRAINT [DF__dto_tido___peri___47919582] DEFAULT (CONVERT([int],CONVERT([varchar](6),getdate(),(112)),(0))) FOR [peri_part]
GO
--SqlScripter----[dbo].[DF__empr__codi_emex__1E3A7A34].sql
GO
ALTER TABLE [dbo].[empr] ADD CONSTRAINT [DF__empr__codi_emex__1E3A7A34] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__mtod__mtod_errno__0D2FE9C3].sql
GO
ALTER TABLE [dbo].[mtod] ADD CONSTRAINT [DF__mtod__mtod_errno__0D2FE9C3] DEFAULT (0) FOR [mtod_errno]
GO
--SqlScripter----[dbo].[DF__ofic_empr__codi___4885B9BB].sql
GO
ALTER TABLE [dbo].[ofic_empr] ADD CONSTRAINT [DF__ofic_empr__codi___4885B9BB] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__para_empr__codi___1B29035F].sql
GO
ALTER TABLE [dbo].[para_empr] ADD CONSTRAINT [DF__para_empr__codi___1B29035F] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__para_pers__codi___4979DDF4].sql
GO
ALTER TABLE [dbo].[para_pers] ADD CONSTRAINT [DF__para_pers__codi___4979DDF4] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__PERS_PUBL__PERS___4A6E022D].sql
GO
ALTER TABLE [dbo].[PERS_PUBL] ADD CONSTRAINT [DF__PERS_PUBL__PERS___4A6E022D] DEFAULT ('CL') FOR [PERS_PAIS]
GO
--SqlScripter----[dbo].[DF__PERS_PUBL__PERS___4B622666].sql
GO
ALTER TABLE [dbo].[PERS_PUBL_TEMP] ADD CONSTRAINT [DF__PERS_PUBL__PERS___4B622666] DEFAULT ('CL') FOR [PERS_PAIS]
GO
--SqlScripter----[dbo].[DF__personas__codi_e__4C564A9F].sql
GO
ALTER TABLE [dbo].[personas] ADD CONSTRAINT [DF__personas__codi_e__4C564A9F] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__PROC_LOGS__codi___4D4A6ED8].sql
GO
ALTER TABLE [dbo].[PROC_LOGS] ADD CONSTRAINT [DF__PROC_LOGS__codi___4D4A6ED8] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__qse_docu___CANT___5026DB83].sql
GO
ALTER TABLE [dbo].[qse_docu_serv] ADD CONSTRAINT [DF__qse_docu___CANT___5026DB83] DEFAULT (0) FOR [CANT_PROC]
GO
--SqlScripter----[dbo].[DF__qse_docu___CODI___4E3E9311].sql
GO
ALTER TABLE [dbo].[qse_docu_serv] ADD CONSTRAINT [DF__qse_docu___CODI___4E3E9311] DEFAULT ('PROD_0000') FOR [CODI_EMEX]
GO
--SqlScripter----[dbo].[DF__qse_docu___ESTA___4F32B74A].sql
GO
ALTER TABLE [dbo].[qse_docu_serv] ADD CONSTRAINT [DF__qse_docu___ESTA___4F32B74A] DEFAULT ('ING') FOR [ESTA_PROC]
GO
--SqlScripter----[dbo].[DF__sys_alar__sqld_a__3F6663D5].sql
GO
ALTER TABLE [dbo].[sys_alar] ADD CONSTRAINT [DF__sys_alar__sqld_a__3F6663D5] DEFAULT ('delete from sys_alin where codi_alar = ''alarma'' and codi_usua=''usuario'' and codi_emex=''holding'' and codi_empr=1010') FOR [sqld_alar]
GO
--SqlScripter----[dbo].[DF__sys_domai__Mante__5CF6C6BC].sql
GO
ALTER TABLE [dbo].[sys_domain] ADD CONSTRAINT [DF__sys_domai__Mante__5CF6C6BC] DEFAULT (0) FOR [Mantenedor]
GO
--SqlScripter----[dbo].[DF__usua_exte__codi___511AFFBC].sql
GO
ALTER TABLE [dbo].[usua_exte] ADD CONSTRAINT [DF__usua_exte__codi___511AFFBC] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__usua_sist__codi___0504B816].sql
GO
ALTER TABLE [dbo].[usua_sist] ADD CONSTRAINT [DF__usua_sist__codi___0504B816] DEFAULT ('PROD_0000') FOR [codi_emex]
GO
--SqlScripter----[dbo].[DF__usua_sist__usua___05F8DC4F].sql
GO
ALTER TABLE [dbo].[usua_sist] ADD CONSTRAINT [DF__usua_sist__usua___05F8DC4F] DEFAULT ('N') FOR [usua_filt]
GO
--SqlScripter----[dbo].[DF_version_fecha_ejecucion].sql
GO
ALTER TABLE [dbo].[version] ADD CONSTRAINT [DF_version_fecha_ejecucion] DEFAULT (getdate()) FOR [fecha_ejecucion]