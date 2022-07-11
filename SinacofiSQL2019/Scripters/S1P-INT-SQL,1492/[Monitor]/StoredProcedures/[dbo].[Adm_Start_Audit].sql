SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[Adm_Start_Audit]') IS NULL EXEC('CREATE PROCEDURE [dbo].[Adm_Start_Audit] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[Adm_Start_Audit]
AS
BEGIN
  declare @trac_id   int 
  declare @fecha     varchar(30)
  declare @path      nvarchar(200)
  declare @resultado int   
  declare @von       bit 

  declare @tamano bigint 
  set @tamano = 50

  set @fecha = convert(varchar, getdate(), 120)
  set @fecha = replace(@fecha, ':', '')
  set @fecha = replace(@fecha, '-', '')
  set @fecha = replace(@fecha, ' ', '')
  
  set @path = 'C:\Trace\Atlas_' + @fecha
  exec @resultado = sp_trace_create @trac_id OUTPUT, @options = 2, @tracefile = @path,  @maxfilesize = @tamano


  if @resultado <> 0 
     return(-1)

   --Inicio de sesión.
  set @von= cast(1 as bit )
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =10, @on=@von
  /*** Inicio de sesión, Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =35, @on=@von
  /*** Inicio de sesión, Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =3, @on=@von
  /*** Inicio de sesión, Username Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =11, @on=@von  
  /*** Inicio de sesión, NT Username ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =6, @on=@von
  /*** Inicio de sesión, Client Hostname ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =8, @on=@von
  /*** Inicio de sesión, Starttime  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =14, @on=@von
  /*** Inicio de sesión, End time  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =15, @on=@von
  /*** Inicio de sesión, Text Data  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =14, @columnid =01, @on=@von

  --Termino de sesión.
  /*** Inicio de sesión, Text Data  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =01, @on=@von
  /*** Inicio de sesión, nombre de la aplicación ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =10, @on=@von
  /*** Inicio de sesión, Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =35, @on=@von
  /*** Inicio de sesión, Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =3, @on=@von
  /*** Inicio de sesión, Username Base de datos ***/ 
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =11, @on=@von 
  /*** Inicio de sesión, NT Username ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =6, @on=@von
  /*** Inicio de sesión, Client Hostname ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =8, @on=@von
  /*** Inicio de sesión, Starttime  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =14, @on=@von
  /*** Inicio de sesión, End time  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =15, @columnid =15, @on=@von

  --Creación de objetos.
  /*** Text Data  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =01, @on=@von
  /*** nombre de la aplicación ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =10, @on=@von
  /*** Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =35, @on=@von
  /*** Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =3, @on=@von
  /*** Username Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =11, @on=@von 
  /*** NT Username ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =6, @on=@von
  /*** Client Hostname ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =8, @on=@von
  /*** Starttime  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =14, @on=@von
  /*** End time  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =46, @columnid =15, @on=@von

  --Eliminación de objetos.
  /*** Text Data  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =01, @on=@von
  /*** nombre de la aplicación ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =10, @on=@von
  /*** Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =35, @on=@von
  /*** Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =3, @on=@von
  /*** Username Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =11, @on=@von 
  /*** NT Username ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =6, @on=@von
  /*** Client Hostname ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =8, @on=@von
  /*** Starttime  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =14, @on=@von
  /*** End time  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =47, @columnid =15, @on=@von

  --Select, insert, updade, delete.
  /*** Text Data  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =01, @on=@von
  /*** nombre de la aplicación ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =10, @on=@von
  /*** Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =35, @on=@von
  /*** Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =3, @on=@von
  /*** Username Base de datos ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =11, @on=@von 
  /*** NT Username ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =6, @on=@von
  /*** Client Hostname ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =8, @on=@von
  /*** Starttime  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =14, @on=@von
  /*** End time  ***/
  exec sp_trace_setevent @traceid=@trac_id, @eventid =12, @columnid =15, @on=@von

  --Iniciar traza.
  exec sp_trace_setstatus @traceid = 1,  @status = 1
  if @@error <> 0 
     RETURN(-1)  

END;
GO
