
GO
--SqlScripter----[dbo].[tbl_casi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_casi](
	[cod_casi] [varchar](8) NOT NULL,
	[des_casi] [varchar](30) NOT NULL,
	[cod_inst] [varchar](4) NOT NULL,
	[usu_cnxn] [varchar](8) NOT NULL,
	[pas_cnxn] [varchar](8) NOT NULL,
	[dir_entr] [varchar](50) NOT NULL,
	[dir_sali] [varchar](50) NOT NULL,
	[dir_buzo] [varchar](50) NOT NULL,
	[flg_freg] [varchar](1) NOT NULL,
	[flg_gavi] [varchar](1) NOT NULL,
	[flg_gnot] [varchar](1) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_cdex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_cdex](
	[cod_cdex] [varchar](8) NOT NULL,
	[cod_serv] [varchar](8) NOT NULL,
	[cod_inst] [varchar](4) NOT NULL,
	[des_cdex] [varchar](40) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_cerr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_cerr](
	[cod_erro] [varchar](7) NOT NULL,
	[des_erro] [varchar](70) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_corr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_corr](
	[cod_inst] [varchar](4) NOT NULL,
	[cor_actu] [int] NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_desc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_desc](
	[tip_desc] [varchar](5) NOT NULL,
	[cod_desc] [varchar](10) NOT NULL,
	[des_desc] [varchar](100) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_dest].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_dest](
	[cod_prod] [varchar](6) NOT NULL,
	[cod_inst] [varchar](4) NOT NULL,
	[cod_serv] [varchar](8) NOT NULL,
	[cas_dest] [varchar](8) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_estadomigracion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_estadomigracion](
	[c1] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_estr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_estr](
	[cod_msg] [varchar](3) NOT NULL,
	[des_msg] [varchar](20) NOT NULL,
	[nom_msg] [varchar](3) NOT NULL,
	[lrg_msg] [int] NOT NULL,
	[bq1_msg] [varchar](255) NOT NULL,
	[bq2_msg] [varchar](255) NOT NULL,
	[bq3_msg] [varchar](255) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_estt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_estt](
	[est_traz] [varchar](2) NOT NULL,
	[des_traz] [varchar](30) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_feri].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_feri](
	[fec_feri] [datetime2](3) NOT NULL,
	[des_feri] [varchar](50) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_hpro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_hpro](
	[ide_traz] [int] NULL,
	[est_traz] [varchar](2) NOT NULL,
	[cod_prod] [varchar](6) NOT NULL,
	[cod_inst] [varchar](4) NOT NULL,
	[cod_casi] [varchar](8) NOT NULL,
	[cod_serv] [varchar](8) NOT NULL,
	[nom_arch] [varchar](50) NOT NULL,
	[tam_arch] [float] NOT NULL,
	[fec_rece] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_hres].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_hres](
	[cor_resc] [int] NOT NULL,
	[cas_dest] [varchar](8) NOT NULL,
	[nom_msg] [varchar](3) NOT NULL,
	[nom_arch] [varchar](20) NOT NULL,
	[cas_orig] [varchar](8) NULL,
	[tam_arch] [float] NOT NULL,
	[est_resc] [varchar](2) NOT NULL,
	[est_fres] [varchar](2) NOT NULL,
	[fec_arch] [datetime2](3) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_htra].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_htra](
	[ide_traz] [int] NOT NULL,
	[est_traz] [varchar](2) NOT NULL,
	[cas_orig] [varchar](8) NULL,
	[cas_dest] [varchar](8) NULL,
	[nom_arcc] [varchar](20) NOT NULL,
	[nom_arre] [varchar](34) NOT NULL,
	[tam_arch] [float] NULL,
	[fec_rece] [datetime2](3) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_inst](
	[cod_inst] [varchar](4) NOT NULL,
	[nom_inst] [varchar](40) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_limp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_limp](
	[ide_traz] [int] NOT NULL,
	[est_limp] [varchar](2) NOT NULL,
	[est_tarc] [varchar](2) NULL,
	[est_tpro] [varchar](2) NULL,
	[cas_orig] [varchar](8) NULL,
	[cas_dest] [varchar](8) NULL,
	[nom_arch] [varchar](20) NOT NULL,
	[tam_arch] [float] NULL,
	[fec_rece] [datetime2](3) NOT NULL,
	[fec_boar] [datetime2](3) NOT NULL,
	[fec_botr] [datetime2](3) NOT NULL,
	[cod_prod] [varchar](6) NULL,
	[cod_inst] [varchar](4) NULL,
	[cod_serv] [varchar](8) NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_opca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_opca](
	[ide_traz] [int] NOT NULL,
	[cod_erro] [varchar](7) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_oppr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_oppr](
	[ide_traz] [int] NULL,
	[est_traz] [varchar](2) NOT NULL,
	[cod_prod] [varchar](6) NOT NULL,
	[cod_inst] [varchar](4) NOT NULL,
	[cod_casi] [varchar](8) NOT NULL,
	[cod_serv] [varchar](8) NOT NULL,
	[nom_arch] [varchar](50) NOT NULL,
	[tam_arch] [float] NOT NULL,
	[cod_erro] [varchar](7) NOT NULL,
	[fec_rece] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_param].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_param](
	[swlimp] [varchar](1) NOT NULL,
	[swrut] [varchar](1) NOT NULL,
	[swsrut] [varchar](1) NOT NULL,
	[swdre] [varchar](1) NOT NULL,
	[swsdr] [varchar](1) NOT NULL,
	[ide_traz] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_prod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_prod](
	[cod_prod] [varchar](6) NOT NULL,
	[des_prod] [varchar](40) NOT NULL,
	[dir_entr] [varchar](50) NOT NULL,
	[dir_sali] [varchar](50) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_resc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_resc](
	[cor_resc] [int] NOT NULL,
	[cas_dest] [varchar](8) NOT NULL,
	[nom_msg] [varchar](3) NOT NULL,
	[nom_arch] [varchar](20) NOT NULL,
	[cas_orig] [varchar](8) NULL,
	[tam_arch] [float] NOT NULL,
	[est_resc] [varchar](2) NOT NULL,
	[est_fres] [varchar](2) NOT NULL,
	[fec_arch] [datetime2](3) NOT NULL,
	[fec_resc] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_serv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_serv](
	[cod_serv] [varchar](8) NOT NULL,
	[des_serv] [varchar](40) NOT NULL,
	[tip_serv] [varchar](1) NOT NULL,
	[dip_serv] [varchar](255) NOT NULL,
	[dir_sali] [varchar](50) NOT NULL,
	[dir_entr] [varchar](50) NOT NULL,
	[dir_buzo] [varchar](50) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_tarc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_tarc](
	[ide_traz] [int] NOT NULL,
	[est_traz] [varchar](2) NOT NULL,
	[cas_orig] [varchar](8) NULL,
	[cas_dest] [varchar](8) NULL,
	[nom_arcc] [varchar](20) NOT NULL,
	[nom_arre] [varchar](34) NOT NULL,
	[tam_arch] [float] NULL,
	[fec_rece] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_tmp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_tmp](
	[nom_msg] [varchar](3) NULL,
	[nom_arch] [varchar](20) NULL,
	[fec_resc] [datetime2](3) NULL,
	[fec_arch] [datetime2](3) NULL,
	[nom_inst] [varchar](30) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_tpro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_tpro](
	[ide_traz] [int] NULL,
	[est_traz] [varchar](2) NOT NULL,
	[cod_prod] [varchar](6) NOT NULL,
	[cod_inst] [varchar](4) NOT NULL,
	[cod_casi] [varchar](8) NOT NULL,
	[cod_serv] [varchar](8) NOT NULL,
	[nom_arch] [varchar](50) NOT NULL,
	[tam_arch] [float] NOT NULL,
	[fec_rece] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_user](
	[cod_inst] [varchar](4) NOT NULL,
	[cod_user] [varchar](8) NOT NULL,
	[pas_user] [varchar](8) NOT NULL,
	[nom_user] [varchar](20) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblConfigLogTrazabilidad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblConfigLogTrazabilidad](
	[iIdActividad] [int] NOT NULL,
	[iIdModulo] [int] NOT NULL,
	[iDestinoLog] [int] NOT NULL,
	[vcDescripcion] [varchar](255) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCorrelativo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblCorrelativo](
	[vcCodigoTipoArchivo] [varchar](6) NOT NULL,
	[vcCodigoInstitucionOrigen] [varchar](4) NOT NULL,
	[vcFechaGeneracion] [varchar](8) NOT NULL,
	[iNumeroCorrelativo] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCorrelativoR04R05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblCorrelativoR04R05](
	[iCorrelativoR04] [int] NOT NULL,
	[iCorrelativoR05] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblEnvioAutomR04R05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblEnvioAutomR04R05](
	[cCodigoInstitucion] [char](4) NOT NULL,
	[cNombreInstitucion] [char](32) NOT NULL,
	[vcCasilla] [varchar](8) NOT NULL,
	[cNombreArchivoR04] [char](32) NOT NULL,
	[cArchivoTransformadoR04] [char](32) NOT NULL,
	[cNombreArchivoR05] [char](32) NOT NULL,
	[cArchivoTransformadoR05] [char](32) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMsAlerta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblMsAlerta](
	[vcCodigoParametro] [varchar](10) NOT NULL,
	[vcMsgAsunto] [varchar](255) NOT NULL,
	[vcMsgTexto] [varchar](255) NOT NULL,
	[vcMsgFirma] [varchar](255) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblParametro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblParametro](
	[vcCodigoParametro] [varchar](10) NOT NULL,
	[vcDescripcionParametro] [varchar](50) NOT NULL,
	[vcValorParametro] [varchar](255) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPassword].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblPassword](
	[vcCodigoUsuario] [varchar](15) NOT NULL,
	[vcPassword] [varchar](50) NOT NULL,
	[vcIniPassword] [varchar](14) NOT NULL,
	[vcFinPassword] [varchar](14) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblPerfil](
	[vcCodigoPerfil] [varchar](2) NOT NULL,
	[vcDescripcionPerfil] [varchar](50) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPrivilegio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblPrivilegio](
	[vcCodigoPrivilegio] [varchar](10) NOT NULL,
	[vcDescripcionPrivilegio] [varchar](100) NOT NULL,
	[vcDireccionHttp] [varchar](255) NOT NULL,
	[iNivelUrl] [int] NULL,
	[vcCodPrivPadre] [varchar](10) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRegistroLogTrazabilidad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRegistroLogTrazabilidad](
	[vcFechaRegistro] [varchar](8) NOT NULL,
	[vcHoraRegistro] [varchar](6) NOT NULL,
	[iIdModulo] [int] NOT NULL,
	[iIdActividad] [int] NOT NULL,
	[vcCodigoUsuario] [varchar](15) NOT NULL,
	[vcActividad] [varchar](255) NOT NULL,
	[vcIpUsuario] [varchar](20) NOT NULL,
	[vcDetalle] [varchar](255) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRelPrivilegioPerfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRelPrivilegioPerfil](
	[vcCodigoPrivilegio] [varchar](10) NOT NULL,
	[vcCodigoPerfil] [varchar](2) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRelTipoArchivoUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRelTipoArchivoUsuario](
	[vcCodigoUsuario] [varchar](15) NOT NULL,
	[vcCodigoTipoArchivo] [varchar](6) NOT NULL,
	[vcTratoArchivo] [varchar](1) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTicket].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTicket](
	[vcCodigoTicket] [varchar](23) NOT NULL,
	[vcCodigoUsuarioSolicita] [varchar](15) NOT NULL,
	[vcCodigoUsuario] [varchar](15) NOT NULL,
	[vcCodigoInstitucion] [varchar](4) NOT NULL,
	[vcFechaSolicitud] [varchar](8) NOT NULL,
	[vcHoraSolicitud] [varchar](6) NOT NULL,
	[vcEstadoTicket] [varchar](1) NOT NULL,
	[vcFechaIngreso] [varchar](8) NULL,
	[vcHoraIngreso] [varchar](6) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTipoArchivo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTipoArchivo](
	[vcCodigoTipoArchivo] [varchar](6) NOT NULL,
	[vcNombreTipoArchivo] [varchar](50) NOT NULL,
	[iNumeroRespuestas] [int] NOT NULL,
	[vcFormatoNombreArchivo] [varchar](50) NOT NULL,
	[vcModoTransferencia] [varchar](1) NOT NULL,
	[iLargoRegistroArchivo] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTransDescarga].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTransDescarga](
	[iIdTrazaFT3] [int] NOT NULL,
	[vcCasillaOrigen] [varchar](8) NOT NULL,
	[vcCasillaDestino] [varchar](8) NOT NULL,
	[vcNombreArchivo] [varchar](20) NOT NULL,
	[vcFechaRecepcion] [varchar](8) NOT NULL,
	[vcHoraRecepcion] [varchar](6) NOT NULL,
	[vcUsuarioRescate] [varchar](15) NOT NULL,
	[vcFechaRescate] [varchar](8) NOT NULL,
	[vcHoraRescate] [varchar](6) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTransEnvio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTransEnvio](
	[vcFechaEnvio] [varchar](8) NOT NULL,
	[vcHoraEnvio] [varchar](6) NOT NULL,
	[vcUsuarioEnvio] [varchar](15) NOT NULL,
	[iRegistrosEnviados] [int] NOT NULL,
	[vcCodigoInstitucionOrigen] [varchar](4) NOT NULL,
	[vcCodigoInstitucionDestino] [varchar](4) NOT NULL,
	[vcCodigoCasilla] [varchar](8) NOT NULL,
	[vcCodigoTipoArchivo] [varchar](6) NOT NULL,
	[vcNombreArchivo] [varchar](50) NOT NULL,
	[vcNombreArchivoOriginal] [varchar](255) NOT NULL,
	[vcEstadoEnvio] [varchar](2) NOT NULL,
	[vcUsuarioRescate] [varchar](15) NULL,
	[vcFechaRescate] [varchar](8) NULL,
	[vcHoraRescate] [varchar](6) NULL,
	[vcEstadoRescate] [varchar](2) NULL,
	[vcTicket] [varchar](9) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTransRespuesta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTransRespuesta](
	[vcFechaEnvioFK] [varchar](8) NOT NULL,
	[vcHoraEnvioFK] [varchar](6) NOT NULL,
	[vcCodigoInstitucionOrigenFK] [varchar](4) NOT NULL,
	[vcCodigoInstitucionDestinoFK] [varchar](4) NOT NULL,
	[vcCodigoCasillaFK] [varchar](8) NOT NULL,
	[vcCodigoTipoArchivoFK] [varchar](6) NOT NULL,
	[vcNombreArchivoFK] [varchar](50) NOT NULL,
	[vcFechaEnvio] [varchar](8) NOT NULL,
	[vcHoraEnvio] [varchar](6) NOT NULL,
	[vcUsuarioEnvio] [varchar](15) NOT NULL,
	[iRegistrosEnviados] [int] NOT NULL,
	[vcCodigoInstitucionOrigen] [varchar](4) NOT NULL,
	[vcCodigoInstitucionDestino] [varchar](4) NOT NULL,
	[vcCodigoCasilla] [varchar](8) NOT NULL,
	[vcCodigoTipoArchivo] [varchar](6) NOT NULL,
	[vcNombreArchivo] [varchar](50) NOT NULL,
	[vcNombreArchivoOriginal] [varchar](255) NOT NULL,
	[vcEstadoEnvio] [varchar](2) NOT NULL,
	[vcUsuarioRescate] [varchar](15) NULL,
	[vcFechaRescate] [varchar](8) NULL,
	[vcHoraRescate] [varchar](6) NULL,
	[vcEstadoRescate] [varchar](2) NULL,
	[vcTicket] [varchar](9) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblUsuario](
	[vcCodigoUsuario] [varchar](15) NOT NULL,
	[vcCodigoPerfil] [varchar](2) NOT NULL,
	[vcCodigoInstitucion] [varchar](4) NOT NULL,
	[vcNombreUsuario] [varchar](100) NOT NULL,
	[vcDireccionEmail] [varchar](100) NOT NULL,
	[dFechaHoraIngreso] [datetime2](3) NULL,
	[vcEstadoUsuario] [varchar](2) NOT NULL,
	[vcCodigoCasilla] [varchar](8) NOT NULL,
	[iLoginFallidos] [int] NULL,
	[vcIdSession] [varchar](23) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[TEMP_ALERTA_BACKUP_LOG].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TEMP_ALERTA_BACKUP_LOG](
	[nameBD] [sysname] NOT NULL,
	[database_name] [nvarchar](128) NULL,
	[Tipo_Backup] [varchar](21) NULL,
	[FechaHora] [datetime] NULL
)
ON [PRIMARY]
