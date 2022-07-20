
GO
--SqlScripter----[dbo].[actividad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[actividad](
	[codigo] [int] NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[categoria] [tinyint] NULL,
	[afecto] [bit] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[actividadContr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[actividadContr](
	[rutContribuyente] [float] NOT NULL,
	[codigo_actividad] [int] NOT NULL,
	[fecCreacion] [datetime] NULL,
	[afecto] [bit] NULL,
	[categoria] [tinyint] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[archivo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[archivo](
	[Id] [int] IDENTITY(1, 1),
	[idEmpresa] [int] NOT NULL,
	[rutContribuyente] [bigint] NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[fecha] [datetime] NULL,
	[codRespuesta] [float] NULL,
	[fec_carpeta] [bigint] NOT NULL,
	[data] [ntext] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[autorizaform].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[autorizaform](
	[idEmpresa] [float] NOT NULL,
	[folio] [bigint] NOT NULL,
	[fecCreacion] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[carpeta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[carpeta](
	[Id] [float] NULL,
	[orden] [float] NULL,
	[form] [nvarchar](255) NULL,
	[folio] [nvarchar](255) NULL,
	[rut] [float] NULL,
	[dv] [nvarchar](255) NULL,
	[Anio] [float] NULL,
	[Mes] [float] NULL,
	[COD_18] [nvarchar](255) NULL,
	[COD_25] [nvarchar](255) NULL,
	[COD_36] [nvarchar](255) NULL,
	[COD_158] [nvarchar](255) NULL,
	[COD_305] [nvarchar](255) NULL,
	[COD_611] [nvarchar](255) NULL,
	[COD_91] [float] NULL,
	[COD_502] [float] NULL,
	[COD_520] [float] NULL,
	[COD_538] [float] NULL,
	[COD_563] [nvarchar](255) NULL,
	[verificado] [nvarchar](255) NULL,
	[procesado] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[consulta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[consulta](
	[idCons] [int] IDENTITY(1, 1),
	[idEmpresa] [int] NULL,
	[idContrato] [int] NULL,
	[idUsuario] [int] NULL,
	[idServicio] [int] NULL,
	[fechaCons] [datetime] NULL,
	[ipUsuario] [nvarchar](20) NULL,
	[rutCons] [int] NULL,
	[parametro] [nvarchar](20) NULL,
	[codRespuesta] [int] NULL,
	[origenDato] [nvarchar](4) NULL,
	[tab] [char](3) NULL,
	[idMenu] [tinyint] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[contrato].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[contrato](
	[idContrato] [int] IDENTITY(1, 1),
	[idEmpresa] [float] NULL,
	[fecha] [datetime] NULL,
	[vigente] [float] NULL,
	[fechaExp] [nvarchar](255) NULL,
	[fechaIni] [nvarchar](255) NULL,
	[cantConsultas] [float] NULL,
	[contConsultas] [float] NULL,
	[fecha_act] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[contribuyente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[contribuyente](
	[rutContribuyente] [int] NOT NULL,
	[nContribuyente] [varchar](1) NOT NULL,
	[razonSocial] [varchar](200) NOT NULL,
	[paterno] [varchar](40) NULL,
	[materno] [varchar](40) NULL,
	[nombres] [varchar](60) NULL,
	[giro] [varchar](200) NULL,
	[direccion] [varchar](200) NULL,
	[comuna] [varchar](100) NULL,
	[fecCreacion] [date] NULL,
	[fecActualizacion] [date] NULL,
	[autorizacionMonedaExtranjera] [tinyint] NULL,
	[empresaPropyme] [tinyint] NULL,
	[telefono] [bigint] NULL,
	[correo] [varchar](80) NULL,
	[fechaInicioActividades] [nvarchar](30) NULL,
	[observacion] [nvarchar](30) NULL,
	[categoria] [nvarchar](30) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[detalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[detalle](
	[consulta_id] [int] NOT NULL,
	[folio] [bigint] NOT NULL,
	[periodo] [varchar](10) NOT NULL,
	[tipoformulario] [varchar](3) NOT NULL,
	[estado] [tinyint] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[dg_form].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dg_form](
	[Id] [int] IDENTITY(1, 1),
	[tabla] [nvarchar](255) NULL,
	[ident1] [float] NULL,
	[ident2] [float] NULL,
	[valor] [nvarchar](255) NULL,
	[columna] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[documento].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[documento](
	[nombre] [varchar](80) NOT NULL,
	[fecha] [date] NOT NULL,
	[rutContribuyente] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[empresa].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[empresa](
	[idEmpresa] [int] IDENTITY(20, 1),
	[razonSocial] [nvarchar](255) NULL,
	[nombreFantasia] [nvarchar](255) NULL,
	[nombreRepresentante] [nvarchar](255) NULL,
	[apellidoRepresentante] [nvarchar](255) NULL,
	[rutRepresentante] [nvarchar](255) NULL,
	[dvRepresentante] [nvarchar](255) NULL,
	[direccion] [nvarchar](255) NULL,
	[comuna] [nvarchar](255) NULL,
	[ciudad] [nvarchar](255) NULL,
	[telefono] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[plan] [nvarchar](255) NULL,
	[tipoContrato] [nvarchar](255) NULL,
	[giro] [nvarchar](255) NULL,
	[rutEmpresa] [int] NULL,
	[dvEmpresa] [nvarchar](255) NULL,
	[token] [nvarchar](255) NULL,
	[estado] [int] NULL,
	[sufijo] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[empresainstitucion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[empresainstitucion](
	[idEmpresa] [int] NOT NULL,
	[institucion] [varchar](20) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[form22].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[form22](
	[respuesta] [nvarchar](50) NULL,
	[cod_0847] [int] NULL,
	[cod_0600] [int] NULL,
	[cod_0104] [int] NULL,
	[cod_0601] [bigint] NULL,
	[cod_0105] [bigint] NULL,
	[cod_0602] [bigint] NULL,
	[cod_0106] [bigint] NULL,
	[cod_0603] [bigint] NULL,
	[cod_0108] [bigint] NULL,
	[cod_0604] [bigint] NULL,
	[cod_0109] [bigint] NULL,
	[cod_0110] [bigint] NULL,
	[cod_0605] [bigint] NULL,
	[cod_0155] [bigint] NULL,
	[cod_0606] [bigint] NULL,
	[cod_0152] [bigint] NULL,
	[cod_0161] [bigint] NULL,
	[cod_0159] [bigint] NULL,
	[cod_0748] [bigint] NULL,
	[cod_0749] [bigint] NULL,
	[cod_0165] [bigint] NULL,
	[cod_0166] [bigint] NULL,
	[cod_0764] [bigint] NULL,
	[cod_0169] [bigint] NULL,
	[cod_0158] [bigint] NULL,
	[cod_0111] [bigint] NULL,
	[cod_0750] [bigint] NULL,
	[cod_0740] [bigint] NULL,
	[cod_0751] [bigint] NULL,
	[cod_0822] [bigint] NULL,
	[cod_0765] [bigint] NULL,
	[cod_0766] [bigint] NULL,
	[cod_0170] [bigint] NULL,
	[cod_0157] [bigint] NULL,
	[cod_0201] [bigint] NULL,
	[cod_0135] [bigint] NULL,
	[cod_0136] [bigint] NULL,
	[cod_0171] [bigint] NULL,
	[cod_0176] [bigint] NULL,
	[cod_0607] [bigint] NULL,
	[cod_0752] [bigint] NULL,
	[cod_0867] [nvarchar](255) NULL,
	[cod_0608] [bigint] NULL,
	[cod_0895] [nvarchar](255) NULL,
	[cod_0609] [bigint] NULL,
	[cod_0162] [bigint] NULL,
	[cod_0174] [bigint] NULL,
	[cod_0610] [bigint] NULL,
	[cod_0746] [bigint] NULL,
	[cod_0866] [nvarchar](255) NULL,
	[cod_0304] [bigint] NULL,
	[cod_0031] [bigint] NULL,
	[cod_0018] [bigint] NULL,
	[cod_0019] [bigint] NULL,
	[cod_0020] [bigint] NULL,
	[cod_0824] [bigint] NULL,
	[cod_0825] [bigint] NULL,
	[cod_0187] [bigint] NULL,
	[cod_0188] [bigint] NULL,
	[cod_0189] [bigint] NULL,
	[cod_0195] [bigint] NULL,
	[cod_0196] [bigint] NULL,
	[cod_0905] [nvarchar](255) NULL,
	[cod_0906] [nvarchar](255) NULL,
	[cod_0077] [bigint] NULL,
	[cod_0074] [bigint] NULL,
	[cod_0079] [bigint] NULL,
	[cod_0113] [bigint] NULL,
	[cod_0120] [bigint] NULL,
	[cod_0114] [bigint] NULL,
	[cod_0753] [bigint] NULL,
	[cod_0754] [bigint] NULL,
	[cod_0755] [bigint] NULL,
	[cod_0133] [bigint] NULL,
	[cod_0138] [bigint] NULL,
	[cod_0134] [bigint] NULL,
	[cod_0032] [bigint] NULL,
	[cod_0076] [bigint] NULL,
	[cod_0034] [bigint] NULL,
	[cod_0021] [bigint] NULL,
	[cod_0043] [bigint] NULL,
	[cod_0756] [bigint] NULL,
	[cod_0767] [bigint] NULL,
	[cod_0862] [nvarchar](255) NULL,
	[cod_0863] [int] NULL,
	[cod_0051] [bigint] NULL,
	[cod_0063] [bigint] NULL,
	[cod_0071] [bigint] NULL,
	[cod_0036] [bigint] NULL,
	[cod_0848] [nvarchar](255) NULL,
	[cod_0849] [int] NULL,
	[cod_0082] [bigint] NULL,
	[cod_0768] [bigint] NULL,
	[cod_0769] [bigint] NULL,
	[cod_0083] [bigint] NULL,
	[cod_0173] [bigint] NULL,
	[cod_0612] [bigint] NULL,
	[cod_0198] [bigint] NULL,
	[cod_0054] [bigint] NULL,
	[cod_0611] [bigint] NULL,
	[cod_0832] [bigint] NULL,
	[cod_0833] [bigint] NULL,
	[cod_0834] [bigint] NULL,
	[cod_0181] [bigint] NULL,
	[cod_0167] [bigint] NULL,
	[cod_0747] [bigint] NULL,
	[cod_0119] [bigint] NULL,
	[cod_0116] [bigint] NULL,
	[cod_0757] [bigint] NULL,
	[cod_0058] [bigint] NULL,
	[cod_0870] [nvarchar](255) NULL,
	[cod_0871] [nvarchar](255) NULL,
	[cod_0880] [nvarchar](255) NULL,
	[cod_0881] [nvarchar](255) NULL,
	[cod_0882] [nvarchar](255) NULL,
	[cod_0899] [int] NULL,
	[cod_0900] [int] NULL,
	[cod_0901] [int] NULL,
	[cod_0305] [nvarchar](20) NULL,
	[rutContribuyente] [int] NULL,
	[nContribuyente] [nvarchar](2) NULL,
	[cod_0001] [nvarchar](100) NULL,
	[cod_0002] [nvarchar](50) NULL,
	[cod_0005] [nvarchar](50) NULL,
	[cod_0090] [bigint] NULL,
	[cod_0039] [bigint] NULL,
	[cod_0091] [bigint] NULL,
	[cod_0092] [bigint] NULL,
	[cod_0093] [bigint] NULL,
	[cod_0094] [bigint] NULL,
	[cod_0006] [nvarchar](100) NULL,
	[cod_0008] [nvarchar](50) NULL,
	[cod_0053] [int] NULL,
	[cod_0009] [nvarchar](14) NULL,
	[cod_0095] [nvarchar](255) NULL,
	[cod_0787] [nvarchar](255) NULL,
	[cod_0846] [nvarchar](255) NULL,
	[cod_0073] [nvarchar](255) NULL,
	[cod_0072] [nvarchar](255) NULL,
	[cod_0613] [nvarchar](255) NULL,
	[cod_0616] [nvarchar](255) NULL,
	[cod_0786] [nvarchar](255) NULL,
	[cod_0068] [nvarchar](255) NULL,
	[cod_0069] [nvarchar](255) NULL,
	[cod_0788] [nvarchar](30) NULL,
	[sel_0614] [int] NULL,
	[cod_0805] [nvarchar](255) NULL,
	[cod_0813] [nvarchar](255) NULL,
	[cod_0046] [nvarchar](255) NULL,
	[cod_0615] [nvarchar](255) NULL,
	[cod_0888] [nvarchar](50) NULL,
	[cod_0461] [bigint] NULL,
	[cod_0492] [bigint] NULL,
	[cod_0545] [bigint] NULL,
	[cod_0856] [nvarchar](255) NULL,
	[cod_0547] [bigint] NULL,
	[cod_0617] [bigint] NULL,
	[cod_0770] [bigint] NULL,
	[cod_0872] [nvarchar](255) NULL,
	[cod_0465] [bigint] NULL,
	[cod_0494] [bigint] NULL,
	[cod_0850] [nvarchar](255) NULL,
	[cod_0467] [bigint] NULL,
	[cod_0479] [bigint] NULL,
	[cod_0491] [bigint] NULL,
	[cod_0618] [bigint] NULL,
	[cod_0619] [bigint] NULL,
	[cod_0896] [nvarchar](255) NULL,
	[cod_0628] [bigint] NULL,
	[cod_0851] [nvarchar](255) NULL,
	[cod_0629] [bigint] NULL,
	[cod_0651] [bigint] NULL,
	[cod_0630] [bigint] NULL,
	[cod_0631] [bigint] NULL,
	[cod_0632] [bigint] NULL,
	[cod_0633] [bigint] NULL,
	[cod_0792] [bigint] NULL,
	[cod_0793] [bigint] NULL,
	[cod_0772] [bigint] NULL,
	[cod_0873] [nvarchar](255) NULL,
	[cod_0852] [nvarchar](255) NULL,
	[cod_0897] [nvarchar](255) NULL,
	[cod_0853] [nvarchar](255) NULL,
	[cod_0635] [bigint] NULL,
	[cod_0636] [bigint] NULL,
	[cod_0637] [bigint] NULL,
	[cod_0638] [bigint] NULL,
	[cod_0639] [bigint] NULL,
	[cod_0794] [bigint] NULL,
	[cod_0812] [bigint] NULL,
	[cod_0811] [bigint] NULL,
	[cod_0876] [nvarchar](255) NULL,
	[cod_0827] [bigint] NULL,
	[cod_0634] [bigint] NULL,
	[cod_0640] [bigint] NULL,
	[cod_0807] [bigint] NULL,
	[cod_0641] [bigint] NULL,
	[cod_0642] [bigint] NULL,
	[cod_0874] [bigint] NULL,
	[cod_0875] [nvarchar](255) NULL,
	[cod_0868] [int] NULL,
	[cod_0643] [bigint] NULL,
	[cod_0808] [bigint] NULL,
	[cod_0758] [bigint] NULL,
	[cod_0809] [bigint] NULL,
	[cod_0759] [bigint] NULL,
	[cod_0760] [bigint] NULL,
	[cod_0101] [bigint] NULL,
	[cod_0784] [bigint] NULL,
	[cod_0783] [bigint] NULL,
	[cod_0129] [bigint] NULL,
	[cod_0647] [bigint] NULL,
	[cod_0785] [bigint] NULL,
	[cod_0648] [bigint] NULL,
	[cod_0815] [bigint] NULL,
	[cod_0741] [bigint] NULL,
	[cod_0122] [bigint] NULL,
	[cod_0123] [bigint] NULL,
	[cod_0102] [bigint] NULL,
	[cod_0645] [bigint] NULL,
	[cod_0893] [float] NULL,
	[cod_0894] [float] NULL,
	[cod_0646] [bigint] NULL,
	[cod_0843] [float] NULL,
	[cod_0844] [float] NULL,
	[cod_0701] [bigint] NULL,
	[cod_0702] [bigint] NULL,
	[cod_0703] [bigint] NULL,
	[cod_0704] [bigint] NULL,
	[cod_0705] [bigint] NULL,
	[cod_0224] [bigint] NULL,
	[cod_0774] [bigint] NULL,
	[cod_0775] [bigint] NULL,
	[cod_0284] [bigint] NULL,
	[cod_0225] [bigint] NULL,
	[cod_0883] [int] NULL,
	[cod_0229] [bigint] NULL,
	[cod_0623] [bigint] NULL,
	[cod_0624] [bigint] NULL,
	[cod_0227] [bigint] NULL,
	[cod_0776] [bigint] NULL,
	[cod_0777] [bigint] NULL,
	[cod_0781] [bigint] NULL,
	[cod_0821] [bigint] NULL,
	[cod_0782] [bigint] NULL,
	[cod_0835] [nvarchar](255) NULL,
	[cod_0791] [bigint] NULL,
	[cod_0889] [nvarchar](255) NULL,
	[cod_0275] [bigint] NULL,
	[cod_0226] [bigint] NULL,
	[cod_0231] [bigint] NULL,
	[cod_0318] [bigint] NULL,
	[cod_0232] [bigint] NULL,
	[cod_0625] [bigint] NULL,
	[cod_0626] [bigint] NULL,
	[cod_0854] [int] NULL,
	[cod_0627] [bigint] NULL,
	[cod_0904] [nvarchar](255) NULL,
	[cod_0838] [bigint] NULL,
	[cod_0845] [int] NULL,
	[cod_0818] [bigint] NULL,
	[cod_0842] [nvarchar](255) NULL,
	[cod_0819] [bigint] NULL,
	[cod_0837] [nvarchar](255) NULL,
	[cod_0820] [bigint] NULL,
	[cod_0228] [bigint] NULL,
	[cod_0840] [bigint] NULL,
	[cod_0836] [nvarchar](255) NULL,
	[cod_0320] [bigint] NULL,
	[cod_0828] [bigint] NULL,
	[cod_0830] [bigint] NULL,
	[cod_0829] [bigint] NULL,
	[cod_0898] [nvarchar](255) NULL,
	[cod_0365] [bigint] NULL,
	[cod_0368] [bigint] NULL,
	[cod_0373] [bigint] NULL,
	[cod_0382] [bigint] NULL,
	[cod_0761] [bigint] NULL,
	[cod_0773] [bigint] NULL,
	[cod_0841] [nvarchar](255) NULL,
	[cod_0392] [bigint] NULL,
	[cod_0366] [bigint] NULL,
	[cod_0839] [nvarchar](255) NULL,
	[cod_0384] [bigint] NULL,
	[cod_0385] [bigint] NULL,
	[cod_0390] [bigint] NULL,
	[cod_0742] [bigint] NULL,
	[cod_0387] [bigint] NULL,
	[cod_0855] [nvarchar](255) NULL,
	[cod_0236] [bigint] NULL,
	[cod_0238] [bigint] NULL,
	[cod_0877] [nvarchar](255) NULL,
	[cod_0878] [nvarchar](255) NULL,
	[cod_0879] [bigint] NULL,
	[cod_0859] [nvarchar](255) NULL,
	[cod_0884] [nvarchar](255) NULL,
	[cod_0885] [nvarchar](255) NULL,
	[cod_0886] [nvarchar](255) NULL,
	[cod_0887] [nvarchar](255) NULL,
	[cod_0315] [datetime] NULL,
	[cod_0650] [nvarchar](50) NULL,
	[cod_0903] [nvarchar](50) NULL,
	[cod_0796] [bigint] NULL,
	[cod_0799] [bigint] NULL,
	[cod_0802] [bigint] NULL,
	[cod_0797] [bigint] NULL,
	[cod_0800] [bigint] NULL,
	[cod_0803] [bigint] NULL,
	[cod_0798] [bigint] NULL,
	[cod_0801] [bigint] NULL,
	[cod_0804] [bigint] NULL,
	[cod_9928] [int] NULL,
	[cod_9920] [nvarchar](50) NULL,
	[cod_9306] [int] NULL,
	[cod_8876] [int] NULL,
	[cod_8866] [int] NULL,
	[cod_8811] [nvarchar](50) NULL,
	[cod_0780] [nvarchar](50) NULL,
	[cod_0312] [bigint] NULL,
	[cod_0306] [bigint] NULL,
	[cod_0301] [nvarchar](50) NULL,
	[cod_0087] [bigint] NULL,
	[cod_0085] [bigint] NULL,
	[cod_0055] [nvarchar](50) NULL,
	[cod_0015] [int] NULL,
	[cod_0014] [bigint] NULL,
	[cod_0013] [nvarchar](100) NULL,
	[vigente] [int] NULL,
	[cod_0003] [nvarchar](50) NULL,
	[cod_0007] [bigint] NOT NULL,
	[cod_0098] [nvarchar](255) NULL,
	[cod_8898] [nvarchar](50) NULL,
	[cod_8892] [int] NULL,
	[cod_8891] [int] NULL,
	[cod_0048] [bigint] NULL,
	[periodo] [int] NULL,
	[cod_8772] [int] NULL,
	[cod_0779] [int] NULL,
	[cod_0817] [int] NULL,
	[cod_9925] [nvarchar](50) NULL,
	[cod_0164] [int] NULL,
	[cod_0163] [int] NULL,
	[cod_0025] [int] NULL,
	[cod_0823] [nvarchar](255) NULL,
	[cod_8850] [int] NULL,
	[cod_0795] [int] NULL,
	[cod_0060] [int] NULL,
	[sel_0615] [int] NULL,
	[sel_0613] [int] NULL,
	[sel_0072] [int] NULL,
	[cod_8855] [int] NULL,
	[cod_0726] [nvarchar](50) NULL,
	[cod_0044] [nvarchar](50) NULL,
	[cod_8854] [nvarchar](255) NULL,
	[cod_8853] [nvarchar](255) NULL,
	[cod_8851] [nvarchar](255) NULL,
	[cod_0088] [nvarchar](255) NULL,
	[sel_0046] [tinyint] NULL,
	[sel_0068] [tinyint] NULL,
	[sel_0073] [tinyint] NULL,
	[sel_0616] [tinyint] NULL,
	[cod_0940] [varchar](30) NULL,
	[cod_0926] [bigint] NULL,
	[cod_0927] [bigint] NULL,
	[cod_0941] [bigint] NULL,
	[cod_0968] [bigint] NULL,
	[cod_0969] [bigint] NULL,
	[cod_0967] [bigint] NULL,
	[cod_0966] [bigint] NULL,
	[cod_1037] [bigint] NULL,
	[cod_0978] [bigint] NULL,
	[cod_1020] [bigint] NULL,
	[cod_1023] [bigint] NULL,
	[cod_1021] [bigint] NULL,
	[cod_1003] [bigint] NULL,
	[cod_1004] [bigint] NULL,
	[cod_1005] [bigint] NULL,
	[cod_1029] [bigint] NULL,
	[cod_1032] [bigint] NULL,
	[cod_0955] [bigint] NULL,
	[cod_1104] [bigint] NULL,
	[cod_0958] [bigint] NULL,
	[cod_0960] [bigint] NULL,
	[cod_0961] [bigint] NULL,
	[cod_0963] [bigint] NULL,
	[cod_0964] [bigint] NULL,
	[cod_0103] [bigint] NULL,
	[cod_0965] [bigint] NULL,
	[cod_1039] [bigint] NULL,
	[cod_0959] [bigint] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[form29].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[form29](
	[rutContribuyente] [int] NULL,
	[nContribuyente] [nvarchar](2) NULL,
	[periodo] [int] NULL,
	[respuesta] [nvarchar](50) NULL,
	[vigente] [int] NULL,
	[cod_0585] [bigint] NULL,
	[cod_0020] [bigint] NULL,
	[cod_0586] [bigint] NULL,
	[cod_0142] [bigint] NULL,
	[cod_0515] [int] NULL,
	[cod_0587] [bigint] NULL,
	[cod_0503] [bigint] NULL,
	[cod_0502] [bigint] NULL,
	[cod_0110] [bigint] NULL,
	[cod_0111] [bigint] NULL,
	[cod_0512] [bigint] NULL,
	[cod_0513] [bigint] NULL,
	[cod_0509] [bigint] NULL,
	[cod_0510] [bigint] NULL,
	[cod_0708] [bigint] NULL,
	[cod_0709] [bigint] NULL,
	[cod_0733] [bigint] NULL,
	[cod_0734] [int] NULL,
	[cod_0516] [bigint] NULL,
	[cod_0517] [bigint] NULL,
	[cod_0500] [bigint] NULL,
	[cod_0501] [bigint] NULL,
	[cod_0154] [bigint] NULL,
	[cod_0518] [bigint] NULL,
	[cod_0538] [bigint] NULL,
	[cod_0511] [bigint] NULL,
	[cod_0514] [bigint] NULL,
	[cod_0564] [bigint] NULL,
	[cod_0521] [bigint] NULL,
	[cod_0566] [bigint] NULL,
	[cod_0560] [bigint] NULL,
	[cod_0584] [bigint] NULL,
	[cod_0562] [bigint] NULL,
	[cod_0519] [bigint] NULL,
	[cod_0520] [bigint] NULL,
	[cod_0524] [bigint] NULL,
	[cod_0525] [bigint] NULL,
	[cod_0527] [bigint] NULL,
	[cod_0528] [bigint] NULL,
	[cod_0531] [bigint] NULL,
	[cod_0532] [bigint] NULL,
	[cod_0534] [bigint] NULL,
	[cod_0535] [bigint] NULL,
	[cod_0536] [bigint] NULL,
	[cod_0553] [bigint] NULL,
	[cod_0504] [bigint] NULL,
	[cod_0593] [bigint] NULL,
	[cod_0594] [bigint] NULL,
	[cod_0592] [bigint] NULL,
	[cod_0539] [bigint] NULL,
	[cod_0164] [bigint] NULL,
	[cod_0127] [bigint] NULL,
	[cod_0544] [bigint] NULL,
	[cod_0523] [bigint] NULL,
	[cod_0537] [bigint] NULL,
	[cod_0089] [bigint] NULL,
	[cod_0050] [bigint] NULL,
	[cod_0048] [bigint] NULL,
	[cod_0151] [bigint] NULL,
	[cod_0153] [bigint] NULL,
	[cod_0054] [bigint] NULL,
	[cod_0056] [bigint] NULL,
	[cod_0588] [bigint] NULL,
	[cod_0589] [bigint] NULL,
	[cod_0062] [bigint] NULL,
	[cod_0030] [bigint] NULL,
	[cod_0563] [bigint] NULL,
	[cod_0115] [numeric](10, 5) NULL,
	[cod_0068] [bigint] NULL,
	[cod_0123] [bigint] NULL,
	[cod_0565] [bigint] NULL,
	[cod_0120] [bigint] NULL,
	[cod_0542] [nvarchar](50) NULL,
	[cod_0122] [bigint] NULL,
	[cod_0703] [bigint] NULL,
	[cod_0700] [bigint] NULL,
	[cod_0701] [bigint] NULL,
	[cod_0702] [bigint] NULL,
	[cod_0711] [bigint] NULL,
	[cod_0152] [bigint] NULL,
	[cod_0070] [bigint] NULL,
	[cod_0066] [bigint] NULL,
	[cod_0595] [bigint] NULL,
	[cod_0001] [nvarchar](100) NULL,
	[cod_0002] [nvarchar](40) NULL,
	[cod_0005] [nvarchar](80) NULL,
	[cod_0091] [bigint] NULL,
	[cod_0092] [int] NULL,
	[cod_0093] [bigint] NULL,
	[cod_0094] [bigint] NULL,
	[cod_0583] [int] NULL,
	[cod_0315] [nvarchar](10) NULL,
	[cod_0003] [nvarchar](15) NULL,
	[cod_0006] [nvarchar](80) NULL,
	[cod_0007] [bigint] NOT NULL,
	[cod_0008] [nvarchar](30) NULL,
	[cod_0009] [nvarchar](14) NULL,
	[cod_0015] [int] NULL,
	[cod_0547] [int] NULL,
	[cod_0573] [int] NULL,
	[cod_0598] [int] NULL,
	[cod_0723] [int] NULL,
	[cod_0724] [int] NULL,
	[cant_anuladas] [int] NULL,
	[moneda] [int] NULL,
	[usuario] [int] NULL,
	[codint] [int] NULL,
	[opcion] [nvarchar](10) NULL,
	[clase] [nvarchar](50) NULL,
	[medio_pago] [nvarchar](10) NULL,
	[banco] [nvarchar](80) NULL,
	[mostrar_folio] [int] NULL,
	[fecha_ingreso] [date] NULL,
	[nombres] [nvarchar](20) NULL,
	[fecha_hoy] [date] NULL,
	[medio_ingreso] [nvarchar](10) NULL,
	[codigo_ingreso] [int] NULL,
	[tipo_movimiento] [int] NULL,
	[calidadDeclarante] [nvarchar](20) NULL,
	[nombre_fun] [nvarchar](80) NULL,
	[adm8703] [nvarchar](20) NULL,
	[adm8721] [nvarchar](20) NULL,
	[cartrib] [int] NULL,
	[token] [nvarchar](10) NULL,
	[cod_0732] [int] NULL,
	[cod_0715] [int] NULL,
	[cod_0720] [int] NULL,
	[cod_0077] [bigint] NULL,
	[cod_0055] [nvarchar](80) NULL,
	[cod_0596] [int] NULL,
	[cod_9906] [nvarchar](20) NULL,
	[cod_0060] [int] NULL,
	[cod_0795] [int] NULL,
	[cod_0915] [nvarchar](20) NULL,
	[cod_0922] [nvarchar](20) NULL,
	[cod_0146] [int] NULL,
	[cod_0506] [int] NULL,
	[cod_0507] [int] NULL,
	[cod_0576] [int] NULL,
	[cod_0602] [int] NULL,
	[cod_0603] [int] NULL,
	[cod_0508] [int] NULL,
	[cod_0149] [int] NULL,
	[cod_0580] [int] NULL,
	[cod_0039] [int] NULL,
	[nom_uni] [nvarchar](60) NULL,
	[nom_reg] [nvarchar](255) NULL,
	[nom_depto] [nvarchar](255) NULL,
	[cod_0543] [nvarchar](60) NULL,
	[cod_0556] [nvarchar](60) NULL,
	[cod_0716] [nvarchar](60) NULL,
	[cod_0717] [nvarchar](60) NULL,
	[cod_0731] [nvarchar](60) NULL,
	[cod_9400] [nvarchar](60) NULL,
	[cod_9401] [nvarchar](60) NULL,
	[cod_9402] [nvarchar](60) NULL,
	[cod_9403] [nvarchar](60) NULL,
	[cod_9404] [nvarchar](60) NULL,
	[cod_9405] [nvarchar](60) NULL,
	[cod_9406] [nvarchar](60) NULL,
	[cod_9407] [nvarchar](60) NULL,
	[cod_9408] [nvarchar](60) NULL,
	[cod_9409] [nvarchar](60) NULL,
	[cod_9410] [nvarchar](60) NULL,
	[cod_9411] [nvarchar](60) NULL,
	[cod_9412] [nvarchar](60) NULL,
	[cod_9413] [nvarchar](60) NULL,
	[cod_9414] [nvarchar](60) NULL,
	[cod_0714] [nvarchar](60) NULL,
	[cod_0729] [nvarchar](60) NULL,
	[cod_0744] [nvarchar](60) NULL,
	[cod_0745] [nvarchar](60) NULL,
	[cod_0739] [nvarchar](60) NULL,
	[cod_0740] [nvarchar](60) NULL,
	[cod_0730] [nvarchar](50) NULL,
	[cod_0742] [nvarchar](60) NULL,
	[cod_0743] [nvarchar](60) NULL,
	[cod_0557] [nvarchar](60) NULL,
	[cod_0554] [nvarchar](60) NULL,
	[cod_0085] [nvarchar](60) NULL,
	[cod_0150] [nvarchar](60) NULL,
	[cod_0575] [nvarchar](60) NULL,
	[cod_0577] [nvarchar](60) NULL,
	[cod_0582] [nvarchar](60) NULL,
	[cod_0032] [nvarchar](60) NULL,
	[cod_0033] [nvarchar](60) NULL,
	[cod_0574] [nvarchar](60) NULL,
	[cod_0028] [int] NULL,
	[cod_0044] [int] NULL,
	[cod_0053] [int] NULL,
	[cod_0073] [int] NULL,
	[cod_0113] [int] NULL,
	[cod_0555] [int] NULL,
	[cod_0559] [int] NULL,
	[cod_0610] [int] NULL,
	[COD_9902_1] [bigint] NULL,
	[COD_9902_2] [bigint] NULL,
	[cod_chk] [nvarchar](20) NULL,
	[cod_0759] [varchar](100) NULL,
	[cod_0755] [varchar](100) NULL,
	[cod_0126] [bigint] NULL,
	[cod_0128] [bigint] NULL,
	[cod_0160] [bigint] NULL,
	[cod_0161] [bigint] NULL,
	[cod_0313] [int] NULL,
	[Cod_0314] [int] NULL,
	[cod_0409] [decimal](18, 0) NULL,
	[cod_0522] [decimal](18, 0) NULL,
	[cod_0526] [decimal](18, 0) NULL,
	[cod_0529] [bigint] NULL,
	[cod_0530] [bigint] NULL,
	[cod_0533] [bigint] NULL,
	[cod_0540] [bigint] NULL,
	[cod_0541] [bigint] NULL,
	[cod_0545] [bigint] NULL,
	[cod_0546] [bigint] NULL,
	[cod_0549] [bigint] NULL,
	[cod_0550] [bigint] NULL,
	[cod_0551] [bigint] NULL,
	[cod_0552] [bigint] NULL,
	[cod_0558] [bigint] NULL,
	[cod_0568] [bigint] NULL,
	[cod_0570] [bigint] NULL,
	[cod_0571] [bigint] NULL,
	[cod_0572] [bigint] NULL,
	[cod_0590] [bigint] NULL,
	[cod_0591] [bigint] NULL,
	[cod_0597] [bigint] NULL,
	[cod_0601] [int] NULL,
	[cod_0604] [int] NULL,
	[cod_0611] [int] NULL,
	[cod_0612] [nvarchar](255) NULL,
	[cod_0613] [int] NULL,
	[cod_0704] [bigint] NULL,
	[cod_0705] [bigint] NULL,
	[cod_0706] [bigint] NULL,
	[cod_0707] [bigint] NULL,
	[cod_0710] [bigint] NULL,
	[cod_0712] [bigint] NULL,
	[cod_0718] [bigint] NULL,
	[cod_0721] [bigint] NULL,
	[cod_0722] [bigint] NULL,
	[cod_0725] [bigint] NULL,
	[cod_0726] [int] NULL,
	[cod_0727] [bigint] NULL,
	[cod_0728] [bigint] NULL,
	[cod_0735] [bigint] NULL,
	[cod_0736] [bigint] NULL,
	[cod_0737] [bigint] NULL,
	[cod_0738] [bigint] NULL,
	[cod_0741] [bigint] NULL,
	[cod_0750] [varchar](50) NULL,
	[cod_0751] [bigint] NULL,
	[cod_0752] [bigint] NULL,
	[cod_0753] [bigint] NULL,
	[cod_0754] [bigint] NULL,
	[cod_0756] [nvarchar](10) NULL,
	[cod_0757] [bigint] NULL,
	[cod_0760] [bigint] NULL,
	[cod_0761] [bigint] NULL,
	[cod_0762] [bigint] NULL,
	[cod_9920] [varchar](30) NULL,
	[cod_0758] [bigint] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[honorario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[honorario](
	[rutContribuyente] [float] NOT NULL,
	[fecha] [date] NOT NULL,
	[bruto] [float] NULL,
	[retencion] [float] NULL,
	[ppm] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[logacs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[logacs](
	[Id] [float] NULL,
	[usuario_id] [float] NULL,
	[fecha] [datetime] NULL,
	[tipo] [float] NULL,
	[ip] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[logact].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[logact](
	[idLogact] [float] NULL,
	[idEmpresa] [float] NULL,
	[idContrato] [float] NULL,
	[idUsuario] [float] NULL,
	[entidad] [nvarchar](255) NULL,
	[fechaLogact] [datetime] NULL,
	[ipUsuario] [nvarchar](255) NULL,
	[idEntidad] [float] NULL,
	[parametro] [nvarchar](255) NULL,
	[codRespuesta] [float] NULL,
	[accion] [nvarchar](255) NULL,
	[nroMenu] [float] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[logact_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[logact_2](
	[idLogact] [nvarchar](255) NULL,
	[idUsuario] [nvarchar](255) NULL,
	[fecha] [nvarchar](255) NULL,
	[tipo] [nvarchar](255) NULL,
	[parametro] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[logerr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[logerr](
	[Id] [nvarchar](255) NULL,
	[idUsuario] [nvarchar](255) NULL,
	[idEmpresa] [nvarchar](255) NULL,
	[codigo] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[logsis].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[logsis](
	[id] [float] NULL,
	[fecha] [datetime] NULL,
	[tipo] [nvarchar](255) NULL,
	[idUsuario] [float] NULL,
	[idEmpresa] [float] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[logtask].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[logtask](
	[Id] [nvarchar](255) NULL,
	[tipo] [nvarchar](255) NULL,
	[fecha] [nvarchar](255) NULL,
	[resultado] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[logtrx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[logtrx](
	[idTrx] [float] NULL,
	[fechaTrx] [datetime] NULL,
	[idEmpresa] [float] NULL,
	[ipusuario] [nvarchar](255) NULL,
	[metodo] [nvarchar](255) NULL,
	[rutConsultado] [float] NULL,
	[parametro] [nvarchar](255) NULL,
	[idUsuario] [nvarchar](255) NULL,
	[codRespuesta] [float] NULL,
	[tipoFormulario] [nvarchar](255) NULL,
	[idOrigen] [nvarchar](255) NULL,
	[ipServicioWeb] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[lotes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lotes](
	[id] [int] IDENTITY(1, 1),
	[idEmpresa] [nvarchar](255) NULL,
	[estado] [tinyint] NULL,
	[fecha_actualizacion] [datetime] NULL,
	[idUsuario] [bigint] NULL,
	[nombreCarpeta] [varchar](255) NULL,
	[fec_creacion] [datetime] NULL,
	[data] [ntext] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[menu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[menu](
	[idMenu] [int] IDENTITY(1, 1),
	[titulo] [nvarchar](255) NULL,
	[nombre] [nvarchar](255) NULL,
	[pagina] [nvarchar](255) NULL,
	[supra] [bit] NULL,
	[estado] [bit] NULL,
	[orden] [tinyint] NULL,
	[icono] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[migrations].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[migrations](
	[migration] [nvarchar](255) NULL,
	[batch] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[perfil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[perfil](
	[idPerfil] [int] IDENTITY(1, 1),
	[nombre] [nvarchar](255) NULL,
	[estado] [float] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[perfilempresa].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[perfilempresa](
	[idPerfil] [float] NULL,
	[idEmpresa] [float] NULL,
	[alias] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[perfilmenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[perfilmenu](
	[idMenu] [int] NOT NULL,
	[idPerfil] [int] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[propiedad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[propiedad](
	[rol] [nvarchar](255) NOT NULL,
	[rutContribuyente] [float] NOT NULL,
	[comuna] [nvarchar](255) NULL,
	[direccion] [nvarchar](255) NULL,
	[destino] [nvarchar](255) NULL,
	[avaluo] [float] NULL,
	[cVencidas] [nvarchar](255) NULL,
	[cVigentes] [nvarchar](255) NULL,
	[condicion] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[representante].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[representante](
	[rutContribuyente] [float] NOT NULL,
	[rutRepresentante] [float] NOT NULL,
	[fechaIncorporacion] [datetime] NULL,
	[razonSocial] [nvarchar](80) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[servicio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[servicio](
	[idServicio] [int] IDENTITY(1, 1),
	[nombre] [nvarchar](255) NULL,
	[estado] [float] NULL,
	[tipo] [float] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[serviciocontratado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[serviciocontratado](
	[idContrato] [int] NOT NULL,
	[idServicio] [int] NOT NULL,
	[t_actualizacion] [float] NULL,
	[fecha_ultima] [datetime] NULL,
	[usuario] [nvarchar](255) NULL,
	[clave] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[situacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[situacion](
	[rutContribuyente] [int] NOT NULL,
	[fechaInicioActividades] [varchar](50) NULL,
	[categoria] [varchar](50) NULL,
	[observacion] [varchar](50) NULL,
	[emtp] [bit] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[sociedad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sociedad](
	[rutContribuyente] [float] NOT NULL,
	[rutSociedad] [float] NOT NULL,
	[razonSocial] [nvarchar](500) NULL,
	[fechaIncorporacion] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[socio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[socio](
	[rutContribuyente] [float] NOT NULL,
	[rutSocio] [float] NOT NULL,
	[fechaIncorporacion] [datetime] NULL,
	[razonSocial] [nvarchar](80) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[testable].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[testable](
	[Id] [float] NULL,
	[nombre] [nvarchar](255) NULL,
	[apellido] [nvarchar](255) NULL,
	[dinero] [float] NULL,
	[fecha_nac] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[timbrajes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[timbrajes](
	[rutContribuyente] [float] NULL,
	[tipoDocumento] [nvarchar](255) NULL,
	[anUltTimbraje] [datetime] NULL,
	[fecProceso] [nvarchar](255) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[usuario].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[usuario](
	[idUsuario] [int] IDENTITY(1, 1),
	[nombre] [nvarchar](255) NULL,
	[apellido] [nvarchar](255) NULL,
	[rutUsuario] [nvarchar](30) NULL,
	[email] [nvarchar](255) NULL,
	[idEmpresa] [int] NULL,
	[usuario] [nvarchar](255) NULL,
	[clave] [nvarchar](255) NULL,
	[idPerfil] [int] NULL,
	[estado] [int] NULL,
	[centroCosto] [nvarchar](255) NULL,
	[subCentro] [nvarchar](255) NULL,
	[fechaExp] [nvarchar](255) NULL
)
ON [PRIMARY]
