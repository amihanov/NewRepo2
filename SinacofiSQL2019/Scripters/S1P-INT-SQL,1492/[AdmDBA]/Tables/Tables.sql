
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
--SqlScripter----[dbo].[tb_drives].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tb_drives](
	[disco] [char](1) NULL,
	[SizeInicial] [int] NULL,
	[SizeRealMB] [int] NULL,
	[fecha] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[TEMPORAL].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TEMPORAL](
	[database_name] [nvarchar](128) NULL,
	[Tipo_Backup] [varchar](21) NULL,
	[backup_start_date] [datetime] NULL,
	[backup_finish_date] [datetime] NULL,
	[name] [nvarchar](128) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tmp_drives].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tmp_drives](
	[disco] [char](1) NULL,
	[SizeRealMB] [int] NULL
)
ON [PRIMARY]
