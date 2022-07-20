
GO
--SqlScripter----[dbo].[PoblaFlatFiles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PoblaFlatFiles]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PoblaFlatFiles] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PoblaFlatFiles]
@id uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	delete PiezasTemp2;
	
	insert into PiezasTemp2 ([PiezaTempID], [Tipo], [Nombre])
	select NEWID(), 'A186B73A-EC46-448D-93ED-A68C2A028461', Nombre from
	(
	select 
		 distinct Nombre 
	from 
		PiezasTemp pt
	where
		pt.Nombre not in
		(select 
			p2.Nombre 
		from 
			Piezas p2 
			inner join PiezaCategorias c2 on c2.PiezaID = p2.PiezaID
		where
			c2.CategoriaID = 'A186B73A-EC46-448D-93ED-A68C2A028461'
		)
	) p


	insert into Piezas(PiezaID, Nombre,  Vigencia)
	select [PiezaTempID], [Nombre], 1 from PiezasTemp2

	insert into PiezaCategorias(PiezaCategoriaID, PiezaID, CategoriaID)
	select newid(), [PiezaTempID], 'A186B73A-EC46-448D-93ED-A68C2A028461' from PiezasTemp2

	insert into Relacions (RelacionID, PiezaID, PiezaPosteriorID)
	select
		newid(), p2.PiezaID, @id
	from
		Piezas p2 
		inner join PiezaCategorias c2 on c2.PiezaID = p2.PiezaID
	where
		c2.CategoriaID = 'A186B73A-EC46-448D-93ED-A68C2A028461'
		and Nombre in (Select Nombre from PiezasTemp)

END
GO

GO
--SqlScripter----[dbo].[PoblaFlatFilesTarget].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PoblaFlatFilesTarget]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PoblaFlatFilesTarget] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PoblaFlatFilesTarget]
@id uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	delete PiezasTemp2;
	
	insert into PiezasTemp2 ([PiezaTempID], [Tipo], [Nombre])
	select NEWID(), 'A186B73A-EC46-448D-93ED-A68C2A028461', Nombre from
	(
	select 
		 distinct Nombre 
	from 
		PiezasTemp pt
	where
		pt.Nombre not in
		(select 
			p2.Nombre 
		from 
			Piezas p2 
			inner join PiezaCategorias c2 on c2.PiezaID = p2.PiezaID
		where
			c2.CategoriaID = 'A186B73A-EC46-448D-93ED-A68C2A028461'
		)
	) p


	insert into Piezas(PiezaID, Nombre,  Vigencia)
	select [PiezaTempID], [Nombre], 1 from PiezasTemp2

	insert into PiezaCategorias(PiezaCategoriaID, PiezaID, CategoriaID)
	select newid(), [PiezaTempID], 'A186B73A-EC46-448D-93ED-A68C2A028461' from PiezasTemp2

	insert into Relacions (RelacionID, PiezaID, PiezaPosteriorID)
	select
		newid(), @id, p2.PiezaID
	from
		Piezas p2 
		inner join PiezaCategorias c2 on c2.PiezaID = p2.PiezaID
	where
		c2.CategoriaID = 'A186B73A-EC46-448D-93ED-A68C2A028461'
		and Nombre in (Select Nombre from PiezasTemp)

END
GO

GO
--SqlScripter----[dbo].[PoblaRelXmlTabla].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PoblaRelXmlTabla]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PoblaRelXmlTabla] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PoblaRelXmlTabla]
@id uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	insert into Relacions (RelacionID, PiezaID, PiezaPosteriorID)
	select 
		newid(),
		pieza,
		posterior
	from
	(select 
		distinct p.PiezaID pieza, @id posterior 
	from 
		PiezasTemp t
		inner join Piezas p on p.Nombre = t.Nombre
		inner join PiezaCategorias c on c.PiezaID = p.PiezaID
	where
		c.CategoriaID = 'f7a8be18-fd1a-4504-a269-691d32480bfe' -- tabla
	) a


END
GO

GO
--SqlScripter----[dbo].[PoblaRelXmlTablaTarget].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PoblaRelXmlTablaTarget]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PoblaRelXmlTablaTarget] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PoblaRelXmlTablaTarget]
@id uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	insert into Relacions (RelacionID, PiezaID, PiezaPosteriorID)
	select 
		newid(),
		pieza,
		posterior
	from
	(select 
		distinct p.PiezaID posterior, @id pieza 
	from 
		PiezasTemp t
		inner join Piezas p on p.Nombre = t.Nombre
		inner join PiezaCategorias c on c.PiezaID = p.PiezaID
	where
		c.CategoriaID = 'f7a8be18-fd1a-4504-a269-691d32480bfe' -- tabla
	) a


END
GO

GO
--SqlScripter----[dbo].[RelacionaAPPC2Table].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[RelacionaAPPC2Table]') IS NULL EXEC('CREATE PROCEDURE [dbo].[RelacionaAPPC2Table] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[RelacionaAPPC2Table]
@idfoo uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	declare @cuenta int
	declare @id uniqueidentifier

	declare @porid uniqueidentifier
	declare @tipoid uniqueidentifier
	declare @nombre nvarchar(max)


	DECLARE cursor_temp CURSOR
	FOR SELECT 
			DISTINCT
			LlamadaPorID,
			Tipo,
			Nombre
		FROM 
			PiezasTemp;

	OPEN cursor_temp;

	FETCH NEXT FROM cursor_temp INTO 
		@porid,
		@tipoid,
		@nombre;

	WHILE @@FETCH_STATUS = 0
		BEGIN
			
			SET @cuenta = (select count (1) from  Piezas where Nombre = @nombre)
			if @cuenta = 0
			begin
				SET @id = NEWID();
				insert into Piezas(PiezaID, Nombre, Vigencia)values(@id, @nombre, 0);

				insert into PiezaCategorias(PiezaCategoriaID, PiezaID, CategoriaID)values(NEWID(), @id, @tipoid)
			end

			SET @id = (select top 1 PiezaID from  Piezas where Nombre = @nombre)

			INSERT INTO[dbo].[Relacions]
				([RelacionID],[PiezaPosteriorID],[PiezaID])
			select	
				newid(),
				@id,
				@porid

			FETCH NEXT FROM cursor_temp INTO 
				@porid,
				@tipoid,
				@nombre;
		END;

	CLOSE cursor_temp;

	DEALLOCATE cursor_temp;

END
GO

GO
--SqlScripter----[dbo].[RelacionaSP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[RelacionaSP]') IS NULL EXEC('CREATE PROCEDURE [dbo].[RelacionaSP] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[RelacionaSP]
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO[dbo].[Relacions]
([RelacionID],[PiezaPosteriorID],[PiezaID])
select
newid(),
a.PiezaId,
p.PiezaId
from
Piezas p
inner join[dbo].[PiezaCategorias] c on c.PiezaId = p.PiezaId
inner join[dbo].[Relacions] r on r.PiezaPosteriorId = p.PiezaId
inner join[dbo].[PiezaAtributoes] a on a.Valor like dbo.CadenaLike(p.Nombre)
where
c.CategoriaId = '41B00C25-9DA6-47A3-8226-FAC947EFC0D9'
END
GO

GO
--SqlScripter----[dbo].[RelacionaSpASP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[RelacionaSpASP]') IS NULL EXEC('CREATE PROCEDURE [dbo].[RelacionaSpASP] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[RelacionaSpASP]
AS
BEGIN
	SET NOCOUNT ON;

	declare @cuenta int
	declare @id uniqueidentifier
	declare @tipoid uniqueidentifier

	SET @tipoid = '680a6720-6880-4d3f-89e0-dca435ecb0a2'

	declare @porid uniqueidentifier
	declare @nombre nvarchar(max)

	DECLARE cursor_temp CURSOR
	FOR SELECT DISTINCT  
			LlamadaPorID,
			Nombre
		FROM 
			PiezasTemp;

	OPEN cursor_temp;

	FETCH NEXT FROM cursor_temp INTO  
		@porid,
		@nombre;

	WHILE @@FETCH_STATUS = 0
		BEGIN
			
			SET @cuenta = (select count (1) from  Piezas where Nombre = @nombre)
			if @cuenta = 0
			begin
				SET @id = NEWID();
				insert into Piezas(PiezaID, Nombre, Vigencia)values(@id, @nombre, 0);

				insert into PiezaCategorias(PiezaCategoriaID, PiezaID, CategoriaID)values(NEWID(), @id, @tipoid)
			end

			SET @id = (select top 1 PiezaID from  Piezas where Nombre = @nombre)

			INSERT INTO[dbo].[Relacions]
				([RelacionID],[PiezaPosteriorID],[PiezaID])
			select	
				newid(),
				@id,
				@porid

			FETCH NEXT FROM cursor_temp INTO 
				@porid,
				@nombre;
		END;

	CLOSE cursor_temp;

	DEALLOCATE cursor_temp;

END
GO

GO
--SqlScripter----[dbo].[RelSPSP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[RelSPSP]') IS NULL EXEC('CREATE PROCEDURE [dbo].[RelSPSP] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[RelSPSP]
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO[dbo].[Relacions]
	([RelacionID],[PiezaPosteriorID],[PiezaID])
	select	
		newid(),
		posterior,
		pieza
	from
		(select
				distinct
				a.PiezaId as posterior,
				p.PiezaId as pieza
			from
				Piezas p
				inner join PiezaCategorias c on c.PiezaId = p.PiezaId
				inner join PiezaAtributoes a on a.Valor like dbo.CadenaLike(p.Nombre)
				inner join PiezaCategorias ca on ca.PiezaID = a.PiezaID 
			where
				c.CategoriaId = '680a6720-6880-4d3f-89e0-dca435ecb0a2' -- Tipo Store Procedure mencionada en Store Procedure
				and ca.CategoriaID = '680a6720-6880-4d3f-89e0-dca435ecb0a2' -- Tipo Store Procedure que llama a la Store Procedure
				and a.PiezaId <> p.PiezaId
	) a
END
GO

GO
--SqlScripter----[dbo].[RelSPTabla].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[RelSPTabla]') IS NULL EXEC('CREATE PROCEDURE [dbo].[RelSPTabla] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[RelSPTabla]
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO[dbo].[Relacions]
		([RelacionID],[PiezaPosteriorID],[PiezaID])
	select	
		newid(),
		posterior,
		pieza
	from
		(select
				distinct
				a.PiezaId as posterior,
				p.PiezaId as pieza
			from
				Piezas p
				inner join PiezaCategorias c on c.PiezaId = p.PiezaId
				inner join Relacions r on r.PiezaPosteriorId = p.PiezaId
				inner join PiezaAtributoes a on a.Valor like dbo.CadenaLike(p.Nombre)
				inner join PiezaCategorias ca on ca.PiezaID = a.PiezaID 
			where
				c.CategoriaId = 'f7a8be18-fd1a-4504-a269-691d32480bfe' -- Tipo Tabla mencionada en SP
				and ca.CategoriaID = '680a6720-6880-4d3f-89e0-dca435ecb0a2' -- Tipo Store Procedure que llama a la tabla
	) a
END
GO

GO
--SqlScripter----[dbo].[RelSPVista].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[RelSPVista]') IS NULL EXEC('CREATE PROCEDURE [dbo].[RelSPVista] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[RelSPVista]
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO[dbo].[Relacions]
		([RelacionID],[PiezaPosteriorID],[PiezaID])
	select	
		newid(),
		posterior,
		pieza
	from
		(select
				distinct
				a.PiezaId as posterior,
				p.PiezaId as pieza
			from
				Piezas p
				inner join PiezaCategorias c on c.PiezaId = p.PiezaId
				inner join Relacions r on r.PiezaPosteriorId = p.PiezaId
				inner join PiezaAtributoes a on a.Valor like dbo.CadenaLike(p.Nombre)
				inner join PiezaCategorias ca on ca.PiezaID = a.PiezaID 
			where
				c.CategoriaId = '5D9B7940-85C5-4878-B923-8DC4ABAEB9D3' -- Tipo Vista mencionada en SP
				and ca.CategoriaID = '680a6720-6880-4d3f-89e0-dca435ecb0a2' -- Tipo Store Procedure que llama a la Vista
	) a
END
GO

GO
--SqlScripter----[dbo].[RelVistaTabla].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[RelVistaTabla]') IS NULL EXEC('CREATE PROCEDURE [dbo].[RelVistaTabla] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[RelVistaTabla]
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO[dbo].[Relacions]
		([RelacionID],[PiezaPosteriorID],[PiezaID])
	select	
		newid(),
		posterior,
		pieza
	from
		(select
				distinct
				a.PiezaId as posterior,
				p.PiezaId as pieza
			from
				Piezas p
				inner join PiezaCategorias c on c.PiezaId = p.PiezaId
				inner join Relacions r on r.PiezaPosteriorId = p.PiezaId
				inner join PiezaAtributoes a on a.Valor like dbo.CadenaLike(p.Nombre)
				inner join PiezaCategorias ca on ca.PiezaID = a.PiezaID 
			where
				c.CategoriaId = 'f7a8be18-fd1a-4504-a269-691d32480bfe' -- Tipo Tabla mencionada en Vista
				and ca.CategoriaID = '5D9B7940-85C5-4878-B923-8DC4ABAEB9D3' -- Tipo Vista que llama a la Tabla
	) a
END
GO
