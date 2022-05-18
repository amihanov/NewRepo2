SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_recl]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_recl] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_recl]
AS
  set nocount on;

  with cte as (
    select top(1) corr_evnt, esta_evnt, fech_proc_evnt, cont_proc_evnt
    from   dte_proc_evnt with (rowlock, readpast)
    where  (
            (esta_evnt = 'ING' and datediff(minute, fech_proc_evnt, getdate()) > 5)
               OR
            (esta_evnt in ('PRC') and datediff(minute, fech_proc_evnt, getdate()) > 10)
           )
    and    isnull(cont_proc_evnt, 0) <= 50   
    order by corr_evnt, fech_evnt 
  )
  update cte
     set esta_evnt = 'PRC', fech_proc_evnt = GETDATE() + (2.0 / (24.0 * 60.0)),
         cont_proc_evnt = isnull(cont_proc_evnt, 0) + 1
     output inserted.corr_evnt;
GO
