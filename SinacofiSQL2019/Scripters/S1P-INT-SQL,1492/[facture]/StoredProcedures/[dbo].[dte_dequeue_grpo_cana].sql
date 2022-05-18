SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_grpo_cana]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_grpo_cana] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_grpo_cana]
@codiServ    varchar(30),
  @nombCana    varchar(30)
as
  set nocount on;

  update dbq_cana
     set tmst_proc_cana = GETDATE() + (2.0 / (24.0 * 60.0))
  where  nomb_cana = @nombCana;

  with cte as (
    select top(1) codi_grpo, esta_grpo, tmst_proc_grpo, cont_proc_grpo
    from   dbq_grpo with (rowlock, readpast)
    where  codi_serv = @codiServ
    and    nomb_cana = @nombCana
    and    isnull(cont_proc_grpo, 0) <= 50
    and    (
            (esta_grpo = 'ING' and tmst_proc_grpo < getdate())
               OR
            (esta_grpo = 'PRC' and datediff(minute, tmst_proc_grpo, getdate()) > 5)
           )
    order by codi_grpo, tmst_regi_grpo 
  )
  update cte
     set esta_grpo = 'PRC', tmst_proc_grpo = GETDATE() + (2.0 / (24.0 * 60.0)),
         cont_proc_grpo = isnull(cont_proc_grpo, 0) + 1
     output inserted.codi_grpo;
GO
