SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Usuarios](
	[UserId] [int] IDENTITY(1, 1),
	[UserName] [varchar](150) NULL,
	[UserCod] [varchar](50) NULL
)
ON [PRIMARY]
