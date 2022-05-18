SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[sp_insertar_contribuyente]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_contribuyente] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_contribuyente]
@iRutContribuyente   int,
  @vcNcontribuyente    varchar(1),
  @vcRazonSocial       varchar (200),
  @vcDireccion         varchar(200),
  @vcComuna            varchar(100),
  @vcCorreo            varchar(80),
  @iTelefono           int ,
  @vcGiro              varchar(200),
  @vcPaterno           varchar(40),
  @vcMaterno           varchar(40),
  @vcNombres           varchar(60),
  @vcFecha_crea        varchar(24),
  @vcFecha_act         varchar(24),
  @vcFechaIni          VARCHAR(24),
  @vcCategoria         VARCHAR(30),
  @vcObservacion       VARCHAR(30),
  @salida           int output
/********************************************************************************************
* Sistema        : Servicio Validacion Tributaria Consulta* 
* Descripcion    :  
* Responsable    : CREDEX
* Fecha Creacion : Desconocido
* Observaciones  :
*
*
* Control de Cambios
* Fecha   Responsable      Observaciones
* -----   --------------   -----------------------------------------------------------
* 20/11/2017 RUH           OTD1107
*********************************************************************************************/
 AS
 
BEGIN
DECLARE @sql NVARCHAR(MAX) 
DECLARE @sql2 NVARCHAR(MAX) 
DECLARE @vacio VARCHAR

DECLARE @ultimo VARCHAR (2)
DECLARE @valor VARCHAR (2)
        SET @sql2 = ''
        SET @sql = ''
        SET @vacio =''


BEGIN try   
    
    IF ( @vcFechaIni IS NOT NULL )
    BEGIN
        IF ( @vcFechaIni <> @vacio) 
        BEGIN 
            IF (@vcFechaIni <> 'NO')
            BEGIN
            IF (YEAR(convert(datetime,@vcFechaIni))<1992)
            BEGIN
                SET @vcFechaIni= '1992-12-31'
            END
        END 
        ELSE
            SET @vcFechaIni=''  
        END
        ELSE
            SET @vcFechaIni=''
        END
    ELSE
        SET @vcFechaIni=''


      
    IF NOT EXISTS( select 1 from contribuyente where rutContribuyente=@iRutContribuyente) 
    BEGIN
          
        INSERT INTO contribuyente 
                    (rutContribuyente,
                    nContribuyente,
                    razonSocial,
                    direccion,
                    comuna,
                    correo,
                    telefono,
                    paterno,
                    materno,
                    nombres,
                    fecCreacion,
                    fecActualizacion,
                    fechaInicioActividades,
                    categoria,
                    observacion)
                     
               values (@iRutContribuyente ,
                    @vcNcontribuyente,
                    @vcRazonSocial,
                    @vcDireccion,
                    @vcComuna,
                    @vcCorreo,
                    @iTelefono,
                    @vcPaterno,
                    @vcMaterno,
                    @vcNombres,
                    @vcFecha_crea,
                    @vcFecha_act,
                    @vcFechaIni,
                    @vcCategoria,
                    @vcObservacion)
          
        SET @salida=  1
    END 
    Else
    BEGIN
                  
        IF ( @vcRazonSocial IS NOT NULL )  
            IF (@vcRazonSocial <> @vacio)
                set @sql2 =@sql2+ ' razonSocial= @vcRazonSocial ,'
        IF ( @vcDireccion IS NOT NULL )
            IF (@vcDireccion <> @vacio)
                SET   @sql2 = @sql2   + ' direccion= @vcDireccion,'
        IF ( @vcComuna IS NOT NULL )
            IF (@vcComuna <> @vacio)
                set @sql2 =@sql2+ ' comuna=  @vcComuna ,'
        IF ( @vcCorreo IS NOT NULL )
            IF ( @vcCorreo <> @vacio) 
                SET   @sql2 = @sql2   + ' correo= @vcCorreo,'
        IF ( @iTelefono IS NOT NULL )
            IF ( @vcCorreo <> @vacio) 
                set @sql2 =@sql2+ ' telefono=' + CONVERT(VARCHAR(15), @iTelefono)+','
        IF ( @vcGiro IS NOT NULL )	
            IF ( @vcGiro <> @vacio) 
                SET   @sql2 = @sql2   + ' giro= @vcGiro,'
        IF ( @vcPaterno IS NOT NULL )
            IF ( @vcPaterno <> @vacio) 
                set @sql2 =@sql2+ ' paterno=@vcPaterno,'
        IF ( @vcMaterno IS NOT NULL )
            IF ( @vcMaterno <> @vacio) 
                SET   @sql2 = @sql2   + ' materno= @vcMaterno,'
        IF ( @vcNombres IS NOT NULL )
            IF ( @vcNombres <> @vacio)  
                set @sql2 =@sql2+ ' nombres= @vcNombres,'
        IF ( @vcFecha_crea IS NOT NULL )
            IF ( @vcFecha_crea <> @vacio)  
                SET   @sql2 = @sql2   + ' fecCreacion=@vcFecha_crea,'
        /******IF ( @vcFechaIni IS NOT NULL ) ******/
        /******   IF ( @vcFechaIni <> @vacio)   ******/
        set @sql2 =@sql2+ ' fechaInicioActividades=@vcFechaIni,'
        /****** ******/
        IF ( @vcCategoria IS NOT NULL )
            IF ( @vcCategoria <> @vacio)  
                SET   @sql2 = @sql2   + ' categoria=@vcCategoria,'
        IF ( @vcObservacion IS NOT NULL )
            IF ( @vcObservacion <> @vacio)  
                set @sql2 =@sql2+ ' observacion=@vcObservacion'

        SET @ultimo = SUBSTRING (@sql2, Len(@sql2), 1 )
        SET @valor = char(44);

        IF (@ultimo= @valor)
        BEGIN
            SET @sql2= SUBSTRING (@sql2, 1, Len(@sql2) - 1 )
        END

        IF  ( @sql2 IS NOT NULL )
        begin
            SET @sql = ' UPDATE contribuyente set ' +  @sql2 + ' WHERE rutContribuyente='+CONVERT(VARCHAR(15),@iRutContribuyente)

            EXEC sp_executesql   @sql,   N'@vcRazonSocial nvarchar(200),       
                                      @vcDireccion   nvarchar(200)  ,   
                                      @vcComuna      nvarchar(200)   ,  
                                      @vcCorreo     nvarchar(200)   ,   
                                      @iTelefono   nvarchar(20)   ,   
                                      @vcGiro      nvarchar(200)    ,   
                                      @vcPaterno   nvarchar(200)     ,  
                                      @vcMaterno   nvarchar(200)     ,  
                                      @vcNombres    nvarchar(200)    ,  
                                      @vcFecha_crea  nvarchar(200)   ,  
                                      @vcFecha_act   nvarchar(200)   ,  
                                      @vcFechaIni    nvarchar(200)   ,  
                                      @vcCategoria    nvarchar(200)  ,  
                                      @vcObservacion NVARCHAR(200)',   @vcRazonSocial,       
                                                          @vcDireccion ,       
                                                          @vcComuna    ,       
                                                          @vcCorreo    ,       
                                                          @iTelefono   ,      
                                                          @vcGiro       ,      
                                                          @vcPaterno     ,     
                                                          @vcMaterno      ,    
                                                          @vcNombres     ,     
                                                          @vcFecha_crea  ,     
                                                          @vcFecha_act   ,     
                                                          @vcFechaIni     ,    
                                                          @vcCategoria    ,    
                                                          @vcObservacion ; 
                                   
            SET @salida=  1

        END

    END
    
 end try
begin catch
    SET @salida=  0
end CATCH

RETURN (@salida)

END
GO
