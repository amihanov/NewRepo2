--USE [msdb]
--GO
--IF  EXISTS (SELECT name FROM msdb.dbo.sysoperators WHERE name = N'Ximena Hormazabal')
--EXEC msdb.dbo.sp_delete_operator @name=N'Ximena Hormazabal'
--GO


--/****** Object:  Operator [Ximena Hormazabal]    Script Date: 11/28/2011 19:43:46 ******/
--EXEC msdb.dbo.sp_add_operator @name=N'Ximena Hormazabal', 
--		@enabled=1, 
--		@weekday_pager_start_time=90000, 
--		@weekday_pager_end_time=180000, 
--		@saturday_pager_start_time=90000, 
--		@saturday_pager_end_time=180000, 
--		@sunday_pager_start_time=90000, 
--		@sunday_pager_end_time=180000, 
--		@pager_days=0, 
--		@email_address=N'Xhormaza@santandersantiago.cl', 
--		@category_name=N'[Uncategorized]'
		
		
