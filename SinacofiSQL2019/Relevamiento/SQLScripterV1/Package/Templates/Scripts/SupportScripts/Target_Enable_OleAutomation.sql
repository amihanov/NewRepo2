EXEC sp_configure 'show advanced options', 1
RECONFIGURE WITH OVERRIDE
EXEC sp_configure 'Ole Automation Procedures', 1;
EXEC sp_configure 'Ole Automation Procedures';
RECONFIGURE WITH OVERRIDE
EXEC sp_configure 'show advanced options', 0
RECONFIGURE WITH OVERRIDE
