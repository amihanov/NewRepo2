SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IKNOTIFICACIONES](
	[CODIGO] [int] IDENTITY(1, 1),
	[CODIGOUSUARIO] [int] NULL,
	[DESTINATARIO] [nvarchar](50) NULL,
	[DESCRIPCIONNOTIFICACION] [nvarchar](400) NULL,
	[NOTIFICACION] [ntext] NULL,
	[FECHAALTA] [datetime] NULL,
	[FECHALECTURA] [datetime] NULL,
	[L_LEIDO] [tinyint] NULL,
	[ICONO] [nvarchar](50) NULL,
	[XMLMAIL_MESSAGEID] [nvarchar](50) NULL,
	[AUTOR] [nvarchar](50) NULL,
	[CATEGORIA] [nvarchar](100) NULL,
	[FUENTE] [nvarchar](100) NULL,
	[ENTIDAD] [nvarchar](50) NULL,
	[DESCRIPCIONRSS] [nvarchar](MAX) NULL,
	[L_RSSONLY] [tinyint] NULL
)
ON [PRIMARY]
