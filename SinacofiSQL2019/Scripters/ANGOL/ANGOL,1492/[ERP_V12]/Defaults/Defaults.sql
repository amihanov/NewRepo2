
GO
--SqlScripter----[dbo].[TOP_FIELD_FIELD_DEC_DF].sql
GO
ALTER TABLE [dbo].[TOP_FIELD] ADD CONSTRAINT [TOP_FIELD_FIELD_DEC_DF] DEFAULT ('    ') FOR [FIELD_DEC]
GO
--SqlScripter----[dbo].[TOP_FIELD_FIELD_NAME_DF].sql
GO
ALTER TABLE [dbo].[TOP_FIELD] ADD CONSTRAINT [TOP_FIELD_FIELD_NAME_DF] DEFAULT ('                                ') FOR [FIELD_NAME]
GO
--SqlScripter----[dbo].[TOP_FIELD_FIELD_PREC_DF].sql
GO
ALTER TABLE [dbo].[TOP_FIELD] ADD CONSTRAINT [TOP_FIELD_FIELD_PREC_DF] DEFAULT ('    ') FOR [FIELD_PREC]
GO
--SqlScripter----[dbo].[TOP_FIELD_FIELD_TABLE_DF].sql
GO
ALTER TABLE [dbo].[TOP_FIELD] ADD CONSTRAINT [TOP_FIELD_FIELD_TABLE_DF] DEFAULT ('                                                                ') FOR [FIELD_TABLE]
GO
--SqlScripter----[dbo].[TOP_FIELD_FIELD_TYPE_DF].sql
GO
ALTER TABLE [dbo].[TOP_FIELD] ADD CONSTRAINT [TOP_FIELD_FIELD_TYPE_DF] DEFAULT ('  ') FOR [FIELD_TYPE]
GO
--SqlScripter----[dbo].[TOP_IDXSTATS_IDX_ENV_DF].sql
GO
ALTER TABLE [dbo].[TOP_IDXSTATS] ADD CONSTRAINT [TOP_IDXSTATS_IDX_ENV_DF] DEFAULT ('                                ') FOR [IDX_ENV]
GO
--SqlScripter----[dbo].[TOP_IDXSTATS_IDX_KEY_DF].sql
GO
ALTER TABLE [dbo].[TOP_IDXSTATS] ADD CONSTRAINT [TOP_IDXSTATS_IDX_KEY_DF] DEFAULT ('                                                                                                                                                                                                                                                               ') FOR [IDX_KEY]
GO
--SqlScripter----[dbo].[TOP_IDXSTATS_IDX_NAME_DF].sql
GO
ALTER TABLE [dbo].[TOP_IDXSTATS] ADD CONSTRAINT [TOP_IDXSTATS_IDX_NAME_DF] DEFAULT ('                                ') FOR [IDX_NAME]
GO
--SqlScripter----[dbo].[TOP_IDXSTATS_IDX_TABLE_DF].sql
GO
ALTER TABLE [dbo].[TOP_IDXSTATS] ADD CONSTRAINT [TOP_IDXSTATS_IDX_TABLE_DF] DEFAULT ('                                ') FOR [IDX_TABLE]
GO
--SqlScripter----[dbo].[TOP_IDXSTATS_IDX_USE_DF].sql
GO
ALTER TABLE [dbo].[TOP_IDXSTATS] ADD CONSTRAINT [TOP_IDXSTATS_IDX_USE_DF] DEFAULT (0) FOR [IDX_USE]
GO
--SqlScripter----[dbo].[TOP_IDXSTATS_R_E_C_N_O__DF].sql
GO
ALTER TABLE [dbo].[TOP_IDXSTATS] ADD CONSTRAINT [TOP_IDXSTATS_R_E_C_N_O__DF] DEFAULT (0) FOR [R_E_C_N_O_]
GO
--SqlScripter----[dbo].[TOP_SP_SP_ASSINAT_DF].sql
GO
ALTER TABLE [dbo].[TOP_SP] ADD CONSTRAINT [TOP_SP_SP_ASSINAT_DF] DEFAULT ('   ') FOR [SP_ASSINAT]
GO
--SqlScripter----[dbo].[TOP_SP_SP_DATA_DF].sql
GO
ALTER TABLE [dbo].[TOP_SP] ADD CONSTRAINT [TOP_SP_SP_DATA_DF] DEFAULT ('        ') FOR [SP_DATA]
GO
--SqlScripter----[dbo].[TOP_SP_SP_HORA_DF].sql
GO
ALTER TABLE [dbo].[TOP_SP] ADD CONSTRAINT [TOP_SP_SP_HORA_DF] DEFAULT ('        ') FOR [SP_HORA]
GO
--SqlScripter----[dbo].[TOP_SP_SP_NOME_DF].sql
GO
ALTER TABLE [dbo].[TOP_SP] ADD CONSTRAINT [TOP_SP_SP_NOME_DF] DEFAULT ('                    ') FOR [SP_NOME]
GO
--SqlScripter----[dbo].[TOP_SP_SP_VERSAO_DF].sql
GO
ALTER TABLE [dbo].[TOP_SP] ADD CONSTRAINT [TOP_SP_SP_VERSAO_DF] DEFAULT ('                    ') FOR [SP_VERSAO]
GO
--SqlScripter----[dbo].[TOP_VIRTUALIDX_IDX_ENV_DF].sql
GO
ALTER TABLE [dbo].[TOP_VIRTUALIDX] ADD CONSTRAINT [TOP_VIRTUALIDX_IDX_ENV_DF] DEFAULT ('                                ') FOR [IDX_ENV]
GO
--SqlScripter----[dbo].[TOP_VIRTUALIDX_IDX_KEY_DF].sql
GO
ALTER TABLE [dbo].[TOP_VIRTUALIDX] ADD CONSTRAINT [TOP_VIRTUALIDX_IDX_KEY_DF] DEFAULT ('                                                                                                                                                                                                                                                               ') FOR [IDX_KEY]
GO
--SqlScripter----[dbo].[TOP_VIRTUALIDX_IDX_NAME_DF].sql
GO
ALTER TABLE [dbo].[TOP_VIRTUALIDX] ADD CONSTRAINT [TOP_VIRTUALIDX_IDX_NAME_DF] DEFAULT ('                                ') FOR [IDX_NAME]
GO
--SqlScripter----[dbo].[TOP_VIRTUALIDX_IDX_TABLE_DF].sql
GO
ALTER TABLE [dbo].[TOP_VIRTUALIDX] ADD CONSTRAINT [TOP_VIRTUALIDX_IDX_TABLE_DF] DEFAULT ('                                ') FOR [IDX_TABLE]