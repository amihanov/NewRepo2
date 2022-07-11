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
