SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spRespaldaDatosAHistorico]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spRespaldaDatosAHistorico] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    MSC
-- Create date: 24-06-2013
-- Description: Realiza el respaldo de información a tablas historicas para proceder a limpieza de tablas.
--              El proceso se puede retomar pues realiza eliminación de datos de manera transaccional.
-- =============================================
ALTER PROCEDURE [dbo].[spRespaldaDatosAHistorico]
@iRutUsuario int,   
  @iPeriodoaRespaldar int = 0,
  @vcTerminal varchar(30),
  @iCodError int = 0 out, 
  @vcMsjError varchar(100) = 'OK' out
AS
declare 
  @dFechaRegistro datetime, 
  @dfechaRegistro_1 datetime,
  @dfechaRegistro_2 datetime,
  @iFilasProcesadas int=0,
  @iTamanoBloqueEliminar int=10000,
  @biCantidadCiclos bigint=0,
  @iPeriodoActual int,
  @iPeriodoaRespaldar_1 int,
  @iPeriodoaRespaldar_2 int
BEGIN
  BEGIN TRY       
    exec dbo.spRegistraEventoAuditoria getdate,'4','I',@iRutUsuario ,@vcTerminal ,'EJECUTA RESPALDO DATOS HISTORICOS',@vcMsjError 
  
    select @iPeriodoActual =MAX (nperiodo)
    FROM [dbo].[tblPeriodo]
    
    IF @iPeriodoActual  is null
    begin
      set @iCodError = -1;
      set @vcMsjError = 'No hay periodos ingresados en tabla periodo';  
      return
    end

    --GRN --- Se calcula periodo - 1 y period - 2 
    select @iPeriodoaRespaldar_1 = SUBSTRING(CONVERT(varchar, dateadd(month,-1,convert(date,convert(varchar,@iPeriodoaRespaldar) + '01',112)),112),1,6);
    select @iPeriodoaRespaldar_2 = SUBSTRING(CONVERT(varchar, dateadd(month,-2,convert(date,convert(varchar,@iPeriodoaRespaldar) + '01',112)),112),1,6);
    
    select COUNT(nperiodo) from tblPeriodo where nPeriodo = @iPeriodoaRespaldar_1
    if @@ROWCOUNT = 0
    begin
      set @iCodError = -1;
      set @vcMsjError = 'No se encuentra el periodo de recaudacion (n-1)'; 
      return
    end
    select COUNT(nperiodo) from tblPeriodo where nPeriodo = @iPeriodoaRespaldar_2
    if @@ROWCOUNT = 0
    begin
      set @iCodError = -1;
      set @vcMsjError = 'No se encuentra el periodo de recaudacion (n-2)'; 
      return
    end
    --FIN GRN---
    SELECT @dfechaRegistro =max(dFechaRegistro)      
    FROM dbo.tblRegistroConsolidacion
    where nPeriodo=@iPeriodoaRespaldar
    and iIdEstado=27
    and vcTipoConsolidacion='CD'
    IF @dfechaRegistro is not null
    begin
    -- OK Procediendo a realizar respaldo tabla TBLAFILIADODETALLE
    --*********************************************************************   
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA DETALLE AFILIADO HISTORICO
      INSERT INTO tblHistAfiliadoDetalle
                      (nIdInstitucion, nPeriodo, dFechaRegistro, iCorrelativo, vcIdentificadorAfiliado, tIdTipoIdentificador, vcNombreAfiliado, tIdTipoAfiliado, nFechaAfiliacion, vcRutEmpresa, 
                      nRentaImponible, vbRentaImponible)
      SELECT     TOP (@iTamanoBloqueEliminar ) tblAfiliadoDetalle.nIdInstitucion, tblAfiliadoDetalle.nPeriodo, @dfechaRegistro , tblAfiliadoDetalle.iCorrelativo, 
                      tblAfiliadoDetalle.vcIdentificadorAfiliado, tblAfiliadoDetalle.tIdTipoIdentificador, tblAfiliadoDetalle.vcNombreAfiliado, tblAfiliadoDetalle.tIdTipoAfiliado, 
                      tblAfiliadoDetalle.nFechaAfiliacion, tblAfiliadoDetalle.vcRutEmpresa, tblAfiliadoDetalle.nRentaImponible, tblAfiliadoDetalle.vbRentaImponible
      FROM         tblAfiliadoDetalle INNER JOIN
                      tblAfiliadoCabecera ON tblAfiliadoDetalle.nIdInstitucion = tblAfiliadoCabecera.nIdInstitucion AND tblAfiliadoDetalle.nPeriodo = tblAfiliadoCabecera.nPeriodo AND 
                      tblAfiliadoDetalle.iCorrelativo = tblAfiliadoCabecera.iCorrelativo
      WHERE     (tblAfiliadoDetalle.nPeriodo = @iPeriodoaRespaldar) AND (tblAfiliadoCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblAfiliadoDetalle.nIdInstitucion, tblAfiliadoDetalle.nPeriodo, tblAfiliadoDetalle.iCorrelativo, tblAfiliadoDetalle.vcIdentificadorAfiliado, 
                      tblAfiliadoDetalle.tIdTipoIdentificador
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
      set @biCantidadCiclos=@biCantidadCiclos+1     
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar )
        tblAfiliadoDetalle.nIdInstitucion, tblAfiliadoDetalle.nPeriodo, tblAfiliadoDetalle.iCorrelativo, tblAfiliadoDetalle.vcIdentificadorAfiliado, tblAfiliadoDetalle.tIdTipoIdentificador,
		tblAfiliadoDetalle.vcRutEmpresa
      FROM tblAfiliadoDetalle INNER JOIN
                 tblAfiliadoCabecera ON tblAfiliadoDetalle.nIdInstitucion = tblAfiliadoCabecera.nIdInstitucion AND tblAfiliadoDetalle.nPeriodo = tblAfiliadoCabecera.nPeriodo AND
                 tblAfiliadoDetalle.iCorrelativo = tblAfiliadoCabecera.iCorrelativo
      WHERE (tblAfiliadoDetalle.nPeriodo = @iPeriodoaRespaldar) AND (tblAfiliadoCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblAfiliadoDetalle.nIdInstitucion, tblAfiliadoDetalle.nPeriodo, tblAfiliadoDetalle.iCorrelativo, tblAfiliadoDetalle.vcIdentificadorAfiliado,
                  tblAfiliadoDetalle.tIdTipoIdentificador
     )
      delete tad from tblAfiliadoDetalle AS tad
      inner join CTE on cte.nIdInstitucion=tad.nIdInstitucion
      and cte.nPeriodo=tad.nPeriodo
      and cte.iCorrelativo=tad.iCorrelativo
      and cte.vcIdentificadorAfiliado=tad.vcIdentificadorAfiliado
      and cte.tIdTipoIdentificador=tad.tIdTipoIdentificador
	  and cte.vcRutEmpresa=tad.vcRutEmpresa
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de afiliados';  
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end   
    -- Fin respaldo tabla TBLAFILIADODETALLE
    --*********************************************************************
      
    -- Procediendo a realizar respaldo tabla TBLAFILIADOERROR
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA AFILIADO ERROR
      INSERT INTO tblHistAfiliadoError
                      (nIdInstitucion, nPeriodo, dFechaRegistro, iCorrelativo, nNumRegistro, txCodigoError, vcRedDat)
      SELECT     TOP (@iTamanoBloqueEliminar ) tblAfiliadoError.nIdInstitucion, tblAfiliadoError.nPeriodo, @dFechaRegistro, 
      tblAfiliadoError.iCorrelativo, tblAfiliadoError.nNumRegistro, tblAfiliadoError.txCodigoError, tblAfiliadoError.vcRedDat
      FROM         tblAfiliadoError INNER JOIN
                      tblAfiliadoCabecera ON tblAfiliadoError.nIdInstitucion = tblAfiliadoCabecera.nIdInstitucion AND tblAfiliadoError.nPeriodo = tblAfiliadoCabecera.nPeriodo AND 
                      tblAfiliadoError.iCorrelativo = tblAfiliadoCabecera.iCorrelativo
      WHERE     (tblAfiliadoError.nPeriodo = @iPeriodoaRespaldar) AND (tblAfiliadoCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblAfiliadoError.nIdInstitucion, tblAfiliadoError.nPeriodo, tblAfiliadoError.iCorrelativo ,tblAfiliadoError.nNumRegistro
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
        
      set @biCantidadCiclos=@biCantidadCiclos+1
      
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar ) tblAfiliadoError.nIdInstitucion, tblAfiliadoError.nPeriodo, @dFechaRegistro fechaRegistro, 
        tblAfiliadoError.iCorrelativo, tblAfiliadoError.nNumRegistro
      FROM         tblAfiliadoError INNER JOIN
                      tblAfiliadoCabecera ON tblAfiliadoError.nIdInstitucion = tblAfiliadoCabecera.nIdInstitucion AND tblAfiliadoError.nPeriodo = tblAfiliadoCabecera.nPeriodo AND 
                      tblAfiliadoError.iCorrelativo = tblAfiliadoCabecera.iCorrelativo
      WHERE     (tblAfiliadoError.nPeriodo = @iPeriodoaRespaldar) AND (tblAfiliadoCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblAfiliadoError.nIdInstitucion, tblAfiliadoError.nPeriodo, tblAfiliadoError.iCorrelativo ,tblAfiliadoError.nNumRegistro
      )
      delete tae from tblAfiliadoError AS tae
      inner join CTE on cte.nIdInstitucion=tae.nIdInstitucion
      and cte.nPeriodo=tae.nPeriodo
      and cte.iCorrelativo=tae.iCorrelativo
      and cte.nNumRegistro=tae.nNumRegistro
      
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de error afiliados';  
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end 
    -- Fin respaldo tabla TBLAFILIADODETALLE
    --*********************************************************************

	-- Procediendo a realizar respaldo tabla tblDeudaDetalle
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA AFILIADO ERROR
      INSERT INTO tblHistDeudaDetalle
                      (nIdInstitucion, nPeriodo, dFechaRegistro, iCorrelativo, vcIdentificadorDeudor, tIdTipoIdentificador, vcNumPagare, tIdTipoAfiliado, vcFechaColocacion, 
                      vcFechaPrimerImpago, nCapitalInicial, nSaldoCapital, vcRutAval_1, vcRutAval_2, vcRutAval_3, vcTipoDeuda, nMontoCobrar, nMontoOfertaColocacion, 
                      vcEmplanillado)
      SELECT     TOP (@iTamanoBloqueEliminar ) tblDeudaDetalle.nIdInstitucion,tblDeudaDetalle.nPeriodo, @dFechaRegistro, tblDeudaDetalle.iCorrelativo, vcIdentificadorDeudor, tIdTipoIdentificador, vcNumPagare, tIdTipoAfiliado, vcFechaColocacion, 
                      vcFechaPrimerImpago, nCapitalInicial, nSaldoCapital, vcRutAval_1, vcRutAval_2, vcRutAval_3, vcTipoDeuda, nMontoCobrar, nMontoOfertaColocacion, 
                      vcEmplanillado
      FROM      tblDeudaDetalle INNER JOIN
                      tblDeudaCabecera ON tblDeudaDetalle.nIdInstitucion = tblDeudaCabecera.nIdInstitucion AND tblDeudaDetalle.nPeriodo = tblDeudaCabecera.nPeriodo AND 
                      tblDeudaDetalle.iCorrelativo = tblDeudaCabecera.iCorrelativo
      WHERE     (tblDeudaDetalle.nPeriodo = @iPeriodoaRespaldar) AND (tblDeudaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblDeudaDetalle.nIdInstitucion, tblDeudaDetalle.nPeriodo, tblDeudaDetalle.iCorrelativo ,tblDeudaDetalle.vcNumPagare
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
        
      set @biCantidadCiclos=@biCantidadCiclos+1
      
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar ) tblDeudaDetalle.nIdInstitucion,tblDeudaDetalle.nPeriodo, tblDeudaDetalle.iCorrelativo, vcNumPagare
      FROM      tblDeudaDetalle INNER JOIN
                      tblDeudaCabecera ON tblDeudaDetalle.nIdInstitucion = tblDeudaCabecera.nIdInstitucion AND tblDeudaDetalle.nPeriodo = tblDeudaCabecera.nPeriodo AND 
                      tblDeudaDetalle.iCorrelativo = tblDeudaCabecera.iCorrelativo
      WHERE     (tblDeudaDetalle.nPeriodo = @iPeriodoaRespaldar) AND (tblDeudaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblDeudaDetalle.nIdInstitucion, tblDeudaDetalle.nPeriodo, tblDeudaDetalle.iCorrelativo ,tblDeudaDetalle.vcNumPagare
      )
      delete tdd from tblDeudaDetalle AS tdd
      inner join CTE on cte.nIdInstitucion=tdd.nIdInstitucion
      and cte.nPeriodo=tdd.nPeriodo
      and cte.iCorrelativo=tdd.iCorrelativo
      and cte.vcNumPagare=tdd.vcNumPagare
      
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de detalle de deuda'; 
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end 
    -- Fin respaldo tabla tblDeudaDetalle
    --*********************************************************************
        
    -- Procediendo a realizar respaldo tabla tblDeudaError
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA AFILIADO ERROR
      INSERT INTO tblHistDeudaError
                      ( nInstitucion, nPeriodo, dFechaRegistro, iCorrelativo, nNumRegistro, txCodigoError, vcRedDat)
      SELECT     TOP (@iTamanoBloqueEliminar )  nInstitucion, tblDeudaError.nPeriodo, @dFechaRegistro, tblDeudaError.iCorrelativo, nNumRegistro, txCodigoError, vcRedDat
      FROM      tblDeudaError INNER JOIN
                      tblDeudaCabecera ON tblDeudaError.nInstitucion = tblDeudaCabecera.nIdInstitucion AND tblDeudaError.nPeriodo = tblDeudaCabecera.nPeriodo AND 
                      tblDeudaError.iCorrelativo = tblDeudaCabecera.iCorrelativo
      WHERE     (tblDeudaError.nPeriodo = @iPeriodoaRespaldar) AND (tblDeudaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblDeudaError.nInstitucion, tblDeudaError.nPeriodo, tblDeudaError.iCorrelativo ,tblDeudaError.nNumRegistro
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
        
      set @biCantidadCiclos=@biCantidadCiclos+1
      
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar )  nInstitucion, tblDeudaError.nPeriodo, @dFechaRegistro dFechaRegistro, tblDeudaError.iCorrelativo, nNumRegistro
      FROM      tblDeudaError INNER JOIN
                      tblDeudaCabecera ON tblDeudaError.nInstitucion = tblDeudaCabecera.nIdInstitucion AND tblDeudaError.nPeriodo = tblDeudaCabecera.nPeriodo AND 
                      tblDeudaError.iCorrelativo = tblDeudaCabecera.iCorrelativo
      WHERE     (tblDeudaError.nPeriodo = @iPeriodoaRespaldar) AND (tblDeudaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblDeudaError.nInstitucion, tblDeudaError.nPeriodo, tblDeudaError.iCorrelativo ,tblDeudaError.nNumRegistro
      )
      delete tde from tblDeudaError AS tde
      inner join CTE on cte.nInstitucion=tde.nInstitucion
      and cte.nPeriodo=tde.nPeriodo
      and cte.iCorrelativo=tde.iCorrelativo
      and cte.nNumRegistro=tde.nNumRegistro
      
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de errores de deuda'; 
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end 
    -- Fin respaldo tabla tblDeudaError
    --*********************************************************************
	end
    
    SELECT @dfechaRegistro_1 =max(dFechaRegistro)      
    FROM dbo.tblRegistroConsolidacion
    where nPeriodo=@iPeriodoaRespaldar_1
    and iIdEstado=27
    and vcTipoConsolidacion='CC'
    IF @dfechaRegistro_1 is not null
    begin
       -- Procediendo a realizar respaldo tabla TBLCARTERACOMPRADADETALLE
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA DETALLE AFILIADO HISTORICO
      INSERT INTO tblHistCarteraCompradaDetalle
                 (nIdInstitucion, nPeriodo,dFechaRegistro,iCorrelativo,nIdCajaOrigen,vcNumPagare,vcRutEmpresa,vcIdentificadorDeudor,
                 tIdTipoIdentificador,vcNombreDeudor,tIdTipoAfiliado,vcRutAval,cSujetoDescuento,nMontoPagado,vcFechaPago,vcTipoDeuda)
      SELECT     TOP (@iTamanoBloqueEliminar ) tblCarteraCompradaDetalle.nIdInstitucion, tblCarteraCompradaDetalle.nPeriodo,@dfechaRegistro_1,tblCarteraCompradaDetalle.iCorrelativo,tblCarteraCompradaDetalle.nIdCajaOrigen,tblCarteraCompradaDetalle.vcNumPagare,tblCarteraCompradaDetalle.vcRutEmpresa,tblCarteraCompradaDetalle.vcIdentificadorDeudor,
                 tblCarteraCompradaDetalle.tIdTipoIdentificador,tblCarteraCompradaDetalle.vcNombreDeudor,tblCarteraCompradaDetalle.tIdTipoAfiliado,tblCarteraCompradaDetalle.vcRutAval,tblCarteraCompradaDetalle.cSujetoDescuento,tblCarteraCompradaDetalle.nMontoPagado,tblCarteraCompradaDetalle.vcFechaPago,
				 tblCarteraCompradaDetalle.vcTipoDeuda
      FROM       tblCarteraCompradaDetalle INNER JOIN
                 tblCarteraCompradaCabecera ON tblCarteraCompradaDetalle .nIdInstitucion = tblCarteraCompradaCabecera.nIdInstitucion AND tblCarteraCompradaDetalle .nPeriodo = tblCarteraCompradaCabecera.nPeriodo AND 
                 tblCarteraCompradaDetalle .iCorrelativo = tblCarteraCompradaCabecera.iCorrelativo
      WHERE     (tblCarteraCompradaDetalle.nPeriodo = @iPeriodoaRespaldar_1) AND (tblCarteraCompradaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblCarteraCompradaDetalle.nIdInstitucion, tblCarteraCompradaDetalle.nPeriodo, tblCarteraCompradaDetalle.iCorrelativo, tblCarteraCompradaDetalle.vcIdentificadorDeudor, 
                      tblCarteraCompradaDetalle.tIdTipoIdentificador
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
      set @biCantidadCiclos=@biCantidadCiclos+1     
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar ) 
        tblCarteraCompradaDetalle.nIdInstitucion, tblCarteraCompradaDetalle.nPeriodo, tblCarteraCompradaDetalle.iCorrelativo, tblCarteraCompradaDetalle.vcIdentificadorDeudor, tblCarteraCompradaDetalle.tIdTipoIdentificador
      FROM tblCarteraCompradaDetalle INNER JOIN
                 tblCarteraCompradaCabecera ON tblCarteraCompradaDetalle.nIdInstitucion = tblCarteraCompradaCabecera.nIdInstitucion AND tblCarteraCompradaDetalle.nPeriodo = tblCarteraCompradaCabecera.nPeriodo AND 
                 tblCarteraCompradaDetalle.iCorrelativo = tblCarteraCompradaCabecera.iCorrelativo
      WHERE (tblCarteraCompradaDetalle.nPeriodo = @iPeriodoaRespaldar_1) AND (tblCarteraCompradaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblCarteraCompradaDetalle.nIdInstitucion, tblCarteraCompradaDetalle.nPeriodo, tblCarteraCompradaDetalle.iCorrelativo, tblCarteraCompradaDetalle.vcIdentificadorDeudor, 
                  tblCarteraCompradaDetalle.tIdTipoIdentificador
      )
      delete tad from tblCarteraCompradaDetalle AS tad
      inner join CTE on cte.nIdInstitucion=tad.nIdInstitucion
      and cte.nPeriodo=tad.nPeriodo
      and cte.iCorrelativo=tad.iCorrelativo
      and cte.vcIdentificadorDeudor=tad.vcIdentificadorDeudor
      and cte.tIdTipoIdentificador=tad.tIdTipoIdentificador
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de afiliados';  
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end   
    -- Fin respaldo tabla TBLCARTERACOMPRADADETALLE
    --*********************************************************************
    
    -- Procediendo a realizar respaldo tabla tblCarteraCompradaError
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA DETALLE COMPRA CARTERA HISTORICO
      INSERT INTO tblHistCarteraCompradaError
                 (nIdInstitucion,nPeriodo,dFechaRegistro,iCorrelativo,nNumRegistro,txCodigoError,vcRedDat)
      SELECT     TOP (@iTamanoBloqueEliminar)  tblCarteraCompradaError.nIdInstitucion , tblCarteraCompradaError.nPeriodo,@dfechaRegistro_1,tblCarteraCompradaError.iCorrelativo,tblCarteraCompradaError.nNumRegistro,tblCarteraCompradaError.txCodigoError,tblCarteraCompradaError.vcRedDat
     FROM         tblCarteraCompradaError INNER JOIN
                      tblCarteraCompradaCabecera ON tblCarteraCompradaError.nIdInstitucion = tblCarteraCompradaCabecera.nIdInstitucion AND tblCarteraCompradaError.nPeriodo = tblCarteraCompradaCabecera.nPeriodo AND 
                      tblCarteraCompradaError.iCorrelativo = tblCarteraCompradaCabecera.iCorrelativo
      WHERE  tblCarteraCompradaError.nPeriodo = @iPeriodoaRespaldar_1 AND tblCarteraCompradaCabecera.iIdEstado = 15 --ESTADO VALIDADO
      ORDER BY tblCarteraCompradaError.nIdInstitucion, tblCarteraCompradaError.nPeriodo, tblCarteraCompradaError.iCorrelativo
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
      set @biCantidadCiclos=@biCantidadCiclos+1     
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar ) 
        tblCarteraCompradaError.nIdInstitucion, tblCarteraCompradaError.nPeriodo, tblCarteraCompradaError.iCorrelativo
      FROM tblCarteraCompradaError INNER JOIN
                 tblCarteraCompradaCabecera ON tblCarteraCompradaError.nIdInstitucion = tblCarteraCompradaCabecera.nIdInstitucion AND tblCarteraCompradaError.nPeriodo = tblCarteraCompradaCabecera.nPeriodo AND 
                 tblCarteraCompradaError.iCorrelativo = tblCarteraCompradaCabecera.iCorrelativo
      WHERE (tblCarteraCompradaError.nPeriodo = @iPeriodoaRespaldar_1) AND (tblCarteraCompradaCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblCarteraCompradaError.nIdInstitucion, tblCarteraCompradaError.nPeriodo, tblCarteraCompradaError.iCorrelativo
      )
      delete tad from tblCarteraCompradaError AS tad
      inner join CTE on cte.nIdInstitucion=tad.nIdInstitucion
      and cte.nPeriodo=tad.nPeriodo
      and cte.iCorrelativo=tad.iCorrelativo
      
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de afiliados';  
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end   
    -- Fin respaldo tabla tblCarteraCompradaError
    --*********************************************************************
    end

    SELECT @dfechaRegistro_2 =max(dFechaRegistro)      
    FROM dbo.tblRegistroConsolidacion
    where nPeriodo=@iPeriodoaRespaldar_2
    and iIdEstado=27
    and vcTipoConsolidacion='CR'
    IF @dfechaRegistro_2 is not null
    begin
    -- Procediendo a realizar respaldo tabla tblRecaudacionDetalle
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA AFILIADO ERROR
      INSERT INTO tblHistRecaudacionDetalle
                      (nIdInstitucion, nPeriodo, dFechaRegistro, iCorrelativo, nIdCajaOrigen, vcNumPagare, vcRutEmpresa, vcIdentificadorDeudor, tIdTipoIdentificador, 
                      vcNombreDeudor, tIdTipoAfiliado, vcRutAval, cSujetoDescuento, nMontoCobrar, nMontoPagado, vcFechaPago)
      SELECT     TOP (@iTamanoBloqueEliminar ) tblRecaudacionDetalle.nIdInstitucion, tblRecaudacionDetalle.nPeriodo, @dFechaRegistro_2, tblRecaudacionDetalle.iCorrelativo, nIdCajaOrigen, vcNumPagare, vcRutEmpresa, vcIdentificadorDeudor, tIdTipoIdentificador, 
                      vcNombreDeudor, tIdTipoAfiliado, vcRutAval, cSujetoDescuento, nMontoCobrar, nMontoPagado, vcFechaPago
      FROM      tblRecaudacionDetalle INNER JOIN
                      tblRecaudacionCabecera ON tblRecaudacionDetalle.nIdInstitucion = tblRecaudacionCabecera.nIdInstitucion AND tblRecaudacionDetalle.nPeriodo = tblRecaudacionCabecera.nPeriodo AND 
                      tblRecaudacionDetalle.iCorrelativo = tblRecaudacionCabecera.iCorrelativo
      WHERE     (tblRecaudacionDetalle.nPeriodo = @iPeriodoaRespaldar_2) AND (tblRecaudacionCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblRecaudacionDetalle.nIdInstitucion, tblRecaudacionDetalle.nPeriodo, tblRecaudacionDetalle.iCorrelativo ,tblRecaudacionDetalle.nIdCajaOrigen, tblRecaudacionDetalle.vcNumPagare
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
        
      set @biCantidadCiclos=@biCantidadCiclos+1
      
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar ) tblRecaudacionDetalle.nIdInstitucion, tblRecaudacionDetalle.nPeriodo, @dFechaRegistro_2 dFechaRegistro, tblRecaudacionDetalle.iCorrelativo, nIdCajaOrigen, vcNumPagare, vcRutEmpresa, vcIdentificadorDeudor, tIdTipoIdentificador, 
                      vcNombreDeudor, tIdTipoAfiliado, vcRutAval, cSujetoDescuento, nMontoCobrar, nMontoPagado, vcFechaPago
      FROM      tblRecaudacionDetalle INNER JOIN
                      tblRecaudacionCabecera ON tblRecaudacionDetalle.nIdInstitucion = tblRecaudacionCabecera.nIdInstitucion AND tblRecaudacionDetalle.nPeriodo = tblRecaudacionCabecera.nPeriodo AND 
                      tblRecaudacionDetalle.iCorrelativo = tblRecaudacionCabecera.iCorrelativo
      WHERE     (tblRecaudacionDetalle.nPeriodo = @iPeriodoaRespaldar_2) AND (tblRecaudacionCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblRecaudacionDetalle.nIdInstitucion, tblRecaudacionDetalle.nPeriodo, tblRecaudacionDetalle.iCorrelativo ,tblRecaudacionDetalle.nIdCajaOrigen, tblRecaudacionDetalle.vcNumPagare
      )
      delete trd from tblRecaudacionDetalle AS trd
      inner join CTE on cte.nIdInstitucion=trd.nIdInstitucion
      and cte.nPeriodo=trd.nPeriodo
      and cte.iCorrelativo=trd.iCorrelativo
      and cte.nIdCajaOrigen=trd.nIdCajaOrigen
      and cte.vcNumPagare=trd.vcNumPagare
      
      
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de detalle recaudacion';  
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end 
    -- Fin respaldo tabla tblRecaudacionDetalle
    --*********************************************************************
    
    -- Procediendo a realizar respaldo tabla tblRecaudacionError
    --*********************************************************************
    while (1=1)
    begin
    Begin TRAN  T1    
      --INSERTA LOS REGISTROS DE DETALLE PARA ARCHIVOS EN ESTADO VALIDADOS EN LA TABLA AFILIADO ERROR
      INSERT INTO tblHistRecaudacionError
                      (nIdInstitucion, nPeriodo, dFechaRegistro, iCorrelativo, nNumRegistro, txCodigoError, vcRedDat)
      SELECT     TOP (@iTamanoBloqueEliminar ) tblRecaudacionError.nIdInstitucion, tblRecaudacionError.nPeriodo, @dFechaRegistro_2, tblRecaudacionError.iCorrelativo, nNumRegistro, txCodigoError, vcRedDat
      FROM      tblRecaudacionError INNER JOIN
                      tblRecaudacionCabecera ON tblRecaudacionError.nIdInstitucion = tblRecaudacionCabecera.nIdInstitucion AND tblRecaudacionError.nPeriodo = tblRecaudacionCabecera.nPeriodo AND 
                      tblRecaudacionError.iCorrelativo = tblRecaudacionCabecera.iCorrelativo
      WHERE     (tblRecaudacionError.nPeriodo = @iPeriodoaRespaldar_2) AND (tblRecaudacionCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblRecaudacionError.nIdInstitucion, tblRecaudacionError.nPeriodo, tblRecaudacionError.iCorrelativo ,tblRecaudacionError.nNumRegistro
      set @iFilasProcesadas =@@ROWCOUNT
      if @iFilasProcesadas =0 
        begin
          COMMIT TRAN T1
          break
        end
        
      set @biCantidadCiclos=@biCantidadCiclos+1
      
      -- TABLA TEMPORAL CON 1000 registros
      ;WITH CTE AS
      (
      SELECT     TOP (@iTamanoBloqueEliminar ) tblRecaudacionError.nIdInstitucion, tblRecaudacionError.nPeriodo, @dFechaRegistro_2 dFechaRegistro, tblRecaudacionError.iCorrelativo, nNumRegistro, txCodigoError, vcRedDat
      FROM      tblRecaudacionError INNER JOIN
                      tblRecaudacionCabecera ON tblRecaudacionError.nIdInstitucion = tblRecaudacionCabecera.nIdInstitucion AND tblRecaudacionError.nPeriodo = tblRecaudacionCabecera.nPeriodo AND 
                      tblRecaudacionError.iCorrelativo = tblRecaudacionCabecera.iCorrelativo
      WHERE     (tblRecaudacionError.nPeriodo = @iPeriodoaRespaldar_2) AND (tblRecaudacionCabecera.iIdEstado = 15) --ESTADO VALIDADO
      ORDER BY tblRecaudacionError.nIdInstitucion, tblRecaudacionError.nPeriodo, tblRecaudacionError.iCorrelativo ,tblRecaudacionError.nNumRegistro
      )
      delete tre from tblRecaudacionError AS tre
      inner join CTE on cte.nIdInstitucion=tre.nIdInstitucion
      and cte.nPeriodo=tre.nPeriodo
      and cte.iCorrelativo=tre.iCorrelativo
      and cte.nNumRegistro=tre.nNumRegistro
            
      
      
      if @@ROWCOUNT<>@iFilasProcesadas
      begin
      --INCONSISTENCIA ENTRE FILAS MOVIDAS AL HISTORICO Y FILAS ELIMINADAS, SE ABORTA PROCESO
        rollback tran T1  
        set @iCodError = -1;
        set @vcMsjError = 'Fallo por posible eliminacion inconsistente de registros de errores recaudacion';  
        return        
      end     
    -- FIN TRANSACCION    
    COMMIT TRAN T1
    end     
    -- Fin respaldo tabla tblRecaudacionError
    --*********************************************************************
    end

    set @iCodError = 0;
    set @vcMsjError = 'Respaldo de datos al historico realizado exitosamente';  
    return  
  END TRY
  BEGIN CATCH
    IF @@TRANCOUNT > 0
      begin
        rollback tran T1 -- ROLLBACK
      end
    
    SET @iCodError = -1;
    SELECT @vcMsjError = ERROR_NUMBER() + ' ' + ERROR_MESSAGE();
    return
  END CATCH
  
END
GO
