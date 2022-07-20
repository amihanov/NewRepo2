
GO
--SqlScripter----[dbo].[fn_diagramobjects].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[fn_diagramobjects]') IS NULL EXEC('CREATE FUNCTION [dbo].[fn_diagramobjects] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[fn_diagramobjects]
() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
GO

GO
--SqlScripter----[dbo].[fncDesEnmascaraSueldo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[fncDesEnmascaraSueldo]') IS NULL EXEC('CREATE FUNCTION [dbo].[fncDesEnmascaraSueldo] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[fncDesEnmascaraSueldo]
(
@SueldoCifrado Varbinary(50),
@llave varchar(10)
)
RETURNS bigint
AS
BEGIN		
	DECLARE @sueldo_cadena varchar(50)		
	
	select @sueldo_cadena=DECRYPTBYPASSPHRASE(@llave,@SueldoCifrado )			
	if isnumeric(@sueldo_cadena)=1
	begin
		RETURN convert(bigint,@sueldo_cadena)
	end	
	return 0	
END
GO

GO
--SqlScripter----[dbo].[fncDiaHabil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[fncDiaHabil]') IS NULL EXEC('CREATE FUNCTION [dbo].[fncDiaHabil] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
-- =============================================
-- Author:		GRN
-- Create date: 09-10-13
-- Description:	Retorna el ultimo dia habil
-- =============================================
ALTER FUNCTION [dbo].[fncDiaHabil]
(@dFecha date)
RETURNS date
AS
BEGIN
	declare @cuenta int = 1
	select @cuenta=count(dFeriado) from tblFeriado where dFeriado = @dFecha

	while @cuenta > 0
	BEGIN
		set @dFecha= dateadd(day,-1,@dFecha)
		select @cuenta=count(dFeriado) from tblFeriado where dFeriado = @dFecha
	END
	return @dFecha
END
GO

GO
--SqlScripter----[dbo].[fncDV].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[fncDV]') IS NULL EXEC('CREATE FUNCTION [dbo].[fncDV] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[fncDV]
(
@ruti char(8)
)
RETURNS VARCHAR(1)

AS
BEGIN
DECLARE @valor INT
DECLARE @dv char(1)
 
 if isnumeric(@ruti)<>1
   begin
     return '0'
   end
 set @valor = 0
 set @valor = @valor + convert(int,substring(@ruti,len(@ruti),1))*2
 set @valor = @valor + convert(int,substring(@ruti,len(@ruti)-1,1))*3
 set @valor = @valor + convert(int,substring(@ruti,len(@ruti)-2,1))*4
 set @valor = @valor + convert(int,substring(@ruti,len(@ruti)-3,1))*5
 set @valor = @valor + convert(int,substring(@ruti,len(@ruti)-4,1))*6
 set @valor = @valor + convert(int,substring(@ruti,len(@ruti)-5,1))*7
 set @valor = @valor + convert(int,substring(@ruti,len(@ruti)-6,1))*2
 set @valor = @valor + convert(int,substring(@ruti,len(@ruti)-7,1))*3

 set @valor = @valor % 11

 if (@valor = 1)
 begin
   set @dv='K'
 end

 if @valor = 0
 begin
   set @dv='0'
 end

 if @valor>1
 begin
   set @dv=str(11-@valor,1)
 end
RETURN @dv
END
GO

GO
--SqlScripter----[dbo].[fncEnmascaraSueldo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[fncEnmascaraSueldo]') IS NULL EXEC('CREATE FUNCTION [dbo].[fncEnmascaraSueldo] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[fncEnmascaraSueldo]
(
@sueldo bigint,
@llave varchar(10)
)
RETURNS varbinary(50)
AS
BEGIN
	DECLARE @sueldo_cadena varbinary(50)		
	select @sueldo_cadena=ENCRYPTBYPASSPHRASE(@llave,convert(varchar(30),@sueldo))	
	RETURN @sueldo_cadena
END
GO

GO
--SqlScripter----[dbo].[fncFmtRut].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[fncFmtRut]') IS NULL EXEC('CREATE FUNCTION [dbo].[fncFmtRut] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[fncFmtRut]
(
@rut int
)
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @rut_cadena varchar(30)
	select @rut_cadena=convert(varchar,@rut)  
	RETURN convert(varchar,@rut )  + '-' + dbo.fncDV(@rut_cadena)
END
GO

GO
--SqlScripter----[dbo].[fncPeriodo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[fncPeriodo]') IS NULL EXEC('CREATE FUNCTION [dbo].[fncPeriodo] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
-- =============================================
-- Author:		GRN
-- Create date: 10-06-13
-- Description:	Retorna el ultimo periodo de la tabla tblPeriodo
-- =============================================
ALTER FUNCTION [dbo].[fncPeriodo]
()
RETURNS int
AS
BEGIN
	DECLARE @periodo int

	SELECT @periodo = max(nPeriodo) from tblPeriodo

	RETURN @periodo
END
GO
