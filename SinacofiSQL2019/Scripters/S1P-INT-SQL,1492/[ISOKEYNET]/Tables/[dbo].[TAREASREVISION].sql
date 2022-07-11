﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TAREASREVISION](
	[CODIGO] [int] IDENTITY(1, 1),
	[CODIGOPROCESO] [int] NULL,
	[ACCION] [nvarchar](50) NULL,
	[FECHA] [smalldatetime] NULL,
	[EMAIL] [nvarchar](255) NULL,
	[REINTENTO] [int] NULL,
	[PROXREINTENTO] [smalldatetime] NULL,
	[CARGOREQ] [ntext] NULL,
	[RESPUESTA] [nvarchar](50) NULL,
	[OBSERVACIONES] [ntext] NULL,
	[ACCIONSYS] [nvarchar](250) NULL,
	[CODIGODOCUMENTO] [int] NULL,
	[DESCRIPCIONDOC] [nvarchar](255) NULL,
	[FECHAACCIONSYS] [datetime] NULL,
	[CARGOSDISTRIBUIDOS] [ntext] NULL,
	[INSTRUCCIONES] [ntext] NULL,
	[ARCHIVOINSTRUCCIONES] [nvarchar](200) NULL,
	[CODIGOCARGOREQ] [int] NULL,
	[ESTADO] [nvarchar](1) NULL,
	[L_REQUERIDO] [tinyint] NULL,
	[NOMBREUSUARIO] [nvarchar](100) NULL,
	[CODIGOUSUARIO] [int] NULL,
	[PRIORIDAD] [tinyint] NULL,
	[FILE_HASH] [ntext] NULL,
	[SIGNATURE_HASH] [ntext] NULL,
	[FECHAVENCIMIENTO] [datetime] NULL,
	[L_VENCIMIENTONOTIFICADO] [tinyint] NOT NULL
)
ON [PRIMARY]