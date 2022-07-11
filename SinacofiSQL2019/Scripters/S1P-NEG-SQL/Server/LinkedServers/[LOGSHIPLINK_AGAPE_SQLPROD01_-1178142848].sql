exec sp_addlinkedserver @server='LOGSHIPLINK_AGAPE\SQLPROD01_-1178142848'
                       ,@srvproduct='SQL Server'
GO
exec sp_serveroption @server='LOGSHIPLINK_AGAPE\SQLPROD01_-1178142848'
                    ,@optname='rpc'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='LOGSHIPLINK_AGAPE\SQLPROD01_-1178142848'
                    ,@optname='rpc_out'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='LOGSHIPLINK_AGAPE\SQLPROD01_-1178142848'
                    ,@optname='data access'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='LOGSHIPLINK_AGAPE\SQLPROD01_-1178142848'
                    ,@optname='use remote collation'
                    ,@optvalue='true'
GO
exec sp_serveroption @server='LOGSHIPLINK_AGAPE\SQLPROD01_-1178142848'
                    ,@optname='collation compatible'
                    ,@optvalue='false'
GO
exec sp_serveroption @server='LOGSHIPLINK_AGAPE\SQLPROD01_-1178142848'
                    ,@optname='lazy schema validation'
                    ,@optvalue='false'
