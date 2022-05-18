SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[spESBEjecutaProcedimiento]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spESBEjecutaProcedimiento] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spESBEjecutaProcedimiento]
@vcInvocacion     varchar(4096)
AS

/* *****************************************************************************************
* Sistema      : Central de Riesgo - Bus de servicio
* Procedimiento: spESBEjecutaProcedimiento
* Descripcion  : Procedimiento unico de acceso del Bus a todos los procedimientos
*
* Creacion     : 04-02-2020
* Responsable  : ST Computacion
*
* Control de Cambios
* Fecha      Responsable Observaciones
* ---------- ----------- --------------------------------------------
* *******************************************************************************************/

---------------------------------------------
-- Cuerpo del SP
---------------------------------------------

if rtrim(@vcInvocacion) is null
    return -1
else
    begin
        execute(@vcInvocacion)
        if @@error <> 0
            return -1
    end


RETURN 0
GO
