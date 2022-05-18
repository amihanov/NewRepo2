SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_MEM_MONITOR]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_MEM_MONITOR] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_MEM_MONITOR]
--/****************************************************************************/
--/*Nombre         : SP_MEMONITOR                                             */
--/*Autor          : Sebastian Vasquez Valderrama                             */
--/*Descripci¿n    : Monitor Memoria al MINUTO                                */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 24-Octubre-2014 10:00                                    */
--/*Versi¿n        : V01.00-000                                               */
--/*Bitacora       :                                                          */
--/****************************************************************************/
AS
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
GO
