﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DOCUMENTOSHISTORIA](
	[CODIGO] [int] IDENTITY(1, 1),
	[CODIGODOCUMENTO] [int] NULL,
	[CODIGOUSUARIO] [int] NULL,
	[NOMBREUSUARIO] [nvarchar](50) NULL,
	[FECHA] [datetime] NULL,
	[TAREA] [nvarchar](2500) NULL,
	[CODIGOPROCESO] [int] NULL,
	[CODIGOTAREAREVISION] [int] NULL,
	[REPORTE] [ntext] NULL
)
ON [PRIMARY]
