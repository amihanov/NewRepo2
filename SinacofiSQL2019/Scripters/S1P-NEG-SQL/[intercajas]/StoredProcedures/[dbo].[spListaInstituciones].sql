SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spListaInstituciones]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spListaInstituciones] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    <MSC,,Mauricio Soto>
-- Create date: <21/06/2013>
-- Description: <Obtiene lista de instituciones activas>
-- Parametro @iInstitucion_consultante:
--         0: "Todas" + Inst. Participantes activas
--        -1: "--Seleccione--" + Inst. Todas avtivas
--        -2: Inst. Participantes activas
--        -3: "--Seleccione--" + Inst. Todas + "--Nueva Institucion--"
-- =============================================
ALTER PROCEDURE [dbo].[spListaInstituciones]
@iInstitucion_consultante int 
AS
BEGIN
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  if @iInstitucion_consultante=0 
  begin
  SET NOCOUNT ON;
      select 0 as orden, 0 as nIdInstitucion,0 as iIdSCF, 'Todas' as vcNombre, 'Todas' as vcNombreCorto, 0 as bParticipa, 0 as iIdEstado
    union
    SELECT TOP 1000 1 as orden, nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
    FROM         INTERCAJAS.dbo.tblInstitucion
    WHERE     (bParticipa = 1) AND (iIdEstado = 11)
    
    order by orden,vcNombre
  end
  else IF @iInstitucion_consultante = -1 
  begin     
    SET NOCOUNT ON;
    select 0 as nIdInstitucion,0 as iIdSCF, '-- Seleccione --' as vcNombre, '-- Seleccione --' as vcNombreCorto, 0 as bParticipa, 0 as iIdEstado
    union
    SELECT     TOP (1000) nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
    FROM         INTERCAJAS.dbo.tblInstitucion
    WHERE     (iIdEstado = 11)
    order by vcNombre
  end
  else IF @iInstitucion_consultante = -2
  begin     
    SET NOCOUNT ON;   
    SELECT     TOP (1000) nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
    FROM         INTERCAJAS.dbo.tblInstitucion
    WHERE     (bParticipa = 1 AND iIdEstado = 11)
    order by vcNombre
  end
  else IF @iInstitucion_consultante = -3
  begin     
    SET NOCOUNT ON;   
    select nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
    from(
      select 0 as orden, 0 as nIdInstitucion,0 as iIdSCF, '-- Seleccione --' as vcNombre, '-- Seleccione --' as vcNombreCorto, 0 as bParticipa, 0 as iIdEstado
      union
      SELECT TOP (1000) 
        1 as orden, nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
      FROM         INTERCAJAS.dbo.tblInstitucion
      order by vcNombre
      union
      select 2 as orden, -1 as nIdInstitucion,0 as iIdSCF, '-- Nueva Institución --' as vcNombre, '-- Nueva Institución --' as vcNombreCorto ,0 as bParticipa, 0 as iIdEstado
    )tbl
    order by tbl.orden, tbl.vcNombre
  end
  else IF @iInstitucion_consultante = -4
  begin     
    SET NOCOUNT ON;   
    select nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
    from(
      select 0 as orden, 0 as nIdInstitucion,0 as iIdSCF, '-- Seleccione --' as vcNombre, '-- Seleccione --' as vcNombreCorto, 0 as bParticipa, 0 as iIdEstado
      union
      SELECT TOP (1000) 
        1 as orden, nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
      FROM         INTERCAJAS.dbo.tblInstitucion
      where (bParticipa = 1 AND iIdEstado = 11)
      order by vcNombre
    )tbl
    order by tbl.orden, tbl.vcNombre
  end
  else
  begin
    SET NOCOUNT ON;
    SELECT     TOP (1000) nIdInstitucion, iIdSCF, vcNombre, vcNombreCorto, bParticipa, iIdEstado
    FROM         INTERCAJAS.dbo.tblInstitucion
    WHERE     (iIdEstado = 11) AND (nIdInstitucion = @iInstitucion_consultante );
  end
  
END
GO
