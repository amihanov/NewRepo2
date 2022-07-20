
GO
--SqlScripter----[LOGSHIPLINK_ROCHESTER_SQLPROD02_-1692744333].sql
GO
exec sp_addlinkedserver @server='LOGSHIPLINK_ROCHESTER\SQLPROD02_-1692744333'
                       ,@srvproduct='SQL Server'
GO
exec sp_serveroption @server='LOGSHIPLINK_ROCHESTER\SQLPROD02_-1692744333'
                    ,@optname='rpc'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='LOGSHIPLINK_ROCHESTER\SQLPROD02_-1692744333'
                    ,@optname='rpc_out'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='LOGSHIPLINK_ROCHESTER\SQLPROD02_-1692744333'
                    ,@optname='data access'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='LOGSHIPLINK_ROCHESTER\SQLPROD02_-1692744333'
                    ,@optname='use remote collation'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='LOGSHIPLINK_ROCHESTER\SQLPROD02_-1692744333'
                    ,@optname='collation compatible'
                    ,@optvalue='false'
GO
exec sp_serveroption @server='LOGSHIPLINK_ROCHESTER\SQLPROD02_-1692744333'
                    ,@optname='lazy schema validation'
                    ,@optvalue='false'

GO
--SqlScripter----[repl_distributor].sql
GO
exec sp_addlinkedserver @server='repl_distributor'
                       ,@srvproduct='SQL Server'
GO
exec sp_serveroption @server='repl_distributor'
                    ,@optname='rpc'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='repl_distributor'
                    ,@optname='rpc_out'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='repl_distributor'
                    ,@optname='data access'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='repl_distributor'
                    ,@optname='use remote collation'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='repl_distributor'
                    ,@optname='collation compatible'
                    ,@optvalue='false'
GO
exec sp_serveroption @server='repl_distributor'
                    ,@optname='lazy schema validation'
                    ,@optvalue='false'

GO
--SqlScripter----[ROCHESTER_SQLPROD].sql
GO
exec sp_addlinkedserver @server='ROCHESTER\SQLPROD'
                       ,@srvproduct='SQL Server'
GO
exec sp_serveroption @server='ROCHESTER\SQLPROD'
                    ,@optname='rpc'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='ROCHESTER\SQLPROD'
                    ,@optname='rpc_out'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='ROCHESTER\SQLPROD'
                    ,@optname='data access'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='ROCHESTER\SQLPROD'
                    ,@optname='use remote collation'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='ROCHESTER\SQLPROD'
                    ,@optname='collation compatible'
                    ,@optvalue='false'
GO
exec sp_serveroption @server='ROCHESTER\SQLPROD'
                    ,@optname='lazy schema validation'
                    ,@optvalue='false'
