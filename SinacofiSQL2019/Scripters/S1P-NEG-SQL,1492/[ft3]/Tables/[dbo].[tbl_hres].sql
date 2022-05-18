SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_hres](
	[cor_resc] [int] NOT NULL,
	[cas_dest] [varchar](8) NOT NULL,
	[nom_msg] [varchar](3) NOT NULL,
	[nom_arch] [varchar](20) NOT NULL,
	[cas_orig] [varchar](8) NULL,
	[tam_arch] [float] NOT NULL,
	[est_resc] [varchar](2) NOT NULL,
	[est_fres] [varchar](2) NOT NULL,
	[fec_arch] [datetime2](3) NOT NULL,
	[fec_ingr] [datetime2](3) NOT NULL,
	[usu_ingr] [varchar](15) NOT NULL
)
ON [PRIMARY]
