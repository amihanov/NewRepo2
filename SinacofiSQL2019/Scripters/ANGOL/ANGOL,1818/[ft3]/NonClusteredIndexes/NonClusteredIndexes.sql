
GO
--SqlScripter----[dbo].[tbl_casi].[in2_tbl_cas2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [in2_tbl_cas2] ON [dbo].[tbl_casi] (
	[cod_inst] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_casi].[in2_tbl_casi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [in2_tbl_casi] ON [dbo].[tbl_casi] (
	[cod_inst] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_cdex].[in2_tbl_cdex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [in2_tbl_cdex] ON [dbo].[tbl_cdex] (
	[cod_inst] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_desc].[in1_tbl_desc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [in1_tbl_desc] ON [dbo].[tbl_desc] (
	[tip_desc] ASC,
	[cod_desc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_estr].[in2_tbl_estr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [in2_tbl_estr] ON [dbo].[tbl_estr] (
	[nom_msg] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_hpro].[in2_tbl_hpro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [in2_tbl_hpro] ON [dbo].[tbl_hpro] (
	[cod_prod] ASC,
	[cod_inst] ASC,
	[cod_casi] ASC,
	[cod_serv] ASC,
	[nom_arch] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_htra].[in2_tbl_htra].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [in2_tbl_htra] ON [dbo].[tbl_htra] (
	[cas_orig] ASC,
	[cas_dest] ASC,
	[nom_arcc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_limp].[in2_tbl_limp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [in2_tbl_limp] ON [dbo].[tbl_limp] (
	[fec_rece] ASC)
INCLUDE (
	[cas_dest],
	[cas_orig],
	[cod_inst],
	[cod_prod],
	[cod_serv],
	[est_limp],
	[est_tarc],
	[est_tpro],
	[fec_boar],
	[fec_botr],
	[ide_traz],
	[nom_arch],
	[tam_arch]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_oppr].[in2_tbl_oppr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [in2_tbl_oppr] ON [dbo].[tbl_oppr] (
	[cod_prod] ASC,
	[cod_inst] ASC,
	[cod_casi] ASC,
	[cod_serv] ASC,
	[nom_arch] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_resc].[in2_tbl_resc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [in2_tbl_resc] ON [dbo].[tbl_resc] (
	[cor_resc] ASC,
	[cas_dest] ASC,
	[nom_arch] ASC,
	[fec_resc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_tarc].[in2_tbl_tarc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [in2_tbl_tarc] ON [dbo].[tbl_tarc] (
	[cas_orig] ASC,
	[cas_dest] ASC,
	[nom_arcc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_tpro].[in2_tbl_tpro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [in2_tbl_tpro] ON [dbo].[tbl_tpro] (
	[cod_prod] ASC,
	[cod_inst] ASC,
	[cod_casi] ASC,
	[cod_serv] ASC,
	[nom_arch] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCorrelativo].[idx_tblCorrelativo1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_tblCorrelativo1] ON [dbo].[tblCorrelativo] (
	[vcCodigoTipoArchivo] ASC,
	[vcCodigoInstitucionOrigen] ASC,
	[vcFechaGeneracion] ASC,
	[iNumeroCorrelativo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblParametro].[idx_tblParametro1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_tblParametro1] ON [dbo].[tblParametro] (
	[vcCodigoParametro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPassword].[idx_tblPassword1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_tblPassword1] ON [dbo].[tblPassword] (
	[vcCodigoUsuario] ASC,
	[vcIniPassword] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPerfil].[idx_tblPerfil1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_tblPerfil1] ON [dbo].[tblPerfil] (
	[vcCodigoPerfil] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRelPrivilegioPerfil].[idx_tblRelPrivilegioPerfil1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_tblRelPrivilegioPerfil1] ON [dbo].[tblRelPrivilegioPerfil] (
	[vcCodigoPrivilegio] ASC,
	[vcCodigoPerfil] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRelTipoArchivoUsuario].[idx_tblRelTipoArchivoUsuario1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_tblRelTipoArchivoUsuario1] ON [dbo].[tblRelTipoArchivoUsuario] (
	[vcCodigoUsuario] ASC,
	[vcCodigoTipoArchivo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTicket].[idx_tblTicket1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_tblTicket1] ON [dbo].[tblTicket] (
	[vcCodigoTicket] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTipoArchivo].[idx_tblTipoArchivo1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_tblTipoArchivo1] ON [dbo].[tblTipoArchivo] (
	[vcCodigoTipoArchivo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTransDescarga].[idx_tblTransDescarga1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_tblTransDescarga1] ON [dbo].[tblTransDescarga] (
	[iIdTrazaFT3] ASC,
	[vcCasillaOrigen] ASC,
	[vcCasillaDestino] ASC,
	[vcNombreArchivo] ASC,
	[vcFechaRecepcion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTransEnvio].[idx_tblTransEnvio1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_tblTransEnvio1] ON [dbo].[tblTransEnvio] (
	[vcFechaEnvio] ASC,
	[vcHoraEnvio] ASC,
	[vcCodigoInstitucionOrigen] ASC,
	[vcCodigoInstitucionDestino] ASC,
	[vcCodigoCasilla] ASC,
	[vcCodigoTipoArchivo] ASC,
	[vcNombreArchivo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTransEnvio].[idx_tblTransEnvio2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblTransEnvio2] ON [dbo].[tblTransEnvio] (
	[vcCodigoInstitucionDestino] ASC,
	[vcCodigoTipoArchivo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTransRespuesta].[idx_tblTransRespuesta1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_tblTransRespuesta1] ON [dbo].[tblTransRespuesta] (
	[vcFechaEnvio] ASC,
	[vcHoraEnvio] ASC,
	[vcCodigoInstitucionOrigen] ASC,
	[vcCodigoInstitucionDestino] ASC,
	[vcCodigoCasilla] ASC,
	[vcCodigoTipoArchivo] ASC,
	[vcNombreArchivo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTransRespuesta].[idx_tblTransRespuesta2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblTransRespuesta2] ON [dbo].[tblTransRespuesta] (
	[vcFechaEnvioFK] ASC,
	[vcHoraEnvioFK] ASC,
	[vcCodigoInstitucionOrigenFK] ASC,
	[vcCodigoInstitucionDestinoFK] ASC,
	[vcCodigoCasillaFK] ASC,
	[vcCodigoTipoArchivoFK] ASC,
	[vcNombreArchivoFK] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuario].[idx_tblUsuario1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_tblUsuario1] ON [dbo].[tblUsuario] (
	[vcCodigoUsuario] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuario].[idx_tblUsuario2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_tblUsuario2] ON [dbo].[tblUsuario] (
	[vcCodigoInstitucion] ASC,
	[vcCodigoUsuario] ASC
) ON [PRIMARY]
