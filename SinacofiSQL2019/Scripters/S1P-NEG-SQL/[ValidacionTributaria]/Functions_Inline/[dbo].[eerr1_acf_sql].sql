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
