
GO
--SqlScripter----[dbo].[actividad].[actividad_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[actividad] ADD CONSTRAINT [actividad_pk] PRIMARY KEY CLUSTERED (
	[codigo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[actividadContr].[actividadContr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[actividadContr] ADD CONSTRAINT [actividadContr_pk] PRIMARY KEY CLUSTERED (
	[rutContribuyente] ASC,
	[codigo_actividad] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[archivo].[archivo_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[archivo] ADD CONSTRAINT [archivo_pk] PRIMARY KEY CLUSTERED (
	[idEmpresa] ASC,
	[rutContribuyente] ASC,
	[fec_carpeta] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[autorizaform].[autorizaform_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[autorizaform] ADD CONSTRAINT [autorizaform_pk] PRIMARY KEY CLUSTERED (
	[idEmpresa] ASC,
	[folio] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[consulta].[consulta_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[consulta] ADD CONSTRAINT [consulta_pk] PRIMARY KEY CLUSTERED (
	[idCons] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[contrato].[PK__contrato__91431FE172B2945F].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[contrato] ADD CONSTRAINT [PK__contrato__91431FE172B2945F] PRIMARY KEY CLUSTERED (
	[idContrato] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[contribuyente].[PK__contribu__77EC020176832543].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[contribuyente] ADD CONSTRAINT [PK__contribu__77EC020176832543] PRIMARY KEY CLUSTERED (
	[rutContribuyente] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[documento].[documento_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[documento] ADD CONSTRAINT [documento_pk] PRIMARY KEY CLUSTERED (
	[nombre] ASC,
	[fecha] ASC,
	[rutContribuyente] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[empresa].[empresa_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[empresa] ADD CONSTRAINT [empresa_pk] PRIMARY KEY CLUSTERED (
	[idEmpresa] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[empresainstitucion].[empresainstitucion_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[empresainstitucion] ADD CONSTRAINT [empresainstitucion_PK] PRIMARY KEY CLUSTERED (
	[idEmpresa] ASC,
	[institucion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[form22].[PK_form22].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[form22] ADD CONSTRAINT [PK_form22] PRIMARY KEY CLUSTERED (
	[cod_0007] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[form29].[PK_form29].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[form29] ADD CONSTRAINT [PK_form29] PRIMARY KEY CLUSTERED (
	[cod_0007] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[honorario].[honorario_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[honorario] ADD CONSTRAINT [honorario_pk] PRIMARY KEY CLUSTERED (
	[rutContribuyente] ASC,
	[fecha] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[menu].[PK__menu__C26AF4830F4ED30D].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[menu] ADD CONSTRAINT [PK__menu__C26AF4830F4ED30D] PRIMARY KEY CLUSTERED (
	[idMenu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[perfil].[perfil_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[perfil] ADD CONSTRAINT [perfil_pk] PRIMARY KEY CLUSTERED (
	[idPerfil] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[perfilmenu].[perfilmenu_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[perfilmenu] ADD CONSTRAINT [perfilmenu_pk] PRIMARY KEY CLUSTERED (
	[idMenu] ASC,
	[idPerfil] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[propiedad].[propiedad_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[propiedad] ADD CONSTRAINT [propiedad_pk] PRIMARY KEY CLUSTERED (
	[rol] ASC,
	[rutContribuyente] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[representante].[representante_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[representante] ADD CONSTRAINT [representante_pk] PRIMARY KEY CLUSTERED (
	[rutContribuyente] ASC,
	[rutRepresentante] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[servicio].[servicio_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[servicio] ADD CONSTRAINT [servicio_pk] PRIMARY KEY CLUSTERED (
	[idServicio] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[serviciocontratado].[serviciocontratado_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[serviciocontratado] ADD CONSTRAINT [serviciocontratado_pk] PRIMARY KEY CLUSTERED (
	[idContrato] ASC,
	[idServicio] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[situacion].[situacion_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[situacion] ADD CONSTRAINT [situacion_pk] PRIMARY KEY CLUSTERED (
	[rutContribuyente] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sociedad].[sociedad_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sociedad] ADD CONSTRAINT [sociedad_pk] PRIMARY KEY CLUSTERED (
	[rutContribuyente] ASC,
	[rutSociedad] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[socio].[socio_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[socio] ADD CONSTRAINT [socio_pk] PRIMARY KEY CLUSTERED (
	[rutContribuyente] ASC,
	[rutSocio] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usuario].[usuario_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usuario] ADD CONSTRAINT [usuario_pk] PRIMARY KEY CLUSTERED (
	[idUsuario] ASC
) ON [PRIMARY]
