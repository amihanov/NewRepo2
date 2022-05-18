SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bases_plan](
	[baseDatos] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TotalMB] [float] NULL,
	[FileDataMB] [float] NULL,
	[DatausadaMB] [float] NULL,
	[PorcentajeUsado] [float] NULL,
	[DataLibreMB] [float] NULL,
	[PorcentajeLibre] [float] NULL,
	[FileLogMB] [float] NULL,
	[LogUsadoMB] [float] NULL,
	[PorcentajeLogUsado] [float] NULL,
	[LogLibreMB] [float] NULL,
	[PorcentajeLoglibre] [float] NULL,
	[fecha-muestra] [datetime] NOT NULL
)
ON [PRIMARY]
