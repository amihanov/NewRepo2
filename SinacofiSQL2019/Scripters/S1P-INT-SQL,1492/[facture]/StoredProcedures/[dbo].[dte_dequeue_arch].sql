SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_arch]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_arch] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_arch]
@codiServ    varchar(30)
as
  set nocount on;

  with cte as (
    select top(1) codi_arch, esta_arch, tmst_proc_arch, cont_proc_arch
    from   dbq_arch with (rowlock, readpast, index=DBQ_ARCH_PROCESOS)
    where  codi_serv = @codiServ
    and    isnull(cont_proc_arch, 0) <= 50
    and    (
            (esta_arch = 'ING' and tmst_proc_arch < getdate())
               OR
            (esta_arch in ('PRC','ERR') and datediff(minute, tmst_proc_arch, getdate()) > 5)
           )
    order by codi_arch, tmst_regi_arch 
  )
  update cte
     set esta_arch = 'PRC', tmst_proc_arch = GETDATE() + (2.0 / (24.0 * 60.0)),
         cont_proc_arch = isnull(cont_proc_arch, 0) + 1
     output inserted.codi_arch;
GO
