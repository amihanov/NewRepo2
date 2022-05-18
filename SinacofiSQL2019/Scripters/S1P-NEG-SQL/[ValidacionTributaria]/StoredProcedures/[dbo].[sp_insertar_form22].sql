SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[sp_insertar_form22]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sp_insertar_form22] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sp_insertar_form22]
@vc_Estado_codigo varchar (10), 
                                      @iPeriodo         int, 
                                      @iVigente         int,
                                      @vcCod_0315       varchar(25), 
                                      @biCod_0007       bigint, 
                                      @iRut             int, 
                                      @vcCod_9925       NVARCHAR(50), 
                                      @nvcCampos        NVARCHAR(MAX), 
                                      @nvcValores       NVARCHAR(MAX),
                                      @iSalida         INT OUTPUT 
AS 
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
  BEGIN 
      DECLARE @ncSeparador NCHAR(1) 
      DECLARE @vcConcatenaCampos varchar(max) 
      DECLARE @vcConcatenaValores varchar(max) 
      DECLARE @iPosicionCampos int 
      DECLARE @iPosicionValores int 
      DECLARE @ncSQL nvarchar(4000)
    
      DECLARE @cObtieneRF char(2) 
      DECLARE @vcCod_0315_Bd varchar(25) 
      
    

      SET @vcConcatenaCampos='' 
      SET @vcConcatenaValores='''' 
      SET @ncSeparador=',' 
      SET @iPosicionCampos = 1 
      SET @iPosicionValores = 1 
      SET @nvcCampos = @nvcCampos + @ncSeparador 
      SET @nvcValores = @nvcValores + @ncSeparador 

      --Recorrer y concatena Campos 
      WHILE Charindex(@ncSeparador, @nvcCampos, @iPosicionCampos) <> 0 
        BEGIN 
            set @vcConcatenaCampos += Substring(@nvcCampos, @iPosicionCampos, 
                                      Charindex( 
                                      @ncSeparador, @nvcCampos, 
                                      @iPosicionCampos)+ - @iPosicionCampos) 
                                      + ',' 
            SET @iPosicionCampos = Charindex(@ncSeparador, @nvcCampos, 
                                   @iPosicionCampos) 
                                   + 1 
        END 

      --Recorrer y concatena Valores 
      WHILE Charindex(@ncSeparador, @nvcValores, @iPosicionValores) <> 0 
        BEGIN 
            set @vcConcatenaValores += Substring(@nvcValores, @iPosicionValores, 
                                       Charindex(@ncSeparador, @nvcValores, 
                                       @iPosicionValores)+ - @iPosicionValores) 
                                       + ''',''' 
            SET @iPosicionValores = Charindex(@ncSeparador, @nvcValores, 
                                    @iPosicionValores) 
                                    + 1 
        END 

      --quito ultimo caracter 
      select @vcConcatenaCampos = Substring (@vcConcatenaCampos, 1, 
                                         Len(@vcConcatenaCampos) - 1) 

      select @vcConcatenaValores = Substring (@vcConcatenaValores, 1, 
                                          Len(@vcConcatenaValores) - 2) 

      --genero insert 
      SET @ncSQL = 'INSERT INTO form22 ' + '(' 
                   + @vcConcatenaCampos + ') VALUES ' + '(' 
                   + @vcConcatenaValores + ')' 

      select @ncSQL 
        
      
      if Cast(Rtrim(Ltrim(@vc_Estado_codigo)) as int) = 0 
        BEGIN 
          SELECT  @biCod_0007
            IF NOT EXISTS(select 1 from   form22 where  cod_0007 = @biCod_0007) 
              BEGIN --NO existe f22 
                GUARDAR:
                 SELECT @ncSQL 
                  EXEC sp_executesql 
                   @ncSQL 
                     SELECT @iSalida = 1
                     RETURN @iSalida
                  select @cObtieneRF = Substring (@vcCod_9925, 1, 2) 

                  IF @cObtieneRF = 'RF' 
                    BEGIN 
                     
                     
                       
                        DECLARE @vcCod_0315_cur varchar(25), 
                                @iRutCur        int, 
                                @iPeriodoCur    INT,
                                @icod_0007Cur   INT 
                        DECLARE curFormulario CURSOR FOR 
                          Select cod_0315, 
                                 rutContribuyente, 
                                 periodo, cod_0007
                          from   form22 
                          where  rutContribuyente = @iRut 
                             and periodo = @iPeriodo 

                        -- Apertura del cursor 
                        

                        OPEN curFormulario 

                        -- Lectura de la primera fila del cursor 
                        FETCH curFormulario INTO @vcCod_0315_cur, @iRutCur, 
                        @iPeriodoCur, @icod_0007Cur

                        WHILE ( @@FETCH_STATUS = 0 ) 
                          BEGIN 
                             
                        select Cast(@vcCod_0315 as datetime) 
                        select Cast(@vcCod_0315_cur as datetime) 
                        
                        
                              if Cast(@vcCod_0315 as datetime) > Cast(@vcCod_0315_cur as datetime) 
                                BEGIN 
                                    SELECT 'entre fecha viene es mayor a BD ' 

                                    update form22 
                                    set    vigente = 0 
                                    where  cod_0007= @icod_0007Cur
                                END 
                                 ELSE
                                  BEGIN
                                    -- Desactivo el actual no vigente
                                    update form22 
                                    set    vigente = 0 
                                    where cod_0007= @biCod_0007
                                  END

                              -- Lectura de la siguiente fila del cursor 
                              FETCH curFormulario INTO @vcCod_0315_cur, @iRutCur 
                              , 
                              @iPeriodoCur 
                          END 

                        -- Cierre del cursor 
                        CLOSE curFormulario 

                        -- Liberar los recursos 
                        DEALLOCATE curFormulario 
                         
                    END 
                  else 
                    BEGIN 
                        SELECT 'No viene FR' 
                    END -- no RF 
              END --NO existe f22 
            else 
              BEGIN --existe f22 validamos 
                update form22
                set    vigente = 1
                where  cod_0007= @biCod_0007
                 
                ---Borramos si existe el formulario para actualizarlo con las ultimas modificaciones que pueda tener
                DELETE FROM form22 WHERE cod_0007 = @biCod_0007
                --Saltamos para realize el proceso de guardado
                GOTO GUARDAR     

                SELECT @iSalida = 0
                RETURN @iSalida
                   --  SELECT 'Existe formulario  '
              
              END --existe f22 
        END --estado codigo 
      else 
        BEGIN --estado codigo <> 0 
           if Cast(Rtrim(Ltrim(@vc_Estado_codigo)) as int) = 1
           BEGIN 
            SET @iSalida= 0 
            update form22 
            set    vigente = 0 
            where cod_0007= @biCod_0007
            
               SELECT @iSalida = 0
               RETURN @iSalida
            END
        END 
        RETURN(@iSalida)
  END --fin
GO
