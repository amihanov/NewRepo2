if (select cmptlevel from master..sysdatabases where name = '$(db)') < 80 begin
	exec sp_dbcmptlevel '$(db)'
	exec sp_dbcmptlevel '$(db)', 80
end	