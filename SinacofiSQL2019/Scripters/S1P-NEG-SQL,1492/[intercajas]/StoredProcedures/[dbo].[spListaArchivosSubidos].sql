SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spListaArchivosSubidos]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spListaArchivosSubidos] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    <MSC,,Mauricio Soto>
-- Create date: <21/06/2013>
-- Description: <Obtiene lista de archivos en proceso desde cabeceras de afiliados, deudas y recaudaciones para el period0 indicado e institucion.
-- GRN	31-07-2014 - Se implemento busqueda en archivos Historicos
-- =============================================
ALTER PROCEDURE [dbo].[spListaArchivosSubidos]
@iPeriodo int, 
  @iInstitucion int,
  @vcTipoArchivos varchar(2) --Dependiendo del tipo de archivos se listan TODOS o SOLO LOS DEL CRITERIO
AS
DECLARE
  @iAA_Historica int,
  @iAD_Historica int,
  @iAR_Historica int,
  @iCC_Historica int,
  @iCD int,
  @iCR int,
  @iCC int,
  @dfechaRegistro as datetime,
  @nPeriodoActual numeric(6,0),
  @nDifPeriodo int
BEGIN
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  SET NOCOUNT ON;
    select @nPeriodoActual=MAX(nPeriodo) from tblPeriodo
    select @nDifPeriodo=((convert(int,@nPeriodoActual)/100)-(@iPeriodo/100))*12 + ((convert(int,@nPeriodoActual)%100)-(@iPeriodo%100))
    set @iAA_Historica =0
	set @iAD_Historica =0
	set @iAR_Historica =0
	set @iCC_Historica =0
	set @iCD = 0
	set @iCR = 0
	set @iCC = 0
    
    if @nDifPeriodo > 0
    begin
		set @iAA_Historica =1
		set @iAD_Historica =1
		
		set @dfechaRegistro = null
		SELECT @dfechaRegistro =max(dFechaRegistro)      
		FROM dbo.tblRegistroConsolidacion
		where nPeriodo=@iPeriodo
		and iIdEstado=27
		and vcTipoConsolidacion='CD'
		
		if @dfechaRegistro is not null
			set @iCD = 1
    end
    if @nDifPeriodo > 2
    begin
		set @iAR_Historica = 1
		
		set @dfechaRegistro = null
		SELECT @dfechaRegistro =max(dFechaRegistro)      
		FROM dbo.tblRegistroConsolidacion
		where nPeriodo=@iPeriodo
		and iIdEstado=27
		and vcTipoConsolidacion='CR'
		
		if @dfechaRegistro is not null
			set @iCR = 1
    end
    if @nDifPeriodo > 1
    begin
		set @iCC_Historica = 1
		
		set @dfechaRegistro = null
		SELECT @dfechaRegistro =max(dFechaRegistro)      
		FROM dbo.tblRegistroConsolidacion
		where nPeriodo=@iPeriodo
		and iIdEstado=27
		and vcTipoConsolidacion='CC'
		
		if @dfechaRegistro is not null
			set @iCC = 1
    end
    
    select * from (
    SELECT     'AFILIADO' AS tipo_archivo,'AA' as tipArch, tblAfiliadoCabecera.nPeriodo as periodo ,tblAfiliadoCabecera.iCorrelativo AS Correlativo, tblAfiliadoCabecera.vcNombreArchivo, tblAfiliadoCabecera.dFechaIng, 
                      tblAfiliadoCabecera.nTotalRegistros, tblAfiliadoCabecera.iRutUsuarioEnv, tblAfiliadoCabecera.iIdEstado, tblEstado.vcEstado, tblAfiliadoCabecera.nIdInstitucion, 
                      COUNT(tblAfiliadoError.nNumRegistro) AS nErrores, 
                      tblAfiliadoCabecera.nTotalRegistros - COUNT(tblAfiliadoError.nNumRegistro) AS exitosos, 
					  case when tblAfiliadoCabecera.nTotalRegistros > 0 then 1.0 * COUNT(tblAfiliadoError.nNumRegistro) / tblAfiliadoCabecera.nTotalRegistros * 1.0 else 0  end AS porcentaje_error,tblAfiliadoCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblAfiliadoCabecera on tblInstitucion.nIdInstitucion=tblAfiliadoCabecera.nIdInstitucion
           INNER JOIN
                      tblEstado ON tblAfiliadoCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblAfiliadoError ON tblAfiliadoCabecera.nIdInstitucion = tblAfiliadoError.nIdInstitucion AND tblAfiliadoCabecera.nPeriodo = tblAfiliadoError.nPeriodo AND 
                      tblAfiliadoCabecera.iCorrelativo = tblAfiliadoError.iCorrelativo
    WHERE     ((tblAfiliadoCabecera.nPeriodo = @iPeriodo) AND (@vcTipoArchivos = 'AA' OR
                      @vcTipoArchivos = 'T') AND (tblAfiliadoCabecera.nIdInstitucion = @iInstitucion) OR
                      (tblAfiliadoCabecera.nPeriodo = @iPeriodo) AND (@vcTipoArchivos = 'AA' OR
                      @vcTipoArchivos = 'T') AND (@iInstitucion = 0)
                      ) and @iAA_Historica = 0
    GROUP BY tblAfiliadoCabecera.iCorrelativo, tblAfiliadoCabecera.nPeriodo ,tblAfiliadoCabecera.vcNombreArchivo, tblAfiliadoCabecera.dFechaIng, tblAfiliadoCabecera.nTotalRegistros, 
                      tblAfiliadoCabecera.iRutUsuarioEnv, tblAfiliadoCabecera.iIdEstado, tblEstado.vcEstado, tblAfiliadoCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblAfiliadoCabecera.vcLinkError
  union all
  SELECT     'AFILIADO' AS tipo_archivo,'AA' as tipArch, tblAfiliadoCabecera.nPeriodo as periodo ,tblAfiliadoCabecera.iCorrelativo AS Correlativo, tblAfiliadoCabecera.vcNombreArchivo, tblAfiliadoCabecera.dFechaIng, 
                      tblAfiliadoCabecera.nTotalRegistros, tblAfiliadoCabecera.iRutUsuarioEnv, tblAfiliadoCabecera.iIdEstado, tblEstado.vcEstado, tblAfiliadoCabecera.nIdInstitucion, 
                      COUNT(tblHistAfiliadoError.nNumRegistro) AS nErrores, 
                      tblAfiliadoCabecera.nTotalRegistros - COUNT(tblHistAfiliadoError.nNumRegistro) AS exitosos, 
					  case when tblAfiliadoCabecera.nTotalRegistros > 0 then 1.0 * COUNT(tblHistAfiliadoError.nNumRegistro) / tblAfiliadoCabecera.nTotalRegistros * 1.0 else 0  end AS porcentaje_error,tblAfiliadoCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblAfiliadoCabecera on tblInstitucion.nIdInstitucion=tblAfiliadoCabecera.nIdInstitucion
           INNER JOIN
                      tblEstado ON tblAfiliadoCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblHistAfiliadoError ON tblAfiliadoCabecera.nIdInstitucion = tblHistAfiliadoError.nIdInstitucion AND tblAfiliadoCabecera.nPeriodo = tblHistAfiliadoError.nPeriodo AND 
                      tblAfiliadoCabecera.iCorrelativo = tblHistAfiliadoError.iCorrelativo
			inner join vwUltimoArchivoEnviadoValidado 
				ON vwUltimoArchivoEnviadoValidado.tipoArchivo='AA' and vwUltimoArchivoEnviadoValidado.nPeriodo = tblAfiliadoCabecera.nPeriodo
				and vwUltimoArchivoEnviadoValidado.nIdInstitucion = tblAfiliadoCabecera.nIdInstitucion and vwUltimoArchivoEnviadoValidado.iCorrelativo=tblAfiliadoCabecera.iCorrelativo
    WHERE     ((tblAfiliadoCabecera.nPeriodo = @iPeriodo) AND (@vcTipoArchivos = 'AA' OR
                      @vcTipoArchivos = 'T') AND (tblAfiliadoCabecera.nIdInstitucion = @iInstitucion) OR
                      (tblAfiliadoCabecera.nPeriodo = @iPeriodo) AND (@vcTipoArchivos = 'AA' OR
                      @vcTipoArchivos = 'T') AND (@iInstitucion = 0)
                      ) and @iAA_Historica = 1 and @iCD = 1
    GROUP BY tblAfiliadoCabecera.iCorrelativo, tblAfiliadoCabecera.nPeriodo ,tblAfiliadoCabecera.vcNombreArchivo, tblAfiliadoCabecera.dFechaIng, tblAfiliadoCabecera.nTotalRegistros, 
                      tblAfiliadoCabecera.iRutUsuarioEnv, tblAfiliadoCabecera.iIdEstado, tblEstado.vcEstado, tblAfiliadoCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblAfiliadoCabecera.vcLinkError
  union all
    SELECT     'DEUDA' AS tipo_archivo,'AD' as tipArch,tblDeudaCabecera.nPeriodo as periodo , tblDeudaCabecera.iCorrelativo AS Correlativo, tblDeudaCabecera.vcNombreArchivo, tblDeudaCabecera.dFechaIng, 
                      tblDeudaCabecera.nTotalReg, tblDeudaCabecera.iRutUsuarioEnv, tblDeudaCabecera.iIdEstado, tblEstado.vcEstado, tblDeudaCabecera.nIdInstitucion, 
                      COUNT(tblDeudaError.nNumRegistro) AS nErrores, 
                      tblDeudaCabecera.nTotalReg - COUNT(tblDeudaError.nNumRegistro) AS exitosos, 
					  case when tblDeudaCabecera.nTotalReg > 0 then 1.0 * COUNT(tblDeudaError.nNumRegistro) / tblDeudaCabecera.nTotalReg else 0 end  AS porcentaje_error ,tblDeudaCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblDeudaCabecera  on tblInstitucion.nIdInstitucion=tblDeudaCabecera.nIdInstitucion
            INNER JOIN
                      tblEstado ON tblDeudaCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblDeudaError ON tblDeudaCabecera.nIdInstitucion = tblDeudaError.nInstitucion AND tblDeudaCabecera.nPeriodo = tblDeudaError.nPeriodo AND 
                      tblDeudaCabecera.iCorrelativo = tblDeudaError.iCorrelativo
    WHERE     ((@vcTipoArchivos = 'AD' OR
                      @vcTipoArchivos = 'T') AND (tblDeudaCabecera.nPeriodo = @iPeriodo) AND (tblDeudaCabecera.nIdInstitucion = @iInstitucion) OR
                      (@vcTipoArchivos = 'AD' OR
                      @vcTipoArchivos = 'T') AND (@iInstitucion = 0) AND (tblDeudaCabecera.nPeriodo = @iPeriodo)
                      ) and @iAD_Historica = 0
    GROUP BY tblDeudaCabecera.iCorrelativo,tblDeudaCabecera.nPeriodo , tblDeudaCabecera.vcNombreArchivo, tblDeudaCabecera.dFechaIng, tblDeudaCabecera.nTotalReg, 
                      tblDeudaCabecera.iRutUsuarioEnv, tblDeudaCabecera.iIdEstado, tblEstado.vcEstado, tblDeudaCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblDeudaCabecera.vcLinkError
  union all
    SELECT     'DEUDA' AS tipo_archivo,'AD' as tipArch,tblDeudaCabecera.nPeriodo as periodo , tblDeudaCabecera.iCorrelativo AS Correlativo, tblDeudaCabecera.vcNombreArchivo, tblDeudaCabecera.dFechaIng, 
                      tblDeudaCabecera.nTotalReg, tblDeudaCabecera.iRutUsuarioEnv, tblDeudaCabecera.iIdEstado, tblEstado.vcEstado, tblDeudaCabecera.nIdInstitucion, 
                      COUNT(tblHistDeudaError.nNumRegistro) AS nErrores, 
                      tblDeudaCabecera.nTotalReg - COUNT(tblHistDeudaError.nNumRegistro) AS exitosos, 
					  case when tblDeudaCabecera.nTotalReg > 0 then 1.0 * COUNT(tblHistDeudaError.nNumRegistro) / tblDeudaCabecera.nTotalReg else 0 end  AS porcentaje_error ,tblDeudaCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblDeudaCabecera  on tblInstitucion.nIdInstitucion=tblDeudaCabecera.nIdInstitucion
            INNER JOIN
                      tblEstado ON tblDeudaCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblHistDeudaError ON tblDeudaCabecera.nIdInstitucion = tblHistDeudaError.nInstitucion AND tblDeudaCabecera.nPeriodo = tblHistDeudaError.nPeriodo AND 
                      tblDeudaCabecera.iCorrelativo = tblHistDeudaError.iCorrelativo
			inner join vwUltimoArchivoEnviadoValidado 
				ON vwUltimoArchivoEnviadoValidado.tipoArchivo='AD' and vwUltimoArchivoEnviadoValidado.nPeriodo = tblDeudaCabecera.nPeriodo
				and vwUltimoArchivoEnviadoValidado.nIdInstitucion=tblDeudaCabecera.nIdInstitucion and vwUltimoArchivoEnviadoValidado.iCorrelativo=tblDeudaCabecera.iCorrelativo
    WHERE     ((@vcTipoArchivos = 'AD' OR
                      @vcTipoArchivos = 'T') AND (tblDeudaCabecera.nPeriodo = @iPeriodo) AND (tblDeudaCabecera.nIdInstitucion = @iInstitucion) OR
                      (@vcTipoArchivos = 'AD' OR
                      @vcTipoArchivos = 'T') AND (@iInstitucion = 0) AND (tblDeudaCabecera.nPeriodo = @iPeriodo)
                      ) and @iAD_Historica = 1 and @iCD = 1
    GROUP BY tblDeudaCabecera.iCorrelativo,tblDeudaCabecera.nPeriodo , tblDeudaCabecera.vcNombreArchivo, tblDeudaCabecera.dFechaIng, tblDeudaCabecera.nTotalReg, 
                      tblDeudaCabecera.iRutUsuarioEnv, tblDeudaCabecera.iIdEstado, tblEstado.vcEstado, tblDeudaCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblDeudaCabecera.vcLinkError
  union all
    SELECT     'RECAUDACIÓN' AS tipo_archivo,'AR' as tipArch,tblRecaudacionCabecera.nPeriodo as periodo, tblRecaudacionCabecera.iCorrelativo AS Correlativo, tblRecaudacionCabecera.vcNombreArchivo, 
                      tblRecaudacionCabecera.dFechaIngreso, tblRecaudacionCabecera.nTotalRegistros, tblRecaudacionCabecera.iRutUsuarioEnv, tblRecaudacionCabecera.iIdEstado, 
                      tblEstado.vcEstado, tblRecaudacionCabecera.nIdInstitucion, COUNT(tblRecaudacionError.nNumRegistro) AS nErrores, 
                      tblRecaudacionCabecera.nTotalRegistros - COUNT(tblRecaudacionError.nNumRegistro) AS exitosos,
					  case when tblRecaudacionCabecera.nTotalRegistros > 0 then 1.0 *  COUNT(tblRecaudacionError.nNumRegistro) / tblRecaudacionCabecera.nTotalRegistros else 0 end  AS porcentaje_error,tblRecaudacionCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblRecaudacionCabecera   on tblInstitucion.nIdInstitucion=tblRecaudacionCabecera.nIdInstitucion
            INNER JOIN    
                      tblEstado ON tblRecaudacionCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblRecaudacionError ON tblRecaudacionCabecera.nIdInstitucion = tblRecaudacionError.nIdInstitucion AND 
                      tblRecaudacionCabecera.nPeriodo = tblRecaudacionError.nPeriodo AND tblRecaudacionCabecera.iCorrelativo = tblRecaudacionError.iCorrelativo
    WHERE     ((@vcTipoArchivos = 'AR' OR
                      @vcTipoArchivos = 'T') AND (tblRecaudacionCabecera.nPeriodo = @iPeriodo) AND (tblRecaudacionCabecera.nIdInstitucion = @iInstitucion) OR
                      (@vcTipoArchivos = 'AR' OR
                      @vcTipoArchivos = 'T') AND (tblRecaudacionCabecera.nPeriodo = @iPeriodo) AND (@iInstitucion = 0)
                      ) and @iAR_Historica = 0
    GROUP BY tblRecaudacionCabecera.iCorrelativo,tblRecaudacionCabecera.nPeriodo , tblRecaudacionCabecera.vcNombreArchivo, tblRecaudacionCabecera.dFechaIngreso, 
                      tblRecaudacionCabecera.nTotalRegistros, tblRecaudacionCabecera.iRutUsuarioEnv, tblRecaudacionCabecera.iIdEstado, tblEstado.vcEstado, 
                      tblRecaudacionCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblRecaudacionCabecera.vcLinkError
    union all
    SELECT     'RECAUDACIÓN' AS tipo_archivo,'AR' as tipArch,tblRecaudacionCabecera.nPeriodo as periodo, tblRecaudacionCabecera.iCorrelativo AS Correlativo, tblRecaudacionCabecera.vcNombreArchivo, 
                      tblRecaudacionCabecera.dFechaIngreso, tblRecaudacionCabecera.nTotalRegistros, tblRecaudacionCabecera.iRutUsuarioEnv, tblRecaudacionCabecera.iIdEstado, 
                      tblEstado.vcEstado, tblRecaudacionCabecera.nIdInstitucion, COUNT(tblHistRecaudacionError.nNumRegistro) AS nErrores, 
                      tblRecaudacionCabecera.nTotalRegistros - COUNT(tblHistRecaudacionError.nNumRegistro) AS exitosos,
					  case when tblRecaudacionCabecera.nTotalRegistros > 0 then 1.0 *  COUNT(tblHistRecaudacionError.nNumRegistro) / tblRecaudacionCabecera.nTotalRegistros else 0 end  AS porcentaje_error,tblRecaudacionCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblRecaudacionCabecera   on tblInstitucion.nIdInstitucion=tblRecaudacionCabecera.nIdInstitucion
            INNER JOIN    
                      tblEstado ON tblRecaudacionCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblHistRecaudacionError ON tblRecaudacionCabecera.nIdInstitucion = tblHistRecaudacionError.nIdInstitucion AND 
                      tblRecaudacionCabecera.nPeriodo = tblHistRecaudacionError.nPeriodo AND tblRecaudacionCabecera.iCorrelativo = tblHistRecaudacionError.iCorrelativo
    		inner join vwUltimoArchivoEnviadoValidado 
				ON vwUltimoArchivoEnviadoValidado.tipoArchivo='AR' and vwUltimoArchivoEnviadoValidado.nPeriodo = tblRecaudacionCabecera.nPeriodo
				and vwUltimoArchivoEnviadoValidado.nIdInstitucion=tblRecaudacionCabecera.nIdInstitucion and vwUltimoArchivoEnviadoValidado.iCorrelativo=tblRecaudacionCabecera.iCorrelativo
	WHERE     ((@vcTipoArchivos = 'AR' OR
                      @vcTipoArchivos = 'T') AND (tblRecaudacionCabecera.nPeriodo = @iPeriodo) AND (tblRecaudacionCabecera.nIdInstitucion = @iInstitucion) OR
                      (@vcTipoArchivos = 'AR' OR
                      @vcTipoArchivos = 'T') AND (tblRecaudacionCabecera.nPeriodo = @iPeriodo) AND (@iInstitucion = 0)
                      ) and @iAR_Historica = 1 and @iCR = 1
    GROUP BY tblRecaudacionCabecera.iCorrelativo,tblRecaudacionCabecera.nPeriodo , tblRecaudacionCabecera.vcNombreArchivo, tblRecaudacionCabecera.dFechaIngreso, 
                      tblRecaudacionCabecera.nTotalRegistros, tblRecaudacionCabecera.iRutUsuarioEnv, tblRecaudacionCabecera.iIdEstado, tblEstado.vcEstado, 
                      tblRecaudacionCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblRecaudacionCabecera.vcLinkError
    union all
    SELECT     'CARTERA COMPRADA' AS tipo_archivo,'CC' as tipArch,tblCarteraCompradaCabecera.nPeriodo as periodo, tblCarteraCompradaCabecera.iCorrelativo AS Correlativo, tblCarteraCompradaCabecera.vcNombreArchivo, 
                      tblCarteraCompradaCabecera.dFechaIngreso, tblCarteraCompradaCabecera.nTotalRegistros, tblCarteraCompradaCabecera.iRutUsuarioEnv, tblCarteraCompradaCabecera.iIdEstado, 
                      tblEstado.vcEstado, tblCarteraCompradaCabecera.nIdInstitucion, COUNT(tblCarteraCompradaError.nNumRegistro) AS nErrores, 
                      tblCarteraCompradaCabecera.nTotalRegistros - COUNT(tblCarteraCompradaError.nNumRegistro) AS exitosos,
					  case when tblCarteraCompradaCabecera.nTotalRegistros > 0 then 1.0 *  COUNT(tblCarteraCompradaError.nNumRegistro) / tblCarteraCompradaCabecera.nTotalRegistros else 0 end  AS porcentaje_error,tblCarteraCompradaCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblCarteraCompradaCabecera   on tblInstitucion.nIdInstitucion=tblCarteraCompradaCabecera.nIdInstitucion
            INNER JOIN    
                      tblEstado ON tblCarteraCompradaCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblCarteraCompradaError ON tblCarteraCompradaCabecera.nIdInstitucion = tblCarteraCompradaError.nIdInstitucion AND 
                      tblCarteraCompradaCabecera.nPeriodo = tblCarteraCompradaError.nPeriodo AND tblCarteraCompradaCabecera.iCorrelativo = tblCarteraCompradaError.iCorrelativo
    WHERE     ((@vcTipoArchivos = 'CC' OR
                      @vcTipoArchivos = 'T') AND (tblCarteraCompradaCabecera.nPeriodo = @iPeriodo) AND (tblCarteraCompradaCabecera.nIdInstitucion = @iInstitucion) OR
                      (@vcTipoArchivos = 'CC' OR
                      @vcTipoArchivos = 'T') AND (tblCarteraCompradaCabecera.nPeriodo = @iPeriodo) AND (@iInstitucion = 0)
                      ) and @iCC_Historica = 0
    GROUP BY tblCarteraCompradaCabecera.iCorrelativo,tblCarteraCompradaCabecera.nPeriodo , tblCarteraCompradaCabecera.vcNombreArchivo, tblCarteraCompradaCabecera.dFechaIngreso, 
                      tblCarteraCompradaCabecera.nTotalRegistros, tblCarteraCompradaCabecera.iRutUsuarioEnv, tblCarteraCompradaCabecera.iIdEstado, tblEstado.vcEstado, 
                      tblCarteraCompradaCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblCarteraCompradaCabecera.vcLinkError
    union all
    SELECT     'CARTERA COMPRADA' AS tipo_archivo,'CC' as tipArch,tblCarteraCompradaCabecera.nPeriodo as periodo, tblCarteraCompradaCabecera.iCorrelativo AS Correlativo, tblCarteraCompradaCabecera.vcNombreArchivo, 
                      tblCarteraCompradaCabecera.dFechaIngreso, tblCarteraCompradaCabecera.nTotalRegistros, tblCarteraCompradaCabecera.iRutUsuarioEnv, tblCarteraCompradaCabecera.iIdEstado, 
                      tblEstado.vcEstado, tblCarteraCompradaCabecera.nIdInstitucion, COUNT(tblHistCarteraCompradaError.nNumRegistro) AS nErrores, 
                      tblCarteraCompradaCabecera.nTotalRegistros - COUNT(tblHistCarteraCompradaError.nNumRegistro) AS exitosos,
					  case when tblCarteraCompradaCabecera.nTotalRegistros > 0 then 1.0 *  COUNT(tblHistCarteraCompradaError.nNumRegistro) / tblCarteraCompradaCabecera.nTotalRegistros else 0 end  AS porcentaje_error,tblCarteraCompradaCabecera.vcLinkError,tblInstitucion.vcNombreCorto
    FROM         tblInstitucion inner join tblCarteraCompradaCabecera   on tblInstitucion.nIdInstitucion=tblCarteraCompradaCabecera.nIdInstitucion
            INNER JOIN    
                      tblEstado ON tblCarteraCompradaCabecera.iIdEstado = tblEstado.iIdEstado LEFT OUTER JOIN
                      tblHistCarteraCompradaError ON tblCarteraCompradaCabecera.nIdInstitucion = tblHistCarteraCompradaError.nIdInstitucion AND 
                      tblCarteraCompradaCabecera.nPeriodo = tblHistCarteraCompradaError.nPeriodo AND tblCarteraCompradaCabecera.iCorrelativo = tblHistCarteraCompradaError.iCorrelativo
     		inner join vwUltimoArchivoEnviadoValidado 
				ON vwUltimoArchivoEnviadoValidado.tipoArchivo='CC' and vwUltimoArchivoEnviadoValidado.nPeriodo = tblCarteraCompradaCabecera.nPeriodo
				and vwUltimoArchivoEnviadoValidado.nIdInstitucion=tblCarteraCompradaCabecera.nIdInstitucion and vwUltimoArchivoEnviadoValidado.iCorrelativo=tblCarteraCompradaCabecera.iCorrelativo
	WHERE     ((@vcTipoArchivos = 'CC' OR
                      @vcTipoArchivos = 'T') AND (tblCarteraCompradaCabecera.nPeriodo = @iPeriodo) AND (tblCarteraCompradaCabecera.nIdInstitucion = @iInstitucion) OR
                      (@vcTipoArchivos = 'CC' OR
                      @vcTipoArchivos = 'T') AND (tblCarteraCompradaCabecera.nPeriodo = @iPeriodo) AND (@iInstitucion = 0)
                      ) and @iCC_Historica = 1 and @iCC = 1
    GROUP BY tblCarteraCompradaCabecera.iCorrelativo,tblCarteraCompradaCabecera.nPeriodo , tblCarteraCompradaCabecera.vcNombreArchivo, tblCarteraCompradaCabecera.dFechaIngreso, 
                      tblCarteraCompradaCabecera.nTotalRegistros, tblCarteraCompradaCabecera.iRutUsuarioEnv, tblCarteraCompradaCabecera.iIdEstado, tblEstado.vcEstado, 
                      tblCarteraCompradaCabecera.nIdInstitucion,tblInstitucion.vcNombreCorto,tblCarteraCompradaCabecera.vcLinkError
	)archivos
    order by archivos.dFechaIng desc
END
GO
