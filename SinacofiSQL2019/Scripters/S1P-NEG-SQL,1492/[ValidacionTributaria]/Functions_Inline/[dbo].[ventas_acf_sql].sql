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
