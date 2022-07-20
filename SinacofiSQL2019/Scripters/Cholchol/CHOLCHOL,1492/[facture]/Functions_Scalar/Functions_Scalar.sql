
GO
--SqlScripter----[dbo].[Base64Decode].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[Base64Decode]') IS NULL EXEC('CREATE FUNCTION [dbo].[Base64Decode] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[Base64Decode]
( @Input NVARCHAR(4000) )

RETURNS VARCHAR(4000)
BEGIN
--SP1 SE 5.2
  declare @source varbinary(max), @encoded varchar(max), @decoded varbinary(max), @decoded_varchar varchar(max)
  declare @vi_esb64 varchar(10)

  set @vi_ESb64 = dbo.esBase64(@Input);

  IF ( @vi_esb64 = 'S' )
    begin 
      set @encoded = @Input
      set @decoded = cast('' as xml).value('xs:base64Binary(sql:variable("@encoded"))', 'varbinary(max)')
      set @decoded_varchar=convert(varchar(max), @decoded) 

      RETURN @decoded_varchar

    end

  RETURN @Input

END
GO

GO
--SqlScripter----[dbo].[Cantidad_Cola].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[Cantidad_Cola]') IS NULL EXEC('CREATE FUNCTION [dbo].[Cantidad_Cola] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[Cantidad_Cola]
(@p_ColaServicio  varchar(30), 
					@p_CodiServicio  varchar(30), @p_estado varchar(4)
							 ) 
RETURNS numeric(9)
begin
	
	declare @v_cantidad numeric(9)
  
	set @v_cantidad = 0

	if (@p_ColaServicio='0')
	begin
		return @v_cantidad
	end

	if (@p_ColaServicio='qse_docu_serv') and (@p_CodiServicio <> 'dte_envi_clie')
		begin
			select @v_cantidad = count(codi_serv)
			from QSE_DOCU_SERV
			where esta_proc = @p_estado
			and codi_serv = @p_CodiServicio
		end
		
		
	if (@p_ColaServicio='qse_docu_serv') and (@p_CodiServicio = 'dte_envi_clie')
		begin
			/*select @v_cantidad = count(codi_serv)
			from QSE_DOCU_SERV
			where esta_proc = @p_estado
			and codi_serv = @p_CodiServicio*/

			Select @v_cantidad = count(a.codi_serv)
			From QSE_DOCU_SERV a INNER JOIN dte_enca_docu b ON a.esta_proc = @p_estado
			and a.codi_serv = @p_CodiServicio
			and b.codi_emex=a.codi_emex
			and b.codi_empr=a.codi_empr
			and b.tipo_docu=a.tipo_docu
			and b.foli_docu=a.foli_docu
			and exists (select c.cont_rutt from pers_publ c where c.cont_rutt = b.rutt_rece)

		end
	
	if (@p_ColaServicio='DBQ_GRPO') and (@p_CodiServicio <> 'dbq_scan_arch')
		begin
			select @v_cantidad = count(codi_serv) 
				from DBQ_GRPO
				where esta_grpo = @p_estado
				and codi_serv = @p_CodiServicio
		end
		
	if (@p_ColaServicio='DBQ_ARCH') and (@p_CodiServicio <> 'dbq_envi_mail')
		begin
			select @v_cantidad = count(codi_serv) 
				from DBQ_ARCH
				where esta_arch = @p_estado
				and codi_serv = @p_CodiServicio
		end
		
	return @v_cantidad

end
GO

GO
--SqlScripter----[dbo].[Cantidad_Moni].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[Cantidad_Moni]') IS NULL EXEC('CREATE FUNCTION [dbo].[Cantidad_Moni] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[Cantidad_Moni]
( @p_CodiServicio varchar(30), 
		  @p_contadorBuscado varchar (4)
		) 

RETURNS numeric(9)
AS
begin
	declare	@v_cantidad         numeric(9)

	set @v_cantidad = 0
  
	if (@p_contadorBuscado='OPER')
	begin
		select @v_cantidad = isnull(sum(MOPR_NUME_OPER),0)  
			from dbn_moni_proc
			where 
			codi_serv = @p_CodiServicio
			and convert(char(10),mopr_fech_repo,120)=convert(char(10),getDate(),120)
			--where MOPR_SEMA_ESTA = 'ON'
			
	end


	
	return @v_cantidad
end
GO

GO
--SqlScripter----[dbo].[CantidadMoniCola].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[CantidadMoniCola]') IS NULL EXEC('CREATE FUNCTION [dbo].[CantidadMoniCola] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[CantidadMoniCola]
( 
							@p_CodiServicio  varchar(30), 
							@p_PeriCola  numeric(12)) 
RETURNS numeric(9)
begin
	declare @v_cantidad numeric(9)
	set @v_cantidad = 0
		select @v_cantidad = isnull(most_suma_cola,0)
		from dbn_moni_cola
		where codi_serv=@p_CodiServicio
		and most_peri_oper=@p_PeriCola
   
	return @v_cantidad
end
GO

GO
--SqlScripter----[dbo].[dbn_val_expresion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbn_val_expresion]') IS NULL EXEC('CREATE FUNCTION [dbo].[dbn_val_expresion] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[dbn_val_expresion]
(@p_valor1 varchar(200),@p_valor2 varchar(200)) returns  numeric(1) as
begin 
--SP1 SE 5.2
  if @p_valor1= ':P_PAR1' 
    begin
      return 1
    end
  else
    begin
      if @p_valor1 = @p_valor2 
        return 1
    end

  return 0
end
GO

GO
--SqlScripter----[dbo].[dbnet_get_cult].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_get_cult]') IS NULL EXEC('CREATE FUNCTION [dbo].[dbnet_get_cult] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[dbnet_get_cult]
() returns varchar  as
begin
  declare @p_codi_cult varchar(30)
   select @p_codi_cult=s.codi_cult
     from sys_session s, sys_connection c
     where s.corr_sess=c.corr_sess
           and corr_conn=@@SPID
   return (@p_codi_cult)
end
GO

GO
--SqlScripter----[dbo].[dbnet_get_emex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbnet_get_emex]') IS NULL EXEC('CREATE FUNCTION [dbo].[dbnet_get_emex] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[dbnet_get_emex]
()  returns varchar(30)  as
begin
--SP1 SE 5.2
  declare @p_codi_emex varchar(30)
   select @p_codi_emex=s.codi_emex
     from sys_session s, sys_connection c
     where s.corr_sess=c.corr_sess
           and corr_conn=@@SPID
   return (@p_codi_emex)
end
GO

GO
--SqlScripter----[dbo].[dbnet_get_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_get_empr]') IS NULL EXEC('CREATE FUNCTION [dbo].[dbnet_get_empr] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[dbnet_get_empr]
() returns numeric(4) as
begin
  declare @p_codi_empr numeric(9)
   select @p_codi_empr=s.codi_empr
     from sys_session s, sys_connection c
     where s.corr_sess=c.corr_sess
           and corr_conn=@@SPID
   return (@p_codi_empr)
end
GO

GO
--SqlScripter----[dbo].[dbnet_get_modu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_get_modu]') IS NULL EXEC('CREATE FUNCTION [dbo].[dbnet_get_modu] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[dbnet_get_modu]
() returns varchar  as
begin
  declare @p_codi_modu varchar(30)
   select @p_codi_modu=s.codi_modu
     from sys_session s, sys_connection c
     where s.corr_sess=c.corr_sess
           and corr_conn=@@SPID
   return (@p_codi_modu)
end
GO

GO
--SqlScripter----[dbo].[dbnet_get_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_get_pers]') IS NULL EXEC('CREATE FUNCTION [dbo].[dbnet_get_pers] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[dbnet_get_pers]
() returns varchar  as
begin
  declare @p_codi_pers varchar(30)
   select @p_codi_pers=s.codi_pers
     from sys_session s, sys_connection c
     where s.corr_sess=c.corr_sess
           and corr_conn=@@SPID
   return (@p_codi_pers)
end
GO

GO
--SqlScripter----[dbo].[dbnet_get_rous].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_get_rous]') IS NULL EXEC('CREATE FUNCTION [dbo].[dbnet_get_rous] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[dbnet_get_rous]
() returns varchar  as
begin
  declare @p_codi_rous varchar(30)
   select @p_codi_rous=s.codi_rous
     from sys_session s, sys_connection c
     where s.corr_sess=c.corr_sess
           and corr_conn=@@SPID
   return (@p_codi_rous)
end
GO

GO
--SqlScripter----[dbo].[dbnet_get_usua].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_get_usua]') IS NULL EXEC('CREATE FUNCTION [dbo].[dbnet_get_usua] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[dbnet_get_usua]
() returns varchar  as
begin
  declare @p_codi_usua varchar(30)
   select @p_codi_usua=s.codi_usua
     from sys_session s, sys_connection c
     where s.corr_sess=c.corr_sess
           and corr_conn=@@SPID
   return (@p_codi_usua)
end
GO

GO
--SqlScripter----[dbo].[esBase64].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[esBase64]') IS NULL EXEC('CREATE FUNCTION [dbo].[esBase64] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[esBase64]
(@p_texto varchar(4000)) returns varchar(1) 
begin
declare
  @vi_largo numeric(10),
  @vi_index int,
  @vi_valor numeric(10),
  @vi_carac varchar(1)

  set  @vi_largo = len(@p_texto);
  set  @vi_index = 1;
--SP1 SE 5.2
  while (@vi_index <= @vi_largo) 
    begin
      set @vi_carac = substring(@p_texto,@vi_index,1)
      set @vi_valor = ascii(@vi_carac)
      -- 43       Caracter +
      -- 47       Caracter /
      -- 48 - 57  Caracter 0-9
      -- 61       Caracter =
      -- 65 - 90  Caracter A -Z
      -- 97 - 122 Caracter a - z
      if  @vi_valor < 10 or                               
         (@vi_valor > 10 and @vi_valor <43)  or           
         (@vi_valor > 43 and @vi_valor <47)  or           
         (@vi_valor > 57 and @vi_valor < 61) or 
         (@vi_valor > 61 and @vi_valor < 65) or 
         (@vi_valor > 90 and @vi_valor < 97) or   
         (@vi_valor > 122 )   
        begin
          return 'N'; -- No es base 64
        end 
      else
        begin
          set @vi_index = @vi_index + 1
        end
    end

    return 'S'; -- Es base 64

end
GO

GO
--SqlScripter----[dbo].[get_arch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[get_arch]') IS NULL EXEC('CREATE FUNCTION [dbo].[get_arch] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[get_arch]
(
   @TIPO	VARCHAR(3), /* DTE , ENV      */
   @RUTT_EMIS   NUMERIC(10),
   @TIPO_DOCU   NUMERIC(3),
   @FOLI_DOCU   NUMERIC(22),
   @CORR_ENVI	NUMERIC(22),
   @EXT		VARCHAR(4), /* PDF, HTML, XML */
   @FIR		VARCHAR(1)  /* S O N          */
)
RETURNS VARCHAR(500)
AS
BEGIN
   DECLARE @NOMB_ARCH  VARCHAR(250)
   
   IF (@TIPO='DTE')
     SET @NOMB_ARCH = 'E' + dbo.lpad(@RUTT_EMIS,9,'0') +
		      'T' + dbo.lpad(@TIPO_DOCU, 3,'0') +
		      'F' + dbo.lpad(@FOLI_DOCU,10,'0')
   ELSE IF (@TIPO = 'ENV')
     SET @NOMB_ARCH = 'ENVFIN_' + LTRIM(STR(@CORR_ENVI))

   ELSE IF (@TIPO = 'DTO') 
     SET @NOMB_ARCH = 'R' + dbo.lpad(@RUTT_EMIS,9,'0') +
     		  'T' + dbo.lpad(@TIPO_DOCU, 3,'0') +
		  'F' + dbo.lpad(@FOLI_DOCU,10,'0')
   ELSE IF (@TIPO = 'REC') 
   	SET @NOMB_ARCH = 'RECE_ENVI_' + LTRIM(STR(@CORR_ENVI))
   


   IF @FIR = 'S'
     SET @NOMB_ARCH = @NOMB_ARCH + '_sign.' + @ext
   ELSE IF @FIR = 'C'
     SET @NOMB_ARCH = @NOMB_ARCH + 'c01_sign.' + @ext
   ELSE
     SET @NOMB_ARCH = @NOMB_ARCH + '.' + @ext
   
   RETURN @NOMB_ARCH
END
GO

GO
--SqlScripter----[dbo].[get_arch_trama].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_arch_trama]') IS NULL EXEC('CREATE FUNCTION [dbo].[get_arch_trama] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[get_arch_trama]
(@trama VARCHAR(250)) 
RETURNS VARCHAR(250) AS
BEGIN
   DECLARE @arch_dte VARCHAR(250)
   SELECT @arch_dte = dbo.GET_ARCH('DTE',E.RUTT_EMPR,L.TIPO_DOCU,L.FOLI_DOCU,NULL,'','')
   FROM	  DTE_ANOTO L,EMPR E
	  WHERE L.NUME_TRAM = @trama
	  AND E.CODI_EMPR = L.CODI_EMPR
   RETURN (@arch_dte)
END
GO

GO
--SqlScripter----[dbo].[get_color_subfase].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[get_color_subfase]') IS NULL EXEC('CREATE FUNCTION [dbo].[get_color_subfase] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[get_color_subfase]
(
   @P_CODI_EMPR   NUMERIC(3),
   @P_TIPO_DOCU   NUMERIC(3),
   @P_FOLI_DOCU   NUMERIC(22),
   @P_ESTA_DOCU   VARCHAR(3),
   @P_CORR_ENVI   NUMERIC(22),
   @P_ESTA_DOCU1  VARCHAR(3),
   @P_CORR_ENVI1  NUMERIC(22),
   @P_NUME_FASE   NUMERIC(3),
   @P_NUME_SUBF   NUMERIC(3)
   
)
RETURNS NUMERIC(3)
AS
BEGIN
   DECLARE @V_COLOR_SUB  VARCHAR(30)
   DECLARE @V_COLOR  VARCHAR(30)
   DECLARE @V_FASE  VARCHAR(10)
   SET @V_COLOR=DBO.GET_DTE_FASE(@P_CODI_EMPR,@P_TIPO_DOCU,@P_FOLI_DOCU,@P_ESTA_DOCU,@P_CORR_ENVI,@P_ESTA_DOCU1,@P_CORR_ENVI1,'COLO','')  
   
   SET @V_FASE=DBO.GET_DTE_FASE(@P_CODI_EMPR,@P_TIPO_DOCU,@P_FOLI_DOCU,@P_ESTA_DOCU,@P_CORR_ENVI,@P_ESTA_DOCU1,@P_CORR_ENVI1,'FASE',@P_NUME_FASE)  
   SET @V_COLOR_SUB='WHITE' 
   IF substring(@V_FASE,1,1)> @P_NUME_SUBF 
   	SET @V_COLOR_SUB= 'GREEN' 
   ELSE IF substring(@V_FASE,1,1)= @P_NUME_SUBF
	SET @V_COLOR_SUB=  UPPER(@V_COLOR)
   
   IF @V_COLOR_SUB='GREEN'
		  RETURN (0)
   ELSE IF @V_COLOR_SUB='YELLOW'
		  RETURN (1)
   ELSE IF @V_COLOR_SUB='RED'
		  RETURN (2)
   RETURN (3)
END
GO

GO
--SqlScripter----[dbo].[get_color_subfase_dto].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[get_color_subfase_dto]') IS NULL EXEC('CREATE FUNCTION [dbo].[get_color_subfase_dto] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[get_color_subfase_dto]
(
   @P_CODI_EMPR	NUMERIC(3),
   @P_CORR_ENVI	NUMERIC(22),
   @P_ESTA_ENVI   VARCHAR(22),
   @P_TIPO_DOCU	NUMERIC(3),
   @P_FOLI_DOCU	NUMERIC(22),
   @P_ESTA_DOCU   VARCHAR(3),
   @P_CODI_ESAP   VARCHAR(3),
   @P_NUME_FASE   NUMERIC(3),
   @P_NUME_SUBF   NUMERIC(3)
   
)
RETURNS NUMERIC(3)
AS
BEGIN
   DECLARE @V_COLOR_SUB  VARCHAR(30)
   DECLARE @V_COLOR  VARCHAR(30)
   DECLARE @V_FASE  VARCHAR(10)
   SET @V_COLOR=DBO.GET_DTO_FASE(@P_CODI_EMPR,@P_CORR_ENVI,@P_ESTA_ENVI ,@P_TIPO_DOCU, @P_FOLI_DOCU, @P_ESTA_DOCU, @P_CODI_ESAP, 'COLO','')
   SET @V_FASE = DBO.GET_DTO_FASE(@P_CODI_EMPR,@P_CORR_ENVI,@P_ESTA_ENVI ,@P_TIPO_DOCU, @P_FOLI_DOCU, @P_ESTA_DOCU, @P_CODI_ESAP, 'FASE',@P_NUME_FASE)
   SET @V_COLOR_SUB='WHITE' 
   IF substring(@V_FASE,1,1)> @P_NUME_SUBF 
   	SET @V_COLOR_SUB= 'GREEN' 
   ELSE IF substring(@V_FASE,1,1)= @P_NUME_SUBF
	SET @V_COLOR_SUB=  UPPER(@V_COLOR)
   ELSE IF substring(@V_FASE,1,1)= @P_NUME_SUBF
	SET @V_COLOR_SUB=  'WHITE'
   
   IF @V_COLOR_SUB='GREEN'
		  RETURN (0)
   ELSE IF @V_COLOR_SUB='YELLOW'
		  RETURN (1)
   ELSE IF @V_COLOR_SUB='RED'
		  RETURN (2)
   RETURN (3)
END
GO

GO
--SqlScripter----[dbo].[get_dte_fase].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[get_dte_fase]') IS NULL EXEC('CREATE FUNCTION [dbo].[get_dte_fase] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[get_dte_fase]
(
   @P_CODI_EMPR   NUMERIC(3),
   @P_TIPO_DOCU   NUMERIC(3),
   @P_FOLI_DOCU   NUMERIC(22),
   @P_ESTA_DOCU   VARCHAR(3),
   @P_CORR_ENVI   NUMERIC(22),
   @P_ESTA_DOCU1  VARCHAR(3),
   @P_CORR_ENVI1  NUMERIC(22),
   @PAR1   	VARCHAR(20),
   @PAR2   	VARCHAR(20)
)
RETURNS VARCHAR(500)
AS
BEGIN
   DECLARE @V_ESTA_ENVI  VARCHAR(3)
   DECLARE @V_ESTA_ENVI1 VARCHAR(3)
   DECLARE @V_FASE1      NUMERIC(3)
   DECLARE @V_MAX_FASE1  NUMERIC(3)
   DECLARE @V_FASE2      NUMERIC(3)
   DECLARE @V_MAX_FASE2  NUMERIC(3)
   DECLARE @V_FASE3      NUMERIC(3)
   DECLARE @V_MAX_FASE3  NUMERIC(3)
   DECLARE @V_FASE4      NUMERIC(3)
   DECLARE @V_MAX_FASE4  NUMERIC(3)
   DECLARE @V_FASE5      NUMERIC(3)
   DECLARE @V_MAX_FASE5  NUMERIC(3)
   DECLARE @V_RUTT_EMPR  NUMERIC(10)
   DECLARE @V_ARCH_PREF  VARCHAR(100)
   DECLARE @V_ARCH_SUFI  VARCHAR(100)
   DECLARE @V_ARCH_EXTE  VARCHAR(100)
   DECLARE @V_ARCH_ENSA  VARCHAR(1) 
   DECLARE @V_ARCH_DIRE  VARCHAR(100)
   DECLARE @V_ORIG_ESDO  VARCHAR(10)
   DECLARE @V_COLO_ESDO  VARCHAR(30)
   DECLARE @V_DESC_ESDO  VARCHAR(100)
   DECLARE @V_HELP_ESDO  VARCHAR(500)
   DECLARE @V_HELP_ESDO2  VARCHAR(500)
   DECLARE @V_NOMB_ARCH  VARCHAR(250)
   DECLARE @V_ESTA_DESP  VARCHAR(10)
   DECLARE @P_DIRE_ARCH  VARCHAR(100)
   DECLARE @V_HELP_PERS  VARCHAR(1000)

   
   
   DECLARE @NULO       VARCHAR(1)
   SET     @NULO = ''

   /* Busca el estado del envio al SII, si existe */
   BEGIN
     SELECT @V_ESTA_ENVI = ESTA_ENVI 
     FROM  DTE_ENVI_DOCU
     WHERE CODI_EMPR = @P_CODI_EMPR
     AND   CORR_ENVI = @P_CORR_ENVI
     IF (@@ROWCOUNT = 0)
       SET @V_ESTA_ENVI = @NULO
   END
        
   /* Busca el estado del envio a otro contribuyente, si existe */
   BEGIN
     SELECT @V_ESTA_ENVI1 = ESTA_ENVI 
     FROM  DTE_ENVI_DOCU
     WHERE CODI_EMPR = @P_CODI_EMPR
     AND   CORR_ENVI = @P_CORR_ENVI1
     IF (@@ROWCOUNT = 0)
       SET @V_ESTA_ENVI1 = @NULO
   END
   
   BEGIN
     SELECT @V_MAX_FASE1 = ISNULL(MAX(ORDE_ESDO),0)
     FROM   DTE_FASE_ESTA
     WHERE  FASE_ESDO = 1
   END
   BEGIN
     SELECT @V_MAX_FASE2 = ISNULL(MAX(ORDE_ESDO),0)
     FROM   DTE_FASE_ESTA
     WHERE  FASE_ESDO = 2
   END
   BEGIN
     SELECT @V_MAX_FASE3 = ISNULL(MAX(ORDE_ESDO),0)
     FROM   DTE_FASE_ESTA
     WHERE  FASE_ESDO = 3
   END
   BEGIN
     SELECT @V_MAX_FASE4 = ISNULL(MAX(ORDE_ESDO),0)
     FROM   DTE_FASE_ESTA
     WHERE  FASE_ESDO = 4
   END
   BEGIN
     SELECT @V_MAX_FASE5 = ISNULL(MAX(ORDE_ESDO),0)
     FROM   DTE_FASE_ESTA
     WHERE  FASE_ESDO = 5
   END
   
   BEGIN
	SELECT @V_FASE1 = ORDE_ESDO,
	    @V_FASE2 = 0,
	    @V_FASE3 = 0,
	    @V_FASE4 = 0,
	    @V_FASE5 = 0,
	    @V_ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
	    @V_ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
	    @V_ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
	    @V_ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
	    @V_ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
	    @V_COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
	    @V_ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
	    @V_HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
	    @V_HELP_ESDO2 = ISNULL(HELP_ESDO2,@NULO),
	    @V_ESTA_DESP= ESTA_DESP
	FROM   DTE_FASE_ESTA
	WHERE  FASE_ESDO = 1
	AND    ESTA_DOCU = @P_ESTA_DOCU
	AND    ISNULL(@V_ESTA_ENVI,@NULO) = @NULO
	AND    ISNULL(@V_ESTA_ENVI1,@NULO) = @NULO
	IF (@@ROWCOUNT = 0)
	BEGIN
		SELECT @V_FASE1 = 99,
		      @V_FASE2 = ORDE_ESDO,
		      @V_FASE3 = 0,
		      @V_FASE4 = 0,
		      @V_FASE5 = 0,
		      @V_ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
		      @V_ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
		      @V_ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
		      @V_ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
		      @V_ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
		      @V_COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
		      @V_ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
		      @V_HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
		      @V_HELP_ESDO2 = ISNULL(HELP_ESDO2,@NULO),
		      @V_ESTA_DESP= ESTA_DESP
		FROM   DTE_FASE_ESTA
		WHERE  FASE_ESDO = 2
		AND    ESTA_DOCU = @P_ESTA_DOCU
		AND    ISNULL(ESTA_ENVI ,@NULO) = ISNULL(@V_ESTA_ENVI,@NULO)
		AND    @P_CORR_ENVI1 IS NULL
	        IF (@@ROWCOUNT = 0)
		BEGIN
			 SELECT @V_FASE1 = 99,
				@V_FASE2 = 99,
				@V_FASE3 = ORDE_ESDO,
				@V_FASE4 = 0,
				@V_FASE5 = 0,
				@V_ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
				@V_ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
				@V_ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
				@V_ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
				@V_ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
				@V_COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
				@V_ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
				@V_HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
				@V_HELP_ESDO2 = ISNULL(HELP_ESDO2,@NULO),
				@V_ESTA_DESP= ESTA_DESP
			 FROM   DTE_FASE_ESTA
			 WHERE  FASE_ESDO = 3
			 AND    ESTA_DOCU1 = @P_ESTA_DOCU1
			 AND    ESTA_ENVI1 = @V_ESTA_ENVI1
			 IF (@@ROWCOUNT = 0)
		 	 BEGIN
				SELECT  @V_FASE1 = 99,
					@V_FASE2 = 99,
					@V_FASE3 = 99,
					@V_FASE4 = ORDE_ESDO,
					@V_FASE5 = 0,
					@V_ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
					@V_ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
					@V_ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
					@V_ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
					@V_ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
					@V_COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
					@V_ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
					@V_HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
					@V_HELP_ESDO2 = ISNULL(HELP_ESDO2,@NULO),
					@V_ESTA_DESP= ESTA_DESP
				 FROM   DTE_FASE_ESTA
				 WHERE  FASE_ESDO = 4
				 AND    ESTA_DOCU1 = @P_ESTA_DOCU1
				 AND    ESTA_ENVI1 = @V_ESTA_ENVI1

				IF (@@ROWCOUNT = 0)
				BEGIN
					SELECT  @V_FASE1 = 99,
						@V_FASE2 = 99,
						@V_FASE3 = 99,
						@V_FASE4 = 99,
						@V_FASE5 = ORDE_ESDO,
						@V_ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
						@V_ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
						@V_ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
						@V_ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
						@V_ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
						@V_COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
						@V_ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
						@V_HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
						@V_HELP_ESDO2 = ISNULL(HELP_ESDO2,@NULO),
						@V_ESTA_DESP= ESTA_DESP
					FROM   DTE_FASE_ESTA
					WHERE  FASE_ESDO = 5
					AND    ESTA_DOCU1 = @P_ESTA_DOCU1
					AND    ESTA_ENVI1 = @V_ESTA_ENVI1
					IF (@@ROWCOUNT = 0)
					BEGIN
						  SET @V_FASE1 = 0
						  SET @V_FASE2 = 0
						  SET @V_FASE3 = 0
						  SET @V_FASE4 = 0
						  SET @V_FASE5 = 0
					END
                 		END 
           	 	END         
         	END
         END
   END
   
   IF @PAR1 = 'FASE'		/* FASE DEL DOCUMENTO 1-2 LUGAR 1 DE UN MAXIMO DE 2 */
   BEGIN
     IF @PAR2 = 1
       RETURN LTRIM(STR(@V_FASE1)) + '-' + LTRIM(STR(@V_MAX_FASE1))
     ELSE IF @PAR2 = 2
       RETURN LTRIM(STR(@V_FASE2)) + '-' + LTRIM(STR(@V_MAX_FASE2))
     ELSE IF @PAR2 = 3
       RETURN LTRIM(STR(@V_FASE3)) + '-' + LTRIM(STR(@V_MAX_FASE3))
     ELSE IF @PAR2 = 4
       RETURN LTRIM(STR(@V_FASE4)) + '-' + LTRIM(STR(@V_MAX_FASE4))
     ELSE IF @PAR2 = 5
       RETURN LTRIM(STR(@V_FASE5)) + '-' + LTRIM(STR(@V_MAX_FASE5))  
   END
   ELSE IF @PAR1 = 'ENSA'	/* INDICADOR DE ENTRADA O SALIDA 	    */
        RETURN @V_ARCH_ENSA
   ELSE IF @PAR1 = 'DIRE'	/* DIRECTORIO DONDE SE ENCUENTRA EL ARCHIVO */
        BEGIN
        IF @V_ARCH_ENSA = 'S'
	BEGIN
		select @P_DIRE_ARCH = VALO_PAEM
		from   PARA_EMPR
		where CODI_EMPR=@P_CODI_EMPR
		AND   TIPO_COMO='ALL'
		AND   CODI_PAEM='EDS0'

                IF (@@rowcount = 0)
		BEGIN
			select @P_DIRE_ARCH=PARAM_VALUE
			from   SYS_PARAM
			where  PARAM_NAME='EGATE_DIRE_SALI'
		END
	END
	ELSE IF @V_ARCH_ENSA = 'E'
	BEGIN
		select @P_DIRE_ARCH = VALO_PAEM
		from   PARA_EMPR
		where CODI_EMPR=@P_CODI_EMPR
		AND   TIPO_COMO='ALL'
		AND   CODI_PAEM='EDE0'

                IF (@@rowcount = 0)
		BEGIN
			select @P_DIRE_ARCH=PARAM_VALUE
			from   SYS_PARAM
			where  PARAM_NAME='EGATE_DIRE_ENTR'
		END

	END
        /*execute dte_vali_digi '123456','3',@p_existe,@p_mensaje  */

        RETURN @P_DIRE_ARCH + '\' + @V_ARCH_DIRE
   END
   ELSE IF @PAR1 = 'ARCH'	/* NOMBRE DEL ARCHIVO 		 	    */
   BEGIN
   	IF @V_FASE5 > 0 
	BEGIN
		SELECT @V_NOMB_ARCH=ARCH_RESP FROM DTE_ENCA_DOCU WHERE
		CODI_EMPR = @P_CODI_EMPR AND TIPO_DOCU = @P_TIPO_DOCU 
		AND FOLI_DOCU = @P_FOLI_DOCU
		RETURN @V_NOMB_ARCH
		
	END
     	ELSE IF @V_ORIG_ESDO = 'DTE'
     	BEGIN
     		-- Busca el rutt del Emisor
     		SELECT @V_NOMB_ARCH = @V_ARCH_PREF +
                           	'E' + dbo.lpad(RUTT_EMPR ,9,'0') +
                           	'T' + dbo.lpad(@P_TIPO_DOCU, 3,'0') +
                           	'F' + dbo.lpad(@P_FOLI_DOCU,10,'0') + 
                           	@V_ARCH_SUFI + @V_ARCH_EXTE
       			FROM   EMPR
       			WHERE CODI_EMPR = @P_CODI_EMPR
       		IF (@@ROWCOUNT = 0)
        		SET @V_NOMB_ARCH = @NULO

       		RETURN @V_NOMB_ARCH
     		
     	END
     	ELSE IF @V_ORIG_ESDO = 'ENVIO' AND @P_CORR_ENVI1 IS NULL
        	RETURN @V_ARCH_PREF + LTRIM(STR(ISNULL(@P_CORR_ENVI,0))) + @V_ARCH_SUFI + @V_ARCH_EXTE
     	ELSE
        	RETURN @V_ARCH_PREF + LTRIM(STR(ISNULL(@P_CORR_ENVI1,0))) +  @V_ARCH_SUFI + @V_ARCH_EXTE
   END
   ELSE IF @PAR1 = 'DESC'	/* DESCRIPCION DEL ESTADO DEL DOCUMENTO */
   BEGIN
     	
	IF @V_ESTA_DESP = 'esta_docu' 
	         SELECT @V_DESC_ESDO=DESC_ESDO
	         FROM   DTE_ESTA_DOCU
	         WHERE  ESTA_DOCU = @P_ESTA_DOCU
	ELSE IF @V_ESTA_DESP = 'esta_docu1'  
	         SELECT @V_DESC_ESDO=DESC_ESDO
	         FROM   DTE_ESTA_DOCU
	         WHERE  ESTA_DOCU = @P_ESTA_DOCU1
	ELSE IF @V_ESTA_DESP = 'esta_envi'  
	         SELECT @V_DESC_ESDO=DESC_ESEN
	         FROM   DTE_ESTA_ENVI
	         WHERE  ESTA_ENVI = @V_ESTA_ENVI
	ELSE IF @V_ESTA_DESP = 'esta_envi1'  
	         SELECT @V_DESC_ESDO=DESC_ESEN
	         FROM   DTE_ESTA_ENVI
	         WHERE  ESTA_ENVI = @V_ESTA_ENVI1
	    	
     	IF (@@ROWCOUNT = 0)
     	   SET @V_DESC_ESDO = @NULO
     	
     	RETURN @V_DESC_ESDO
   END
   ELSE IF @PAR1 = 'COLO'
     RETURN ISNULL(@V_COLO_ESDO,'GREEN')
   ELSE IF @PAR1 = 'HELP'
      BEGIN
        IF @V_ORIG_ESDO = 'DTE'
          SELECT @V_HELP_PERS = HELP_ESDO
      	  FROM   DTE_ESTA_DOCU
      	  WHERE  ESTA_DOCU = @P_ESTA_DOCU
        ELSE IF @V_ORIG_ESDO = 'ENVIO'
          SELECT @V_HELP_PERS = HELP_ESEN
      	  FROM   DTE_ESTA_ENVI
      	  WHERE  ESTA_ENVI = @V_ESTA_ENVI
         
        SET @V_HELP_ESDO = @V_HELP_ESDO 
		SET @V_HELP_ESDO2 = @V_HELP_ESDO2 
        --RETURN ISNULL(@V_HELP_ESDO,@NULO) + ' ' +  ISNULL(@V_HELP_PERS,@NULO) 
		RETURN ISNULL(@V_HELP_ESDO,@NULO) + ' ' +  ISNULL(@V_HELP_ESDO,@NULO) + ' ' +  ISNULL(@V_HELP_PERS,@NULO) 
   END
   ELSE IF @PAR1 = 'ESTA' 
   BEGIN
     	IF @V_ESTA_DESP = 'esta_docu' 
 		RETURN(@P_ESTA_DOCU)
        ELSE IF @V_ESTA_DESP = 'esta_docu1'  
         	RETURN(@P_ESTA_DOCU1)
        ELSE IF @V_ESTA_DESP = 'esta_envi'  
 		RETURN(@V_ESTA_ENVI)
        ELSE IF @V_ESTA_DESP = 'esta_envi1'  
 		RETURN(@V_ESTA_ENVI1)
        
   END 
   
   RETURN 0
END
GO

GO
--SqlScripter----[dbo].[get_dte_fase_v1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_fase_v1]') IS NULL EXEC('CREATE FUNCTION [dbo].[get_dte_fase_v1] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[get_dte_fase_v1]
(
   @P_CODI_EMPR   NUMERIC(3),
   @P_TIPO_DOCU   NUMERIC(3),
   @P_FOLI_DOCU   NUMERIC(22),
   @P_ESTA_DOCU   VARCHAR(3),
   @P_CORR_ENVI   NUMERIC(22),
   @P_ESTA_DOCU1  VARCHAR(3),
   @P_CORR_ENVI1  NUMERIC(22),
   @PAR1   	  VARCHAR(20),
   @PAR2   	  VARCHAR(20),
   @P_ESTA_ENVI   VARCHAR(3),
   @P_ESTA_ENVI_1 VARCHAR(3),
   @P_RUTT_EMPR   numeric(11),
   @P_ARCH_RESP   VARCHAR(200),
   @P_DESC_ESEN   VARCHAR(60),
   @P_HELP_ESEN   VARCHAR(60),
   @P_DESC_ESDO   VARCHAR(60),
   @P_HELP_ESDO   VARCHAR(100),
   @P_DESC_ESDO_1 VARCHAR(60),
   @P_DESC_ESEN_1 VARCHAR(60)
)
RETURNS VARCHAR(500)
AS
--SP1 SE 5.2
BEGIN
   DECLARE @V_ESTA_ENVI  VARCHAR(3)
   DECLARE @V_ESTA_ENVI1 VARCHAR(3)
   DECLARE @V_FASE1      NUMERIC(3)
   DECLARE @V_MAX_FASE1  NUMERIC(3)
   DECLARE @V_FASE2      NUMERIC(3)
   DECLARE @V_MAX_FASE2  NUMERIC(3)
   DECLARE @V_FASE3      NUMERIC(3)
   DECLARE @V_MAX_FASE3  NUMERIC(3)
   DECLARE @V_FASE4      NUMERIC(3)
   DECLARE @V_MAX_FASE4  NUMERIC(3)
   DECLARE @V_FASE5      NUMERIC(3)
   DECLARE @V_MAX_FASE5  NUMERIC(3)
   DECLARE @V_RUTT_EMPR  NUMERIC(10)
   DECLARE @V_ARCH_PREF  VARCHAR(100)
   DECLARE @V_ARCH_SUFI  VARCHAR(100)
   DECLARE @V_ARCH_EXTE  VARCHAR(100)
   DECLARE @V_ARCH_ENSA  VARCHAR(1) 
   DECLARE @V_ARCH_DIRE  VARCHAR(100)
   DECLARE @V_ORIG_ESDO  VARCHAR(10)
   DECLARE @V_COLO_ESDO  VARCHAR(30)
   DECLARE @V_DESC_ESDO  VARCHAR(100)
   DECLARE @V_HELP_ESDO  VARCHAR(500)
   DECLARE @V_HELP_ESDO2 VARCHAR(500)
   DECLARE @V_HELP_PERS  VARCHAR(1000)
   DECLARE @V_NOMB_ARCH  VARCHAR(250)
   DECLARE @V_ESTA_DESP  VARCHAR(10)
   DECLARE @P_DIRE_ARCH  VARCHAR(100)  /* V_DIRE_ARCH ?? */

   DECLARE @V_FASE_ESDO_1  NUMERIC(3);
   DECLARE @V_FASE_ESDO_2  NUMERIC(3);
   DECLARE @V_FASE_ESDO_3  NUMERIC(3);
   DECLARE @V_FASE_ESDO_4  NUMERIC(3);
   DECLARE @V_FASE_ESDO_5  NUMERIC(3);

   DECLARE @sw_no_data     NUMERIC(1);
   DECLARE @v1_FASE_ESDO   NUMERIC(3); 
   DECLARE @v1_ORDE_ESDO   NUMERIC(3); 
   DECLARE @V1_ESTA_ENVI   VARCHAR(3); 

   
   DECLARE @NULO       VARCHAR(1)
   SET     @NULO = ''


   SET @V_ESTA_ENVI  = isnull(@P_ESTA_ENVI,@NULO)
        
   SET @V_ESTA_ENVI1 = isnull(@P_ESTA_ENVI_1,@NULO)
   
   SET @V_MAX_FASE1 = 3
   SET @V_MAX_FASE2 = 5
   SET @V_MAX_FASE3 = 2
   SET @V_MAX_FASE4 = 2
   SET @V_MAX_FASE5 = 1


   SET @V_FASE_ESDO_1 = 1
   SET @V_FASE_ESDO_2 = 2
   SET @V_FASE_ESDO_3 = 3
   SET @V_FASE_ESDO_4 = 4
   SET @V_FASE_ESDO_5 = 5

   SET @sw_no_data = 0

   BEGIN
	SELECT @V_FASE1 = ORDE_ESDO,
	    @V_FASE2 = 0,
	    @V_FASE3 = 0,
	    @V_FASE4 = 0,
	    @V_FASE5 = 0,
	    @V_ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
	    @V_ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
	    @V_ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
	    @V_ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
	    @V_ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
	    @V_COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
	    @V_ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
	    @V_HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
	    @V_HELP_ESDO2 = ISNULL(HELP_ESDO2,@NULO),
	    @V_ESTA_DESP= ESTA_DESP
	FROM   DTE_FASE_ESTA
	WHERE  FASE_ESDO = 1
	AND    ESTA_DOCU = @P_ESTA_DOCU
	AND    ISNULL(@V_ESTA_ENVI,@NULO) = @NULO
	AND    ISNULL(@V_ESTA_ENVI1,@NULO) = @NULO
	IF (@@ROWCOUNT = 0)
	BEGIN
		SELECT @V_FASE1 = 99,
		      @V_FASE2 = ORDE_ESDO,
		      @V_FASE3 = 0,
		      @V_FASE4 = 0,
		      @V_FASE5 = 0,
		      @V_ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
		      @V_ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
		      @V_ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
		      @V_ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
		      @V_ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
		      @V_COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
		      @V_ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
		      @V_HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
		      @V_HELP_ESDO2 = ISNULL(HELP_ESDO2,@NULO),
		      @V_ESTA_DESP= ESTA_DESP
		FROM   DTE_FASE_ESTA
		WHERE  FASE_ESDO = 2
		AND    ESTA_DOCU = @P_ESTA_DOCU
		AND    ISNULL(ESTA_ENVI ,@NULO) = ISNULL(@V_ESTA_ENVI,@NULO)
		AND    @P_CORR_ENVI1 IS NULL
	        IF (@@ROWCOUNT = 0)
		BEGIN
			 SELECT @V_FASE1 = 99,
				@V_FASE2 = 99,
				@V_FASE3 = ORDE_ESDO,
				@V_FASE4 = 0,
				@V_FASE5 = 0,
				@V_ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
				@V_ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
				@V_ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
				@V_ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
				@V_ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
				@V_COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
				@V_ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
				@V_HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
				@V_HELP_ESDO2 = ISNULL(HELP_ESDO2,@NULO),
				@V_ESTA_DESP= ESTA_DESP
			 FROM   DTE_FASE_ESTA
			 WHERE  FASE_ESDO = 3
			 AND    ESTA_DOCU1 = @P_ESTA_DOCU1
			 AND    ESTA_ENVI1 = @V_ESTA_ENVI1
			 IF (@@ROWCOUNT = 0)
		 	 BEGIN
				SELECT  @V_FASE1 = 99,
					@V_FASE2 = 99,
					@V_FASE3 = 99,
					@V_FASE4 = ORDE_ESDO,
					@V_FASE5 = 0,
					@V_ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
					@V_ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
					@V_ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
					@V_ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
					@V_ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
					@V_COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
					@V_ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
					@V_HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
					@V_HELP_ESDO2 = ISNULL(HELP_ESDO2,@NULO),
					@V_ESTA_DESP= ESTA_DESP
				 FROM   DTE_FASE_ESTA
				 WHERE  FASE_ESDO = 4
				 AND    ESTA_DOCU1 = @P_ESTA_DOCU1
				 AND    ESTA_ENVI1 = @V_ESTA_ENVI1

				IF (@@ROWCOUNT = 0)
				BEGIN
					SELECT  @V_FASE1 = 99,
						@V_FASE2 = 99,
						@V_FASE3 = 99,
						@V_FASE4 = 99,
						@V_FASE5 = ORDE_ESDO,
						@V_ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
						@V_ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
						@V_ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
						@V_ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
						@V_ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
						@V_COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
						@V_ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
						@V_HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
						@V_HELP_ESDO2 = ISNULL(HELP_ESDO2,@NULO),
						@V_ESTA_DESP= ESTA_DESP
					FROM   DTE_FASE_ESTA
					WHERE  FASE_ESDO = 5
					AND    ESTA_DOCU1 = @P_ESTA_DOCU1
					AND    ESTA_ENVI1 = @V_ESTA_ENVI1
					IF (@@ROWCOUNT = 0)
					BEGIN
						  SET @V_FASE1 = 0
						  SET @V_FASE2 = 0
						  SET @V_FASE3 = 0
						  SET @V_FASE4 = 0
						  SET @V_FASE5 = 0
					END
                 		END 
           	 	END         
         	END
         END
   END
  
   IF @PAR1 = 'FASE'		
   BEGIN
     IF @PAR2 = 1
       RETURN LTRIM(STR(@V_FASE1)) + '-' + LTRIM(STR(@V_MAX_FASE1))
     ELSE IF @PAR2 = 2
       RETURN LTRIM(STR(@V_FASE2)) + '-' + LTRIM(STR(@V_MAX_FASE2))
     ELSE IF @PAR2 = 3
       RETURN LTRIM(STR(@V_FASE3)) + '-' + LTRIM(STR(@V_MAX_FASE3))
     ELSE IF @PAR2 = 4
       RETURN LTRIM(STR(@V_FASE4)) + '-' + LTRIM(STR(@V_MAX_FASE4))
     ELSE IF @PAR2 = 5
       RETURN LTRIM(STR(@V_FASE5)) + '-' + LTRIM(STR(@V_MAX_FASE5))  
   END
   ELSE IF @PAR1 = 'ENSA'	
        RETURN @V_ARCH_ENSA
   ELSE IF @PAR1 = 'DIRE'	
        BEGIN
        IF @V_ARCH_ENSA = 'S'
	BEGIN
		select @P_DIRE_ARCH = VALO_PAEM
		from   PARA_EMPR
		where CODI_EMPR=@P_CODI_EMPR
		AND   TIPO_COMO='ALL'
		AND   CODI_PAEM='EDS0'

        IF (@@rowcount = 0)
		BEGIN
			select @P_DIRE_ARCH=PARAM_VALUE
			from   SYS_PARAM
			where  PARAM_NAME='EGATE_DIRE_SALI'
		END
	END
	ELSE IF @V_ARCH_ENSA = 'E'
	BEGIN
		select @P_DIRE_ARCH = VALO_PAEM
		from   PARA_EMPR
		where CODI_EMPR=@P_CODI_EMPR
		AND   TIPO_COMO='ALL'
		AND   CODI_PAEM='EDE0'

        IF (@@rowcount = 0)
		BEGIN
			select @P_DIRE_ARCH=PARAM_VALUE
			from   SYS_PARAM
			where  PARAM_NAME='EGATE_DIRE_ENTR'
		END
	END

        RETURN @P_DIRE_ARCH + '\' + @V_ARCH_DIRE
   END
   ELSE IF @PAR1 = 'ARCH'	/* NOMBRE DEL ARCHIVO 		 	    */
   BEGIN
   	IF @V_FASE5 > 0 
	BEGIN
        SET @V_NOMB_ARCH = @P_ARCH_RESP

		RETURN @V_NOMB_ARCH
		
	END
     	ELSE IF @V_ORIG_ESDO = 'DTE'
     	BEGIN
             SET @V_NOMB_ARCH = @V_ARCH_PREF +
                           	'E' + dbo.lpad(@P_RUTT_EMPR ,9,'0') +
                           	'T' + dbo.lpad(@P_TIPO_DOCU, 3,'0') +
                           	'F' + dbo.lpad(@P_FOLI_DOCU,10,'0') + 
                           	@V_ARCH_SUFI + @V_ARCH_EXTE

       		RETURN @V_NOMB_ARCH
     		
     	END
     	ELSE IF @V_ORIG_ESDO = 'ENVIO' AND @P_CORR_ENVI1 IS NULL
        	RETURN @V_ARCH_PREF + LTRIM(STR(ISNULL(@P_CORR_ENVI,0))) + @V_ARCH_SUFI + @V_ARCH_EXTE
     	ELSE
        	RETURN @V_ARCH_PREF + LTRIM(STR(ISNULL(@P_CORR_ENVI1,0))) +  @V_ARCH_SUFI + @V_ARCH_EXTE
   END
   ELSE IF @PAR1 = 'DESC'	/* DESCRIPCION DEL ESTADO DEL DOCUMENTO */
   BEGIN
     	
	IF @V_ESTA_DESP = 'esta_docu'
          SET @V_DESC_ESDO = @P_DESC_ESDO 
	ELSE IF @V_ESTA_DESP = 'esta_docu1'  
          SET @V_DESC_ESDO = @P_DESC_ESDO_1 
	ELSE IF @V_ESTA_DESP = 'esta_envi'  
          SET @V_DESC_ESDO = @P_DESC_ESEN  
	ELSE IF @V_ESTA_DESP = 'esta_envi1'  
           SET @V_DESC_ESDO = @P_DESC_ESEN_1

  	RETURN isnull(@V_DESC_ESDO,@NULO)

   END
   ELSE IF @PAR1 = 'COLO'
     RETURN ISNULL(@V_COLO_ESDO,'GREEN')
   ELSE IF @PAR1 = 'HELP'
      BEGIN
        IF (@V_ORIG_ESDO = 'DTE')
          SET @V_HELP_PERS = @P_HELP_ESDO
        ELSE IF @V_ORIG_ESDO = 'ENVIO'
          SET @V_HELP_PERS = @P_HELP_ESEN

        SET @V_HELP_ESDO = @V_HELP_ESDO
     	SET @V_HELP_ESDO2 = @V_HELP_ESDO2 
		RETURN ISNULL(@V_HELP_ESDO,@NULO) + ' ' +  ISNULL(@V_HELP_ESDO,@NULO) + ' ' +  ISNULL(@V_HELP_PERS,@NULO) 

   END
   ELSE IF @PAR1 = 'ESTA' 
   BEGIN
     	IF @V_ESTA_DESP = 'esta_docu' 
 			RETURN(@P_ESTA_DOCU)
        ELSE IF @V_ESTA_DESP = 'esta_docu1'  
         	RETURN(@P_ESTA_DOCU1)
        ELSE IF @V_ESTA_DESP = 'esta_envi'  
 			RETURN(@V_ESTA_ENVI)
        ELSE IF @V_ESTA_DESP = 'esta_envi1'  
 			RETURN(@V_ESTA_ENVI1)
        
   END  
   
   RETURN 0
END
GO

GO
--SqlScripter----[dbo].[get_dto_fase].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[get_dto_fase]') IS NULL EXEC('CREATE FUNCTION [dbo].[get_dto_fase] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[get_dto_fase]
(
   @CODI_EMPR	NUMERIC(3),
   @CORR_ENVI	NUMERIC(22),
   @ESTA_ENVI   VARCHAR(22),
   @TIPO_DOCU	NUMERIC(3),
   @FOLI_DOCU	NUMERIC(22),
   @ESTA_DOCU   VARCHAR(3),
   @CODI_ESAP   VARCHAR(3),
   @PAR1   	VARCHAR(20),
   @PAR2   	VARCHAR(20)
)
RETURNS VARCHAR(500)
AS
BEGIN
   DECLARE @FASE1      NUMERIC(3)
   DECLARE @MAX_FASE1  NUMERIC(3)
   DECLARE @FASE2      NUMERIC(3)
   DECLARE @MAX_FASE2  NUMERIC(3)
   DECLARE @FASE3      NUMERIC(3)
   DECLARE @MAX_FASE3  NUMERIC(3)
   DECLARE @RUTT_EMPR  NUMERIC(10)
   DECLARE @ARCH_PREF  VARCHAR(100)
   DECLARE @ARCH_SUFI  VARCHAR(100)
   DECLARE @ARCH_EXTE  VARCHAR(100)
   DECLARE @ARCH_ENSA  VARCHAR(100)
   DECLARE @ARCH_DIRE  VARCHAR(100)
   DECLARE @COLO_ESDO  VARCHAR(10)
   DECLARE @ORIG_ESDO  VARCHAR(10)
   DECLARE @DESC_ESDO  VARCHAR(100)
   DECLARE @HELP_ESDO  VARCHAR(100)
   DECLARE @NOMB_ARCH  VARCHAR(100)
   DECLARE @ESTA_DESP  VARCHAR(10)
   DECLARE @P_DIRE_ARCH VARCHAR(100)
   DECLARE @P_EXISTE	VARCHAR(1)
   DECLARE @P_MENSAJE	VARCHAR(100)
   DECLARE @V_HELP_PERS	VARCHAR(1000)
   
   DECLARE @NULO       VARCHAR(3)
   SET     @NULO = ''

   BEGIN
     SELECT @MAX_FASE1 = ISNULL(MAX(ORDE_ESDO),0)
     FROM   DTO_FASE_ESTA
     WHERE  FASE_ESDO = 1
   END

   BEGIN
     SELECT @MAX_FASE2 = ISNULL(MAX(ORDE_ESDO),0)
     FROM   DTO_FASE_ESTA
     WHERE  FASE_ESDO = 2
   END   

   BEGIN
     SELECT @MAX_FASE3 = ISNULL(MAX(ORDE_ESDO),0)
     FROM   DTO_FASE_ESTA
     WHERE  FASE_ESDO = 3
   END   
   
   BEGIN	/* Fase de recepcion de envios de DTO */ 
     SELECT @FASE1 = ORDE_ESDO,
            @FASE2 = 0,
            @FASE3 = 0,
            @ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
            @ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
            @ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
            @ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
            @ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
            @COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
            @ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
            @HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
	    @ESTA_DESP = ESTA_DESP
     FROM   DTO_FASE_ESTA
     WHERE  FASE_ESDO = 1
     AND    ESTA_ENVI = ISNULL(@ESTA_ENVI,@NULO)
     AND    ISNULL(@ESTA_DOCU,@NULO) = @NULO
     AND    ISNULL(@CODI_ESAP,@NULO) = @NULO
     
     IF (@@ROWCOUNT = 0)
     BEGIN	/* Fase de recepcion de DTO */ 
       SELECT @FASE1 = 99,
              @FASE2 = ORDE_ESDO,
              @FASE3 = 0,
              @ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
              @ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
              @ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
              @ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
              @ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
              @COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
              @ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
              @HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
	      @ESTA_DESP = ESTA_DESP
       FROM   DTO_FASE_ESTA
       WHERE  FASE_ESDO = 2
       AND    ESTA_ENVI = ISNULL(@ESTA_ENVI,@NULO)
       AND    ESTA_DOCU = ISNULL(@ESTA_DOCU,@NULO)
       AND    ISNULL(@CODI_ESAP,@NULO) = @NULO
  
       IF (@@ROWCOUNT = 0)
       BEGIN  /* Fase de recepcion de DTO */ 
	 SELECT @FASE1 = 99,
                @FASE2 = 99,
                @FASE3 = ORDE_ESDO,
                @ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
                @ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
                @ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
                @ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
                @ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
                @COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
                @ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
                @HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
	        @ESTA_DESP = ESTA_DESP
         FROM   DTO_FASE_ESTA
         WHERE  FASE_ESDO = 3
         AND    ESTA_ENVI = ISNULL(@ESTA_ENVI,@NULO)
	 AND    CODI_ESAP = ISNULL(@CODI_ESAP,@NULO)
         
	 IF (@@ROWCOUNT = 0)
             BEGIN
                SET @FASE1 = 0
                SET @FASE2 = 0
                SET @FASE3 = 0
             END
       END         
     END
   END
   
   IF @PAR1 = 'FASE'
   BEGIN
     IF @PAR2 = 1
       RETURN LTRIM(STR(@FASE1)) + '-' + LTRIM(STR(@MAX_FASE1))
     ELSE IF @PAR2 = 2
       RETURN LTRIM(STR(@FASE2)) + '-' + LTRIM(STR(@MAX_FASE2))
     ELSE IF @PAR2 = 3
       RETURN LTRIM(STR(ISNULL(@FASE3,0))) + '-' + LTRIM(STR(ISNULL(@MAX_FASE3,0)))
   END
   ELSE IF @PAR1 = 'ENSA'	/* INDICADOR DE ENTRADA O SALIDA 	    */
        RETURN @ARCH_ENSA
   ELSE IF @PAR1 = 'DIRE'	/* DIRECTORIO DONDE SE ENCUENTRA EL ARCHIVO */
   BEGIN
	IF @FASE1 <> '99' /* si estoy en fase1 solo debo leer el directorio de entrada general*/
	BEGIN 
		select @P_DIRE_ARCH=PARAM_VALUE
		from   SYS_PARAM
		where  PARAM_NAME='EGATE_DIRE_ENTR'
	END
        ELSE IF @ARCH_ENSA = 'S'
	     BEGIN
		select @P_DIRE_ARCH = VALO_PAEM
		from   PARA_EMPR
		where CODI_EMPR=@CODI_EMPR
		AND   TIPO_COMO='ALL'
		AND   CODI_PAEM='EDS0'

                IF (@@rowcount = 0)
		BEGIN
			select @P_DIRE_ARCH=PARAM_VALUE
			from   SYS_PARAM
			where  PARAM_NAME='EGATE_DIRE_SALI'
		END
	     END
	     ELSE IF @ARCH_ENSA = 'E'
	     BEGIN
		select @P_DIRE_ARCH = VALO_PAEM
		from   PARA_EMPR
		where CODI_EMPR=@CODI_EMPR
		AND   TIPO_COMO='ALL'
		AND   CODI_PAEM='EDE0'

                IF (@@rowcount = 0)
		BEGIN
			select @P_DIRE_ARCH=PARAM_VALUE
			from   SYS_PARAM
			where  PARAM_NAME='EGATE_DIRE_ENTR'
		END

	     END
        /*execute dte_vali_digi '123456','3',@p_existe,@p_mensaje  */

        RETURN @P_DIRE_ARCH + '\' + @ARCH_DIRE
   END
   ELSE IF @PAR1 = 'ARCH'	/* NOMBRE DEL ARCHIVO 		 	    */
   BEGIN
     IF @ORIG_ESDO = 'DTE'
     BEGIN
       -- Busca el rutt del Emisor
       SELECT @NOMB_ARCH = @ARCH_PREF +
                           'E' + dbo.lpad(RUTT_EMIS ,9,'0') +
                           'T' + dbo.lpad(@TIPO_DOCU, 3,'0') +
                           'F' + dbo.lpad(@FOLI_DOCU,10,'0') + 
                           @ARCH_SUFI + @ARCH_EXTE
       FROM  DTO_RECE_DOCU
       WHERE CORR_ENVI = @CORR_ENVI
       IF (@@ROWCOUNT = 0)
         SET @NOMB_ARCH = @NULO

       RETURN @NOMB_ARCH
     END
     ELSE IF @ORIG_ESDO = 'ENVIO'
        RETURN @ARCH_PREF + LTRIM(STR(ISNULL(@CORR_ENVI,0))) + @ARCH_SUFI + @ARCH_EXTE
   END
   ELSE IF @PAR1 = 'DESC'
   BEGIN
     IF @ORIG_ESDO = 'DTE'
       BEGIN
         IF @CODI_ESAP IS NULL
           SELECT @DESC_ESDO = DESC_ESDO
           FROM   DTE_ESTA_DOCU
           WHERE  ESTA_DOCU = @ESTA_DOCU
         ELSE
           SELECT @DESC_ESDO = DESC_ESAP
           FROM   DTE_ESTA_APRO
           WHERE  CODI_ESAP = @CODI_ESAP
       END
     ELSE IF @ORIG_ESDO = 'ENVIO'
       SELECT @DESC_ESDO = DESC_ESEN
       FROM   DTE_ESTA_ENVI
       WHERE  ESTA_ENVI = @ESTA_ENVI
     IF (@@ROWCOUNT = 0)
       SET @DESC_ESDO = @NULO
     RETURN @DESC_ESDO
   END
   ELSE IF @PAR1 = 'COLO'
     RETURN ISNULL(@COLO_ESDO,'GREEN')
   ELSE IF @PAR1 = 'HELP'
    BEGIN
        IF @ORIG_ESDO = 'DTE'
           SELECT @V_HELP_PERS = HELP_ESDO
           FROM   DTE_ESTA_DOCU
           WHERE  ESTA_DOCU = @ESTA_DOCU
        ELSE IF @ORIG_ESDO = 'ENVIO'
           SELECT @V_HELP_PERS = HELP_ESEN
           FROM   DTE_ESTA_ENVI
           WHERE  ESTA_ENVI = @ESTA_ENVI
        SET @HELP_ESDO = ISNULL(@HELP_ESDO,@NULO) +  ' ' + ISNULL(@V_HELP_PERS,@NULO) 
        RETURN ISNULL(@HELP_ESDO,@NULO)
   END
   ELSE IF @PAR1 = 'ESTA' 
   BEGIN
       IF @ESTA_DESP = 'esta_docu'
   	RETURN @ESTA_DOCU
       ELSE IF @ESTA_DESP = 'esta_docu'
       	RETURN @ESTA_DOCU
       ELSE IF @ESTA_DESP = 'esta_envi'
   	RETURN @ESTA_ENVI
       ELSE IF @ESTA_DESP = 'codi_esap'
   	RETURN @CODI_ESAP
   END
   RETURN 0
END
GO

GO
--SqlScripter----[dbo].[get_dto_fase_v1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dto_fase_v1]') IS NULL EXEC('CREATE FUNCTION [dbo].[get_dto_fase_v1] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[get_dto_fase_v1]
(
   @CODI_EMPR	NUMERIC(3),
   @CORR_ENVI	NUMERIC(22),
   @ESTA_ENVI   VARCHAR(22),
   @TIPO_DOCU	NUMERIC(3),
   @FOLI_DOCU	NUMERIC(22),
   @ESTA_DOCU   VARCHAR(3),
   @CODI_ESAP   VARCHAR(3),
   @PAR1   	VARCHAR(20),
   @PAR2   	VARCHAR(20),
   @P_RUTT_EMIS  NUMERIC(10),
   @P_DESC_ESDO  VARCHAR(60),
   @P_HELP_ESDO  VARCHAR(1000),
   @P_DESC_ESEN  VARCHAR(60),
   @P_HELP_ESEN VARCHAR(1000),
   @P_DESC_ESAP VARCHAR(60))
RETURNS VARCHAR(500)
AS
--SP1 SE 5.2
BEGIN
   DECLARE @FASE1      NUMERIC(3)
   DECLARE @MAX_FASE1  NUMERIC(3)
   DECLARE @FASE2      NUMERIC(3)
   DECLARE @MAX_FASE2  NUMERIC(3)
   DECLARE @FASE3      NUMERIC(3)
   DECLARE @MAX_FASE3  NUMERIC(3)
   DECLARE @RUTT_EMPR  NUMERIC(10)
   DECLARE @ARCH_PREF  VARCHAR(100)
   DECLARE @ARCH_SUFI  VARCHAR(100)
   DECLARE @ARCH_EXTE  VARCHAR(100)
   DECLARE @ARCH_ENSA  VARCHAR(100)
   DECLARE @ARCH_DIRE  VARCHAR(100)
   DECLARE @COLO_ESDO  VARCHAR(10)
   DECLARE @ORIG_ESDO  VARCHAR(10)
   DECLARE @DESC_ESDO  VARCHAR(100)
   DECLARE @HELP_ESDO  VARCHAR(100)
   DECLARE @NOMB_ARCH  VARCHAR(200)
   DECLARE @ESTA_DESP  VARCHAR(10)
   DECLARE @P_DIRE_ARCH VARCHAR(100)
   DECLARE @P_EXISTE	VARCHAR(1)
   DECLARE @P_MENSAJE	VARCHAR(100)
   DECLARE @V_HELP_PERS	VARCHAR(1000)
   
   DECLARE @NULO       VARCHAR(3)
   SET     @NULO = ''

/*   BEGIN
     SELECT @MAX_FASE1 = ISNULL(MAX(ORDE_ESDO),0)
     FROM   DTO_FASE_ESTA
     WHERE  FASE_ESDO = 1
   END

   BEGIN
     SELECT @MAX_FASE2 = ISNULL(MAX(ORDE_ESDO),0)
     FROM   DTO_FASE_ESTA
     WHERE  FASE_ESDO = 2
   END   

   BEGIN
     SELECT @MAX_FASE3 = ISNULL(MAX(ORDE_ESDO),0)
     FROM   DTO_FASE_ESTA
     WHERE  FASE_ESDO = 3
   END   */
   
   BEGIN
     SET @MAX_FASE1 = 2
     SET @MAX_FASE2 = 3
     SET @MAX_FASE3 = 2
   END   

   BEGIN	/* Fase de recepcion de envios de DTO */ 
     SELECT @FASE1 = ORDE_ESDO,
            @FASE2 = 0,
            @FASE3 = 0,
            @ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
            @ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
            @ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
            @ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
            @ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
            @COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
            @ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
            @HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
	    @ESTA_DESP = ESTA_DESP
     FROM   DTO_FASE_ESTA
     WHERE  FASE_ESDO = 1
     AND    ESTA_ENVI = ISNULL(@ESTA_ENVI,@NULO)
     AND    ISNULL(@ESTA_DOCU,@NULO) = @NULO
     AND    ISNULL(@CODI_ESAP,@NULO) = @NULO
     
     IF (@@ROWCOUNT = 0)
     BEGIN	/* Fase de recepcion de DTO */ 
       SELECT @FASE1 = 99,
              @FASE2 = ORDE_ESDO,
              @FASE3 = 0,
              @ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
              @ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
              @ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
              @ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
              @ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
              @COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
              @ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
              @HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
	      @ESTA_DESP = ESTA_DESP
       FROM   DTO_FASE_ESTA
       WHERE  FASE_ESDO = 2
       AND    ESTA_ENVI = ISNULL(@ESTA_ENVI,@NULO)
       AND    ESTA_DOCU = ISNULL(@ESTA_DOCU,@NULO)
       AND    ISNULL(@CODI_ESAP,@NULO) = @NULO
  
       IF (@@ROWCOUNT = 0)
       BEGIN  /* Fase de recepcion de DTO */ 
	 SELECT @FASE1 = 99,
                @FASE2 = 99,
                @FASE3 = ORDE_ESDO,
                @ARCH_PREF = ISNULL(ARCH_PREF,@NULO),
                @ARCH_SUFI = ISNULL(ARCH_SUFI,@NULO),
                @ARCH_EXTE = ISNULL(ARCH_EXTE,@NULO),
                @ARCH_ENSA = ISNULL(ARCH_ENSA,@NULO),
                @ARCH_DIRE = ISNULL(ARCH_DIRE,@NULO),
                @COLO_ESDO = ISNULL(COLO_ESDO,@NULO),
                @ORIG_ESDO = ISNULL(ORIG_ESDO,@NULO),
                @HELP_ESDO = ISNULL(HELP_ESDO,@NULO),
	        @ESTA_DESP = ESTA_DESP
         FROM   DTO_FASE_ESTA
         WHERE  FASE_ESDO = 3
         AND    ESTA_ENVI = ISNULL(@ESTA_ENVI,@NULO)
	 AND    CODI_ESAP = ISNULL(@CODI_ESAP,@NULO)
         
	 IF (@@ROWCOUNT = 0)
             BEGIN
                SET @FASE1 = 0
                SET @FASE2 = 0
                SET @FASE3 = 0
             END
       END         
     END
   END
   
   IF @PAR1 = 'FASE'
   BEGIN
     IF @PAR2 = 1
       RETURN LTRIM(STR(@FASE1)) + '-' + LTRIM(STR(@MAX_FASE1))
     ELSE IF @PAR2 = 2
       RETURN LTRIM(STR(@FASE2)) + '-' + LTRIM(STR(@MAX_FASE2))
     ELSE IF @PAR2 = 3
       RETURN LTRIM(STR(ISNULL(@FASE3,0))) + '-' + LTRIM(STR(ISNULL(@MAX_FASE3,0)))
   END
   ELSE IF @PAR1 = 'ENSA'	/* INDICADOR DE ENTRADA O SALIDA 	    */
        RETURN @ARCH_ENSA
   ELSE IF @PAR1 = 'DIRE'	/* DIRECTORIO DONDE SE ENCUENTRA EL ARCHIVO */
   BEGIN
	IF @FASE1 <> '99' /* si estoy en fase1 solo debo leer el directorio de entrada general*/
	BEGIN 
		select @P_DIRE_ARCH=PARAM_VALUE
		from   SYS_PARAM
		where  PARAM_NAME='EGATE_DIRE_ENTR'
	END
        ELSE IF @ARCH_ENSA = 'S'
	     BEGIN
		select @P_DIRE_ARCH = VALO_PAEM
		from   PARA_EMPR
		where CODI_EMPR=@CODI_EMPR
		AND   TIPO_COMO='ALL'
		AND   CODI_PAEM='EDS0'

                IF (@@rowcount = 0)
		BEGIN
			select @P_DIRE_ARCH=PARAM_VALUE
			from   SYS_PARAM
			where  PARAM_NAME='EGATE_DIRE_SALI'
		END
	     END
	     ELSE IF @ARCH_ENSA = 'E'
	     BEGIN
		select @P_DIRE_ARCH = VALO_PAEM
		from   PARA_EMPR
		where CODI_EMPR=@CODI_EMPR
		AND   TIPO_COMO='ALL'
		AND   CODI_PAEM='EDE0'

        IF (@@rowcount = 0)
		BEGIN
			select @P_DIRE_ARCH=PARAM_VALUE
			from   SYS_PARAM
			where  PARAM_NAME='EGATE_DIRE_ENTR'
		END

	     END
        /*execute dte_vali_digi '123456','3',@p_existe,@p_mensaje  */

        RETURN @P_DIRE_ARCH + '\' + @ARCH_DIRE
   END
   ELSE IF @PAR1 = 'ARCH'	/* NOMBRE DEL ARCHIVO 		 	    */
   BEGIN
     IF @ORIG_ESDO = 'DTE'
     BEGIN
       -- Busca el rutt del Emisor
      /* SELECT @NOMB_ARCH = @ARCH_PREF +
                           'E' + dbo.lpad(RUTT_EMIS ,9,'0') +
                           'T' + dbo.lpad(@TIPO_DOCU, 3,'0') +
                           'F' + dbo.lpad(@FOLI_DOCU,10,'0') + 
                           @ARCH_SUFI + @ARCH_EXTE
       FROM  DTO_RECE_DOCU
       WHERE CORR_ENVI = @CORR_ENVI  

       IF (@@ROWCOUNT = 0)
         SET @NOMB_ARCH = @NULO */

       IF ISNULL(convert(varchar,@P_RUTT_EMIS),@NULO)<> @NULO
         SET @NOMB_ARCH = @ARCH_PREF + 'E' + dbo.lpad(@P_RUTT_EMIS,9,'0') + 'T' + dbo.lpad(@TIPO_DOCU, 3,'0') + 'F' + dbo.lpad(@FOLI_DOCU,10,'0') + @ARCH_SUFI + @ARCH_EXTE
       ELSE
         SET @NOMB_ARCH = @NULO 
       
       RETURN @NOMB_ARCH

     END
       ELSE IF @ORIG_ESDO = 'ENVIO'
          RETURN @ARCH_PREF + LTRIM(STR(ISNULL(@CORR_ENVI,0))) + @ARCH_SUFI + @ARCH_EXTE
   END
   ELSE IF @PAR1 = 'DESC'
   BEGIN
     IF @ORIG_ESDO = 'DTE'
       BEGIN
         IF @CODI_ESAP IS NULL
           SET @DESC_ESDO=ISNULL(@P_DESC_ESDO,@NULO)
           /*SELECT @DESC_ESDO = DESC_ESDO
           FROM   DTE_ESTA_DOCU
           WHERE  ESTA_DOCU = @ESTA_DOCU*/
         ELSE
           SET @DESC_ESDO = ISNULL(@P_DESC_ESAP,@NULO)
           /*SELECT @DESC_ESDO = DESC_ESAP
           FROM   DTE_ESTA_APRO
           WHERE  CODI_ESAP = @CODI_ESAP*/
       END
     ELSE IF @ORIG_ESDO = 'ENVIO'
       BEGIN
         SET @DESC_ESDO = isnull(@P_DESC_ESEN,@NULO)

         /*SELECT @DESC_ESDO = DESC_ESEN
         FROM   DTE_ESTA_ENVI
         WHERE  ESTA_ENVI = @ESTA_ENVI
         IF (@@ROWCOUNT = 0)
           SET @DESC_ESDO = @NULO */
       END

     RETURN @DESC_ESDO

   END
   ELSE IF @PAR1 = 'COLO'
     RETURN ISNULL(@COLO_ESDO,'GREEN')
   ELSE IF @PAR1 = 'HELP'
    BEGIN
        IF @ORIG_ESDO = 'DTE'
           SET @V_HELP_PERS=ISNULL(@P_HELP_ESDO,@NULO)
          /* SELECT @V_HELP_PERS = HELP_ESDO
           FROM   DTE_ESTA_DOCU
           WHERE  ESTA_DOCU = @ESTA_DOCU*/
        ELSE IF @ORIG_ESDO = 'ENVIO'
           SET @V_HELP_PERS = isnull(@P_HELP_ESEN,@NULO)
           /*SELECT @V_HELP_PERS = HELP_ESEN
           FROM   DTE_ESTA_ENVI
           WHERE  ESTA_ENVI = @ESTA_ENVI*/

        SET @HELP_ESDO = ISNULL(@HELP_ESDO,@NULO) +  ' ' + ISNULL(@V_HELP_PERS,@NULO) 
        RETURN ISNULL(@HELP_ESDO,@NULO)
   END
   ELSE IF @PAR1 = 'ESTA' 
   BEGIN
       IF @ESTA_DESP = 'esta_docu'
   	RETURN @ESTA_DOCU
       ELSE IF @ESTA_DESP = 'esta_docu'
       	RETURN @ESTA_DOCU
       ELSE IF @ESTA_DESP = 'esta_envi'
   	RETURN @ESTA_ENVI
       ELSE IF @ESTA_DESP = 'codi_esap'
   	RETURN @CODI_ESAP
   END
   RETURN 0
END
GO

GO
--SqlScripter----[dbo].[get_foli_util_peri].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_foli_util_peri]') IS NULL EXEC('CREATE FUNCTION [dbo].[get_foli_util_peri] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[get_foli_util_peri]
(
	   	  @P_CODI_EMPR NUMERIC, 
	   	  @P_TIPO_DOCU NUMERIC, 
		  @P_FECH_DESD VARCHAR, 
		  @P_FECH_HAST VARCHAR) RETURNS NUMERIC AS
BEGIN
  declare @V_FOLI_DOCU NUMERIC;

  select @V_FOLI_DOCU = COUNT(FOLI_DOCU)
  from   DTE_ENCA_DOCU
  WHERE  CODI_EMPR = @P_CODI_EMPR
  AND    TIPO_DOCU = @P_TIPO_DOCU
  AND    FECH_EMIS BETWEEN @P_FECH_DESD AND @P_FECH_HAST

  return (@V_FOLI_DOCU)
END
GO

GO
--SqlScripter----[dbo].[get_tipo_contribuyente].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[get_tipo_contribuyente]') IS NULL EXEC('CREATE FUNCTION [dbo].[get_tipo_contribuyente] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[get_tipo_contribuyente]
(
   
   @RUTT_EMIS   NUMERIC(9),
   @DIGI_EMIS   VARCHAR(1)
     
)
RETURNS VARCHAR(500)
AS
BEGIN

   DECLARE @cont  NUMERIC(1)
   DECLARE @TIPO  VARCHAR(15) /* Elec.   NoElec.  */
   
   set @cont=0
   
   select @cont = 1
   from pers_publ
   where cont_rutt = @RUTT_EMIS
   and cont_digi = @DIGI_EMIS
   

   IF (@cont = 1)
   begin
     SET @TIPO = 'Electronico'
   end
   
   if (@cont = 0)
   begin
     SET @TIPO = 'No Electronico'
   end
     
   
     
   RETURN @TIPO
END
GO

GO
--SqlScripter----[dbo].[get_tipo_impr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[get_tipo_impr]') IS NULL EXEC('CREATE FUNCTION [dbo].[get_tipo_impr] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[get_tipo_impr]
(
   
   @CODI_EMEX  VARCHAR(30),
   @CODI_EMPR numeric(9),
   @CODI_FORM   numeric(30)
     
)
RETURNS VARCHAR(500)
AS
BEGIN

   DECLARE @TIPO  VARCHAR(15),
		   @FORM  VARCHAR(15) /* Elec.   NoElec.  */
   

   
   select @FORM = CODI_PLAN
   from DTE_FORMATOS
   where CODI_EMEX=@CODI_EMEX AND
	CODI_EMPR=@CODI_EMPR AND CODI_FORM=@CODI_FORM
   

   IF (@FORM = 'IM1')
   begin
     SET @TIPO = 'Normal'
   end
   
   if (@FORM = 'IM2')
   begin
     SET @TIPO = 'Merito'
   end
     
   
     
   RETURN @TIPO
END
GO

GO
--SqlScripter----[dbo].[initcap].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[initcap]') IS NULL EXEC('CREATE FUNCTION [dbo].[initcap] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[initcap]
(@expression nvarchar(4000))
returns nvarchar(4000)
as
    begin
      declare @i  smallint,   @properexpression nvarchar(4000),  @lenexpression  smallint, @flag bit, @symbol nchar(1)
      select  @flag = 1, @i = 1, @properexpression = '', @lenexpression =  datalength(@expression)/(case SQL_VARIANT_PROPERTY(@expression,'BaseType') when 'nvarchar' then 2  else 1 end) 

      while  @i <= @lenexpression
          begin
             select @symbol = lower(substring(@expression, @i, 1) )
               if @symbol in (nchar(32), nchar(9), nchar(10), nchar(11), nchar(12), nchar(13),  nchar(160)) and ascii(@symbol) <> 0
                   select @flag = 1
               else
                   if @flag = 1
                       select @symbol = upper(@symbol),  @flag = 0 
              select  @properexpression = @properexpression + @symbol,  @i = @i + 1 
          end

     return @properexpression 
    end
GO

GO
--SqlScripter----[dbo].[lbe_get_num_bol_dte].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[lbe_get_num_bol_dte]') IS NULL EXEC('CREATE FUNCTION [dbo].[lbe_get_num_bol_dte] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[lbe_get_num_bol_dte]
(@p_codi_soli  numeric(22),
			             @p_codi_empr   numeric(10),
				     @p_peri_desd   varchar(10),
				     @p_peri_hast   varchar(10),
 				     @p_rutt_rece   numeric(10),
				     @p_mont_mini   numeric(18)) 
returns numeric as

begin 
declare @num_bole_dte int,
	@lugar varchar(200)

	--t @num_bole_dte=0
	set @lugar='lbe_get_num_bol_dte() Ejecutando Query'

       	select @num_bole_dte = count(*) 
	from dte_enca_docu a
	where a.codi_empr=@p_codi_empr
	AND   isnull(a.fech_emis,'1000-01-01')>=isnull(@p_peri_desd,isnull(a.fech_emis,'1000-01-01'))
	AND   isnull(a.fech_emis,'9999-99-99')<=isnull(@p_peri_hast,isnull(a.fech_emis,'9999-99-99'))
	AND   isnull(a.rutt_rece,0)=isnull(@p_rutt_rece,isnull(a.rutt_rece,0))
	AND   isnull(a.mont_tota,0) >= isnull(@p_mont_mini,isnull(a.mont_tota,0)) 
	AND   NOT EXISTS (select 1 from lbe_deta_docu b,
						dte_tipo_docu c
		  	  		  where a.tipo_docu=b.tipo_docu
					  AND	a.foli_docu=b.foli_docu
					  AND	a.codi_empr=b.codi_empr
					  AND	b.codi_soli=@p_codi_soli)
	AND  exists (select 1 from dte_tipo_docu c 
				where a.tipo_docu=c.tipo_docu 
				and c.bole_elec='S')
	return @num_bole_dte
end
GO

GO
--SqlScripter----[dbo].[lpad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[lpad]') IS NULL EXEC('CREATE FUNCTION [dbo].[lpad] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[lpad]
(
   @CADENA   VARCHAR(500),
   @LARGO    NUMERIC(3),
   @CARACTER VARCHAR(1)
)
RETURNS VARCHAR(500)
AS
BEGIN
   DECLARE @T_LARGO   NUMERIC(3)
   DECLARE @T_CADENA  VARCHAR(500)
   
   SET @T_LARGO  = LEN(@CADENA)
   SET @T_CADENA = @CADENA
   
   WHILE (@T_LARGO<@LARGO)
   BEGIN
     SET @T_CADENA = @CARACTER + @T_CADENA
     SET @T_LARGO  = @T_LARGO  + 1
   END

   RETURN @T_CADENA
END
GO

GO
--SqlScripter----[dbo].[reemplaza_char].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[reemplaza_char]') IS NULL EXEC('CREATE FUNCTION [dbo].[reemplaza_char] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
ALTER FUNCTION [dbo].[reemplaza_char]
(@p_cadena  varchar(2000)) returns varchar(2000)  as
BEGIN
	declare @p_cadena_salida varchar(2000)
	
	set @p_cadena_salida= replace(@p_cadena,'¥','Ñ')	
	set @p_cadena_salida=replace(@p_cadena_salida ,'¤','ñ')
	set @p_cadena_salida=replace(@p_cadena_salida ,'à','Ó')
	--set @p_cadena_salida=replace(@p_cadena_salida ,'é','Ú')
	set @p_cadena_salida=replace(@p_cadena_salida ,'¢','ó')
	set @p_cadena_salida=replace(@p_cadena_salida ,'£','ú')
			
	return (@p_cadena_salida)
	
END
GO
