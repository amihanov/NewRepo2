SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ALMACEN_ARCHIVOS](
	[CODIGO] [int] IDENTITY(1, 1),
	[NOMBRE] [nvarchar](220) NULL,
	[FECHA] [datetime] NULL,
	[USUARIO] [nvarchar](50) NULL,
	[DATA] [image] NULL,
	[CODIGOALMACENORIGENES] [int] NOT NULL,
	[FILE_EXT] AS (reverse(substring(reverse([NOMBRE]),(0),charindex('.',reverse([NOMBRE]))+(1)))) NULL
)
ON [PRIMARY]
