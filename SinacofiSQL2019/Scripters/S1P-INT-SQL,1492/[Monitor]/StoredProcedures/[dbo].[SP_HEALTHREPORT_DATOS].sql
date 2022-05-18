SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SP_HEALTHREPORT_DATOS]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SP_HEALTHREPORT_DATOS] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[SP_HEALTHREPORT_DATOS]
--/****************************************************************************/
--/*Nombre         : SP_HEALTHREPORT                                          */
--/*Autor          : Sebastián Vásquez                                        */
--/*Descripci¿n    : Reporte AJAX                                             */
--/*                 Ambiente Produccion                                      */
--/*Fecha Creaci¿n : 22-Mayo-2015 10:00                                       */
--/*Versi¿n        : V01.00-000                                               */
--/*Bitacora       :                                                          */
--/****************************************************************************/
AS
DECLARE @flSqlServerUsed float
DECLARE @flTotalMemory float
DECLARE @flAvailableMemory float

-- Inserta en tabla de control tblRD_Sesiones
insert into tblRD_Sesiones(Fecha,login_name,host_name,Cantidad_Sesiones)
SELECT GETDATE() Fecha,
	   login_name,
       host_name, 
       COUNT(session_id) Cantidad_Sesiones
FROM sys.dm_exec_sessions WITH (NOLOCK)
WHERE session_id > 50	-- filter out system SPIDs
GROUP BY login_name,host_name
ORDER BY COUNT(session_id) DESC OPTION (RECOMPILE);

-- Inserta en tabla de control tblRD_Memoria
select @flSqlServerUsed = physical_memory_in_use_kb/1024/1024
from sys.dm_os_process_memory 

select @flTotalMemory = total_physical_memory_kb/1024/1024,
       @flAvailableMemory = available_physical_memory_kb/1024/1024
from sys.dm_os_sys_memory;

insert into tblRD_Memoria(fecha,Total,en_Uso,Disponible)
values (GETDATE(),@flTotalMemory,@flSqlServerUsed,@flAvailableMemory)

-- Inserta en tabla de control tblRD_TamannoBD

insert into tblRD_TamannoBD(Fecha,Dbname,vcdbstatus,vcRecoveryModel,flFileSizeMB,flSpaceUsedMB,flFreeSpaceMB) 
exec sp_msforeachdb 
'use [?]; 
select getdate() as Fecha,
    DB_NAME() AS DbName, 
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Status'')) ,  
    CONVERT(varchar(20),DatabasePropertyEx(''?'',''Recovery'')), 
    sum(d.size)/1024.0 AS File_MB, 
    sum(CAST(FILEPROPERTY(d.name, ''SpaceUsed'') AS INT))/1024.0 as Space_Used_MB, 
    SUM(d.size)/1024.0 - sum(CAST(FILEPROPERTY(d.name,''SpaceUsed'') AS INT))/1024.0 AS Free_Space_MB
from sys.database_files d inner join sys.master_files m on d.file_id = m.file_id
where d.type=0 
and m.database_id NOT IN (1,2,3,4,5)
group by d.type'
GO
