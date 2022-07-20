
GO
--SqlScripter----[dbo].[VistaPiezasRelacion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[VistaPiezasRelacion]') IS NULL EXEC('CREATE VIEW [dbo].[VistaPiezasRelacion] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[VistaPiezasRelacion]
AS
select
 p.PiezaID,
 p.Nombre,
 c.Nombre Categoria,
 c.Color,
 (select count(1) from Relacions r where r.PiezaID = p.PiezaID) Hijos,
 (select count(1) from Relacions r where r.PiezaPosteriorID = p.PiezaID) Padres
from
 Piezas p
 inner join PiezaCategorias pc on pc.PiezaID = p.PiezaID
 inner join Categorias c on c.CategoriaID = pc.CategoriaID
GO
