
GO
--SqlScripter----[dbo].[DuplicadorJob].[PK_DuplicadorJob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DuplicadorJob] ADD CONSTRAINT [PK_DuplicadorJob] PRIMARY KEY CLUSTERED (
	[Id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DuplicadorJobDetalle].[PK_MensajeDuplicadorResultado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DuplicadorJobDetalle] ADD CONSTRAINT [PK_MensajeDuplicadorResultado] PRIMARY KEY CLUSTERED (
	[JobId] ASC,
	[MensajeId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DuplicadorMensaje].[PK_DuplicadorMensajes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DuplicadorMensaje] ADD CONSTRAINT [PK_DuplicadorMensajes] PRIMARY KEY CLUSTERED (
	[Id] ASC
) ON [PRIMARY]
