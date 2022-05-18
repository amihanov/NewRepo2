EXEC sp_configure 'show advanced options', 1
RECONFIGURE WITH OVERRIDE
EXEC sp_configure 'xp_cmdshell', 1
EXEC sp_configure 'xp_cmdshell'
RECONFIGURE WITH OVERRIDE
EXEC sp_configure 'show advanced options', 0
RECONFIGURE WITH OVERRIDE
