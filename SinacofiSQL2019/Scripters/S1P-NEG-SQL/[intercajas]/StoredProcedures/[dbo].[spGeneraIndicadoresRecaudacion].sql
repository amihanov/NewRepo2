SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spGeneraIndicadoresRecaudacion]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spGeneraIndicadoresRecaudacion] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 28-11-2013
-- Description: Genera el resumen de indicadores de reacaudacion
-- 
-- Posibles salidas:          
--   0 OK - Se ha realizado la consolidacion OK
--     -1 NOK - Periodo Inexistente
--     -2 NOK - Insercion Control Proceso
--     -3 NOK - Update Control Proceso
--   1 NOK - Limpieza de periodo
--   2 NOK - Deudores encontrados y no recaudados
--   3 NOK - Deudores encontrados y recaudados
--   4 NOK - Deudores no encontrados
--   5 NOK - Colocaciones encontrados y no recaudados
--   6 NOK - Colocaciones encontrados y recaudados
--   7 NOK - Colocaciones no encontradas
--   8 NOK - Total Monto encontrados y no recaudados
--   9 NOK - Total Monto encontrados y recaudados
--   10 NOK - Total Monto no encontradas
-- =============================================
ALTER PROCEDURE [dbo].[spGeneraIndicadoresRecaudacion]
@nPeriodo numeric(6,0),
    @iCodError int = 0 out,
    @vcMsjError varchar (100) = '' out
AS
declare
    @iIdIndicador int = 0,
    @iFilasProcesadas int = 0,
    @iIdControlProceso int = 0,
    @iCantRegistros int = 0,
    @dFechaConsolidacion date = null,
	@vcMensajeControProc varchar(100)=''
BEGIN
    SET DATEFORMAT ymd
    BEGIN TRY
    
    -- VALIDAR PERIODO,  ES NECESARIO QUE SEA VALIDO PARA QUE SE PUEDA REALIZAR EL RESTO DEL PROCESO
    select @dFechaConsolidacion=DATEADD(MM, DATEDIFF(MM, -1, CONVERT(date,CONVERT(varchar,@nPeriodo) + '01',112)), 0) - 1
    if @dFechaConsolidacion=null
    begin
        set @iCodError = -1;
        set @vcMsjError = 'NO SE ENCONTRO UNA CONSOLIDACION DE AFILIADO Y DEUDA PARA EL PERIODO ' + @nPeriodo; 
        return
    end
    
    -- ENCONTRAR ULTIMA CONSOLIDACION DE AFILIADO DEUDA
    select @iCantRegistros=count(*) from tblperiodo where nperiodo=@nPeriodo
    if @iCantRegistros=0
    begin
        set @iCodError = -1;
        set @vcMsjError = 'PERIODO INDICADO INEXISTENTE'; 
        return
    end

    set @iCodError = -2;
        
    -- OBTENER ID DE CONTROL DE PROCESO E INSERTAR NUEVO REGISTRO (OK)  
    -- TAMBIEN SE INSERTA REGISTROCONSOLIDACION
    BEGIN
    -- CONTROL DE PROCESO, OBTENER ID DE CONTROL DE PROCESO
    SELECT     @iIdControlProceso = coalesce(MAX(nIdControlProceso) + 1,1)
    FROM         tblControlProceso
    WHERE     (nPeriodo = @nPeriodo)
    
    -- INSERTAR REGISTRO DE CONTROL DE PROCESO
    INSERT INTO tblControlProceso
            (nIdControlProceso,nPeriodo,dFechaInicio,dFechaFin,iIdEstado,iIdTipoControlProceso,vcDetalle)
        VALUES
            (@iIdControlProceso,@nPeriodo,GETDATE(),GETDATE(),22,7,'Ejecucion Generacion Indicadores Recaudacion')
    end
        
        SET @iCodError = 1
        SET @vcMensajeControProc='Eliminando Indicadores RE Anteriores'
        while (1=1)
            begin
            Begin TRAN  T1      
            delete top (1000) tblIndicadorResumen
            where nPeriodo = @nPeriodo
            and vcTipoIndicador = 'RE'       
            set @iFilasProcesadas =@@ROWCOUNT
            if @iFilasProcesadas =0 
              begin
                COMMIT TRAN T1
                break
              end           
            COMMIT TRAN T1
        end  
    
        /*Deudores encontrados y no recaudados*/
        SET @iCodError = 2
        SET @vcMensajeControProc='RE: Buscando Deudores Ubicados:SI Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'SI' as vcUbicado,
            'NO' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
			case when cSujetoDescuento = 'D' then
				count(distinct (tblConsolidacionDetalle.vcIdentificadorDeudor + convert(varchar,tblConsolidacionDetalle.tIdTipoIdentificador))) 
			when cSujetoDescuento = 'A' then
				count(distinct tblConsolidacionDetalle.vcRutAval) 
			end as Valor
		from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where nMontoPagado = 0 or nMontoPagado is Null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Deudores encontrados y no recaudados*/
    
        /*Deudores encontrados y recaudados*/
        SET @iCodError = 3
        SET @vcMensajeControProc='RE: Buscando Deudores Ubicados:SI Recaudados:SI'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'SI' as vcUbicado,
            'SI' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
			case when cSujetoDescuento = 'D' then
				count(distinct (tblConsolidacionDetalle.vcIdentificadorDeudor + convert(varchar,tblConsolidacionDetalle.tIdTipoIdentificador))) 
			when cSujetoDescuento = 'A' then
				count(distinct tblConsolidacionDetalle.vcRutAval) 
			end as Valor
		from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where tblConsolidacionDetalle.nMontoPagado > 0
            and tblConsolidacionDetalle.vcFechaPago is not null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Deudores encontrados y recaudados*/
    
        /*Deudores no encontrados */
        SET @iCodError = 4
        SET @vcMensajeControProc='RE: Buscando Deudores Ubicados:NO Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY  tblTabla1.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'NO' as vcUbicado,
            'NO' as vcRecuadado,
            tblTabla1.iIdPeriodoMora,
            tblTabla1.nIdCajaOrigen as nIdCajaOrigen,
            null as nIdCajaDestino,
            'D' as cSujetoDescuento,
            count(distinct (convert(varchar,tblTabla1.vcIdentificadorDeudor)+convert(varchar,tblTabla1.tIdTipoIdentificador)))as valor
        from(select 
                tblHistDeudaDetalle.vcIdentificadorDeudor as DeudoresTotal,
                tblHistDeudaDetalle.nIdInstitucion as nIdCajaOrigen,
                tblPeriodoMora.iIdPeriodoMora,
                tblHistDeudaDetalle.vcNumPagare,
                tblHistDeudaDetalle.vcIdentificadorDeudor,
                tblHistDeudaDetalle.tIdTipoIdentificador
            from tblHistDeudaDetalle inner join vwUltimoArchivoEnviadoValidado
                on vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblHistDeudaDetalle.nIdInstitucion
                and vwUltimoArchivoEnviadoValidado.nPeriodo = tblHistDeudaDetalle.nPeriodo
                and vwUltimoArchivoEnviadoValidado.iCorrelativo = tblHistDeudaDetalle.iCorrelativo
                left outer join tblPeriodoMora 
                    on COALESCE(DATEDIFF(day, case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                    and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where vwUltimoArchivoEnviadoValidado.nPeriodo = @nPeriodo
                 and vwUltimoArchivoEnviadoValidado.iIdEstado = 15
                 and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD'
            group by tblHistDeudaDetalle.nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,tblHistDeudaDetalle.vcNumPagare,tblHistDeudaDetalle.vcIdentificadorDeudor,tblHistDeudaDetalle.tIdTipoIdentificador
            ) tblTabla1 left join
            (select 
                nIdCajaOrigen as nIdCajaOrigen,
                vcIdentificadorDeudor as DeudoresEncontrados,
                tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
                left outer join tblPeriodoMora 
                on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where nPeriodo = @nPeriodo
            group by nIdCajaOrigen,tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            )tblTabla2 
            on tblTabla1.nIdCajaOrigen = tblTabla2.nIdCajaOrigen
            and tblTabla1.iIdPeriodoMora = tblTabla2.iIdPeriodoMora
            and tblTabla1.vcIdentificadorDeudor = tblTabla2.vcIdentificadorDeudor
            and tblTabla1.tIdTipoIdentificador = tblTabla2.tIdTipoIdentificador
            and tblTabla1.vcNumPagare = tblTabla2.vcNumPagare
        WHERE DeudoresEncontrados is null
        group by tblTabla1.iIdPeriodoMora, tblTabla1.nIdCajaOrigen
        COMMIT TRAN
        /*FIN Deudores no encontrados */
/*** FIX Total Deudores por period - GRN 03-03-2014***/

        /*Total Deudores encontrados y no recaudados por periodo*/
        SET @iCodError = 22
        SET @vcMensajeControProc='RE: Buscando Deudores Ubicados:SI Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY nIdCajaOrigen ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'SI' as vcUbicado,
            'NO' as vcRecuadado,
            -1 as iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
			case when cSujetoDescuento = 'D' then
				count(distinct (tblConsolidacionDetalle.vcIdentificadorDeudor + convert(varchar,tblConsolidacionDetalle.tIdTipoIdentificador))) 
			when cSujetoDescuento = 'A' then
				count(distinct tblConsolidacionDetalle.vcRutAval) 
			end as Valor
        from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
        where nMontoPagado = 0 or nMontoPagado is Null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Total Deudores encontrados y no recaudados por pariodo*/
    
        /*Total Deudores encontrados y recaudados por periodo*/
        SET @iCodError = 23
        SET @vcMensajeControProc='RE: Buscando Deudores Ubicados:SI Recaudados:SI'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY nIdCajaOrigen ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'SI' as vcUbicado,
            'SI' as vcRecuadado,
            -1 as iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
  			case when cSujetoDescuento = 'D' then
				count(distinct (tblConsolidacionDetalle.vcIdentificadorDeudor + convert(varchar,tblConsolidacionDetalle.tIdTipoIdentificador))) 
			when cSujetoDescuento = 'A' then
				count(distinct tblConsolidacionDetalle.vcRutAval) 
			end as Valor
           from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
        where tblConsolidacionDetalle.nMontoPagado > 0
            and tblConsolidacionDetalle.vcFechaPago is not null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Total Deudores encontrados y recaudados por periodo*/
    
        /*Total Deudores no encontrados por periodo*/
        SET @iCodError = 24
        SET @vcMensajeControProc='RE: Buscando Deudores Ubicados:NO Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY  tblTabla1.nIdCajaOrigen ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'DEU' as vcCriterio,
            'NO' as vcUbicado,
            'NO' as vcRecuadado,
            -1 as iIdPeriodoMora,
            tblTabla1.nIdCajaOrigen as nIdCajaOrigen,
            null as nIdCajaDestino,
            'D' as cSujetoDescuento,
		    count(distinct (convert(varchar,tblTabla1.vcIdentificadorDeudor)+convert(varchar,tblTabla1.tIdTipoIdentificador)))as valor
        from(select 
                tblHistDeudaDetalle.vcIdentificadorDeudor as DeudoresTotal,
                tblHistDeudaDetalle.nIdInstitucion as nIdCajaOrigen,
                tblHistDeudaDetalle.vcNumPagare,
                tblHistDeudaDetalle.vcIdentificadorDeudor,
                tblHistDeudaDetalle.tIdTipoIdentificador
            from tblHistDeudaDetalle inner join vwUltimoArchivoEnviadoValidado
                on vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblHistDeudaDetalle.nIdInstitucion
                and vwUltimoArchivoEnviadoValidado.nPeriodo = tblHistDeudaDetalle.nPeriodo
                and vwUltimoArchivoEnviadoValidado.iCorrelativo = tblHistDeudaDetalle.iCorrelativo
            where vwUltimoArchivoEnviadoValidado.nPeriodo = @nPeriodo
                 and vwUltimoArchivoEnviadoValidado.iIdEstado = 15
                 and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD'
            group by tblHistDeudaDetalle.nIdInstitucion,tblHistDeudaDetalle.vcNumPagare,tblHistDeudaDetalle.vcIdentificadorDeudor,tblHistDeudaDetalle.tIdTipoIdentificador
            ) tblTabla1 left join
            (select 
                nIdCajaOrigen as nIdCajaOrigen,
                vcIdentificadorDeudor as DeudoresEncontrados,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            where nPeriodo = @nPeriodo
            group by nIdCajaOrigen,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            )tblTabla2 
            on tblTabla1.nIdCajaOrigen = tblTabla2.nIdCajaOrigen
            and tblTabla1.vcIdentificadorDeudor = tblTabla2.vcIdentificadorDeudor
            and tblTabla1.tIdTipoIdentificador = tblTabla2.tIdTipoIdentificador
            and tblTabla1.vcNumPagare = tblTabla2.vcNumPagare
        WHERE DeudoresEncontrados is null
        group by tblTabla1.nIdCajaOrigen
        COMMIT TRAN
        /*FIN Total Deudores no encontrados por periodo*/

/*** FIN FIX ***/


    
        /*Colocaciones encontrados y no recaudados*/
        SET @iCodError = 5
        SET @vcMensajeControProc='RE: Buscando Colocaciones Ubicados:SI Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'COL' as vcCriterio,
            'SI' as vcUbicado,
            'NO' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
            count(distinct tblConsolidacionDetalle.vcNumPagare) as Valor
        from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where nMontoPagado = 0 or nMontoPagado is Null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Colocaciones encontrados y no recaudados*/
    
        /*Colocaciones encontrados y recaudados*/
        SET @iCodError = 6
        SET @vcMensajeControProc='RE: Buscando Colocaciones Ubicados:SI Recaudados:SI'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'COL' as vcCriterio,
            'SI' as vcUbicado,
            'SI' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
            count(distinct tblConsolidacionDetalle.vcNumPagare) as Valor
        from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where tblConsolidacionDetalle.nMontoPagado > 0
            and tblConsolidacionDetalle.vcFechaPago is not null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Colocaciones encontrados y recaudados*/
    
        /*Colocaciones no encontrados */
        SET @iCodError = 7
        SET @vcMensajeControProc='RE: Buscando Colocaciones Ubicados:NO Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY  tblTabla1.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'COL' as vcCriterio,
            'NO' as vcUbicado,
            'NO' as vcRecuadado,
            tblTabla1.iIdPeriodoMora,
            tblTabla1.nIdCajaOrigen as nIdCajaOrigen,
            null as nIdCajaDestino,
            'D' as cSujetoDescuento,
            count(distinct tblTabla1.vcNumPagare)as valor
        from(select 
                tblHistDeudaDetalle.vcIdentificadorDeudor as DeudoresTotal,
                tblHistDeudaDetalle.nIdInstitucion as nIdCajaOrigen,
                tblPeriodoMora.iIdPeriodoMora,
                tblHistDeudaDetalle.vcNumPagare,
                tblHistDeudaDetalle.vcIdentificadorDeudor,
                tblHistDeudaDetalle.tIdTipoIdentificador
            from tblHistDeudaDetalle inner join vwUltimoArchivoEnviadoValidado
                on vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblHistDeudaDetalle.nIdInstitucion
                and vwUltimoArchivoEnviadoValidado.nPeriodo = tblHistDeudaDetalle.nPeriodo
                and vwUltimoArchivoEnviadoValidado.iCorrelativo = tblHistDeudaDetalle.iCorrelativo
                left outer join tblPeriodoMora 
                    on COALESCE(DATEDIFF(day, case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                    and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where vwUltimoArchivoEnviadoValidado.nPeriodo = @nPeriodo
                 and vwUltimoArchivoEnviadoValidado.iIdEstado = 15
                 and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD'
            group by tblHistDeudaDetalle.nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,tblHistDeudaDetalle.vcNumPagare,tblHistDeudaDetalle.vcIdentificadorDeudor,tblHistDeudaDetalle.tIdTipoIdentificador
            ) tblTabla1 left join
            (select 
                nIdCajaOrigen as nIdCajaOrigen,
                vcIdentificadorDeudor as DeudoresEncontrados,
                tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
                left outer join tblPeriodoMora 
                on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where nPeriodo = @nPeriodo
            group by nIdCajaOrigen,tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            )tblTabla2 
            on tblTabla1.nIdCajaOrigen = tblTabla2.nIdCajaOrigen
            and tblTabla1.iIdPeriodoMora = tblTabla2.iIdPeriodoMora
            and tblTabla1.vcIdentificadorDeudor = tblTabla2.vcIdentificadorDeudor
            and tblTabla1.tIdTipoIdentificador = tblTabla2.tIdTipoIdentificador
            and tblTabla1.vcNumPagare = tblTabla2.vcNumPagare
        WHERE DeudoresEncontrados is null
        group by tblTabla1.iIdPeriodoMora, tblTabla1.nIdCajaOrigen
        COMMIT TRAN
        /*FIN Colocaciones no encontrados */

        /*Total Montos encontrados y no recaudados*/
        SET @iCodError = 8
        SET @vcMensajeControProc='RE: Buscando MontoTot Ubicados:SI Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'MT' as vcCriterio,
            'SI' as vcUbicado,
            'NO' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
            sum(coalesce(nMontoCobrar,0)) as Valor
        from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where nMontoPagado = 0 or nMontoPagado is Null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Total Montos encontrados y no recaudados*/
    
        /*Total Montos  encontrados y recaudados*/
        SET @iCodError = 9
        SET @vcMensajeControProc='RE: Buscando MontoTot Ubicados:SI Recaudados:SI'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY tblPeriodoMora.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'MT' as vcCriterio,
            'SI' as vcUbicado,
            'SI' as vcRecuadado,
            tblPeriodoMora.iIdPeriodoMora,
            nIdCajaOrigen as nIdCajaOrigen,
            nIdInstitucion as nIdCajaDestino,
            cSujetoDescuento,
            sum(coalesce(nMontoCobrar,0)) as Valor
        from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
            left outer join tblPeriodoMora 
            on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
            and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
        where tblConsolidacionDetalle.nMontoPagado > 0
            and tblConsolidacionDetalle.vcFechaPago is not null
            and nPeriodo = @nPeriodo
        group by nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,nIdCajaOrigen,cSujetoDescuento
        COMMIT TRAN
        /*FIN Total Montos encontrados y recaudados*/
    
        /*Total Montos  no encontrados */
        SET @iCodError = 10
        SET @vcMensajeControProc='RE: Buscando MontoTot Ubicados:NO Recaudados:NO'
        BEGIN TRAN
        select @iIdIndicador=COALESCE(MAX(iIdIndicadorResumen),0) from tblIndicadorResumen where nPeriodo=@nPeriodo
        insert into tblIndicadorResumen (iIdIndicadorResumen,nPeriodo,vcTipoIndicador,vcCriterio,vcUbicados,vcRecaudados,iIdPeriodoMora,nIdCajaOrigen,nIdCajaDestino,cTipoDeudor,nValor)
        select 
            @iIdIndicador + ROW_NUMBER() OVER(ORDER BY  tblTabla1.iIdPeriodoMora ASC) as iIdIndicadorResumen,
            @nPeriodo as nPeriodo,
            'RE' as vcTipoIndicador,
            'MT' as vcCriterio,
            'NO' as vcUbicado,
            'NO' as vcRecuadado,
            tblTabla1.iIdPeriodoMora,
            tblTabla1.nIdCajaOrigen as nIdCajaOrigen,
            null as nIdCajaDestino,
            'D' as cSujetoDescuento,
            Sum(tblTabla1.nMontoCobrar)as valor
        from(select 
                tblHistDeudaDetalle.vcIdentificadorDeudor as DeudoresTotal,
                tblHistDeudaDetalle.nIdInstitucion as nIdCajaOrigen,
                tblPeriodoMora.iIdPeriodoMora,
                tblHistDeudaDetalle.vcNumPagare,
                tblHistDeudaDetalle.vcIdentificadorDeudor,
                tblHistDeudaDetalle.tIdTipoIdentificador,
                tblHistDeudaDetalle.nMontoCobrar
            from tblHistDeudaDetalle inner join vwUltimoArchivoEnviadoValidado
                on vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblHistDeudaDetalle.nIdInstitucion
                and vwUltimoArchivoEnviadoValidado.nPeriodo = tblHistDeudaDetalle.nPeriodo
                and vwUltimoArchivoEnviadoValidado.iCorrelativo = tblHistDeudaDetalle.iCorrelativo
                left outer join tblPeriodoMora 
                    on COALESCE(DATEDIFF(day, case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                    and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,case when ISDATE(tblHistDeudaDetalle.vcFechaPrimerImpago) = 1 then convert(date, tblHistDeudaDetalle.vcFechaPrimerImpago) else null end, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where vwUltimoArchivoEnviadoValidado.nPeriodo = @nPeriodo
                 and vwUltimoArchivoEnviadoValidado.iIdEstado = 15
                 and vwUltimoArchivoEnviadoValidado.tipoArchivo = 'AD'
            group by tblHistDeudaDetalle.nIdInstitucion,tblPeriodoMora.iIdPeriodoMora,tblHistDeudaDetalle.vcNumPagare,tblHistDeudaDetalle.vcIdentificadorDeudor,tblHistDeudaDetalle.tIdTipoIdentificador, tblHistDeudaDetalle.nMontoCobrar
            ) tblTabla1 left join
            (select 
                nIdCajaOrigen as nIdCajaOrigen,
                vcIdentificadorDeudor as DeudoresEncontrados,
                tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            from (select * from tblConsolidacionDetalle where tblConsolidacionDetalle.nPeriodo = @nPeriodo) as tblConsolidacionDetalle
                left outer join tblPeriodoMora 
                on COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) >= tblPeriodoMora.iLimiteInferior
                and (tblPeriodoMora.iLimiteSuperior = -1 or COALESCE(DATEDIFF(day,tblConsolidacionDetalle.dFechaPrimerImpago, @dFechaConsolidacion),0) < tblPeriodoMora.iLimiteSuperior) 
            where nPeriodo = @nPeriodo
            group by nIdCajaOrigen,tblPeriodoMora.iIdPeriodoMora,
                tblConsolidacionDetalle.vcNumPagare,
                tblConsolidacionDetalle.vcIdentificadorDeudor,
                tblConsolidacionDetalle.tIdTipoIdentificador
            )tblTabla2 
            on tblTabla1.nIdCajaOrigen = tblTabla2.nIdCajaOrigen
            and tblTabla1.iIdPeriodoMora = tblTabla2.iIdPeriodoMora
            and tblTabla1.vcIdentificadorDeudor = tblTabla2.vcIdentificadorDeudor
            and tblTabla1.tIdTipoIdentificador = tblTabla2.tIdTipoIdentificador
            and tblTabla1.vcNumPagare = tblTabla2.vcNumPagare
        WHERE DeudoresEncontrados is null
        group by tblTabla1.iIdPeriodoMora, tblTabla1.nIdCajaOrigen, tblTabla1.vcIdentificadorDeudor,tblTabla1.vcNumPagare

        COMMIT TRAN
        /*FIN Total Montos no encontrados */

        SET @iCodError = -3
        SET @vcMensajeControProc='RE: Finalizando'
        -- CONTROL DE PROCESO = FINALIZACION DE CONSOLIDACION DE DEUDA
        UPDATE tblControlProceso
        SET iIdEstado=24 ,vcDetalle='Generacion Indicadores Recaudacion Terminada Exitosamente',
        dFechaFin=GETDATE()
        WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@nPeriodo
    
        SET @iCodError = 0
        SET @vcMsjError = 'Generacion Indicadores Recaudacion Terminada Exitosamente'
    END TRY
    BEGIN CATCH
        SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
        UPDATE tblControlProceso
        SET iIdEstado=25 ,vcDetalle=@vcMensajeControProc+' ['+@vcMsjError+']',
        dFechaFin=GETDATE()
        WHERE nIdControlProceso=@iIdControlProceso and nPeriodo=@nPeriodo
		return
    END CATCH
  
END
GO
