SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CV3010](
	[CV3_FILIAL] [varchar](2) NOT NULL,
	[CV3_DTSEQ] [varchar](8) NOT NULL,
	[CV3_SEQUEN] [varchar](10) NOT NULL,
	[CV3_LP] [varchar](3) NOT NULL,
	[CV3_LPSEQ] [varchar](3) NOT NULL,
	[CV3_KEY] [varchar](200) NOT NULL,
	[CV3_MOEDLC] [varchar](2) NOT NULL,
	[CV3_DC] [varchar](1) NOT NULL,
	[CV3_DEBITO] [varchar](20) NOT NULL,
	[CV3_CREDIT] [varchar](20) NOT NULL,
	[CV3_VLR01] [float] NOT NULL,
	[CV3_HIST] [varchar](40) NOT NULL,
	[CV3_CCD] [varchar](9) NOT NULL,
	[CV3_CCC] [varchar](9) NOT NULL,
	[CV3_ITEMD] [varchar](9) NOT NULL,
	[CV3_ITEMC] [varchar](9) NOT NULL,
	[CV3_CLVLDB] [varchar](9) NOT NULL,
	[CV3_CLVLCR] [varchar](9) NOT NULL,
	[CV3_VLR02] [float] NOT NULL,
	[CV3_VLR03] [float] NOT NULL,
	[CV3_VLR04] [float] NOT NULL,
	[CV3_VLR05] [float] NOT NULL,
	[CV3_TABORI] [varchar](3) NOT NULL,
	[CV3_RECORI] [varchar](17) NOT NULL,
	[CV3_RECDES] [varchar](17) NOT NULL,
	[CV3_MLTSLD] [varchar](20) NOT NULL,
	[CV3_AT01DB] [varchar](20) NOT NULL,
	[CV3_AT01CR] [varchar](20) NOT NULL,
	[CV3_AT02DB] [varchar](20) NOT NULL,
	[CV3_AT02CR] [varchar](20) NOT NULL,
	[CV3_AT03DB] [varchar](20) NOT NULL,
	[CV3_AT03CR] [varchar](20) NOT NULL,
	[CV3_AT04DB] [varchar](20) NOT NULL,
	[CV3_AT04CR] [varchar](20) NOT NULL,
	[D_E_L_E_T_] [varchar](1) NOT NULL,
	[R_E_C_N_O_] [bigint] NOT NULL,
	[R_E_C_D_E_L_] [bigint] NOT NULL
)
ON [PRIMARY]
