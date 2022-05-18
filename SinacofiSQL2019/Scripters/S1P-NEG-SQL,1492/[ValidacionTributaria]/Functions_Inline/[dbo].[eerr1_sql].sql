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
