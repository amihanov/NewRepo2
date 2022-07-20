
GO
--SqlScripter----[dbo].[DuplicadorJob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DuplicadorJob](
	[Id] [uniqueidentifier] NOT NULL,
	[Estado] [nvarchar](10) NULL,
	[FechaCreacion] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DuplicadorJobDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DuplicadorJobDetalle](
	[JobId] [uniqueidentifier] NOT NULL,
	[MensajeId] [uniqueidentifier] NOT NULL,
	[Error] [bit] NULL,
	[Detalles] [text] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[DuplicadorMensaje].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DuplicadorMensaje](
	[Id] [uniqueidentifier] NOT NULL,
	[TidOrigen] [nvarchar](4) NULL,
	[TidDestino] [nvarchar](4) NULL,
	[NomTidDestino] [nvarchar](10) NULL,
	[NumCtsn] [nvarchar](5) NULL,
	[AreaActual] [nvarchar](2) NULL,
	[AreaOrigen] [nvarchar](2) NULL,
	[NomUsen] [nvarchar](12) NULL,
	[NomUspr] [nvarchar](12) NULL,
	[FechaPrep] [nvarchar](8) NULL,
	[HoraPrep] [nvarchar](6) NULL,
	[Nse] [nvarchar](5) NULL,
	[NseFecha] [nvarchar](8) NULL,
	[NseHora] [nvarchar](6) NULL,
	[Texto] [varbinary](MAX) NULL,
	[LargoTexto] [nvarchar](4) NULL,
	[CodMensaje] [nvarchar](3) NULL,
	[CodPrioridad] [nvarchar](2) NULL,
	[IndAute] [nvarchar](1) NULL,
	[ResAute] [nvarchar](4) NULL,
	[CodBroadcast] [nvarchar](2) NULL,
	[Estado] [nvarchar](2) NULL,
	[FechaCreacion] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[TBJJNL01A].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TBJJNL01A](
	[IFI_COD_IFI] [char](4) NULL,
	[JNL_FEC_ENT] [char](10) NULL,
	[JNL_NSE] [char](5) NULL,
	[JNL_NOD_ORI] [char](12) NULL,
	[JNL_COD_EST] [char](1) NULL,
	[JNL_FEC_CTB] [char](10) NULL,
	[JNL_MNM] [char](4) NULL,
	[JNL_COD_MOD] [char](1) NULL,
	[JNL_START_TEXT] [char](1) NULL,
	[JNL_NUM_BYTES] [char](4) NULL,
	[JNL_NUM_BLQ] [char](2) NULL,
	[JNL_LARGO_TXT] [char](4) NULL,
	[JNL_LARGO_COLA] [char](2) NULL,
	[JNL_HOR_ENT] [char](10) NULL,
	[JNL_COD_MSG] [char](3) NULL,
	[JNL_TIP_PRI_MSG] [char](2) NULL,
	[JNL_NOD_DES] [char](12) NULL,
	[JNL_FEC_SAL] [char](10) NULL,
	[JNL_HOR_SAL] [char](8) NULL,
	[JNL_NSR] [char](5) NULL,
	[JNL_TRAILER] [char](150) NULL,
	[JNL_TIM_STA] [char](30) NULL,
	[JNL_TEXTO] [text] NULL,
	[CREATED_AT] [datetime] NOT NULL,
	[ID_Prueba] [int] NULL,
	[Consecutivo] [int] IDENTITY(1, 1)
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblBitacora].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblBitacora](
	[uIDBitacora] [uniqueidentifier] NOT NULL,
	[uTipo] [uniqueidentifier] NOT NULL,
	[uSubTipo] [uniqueidentifier] NULL,
	[dFechaInicio] [datetime] NULL,
	[dFechaFinalizacion] [datetime] NULL,
	[uIDUsuario] [uniqueidentifier] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblBitacoraDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblBitacoraDetalle](
	[vcOperacion] [varchar](30) NOT NULL,
	[xCamposAfectados] [xml] NULL,
	[dFechaModificacion] [datetime] NOT NULL,
	[uIDBitacora] [uniqueidentifier] NOT NULL,
	[vcTabla] [varchar](30) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblBroadcast].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblBroadcast](
	[vcNombre] [varchar](30) NOT NULL,
	[cIDBroadcast] [char](3) NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL,
	[cEstado] [char](16) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblBroadcastCliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblBroadcastCliente](
	[cIDBroadcast] [char](3) NOT NULL,
	[cClienteConmutadorCodigo] [char](12) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCalendario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblCalendario](
	[sdFecha] [datetime] NOT NULL,
	[cTipo] [uniqueidentifier] NOT NULL,
	[vcIDCalendario] [varchar](20) NOT NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblClienteConmutador].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblClienteConmutador](
	[cClienteConmutadorCodigo] [char](12) NOT NULL,
	[siControlIntentos] [smallint] NOT NULL,
	[vcNombre] [varchar](30) NOT NULL,
	[dFechaExpiracion] [datetime] NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL,
	[cRUT] [char](12) NOT NULL,
	[cCodigoInstitucion] [char](4) NOT NULL,
	[cEstado] [char](16) NOT NULL,
	[cPuerto] [char](4) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblClienteConmutadorDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblClienteConmutadorDetalle](
	[cClienteConmutadorCodigo] [char](12) NOT NULL,
	[Tipo] [uniqueidentifier] NOT NULL,
	[cValor] [char](255) NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblClienteMensajeAutorizad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblClienteMensajeAutorizad](
	[cIDTipoMensaje] [char](5) NOT NULL,
	[bEnviar] [bit] NULL,
	[bRecibir] [bit] NULL,
	[cClienteConmutadorCodigo] [char](12) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblComponenteDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblComponenteDetalle](
	[vcNombre] [varchar](30) NOT NULL,
	[cCodigo] [char](18) NULL,
	[vcDescripcion] [varchar](200) NULL,
	[cTipoDato] [char](18) NULL,
	[siLargo] [smallint] NULL,
	[siPosiInicial] [smallint] NULL,
	[siPosiFinal] [smallint] NULL,
	[cPrefijo] [char](18) NULL,
	[cSufijo] [char](18) NULL,
	[cValorPermitido] [char](18) NULL,
	[xCampo] [xml] NULL,
	[cIDComponenteDetalle] [char](50) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblFormulario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblFormulario](
	[cCodigoFormulario] [char](10) NOT NULL,
	[vcNombre] [varchar](30) NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[hJerarquia] [hierarchyid] NOT NULL,
	[vcRuta] [varchar](255) NOT NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL,
	[cEstado] [char](16) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblFormularioSeccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblFormularioSeccion](
	[cCodigoFormulario] [char](10) NOT NULL,
	[vcFormularioSeccionNombre] [varchar](30) NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[uIDFormularioSeccion] [uniqueidentifier] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblInformeClave].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblInformeClave](
	[iNumeroSolicitud] [int] NULL,
	[vcSolicitante] [varchar](40) NULL,
	[cTipoGenerador] [char](10) NOT NULL,
	[uGenerador] [uniqueidentifier] NOT NULL,
	[dFechaRegistro] [datetime] NOT NULL,
	[uCausa] [uniqueidentifier] NOT NULL,
	[uSubCausa] [uniqueidentifier] NOT NULL,
	[vcDetalleCausa] [varchar](200) NULL,
	[uIDSecuenciaClave] [uniqueidentifier] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMensaje_DU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblMensaje_DU](
	[cIfiCodIfi] [char](4) NULL,
	[cFecEnt] [char](10) NULL,
	[cNse] [char](5) NULL,
	[cNodOri] [char](12) NULL,
	[cCodEst] [char](1) NULL,
	[cFecCtb] [char](10) NULL,
	[cMnm] [char](4) NULL,
	[cCodMod] [char](1) NULL,
	[cStartText] [char](1) NULL,
	[cNumBytes] [char](4) NULL,
	[cNumBlq] [char](2) NULL,
	[cLargoTxt] [char](4) NULL,
	[cLargoCola] [char](2) NULL,
	[cHorEnt] [char](10) NULL,
	[cCodMsg] [char](3) NULL,
	[cTipPriMsg] [char](2) NULL,
	[dNodDes] [char](12) NULL,
	[dFecSal] [char](10) NULL,
	[dHorSal] [char](8) NULL,
	[dNsr] [char](5) NULL,
	[cTrailer] [char](150) NULL,
	[cTimSta] [char](30) NULL,
	[teTexto] [text] NULL,
	[dCreatedAt] [datetime] NOT NULL,
	[iIdPrueba] [int] NULL,
	[iConsecutivo] [int] IDENTITY(1, 1)
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMensajeComponente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblMensajeComponente](
	[cTipo] [char](18) NULL,
	[cCodificacion] [char](18) NULL,
	[cCifrado] [char](18) NULL,
	[cEscala] [char](18) NULL,
	[cMedidaMinima] [char](18) NULL,
	[cMedidaMaxima] [char](18) NULL,
	[IDMensajeComponente] [char](18) NOT NULL,
	[cIDTipoMensaje] [char](5) NOT NULL,
	[cIDComponenteDetalle] [char](50) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblMenu](
	[cCodigo] [char](18) NOT NULL,
	[hJerarquia] [hierarchyid] NOT NULL,
	[vcMenuNombre] [varchar](30) NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[cCodigoFormulario] [char](10) NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL,
	[cEstado] [char](16) NOT NULL
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
	[uIDParametro] [uniqueidentifier] NOT NULL,
	[cClase] [char](20) NOT NULL,
	[cSubClase] [char](20) NULL,
	[vcValor] [varchar](50) NOT NULL,
	[vcNombre] [varchar](50) NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[bReservado] [bit] NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL,
	[cTaxon] [char](9) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblParametro_DU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblParametro_DU](
	[cError] [varchar](255) NULL,
	[cCodTida] [varchar](4) NULL,
	[cNumCtsn] [varchar](5) NULL,
	[cAreActu] [varchar](2) NULL,
	[cFecPrep] [varchar](8) NULL,
	[cHorPrep] [varchar](6) NULL,
	[dCreatedAt] [datetime] NOT NULL
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
	[vcNombre] [varchar](30) NOT NULL,
	[uIDRol] [uniqueidentifier] NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[uIDPerfil] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[cEstado] [char](16) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPerfilFormulario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblPerfilFormulario](
	[cCodigoFormulario] [char](10) NOT NULL,
	[uIDRol] [uniqueidentifier] NOT NULL,
	[cAccion] [char](18) NOT NULL,
	[Audita] [bit] NULL,
	[uIDPerfil] [uniqueidentifier] NOT NULL,
	[uIDFormularioSeccion] [uniqueidentifier] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRol](
	[uIDRol] [uniqueidentifier] NOT NULL,
	[vcNombre] [varchar](30) NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL,
	[cEstado] [char](16) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblSecuenciaClave].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblSecuenciaClave](
	[dFechaRegistro] [datetime] NULL,
	[uIdAsignacion] [uniqueidentifier] NOT NULL,
	[cClienteConmutadorCodigo] [char](12) NULL,
	[iSecuenciaClaveSecuencia] [int] NOT NULL,
	[cSecuenciaClaveClave] [char](30) NOT NULL,
	[siSecuenciaClaveCant] [smallint] NULL,
	[uIDSecuenciaClave] [uniqueidentifier] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTextoSistema].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTextoSistema](
	[uIDTextoSistema] [uniqueidentifier] NOT NULL,
	[uTipo] [uniqueidentifier] NOT NULL,
	[vcNombre] [varchar](50) NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[bReservado] [bit] NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL,
	[cEstado] [uniqueidentifier] NOT NULL,
	[uSubTipo] [uniqueidentifier] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTipoMensaje].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTipoMensaje](
	[cIDTipoMensaje] [char](5) NOT NULL,
	[cCategoria] [char](15) NOT NULL,
	[vcNombre] [varchar](50) NOT NULL,
	[cProtocolo] [char](18) NULL,
	[cPrioridadSistema] [char](13) NOT NULL,
	[iRetardo] [int] NULL,
	[siReintentos] [smallint] NULL,
	[siLímiteDiario] [smallint] NULL,
	[bPermiteBroadcast] [bit] NULL,
	[siTiempodeCaducidad] [smallint] NULL,
	[siTiempoAlmacenamiento] [smallint] NULL,
	[siTiempoenCache] [smallint] NULL,
	[vcDescripcion] [varchar](200) NULL,
	[bFactura] [bit] NULL,
	[cPrioridad] [char](13) NOT NULL,
	[stLimiteHorario] [datetime] NULL,
	[cNemonico] [char](4) NOT NULL,
	[bValidaPerfil] [bit] NOT NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL,
	[cEstado] [char](18) NOT NULL
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
	[uIDUsuario] [uniqueidentifier] NOT NULL,
	[cRUT] [char](12) NOT NULL,
	[vcNombre] [varchar](30) NOT NULL,
	[vcApellido] [varchar](30) NOT NULL,
	[sdFechaCreacion] [datetime] NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL,
	[cEstado] [char](16) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuarioAsignacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblUsuarioAsignacion](
	[uIDUsuario] [uniqueidentifier] NOT NULL,
	[dFechaAsignacion] [datetime] NOT NULL,
	[uTipoRecurso] [uniqueidentifier] NULL,
	[uSubTipoRecurso] [uniqueidentifier] NULL,
	[cCodigoActivoFijo] [char](18) NULL,
	[vcDescripcion] [varchar](200) NULL,
	[xMetaDataRecurso] [xml] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuarioDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblUsuarioDetalle](
	[uTipo] [uniqueidentifier] NULL,
	[Valor] [varchar](50) NULL,
	[uIDUsuario] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblUsuarioRol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblUsuarioRol](
	[uIDUsuario] [uniqueidentifier] NOT NULL,
	[dFechaActivacion] [datetime] NOT NULL,
	[dFechaExpiracion] [datetime] NULL,
	[uIDRol] [uniqueidentifier] NOT NULL,
	[cUsuarioRolEstado] [char](16) NOT NULL
)
ON [PRIMARY]
