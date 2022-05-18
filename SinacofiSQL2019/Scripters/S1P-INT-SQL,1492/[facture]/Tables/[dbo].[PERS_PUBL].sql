SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PERS_PUBL](
	[CONT_RUTT] [numeric](20, 0) NOT NULL,
	[CONT_DIGI] [varchar](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CONT_RAZO] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CONT_CASI_SII] [varchar](80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CONT_URLL_SII] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_CONF] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[PERS_PAIS] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
	[FECH_RESO] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]
