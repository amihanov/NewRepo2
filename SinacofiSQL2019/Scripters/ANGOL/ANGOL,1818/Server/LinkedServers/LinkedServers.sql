
GO
--SqlScripter----[TRAPANI].sql
GO
exec sp_addlinkedserver @server='TRAPANI'
                       ,@srvproduct='Oracle'
                       ,@provider='OraOLEDB.Oracle'
                       ,@datasrc='FACTURE_TRAPANI'
                       ,@location=NULL
                       ,@provstr=NULL
                       ,@catalog=NULL
GO
exec sp_serveroption @server='TRAPANI'
                    ,@optname='rpc'
                    ,@optvalue='false'
GO
exec sp_serveroption @server='TRAPANI'
                    ,@optname='rpc_out'
                    ,@optvalue='false'
GO
exec sp_serveroption @server='TRAPANI'
                    ,@optname='data access'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='TRAPANI'
                    ,@optname='use remote collation'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='TRAPANI'
                    ,@optname='collation compatible'
                    ,@optvalue='false'
GO
exec sp_serveroption @server='TRAPANI'
                    ,@optname='lazy schema validation'
                    ,@optvalue='false'
GO
exec sp_addlinkedsrvlogin @rmtsrvname='TRAPANI'
                         ,@useself='false'
                         ,@locallogin=NULL
                         ,@rmtuser='ora_sqlserver'
                         ,@rmtpassword='ora_sqlserver'
