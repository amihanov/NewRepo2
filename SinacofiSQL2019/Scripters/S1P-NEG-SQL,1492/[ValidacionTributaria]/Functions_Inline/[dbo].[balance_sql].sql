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
