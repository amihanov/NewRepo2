SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_qse]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_qse] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_qse]
@codiServ    varchar(30)
as
  set nocount on;

  with cte as 
  (
    select top(1) codi_dopr, ESTA_PROC, TIME_PROC, CANT_PROC
    from   qse_docu_serv with (rowlock, readpast)
    where  codi_serv = @codiServ
    and    isnull(cant_proc, 0) < 50
    and    (
            (ESTA_PROC = 'ING' and TIME_PROC < getdate())
               OR
            (ESTA_PROC in ('REF', 'PRC') and datediff(minute, TIME_PROC, getdate()) > 10)
           )
    order by codi_empr, tipo_docu, foli_docu 
  )
  update cte
     set esta_proc = 'PRC', time_proc = GETDATE() + (2.0 / (24.0 * 60.0)),
         cant_proc = isnull(cant_proc, 0) + 1
     output inserted.codi_dopr;
GO
