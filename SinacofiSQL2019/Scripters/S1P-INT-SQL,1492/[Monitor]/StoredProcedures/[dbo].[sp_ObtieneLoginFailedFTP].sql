SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sp_ObtieneLoginFailedFTP]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_ObtieneLoginFailedFTP] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_ObtieneLoginFailedFTP]
AS

print ''

set nocount on

    select isnull(MAX(lo.dtFecha), '20130101') dtFecha, ult.vcInstancia
    into #tmpMaxFecInstancias
    from tblLoginFailed lo
    right join tblLoginFailedUltFTP ult
    on lo.vcInstancia = ult.vcInstancia
    group by ult.vcInstancia

    select lo.* 
    from tblLoginFailed lo,
         tblLoginFailedUltFTP ult,
         #tmpMaxFecInstancias maxi
    where lo.dtFecha > ult.dtFecha
      and lo.vcInstancia = ult.vcInstancia
      and lo.dtFecha <= maxi.dtFecha
      and lo.vcInstancia = maxi.vcInstancia
    order by lo.dtFecha

    update tblLoginFailedUltFTP
    set dtFecha = tmp.dtFecha
    from #tmpMaxFecInstancias tmp, tblLoginFailedUltFTP ult
    where tmp.vcInstancia = ult.vcInstancia
GO
