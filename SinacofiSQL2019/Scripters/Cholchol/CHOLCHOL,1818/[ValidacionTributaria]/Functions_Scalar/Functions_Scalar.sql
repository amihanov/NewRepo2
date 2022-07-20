
GO
--SqlScripter----[dbo].[DigitoVerificador].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[DigitoVerificador]') IS NULL EXEC('CREATE FUNCTION [dbo].[DigitoVerificador] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[DigitoVerificador]
(
	@rut INTEGER
 )
 
 /********************************************************************************************
* Sistema        : Servicio Validaci├│n Tributaria Consulta*
* Descripcion    : 
* Responsable    : Felipe Poveda
* Fecha Creacion : 03/04/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 07/04/2017 FPE			Actualizaci├│n de funci├│n
* 
*********************************************************************************************/
 
 RETURNS VARCHAR(1) 
 AS
 BEGIN
 
 DECLARE @dv VARCHAR(1)
 DECLARE @rutAux INTEGER
 DECLARE @Digito INTEGER
 DECLARE @Contador INTEGER
 DECLARE @Multiplo INTEGER
 DECLARE @Acumulador INTEGER
 
 
 SET @Contador = 2;
 SET @Acumulador = 0;
 SET @Multiplo = 0;
 
	WHILE(@rut!=0)
		BEGIN
 
			SET @Multiplo = (@rut % 10) * @Contador;
			SET @Acumulador = @Acumulador + @Multiplo;
			SET @rut = @rut / 10;
			SET @Contador = @Contador + 1;
			if(@Contador = 8)
			BEGIN
				SET @Contador = 2;
			End;
		END;
 
	SET @Digito = 11 - (@Acumulador % 11);
 
	SET @dv = LTRIM(RTRIM(CONVERT(VARCHAR(2),@Digito)));
 
	IF(@Digito = 10)
	BEGIN
		SET @dv = 'K';
	END;
 
	IF(@Digito = 11)
	BEGIN
		SET @dv = '0';
	END;
 
RETURN @dv
 
END
GO

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
--SqlScripter----[dbo].[ISZERO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ISZERO]') IS NULL EXEC('CREATE FUNCTION [dbo].[ISZERO] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ISZERO]
(
    @Number FLOAT,
    @IsZeroNumber FLOAT
)

/********************************************************************************************
* Sistema        : Servicio Validaci├│n Tributaria Consulta* 
* Descripcion    :  
* Responsable    : Felipe Poveda
* Fecha Creacion : 03/04/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 07/04/2017 FPE         Actualizaci├│n de funci├│n.
* 
*********************************************************************************************/

RETURNS FLOAT
AS
BEGIN

    IF (@Number = 0)
    BEGIN
        SET @Number = @IsZeroNumber
    END

    RETURN (@Number)

END
GO

GO
--SqlScripter----[dbo].[ivasor].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ivasor]') IS NULL EXEC('CREATE FUNCTION [dbo].[ivasor] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ivasor]
(@num float
)

/********************************************************************************************
* Sistema        : Servicio Validaci├│n Tributaria Consulta* 
* Descripcion    :  
* Responsable    : Felipe Poveda
* Fecha Creacion : 03/04/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 07/04/2017 FPE		   Actualizaci├│n de funci├│n.
* 
*********************************************************************************************/

RETURNS float
AS
BEGIN
  /* Function body */
  RETURN ROUND(@num/0.19,0)
END
GO

GO
--SqlScripter----[dbo].[ObtenerDigitoVerificador].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ObtenerDigitoVerificador]') IS NULL EXEC('CREATE FUNCTION [dbo].[ObtenerDigitoVerificador] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[ObtenerDigitoVerificador]
(
	@rut INTEGER
 )
 RETURNS VARCHAR(1)
 
 AS
 BEGIN
 
 DECLARE @dv VARCHAR(1)
 DECLARE @rutAux INTEGER
 DECLARE @Digito INTEGER
 DECLARE @Contador INTEGER
 DECLARE @Multiplo INTEGER
 DECLARE @Acumulador INTEGER
 
 
 SET @Contador = 2;
 SET @Acumulador = 0;
 SET @Multiplo = 0;
 
	WHILE(@rut!=0)
		BEGIN
 
			SET @Multiplo = (@rut % 10) * @Contador;
			SET @Acumulador = @Acumulador + @Multiplo;
			SET @rut = @rut / 10;
			SET @Contador = @Contador + 1;
			if(@Contador = 8)
			BEGIN
				SET @Contador = 2;
			End;
		END;
 
	SET @Digito = 11 - (@Acumulador % 11);
 
	SET @dv = LTRIM(RTRIM(CONVERT(VARCHAR(2),@Digito)));
 
	IF(@Digito = 10)
	BEGIN
		SET @dv = 'K';
	END;
 
	IF(@Digito = 11)
	BEGIN
		SET @dv = '0';
	END;
 
RETURN @dv
 
END
GO

GO
--SqlScripter----[dbo].[redonsor].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[redonsor]') IS NULL EXEC('CREATE FUNCTION [dbo].[redonsor] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[redonsor]
(@num float
)

/********************************************************************************************
* Sistema        : Servicio Validaci├│n Tributaria Consulta* 
* Descripcion    :  
* Responsable    : Felipe Poveda
* Fecha Creacion : 03/04/2017
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 07/04/2017 FPE		   Actualizaci├│n de funci├│n.
* 
*********************************************************************************************/

RETURNS float
AS
BEGIN
  return ROUND(@num,2)
END
GO
