SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_ObtieneLoginFailed]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_ObtieneLoginFailed] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_ObtieneLoginFailed]
AS

begin tran
    select isnull(MAX(lo.dtFecha), '20130101') dtFecha, ult.vcInstancia
    into #tmpMaxFecInstancias
    from tblLoginFailed lo
    right join tblLoginFailedUltRegistro ult
    on lo.vcInstancia = ult.vcInstancia
    group by ult.vcInstancia

    select lo.* 
    from tblLoginFailed lo,
         tblLoginFailedUltRegistro ult,
         #tmpMaxFecInstancias maxi
    where lo.dtFecha > ult.dtFecha
      and lo.vcInstancia = ult.vcInstancia
      and lo.dtFecha <= maxi.dtFecha
      and lo.vcInstancia = maxi.vcInstancia
    order by lo.dtFecha

    delete tblLoginFailedUltRegistro
    insert into tblLoginFailedUltRegistro
    select * from #tmpMaxFecInstancias
commit
GO
