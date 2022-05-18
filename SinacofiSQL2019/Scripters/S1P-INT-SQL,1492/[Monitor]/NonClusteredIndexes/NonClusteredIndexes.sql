
GO
--SqlScripter----[dbo].[tblLoginFailed].[idx_fecha].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_fecha] ON [dbo].[tblLoginFailed] (
	[dtFecha] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tErrorLogs].[PK_tErrorLogs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tErrorLogs] ADD CONSTRAINT [PK_tErrorLogs] PRIMARY KEY NONCLUSTERED (
	[RowNumber] ASC
) ON [PRIMARY]
