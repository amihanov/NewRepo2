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
