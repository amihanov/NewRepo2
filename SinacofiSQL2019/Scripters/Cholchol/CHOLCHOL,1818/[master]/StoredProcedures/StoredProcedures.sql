
GO
--SqlScripter----[dbo].[spESBObtieneRegistroFT3FT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[spESBObtieneRegistroFT3FT]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spESBObtieneRegistroFT3FT] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spESBObtieneRegistroFT3FT]
@instEnvio    	varchar(4),
												@tipoArchivo	varchar(20),
												@fechaInicio	varchar(25),
												@fechaFin	 	varchar(25)
AS

/* *****************************************************************************************
* Sistema      : Central de Riesgo - Bus de servicio
* Procedimiento: spESBObtieneRegistroFT3FT
* Descripcion  : 
*
* Entrada:
*		@instEnvio Codigo de Institucion que envio el archivo
*   	@tipoArchivo Tipo de archivo
*		@fechaInicio Fecha inicio de recepcion para filtrar resultados(No se utilizara en esta fase)
*		@fechaFin Fecha final de recepcion para filtrar resultados(No se utilizara en esta fase)
*
* Salida:
* 		Ultimo registro recepcionado, solo uno.
*
* Creacion     : 22-01-2020
* Responsable  : ST
*
* Control de Cambios
* Fecha      Responsable Observaciones
* ---------- ----------- --------------------------------------------
* *******************************************************************************************/

---------------------------------------------
-- Cuerpo del SP
---------------------------------------------

SELECT TOP 1 isnull(b.nom_msg,@tipoArchivo) AS tipoArchivo, 
	convert(VARCHAR, a.fec_rece, 112) AS fechaEnvio, 
	convert(VARCHAR, a.fec_rece, 108) AS horaEnvio,
	convert(VARCHAR, b.fec_resc, 112) AS fechaRecepcion, 
	convert(VARCHAR, b.fec_resc, 108) AS horaRecepcion, 
	a.cas_orig AS usuarioEnvio
FROM tbl_tarc a
INNER JOIN tbl_casi c ON c.cod_casi = a.cas_orig
LEFT JOIN tbl_resc b on a.cas_dest = b.cas_dest 
	AND a.cas_orig = b.cas_orig 
	AND a.nom_arcc = b.nom_arch
	AND b.est_resc = 'EE' AND b.est_fres='00'
WHERE
	c.cod_inst = @instEnvio
	AND a.cas_dest = 'sbif' 
	AND upper(a.nom_arcc) like concat('FT',concat(upper(@tipoArchivo),'%'))
ORDER BY a.fec_rece DESC
GO
