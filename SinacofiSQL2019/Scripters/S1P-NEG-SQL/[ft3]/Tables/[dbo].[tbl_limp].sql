SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_limp](
	[ide_traz] [int] NOT NULL,
	[est_limp] [varchar](2) NOT NULL,
	[est_tarc] [varchar](2) NULL,
	[est_tpro] [varchar](2) NULL,
	[cas_orig] [varchar](8) NULL,
	[cas_dest] [varchar](8) NULL,
	[nom_arch] [varchar](20) NOT NULL,
	[tam_arch] [float] NULL,
	[fec_rece] [datetime2](3) NOT NULL,
	[fec_boar] [datetime2](3) NOT NULL,
	[fec_botr] [datetime2](3) NOT NULL,
	[cod_prod] [varchar](6) NULL,
	[cod_inst] [varchar](4) NULL,
	[cod_serv] [varchar](8) NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]
