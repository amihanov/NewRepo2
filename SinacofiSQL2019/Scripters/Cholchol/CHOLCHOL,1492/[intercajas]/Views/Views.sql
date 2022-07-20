
GO
--SqlScripter----[dbo].[vis_tblConsolidacionDetalle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vis_tblConsolidacionDetalle]') IS NULL EXEC('CREATE VIEW [dbo].[vis_tblConsolidacionDetalle] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vis_tblConsolidacionDetalle]
AS select * from tblConsolidacionDetalle where nperiodo=201508
GO

GO
--SqlScripter----[dbo].[vis_tblRegistroConsolidacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vis_tblRegistroConsolidacion]') IS NULL EXEC('CREATE VIEW [dbo].[vis_tblRegistroConsolidacion] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vis_tblRegistroConsolidacion]
AS select * from tblRegistroConsolidacion where nperiodo=201508
GO

GO
--SqlScripter----[dbo].[vis_tblResumenConsolidacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vis_tblResumenConsolidacion]') IS NULL EXEC('CREATE VIEW [dbo].[vis_tblResumenConsolidacion] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vis_tblResumenConsolidacion]
AS select * from tblResumenConsolidacion where nperiodo=201508
GO

GO
--SqlScripter----[dbo].[vwUltimoArchivoEnviado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vwUltimoArchivoEnviado]') IS NULL EXEC('CREATE VIEW [dbo].[vwUltimoArchivoEnviado] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vwUltimoArchivoEnviado]
AS
SELECT     'AA' AS tipoArchivo, tblAfiliadoCabecera.nIdInstitucion, tblAfiliadoCabecera.nPeriodo, MAX(tblAfiliadoCabecera.iCorrelativo) AS iCorrelativo
FROM         tblAfiliadoCabecera INNER JOIN
                     tblPeriodo ON tblAfiliadoCabecera.nPeriodo = tblPeriodo.nPeriodo INNER JOIN
                      dbo.tblInstitucion ON dbo.tblAfiliadoCabecera.nIdInstitucion = dbo.tblInstitucion.nIdInstitucion
WHERE     (dbo.tblInstitucion.bParticipa = 1) AND (dbo.tblInstitucion.iIdEstado = 11)
GROUP BY tblAfiliadoCabecera.nIdInstitucion, tblAfiliadoCabecera.nPeriodo
UNION
SELECT     'AD' AS tipoArchivo, tblDeudaCabecera.nIdInstitucion, tblDeudaCabecera.nPeriodo, MAX(tblDeudaCabecera.iCorrelativo) AS iCorrelativo
FROM         tblDeudaCabecera INNER JOIN
                      tblPeriodo ON tblDeudaCabecera.nPeriodo = tblPeriodo.nPeriodo INNER JOIN
                      dbo.tblInstitucion ON dbo.tblDeudaCabecera.nIdInstitucion = dbo.tblInstitucion.nIdInstitucion
WHERE     (dbo.tblInstitucion.bParticipa = 1) AND (dbo.tblInstitucion.iIdEstado = 11)
GROUP BY tblDeudaCabecera.nIdInstitucion, tblDeudaCabecera.nPeriodo
UNION
SELECT     'AR' AS tipoArchivo, dbo.tblRecaudacionCabecera.nIdInstitucion, dbo.tblRecaudacionCabecera.nPeriodo, MAX(tblRecaudacionCabecera.iCorrelativo) 
                      AS iCorrelativo
FROM         tblRecaudacionCabecera INNER JOIN
                      tblPeriodo ON tblRecaudacionCabecera.nPeriodo = tblPeriodo.nPeriodo INNER JOIN
                      dbo.tblInstitucion ON dbo.tblRecaudacionCabecera.nIdInstitucion = dbo.tblInstitucion.nIdInstitucion
WHERE     (dbo.tblInstitucion.bParticipa = 1) AND (dbo.tblInstitucion.iIdEstado = 11)
GROUP BY tblRecaudacionCabecera.nIdInstitucion, tblRecaudacionCabecera.nPeriodo
UNION
SELECT     'CC' AS tipoArchivo, dbo.tblCarteraCompradaCabecera.nIdInstitucion, dbo.tblCarteraCompradaCabecera.nPeriodo, MAX(tblCarteraCompradaCabecera.iCorrelativo) 
                      AS iCorrelativo
FROM         tblCarteraCompradaCabecera INNER JOIN
                      tblPeriodo ON tblCarteraCompradaCabecera.nPeriodo = tblPeriodo.nPeriodo INNER JOIN
                      dbo.tblInstitucion ON dbo.tblCarteraCompradaCabecera.nIdInstitucion = dbo.tblInstitucion.nIdInstitucion
WHERE     (dbo.tblInstitucion.bParticipa = 1) AND (dbo.tblInstitucion.iIdEstado = 11)
GROUP BY tblCarteraCompradaCabecera.nIdInstitucion, tblCarteraCompradaCabecera.nPeriodo
GO

GO
--SqlScripter----[dbo].[vwUltimoArchivoEnviadoValidado].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vwUltimoArchivoEnviadoValidado]') IS NULL EXEC('CREATE VIEW [dbo].[vwUltimoArchivoEnviadoValidado] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vwUltimoArchivoEnviadoValidado]
AS
SELECT     vwUltimoArchivoEnviado.tipoArchivo, vwUltimoArchivoEnviado.nIdInstitucion, vwUltimoArchivoEnviado.nPeriodo, vwUltimoArchivoEnviado.iCorrelativo, 
                      tblAfiliadoCabecera.vcNombreArchivo, tblAfiliadoCabecera.iIdEstado
FROM         vwUltimoArchivoEnviado INNER JOIN
                      tblAfiliadoCabecera ON vwUltimoArchivoEnviado.nIdInstitucion = tblAfiliadoCabecera.nIdInstitucion AND 
                      vwUltimoArchivoEnviado.iCorrelativo = tblAfiliadoCabecera.iCorrelativo AND vwUltimoArchivoEnviado.nPeriodo = tblAfiliadoCabecera.nPeriodo
WHERE     (vwUltimoArchivoEnviado.tipoArchivo = 'AA') and tblAfiliadoCabecera.iIdEstado=15
UNION
SELECT     vwUltimoArchivoEnviado_2.tipoArchivo, vwUltimoArchivoEnviado_2.nIdInstitucion, vwUltimoArchivoEnviado_2.nPeriodo, vwUltimoArchivoEnviado_2.iCorrelativo, 
                      tblDeudaCabecera.vcNombreArchivo, tblDeudaCabecera.iIdEstado
FROM         vwUltimoArchivoEnviado AS vwUltimoArchivoEnviado_2 INNER JOIN
                      tblDeudaCabecera ON vwUltimoArchivoEnviado_2.nIdInstitucion = tblDeudaCabecera.nIdInstitucion AND 
                      vwUltimoArchivoEnviado_2.iCorrelativo = tblDeudaCabecera.iCorrelativo AND vwUltimoArchivoEnviado_2.nPeriodo = tblDeudaCabecera.nPeriodo
WHERE     (vwUltimoArchivoEnviado_2.tipoArchivo = 'AD') and tblDeudaCabecera.iIdEstado=15
UNION
SELECT     vwUltimoArchivoEnviado_1.tipoArchivo, vwUltimoArchivoEnviado_1.nIdInstitucion, vwUltimoArchivoEnviado_1.nPeriodo, vwUltimoArchivoEnviado_1.iCorrelativo, 
                      tblRecaudacionCabecera.vcNombreArchivo, tblRecaudacionCabecera.iIdEstado
FROM         vwUltimoArchivoEnviado AS vwUltimoArchivoEnviado_1 INNER JOIN
                      tblRecaudacionCabecera ON vwUltimoArchivoEnviado_1.nIdInstitucion = tblRecaudacionCabecera.nIdInstitucion AND 
                      vwUltimoArchivoEnviado_1.iCorrelativo = tblRecaudacionCabecera.iCorrelativo AND vwUltimoArchivoEnviado_1.nPeriodo = tblRecaudacionCabecera.nPeriodo
WHERE     (vwUltimoArchivoEnviado_1.tipoArchivo = 'AR') and tblRecaudacionCabecera.iIdEstado=15
UNION
SELECT     vwUltimoArchivoEnviado_1.tipoArchivo, vwUltimoArchivoEnviado_1.nIdInstitucion, vwUltimoArchivoEnviado_1.nPeriodo, vwUltimoArchivoEnviado_1.iCorrelativo, 
                      tblCarteraCompradaCabecera.vcNombreArchivo, tblCarteraCompradaCabecera.iIdEstado
FROM         vwUltimoArchivoEnviado AS vwUltimoArchivoEnviado_1 INNER JOIN
                      tblCarteraCompradaCabecera ON vwUltimoArchivoEnviado_1.nIdInstitucion = tblCarteraCompradaCabecera.nIdInstitucion AND 
                      vwUltimoArchivoEnviado_1.iCorrelativo = tblCarteraCompradaCabecera.iCorrelativo AND vwUltimoArchivoEnviado_1.nPeriodo = tblCarteraCompradaCabecera.nPeriodo
WHERE     (vwUltimoArchivoEnviado_1.tipoArchivo = 'CC') and tblCarteraCompradaCabecera.iIdEstado=15
GO
