SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaIndicadores]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaIndicadores] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 07-10-2013
-- Description: Realiza la consolidacion de afiliados y deudas para la generacion de propuestas de cartera
-- 
-- Tipos de Indicador:
--  @iIndicador :
--   - 1 - Consulta por rango por Periodos
--   - 2 - Consulta por Periodo Mora
--   - 3 - Consulta por Caja vs Caja
--   - 4 - Consulta por Procesos
-- =============================================
ALTER PROCEDURE [dbo].[spConsultaIndicadores]
@vcTipoIndicador varchar(3) = '', 
  @iTipoConsulta int,
  @nPeriodoInicial numeric(6,0) = 0,
  @nPeriodoFinal numeric(6,0) = 0,
  @vcCriterio varchar(3) = '',
  @vcUbicados varchar(3) = 'T',
  @vcRecaudados varchar(2) = 'T',
  @iPeriodoMora int = '0',
  @cTipoDeudor char(1) = 'T',
  @nIdCajaOrigen as numeric (4,0) = 0,
  @nIdCajaDestino as numeric (4,0) = 0,
  @iCodError int out, 
  @vcMsjError varchar(50) out
AS
BEGIN
  set @iCodError = 0;
  set @vcMsjError = 'OK'; 

  
  BEGIN TRY
  
  if @iTipoConsulta = 1 -- Número de deudores por rango por Industria
  Begin
    
    Select 
       tblInstitucion.nIdInstitucion as IdCajaOrigen,
       tblInstitucion.vcNombreCorto as CajaOrigen, 
       nperiodo as Periodo, 
    Case 
       When cTipoDeudor = 'D' THEN 'Directo'
       When cTipoDeudor = 'A' THEN 'Aval' 
    END as TipoDeudor,
    SUM(nValor) as Valor
    from tblIndicadorResumen left join tblInstitucion 
       on tblIndicadorResumen.nIdCajaOrigen = tblInstitucion.nIdInstitucion
    where tblIndicadorResumen.nPeriodo between @nPeriodoInicial and @nPeriodoFinal
       and tblIndicadorResumen.vcTipoIndicador = @vcTipoIndicador
	   and tblIndicadorResumen.vcCriterio = @vcCriterio
       and (@vcUbicados = 'T' or tblIndicadorResumen.vcUbicados = @vcUbicados)
       and (
            (tblIndicadorResumen.vcUbicados = 'SI' and (@vcRecaudados = 'T' or tblIndicadorResumen.vcRecaudados = @vcRecaudados))
            or
            (tblIndicadorResumen.vcUbicados = 'NO' and (@vcRecaudados ='T' or @vcRecaudados = 'NO') and tblIndicadorResumen.vcRecaudados = 'NO')
       )
       and (@nIdCajaOrigen = 0 or tblIndicadorResumen.nIdCajaOrigen = @nIdCajaOrigen)
       and (@vcUbicados = 'NO' or @nIdCajaDestino = 0 or tblIndicadorResumen.nIdCajaDestino = @nIdCajaDestino)
       and (@cTipoDeudor = 'T' or tblIndicadorResumen.cTipoDeudor = @cTipoDeudor)
       and ((@vcCriterio = 'DEU' and tblIndicadorResumen.iIdPeriodoMora = -1)
			or
	       (@vcCriterio <> 'DEU' and tblIndicadorResumen.iIdPeriodoMora > -1))
    group by tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto, nPeriodo, cTipoDeudor
    order by tblInstitucion.vcNombreCorto, nPeriodo, cTipoDeudor

    if @@ROWCOUNT = 0
    begin
      set @iCodError = -1;
      set @vcMsjError = 'No se encontraron datos para esta consulta.'; 
    end
    return
  END
  if @iTipoConsulta = 2
  Begin
     Select 
       tblPeriodoMora.iIdPeriodoMora as IdPeriodoMora,
       tblPeriodoMora.vcPeriodoMora as PeriodoMora,
       tblInstitucion.nIdInstitucion as IdCaja,
       tblInstitucion.vcNombreCorto as Caja, 
    Case 
       When cTipoDeudor = 'D' THEN 'Directo'
       When cTipoDeudor = 'A' THEN 'Aval' 
    END as TipoDeudor,
    SUM(nValor) as Valor
    from tblIndicadorResumen inner join tblInstitucion 
       on tblIndicadorResumen.nIdCajaOrigen = tblInstitucion.nIdInstitucion
       inner join tblPeriodoMora 
       on tblIndicadorResumen.iIdPeriodoMora = tblPeriodoMora.iIdPeriodoMora
    where tblIndicadorResumen.nPeriodo = @nPeriodoInicial
       and tblIndicadorResumen.vcTipoIndicador = @vcTipoIndicador
       and tblIndicadorResumen.vcCriterio = @vcCriterio
       and (@vcUbicados = 'T' or tblIndicadorResumen.vcUbicados = @vcUbicados)
       and (
            (tblIndicadorResumen.vcUbicados = 'SI' and (@vcRecaudados = 'T' or tblIndicadorResumen.vcRecaudados = @vcRecaudados))
            or
            (tblIndicadorResumen.vcUbicados = 'NO' and (@vcRecaudados ='T' or @vcRecaudados = 'NO') and tblIndicadorResumen.vcRecaudados = 'NO')
       )
       and (@iPeriodoMora = 0 or tblIndicadorResumen.iIdPeriodoMora = @iPeriodoMora)
       and (@nIdCajaOrigen = 0 or tblIndicadorResumen.nIdCajaOrigen = @nIdCajaOrigen)
       and (@vcUbicados = 'NO' or @nIdCajaDestino = 0 or tblIndicadorResumen.nIdCajaDestino = @nIdCajaDestino)
       and (@cTipoDeudor = 'T' or tblIndicadorResumen.cTipoDeudor = @cTipoDeudor)
	   and tblIndicadorResumen.iIdPeriodoMora > -1
    group by tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto, nPeriodo, cTipoDeudor, tblPeriodoMora.iIdPeriodoMora, tblPeriodoMora.vcPeriodoMora
    order by tblPeriodoMora.iIdPeriodoMora, tblInstitucion.vcNombreCorto, nPeriodo, cTipoDeudor
  
    if @@ROWCOUNT = 0
    begin
      set @iCodError = -2;
      set @vcMsjError = 'No se encontraron datos para esta consulta.'; 
    end
    return
    END
    if @iTipoConsulta = 3
    Begin
     Select 
       InstOrigen.nIdInstitucion as IdCajaOrigen,
       InstOrigen.vcNombreCorto as CajaOrigen, 
       InstDestino.nIdInstitucion as IdCajaDestino,
       InstDestino.vcNombreCorto as CajaDestino, 
     Case 
       When cTipoDeudor = 'D' THEN 'Directo'
       When cTipoDeudor = 'A' THEN 'Aval' 
     END as TipoDeudor,
       SUM(nValor) as Valor
     from tblIndicadorResumen left join tblInstitucion InstOrigen
       on tblIndicadorResumen.nIdCajaOrigen = InstOrigen.nIdInstitucion
       left join tblInstitucion InstDestino
       on tblIndicadorResumen.nIdCajaDestino = InstDestino.nIdInstitucion
     where tblIndicadorResumen.nPeriodo = @nPeriodoInicial
       and tblIndicadorResumen.vcTipoIndicador = @vcTipoIndicador
       and tblIndicadorResumen.vcCriterio = @vcCriterio
       and (@vcUbicados = 'SI' or tblIndicadorResumen.vcUbicados = @vcUbicados)
       and (
            (tblIndicadorResumen.vcUbicados = 'SI' and (@vcRecaudados = 'T' or tblIndicadorResumen.vcRecaudados = @vcRecaudados))
       )
       and (@nIdCajaOrigen = 0 or tblIndicadorResumen.nIdCajaOrigen = @nIdCajaOrigen)
       and (@nIdCajaDestino = 0 or tblIndicadorResumen.nIdCajaDestino = @nIdCajaDestino)
       and (@cTipoDeudor = 'T' or tblIndicadorResumen.cTipoDeudor = @cTipoDeudor)
       and ((@vcCriterio = 'DEU' and tblIndicadorResumen.iIdPeriodoMora = -1)
			or
	       (@vcCriterio <> 'DEU' and tblIndicadorResumen.iIdPeriodoMora > -1))
     group by InstOrigen.nIdInstitucion, InstOrigen.vcNombreCorto, InstDestino.nIdInstitucion, InstDestino.vcNombreCorto,
            nPeriodo, cTipoDeudor
     order by InstOrigen.vcNombreCorto,InstDestino.vcNombreCorto, cTipoDeudor
  
    if @@ROWCOUNT = 0
    begin
      set @iCodError = -3;
      set @vcMsjError = 'No se encontraron datos para esta consulta.'; 
    end
    return
  END
  if @iTipoConsulta = 4 --Indicadores de Periodos (Cajas vs Cajas)
    Begin
     Select 
       tblPeriodoMora.iIdPeriodoMora as IdPeriodoMora,
       tblPeriodoMora.vcPeriodoMora as PeriodoMora,
       tblInstitucion.nIdInstitucion as IdCaja,
       tblInstitucion.vcNombreCorto as Caja, 
    Case 
       When cTipoDeudor = 'D' THEN 'Directo'
       When cTipoDeudor = 'A' THEN 'Aval' 
    END as TipoDeudor,
    SUM(nValor) as Valor
    from tblIndicadorResumen left join tblInstitucion 
       on tblIndicadorResumen.nIdCajaDestino = tblInstitucion.nIdInstitucion
       left join tblPeriodoMora 
       on tblIndicadorResumen.iIdPeriodoMora = tblPeriodoMora.iIdPeriodoMora
    where tblIndicadorResumen.nPeriodo = @nPeriodoInicial
       and tblIndicadorResumen.vcTipoIndicador = @vcTipoIndicador
       and tblIndicadorResumen.vcCriterio = @vcCriterio
       and (@vcUbicados = 'SI' and tblIndicadorResumen.vcUbicados = @vcUbicados)
       and (
            (tblIndicadorResumen.vcUbicados = 'SI' and (@vcRecaudados = 'T' or tblIndicadorResumen.vcRecaudados = @vcRecaudados))
       )
       and (@iPeriodoMora = 0 or tblIndicadorResumen.iIdPeriodoMora = @iPeriodoMora)
       and (@nIdCajaOrigen = 0 or tblIndicadorResumen.nIdCajaOrigen = @nIdCajaOrigen)
       and (@nIdCajaDestino = 0 or tblIndicadorResumen.nIdCajaDestino = @nIdCajaDestino)
       and (@cTipoDeudor = 'T' or tblIndicadorResumen.cTipoDeudor = @cTipoDeudor)
	   and tblIndicadorResumen.iIdPeriodoMora > -1
    group by tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto, nPeriodo, cTipoDeudor, tblPeriodoMora.iIdPeriodoMora, tblPeriodoMora.vcPeriodoMora
    order by tblPeriodoMora.iIdPeriodoMora, tblInstitucion.vcNombreCorto, nPeriodo, cTipoDeudor
  
    if @@ROWCOUNT = 0
    begin
      set @iCodError = -3;
      set @vcMsjError = 'No se encontraron datos para esta consulta.'; 
    end
    return
  END

  if @iTipoConsulta = 5 --Indicadores de Procesos
    Begin
     Select 
       tablaTmp.nIdInstitucion as IdCaja,
       tablaTmp.vcNombreCorto as Caja,
       COUNT(tblCierreFueraPlazo.iIdCierrePlazo) as Valor,
       tablaTmp.nPeriodo as Periodo
     from  tblCierreFueraPlazo right outer join 
           (select tblInstitucion.nIdInstitucion, tblInstitucion.vcNombreCorto, tblPeriodo.nPeriodo
           From tblInstitucion, tblPeriodo
           where tblInstitucion.bParticipa = 1 and tblInstitucion.iIdEstado = 11
            and (@nIdCajaOrigen = 0 or tblInstitucion.nIdInstitucion = @nIdCajaOrigen)
            and tblPeriodo.nPeriodo between  @nPeriodoInicial and @nPeriodoFinal
            ) tablaTmp 
            on tblCierreFueraPlazo.nIdInstitucion = tablaTmp.nIdInstitucion
            and tblCierreFueraPlazo.nPeriodo = tablaTmp.nPeriodo
     group by tablaTmp.nIdInstitucion, tablaTmp.vcNombreCorto, tablaTmp.nPeriodo
     order by tablaTmp.nIdInstitucion, tablaTmp.vcNombreCorto, tablaTmp.nPeriodo
  
    if @@ROWCOUNT = 0
    begin
      set @iCodError = -3;
      set @vcMsjError = 'No se encontraron datos para esta consulta.'; 
    end
    return
  END

  END TRY
  BEGIN CATCH
    SET @iCodError = -4;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
  END CATCH
END
GO
