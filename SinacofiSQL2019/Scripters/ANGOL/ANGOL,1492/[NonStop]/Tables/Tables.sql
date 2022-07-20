
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
--SqlScripter----[dbo].[sysdiagrams].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1, 1),
	[version] [int] NULL,
	[definition] [varbinary](MAX) NULL
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
--SqlScripter----[dbo].[tblAviso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblAviso](
	[uIDAviso] [uniqueidentifier] NOT NULL,
	[uIDUsuario] [uniqueidentifier] NOT NULL,
	[cClienteConmutadorCodigo] [char](12) NOT NULL,
	[dFechaCreacion] [datetime] NOT NULL,
	[vcAviso] [varchar](4000) NOT NULL
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
	[uIDUsuario] [uniqueidentifier] NOT NULL,
	[uTipo] [uniqueidentifier] NOT NULL,
	[uSubTipo] [uniqueidentifier] NULL,
	[dFechaInicio] [datetime] NULL,
	[dFechaFinalizacion] [datetime] NULL
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
	[uIDBitacora] [uniqueidentifier] NOT NULL,
	[vcOperacion] [varchar](30) NOT NULL,
	[vcTabla] [varchar](30) NOT NULL,
	[xCamposAfectados] [xml] NULL,
	[dFechaModificacion] [datetime] NOT NULL
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
	[cIDBroadcast] [char](3) NOT NULL,
	[vcNombre] [varchar](30) NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[cEstado] [char](16) NOT NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
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
	[vcIDCalendario] [varchar](20) NOT NULL,
	[cTipo] [uniqueidentifier] NOT NULL,
	[sdFecha] [smalldatetime] NOT NULL,
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
	[cCodigoInstitucion] [char](4) NOT NULL,
	[cRUT] [char](12) NOT NULL,
	[vcNombre] [varchar](30) NOT NULL,
	[siControlIntentos] [smallint] NOT NULL,
	[cPuerto] [char](4) NOT NULL,
	[cEstado] [char](16) NOT NULL,
	[bVigente] [bit] NOT NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
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
	[cClienteConmutadorCodigo] [char](12) NOT NULL,
	[bRecibir] [bit] NULL,
	[bEnviar] [bit] NULL
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
	[cIDComponenteDetalle] [char](50) NOT NULL,
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
	[xCampo] [xml] NULL
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
	[cEstado] [char](16) NOT NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
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
	[uIDSecuenciaClave] [uniqueidentifier] NOT NULL,
	[iNumeroSolicitud] [int] NULL,
	[vcSolicitante] [varchar](40) NULL,
	[cTipoGenerador] [char](10) NOT NULL,
	[uGenerador] [uniqueidentifier] NOT NULL,
	[dFechaRegistro] [datetime] NOT NULL,
	[uCausa] [uniqueidentifier] NOT NULL,
	[uSubCausa] [uniqueidentifier] NOT NULL,
	[vcDetalleCausa] [varchar](200) NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMensaje].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblMensaje](
	[uIDMensaje] [uniqueidentifier] NOT NULL,
	[dFechaCreacion] [datetime] NOT NULL,
	[dFechaIngreso] [datetime] NULL,
	[dFechaEntrega] [datetime] NULL,
	[cIDTipoMensaje] [char](5) NULL,
	[cMensajeCodigo] [char](5) NULL,
	[cTipoEmisor] [char](18) NULL,
	[cEmisor] [char](12) NOT NULL,
	[cTipoDestino] [char](11) NULL,
	[cDestino] [char](12) NULL,
	[cMensajePrioridad] [char](18) NULL,
	[vcMensajeTexto] [varchar](4000) NULL,
	[siBloques] [smallint] NULL,
	[siLargoTexto] [smallint] NULL,
	[siLargoTrailer] [smallint] NULL,
	[cTrailer] [char](150) NULL,
	[cNumeroSerialConexion] [int] NULL,
	[cEstadoEnvio] [char](18) NULL,
	[cNSE] [int] NOT NULL,
	[cNSR] [int] NOT NULL,
	[siTamagno] [smallint] NULL,
	[cPrioridadConmutador] [char](18) NULL
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
--SqlScripter----[dbo].[tblMensajeClasificado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblMensajeClasificado](
	[cIDTipoMensaje] [char](5) NOT NULL
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
	[IDMensajeComponente] [char](18) NOT NULL,
	[cIDTipoMensaje] [char](5) NOT NULL,
	[cTipo] [char](18) NULL,
	[cCodificacion] [char](18) NULL,
	[cCifrado] [char](18) NULL,
	[cEscala] [char](18) NULL,
	[cMedidaMinima] [char](18) NULL,
	[cMedidaMaxima] [char](18) NULL,
	[cIDComponenteDetalle] [char](50) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMensajeEstado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblMensajeEstado](
	[uIDMensaje] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL,
	[cMensajeEstado] [char](20) NULL,
	[vcDescripcion] [varchar](200) NULL
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
	[vcMenuNombre] [varchar](30) NOT NULL,
	[hJerarquia] [hierarchyid] NOT NULL,
	[cCodigoFormulario] [char](10) NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[cEstado] [char](16) NOT NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblNSEMensajeSistema].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblNSEMensajeSistema](
	[cIDMensaje] [char](5) NULL,
	[cNSE] [int] NOT NULL
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
	[vcNombre] [varchar](50) NOT NULL,
	[cClase] [char](20) NOT NULL,
	[cSubClase] [char](20) NOT NULL,
	[cDivision] [varchar](255) NOT NULL,
	[hJerarquia] [hierarchyid] NULL,
	[vcValor] [varchar](3000) NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[bReservado] [bit] NOT NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
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
	[uIDRol] [uniqueidentifier] NOT NULL,
	[cCodigo] [char](18) NOT NULL,
	[bCrear] [bit] NOT NULL,
	[bActualizar] [bit] NOT NULL,
	[bConsultar] [bit] NOT NULL,
	[bEliminar] [bit] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblProceso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblProceso](
	[uIDProceso] [uniqueidentifier] NOT NULL,
	[vcProceso] [varchar](30) NULL,
	[uCategoria] [uniqueidentifier] NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblProgramacionProceso].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblProgramacionProceso](
	[vcIDCalendario] [varchar](20) NOT NULL,
	[cTipo] [uniqueidentifier] NOT NULL,
	[sdFecha] [smalldatetime] NOT NULL,
	[uIDProceso] [uniqueidentifier] NULL,
	[stHoraInicial] [datetime] NULL,
	[stHoraFinal] [datetime] NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRegistroDiarioSecuencia].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRegistroDiarioSecuencia](
	[uIDRegistroDiario] [uniqueidentifier] NOT NULL,
	[cClienteConmutadorCodigo] [char](12) NOT NULL,
	[dFechaResumen] [datetime] NOT NULL,
	[dFechaPrimeraConexion] [datetime] NOT NULL,
	[dFechaUltimaConexion] [datetime] NULL,
	[cNSEInicial] [int] NOT NULL,
	[cNSEFinal] [int] NOT NULL,
	[cNSRInicial] [int] NOT NULL,
	[cNSRFinal] [int] NOT NULL,
	[cNSCInicial] [char](5) NOT NULL,
	[cNSCFinal] [char](5) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRegistroDiarioTotales].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRegistroDiarioTotales](
	[uIDRegistroDiario] [uniqueidentifier] NOT NULL,
	[cConcepto] [char](18) NOT NULL,
	[siTotal] [smallint] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRegistroSesionCliente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRegistroSesionCliente](
	[uIDRegistroSesion] [uniqueidentifier] NOT NULL,
	[cClienteConmutadorCodigo] [char](12) NOT NULL,
	[dFechaConexion] [datetime] NOT NULL,
	[dFechaDesconexion] [datetime] NULL,
	[cNumeroSecuencia] [char](18) NOT NULL
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
	[cEstado] [char](16) NOT NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
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
	[uIDSecuenciaClave] [uniqueidentifier] NOT NULL,
	[cClienteConmutadorCodigo] [char](12) NOT NULL,
	[iSecuencia] [int] NOT NULL,
	[cClave] [char](30) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTarea].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTarea](
	[uIDTarea] [uniqueidentifier] NOT NULL,
	[uIDProceso] [uniqueidentifier] NOT NULL,
	[vcTareaNombre] [varchar](30) NOT NULL,
	[hJerarquia] [hierarchyid] NULL,
	[uTipo] [uniqueidentifier] NOT NULL,
	[uSubTipo] [uniqueidentifier] NOT NULL,
	[dFechaCreacion] [datetime] NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[xParametro] [xml] NULL,
	[bGeneraAlertaExito] [bit] NULL,
	[bGeneraAlertaFallo] [bit] NULL,
	[bRequiereSupervicion] [bit] NULL,
	[bEsIterativo] [bit] NULL,
	[stTiempoEspera] [datetime] NULL,
	[siOrden] [smallint] NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTareaHistorial].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTareaHistorial](
	[uIDTarea] [uniqueidentifier] NOT NULL,
	[uIDProceso] [uniqueidentifier] NOT NULL,
	[dFechaEjecucion] [datetime] NULL,
	[dFechaInicio] [datetime] NULL,
	[dFechaFinalizacion] [datetime] NULL,
	[xResultado] [xml] NULL,
	[cEjecutor] [char](18) NULL
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
	[cGrupo] [char](3) NOT NULL,
	[cCodigo] [char](4) NOT NULL,
	[vcDescripcion] [varchar](200) NULL,
	[bReservado] [bit] NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
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
	[vcNombre] [varchar](50) NOT NULL,
	[cCategoria] [char](15) NOT NULL,
	[cPrioridadSistema] [char](13) NOT NULL,
	[cPrioridad] [char](13) NOT NULL,
	[siLímiteDiario] [smallint] NULL,
	[bPermiteBroadcast] [bit] NULL,
	[vcDescripcion] [varchar](200) NULL,
	[bFacturable] [bit] NULL,
	[stLimiteHorario] [datetime] NULL,
	[cNemonico] [char](4) NOT NULL,
	[cEstado] [char](8) NOT NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblTransaccion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblTransaccion](
	[uIDRegistroSesion] [uniqueidentifier] NOT NULL,
	[uIDMensaje] [uniqueidentifier] NULL,
	[dFechaModificacion] [datetime] NOT NULL,
	[cOperacion] [char](15) NOT NULL,
	[cEstado] [char](10) NOT NULL,
	[vcDescripcion] [varchar](200) NULL
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
	[cEstado] [char](16) NOT NULL,
	[sdFechaCreacion] [smalldatetime] NOT NULL,
	[uUsuarioModifica] [uniqueidentifier] NOT NULL,
	[dFechaModificacion] [datetime] NOT NULL
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
	[uTipoRecurso] [uniqueidentifier] NULL,
	[uSubTipoRecurso] [uniqueidentifier] NULL,
	[cCodigoActivoFijo] [char](18) NULL,
	[vcDescripcion] [varchar](200) NULL,
	[xMetaDataRecurso] [xml] NULL,
	[dFechaAsignacion] [datetime] NOT NULL
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
	[uIDUsuario] [uniqueidentifier] NOT NULL,
	[uTipo] [uniqueidentifier] NOT NULL,
	[vcValor] [varchar](255) NOT NULL,
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
	[uIDRol] [uniqueidentifier] NOT NULL,
	[dFechaActivacion] [datetime] NOT NULL,
	[dFechaExpiracion] [datetime] NULL,
	[cEstado] [char](16) NOT NULL
)
ON [PRIMARY]
