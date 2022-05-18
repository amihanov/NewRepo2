
GO
--SqlScripter----[dbo].[bases_info].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bases_info](
	[baseDatos] [varchar](30) NOT NULL,
	[TotalMB] [decimal](9, 2) NULL,
	[FileDataMB] [decimal](9, 2) NULL,
	[DatausadaMB] [decimal](9, 2) NULL,
	[PorcentajeUsado] [decimal](9, 2) NULL,
	[DataLibreMB] [decimal](9, 2) NULL,
	[PorcentajeLibre] [decimal](9, 2) NULL,
	[FileLogMB] [decimal](9, 2) NULL,
	[LogUsadoMB] [decimal](9, 2) NULL,
	[PorcentajeLogUsado] [decimal](9, 2) NULL,
	[LogLibreMB] [decimal](9, 2) NULL,
	[PorcentajeLoglibre] [decimal](9, 2) NULL,
	[fecha-muestra] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[bases_plan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bases_plan](
	[baseDatos] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TotalMB] [float] NULL,
	[FileDataMB] [float] NULL,
	[DatausadaMB] [float] NULL,
	[PorcentajeUsado] [float] NULL,
	[DataLibreMB] [float] NULL,
	[PorcentajeLibre] [float] NULL,
	[FileLogMB] [float] NULL,
	[LogUsadoMB] [float] NULL,
	[PorcentajeLogUsado] [float] NULL,
	[LogLibreMB] [float] NULL,
	[PorcentajeLoglibre] [float] NULL,
	[fecha-muestra] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[errorlog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[errorlog](
	[col] [varchar](2048) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[evento].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[evento](
	[event] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[EventTable].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[EventTable](
	[Category] [int] NULL,
	[ComputerName] [varchar](50) NULL,
	[EventCode] [int] NULL,
	[Message] [varchar](100) NULL,
	[EventType] [varchar](50) NULL,
	[RecordNumber] [int] NULL,
	[SourceName] [varchar](50) NULL,
	[TypeDesc] [varchar](15) NULL,
	[UserName] [varchar](50) NULL,
	[TimeGenerated] [varchar](19) NULL,
	[TimeWritten] [varchar](19) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[Num_trc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Num_trc](
	[num] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[OLE DB Destination].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[OLE DB Destination](
	[Column 0] [varchar](50) NULL,
	[Column 1] [varchar](50) NULL,
	[Column 2] [varchar](50) NULL,
	[Column 3] [varchar](50) NULL,
	[Column 4] [varchar](50) NULL,
	[Column 5] [varchar](50) NULL,
	[Column 6] [varchar](50) NULL,
	[Column 7] [varchar](50) NULL,
	[Column 8] [varchar](50) NULL,
	[Copy of Column 1] [varchar](50) NULL,
	[Copy of Column 2] [varchar](50) NULL,
	[Copy of Column 3] [varchar](50) NULL,
	[Copy of Column 4] [varchar](50) NULL,
	[Copy of Column 5] [varchar](50) NULL,
	[Copy of Column 6] [varchar](50) NULL,
	[Copy of Column 8] [varchar](100) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[spacedb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[spacedb](
	[DB] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DATOS] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USADO] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[spacedb_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[spacedb_hist](
	[DB] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DATOS] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USADO] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fecha] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[SpaceLog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SpaceLog](
	[db] [sysname] NOT NULL,
	[LogSize] [decimal](18, 0) NULL,
	[porcen_used] [decimal](18, 0) NULL,
	[status] [decimal](18, 0) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[SpaceLog_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SpaceLog_hist](
	[db] [sysname] NOT NULL,
	[LogSize] [decimal](18, 0) NULL,
	[porcen_used] [decimal](18, 0) NULL,
	[status] [decimal](18, 0) NULL,
	[fecha] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[spacetotal_bd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[spacetotal_bd](
	[nom] [char](50) NULL,
	[datos] [nvarchar](20) NULL,
	[fecha] [char](12) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[spacetotal_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[spacetotal_log](
	[nom] [char](50) NULL,
	[logsize] [decimal](18, 0) NULL,
	[fecha] [char](12) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[spacetotalBD_Mes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[spacetotalBD_Mes](
	[nom] [char](50) NULL,
	[size] [decimal](18, 0) NULL,
	[fecha] [char](12) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tabla_pasovero].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tabla_pasovero](
	[Column 0] [varchar](50) NULL,
	[Column 1] [varchar](50) NULL,
	[Column 2] [varchar](50) NULL,
	[Column 3] [varchar](50) NULL,
	[Column 4] [varchar](50) NULL,
	[Column 5] [varchar](50) NULL,
	[Column 6] [varchar](50) NULL,
	[Column 7] [varchar](50) NULL,
	[Column 8] [varchar](50) NULL,
	[Copy of Column 1] [varchar](50) NULL,
	[Copy of Column 2] [varchar](50) NULL,
	[Copy of Column 3] [varchar](50) NULL,
	[Copy of Column 4] [varchar](50) NULL,
	[Copy of Column 5] [varchar](50) NULL,
	[Copy of Column 6] [varchar](50) NULL,
	[Copy of Column 8] [varchar](100) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tb_drives].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tb_drives](
	[disco] [char](1) NULL,
	[SizeInicial] [int] NULL,
	[SizeRealMB] [int] NULL,
	[fecha] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tb_trc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tb_trc](
	[TextData] [ntext] NULL,
	[BinaryData] [image] NULL,
	[DatabaseID] [int] NULL,
	[TransactionID] [bigint] NULL,
	[LineNumber] [int] NULL,
	[NTUserName] [nvarchar](256) NULL,
	[NTDomainName] [nvarchar](256) NULL,
	[HostName] [nvarchar](256) NULL,
	[ClientProcessID] [int] NULL,
	[ApplicationName] [nvarchar](256) NULL,
	[LoginName] [nvarchar](256) NULL,
	[SPID] [int] NULL,
	[Duration] [bigint] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[CPU] [int] NULL,
	[Permissions] [bigint] NULL,
	[Severity] [int] NULL,
	[EventSubClass] [int] NULL,
	[ObjectID] [int] NULL,
	[Success] [int] NULL,
	[IndexID] [int] NULL,
	[IntegerData] [int] NULL,
	[ServerName] [nvarchar](256) NULL,
	[EventClass] [int] NULL,
	[ObjectType] [int] NULL,
	[NestLevel] [int] NULL,
	[State] [int] NULL,
	[Error] [int] NULL,
	[Mode] [int] NULL,
	[Handle] [int] NULL,
	[ObjectName] [nvarchar](256) NULL,
	[DatabaseName] [nvarchar](256) NULL,
	[FileName] [nvarchar](256) NULL,
	[OwnerName] [nvarchar](256) NULL,
	[RoleName] [nvarchar](256) NULL,
	[TargetUserName] [nvarchar](256) NULL,
	[DBUserName] [nvarchar](256) NULL,
	[LoginSid] [image] NULL,
	[TargetLoginName] [nvarchar](256) NULL,
	[TargetLoginSid] [image] NULL,
	[ColumnPermissions] [int] NULL,
	[LinkedServerName] [nvarchar](256) NULL,
	[ProviderName] [nvarchar](256) NULL,
	[MethodName] [nvarchar](256) NULL,
	[RowCounts] [bigint] NULL,
	[RequestID] [int] NULL,
	[XactSequence] [bigint] NULL,
	[EventSequence] [bigint] NULL,
	[BigintData1] [bigint] NULL,
	[BigintData2] [bigint] NULL,
	[GUID] [uniqueidentifier] NULL,
	[IntegerData2] [int] NULL,
	[ObjectID2] [bigint] NULL,
	[Type] [int] NULL,
	[OwnerID] [int] NULL,
	[ParentName] [nvarchar](256) NULL,
	[IsSystem] [int] NULL,
	[Offset] [int] NULL,
	[SourceDatabaseID] [int] NULL,
	[SqlHandle] [image] NULL,
	[SessionLoginName] [nvarchar](256) NULL,
	[PlanHandle] [image] NULL,
	[GroupID] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_baseback].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_baseback](
	[Archivo] [char](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fecha] [datetime] NULL,
	[nombd] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[tipo] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[procesado] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[media_set_id] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_control].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_control](
	[c1] [varchar](30) NULL,
	[c2] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_Espacio_Reporte].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_Espacio_Reporte](
	[Dbname] [sysname] NOT NULL,
	[vcdbstatus] [varchar](50) NULL,
	[vcRecoveryModel] [varchar](40) NULL,
	[flFileSizeMB] [float] NULL,
	[flSpaceUsedMB] [float] NULL,
	[flFreeSpaceMB] [float] NULL,
	[vcVolumen] [varchar](10) NULL,
	[flTotalSpace] [float] NULL,
	[flAvailableSpace] [float] NULL,
	[flPercentageAvailable] [float] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_monitorauditoria].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_monitorauditoria](
	[trace] [int] NULL,
	[property] [int] NULL,
	[value] [varchar](200) NULL,
	[fecha] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_monitorauditoria_dia].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_monitorauditoria_dia](
	[trace] [int] NULL,
	[property] [int] NULL,
	[value] [varchar](200) NULL,
	[fecha] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_paso_1312].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_paso_1312](
	[c1] [int] NULL,
	[c2] [decimal](5, 2) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_pasousu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_pasousu](
	[sid] [varbinary](85) NULL,
	[status] [smallint] NULL,
	[createdate] [datetime] NULL,
	[updatedate] [datetime] NULL,
	[accdate] [datetime] NULL,
	[totcpu] [int] NULL,
	[totio] [int] NULL,
	[spacelimit] [int] NULL,
	[timelimit] [int] NULL,
	[resultlimit] [int] NULL,
	[name] [sysname] NULL,
	[dbname] [sysname] NULL,
	[password] [sysname] NULL,
	[language] [sysname] NULL,
	[denylogin] [int] NULL,
	[hasaccess] [int] NULL,
	[isntname] [int] NULL,
	[isntgroup] [int] NULL,
	[isntuser] [int] NULL,
	[sysadmin] [int] NULL,
	[securityadmin] [int] NULL,
	[serveradmin] [int] NULL,
	[setupadmin] [int] NULL,
	[processadmin] [int] NULL,
	[diskadmin] [int] NULL,
	[dbcreator] [int] NULL,
	[bulkadmin] [int] NULL,
	[loginname] [sysname] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_sizebd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_sizebd](
	[sizeMB] [int] NULL,
	[fecha] [datetime] NULL,
	[fileid] [smallint] NOT NULL,
	[groupid] [smallint] NOT NULL,
	[size] [int] NOT NULL,
	[maxsize] [int] NOT NULL,
	[growth] [int] NOT NULL,
	[status] [int] NOT NULL,
	[perf] [int] NOT NULL,
	[name] [nchar](128) NULL,
	[filename] [nchar](260) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_sizebd_files].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_sizebd_files](
	[nombd] [varchar](80) NULL,
	[dbid] [int] NULL,
	[sizefiles] [float] NULL,
	[nomfiles] [varchar](80) NULL,
	[fecha] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_sizediscos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_sizediscos](
	[tbl_dis] [char](1) NULL,
	[tbl_free_MB] [numeric](18, 0) NULL,
	[tbl_fecha] [datetime] NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_splunk_logins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_splunk_logins](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[sid] [varbinary](85) NULL,
	[type] [char](1) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[type_desc] [nvarchar](60) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[is_disabled] [bit] NULL,
	[create_date] [datetime] NOT NULL,
	[modify_date] [datetime] NOT NULL,
	[default_database_name] [sysname] NULL,
	[default_language_name] [sysname] NULL,
	[credential_id] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblContador].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblContador](
	[iNumero] [int] NULL,
	[iHora] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblCPUMonitor].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblCPUMonitor](
	[dtFechaHora] [datetime] NOT NULL,
	[iSqlCpuUse] [int] NOT NULL,
	[iSystemIdle] [int] NOT NULL,
	[iOtherProcess] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblErrorLog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblErrorLog](
	[dtLogDate] [datetime] NULL,
	[vcProcessInfor] [varchar](50) NULL,
	[vcText] [varchar](250) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblHijo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblHijo](
	[nombreHijo] [varchar](10) NULL,
	[idHijo] [int] NULL,
	[idPadre] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblLoginFailed].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblLoginFailed](
	[dtFecha] [datetime] NULL,
	[vcInstancia] [varchar](50) NULL,
	[vcResto] [varchar](200) NULL,
	[dtFechaRegistro] [datetime] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblLoginFailedUltFTP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblLoginFailedUltFTP](
	[dtFecha] [datetime] NULL,
	[vcInstancia] [varchar](50) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblLoginFailedUltRegistro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblLoginFailedUltRegistro](
	[dtFecha] [datetime] NULL,
	[vcInstancia] [varchar](50) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMemMonitor].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblMemMonitor](
	[Fecha] [datetime] NOT NULL,
	[Database_name] [varchar](50) NOT NULL,
	[Buffer Count (8KB Pages)] [numeric](10, 0) NOT NULL,
	[Buffer Size (MB)] [numeric](10, 0) NOT NULL,
	[Buffer Size (%)] [numeric](6, 3) NOT NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblMonitorUptime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblMonitorUptime](
	[vcFecha] [varchar](8) NULL,
	[flCount] [float] NULL,
	[flPorcentaje] [float] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPadre].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblPadre](
	[nombrePadre] [varchar](10) NULL,
	[idPadre] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblPrueba].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblPrueba](
	[iRut] [int] NULL,
	[vcNombre] [varchar](50) NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRD_Memoria].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRD_Memoria](
	[fecha] [datetime] NOT NULL,
	[Total] [float] NULL,
	[en_Uso] [float] NULL,
	[Disponible] [float] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRD_Sesiones].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRD_Sesiones](
	[fecha] [datetime] NOT NULL,
	[login_name] [nvarchar](100) NULL,
	[host_name] [nvarchar](100) NULL,
	[Cantidad_Sesiones] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRD_TamannoBD].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRD_TamannoBD](
	[Fecha] [datetime] NOT NULL,
	[Dbname] [sysname] NOT NULL,
	[vcdbstatus] [varchar](50) NULL,
	[vcRecoveryModel] [varchar](40) NULL,
	[flFileSizeMB] [float] NULL,
	[flSpaceUsedMB] [float] NULL,
	[flFreeSpaceMB] [float] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblRequest].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblRequest](
	[Fecha] [datetime] NULL,
	[CantRequest] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tblSesiones].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblSesiones](
	[Fecha] [datetime] NULL,
	[CantSesiones] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbltemp_usr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbltemp_usr](
	[sid] [varbinary](85) NULL,
	[status] [smallint] NULL,
	[createdate] [datetime] NULL,
	[updatedate] [datetime] NULL,
	[accdate] [datetime] NULL,
	[totcpu] [int] NULL,
	[totio] [int] NULL,
	[spacelimit] [int] NULL,
	[timelimit] [int] NULL,
	[resultlimit] [int] NULL,
	[name] [sysname] NULL,
	[dbname] [sysname] NULL,
	[password] [sysname] NULL,
	[language] [sysname] NULL,
	[denylogin] [int] NULL,
	[hasaccess] [int] NULL,
	[isntname] [int] NULL,
	[isntgroup] [int] NULL,
	[isntuser] [int] NULL,
	[sysadmin] [int] NULL,
	[securityadmin] [int] NULL,
	[serveradmin] [int] NULL,
	[setupadmin] [int] NULL,
	[processadmin] [int] NULL,
	[diskadmin] [int] NULL,
	[dbcreator] [int] NULL,
	[bulkadmin] [int] NULL,
	[loginname] [sysname] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[temp_trc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[temp_trc](
	[TextData] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BinaryData] [image] NULL,
	[DatabaseID] [int] NULL,
	[TransactionID] [bigint] NULL,
	[LineNumber] [int] NULL,
	[NTUserName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NTDomainName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HostName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClientProcessID] [int] NULL,
	[ApplicationName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LoginName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SPID] [int] NULL,
	[Duration] [bigint] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[CPU] [int] NULL,
	[Permissions] [bigint] NULL,
	[Severity] [int] NULL,
	[EventSubClass] [int] NULL,
	[ObjectID] [int] NULL,
	[Success] [int] NULL,
	[IndexID] [int] NULL,
	[IntegerData] [int] NULL,
	[ServerName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EventClass] [int] NULL,
	[ObjectType] [int] NULL,
	[NestLevel] [int] NULL,
	[State] [int] NULL,
	[Error] [int] NULL,
	[Mode] [int] NULL,
	[Handle] [int] NULL,
	[ObjectName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DatabaseName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FileName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OwnerName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RoleName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TargetUserName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DBUserName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LoginSid] [image] NULL,
	[TargetLoginName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TargetLoginSid] [image] NULL,
	[ColumnPermissions] [int] NULL,
	[LinkedServerName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProviderName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MethodName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RowCounts] [bigint] NULL,
	[RequestID] [int] NULL,
	[XactSequence] [bigint] NULL,
	[EventSequence] [bigint] NULL,
	[BigintData1] [bigint] NULL,
	[BigintData2] [bigint] NULL,
	[GUID] [uniqueidentifier] NULL,
	[IntegerData2] [int] NULL,
	[ObjectID2] [bigint] NULL,
	[Type] [int] NULL,
	[OwnerID] [int] NULL,
	[ParentName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsSystem] [int] NULL,
	[Offset] [int] NULL,
	[SourceDatabaseID] [int] NULL,
	[SqlHandle] [image] NULL,
	[SessionLoginName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PlanHandle] [image] NULL,
	[GroupID] [int] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tErrorLogs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tErrorLogs](
	[RowNumber] [int] IDENTITY(1, 1),
	[ErrorText] [varchar](6000) NULL,
	[continuationrow] [bit] NULL
)
ON [PRIMARY]

GO
--SqlScripter----[dbo].[tmp_drives].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tmp_drives](
	[disco] [char](1) NULL,
	[SizeRealMB] [int] NULL
)
ON [PRIMARY]
