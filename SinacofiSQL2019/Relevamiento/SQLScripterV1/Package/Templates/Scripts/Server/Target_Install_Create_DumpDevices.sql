--use master
--go


--IF  EXISTS (SELECT name FROM master.dbo.sysdevices WHERE name = N'dmp_bd_rel_rcd_lna')
--EXEC master.dbo.sp_dropdevice @logicalname = N'dmp_bd_rel_rcd_lna'
--GO

--EXEC master.dbo.sp_addumpdevice  @devtype = N'disk', @logicalname = N'dmp_bd_rel_rcd_lna', @physicalname = N'g:\MSSQL\BACKUP\rel\dmp_bd_rel_rcd_lna.BAK'
--GO

--IF  EXISTS (SELECT name FROM master.dbo.sysdevices WHERE name = N'dmp_bd_cheqe_elt')
--EXEC master.dbo.sp_dropdevice @logicalname = N'dmp_bd_cheqe_elt'
--GO

--EXEC master.dbo.sp_addumpdevice  @devtype = N'disk', @logicalname = N'dmp_bd_cheqe_elt', @physicalname = N'g:\MSSQL\BACKUP\rel\dmp_bd_cheqe_elt.BAK'
--GO


