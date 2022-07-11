SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spCpuMonitor]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spCpuMonitor] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spCpuMonitor]
--/****************************************************************************/
--/*Nombre         : SP_CPUMONITOR                                            */
--/*Autor          : Nicolas Huenul Mansilla                                  */
--/*Descripci¿n    : Monitor CPU al MINUTOR                                   */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 01-Julio-2013 10:00                                      */
--/*Versi¿n        : V01.00-000                                               */
--/*Bitacora       :                                                          */
--/****************************************************************************/
AS

DECLARE @ts_now BIGINT
SELECT @ts_now = cpu_ticks / CONVERT(FLOAT, (cpu_ticks / ms_ticks))
FROM sys.dm_os_sys_info

insert into monitor.dbo.tblCPUMonitor
SELECT TOP 1
	DATEADD(ms, -1 * (@ts_now - [TIMESTAMP]), GETDATE()) AS MonitorTime, 
	SQLProcessUtilization,
	SystemIdle,
	100 - SystemIdle - SQLProcessUtilization AS OtherProcessUtilization
FROM 
	(SELECT 
		record.value('(./Record/@id)[1]', 'int') AS record_id,
		record.value('(./Record/SchedulerMonitorEvent/SystemHealth/SystemIdle)[1]', 'int') AS SystemIdle,
		record.value('(./Record/SchedulerMonitorEvent/SystemHealth/ProcessUtilization)[1]', 'int') AS SQLProcessUtilization,
		TIMESTAMP
	FROM (
		SELECT TIMESTAMP, CONVERT(XML, record) AS record 
		FROM sys.dm_os_ring_buffers 
		WHERE ring_buffer_type = N'RING_BUFFER_SCHEDULER_MONITOR'
		AND record LIKE '%<SystemHealth>%') AS x
	) AS y 
ORDER BY record_id  DESC OPTION (RECOMPILE);

/*
--/****************************************************************************/
--/*Autor          : Sebastián Vásquez                                        */
--/*Descripci¿n    : Monitor MEMORIA al MINUTO                                */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 24-Octubre-2014 10:00                                    */
--/*Versi¿n        : V01.00-000                                               */
--/****************************************************************************/
SET NOCOUNT ON;
DECLARE @TempMem TABLE 
(
Fecha         varchar(20),
Database_name nvarchar(50),
BufferCount   int,
BufferSizeMB  int,
BufferSizePer numeric(6,3)
);

DECLARE @total_buffer INT;
SELECT @total_buffer = cntr_value FROM sys.dm_os_performance_counters
WHERE RTRIM([object_name]) LIKE '%Buffer Manager'
AND counter_name = 'Total Pages';
;WITH BufCount AS
(
SELECT
database_id, db_buffer_pages = COUNT_BIG(*) FROM sys.dm_os_buffer_descriptors
WHERE database_id BETWEEN 5 AND 32766
GROUP BY database_id
)
INSERT @TempMem 
SELECT
GETDATE() Fecha,
[Database_Name] = CASE [database_id] WHEN 32767
                  THEN 'MSSQL System Resource DB'
                  ELSE DB_NAME([database_id]) END,
db_buffer_pages as [Buffer Count (8KB Pages)],
[Buffer Size (MB)] = db_buffer_pages / 128,
[Buffer Size (%)] = CONVERT(DECIMAL(6,3),
db_buffer_pages * 100.0 / @total_buffer)
FROM BufCount
ORDER BY [Buffer Size (MB)] DESC;

INSERT INTO [Monitor].[dbo].[tblMemMonitor] 
       SELECT * FROM @TempMem;

INSERT INTO      [Monitor].[dbo].[tblSesiones]
		SELECT   GETDATE() Fecha,COUNT(session_id) NSesiones
		FROM     sys.dm_exec_sessions WITH (NOLOCK)
		WHERE    session_id > 50	-- filter out system SPIDs
		ORDER BY COUNT(session_id) DESC OPTION (RECOMPILE);

INSERT INTO [Monitor].[dbo].[tblRequest]
       SELECT GETDATE() Fecha,COUNT(*) CantRequest
       FROM sys.dm_exec_requests
GO*/
GO
