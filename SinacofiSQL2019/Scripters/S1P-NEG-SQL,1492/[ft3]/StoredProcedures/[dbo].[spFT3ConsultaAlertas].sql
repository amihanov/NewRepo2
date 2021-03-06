SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spFT3ConsultaAlertas]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spFT3ConsultaAlertas] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spFT3ConsultaAlertas]
@error varchar(255)  OUTPUT,
   @vcCodigoParametro varchar(10)
AS 
   
   /*
   *   Generated by SQL Server Migration Assistant for Sybase version 5.2.1260.
   *   
   *    *  Servicio:       spFT3ConsultaAlertas
   *    *  Objetivo:       Consulta todas o una alertas existentes en el Sistema.
   *    *  Autor Creación: Andrea Zarabia.
   *    *  Fecha Creación: 13/10/2010
   *   
   *    *  Autor Modific.:
   *    *  Fecha Modific.:
   *    *
   *    *  Entrada:        @vcCodigoParametro  Codigo de parametro
   *    *
   *    *  Salida:         @error              error de salida
   *    *
   *    *  Comentario:     No hay.
   *
   */
   BEGIN

      IF (@vcCodigoParametro = '')
         BEGIN
            /*
            *   SSMA warning messages:
            *   S2SS0064: Possibility of mismatch in LIKE operator behavior.
            */

            SELECT 
               a.vcCodigoParametro, 
               a.vcDescripcionParametro, 
               a.vcValorParametro, 
               b.vcMsgAsunto, 
               b.vcMsgTexto, 
               b.vcMsgFirma
            FROM dbo.tblParametro  AS a, dbo.tblMsAlerta  AS b
            WHERE a.vcCodigoParametro LIKE 'ALR%' AND b.vcCodigoParametro = a.vcCodigoParametro
            ORDER BY a.vcCodigoParametro
         END
      ELSE 
         BEGIN
            /*
            *   SSMA warning messages:
            *   S2SS0064: Possibility of mismatch in LIKE operator behavior.
            */

            SELECT 
               a.vcCodigoParametro, 
               a.vcDescripcionParametro, 
               a.vcValorParametro, 
               b.vcMsgAsunto, 
               b.vcMsgTexto, 
               b.vcMsgFirma
            FROM dbo.tblParametro  AS a, dbo.tblMsAlerta  AS b
            WHERE lower(a.vcCodigoParametro) LIKE rtrim(lower(CAST(coalesce('%' + nullif(ltrim(nullif(rtrim(@vcCodigoParametro), '')), '') + '%', '%') AS nvarchar(4000)))) AND b.vcCodigoParametro = a.vcCodigoParametro
            ORDER BY a.vcCodigoParametro
         END

      IF @@ROWCOUNT < 1
         BEGIN

            SELECT @error = 'NO EXISTEN DATOS'

            RETURN 1

         END

      SELECT @error = ''

      RETURN 0

   END
GO
