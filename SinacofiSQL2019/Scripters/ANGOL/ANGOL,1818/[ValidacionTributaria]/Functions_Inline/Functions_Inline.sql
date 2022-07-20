
GO
--SqlScripter----[dbo].[balance_acf_sql].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[balance_acf_sql]') IS NULL EXEC('CREATE FUNCTION [dbo].[balance_acf_sql] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [dbo].[balance_acf_sql]
(   @rut INT, 
                                            @empresa INT, 
                                            @plp INT = 0
)

/********************************************************************************************
* Sistema        : Servicio Validaci├│n Tributaria Consulta*
* Descripcion    : 
* Responsable    : Rolando Uribe
* Fecha Creacion : 15/11/2017
* Observaciones  : OTD1107
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 
* 
*********************************************************************************************/

RETURNS TABLE
RETURN
  SELECT TOP 5
    t1.periodo AS per,
    (case when t1.cod_0101 is null then 0 else t1.cod_0101 END) AS caj,
    (case when t1.cod_0784 is null then 0 else t1.cod_0784 END) AS ban,
    (case when t1.cod_0129 is null then 0 else t1.cod_0129 END) AS exi,
    (case when t1.cod_0977 is null then 0 else t1.cod_0977 END) AS cxc,
    (case when t1.cod_0783 is null then 0 else t1.cod_0783 END) AS pre,
    (case when t1.cod_0036 is null then 0 else t1.cod_0036 END + case when t1.cod_0167 is null then 0 else t1.cod_0167 END) AS pro, /*proviciones*/
    (case when t1.cod_0102 is null then 0 else t1.cod_0102 END - case when t1.cod_0647 is null then 0 else t1.cod_0647 END - case when t1.cod_0101 is null then 0 else t1.cod_0101 END - case when t1.cod_0784 is null then 0 else t1.cod_0784 END - case when t1.cod_0129 is null then 0 else t1.cod_0129 END - case when t1.cod_0036 is null then 0 else t1.cod_0036 END - case when t1.cod_0167 is null then 0 else t1.cod_0167 END - case when t1.cod_0977 is null then 0 else t1.cod_0977 END - case when t1.cod_0783 is null then 0 else t1.cod_0783 END) AS oc, /*otros circulante*/
    (case when t1.cod_0102 is null then 0 else t1.cod_0102 END - case when t1.cod_0647 is null then 0 else t1.cod_0647 END) AS tac, /*total activo circulante*/
    (case when t1.cod_0647 is null then 0 else t1.cod_0647 END) AS ai, /*activos inmovilizados*/
    (case when t1.cod_0647 is null then 0 else t1.cod_0647 END) AS taf, /*total activo fijo*/
    (case when t1.cod_0122 is null then 0 else t1.cod_0122 END - case when t1.cod_0102 is null then 0 else t1.cod_0102 END) AS oa, /*otros activos intangibles*/
    (case when t1.cod_0122 is null then 0 else t1.cod_0122 END - case when t1.cod_0102 is null then 0 else t1.cod_0102 END) AS toa,/*total otros activos*/
    (case when t1.cod_0122 is null then 0 else t1.cod_0122 END) AS ta, /*total activos*/
    (case when t1.cod_0102 is null then 0 else t1.cod_0102 END - case when t1.cod_0645 is null then 0 else t1.cod_0645 END + case when t1.cod_0646 is null then 0 else t1.cod_0646 END - case when @plp is null then 0 else @plp END) AS pc, /*pacivos circulantes*/
    (case when t1.cod_0102 is null then 0 else t1.cod_0102 END - case when t1.cod_0645 is null then 0 else t1.cod_0645 END + case when t1.cod_0646 is null then 0 else t1.cod_0646 END - case when @plp is null then 0 else @plp END) AS tpc,
    (case when @plp is null then 0 else @plp END) AS plp, /*pasivos de largo plazo*/
    (case when @plp is null then 0 else @plp END) AS tplp, /*total pasivo largo plazo*/
    (case when t1.cod_0102 is null then 0 else t1.cod_0102 END - case when t1.cod_0645 is null then 0 else t1.cod_0645 END + case when t1.cod_0646 is null then 0 else t1.cod_0646 END) AS tae, /*total pasivo exigible*/
    (case when t1.cod_0844 is null then 0 else t1.cod_0844 END) AS ce, /*capital enterado*/
    (case when t1.cod_0123 is null then 0 else t1.cod_0123 END - case when t1.cod_0102 is null then 0 else t1.cod_0102 END + case when t1.cod_0645 is null then 0 else t1.cod_0645 END - case when t1.cod_0646 is null then 0 else t1.cod_0646 END - case when t1.cod_0844 is null then 0 else t1.cod_0844 END) AS opne,
    (case when t1.cod_0020 is null then 0 else t1.cod_0020 END) AS im,
    (case when t1.cod_0122 is null then 0 else t1.cod_0122 END - case when t1.cod_0123 is null then 0 else t1.cod_0123 END  - case when t1.cod_0020 is null then 0 else t1.cod_0020 END) AS ue, /*Utilidad neta*/
    (case when t1.cod_0122 is null then 0 else t1.cod_0122 END - case when t1.cod_0102 is null then 0 else t1.cod_0102 END + case when t1.cod_0645 is null then 0 else t1.cod_0645 END - case when t1.cod_0646 is null then 0 else t1.cod_0646 END) AS tp,
    (case when t1.cod_0122 is null then 0 else t1.cod_0122 END) AS tpv
    FROM form22 t1, autorizaform a1 where t1.rutContribuyente = @rut AND t1.cod_0007 = a1.folio AND a1.idEmpresa = @empresa AND t1.vigente =1 ORDER BY t1.periodo desc;
GO

GO
--SqlScripter----[dbo].[balance_sql].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[balance_sql]') IS NULL EXEC('CREATE FUNCTION [dbo].[balance_sql] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [dbo].[balance_sql]
(@rut INT, 
                                    @empresa INT, 
                                    @plp INT = 0
)

/********************************************************************************************
* Sistema        : Servicio Validaci├│n Tributaria Consulta*
* Descripcion    : 
* Responsable    : Felipe Poveda
* Fecha Creacion : 03/04/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 07/04/2017 FPE            Actualizaci├│n de funci├│n
* 15/11/2017 RUH            OTD1107 - Varias Actualizaciones
*********************************************************************************************/

RETURNS TABLE
RETURN
  SELECT TOP 5
    t1.periodo AS per,
    (case when t1.cod_0101 is null then 0 else t1.cod_0101 END) AS caj,
    (case when t1.cod_0784 is null then 0 else t1.cod_0784 END) AS ban,
    (case when t1.cod_0129 is null then 0 else t1.cod_0129 END) AS exi,
    (case when t1.cod_0977 is null then 0 else t1.cod_0977 END) AS cxc,
    (case when t1.cod_0783 is null then 0 else t1.cod_0783 END) AS pre, 
    (case when t1.cod_0036 is null then 0 else t1.cod_0036 END + case when t1.cod_0167 is null then 0 else t1.cod_0167 END) AS pro,
    (case when t1.cod_0102 is null then 0 else t1.cod_0102 END - case when t1.cod_0647 is null then 0 else t1.cod_0647 END - case when t1.cod_0101 is null then 0 else t1.cod_0101 END - case when t1.cod_0784 is null then 0 else t1.cod_0784 END - case when t1.cod_0129 is null then 0 else t1.cod_0129 END - case when t1.cod_0036 is null then 0 else t1.cod_0036 END - case when t1.cod_0167 is null then 0 else t1.cod_0167 END - case when t1.cod_0977 is null then 0 else t1.cod_0977 END - case when t1.cod_0783 is null then 0 else t1.cod_0783 END) AS oc,
    (case when t1.cod_0102 is null then 0 else t1.cod_0102 END - case when t1.cod_0647 is null then 0 else t1.cod_0647 END) AS tac,
    (case when t1.cod_0647 is null then 0 else t1.cod_0647 END) AS ai,
    (case when t1.cod_0647 is null then 0 else t1.cod_0647 END) AS taf,
    (case when t1.cod_0122 is null then 0 else t1.cod_0122 END - case when t1.cod_0102 is null then 0 else t1.cod_0102 END) AS oa,
    (case when t1.cod_0122 is null then 0 else t1.cod_0122 END - case when t1.cod_0102 is null then 0 else t1.cod_0102 END) AS toa,
    (case when t1.cod_0122 is null then 0 else t1.cod_0122 END) AS ta,
    (case when t1.cod_0102 is null then 0 else t1.cod_0102 END - case when t1.cod_0645 is null then 0 else t1.cod_0645 END + case when t1.cod_0646 is null then 0 else t1.cod_0646 END - case when @plp is null then 0 else @plp END) AS pc,
    (case when t1.cod_0102 is null then 0 else t1.cod_0102 END - case when t1.cod_0645 is null then 0 else t1.cod_0645 END + case when t1.cod_0646 is null then 0 else t1.cod_0646 END - case when @plp is null then 0 else @plp END) AS tpc,
    (case when @plp is null then 0 else @plp END) AS plp,
    (case when @plp is null then 0 else @plp END) AS tplp,
    (case when t1.cod_0102 is null then 0 else t1.cod_0102 END - case when t1.cod_0645 is null then 0 else t1.cod_0645 END + case when t1.cod_0646 is null then 0 else t1.cod_0646 END) AS tae,
    (case when t1.cod_0844 is null then 0 else t1.cod_0844 END) AS ce,
    (case when t1.cod_0123 is null then 0 else t1.cod_0123 END - case when t1.cod_0102 is null then 0 else t1.cod_0102 END + case when t1.cod_0645 is null then 0 else t1.cod_0645 END - case when t1.cod_0646 is null then 0 else t1.cod_0646 END - case when t1.cod_0844 is null then 0 else t1.cod_0844 END) AS opne,
    (case when t1.cod_0122 is null then 0 else t1.cod_0122 END - case when t1.cod_0123 is null then 0 else t1.cod_0123 END) AS ue,
    (case when t1.cod_0122 is null then 0 else t1.cod_0122 END - case when t1.cod_0102 is null then 0 else t1.cod_0102 END + case when t1.cod_0645 is null then 0 else t1.cod_0645 END - case when t1.cod_0646 is null then 0 else t1.cod_0646 END) AS tp,
    (case when t1.cod_0122 is null then 0 else t1.cod_0122 END) AS tpv
    FROM form22 t1, autorizaform a1 where t1.rutContribuyente = @rut AND t1.cod_0007 = a1.folio AND a1.idEmpresa = @empresa AND t1.vigente =1 ORDER BY t1.periodo desc;
GO

GO
--SqlScripter----[dbo].[eerr1_acf_sql].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[eerr1_acf_sql]') IS NULL EXEC('CREATE FUNCTION [dbo].[eerr1_acf_sql] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [dbo].[eerr1_acf_sql]
(@rut     INT,
                                      @empresa INT)
/********************************************************************************************
* Sistema        : Servicio Validacion Tributaria Consulta* 
* Descripcion    :  
* Responsable    : Felipe Poveda
* Fecha Creacion : 03/04/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 07/04/2017 FPE         Actualizacion de funcion.
* 15/11/2017 RUH         OTD1107 - Actualizaciones varias
* 24/07/2018 OGA         OTD1281 - Actualizacion por cambio de formato F22 del SII
* 20/08/2018 OGA         OTD1281 - Se actualiza formula por incidencias detectadas
*********************************************************************************************/
RETURNS TABLE
AS
    RETURN
      SELECT TOP 5 t1.periodo             AS per,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE ( ISNULL(t1.cod_0628, 0)
                              + ISNULL(t1.cod_0851, 0) )
                     END )                AS ven,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE ( ISNULL(t1.cod_0630, 0)
                              + ISNULL(t1.cod_0853, 0) )
                     END )                AS cd,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE( ISNULL(t1.cod_0927, 0) )
                     END )                AS dep,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE( ISNULL(t1.cod_0628, 0)
                             + ISNULL(t1.cod_0851, 0) - ( ISNULL(t1.cod_0630, 0)
                                                          + ISNULL(t1.cod_0853, 0) ) - ( ISNULL(t1.cod_0927, 0) ) )
                     END )                AS mb,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE( ISNULL(t1.cod_0631, 0) )
                     END )                AS re,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE( ISNULL(t1.cod_0635, 0)
                             + ISNULL(t1.cod_0941, 0)
                             + ISNULL(t1.cod_0968, 0)
                             + ISNULL(t1.cod_0969, 0) )
                     END )                AS og,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE( ISNULL(t1.cod_0628, 0)
                             + ISNULL(t1.cod_0851, 0) - ( ISNULL(t1.cod_0630, 0)
                                                          + ISNULL(t1.cod_0853, 0) ) - ISNULL(t1.cod_0927, 0) - ISNULL(t1.cod_0631, 0) - ( ISNULL(t1.cod_0635, 0)
                                                                                                                                           + ISNULL(t1.cod_0941, 0)
                                                                                                                                           + ISNULL(t1.cod_0968, 0)
                                                                                                                                           + ISNULL(t1.cod_0969, 0) ) )
                     END )                AS mo,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE ( ISNULL(t1.cod_0629, 0) )
                     END )                AS ipe,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE ( ISNULL(t1.cod_0651, 0) )
                     END )                AS oi,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE ( ISNULL(t1.cod_0633, 0)
                              + ISNULL(t1.cod_0967, 0) )
                     END )                AS ipa,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE ( ISNULL(t1.cod_0852, 0)
                              + ISNULL(t1.cod_0897, 0) )
                     END )                AS gi,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE ( ISNULL(t1.cod_0966, 0) )
                     END )                AS don,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE ( ISNULL(t1.cod_0637, 0) - ISNULL(t1.cod_0638, 0) )
                     END )                AS co,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE ( ISNULL(t1.cod_0122, 0) - ISNULL(t1.cod_0123, 0) - ( ISNULL(t1.cod_0628, 0)
                                                                                  + ISNULL(t1.cod_0851, 0) - ( ISNULL(t1.cod_0630, 0)
                                                                                                               + ISNULL(t1.cod_0853, 0) ) - ( ISNULL(t1.cod_0927, 0) ) - ISNULL(t1.cod_0631, 0) - ( ISNULL(t1.cod_0635, 0)
                                                                                                                                                                                                    + ISNULL(t1.cod_0941, 0)
                                                                                                                                                                                                    + ISNULL(t1.cod_0968, 0)
                                                                                                                                                                                                    + ISNULL(t1.cod_0969, 0) ) + ISNULL(t1.cod_0629, 0) + ISNULL(t1.cod_0651, 0) - ( ISNULL(t1.cod_0633, 0)
                                                                                                                                                                                                                                                                                     + ISNULL(t1.cod_0967, 0) ) - ( ISNULL(t1.cod_0852, 0)
                                                                                                                                                                                                                                                                                                                    + ISNULL(t1.cod_0897, 0) ) - ( ISNULL(t1.cod_0966, 0) ) - ( ISNULL(t1.cod_0637, 0) - ISNULL(t1.cod_0638, 0) ) ) )
                     END )                AS dt,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( ISNULL(t1.cod_0122, 0) - ISNULL(t1.cod_0123, 0) )
                       ELSE ( ISNULL(t1.cod_0628, 0)
                              + ISNULL(t1.cod_0851, 0) - ( ISNULL(t1.cod_0630, 0)
                                                           + ISNULL(t1.cod_0853, 0) ) - ( ISNULL(t1.cod_0927, 0) ) - ISNULL(t1.cod_0631, 0) - ( ISNULL(t1.cod_0635, 0)
                                                                                                                                                + ISNULL(t1.cod_0941, 0)
                                                                                                                                                + ISNULL(t1.cod_0968, 0)
                                                                                                                                                + ISNULL(t1.cod_0969, 0) ) + ISNULL(t1.cod_0629, 0) + ISNULL(t1.cod_0651, 0) - ( ISNULL(t1.cod_0633, 0)
                                                                                                                                                                                                                                 + ISNULL(t1.cod_0967, 0) ) - ( ISNULL(t1.cod_0852, 0)
                                                                                                                                                                                                                                                                + ISNULL(t1.cod_0897, 0) ) - ( ISNULL(t1.cod_0966, 0) ) - ( ISNULL(t1.cod_0637, 0) - ISNULL(t1.cod_0638, 0) ) + ( ISNULL(t1.cod_0122, 0) - ISNULL(t1.cod_0123, 0) - ( ISNULL(t1.cod_0628, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                      + ISNULL(t1.cod_0851, 0) - ( ISNULL(t1.cod_0630, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                   + ISNULL(t1.cod_0853, 0) ) - ( ISNULL(t1.cod_0927, 0) ) - ( ISNULL(t1.cod_0631, 0) ) - ( ISNULL(t1.cod_0635, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            + ISNULL(t1.cod_0941, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            + ISNULL(t1.cod_0968, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            + ISNULL(t1.cod_0969, 0) ) + ISNULL(t1.cod_0629, 0) + ISNULL(t1.cod_0651, 0) - ( ISNULL(t1.cod_0633, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             + ISNULL(t1.cod_0967, 0) ) - ( ISNULL(t1.cod_0852, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            + ISNULL(t1.cod_0897, 0) ) - ( ISNULL(t1.cod_0966, 0) ) - ( ISNULL(t1.cod_0637, 0) - ISNULL(t1.cod_0638, 0) ) ) ) )
                     END )                AS ut,
                   ISNULL(t1.cod_0020, 0) AS ir,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( ( ISNULL(t1.cod_0122, 0) - ISNULL(t1.cod_0123, 0) ) - ISNULL(t1.cod_0020, 0) )
                       ELSE ( ISNULL(t1.cod_0628, 0)
                              + ISNULL(t1.cod_0851, 0) - ( ISNULL(t1.cod_0630, 0)
                                                           + ISNULL(t1.cod_0853, 0) ) - ( ISNULL(t1.cod_0927, 0) ) - ISNULL(t1.cod_0631, 0) - ( ISNULL(t1.cod_0635, 0)
                                                                                                                                                + ISNULL(t1.cod_0941, 0)
                                                                                                                                                + ISNULL(t1.cod_0968, 0)
                                                                                                                                                + ISNULL(t1.cod_0969, 0) ) + ISNULL(t1.cod_0629, 0) + ISNULL(t1.cod_0651, 0) - ( ISNULL(t1.cod_0633, 0)
                                                                                                                                                                                                                                 + ISNULL(t1.cod_0967, 0) ) - ( ISNULL(t1.cod_0852, 0)
                                                                                                                                                                                                                                                                + ISNULL(t1.cod_0897, 0) ) - ( ISNULL(t1.cod_0966, 0) ) - ( ISNULL(t1.cod_0637, 0) - ISNULL(t1.cod_0638, 0) ) + ( ISNULL(t1.cod_0122, 0) - ISNULL(t1.cod_0123, 0) - ( ISNULL(t1.cod_0628, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                      + ISNULL(t1.cod_0851, 0) - ( ISNULL(t1.cod_0630, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                   + ISNULL(t1.cod_0853, 0) ) - ( ISNULL(t1.cod_0927, 0) ) - ( ISNULL(t1.cod_0631, 0) ) - ( ISNULL(t1.cod_0635, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            + ISNULL(t1.cod_0941, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            + ISNULL(t1.cod_0968, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            + ISNULL(t1.cod_0969, 0) ) + ISNULL(t1.cod_0629, 0) + ISNULL(t1.cod_0651, 0) - ( ISNULL(t1.cod_0633, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             + ISNULL(t1.cod_0967, 0) ) - ( ISNULL(t1.cod_0852, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            + ISNULL(t1.cod_0897, 0) ) - ( ISNULL(t1.cod_0966, 0) ) - ( ISNULL(t1.cod_0637, 0) - ISNULL(t1.cod_0638, 0) ) ) ) - ISNULL(t1.cod_0020, 0) )
                     END )                AS un,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( 0 )
                       ELSE ( ISNULL(t1.cod_0628, 0)
                              + ISNULL(t1.cod_0851, 0) - ( ISNULL(t1.cod_0630, 0)
                                                           + ISNULL(t1.cod_0853, 0) ) - ( ISNULL(t1.cod_0927, 0) ) - ISNULL(t1.cod_0631, 0) - ( ISNULL(t1.cod_0635, 0)
                                                                                                                                                + ISNULL(t1.cod_0941, 0)
                                                                                                                                                + ISNULL(t1.cod_0968, 0)
                                                                                                                                                + ISNULL(t1.cod_0969, 0) ) + ISNULL(t1.cod_0629, 0) + ISNULL(t1.cod_0651, 0) - ( ISNULL(t1.cod_0633, 0)
                                                                                                                                                                                                                                 + ISNULL(t1.cod_0967, 0) ) - ( ISNULL(t1.cod_0852, 0)
                                                                                                                                                                                                                                                                + ISNULL(t1.cod_0897, 0) ) - ( ISNULL(t1.cod_0966, 0) ) - ( ISNULL(t1.cod_0637, 0) - ISNULL(t1.cod_0638, 0) ) + ( ISNULL(t1.cod_0122, 0) - ISNULL(t1.cod_0123, 0) - ( ISNULL(t1.cod_0628, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                      + ISNULL(t1.cod_0851, 0) - ( ISNULL(t1.cod_0630, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                   + ISNULL(t1.cod_0853, 0) ) - ( ISNULL(t1.cod_0927, 0) ) - ( ISNULL(t1.cod_0631, 0) ) - ( ISNULL(t1.cod_0635, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            + ISNULL(t1.cod_0941, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            + ISNULL(t1.cod_0968, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            + ISNULL(t1.cod_0969, 0) ) + ISNULL(t1.cod_0629, 0) + ISNULL(t1.cod_0651, 0) - ( ISNULL(t1.cod_0633, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             + ISNULL(t1.cod_0967, 0) ) - ( ISNULL(t1.cod_0852, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            + ISNULL(t1.cod_0897, 0) ) - ( ISNULL(t1.cod_0966, 0) ) - ( ISNULL(t1.cod_0637, 0) - ISNULL(t1.cod_0638, 0) ) ) ) - ISNULL(t1.cod_0020, 0) + ISNULL(t1.cod_0927, 0) + ( ISNULL(t1.cod_0637, 0) - ISNULL(t1.cod_0638, 0) ) )
                     END )                AS goc,
                   t1.cod_0315            AS fec
      FROM   form22 t1,
             autorizaform a1
      WHERE  t1.rutContribuyente = @rut
             AND t1.vigente = '1'
             AND t1.cod_0007 = a1.folio
             AND a1.idEmpresa = @empresa
      ORDER  BY t1.periodo DESC
GO

GO
--SqlScripter----[dbo].[eerr1_def_sql].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[eerr1_def_sql]') IS NULL EXEC('CREATE FUNCTION [dbo].[eerr1_def_sql] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [dbo].[eerr1_def_sql]
(   @rut INT, 
                                            @empresa INT
)

/********************************************************************************************
* Sistema        : Servicio Validaci├│n Tributaria Consulta*
* Descripcion    : 
* Responsable    : Rolando Uribe
* Fecha Creacion : 15/11/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 24/07/2018 OGA         OTD1281 - Actualizacion por cambio de formato F22 del SII
* 20/08/2018 OGA         OTD1281 - Se actualiza formula por incidencias detectadas
*********************************************************************************************/

RETURNS TABLE
AS
RETURN
select top 5 
    t1.periodo AS per,
    ISNULL(t1.cod_0628,0)+ISNULL(t1.cod_0851,0) AS ven,
    ISNULL(t1.cod_0630,0)+ISNULL(t1.cod_0853,0) AS cd,
    ISNULL(t1.cod_0927,0) AS dep,
    ISNULL(t1.cod_0628,0)+ISNULL(t1.cod_0851,0)-(ISNULL(t1.cod_0630,0)+ISNULL(t1.cod_0853,0))-(ISNULL(t1.cod_0927,0)) AS mb,
    ISNULL(t1.cod_0631,0) AS re,  
    ISNULL(t1.cod_0635,0) + ISNULL(t1.cod_0941,0)+ISNULL(t1.cod_0968,0)+ISNULL(t1.cod_0969,0) AS og,
    ISNULL(t1.cod_0628,0)+ISNULL(t1.cod_0851,0)-(ISNULL(t1.cod_0630,0)+ISNULL(t1.cod_0853,0))-ISNULL(t1.cod_0927,0)- ISNULL(t1.cod_0631,0) - (ISNULL(t1.cod_0635,0) + ISNULL(t1.cod_0941,0)+ISNULL(t1.cod_0968,0)+ISNULL(t1.cod_0969,0)) AS mo,
    ISNULL(t1.cod_0629,0) AS ipe,
    ISNULL(t1.cod_0651,0) AS oi,
    ISNULL(t1.cod_0633,0) + ISNULL(t1.cod_0967,0)  AS ipa,
    ISNULL(t1.cod_0852,0) + ISNULL(t1.cod_0897,0) AS gi,
	ISNULL(t1.cod_0966,0) AS don,
	ISNULL(t1.cod_0637,0) - ISNULL(t1.cod_0638,0) AS co,
	(CASE WHEN t1.periodo>=2018 THEN (case when (t1.cod_0963 + t1.cod_1037 + t1.cod_0187) >0 then (ISNULL(t1.cod_0963,0) + ISNULL(t1.cod_1037,0) + ISNULL(t1.cod_0187,0)) else (ISNULL(t1.cod_0122,0)-ISNULL(t1.cod_0123,0)) END) ELSE (ISNULL(t1.cod_0628,0)+ISNULL(t1.cod_0851,0)-(ISNULL(t1.cod_0630,0)+ISNULL(t1.cod_0853,0))-ISNULL(t1.cod_0927,0)- ISNULL(t1.cod_0631,0) - (ISNULL(t1.cod_0635,0) + ISNULL(t1.cod_0941,0)+ISNULL(t1.cod_0968,0)+ISNULL(t1.cod_0969,0))+ (ISNULL(t1.cod_0629,0)) + (ISNULL(t1.cod_0651,0)) -(ISNULL(t1.cod_0633,0) + ISNULL(t1.cod_0967,0) ) -(ISNULL(t1.cod_0852,0) + ISNULL(t1.cod_0897,0)) -(ISNULL(t1.cod_0966,0)) -(ISNULL(t1.cod_0637,0) - ISNULL(t1.cod_0638,0)) ) END) AS ut,
    (CASE WHEN t1.periodo>=2018 THEN (ISNULL(t1.cod_0020,0) + ISNULL(t1.cod_0965,0) + ISNULL(t1.cod_1039,0) + ISNULL(t1.cod_0189,0)) ELSE ISNULL(t1.cod_0020,0) END) AS ir,
    (CASE WHEN t1.periodo>=2018 THEN ((case when (t1.cod_0963 + t1.cod_1037 + t1.cod_0187) >0 then (ISNULL(t1.cod_0963,0) + ISNULL(t1.cod_1037,0) + ISNULL(t1.cod_0187,0)) else (ISNULL(t1.cod_0122,0)-ISNULL(t1.cod_0123,0)) END) -(ISNULL(t1.cod_0020,0) + ISNULL(t1.cod_0965,0) + ISNULL(t1.cod_1039,0) + ISNULL(t1.cod_0189,0))) ELSE (ISNULL(t1.cod_0628,0)+ISNULL(t1.cod_0851,0)-(ISNULL(t1.cod_0630,0)+ISNULL(t1.cod_0853,0))-(ISNULL(t1.cod_0927,0)) - ISNULL(t1.cod_0631,0) - (ISNULL(t1.cod_0635,0) + ISNULL(t1.cod_0941,0)+ISNULL(t1.cod_0968,0)+ISNULL(t1.cod_0969,0)) + ISNULL(t1.cod_0629,0) + ISNULL(t1.cod_0651,0) - (ISNULL(t1.cod_0633,0) + ISNULL(t1.cod_0967,0)) - (ISNULL(t1.cod_0852,0) + ISNULL(t1.cod_0897,0)) - (ISNULL(t1.cod_0966,0)) - (ISNULL(t1.cod_0637,0) - ISNULL(t1.cod_0638,0))  - ISNULL(t1.cod_0020,0))END) AS un,
	(CASE WHEN t1.periodo>=2018 THEN (0) ELSE (ISNULL(t1.cod_0628,0)+ISNULL(t1.cod_0851,0)-(ISNULL(t1.cod_0630,0)+ISNULL(t1.cod_0853,0))-(ISNULL(t1.cod_0927,0)) - ISNULL(t1.cod_0631,0) - (ISNULL(t1.cod_0635,0) + ISNULL(t1.cod_0941,0)+ISNULL(t1.cod_0968,0)+ISNULL(t1.cod_0969,0)) + ISNULL(t1.cod_0629,0) + ISNULL(t1.cod_0651,0) - (ISNULL(t1.cod_0633,0) + ISNULL(t1.cod_0967,0)) - (ISNULL(t1.cod_0852,0) + ISNULL(t1.cod_0897,0)) - (ISNULL(t1.cod_0966,0)) - (ISNULL(t1.cod_0637,0) - ISNULL(t1.cod_0638,0))  - ISNULL(t1.cod_0020,0)+ ISNULL(t1.cod_0927,0) + (ISNULL(t1.cod_0637,0) - ISNULL(t1.cod_0638,0)))END)  AS goc,
    t1.cod_0315 AS fec
    FROM form22 t1, autorizaform a1 WHERE t1.rutContribuyente = @rut AND t1.vigente = '1' AND t1.cod_0007 = a1.folio AND a1.idEmpresa = @empresa ORDER BY t1.periodo DESC
GO

GO
--SqlScripter----[dbo].[eerr1_sql].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[eerr1_sql]') IS NULL EXEC('CREATE FUNCTION [dbo].[eerr1_sql] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [dbo].[eerr1_sql]
(@rut     INT,
                                  @empresa INT)
/********************************************************************************************
* Sistema        : Servicio Validacion Tributaria Consulta* 
* Descripcion    :  
* Responsable    : Felipe Poveda
* Fecha Creacion : 03/04/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 07/04/2017 FPE           Actualizaci├│n de funci├│n.
* 24/07/2018 OGA           OTD1281 - Actualizacion por cambio de formato F22 del SII
* 20/08/2018 OGA           OTD1281 - Se actualiza formula por incidencias detectadas
*********************************************************************************************/
RETURNS TABLE
AS
    RETURN
      SELECT TOP 5 t1.periodo  AS per,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN 0
                       ELSE ( CASE
                                WHEN t1.cod_0628 IS NULL THEN 0
                                ELSE t1.cod_0628
                              END )
                     END )     AS ing,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN 0
                       ELSE ( CASE
                                WHEN t1.cod_0630 IS NULL THEN 0
                                ELSE ( 0 - t1.cod_0630 )
                              END )
                     END )     AS cd,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN 0
                       ELSE ( CASE
                                WHEN t1.cod_0628 IS NULL THEN 0
                                ELSE t1.cod_0628
                              END ) + ( CASE
                                          WHEN t1.cod_0630 IS NULL THEN 0
                                          ELSE ( 0 - t1.cod_0630 )
                                        END )
                     END )     AS mb,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN 0
                       ELSE ( CASE WHEN t1.cod_0629 IS NULL THEN 0 ELSE t1.cod_0629 END + CASE WHEN t1.cod_0651 IS NULL THEN 0 ELSE t1.cod_0651 END )
                     END )     AS oi,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN 0
                       ELSE ( 0 - CASE
                                    WHEN t1.cod_0631 IS NULL THEN 0
                                    ELSE t1.cod_0631
                                  END - CASE
                                          WHEN t1.cod_0632 IS NULL THEN 0
                                          ELSE t1.cod_0632
                                        END )
                     END )     AS ci,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN 0
                       ELSE ( ( CASE
                                  WHEN t1.cod_0628 IS NULL THEN 0
                                  ELSE t1.cod_0628
                                END - CASE
                                        WHEN t1.cod_0630 IS NULL THEN 0
                                        ELSE t1.cod_0630
                                      END ) + ( CASE WHEN t1.cod_0629 IS NULL THEN 0 ELSE t1.cod_0629 END + CASE WHEN t1.cod_0651 IS NULL THEN 0 ELSE t1.cod_0651 END ) + 0 - CASE
                                                                                                                                                                                WHEN t1.cod_0631 IS NULL THEN 0
                                                                                                                                                                                ELSE t1.cod_0631
                                                                                                                                                                              END - CASE
                                                                                                                                                                                      WHEN t1.cod_0632 IS NULL THEN 0
                                                                                                                                                                                      ELSE t1.cod_0632
                                                                                                                                                                                    END )
                     END )     AS mo,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN 0
                       ELSE ( CASE
                                WHEN t1.cod_0633 IS NULL THEN 0
                                ELSE 0 - t1.cod_0633
                              END )
                     END )     AS gf,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN 0
                       ELSE ( 0 - CASE
                                    WHEN t1.cod_0635 IS NULL THEN 0
                                    ELSE t1.cod_0635
                                  END - CASE
                                          WHEN t1.cod_0637 IS NULL THEN 0
                                          ELSE t1.cod_0637
                                        END + CASE
                                                WHEN t1.cod_0638 IS NULL THEN 0
                                                ELSE t1.cod_0638
                                              END + CASE
                                                      WHEN t1.cod_0639 IS NULL THEN 0
                                                      ELSE t1.cod_0639
                                                    END )
                     END )     AS og,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( CASE
                                                        WHEN ( t1.cod_0963 + t1.cod_1037 + t1.cod_0187 ) > 0 THEN ( ISNULL(t1.cod_0963, 0)
                                                                                                                    + ISNULL(t1.cod_1037, 0)
                                                                                                                    + ISNULL(t1.cod_0187, 0) )
                                                        ELSE ( ISNULL(t1.cod_0122, 0) - ISNULL(t1.cod_0123, 0) )
                                                      END )
                       ELSE ( ( CASE
                                  WHEN t1.cod_0628 IS NULL THEN 0
                                  ELSE t1.cod_0628
                                END - CASE
                                        WHEN t1.cod_0630 IS NULL THEN 0
                                        ELSE t1.cod_0630
                                      END + CASE
                                              WHEN t1.cod_0629 IS NULL THEN 0
                                              ELSE t1.cod_0629
                                            END + CASE
                                                    WHEN t1.cod_0651 IS NULL THEN 0
                                                    ELSE t1.cod_0651
                                                  END - CASE
                                                          WHEN t1.cod_0640 IS NULL THEN 0
                                                          ELSE t1.cod_0640
                                                        END - CASE
                                                                WHEN t1.cod_0641 IS NULL THEN 0
                                                                ELSE t1.cod_0641
                                                              END - CASE
                                                                      WHEN t1.cod_0642 IS NULL THEN 0
                                                                      ELSE t1.cod_0642
                                                                    END + 0 - CASE
                                                                                WHEN t1.cod_0631 IS NULL THEN 0
                                                                                ELSE t1.cod_0631
                                                                              END - CASE
                                                                                      WHEN t1.cod_0632 IS NULL THEN 0
                                                                                      ELSE t1.cod_0632
                                                                                    END ) + ( CASE
                                                                                                WHEN t1.cod_0633 IS NULL THEN 0
                                                                                                ELSE 0 - t1.cod_0633
                                                                                              END ) + ( 0 - CASE
                                                                                                              WHEN t1.cod_0635 IS NULL THEN 0
                                                                                                              ELSE t1.cod_0635
                                                                                                            END - CASE
                                                                                                                    WHEN t1.cod_0637 IS NULL THEN 0
                                                                                                                    ELSE t1.cod_0637
                                                                                                                  END + CASE
                                                                                                                          WHEN t1.cod_0638 IS NULL THEN 0
                                                                                                                          ELSE t1.cod_0638
                                                                                                                        END + CASE
                                                                                                                                WHEN t1.cod_0639 IS NULL THEN 0
                                                                                                                                ELSE t1.cod_0639
                                                                                                                              END ) )
                     END )     AS re,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN 0
                       ELSE ( CASE
                                WHEN t1.cod_0634 IS NULL THEN 0
                                ELSE 0 - t1.cod_0634
                              END )
                     END )     AS pea,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN 0
                       ELSE ( CASE
                                WHEN t1.cod_0628 IS NULL THEN 0
                                ELSE t1.cod_0628
                              END - CASE
                                      WHEN t1.cod_0630 IS NULL THEN 0
                                      ELSE t1.cod_0630
                                    END + CASE
                                            WHEN t1.cod_0629 IS NULL THEN 0
                                            ELSE t1.cod_0629
                                          END + CASE
                                                  WHEN t1.cod_0651 IS NULL THEN 0
                                                  ELSE t1.cod_0651
                                                END - CASE
                                                        WHEN t1.cod_0640 IS NULL THEN 0
                                                        ELSE t1.cod_0640
                                                      END - CASE
                                                              WHEN t1.cod_0641 IS NULL THEN 0
                                                              ELSE t1.cod_0641
                                                            END - CASE
                                                                    WHEN t1.cod_0642 IS NULL THEN 0
                                                                    ELSE t1.cod_0642
                                                                  END + 0 - CASE
                                                                              WHEN t1.cod_0631 IS NULL THEN 0
                                                                              ELSE t1.cod_0631
                                                                            END - CASE
                                                                                    WHEN t1.cod_0632 IS NULL THEN 0
                                                                                    ELSE t1.cod_0632
                                                                                  END ) + ( CASE
                                                                                              WHEN t1.cod_0633 IS NULL THEN 0
                                                                                              ELSE 0 - t1.cod_0633
                                                                                            END ) + ( 0 - CASE
                                                                                                            WHEN t1.cod_0635 IS NULL THEN 0
                                                                                                            ELSE t1.cod_0635
                                                                                                          END - CASE
                                                                                                                  WHEN t1.cod_0637 IS NULL THEN 0
                                                                                                                  ELSE t1.cod_0637
                                                                                                                END + CASE
                                                                                                                        WHEN t1.cod_0638 IS NULL THEN 0
                                                                                                                        ELSE t1.cod_0638
                                                                                                                      END + CASE
                                                                                                                              WHEN t1.cod_0639 IS NULL THEN 0
                                                                                                                              ELSE t1.cod_0639
                                                                                                                            END ) + ( CASE
                                                                                                                                        WHEN t1.cod_0634 IS NULL THEN 0
                                                                                                                                        ELSE 0 - t1.cod_0634
                                                                                                                                      END )
                     END )     AS ra,
                   t1.cod_0315 AS fec
      FROM   form22 t1,
             autorizaform a1
      WHERE  t1.rutContribuyente = @rut
             AND t1.vigente = '1'
             AND t1.cod_0007 = a1.folio
             AND a1.idEmpresa = @empresa
      ORDER  BY t1.periodo DESC;
GO

GO
--SqlScripter----[dbo].[eerr2_sql].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[eerr2_sql]') IS NULL EXEC('CREATE FUNCTION [dbo].[eerr2_sql] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [dbo].[eerr2_sql]
(@rut INT, 
                                   @empresa INT
)

/********************************************************************************************
* Sistema        : Servicio Validaci├│n Tributaria Consulta* 
* Descripcion    :  
* Responsable    : Felipe Poveda
* Fecha Creacion : 03/04/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 07/04/2017 FPE           Actualizaci├│n de funci├│n.
* 24/11/2018 OGA           OTD1281 - Actualizacion por cambio de formato F22 del SII
*********************************************************************************************/

RETURNS TABLE
RETURN
  SELECT TOP 5
    t1.periodo AS per,
    (case when t1.cod_0461 is null then 0 else t1.cod_0461 END) + (case when t1.cod_0545 is null then 0 else t1.cod_0545 END) AS hon,
    (0 - case when t1.cod_0465 is null then 0 else t1.cod_0465 END) - (case when t1.cod_0494 is null then 0 else t1.cod_0494 END) AS gep,
    (case when t1.cod_0461 is null then 0 else t1.cod_0461 END) + (case when t1.cod_0545 is null then 0 else t1.cod_0545 END + 0 - case when t1.cod_0465 is null then 0 else t1.cod_0465 END) - (case when t1.cod_0494 is null then 0 else t1.cod_0494 END) AS mb,
    (case when t1.cod_0617 is null then 0 else t1.cod_0617 END) AS rsp,
    (case when t1.cod_0104 is null then 0 else t1.cod_0104 END + case when t1.cod_0105 is null then 0 else t1.cod_0105 END + case when t1.cod_0109 is null then 0 else t1.cod_0109 END + case when t1.cod_0155 is null then 0 else t1.cod_0155 END + case when t1.cod_0152 is null then 0 else t1.cod_0152 END + case when t1.cod_0161 is null then 0 else t1.cod_0161 END) AS spo,
     (case when t1.cod_0461 is null then 0 else t1.cod_0461 END) + (case when t1.cod_0545 is null then 0 else t1.cod_0545 END + 0 - case when t1.cod_0465 is null then 0 else t1.cod_0465 END) - (case when t1.cod_0494 is null then 0 else t1.cod_0494 END) + (case when t1.cod_0617 is null then 0 else t1.cod_0617 END) + (case when t1.cod_0104 is null then 0 else t1.cod_0104 END + case when t1.cod_0105 is null then 0 else t1.cod_0105 END + case when t1.cod_0109 is null then 0 else t1.cod_0109 END + case when t1.cod_0155 is null then 0 else t1.cod_0155 END + case when t1.cod_0152 is null then 0 else t1.cod_0152 END + case when t1.cod_0161 is null then 0 else t1.cod_0161 END) AS mo,
    (0 - case when t1.cod_0770 is null then 0 else t1.cod_0770 END) AS apv,
    (0 - case when t1.cod_0872 is null then 0 else t1.cod_0872 END) AS don,
    (case when t1.cod_0461 is null then 0 else t1.cod_0461 END) + (case when t1.cod_0545 is null then 0 else t1.cod_0545 END + 0 - case when t1.cod_0465 is null then 0 else t1.cod_0465 END) - (case when t1.cod_0494 is null then 0 else t1.cod_0494 END) + (case when t1.cod_0617 is null then 0 else t1.cod_0617 END + case when t1.cod_0104 is null then 0 else t1.cod_0104 END) + (case when t1.cod_0105 is null then 0 else t1.cod_0105 END + case when t1.cod_0109 is null then 0 else t1.cod_0109 END + case when t1.cod_0155 is null then 0 else t1.cod_0155 END + case when t1.cod_0152 is null then 0 else t1.cod_0152 END + case when t1.cod_0161 is null then 0 else t1.cod_0161 END + 0 - case when t1.cod_0770 is null then 0 else t1.cod_0770 END + 0 - case when t1.cod_0872 is null then 0 else t1.cod_0872 END) AS re,
    t1.cod_0315 AS fec
    FROM form22 t1, autorizaform a1 
    WHERE t1.rutContribuyente = @rut AND t1.vigente = '1' AND t1.cod_0007 = a1.folio AND a1.idEmpresa = @empresa ORDER BY t1.periodo desc;
GO

GO
--SqlScripter----[dbo].[ratios_sql].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ratios_sql]') IS NULL EXEC('CREATE FUNCTION [dbo].[ratios_sql] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [dbo].[ratios_sql]
(@rut INT, 
                                    @empresa INT
)

/********************************************************************************************
* Sistema        : Servicio Validaci├│n Tributaria Consulta* 
* Descripcion    :  
* Responsable    : Felipe Poveda
* Fecha Creacion : 03/04/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 07/04/2017 FPE           Actualizaci├│n de funci├│n.
* 16/11/2017 RUH           OTD1107
*********************************************************************************************/
 
RETURNS TABLE
RETURN
  SELECT TOP 5
    t1.periodo AS per,
    (CASE WHEN t1.cod_0102 is null AND t1.cod_0645 is NULL THEN 0 ELSE
     dbo.redonsor(CAST(ISNULL(t1.cod_0102,0)- ISNULL(t1.cod_0647,0) AS float)/dbo.ISZERO (CAST(ISNULL(t1.cod_0102,0) - ISNULL(t1.cod_0645,0)
                  + ISNULL(t1.cod_0646,0) AS float), 1)) END) AS liq,
          
    (CASE WHEN t1.cod_0102 is null AND t1.cod_0645 is NULL THEN 0 ELSE
     dbo.redonsor(CAST(case when t1.cod_0102 is null then 0 else t1.cod_0102 END - case when t1.cod_0647 is null then 0
       else t1.cod_0647 END - case when t1.cod_0129 is null then 0 else t1.cod_0129 END AS float) / CAST(case when t1.cod_0102 is null then 0
        else t1.cod_0102 END - case when t1.cod_0645 is null then 0 else t1.cod_0645 END + case when t1.cod_0646 is null then 0 else t1.cod_0646 END AS float) ) END) AS pa,
         
    (CASE WHEN t1.cod_0645 is NULL THEN 0 ELSE
      dbo.redonsor(CAST(case when t1.cod_0102 is null then 0
        else t1.cod_0102 END - case when t1.cod_0645 is null then 0 else t1.cod_0645 END + case when t1.cod_0646 is null then 0 else t1.cod_0646 END AS float)/ CAST(case when t1.cod_0645 is null then 0
        else t1.cod_0645 END AS float) ) END) AS en
     
    FROM form22 t1, autorizaform a1 where t1.rutContribuyente = @rut AND t1.cod_0007 = a1.folio AND a1.idEmpresa = @empresa ORDER BY periodo desc
GO

GO
--SqlScripter----[dbo].[rgc_sql].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rgc_sql]') IS NULL EXEC('CREATE FUNCTION [dbo].[rgc_sql] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [dbo].[rgc_sql]
(@rut     INT,
                                @empresa INT)
/********************************************************************************************
* Sistema        : Servicio Validacion Tributaria Consulta* 
* Descripcion    :  
* Responsable    : Felipe Poveda
* Fecha Creacion : 03/04/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 07/04/2017 FPE         Actualizacion de funcion.
* 24/07/2018 OGA         OTD1281 - Actualizacion por cambio de formato F22 del SII
* 20/08/2018 OGA         OTD1281 - Se actualiza formula por incidencias detectadas
* 22/08/2018 OGA         OTD1281 - Se actualiza formula. El tercer CASE indicaba campo t1.cod_0461
*                                  debia ser t1.cod_0161
*********************************************************************************************/
RETURNS TABLE
AS
    RETURN
      SELECT TOP 5 t1.periodo        AS per,
                   ( CASE
                       WHEN t1.cod_0161 IS NULL THEN 0
                       ELSE t1.cod_0161
                     END )           AS spe,
                   ( CASE
                       WHEN t1.cod_0162 IS NULL THEN 0
                       ELSE t1.cod_0162
                     END )           AS csc,
                   ( CASE
                       WHEN t1.cod_0161 IS NULL THEN 0
                       ELSE t1.cod_0161
                     END ) + ( CASE
                                 WHEN t1.cod_0162 IS NULL THEN 0
                                 ELSE t1.cod_0162
                               END ) AS trf,
                   ( CASE
                       WHEN t1.cod_0110 IS NULL THEN 0
                       ELSE t1.cod_0110
                     END )           AS hrd,
                   ( CASE
                       WHEN t1.cod_0104 IS NULL THEN 0
                       ELSE t1.cod_0104
                     END )           AS ret,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( ISNULL(t1.cod_0105, 0)
                                                      + ISNULL(t1.cod_1029, 0)
                                                      + ISNULL(t1.cod_0959, 0)
                                                      + ISNULL(t1.cod_0108, 0) )
                       ELSE ( ISNULL(t1.cod_0105, 0) )
                     END )           AS dd,
                   ( CASE
                       WHEN t1.cod_0106 IS NULL THEN 0
                       ELSE t1.cod_0106
                     END )           AS gr,
                   ( CASE
                       WHEN t1.cod_0166 IS NULL THEN 0
                       ELSE t1.cod_0166
                     END )           AS ipaa,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( ( CASE
                                                          WHEN t1.cod_0110 IS NULL THEN 0
                                                          ELSE t1.cod_0110
                                                        END ) + ( CASE WHEN t1.cod_0104 IS NULL THEN 0 ELSE t1.cod_0104 END + CASE WHEN t1.cod_0105 IS NULL THEN 0 ELSE t1.cod_0105 END ) + ( CASE WHEN t1.cod_0106 IS NULL THEN 0 ELSE t1.cod_0106 END + CASE WHEN t1.cod_0165 IS NULL THEN 0 ELSE t1.cod_0165 END ) + ( CASE
                                                                                                                                                                                                                                                                                                                            WHEN t1.cod_0166 IS NULL THEN 0
                                                                                                                                                                                                                                                                                                                            ELSE t1.cod_0166
                                                                                                                                                                                                                                                                                                                          END ) + ( ( CASE
                                                                                                                                                                                                                                                                                                                                        WHEN t1.cod_1029 IS NULL THEN 0
                                                                                                                                                                                                                                                                                                                                        ELSE t1.cod_1029
                                                                                                                                                                                                                                                                                                                                      END ) + ( CASE
                                                                                                                                                                                                                                                                                                                                                  WHEN t1.cod_0959 IS NULL THEN 0
                                                                                                                                                                                                                                                                                                                                                  ELSE t1.cod_0959
                                                                                                                                                                                                                                                                                                                                                END ) ) + ( CASE
                                                                                                                                                                                                                                                                                                                                                              WHEN t1.cod_0108 IS NULL THEN 0
                                                                                                                                                                                                                                                                                                                                                              ELSE t1.cod_0108
                                                                                                                                                                                                                                                                                                                                                            END ) )
                       ELSE ( ( CASE
                                  WHEN t1.cod_0110 IS NULL THEN 0
                                  ELSE t1.cod_0110
                                END ) + ( CASE WHEN t1.cod_0104 IS NULL THEN 0 ELSE t1.cod_0104 END + CASE WHEN t1.cod_0105 IS NULL THEN 0 ELSE t1.cod_0105 END ) + ( CASE WHEN t1.cod_0106 IS NULL THEN 0 ELSE t1.cod_0106 END + CASE WHEN t1.cod_0165 IS NULL THEN 0 ELSE t1.cod_0165 END ) + ( CASE
                                                                                                                                                                                                                                                                                                    WHEN t1.cod_0166 IS NULL THEN 0
                                                                                                                                                                                                                                                                                                    ELSE t1.cod_0166
                                                                                                                                                                                                                                                                                                  END ) )
                     END )           AS trv,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( ( ( CASE
                                                            WHEN t1.cod_0155 IS NULL THEN 0
                                                            ELSE t1.cod_0155
                                                          END ) - ( CASE
                                                                      WHEN t1.cod_0169 IS NULL THEN 0
                                                                      ELSE t1.cod_0169
                                                                    END ) ) + ISNULL(t1.cod_1032, 0) + ISNULL(t1.cod_1104, 0) )
                       ELSE ( CASE
                                WHEN t1.cod_0155 IS NULL THEN 0
                                ELSE t1.cod_0155
                              END ) - ( CASE
                                          WHEN t1.cod_0169 IS NULL THEN 0
                                          ELSE t1.cod_0169
                                        END )
                     END )           AS rgc,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( CASE
                                                        WHEN t1.cod_0955 IS NULL THEN 0
                                                        ELSE t1.cod_0955
                                                      END )
                       ELSE (( CASE
                                 WHEN t1.cod_0109 IS NULL THEN 0
                                 ELSE t1.cod_0109
                               END ))
                     END )           AS rcs,
                   ( CASE
                       WHEN t1.cod_0152 IS NULL THEN 0
                       ELSE t1.cod_0152
                     END )           AS rei,
                   ( CASE
                       WHEN t1.cod_0111 IS NULL THEN 0
                       ELSE t1.cod_0111
                     END )           AS ce,
                   ( CASE
                       WHEN t1.cod_0087 IS NULL THEN 0
                       ELSE t1.cod_0087
                     END )           AS ds,
                   ( CASE
                       WHEN t1.cod_0031 IS NULL THEN 0
                       ELSE t1.cod_0031
                     END )           AS igc,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( ( ( CASE
                                                            WHEN t1.cod_0155 IS NULL THEN 0
                                                            ELSE t1.cod_0155
                                                          END ) - ( CASE
                                                                      WHEN t1.cod_0169 IS NULL THEN 0
                                                                      ELSE t1.cod_0169
                                                                    END ) ) + ( CASE WHEN t1.cod_0955 IS NULL THEN 0 ELSE t1.cod_0955 END + CASE WHEN t1.cod_0152 IS NULL THEN 0 ELSE t1.cod_0152 END ) + ( CASE
                                                                                                                                                                                                              WHEN t1.cod_1032 IS NULL THEN 0
                                                                                                                                                                                                              ELSE t1.cod_1032
                                                                                                                                                                                                            END ) + ( CASE WHEN t1.cod_1104 IS NULL THEN 0 ELSE t1.cod_1104 END + CASE WHEN t1.cod_0111 IS NULL THEN 0 ELSE t1.cod_0111 END ) + ( CASE WHEN t1.cod_0087 IS NULL THEN 0 ELSE t1.cod_0087 END + CASE WHEN t1.cod_0031 IS NULL THEN 0 ELSE t1.cod_0031 END ) + ( CASE WHEN t1.cod_1032 IS NULL THEN 0 ELSE t1.cod_1032 END + CASE WHEN t1.cod_1104 IS NULL THEN 0 ELSE t1.cod_1104 END ) + ( CASE
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            WHEN t1.cod_1032 IS NULL THEN 0
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ELSE t1.cod_1032
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          END ) + ( CASE
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      WHEN t1.cod_1104 IS NULL THEN 0
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ELSE t1.cod_1104
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    END ) )
                       ELSE ( ( ( CASE
                                    WHEN t1.cod_0155 IS NULL THEN 0
                                    ELSE t1.cod_0155
                                  END ) - ( CASE
                                              WHEN t1.cod_0169 IS NULL THEN 0
                                              ELSE t1.cod_0169
                                            END ) ) + ( CASE WHEN t1.cod_0955 IS NULL THEN 0 ELSE t1.cod_0955 END + CASE WHEN t1.cod_0152 IS NULL THEN 0 ELSE t1.cod_0152 END ) + ( CASE
                                                                                                                                                                                      WHEN t1.cod_1032 IS NULL THEN 0
                                                                                                                                                                                      ELSE t1.cod_1032
                                                                                                                                                                                    END ) + ( CASE WHEN t1.cod_1104 IS NULL THEN 0 ELSE t1.cod_1104 END + CASE WHEN t1.cod_0111 IS NULL THEN 0 ELSE t1.cod_0111 END ) + ( CASE WHEN t1.cod_0087 IS NULL THEN 0 ELSE t1.cod_0087 END + CASE WHEN t1.cod_0031 IS NULL THEN 0 ELSE t1.cod_0031 END ) + ( CASE WHEN t1.cod_1032 IS NULL THEN 0 ELSE t1.cod_1032 END + CASE WHEN t1.cod_1104 IS NULL THEN 0 ELSE t1.cod_1104 END ) )
                     END )           AS tor,
                   ( CASE
                       WHEN t1.periodo >= 2018 THEN ( CASE
                                                        WHEN t1.cod_0161 IS NULL THEN 0
                                                        ELSE t1.cod_0161
                                                      END ) + ( ( CASE
                                                                    WHEN t1.cod_0162 IS NULL THEN 0
                                                                    ELSE t1.cod_0162
                                                                  END ) + ( CASE
                                                                              WHEN t1.cod_0110 IS NULL THEN 0
                                                                              ELSE t1.cod_0110
                                                                            END ) + ( CASE WHEN t1.cod_0104 IS NULL THEN 0 ELSE t1.cod_0104 END + CASE WHEN t1.cod_0105 IS NULL THEN 0 ELSE t1.cod_0105 END ) + ( CASE
                                                                                                                                                                                                                    WHEN t1.cod_1029 IS NULL THEN 0
                                                                                                                                                                                                                    ELSE t1.cod_1029
                                                                                                                                                                                                                  END ) + ( CASE WHEN t1.cod_0106 IS NULL THEN 0 ELSE t1.cod_0106 END + CASE WHEN t1.cod_0166 IS NULL THEN 0 ELSE t1.cod_0104 END ) + ( CASE
                                                                                                                                                                                                                                                                                                                                                          WHEN t1.cod_0166 IS NULL THEN 0
                                                                                                                                                                                                                                                                                                                                                          ELSE t1.cod_0166
                                                                                                                                                                                                                                                                                                                                                        END ) ) + ( ( ( CASE
                                                                                                                                                                                                                                                                                                                                                                          WHEN t1.cod_0155 IS NULL THEN 0
                                                                                                                                                                                                                                                                                                                                                                          ELSE t1.cod_0155
                                                                                                                                                                                                                                                                                                                                                                        END ) - ( CASE
                                                                                                                                                                                                                                                                                                                                                                                    WHEN t1.cod_0169 IS NULL THEN 0
                                                                                                                                                                                                                                                                                                                                                                                    ELSE t1.cod_0169
                                                                                                                                                                                                                                                                                                                                                                                  END ) ) + ( CASE WHEN t1.cod_0955 IS NULL THEN 0 ELSE t1.cod_0955 END + CASE WHEN t1.cod_0152 IS NULL THEN 0 ELSE t1.cod_0152 END ) + ( CASE
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            WHEN t1.cod_1032 IS NULL THEN 0
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ELSE t1.cod_1032
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          END ) + ( CASE WHEN t1.cod_1104 IS NULL THEN 0 ELSE t1.cod_1104 END + CASE WHEN t1.cod_0111 IS NULL THEN 0 ELSE t1.cod_0111 END ) + ( CASE WHEN t1.cod_0087 IS NULL THEN 0 ELSE t1.cod_0087 END + CASE WHEN t1.cod_0031 IS NULL THEN 0 ELSE t1.cod_0031 END ) + ( CASE
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              WHEN t1.cod_1032 IS NULL THEN 0
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ELSE t1.cod_1032
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            END ) + ( CASE
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        WHEN t1.cod_1104 IS NULL THEN 0
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ELSE t1.cod_1104
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      END ) )
                       ELSE ( ( CASE
                                  WHEN t1.cod_0161 IS NULL THEN 0
                                  ELSE t1.cod_0161
                                END ) + ( CASE
                                            WHEN t1.cod_0162 IS NULL THEN 0
                                            ELSE t1.cod_0162
                                          END ) + ( CASE
                                                      WHEN t1.cod_0110 IS NULL THEN 0
                                                      ELSE t1.cod_0110
                                                    END ) + ( CASE
                                                                WHEN t1.cod_0104 IS NULL THEN 0
                                                                ELSE t1.cod_0104
                                                              END ) + ( CASE
                                                                          WHEN t1.cod_0105 IS NULL THEN 0
                                                                          ELSE t1.cod_0105
                                                                        END ) + ( CASE
                                                                                    WHEN t1.cod_1029 IS NULL THEN 0
                                                                                    ELSE t1.cod_0106
                                                                                  END ) + ( CASE
                                                                                              WHEN t1.cod_0106 IS NULL THEN 0
                                                                                              ELSE t1.cod_0165
                                                                                            END ) + ( CASE
                                                                                                        WHEN t1.cod_0166 IS NULL THEN 0
                                                                                                        ELSE t1.cod_0166
                                                                                                      END ) + ( ( CASE
                                                                                                                    WHEN t1.cod_0155 IS NULL THEN 0
                                                                                                                    ELSE t1.cod_0155
                                                                                                                  END ) - ( CASE
                                                                                                                              WHEN t1.cod_0169 IS NULL THEN 0
                                                                                                                              ELSE t1.cod_0169
                                                                                                                            END ) ) + ( CASE
                                                                                                                                          WHEN t1.cod_0109 IS NULL THEN 0
                                                                                                                                          ELSE t1.cod_0109
                                                                                                                                        END ) + ( CASE
                                                                                                                                                    WHEN t1.cod_0152 IS NULL THEN 0
                                                                                                                                                    ELSE t1.cod_0152
                                                                                                                                                  END ) + ( CASE
                                                                                                                                                              WHEN t1.cod_0111 IS NULL THEN 0
                                                                                                                                                              ELSE t1.cod_0111
                                                                                                                                                            END ) + ( CASE
                                                                                                                                                                        WHEN t1.cod_0087 IS NULL THEN 0
                                                                                                                                                                        ELSE t1.cod_0087
                                                                                                                                                                      END ) + ( CASE
                                                                                                                                                                                  WHEN t1.cod_0031 IS NULL THEN 0
                                                                                                                                                                                  ELSE t1.cod_0031
                                                                                                                                                                                END ) )
                     END )           AS trl,
                   t1.cod_0315       AS fec
      FROM   form22 t1,
             autorizaform a1
      WHERE  t1.rutContribuyente = @rut
             AND t1.vigente = '1'
             AND t1.cod_0007 = a1.folio
             AND a1.idEmpresa = @empresa
      ORDER  BY t1.periodo DESC;
GO

GO
--SqlScripter----[dbo].[ventas_acf_sql].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ventas_acf_sql]') IS NULL EXEC('CREATE FUNCTION [dbo].[ventas_acf_sql] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [dbo].[ventas_acf_sql]
(@rut INT,
                              @empresa INT
)

/********************************************************************************************
* Sistema        : Servicio Validación Tributaria Consulta* 
* Descripcion    :  
* Responsable    : Felipe Poveda
* Fecha Creacion : 03/04/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 07/04/2017 FPE         Actualización de función.
* 30/05/2017 RUH         Actualizacion por error en el where
* 29/06/2017 RUH         PPE-160 - Actualizacion por error en despliegue IVA en ACF
*********************************************************************************************/

RETURNS TABLE
AS
RETURN
    SELECT TOP 60 
    t1.cod_0015 as per,
    (case when t1.cod_0020 is null then 0 else t1.cod_0020 END) +
    (case when t1.cod_0142 is null then 0 else t1.cod_0142 END) +
    (case when t1.cod_0732 is null then 0 else t1.cod_0732 END) +
    (case when t1.cod_0715 is null then 0 else t1.cod_0715 END) + 
    (case when t1.cod_0587 is null then 0 else t1.cod_0587 END) +
    (case when t1.cod_0720 is null then 0 else t1.cod_0720 END) + 
    (dbo.ivasor(case when t1.cod_0502 is null then 0 else t1.cod_0502 END) +
    dbo.ivasor(case when t1.cod_0717 is null then 0 else t1.cod_0717 END) +
    dbo.ivasor(case when t1.cod_0111 is null then 0 else t1.cod_0111 END) +
    dbo.ivasor(case when t1.cod_0513 is null then 0 else t1.cod_0513 END) -
    dbo.ivasor(case when t1.cod_0510 is null then 0 else t1.cod_0510 END) - 
    dbo.ivasor(case when t1.cod_0709 is null then 0 else t1.cod_0709 END) - 
    dbo.ivasor(case when t1.cod_0734 is null then 0 else t1.cod_0734 END) + 
    dbo.ivasor(case when t1.cod_0759 is null then 0 else t1.cod_0759 END) +
    dbo.ivasor(case when t1.cod_0501 is null then 0 else t1.cod_0501 END)) AS ven,
    (case when t1.cod_0521 is null then 0 else t1.cod_0521 END) +
    (case when t1.cod_0560 is null then 0 else t1.cod_0560 END) +
    (case when t1.cod_0562 is null then 0 else t1.cod_0562 END) + 
    (dbo.ivasor(case when t1.cod_0520 is null then 0 else t1.cod_0520 END) +
    dbo.ivasor(case when t1.cod_0525 is null then 0 else t1.cod_0525 END) -
    dbo.ivasor(case when t1.cod_0528 is null then 0 else t1.cod_0528 END) +
    dbo.ivasor(case when t1.cod_0532 is null then 0 else t1.cod_0532 END) +
    dbo.ivasor(case when t1.cod_0535 is null then 0 else t1.cod_0535 END) + 
    dbo.ivasor(case when t1.cod_0553 is null then 0 else t1.cod_0553 END)) AS com,
    
    ((case when t1.cod_0020 is null then 0 else t1.cod_0020 END) +
    (case when t1.cod_0142 is null then 0 else t1.cod_0142 END) +
    (case when t1.cod_0732 is null then 0 else t1.cod_0732 END) +
    (case when t1.cod_0715 is null then 0 else t1.cod_0715 END) + 
    (case when t1.cod_0587 is null then 0 else t1.cod_0587 END) +
    (case when t1.cod_0720 is null then 0 else t1.cod_0720 END) + 
    (dbo.ivasor(case when t1.cod_0502 is null then 0 else t1.cod_0502 END) +
    dbo.ivasor(case when t1.cod_0717 is null then 0 else t1.cod_0717 END) +
    dbo.ivasor(case when t1.cod_0111 is null then 0 else t1.cod_0111 END) +
    dbo.ivasor(case when t1.cod_0513 is null then 0 else t1.cod_0513 END) -
    dbo.ivasor(case when t1.cod_0510 is null then 0 else t1.cod_0510 END) - 
    dbo.ivasor(case when t1.cod_0709 is null then 0 else t1.cod_0709 END) - 
    dbo.ivasor(case when t1.cod_0734 is null then 0 else t1.cod_0734 END) + 
    dbo.ivasor(case when t1.cod_0759 is null then 0 else t1.cod_0759 END) +
    dbo.ivasor(case when t1.cod_0501 is null then 0 else t1.cod_0501 END))) -
    ((case when t1.cod_0521 is null then 0 else t1.cod_0521 END) +
    (case when t1.cod_0560 is null then 0 else t1.cod_0560 END) +
    (case when t1.cod_0562 is null then 0 else t1.cod_0562 END) + 
    (dbo.ivasor(case when t1.cod_0520 is null then 0 else t1.cod_0520 END) +
    dbo.ivasor(case when t1.cod_0525 is null then 0 else t1.cod_0525 END) -
    dbo.ivasor(case when t1.cod_0528 is null then 0 else t1.cod_0528 END) +
    dbo.ivasor(case when t1.cod_0532 is null then 0 else t1.cod_0532 END) +
    dbo.ivasor(case when t1.cod_0535 is null then 0 else t1.cod_0535 END) + 
    dbo.ivasor(case when t1.cod_0553 is null then 0 else t1.cod_0553 END))) AS mar,
    t1.cod_0091 AS imp,
    100 * (ROUND((ISNULL(t1.cod_0510,0)/0.19  + ISNULL(t1.cod_0709,0)/0.19 + ISNULL(t1.cod_0734,0)/0.19 )/dbo.ISZERO(ISNULL(t1.cod_0020,0) + ISNULL(t1.cod_0142,0) + ISNULL(t1.cod_0732,0) + ISNULL(t1.cod_0715,0) + ISNULL(t1.cod_0587,0) + ISNULL(t1.cod_0720,0) + ISNULL(t1.cod_0502,0)/0.19 + ISNULL(CAST(t1.cod_0717 AS BIGINT),0)/0.19 + ISNULL(t1.cod_0111,0)/0.19 + ISNULL(t1.cod_0513,0)/0.19 + ISNULL(t1.cod_0501,0)/0.19 + ISNULL(CAST(t1.cod_0759 AS BIGINT),0)/0.19,1),4)) AS nc,
    t1.cod_0315 AS fec,
    t1.cod_chk AS chk,
    t1.cod_0007 AS fol,
    case when t1.cod_0755 is null then 0 else t1.cod_0755  END AS Post
    FROM form29 t1, autorizaform a1 
    WHERE t1.rutContribuyente = @rut AND t1.vigente = '1' AND t1.cod_0007 = a1.folio AND a1.idEmpresa = @empresa AND t1.cod_0315 = (select MAX(t2.cod_0315) from form29 t2 where t2.rutContribuyente = t1.rutContribuyente AND t2.cod_0015 = t1.cod_0015 )
    ORDER BY t1.periodo desc
GO

GO
--SqlScripter----[dbo].[ventas_sql].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ventas_sql]') IS NULL EXEC('CREATE FUNCTION [dbo].[ventas_sql] () RETURNS TABLE AS RETURN (/*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1)')
GO
ALTER FUNCTION [dbo].[ventas_sql]
(@rut INT, @empresa INT)

/********************************************************************************************
* Sistema        : Servicio Validación Tributaria Consulta* 
* Descripcion    :  
* Responsable    : Felipe Poveda
* Fecha Creacion : 03/04/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 07/04/2017 FPE		   Actualización de función.
* 30/05/2017 RUH         Actualizacion por error en el where
*********************************************************************************************/

RETURNS TABLE
AS
RETURN
    SELECT TOP 60 
    t1.cod_0015 as per,
    (case when t1.cod_0020 is null then 0 else t1.cod_0020 END) +
    (case when t1.cod_0142 is null then 0 else t1.cod_0142 END) +
    (case when t1.cod_0732 is null then 0 else t1.cod_0732 END) +
    (case when t1.cod_0715 is null then 0 else t1.cod_0715 END) + 
    (case when t1.cod_0587 is null then 0 else t1.cod_0587 END) +
    (case when t1.cod_0720 is null then 0 else t1.cod_0720 END) + 
    (dbo.ivasor(case when t1.cod_0502 is null then 0 else t1.cod_0502 END) +
    dbo.ivasor(case when t1.cod_0717 is null then 0 else t1.cod_0717 END) +
    dbo.ivasor(case when t1.cod_0111 is null then 0 else t1.cod_0111 END) +
    dbo.ivasor(case when t1.cod_0513 is null then 0 else t1.cod_0513 END) -
    dbo.ivasor(case when t1.cod_0510 is null then 0 else t1.cod_0510 END) - 
    dbo.ivasor(case when t1.cod_0709 is null then 0 else t1.cod_0709 END) - 
    dbo.ivasor(case when t1.cod_0734 is null then 0 else t1.cod_0734 END) + 
    dbo.ivasor(case when t1.cod_0759 is null then 0 else t1.cod_0759 END) +
    dbo.ivasor(case when t1.cod_0501 is null then 0 else t1.cod_0501 END)) AS ven,
    (case when t1.cod_0521 is null then 0 else t1.cod_0521 END) +
    (case when t1.cod_0560 is null then 0 else t1.cod_0560 END) +
    (case when t1.cod_0562 is null then 0 else t1.cod_0562 END) + 
    (dbo.ivasor(case when t1.cod_0520 is null then 0 else t1.cod_0520 END) +
    dbo.ivasor(case when t1.cod_0525 is null then 0 else t1.cod_0525 END) -
    dbo.ivasor(case when t1.cod_0528 is null then 0 else t1.cod_0528 END) +
    dbo.ivasor(case when t1.cod_0532 is null then 0 else t1.cod_0532 END) +
    dbo.ivasor(case when t1.cod_0535 is null then 0 else t1.cod_0535 END) + 
    dbo.ivasor(case when t1.cod_0553 is null then 0 else t1.cod_0553 END)) AS com,
    
    ((case when t1.cod_0020 is null then 0 else t1.cod_0020 END) +
    (case when t1.cod_0142 is null then 0 else t1.cod_0142 END) +
    (case when t1.cod_0732 is null then 0 else t1.cod_0732 END) +
    (case when t1.cod_0715 is null then 0 else t1.cod_0715 END) + 
    (case when t1.cod_0587 is null then 0 else t1.cod_0587 END) +
    (case when t1.cod_0720 is null then 0 else t1.cod_0720 END) + 
    (dbo.ivasor(case when t1.cod_0502 is null then 0 else t1.cod_0502 END) +
    dbo.ivasor(case when t1.cod_0717 is null then 0 else t1.cod_0717 END) +
    dbo.ivasor(case when t1.cod_0111 is null then 0 else t1.cod_0111 END) +
    dbo.ivasor(case when t1.cod_0513 is null then 0 else t1.cod_0513 END) -
    dbo.ivasor(case when t1.cod_0510 is null then 0 else t1.cod_0510 END) - 
    dbo.ivasor(case when t1.cod_0709 is null then 0 else t1.cod_0709 END) - 
    dbo.ivasor(case when t1.cod_0734 is null then 0 else t1.cod_0734 END) + 
    dbo.ivasor(case when t1.cod_0759 is null then 0 else t1.cod_0759 END) +
    dbo.ivasor(case when t1.cod_0501 is null then 0 else t1.cod_0501 END))) -
    ((case when t1.cod_0521 is null then 0 else t1.cod_0521 END) +
    (case when t1.cod_0560 is null then 0 else t1.cod_0560 END) +
    (case when t1.cod_0562 is null then 0 else t1.cod_0562 END) + 
    (dbo.ivasor(case when t1.cod_0520 is null then 0 else t1.cod_0520 END) +
    dbo.ivasor(case when t1.cod_0525 is null then 0 else t1.cod_0525 END) -
    dbo.ivasor(case when t1.cod_0528 is null then 0 else t1.cod_0528 END) +
    dbo.ivasor(case when t1.cod_0532 is null then 0 else t1.cod_0532 END) +
    dbo.ivasor(case when t1.cod_0535 is null then 0 else t1.cod_0535 END) + 
    dbo.ivasor(case when t1.cod_0553 is null then 0 else t1.cod_0553 END)))
    
     AS mar,
    t1.cod_0091 AS imp,
    t1.cod_0315 AS fec,
    t1.cod_chk AS chk,
    t1.cod_0007 AS fol,
    case when t1.cod_0755 is null then 0 else t1.cod_0755  END AS Post
    FROM form29 t1, autorizaform a1 
    WHERE t1.rutContribuyente = @rut AND t1.vigente = '1' AND t1.cod_0007 = a1.folio AND a1.idEmpresa = @empresa AND t1.cod_0315 = (select MAX(t2.cod_0315) from form29 t2 where t2.rutContribuyente = t1.rutContribuyente AND t2.cod_0015 = t1.cod_0015 )
    ORDER BY t1.periodo  desc
GO
