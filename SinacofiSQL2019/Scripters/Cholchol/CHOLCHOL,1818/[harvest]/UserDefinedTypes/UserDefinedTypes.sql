
GO
--SqlScripter----[dbo].[ACCESS_TYPE].sql
GO
CREATE TYPE [dbo].[ACCESS_TYPE] FROM [int] NULL

GO
--SqlScripter----[dbo].[BOOLEAN_FLAG].sql
GO
CREATE TYPE [dbo].[BOOLEAN_FLAG] FROM [tinyint] NULL

GO
--SqlScripter----[dbo].[CALCULATION_TYPE].sql
GO
CREATE TYPE [dbo].[CALCULATION_TYPE] FROM [tinyint] NULL

GO
--SqlScripter----[dbo].[CAPABILITIES_MASK].sql
GO
CREATE TYPE [dbo].[CAPABILITIES_MASK] FROM [int] NULL

GO
--SqlScripter----[dbo].[COMPILE_STATUS_TYPE].sql
GO
CREATE TYPE [dbo].[COMPILE_STATUS_TYPE] FROM [tinyint] NULL

GO
--SqlScripter----[dbo].[DATABASE_TYPE].sql
GO
CREATE TYPE [dbo].[DATABASE_TYPE] FROM [smallint] NULL

GO
--SqlScripter----[dbo].[DATETIME_TYPE].sql
GO
CREATE TYPE [dbo].[DATETIME_TYPE] FROM [datetime] NULL

GO
--SqlScripter----[dbo].[DAY_TYPE].sql
GO
CREATE TYPE [dbo].[DAY_TYPE] FROM [tinyint] NULL

GO
--SqlScripter----[dbo].[DES_GLOBVALUE_TYPE].sql
GO
CREATE TYPE [dbo].[DES_GLOBVALUE_TYPE] FROM [binary](248) NULL

GO
--SqlScripter----[dbo].[DES_PASSWORD_TYPE].sql
GO
CREATE TYPE [dbo].[DES_PASSWORD_TYPE] FROM [binary](32) NULL

GO
--SqlScripter----[dbo].[DES_TEXT_TYPE].sql
GO
CREATE TYPE [dbo].[DES_TEXT_TYPE] FROM [image] NULL

GO
--SqlScripter----[dbo].[DOW_TYPE].sql
GO
CREATE TYPE [dbo].[DOW_TYPE] FROM [tinyint] NULL

GO
--SqlScripter----[dbo].[ERRORMSG_TYPE].sql
GO
CREATE TYPE [dbo].[ERRORMSG_TYPE] FROM [varchar](255) NULL

GO
--SqlScripter----[dbo].[HANDLER_KEYS_TYPE].sql
GO
CREATE TYPE [dbo].[HANDLER_KEYS_TYPE] FROM [image] NULL

GO
--SqlScripter----[dbo].[HOUR_TYPE].sql
GO
CREATE TYPE [dbo].[HOUR_TYPE] FROM [tinyint] NULL

GO
--SqlScripter----[dbo].[IDENTIFIER_TYPE].sql
GO
CREATE TYPE [dbo].[IDENTIFIER_TYPE] FROM [int] NULL

GO
--SqlScripter----[dbo].[LONG_NAME_TYPE].sql
GO
CREATE TYPE [dbo].[LONG_NAME_TYPE] FROM [varchar](128) NULL

GO
--SqlScripter----[dbo].[MESSAGE_TYPE].sql
GO
CREATE TYPE [dbo].[MESSAGE_TYPE] FROM [varchar](255) NULL

GO
--SqlScripter----[dbo].[MINUTE_TYPE].sql
GO
CREATE TYPE [dbo].[MINUTE_TYPE] FROM [tinyint] NULL

GO
--SqlScripter----[dbo].[MONTH_TYPE].sql
GO
CREATE TYPE [dbo].[MONTH_TYPE] FROM [tinyint] NULL

GO
--SqlScripter----[dbo].[NAME_TYPE].sql
GO
CREATE TYPE [dbo].[NAME_TYPE] FROM [varchar](32) NULL

GO
--SqlScripter----[dbo].[NOTE_TYPE].sql
GO
CREATE TYPE [dbo].[NOTE_TYPE] FROM [varchar](255) NULL

GO
--SqlScripter----[dbo].[OBJECT_TYPE].sql
GO
CREATE TYPE [dbo].[OBJECT_TYPE] FROM [tinyint] NULL

GO
--SqlScripter----[dbo].[PARAMETER_VALUE_TYPE].sql
GO
CREATE TYPE [dbo].[PARAMETER_VALUE_TYPE] FROM [varchar](255) NULL

GO
--SqlScripter----[dbo].[PASSWORD_TYPE].sql
GO
CREATE TYPE [dbo].[PASSWORD_TYPE] FROM [varchar](32) NULL

GO
--SqlScripter----[dbo].[PERMISSION_MASK].sql
GO
CREATE TYPE [dbo].[PERMISSION_MASK] FROM [int] NULL

GO
--SqlScripter----[dbo].[PROV_KEYS_TYPE].sql
GO
CREATE TYPE [dbo].[PROV_KEYS_TYPE] FROM [image] NULL

GO
--SqlScripter----[dbo].[PROVIDER_TYPE].sql
GO
CREATE TYPE [dbo].[PROVIDER_TYPE] FROM [smallint] NULL

GO
--SqlScripter----[dbo].[QUERY_TYPE].sql
GO
CREATE TYPE [dbo].[QUERY_TYPE] FROM [varchar](255) NULL

GO
--SqlScripter----[dbo].[USER_TYPE].sql
GO
CREATE TYPE [dbo].[USER_TYPE] FROM [tinyint] NULL

GO
--SqlScripter----[dbo].[UUID].sql
GO
CREATE TYPE [dbo].[UUID] FROM [uniqueidentifier] NULL
