
GO
--SqlScripter----[dbo].[DF_APROBACIONES_CODIGOCARGO].sql
GO
ALTER TABLE [dbo].[APROBACIONES] ADD CONSTRAINT [DF_APROBACIONES_CODIGOCARGO] DEFAULT (0) FOR [CODIGOCARGO]
GO
--SqlScripter----[dbo].[DF_APROBACIONES_CODIGODOCUMENTO].sql
GO
ALTER TABLE [dbo].[APROBACIONES] ADD CONSTRAINT [DF_APROBACIONES_CODIGODOCUMENTO] DEFAULT (0) FOR [CODIGODOCUMENTO]
GO
--SqlScripter----[dbo].[DF_APROBACIONES_INSTANCIA].sql
GO
ALTER TABLE [dbo].[APROBACIONES] ADD CONSTRAINT [DF_APROBACIONES_INSTANCIA] DEFAULT (0) FOR [INSTANCIA]
GO
--SqlScripter----[dbo].[DF_APROBACIONES_L_APRUEBA].sql
GO
ALTER TABLE [dbo].[APROBACIONES] ADD CONSTRAINT [DF_APROBACIONES_L_APRUEBA] DEFAULT (0) FOR [L_APRUEBA]
GO
--SqlScripter----[dbo].[DF_ARCHIVOS_CODIGODOCUMENTO].sql
GO
ALTER TABLE [dbo].[ARCHIVOS] ADD CONSTRAINT [DF_ARCHIVOS_CODIGODOCUMENTO] DEFAULT (0) FOR [CODIGODOCUMENTO]
GO
--SqlScripter----[dbo].[DF_ARCHIVOS_L_PARTEDELMANUAL].sql
GO
ALTER TABLE [dbo].[ARCHIVOS] ADD CONSTRAINT [DF_ARCHIVOS_L_PARTEDELMANUAL] DEFAULT (0) FOR [L_PARTEDELMANUAL]
GO
--SqlScripter----[dbo].[DF_AUDITORIAS_CODIGOCARGOADMINISTRADOR].sql
GO
ALTER TABLE [dbo].[AUDITORIAS] ADD CONSTRAINT [DF_AUDITORIAS_CODIGOCARGOADMINISTRADOR] DEFAULT (0) FOR [CODIGOCARGOADMINISTRADOR]
GO
--SqlScripter----[dbo].[DF_AUDITORIAS_CODIGOTIPO].sql
GO
ALTER TABLE [dbo].[AUDITORIAS] ADD CONSTRAINT [DF_AUDITORIAS_CODIGOTIPO] DEFAULT (0) FOR [CODIGOTIPO]
GO
--SqlScripter----[dbo].[DF_AUDITORIASARCHIVOS_CODIGOMARCO].sql
GO
ALTER TABLE [dbo].[AUDITORIASARCHIVOS] ADD CONSTRAINT [DF_AUDITORIASARCHIVOS_CODIGOMARCO] DEFAULT (0) FOR [CODIGOMARCO]
GO
--SqlScripter----[dbo].[DF__BS_INDICA__WEIGH__35B2DC69].sql
GO
ALTER TABLE [dbo].[BS_INDICATORSREL] ADD CONSTRAINT [DF__BS_INDICA__WEIGH__35B2DC69] DEFAULT (0) FOR [WEIGHT_PERC]
GO
--SqlScripter----[dbo].[DF_CARGOSUSUARIOS_CODIGOCARGO].sql
GO
ALTER TABLE [dbo].[CARGOSUSUARIOS] ADD CONSTRAINT [DF_CARGOSUSUARIOS_CODIGOCARGO] DEFAULT (0) FOR [CODIGOCARGO]
GO
--SqlScripter----[dbo].[DF_CARGOSUSUARIOS_CODIGOUSUARIO].sql
GO
ALTER TABLE [dbo].[CARGOSUSUARIOS] ADD CONSTRAINT [DF_CARGOSUSUARIOS_CODIGOUSUARIO] DEFAULT (0) FOR [CODIGOUSUARIO]
GO
--SqlScripter----[dbo].[DF_CRITICAS_CODACCION].sql
GO
ALTER TABLE [dbo].[CRITICAS] ADD CONSTRAINT [DF_CRITICAS_CODACCION] DEFAULT (0) FOR [CODACCION]
GO
--SqlScripter----[dbo].[DF_CRITICAS_CODIGOCRITICA].sql
GO
ALTER TABLE [dbo].[CRITICAS] ADD CONSTRAINT [DF_CRITICAS_CODIGOCRITICA] DEFAULT (0) FOR [CODIGOCRITICA]
GO
--SqlScripter----[dbo].[DF_CRITICAS_CODIGODOCUMENTO].sql
GO
ALTER TABLE [dbo].[CRITICAS] ADD CONSTRAINT [DF_CRITICAS_CODIGODOCUMENTO] DEFAULT (0) FOR [CODIGODOCUMENTO]
GO
--SqlScripter----[dbo].[DF_CRITICAS_CODIGOUSUARIO].sql
GO
ALTER TABLE [dbo].[CRITICAS] ADD CONSTRAINT [DF_CRITICAS_CODIGOUSUARIO] DEFAULT (0) FOR [CODIGOUSUARIO]
GO
--SqlScripter----[dbo].[DF_CRITICAS_CORRIGEUSUARIO].sql
GO
ALTER TABLE [dbo].[CRITICAS] ADD CONSTRAINT [DF_CRITICAS_CORRIGEUSUARIO] DEFAULT (0) FOR [CORRIGEUSUARIO]
GO
--SqlScripter----[dbo].[DF_CRITICAS_L_CORREGIDO].sql
GO
ALTER TABLE [dbo].[CRITICAS] ADD CONSTRAINT [DF_CRITICAS_L_CORREGIDO] DEFAULT (0) FOR [L_CORREGIDO]
GO
--SqlScripter----[dbo].[DF_DISTRIBUCION_CODIGODISTRIBUIDOR].sql
GO
ALTER TABLE [dbo].[DISTRIBUCION] ADD CONSTRAINT [DF_DISTRIBUCION_CODIGODISTRIBUIDOR] DEFAULT (0) FOR [CODIGODISTRIBUIDOR]
GO
--SqlScripter----[dbo].[DF_DISTRIBUCION_L_SUBDISTRIBUIDOR].sql
GO
ALTER TABLE [dbo].[DISTRIBUCION] ADD CONSTRAINT [DF_DISTRIBUCION_L_SUBDISTRIBUIDOR] DEFAULT (0) FOR [L_SUBDISTRIBUIDOR]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_APRUEBAN].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_APRUEBAN] DEFAULT (0) FOR [APRUEBAN]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_APRUEBAN2].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_APRUEBAN2] DEFAULT (0) FOR [APRUEBAN2]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_CODIGOAPROBACION].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_CODIGOAPROBACION] DEFAULT (0) FOR [CODIGOAPROBACION]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_CODIGOBASADOEN].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_CODIGOBASADOEN] DEFAULT (0) FOR [CODIGOBASADOEN]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_CODIGODISTRIBUCION].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_CODIGODISTRIBUCION] DEFAULT (0) FOR [CODIGODISTRIBUCION]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_CODIGOSECTOR].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_CODIGOSECTOR] DEFAULT (0) FOR [CODIGOSECTOR]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_CODIGOTIPO].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_CODIGOTIPO] DEFAULT (0) FOR [CODIGOTIPO]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_ESTADO].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_ESTADO] DEFAULT (0) FOR [ESTADO]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_L_AUTOTRAMITAR].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_L_AUTOTRAMITAR] DEFAULT (0) FOR [L_AUTOTRAMITAR]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_L_PENDIENTESMOSTRADO].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_L_PENDIENTESMOSTRADO] DEFAULT (0) FOR [L_PENDIENTESMOSTRADO]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_MODOAPRUEBAN].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_MODOAPRUEBAN] DEFAULT (0) FOR [MODOAPRUEBAN]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_MODOAPRUEBAN2].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_MODOAPRUEBAN2] DEFAULT (0) FOR [MODOAPRUEBAN2]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_PROCESO].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_PROCESO] DEFAULT (0) FOR [PROCESO]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_PROCESOAPRUEBA].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_PROCESOAPRUEBA] DEFAULT (0) FOR [PROCESOAPRUEBA]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_PROCESODISTRIBUYE].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_PROCESODISTRIBUYE] DEFAULT (0) FOR [PROCESODISTRIBUYE]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_PROCESOREVISA].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_PROCESOREVISA] DEFAULT (0) FOR [PROCESOREVISA]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_RESULTADOAPRUEBA].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_RESULTADOAPRUEBA] DEFAULT (0) FOR [RESULTADOAPRUEBA]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_RESULTADODISTRIBUYE].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_RESULTADODISTRIBUYE] DEFAULT (0) FOR [RESULTADODISTRIBUYE]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_RESULTADOREVISA].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_RESULTADOREVISA] DEFAULT (0) FOR [RESULTADOREVISA]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_REVISION].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_REVISION] DEFAULT (0) FOR [REVISION]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_TIPOPROXREV].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_TIPOPROXREV] DEFAULT (0) FOR [TIPOPROXREV]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_USUARIOAUDITOR].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_USUARIOAUDITOR] DEFAULT (0) FOR [USUARIOAUDITOR]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_USUARIORESPONSABLE].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_USUARIORESPONSABLE] DEFAULT (0) FOR [USUARIORESPONSABLE]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOS_VERSIONBASADOEN].sql
GO
ALTER TABLE [dbo].[DOCUMENTOS] ADD CONSTRAINT [DF_DOCUMENTOS_VERSIONBASADOEN] DEFAULT (0) FOR [VERSIONBASADOEN]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOSHISTORIA_CODIGODOCUMENTO].sql
GO
ALTER TABLE [dbo].[DOCUMENTOSHISTORIA] ADD CONSTRAINT [DF_DOCUMENTOSHISTORIA_CODIGODOCUMENTO] DEFAULT (0) FOR [CODIGODOCUMENTO]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOSHISTORIA_CODIGOPROCESO].sql
GO
ALTER TABLE [dbo].[DOCUMENTOSHISTORIA] ADD CONSTRAINT [DF_DOCUMENTOSHISTORIA_CODIGOPROCESO] DEFAULT (0) FOR [CODIGOPROCESO]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOSHISTORIA_CODIGOTAREAREVISION].sql
GO
ALTER TABLE [dbo].[DOCUMENTOSHISTORIA] ADD CONSTRAINT [DF_DOCUMENTOSHISTORIA_CODIGOTAREAREVISION] DEFAULT (0) FOR [CODIGOTAREAREVISION]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOSHISTORIA_CODIGOUSUARIO].sql
GO
ALTER TABLE [dbo].[DOCUMENTOSHISTORIA] ADD CONSTRAINT [DF_DOCUMENTOSHISTORIA_CODIGOUSUARIO] DEFAULT (0) FOR [CODIGOUSUARIO]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOSREL_CODIGODOCUMENTO].sql
GO
ALTER TABLE [dbo].[DOCUMENTOSREL] ADD CONSTRAINT [DF_DOCUMENTOSREL_CODIGODOCUMENTO] DEFAULT (0) FOR [CODIGODOCUMENTO]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOSREL_CODIGORELACIONADO].sql
GO
ALTER TABLE [dbo].[DOCUMENTOSREL] ADD CONSTRAINT [DF_DOCUMENTOSREL_CODIGORELACIONADO] DEFAULT (0) FOR [CODIGORELACIONADO]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOSRELTRANS_CODIGODOCUMENTO].sql
GO
ALTER TABLE [dbo].[DOCUMENTOSRELTRANS] ADD CONSTRAINT [DF_DOCUMENTOSRELTRANS_CODIGODOCUMENTO] DEFAULT (0) FOR [CODIGODOCUMENTO]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOSRELTRANS_CODIGORELACIONADO].sql
GO
ALTER TABLE [dbo].[DOCUMENTOSRELTRANS] ADD CONSTRAINT [DF_DOCUMENTOSRELTRANS_CODIGORELACIONADO] DEFAULT (0) FOR [CODIGORELACIONADO]
GO
--SqlScripter----[dbo].[DF_DOCUMENTOSRELTRANS_L_EXISTE].sql
GO
ALTER TABLE [dbo].[DOCUMENTOSRELTRANS] ADD CONSTRAINT [DF_DOCUMENTOSRELTRANS_L_EXISTE] DEFAULT (0) FOR [L_EXISTE]
GO
--SqlScripter----[dbo].[DF_ESTADOSPROCESOS_CODIGOESTADO].sql
GO
ALTER TABLE [dbo].[ESTADOSPROCESOS] ADD CONSTRAINT [DF_ESTADOSPROCESOS_CODIGOESTADO] DEFAULT (0) FOR [CODIGOESTADO]
GO
--SqlScripter----[dbo].[DF__IK_PEOPLE__ALT_E__409A7F30].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF__IK_PEOPLE__ALT_E__409A7F30] DEFAULT (NULL) FOR [ALT_EMAIL]
GO
--SqlScripter----[dbo].[DF__IK_PEOPLE__Q_SEC__3EB236BE].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF__IK_PEOPLE__Q_SEC__3EB236BE] DEFAULT (NULL) FOR [Q_SEC]
GO
--SqlScripter----[dbo].[DF__IK_PEOPLE__R_SEC__3FA65AF7].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF__IK_PEOPLE__R_SEC__3FA65AF7] DEFAULT (NULL) FOR [R_SEC]
GO
--SqlScripter----[dbo].[DF_IK_PEOPLE_L_IS_IKPERSON_DELETED].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_IK_PEOPLE_L_IS_IKPERSON_DELETED] DEFAULT (0) FOR [L_IS_IKPERSON_DELETED]
GO
--SqlScripter----[dbo].[DF_IK_PEOPLE_L_IS_IKUSER].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_IK_PEOPLE_L_IS_IKUSER] DEFAULT (0) FOR [L_IS_IKUSER]
GO
--SqlScripter----[dbo].[DF_IK_PEOPLE_L_USER_ACCOUNT_IS_DISABLED].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_IK_PEOPLE_L_USER_ACCOUNT_IS_DISABLED] DEFAULT (0) FOR [L_USER_ACCOUNT_IS_DISABLED]
GO
--SqlScripter----[dbo].[DF_IK_PEOPLE_PASSWORD_LASTDATE].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_IK_PEOPLE_PASSWORD_LASTDATE] DEFAULT (getdate()) FOR [PASSWORD_LASTDATE]
GO
--SqlScripter----[dbo].[DF_USUARIOS_CATEGORIA].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_USUARIOS_CATEGORIA] DEFAULT (0) FOR [CATEGORIA]
GO
--SqlScripter----[dbo].[DF_USUARIOS_CODIGOGRUPO].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_USUARIOS_CODIGOGRUPO] DEFAULT (0) FOR [CODIGOGRUPO]
GO
--SqlScripter----[dbo].[DF_USUARIOS_L_CANCHANGEPASSWORD].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_USUARIOS_L_CANCHANGEPASSWORD] DEFAULT (1) FOR [L_CANCHANGEPASSWORD]
GO
--SqlScripter----[dbo].[DF_USUARIOS_L_DELETED].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_USUARIOS_L_DELETED] DEFAULT (0) FOR [L_DELETED]
GO
--SqlScripter----[dbo].[DF_USUARIOS_L_ENVIARMAILPROCESOS].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_USUARIOS_L_ENVIARMAILPROCESOS] DEFAULT (0) FOR [L_ENVIARMAILPROCESOS]
GO
--SqlScripter----[dbo].[DF_USUARIOS_L_ENVIARTEXTOCOMPLETO].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_USUARIOS_L_ENVIARTEXTOCOMPLETO] DEFAULT (0) FOR [L_ENVIARTEXTOCOMPLETO]
GO
--SqlScripter----[dbo].[DF_USUARIOS_L_GRUPO].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_USUARIOS_L_GRUPO] DEFAULT (0) FOR [L_GRUPO]
GO
--SqlScripter----[dbo].[DF_USUARIOS_L_MUSTCHANGEPASSWORD].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_USUARIOS_L_MUSTCHANGEPASSWORD] DEFAULT (0) FOR [L_MUSTCHANGEPASSWORD]
GO
--SqlScripter----[dbo].[DF_USUARIOS_L_WEBGROUP].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_USUARIOS_L_WEBGROUP] DEFAULT (0) FOR [L_WEBGROUP]
GO
--SqlScripter----[dbo].[DF_USUARIOS_PERMISOSDOCUMENTOS].sql
GO
ALTER TABLE [dbo].[IK_PEOPLE] ADD CONSTRAINT [DF_USUARIOS_PERMISOSDOCUMENTOS] DEFAULT (0) FOR [PERMISOSDOCUMENTOS]
GO
--SqlScripter----[dbo].[DF_IKALERTS_L_ISARCHIVED].sql
GO
ALTER TABLE [dbo].[IKALERTS] ADD CONSTRAINT [DF_IKALERTS_L_ISARCHIVED] DEFAULT (0) FOR [L_ISARCHIVED]
GO
--SqlScripter----[dbo].[DF_IKALERTS_USERS_OPTIONS_ALERT_L_ISPINNED].sql
GO
ALTER TABLE [dbo].[IKALERTS_USERS_OPTIONS] ADD CONSTRAINT [DF_IKALERTS_USERS_OPTIONS_ALERT_L_ISPINNED] DEFAULT (1) FOR [ALERT_L_ISPINNED]
GO
--SqlScripter----[dbo].[DF_IKFILES_L_ISOBSOLETE].sql
GO
ALTER TABLE [dbo].[IKFILES] ADD CONSTRAINT [DF_IKFILES_L_ISOBSOLETE] DEFAULT (0) FOR [L_ISOBSOLETE]
GO
--SqlScripter----[dbo].[DF_IKFOROSMENSAJES_TYPE].sql
GO
ALTER TABLE [dbo].[IKFOROSMENSAJES] ADD CONSTRAINT [DF_IKFOROSMENSAJES_TYPE] DEFAULT (1) FOR [TYPE]
GO
--SqlScripter----[dbo].[DF_IKMAILS_IKMAILS_TRYCOUNT].sql
GO
ALTER TABLE [dbo].[IKMAILS] ADD CONSTRAINT [DF_IKMAILS_IKMAILS_TRYCOUNT] DEFAULT (0) FOR [IKMAILS_TRYCOUNT]
GO
--SqlScripter----[dbo].[DF_MARCODOCUMENTOSREL_CODIGODOCUMENTO].sql
GO
ALTER TABLE [dbo].[MARCODOCUMENTOSREL] ADD CONSTRAINT [DF_MARCODOCUMENTOSREL_CODIGODOCUMENTO] DEFAULT (0) FOR [CODIGODOCUMENTO]
GO
--SqlScripter----[dbo].[DF_MARCODOCUMENTOSREL_CODIGOMARCO].sql
GO
ALTER TABLE [dbo].[MARCODOCUMENTOSREL] ADD CONSTRAINT [DF_MARCODOCUMENTOSREL_CODIGOMARCO] DEFAULT (0) FOR [CODIGOMARCO]
GO
--SqlScripter----[dbo].[DF_MARCODOCUMENTOSREL_TIPOMARCO].sql
GO
ALTER TABLE [dbo].[MARCODOCUMENTOSREL] ADD CONSTRAINT [DF_MARCODOCUMENTOSREL_TIPOMARCO] DEFAULT (0) FOR [TIPOMARCO]
GO
--SqlScripter----[dbo].[DF_MIEMBROSGRUPO_CODIGOGRUPO].sql
GO
ALTER TABLE [dbo].[MIEMBROSGRUPO] ADD CONSTRAINT [DF_MIEMBROSGRUPO_CODIGOGRUPO] DEFAULT (0) FOR [CODIGOGRUPO]
GO
--SqlScripter----[dbo].[DF_MIEMBROSGRUPO_CODIGOUSUARIO].sql
GO
ALTER TABLE [dbo].[MIEMBROSGRUPO] ADD CONSTRAINT [DF_MIEMBROSGRUPO_CODIGOUSUARIO] DEFAULT (0) FOR [CODIGOUSUARIO]
GO
--SqlScripter----[dbo].[DF_NC_FILES_L_ISSUBCLASSFILE].sql
GO
ALTER TABLE [dbo].[NC_FILES] ADD CONSTRAINT [DF_NC_FILES_L_ISSUBCLASSFILE] DEFAULT (0) FOR [L_ISSUBCLASSFILE]
GO
--SqlScripter----[dbo].[DF_NCCLASES_CODIGOPADRE].sql
GO
ALTER TABLE [dbo].[NCCLASES] ADD CONSTRAINT [DF_NCCLASES_CODIGOPADRE] DEFAULT (0) FOR [CODIGOPADRE]
GO
--SqlScripter----[dbo].[DF_NCCLASES_CODIGORAIZ].sql
GO
ALTER TABLE [dbo].[NCCLASES] ADD CONSTRAINT [DF_NCCLASES_CODIGORAIZ] DEFAULT (0) FOR [CODIGORAIZ]
GO
--SqlScripter----[dbo].[DF_NCCLASES_TIPOOBJETO].sql
GO
ALTER TABLE [dbo].[NCCLASES] ADD CONSTRAINT [DF_NCCLASES_TIPOOBJETO] DEFAULT (0) FOR [TIPOOBJETO]
GO
--SqlScripter----[dbo].[DF_NCCOSTOS_CODIGOCATEGORIA].sql
GO
ALTER TABLE [dbo].[NCCOSTOS] ADD CONSTRAINT [DF_NCCOSTOS_CODIGOCATEGORIA] DEFAULT (0) FOR [CODIGOCATEGORIA]
GO
--SqlScripter----[dbo].[DF_NCCOSTOS_CODIGOCLASE].sql
GO
ALTER TABLE [dbo].[NCCOSTOS] ADD CONSTRAINT [DF_NCCOSTOS_CODIGOCLASE] DEFAULT (0) FOR [CODIGOCLASE]
GO
--SqlScripter----[dbo].[DF_NCCOSTOS_CODIGONC].sql
GO
ALTER TABLE [dbo].[NCCOSTOS] ADD CONSTRAINT [DF_NCCOSTOS_CODIGONC] DEFAULT (0) FOR [CODIGONC]
GO
--SqlScripter----[dbo].[DF_NCDEFINICIONETAPAS_URLIMAGENGRANDE].sql
GO
ALTER TABLE [dbo].[NCDEFINICIONETAPAS] ADD CONSTRAINT [DF_NCDEFINICIONETAPAS_URLIMAGENGRANDE] DEFAULT ('Images/Etapa1.gif') FOR [URLIMAGENGRANDE]
GO
--SqlScripter----[dbo].[DF_NCETAPAS_L_NOAPLICA].sql
GO
ALTER TABLE [dbo].[NCETAPAS] ADD CONSTRAINT [DF_NCETAPAS_L_NOAPLICA] DEFAULT (0) FOR [L_NOAPLICA]
GO
--SqlScripter----[dbo].[DF_NCINVOLUCRADOS_CODIGOCARGO].sql
GO
ALTER TABLE [dbo].[NCINVOLUCRADOS] ADD CONSTRAINT [DF_NCINVOLUCRADOS_CODIGOCARGO] DEFAULT (0) FOR [CODIGOCARGO]
GO
--SqlScripter----[dbo].[DF_NCINVOLUCRADOS_CODIGOEXTERNO].sql
GO
ALTER TABLE [dbo].[NCINVOLUCRADOS] ADD CONSTRAINT [DF_NCINVOLUCRADOS_CODIGOEXTERNO] DEFAULT (0) FOR [CODIGOEXTERNO]
GO
--SqlScripter----[dbo].[DF_NCINVOLUCRADOS_CODIGONC].sql
GO
ALTER TABLE [dbo].[NCINVOLUCRADOS] ADD CONSTRAINT [DF_NCINVOLUCRADOS_CODIGONC] DEFAULT (0) FOR [CODIGONC]
GO
--SqlScripter----[dbo].[DF_NCINVOLUCRADOS_INSTANCIA].sql
GO
ALTER TABLE [dbo].[NCINVOLUCRADOS] ADD CONSTRAINT [DF_NCINVOLUCRADOS_INSTANCIA] DEFAULT (0) FOR [INSTANCIA]
GO
--SqlScripter----[dbo].[DF_NCINVOLUCRADOS_INVOLMENT_METHOD].sql
GO
ALTER TABLE [dbo].[NCINVOLUCRADOS] ADD CONSTRAINT [DF_NCINVOLUCRADOS_INVOLMENT_METHOD] DEFAULT (0) FOR [INVOLMENT_METHOD]
GO
--SqlScripter----[dbo].[DF_NCINVOLUCRADOS_INVOLVEMENT_DATE].sql
GO
ALTER TABLE [dbo].[NCINVOLUCRADOS] ADD CONSTRAINT [DF_NCINVOLUCRADOS_INVOLVEMENT_DATE] DEFAULT (getdate()) FOR [INVOLVEMENT_DATE]
GO
--SqlScripter----[dbo].[DF_NCINVOLUCRADOS_TIPOOBJETO].sql
GO
ALTER TABLE [dbo].[NCINVOLUCRADOS] ADD CONSTRAINT [DF_NCINVOLUCRADOS_TIPOOBJETO] DEFAULT (0) FOR [TIPOOBJETO]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_AVA_ELAPSED_DAYS].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_AVA_ELAPSED_DAYS] DEFAULT (0) FOR [AVA_ELAPSED_DAYS]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_AVA_OPTIONS].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_AVA_OPTIONS] DEFAULT (0) FOR [AVA_OPTIONS]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_AVA_PRED_PERC].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_AVA_PRED_PERC] DEFAULT (0) FOR [AVA_PRED_PERC]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_AVA_PROY_DELAY_STATE].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_AVA_PROY_DELAY_STATE] DEFAULT ('undefined') FOR [AVA_PROY_DELAY_STATE]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_AVA_REAL_PERC].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_AVA_REAL_PERC] DEFAULT (0) FOR [AVA_REAL_PERC]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_AVA_STATE].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_AVA_STATE] DEFAULT ('undefined') FOR [AVA_STATE]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_AVA_TOTAL_PRED_DAYS].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_AVA_TOTAL_PRED_DAYS] DEFAULT (0) FOR [AVA_TOTAL_PRED_DAYS]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_CATEGORIA].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_CATEGORIA] DEFAULT (0) FOR [CATEGORIA]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_CODIGOCARGOADMINISTRADOR].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_CODIGOCARGOADMINISTRADOR] DEFAULT (0) FOR [CODIGOCARGOADMINISTRADOR]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_CODIGOMARCO].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_CODIGOMARCO] DEFAULT (0) FOR [CODIGOMARCO]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_ESTADO].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_ESTADO] DEFAULT (0) FOR [ESTADO]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_L_ASUNTOPRIORITARIO].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_L_ASUNTOPRIORITARIO] DEFAULT (0) FOR [L_ASUNTOPRIORITARIO]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_TIPO].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_TIPO] DEFAULT (0) FOR [TIPO]
GO
--SqlScripter----[dbo].[DF_NCMAINPROD_TIPOMARCO].sql
GO
ALTER TABLE [dbo].[NCMAINPROD] ADD CONSTRAINT [DF_NCMAINPROD_TIPOMARCO] DEFAULT (0) FOR [TIPOMARCO]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_AVA_OPTIONS].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_AVA_OPTIONS] DEFAULT (0) FOR [AVA_OPTIONS]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_AVA_PRED_PERC].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_AVA_PRED_PERC] DEFAULT (0) FOR [AVA_PRED_PERC]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_AVA_REAL_PERC].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_AVA_REAL_PERC] DEFAULT (0) FOR [AVA_REAL_PERC]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_AVA_WEIGHT_MODE].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_AVA_WEIGHT_MODE] DEFAULT (0) FOR [AVA_WEIGHT_MODE]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_AVA_WEIGHT_PERC].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_AVA_WEIGHT_PERC] DEFAULT (0) FOR [AVA_WEIGHT_PERC]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_CODIGONC].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_CODIGONC] DEFAULT (0) FOR [CODIGONC]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_CODIGOTAREACONDICIONAL].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_CODIGOTAREACONDICIONAL] DEFAULT (0) FOR [CODIGOTAREACONDICIONAL]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_ETAPA].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_ETAPA] DEFAULT (0) FOR [ETAPA]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_L_CUMPLIDA].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_L_CUMPLIDA] DEFAULT (0) FOR [L_CUMPLIDA]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_L_LEIDO].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_L_LEIDO] DEFAULT (0) FOR [L_LEIDO]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_L_NOMOSTRAR].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_L_NOMOSTRAR] DEFAULT (0) FOR [L_NOMOSTRAR]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_L_NOTIFICADOADM].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_L_NOTIFICADOADM] DEFAULT (0) FOR [L_NOTIFICADOADM]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_L_TIENERELACIONADOS].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_L_TIENERELACIONADOS] DEFAULT (0) FOR [L_TIENERELACIONADOS]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_OPCIONENVIO].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_OPCIONENVIO] DEFAULT (0) FOR [OPCIONENVIO]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_TAREAMADRE].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_TAREAMADRE] DEFAULT (0) FOR [TAREAMADRE]
GO
--SqlScripter----[dbo].[DF_NCTAREAS_TAREARELACIONADA].sql
GO
ALTER TABLE [dbo].[NCTAREAS] ADD CONSTRAINT [DF_NCTAREAS_TAREARELACIONADA] DEFAULT (0) FOR [TAREARELACIONADA]
GO
--SqlScripter----[dbo].[DF_NCTAREASDESTINATARIOS_CODIGOINVOLUCRADO].sql
GO
ALTER TABLE [dbo].[NCTAREASDESTINATARIOS] ADD CONSTRAINT [DF_NCTAREASDESTINATARIOS_CODIGOINVOLUCRADO] DEFAULT (0) FOR [CODIGOCARGO]
GO
--SqlScripter----[dbo].[DF_NCTAREASDESTINATARIOS_CODIGOTAREA].sql
GO
ALTER TABLE [dbo].[NCTAREASDESTINATARIOS] ADD CONSTRAINT [DF_NCTAREASDESTINATARIOS_CODIGOTAREA] DEFAULT (0) FOR [CODIGOTAREA]
GO
--SqlScripter----[dbo].[DF_NCTAREASDESTINATARIOS_INVOLMENT_METHOD].sql
GO
ALTER TABLE [dbo].[NCTAREASDESTINATARIOS] ADD CONSTRAINT [DF_NCTAREASDESTINATARIOS_INVOLMENT_METHOD] DEFAULT (0) FOR [INVOLMENT_METHOD]
GO
--SqlScripter----[dbo].[DF_ORGANIGRAMA_CODIGOLUGAR].sql
GO
ALTER TABLE [dbo].[ORGANIGRAMA] ADD CONSTRAINT [DF_ORGANIGRAMA_CODIGOLUGAR] DEFAULT (0) FOR [CODIGOLUGAR]
GO
--SqlScripter----[dbo].[DF_ORGANIGRAMA_CODIGOPADRE].sql
GO
ALTER TABLE [dbo].[ORGANIGRAMA] ADD CONSTRAINT [DF_ORGANIGRAMA_CODIGOPADRE] DEFAULT (0) FOR [CODIGOPADRE]
GO
--SqlScripter----[dbo].[DF_ORGANIGRAMA_INPUT_DATE].sql
GO
ALTER TABLE [dbo].[ORGANIGRAMA] ADD CONSTRAINT [DF_ORGANIGRAMA_INPUT_DATE] DEFAULT (getdate()) FOR [INPUT_DATE]
GO
--SqlScripter----[dbo].[DF_ORGANIGRAMA_L_NOACCEDE].sql
GO
ALTER TABLE [dbo].[ORGANIGRAMA] ADD CONSTRAINT [DF_ORGANIGRAMA_L_NOACCEDE] DEFAULT (0) FOR [L_NOACCEDE]
GO
--SqlScripter----[dbo].[DF_ORGANIGRAMA_VIRTUAL].sql
GO
ALTER TABLE [dbo].[ORGANIGRAMA] ADD CONSTRAINT [DF_ORGANIGRAMA_VIRTUAL] DEFAULT (0) FOR [VIRTUAL]
GO
--SqlScripter----[dbo].[DF__PROCESOS__L_VENC__7A5D0C71].sql
GO
ALTER TABLE [dbo].[PROCESOS] ADD CONSTRAINT [DF__PROCESOS__L_VENC__7A5D0C71] DEFAULT (0) FOR [L_VENCIMIENTO_INDIVIDUAL]
GO
--SqlScripter----[dbo].[DF_PROCESOS_CODIGODOCUMENTO].sql
GO
ALTER TABLE [dbo].[PROCESOS] ADD CONSTRAINT [DF_PROCESOS_CODIGODOCUMENTO] DEFAULT (0) FOR [CODIGODOCUMENTO]
GO
--SqlScripter----[dbo].[DF_SS_CARTS_WO_CART_SSCMD_RETRY_COUNT].sql
GO
ALTER TABLE [dbo].[SS_CARTS_WO] ADD CONSTRAINT [DF_SS_CARTS_WO_CART_SSCMD_RETRY_COUNT] DEFAULT (0) FOR [CART_SSCMD_RETRY_COUNT]
GO
--SqlScripter----[dbo].[DF__TAREASREV__L_VEN__7968E838].sql
GO
ALTER TABLE [dbo].[TAREASREVISION] ADD CONSTRAINT [DF__TAREASREV__L_VEN__7968E838] DEFAULT (0) FOR [L_VENCIMIENTONOTIFICADO]
GO
--SqlScripter----[dbo].[DF_TAREASREVISION_CODIGOCARGOREQ].sql
GO
ALTER TABLE [dbo].[TAREASREVISION] ADD CONSTRAINT [DF_TAREASREVISION_CODIGOCARGOREQ] DEFAULT (0) FOR [CODIGOCARGOREQ]
GO
--SqlScripter----[dbo].[DF_TAREASREVISION_CODIGODOCUMENTO].sql
GO
ALTER TABLE [dbo].[TAREASREVISION] ADD CONSTRAINT [DF_TAREASREVISION_CODIGODOCUMENTO] DEFAULT (0) FOR [CODIGODOCUMENTO]
GO
--SqlScripter----[dbo].[DF_TAREASREVISION_CODIGOPROCESO].sql
GO
ALTER TABLE [dbo].[TAREASREVISION] ADD CONSTRAINT [DF_TAREASREVISION_CODIGOPROCESO] DEFAULT (0) FOR [CODIGOPROCESO]
GO
--SqlScripter----[dbo].[DF_TAREASREVISION_CODIGOUSUARIO].sql
GO
ALTER TABLE [dbo].[TAREASREVISION] ADD CONSTRAINT [DF_TAREASREVISION_CODIGOUSUARIO] DEFAULT (0) FOR [CODIGOUSUARIO]
GO
--SqlScripter----[dbo].[DF_TAREASREVISION_REINTENTO].sql
GO
ALTER TABLE [dbo].[TAREASREVISION] ADD CONSTRAINT [DF_TAREASREVISION_REINTENTO] DEFAULT (0) FOR [REINTENTO]
GO
--SqlScripter----[dbo].[DF_TAREASSISTEMA_CODIGOCARGOREQ].sql
GO
ALTER TABLE [dbo].[TAREASSISTEMA] ADD CONSTRAINT [DF_TAREASSISTEMA_CODIGOCARGOREQ] DEFAULT (0) FOR [CODIGOCARGOREQ]
GO
--SqlScripter----[dbo].[DF_TAREASSISTEMA_CODIGODOCUMENTO].sql
GO
ALTER TABLE [dbo].[TAREASSISTEMA] ADD CONSTRAINT [DF_TAREASSISTEMA_CODIGODOCUMENTO] DEFAULT (0) FOR [CODIGODOCUMENTO]
GO
--SqlScripter----[dbo].[DF_TAREASSISTEMA_L_REQUERIDO].sql
GO
ALTER TABLE [dbo].[TAREASSISTEMA] ADD CONSTRAINT [DF_TAREASSISTEMA_L_REQUERIDO] DEFAULT (0) FOR [L_REQUERIDO]
GO
--SqlScripter----[dbo].[DF_TAREASSISTEMA_REINTENTO].sql
GO
ALTER TABLE [dbo].[TAREASSISTEMA] ADD CONSTRAINT [DF_TAREASSISTEMA_REINTENTO] DEFAULT (0) FOR [REINTENTO]
GO
--SqlScripter----[dbo].[DF__TODO__ISLINKLIST__202DAF9E].sql
GO
ALTER TABLE [dbo].[TODO] ADD CONSTRAINT [DF__TODO__ISLINKLIST__202DAF9E] DEFAULT (0) FOR [ISLINKLIST]
GO
--SqlScripter----[dbo].[DF_TODO_TODO_INPUT_DATE].sql
GO
ALTER TABLE [dbo].[TODO] ADD CONSTRAINT [DF_TODO_TODO_INPUT_DATE] DEFAULT (getdate()) FOR [TODO_INPUT_DATE]
GO
--SqlScripter----[dbo].[DF_TODO_TODO_L_DONE].sql
GO
ALTER TABLE [dbo].[TODO] ADD CONSTRAINT [DF_TODO_TODO_L_DONE] DEFAULT (0) FOR [TODO_L_ISDONE]
GO
--SqlScripter----[dbo].[DF_TPROT_TASK_AVA_OPTIONS].sql
GO
ALTER TABLE [dbo].[TPROT_TASK] ADD CONSTRAINT [DF_TPROT_TASK_AVA_OPTIONS] DEFAULT (0) FOR [AVA_OPTIONS]
GO
--SqlScripter----[dbo].[DF_TPROT_TASK_AVA_PRED_PERC].sql
GO
ALTER TABLE [dbo].[TPROT_TASK] ADD CONSTRAINT [DF_TPROT_TASK_AVA_PRED_PERC] DEFAULT (0) FOR [AVA_PRED_PERC]
GO
--SqlScripter----[dbo].[DF_TPROT_TASK_AVA_REAL_PERC].sql
GO
ALTER TABLE [dbo].[TPROT_TASK] ADD CONSTRAINT [DF_TPROT_TASK_AVA_REAL_PERC] DEFAULT (0) FOR [AVA_REAL_PERC]
GO
--SqlScripter----[dbo].[DF_TPROT_TASK_AVA_WEIGHT_MODE].sql
GO
ALTER TABLE [dbo].[TPROT_TASK] ADD CONSTRAINT [DF_TPROT_TASK_AVA_WEIGHT_MODE] DEFAULT (0) FOR [AVA_WEIGHT_MODE]
GO
--SqlScripter----[dbo].[DF_TPROT_TASK_AVA_WEIGHT_PERC].sql
GO
ALTER TABLE [dbo].[TPROT_TASK] ADD CONSTRAINT [DF_TPROT_TASK_AVA_WEIGHT_PERC] DEFAULT (0) FOR [AVA_WEIGHT_PERC]
GO
--SqlScripter----[dbo].[DF_TPROT_TASK_L_CUMPLIDA].sql
GO
ALTER TABLE [dbo].[TPROT_TASK] ADD CONSTRAINT [DF_TPROT_TASK_L_CUMPLIDA] DEFAULT (0) FOR [L_CUMPLIDA]
GO
--SqlScripter----[dbo].[DF_TPROT_TASK_L_LEIDO].sql
GO
ALTER TABLE [dbo].[TPROT_TASK] ADD CONSTRAINT [DF_TPROT_TASK_L_LEIDO] DEFAULT (0) FOR [L_LEIDO]
GO
--SqlScripter----[dbo].[DF_TPROT_TASK_L_NOMOSTRAR].sql
GO
ALTER TABLE [dbo].[TPROT_TASK] ADD CONSTRAINT [DF_TPROT_TASK_L_NOMOSTRAR] DEFAULT (0) FOR [L_NOMOSTRAR]
GO
--SqlScripter----[dbo].[DF_TPROT_TASK_L_NOTIFICADOADM].sql
GO
ALTER TABLE [dbo].[TPROT_TASK] ADD CONSTRAINT [DF_TPROT_TASK_L_NOTIFICADOADM] DEFAULT (0) FOR [L_NOTIFICADOADM]
GO
--SqlScripter----[dbo].[DF_TPROT_TASK_L_TIENERELACIONADOS].sql
GO
ALTER TABLE [dbo].[TPROT_TASK] ADD CONSTRAINT [DF_TPROT_TASK_L_TIENERELACIONADOS] DEFAULT (0) FOR [L_TIENERELACIONADOS]
GO
--SqlScripter----[dbo].[DF_TPROT_TASK_TOT_DELAY].sql
GO
ALTER TABLE [dbo].[TPROT_TASK] ADD CONSTRAINT [DF_TPROT_TASK_TOT_DELAY] DEFAULT (0) FOR [TOT_DELAY]
GO
--SqlScripter----[dbo].[DEF_VAR_ACCIDENTES_XT_ETAPAS_CON_VENCIMIENTO].sql
GO
ALTER TABLE [dbo].[VAR_ACCIDENTES_XT] ADD CONSTRAINT [DEF_VAR_ACCIDENTES_XT_ETAPAS_CON_VENCIMIENTO] DEFAULT (0) FOR [ETAPAS_CON_VENCIMIENTO]
GO
--SqlScripter----[dbo].[DEF_VAR_ACCIONESCORRECTIVAS_ETAPAS_CON_VENCIMIENTO].sql
GO
ALTER TABLE [dbo].[VAR_ACCIONESCORRECTIVAS] ADD CONSTRAINT [DEF_VAR_ACCIONESCORRECTIVAS_ETAPAS_CON_VENCIMIENTO] DEFAULT (0) FOR [ETAPAS_CON_VENCIMIENTO]
GO
--SqlScripter----[dbo].[DEF_VAR_ACCIONESMEJORA_ETAPAS_CON_VENCIMIENTO].sql
GO
ALTER TABLE [dbo].[VAR_ACCIONESMEJORA] ADD CONSTRAINT [DEF_VAR_ACCIONESMEJORA_ETAPAS_CON_VENCIMIENTO] DEFAULT (0) FOR [ETAPAS_CON_VENCIMIENTO]
GO
--SqlScripter----[dbo].[DF_VAR_ACTIVIDADES_Mejora].sql
GO
ALTER TABLE [dbo].[VAR_ACTIVIDADES] ADD CONSTRAINT [DF_VAR_ACTIVIDADES_Mejora] DEFAULT (0) FOR [MEJORA]
GO
--SqlScripter----[dbo].[DF_VAR_DISENOPRODUCTOS_APROBADOLIBERADO].sql
GO
ALTER TABLE [dbo].[VAR_DISENOPRODUCTOS] ADD CONSTRAINT [DF_VAR_DISENOPRODUCTOS_APROBADOLIBERADO] DEFAULT (0) FOR [APROBADOLIBERADO]
GO
--SqlScripter----[dbo].[DEF_VAR_INCIDENTESINT_ETAPAS_CON_VENCIMIENTO].sql
GO
ALTER TABLE [dbo].[VAR_INCIDENTESINT] ADD CONSTRAINT [DEF_VAR_INCIDENTESINT_ETAPAS_CON_VENCIMIENTO] DEFAULT (0) FOR [ETAPAS_CON_VENCIMIENTO]
GO
--SqlScripter----[dbo].[DEF_VAR_NOCONFORMIDADES_ETAPAS_CON_VENCIMIENTO].sql
GO
ALTER TABLE [dbo].[VAR_NOCONFORMIDADES] ADD CONSTRAINT [DEF_VAR_NOCONFORMIDADES_ETAPAS_CON_VENCIMIENTO] DEFAULT (0) FOR [ETAPAS_CON_VENCIMIENTO]
GO
--SqlScripter----[dbo].[DF_VAR_OBJETIVOSCUAL_CUMPLIDO].sql
GO
ALTER TABLE [dbo].[VAR_OBJETIVOSCUAL] ADD CONSTRAINT [DF_VAR_OBJETIVOSCUAL_CUMPLIDO] DEFAULT (0) FOR [CUMPLIDO]
GO
--SqlScripter----[dbo].[DF_VAR_OBJETIVOSNUM_CUMPLIDO].sql
GO
ALTER TABLE [dbo].[VAR_OBJETIVOSNUM] ADD CONSTRAINT [DF_VAR_OBJETIVOSNUM_CUMPLIDO] DEFAULT (0) FOR [CUMPLIDO]
GO
--SqlScripter----[dbo].[DEF_VAR_QUEJAS_ETAPAS_CON_VENCIMIENTO].sql
GO
ALTER TABLE [dbo].[VAR_QUEJAS] ADD CONSTRAINT [DEF_VAR_QUEJAS_ETAPAS_CON_VENCIMIENTO] DEFAULT (0) FOR [ETAPAS_CON_VENCIMIENTO]
GO
--SqlScripter----[dbo].[DF_VAR_QUEJAS_CORRESPONDE].sql
GO
ALTER TABLE [dbo].[VAR_QUEJAS] ADD CONSTRAINT [DF_VAR_QUEJAS_CORRESPONDE] DEFAULT (0) FOR [CORRESPONDE]
GO
--SqlScripter----[dbo].[DF_VAR_REGISTRO_CONTACTOS_Estado].sql
GO
ALTER TABLE [dbo].[VAR_REGISTRO_CONTACTOS] ADD CONSTRAINT [DF_VAR_REGISTRO_CONTACTOS_Estado] DEFAULT (0) FOR [ESTADO]
GO
--SqlScripter----[dbo].[DF_VAR_SEGUIMIENTO_PLAZOS_MUESTRA_ASUNTOS_VERDE].sql
GO
ALTER TABLE [dbo].[VAR_SEGUIMIENTO_PLAZOS] ADD CONSTRAINT [DF_VAR_SEGUIMIENTO_PLAZOS_MUESTRA_ASUNTOS_VERDE] DEFAULT (0) FOR [MUESTRA_ASUNTOS_VERDE]
GO
--SqlScripter----[dbo].[DF_VAR_SEGUIMIENTO_PLAZOS_MUESTRA_TAREAS_VERDE].sql
GO
ALTER TABLE [dbo].[VAR_SEGUIMIENTO_PLAZOS] ADD CONSTRAINT [DF_VAR_SEGUIMIENTO_PLAZOS_MUESTRA_TAREAS_VERDE] DEFAULT (0) FOR [MUESTRA_TAREAS_VERDE]