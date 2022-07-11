SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRD_Sesiones](
	[fecha] [datetime] NOT NULL,
	[login_name] [nvarchar](100) NULL,
	[host_name] [nvarchar](100) NULL,
	[Cantidad_Sesiones] [int] NULL
)
ON [PRIMARY]
