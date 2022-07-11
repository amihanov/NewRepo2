SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_opca](
	[ide_traz] [int] NOT NULL,
	[cod_erro] [varchar](7) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]
