SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[harversions](
	[versionobjid] [int] NOT NULL,
	[itemobjid] [int] NOT NULL,
	[packageobjid] [int] NOT NULL,
	[parentversionid] [int] NOT NULL,
	[mergedversionid] [int] NOT NULL,
	[inbranch] [int] NOT NULL,
	[mappedversion] [varchar](16) NULL,
	[versionstatus] [char](1) COLLATE Modern_Spanish_CS_AS_KS_WS NULL,
	[creationtime] [datetime] NOT NULL,
	[creatorid] [int] NOT NULL,
	[modifiedtime] [datetime] NOT NULL,
	[modifierid] [int] NOT NULL,
	[description] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
	[versiondataobjid] [int] NOT NULL,
	[clientmachine] [varchar](50) COLLATE Modern_Spanish_CS_AS_KS_WS NULL,
	[clientpath] [varchar](1024) COLLATE Modern_Spanish_CS_AS_KS_WS NULL,
	[ancestorversionid] [int] NOT NULL,
	[ITEMNAMEID] [int] NULL,
	[ITEMTYPE] [int] NULL,
	[PATHVERSIONID] [int] NULL,
	[REFACTOR] [char](1) NULL,
	[REFACTOR_BY] [int] NULL
)
ON [PRIMARY]
