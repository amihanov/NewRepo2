SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_cana]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_cana] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_cana]
@tranCana    varchar(10)
as
  set nocount on;

  with cte as (
    select top(1) codi_cana, ESTA_CANA, TMST_PROC_CANA
    from   dbq_cana with (rowlock, readpast)
    where  TRAN_CANA = @tranCana
    and    (
            (ESTA_CANA = 'IDL' and DATEDIFF(second, TMST_PROC_CANA,getDate()) > 5)
               OR
            (ESTA_CANA = 'BSY' and datediff(minute, TMST_PROC_CANA, getdate()) > 3)
           )
    and    VIGE_CANA = 'S'
    ORDER BY TMST_PROC_CANA ASC
  )
  update cte
     set esta_cana = 'BSY', tmst_proc_cana = GETDATE() + (2.0 / (24.0 * 240.0))
     output inserted.codi_cana;
GO
