SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_tarc](
	[ide_traz] [int] NOT NULL,
	[est_traz] [varchar](2) NOT NULL,
	[cas_orig] [varchar](8) NULL,
	[cas_dest] [varchar](8) NULL,
	[nom_arcc] [varchar](20) NOT NULL,
	[nom_arre] [varchar](34) NOT NULL,
	[tam_arch] [float] NULL,
	[fec_rece] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]
