﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DBQ_ARCH_CLOB](
	[CODI_ARCH] [numeric](20, 0) NOT NULL,
	[CLOB_ARCH] [text] COLLATE Modern_Spanish_CI_AS NULL
)
ON [PRIMARY]
