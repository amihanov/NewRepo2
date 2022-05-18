
GO
--SqlScripter----[dbo].[archivo].[archivo_uq].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[archivo] ADD CONSTRAINT [archivo_uq] UNIQUE NONCLUSTERED (
	[Id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[detalle].[i2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [i2] ON [dbo].[detalle] (
	[consulta_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[empresa].[empresa_uq].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[empresa] ADD CONSTRAINT [empresa_uq] UNIQUE NONCLUSTERED (
	[nombreFantasia] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[form22].[f22_rutperiodo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [f22_rutperiodo] ON [dbo].[form22] (
	[rutContribuyente] ASC,
	[periodo] DESC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[form29].[In_rut].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [In_rut] ON [dbo].[form29] (
	[rutContribuyente] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usuario].[indx_usuario_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [indx_usuario_1] ON [dbo].[usuario] (
	[usuario] ASC
) ON [PRIMARY]
