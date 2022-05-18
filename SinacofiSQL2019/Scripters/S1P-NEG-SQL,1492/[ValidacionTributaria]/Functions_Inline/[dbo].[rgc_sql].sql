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
