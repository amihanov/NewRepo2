SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spDespliegaMenu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spDespliegaMenu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:    GRN
-- Create date: 12-06-13
-- Description: Despliega Menus permitidos para un usuario
-- =============================================
ALTER PROCEDURE [dbo].[spDespliegaMenu]
@iRut int
AS
BEGIN
  SET NOCOUNT ON;
    --Select Menu de 3 Niveles
  select distinct Menu, vcMenu, vcUrl as link, len(Menu)-len(replace(Menu,'.','')) as Nivel
  from
  (
    select 
      Niv2.iIdMenu,
    replace(
      cast(coalesce(Niv0.iOrden,'') as varchar(10)) + '.' + 
      cast(coalesce(Niv1.iOrden,'') as varchar(10)) + '.' + 
      cast(coalesce(Niv2.iOrden,'') as varchar(10)), 
    '0.','')
    as Menu
    from tblMenu Niv2 left join tblMenu Niv1 
    on Niv1.iIdMenu = Niv2.iIdMenuPadre 
    left join tblMenu Niv0
    on Niv0.iIdMenu = Niv1.iIdMenuPadre 
  ) TabMenu 
  inner join tblMenu on tblMenu.iIdMenu = TabMenu.iIdMenu 
  left join tblPagina on tblMenu.iIdPaginaLink = tblPagina.iIdPagina
  inner join tblRel_FuncMenu on tblRel_FuncMenu.iIdMenu = tblMenu.iIdMenu
  inner join tblFuncionalidad on tblFuncionalidad.iIdFuncionalidad = tblRel_FuncMenu.iIdFuncionalidad
  inner join tblRel_PerfilFunc on tblRel_PerfilFunc.iIdFuncionalidad = tblFuncionalidad.iIdFuncionalidad
  inner join tblPerfil on tblPerfil.iIdPerfil = tblRel_PerfilFunc.iIdPerfil
  inner join tblRel_UsuarioPerfil on tblRel_UsuarioPerfil.iIdPerfil = tblPerfil.iIdPerfil
  inner join tblUsuario on tblUsuario.iRut = tblRel_UsuarioPerfil.iRut 
  where tblUsuario.iRut = @iRut
    and tblFuncionalidad.iIdEstado = 1 --Funcionalidad Activa
  order by TabMenu.Menu; 
END
GO
