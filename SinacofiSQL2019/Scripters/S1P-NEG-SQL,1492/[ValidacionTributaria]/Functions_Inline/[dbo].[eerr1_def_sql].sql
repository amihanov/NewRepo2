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
