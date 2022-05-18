
GO
--SqlScripter----[dbo].[alar_ejec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[alar_ejec]') IS NULL EXEC('CREATE PROCEDURE [dbo].[alar_ejec] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[alar_ejec]
(@p_fech_alar datetime, @p_tipo_ejec varchar(200), @p_codi_alar varchar(200), @p_erro varchar(1) OUTPUT, @p_mens varchar(200) OUTPUT)
AS
BEGIN

declare 
	@p_codi_usua	varchar(30),
	@p_usua_calc	varchar(30),
	@p_valo_alar	numeric(22,0),
	@p_valo_alar1	numeric(22),
	@p_erro_alar	varchar(300),
	@p_erro_alar1	varchar(300),
	@p_stat				varchar(1),
	@existe				varchar(1),
	@mensaje			varchar(200),
	@p_fesi_alar	datetime,
	@p_sql				varchar(200),
	@p_stat_alar	varchar(12),
	@p_mensaje		varchar(2000),
	@p_mensaje_id numeric(18),
	@p_origen			varchar(30),
	@p_asunto			varchar(80),
	@p_destino		varchar(80),
	@p_nume_regi	integer,

	@CODI_ALAR	varchar(30),
	@CODI_ALAR2	varchar(30),
	@DESC_ALAR	varchar(80),
	@SQLC_ALAR	varchar(2000),
	@SQLI_ALAR	varchar(2000),
	@FREC_ALAR	varchar(10),
	@INDI_ALAR	numeric(22),
	@COMP_ALAR	varchar(10),
	@VALO_ALAR	numeric(22),
	@FECH_ALAR	datetime,
	@STAT_ALAR	varchar(10),
	@ERRO_ALAR	varchar(300),

	@diav_alar	numeric(9,0),
	@feav_alar	datetime,
	@feas_alar	datetime,

	@INDI_ALUS	numeric(22,0),
	@COMP_ALUS	varchar(10),
	@VALO_ALUS	numeric(22,0),
	@CODI_USUA	varchar(30),

	@mail_usua	varchar(80),

	@ESTA_ALUS	varchar(12),
	@DIAV_ALUS	numeric(9,0),
	@FEAS_ALUS	datetime,
	@feav_alus	datetime,
	@OBJECT_NAME	varchar(12),
	@STAT_ALUS	varchar(12),

	@ESTA_ALAR	varchar(12),

	@FESI_ALAR datetime

	set @p_origen='dbsoft@dbnet.cl'
	set @p_codi_usua = [dbo].[dbnet_get_usua]()

	select @p_fech_alar = convert(datetime,
	     dbo.lpad(convert(varchar,datepart(day,@p_fech_alar)),2,'0') + '-' +
	     dbo.lpad(convert(varchar,datepart(month,@p_fech_alar)),2,'0')+ '-' +
	     dbo.lpad(convert(varchar,datepart(year,@p_fech_alar)),4,'0'),105)

	DECLARE alarmas_activas_por_proceso CURSOR FOR
		SELECT CODI_ALAR, DESC_ALAR, SQLC_ALAR,
					 SQLI_ALAR, FREC_ALAR, INDI_ALAR,
					 COMP_ALAR, VALO_ALAR, FECH_ALAR,
					 STAT_ALAR, ERRO_ALAR
		FROM SYS_ALAR
		WHERE esta_alar='ACTIVADA'
		AND @p_fech_alar >=isnull(fesi_alar,@p_fech_alar)
		AND tipo_alar='PROCESO'
		AND frec_alar != case when @p_tipo_ejec='AUTOMATICO' then 'PERMANENTE' else '99' end
		AND codi_alar LIKE ISNULL(@p_codi_alar,'%');

	DECLARE alarmas_activas_por_rol CURSOR FOR
		SELECT CODI_ALAR, DESC_ALAR, SQLC_ALAR,
					 SQLI_ALAR, FREC_ALAR, INDI_ALAR,
					 COMP_ALAR, diav_alar, VALO_ALAR,
					 FECH_ALAR, STAT_ALAR, ERRO_ALAR,
					 feav_alar, feas_alar
		FROM SYS_ALAR
		WHERE esta_alar='ACTIVADA'
		AND frec_alar != case when @p_tipo_ejec='AUTOMATICO' then 'PERMANENTE' else '99' end
		AND @p_fech_alar >=isnull(fesi_alar,@p_fech_alar)
		AND tipo_alar='ROL'
		AND codi_alar LIKE isnull(@p_codi_alar,'%');

	DECLARE usuarios_a_calcular CURSOR FOR
		SELECT DISTINCT codi_usua
		FROM SYS_USRO u, SYS_ALRI a
		WHERE u.codi_rous=a.codi_rous;

	DECLARE estado_alarma_por_usuario CURSOR FOR
		SELECT CODI_ALAR, indi_alus, comp_alus,
					 valo_alus, codi_usua
		FROM SYS_ALUS
		WHERE esta_alus='ACTIVADA'
		AND @p_fech_alar >=isnull(fesi_alus,@p_fech_alar)
		AND codi_alar LIKE isnull(@p_codi_alar,'%');

	DECLARE usuarios_a_avisar CURSOR FOR
		SELECT DISTINCT u.codi_usua,u.mail_usua
		FROM sys_alar_alus a, SYS_ALUS r,USUA_SIST u
		WHERE r.esta_alus='ACTIVADA'
		AND  a.esta_alar='ACTIVADA'
		AND  case when a.codi_usua is null then r.stat_alus else a.stat_alar end = 'ANORMAL'
		AND  a.codi_alar=r.codi_alar
		AND  r.codi_usua=u.codi_usua
		AND  @p_fech_alar>=isnull(r.FEAS_ALus,@p_fech_alar)
		AND  u.mail_usua IS NOT NULL
		AND  r.mail_alus='S'
		AND  r.orig_alus='AVISAR';

/*	@p_codi_usua es variable de entrada,
	la variable se debe setear antes de ejecutar este cursor*/

	DECLARE alarmas_anormales_del_usuario CURSOR FOR
		SELECT DISTINCT a.CODI_ALAR, a.DESC_ALAR, u.ESTA_ALUS,
		isnull(a.valo_alar,u.VALO_ALUS) valo_alus, u.DIAV_ALUS, u.FEAS_ALUS,
		u.feav_alus, a.OBJECT_NAME, u.STAT_ALUS,
		a.codi_usua
		FROM sys_alar_alus a,  SYS_ALUS u
		WHERE a.esta_alar='ACTIVADA'
		AND  u.esta_alus='ACTIVADA'
		AND  case when a.codi_usua is null then u.stat_alus else a.stat_alar end = 'ANORMAL'
		AND  u.orig_alus='AVISAR'
		AND  a.codi_alar=u.codi_alar
		AND  @p_fech_alar>=isnull(u.FEAS_ALUS,@p_fech_alar)
		AND  @p_codi_usua=u.codi_usua
		AND  u.mail_alus='S';

	DECLARE roles_a_avisar CURSOR FOR
		SELECT DISTINCT u.codi_usua,u.mail_usua
		FROM sys_alar_alus a, SYS_USRO ur, SYS_ALRO r,USUA_SIST u
		WHERE a.esta_alar='ACTIVADA'
		AND  a.stat_alar='ANORMAL'
		AND  a.codi_alar=r.codi_alar
		AND  ur.codi_rous=r.codi_rous
		AND  u.codi_usua=ur.codi_usua
		AND  @p_fech_alar>=isnull(a.FEAS_ALAR,@p_fech_alar)
		AND  u.mail_usua IS NOT NULL
		AND  r.mail_alro='S'
		AND  NOT EXISTS (SELECT codi_usua
	                    FROM SYS_ALUS s
	                    WHERE u.codi_usua=s.codi_usua
	                    AND  s.orig_alus='AVISAR');

/*	@p_codi_usua es variable de entrada,
	la variable se debe setear antes de ejecutar este cursor*/

	DECLARE alarmas_anormales_usuario_rol CURSOR FOR
		SELECT DISTINCT a.CODI_ALAR, a.DESC_ALAR, a.ESTA_ALAR,
		a.VALO_ALAR valo_alus , a.DIAV_ALAR, a.FEAS_ALAR ,
		a.OBJECT_NAME, a.STAT_ALAR ,a.codi_usua
		FROM sys_alar_alus a, SYS_USRO ur, SYS_ALRO r
		WHERE a.esta_alar='ACTIVADA'
		AND  a.stat_alar='ANORMAL'
		AND  a.codi_alar=r.codi_alar
		AND  ur.codi_rous=r.codi_rous
		AND  @p_fech_alar>=isnull(a.FEAS_ALAR,@p_fech_alar)
		AND  @p_codi_usua=ur.codi_usua
		AND  r.mail_alro='S';

	DECLARE cursor_update_sys_alus CURSOR FOR
		SELECT frec_alar, comp_alus,
					 valo_alar, fech_alar,
					 fesi_alar
		FROM SYS_ALAR a, SYS_ALUS b
		WHERE b.codi_alar=a.codi_alar
		AND   esta_alar='ACTIVADA'
		AND  fech_alar=@p_fech_alar;

	OPEN alarmas_activas_por_proceso
	FETCH NEXT FROM alarmas_activas_por_proceso INTO
		@CODI_ALAR,	@DESC_ALAR,	@SQLC_ALAR,
		@SQLI_ALAR,	@FREC_ALAR,	@INDI_ALAR,
		@COMP_ALAR,	@VALO_ALAR,	@FECH_ALAR,
		@STAT_ALAR, @ERRO_ALAR

	WHILE @@FETCH_STATUS = 0
	begin
		set @p_stat='S';
		set @p_erro_alar='N';
		set @p_erro_alar1='';
		/*calcula alarma */

		execute alar_sql_dyn @SQLC_ALAR, @p_valo_alar output, @p_stat output, @p_erro_alar output
		if @p_stat='S'
		begin

			execute alar_fech_sigu @FECH_ALAR, @FREC_ALAR, @p_fesi_alar output, @existe output, @mensaje output
			set @p_sql = 'select count(*) from dual where ';
			set @p_sql = @p_sql + convert(varchar,@p_valo_alar) + @COMP_ALAR + convert(varchar, @INDI_ALAR);
			/* veo si la alarma estß normal o anormal */
			execute alar_sql_dyn @p_sql, @p_valo_alar1 output, @p_stat output, @p_erro_alar output

			if @p_valo_alar1='0'
				set @p_stat_alar = 'NORMAL';
			else
			begin
				set @p_stat_alar = 'ANORMAL';
				if @SQLI_ALAR IS NOT NULL
				begin
					set @p_stat = 'S';
					set @p_erro_alar1 = '';
					/* si la alarma estß anormal y tengo un sql para solucionar el problema lo ejecuto */
						execute alar_sql_dyn @SQLI_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
				end
			end

			UPDATE SYS_ALAR SET
							valo_alar = @p_valo_alar,
							fesi_alar = @p_fesi_alar,
							fech_alar = @p_fech_alar,
							stat_alar = @p_stat_alar,
							erro_alar = @p_erro_alar1
			WHERE  codi_alar	=	@CODI_ALAR

		end
		else
		begin
			/* algo sali¾ mal, mando un mensaje de error para la alarma */
				UPDATE SYS_ALAR SET
							 erro_alar = @p_erro_alar
				WHERE  codi_alar = @CODI_ALAR;
    end

		FETCH NEXT FROM alarmas_activas_por_proceso INTO
			@CODI_ALAR,	@DESC_ALAR,	@SQLC_ALAR,
			@SQLI_ALAR,	@FREC_ALAR,	@INDI_ALAR,
			@COMP_ALAR,	@VALO_ALAR,	@FECH_ALAR,
			@STAT_ALAR, @ERRO_ALAR
	end  /*fin while alarmas_activas_por_proceso*/

	CLOSE alarmas_activas_por_proceso
	DEALLOCATE alarmas_activas_por_proceso

/*	Calculo de valores por usuarios del rol		*/

	OPEN alarmas_activas_por_rol
	FETCH NEXT FROM alarmas_activas_por_rol INTO
		@CODI_ALAR,	@DESC_ALAR,	@SQLC_ALAR,
		@SQLI_ALAR,	@FREC_ALAR,	@INDI_ALAR,
		@COMP_ALAR,	@diav_alar,	@VALO_ALAR,
		@FECH_ALAR,	@STAT_ALAR,	@ERRO_ALAR,
		@feav_alar,	@feas_alar

	WHILE @@FETCH_STATUS = 0
	begin
/* completo aquellas alarmas calculadas por usuario (del rol) que faltan */

		INSERT INTO SYS_ALUS (
				CODI_ALAR, CODI_USUA, ORIG_ALUS,
				PRIO_ALUS, FREC_ALUS, ESTA_ALUS,
				INDI_ALUS, COMP_ALUS, VALO_ALUS,
				FECH_ALUS, FESI_ALUS, FEAV_ALUS,
				DIAV_ALUS, FEAS_ALUS, STAT_ALUS,
				ERRO_ALUS)
			SELECT a.CODI_ALAR, r.CODI_USUA, 'CALCULAR',
						PRIO_ALAR, FREC_ALAR, ESTA_ALAR,
						INDI_ALAR, COMP_ALAR, VALO_ALAR,
						FECH_ALAR, FESI_ALAR, FEAV_ALAR,
						DIAV_ALAR, FEAS_ALAR, STAT_ALAR,
						ERRO_ALAR
			FROM SYS_USRO r, SYS_ALRI	ar, SYS_ALAR a
			WHERE @CODI_ALAR =ar.codi_alar
			AND   r.codi_rous=ar.codi_rous
			AND   a.codi_alar=ar.codi_alar
			AND NOT EXISTS( SELECT codi_alar
											FROM  SYS_ALUS a
											WHERE codi_usua=r.codi_usua
											AND   orig_alus='CALCULAR'
											AND   codi_alar=@CODI_ALAR)

			/* calculo el valor de la alarma por usuario */
		UPDATE SYS_ALUS
		SET indi_alus=@INDI_ALAR,
		    fech_alus=@FECH_ALAR,
		    feav_alus=@feav_alar,
		    feas_alus=@feas_alar,
		    diav_alus=@diav_alar
		WHERE codi_alar=@CODI_ALAR
		AND   orig_alus='CALCULAR'

		execute alar_fech_sigu @FECH_ALAR, @FREC_ALAR, @p_fesi_alar output, @existe output, @mensaje output

		OPEN usuarios_a_calcular
		FETCH NEXT FROM usuarios_a_calcular INTO
			@p_usua_calc

		WHILE @@FETCH_STATUS = 0
		begin
--			dbs_usua.set_usua(cu.codi_usua);
			set @p_stat	=	'S';
			set @p_erro_alar	=	'N';
			set @p_erro_alar1	=	'';

			/*Calculo Alarma */

			execute alar_sql_dyn @SQLC_ALAR, @p_valo_alar output, @p_stat output, @p_erro_alar output

			if @p_stat='S'
			begin
				set @p_sql = 'select count(*) from dual where ';
				set @p_sql = @p_sql	+	@p_valo_alar + @COMP_ALAR + @INDI_ALAR;

				execute alar_sql_dyn @p_sql, @p_valo_alar1 output, @p_stat output, @p_erro_alar output

				if @p_valo_alar1 = '1'
				begin
					set @p_stat_alar = 'ANORMAL';
					if @SQLI_ALAR IS NOT NULL
					begin
						set @p_stat = 'S';
						set @p_erro_alar1='';
						/* veo si la alarma estß normal o anormal */
						execute alar_sql_dyn @SQLI_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
					end
				end
				else
					set @p_stat_alar='NORMAL';
				
				UPDATE SYS_ALUS SET
					valo_alus = @p_valo_alar,
					fesi_alus = @p_fesi_alar,
					fech_alus = @p_fech_alar,
					stat_alus = @p_stat_alar,
					erro_alus = @p_erro_alar1
				WHERE  codi_alar=	@CODI_ALAR
					AND  codi_usua=@p_usua_calc
			end
			else

				UPDATE SYS_ALUS SET
					erro_alus = @p_erro_alar
				WHERE codi_alar=@CODI_ALAR
				AND codi_usua=@p_usua_calc

			FETCH NEXT FROM usuarios_a_calcular INTO
				@p_usua_calc

		end--fin while

		CLOSE usuarios_a_calcular

		UPDATE SYS_ALAR SET
			fesi_alar = @p_fesi_alar,
			fech_alar = @p_fech_alar
		WHERE codi_alar=@CODI_ALAR

		FETCH NEXT FROM alarmas_activas_por_rol INTO
			@CODI_ALAR,	@DESC_ALAR,	@SQLC_ALAR,
			@SQLI_ALAR,	@FREC_ALAR,	@INDI_ALAR,
			@COMP_ALAR,	@diav_alar,	@VALO_ALAR,
			@FECH_ALAR,	@STAT_ALAR,	@ERRO_ALAR,
			@feav_alar,	@feas_alar

	end--fin while

	CLOSE alarmas_activas_por_rol
	DEALLOCATE usuarios_a_calcular
	DEALLOCATE alarmas_activas_por_rol

	--dbs_codi_usua.set_usua(p_codi_usua);

/*	Llevo los valores de alarma a cada usuario	para las alarmas por usuario a avisar*/

	OPEN cursor_update_sys_alus
	FETCH NEXT FROM cursor_update_sys_alus INTO
		@FREC_ALAR, @comp_alus,
		@valo_alar, @fech_alar,
		@fesi_alar

	WHILE @@FETCH_STATUS = 0
	begin
	UPDATE SYS_ALUS 
		SET frec_alus = @FREC_ALAR,
				comp_alus = @COMP_ALUS,
				valo_alus = @VALO_ALAR,
				fech_alus = @FECH_ALAR,
				fesi_alus = @FESI_ALAR
		WHERE orig_alus='AVISAR'
		AND esta_alus='ACTIVADA'
		AND EXISTS (SELECT codi_alar
	              FROM SYS_ALAR a
	              WHERE SYS_ALUS.codi_alar=a.codi_alar
	        			AND  esta_alar='ACTIVADA'
	        			AND  fech_alar=@p_fech_alar
								)
	
	end

	CLOSE cursor_update_sys_alus
	DEALLOCATE cursor_update_sys_alus

/* Determino si la alarma de cada usuario esta normal o anormal */

	OPEN estado_alarma_por_usuario
	FETCH NEXT FROM estado_alarma_por_usuario INTO
		@CODI_ALAR, @indi_alus, @comp_alus,
		@valo_alus, @codi_usua

	WHILE @@FETCH_STATUS = 0
  begin

		set @p_stat='S';
		set @p_erro_alar='N';
		set @p_erro_alar1='';
		set @p_sql='select count(*) from dual where ';
   	set @p_sql=@p_sql + @valo_alus + @comp_alus + @indi_alus;

		execute alar_sql_dyn @p_sql, @p_valo_alar1 output, @p_stat output, @p_erro_alar output

		if @p_valo_alar1='1'
		begin
			set @p_stat_alar='ANORMAL';
		end
		else
			set @p_stat_alar='NORMAL';

		UPDATE SYS_ALUS SET
						stat_alus = @p_stat_alar
		WHERE codi_alar	= @CODI_ALAR
			AND codi_usua	= @codi_usua
			AND orig_alus	= 'AVISAR';

		FETCH NEXT FROM estado_alarma_por_usuario INTO
			@CODI_ALAR, @indi_alus, @comp_alus,
			@valo_alus, @codi_usua

	end

	CLOSE estado_alarma_por_usuario
	DEALLOCATE estado_alarma_por_usuario

/* Mando un mail para aquellos usuarios que tengan mßs de una alarma anormal*/

	OPEN usuarios_a_avisar
	FETCH NEXT FROM usuarios_a_avisar INTO
			@p_codi_usua, @mail_usua

	WHILE @@FETCH_STATUS = 0
	begin

    set @p_mensaje='';

		OPEN alarmas_anormales_del_usuario
		FETCH NEXT FROM alarmas_anormales_del_usuario INTO
			@CODI_ALAR, @DESC_ALAR, @ESTA_ALUS,
			@valo_alus, @DIAV_ALUS, @FEAS_ALUS,
			@feav_alus, @OBJECT_NAME, @STAT_ALUS,
			@codi_usua

		WHILE @@FETCH_STATUS = 0
		begin

			if @codi_usua is NOT NULL
			begin
				set @p_mensaje = @p_mensaje + ' ' + @DESC_ALAR + ' para usuario ' +
												 @codi_usua + ' valor :' + @valo_alus + char(10);
			end
			else
				set @p_mensaje = @p_mensaje + ' ' + @DESC_ALAR + ' valor :' + 
												 @valo_alus + char(10);
			
			UPDATE SYS_ALAR
			SET feav_alar = @p_fech_alar,
					FEAS_ALAR = @p_fech_alar + @DIAV_ALUS
			WHERE codi_alar = @CODI_ALAR;
			
			UPDATE SYS_ALUS
			SET feav_alus = @p_fech_alar,
					FEAS_ALus = @p_fech_alar + @DIAV_ALUS
			WHERE codi_alar=@CODI_ALAR
			AND codi_usua=@p_codi_usua;

			FETCH NEXT FROM alarmas_anormales_del_usuario INTO
				@CODI_ALAR, @DESC_ALAR, @ESTA_ALUS,
				@valo_alus, @DIAV_ALUS, @FEAS_ALUS,
				@feav_alus, @OBJECT_NAME, @STAT_ALUS,
				@codi_usua
		end

		CLOSE alarmas_anormales_del_usuario

    set @p_asunto='Alarma de DBSoft';
    set @p_destino=@mail_usua;
    execute put_email @p_origen, @p_destino, NULL, @p_asunto, @p_mensaje, @p_mensaje_id output

		FETCH NEXT FROM usuarios_a_avisar INTO
				@p_codi_usua, @mail_usua

	end

	CLOSE usuarios_a_avisar
	DEALLOCATE alarmas_anormales_del_usuario
	DEALLOCATE usuarios_a_avisar

	OPEN roles_a_avisar
	FETCH NEXT FROM roles_a_avisar INTO
		@p_codi_usua, @mail_usua

	WHILE @@FETCH_STATUS = 0
	begin

    	set @p_mensaje = '';
	
		OPEN alarmas_anormales_usuario_rol
		FETCH NEXT FROM alarmas_anormales_usuario_rol INTO
			@CODI_ALAR, @DESC_ALAR, @ESTA_ALAR,
			@valo_alus, @DIAV_ALAR, @FEAS_ALAR ,
			@OBJECT_NAME, @STAT_ALAR, @codi_usua

		WHILE @@FETCH_STATUS = 0
		begin
			print '2'
			if @codi_usua is NOT NULL
			begin
	
				set @p_mensaje = @p_mensaje + ' ' + @DESC_ALAR + ' para usuario ' + @codi_usua +
										' valor :' + convert(varchar,@valo_alus) + char(10);
			end
			else 
			begin
	
				set @p_mensaje = @p_mensaje + ' ' + @DESC_ALAR + ' valor :'+ convert(varchar,@valo_alus) + char(10);
    	 		end
    	
    	 		
			UPDATE SYS_ALAR
			SET feav_alar	=	@p_fech_alar,
					FEAS_ALAR = @p_fech_alar + @DIAV_ALAR
			WHERE codi_alar = @codi_alar;
			
			UPDATE SYS_ALUS
			SET feav_alus = @p_fech_alar,
					FEAS_ALus = @p_fech_alar + @DIAV_ALAR
			WHERE codi_alar = @codi_alar
			AND   codi_usua = @p_codi_usua;

	
			FETCH NEXT FROM alarmas_anormales_usuario_rol INTO
				@CODI_ALAR, @DESC_ALAR, @ESTA_ALAR,
				@valo_alus, @DIAV_ALAR, @FEAS_ALAR ,
				@OBJECT_NAME, @STAT_ALAR, @codi_usua

		end

		CLOSE alarmas_anormales_usuario_rol

		set @p_asunto = 'Alarma de DBSoft';
		set @p_destino = @mail_usua;

		execute put_email @p_origen, @p_destino, NULL, @p_asunto, @p_mensaje, @p_mensaje_id output

		FETCH NEXT FROM roles_a_avisar INTO
			@codi_usua, @mail_usua
	end

	CLOSE roles_a_avisar
	DEALLOCATE alarmas_anormales_usuario_rol
	DEALLOCATE roles_a_avisar

END
GO

GO
--SqlScripter----[dbo].[alar_ejec_empresa].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[alar_ejec_empresa]') IS NULL EXEC('CREATE PROCEDURE [dbo].[alar_ejec_empresa] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[alar_ejec_empresa]
(@p_fech_alar datetime, @p_erro varchar(1) OUTPUT, @p_mens varchar(200) OUTPUT)
AS
BEGIN
declare 
    @p_valo_alar      numeric(22,0),  @p_valo_alar1     numeric(22),
    @p_erro_alar      varchar(300),   @p_erro_alar1     varchar(300),
    @p_stat           varchar(1),     @p_mensaje_id     numeric(18),
    @p_fesi_alar      datetime,       @p_sql            varchar(200),
    @p_stat_alar      varchar(12),    @p_mensaje        varchar(2000),
    @p_origen         varchar(80),    @p_asunto         varchar(100),
    @p_destino        varchar(80),    @p_nume_regi      integer,
    @existe           varchar(1),     @mensaje          varchar(200),
    @fecha_act        varchar(30),    @fecha_sig        varchar(30),
    @CODI_EMEX        varchar(30),    @CODI_ALAR        varchar(30),
    @DESC_ALAR        varchar(80),    @SQLC_ALAR        varchar(2000),
    @SQLI_ALAR        varchar(2000),  @FREC_ALAR        varchar(10),
    @INDI_ALAR        numeric(22),    @COMP_ALAR        varchar(10),
    @VALO_ALAR        numeric(22),    @FECH_ALAR        datetime,
    @STAT_ALAR        varchar(10),    @ERRO_ALAR        varchar(300),
    @MAIL_INFO        varchar(300),   @MAIL_CCCC        varchar(300),
    @ESTA_ALAR        varchar(12),    @FESI_ALAR        datetime,
    @CODI_EMPR        varchar(30),    @CODI_USUA        varchar(30),
    @SQLD_ALAR        VARCHAR(200),   @ACCI_ALAR        VARCHAR(200),
    @rutt_rece        numeric(11),
    @NOMB_EMPR	      VARCHAR(40)

--SP1 SE 5.2
select @p_fech_alar = convert(datetime,
         dbo.lpad(convert(varchar,datepart(day,@p_fech_alar)),2,'0') + '-' +
         dbo.lpad(convert(varchar,datepart(month,@p_fech_alar)),2,'0')+ '-' +
         dbo.lpad(convert(varchar,datepart(year,@p_fech_alar)),4,'0'),105)

DECLARE alarmas_activas_por_empresa CURSOR FOR
select    a.CODI_EMEX, a.CODI_EMPR, a.CODI_ALAR, b.sqlc_alar,
        b.sqli_alar, a.frec_alar, a.indi_alar, a.comp_alar,
        a.valo_alar, a.fech_alar, a.stat_alar, a.erro_alar,
        a.mail_info, a.mail_cccc, b.desc_alar,b.sqld_alar, 
        b.acci_alar
from    sys_alar_empr a, sys_alar b
WHERE    a.esta_alar = 'ACTIVADA'
and        a.codi_alar = b.codi_alar
--and substring (convert(varchar,getdate(),120),0,11) >= isnull(substring (convert(varchar,a.fesi_alar,120),0,11),substring (convert(varchar,getdate(),120),0,11))
--and a.codi_emex = 'PROD_0133'  --and @p_fech_alar >=isnull(a.fesi_alar,@p_fech_alar)

OPEN alarmas_activas_por_empresa
    FETCH NEXT FROM alarmas_activas_por_empresa INTO
        @CODI_EMEX,    @CODI_EMPR, @CODI_ALAR,    @SQLC_ALAR,
        @SQLI_ALAR,    @FREC_ALAR,    @INDI_ALAR, @COMP_ALAR,    
        @VALO_ALAR,    @FECH_ALAR, @STAT_ALAR, @ERRO_ALAR,
        @MAIL_INFO, @MAIL_CCCC, @DESC_ALAR,    @SQLD_ALAR,
        @ACCI_ALAR

    WHILE @@FETCH_STATUS = 0
    begin /*inicio Cursor OK*/
        PRINT('*******************************')
        PRINT('Inicio While')
        PRINT('************************')
        PRINT('Código Alarma: '+@CODI_ALAR);
        PRINT('Empresa : '+@CODI_EMPR);
        PRINT('Holding: '+@CODI_EMEX);
        PRINT('************************')

        set @p_stat='S';
        set @p_erro_alar='N';
        set @p_erro_alar1='';
        
        --CALCULO DE LA ALARMA SQLC
        select @rutt_rece=rutt_empr , @NOMB_EMPR = nomb_empr from empr where codi_emex=@CODI_EMEX and codi_empr=@CODI_EMPR
        
        exec dbnet_set_emex  @CODI_EMEX
        if @SQLC_ALAR IS NOT NULL
            begin 
                set @SQLC_ALAR = replace(@SQLC_ALAR, 1010, @CODI_EMPR);
                set @SQLC_ALAR = replace(@SQLC_ALAR, 'holding', @CODI_EMEX);
                set @SQLC_ALAR = replace(@SQLC_ALAR, 'ruttRece', @rutt_rece);
            end
        print @SQLC_ALAR

        execute alar_sql_dyn @SQLC_ALAR, @p_valo_alar output, @p_stat output, @p_erro_alar output

        print ('        Estado p_stat: '+@p_stat)
        
        if @p_stat='S' --si sqlc esta ok  p_valo_alar es el count del sqlc
          begin
            --reviso si alarma NORMAL o ANORMAL
            --print @SQLC_ALAR;

            execute alar_fech_sigu @FECH_ALAR, @FREC_ALAR, @p_fesi_alar output, @existe output, @mensaje output    
            --print 'fecha_siguiente' + @p_fesi_alar;
            print ('        Fecha Ejecucion: '+convert(varchar,@FECH_ALAR,120));
            print ('        Fecha Siguiente: '+convert(varchar,@p_fesi_alar,120));
            set @p_sql = 'select count(*) from dual where '; /*count > 0 si la condicion cumple p_valo_alar1*/
            set @p_sql = @p_sql + convert(varchar,@p_valo_alar) + @COMP_ALAR + convert(varchar, @INDI_ALAR);
            print ('        p_sql: '+@p_sql);
            --Ejecución query dinamica para el calculo de valores
            execute alar_sql_dyn @p_sql, @p_valo_alar1 output, @p_stat output, @p_erro_alar output
            print  ('        p_valo_alar1: '+CONVERT(VARCHAR,@p_valo_alar1));

            
            if @p_valo_alar1 = 0
            begin
                set @p_stat_alar = 'NORMAL';
                print ('        Alarma normal');
                if @SQLD_ALAR is not null 
                    begin
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'holding', @CODI_EMEX);
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'empresa', @CODI_EMPR);
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'usuario', @CODI_USUA);
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'alarma', @CODI_ALAR);
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'ruttRece', @rutt_rece);
                        print ('        '+@SQLD_ALAR);
                        --borra registros antiguos
                        execute alar_sql_dyn @SQLD_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
                    end
            end
            else if @p_valo_alar1 > 0 and @COMP_ALAR = '='
            begin
                set @p_stat_alar = 'ANORMAL';
                print ('        Alarma Anormal , ELSE IF = ');
                
                if @SQLI_ALAR IS NOT NULL
                begin /* si la alarma está anormal y tengo un sql para solucionar el problema lo ejecuto */
                    set @p_stat = 'S';
                    set @p_erro_alar1 = '';
                    --set @CODI_EMPR='';
                    SET @CODI_USUA='*';
                    --print @CODI_EMPR;
                    if @SQLI_ALAR is not null  
                    begin
                        SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 'holding', @CODI_EMEX);
                        SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 1010, @CODI_EMPR);
                        SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 'usuario', @CODI_USUA);
                        SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 'ruttRece', @rutt_rece);
                        print ('        '+@SQLI_ALAR);
                    end
                    if @SQLD_ALAR is not null  
                    begin
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'holding', @CODI_EMEX);
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'empresa', @CODI_EMPR);
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'usuario', @CODI_USUA);
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'alarma', @CODI_ALAR);
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'ruttRece', @rutt_rece);
                        print ('        '+@SQLD_ALAR);
                        --borra registros antiguos
                        execute alar_sql_dyn @SQLD_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
                    end
                    
                    execute alar_sql_dyn @SQLI_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
                end
            end
            else if @p_valo_alar1 > 0 and @COMP_ALAR = '=' and @CODI_ALAR = 'LIBROSCV'
            begin
                if (substring(convert(varchar,getdate(),120),9,2) ='20' )
                begin
                    set @p_stat_alar = 'ANORMAL';
                    print 'p_stat_alar "="'+@p_stat_alar;
                    if @SQLI_ALAR IS NOT NULL
                        begin /* si la alarma está anormal y tengo un sql para solucionar el problema lo ejecuto */
                            set @p_stat = 'S';
                            set @p_erro_alar1 = '';
                            --set @CODI_EMPR='';
                            SET @CODI_USUA='*';
                            --print @CODI_EMPR;
                            if @SQLI_ALAR <> '' 
                            begin
                                SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 'holding', @CODI_EMEX);
                                SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 1010, @CODI_EMPR);
                                SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 'usuario', @CODI_USUA);
                                --print('SQLI_ALAR: '+@SQLI_ALAR);
                            end
                            if @SQLD_ALAR <> '' 
                            begin
                                SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'holding', @CODI_EMEX);
                                SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'empresa', @CODI_EMPR);
                                SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'usuario', @CODI_USUA);
                                SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'alarma', @CODI_ALAR);
                                SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 1010, @CODI_EMPR);
                                print 'SQLD_ALAR: '+@SQLD_ALAR;
                                --borra registros antiguos
                                execute alar_sql_dyn @SQLD_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
                            end
                            execute alar_sql_dyn @SQLI_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
                        end
                    else
                        print('SQLI vacio');
                end
                else 
                    set @p_stat_alar = 'NORMAL'
            end
            else
            begin
                set @p_stat_alar = 'ANORMAL';
                print ('        Alarma ANORMAL');

                if @SQLI_ALAR IS NOT NULL
                begin /* si la alarma está anormal y tengo un sql para solucionar el problema lo ejecuto */
                    set @p_stat = 'S';
                    set @p_erro_alar1 = '';
                    SET @CODI_USUA='*';

                    if @SQLI_ALAR is not null  
                    begin
                        SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 'holding', @CODI_EMEX);
                        SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 1010, @CODI_EMPR);
                        SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 'usuario', @CODI_USUA);
                        SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 'ruttRece', @rutt_rece);
                        print ('        '+@SQLI_ALAR);
                    end

                    if @SQLD_ALAR is not null  
                    begin
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'holding', @CODI_EMEX);
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'empresa', @CODI_EMPR);
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'usuario', @CODI_USUA);
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'alarma', @CODI_ALAR);
                        SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'ruttRece', @rutt_rece);
                        print ('        '+@SQLD_ALAR);
                        --borra registros antiguos
                        execute alar_sql_dyn @SQLD_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
                    end
                    execute alar_sql_dyn @SQLI_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
                end
            end
        end 
        else --IF P_STAT='N'
        begin
            --algo salió mal, mando un mensaje de error para la alarma
            UPDATE SYS_ALAR_EMPR SET
                   erro_alar = @p_erro_alar,
                   valo_alar = @p_valo_alar
            WHERE  codi_alar = @CODI_ALAR
            and    codi_empr = @CODI_EMPR
            and    codi_emex = @CODI_EMEX
        end

        /* actualizo fecha de ejecución */
        execute alar_fech_sigu @p_fech_alar, @FREC_ALAR, @p_fesi_alar output, @existe output, @mensaje output
        print('actualizo fecha de ejecución ')
		
		print('@CODI_ALAR: '+convert(varchar,@CODI_ALAR))
		print('@CODI_EMPR: '+convert(varchar,@CODI_EMPR))
		print('@CODI_EMEX: '+convert(varchar,@CODI_EMEX))
		print('@p_stat_alar: '+convert(varchar,@p_stat_alar))
		print('@p_valo_alar: '+convert(varchar,@p_valo_alar))
		print('@p_erro_alar: '+convert(varchar,@p_erro_alar))
        UPDATE SYS_ALAR_EMPR SET
		stat_alar = UPPER(@p_stat_alar),
                valo_alar = @p_valo_alar,
                fech_alar = convert(datetime,@p_fech_alar,120),
                fesi_alar = convert(datetime,@p_fesi_alar,120),
                erro_alar = @p_erro_alar1
        WHERE   codi_alar = @CODI_ALAR
        and     CODI_EMPR = @CODI_EMPR
        AND     codi_emex = @CODI_EMEX

        /* envio de email */
        if @p_valo_alar1!='0' /*SI SE INSERTO EN LA SYS_ALIN*/
        begin
            /*RESCATO EMAIL DE ENVIO*/
            select    @p_origen=VALO_PAEM
            from    PARA_EMPR
            where    CODI_EMPR=@CODI_EMPR
            AND        CODI_PAEM='EGME'

            IF (@p_origen IS NULL) /*SI OCURRE ALGUN ERROR AL RESCATAR EMAIL DE ENVIO ASIGNO UNO*/
            begin
                set @p_origen='correo@dbnet.cl'
            end

            /*ENVIO EMAIL*/
            set @p_mensaje = ''
            set @p_mensaje = @p_mensaje + ' ' + @DESC_ALAR + char(10) + ' ' +  @ACCI_ALAR + char(10) +' Revisar Detalle de registros en Monitor de Alarmas en DBNeT Suite Electrónica' + @CODI_EMPR + ', ' + @NOMB_EMPR;
            set @p_asunto = '* Alarma DBNeT - ' + @DESC_ALAR ;
            set @p_destino = @MAIL_INFO;
            /*Y EL MAIL CC COMO LO INSERTA EN EL PUT_MAIL*/
            execute put_email @p_origen, @p_destino, @MAIL_CCCC, @p_asunto, @p_mensaje, @p_mensaje_id output
        end
        
        FETCH NEXT FROM alarmas_activas_por_empresa INTO
                @CODI_EMEX,    @CODI_EMPR, @CODI_ALAR,    @SQLC_ALAR,
                @SQLI_ALAR,    @FREC_ALAR,    @INDI_ALAR,
                @COMP_ALAR,    @VALO_ALAR,    @FECH_ALAR,
                @STAT_ALAR, @ERRO_ALAR,    @MAIL_INFO,
                @MAIL_CCCC,@DESC_ALAR,@SQLD_ALAR,@ACCI_ALAR
      end  /*fin while alarmas_activas_por_proceso*/
    CLOSE alarmas_activas_por_empresa
    DEALLOCATE alarmas_activas_por_empresa
END
GO

GO
--SqlScripter----[dbo].[alar_ejec_holding].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[alar_ejec_holding]') IS NULL EXEC('CREATE PROCEDURE [dbo].[alar_ejec_holding] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[alar_ejec_holding]
(@p_fech_alar datetime, @p_erro varchar(1) OUTPUT, @p_mens varchar(200) OUTPUT)
AS
BEGIN
declare 
	@p_valo_alar	numeric(22,0),
	@p_valo_alar1	numeric(22),
	@p_erro_alar	varchar(300),
	@p_erro_alar1	varchar(300),
	@p_stat		varchar(1),
	@p_mensaje_id	numeric(18),
	@p_fesi_alar	datetime,
	@p_sql		varchar(200),
	@p_sql2		varchar(200),
	@p_stat_alar	varchar(12),
	@p_mensaje	varchar(2000),
	@p_origen	varchar(80),
	@p_asunto	varchar(100),
	@p_destino	varchar(80),
	@p_destinoCc	varchar(80),
	@p_nume_regi	integer,
	@existe		varchar(1),
	@mensaje	varchar(200),
	@CODI_EMEX  varchar(30),
	@CODI_ALAR	varchar(30),
	@DESC_ALAR	varchar(80),
	@SQLC_ALAR	varchar(2000),
	@SQLI_ALAR	varchar(2000),
	@FREC_ALAR	varchar(10),
	@INDI_ALAR	numeric(22),
	@COMP_ALAR	varchar(10),
	@VALO_ALAR	numeric(22),
	@FECH_ALAR	datetime,
	@STAT_ALAR	varchar(10),
	@ERRO_ALAR	varchar(300),
	@MAIL_INFO	varchar(300),
	@MAIL_CCCC  varchar(300),
	@ESTA_ALAR	varchar(12),
	@FESI_ALAR 	datetime,
	@CODI_EMPR  varchar(30),
	@CODI_USUA  varchar(30),
	@SQLD_ALAR		VARCHAR(200),
    @ACCI_ALAR		VARCHAR(200)
	
--SP1 SE 5.2
select @p_fech_alar = convert(datetime,
	     dbo.lpad(convert(varchar,datepart(day,@p_fech_alar)),2,'0') + '-' +
         dbo.lpad(convert(varchar,datepart(month,@p_fech_alar)),2,'0')+ '-' +
         dbo.lpad(convert(varchar,datepart(year,@p_fech_alar)),4,'0'),105)
print @p_fech_alar;

DECLARE alarmas_activas_por_holding CURSOR FOR
select a.CODI_EMEX, a.CODI_ALAR, b.sqlc_alar, b.sqli_alar, a.frec_alar, a.indi_alar, a.comp_alar, a.valo_alar,
	   a.fech_alar, a.stat_alar, a.erro_alar, a.mail_info, a.mail_cccc, b.desc_alar, b.sqld_alar, b.acci_alar, 
	   0
from sys_alar_emex a, sys_alar b
WHERE a.esta_alar='ACTIVADA'
  and a.codi_alar= b.codi_alar
  --and @p_fech_alar >=isnull(a.fesi_alar,@p_fech_alar)
  
--print('Leyendo el Cursor');

OPEN alarmas_activas_por_holding
	FETCH NEXT FROM alarmas_activas_por_holding INTO
		@CODI_EMEX,	@CODI_ALAR,	@SQLC_ALAR, @SQLI_ALAR,	@FREC_ALAR,	@INDI_ALAR, @COMP_ALAR,	@VALO_ALAR,	
		@FECH_ALAR, @STAT_ALAR, @ERRO_ALAR,	@MAIL_INFO, @MAIL_CCCC, @DESC_ALAR,	@SQLD_ALAR, @ACCI_ALAR,
		@CODI_EMPR
	print('Codigo Alarma: '+@CODI_ALAR);
	WHILE @@FETCH_STATUS = 0
	begin /*inicio Cursor OK*/
		set @p_stat='S';
		set @p_erro_alar='N';
		set @p_erro_alar1='';
		
		exec dbnet_set_emex  @CODI_EMEX
		
		if @SQLC_ALAR IS NOT NULL
			begin 
				print 'Empresa: '+@codi_empr;
				set @SQLC_ALAR = replace(@SQLC_ALAR, 1010, @CODI_EMPR);
				set @SQLC_ALAR = replace(@SQLC_ALAR, 'holding', @CODI_EMEX);
			end
		
		--print(@SQLC_ALAR);
			
		--print 'execute alar_sql_dyn';
		execute alar_sql_dyn @SQLC_ALAR, @p_valo_alar output, @p_stat output, @p_erro_alar output
		
		--print('Valor Alarma: '+convert(varchar,@p_valo_alar));
		--print('Comparación Alarma: '+convert(varchar,@COMP_ALAR));
		--print('Indicador Alarma: '+convert(varchar,@INDI_ALAR));
		if @p_stat='S' /*si sqlc esta ok  p_valo_alar es el count del sqlc*/ 
		  begin
			/*reviso si alarma NORMAL o ANORMAL*/	
			
			--print ('SQLC_ALAR: '+@SQLC_ALAR);
			set @FECH_ALAR = convert(datetime,@FECH_ALAR,120);
			execute alar_fech_sigu @FECH_ALAR, @FREC_ALAR, @p_fesi_alar output, @existe output, @mensaje output
			--print 'fecha_siguiente: ' + convert(varchar,@p_fesi_alar,120);
			
			set @p_sql = 'select count(*) from dual where '; /*count > 0 si la condicion cumple p_valo_alar1*/
			set @p_sql = @p_sql + convert(varchar,@p_valo_alar) + ' '+ @COMP_ALAR+' '+ convert(varchar, @INDI_ALAR);
			--print @p_sql;
			
			execute alar_sql_dyn @p_sql, @p_valo_alar1 output, @p_stat output, @p_erro_alar output
			--print  'p_valo_alar1: '+convert(varchar,@p_valo_alar1);
			
			if @p_valo_alar1='0'
				set @p_stat_alar = 'NORMAL';
			else if @p_valo_alar1 = @INDI_ALAR and @COMP_ALAR = '='
				begin
					set @p_stat_alar = 'ANORMAL';
					print 'p_stat_alar "="'+@p_stat_alar;
					if @SQLI_ALAR IS NOT NULL
						begin /* si la alarma está anormal y tengo un sql para solucionar el problema lo ejecuto */
							set @p_stat = 'S';
							set @p_erro_alar1 = '';
							--set @CODI_EMPR='';
							SET @CODI_USUA='*';
							--print @CODI_EMPR;
							if @SQLI_ALAR <> '' 
							begin
								SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 'holding', @CODI_EMEX);
								SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 1010, @CODI_EMPR);
								SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 'usuario', @CODI_USUA);
								--print('SQLI_ALAR: '+@SQLI_ALAR);
							end
							if @SQLD_ALAR <> '' 
							begin
								SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'holding', @CODI_EMEX);
								SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'empresa', @CODI_EMPR);
								SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'usuario', @CODI_USUA);
								SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'alarma', @CODI_ALAR);
								print 'SQLD_ALAR: '+@SQLD_ALAR;
								--borra registros antiguos
								execute alar_sql_dyn @SQLD_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
							end
							execute alar_sql_dyn @SQLI_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
						end
					else
						print('SQLI vacio');
				end
			else
				begin
					set @p_stat_alar = 'ANORMAL';
					print 'p_stat_alar else: '+@p_stat_alar;
					if @SQLI_ALAR IS NOT NULL
					begin /* si la alarma está anormal y tengo un sql para solucionar el problema lo ejecuto */
						set @p_stat = 'S';
						set @p_erro_alar1 = '';
						--set @CODI_EMPR='';
						SET @CODI_USUA='*';
						--print @CODI_EMPR;
						SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 'holding', @CODI_EMEX);
						SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 1010, @CODI_EMPR);
						SELECT @SQLI_ALAR = replace(@SQLI_ALAR, 'usuario', @CODI_USUA);
						--print 'SQLI_ALAR: '+@SQLI_ALAR;
						if @SQLD_ALAR <> '' 
						begin
						SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'holding', @CODI_EMEX);
						SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'empresa', @CODI_EMPR);
						SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'usuario', @CODI_USUA);
						SELECT @SQLD_ALAR = replace(@SQLD_ALAR, 'alarma', @CODI_ALAR);
						--print 'SQLD_ALAR: '+@SQLD_ALAR;
						--borra registros antiguos
						execute alar_sql_dyn @SQLD_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
						end
						
						execute alar_sql_dyn @SQLI_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
					end
					else
						print('SQLI vacio');
				end
		--print('Update sys_alar_emex');
		/*UPDATE SYS_ALAR_EMEX SET
				valo_alar = @p_valo_alar,
				fesi_alar = @p_fesi_alar,
				fech_alar = @p_fech_alar,
				stat_alar = @p_stat_alar,
				erro_alar = @p_erro_alar1
		WHERE  codi_alar =	@CODI_ALAR 
          AND  codi_emex = 	@CODI_EMEX*/

		end /*fin Cursor Ok*/
		--else /*IF P_STAT='N'*/
		begin
			/* algo salió mal, mando un mensaje de error para la alarma */
			UPDATE SYS_ALAR_EMEX SET
				erro_alar = @p_erro_alar
			WHERE  codi_alar = @CODI_ALAR
    		  and  codi_emex = @CODI_EMEX
			end
			
			/* actualizo fecha de ejecución */
			execute alar_fech_sigu @p_fech_alar, @FREC_ALAR, @p_fesi_alar output, @existe output, @mensaje output	
			
			--	print('actualizo fecha de ejecuciónde hoy y siguiente ')
				UPDATE	SYS_ALAR_EMPR SET
				valo_alar = @p_valo_alar,
				fech_alar =  convert(datetime,@p_fech_alar,120),
				fesi_alar =  convert(datetime,@p_fesi_alar,120),
				erro_alar = @p_erro_alar1
				WHERE	codi_alar =	@CODI_ALAR
				  AND	codi_emex = 	@CODI_EMEX
			
			/* envio de email */
    		if @p_valo_alar1!='0' /*SI SE INSERTO EN LA SYS_ALIN*/
    		begin
    			/*RESCATO EMAIL DE ENVIO*/
				select @p_origen=emex_from
			        from empr_exte
			       where codi_emex=@CODI_EMEX
        
			IF (@p_origen IS NULL) /*SI OCURRE ALGUN ERROR AL RESCATAR EMAIL DE ENVIO ASIGNO UNO*/
			begin
			      set @p_origen='correo@dbnet.cl';
			end
 
			/*ENVIO EMAIL*/
			set @p_mensaje = ''
			set @p_mensaje = @p_mensaje + ' ' + @DESC_ALAR + char(10) + '. Revisar Alarma en Suite Electronica. Holding: ' + @CODI_EMEX;
			set @p_asunto = 'Holding: ' + @CODI_EMEX + ' - Alarma de Suite - ' + @DESC_ALAR ;
			set @p_destino = @MAIL_INFO;
			set @p_destinoCc = @MAIL_CCCC;
			/*Y EL MAIL CC COMO LO INSERTA EN EL PUT_MAIL*/
			
			execute put_email @p_origen, @p_destino, @MAIL_CCCC, @p_asunto, @p_mensaje, @p_mensaje_id output
		end
		FETCH NEXT FROM alarmas_activas_por_holding INTO
		@CODI_EMEX,	@CODI_ALAR,	@SQLC_ALAR, @SQLI_ALAR,	@FREC_ALAR,	@INDI_ALAR, @COMP_ALAR,	@VALO_ALAR,	
		@FECH_ALAR, @STAT_ALAR, @ERRO_ALAR,	@MAIL_INFO, @MAIL_CCCC, @DESC_ALAR,	@SQLD_ALAR, @ACCI_ALAR,
		@CODI_EMPR
	  end  /*fin while alarmas_activas_por_proceso*/

	CLOSE alarmas_activas_por_holding
	DEALLOCATE alarmas_activas_por_holding
END
GO

GO
--SqlScripter----[dbo].[alar_ejec_suite].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[alar_ejec_suite]') IS NULL EXEC('CREATE PROCEDURE [dbo].[alar_ejec_suite] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[alar_ejec_suite]
(@p_fech_alar datetime, @p_tipo_ejec varchar(200), @p_codi_alar varchar(200), @p_erro varchar(1) OUTPUT, @p_mens varchar(200) OUTPUT)
AS
BEGIN

declare 
	
	@p_valo_alar	numeric(22,0),
	@p_valo_alar1	numeric(22),
	@p_erro_alar	varchar(300),
	@p_erro_alar1	varchar(300),
	@p_stat		varchar(1),
	@existe		varchar(1),
	@mensaje	varchar(200),
	@p_mensaje_id	numeric(18),
	@p_fesi_alar	datetime,
	@p_sql		varchar(200),
	@p_stat_alar	varchar(12),
	@p_mensaje	varchar(2000),
	
	@p_origen	varchar(80),
	@p_asunto	varchar(100),
	@p_destino	varchar(80),
	@p_nume_regi	integer,

	@CODI_ALAR	varchar(30),
	@CODI_ALAR2	varchar(30),
	@DESC_ALAR	varchar(80),
	@SQLC_ALAR	varchar(2000),
	@SQLI_ALAR	varchar(2000),
	@FREC_ALAR	varchar(10),
	@INDI_ALAR	numeric(22),
	@COMP_ALAR	varchar(10),
	@VALO_ALAR	numeric(22),
	@FECH_ALAR	datetime,
	@STAT_ALAR	varchar(10),
	@ERRO_ALAR	varchar(300),
	@MAIL_INFO	varchar(300),
	
	@ESTA_ALAR	varchar(12),
	@FESI_ALAR 	datetime

	
	
	select @p_fech_alar = convert(datetime,
	     dbo.lpad(convert(varchar,datepart(day,@p_fech_alar)),2,'0') + '-' +
	     dbo.lpad(convert(varchar,datepart(month,@p_fech_alar)),2,'0')+ '-' +
	     dbo.lpad(convert(varchar,datepart(year,@p_fech_alar)),4,'0'),105)

	DECLARE alarmas_activas_por_proceso CURSOR FOR
		SELECT CODI_ALAR, DESC_ALAR, SQLC_ALAR,
					 SQLI_ALAR, FREC_ALAR, INDI_ALAR,
					 COMP_ALAR, VALO_ALAR, FECH_ALAR,
					 STAT_ALAR, ERRO_ALAR, MAIL_INFO
		FROM SYS_ALAR
		WHERE esta_alar='ACTIVADA'
		AND @p_fech_alar >=isnull(fesi_alar,@p_fech_alar)
		AND tipo_alar='PROCESO'

	
	OPEN alarmas_activas_por_proceso
	FETCH NEXT FROM alarmas_activas_por_proceso INTO
		@CODI_ALAR,	@DESC_ALAR,	@SQLC_ALAR,
		@SQLI_ALAR,	@FREC_ALAR,	@INDI_ALAR,
		@COMP_ALAR,	@VALO_ALAR,	@FECH_ALAR,
		@STAT_ALAR, 	@ERRO_ALAR,	@MAIL_INFO

	WHILE @@FETCH_STATUS = 0
	begin
		set @p_stat='S';
		set @p_erro_alar='N';
		set @p_erro_alar1='';
		/*calcula alarma */

		execute alar_sql_dyn @SQLC_ALAR, @p_valo_alar output, @p_stat output, @p_erro_alar output
		if @p_stat='S'
		begin

			execute alar_fech_sigu @FECH_ALAR, @FREC_ALAR, @p_fesi_alar output, @existe output, @mensaje output
			set @p_sql = 'select count(*) from dual where ';
			set @p_sql = @p_sql + convert(varchar,@p_valo_alar) + @COMP_ALAR + convert(varchar, @INDI_ALAR);
			/* veo si la alarma estß normal o anormal */
			execute alar_sql_dyn @p_sql, @p_valo_alar1 output, @p_stat output, @p_erro_alar output

			if @p_valo_alar1='0'
				set @p_stat_alar = 'NORMAL';
			else
			begin
				set @p_stat_alar = 'ANORMAL';
				if @SQLI_ALAR IS NOT NULL
				begin
					set @p_stat = 'S';
					set @p_erro_alar1 = '';
					/* si la alarma estß anormal y tengo un sql para solucionar el problema lo ejecuto */
						execute alar_sql_dyn @SQLI_ALAR, @p_nume_regi output, @p_stat output, @p_erro_alar output
				end
			end

			UPDATE SYS_ALAR SET
							valo_alar = @p_valo_alar,
							fesi_alar = @p_fesi_alar,
							fech_alar = @p_fech_alar,
							stat_alar = @p_stat_alar,
							erro_alar = @p_erro_alar1
			WHERE  codi_alar	=	@CODI_ALAR

		end
		else
		begin
			/* algo sali¾ mal, mando un mensaje de error para la alarma */
			UPDATE SYS_ALAR SET
				erro_alar = @p_erro_alar
			WHERE  codi_alar = @CODI_ALAR;
    		end
    		
    		/* envio de email */
    		if @p_valo_alar1!='0'
    		begin
    			select @p_origen=VALO_PAEM
			        from PARA_EMPR
			       where CODI_EMPR=1
			        AND CODI_PAEM='EGME'
			IF (@@ERROR <> 0)
			begin
			      set @p_origen='cliente_sin_email_empr@dbsoft.cl'
			end
			set @p_mensaje = ''
			
			set @p_mensaje = @p_mensaje + ' ' + @DESC_ALAR + char(10) + '. Revisar Alarma en Suite Electronica';
		    	 		
			set @p_asunto = 'Alarma de Suite - ' + @DESC_ALAR ;
			
			set @p_destino = @MAIL_INFO;
		
			execute put_email @p_origen, @p_destino, NULL, @p_asunto, @p_mensaje, @p_mensaje_id output
		end
		FETCH NEXT FROM alarmas_activas_por_proceso INTO
				@CODI_ALAR,	@DESC_ALAR,	@SQLC_ALAR,
				@SQLI_ALAR,	@FREC_ALAR,	@INDI_ALAR,
				@COMP_ALAR,	@VALO_ALAR,	@FECH_ALAR,
				@STAT_ALAR, 	@ERRO_ALAR,	@MAIL_INFO

		
	end  /*fin while alarmas_activas_por_proceso*/

	CLOSE alarmas_activas_por_proceso
	DEALLOCATE alarmas_activas_por_proceso

	

END
GO

GO
--SqlScripter----[dbo].[alar_fech_sigu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[alar_fech_sigu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[alar_fech_sigu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[alar_fech_sigu]
@p_fech_alar	datetime,
						@p_frec_alar	varchar(30),
						@p_fesi_alar	datetime output,
						@existe				varchar(30) output,
						@mensaje			varchar(30) output
as

BEGIN
--SP1 SE5.2

	if @p_frec_alar = 'DIARIA'
	begin
		set @p_fesi_alar = dateadd(day,1,@p_fech_alar);
	end
	else if @p_frec_alar='PERMANENTE'
	begin
		set @p_fesi_alar = @p_fech_alar;
	end
	else if @p_frec_alar='SEMANAL'
	begin
		set @p_fesi_alar = dateadd(day,7,@p_fech_alar);
	end
	else if @p_frec_alar='QUINCENAL'
	begin
		set @p_fesi_alar = dateadd(day,15,@p_fech_alar);
	end
	else if @p_frec_alar='MENSUAL'
	begin
		set @p_fesi_alar = dateadd(month,1,@p_fech_alar);
	end
	else if @p_frec_alar='TRIMESTRAL'
	begin
		set @p_fesi_alar = dateadd(month,3,@p_fech_alar);
	end
	else if @p_frec_alar='ANUAL'
	begin
		set @p_fesi_alar = dateadd(month,12,@p_fech_alar);
	end

	if @@error <> 0
	begin
		set @mensaje = 'Error Proc : alar_fech_sigu'
	end
END
GO

GO
--SqlScripter----[dbo].[alar_sql_dyn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[alar_sql_dyn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[alar_sql_dyn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[alar_sql_dyn]
@p_sql  varchar(4000),
	@p_nro  int output,
	@p_stat varchar(10) output,
	@p_msg  varchar(100) output
as
declare
  @sql     nvarchar(4000),
  @sql_dyn int,
  @verror  nvarchar(4000)
begin
  begin
    set @p_stat = 'S'
    set @p_msg  = NULL

		if(upper(substring(@p_sql,1,1)) = 'S')
		begin
			SELECT  @sql     = N'SELECT @p_nro = (' + @p_sql + ')'
	    execute @sql_dyn = sp_executesql @sql, N'@p_nro int output', @p_nro output
	    set     @verror  = convert(varchar, @@ERROR);
		end
		else
		begin
			SELECT  @sql     = @p_sql
			set @sql = @sql+' set @p_nro = @@rowcount'
	    execute @sql_dyn = sp_executesql @sql, N'@p_nro int output', @p_nro output
	    set     @verror  = convert(varchar, @@ERROR);
		end

  end
  if @verror <> 0 or @sql_dyn = 1
  begin
    set @p_stat = 'N'
    set @p_msg  = 'Error:' + @verror
  end
end
GO

GO
--SqlScripter----[dbo].[dbnet_cmd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbnet_cmd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_cmd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_cmd]
@comando varchar(200), 
@parametros varchar(200) 
 as
declare
@cmd varchar(400)
begin
set @cmd = @comando + ' ' + @parametros
EXEC master..xp_cmdshell @cmd
end
GO

GO
--SqlScripter----[dbo].[dbnet_context].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_context]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_context] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_context]
@p_codi_usua varchar(30) ,
@p_codi_empr numeric(9) output,
@p_codi_pers  varchar(30) output,
@p_codi_ceco  varchar(30) output,
@p_codi_rous  varchar(30) output,
@p_codi_cult  varchar(30) output,
@p_codi_modu  varchar(30) output,
@p_codi_emex  varchar(30) output,
@p_pass_encr  varchar(30) output,
@p_existe  varchar(1) output,
@p_mensaje  varchar(200) output
 as 
declare @p_tipo_mess varchar(30),
 	 @p_codi_mess numeric(22)
begin
set @p_Existe='S'
  
    begin
      select @p_codi_pers=u.codi_pers,
		@p_codi_empr=u.codi_empr, 
		@p_codi_ceco=u.codi_ceco, 
		@p_codi_cult=u.codi_cult, 
		@p_codi_rous=u.codi_rous,
		@p_codi_modu=r.codi_modu,
		@p_codi_emex=u.codi_emex,
		@p_pass_encr=u.pass_usua
      from usua_sist u, sys_rous r
      where codi_usua=@P_codi_usua
      and r.codi_rous=u.codi_rous
     if @@rowcount=0 
	begin
	set @p_existe='N'
	set @p_codi_mess=1000001
	exec dbnet_message @p_codi_mess,@p_mensaje output ,@p_tipo_mess 
        return
        end
    end
end
GO

GO
--SqlScripter----[dbo].[dbnet_ejec_cmd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbnet_ejec_cmd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_ejec_cmd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_ejec_cmd]
@p_comando varchar(255),@p_parametro varchar(255), @p_entorno varchar(255),
	@p_error varchar(1) output, @p_mensaje varchar(255) output 
 as
declare @v_comando varchar(255)
begin
 set @p_error = 'N'
 set @v_comando = '%'+@p_entorno+'%\bin\'+@p_comando+' '+@p_parametro + ' -h '  + @p_entorno
print @v_comando
EXEC master..xp_cmdshell @v_comando
end
GO

GO
--SqlScripter----[dbo].[dbnet_init_sess].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_init_sess]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_init_sess] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_init_sess]
(@p_codi_usua varchar(30)  , @p_corr_sess numeric(22) output  )  as
begin
declare
    @p_codi_emex varchar(30),
    @p_codi_pers varchar(30),
    @p_codi_modu varchar(30),
    @p_codi_rous varchar(30),
    @p_codi_ceco varchar(30),
    @p_codi_cult varchar(30),
    @p_codi_empr numeric(9)
 
 select  @p_codi_empr=u.codi_empr,
	@p_codi_emex=u.codi_emex,
	@p_codi_ceco=u.codi_ceco,
	@p_codi_pers=u.codi_pers,
	@p_codi_modu=r.codi_modu,
	@p_codi_cult=u.codi_cult,
	@p_codi_rous=r.codi_rous
      	from usua_sist u, sys_rous r
 	where codi_usua=@p_codi_usua
        and r.codi_rous=u.codi_rous 
 insert into sys_session (codi_usua,codi_empr,
    codi_emex,codi_ceco,codi_pers,
    codi_modu,codi_cult,codi_rous,fein_sess)
 values (@p_codi_usua,@p_codi_empr,
    @p_codi_emex,@p_codi_ceco,@p_codi_pers,
    @p_codi_modu,@p_codi_cult,@p_codi_rous,GETDATE()) 
 set @p_corr_sess=@@IDENTITY  
 select  @p_corr_sess corr_sess,@p_codi_empr codi_empr,
	@p_codi_emex codi_emex,@p_codi_ceco codi_ceco,
	@p_codi_pers codi_pers ,@p_codi_modu codi_modu,
	@p_codi_rous codi_rous,@p_codi_cult codi_cult
 into #sys_session
 delete from sys_session 
 where codi_usua=@p_codi_usua
    and fein_sess<=GETDATE()-4 
end
GO

GO
--SqlScripter----[dbo].[dbnet_llam_cmd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_llam_cmd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_llam_cmd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_llam_cmd]
@p_comando varchar(255),@p_parametro varchar(255),@p_error varchar(1) output,
	@p_mensaje varchar(255) output 
 as
declare @v_home varchar(100)
begin
set @p_error = 'N'
   select @v_home=param_value
   from   sys_param
   where  param_name='EGATE_HOME'
 if (@@rowcount=0)
 begin
	set @p_error = 'S'
	set @p_mensaje = 'Parametro de entorno EGATE_HOME no definido'
 end  	
 if (@@ERROR<>0)
 begin
	set @p_error = 'S'
	set @p_mensaje = 'Se ha producido el sgte. error al Rescatar Parametro de Entorno EGATE_HOME ' + convert(varchar, @@ERROR) 
 end  	
if (@p_error = 'N' )
begin
	exec dbnet_ejec_cmd @p_comando, @p_parametro,@v_home, @p_error, @p_mensaje
end
end
GO

GO
--SqlScripter----[dbo].[dbnet_message].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_message]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_message] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_message]
@p_codi_mess  numeric(22) ,
@p_desc_mess  varchar(200) output,
@p_tipo_mess  varchar(30) output
 as 
begin
if dbo.dbnet_get_cult() is not null 
begin
	select @p_desc_mess=s.desc_mess,@p_tipo_mess=s.tipo_mess
      	from sys_mess_cult s
      	where codi_mess=@p_codi_mess
      	and s.codi_cult=dbo.dbnet_get_cult()
end
begin
	select @p_desc_mess=isnull(@p_desc_mess,s.desc_mess),
		@p_tipo_mess=isnull(@p_tipo_mess,s.tipo_mess)
      	from sys_message s
      	where codi_mess=@p_codi_mess
 	if @@rowcount=0 
  		begin
  		set @p_desc_mess='Mensaje no esta registrado'
     		set @p_tipo_mess='Error'	
                return
  		end
end
end
GO

GO
--SqlScripter----[dbo].[dbnet_pass].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_pass]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_pass] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_pass]
@p_codi_usua varchar(30) ,
@p_pass_encr  varchar(30) output,
@p_existe  varchar(1) output,
@p_mensaje  varchar(200) output
 as 
declare @p_tipo_mess varchar(30),
 	 @p_codi_mess numeric(22)
begin
set @p_Existe='S'
  
    begin
      select @p_pass_encr=u.pass_usua
      from usua_sist u, sys_rous r
      where codi_usua=@P_codi_usua
      and r.codi_rous=u.codi_rous
     if @@rowcount=0 
	begin
	set @p_existe='N'
	set @p_codi_mess=1000001
	exec dbnet_message @p_codi_mess,@p_mensaje output ,@p_tipo_mess 
        return
        end
    end
end
GO

GO
--SqlScripter----[dbo].[dbnet_set_ceco].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_set_ceco]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_set_ceco] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_set_ceco]
@p_codi_ceco  varchar(30)   as
  begin
	update sys_session
	set codi_ceco=@p_codi_ceco
     	where corr_sess =(select corr_sess 
			from sys_connection
			where corr_conn=@@SPID)
end
GO

GO
--SqlScripter----[dbo].[dbnet_set_cult].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_set_cult]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_set_cult] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_set_cult]
@p_codi_cult  varchar(30)   as
  begin
	update sys_session 
	set codi_cult=@p_codi_cult
     	where corr_sess =(select corr_sess 
			from sys_connection
			where corr_conn=@@SPID)
end
GO

GO
--SqlScripter----[dbo].[dbnet_set_emex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_set_emex]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_set_emex] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_set_emex]
@p_codi_emex  varchar(30)   as
  begin
	update sys_session 
	set codi_emex=@p_codi_emex
     	where corr_sess =(select corr_sess 
			from sys_connection
			where corr_conn=@@SPID)
end
GO

GO
--SqlScripter----[dbo].[dbnet_set_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_set_empr]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_set_empr] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_set_empr]
@p_codi_empr  numeric(9)    as
  begin
	update sys_session 
	set codi_empr=@p_codi_empr
     	where corr_sess =(select corr_sess 
			from sys_connection
			where corr_conn=@@SPID)
end
GO

GO
--SqlScripter----[dbo].[dbnet_set_modu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_set_modu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_set_modu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_set_modu]
@p_codi_modu  varchar(30)   as
  begin
	update sys_session 
	set codi_modu=@p_codi_modu
     	where corr_sess =(select corr_sess 
			from sys_connection
			where corr_conn=@@SPID)
end
GO

GO
--SqlScripter----[dbo].[dbnet_set_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_set_pers]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_set_pers] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_set_pers]
@p_codi_rous  varchar(30)   as
  begin
	update sys_session 
	set codi_rous=@p_codi_rous
     	where corr_sess =(select corr_sess 
			from sys_connection
			where corr_conn=@@SPID)
end
GO

GO
--SqlScripter----[dbo].[dbnet_set_usua].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet_set_usua]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet_set_usua] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet_set_usua]
@p_codi_usua varchar(30)    as
declare @p_codi_emex varchar(30),
    @p_codi_pers varchar(30),
    @p_codi_modu varchar(30),
    @p_codi_rous varchar(30),
    @p_codi_ceco varchar(30),
    @p_codi_cult varchar(30),
    @p_codi_empr numeric(9)
  begin
	select  @p_codi_empr=u.codi_empr,
		@p_codi_emex=u.codi_emex,
		@p_codi_ceco=u.codi_ceco,
		@p_codi_pers=u.codi_pers,
		@p_codi_modu=r.codi_modu,
		@p_codi_cult=u.codi_cult,
		@p_codi_rous=r.codi_rous
	from usua_sist u, sys_rous r
	where codi_usua=@p_codi_usua
        and r.codi_rous=u.codi_rous
	update sys_session 
	set codi_usua=@p_codi_usua
		,codi_empr=@p_codi_empr
		,codi_emex=@p_codi_emex
		,codi_ceco=@p_codi_ceco
		,codi_pers=@p_codi_pers
		,codi_modu=@p_codi_modu
		,codi_cult=@p_codi_cult
		,codi_rous=@p_codi_rous
     	where corr_sess =(select corr_sess 
			from sys_connection
			where corr_conn=@@SPID)
   end
GO

GO
--SqlScripter----[dbo].[dbnet50_prc_estab].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dbnet50_prc_estab]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dbnet50_prc_estab] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dbnet50_prc_estab]
(@pcodi_serv varchar(30))
AS

BEGIN
	print 'DBNeT'
END
GO

GO
--SqlScripter----[dbo].[DBQ_ARCH_LOB].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[DBQ_ARCH_LOB]') IS NULL EXEC('CREATE PROCEDURE [dbo].[DBQ_ARCH_LOB] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[DBQ_ARCH_LOB]
@CODI_ARCH NUMERIC(9),
									@ARCH_ENVI TEXT, 
									@CODI_ERRO VARCHAR(3) OUTPUT,
									@MENS_ERRO VARCHAR(500) OUTPUT AS

DECLARE 
@ptrval binary(16)


BEGIN

	SET @CODI_ERRO = 'N'
	SET @MENS_ERRO = 'Proceso insercion de xml de envios ok'
	
	SELECT @ptrval = TEXTPTR(CLOB_ARCH)
	FROM DBQ_ARCH_CLOB
	WHERE codi_Arch =@CODI_ARCH
	if (convert(varchar(5),substring(@ptrval,0,4)) != '')
	begin
	UPDATETEXT DBQ_ARCH_CLOB.CLOB_ARCH @ptrval null 0 @arch_envi
	end
	IF (@@ERROR <> 0)
	BEGIN
	  	SET @CODI_ERRO = 'S'
		SET @MENS_ERRO = 'Error: '+ convert(varchar(2000), @@ERROR)
	END
	
END
GO

GO
--SqlScripter----[dbo].[dte_acec_acti].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_acec_acti]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_acec_acti] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_acec_acti]
@p_empr  varchar(9), @p_tipo_doc varchar(3),
           @p_folio varchar(10), @p_codi   varchar(6),
           @p_corr  varchar(3),
           @p_erro  varchar(1) output , @p_mens varchar(80) output   AS
 declare   @empr numeric(9), @tipo_doc numeric(3), @folio numeric(10),
           @lin  numeric(3), @corr  numeric(3), @hay  numeric(1),
           @hay2 numeric(2) 
BEGIN
   begin
     select @empr=convert(numeric(9),@p_empr), 
            @tipo_doc=convert(numeric(3),@p_tipo_doc),
            @folio=convert(numeric(10),@p_folio),
            @corr=convert(numeric(3),@p_corr)
   end
   if @empr  is null  or @tipo_doc is null or
      @folio is null  or @corr is null  
      begin
          set @p_erro ='S'
          set @p_mens = 'Uno de los campos de la llave nulo '
      end
   else
    begin
     if @p_codi is null 
         begin
             set @p_erro ='S' 
             set @p_mens = 'Codigo de Act. Eco. nulo' 
         end
     else
      begin
            select @hay2=count(*)
            from dte_acec_empr
           where CODI_EMPR = @empr
             and codi_acec = @p_codi 
        if  @hay2 = 0  
            begin
               set @p_erro ='S' 
               set @p_mens =' Actividad Economica no esta Definida' 
            end
         else
            begin
               set @p_erro ='N' 
               set @p_mens =' Actividad E. correcta ' 
            end            
       end 
    end
END
GO

GO
--SqlScripter----[dbo].[dte_calc_iva].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_calc_iva]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_calc_iva] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_calc_iva]
@p_monto_iva   varchar(18), @p_iva varchar(18),
           @p_monto_neto  varchar(18),
           @p_erro varchar(1) output , @p_mens varchar(80) output 
   AS
 
  declare   @neto numeric(18), @iva numeric(10,2),
            @valor_iva  numeric(18),  @valor_calculado  numeric(18)
 BEGIN
   begin
     select @neto=convert(numeric(18),@p_monto_neto),
            @iva=convert(numeric(10,2),@p_iva),
            @valor_iva=convert(numeric,@p_monto_iva)
     set @valor_calculado = round(isnull(@neto,0) * isnull(@iva,0),0,1)/100
     
     if (@valor_calculado <> @valor_iva )
        begin
          set @p_erro ='S'
          set @p_mens = 'Monto  diferente : '+
                  @p_monto_iva+' al Calculado :'+convert(varchar(10),@valor_calculado)
        end
     else
        begin
            set @p_erro ='N'
            set @p_mens = 'Valor e IVA  correcto, Monto :'+
                   @p_monto_iva+' Calculado :'+convert(varchar(10),@valor_calculado)
        end
   end
   
    if  @@error<>0 
       begin
         set @p_erro ='S'
         set @p_mens = 'Valor no es encontrado: '+ @p_monto_neto
       end
 END
GO

GO
--SqlScripter----[dbo].[dte_campo_bole].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_campo_bole]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_campo_bole] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_campo_bole]
@p_campo varchar(10), @p_valor varchar(100),
@p_tipo varchar(1), @p_erro varchar(1) output, 
@p_mens varchar(80) output
AS

BEGIN
  declare @num numeric(20,0)
  if @p_tipo = 'N'
   begin
     select @num=convert(numeric(20),isnull(@p_valor,0))
   end

  if (@p_tipo = 'C')
     if (@p_valor is not null) and (rtrim(@p_valor) <> ' ')
       begin
        SET @p_erro = 'S'
        SET @p_mens = @p_campo + '- Debe ser Nulo'
       end
     else
       begin
        SET @p_erro = 'N'
        SET @p_mens = @p_campo + '- valido'
       end
  else
   if @num = 0
       begin
     	SET @p_erro = 'N'
        SET @p_mens = @p_campo + '- valido'
       end
     else
       begin
        SET @p_erro ='S';
        SET @p_mens = @p_campo + '- Debe ser Nulo';
       end
END
GO

GO
--SqlScripter----[dbo].[dte_chec_erro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_chec_erro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_chec_erro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_chec_erro]
@p_codi_erro varchar(12),
           @p_desc_erro  varchar(50) output,
           @p_tipo_erro  varchar(10) output,
	   @p_indi_dnte	 varchar(1) output,
           @p_existe   varchar(1) output,
           @p_mensaje  varchar(80) output
     AS
BEGIN
 set @p_existe ='S'
  select @p_desc_erro=desc_erro, @p_tipo_erro=tipo_erro,
	 @p_indi_dnte=isnull(indi_dnte,'N')
  from dte_vali_erro
  where codi_erro=@p_codi_erro
if @@rowcount<>0 
   begin
     set @p_mensaje ='Este error es correcto '
     set @p_existe  ='N'
   end
else
   begin
     set @p_mensaje ='Este error o validacion no existe '
     set @p_existe  ='S'
   end

END
GO

GO
--SqlScripter----[dbo].[dte_chec_esta_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_chec_esta_docu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_chec_esta_docu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_chec_esta_docu]
@p_esta_docu varchar(3), @p_desc_esdo  varchar(60) output,
           @p_erro varchar(1)  output, @p_mens varchar(80)  output
      AS
 BEGIN
  begin
     
     select @p_desc_esdo=desc_esdo
       from dte_esta_docu
      where esta_docu = @p_esta_docu
   IF (@@ERROR <> 0)
     begin
      set  @p_erro ='S'
      set  @p_mens = 'estado del documento erroneo'
     end
   else
    begin
       set @p_erro ='N'
       set  @p_mens = 'estado del documento correto'
    end
  end
end
GO

GO
--SqlScripter----[dbo].[dte_chec_rang_foli].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_chec_rang_foli]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_chec_rang_foli] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_chec_rang_foli]
@p_codi_empr  varchar(9), @p_tipo_docu  varchar(3),
 @p_corr  varchar(18) output, @p_folio   varchar(10),
 @v_fech_emis varchar(10), @p_ult_foli  varchar(10) output ,
 @p_erro varchar(1) output,    @p_mens varchar(80) output
as
declare @corr        numeric(18,0),
        @folio       numeric(10,0),
        @ult_foli    numeric(10,0),
        @codi_empr   numeric(9,0),
        @tipo_docu   numeric(3,0),
        @v_cant_venc numeric(3),
        @p_fech_venc datetime,
        @p_esta_rafo varchar(30),
        @p_fech_emis datetime
 BEGIN
    set @codi_empr=@p_codi_empr 
    set @tipo_docu =@p_tipo_docu
    set @folio=@p_folio

    SELECT @v_cant_venc = ISNULL(VALO_PAEM,0)
    FROM   PARA_EMPR WITH (NOLOCK)
    WHERE  CODI_EMPR = @p_codi_empr
    AND    CODI_PAEM = 'EECV'
    if @@rowcount=0
    BEGIN
        set @v_cant_venc=0
    END
    BEGIN
        select @p_fech_emis = convert(datetime, @v_fech_emis,120)
        if @@rowcount=0
        BEGIN
            select @p_fech_emis = getdate()
        END
    END
    BEGIN
		IF(@p_tipo_docu in (33,43,46,56,61))
		BEGIN
			select top 1 @p_fech_venc = fech_venc,
				@p_esta_rafo = esta_rafo
			from   dte_rang_foli a WITH(NOLOCK)
			where  a.codi_empr = @p_codi_empr
			and    a.tipo_dora = @p_tipo_docu
			and    a.esta_rafo = 'VAL'
			and    @p_folio between a.FOLI_DESD and a.FOLI_HAST
			and    datediff(day,@p_fech_emis,a.fech_venc) <= @v_cant_venc
	
			if @@rowcount > 0
			BEGIN
				if(@p_fech_emis >= @p_fech_venc)
					BEGIN
						set @p_erro ='S'
						set @p_mens = 'ECV - No se puede asignar folio, CAF vencido'
						return
					END
				else
					BEGIN
						print(convert(varchar,@p_fech_venc))
						set @p_erro ='S'
						set @p_mens = 'EPV - No se puede asignar folio, próximo a vencer: '+ substring(convert(varchar,@p_fech_venc,120),1,10)
						return
					END
			END
			select @corr=a.corr_rafo,
				@p_ult_foli=a.ulti_foli
			from   dte_rang_foli a WITH(NOLOCK)
			where  a.codi_empr = @p_codi_empr
			and    a.tipo_dora = @p_tipo_docu
			and    a.esta_rafo = 'VAL'
			and    @p_folio between a.FOLI_DESD and a.FOLI_HAST
			and    datediff(day,@p_fech_emis, a.fech_venc) >= @v_cant_venc
		END
		ELSE
		BEGIN
			select @corr=a.corr_rafo,
				   @p_ult_foli=a.ulti_foli
			from   dte_rang_foli a WITH(NOLOCK)
			where  a.codi_empr = @p_codi_empr
			and    a.tipo_dora = @p_tipo_docu
			and    a.esta_rafo = 'VAL'
			and    @p_folio between a.FOLI_DESD and a.FOLI_HAST
		END
    END

	if @@rowcount=0
	begin
		set @p_erro = 'S'
		set @p_mens =  'No existe rango de Folios'
		return
	end
    else if @corr is null
    begin
        set @p_erro = 'S'
        set @p_mens =  'Correlativo es nulo'
        return
    end
    else
    begin
        set @p_corr  = @corr
        set @p_erro = 'N'
        set @p_mens = 'Rango de Folios correcto'
        return
    end
END
GO

GO
--SqlScripter----[dbo].[dte_chec_tido_veel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_chec_tido_veel]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_chec_tido_veel] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_chec_tido_veel]
@p_tipo_docu varchar(3), @p_desc_tido varchar(80) output,
   @p_bole_elec varchar(1) output, @p_tipo_dnte varchar(1) output,
   @p_erro varchar(1) output, @p_mens  varchar(80) output  
AS
BEGIN
  begin
     select @p_desc_tido=desc_tido, 
            @p_bole_elec=isnull(bole_elec,'N'),
	    @p_tipo_dnte=isnull(indi_dnte,'N')
     from dte_tipo_docu
     where tipo_docu   =convert(numeric(3), @p_tipo_docu)
        and docu_elec = 'S'
     if (@@rowcount = 0 )
      begin
        set @p_erro ='S'
        set @p_mens ='El tipo de documento ' + @p_tipo_docu + ' no corresponde a doc. electronico'
      end
     else
      begin
        set @p_erro ='N'
        set @p_mens ='El tipo de documento correcto'
      end
  end
END
GO

GO
--SqlScripter----[dbo].[dte_chec_tido_veel_esta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_chec_tido_veel_esta]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_chec_tido_veel_esta] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_chec_tido_veel_esta]
@p_tipo_docu varchar(3), @p_desc_tido varchar(80) output,
   @p_bole_elec varchar(1) output, @p_tipo_dnte varchar(1) output,
   @p_esta_defe varchar(3) output,
   @p_erro varchar(1) output, @p_mens  varchar(80) output  
AS
BEGIN
  begin
     select @p_desc_tido=desc_tido, 
            @p_bole_elec=isnull(bole_elec,'N'),
	    @p_tipo_dnte=isnull(indi_dnte,'N'),
	    @p_esta_defe=isnull(esta_docu,'ING')
     from dte_tipo_docu
     where tipo_docu   =convert(numeric(3), @p_tipo_docu)
        and docu_elec = 'S'
     if (@@rowcount = 0 )
      begin
        set @p_erro ='S'
        set @p_mens ='El tipo de documento ' + @p_tipo_docu + ' no corresponde a doc. electronico'
      end
     else
      begin
        set @p_erro ='N'
        set @p_mens ='El tipo de documento correcto'
      end
  end
END
GO

GO
--SqlScripter----[dbo].[dte_CHECK_DOMAIN].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_CHECK_DOMAIN]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_CHECK_DOMAIN] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_CHECK_DOMAIN]
@p_domi varchar(5), @p_codi varchar(12),
              @p_obli varchar(1),
              @p_erro varchar(2) output,
              @p_mens varchar(50) output   as
 BEGIN
   declare @hay numeric(2,0)
  begin
  IF @p_domi <> '' and @p_codi <> ''
   BEGIN
     set @p_erro ='N'
    select @p_mens=code_desc
      from sys_code
     where domain_code = @p_domi
       and code = @p_codi
--    set  @p_mens ='Este dominio no existe'+convert(varchar(3),@@rowcount)
  if  @@rowcount=0 
      BEGIN
       set  @p_erro ='S'
        select  @p_mens=  'El valor '''+@p_codi+
           ''' no pertenece a '+domain_name+'('+@p_domi+')'
          from sys_domain
         where domain_code = @p_domi
       if @@rowcount=0 
         set  @p_mens ='Este dominio no existe'
      END
   END
  ELSE
   if @p_obli like 'S' 
    begin
      set @p_erro ='S'
      set @p_mens ='Parametro Nulo y es obligatorio '
    end
   else
    begin
     set  @p_erro ='N'
     set  @p_mens ='Parametro Nulo no obligatorio ' 
    end
 end
 END
GO

GO
--SqlScripter----[dbo].[dte_chgdbq_arch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_chgdbq_arch]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_chgdbq_arch] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_chgdbq_arch]
@codiArch    numeric(10),
  @estaArch    varchar(30),
  @codiServ    varchar(30),
  @tipoArch    varchar(10),
  @subtArch    varchar(10)
as
  set nocount on;

  update dbq_arch
  set    esta_arch = @estaArch,
		 codi_serv = @codiServ,
		 tipo_arch = @tipoArch,
		 subt_arch = @subtArch,
         tmst_proc_arch = GETDATE(),
		 cont_proc_arch = 0
  where  codi_arch = @codiArch;
  
  select @codiArch;
GO

GO
--SqlScripter----[dbo].[dte_chgest_arch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_chgest_arch]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_chgest_arch] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_chgest_arch]
@codiArch    numeric(10),
  @estaArch     varchar(30),
  @ultiErr     varchar(200)
as
  set nocount on;

  update dbq_arch
  set    esta_arch = @estaArch,
		 ulti_erro = @ultiErr,
		 cont_proc_arch = (cont_proc_arch + 1),
         tmst_proc_arch = case(@estaArch) when 'ING' then GETDATE() else GETDATE()  + (2.0 / (24.0 * 60.0)) end
  where  codi_arch = @codiArch;

  select @codiArch;
GO

GO
--SqlScripter----[dbo].[dte_chgest_cana].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_chgest_cana]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_chgest_cana] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_chgest_cana]
@codiCana    numeric(10),
  @estaCana    varchar(5)
as
  set nocount on;

  update dbq_cana
  set    esta_cana = @estaCana,
         tmst_proc_cana = GETDATE()
  where  codi_cana = @codiCana;

  select @codiCana;
GO

GO
--SqlScripter----[dbo].[dte_chgest_grpo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_chgest_grpo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_chgest_grpo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_chgest_grpo]
@codiGrpo    numeric(10),
  @estaGrpo     varchar(30),
  @ultiErr     varchar(200)
as
  set nocount on;

  update dbq_grpo
  set    esta_grpo = @estaGrpo,
		 ulti_erro = @ultiErr,
         tmst_proc_grpo = GETDATE()  + (2.0 / (24.0 * 240.0))
  where  codi_grpo = @codiGrpo;

  select @codiGrpo;
GO

GO
--SqlScripter----[dbo].[dte_chgest_qse].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_chgest_qse]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_chgest_qse] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_chgest_qse]
@codiDopr    numeric(10),
  @estaQse     varchar(30),
  @ultiErr     varchar(200)
as
  set nocount on;

  update qse_docu_serv
  set    esta_proc = @estaQse,
		 ulti_erro = @ultiErr,
         time_proc = GETDATE()  + (2.0 / (24.0 * 60.0))
  where  codi_dopr = @codiDopr;

  select @codiDopr;
GO

GO
--SqlScripter----[dbo].[dte_chgest_recl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_chgest_recl]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_chgest_recl] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_chgest_recl]
@corrEvnt    numeric(10),
  @estaEvnt    varchar(30),
  @ultiErr     varchar(200)
as
  set nocount on;

  update dte_proc_evnt
  set    esta_evnt = @estaEvnt,
		 mens_erro_evnt = @ultiErr,
		 cont_proc_evnt = (cont_proc_evnt + 1),
         fech_proc_evnt = GETDATE()  + (2.0 / (24.0 * 60.0))
  where  corr_evnt = @corrEvnt;

  select @corrEvnt;
GO

GO
--SqlScripter----[dbo].[dte_codi_impu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_codi_impu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_codi_impu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_codi_impu]
@p_empr  varchar(9), @p_tipo_doc varchar(3),
           @p_folio varchar(10), @p_codi   varchar(3),
           @p_erro  varchar(1) output, @p_mens varchar(80) output   AS
declare @empr  numeric(9),  @tipo_doc numeric(3),
        @folio numeric(10), @hay  numeric(3), @hay2 numeric(3)
 BEGIN
   begin
     select @empr=convert(numeric(9),@p_empr),
            @tipo_doc=convert(numeric(3),@p_tipo_doc),
            @folio=convert(numeric(10),@p_folio)
      
     if isnull(@empr,0)=0 or  isnull(@tipo_doc,0)=0 
         or isnull(@folio,0)=0 or isnull(@p_codi,0)=0
        begin
          set @p_erro ='S'
          set @p_mens = 'Uno de los campos de la llave nulo '
        end
     else
      begin
       if  @p_codi   is null  
         begin
           set @p_erro ='S'
           set @p_mens = ' Codigo esta nulo '
         end
       else
        begin
           select @hay2=count(*)
             from dte_tipo_impu
            where codi_impu = @p_codi
           if  @hay2 = 0  
             begin
               set @p_erro ='S'
               set @p_mens =' Codigo de Impuesto no esta Definido'
             end
          else
             begin
              set @p_erro ='N'
              set @p_mens =' Cod. Impuesto correcto '
             end
        end
      end
  end
 END
GO

GO
--SqlScripter----[dbo].[dte_codi_sucu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_codi_sucu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_codi_sucu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_codi_sucu]
@p_empr  varchar(9), @p_codigo varchar(9),
           @p_erro  varchar(1) output , @p_mens varchar(80) output
  AS
 declare  @codigo   int,   @hay    numeric(2),  @empr  numeric(9)
 BEGIN
    begin
       select  @codigo=convert(int,@p_codigo)
       if @@error = 0 
         begin      
           set @p_erro ='N'
           set @p_mens = 'Codigo SUCU correcto'
         end
       else
         begin      
           set @p_erro ='S'
           set @p_mens = 'Codigo SUCU erroneo, no es numero'
         end
    end
 END
GO

GO
--SqlScripter----[dbo].[dte_cred_espe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_cred_espe]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_cred_espe] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_cred_espe]
@p_monto  varchar(18), @p_iva varchar(18),
           @p_porc  varchar(18),  @p_obli  varchar(1),
           @p_erro varchar(1) output, @p_mens varchar(80) output   
  AS
 declare @monto     numeric(18),   @val_iva   numeric(18,3),
         @porc      numeric(18,2),   @largo     numeric(3),
         @resul     numeric(18,2)
 BEGIN
  begin
   if  (isnull(@p_monto,0)= 0) and (@p_obli = 'S' )
        begin
           set @p_erro ='S'
           set @p_mens = ' Valor esta nulo y es obligatorio'
        end
   else
    begin
     if  (isnull(@p_monto,0) = 0 )
        begin
          set @p_erro ='N'
          set @p_mens = 'Valor es cero (0) '
        end
     else
      begin
          select @monto=convert(numeric,isnull(@p_monto,0)),
                 @val_iva= convert(numeric,isnull(@p_iva,0)),
                 @porc= convert(numeric(18,2),isnull(@p_porc,0))
        set @resul = @val_iva * @porc
       if @monto <> @resul 
         begin
            set @p_erro ='S'
            set @p_mens = 'Monto no cumple condicion'
  
       end
       else
         begin
           set @p_erro ='N'
           set @p_mens = ' Monto esta correcto'
         end
     end  
   end   
  IF @@ERROR<>0 
        begin
           set @p_erro ='S'
           set @p_mens = 'OPERACION CON ERROR'
      end
  end
 END
GO

GO
--SqlScripter----[dbo].[dte_dato_recep].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_dato_recep]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dato_recep] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dato_recep]
@p_dato varchar(10), @p_valor varchar(100), 
    @p_indicador varchar(20),
    @p_erro varchar(10) output, @p_mens varchar(2000) output
AS
BEGIN
  if @p_indicador in ('1','2') 
      if (@p_valor is null) or (rtrim(@p_valor) = ' ') 
         begin
           set @p_erro ='S'
           set @p_mens = @p_dato + ' nulo y obligatorio '
         end
      else
        begin
           set @p_erro = 'N'
           set @p_mens = @p_dato + ' valido'
        end
  else
     begin
       set @p_erro = 'N'
       set @p_mens = @p_dato + ' valido'
     end
END
GO

GO
--SqlScripter----[dbo].[dte_datos_email].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_datos_email]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_datos_email] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_datos_email]
@p_codi_empr varchar(9), @p_tipo_docu  varchar(3),
           @p_esta_docu varchar(3), @p_foli_docu  varchar(18),
           @p_origen    varchar(1), 
           @p_erro varchar(1) output,  @p_mens varchar(80) output
  AS
 declare   @p_MTOD_FROM varchar(400),   @p_MTOD_TO      varchar(400) ,
    @p_MTOD_CC   varchar(400) ,  @p_MTOD_SUBJECT varchar(500) ,
    @p_MTOD_TEXT varchar(3000) , @p_MTOD_ID numeric(18) ,
    @p_menu      varchar(200) ,
    @EXISTE      varchar(1) ,    @MENSAJE varchar(80)
 BEGIN
-- Datos para un email de los documentos 
  begin
    set @p_erro ='N' 
       select @p_MTOD_SUBJECT=desc_esdo, @p_MTOD_TO=mail_esdo
         from dte_esta_docu
        where esta_docu = @p_esta_docu
          and mens_esdo like 'S' 
IF (@@ROWCOUNT > 0)
 BEGIN
      if @p_origen ='P' 
        set @p_menu = ' Mantencion DTE con Errores' 
      else
        begin
          set @p_menu = ' Mantencion DTE propios' 
        end
   -- Recupera el email de la empresa */ 
    begin
     exec PAEM_GET_VAL @p_codi_empr, 'ALL',
                'EGME', @p_MTOD_FROM out, @EXISTE out, @MENSAJE out
print 'mail de la empresa ' + @p_MTOD_FROM
print 'mail de destino ' + @p_MTOD_TO
      IF (@@ERROR <> 0)
       begin
         set @p_erro ='S' 
         set @p_mens ='Error en : Email de la empresa' 
       end
    end 
    begin
       set @p_MTOD_CC=null 
        select  @p_MTOD_TEXT =' Empresa :'+@p_codi_empr+
                ' Tipo Documento :'+@p_tipo_docu+
                ' Folio del Doc.: '+@p_foli_docu+
                ' - Consultar el Documento en :'+@p_menu+
                ' - Estado :'+@p_esta_docu,
            @p_MTOD_FROM=isnull(@p_MTOD_FROM,'Empresa sin Email'),
            @p_MTOD_TO=isnull(@p_MTOD_TO,'Sin email propio')
       from dual 
    end 
  -- Inserta los datos en la tabla MTOD 
     exec put_email @p_MTOD_FROM, @p_MTOD_TO,
                 @p_MTOD_CC,   @p_MTOD_SUBJECT,
                 @p_MTOD_TEXT, @p_MTOD_ID
      set @p_erro ='N' 
      set @p_mens  ='Proceso correcto' 
    IF (@@ERROR <> 0)
      begin
        set @p_erro ='S' 
        set @p_mens ='Estado del documento no envia Email' 
      end
 end
END
END
GO

GO
--SqlScripter----[dbo].[dte_delete_arch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_delete_arch]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_delete_arch] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_delete_arch]
@codiArch    numeric(10),
  @codiGrpo    numeric(10)
as
  
  set nocount on;
  
  delete dbq_arch_clob
  where codi_arch = @codiArch;
  
  delete dbq_arch
  where codi_arch = @codiArch;
  
  delete dbq_grpo
  where  codi_grpo = @codiGrpo;

  select @codiArch;
GO

GO
--SqlScripter----[dbo].[dte_delete_codi_arch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_delete_codi_arch]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_delete_codi_arch] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_delete_codi_arch]
@codiArch    numeric(10)
as
  set nocount on;
  
  delete dbq_arch_clob
  where codi_arch = @codiArch;
  
  delete dbq_arch
  where codi_arch = @codiArch;
  
  select @codiArch;
GO

GO
--SqlScripter----[dbo].[dte_delete_evnt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_delete_evnt]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_delete_evnt] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_delete_evnt]
@corrEvnt    numeric(10)
as
  
  set nocount on;
  
  delete dte_proc_evnt
  where corr_evnt = @corrEvnt;
  
  select @corrEvnt;
GO

GO
--SqlScripter----[dbo].[dte_delete_grpo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_delete_grpo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_delete_grpo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_delete_grpo]
@codiGrpo    numeric(10)
as
  set nocount on;
  
  delete dbq_arch_clob 
  where codi_arch in (select a.codi_arch 
					  from dbq_arch a 
					  where a.codi_grpo = @codiGrpo);
					  
  delete dbq_arch
  where codi_grpo = @codiGrpo;

  delete dbq_grpo
  where  codi_grpo = @codiGrpo;

  select @codiGrpo;
GO

GO
--SqlScripter----[dbo].[dte_delete_qse].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_delete_qse]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_delete_qse] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_delete_qse]
@codiDopr    numeric(10)
as
  set nocount on;

  delete qse_docu_serv
  where  codi_dopr = @codiDopr;

  select @codiDopr;
GO

GO
--SqlScripter----[dbo].[dte_dequeue_arch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_arch]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_arch] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_arch]
@codiServ    varchar(30)
as
  set nocount on;

  with cte as (
    select top(1) codi_arch, esta_arch, tmst_proc_arch, cont_proc_arch
    from   dbq_arch with (rowlock, readpast, index=DBQ_ARCH_PROCESOS)
    where  codi_serv = @codiServ
    and    isnull(cont_proc_arch, 0) <= 50
    and    (
            (esta_arch = 'ING' and tmst_proc_arch < getdate())
               OR
            (esta_arch in ('PRC','ERR') and datediff(minute, tmst_proc_arch, getdate()) > 5)
           )
    order by codi_arch, tmst_regi_arch 
  )
  update cte
     set esta_arch = 'PRC', tmst_proc_arch = GETDATE() + (2.0 / (24.0 * 60.0)),
         cont_proc_arch = isnull(cont_proc_arch, 0) + 1
     output inserted.codi_arch;
GO

GO
--SqlScripter----[dbo].[dte_dequeue_arch_grpo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_arch_grpo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_arch_grpo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_arch_grpo]
@codiGrpo    varchar(30)
as
	set nocount on;

	SELECT CODI_ARCH, NOMB_ARCH, EXTE_ARCH, TIPO_ARCH, PK01_TABL, PK02_TABL
	from   dbq_arch with (readpast)
	where  codi_grpo = @codiGrpo
	order by codi_arch, tmst_regi_arch
GO

GO
--SqlScripter----[dbo].[dte_dequeue_cana].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_cana]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_cana] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_cana]
@tranCana    varchar(10)
as
  set nocount on;

  with cte as (
    select top(1) codi_cana, ESTA_CANA, TMST_PROC_CANA
    from   dbq_cana with (rowlock, readpast)
    where  TRAN_CANA = @tranCana
    and    (
            (ESTA_CANA = 'IDL' and DATEDIFF(second, TMST_PROC_CANA,getDate()) > 5)
               OR
            (ESTA_CANA = 'BSY' and datediff(minute, TMST_PROC_CANA, getdate()) > 3)
           )
    and    VIGE_CANA = 'S'
    ORDER BY TMST_PROC_CANA ASC
  )
  update cte
     set esta_cana = 'BSY', tmst_proc_cana = GETDATE() + (2.0 / (24.0 * 240.0))
     output inserted.codi_cana;
GO

GO
--SqlScripter----[dbo].[dte_dequeue_grpo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_grpo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_grpo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_grpo]
@codiServ    varchar(30)
as
  set nocount on;

  with cte as (
    select top(1) codi_grpo, esta_grpo, tmst_proc_grpo, cont_proc_grpo
    from   dbq_grpo with (rowlock, readpast)
    where  codi_serv = @codiServ
    and    isnull(cont_proc_grpo, 0) <= 50
    and    (
            (esta_grpo = 'ING' and tmst_proc_grpo < getdate())
               OR
            (esta_grpo = 'PRC' and datediff(minute, tmst_proc_grpo, getdate()) > 5)
           )
    order by codi_grpo, tmst_regi_grpo
  )
  update cte
     set esta_grpo = 'PRC', tmst_proc_grpo = GETDATE() + (2.0 / (24.0 * 60.0)),
         cont_proc_grpo = isnull(cont_proc_grpo, 0) + 1
     output inserted.codi_grpo;
GO

GO
--SqlScripter----[dbo].[dte_dequeue_grpo_cana].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_grpo_cana]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_grpo_cana] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_grpo_cana]
@codiServ    varchar(30),
  @nombCana    varchar(30)
as
  set nocount on;

  update dbq_cana
     set tmst_proc_cana = GETDATE() + (2.0 / (24.0 * 60.0))
  where  nomb_cana = @nombCana;

  with cte as (
    select top(1) codi_grpo, esta_grpo, tmst_proc_grpo, cont_proc_grpo
    from   dbq_grpo with (rowlock, readpast)
    where  codi_serv = @codiServ
    and    nomb_cana = @nombCana
    and    isnull(cont_proc_grpo, 0) <= 50
    and    (
            (esta_grpo = 'ING' and tmst_proc_grpo < getdate())
               OR
            (esta_grpo = 'PRC' and datediff(minute, tmst_proc_grpo, getdate()) > 5)
           )
    order by codi_grpo, tmst_regi_grpo 
  )
  update cte
     set esta_grpo = 'PRC', tmst_proc_grpo = GETDATE() + (2.0 / (24.0 * 60.0)),
         cont_proc_grpo = isnull(cont_proc_grpo, 0) + 1
     output inserted.codi_grpo;
GO

GO
--SqlScripter----[dbo].[dte_dequeue_qse].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_qse]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_qse] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_qse]
@codiServ    varchar(30)
as
  set nocount on;

  with cte as 
  (
    select top(1) codi_dopr, ESTA_PROC, TIME_PROC, CANT_PROC
    from   qse_docu_serv with (rowlock, readpast)
    where  codi_serv = @codiServ
    and    isnull(cant_proc, 0) < 50
    and    (
            (ESTA_PROC = 'ING' and TIME_PROC < getdate())
               OR
            (ESTA_PROC in ('REF', 'PRC') and datediff(minute, TIME_PROC, getdate()) > 10)
           )
    order by codi_empr, tipo_docu, foli_docu 
  )
  update cte
     set esta_proc = 'PRC', time_proc = GETDATE() + (2.0 / (24.0 * 60.0)),
         cant_proc = isnull(cant_proc, 0) + 1
     output inserted.codi_dopr;
GO

GO
--SqlScripter----[dbo].[dte_dequeue_qse_cana].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_qse_cana]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_qse_cana] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_qse_cana]
@codiServ    varchar(30),
  @nombCana    varchar(30)
as
  set nocount on;

  update dbq_cana
     set tmst_proc_cana = GETDATE()
  where  nomb_cana = @nombCana;

  with cte as (
    select top(1) codi_dopr, ESTA_PROC, TIME_PROC, CANT_PROC
    from   qse_docu_serv with (rowlock, readpast)
    where  codi_serv = @codiServ
    and    tabl_esta = @nombCana
    and    isnull(cant_proc, 0) < 50
    and    (
            (ESTA_PROC = 'ING' and TIME_PROC < getdate())
               OR
			(ESTA_PROC = 'PRC' and datediff(minute, TIME_PROC, getdate()) > 5)
           )
    order by codi_empr, tipo_docu, foli_docu 
  )
  update cte
     set esta_proc = 'PRC', time_proc = GETDATE() + (2.0 / (24.0 * 60.0)),
         cant_proc = isnull(cant_proc, 0) + 1
     output inserted.codi_dopr;
GO

GO
--SqlScripter----[dbo].[dte_dequeue_qse_esta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_qse_esta]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_qse_esta] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_qse_esta]
@codiServ    varchar(30),
  @estaProc    varchar(30),
  @numDiff     numeric(10),
  @cantProc    numeric(5)
as
  set nocount on;

  with cte as 
  (
    select top(1) codi_dopr, ESTA_PROC, TIME_PROC, CANT_PROC
    from   qse_docu_serv with (rowlock, readpast)
    where  codi_serv = @codiServ
    and    isnull(cant_proc, 0) <= @cantProc 
    and    esta_proc = @estaProc
	and    datediff(minute, TIME_PROC, getdate()) >= @numDiff
    order by codi_empr, tipo_docu, foli_docu 
  )
  update cte
     set esta_proc = 'PRC', time_proc = GETDATE() + (2.0 / (24.0 * 60.0)),
         cant_proc = isnull(cant_proc, 0) + 1
     output inserted.codi_dopr;
GO

GO
--SqlScripter----[dbo].[dte_dequeue_recl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_recl]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_recl] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_recl]
AS
  set nocount on;

  with cte as (
    select top(1) corr_evnt, esta_evnt, fech_proc_evnt, cont_proc_evnt
    from   dte_proc_evnt with (rowlock, readpast)
    where  (
            (esta_evnt = 'ING' and datediff(minute, fech_proc_evnt, getdate()) > 5)
               OR
            (esta_evnt in ('PRC') and datediff(minute, fech_proc_evnt, getdate()) > 10)
           )
    and    isnull(cont_proc_evnt, 0) <= 50   
    order by corr_evnt, fech_evnt 
  )
  update cte
     set esta_evnt = 'PRC', fech_proc_evnt = GETDATE() + (2.0 / (24.0 * 60.0)),
         cont_proc_evnt = isnull(cont_proc_evnt, 0) + 1
     output inserted.corr_evnt;
GO

GO
--SqlScripter----[dbo].[dte_dere_tipm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_dere_tipm]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dere_tipm] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dere_tipm]
@p_tipo   varchar(3), 
           @p_erro varchar(1) output, @p_mens  varchar(80) output
    AS
   declare @hay   numeric(1)
 BEGIN
   begin
--     if ( @p_tipo = 'D') or (@p_tipo ='R')
    if  @p_tipo in ('D','R')
       begin  
          set  @p_erro ='N'
          set @p_mens = 'Dato correcto  '       
       end
     else
       begin
          set  @p_erro ='S'
          set  @p_mens = 'Tipo no definido, solo  D o R '
       end
   end
   if @@error <> 0 
        begin
          set   @p_erro ='S'
           set  @p_mens = 'Valor erroneo'
        end
 END
GO

GO
--SqlScripter----[dbo].[dte_empr_dato].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_empr_dato]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_empr_dato] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_empr_dato]
(
		@pcodi_empr varchar(3),
		@prutt_empr varchar(10) output,
		@pdigi_empr varchar(1) output,
		@pnomb_empr varchar(40) output,
		@pdire_empr varchar(50) output,
		@pdesc_giro varchar(40) output,
		@pcodi_sii_empr varchar(6)output,
		@pnomb_coem varchar(20) output,
		@pnomb_ciem varchar(20) output,
		@p_existe varchar(1) output,
		@p_mensaje varchar(200)output )
AS
begin
	set @p_existe 	= 'S'	

	select 	@prutt_empr=e.rutt_empr , 
		@pdigi_empr=e.digi_empr , 
		@pnomb_empr=e.nomb_empr ,
		@pdire_empr=e.dire_empr,
		@pdesc_giro=r.desc_ramo ,
		@pcodi_sii_empr=r.codi_sii,
		@pnomb_coem=ag1.nomb_arge,
		@pnomb_ciem=ag2.nomb_arge
   	from   empr e, ramo r, area_geog ag1,area_geog ag2
   	where  e.codi_empr=@pcodi_empr
   	and    e.codi_empr=r.codi_empr 
   	and    e.codi_ramo=r.codi_ramo 
   	and    '05'= ag1.tipo_arge 
   	and    e.codi_comu=ag1.codi_arge 
   	and    '04'= ag2.tipo_arge 
   	and    e.codi_ciud=ag2.codi_arge 


	IF (@@ERROR <> 0)
	begin
		set @p_existe = 'N'
		set @p_mensaje = 'Esta empresa no existe'
		print @p_mensaje

	        return
        end
	
end;
GO

GO
--SqlScripter----[dbo].[dte_envio_email].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_envio_email]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_envio_email] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_envio_email]
@p_codi_empr varchar(9),
           @p_esta_docu varchar(3), @p_corr_envi varchar(18), 
           @p_erro varchar(1) output,  @p_mens varchar(80) output
   AS
 declare   @p_MTOD_FROM VARCHAR(400),  @p_MTOD_TO      VARCHAR(400),
    @p_MTOD_CC   VARCHAR(400),  @p_MTOD_SUBJECT VARCHAR(500),
    @p_MTOD_TEXT VARCHAR(2000), @p_MTOD_ID numeric(18),
    @p_menu      VARCHAR(200),
    @EXISTE      VARCHAR(1),    @MENSAJE VARCHAR(80)
 BEGIN
 --  Datos para un email de los Envios 
   begin
     set @p_erro ='N'
       select @p_MTOD_SUBJECT=desc_esen, 
              @p_MTOD_TO=mail_esen
         from dte_esta_envi
        where esta_envi = @p_esta_docu
         and  mens_esen like 'S' 
   -- Recupera el email de la empresa 
IF (@@ROWCOUNT > 0)
 BEGIN
    begin
     exec PAEM_GET_VAL @p_codi_empr, 'ALL',
                'EGME', @p_MTOD_FROM out, @EXISTE out, @MENSAJE out
     PRINT @p_MTOD_FROM
      IF (@@ERROR <> 0)
       begin
        set @p_erro ='S' 
        set @p_mens  ='Error en : Email de la empresa' 
       end
    end 
    begin
       set @p_MTOD_CC=null 
       select  @p_MTOD_TEXT =' Empresa :'+@p_codi_empr+
                ' Correlativo del Envio: '+convert(char(18),@p_corr_envi)+
                ' - Consultar el Documento en :Envios de Documentos ',
            @p_MTOD_FROM=isnull(@p_MTOD_FROM,'Empresa sin Email'),
            @p_MTOD_TO=isnull(@p_MTOD_TO,'Sin email propio')
       from dual 
    end 
 -- Inserta los datos en la tabla MTOD 
     exec put_email @p_MTOD_FROM, @p_MTOD_TO,
                 @p_MTOD_CC,   @p_MTOD_SUBJECT,
                 @p_MTOD_TEXT, @p_MTOD_ID
      set @p_erro ='N' 
      set @p_mens  ='Proceso correcto' 
    IF (@@ERROR <> 0)
      begin
        set @p_erro ='N' 
        set @p_mens ='Estado del documento no envia Email' 
      end
  end 
 END
end
GO

GO
--SqlScripter----[dbo].[dte_fech_deha].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_fech_deha]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_fech_deha] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_fech_deha]
@p_fech_desd varchar(10), @p_fech_hast varchar(10),
               @p_tipo varchar(1),
               @p_erro varchar(1) output, @p_mens varchar(80) output   
   as
declare
  @cual        varchar(1),  @cual_desc   varchar(20),
  @fecha       datetime,    @fech_desd   datetime,
  @fech_hast   datetime,    @ErrorSave INT
 BEGIN
   begin
    set dateformat  ymd
-- elimina la hora de la fecha
     select @fech_desd= convert(datetime,convert(char,@p_fech_desd,1))
     select @fech_hast= convert(datetime,convert(char,@p_fech_hast,1))
    IF (@@ERROR <> 0)
        begin
          SET @ErrorSave = @@ERROR
          set @p_erro ='S'
          set @p_mens = 'Fecha mala '
          RETURN 
       end
    else
--print 'fecha desde = '+ CONVERT( char(12), @fech_desd,  2)
--print 'fecha hasta = '+ CONVERT( char(12), @fech_hast,  2)
     if @fech_desd > @fech_hast 
       begin
         set @p_erro ='S'
         set @p_mens = 'Fecha Desde Mayor que Fecha Hasta. '
       end
     else
       begin
           set @p_erro ='N'
           set @p_mens = 'Fecha correcta :'
       end 
  end  
RETURN 
end
GO

GO
--SqlScripter----[dbo].[dte_foli_refe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_foli_refe]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_foli_refe] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_foli_refe]
@p_foli_refe  varchar(18),  @p_indi_glb  varchar(1),
       @p_erro  varchar(1) output, @p_mens varchar(80) output
    AS 
 /* declare @foli_refe     numeric(10) */
 BEGIN
  begin
  /*select  @foli_refe=convert(numeric(10),@p_foli_refe)*/
    if  @p_indi_glb = '1' 
       begin 
           if isnull(@p_foli_refe,'0') = '0'  
             begin 
              set @p_erro ='N'
              set  @p_mens ='Folio correcto'
             end
           else
              begin 
               set  @p_erro ='S'
               set  @p_mens ='Folio de referencia debe ser cero '
              end
       end
    else      
     begin
        set  @p_erro ='N'
        set  @p_mens ='Indicador direfente a 1, no se valida '
     end
  end
 END
GO

GO
--SqlScripter----[dbo].[dte_gene_envi_enco].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_gene_envi_enco]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_gene_envi_enco] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_gene_envi_enco]
@p_esta_envi varchar(3),
			       	    @p_corr_envi numeric(13,0), 
			            @p_tipo_docu numeric(3,0),
			            @p_foli_desd numeric(10,0),
			            @p_foli_hast numeric(10,0),
			            @p_rutt_pers numeric(10,0),
			            @p_error varchar(1) output,
			            @p_mensaje varchar(255) output 
as
begin
	if (isnull(@p_esta_envi, 'INI') not in ('CER', 'ENV')) 
	begin
		set @p_error = 'N'
		update	dte_enca_docu
		set	corr_envi1 = @p_corr_envi
		where	foli_docu between @p_foli_desd and @p_foli_hast
		and	tipo_docu like isnull(@p_tipo_docu, tipo_docu)
		and	esta_docu <> 'ERR'
		and	rutt_rece = @p_rutt_pers
		and	corr_envi is not null
		and	exists (select	1
				from	dte_envi_docu b, dte_esta_envi c, dte_enca_docu
				where	dte_enca_docu.corr_envi = b.corr_envi
				and	b.esta_envi = c.esta_envi
				and	c.envi_cont = 'S')
	
		if (@@rowcount = 0)
		begin
			set @p_error = 'S'	
			set @p_mensaje = 'No se asociaron documentos al envio'
		end
		if (@@ERROR <> 0)
		begin
			set @p_error = 'S'
			set @p_mensaje = 'Se ha producido el sgte. error al asociar documentos: ' + convert(varchar, @@ERROR) 
		end
		if (@p_error = 'N' )
		begin
			delete	dte_tido_envi
			where	corr_envi = @p_corr_envi
		end
		if (@@ERROR <> 0)
		begin
			set @p_error = 'S'
			set @p_mensaje = 'No se ha podido eliminar dte_tido_envi. ERROR: ' + convert(varchar, @@ERROR) 
		end
		if (@p_error = 'N')
		begin
			insert into dte_tido_envi
			(corr_envi, tipo_docu, cant_docu)
			(select	corr_envi1, tipo_docu, count(*)
			 from	dte_enca_docu
			 where	corr_envi1 = @p_corr_envi
			 group by corr_envi1, tipo_docu)
		end
		if (@@ERROR <> 0)
		begin
			set @p_error = 'S'
			set @p_mensaje = 'No se ha podido insertar en dte_tido_envi. ERROR: ' + convert(varchar, @@ERROR)
		end
	end
	else
	begin
		set @p_error = 'S'
		set @p_mensaje = 'Este envio no puede alterarse en este estado!'
	end
end
GO

GO
--SqlScripter----[dbo].[dte_gene_envi_endo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_gene_envi_endo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_gene_envi_endo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_gene_envi_endo]
@p_esta_envi varchar(3),
			            @p_corr_envi numeric(13,0), 
			            @p_tipo_docu numeric(3,0),
			            @p_foli_desd numeric(10,0),
			            @p_foli_hast numeric(10,0),
			            @p_error varchar(1) output,
			            @p_mensaje varchar(255) output 
as
begin
	if (isnull(@p_esta_envi, 'INI') not in ('CER', 'ENV')) 
	begin
		set @p_error = 'N'
		update	dte_enca_docu
		set	corr_envi = @p_corr_envi
		where	foli_docu between @p_foli_desd and @p_foli_hast
		and	tipo_docu like isnull(@p_tipo_docu, tipo_docu)
		and	isnull(esta_docu, 'ING') not in ('ERR', 'ERA')
	
		if (@@rowcount = 0)
		begin
			set @p_error = 'S'	
			set @p_mensaje = 'No se asociaron documentos al envio'
		end
		if (@@ERROR <> 0)
		begin
			set @p_error = 'S'
			set @p_mensaje = 'Se ha producido el sgte. error al asociar documentos: ' + convert(varchar, @@ERROR) 
		end
		if (@p_error = 'N' )
		begin
			delete	dte_tido_envi
			where	corr_envi = @p_corr_envi
		end
		if (@@ERROR <> 0)
		begin
			set @p_error = 'S'
			set @p_mensaje = 'No se ha podido eliminar dte_tido_envi. ERROR: ' + convert(varchar, @@ERROR) 
		end
		if (@p_error = 'N')
		begin
			insert into dte_tido_envi
			(corr_envi, tipo_docu, cant_docu)
			(select	corr_envi, tipo_docu, count(*)
			 from	dte_enca_docu
			 where	corr_envi = @p_corr_envi
			 group by corr_envi, tipo_docu)
		end
		if (@@ERROR <> 0)
		begin
			set @p_error = 'S'
			set @p_mensaje = 'No se ha podido insertar en dte_tido_envi. ERROR: ' + convert(varchar, @@ERROR)
		end
	end
	else
	begin
		set @p_error = 'S'
		set @p_mensaje = 'Este envio no puede alterarse en este estado!'
	end
end
GO

GO
--SqlScripter----[dbo].[dte_get_rutt_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_get_rutt_empr]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_get_rutt_empr] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_get_rutt_empr]
(@p_codi_empr 	numeric(10),
				@p_rutt_empr  	numeric(10)	out,
				@p_digi_empr  	varchar(1) 	out,
				@p_nerror    	varchar(1) 	out,
				@p_merror    	varchar(200) 	out) 
as
begin
declare @aux_rutt_empr 	numeric(10),
	@aux_digi_empr 	varchar(1),
	@lugar		varchar(200)

	set @lugar='dte_get_rutt_empr() Obteniendo datos'

	print @lugar
	select top 1
	@aux_rutt_empr=isnull(rutt_empr,0),
	@aux_digi_empr=isnull(digi_empr,' ')
	from empr
	where codi_empr=@p_codi_empr
	
	set @p_rutt_empr=@aux_rutt_empr
	set @p_digi_empr=@aux_digi_empr
		
	if @@ERROR<>0
	begin
		set @p_nerror='S'
		set @p_merror='ERROR Al Recuperar Datos de la empresa'
		print @lugar
	end--fin if @@error
		
end
GO

GO
--SqlScripter----[dbo].[dte_info_tran].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_info_tran]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_info_tran] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_info_tran]
@p_dato  varchar(8), @p_indicador varchar(1),
           @p_obli varchar(1),
           @p_erro varchar(1) output, @p_mens varchar(80) output
   AS
 declare   @folio     numeric(10)
 BEGIN
  begin
    if @p_dato is not null  
      begin
        if @p_indicador in  ('2','3') 
          begin
            set @p_erro ='N'
            set @p_mens = 'Dato valido '
          end
        else 
          begin
            set @p_erro ='N'
            set @p_mens = 'No se valida, Ind. diferente de 2 y 3'
          end
      end
    else
     begin
      if  @p_obli ='S'
        begin
         set @p_erro ='S'
         set @p_mens = 'Error, Dato nulo y  obligatorio'
        end
       else
         begin
           set @p_erro ='N'
           set @p_mens = 'Dato nulo no obligatorio' 
         end
      end
  end
  END
GO

GO
--SqlScripter----[dbo].[dte_inse_histo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_inse_histo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_inse_histo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_inse_histo]
@p_empr   varchar(9), @p_tipodoc  varchar(3),
      @p_folio  varchar(18),
      @p_erro varchar(1) output,  @p_mens varchar(80) output
   AS
  declare @empr  numeric(9),  @docu numeric(3),
          @folio   numeric(18), @MENSAJE varchar(80)
 BEGIN
   begin
	
     select @empr=convert(numeric(9),@p_empr),
            @docu=convert(numeric(3),@p_tipodoc),
            @folio=convert(numeric(18),@p_folio)
   end
   set @p_erro ='N'
   set @p_mens = null

   set @mensaje ='Inserta detalle  '
   --**** Inserta detalle 
     insert into dte_deta_prse_h (
         TIPO_DOCU, FOLI_DOCU, CODI_EMPR, NUME_LINE,
         CODI_IMPU, TIPO_CODI, CODI_ITEM, INDI_EXEN,
         NOMB_ITEM, DESC_ITEM, CANT_ITEM,  CANT_REFE,
         UNID_REFE, PREC_REFE, UNID_MEDI, PREC_ITEM,
         PREC_MONO, CODI_MONE, FACT_CONV, DCTO_ITEM,
         RECA_ITEM, NETO_ITEM, DESC_PORC, RECA_PORC,
         FECH_ELAB, FECH_VEPR, MNSG_ERRO)
     select  
        TIPO_DOCU,  FOLI_DOCU,  CODI_EMPR,  NUME_LINE, 
        CODI_IMPU,  TIPO_CODI,  CODI_ITEM,  INDI_EXEN,
        NOMB_ITEM,  DESC_ITEM,  CANT_ITEM,  CANT_REFE, 
        UNID_REFE,  PREC_REFE,  UNID_MEDI,  PREC_ITEM, 
        PREC_MONO,  CODI_MONE,  FACT_CONV, DCTO_ITEM, 
        RECA_ITEM,  NETO_ITEM,  DESC_PORC,  RECA_PORC,  
        FECH_ELAB,  FECH_VEPR,  MNSG_ERRO
     from dte_deta_prse  
    where codi_empr = @empr
      and FOLI_DOCU = @folio
      and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)

   set @mensaje ='Descuentos globales '
   --** Descuentos globales
   insert into dte_desc_reca_h (
         TIPO_DOCU,CODI_EMPR,FOLI_DOCU,NUME_DERE,TIPO_DERE,
         GLOS_DERE,TIPO_VALO,VALO_DERE,INDI_EXEN)
     select  
        TIPO_DOCU, CODI_EMPR, FOLI_DOCU, NUME_DERE,
        TIPO_DERE, GLOS_DERE, TIPO_VALO, VALO_DERE,
        INDI_EXEN
    from dte_desc_reca  
    where codi_empr = @empr
      and FOLI_DOCU = @folio
      and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
  
    set @mensaje ='Actividad Economica  '
    --*** Actividad Economica
     insert into dte_deta_acec_h (
       TIPO_DOCU,CODI_EMPR,FOLI_DOCU,CODI_ACEC,CORR_ACEC)
     select  
          TIPO_DOCU, CODI_EMPR, FOLI_DOCU, CODI_ACEC,
          CORR_ACEC
     from dte_deta_acec
    where codi_empr = @empr
      and FOLI_DOCU = @folio
      and TIPO_DOCU = isnull(@docu, tipo_docu)
   
    set @mensaje ='Documento de referencia  ' 
    -- Documento de referencia 
     insert into dte_docu_refe_h (
       TIPO_DOCU,CODI_EMPR,FOLI_DOCU,NUME_REFE,
       TIPO_REFE,FOLI_REFE,RUTT_OTRO,DIGI_OTRO,
       FECH_REFE,RAZO_REFE,CODI_REFE,INDI_REGL )
     select  
       TIPO_DOCU, CODI_EMPR, FOLI_DOCU, NUME_REFE,
       TIPO_REFE, FOLI_REFE, RUTT_OTRO, DIGI_OTRO, 
       FECH_REFE, RAZO_REFE, CODI_REFE, INDI_REGL
     from dte_docu_refe
    where codi_empr = @empr
      and FOLI_DOCU = @folio
      and TIPO_DOCU = isnull(@docu, tipo_docu)
   
    set @mensaje ='Otros Codigos  '  
    --** Otros Codigos
     insert into dte_deta_codi_h (
         TIPO_DOCU,FOLI_DOCU,CODI_EMPR,NUME_LINE,
         CORR_CODI,TIPO_CODI,CODI_ITEM)
     select  
       TIPO_DOCU, FOLI_DOCU, CODI_EMPR, NUME_LINE, 
       CORR_CODI, TIPO_CODI, CODI_ITEM
     from  dte_deta_codi
    where codi_empr = @empr
      and FOLI_DOCU = @folio
      and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)

    set @mensaje ='Sub-descuentos '
     /* Sub-descuentos*/
     insert into dte_desc_item_h (
        TIPO_DOCU,FOLI_DOCU,CODI_EMPR,
        NUME_LINE, CORR_DEIT, TIPO_DESC,VALO_DESC )
     select  
       TIPO_DOCU, FOLI_DOCU,  CODI_EMPR, NUME_LINE, 
       CORR_DEIT, TIPO_DESC,  VALO_DESC
     from dte_desc_item  
    where codi_empr = @empr
      and FOLI_DOCU = @folio
      and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
 
    set @mensaje ='Sub-recargos ' 
    --** Sub-recargos
     insert into dte_reca_item_h (
        TIPO_DOCU,FOLI_DOCU,CODI_EMPR,
        NUME_LINE, CORR_REIT,TIPO_RECA, VALO_RECA )
     select  
       TIPO_DOCU, FOLI_DOCU,  CODI_EMPR, NUME_LINE, 
       CORR_REIT, TIPO_RECA, VALO_RECA
     from dte_reca_item 
    where codi_empr = @empr
      and FOLI_DOCU = @folio
      and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
  
    set @mensaje ='Sub- cantidades distribuidas '
    --** Sub- cantidades distribuidas
     insert into dte_suca_item_h (
        TIPO_DOCU,FOLI_DOCU,CODI_EMPR,
        NUME_LINE,  CORR_SUCA,CODI_SUCA,SUCA_DIST )
     select  
       TIPO_DOCU, FOLI_DOCU, CODI_EMPR, NUME_LINE, 
       CORR_SUCA, CODI_SUCA,  SUCA_DIST
     from dte_suca_item  
    where codi_empr = @empr
      and FOLI_DOCU = @folio
      and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
    
    set @mensaje ='Resumen de Imuestos  '
    --** Resumen de Imuestos 
    insert into dte_suma_impu_h (
        TIPO_DOCU,CODI_EMPR,FOLI_DOCU,
        CODI_IMPU,MONT_IMPU)
     select  
       TIPO_DOCU, CODI_EMPR, FOLI_DOCU, CODI_IMPU,
       MONT_IMPU
     from dte_suma_impu  
    where codi_empr = @empr
      and FOLI_DOCU = @folio
      and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
    
    set @p_erro ='N'
    set @p_mens = ' FIN INSERT -- A LA BASE DATO HISTORICA'
   IF (@@ERROR <> 0)
         begin
           set @p_erro ='S'
           set @p_mens = 'Al Insertar :'+@mensaje
         end
 END
GO

GO
--SqlScripter----[dbo].[dte_inse_histo_envi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_inse_histo_envi]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_inse_histo_envi] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_inse_histo_envi]
@p_empr   varchar(9),@p_correnvi varchar(22),
      @p_erro varchar(1) output,  @p_mens varchar(80) output
   AS
   declare @empr  numeric(3), @MENSAJE varchar(80), @corr numeric(22)
 BEGIN
   begin
   select   @empr=convert(numeric(3),@p_empr),
	    @corr=convert(numeric(22),@p_correnvi)
   end
   set @p_erro ='N'
   set @p_mens = null
 
   print 'llama ' + @p_correnvi
   set @mensaje ='Envios detalle'
   insert into  DTE_TIDO_ENVI_H (
       CORR_ENVI,TIPO_DOCU,CANT_DOCU )
   select CORR_ENVI,TIPO_DOCU,CANT_DOCU
       from DTE_TIDO_ENVI
       where corr_envi = @corr
   
   set @p_erro ='N'
   set @p_mens = ' FIN INSERT -- A LA BASE DATO HISTORICA'
   
   IF (@@ERROR <> 0)
      begin
        set @p_erro ='S'
        set @p_mens = @@ERROR + '->' + @mensaje
      end
 END
GO

GO
--SqlScripter----[dbo].[dte_ivan_rete].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_ivan_rete]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_ivan_rete] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_ivan_rete]
@p_monto varchar(18), @p_iva varchar(18),
           @p_rete_parc varchar(18), @p_rete_total varchar(18),
           @p_erro varchar(1) output , @p_mens varchar(80) output 
   AS
   
   declare  @monto numeric(18), @iva  numeric(18),
            @rete_parc  numeric(18), @rete_total  numeric(18),
            @valor_calculado  numeric(18)
 BEGIN
   begin
    if @p_monto is null    or @p_iva  is null or
       @p_rete_parc is null or @p_rete_total  is null  
         begin
           set @p_erro ='S'
           set @p_mens = 'Un valor esta nulo'
         end
    else
      begin
          select @monto=convert(numeric(18),@p_monto),
                 @iva= convert(numeric(18),@p_iva),
                 @rete_parc=convert(numeric(18),@p_rete_parc),
                 @rete_total=convert(numeric(18),@p_rete_total)
         set @valor_calculado = @iva - @rete_parc - @rete_total
        if @monto <> @valor_calculado 
           begin
            set @p_erro ='S'
            set @p_mens = 'Monto diferentes'
           end
        else
           begin
            set @p_erro ='N'
            set @p_mens = 'Monto correcto'
           end
     end
    
    if  @@rowcount=0 
       begin
           set @p_erro ='S'
           set @p_mens = 'Valor no es encontrado'
       end
   else
       begin
           set @p_erro ='S'
           set @p_mens = 'Valor con error encontrado'
       end
   end
 END
GO

GO
--SqlScripter----[dbo].[dte_moni_reg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_moni_reg]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_moni_reg] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_moni_reg]
@P_FECH_DESD VarChar(10),
			@P_FECH_HAST VarChar(10),
			@P_CODI_EMPR  Numeric(9)
   AS

		
 

BEGIN
	
	Select
	   ' ' FASE1_1,
	   ' ' FASE1_2,
           ' ' FASE1_3,
           ' ' SP1,
	   ' ' FASE2_1,
	   ' ' FASE2_2,
           ' ' FASE2_3,
	   ' ' FASE2_4,
	   ' ' FASE2_5,
	   CONVERT(Varchar(3),TIPO.tipo_docu) +"-" + UPPER(SUBSTRING(TIPO.Desc_tido,1,1))+ LOWER(SUBSTRING(TIPO.Desc_tido,2,100)) TIPO_DESC, 
	   DTE.foli_docu, DTE.rutt_rece, 
	   UPPER(SUBSTRING(DTE.nomb_rece,1,1))+ LOWER(SUBSTRING(DTE.nomb_rece,2,100)) nomb_rece, 
	   DTE.fech_emis, DTE.MONT_TOTA,
	   ' ' FASE3_1,
	   ' ' FASE3_2,
           ' ' SP3,
	   ' ' FASE4_1,
	   ' ' FASE4_2,
           ' ' SP4,
	   ' ' FASE5_1,
	   DBO.GET_DTE_FASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,'ESTA','')  esta_FASE,
           DBO.GET_DTE_FASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,'DESC','')  DESC_FASE,
	   DTE.rutt_emis,
	   TIPO.tipo_docu,
	   DTE.codi_empr,
	   DBO.GET_DTE_FASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,'ENSA','')  ENSA,
	   DBO.GET_DTE_FASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,'DIRE','')  DIRE,
	   DBO.GET_DTE_FASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,'ARCH','')  ARCH,
	   DBO.GET_DTE_FASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,'HELP','')  AYUDA,
	   DBO.GET_COLOR_SUBFASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,1,1) COLOR1_1,
	   DBO.GET_COLOR_SUBFASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,1,2) COLOR1_2,
           DBO.GET_COLOR_SUBFASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,1,3) COLOR1_3,
	   DBO.GET_COLOR_SUBFASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,2,1) COLOR2_1,
	   DBO.GET_COLOR_SUBFASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,2,2) COLOR2_2,
           DBO.GET_COLOR_SUBFASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,2,3) COLOR2_3,
	   DBO.GET_COLOR_SUBFASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,2,4) COLOR2_4,
	   DBO.GET_COLOR_SUBFASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,2,5) COLOR2_5,
	   DBO.GET_COLOR_SUBFASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,3,1) COLOR3_1,
	   DBO.GET_COLOR_SUBFASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,3,2) COLOR3_2,
           DBO.GET_COLOR_SUBFASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,4,1) COLOR4_1,
	   DBO.GET_COLOR_SUBFASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,4,2) COLOR4_2,
	   DBO.GET_COLOR_SUBFASE(DTE.CODI_EMPR,DTE.TIPO_DOCU,DTE.FOLI_DOCU,DTE.ESTA_DOCU,DTE.CORR_ENVI,DTE.ESTA_DOCU1,DTE.CORR_ENVI1,5,1) COLOR5_1,
	   DBO.GET_ARCH("DTE",DTE.rutt_emis, DTE.tipo_docu, DTE.foli_docu, DTE.corr_envi, "xml","S") NOMB_ARCH_XML,
	   DBO.GET_ARCH("DTE",DTE.rutt_emis, DTE.tipo_docu, DTE.foli_docu, DTE.corr_envi, "html","N") NOMB_ARCH_HTML,
	   DBO.GET_ARCH("DTE",DTE.rutt_emis, DTE.tipo_docu, DTE.foli_docu, DTE.corr_envi, "pdf","N") NOMB_ARCH_PDF
	
	 From dte_enca_docu DTE, dte_tipo_docu as TIPO
	WHERE DTE.tipo_docu=tipo.Tipo_docu AND 
	DTE.codi_empr=@P_CODI_EMPR AND
	DTE.FECH_EMIS BETWEEN @P_FECH_DESD AND @P_FECH_HAST
	UNION ALL
	Select
		   ' ' FASE1_1,
		   ' ' FASE1_2,
	           ' ' FASE1_3,
	           ' ' SP1,
		   ' ' FASE2_1,
		   ' ' FASE2_2,
	           ' ' FASE2_3,
		   ' ' FASE2_4,
		   ' ' FASE2_5,
		   CONVERT(Varchar(3),TIPO.tipo_docu) +"-" + + UPPER(SUBSTRING(TIPO.Desc_tido,1,1))+ LOWER(SUBSTRING(TIPO.Desc_tido,2,100)) TIPO_DESC, 
		   DTE.foli_docu, DTE.rutt_rece, 
		   UPPER(SUBSTRING(DTE.nomb_rece,1,1))+ LOWER(SUBSTRING(DTE.nomb_rece,2,100)) nomb_rece, 
		   DTE.fech_emis, DTE.MONT_TOTA,
		   ' ' FASE3_1,
		   ' ' FASE3_2,
	           ' ' SP3,
		   ' ' FASE4_1,
		   ' ' FASE4_2,
	           ' ' SP4,
		   ' ' FASE5_1,
		   DBO.GET_DTE_FASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,'ESTA','')  esta_FASE,
	           DBO.GET_DTE_FASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,'DESC','')  DESC_FASE,
		   DTE.rutt_emis,
		   TIPO.tipo_docu,
		   DTE.codi_empr,
		   DBO.GET_DTE_FASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,'ENSA','')  ENSA,
		   DBO.GET_DTE_FASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,'DIRE','')  DIRE,
		   DBO.GET_DTE_FASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,'ARCH','')  ARCH,
		   DBO.GET_DTE_FASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,'HELP','')  AYUDA,
		   DBO.GET_COLOR_SUBFASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,1,1) COLOR1_1,
		   DBO.GET_COLOR_SUBFASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,1,2) COLOR1_2,
	           DBO.GET_COLOR_SUBFASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,1,3) COLOR1_3,
		   DBO.GET_COLOR_SUBFASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,2,1) COLOR2_1,
		   DBO.GET_COLOR_SUBFASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,2,2) COLOR2_2,
	           DBO.GET_COLOR_SUBFASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,2,3) COLOR2_3,
		   DBO.GET_COLOR_SUBFASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,2,4) COLOR2_4,
		   DBO.GET_COLOR_SUBFASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,2,5) COLOR2_5,
		   DBO.GET_COLOR_SUBFASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,3,1) COLOR3_1,
		   DBO.GET_COLOR_SUBFASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,3,2) COLOR3_2,
	           DBO.GET_COLOR_SUBFASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,4,1) COLOR4_1,
		   DBO.GET_COLOR_SUBFASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,4,2) COLOR4_2,
		   DBO.GET_COLOR_SUBFASE(CAST(DTE.CODI_EMPR AS Numeric(5)), CAST(DTE.TIPO_DOCU AS Numeric(5)) ,CAST(DTE.FOLI_DOCU AS Numeric(11)), 'ERR', CAST(DTE.CORR_ENVI AS Numeric(11)) ,0,0,5,1) COLOR5_1,
		   DBO.GET_ARCH("DTE",DTE.rutt_emis, DTE.tipo_docu, DTE.foli_docu, DTE.CORR_ENVI, "xml","S") NOMB_ARCH_XML,
		   DBO.GET_ARCH("DTE",DTE.rutt_emis, DTE.tipo_docu, DTE.foli_docu, DTE.CORR_ENVI, "html","N") NOMB_ARCH_HTML,
		   DBO.GET_ARCH("DTE",DTE.rutt_emis, DTE.tipo_docu, DTE.foli_docu, DTE.CORR_ENVI, "pdf","N") NOMB_ARCH_PDF
		 From dte_enca_docu_p DTE, dte_tipo_docu as TIPO
		WHERE DTE.tipo_docu=tipo.Tipo_docu AND 
		DTE.codi_empr=@P_CODI_EMPR AND
		DTE.FECH_EMIS BETWEEN @P_FECH_DESD AND @P_FECH_HAST
		ORDER BY Fech_Emis Desc

	RETURN 

END
GO

GO
--SqlScripter----[dbo].[dte_mont_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_mont_item]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_mont_item] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_mont_item]
@p_empr  varchar(9),  @p_tipodoc varchar(3),
           @p_folio varchar(10), @p_lin     varchar(3),
           @p_neto  varchar(18), @p_pre_uni varchar(18),
           @p_canti varchar(18),
           @p_desc  varchar(18), @p_reca  varchar(18),
           @p_erro varchar(1) output, @p_mens varchar(80)output 
  AS
 declare  @neto    numeric(18), @prec   numeric(18,4),
          @canti   numeric(18,4), @descuen numeric(18),
          @recargo numeric(18), @total   numeric(18)
 BEGIN
  begin
     select @neto=convert(numeric(18),@p_neto ),
            @prec=convert(numeric(18,4),@p_pre_uni),
            @canti=convert(numeric(18,4),@p_canti), 
            @descuen=convert(numeric(18),@p_desc),
            @recargo=convert(numeric(18),@p_reca)

      set @total =  (@prec* @canti) - isnull(@descuen,0) + isnull(@recargo,0)

    print 'TOTAL= '+convert(varchar(18),@total)
    print 'NETO= '+convert(varchar(18),@neto)
    if   @@error= 0
      begin       
       if @neto = round(@total,0) 
         begin
            set @p_erro ='N'
            set @p_mens = 'Valor correcto '+convert(varchar(18),@total)
         end
       else
         begin
            set @p_erro ='S'
            set @p_mens = 'Valor  incorrecto '+convert(varchar(18),@total)
         end
      end
    else
      begin
           set @p_erro ='S'
           set @p_mens ='Error en operacion '
      end
  end
 END
GO

GO
--SqlScripter----[dbo].[dte_monto_exen].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_monto_exen]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_monto_exen] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_monto_exen]
@p_monto  varchar(18), @p_obli varchar(1),
           @p_erro varchar(1) output, @p_mens varchar(80) output
   AS
  declare   @dv varchar(1),  @numero numeric(22,4)
 BEGIN
 if isnull(@p_monto,'0') > '0'
   begin
       select  @numero=convert(numeric(22,4),isnull(@p_monto,0))
    if @numero = 0 or @numero > 999999999999
      begin
         set @p_erro ='S'
         set @p_mens ='Valor Fuera de Rango (0 y 999.999.999.999)'
      end
    else
     if @numero = 0 and  @p_obli ='S'
       begin
         set @p_erro ='S'
         set @p_mens = 'Valor esta nulo y es obligatorio'
       end
     else
       begin
         set @p_erro ='N'
         set @p_mens = 'Valor numerico (OK) no obligatorio'
       end
    if @@rowcount=0  and @@error=0 
         begin
           set @p_erro ='S'
           set @p_mens = 'Valor no es encontrado'
         end
    else  if @@rowcount=1 and @@error=0
       begin
         set @p_erro ='S'
         set @p_mens = 'Valor no es un Numero o tiene formato'
       end
    end
 END
GO

GO
--SqlScripter----[dbo].[dte_monto_neto].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_monto_neto]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_monto_neto] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_monto_neto]
@p_monto  varchar(10), @p_obli varchar(1),
           @p_erro  varchar(1) output, @p_mens varchar(80) output
  AS
  
  declare  @dv     varchar(1), @numero numeric(18)
 BEGIN
   begin
       select @numero=convert(int, @p_monto)
       
    if @numero < 0 or @numero > 999999999999   
      begin
         set @p_erro ='S'
         set @p_mens = 'Valor Fuera de Rango (0 y 999.999.999.999)'
      end
    else
     begin
       if @numero is null and   @p_obli ='S' 
         begin
            set @p_erro ='S'
            set @p_mens = 'Valor esta nulo y es obligatorio '
         end
       else 
         begin
          set @p_erro ='N'
          set @p_mens = 'Valor numerico no obligatorio '
         end
     end
   begin
    if @@error=0 
         begin
           set @p_erro ='N'
           set @p_mens = 'Valor correcto'
         end
   else
       begin
         set @p_erro ='S'
         set @p_mens = 'Valor no es un Numero o tiene formato '
       end
   end
 end
 END
GO

GO
--SqlScripter----[dbo].[dte_nume_rang].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_nume_rang]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_nume_rang] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_nume_rang]
@p_nume  varchar(18), @p_vali varchar(1),
           @p_obli varchar(1),
           @p_erro varchar(1) output, @p_mens varchar(90) output
     AS
  declare  @numero numeric(18)
 BEGIN
   begin
       select @numero= isnull(@p_nume,0)
    begin     
     if @numero = 0  and @p_obli = 'S' 
       begin
        set @p_erro ='S'
        set @p_mens = 'Valor esta nulo o cero y es obligatorio'
       end
     else
      if @p_vali = '1' 
        if @numero < 0 
          begin
           set @p_erro ='S'
           set @p_mens = 'Numero menor que 0 (cero) : '+@p_nume
          end
        else
          begin
           set @p_erro ='N'
           set @p_mens = 'Numero correcto : '+@p_nume
         end    
    end  
   end
 END
GO

GO
--SqlScripter----[dbo].[dte_nume_rut].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_nume_rut]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_nume_rut] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_nume_rut]
@p_nume  varchar(18), @p_digi varchar(1) output,
           @p_vali_rut varchar(1), @p_obli varchar(1),
           @p_erro varchar(1) output, @p_mens varchar(80) output
   AS
declare    @dv   char(1),  @numero numeric(18), 
           @p_mensAJE  varchar(80),  @p_error   varchar(10),
           @digito char(1)
BEGIN
  begin
    select @numero=convert(numeric(18),isnull(@p_nume,0))
  if @p_vali_rut = 'S' 
    begin
     if @numero > 0   
        if @numero < 100000 or @numero > 99999999 
            begin
               set @p_erro ='S'
               set @p_mens = 'RUT Fuera de Rango (100.000 y 99.999.999)'
            end
         else
          -- valida el digito 
          begin
            EXECUTE  @digito= dte_vali_digi @p_nume, @dv, @p_error, @p_mensaje
             if isnull( @digito,0) <> @dv 
                begin
                  set @p_erro='S'
                  set @p_mens='Error al validar Digito '
                end
             else
                begin
                  set @p_erro ='N'
                  set @p_mens = 'RUT y Digito valido '
                end
          end
    end
else
     if @numero =0  and @p_obli ='S' 
        begin
          set @p_erro ='S'
          set @p_mens = 'Valor esta nulo y es obligatorio '
        end
     else
        begin
          set @p_erro ='N'
          set @p_mens = 'Valor correcto no obligatorio'
        end
 end
END
GO

GO
--SqlScripter----[dbo].[dte_nume_rut_tran].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_nume_rut_tran]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_nume_rut_tran] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_nume_rut_tran]
@p_nume  varchar(18), @p_digi varchar(1) output,
           @p_vali_rut varchar(1), @p_obli varchar(1),
           @p_erro varchar(1) output, @p_mens varchar(80) output
   AS
declare    @dv   char(1),  @numero numeric(18), 
           @p_mensAJE  varchar(80),  @p_error   varchar(10),
           @digito char(1)
BEGIN
--SP1 SE 5.2
  begin
    select @numero=convert(numeric(18),isnull(@p_nume,0))
  if @p_vali_rut = 'S' 
    begin
     if @numero > 0   
        
        if @numero < 1 or @numero > 99999999 
            begin
               set @p_erro ='S'
               set @p_mens = 'RUT Fuera de Rango (1 y 99.999.999)'
            end
         else
         
          -- valida el digito 
          begin
            EXECUTE  @digito= dte_vali_digi @p_nume, @dv, @p_error, @p_mensaje
             if isnull( @digito,0) <> @dv 
                begin
                  set @p_erro='S'
                  set @p_mens='Error al validar Digito '
                end
             else
                begin
                  set @p_erro ='N'
                  set @p_mens = 'RUT y Digito valido '
                end
          end
    end
else
     if @numero =0  and @p_obli ='S' 
        begin
          set @p_erro ='S'
          set @p_mens = 'Valor esta nulo y es obligatorio '
        end
     else
        begin
          set @p_erro ='N'
          set @p_mens = 'Valor correcto no obligatorio'
        end
 end
END
GO

GO
--SqlScripter----[dbo].[dte_pers_dato].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_pers_dato]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_pers_dato] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_pers_dato]
(
		@empresa numeric(3),
		@pcodi_pers varchar(16),
		@prutt_rece numeric(10) output,
		@pdgto_rece varchar(1) output,
		@pnomb_rece varchar(80) output,
		@pcodi_ramo varchar(12) output,
		@pcodi_comu varchar(8) output,
		@pdire_rece varchar(80) output,
		@pgiro_rece varchar(50) output,
		@pnomb_comu varchar(20) output,
		@pcodi_ciud varchar(8) output,
		@pnomb_ciud  varchar(20) output,
	      	@p_existe  varchar(1) output,
		@p_mensaje varchar(200) output)
AS
DECLARE  @p_tipo_mess varchar(30),
 	 @p_codi_mess numeric(22)
BEGIN
	set @p_existe='S'
				
	
		select 	@prutt_rece=p.rutt_pers , 
			@pdgto_rece=p.dgto_pers , 
			@pnomb_rece=p.nomb_pers ,
		       	@pcodi_ramo=p.codi_ramo , 
			@pcodi_comu=isnull(p.codi_comu,'STGO'),  
		       	@pdire_rece=isnull(p.dire_pers,'Sin Direccion'),
		       	@pgiro_rece=r.desc_ramo , 
			@pnomb_comu=isnull(ag1.nomb_arge,'SANTIAGO'),
		       	@pcodi_ciud=ag1.codi_arge1

		from   personas p, ramo r,area_geog ag1
		where  p.codi_pers = @pcodi_pers
		and    @empresa = r.codi_empr
		and    p.codi_ramo=r.codi_ramo 
		and    '05'= ag1.tipo_arge 
		and    p.codi_comu=ag1.codi_arge;
		
		if @@rowcount=0 
		begin
			set @p_existe='N'
			set @p_mensaje='Persona no existe'
			print @p_mensaje
		        return
		end

		
	     	select @pnomb_ciud=nomb_arge
		from   area_geog
		where  codi_arge = @pcodi_ciud
		and    tipo_arge='04';
		
		if @@rowcount=0 
		begin
			set @pnomb_ciud='SANTIAGO'
		        return
		end
		
		
END;
GO

GO
--SqlScripter----[dbo].[dte_refe_corr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_refe_corr]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_refe_corr] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_refe_corr]
@p_codr varchar(1), @p_corref  varchar(80),
           @p_docu  varchar(3),
           @p_erro varchar(1) output, @p_mens varchar(80) output  AS
declare  @cod_refe     numeric(1)
BEGIN
  begin
   select  @cod_refe=convert(numeric(1),@p_codr)     
   if @p_corref is not null 
     begin
        if @p_docu  in ('33','61')  and @cod_refe = 2 
            begin
              set @p_erro ='N'
              set @p_mens ='Documento Puede tener Correcion '
            end
        else
           begin 
             set @p_erro ='S'
             set @p_mens ='Documento no debe tener correccion'
           end
     end
  end
END
GO

GO
--SqlScripter----[dbo].[dte_refe_line].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_refe_line]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_refe_line] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_refe_line]
@p_empr  varchar(9),  @p_tipodoc varchar(3),
     @p_folio varchar(10), @p_lin     varchar(3),
     @p_erro varchar(1) output, @p_mens varchar(80) output 
 AS
 declare  @folio    numeric(3),  @lin numeric(3)
 
 BEGIN
  begin
 
    if @p_folio is null  or @p_lin is null or @p_empr is null 
        begin
          set @p_erro ='S'
          set @p_mens = 'Uno de los campos de la llave nulo '
        end
      else
        begin
           set @p_erro ='N'
           set @p_mens =' Llave correcta'
        end
  end
 END
GO

GO
--SqlScripter----[dbo].[dte_subc_dist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_subc_dist]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_subc_dist] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_subc_dist]
@p_empr  varchar(9),  @p_tipo_doc varchar(3),
           @p_folio varchar(10), @p_lin    varchar(4),
           @p_corrs  varchar(4), @p_codi   varchar(35),
           @p_sub_cnt  varchar(18),
           @p_erro  varchar(1) output, @p_mens varchar(80)output 
  AS
declare
   @empr    numeric(9),  @tipo_doc numeric(3), @folio    numeric(10),
   @lin     numeric(3),  @corrs    numeric(4), @sub_cnt  numeric(18),
   @cant_it numeric(18), @hay      numeric(2), @hay2     numeric(2)
BEGIN 
   begin
     select @empr=convert(numeric(9),@p_empr),
      @tipo_doc=convert(numeric(3),@p_tipo_doc),
      @folio=convert(numeric(10),@p_folio), @lin=convert(numeric(4),@p_lin),
      @sub_cnt=convert(numeric(18),@p_sub_cnt), 
      @corrs=convert(numeric(4),@p_corrs)
   end 
  if  isnull(@p_corrs,0) =0  or  isnull(@p_lin,0)= 0
      begin
          set @p_erro ='S'
          set @p_mens = 'Uno de los campos de la llave nulo '
      end
   else
   begin
        select @cant_it=cant_item
         from dte_deta_prse
        where CODI_EMPR = @empr
          and TIPO_DOCU = @tipo_doc
          and FOLI_DOCU = @folio
          and nume_line = @lin
      if @@rowcount=0 
         begin
              set @p_erro ='S'
              set @p_mens = 'Cant. Item no  encontrada en el Detalle'
         end
      else
       begin
         if @sub_cnt <= @cant_it 
             begin
                set @p_erro ='N'
                set @p_mens = ' Sub. cant correcta'
             end
         else
            begin
              set @p_erro ='S'
              set @p_mens = ' Sub. cant. incorrecta > que cantidad total '
            end
       end
   end
END
GO

GO
--SqlScripter----[dbo].[dte_subc_dist_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_subc_dist_p]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_subc_dist_p] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_subc_dist_p]
@p_empr  varchar(9),  @p_tipo_doc varchar(3),
           @p_folio varchar(10), @p_lin    varchar(4),
           @p_corrs  varchar(4), @p_codi   varchar(35),
           @p_sub_cnt  varchar(18),
           @p_erro  varchar(1) output, @p_mens varchar(80)output 
  AS
declare
   @empr    numeric(9),  @tipo_doc numeric(3), @folio    numeric(10),
   @lin     numeric(3),  @corrs    numeric(4), @sub_cnt  numeric(18),
   @cant_it numeric(18), @hay      numeric(2), @hay2     numeric(2)
BEGIN 
   begin
     select @empr=convert(numeric(9),@p_empr),
      @tipo_doc=convert(numeric(3),@p_tipo_doc),
      @folio=convert(numeric(10),@p_folio),
      @lin=convert(numeric(4),@p_lin),
      @sub_cnt=convert(numeric(18),@p_sub_cnt),
      @corrs=convert(numeric(4),@p_corrs)
   end 
   if  @p_corrs  is null or  @p_lin  is null  
      begin
          set @p_erro ='S'
          set @p_mens = 'Uno de los campos de la llave nulo '
      end
   else
      begin
        select @cant_it=cant_item
         from dte_deta_prse_p
        where CODI_EMPR = @empr
          and TIPO_DOCU = @tipo_doc
          and FOLI_DOCU = @folio
          and nume_line = @lin
    if @@rowcount=0 
         begin
              set @p_erro ='S'
              set @p_mens = 'Cant. Item no  encontrada en el Detalle'
         end
    else
      if @sub_cnt <= @cant_it 
          begin
             set @p_erro ='N'
             set @p_mens = ' Sub. cant correcta'
          end
       else
          begin
             set @p_erro ='S'
             set @p_mens = ' Sub. cant. incorrecta > que cantidad total '
          end
      end
END
GO

GO
--SqlScripter----[dbo].[dte_tasa_bole].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_tasa_bole]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_tasa_bole] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_tasa_bole]
@p_tasa varchar(10),
@p_valor varchar(100),@p_erro varchar(1) output, 
@p_mens varchar(80) output
AS
BEGIN
  if rtrim(@p_valor) = '0.00'
   begin
     SET @p_erro = 'N'
     SET @p_mens = @p_tasa + ' - valido'
   end
  else
   begin
     SET @p_erro ='S';
     SET @p_mens = @p_tasa + '- Debe ser Nulo';
   end
END
GO

GO
--SqlScripter----[dbo].[dte_tipo_desc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_tipo_desc]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_tipo_desc] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_tipo_desc]
@p_tipo  varchar(1),
           @p_erro  varchar(1) output, @p_mens varchar(80) output
   AS
 BEGIN
   begin
     if @p_tipo not in ( '%' ,'$')
       begin 
        set  @p_erro ='S'
        set  @p_mens = 'Tipo no definido, solo  % o $ : '+@p_tipo
       end  
     else
       begin
        set  @p_erro ='N'
        set  @p_mens = 'Dato correcto : '+@p_tipo
       end
    end
      if @@rowcount=0 
        begin
          set  @p_erro ='S'
          set  @p_mens = 'Valor erroneo  : '
        end
 END
GO

GO
--SqlScripter----[dbo].[dte_tran_otro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_tran_otro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_tran_otro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_tran_otro]
@p_dato  varchar(40),  @p_indicador varchar(1),
      @p_compara  varchar(40),  @p_obli varchar(1),
      @p_erro varchar(1) output , @p_mens varchar(80) output 
  AS
 BEGIN
  if @p_dato is not null  
    begin
     if @p_indicador in ('2','3') 
      begin 
       if @p_dato  = @p_compara 
         begin
           set @p_erro ='N'
           set @p_mens = 'Dato no se registra'
         end
       else
         begin
           set @p_erro ='N'
           set @p_mens ='Dato valido'
         end
      end
    end
 else
  begin
     if @p_indicador in ('2','3') 
       begin
         set @p_erro ='S'
         set @p_mens = 'Dato  nulo'
       end
     else
       begin
          set @p_erro ='N'
          set @p_mens ='Dato valido'
       end
  end
END
GO

GO
--SqlScripter----[dbo].[dte_vali_desc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_vali_desc]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_vali_desc] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_vali_desc]
@p_empr  varchar(9), @p_tipo_doc  varchar(3), 
           @p_folio varchar(10), @p_tipo  varchar(1), 
           @p_monto varchar(18),
           @p_erro varchar(1) output, @p_mens varchar(80) output
     AS
declare 
  @empr  numeric(9),  @tipo_doc numeric(3), @folio  numeric(10),
  @monto numeric(18), @hay      numeric(1), @hay2   varchar(1) 
 
 BEGIN
   begin
     select @empr=convert(numeric(9),@p_empr), 
            @tipo_doc=convert(numeric(3),@p_tipo_doc),
            @folio=convert(numeric(10),@p_folio)
    if  @tipo_doc is null or @p_tipo is null 
       begin
         set @p_erro ='S' 
         set  @p_mens = 'Uno de los campos de la llave nulo ' 
       end
    else
       if @p_monto is null
         begin
           set @p_erro ='S' 
           set @p_mens = 'Valor del sub-desto esta nulo' 
         end
       else
        begin
          select  @hay =ISNUMERIC(@p_monto) 
          if  @hay = 0 
            begin
              set  @p_erro ='S' 
              set  @p_mens = 'Valor no es numerico ' 
            end
          else 
            begin
              set  @p_erro ='N' 
              set  @p_mens ='Monto sub-descuento correcto' 
            end      
        end
   end 
 END
GO

GO
--SqlScripter----[dbo].[dte_vali_digi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_vali_digi]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_vali_digi] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_vali_digi]
@p_nume varchar(18), @p_dv  varchar(2) output,
               @p_erro  varchar(1) output, @p_mens  varchar(80) output   AS
 declare 
   @numero numeric(18), @digito char(1),    @nume  int,
   @mult  numeric(2),   @total int, @digi  char(1)
 BEGIN
  begin
   set @numero = @p_nume
   set @nume =@numero
   set @mult = 2
   set @total = 0
  print ' DV para= '+ @p_dv
   WHILE (@nume <> 0 )
    BEGIN
      begin
        set @total = @total+(@nume%10)*@mult
        set @nume = round(@nume/10,0,1)
        set @mult = @mult+1
        IF @mult>7 
          begin
           set @mult =2
          end
      end
      IF (@nume = 0)
        break
      ELSE
        continue
    END
   begin
    set @nume =(11-(@total%11))
     IF (@nume=10)
       begin
        set @digi  ='K' 
       end
     ELSE
      IF (@nume=11) 
        begin
          set @digi ='0'
         end
       ELSE
         begin
           set @digi =convert(char(1),@nume)
         end
   end
	print ' DV para= '+ @p_dv
	print ' @digi= '+@digi
   if @digi <> @p_dv 
   begin
        set @p_erro ='S'
        set @p_mens = 'DV ingresado diferente al calculodo'
        return
   end
   ELSE
   begin
        set @p_erro ='N'
        set @p_mens = 'Calculo del Digito correcto x'
        return
   end
   begin
     IF (@@ERROR <> 0)
       begin
        set @p_erro ='S'
        set @p_mens = 'Error en calculo del Digito'
        return
       end
     ELSE
       begin
        set @p_erro ='N'
        set @p_mens = 'Calculo del Digito correcto'
        return
       end
   end
  end
 END
GO

GO
--SqlScripter----[dbo].[dte_vali_fech].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_vali_fech]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_vali_fech] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_vali_fech]
@p_fech varchar(20), @p_vali_rang varchar(1),
               @p_erro varchar(1) output, @p_mens varchar(80) output
    as

  declare @hay numeric,
          @fecha datetime,
          @fec_ini datetime, @fec_i varchar(10),
          @fec_fin datetime, @fec_f varchar(10)
BEGIN
 if  (@p_fech is not null) and (rtrim(@p_fech) != ' ') 
 begin
    set @fec_i='2002-08-01'
    set @fec_f='2050-12-31'
    set dateformat  ymd
    select @fec_ini = convert(datetime,@fec_i)
    select @fec_fin = convert(datetime,@fec_f)
    select @fecha = convert(datetime,@p_fech)
    IF (@@ERROR <> 0)
       begin
          set @p_erro ='S'
          set @p_mens = 'Formato o Fecha Erroena'
          RETURN 
       end
    ELSE
     if @p_vali_rang = 'S' 
        if @fecha < @fec_ini or @fecha > @fec_fin 
           begin
             set @p_erro ='S'
             set @p_mens = 'Fecha Fuera de Rango (2002-08-01 y 2050-12-31) : '
           end
        else
           begin
             set @p_erro ='N'
             set @p_mens = 'Fecha Correcta en el Rango : '
           end
     else
        begin
           set @p_erro ='N'
           set @p_mens = 'Fecha Correcta : '
        end
 end
END
GO

GO
--SqlScripter----[dbo].[dte_vali_lice].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_vali_lice]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_vali_lice] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:		<Mario Rordriguez,,Name>
-- Create date: <31/07/2009>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[dte_vali_lice]
@p_corr  numeric(9),@v_numero1 numeric(12),
           @p_erro varchar(1) out, @p_msg varchar(80) out
     AS
declare 
@v_string1 varchar(30),
@v_string2 varchar(30),
@v_numero2 numeric(12),
@v_numero3 numeric(12),
@v_numero_real numeric(13),
@v_empr		numeric(9),
@v_periodo	varchar(7)
BEGIN

begin

			--Parametros del Libro
set @p_erro='N'
			select @v_empr=codi_empr, @v_periodo =codi_peri  
			from lcv_resu_libr
			where corr_licv = @p_corr

			--Numero de DTEs posibles? 			

 			--Numero de DTEs reales?
 			select @v_numero2=ISNULL(count (foli_docu),0)
 			from dte_enca_docu
			where esta_docu in ('DOK','RPR','RLV') and
						codi_empr = @v_empr and
						substring(fech_emis,1,7)= @v_periodo
	
			--Numero de DTOs reales?
 			select  @v_numero3=ISNULL(count(foli_docu),0)
 			from dto_enca_docu_P
			where esta_docu in ('INI','ERA') and
						codi_empr = @v_empr and
						substring(fech_emis,1,7)= @v_periodo

	    -- Suma de DTEs y DTOs recibidos

	   select @v_numero_real = ISNUMERIC(@v_numero2) + ISNUMERIC(@v_numero3)

			--comparacion
	
			if @v_numero1 < @v_numero_real 
			begin	
					set @p_erro = 'S'
					set @p_msg	= 'Cantidad máxima de documentos exedida.  Contáctese con DBNeT';

 			end  		
end
END
GO

GO
--SqlScripter----[dbo].[dte_vali_reca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_vali_reca]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_vali_reca] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_vali_reca]
@p_empr  varchar(9),  @p_tipodoc varchar(3),
           @p_folio varchar(10), @p_tipo    varchar(1),
           @p_monto  varchar(18),
           @p_erro varchar(1) output, @p_mens varchar(80)output 
    AS
 declare
  @empr   numeric(9),  @tipo_doc numeric(3),
  @folio  numeric(10), @monto    numeric(18),
  @hay    numeric(2),  @hay2     numeric(2)
 BEGIN
   begin
      select @folio=convert(numeric(10),@p_folio),
            @monto=convert(numeric(18),@p_monto)
     if  @folio is null or  @monto  is null 
         begin
          set  @p_erro ='S'
          set  @p_mens = ' Valor del sub-reca esta nulo'
         end
     else
       if @p_monto is null
         begin
           set @p_erro ='S' 
           set @p_mens ='Valor del sub-reca correcto'
         end
       else
        begin
         select  @hay =ISNUMERIC(@p_monto) 
          if  @hay = 0 
            begin
              set  @p_erro ='S' 
              set  @p_mens = 'Valor no es numerico ' 
            end
          else 
            begin
              set  @p_erro ='N' 
              set  @p_mens ='Monto sub-reca correcto' 
            end      
        end
  end
 END
GO

GO
--SqlScripter----[dbo].[dte_valo_impu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_valo_impu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_valo_impu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_valo_impu]
@p_empr  varchar(9),
				@p_tipo_doc varchar(3),
				@p_folio varchar(10),
				@p_monto  varchar(18),
				@p_valor varchar(18),
				@p_obli  varchar(1),
				@p_erro  varchar(1) output,
				@p_mens varchar(80) output 
AS
/****************************************************************************/
/*	OT176631																																*/
/*	Elegardo Valdés																													*/
/*	19/08/2005																															*/
/*	Se elimino variable @valor y ahora utiliza parametro @p_valor (siempre 	*/
/*	multiplicaba cero)																											*/
/****************************************************************************/
declare @monto numeric(18),
	@neto numeric(18),
	@resul   numeric(18)
BEGIN

begin 
	if  isnull(@p_monto,0) > 0 
	begin
		select @monto=convert(numeric(18),@p_monto)
       
		select @neto=mont_neto
		from dte_enca_docu
		where CODI_EMPR = @p_empr
		and TIPO_DOCU = @p_tipo_doc
		and FOLI_DOCU = @p_folio

		if @@rowcount=0 
		begin
			set @p_erro ='S'
			set @p_mens = 'No existe encabezado, folio :'+@p_folio
		end
		else
		begin
			set @resul = isnull(@neto,0) * isnull(@p_valor,0)
			
			if @p_monto <= @resul 
			begin
				set @p_erro ='N'
				set @p_mens = 'Monto cumple condicion '
			end
			else
			begin
				set  @p_erro ='S'
				set @p_mens = 'Monto  incorrecto'
			end
		end  
	end
end
END
GO

GO
--SqlScripter----[dbo].[dto_cheq_reci_rece].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dto_cheq_reci_rece]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dto_cheq_reci_rece] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dto_cheq_reci_rece]
@p_codi_empr  varchar(15),
  @p_rutt_emis  varchar(15),
  @p_reci_rece  varchar(100) output 
AS
BEGIN

	Select @p_reci_rece=ISNULL(CODI_VACG,'') 
	from CARA_PEEM 
	where CODI_EMPR=@p_codi_empr AND CODI_PERS=@p_rutt_emis
	AND CODI_CAGE='EGATE_RECI'
		
	if (@@rowcount = 0 )
	begin
		SET @p_reci_rece=''
	end
   
	if (@p_reci_rece='')
	begin
  	 	Select @p_reci_rece=ISNULL(CODI_VACG,'') 
  		from CARA_PERS 
  	 	where CODI_PERS=@p_rutt_emis AND CODI_CAGE='EGATE_RECI'
   		

  	 	if (@@rowcount = 0 )
	 	begin
	  		SET @p_reci_rece=''
	 	end
  	end 
   	
	if (@p_reci_rece='')
  	begin
  		Select @p_reci_rece=ISNULL(VALO_PAEM,'')  	
  		from PARA_EMPR 
  		where CODI_EMPR=@p_codi_empr AND CODI_PAEM='EGRE'
  		
  		if (@@rowcount = 0 )
		begin
			SET @p_reci_rece=''
	 	end	
  	end

END
GO

GO
--SqlScripter----[dbo].[dto_inse_histo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dto_inse_histo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dto_inse_histo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dto_inse_histo]
@p_empr   varchar(9), @p_tipodoc  varchar(3),
      @p_folio  varchar(18), @p_corr_docu varchar(18),
      @p_erro varchar(1) output,  @p_mens varchar(80) output
  AS
  declare @empr  numeric(3),  @docu numeric(3),
         @folio  numeric(10), @MENSAJE varchar(80),
	 @corr numeric(18)
 BEGIN
   begin
	/*print 'entrando a insertar historia'
	print 'empresa ' 
	print @p_empr
	print 'tipo doc ' 
	print @p_tipodoc
	print 'folio ' 
	print  @p_folio*/

        select @empr=convert(numeric(3),@p_empr),
               @docu=convert(numeric(3),@p_tipodoc),
               @folio=convert(numeric(10),@p_folio),
	       @corr=convert(numeric(18),@p_corr_docu)
   end
   set @p_erro ='N'
   set @p_mens = null
 
     print 'deta_prse'
     --**** Inserta detalle 
     set @mensaje ='Inserta detalle  '
     insert into dto_deta_prse_h (
        CORR_DOCU,TIPO_DOCU,FOLI_DOCU,CODI_EMPR,
	NUME_LINE,CODI_IMPU,TIPO_CODI,CODI_ITEM,
	INDI_EXEN,NOMB_ITEM,DESC_ITEM,CANT_ITEM,
	CANT_REFE,UNID_REFE,PREC_REFE,UNID_MEDI,
	PREC_ITEM,PREC_MONO,CODI_MONE,FACT_CONV,
	DCTO_ITEM,RECA_ITEM,NETO_ITEM,DESC_PORC,
	RECA_PORC,FECH_ELAB,FECH_VEPR,MNSG_ERRO)
     select  
        CORR_DOCU,TIPO_DOCU,FOLI_DOCU,CODI_EMPR,
	NUME_LINE,CODI_IMPU,TIPO_CODI,CODI_ITEM,
	INDI_EXEN,NOMB_ITEM,DESC_ITEM,CANT_ITEM,
	CANT_REFE,UNID_REFE,PREC_REFE,UNID_MEDI,
	PREC_ITEM,PREC_MONO,CODI_MONE,FACT_CONV,
	DCTO_ITEM,RECA_ITEM,NETO_ITEM,DESC_PORC,
	RECA_PORC,FECH_ELAB,FECH_VEPR,MNSG_ERRO
     from dto_deta_prse_p  
     where codi_empr = @empr
      	and FOLI_DOCU = @folio
     	and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
      	and CORR_DOCU = @corr
  
     print 'desc_reca'
     --** Descuentos globales
     set @mensaje ='Descuentos globales '
     insert into dto_desc_reca_h (
        CORR_DOCU,TIPO_DOCU,CODI_EMPR,FOLI_DOCU,
	NUME_DERE,TIPO_DERE,GLOS_DERE,TIPO_VALO,
	VALO_DERE,INDI_EXEN,MNSG_ERRO)
     select  
        CORR_DOCU,TIPO_DOCU,CODI_EMPR,FOLI_DOCU,
	NUME_DERE,TIPO_DERE,GLOS_DERE,TIPO_VALO,
	VALO_DERE,INDI_EXEN, MNSG_ERRO
     from dto_desc_reca_p  
     where codi_empr = @empr
      	and FOLI_DOCU = @folio
      	and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
	and CORR_DOCU = @corr
 
     print 'deta_acec'
     --*** Actividad Economica
     set @mensaje ='Actividad Economica  '
     insert into dto_deta_acec_h (
       	CORR_DOCU,TIPO_DOCU,CODI_EMPR,FOLI_DOCU,
	CODI_ACEC,CORR_ACEC,MNSG_ERRO)
     select  
        CORR_DOCU,TIPO_DOCU,CODI_EMPR,FOLI_DOCU,
	CODI_ACEC,CORR_ACEC,MNSG_ERRO
     from dto_deta_acec_p
     where codi_empr = @empr
	and FOLI_DOCU = @folio
      	and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
	and CORR_DOCU = @corr
  
     print 'docu_refe'
     -- Documento de referencia 
     set @mensaje ='Documento de referencia  '
     insert into dto_docu_refe_h (
       	CORR_DOCU,TIPO_DOCU,CODI_EMPR,FOLI_DOCU,
	NUME_REFE,TIPO_REFE,FOLI_REFE,RUTT_OTRO,
	DIGI_OTRO,FECH_REFE,RAZO_REFE,CODI_REFE,
	INDI_REGL,MNSG_ERRO)
     select  
       	CORR_DOCU,TIPO_DOCU,CODI_EMPR,FOLI_DOCU,
	NUME_REFE,TIPO_REFE,FOLI_REFE,RUTT_OTRO,
	DIGI_OTRO,FECH_REFE,RAZO_REFE,CODI_REFE,
	INDI_REGL,MNSG_ERRO
     from dto_docu_refe_p
     where codi_empr = @empr
      	and FOLI_DOCU = @folio
      	and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
	and CORR_DOCU = @corr
   
     print 'deta_codi'
     --** Otros Codigos
     set @mensaje ='Insertando Codigos Productos '
     insert into dto_deta_codi_h (
        CORR_DOCU,TIPO_DOCU,FOLI_DOCU,CODI_EMPR,NUME_LINE,
        CORR_CODI,TIPO_CODI,CODI_ITEM,MNSG_ERRO)
     select  
       	CORR_DOCU,TIPO_DOCU,FOLI_DOCU,CODI_EMPR,NUME_LINE, 
       	CORR_CODI,TIPO_CODI,CODI_ITEM,MNSG_ERRO
     from  dto_deta_codi_p
     where codi_empr = @empr
      	and FOLI_DOCU = @folio
      	and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
	and CORR_DOCU = @corr

     print 'desc_item'
     --** Sub-descuentos
     set @mensaje ='Sub-descuentos '
     insert into dto_desc_item_h (
        CORR_DOCU,TIPO_DOCU,FOLI_DOCU,CODI_EMPR,
        NUME_LINE, CORR_DEIT, TIPO_DESC,VALO_DESC,MNSG_ERRO )
     select  
       	CORR_DOCU,TIPO_DOCU,FOLI_DOCU,CODI_EMPR,
	NUME_LINE,CORR_DEIT,TIPO_DESC,VALO_DESC,MNSG_ERRO
     from dto_desc_item_p  
     where codi_empr = @empr
      	and FOLI_DOCU = @folio
      	and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
	and CORR_DOCU = @corr
  
     print 'reca_item'
     --** Sub-recargos
     set @mensaje ='Sub-recargos '
     insert into dto_reca_item_h (
        CORR_DOCU,TIPO_DOCU,FOLI_DOCU,CODI_EMPR,
        NUME_LINE,CORR_REIT,TIPO_RECA,VALO_RECA,MNSG_ERRO )
     select  
       	CORR_DOCU,TIPO_DOCU,FOLI_DOCU,CODI_EMPR,
	NUME_LINE,CORR_REIT,TIPO_RECA,VALO_RECA,MNSG_ERRO
     from dto_reca_item_p 
     where codi_empr = @empr
      	and FOLI_DOCU = @folio
      	and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
	and CORR_DOCU = @corr

     print 'suca_item'
     --** Sub- cantidades distribuidas
     set @mensaje ='Sub- cantidades distribuidas '
     insert into dto_suca_item_h (
        CORR_DOCU,TIPO_DOCU,FOLI_DOCU,CODI_EMPR,
        NUME_LINE,CORR_SUCA,CODI_SUCA,SUCA_DIST,MNSG_ERRO )
     select  
       	CORR_DOCU,TIPO_DOCU,FOLI_DOCU,CODI_EMPR,
	NUME_LINE,CORR_SUCA,CODI_SUCA,SUCA_DIST,MNSG_ERRO
     from dto_suca_item_p  
     where codi_empr = @empr
      	and FOLI_DOCU = @folio
      	and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
	and CORR_DOCU = @corr

     print 'suma_impu'
    --** Resumen de Impuestos 
    set @mensaje ='Resumen de Imuestos  '
    insert into dto_suma_impu_h (
        CORR_DOCU,TIPO_DOCU,CODI_EMPR,FOLI_DOCU,
        CODI_IMPU,MONT_IMPU,MNSG_ERRO,TASA_IMPU)
    select  
       	CORR_DOCU,TIPO_DOCU,CODI_EMPR,FOLI_DOCU,
	CODI_IMPU,MONT_IMPU,MNSG_ERRO,TASA_IMPU
    from dto_suma_impu_p  
    where codi_empr = @empr
      	and FOLI_DOCU = @folio
      	and TIPO_DOCU = isnull(@p_tipodoc, tipo_docu)
	and CORR_DOCU = @corr
    
    set @p_erro ='N'
    set @p_mens = ' FIN INSERT -- A LA BASE DATO HISTORICA'
    
    IF (@@ERROR <> 0)
         begin
           set @p_erro ='S'
           set @p_mens = @@ERROR + '->' + @mensaje
         end
 END
GO

GO
--SqlScripter----[dbo].[dto_inse_histo_rece].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dto_inse_histo_rece]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dto_inse_histo_rece] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dto_inse_histo_rece]
@p_empr varchar(9), @p_correnvi varchar(22),
   @p_erro varchar(1) output,  @p_mens varchar(80) output
   AS
declare @empr  numeric(3),  @MENSAJE varchar(80)
BEGIN 
   
   set @mensaje ='Envios detalle'
   insert into  dto_TIDO_RECE_H  (
             CORR_ENVI,TIPO_DOCU,CANT_DOCU,CANT_INFO )
      select CORR_ENVI,TIPO_DOCU,CANT_DOCU,CANT_INFO
        from dto_TIDO_RECE
       where corr_envi = @p_correnvi
     

    set @p_mens = ' FIN INSERT -- A LA BASE DATO HISTORICA'
   IF (@@ERROR <> 0)
   begin
      set @p_erro ='S'
      set @p_mens = @@ERROR + '->' +  @mensaje
   end
 END
GO

GO
--SqlScripter----[dbo].[dto_moni_reg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dto_moni_reg]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dto_moni_reg] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dto_moni_reg]
@P_FECH_DESD VarChar(10),
			@P_FECH_HAST VarChar(10),
			@P_CODI_EMPR Numeric(9)

   AS

		
 

 BEGIN
	
	Select
	   ' ' FASE1_1,
	   ' ' FASE1_2,
	   DTO.corr_envi,
	   DTO.fech_rece,
	   DTO.rutt_emis,
	   + UPPER(SUBSTRING(Per.NOMB_PERS,1,1))+ LOWER(SUBSTRING(Per.NOMB_PERS,2,100)) NOMB_EMIS,
	   DTO.Mont_TOTA,
	   ' ' FASE2_1,
	   ' ' FASE2_2,
           ' ' FASE2_3,
	   ' ' SP2,
	   ' ' FASE3_1,
	   ' ' FASE3_2,
	   CONVERT(Varchar(3),DTO.tipo_docu) +"-" + UPPER(SUBSTRING(TIPO.Desc_tido,1,1))+ LOWER(SUBSTRING(TIPO.Desc_tido,2,100))  TIPO_DESC, 
	   CONVERT(NUMERIC(9),DTO.foli_docu) foli_docu,
	   DBO.GET_DTO_FASE(DTO.CODI_EMPR,DTO.CORR_ENVI,DTO.ESTA_ENVI,DTO.TIPO_DOCU,DTO.FOLI_DOCU,DTO.ESTA_DOCU,DTO.CODI_ESAP, 'ESTA','')  ESTA_FASE,
	   DBO.GET_DTO_FASE(DTO.CODI_EMPR,DTO.CORR_ENVI,DTO.ESTA_ENVI,DTO.TIPO_DOCU,DTO.FOLI_DOCU,DTO.ESTA_DOCU,DTO.CODI_ESAP, 'DESC','')  DESC_FASE,
	   DTO.tipo_docu,
	   DTO.codi_empr,
	   DTO.ESTA_DOCU, 
	   DTO.CODI_ESAP,
	   DTO.ESTA_ENVI,
	   DBO.GET_DTO_FASE(DTO.CODI_EMPR,DTO.CORR_ENVI,DTO.ESTA_ENVI,DTO.TIPO_DOCU,DTO.FOLI_DOCU,DTO.ESTA_DOCU,DTO.CODI_ESAP, 'ENSA','') ENSA,
	   DBO.GET_DTO_FASE(DTO.CODI_EMPR,DTO.CORR_ENVI,DTO.ESTA_ENVI,DTO.TIPO_DOCU,DTO.FOLI_DOCU,DTO.ESTA_DOCU,DTO.CODI_ESAP, 'DIRE','') DIRE,
	   DBO.GET_DTO_FASE(DTO.CODI_EMPR,DTO.CORR_ENVI,DTO.ESTA_ENVI,DTO.TIPO_DOCU,DTO.FOLI_DOCU,DTO.ESTA_DOCU,DTO.CODI_ESAP, 'ARCH','') ARCH,
	   DBO.GET_DTO_FASE(DTO.CODI_EMPR,DTO.CORR_ENVI,DTO.ESTA_ENVI,DTO.TIPO_DOCU,DTO.FOLI_DOCU,DTO.ESTA_DOCU,DTO.CODI_ESAP, 'HELP','') AYUDA,
	   DBO.GET_COLOR_SUBFASE_DTO(DTO.CODI_EMPR,DTO.CORR_ENVI,DTO.ESTA_ENVI,DTO.TIPO_DOCU,DTO.FOLI_DOCU,DTO.ESTA_DOCU,DTO.CODI_ESAP, 1,1) COLOR1_1,
	   DBO.GET_COLOR_SUBFASE_DTO(DTO.CODI_EMPR,DTO.CORR_ENVI,DTO.ESTA_ENVI,DTO.TIPO_DOCU,DTO.FOLI_DOCU,DTO.ESTA_DOCU,DTO.CODI_ESAP, 1,2) COLOR1_2,
	   DBO.GET_COLOR_SUBFASE_DTO(DTO.CODI_EMPR,DTO.CORR_ENVI,DTO.ESTA_ENVI,DTO.TIPO_DOCU,DTO.FOLI_DOCU,DTO.ESTA_DOCU,DTO.CODI_ESAP, 2,1) COLOR2_1,
	   DBO.GET_COLOR_SUBFASE_DTO(DTO.CODI_EMPR,DTO.CORR_ENVI,DTO.ESTA_ENVI,DTO.TIPO_DOCU,DTO.FOLI_DOCU,DTO.ESTA_DOCU,DTO.CODI_ESAP, 2,2) COLOR2_2,
	   DBO.GET_COLOR_SUBFASE_DTO(DTO.CODI_EMPR,DTO.CORR_ENVI,DTO.ESTA_ENVI,DTO.TIPO_DOCU,DTO.FOLI_DOCU,DTO.ESTA_DOCU,DTO.CODI_ESAP, 2,3) COLOR2_3,
	   DBO.GET_COLOR_SUBFASE_DTO(DTO.CODI_EMPR,DTO.CORR_ENVI,DTO.ESTA_ENVI,DTO.TIPO_DOCU,DTO.FOLI_DOCU,DTO.ESTA_DOCU,DTO.CODI_ESAP, 3,1) COLOR3_1,
	   DBO.GET_COLOR_SUBFASE_DTO(DTO.CODI_EMPR,DTO.CORR_ENVI,DTO.ESTA_ENVI,DTO.TIPO_DOCU,DTO.FOLI_DOCU,DTO.ESTA_DOCU,DTO.CODI_ESAP, 3,2) COLOR3_2,
	   DBO.GET_ARCH("DTO",DTO.rutt_emis, DTO.tipo_docu, DTO.foli_docu, DTO.corr_envi, "xml","N") NOMB_ARCH_DTE, 
	   DBO.GET_ARCH("REC",DTO.rutt_emis, DTO.tipo_docu, DTO.foli_docu, DTO.corr_envi, "xml","S") NOMB_ARCH_REC, 
	   DTO.corr_docu
		From (DTO_MONI_RECE DTO LEFT JOIN PERSONAS PER ON dto.rutt_Emis = Per.codi_pers )LEFT JOIN
		 dte_tipo_docu TIPO ON DTO.tipo_docu=tipo.Tipo_docu 
		WHERE DTO.codi_empr=@P_CODI_EMPR AND
		DTO.FECH_RECE BETWEEN @P_FECH_DESD AND @P_FECH_HAST
		ORDER BY Fech_RECE Desc

	RETURN 

END
GO

GO
--SqlScripter----[dbo].[dto_rece_email].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dto_rece_email]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dto_rece_email] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dto_rece_email]
@p_codi_empr varchar(9), @p_esta_docu varchar(3), @p_corr_envi varchar(18), 
           @p_erro varchar(1) output,  @p_mens varchar(80) output
  AS
 declare   @p_MTOD_FROM VARCHAR(400),  @p_MTOD_TO      VARCHAR(400),
    @p_MTOD_CC   VARCHAR(400),  @p_MTOD_SUBJECT VARCHAR(500),
    @p_MTOD_TEXT VARCHAR(2000), @p_MTOD_ID numeric(18),
    @p_menu      VARCHAR(200),
    @EXISTE      VARCHAR(1),    @MENSAJE VARCHAR(80),
   @AUX_TEXT VARCHAR(100)
 BEGIN
 --  Datos para un email de los Envios 
   begin
     set @p_erro ='N'
       select @p_MTOD_SUBJECT=desc_esen, 
              @p_MTOD_TO=mail_esen
         from dte_esta_envi
        where esta_envi = @p_esta_docu
         and  mens_esen like 'S' 
   -- Recupera el email de la empresa 
IF (@@ROWCOUNT > 0)
 BEGIN
    begin
     exec PAEM_GET_VAL @p_codi_empr, 'ALL',
                'EGME', @p_MTOD_FROM out, @EXISTE out, @MENSAJE out
     PRINT @p_MTOD_FROM
      IF (@@ERROR <> 0)
       begin
        set @p_erro ='S' 
        set @p_mens  ='Error en : Email de la empresa' 
       end
    end 
    begin
       set @p_MTOD_CC=null 
       select  @p_MTOD_TEXT =' Empresa :'+@p_codi_empr+
                ' Correlativo de Recepción: '+convert(char(18),@p_corr_envi)+
                ' - Consultar el Documento en :Recepción de Documentos ',
            @p_MTOD_FROM=isnull(@p_MTOD_FROM,'Empresa sin Email'),
            @p_MTOD_TO=isnull(@p_MTOD_TO,'Sin email propio')
       from dual 
    end 
 -- Inserta los datos en la tabla MTOD 
     exec put_email @p_MTOD_FROM, @p_MTOD_TO,
                 @p_MTOD_CC,   @p_MTOD_SUBJECT,
                 @p_MTOD_TEXT, @p_MTOD_ID
      set @p_erro ='N' 
      set @p_mens  ='Proceso correcto' 
    IF (@@ERROR <> 0)
      begin
        set @p_erro ='N' 
        set @p_mens ='Estado del documento no envia Email' 
      end
  end 
 END
end
GO

GO
--SqlScripter----[dbo].[dto_vali_rece].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dto_vali_rece]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dto_vali_rece] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dto_vali_rece]
@p_cod_empr varchar(9),  @p_rut_rece varchar(8),                                       
           @p_erro varchar(200) output, @p_mens varchar(200)output
as                                            
declare
  @rut_doc  numeric(9),                                                                                  
  @hay      numeric(1)                                                                                  
 BEGIN     
   set @p_erro = 'N'                                                                                         
   if  @p_rut_rece  is null                                                                      
       set @p_erro ='S'                                                                                
   else                                                                                             
     begin                                                                                          
         select @hay=count(*)                                                                              
         from empr                                                                                  
         where rutt_empr = @p_rut_rece and codi_empr = @p_cod_empr                                                           
     if @hay = 0       
	 begin                                                                          
           set @p_erro ='S'                                                                            
	 end
     else 
	begin                                                                                          
           set @p_erro ='N'                                                                            
           set @p_mens = ' RUT esta registrado '                                                       
      end     
    end                                                                                      
   if @p_erro = 'S'
	begin
 	 set @p_mens = ' Error en RUT Receptor'
      end
   if (@@error <> 0) 
         begin                                                                                      
           set @p_erro ='S'                                                                            
           set @p_mens = ' Error en RUT Receptor'
         end                                                                                       
END
GO

GO
--SqlScripter----[dbo].[get_arch_clob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[get_arch_clob]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_arch_clob] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_arch_clob]
(@codi_Arch as integer,
	@inicio as integer,
	@tamaño as integer
)
AS
BEGIN
	DECLARE @ptrval varbinary(16)

	
	SELECT @ptrval = TEXTPTR(clob_arch)
	FROM dbq_arch_clob
	where codi_arch = @codi_Arch

	READTEXT dbq_arch_clob.clob_arch @ptrval @inicio @tamaño
	
END
GO

GO
--SqlScripter----[dbo].[get_arch_dte].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_arch_dte]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_arch_dte] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_arch_dte]
(@P_CODI_EMPR numeric(22,0),
                                                @P_TIPO_DOCU numeric(22,0),
                                                @P_FOLI_DOCU numeric(22,0), 
                                                @P_TIPO_ARCH nvarchar(10),
                                                @P_CANT_REGI nvarchar(22),
                                                @P_NUME_INIC nvarchar(22),
                                                @aux_codi_emex varchar(30)
)
AS
BEGIN
	DECLARE @ptrval varbinary(16)
	DECLARE @P_CANT_REGI_AUX integer
	DECLARE @P_NUME_INIC_AUX integer

	SET @P_CANT_REGI_AUX = convert(integer,@P_CANT_REGI)
	SET @P_NUME_INIC_AUX = convert(integer,@P_NUME_INIC)
	
	exec dbo.dbnet_set_emex @aux_codi_emex

	SELECT @ptrval = TEXTPTR(CLOB_DOCU)
	FROM DTE_DOCU_LOB with(nolock)
	WHERE CODI_EMPR = @P_CODI_EMPR
		AND TIPO_DOCU = @P_TIPO_DOCU
		AND FOLI_DOCU = @P_FOLI_DOCU
		AND TIPO_ARCH = @P_TIPO_ARCH
		
	READTEXT DTE_DOCU_LOB.CLOB_DOCU @ptrval @P_NUME_INIC_AUX @P_CANT_REGI_AUX
	
	
END
GO

GO
--SqlScripter----[dbo].[get_arch_dto].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_arch_dto]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_arch_dto] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_arch_dto]
(	@codi_emex as varchar(30),
	@codi_empr as integer, 
	@corr_docu as integer, 
	@tipo_arch as varchar(12),
	@inicio as integer,
	@tamaño as integer
)
AS
	BEGIN
		DECLARE @ptrval varbinary(16)
	
	SELECT @ptrval = TEXTPTR(clob_docu)
	FROM dto_docu_lob with (nolock)
	WHERE codi_emex = @codi_emex  
	AND  codi_empr = @codi_empr
    AND  corr_docu = @corr_docu
	AND  tipo_arch = @tipo_arch;

	READTEXT dto_docu_lob.clob_docu @ptrval @inicio @tamaño
	
END
GO

GO
--SqlScripter----[dbo].[get_asig_foli].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_asig_foli]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_asig_foli] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_asig_foli]
(@sql_corr_cesi numeric output) as
begin
  INSERT INTO seq_asig_foli(SEQ_VALO) VALUES ('X')
  SELECT @sql_corr_cesi=@@IDENTITY 
end
GO

GO
--SqlScripter----[dbo].[get_boel_resu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_boel_resu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_boel_resu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_boel_resu]
(@sql_corr_cesi numeric output) as
begin
  INSERT INTO seq_boel_resu(SEQ_VALO) VALUES ('X')
  SELECT @sql_corr_cesi=@@IDENTITY 
  return @sql_corr_cesi
end
GO

GO
--SqlScripter----[dbo].[get_comi_enca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_comi_enca]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_comi_enca] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_comi_enca]
(
  	@p_codi_empr	 Numeric(3), 
	@p_tipo_docu	 Numeric(3), 
	@p_foli_docu     Numeric(10), 
	@p_codi_emex     VarChar(30)
)
as
BEGIN
	SELECT	isnull(comi_neto, 0),
			isnull(comi_exen, 0),
			isnull(comi_ivaa, 0)
	 FROM	dte_enca_docu with(nolock)
	 WHERE	codi_empr = @p_codi_empr
	 AND	tipo_docu = @p_tipo_docu 
	 AND	foli_docu = @p_foli_docu
	 AND	codi_emex = @p_codi_emex 
END
GO

GO
--SqlScripter----[dbo].[get_corr_cesi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[get_corr_cesi]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_corr_cesi] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_corr_cesi]
(@sql_corr_cesi numeric output) as
begin
/*  declare  @sql_corr_cesi numeric*/
  INSERT INTO SEQ_CORR_CESI(SEQ_VALO) VALUES ('X')
  SELECT @sql_corr_cesi=@@IDENTITY 
  return @sql_corr_cesi
end
GO

GO
--SqlScripter----[dbo].[GET_CORR_COMO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[GET_CORR_COMO]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GET_CORR_COMO] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GET_CORR_COMO]
(@CORR_COMO NUMERIC OUTPUT)
AS
BEGIN
	INSERT INTO LCE_CORR_COMO(CORR_VALO) VALUES ('X')
	SELECT @CORR_COMO = @@IDENTITY
	RETURN @CORR_COMO
END
GO

GO
--SqlScripter----[dbo].[GET_CORR_ENVI].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[GET_CORR_ENVI]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GET_CORR_ENVI] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GET_CORR_ENVI]
(@CORR_ENVI NUMERIC OUTPUT)
AS
BEGIN
	INSERT INTO LCE_CORR_ENVI(CORR_VALO) VALUES ('X')
	SELECT @CORR_ENVI = @@IDENTITY
	RETURN @CORR_ENVI
END
GO

GO
--SqlScripter----[dbo].[GET_CORR_LIBR].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[GET_CORR_LIBR]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GET_CORR_LIBR] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GET_CORR_LIBR]
(@CORR_LIBR NUMERIC OUTPUT)
AS
BEGIN
	INSERT INTO LCE_CORR_LIBR(CORR_VALO) VALUES ('X')
	SELECT @CORR_LIBR = @@IDENTITY
	RETURN @CORR_LIBR
END
GO

GO
--SqlScripter----[dbo].[GET_CORR_MOCO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[GET_CORR_MOCO]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GET_CORR_MOCO] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GET_CORR_MOCO]
(@CORR_MOCO NUMERIC OUTPUT)
AS
BEGIN
	INSERT INTO LCE_CORR_MOCO(CORR_VALO) VALUES ('X')
	SELECT @CORR_MOCO = @@IDENTITY
	RETURN @CORR_MOCO
END
GO

GO
--SqlScripter----[dbo].[GET_CORR_MOVI].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[GET_CORR_MOVI]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GET_CORR_MOVI] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GET_CORR_MOVI]
(@CORR_MOVI NUMERIC OUTPUT)
AS
BEGIN
	INSERT INTO LCE_CORR_MOVI(CORR_VALO) VALUES ('X')
	SELECT @CORR_MOVI = @@IDENTITY
	RETURN @CORR_MOVI
END
GO

GO
--SqlScripter----[dbo].[get_dbn_servicio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[get_dbn_servicio]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dbn_servicio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dbn_servicio]
AS
 select S.CODI_SERV, S.DESC_SERV, dbo.Cantidad_Cola (isnull(S.ORIG_SERV,'0') ,S.Codi_serv,'ING') AS ENCOLA, 
 		dbo.Cantidad_Moni(S.Codi_serv,'OPER') AS OOKK,
 		dbo.Cantidad_Cola (isnull(S.ORIG_SERV,'0'),S.Codi_serv,'ERR') AS ERRO, 
 		dbo.Cantidad_Cola (isnull(S.ORIG_SERV,'0'),S.Codi_serv,'ESP') AS ESP, 
 		dbo.Cantidad_Cola (isnull(S.ORIG_SERV,'0'),S.Codi_serv,'ERN') AS ERN, 
 		'HC' as HC,'HP' as HP
  FROM DBN_SERVICIO S
  Where S.CODI_SERV<>'dbn_control'
  and S.SERV_ENAB = 'S'
 Order by SERV_ORDE asc
GO

GO
--SqlScripter----[dbo].[get_dte_comi_carg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_comi_carg]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_comi_carg] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_comi_carg]
(
  	@p_codi_empr	 Numeric(3), 
	@p_tipo_docu	 Numeric(3), 
	@p_foli_docu     Numeric(10), 
	@p_codi_emex     VarChar(30)
)
as
BEGIN
	SELECT  isnull(nume_coca, 0),
			isnull(tipo_coca, ' '),
			isnull(glos_coca, ' '),
			isnull(tasa_coca, 0),
			isnull(valo_neto_coca, 0),
			isnull(valo_exen_coca, 0),
			isnull(valo_iva_coca, 0)
	FROM	dte_comi_carg with(nolock)
	WHERE	codi_empr = @p_codi_empr
	AND		tipo_docu = @p_tipo_docu
	AND		foli_docu = @p_foli_docu
	AND	 codi_emex = @p_codi_emex
	ORDER BY nume_coca ASC
END
GO

GO
--SqlScripter----[dbo].[get_dte_corr_envi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_corr_envi]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_corr_envi] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_corr_envi]
(
	@p_nume_aten     Numeric(10),
	@p_codi_emex	 varchar(30)
)
AS
BEGIN
	SELECT 	corr_envi, codi_empr
	FROM	dte_envi_docu with(nolock)
	WHERE	nume_aten = @p_nume_aten
	AND		codi_emex = @p_codi_emex;
END
GO

GO
--SqlScripter----[dbo].[get_dte_desc_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_desc_item]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_desc_item] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_desc_item]
(
  	@p_codi_empr	 Numeric(3), 
	@p_tipo_docu	 Numeric(3), 
	@p_foli_docu     Numeric(10), 
	@p_codi_emex     VarChar(30),
	@p_nume_line	 Numeric(4)
)
as
BEGIN	
	SELECT  isnull(corr_deit, 0),
			isnull(tipo_desc, ' '),
			isnull(valo_desc, 0)
	FROM	dte_desc_item with(nolock)
	WHERE	codi_empr = @p_codi_empr
	AND		tipo_docu = @p_tipo_docu
	AND		foli_docu = @p_foli_docu
	AND		codi_emex = @p_codi_emex
	AND		nume_line = @p_nume_line
	ORDER BY corr_deit ASC;
END
GO

GO
--SqlScripter----[dbo].[get_dte_desc_reca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_desc_reca]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_desc_reca] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_desc_reca]
(
  	@p_codi_empr	 Numeric(3), 
	@p_tipo_docu	 Numeric(3), 
	@p_foli_docu     Numeric(10), 
	@p_codi_emex     VarChar(30)
)
as
BEGIN
	SELECT  isnull(nume_dere, 0),
			isnull(tipo_dere, ' '),
			isnull(glos_dere, ' '),
			isnull(tipo_valo, ' '),
			isnull(valo_dere, 0),
			isnull(indi_exen, 0),
			isnull(vomo_dere, 0)
	FROM	dte_desc_reca with(nolock)
	WHERE	codi_empr = @p_codi_empr
	AND		tipo_docu = @p_tipo_docu
	AND		foli_docu = @p_foli_docu
	AND		codi_emex = @p_codi_emex
	ORDER BY nume_dere ASC
END
GO

GO
--SqlScripter----[dbo].[get_dte_deta_acec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_deta_acec]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_deta_acec] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_deta_acec]
(
	@p_codi_empr	 Numeric(3), 
	@p_tipo_docu	 Numeric(3), 
	@p_foli_docu     Numeric(10), 
	@p_codi_emex     VarChar(30)
)
AS
BEGIN
	SELECT	isnull(corr_acec, 0),
			isnull(codi_acec, ' ')
	FROM   	dte_deta_acec with(nolock)
	WHERE	codi_empr = @p_codi_empr
	AND	  	tipo_docu = @p_tipo_docu
	AND		foli_docu = @p_foli_docu
	AND		codi_emex= @p_codi_emex
	ORDER BY corr_acec
END
GO

GO
--SqlScripter----[dbo].[get_dte_deta_codi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_deta_codi]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_deta_codi] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_deta_codi]
(
  	@p_codi_empr	 Numeric(3), 
	@p_tipo_docu	 Numeric(3), 
	@p_foli_docu     Numeric(10), 
	@p_codi_emex     VarChar(30),
	@p_nume_line	 Numeric(4)
)
as
BEGIN
	SELECT	isnull(corr_codi, 0),
			isnull(tipo_codi, ' '),
			isnull(codi_item, ' ')
	FROM dte_deta_codi with(nolock)
	WHERE tipo_docu = @p_tipo_docu
	AND   foli_docu = @p_foli_docu
	AND   codi_empr = @p_codi_empr
	AND	  codi_emex = @p_codi_emex
	AND   nume_line = @p_nume_line
	ORDER BY corr_codi
END
GO

GO
--SqlScripter----[dbo].[get_dte_deta_prse].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_deta_prse]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_deta_prse] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_deta_prse]
@p_codi_empr	numeric(9), 
  @p_tipo_docu numeric(3), 
  @p_foli_docu numeric(10), 
  @p_codi_emex varchar(30)
as
BEGIN
	SELECT	isnull(nume_line, 0), isnull(indi_exen, 0),	isnull(nomb_item, ' '),
			isnull(convert(text,desc_item),' '), isnull(cant_refe, 0), isnull(unid_refe, ' '),
			isnull(prec_refe, 0), isnull(cant_item, 0),	isnull(fech_elab, ' '),
			isnull(fech_vepr, ' '),	isnull(unid_medi, ' '),	isnull(prec_item, 0),
			isnull(prec_mono, 0), isnull(codi_mone, ' '), isnull(fact_conv, 0),
			isnull(desc_porc, 0), isnull(dcto_item, 0), isnull(reca_porc, 0),
			isnull(reca_item, 0), isnull(codi_impu, ' '), isnull(neto_item, 0),
			isnull(desc_mone, 0), isnull(reca_mone, 0), isnull(valo_mone, 0),
			isnull(indi_agen,' '), isnull(base_faen, 0), isnull(marg_comer, 0),
			isnull(prne_cofi, 0) 
	FROM	dte_deta_prse with(nolock)
	WHERE	codi_empr= @p_codi_empr 
	AND   	tipo_docu= @p_tipo_docu
	AND   	foli_docu= @p_foli_docu
	AND   	codi_emex= @p_codi_emex
	ORDER BY nume_line ASC
END
GO

GO
--SqlScripter----[dbo].[get_dte_docu_refe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_docu_refe]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_docu_refe] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_docu_refe]
(
  	@p_codi_empr	 Numeric(3), 
	@p_tipo_docu	 Numeric(3), 
	@p_foli_docu     Numeric(10), 
	@p_codi_emex     VarChar(30)
)
as
BEGIN
	SELECT  isnull(nume_refe, 0),
			isnull(tipo_refe, 0),
			isnull(foli_refe, 0),
			isnull(rutt_otro, 0),
			isnull(digi_otro, ' '),
			isnull(fech_refe, ' '),
			isnull(codi_refe, ' '),
			isnull(razo_refe, ' '),
			isnull(indi_regl, 0)
	FROM	dte_docu_refe with(nolock)
	WHERE	codi_empr= @p_codi_empr
	AND		tipo_docu= @p_tipo_docu
	AND		foli_docu= @p_foli_docu
	AND		codi_emex= @p_codi_emex
	ORDER BY nume_refe ASC
END
GO

GO
--SqlScripter----[dbo].[get_dte_enca_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_enca_docu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_enca_docu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_enca_docu]
(
	@p_codi_empr	 Numeric(3), 
	@p_tipo_docu	 Numeric(3), 
	@p_foli_docu     Numeric(10), 
	@p_codi_emex     VarChar(30)
)
AS
BEGIN
	SELECT	isnull(a.codi_empr, 0), isnull(vers_enca,' '),	isnull(feho_firm,' '),	isnull(a.esta_docu,' '), 
			isnull(a.tipo_docu, 0), isnull(foli_docu, 0),	isnull(fech_emis,' '),	isnull(indi_nore,0),
			isnull(entr_bien,0),	isnull(indi_vegd,0),	isnull(vent_serv,0),	isnull(mont_brut,' '),
			isnull(form_pago,0),	isnull(fech_canc,' '),	isnull(peri_desd,' '),	isnull(peri_hast,' '),
			isnull(moda_pago,' '),	isnull(codi_tepa,' '),	isnull(dias_tepa,0),	isnull(fech_venc,' '),
			isnull(rutt_emis,0),	isnull(digi_emis,' '),	isnull(nomb_emis,' '),	isnull(giro_emis,' '),
			isnull(nomb_sucu,' '),	isnull(codi_sucu,0),	isnull(dire_orig,' '),	isnull(comu_orig,' '),
			isnull(ciud_orig,' '),	isnull(codi_vend,0),	isnull(rutt_mand,'0'),	isnull(digi_mand,' '),
			isnull(rutt_rece,0),	isnull(digi_rece,' '), 	isnull(codi_rece,' '),	isnull(nomb_rece,' '), 
			isnull(giro_rece,' '),	isnull(cont_rece,' '),	isnull(dire_rece,' '), 	isnull(comu_rece,' '), 
			isnull(ciud_rece,' '),	isnull(dire_post,' '), 	isnull(comu_post,' '), 	isnull(ciud_post,' '),
			isnull( rutt_sofa,0),	isnull(digi_sofa,' '),	isnull(info_tran,' '),	isnull(rutt_tran,0),
			isnull(digi_tran,' '),	isnull(dire_dest,' '),	isnull(comu_dest,' '),	isnull(ciud_dest,' '),
			iSnull(mont_neto, 0),	isnull(mont_exen, 0), 	isnull(mont_base, 0), 	isnull(tasa_vaag, 0),
			isnull(impu_vaag, 0),	isnull(impu_vanr, 0),	isnull(cred_es65, 0),	isnull(gara_enva, 0),
			isnull(mont_tota, 0),	isnull(mont_nofa, 0),	isnull(subt_vese, 0), 	isnull(sald_ante, 0),
			isnull(valo_paga, 0), 	isnull(tipo_impr,' '), 	isnull(mont_canc, 0),	isnull(sald_inso, 0),
			isnull(from_paex, 0),	isnull(tipo_cupa, 0),	isnull(cuen_pago, 0),	isnull(banc_pago,' '),
			isnull(glos_pago,' '),	isnull(codi_emtr, 0),	isnull(foli_auto, 0),	isnull(fech_auto,' '),	
			isnull(codi_suad,' '),	isnull(iden_adem,' '),	isnull(iden_reex,' '),	isnull(naci_ext,' '),
			isnull(iden_adre,' '),	isnull(mail_rece,' '),	isnull(rutt_chof,0),	isnull(digi_chof,' '),
			isnull(nomb_chof,' '),	isnull(moda_vent, 0),	isnull(clau_expo, 0),	isnull(tota_clex, 0),
			isnull(viaa_tran, 0),	isnull(nomb_tran,' '),	isnull(rutt_citr,0),	isnull(digi_citr,' '),
			isnull(nomb_citr,' '), 	isnull(iden_citr,' '),	isnull(nume_book,' '),	isnull(codi_oper,' '),
			isnull(codi_puem, 0),	isnull(iden_puem,' '),	isnull(codi_pude, 0),	isnull(iden_pude,' '),	
			isnull(cant_tara, 0),	isnull(umed_tara, 0),	isnull(tota_brut, 0),	isnull(unid_brut, 0),	
			isnull(tota_neto, 0),	isnull(unid_neto, 0),	isnull(tota_item, 0),	isnull(tota_bult, 0),
			isnull(mont_flet, 0),	isnull(mont_segu, 0),	isnull(pais_rece,' '),	isnull(pais_dest,' '),
			isnull(tipo_mone,' '),	isnull(mont_baco, 0),	isnull(ivag_prop, 0),	isnull(ivag_terc, 0),	
			isnull(tipo_moom,' '),	isnull(tipo_camb, 0),	isnull(neto_otmo, 0),	isnull(noaf_otmo, 0),	
			isnull(faca_otmo, 0),	isnull(maco_otmo, 0),	isnull(ivag_otmo, 0),	isnull(ivno_otmo, 0),
			isnull(mont_otmo, 0),	isnull(feho_ted, ' '),	isnull(b.clas_docu, ' '),	isnull(val1, ' '),
			isnull(val2, ' '),	isnull(val3, ' '),	isnull(val4, ' '),	isnull(val5, ' '),
			isnull(val6, ' '),	isnull(val7, ' '),	isnull(val8, ' '),	isnull(val9, ' ')
	FROM  dte_enca_docu a with(nolock),
		  dte_tipo_docu b with(nolock)
	WHERE a.tipo_docu = @p_tipo_docu
	AND   a.foli_docu = @p_foli_docu
	AND   a.codi_empr = @p_codi_empr
	AND	  a.codi_emex = @p_codi_emex
	AND	  a.codi_emex = b.codi_emex
	AND	  a.tipo_docu = b.tipo_docu
END
GO

GO
--SqlScripter----[dbo].[get_dte_rang_foli].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_rang_foli]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_rang_foli] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_rang_foli]
(
  @p_codi_empr    numeric(9), 
  @p_tipo_docu numeric(3), 
  @p_foli_docu numeric(10), 
  @aux_codi_emex varchar(30)
)
as
BEGIN
	SELECT	top 1
			isnull(razo_soci, ' ') razo_soci,
			isnull(tipo_dora, 0) tipo_dora,
			isnull(llav_publ_rafo, ' ') llav_publ_rafo,
			isnull(llav_pusi_iden,' ') llav_pusi_iden,
			isnull(llav_priv_rafo, ' ') llav_priv_rafo,
			isnull(foli_desd, 0) foli_desd,
			isnull(foli_hast, 0) foli_hast,
			isnull(firm_sii, ' ') firm_sii,
			isnull(llav_puco_modu, ' ') llav_puco_modu,
			isnull(llav_puco_expo, ' ') llav_puco_expo,
			isnull(arch_caf,' ') arch_caf,
			isnull(rutt_empr, 0) rutt_empr,
			isnull(corr_rafo, 0) corr_rafo,
			isnull(convert(char(10), fech_auto, 120), 0) fech_auto
	FROM	dte_rang_foli with(nolock)
	WHERE	codi_empr = @p_codi_empr
	AND		tipo_dora = @p_tipo_docu
	AND		@p_foli_docu BETWEEN foli_desd AND foli_hast
	AND		codi_emex= @aux_codi_emex
	AND		datalength(llav_priv_rafo) > 0
END
GO

GO
--SqlScripter----[dbo].[get_dte_reca_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_reca_item]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_reca_item] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_reca_item]
(
  	@p_codi_empr	 Numeric(3), 
	@p_tipo_docu	 Numeric(3), 
	@p_foli_docu     Numeric(10), 
	@p_codi_emex     VarChar(30),
	@p_nume_line	 Numeric(4)
)
as
BEGIN
	SELECT	isnull(corr_reit, 0),
			isnull(tipo_reca, ' '),
			isnull(valo_reca, 0)
	FROM	dte_reca_item with(nolock)
	WHERE	codi_empr = @p_codi_empr
	AND		tipo_docu = @p_tipo_docu
	AND		foli_docu = @p_foli_docu
	AND		codi_emex = @p_codi_emex
	AND		nume_line = @p_nume_line
	ORDER BY corr_reit ASC
END
GO

GO
--SqlScripter----[dbo].[get_dte_suca_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_suca_item]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_suca_item] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_suca_item]
(
  	@p_codi_empr	 Numeric(3), 
	@p_tipo_docu	 Numeric(3), 
	@p_foli_docu     Numeric(10), 
	@p_codi_emex     VarChar(30),
	@p_nume_line	 Numeric(4)
)
as
BEGIN
	SELECT	isnull(corr_suca, 0),
			isnull(suca_dist, 0), 
			isnull(codi_suca, ' '),
			isnull(tipo_suca, ' ')
	FROM	dte_suca_item with(nolock)
	WHERE	codi_empr = @p_codi_empr
	AND		tipo_docu = @p_tipo_docu
	AND		foli_docu = @p_foli_docu
	AND	    codi_emex = @p_codi_emex
	AND		nume_line = @p_nume_line
	ORDER BY corr_suca ASC
END
GO

GO
--SqlScripter----[dbo].[get_dte_suma_imom].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_suma_imom]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_suma_imom] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_suma_imom]
(
  	@p_codi_empr	 Numeric(3), 
	@p_tipo_docu	 Numeric(3), 
	@p_foli_docu     Numeric(10), 
	@p_codi_emex     VarChar(30)
)
as
BEGIN
	SELECT	isnull(valo_imre, 0),
			isnull(tasa_impu, 0)
	FROM	dte_suma_imom with(nolock)
	WHERE	codi_empr = @p_codi_empr
	AND		tipo_docu = @p_tipo_docu
	AND		foli_docu = @p_foli_docu
	AND		codi_emex = @p_codi_emex
END
GO

GO
--SqlScripter----[dbo].[get_dte_suma_impu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_suma_impu]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_suma_impu] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_suma_impu]
@p_codi_empr	numeric(9), 
  @p_tipo_docu numeric(3), 
  @p_foli_docu numeric(10), 
  @p_codi_emex varchar(30)
AS
BEGIN
	SELECT	isnull(codi_impu, ' '),
			isnull(tasa_impu,0),
			isnull(mont_impu,0)
	FROM   dte_suma_impu with(nolock)
	WHERE	codi_empr = @p_codi_empr
	AND		tipo_docu = @p_tipo_docu
	AND		foli_docu = @p_foli_docu
	AND		mont_impu IS NOT null
	AND		codi_emex = @p_codi_emex
END
GO

GO
--SqlScripter----[dbo].[get_dte_tipo_bult].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dte_tipo_bult]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dte_tipo_bult] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dte_tipo_bult]
@p_codi_empr	numeric(9), 
  @p_tipo_docu numeric(3), 
  @p_foli_docu numeric(10), 
  @p_codi_emex varchar(30)
AS
BEGIN
	SELECT	isnull(codi_tibu, 0),
			isnull(cant_bult, 0), 
			isnull(iden_marc, ' '),
			isnull(iden_cont, ' '),
			isnull(sello_cont, ' '),
			isnull(nomb_emis, ' ')
	FROM	dte_tipo_bult with(nolock)
	WHERE	codi_empr = @p_codi_empr
	AND		tipo_docu = @p_tipo_docu
	AND		foli_docu = @p_foli_docu
	AND		codi_emex= @p_codi_emex;
END
GO

GO
--SqlScripter----[dbo].[get_dtes_actualizados].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_dtes_actualizados]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_dtes_actualizados] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_dtes_actualizados]
(
	@p_corr_envi     Numeric(10),
	@p_codi_emex	 varchar(30)
)
AS
BEGIN
	SELECT	isnull(a.codi_empr, 0),
			isnull(a.tipo_docu, 0),
			isnull(a.foli_docu, 0),
			isnull(a.esta_docu, ' '),
			isnull(a.mens_esta, ' '),
			isnull(b.esta_envi, ' '),
			isnull(b.mens_envi, ' '),
			isnull(a.codi_emex, ' '),
			isnull(a.lote_docu, ' '),
			isnull(c.desc_esdo, ' '),
			isnull(d.desc_esen, ' ')
	FROM   dte_enca_docu a with(nolock), dte_envi_docu b with(nolock), 
		   dte_esta_docu c with(nolock), dte_esta_envi d with(nolock)
	WHERE a.corr_envi = @p_corr_envi
	AND   a.corr_envi = b.corr_envi
	AND	  c.esta_docu = a.esta_docu
	AND	  d.esta_envi = b.esta_envi;			
END
GO

GO
--SqlScripter----[dbo].[get_envi_boel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_envi_boel]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_envi_boel] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_envi_boel]
(@sql_corr_cesi numeric output) as
begin
  INSERT INTO seq_envi_boel(SEQ_VALO) VALUES ('X')
  SELECT @sql_corr_cesi=@@IDENTITY 
end
GO

GO
--SqlScripter----[dbo].[get_historico_carga].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[get_historico_carga]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_historico_carga] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_historico_carga]
AS
Select a.codi_serv AS codi_serv, 
		cast(a.most_peri_oper as varchar) as most_peri_oper,  
		isnull(sum(a.most_suma_oper),'0') as Ok, 
		dbo.CantidadMoniCola(a.Codi_Serv, a.MOST_PERI_OPER)  as cantOKCola
 from DBN_MONI_STAT a
 where a.MOST_PERI_OPER > (select CONVERT(VARCHAR(8),GETDATE(),112) +  CONVERT(VARCHAR(2),GETDATE(),108))-6
 and a.MOST_PERI_OPER < (select CONVERT(VARCHAR(8),GETDATE(),112) +  CONVERT(VARCHAR(2),GETDATE(),108))+1
group by a.most_peri_oper, dbo.CantidadMoniCola(a.Codi_Serv, a.MOST_PERI_OPER),a.codi_serv
GO

GO
--SqlScripter----[dbo].[get_libr_boel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_libr_boel]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_libr_boel] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_libr_boel]
(@sql_corr_cesi numeric output) as
begin
  INSERT INTO seq_libr_boel(SEQ_VALO) VALUES ('X')
  SELECT @sql_corr_cesi=@@IDENTITY 
end
GO

GO
--SqlScripter----[dbo].[get_next_sys_alin].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_next_sys_alin]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_next_sys_alin] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_next_sys_alin]
(@num numeric output) as
begin
  INSERT INTO seq_sys_alin(val) VALUES ('X')
  set @num = ident_current('seq_sys_alin')
  return @num
end
GO

GO
--SqlScripter----[dbo].[get_next_sys_defp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_next_sys_defp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_next_sys_defp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_next_sys_defp]
(@num numeric output) as
begin
  INSERT INTO seq_sys_defp(val) VALUES ('X')
  set @num = ident_current('seq_sys_defp')
  return @num
end
GO

GO
--SqlScripter----[dbo].[get_next_sys_fupr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_next_sys_fupr]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_next_sys_fupr] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_next_sys_fupr]
(@num numeric output) as
begin
  INSERT INTO seq_sys_fupr(val) VALUES ('X')
  set @num = ident_current('seq_sys_fupr')
  return @num
end
GO

GO
--SqlScripter----[dbo].[get_next_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[get_next_x]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_next_x] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_next_x]
(@num numeric output) as
begin
  INSERT INTO seq_x(val) VALUES ('X')
  set @num = ident_current('seq_x')
  return @num
end
GO

GO
--SqlScripter----[dbo].[get_proc_evento].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_proc_evento]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_proc_evento] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_proc_evento]
@appl_orig    varchar(30),
  @codi_emex    varchar(40),
  @rutt_empr	numeric(10),
  @digi_empr	varchar(1),
  @corr_evnt    numeric(20),
  @codi_rtrn    numeric(4) output
as
declare 
  @mens_erro    	varchar(80),
  @resp_msge     	varchar(8000)
begin
  exec prc_get_message @appl_orig, @rutt_empr, @digi_empr, @corr_evnt, @codi_rtrn OUTPUT, @mens_erro OUTPUT, @resp_msge OUTPUT;
  
  update dte_proc_evnt set codi_rtrn = @codi_rtrn, mens_erro_evnt = @mens_erro, resp_sii = @resp_msge
  where corr_evnt = @corr_evnt
  
  select @codi_rtrn
end
GO

GO
--SqlScripter----[dbo].[get_prse_nume_line].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_prse_nume_line]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_prse_nume_line] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_prse_nume_line]
(
		@p_codi_empr	 Numeric(3), 
		@p_tipo_docu	 Numeric(3), 
		@p_foli_docu     Numeric(10), 
		@p_codi_emex     VarChar(30))
AS
BEGIN
	select 	isnull(MIN(nume_line),0)
	from dte_deta_prse with(nolock)
	where codi_empr=@p_codi_empr 
	and   tipo_docu=@p_tipo_docu
	and   foli_docu=@p_foli_docu
	and   codi_emex=@p_codi_emex	
END
GO

GO
--SqlScripter----[dbo].[get_seq_extr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_seq_extr]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_seq_extr] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_seq_extr]
(@sql_corr_extr numeric output) as
begin

		INSERT INTO seq_extrae(SEQ_VALO) VALUES ('X')
		SELECT @sql_corr_extr=@@IDENTITY 
end
GO

GO
--SqlScripter----[dbo].[get_unid_cons].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_unid_cons]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_unid_cons] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_unid_cons]
(@sql_corr_cesi numeric output) as
begin
  INSERT INTO seq_unid_cons(SEQ_VALO) VALUES ('X')
  SELECT @sql_corr_cesi=@@IDENTITY 
end
GO

GO
--SqlScripter----[dbo].[get_vali_refe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[get_vali_refe]') IS NULL EXEC('CREATE PROCEDURE [dbo].[get_vali_refe] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[get_vali_refe]
@p_codi_empr	numeric(9), 
  @p_tipo_docu numeric(3), 
  @p_foli_docu numeric(10), 
  @p_codi_emex varchar(30)
AS
BEGIN

	SELECT	isnull(tipo_refe, 0),
			isnull(foli_refe,0)
	FROM    dte_docu_refe ref with(nolock), dte_tipo_docu doc with(nolock)
	WHERE   ref.codi_emex = doc.codi_emex
	AND		ref.tipo_refe = convert(varchar, doc.tipo_docu)
	AND     ref.CODI_EMEX = @p_codi_emex
	AND     ref.CODI_EMPR = @p_codi_empr
	AND     ref.TIPO_DOCU = @p_tipo_docu
	AND     ref.FOLI_DOCU = @p_foli_docu
	AND     ref.indi_regl <> 1
	AND		doc.docu_elec = 'S';
END
GO

GO
--SqlScripter----[dbo].[lbe_crea_cara].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[lbe_crea_cara]') IS NULL EXEC('CREATE PROCEDURE [dbo].[lbe_crea_cara] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[lbe_crea_cara]
(@p_codi_soli   numeric,
				@p_codi_empr  numeric ,
				@p_rutt_emis  numeric,
				@p_digi_emis  varchar(1),
				@p_codi_peri  varchar(10),
				@p_tipo_libr  varchar(10),
				@p_tipo_envi  varchar(10),
				@p_nume_segm  numeric(1),
				@p_foli_noti  numeric(3),
				@p_corr_libe  numeric(22) out,
				@p_nerror     varchar(1)  out,
				@p_merror     varchar(200)out )
as
                                        
begin
	declare @aux_corr_libe numeric(22),
		@lugar varchar(100),
		@erro  varchar(1), 
		@mens varchar(80)

	set @lugar=' lbe_crea_cara() correlativo actual'
	print @lugar
	--Obteniendo el correlativo actual
	select @aux_corr_libe=isnull(max(corr_libe),0) 
	from lbe_enca_libr

	set @lugar='lbe_crea_cara() corr' + convert(varchar(10),@aux_corr_libe)
	print @lugar
   	
	set @aux_corr_libe=@aux_corr_libe+1;
	--Insertando Caratula  
	insert  into lbe_enca_libr(corr_libe,
			codi_soli,
			rutt_emis,
			codi_empr,
			digi_emis,
			codi_peri,
			tipo_libr,
			tipo_envi,
			nume_segm,
			foli_noti)
	values(@aux_corr_libe,
		@p_codi_soli,
		@p_rutt_emis,
		@p_codi_empr,
		@p_digi_emis,
		@p_codi_peri,
		@p_tipo_libr,
		@p_tipo_envi,
		@p_nume_segm,
		@p_foli_noti)
	if @@ERROR <>0
	begin
		set @p_nerror='S'
		set @p_merror='lbe_crea_cara() Error al Ejecutar el Insert (lbe_enca_libr)'
	end
		
	set @p_corr_libe=@aux_corr_libe

end
GO

GO
--SqlScripter----[dbo].[lbe_gen_resu_final].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[lbe_gen_resu_final]') IS NULL EXEC('CREATE PROCEDURE [dbo].[lbe_gen_resu_final] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[lbe_gen_resu_final]
(@p_codi_soli  numeric(22),
				@p_codi_empr numeric(10),
				@p_corr_libr numeric(22),
				@p_nerror    varchar(1) out ,
				@p_merror    varchar(200) out ) 
as
begin
   
declare @lugar varchar(100)

declare cur_tota_segm cursor for 
	select tipo_docu,
	sum(cant_foan)
	from lbe_tota_segm
	where codi_soli=@p_codi_soli
	group by tipo_docu
	--Fin declaracion Cursor

	
declare @aux_tipo_docu numeric(3),
	@aux_foli_anul numeric(18)
	           					               
	set @lugar='lbe_gen_resu_libr() Generando envio Final abriendo cur_tota_segm'
	
	--Loop para tipo de documentos
	OPEN cur_tota_segm
	FETCH NEXT FROM cur_tota_segm
	into	@aux_tipo_docu,
		@aux_foli_anul
	while @@FETCH_STATUS=0
	begin
		execute lbe_ins_tota_tipo @p_codi_soli,@p_corr_libr,@aux_tipo_docu,
					@p_codi_empr,@aux_foli_anul,'FINAL',@p_nerror,
					@p_merror
		if (@p_nerror='S')--Controlando Error
			return
		FETCH NEXT FROM cur_tota_segm
		into	@aux_tipo_docu,
		@aux_foli_anul
	end--fin de while fetch status
	CLOSE cur_tota_segm
	DEALLOCATE cur_tota_segm
	
	--Generando Totales del Periodo 
	set @lugar='lbe_gen_resu_libr() invocando a  lbe_serv_final()'
	--invocando Generacion de servicios periodicos Finales
	execute lbe_serv_final @p_codi_soli,@p_codi_empr,@p_corr_libr,@p_nerror,@p_merror
	if (@p_nerror='S')	
		return
			
end
GO

GO
--SqlScripter----[dbo].[lbe_gen_resu_total].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[lbe_gen_resu_total]') IS NULL EXEC('CREATE PROCEDURE [dbo].[lbe_gen_resu_total] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[lbe_gen_resu_total]
(@p_codi_soli  numeric(22),
				@p_codi_empr	numeric(22),
				@p_corr_libr	numeric(22),
				@p_nerror	varchar(1) out ,
				@p_merror	varchar(200) out )
as
begin
	
declare @lugar 		varchar(100),
	@aux_nume_dte 	numeric(22),       
	@tipo_envio   	varchar(7),     
	@tipo_actual	numeric(2),
	--variables para fetch
	@aux_tipo_docu	numeric(2),
	@aux_foli_docu  numeric(18),
	@aux_foli_anul	numeric(1),
	@aux_codi_soli	numeric(22),
	@aux_corr_libe	numeric(22),
	@aux_codi_serv	numeric(2),
	@aux_tipo_serv	numeric(2),
	@aux_codi_empr	numeric(9),
	@aux_peri_deve	varchar(10),
	@aux_tota_docu	numeric(10),
	@aux_tota_exen	numeric(18),
	@aux_mont_neto	numeric(18),
	@aux_tasa_vaag	numeric(5,2),
	@aux_mont_vaag	numeric(18),
	@aux_mont_tota	numeric(18),
	@aux_tota_nofa	numeric(18),
	@aux_tota_peri	numeric(18),
	@aux_tota_saan	numeric(18),
	@aux_tota_vapa	numeric(18),
	@aux_cant_foan 	numeric(18)

	set @aux_codi_serv=0;
	
	declare cur_lbe_deta_docu cursor for 
	--select * from(
	select tipo_docu,tipo_serv,
		substring(fech_venc,0,8),count(*),
		sum(mont_exen),sum(mont_tota),sum(mont_nofa),
		sum(mont_peri),sum(tota_saan),sum(tota_vapa) 
	from   lbe_deta_docu
	where corr_libe = @p_corr_libr 
	and tipo_serv='02'
	group by tipo_docu,tipo_serv,fech_venc
	union all
	select tipo_docu,tipo_serv,'' as peri_deve,count(*),--
		sum(mont_exen),sum(mont_tota),sum(mont_nofa),
		sum(mont_peri),sum(tota_saan),sum(tota_vapa)
	from lbe_deta_docu
	where corr_libe=@p_corr_libr
	and tipo_serv<>'02'
	group by tipo_docu, tipo_serv--,peri_hast
	--)
	order by  tipo_docu
	--fin declaracio cursor
	--fin declaraciones
	-----------------------------------------------


	set @lugar='Obteniendo el Tipo '
	print @lugar
	execute lbe_get_tipo_envi @p_corr_libr,
			 @p_codi_soli ,
			 @p_codi_empr ,
			 @tipo_envio output ,
			 @p_nerror  ,
			 @p_merror  
	--controlando error
	if @p_nerror='S'
	   	return
	set @tipo_actual=0
	
	open cur_lbe_deta_docu 
	FETCH NEXT FROM cur_lbe_deta_docu
	into	@aux_tipo_docu,
		@aux_tipo_serv,
		@aux_peri_deve, 
		@aux_tota_docu, 
		@aux_tota_exen,
		@aux_mont_tota,
		@aux_tota_nofa,
		@aux_tota_peri,
		@aux_tota_saan,
		@aux_tota_vapa

	WHILE @@FETCH_STATUS = 0
	BEGIN
	   if (@tipo_actual<>@aux_tipo_docu)
		begin
		set @tipo_actual=@aux_tipo_docu
		execute lbe_ins_tota_tipo @p_codi_soli , @p_corr_libr,@tipo_actual,
				@p_codi_empr,0,@tipo_envio, 
				@p_nerror,@p_merror
		
		if (@p_nerror='S')
			return
		end--fin de if
	set @aux_codi_serv=@aux_codi_serv+1
	print @aux_tipo_docu
	print @aux_peri_deve
	execute lbe_ins_tota_serv @p_codi_empr,@p_codi_soli,@p_corr_libr,
			@aux_tipo_docu,@aux_codi_serv,@aux_tipo_serv,
			@aux_peri_deve,@aux_tota_docu,@aux_tota_exen,
			@aux_mont_tota,@aux_tota_nofa,@aux_tota_peri,
			@aux_tota_saan,@aux_tota_vapa,@tipo_envio,
			@p_nerror,@p_merror
	if (@p_nerror='S')--Controlando Errores
		return
	FETCH NEXT FROM cur_lbe_deta_docu
	    into @aux_tipo_docu,
		@aux_tipo_serv,
		@aux_peri_deve, 
		@aux_tota_docu, 
		@aux_tota_exen,
		@aux_mont_tota,
		@aux_tota_nofa,
		@aux_tota_peri,
		@aux_tota_saan,
		@aux_tota_vapa

	END
	--Cerrando Cursores	
	CLOSE cur_lbe_deta_docu
	DEALLOCATE cur_lbe_deta_docu

end
GO

GO
--SqlScripter----[dbo].[lbe_genera_segm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[lbe_genera_segm]') IS NULL EXEC('CREATE PROCEDURE [dbo].[lbe_genera_segm] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[lbe_genera_segm]
(@p_codi_soli numeric(22),
				@p_codi_empr  numeric(10) ,
				@p_tipo_envi  varchar(10),
				@p_foli_noti  numeric(10),
				@p_nume_dte   numeric(10),
				@p_peri_desd  varchar(10),
				@p_peri_hast  varchar(10),
				@p_rutt_rece  numeric(10),
				@p_mont_mini  numeric (18), 
				@p_corr_libe numeric(22) out,
				@p_nerror    varchar(1) out ,
				@p_merror    varchar(200) out) 
as
begin
declare @aux_rutt_empr	numeric(10),
	@aux_digi_empr 	varchar(1),
	@num_dte	numeric(22),
	@num_dte_segm 	numeric(22),
	@aux_cont_dte 	numeric(22),
	@corr	  	numeric(22),
	@nume_segm   	numeric(10),
	@tipo_libro 	varchar(20),
	@nerror 	varchar(1),
	@merror 	varchar(200),
	@lugar 		varchar(200),
	@codi_peri	varchar(10)

	set @codi_peri=substring(@p_peri_desd,0,8)

	set @tipo_libro='ESPECIAL'
	
	--Obteniendo el rutt de la  de empresa emisora
	execute dte_get_rutt_empr @p_codi_empr,
				@aux_rutt_empr output,
				@aux_digi_empr out,
				@p_nerror out ,
				@p_merror out

	if (@p_nerror='S') 
		return;
		
	--Obteniendo el numero de dtes (boletas)a traspasar 
	set @num_dte=dbo.lbe_get_num_bol_dte (@p_codi_soli,@p_codi_empr,@p_peri_desd,
					 @p_peri_hast,@p_rutt_rece,@p_mont_mini)

	
	if (@num_dte<=0)	
	begin
		set @p_nerror='S'
		set @p_merror='No existen documentos que cumplen criterio'
		return
	end

	
	set @num_dte_segm=@p_nume_dte;
	set @aux_cont_dte=@num_dte;
	set @nume_segm=0;


	while (1=1)
	begin
		--creando numero de segmeto
		set @nume_segm=@nume_segm+1;
		--Creando la caratula del libro 
		execute lbe_crea_cara @p_codi_soli,@p_codi_empr,@aux_rutt_empr, 
					@aux_digi_empr,@codi_peri,@tipo_libro,
					@p_tipo_envi,@nume_segm,@p_foli_noti,
					@corr out ,@p_nerror out ,@p_merror out 
		if (@p_nerror='S')
	    		return;
   	
    		--Traspasando Detalles dte_enca_docu (lbe_deta_docu)
	    	set @lugar='lbe_genera_total() Traspasando detalle'
		execute lbe_tras_deta @p_codi_soli,@p_codi_empr,@corr,@p_peri_desd ,
				@p_peri_hast, @p_rutt_rece,@p_mont_mini, 
				@num_dte_segm,@p_nerror out ,@p_merror out
       		if (@p_nerror='S')--Controlando Errores
			return;
    	
    		--Generando los Totales del Libro
	    	set @lugar='lbe_genera_total() generando el resumen total del libro';
 		execute lbe_gen_resu_total @p_codi_soli,@p_codi_empr,@corr,
					@p_nerror out ,@p_merror out
        	if (@p_nerror='S') 
			return

         	
    		set @aux_cont_dte=@aux_cont_dte-@num_dte_segm;
    		--Si ya se traspasaron todos los documentos se sale del loop 
    		if(@aux_cont_dte<=0)
			break	
		else
			continue --No se si esto sera necesario
	end --fin del while loop
	
 	--Creando la Caratula del envio Final
	   --No tiene numero de segmento y el tipo de envio es FINAL
	set @lugar='lbe_genera_total() generando el resumen Final del libro'
	execute lbe_crea_cara @p_codi_soli,@p_codi_empr,@aux_rutt_empr, 
		@aux_digi_empr,@codi_peri,@tipo_libro,
		'FINAL',null,@p_foli_noti,@corr output,
		@p_nerror out ,@p_merror out 

	if (@p_nerror='S') 
	    	return
   
   	--Generando el Resumen Final del libro (Periodo)
   	--No se incluye detalle en envio Final del libro
   	set @lugar='lbe_genera_total() generando el resumen total del libro'

   	execute lbe_gen_resu_final @p_codi_soli,
		@p_codi_empr,@corr,@p_nerror out ,@p_merror out
   	if (@p_nerror='S') 
		return;




end
GO

GO
--SqlScripter----[dbo].[lbe_genera_total].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[lbe_genera_total]') IS NULL EXEC('CREATE PROCEDURE [dbo].[lbe_genera_total] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[lbe_genera_total]
(@p_codi_soli numeric(22),
				@p_codi_empr  numeric(10),
				@p_tipo_envi  varchar(10),
				@p_foli_noti  numeric(10),
				--parametros criterio
				@p_peri_desd  varchar(10),
				@p_peri_hast  varchar(10),
				@p_rutt_rece  numeric,
				@p_mont_mini  numeric , 
				--parametro de que retorna el correlativo del libro
				@p_corr_libe numeric(22) output,
				@p_nerror    varchar(1) output,
				@p_merror    varchar(200) output)
as
begin

declare @lugar	varchar(100),
	@corr	numeric(22),
	@tipo_libro	varchar(20),
	@aux_rutt_emis	numeric(10),
	@aux_digi_emis	varchar(1),
	@existen 	numeric(22),
	@codi_peri	varchar(10)

	
	--Fin Declaraciones
	set @codi_peri=substring(@p_peri_desd,0,8)
	print @codi_peri
	set @p_nerror='N'
	set @p_merror='Proceso Exitoso'
	--Obteniendo datos de empresa empresa emisora del libro
	set @lugar='lbe_genera_total() Consultando por rutt_empresa ' + convert(varchar(10),@p_codi_empr)
	print @lugar
	execute dte_get_rutt_empr @p_codi_empr,
				  @aux_rutt_emis output,
				  @aux_digi_emis output,
				  @p_nerror output,
				  @p_merror output
	
	if @p_nerror='S'
		return--Controlando Error
	
	--Obteniendo el numero de boletas que incluiran el
	--Libro de Boletas Electronicas
	set @lugar='lbe_genera_total() Existen ' + convert(varchar(10),@aux_rutt_emis)
	--print @lugar

	set @existen=dbo.lbe_get_num_bol_dte (@p_codi_soli,
					@p_codi_empr,
					@p_peri_desd,
					@p_peri_hast,
					@p_rutt_rece,
					@p_mont_mini)
	print @existen
	if (@existen<=0) 
	begin
		set @p_nerror='S'
		set @p_merror='No se han encontrado documentos segun criterio'
		return 
	end--fin de if

	set @tipo_libro='ESPECIAL'
	--Creando Caratula del Libro
	set @lugar='lbe_genera_total() Creando Caratula'
	print @lugar
	execute lbe_crea_cara @p_codi_soli,@p_codi_empr,
		      @aux_rutt_emis,@aux_digi_emis,
		      @codi_peri,@tipo_libro,
		      @p_tipo_envi,NULL,
		      @p_foli_noti,@corr output,
		      @p_nerror out,@p_merror out
	--Controlar Error
	if (@p_nerror ='S')
		return

	--creando el detalle segun criterio de parametros
    	--el 0 quiere decir que el maximo de dtes es ilimitado 
    	--Esto para envios totales

	set @lugar='lbe_genera_total() Traspasando detalle (corr)'+ convert(varchar(10),@corr)
	---print @lugar
	execute lbe_tras_deta @p_codi_soli, @p_codi_empr,@corr,
			      @p_peri_desd ,@p_peri_hast, @p_rutt_rece,
			      @p_mont_mini, 0,@p_nerror out ,@p_merror out
	if (@p_nerror='S')
		return;
      	--Creando los Resumenes del Libro 
	set @lugar='lbe_genera_total() generando el resumen total del libro'

 	execute lbe_gen_resu_total @p_codi_soli,@p_codi_empr,
				   @corr,@p_nerror out ,@p_merror out 
	if (@p_nerror='S') 
		return
	
	
end
GO

GO
--SqlScripter----[dbo].[lbe_get_tipo_envi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[lbe_get_tipo_envi]') IS NULL EXEC('CREATE PROCEDURE [dbo].[lbe_get_tipo_envi] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[lbe_get_tipo_envi]
(@p_corr_libe numeric(22),
			@p_codi_soli numeric(22),
			@p_codi_empr numeric(10),
			@p_tipo_envi  varchar(10) out,
			@p_nerror  varchar(1) out,
			@p_merror  varchar(200) out)
as
declare @lugar varchar(100)
begin 
	set @p_nerror='N'
	set @lugar='lbe_get_tipo_envi() Obt. Tipo de envio LBE'
	
	select @p_tipo_envi=tipo_envi 
	from lbe_enca_libr
	where codi_empr=@p_codi_empr 
	and   corr_libe=@p_corr_libe
	and   codi_soli=@p_codi_soli

	IF @@ERROR <> 0 
	begin
		set @p_nerror='S'
		set @p_merror='get_tipo_envi() Error al Consultar por el tipo de envio del libro'
	end
		
end
GO

GO
--SqlScripter----[dbo].[lbe_ins_tota_serv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[lbe_ins_tota_serv]') IS NULL EXEC('CREATE PROCEDURE [dbo].[lbe_ins_tota_serv] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[lbe_ins_tota_serv]
(@p_codi_empr	numeric(10),
				@p_codi_soli	numeric(22),
				@p_corr_libe	numeric(22),
				@p_tipo_docu	numeric(3),
				@p_codi_serv	numeric(2),
				@p_tipo_serv	numeric(1),
				@p_peri_deve	varchar(10),
				@p_tota_docu	numeric(18),
				@p_tota_exen	numeric(18),
				@p_mont_tota	numeric(18),
				@p_tota_nofa	numeric(18),
				@p_tota_peri	numeric(18),
				@p_tota_saan	numeric(18),
				@p_tota_vapa	numeric(18),
				@p_tipo_libr  varchar(10),
				@p_nerror     varchar(1) out ,
				@p_merror     varchar(200)out )
as
begin

declare @lugar varchar(100),
	@tasa_vaag numeric(5,2),
	@mont_vaag numeric(18),
	@mont_neto numeric(18)
	--Fin Declaraciones

	set @p_nerror='N'
	set @p_merror='Proceso exitoso'
    
	--Tasa del IVA, por mientras en duro 
	set @tasa_vaag=0.19

	if (@p_tipo_libr='TOTAL' or @p_tipo_libr='FINAL') 
    	begin
		--Calculando montos relacionados IVA
		set @mont_neto=(@p_mont_tota-@p_tota_exen)/(1+@tasa_vaag)
		set @mont_vaag=@mont_neto*@tasa_vaag

		set @lugar='ins_tota_serv() Insertando lbe_serv_peri'
		insert into lbe_serv_peri (tipo_docu,
					codi_soli,
					corr_libe,
					codi_serv,
					tipo_serv,
					codi_empr,
					peri_deve,
					tota_docu,
					tota_exen,
					mont_neto,
					tasa_vaag,
					mont_vaag,
					mont_tota,
					tota_nofa,
					tota_peri,
					tota_saan,
					tota_vapa)
		values(@p_tipo_docu,
			@p_codi_soli,
			@p_corr_libe,
			@p_codi_serv,
			@p_tipo_serv,
			@p_codi_empr,
			@p_peri_deve,
			@p_tota_docu,
			@p_tota_exen,
			@mont_neto,
			@tasa_vaag,
			@mont_vaag,
			@p_mont_tota,
			@p_tota_nofa,
			@p_tota_peri,
			@p_tota_saan,
			@p_tota_vapa);
		if @@ERROR<>0 
		begin
			set @p_nerror='S'
			set @p_merror='lbe_ins_tota_serv() Error al Insertar en tabla lbe_serv_peri'
			return
		end--Fin if @@ERROR

	end --fin de if TOTAL   
	
	if (@p_tipo_libr='PARCIAL') 
	begin
	
    		set @lugar='ins_tota_serv() Insertando lbe_serv_segm';
    	
		insert into lbe_serv_segm (tipo_docu,
					codi_soli,
					corr_libe,
					codi_serv,
					tipo_serv,
					codi_empr,
					peri_deve,
					tota_docu,
					tota_exen,
					mont_tota,
					tota_nofa,
					tota_peri,
					tota_saan,
					tota_vapa)
		values(@p_tipo_docu,
			@p_codi_soli,
			@p_corr_libe,
			@p_codi_serv,
			@p_tipo_serv,
			@p_codi_empr,
			@p_peri_deve,
			@p_tota_docu,
			@p_tota_exen,
			@p_mont_tota,
			@p_tota_nofa,
			@p_tota_peri,
			@p_tota_saan,
			@p_tota_vapa)
		if @@ERROR<>0 
		begin
			set @p_nerror='S'
			set @p_merror='lbe_ins_tota_serv() Error al Insertar en tabla lbe_serv_segm'
			return
		end--Fin if @@ERROR
			
	end--fin tipo_libro PARCIAL
	

end--Fin procedimiento
GO

GO
--SqlScripter----[dbo].[lbe_ins_tota_tipo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[lbe_ins_tota_tipo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[lbe_ins_tota_tipo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[lbe_ins_tota_tipo]
(@p_codi_soli numeric(22),
				@p_corr_libe numeric(22),
				@p_tipo_docu numeric(3),
				@p_codi_empr numeric(10),
				@p_cant_foan numeric(10),
				@p_tipo_envi varchar(10),
				@p_nerror     varchar(1) out,
				@p_merror     varchar(200) out ) as 
declare @lugar varchar(100)
begin
	set @p_nerror='N'
	set @p_merror='Proceso exitoso';
            								 
     	if @p_tipo_envi='PARCIAL'
	begin
		set @lugar='lbe_ins_tota_tipo() Ins. lbe_tota_segm'
		--print @lugar
		insert into lbe_tota_segm (codi_soli,corr_libe,tipo_docu,codi_empr,cant_foan) 
		values  (@p_codi_soli,@p_corr_libe,@p_tipo_docu,@p_codi_empr,@p_cant_foan);
		if @@ERROR<>0
		begin
			set @p_nerror='S'
			set @p_merror='lbe_ins_tota_tipo() Error al insertar en lbe_tota_segm'
			return
		end
	end
     
	if @p_tipo_envi='TOTAL' or @p_tipo_envi='FINAL'
	begin
		set @lugar='lbe_ins_tota_tipo() Ins.  lbe_tota_peri'; 
		print @lugar
		insert into lbe_tota_peri (codi_soli,corr_libe,tipo_docu,codi_empr,cant_foan) 
		values  (@p_codi_soli,@p_corr_libe,@p_tipo_docu,@p_codi_empr,@p_cant_foan);
		if @@ERROR<>0
			begin
				set @p_nerror='S'
				set @p_merror='lbe_ins_tota_tipo() Error al insertar en lbe_tota_segm'
				return
			end--fin de if @@ERROR
	end
end
GO

GO
--SqlScripter----[dbo].[lbe_serv_final].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[lbe_serv_final]') IS NULL EXEC('CREATE PROCEDURE [dbo].[lbe_serv_final] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[lbe_serv_final]
(@p_codi_soli  numeric(22),
				@p_codi_empr numeric(10),
				@p_corr_libr numeric(22),
				@p_nerror    varchar(1) out ,
				@p_merror    varchar(200) out )
as
begin

declare cur_serv_segm cursor for  
	select codi_soli,
	   codi_empr,
	   tipo_docu,      
	   tipo_serv,
	   peri_deve,      
	   sum(tota_docu),      
	   sum(tota_exen),      
	   sum(mont_tota),      
	   sum(tota_nofa),      
	   sum(tota_peri),      
	   sum(tota_saan),      
	   sum(tota_vapa) 
	from lbe_serv_segm
	where codi_soli=@p_codi_soli
	group by codi_empr,codi_soli,tipo_docu,tipo_serv,peri_deve
	--Fin cursor de Totales Finales

	
declare @aux_codi_serv numeric(2),
        @aux_codi_empr numeric(2),
	@aux_codi_soli numeric(22),
	@aux_peri_deve varchar(7),
	@aux_tasa_vaag numeric(5,2),
	@aux_mont_vaag numeric(18),
	@aux_mont_neto numeric(18),
	@aux_tipo_serv numeric(3),
	@aux_tota_docu numeric(18),      
	@aux_tota_exen numeric(18),
	@aux_mont_tota numeric(18),      
	@aux_tota_nofa numeric(18),      
	@aux_tota_peri numeric(18),      
	@aux_tota_saan numeric(18),      
	@aux_tota_vapa numeric(18),
	@aux_tipo_docu numeric(10)
	--fin declaracion 

	OPEN cur_serv_segm
	FETCH NEXT FROM cur_serv_segm
	into	@aux_codi_soli,
	   @aux_codi_empr,
	   @aux_tipo_docu,      
	   @aux_tipo_serv,
	   @aux_peri_deve,      
	   @aux_tota_docu,      
	   @aux_tota_exen,      
	   @aux_mont_tota,      
	   @aux_tota_nofa,      
	   @aux_tota_peri,      
	   @aux_tota_saan,      
	   @aux_tota_vapa 

	set @aux_codi_serv=0
	while @@FETCH_STATUS=0
	begin
	set @aux_codi_serv=@aux_codi_serv+1
	execute lbe_ins_tota_serv @p_codi_empr,@p_codi_soli,@p_corr_libr,
				  @aux_tipo_docu,@aux_codi_serv,      
				  @aux_tipo_serv,
				  @aux_peri_deve,
				  @aux_tota_docu,      
				  @aux_tota_exen,
				  @aux_mont_tota,      
				  @aux_tota_nofa,      
				  @aux_tota_peri,      
				  @aux_tota_saan,      
				  @aux_tota_vapa ,
				  'FINAL',
			          @p_nerror,
				  @p_merror
	if (@p_nerror='S')
		return
	FETCH NEXT FROM cur_serv_segm
	into	@aux_codi_soli,
	   @aux_codi_empr,
	   @aux_tipo_docu,      
	   @aux_tipo_serv,
	   @aux_peri_deve,      
	   @aux_tota_docu,      
	   @aux_tota_exen,      
	   @aux_mont_tota,      
	   @aux_tota_nofa,      
	   @aux_tota_peri,      
	   @aux_tota_saan,      
	   @aux_tota_vapa 
	end
	
	CLOSE cur_serv_segm
	DEALLOCATE cur_serv_segm
	


end
GO

GO
--SqlScripter----[dbo].[lbe_tras_deta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[lbe_tras_deta]') IS NULL EXEC('CREATE PROCEDURE [dbo].[lbe_tras_deta] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[lbe_tras_deta]
(@p_codi_soli   numeric,
					@p_codi_empr   numeric,
					@p_corr_libr   numeric,
					@p_peri_desd   varchar(10),
					@p_peri_hast   varchar(10),
					@p_rutt_rece   numeric(10),
					@p_mont_mini   numeric(18) , 
					@p_max_dte     numeric(10),
					@p_nerror      varchar(1) output,
           				@p_merror      varchar(500) output) 

as
begin
declare @lugar	varchar(200),   
	@aux_num_dte	numeric(10),
	@aux_corr_libe   numeric(22),
	@aux_codi_soli   numeric(22),
	@aux_tipo_docu   numeric(3),
	@aux_foli_docu   numeric(10),
	@aux_tipo_serv   numeric(2),
	@aux_codi_empr   numeric(9),
	@aux_foli_anul   numeric(1),
	@aux_fech_emis   varchar(10),
	@aux_fech_venc   varchar(10),
	@aux_peri_desd   varchar(10),
	@aux_peri_hast   varchar(10),
	@aux_codi_sucu   numeric(8),
	@aux_rutt_asoc   numeric(9),
	@aux_digi_asoc   varchar(1),
	@aux_codi_incl   varchar(80),
	@aux_mont_exen   numeric(18),
	@aux_mont_tota   numeric(18),
	@aux_mont_nofa   numeric(18),
	@aux_mont_peri   numeric(18),
	@aux_tota_saan   numeric(18),
	@aux_tota_vapa   numeric(18),
	@cont_docu	int

	set @cont_docu=0
	
declare cur_dte_enca_docu cursor for
	select  tipo_docu,
		foli_docu,
		0 as foli_nulo,--El folio no es nulo
		vent_serv,
		fech_emis,
		fech_venc,
		peri_desd,
		peri_hast,
		codi_sucu,
		rutt_rece,
		digi_rece,
		codi_rece,
		mont_exen,
		mont_tota,
		mont_nofa,
		subt_vese, 
		sald_ante,
		valo_paga
	from dte_enca_docu a
	where codi_empr=@p_codi_empr
	AND   isnull(fech_emis,'1000-01-01')>=isnull(@p_peri_desd,isnull(fech_emis,'1000-01-01'))
	AND   isnull(fech_emis,'9999-99-99')<=isnull(@p_peri_hast,isnull(fech_emis,'9999-99-99'))
	AND   isnull(rutt_rece,0)=isnull(@p_rutt_rece,isnull(rutt_rece,0))
	AND   isnull(mont_tota,0) >= isnull(@p_mont_mini,isnull(mont_tota,0)) 
	AND   NOT EXISTS (select 1 from lbe_deta_docu b 
			  where a.tipo_docu=b.tipo_docu
			  AND	a.foli_docu=b.foli_docu
			  AND	a.codi_empr=b.codi_empr
			  AND	b.codi_soli=@p_codi_soli)
	AND  exists (select 1 
	from dte_tipo_docu c 
	where a.tipo_docu=c.tipo_docu 
	and c.bole_elec='S')

	set @p_nerror='N'
	set @p_merror='Proceso Existoso'

	set @aux_codi_soli=@p_codi_soli
	set @aux_corr_libe=@p_corr_libr
	set @aux_codi_empr=@p_codi_empr
	
		
	OPEN cur_dte_enca_docu

	FETCH NEXT FROM cur_dte_enca_docu
	into @aux_tipo_docu,
		@aux_foli_docu,
		@aux_foli_anul,
		@aux_tipo_serv,
		@aux_fech_emis,
		@aux_fech_venc,
		@aux_peri_desd,
		@aux_peri_hast,
		@aux_codi_sucu,
		@aux_rutt_asoc,
		@aux_digi_asoc,
		@aux_codi_incl,
		@aux_mont_exen,
		@aux_mont_tota,
		@aux_mont_nofa,
		@aux_mont_peri,
		@aux_tota_saan,
		@aux_tota_vapa
	--print 'fecth 1'
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
	    --
		--consultando si se han procesado los documentos
		print @p_max_dte
		if (@p_max_dte>0) and  (@cont_docu>=@p_max_dte)
			break --saliendo del loop
	
		insert into lbe_deta_docu(corr_libe,
				codi_soli,
				tipo_docu,
				foli_docu,
				tipo_serv,
				codi_empr,
				foli_anul,
				fech_emis,
				fech_venc,
				peri_desd,
				peri_hast,
				codi_sucu,
				rutt_asoc,
				digi_asoc,
				codi_incl,
				mont_exen,
				mont_tota,
				mont_nofa,
				mont_peri,
				tota_saan,
				tota_vapa)
				values(@aux_corr_libe,
				       @aux_codi_soli,
				       @aux_tipo_docu,
				       @aux_foli_docu,
				       @aux_tipo_serv,
				       @aux_codi_empr,
				       @aux_foli_anul,
				       @aux_fech_emis,
				       @aux_fech_venc,
				       @aux_peri_desd,
				       @aux_peri_hast,
				       @aux_codi_sucu,
				       @aux_rutt_asoc,
				       @aux_digi_asoc,
				       @aux_codi_incl,
				       @aux_mont_exen,
				       @aux_mont_tota,
				       @aux_mont_nofa,
				       @aux_mont_peri,
				       @aux_tota_saan,
				       @aux_tota_vapa )
		
		--Aumentando la cantidad de detalles insertados
		set @cont_docu=@cont_docu+1

		--print 'Detalle num'
		--print @cont_docu
		FETCH NEXT FROM cur_dte_enca_docu
	    	into @aux_tipo_docu,
		@aux_foli_docu,
		@aux_foli_anul,
		@aux_tipo_serv,
		@aux_fech_emis,
		@aux_fech_venc,
		@aux_peri_desd,
		@aux_peri_hast,
		@aux_codi_sucu,
		@aux_rutt_asoc,
		@aux_digi_asoc,
		@aux_codi_incl,
		@aux_mont_exen,
		@aux_mont_tota,
		@aux_mont_nofa,
		@aux_mont_peri,
		@aux_tota_saan,
		@aux_tota_vapa

				
	END--fin de while 
	--cerrando cursor
	CLOSE cur_dte_enca_docu
	DEALLOCATE cur_dte_enca_docu
	set @lugar= 'se han insertado : ' + convert(varchar(10), @cont_docu) +'Documentos (detalles)'

	
end
GO

GO
--SqlScripter----[dbo].[LCE_XML_ENVI].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[LCE_XML_ENVI]') IS NULL EXEC('CREATE PROCEDURE [dbo].[LCE_XML_ENVI] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[LCE_XML_ENVI]
@CORR_ENVI NUMERIC(9),
								  @ARCH_ENVI TEXT, 
								  @CODI_ERRO VARCHAR(3) OUTPUT,
								  @MENS_ERRO VARCHAR(500) OUTPUT AS

DECLARE @ptrval binary(16)
	

BEGIN

	SET @CODI_ERRO = 'N'
	SET @MENS_ERRO = 'Proceso insercion de xml de envios ok'
	
	SELECT @ptrval = TEXTPTR(arch_envi)
	FROM LCE_ENVI_LIBR
	WHERE CORR_ENVI = @corr_envi
	UPDATETEXT LCE_ENVI_LIBR.ARCH_ENVI @ptrval NULL 0 @arch_envi
	
	IF (@@ERROR <> 0)
	BEGIN
	  	SET @CODI_ERRO = 'S'
		SET @MENS_ERRO = 'Error: '+ convert(varchar, @@ERROR)
	END
	
END
GO

GO
--SqlScripter----[dbo].[limpia_dbq_arch_clob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[limpia_dbq_arch_clob]') IS NULL EXEC('CREATE PROCEDURE [dbo].[limpia_dbq_arch_clob] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[limpia_dbq_arch_clob]
(@test int = 0) as
BEGIN
    declare @v_tota_grpo numeric
    declare @v_cant_grpo numeric
    declare @t_cant_grpo numeric
    declare @v_regi_grpo numeric

    declare @v_tota_arch numeric
    declare @v_cant_arch numeric
    declare @t_cant_arch numeric
    declare @v_regi_arch numeric
    
    declare @v_cant_regi numeric
    
    SET @v_cant_grpo=0
    SET @t_cant_grpo=0
    
    SET @v_cant_arch=0
    SET @t_cant_arch=0

    delete DBN_LIMP_GRPO
    delete DBN_LIMP_ARCH
    delete DBN_LIMP_LOGG

    EXEC limpia_put_log 'INICIO'
    
    /**************************************************************************************************************************/
    /************************** Borrar Archivos recibidos Anteriores a un mes que no sean .xml ********************************/
    /**************************************************************************************************************************/
    EXEC limpia_put_log 'ETAPA 1:Borrar archivos recibidos anteriores a un mes que no sean .XML'
    EXEC limpia_put_log '*PASO 1:Insercion'

    -- Inserta para eliminar todos los grupos tienen archivos distintos a XML
    INSERT INTO  DBN_LIMP_GRPO (codi_grpo, grpo_limp) 
        SELECT DISTINCT codi_grpo,
               ROUND(ROW_NUMBER() OVER(ORDER BY TMST_REGI_ARCH)/100000,0)+1
        FROM   DBQ_ARCH WITH (INDEX(DBQ_ARCH_LIMPIA))
        WHERE  esta_arch = 'ENV'
        AND    TMST_REGI_ARCH < GETDATE() - 30
        AND    nomb_arch not like '%.xml%'
        AND    nomb_arch not like '%.XML%'
        AND    codi_grpo is not null
        
    -- Excluye los grupos que tienen adicionalmente archivos XML
    DELETE DBN_LIMP_GRPO
    WHERE  EXISTS (SELECT 1
                   FROM   DBQ_ARCH A
                   WHERE  A.codi_grpo = DBN_LIMP_GRPO.codi_grpo 
                   AND    A.nomb_arch like '%.xml%')
                   
    -- Inserta para eliminar todos los archivos distintos a XML
    INSERT INTO  DBN_LIMP_ARCH (codi_arch, grpo_limp) 
        SELECT codi_arch,
               ROUND(ROW_NUMBER() OVER(ORDER BY TMST_REGI_ARCH)/100000,0)+1
        FROM   DBQ_ARCH WITH (INDEX(DBQ_ARCH_LIMPIA))
        WHERE  esta_arch = 'ENV'
        AND    TMST_REGI_ARCH < GETDATE() - 30
        AND    nomb_arch not like '%.xml%'
        AND    nomb_arch not like '%.XML%'
        
    SELECT @v_cant_grpo = MAX(GRPO_LIMP), @v_regi_grpo = COUNT(*) FROM DBN_LIMP_GRPO
    SELECT @v_cant_arch = MAX(GRPO_LIMP), @v_regi_arch = COUNT(*) FROM DBN_LIMP_ARCH
    
    EXEC limpia_put_log '*PASO 2: Eliminacion DBQ_ARCH ', @v_regi_arch
    SET @t_cant_arch = 0
    WHILE @t_cant_arch <= @v_cant_arch
    BEGIN
        SET @t_cant_arch =  @t_cant_arch + 1
        IF (@test = 0)
        BEGIN
            DELETE DBQ_ARCH_CLOB WHERE EXISTS (SELECT 1 FROM DBN_LIMP_ARCH L WHERE L.GRPO_LIMP = @t_cant_arch AND L.CODI_ARCH = DBQ_ARCH_CLOB.CODI_ARCH)
            DELETE DBQ_ARCH WHERE EXISTS (SELECT 1 FROM DBN_LIMP_ARCH L WHERE L.GRPO_LIMP = @t_cant_arch AND L.CODI_ARCH = DBQ_ARCH.CODI_ARCH)
        END
        DELETE DBN_LIMP_ARCH WHERE GRPO_LIMP = @t_cant_arch
    END

    EXEC limpia_put_log '*PASO 3: Eliminacion DBQ_GRPO ', @v_regi_grpo
    SET @t_cant_grpo = 0
    WHILE @t_cant_grpo <= @v_cant_grpo
    BEGIN
        SET @t_cant_grpo =  @t_cant_grpo + 1
        IF (@test = 0)
        BEGIN
            DELETE DBQ_GRPO WHERE  EXISTS (SELECT 1 FROM DBN_LIMP_GRPO L WHERE L.GRPO_LIMP = @t_cant_grpo AND L.CODI_GRPO = DBQ_GRPO.CODI_GRPO)
        END
        DELETE DBN_LIMP_GRPO WHERE GRPO_LIMP = @t_cant_grpo
    END
    
    /**************************************************************************************************************************/
    /************************** Borrar Archivos PDF enviados a Clientes de mas de 30 dias**************************************/
    /**************************************************************************************************************************/
    EXEC limpia_put_log 'ETAPA 2:Borrar Archivos PDF enviados a Clientes de mas de 30 dias'
    EXEC limpia_put_log '*PASO 1:Insercion'

    -- Inserta para eliminar todos los grupos tienen archivos PDF enviados a Clientes de mas de 30 dias
    INSERT INTO  DBN_LIMP_GRPO (codi_grpo, grpo_limp) 
        SELECT DISTINCT codi_grpo,
               ROUND(ROW_NUMBER() OVER(ORDER BY TMST_REGI_ARCH)/100000,0)+1
        FROM   DBQ_ARCH WITH (INDEX(DBQ_ARCH_LIMPIA))
        WHERE  CODI_SERV = 'dbq_envi_mail'
        AND    NOMB_ARCH like '%.pdf%'
        AND    ESTA_ARCH = 'ING'
        AND    TMST_REGI_ARCH < GETDATE() - 30
        AND    CODI_GRPO is not null
        
    -- Excluye los grupos que tienen adicionalmente otros archivos, distintos a PDF
    DELETE DBN_LIMP_GRPO
    WHERE  EXISTS (SELECT 1
        FROM   DBQ_ARCH A
        WHERE  A.codi_grpo = DBN_LIMP_GRPO.codi_grpo 
        AND    A.nomb_arch not like '%.pdf%' 
        AND    A.nomb_arch not like '%.PDF%')

    -- Inserta para eliminar todos los tienen archivos PDF enviados a Clientes de mas de 30 dias
    INSERT INTO  DBN_LIMP_ARCH (codi_arch, grpo_limp) 
    SELECT codi_arch,
           ROUND(ROW_NUMBER() OVER(ORDER BY TMST_REGI_ARCH)/100000,0)+1
    FROM   DBQ_ARCH WITH (INDEX(DBQ_ARCH_LIMPIA))
    WHERE  CODI_SERV = 'dbq_envi_mail'
    AND    NOMB_ARCH like '%.pdf%'
    AND    ESTA_ARCH = 'ING'
    AND    TMST_REGI_ARCH < GETDATE() - 30        

    SELECT @v_cant_grpo = MAX(GRPO_LIMP), @v_regi_grpo = COUNT(*) FROM DBN_LIMP_GRPO
    SELECT @v_cant_arch = MAX(GRPO_LIMP), @v_regi_arch = COUNT(*) FROM DBN_LIMP_ARCH
    
    EXEC limpia_put_log '*PASO 2: Eliminacion DBQ_ARCH ', @v_regi_arch
    SET @t_cant_arch = 0
    WHILE @t_cant_arch <= @v_cant_arch
    BEGIN
        SET @t_cant_arch =  @t_cant_arch + 1
        IF (@test = 0)
        BEGIN
           DELETE DBQ_ARCH_CLOB WHERE EXISTS (SELECT 1 FROM DBN_LIMP_ARCH L WHERE L.GRPO_LIMP = @t_cant_arch AND L.CODI_ARCH = DBQ_ARCH_CLOB.CODI_ARCH)
           DELETE DBQ_ARCH WHERE EXISTS (SELECT 1 FROM DBN_LIMP_ARCH L WHERE L.GRPO_LIMP = @t_cant_arch AND L.CODI_ARCH = DBQ_ARCH.CODI_ARCH)
        END
        DELETE DBN_LIMP_ARCH WHERE GRPO_LIMP = @t_cant_arch
    END

    EXEC limpia_put_log '*PASO 3: Eliminacion DBQ_GRPO ', @v_regi_grpo
    SET @t_cant_grpo = 0
    WHILE @t_cant_grpo <= @v_cant_grpo
    BEGIN
        SET @t_cant_grpo =  @t_cant_grpo + 1
        IF (@test = 0)
        BEGIN
           DELETE DBQ_GRPO WHERE  EXISTS (SELECT 1 FROM DBN_LIMP_GRPO L WHERE L.GRPO_LIMP = @t_cant_grpo AND L.CODI_GRPO = DBQ_GRPO.CODI_GRPO);
        END
        DELETE DBN_LIMP_GRPO WHERE GRPO_LIMP = @t_cant_grpo
    END
    
    /**************************************************************************************************************************/
    /************************** Borrar Envios al SII mayores a seis meses *****************************************************/
    /**************************************************************************************************************************/
    EXEC limpia_put_log 'ETAPA 3:Borrar Envios al SII mayores a seis meses'
    EXEC limpia_put_log '*PASO 1:Insercion'

    -- Inserta para eliminar todos los grupos tienen archivos de envio al SII mayores a seis meses
    INSERT INTO  DBN_LIMP_GRPO (codi_grpo, grpo_limp) 
        SELECT DISTINCT codi_grpo,
               ROUND(ROW_NUMBER() OVER(ORDER BY TMST_REGI_ARCH)/100000,0)+1
        FROM   DBQ_ARCH WITH (INDEX(DBQ_ARCH_LIMPIA))
        WHERE  CODI_SERV = 'dte_upld_sii'
        AND    ESTA_ARCH = 'ENV'
        AND    TMST_REGI_ARCH < GETDATE() - 180
        AND    codi_grpo is not null
        
    -- Inserta para eliminar todos los tienen archivos PDF enviados a Clientes de mas de 30 dias
    INSERT INTO  DBN_LIMP_ARCH (codi_arch, grpo_limp) 
        SELECT CODI_ARCH,
               ROUND(ROW_NUMBER() OVER(ORDER BY TMST_REGI_ARCH)/100000,0)+1
        FROM   DBQ_ARCH WITH (INDEX(DBQ_ARCH_LIMPIA))
        WHERE  CODI_SERV = 'dte_upld_sii'
        AND    ESTA_ARCH = 'ENV'
        AND    TMST_REGI_ARCH < GETDATE() - 180
                
    SELECT @v_cant_grpo = MAX(GRPO_LIMP), @v_regi_grpo = COUNT(*) FROM DBN_LIMP_GRPO
    SELECT @v_cant_arch = MAX(GRPO_LIMP), @v_regi_arch = COUNT(*) FROM DBN_LIMP_ARCH
    
    EXEC limpia_put_log '*PASO 2: Eliminacion DBQ_ARCH ', @v_regi_arch
    SET @t_cant_arch = 0
    WHILE @t_cant_arch <= @v_cant_arch
    BEGIN
        SET @t_cant_arch =  @t_cant_arch + 1
        IF (@test = 0)
        BEGIN
           DELETE DBQ_ARCH_CLOB WHERE EXISTS (SELECT 1 FROM DBN_LIMP_ARCH L WHERE L.GRPO_LIMP = @t_cant_arch AND L.CODI_ARCH = DBQ_ARCH_CLOB.CODI_ARCH)
           DELETE DBQ_ARCH WHERE EXISTS (SELECT 1 FROM DBN_LIMP_ARCH L WHERE L.GRPO_LIMP = @t_cant_arch AND L.CODI_ARCH = DBQ_ARCH.CODI_ARCH)
        END
        DELETE DBN_LIMP_ARCH WHERE GRPO_LIMP = @t_cant_arch
    END

    EXEC limpia_put_log '*PASO 3: Eliminacion DBQ_GRPO ', @v_regi_grpo
    SET @t_cant_grpo = 0
    WHILE @t_cant_grpo <= @v_cant_grpo
    BEGIN
        SET @t_cant_grpo =  @t_cant_grpo + 1
        IF (@test = 0)
        BEGIN
           DELETE DBQ_GRPO WHERE  EXISTS (SELECT 1 FROM DBN_LIMP_GRPO L WHERE L.GRPO_LIMP = @t_cant_grpo AND L.CODI_GRPO = DBQ_GRPO.CODI_GRPO);
        END
        DELETE DBN_LIMP_GRPO WHERE GRPO_LIMP = @t_cant_grpo
    END
    
    /**************************************************************************************************************************/
    /************************** Eliminacion DBN_LOG_50 ************************************************************************/
    /**************************************************************************************************************************/
    SELECT @v_cant_regi = COUNT(*) FROM DBN_LOG_50 WITH (INDEX(DBN_LOG_50_LIMPIA)) WHERE TMST_REGI_LOGG < GETDATE() - 180
    EXEC limpia_put_log 'ETAPA 4: Eliminacion DBN_LOG_50', @v_cant_regi
    
    IF (@test = 0)
    BEGIN
        DELETE DBN_LOG_50 FROM DBN_LOG_50 WITH (INDEX(DBN_LOG_50_LIMPIA))
        WHERE  TMST_REGI_LOGG < GETDATE() - 180
    END
  
    /**************************************************************************************************************************/
    /************************** Eliminacion DBQ_ERRO **************************************************************************/
    /**************************************************************************************************************************/
    SELECT @v_cant_regi = COUNT(*) FROM DBQ_ERRO WHERE TMST_ERRO < GETDATE() - 180
    EXEC limpia_put_log 'ETAPA 5: Eliminacion DBQ_ERRO', @v_cant_regi
   
    IF (@test = 0)
    BEGIN
        DELETE DBQ_ERRO
        WHERE  TMST_ERRO < GETDATE() - 180
    END
    
    /**************************************************************************************************************************/
    /************************** Eliminacion QSE_DOCU_SERV *********************************************************************/
    /**************************************************************************************************************************/
    SELECT @v_cant_regi = COUNT(*) FROM QSE_DOCU_SERV WITH (INDEX(QSE_DOCU_SERV_LIMPIA)) WHERE  ESTA_PROC = 'ENV' AND TIME_PROC < GETDATE() - 30
    EXEC limpia_put_log 'ETAPA 6: Eliminacion QSE_DOCU_SERV', @v_cant_regi
    
    IF (@test = 0)
    BEGIN
        DELETE QSE_DOCU_SERV FROM QSE_DOCU_SERV WITH (INDEX(QSE_DOCU_SERV_LIMPIA))
        WHERE  ESTA_PROC = 'ENV'
        AND    TIME_PROC < GETDATE() - 30
    END
    
    /**************************************************************************************************************************/
    /************************** Eliminacion DBQ_GRPO sin archivos *************************************************************/
    /**************************************************************************************************************************/
    SELECT @v_cant_regi = COUNT(*) 
    FROM DBQ_GRPO
    WHERE  CODI_SERV IN ('dte_upld_sii', 'dbq_envi_mail', 'dbq_read_mail')
    AND    TMST_REGI_GRPO < GETDATE() - 30
    AND    NOT EXISTS (SELECT 1 from DBQ_ARCH B WHERE B.CODI_GRPO = DBQ_GRPO.CODI_GRPO)
    
    EXEC limpia_put_log 'ETAPA 7: Eliminacion DBQ_GRPO sin archivos', @v_cant_regi
    IF (@test = 0)
    BEGIN
        DELETE DBQ_GRPO
        WHERE  CODI_SERV IN ('dte_upld_sii', 'dbq_envi_mail', 'dbq_read_mail')
        AND    TMST_REGI_GRPO < GETDATE() - 30
        AND    NOT EXISTS (SELECT 1 from DBQ_ARCH B WHERE B.CODI_GRPO = DBQ_GRPO.CODI_GRPO)
    END
   
    /**************************************************************************************************************************/
    /************************** Eliminacion DBN_MONI_PROC de procesos detenidos más de 5 días *********************************/
    /**************************************************************************************************************************/
    SELECT @v_cant_regi = COUNT(*) FROM DBN_MONI_PROC WHERE  MOPR_ESTA_INST IN ('ERR','STOP','KILL') AND MOPR_FECH_REPO < GETDATE() - 5
    
    EXEC limpia_put_log 'ETAPA 8: Eliminacion DBN_MONI_PROC de procesos detenidos más de 5 días', @v_cant_regi
    IF (@test = 0)
    BEGIN
        DELETE DBN_MONI_PROC 
        WHERE  MOPR_ESTA_INST IN ('ERR','STOP','KILL')
        AND    MOPR_FECH_REPO < GETDATE() - 5
    END

    EXEC limpia_put_log 'FIN'
END
GO

GO
--SqlScripter----[dbo].[limpia_put_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[limpia_put_log]') IS NULL EXEC('CREATE PROCEDURE [dbo].[limpia_put_log] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[limpia_put_log]
(@str varchar(512), @cant numeric = -1) AS
begin
	declare @v_sequ_logg numeric, @v_corr_logg numeric
	declare @v_fech_logg varchar(22)

	select @v_corr_logg = isnull(max(corr_logg),0) from dbn_limp_logg
	if (@str = 'INICIO' or @v_corr_logg=0)
		set @v_corr_logg = @v_corr_logg + 1
		
	select @v_sequ_logg = count(*) from dbn_limp_logg where corr_logg = @v_corr_logg
		
	set @v_sequ_logg = isnull(@v_sequ_logg,0) + 1
	set @v_fech_logg = convert(varchar(20), getdate(),120) + ' ' + dbo.lpad(@v_sequ_logg,2,'0')
		
	if @cant != -1
		set @str = @str + ' ' + convert(varchar(10),@cant)
	insert into dbn_limp_logg(corr_logg, fech_logg, mens_logg) values (@v_corr_logg, @v_fech_logg, @str)
	print(@v_fech_logg + ' ' + @str)
end
GO

GO
--SqlScripter----[dbo].[LV_ERR_CARG].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[LV_ERR_CARG]') IS NULL EXEC('CREATE PROCEDURE [dbo].[LV_ERR_CARG] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[LV_ERR_CARG]
AS
--SP1 SE 5.2
     SELECT '' as codigo ,' Seleccione Error' as valor
     union
     SELECT '' as codigo ,' Sin Descripcion de Error' as valor
     union
     select distinct a.ulti_erro as codigo,a.ulti_erro as valor
     from   dbq_arch a
     where  a.esta_arch <> 'ENV'                      
     and    a.ulti_erro <> ''
GO

GO
--SqlScripter----[dbo].[LV_ORIGEN].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[LV_ORIGEN]') IS NULL EXEC('CREATE PROCEDURE [dbo].[LV_ORIGEN] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[LV_ORIGEN]
AS
--SP1 SE 5.2
     SELECT '' as codigo ,' Seleccione Remitente' as valor from dual
     union
     SELECT ' ' as codigo ,' Sin Remitente' as valor from dual
     union
     select distinct orig_grpo as codigo, orig_grpo as valor
     from   dbq_grp_arch_serv
     where  orig_grpo <> ''
     order by 1 asc
GO

GO
--SqlScripter----[dbo].[LV_SERVICIO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[LV_SERVICIO]') IS NULL EXEC('CREATE PROCEDURE [dbo].[LV_SERVICIO] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[LV_SERVICIO]
AS
--SP1 SE 5.2
     SELECT '' as codigo ,' Seleccione Proceso' as valor from dual
     union
     select distinct desc_serv as codigo, desc_serv as valor
     from dbq_grp_arch_serv
GO

GO
--SqlScripter----[dbo].[PAEM_GET_VAL].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PAEM_GET_VAL]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PAEM_GET_VAL] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PAEM_GET_VAL]
@PAEM_CODI_EMPR numeric(10),
         @PAEM_TIPO_COMO VARCHAR(3),
         @PAEM_CODI_PAEM VARCHAR(4),
         @PAEM_VALO_PAEM VARCHAR(30) OUTPUT,
         @EXISTE  VARCHAR(1) OUTPUT,
         @MENSAJE VARCHAR(80) OUTPUT
      AS
 BEGIN
   set  @EXISTE='S'
   set @MENSAJE =null
      select @PAEM_VALO_PAEM=VALO_PAEM
        from PARA_EMPR
       where CODI_EMPR=@PAEM_CODI_EMPR
         AND TIPO_COMO=@PAEM_TIPO_COMO
         AND CODI_PAEM=@PAEM_CODI_PAEM
    IF (@@ERROR <> 0)
     begin
      set @EXISTE='N'
      set @MENSAJE='Parametro de Empresa '+@PAEM_TIPO_COMO+
                    '-'+@PAEM_CODI_PAEM+' no Existe'
     end
 END
GO

GO
--SqlScripter----[dbo].[pape_get_val].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[pape_get_val]') IS NULL EXEC('CREATE PROCEDURE [dbo].[pape_get_val] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[pape_get_val]
(
             	@PAPE_CODI_EMPR  NUMERIC(3),
                @PAPE_CODI_PERS  VARCHAR(16),
                @PAPE_TIPO_COMO  VARCHAR(3),
                @PAPE_CODI_PAPE  VARCHAR(4),
                @PAPE_VALO_PAPE  VARCHAR(30) OUTPUT,
                @p_existe VARCHAR(1) OUTPUT,
                @p_mensaje VARCHAR(200)OUTPUT ) 
AS
declare
	@existe1 varchar(1),
        @mensaje1 varchar(80)
               /* HYPER*Forms: Descriptor de entidad */
BEGIN
	set @p_existe 	= 'S'	
	set @p_mensaje	= ''               
	

	select @PAPE_VALO_PAPE=VALO_PAPE
        from PARA_PERS
        where CODI_EMPR=@PAPE_CODI_EMPR
        AND CODI_PERS=@PAPE_CODI_PERS
        AND TIPO_COMO=@PAPE_TIPO_COMO
        AND CODI_PAPE=@PAPE_CODI_PAPE;

	IF (@@ERROR <> 0)
	begin
		execute PAEM_GET_VAL 	@PAPE_CODI_EMPR,@PAPE_TIPO_COMO,@PAPE_CODI_PAPE,
                     			@PAPE_VALO_PAPE out,@existe1 out, @mensaje1 out 

	        return
        end

END;
GO

GO
--SqlScripter----[dbo].[PARA_GET_VAL].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PARA_GET_VAL]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PARA_GET_VAL] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PARA_GET_VAL]
@PAEM_CODI_PAEM varchar(30),
     @PAEM_VALO_PAEM  varchar(100) output,
     @EXISTE varchar(1)  output, @MENSAJE  varchar(80) output
   AS
BEGIN
   set @EXISTE ='S'
   set @MENSAJE =''
   select @PAEM_VALO_PAEM=PARAM_VALUE
     from  SYS_PARAM
    where  PARAM_NAME=@PAEM_CODI_PAEM
  if @@rowcount=0 
    begin
    set  @EXISTE  ='N'
    set  @MENSAJE ='Parametro '+@PAEM_CODI_PAEM+' no Existe'
    end
  else
    begin
     set @EXISTE ='S'
     set @MENSAJE ='Codigo correcto'
    end
END
GO

GO
--SqlScripter----[dbo].[PRC_ACTU_DOCU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_ACTU_DOCU]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_ACTU_DOCU] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_ACTU_DOCU]
@P_CORR NUMeric,@P_WHERE VARCHAR,
						@P_CODI_ERRO varchar output,
						@P_MENS_ERRO varchar output
AS

/* objetivo : Actualizar todos los registro de DTE_ENCA_DOCU que cumplan con el where.
   Autor 	: Maximiliano Nu±ez S.
   Fecha 	: 01/06/2007
   OT 		: 325513 - Respaldo a historico y recuperacion */
   
declare @SENT_SQL varchar(1000)
declare @v_codi_erro varchar(1)
declare @v_mens_erro varchar(100)   
   
BEGIN		
	set @v_CODI_ERRO = 'N'
	set @v_MENS_ERRO = ' '	
	
	BEGIN
		BEGIN TRANSACTION		
			SELECT @SENT_SQL = 'UPDATE DTE_ENCA_DOCU SET CORR_EXTR = '+ convert(varchar,@P_CORR) +' WHERE '+@P_WHERE
			EXEC (@SENT_SQL)
			COMMIT
			IF @@TRANCOUNT > 0 
			begin
				ROLLBACK
				set @v_CODI_ERRO = 'S'
				set @v_MENS_ERRO = 'Error al actualizar en DTE_ENCA_DOCU.'
			end
		
	END
	set @p_codi_erro = @v_codi_erro
	set @p_mens_erro = @v_mens_erro
END
GO

GO
--SqlScripter----[dbo].[PRC_ACTU_ENVI_DOCU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_ACTU_ENVI_DOCU]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_ACTU_ENVI_DOCU] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_ACTU_ENVI_DOCU]
(@CORR_ENVI NUMERIC(9),
					@CANT_DOCU NUMERIC(9) OUT)

AS

BEGIN
	Declare @P_CORR_ENVI numeric(9)
	SET @P_CORR_ENVI = @CORR_ENVI 
	BEGIN
	UPDATE DTE_ENCA_DOCU 
	SET CORR_ENVI = NULL,ESTA_DOCU = 'ESP'
	WHERE  CORR_ENVI = @CORR_ENVI 
	AND EXISTS (SELECT 1
				FROM DTE_DOCU_REFE DR,
					 DTE_TIPO_DOCU TD,
					 DTE_ENCA_DOCU ED
				WHERE DR.CODI_EMPR = DTE_ENCA_DOCU.CODI_EMPR
				AND   DR.TIPO_DOCU = DTE_ENCA_DOCU.TIPO_DOCU
				AND   DR.FOLI_DOCU = DTE_ENCA_DOCU.FOLI_DOCU
				AND   convert(varchar,TD.TIPO_DOCU) = DR.TIPO_REFE
				AND   TD.DOCU_ELEC = 'S'
				AND   ED.CODI_EMPR = DR.CODI_EMPR
				AND   convert(varchar,ED.TIPO_DOCU) = DR.TIPO_REFE
				AND   convert(varchar,ED.FOLI_DOCU) = DR.FOLI_REFE
				AND   ED.ESTA_DOCU not IN ('DOK','RLV'))
	
	SELECT @CANT_DOCU = COUNT(*)
	FROM   DTE_ENCA_DOCU
	WHERE  CORR_ENVI = @P_CORR_ENVI

	if (@@ERROR <> 0)
	BEGIN
	  	SET @CANT_DOCU = 0
	END

	END



END
GO

GO
--SqlScripter----[dbo].[PRC_ACTUALIZA_CANA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PRC_ACTUALIZA_CANA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_ACTUALIZA_CANA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_ACTUALIZA_CANA]
AS
BEGIN
	declare
	@p_codi_cana numeric (10)
						
	declare c_cana cursor for 
	SELECT codi_cana 
	FROM dbq_cana 
	WHERE datediff(minute,tmst_proc_cana,getdate())>60
	and esta_cana in ('BSY','ERR')

begin
   OPEN c_cana
   FETCH NEXT FROM c_cana
   into @p_codi_cana
	while @@FETCH_STATUS=0
	 begin
   	   update dbq_cana set esta_cana='IDL' where codi_cana=@p_codi_cana
	   FETCH NEXT FROM c_cana
	   into @p_codi_cana
         end
	
	CLOSE c_cana
	DEALLOCATE c_cana	

end
END
GO

GO
--SqlScripter----[dbo].[PRC_ACTUALIZA_PERS_PUBL].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_ACTUALIZA_PERS_PUBL]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_ACTUALIZA_PERS_PUBL] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_ACTUALIZA_PERS_PUBL]
AS
BEGIN


	UPDATE PERS_PUBL SET PERS_PUBL.CONT_RAZO = PERS_PUBL_TEMP.CONT_RAZO, 
	PERS_PUBL.CONT_CASI_SII = PERS_PUBL_TEMP.CONT_CASI_SII, PERS_PUBL.FECH_RESO =PERS_PUBL_TEMP.FECH_RESO
	FROM PERS_PUBL_TEMP JOIN PERS_PUBL ON PERS_PUBL.CONT_RUTT = PERS_PUBL_TEMP.CONT_RUTT
   
	INSERT PERS_PUBL (CONT_RUTT, CONT_DIGI, CONT_RAZO, CONT_CASI_SII, CONT_URLL_SII, FECH_CONF, PERS_PAIS, FECH_RESO)
	SELECT B.CONT_RUTT, B.CONT_DIGI, B.CONT_RAZO, B.CONT_CASI_SII, B.CONT_URLL_SII, B.FECH_CONF, B.PERS_PAIS, B.FECH_RESO
	FROM PERS_PUBL_TEMP B WHERE NOT EXISTS (select 1 from PERS_PUBL C WHERE C.CONT_RUTT = B.CONT_RUTT)

END
GO

GO
--SqlScripter----[dbo].[PRC_ACTUALIZA_QSE_ERN].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PRC_ACTUALIZA_QSE_ERN]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_ACTUALIZA_QSE_ERN] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_ACTUALIZA_QSE_ERN]
AS
BEGIN

if exists(select name from sysobjects where name = 'TablaTemp')
	DROP TABLE TablaTemp

select a.codi_emex,a.codi_empr,a.tipo_docu, a.foli_docu,a.esta_docu, a.mens_esta,  a.fech_emis,
 b.esta_envi,b.mens_envi,b.nume_aten, b.feho_envi,b.corr_envi, q.codi_serv, q.esta_proc 
 INTO TablaTemp
 from dte_enca_docu a , dte_envi_docu b,qse_docu_serv q
where a.corr_envi=b.corr_envi
and q.codi_emex=a.codi_emex and q.codi_empr =a.codi_empr and a.tipo_docu=q.tipo_docu and a.foli_docu=q.foli_docu
and fech_emis > '2012-08-01'
and q.esta_proc='ESP'
and q.codi_serv='dte_envi_sii'
and esta_docu  not in ('DOK','RPR','RLV')
and esta_envi in ('RCT','RSC')
order by b.esta_envi, a.codi_emex

--Select Distinct(esta_envi) from TablaTemp


Update  qse_docu_serv  set esta_proc='ERN', ulti_erro=mens_envi -- OutPut inserted.* 
from  qse_docu_serv  a INNER JOIN TablaTemp b
ON a.codi_emex=b.codi_emex and a.codi_empr =b.codi_empr 
and a.tipo_docu=b.tipo_docu and a.foli_docu=b.foli_docu

DROP TABLE TablaTemp

END
GO

GO
--SqlScripter----[dbo].[PRC_ACTUALIZA_QSE_ERN_CLIE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PRC_ACTUALIZA_QSE_ERN_CLIE]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_ACTUALIZA_QSE_ERN_CLIE] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_ACTUALIZA_QSE_ERN_CLIE]
AS
BEGIN

if exists(select name from sysobjects where name = 'TablaTemp')
	DROP TABLE TablaTemp

select a.codi_emex,a.codi_empr,a.tipo_docu, a.foli_docu,a.esta_docu1, a.fech_emis,
 q.codi_serv, q.esta_proc INTO TablaTemp
 from dte_enca_docu a ,qse_docu_serv q
where 
q.codi_emex=a.codi_emex and q.codi_empr =a.codi_empr and a.tipo_docu=q.tipo_docu and a.foli_docu=q.foli_docu
and fech_emis > '2012-08-01'
and q.esta_proc='ESP'
and q.codi_serv='dte_envi_clie'
and esta_docu1  in ('DOK','CFP', 'ACC', 'ACD', 'ROC')

Update   qse_docu_serv  set esta_proc='BOR'
from  qse_docu_serv  a INNER JOIN TablaTemp b
ON a.codi_emex=b.codi_emex and a.codi_empr =b.codi_empr 
and a.tipo_docu=b.tipo_docu and a.foli_docu=b.foli_docu

Delete qse_docu_serv  where esta_proc='BOR'
--
DROP TABLE TablaTemp

select a.codi_emex,a.codi_empr,a.tipo_docu, a.foli_docu,a.esta_docu1, a.fech_emis,
 q.codi_serv, q.esta_proc INTO TablaTemp
 from dte_enca_docu a ,qse_docu_serv q
where 
q.codi_emex=a.codi_emex and q.codi_empr =a.codi_empr and a.tipo_docu=q.tipo_docu and a.foli_docu=q.foli_docu
and fech_emis > '2012-08-01'
and q.esta_proc='ESP'
and q.codi_serv='dte_envi_clie'
and a.esta_docu1  in ('FRM','ERR','ER2','ER5')

Update   qse_docu_serv  set esta_proc='ERN',ulti_erro=b.esta_docu1
from  qse_docu_serv  a INNER JOIN TablaTemp b
ON a.codi_emex=b.codi_emex and a.codi_empr =b.codi_empr 
and a.tipo_docu=b.tipo_docu and a.foli_docu=b.foli_docu

---
DROP TABLE TablaTemp


select a.codi_emex,a.codi_empr,a.tipo_docu, a.foli_docu,a.esta_docu1, a.mens_esta,  a.fech_emis,
 b.esta_envi,b.mens_envi,b.nume_aten, b.feho_envi,b.corr_envi, q.codi_serv, q.esta_proc INTO TablaTemp
 from dte_enca_docu a , dte_envi_docu b,qse_docu_serv q
where a.corr_envi1=b.corr_envi
and q.codi_emex=a.codi_emex and q.codi_empr =a.codi_empr and a.tipo_docu=q.tipo_docu and a.foli_docu=q.foli_docu
and fech_emis > '2012-08-01'
and q.esta_proc='ESP'
and q.codi_serv='dte_envi_clie'
and a.esta_docu1  not in ('DOK')
and b.esta_envi in ('ROC','SCM','RRE','FRM','RRA','ERR')
order by b.esta_envi, a.codi_emex


Update  qse_docu_serv  set esta_proc='ERN', ulti_erro=b.mens_envi -- OutPut inserted.* 
from  qse_docu_serv  a INNER JOIN TablaTemp b
ON a.codi_emex=b.codi_emex and a.codi_empr =b.codi_empr 
and a.tipo_docu=b.tipo_docu and a.foli_docu=b.foli_docu


DROP TABLE TablaTemp

END
GO

GO
--SqlScripter----[dbo].[PRC_ALTABAJA_POS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_ALTABAJA_POS]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_ALTABAJA_POS] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/* Procedure PRC_ALTABAJA_POS
Realiza una insercion, Alta o Baja de una Unidad Controladora POS segun parametro de envÝo
p_accion = 'A' da de alta la unidad, es decir actualiza indi_alta='S'
p_accion = 'B' da de baja la unidad, es decir actualiza indi_alta='N'
p_accion = 'I' Inserta una nueva unidad POS, por defecto la unidad queda de alta indi_alta='ALTA'
setea los parametros de control de errores
Autor: Hector Ferrada
OT : 411946
Fecha: 07/12/2007
*/

ALTER PROCEDURE [dbo].[PRC_ALTABAJA_POS]
(@p_codi_empr numeric(9), -- primeros 4 parßmetros identifican la unidad POS
	@p_codi_ceco varchar(16),
	@p_codi_orig varchar(3),
	@p_codi_unid varchar(6),
	@p_nomb_unid varchar(40), 
	@p_cant_foli numeric(7), -- cantidad de folios a reponer
	@p_porc_repo numeric(3), -- porcentaje de reposici¾n
	@p_accion varchar(1), -- c¾digo de la acci¾n a realizar
	@p_codi_erro varchar(1) output,
	@p_mens_erro varchar(200) output)
as
BEGIN
	BEGIN TRANSACTION
	set @p_codi_erro = 'N'
	set @p_mens_erro = ''

	if @p_accion = 'I' 
	begin
		-- Insertar unidad POS
		insert into bel_unid_cont (CODI_EMPR, CODI_UNID, CODI_CECO, TIPO_ORIG,
					  NOMB_UNID, CANT_FOLI, PORC_REPO, ESTA_UNID, INDI_ALTA)
		values (@p_codi_empr, @p_codi_unid, @p_codi_ceco, @p_codi_orig,
		   		   @p_nomb_unid, @p_cant_foli, @p_porc_repo, 'ASI', 'S')

		if (@@ERROR <> 0)
		begin
			set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error al intertar insertar POS'+@@ERROR
			print('Error al intertar insertar POS'+@@ERROR)
		end
	end
	
	if @p_accion = 'A' 
	begin
		-- Dar de Alta la unidad POS
		update bel_unid_cont set indi_alta = 'S'
		where codi_empr=@p_codi_empr
		  and codi_unid=@p_codi_unid
		  and codi_ceco=@p_codi_ceco
		  and tipo_orig=@p_codi_orig	

		if (@@ERROR <> 0)
		begin
			set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error al dar de alta el POS'+@@ERROR
			print('Error al dar de alta el POS'+@@ERROR)
		end
	end

	if @p_accion = 'B' 
	begin
		-- Dar de Baja la unidad POS
		update bel_unid_cont set indi_alta = 'N'
		where codi_empr=@p_codi_empr
		  and codi_unid=@p_codi_unid
		  and codi_ceco=@p_codi_ceco
		  and tipo_orig=@p_codi_orig	

		if (@@ERROR <> 0)
		begin
			set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error al dar de baja el POS'+@@ERROR
			print('Error al dar de baja el POS'+@@ERROR)
		end
	end
		
	if (@p_codi_erro = 'N') and (@@ERROR = 0)
		COMMIT TRANSACTION
	else
		ROLLBACK TRANSACTION
END
GO

GO
--SqlScripter----[dbo].[PRC_ASIG_FOLI].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PRC_ASIG_FOLI]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_ASIG_FOLI] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/* Procedure PRC_ASIG_FOLI
Objetivo del procedimiento :
    generar registro para la unidad controladora con el rango
    de folios asignado.
    Controla que el la cantidad solicitada este disponible.

Migrado por: Hector Ferrada
OT : xxxxxx
Fecha: 06-12-2007
*/
ALTER PROCEDURE [dbo].[PRC_ASIG_FOLI]
(@p_corr_rafo varchar(18),
    @p_codi_empr numeric(9),
    @p_codi_ceco varchar(16),
    @p_codi_unid varchar(12),
    @p_cant_foli numeric(9),
    @p_tipo_orig varchar(3),
    @p_codi_erro varchar(1) output,
    @p_mens_erro varchar(200) output)
as
BEGIN
    declare
        @v_cant_nume numeric(18),
        @v_foli_inic numeric(18),
        @v_foli_fina numeric(18),
        @v_corr_asig numeric(18),
        @v_cant_venc numeric(3),
        @v_count numeric(1),
		@v_tipo_dora numeric(3)

    BEGIN TRANSACTION
        set @p_codi_erro = 'N'
        set @p_mens_erro = ''

        --Control si existe cantidad de folios solicitada
        update DTE_RANG_FOLI set ulti_asig = foli_desd-1
        where corr_rafo = @p_corr_rafo and codi_empr = @p_codi_empr and ulti_asig is null

		select @v_tipo_dora = tipo_dora
		from dte_rang_foli
		where corr_rafo = @p_corr_rafo
		
		if(@v_tipo_dora != 34 and @v_tipo_dora != 39 and @v_tipo_dora != 41 and @v_tipo_dora != 52 and 
		   @v_tipo_dora != 110 and @v_tipo_dora != 111 and @v_tipo_dora != 112)
		BEGIN
		    SELECT @v_cant_venc = ISNULL(VALO_PAEM,0)
		    FROM   PARA_EMPR WITH (NOLOCK)
		    WHERE  CODI_EMPR = @p_codi_empr
		    AND    CODI_PAEM = 'EECV'
		    
            select @v_count=count(*)
            from   DTE_RANG_FOLI
            where  corr_rafo = @p_corr_rafo
		    and    codi_empr = @p_codi_empr
		    and    isnull(esta_rafo,'VAL') = 'VAL'
            and    @p_cant_foli <= (foli_hast - isnull(ulti_asig,0))
		    and    datediff(day,getdate(),fech_venc) <= @v_cant_venc
            if @v_count>0
            BEGIN
                set @p_codi_erro = 'S'
                set @p_mens_erro = 'Caf Vencido o Proximo a vencer. Favor revisar fecha de vencimiento del CAF';
            END
		END
		ELSE
		BEGIN
			select @v_count=count(*)
            from   DTE_RANG_FOLI
            where  corr_rafo = @p_corr_rafo
		    and    codi_empr = @p_codi_empr
		    and    isnull(esta_rafo,'VAL') = 'VAL'
            and    @p_cant_foli <= (foli_hast - isnull(ulti_asig,0))
            if @v_count=0
            BEGIN
                set @p_codi_erro = 'S'
                set @p_mens_erro = 'No hay CAF disponible para poder realizar asignacion';
            END
		END
		if(@p_codi_erro='N')
		BEGIN
			--obtiene el corr_rafo de la cantidad de folios asignadas
			select @v_cant_nume = count(corr_rafo)
			from   DTE_RANG_FOLI
			where  corr_rafo = @p_corr_rafo
			and    codi_empr = @p_codi_empr
			and    isnull(esta_rafo,'VAL') = 'VAL'
			and    @p_cant_foli <= (foli_hast - isnull(ulti_asig,0))
			if @@rowcount=0
			BEGIN
				set @p_codi_erro = 'S'
				set @p_mens_erro = 'No hay CAF disponible para crear la asignacion';
			END
	
			if @v_cant_nume = 0
			begin
				set @p_codi_erro = 'S'
				set @p_mens_erro = 'No hay disponible la cantidad de folios solicitada'
			end
	
			if @p_codi_erro = 'N'
			begin
				select @v_cant_nume = isnull(ulti_asig,0)
				from   DTE_RANG_FOLI
				where  corr_rafo = @p_corr_rafo
				and    codi_empr = @p_codi_empr
		
				set @v_foli_inic = @v_cant_nume + 1
				set @v_foli_fina = (@v_cant_nume + @p_cant_foli)
				
				-- correlativo de envio
				select @v_corr_asig = isnull(max(corr_asig),0)+1
				from   BEL_ASIG_FOLI
				set @p_mens_erro = @v_corr_asig
				
				-- insercion de registro en Bel_Asig_Foli
				print('insercion de registro en Bel_Asig_Foli')
				insert into BEL_ASIG_FOLI (corr_asig,    codi_empr,    codi_ceco,    corr_rafo,
										   codi_unid,    tipo_orig,    esta_asig,
										   foli_desd,    foli_hast,    fech_asig)
									values(@v_corr_asig, @p_codi_empr, @p_codi_ceco, @p_corr_rafo,
										   @p_codi_unid, @p_tipo_orig, 'ASI',
										   @v_foli_inic, @v_foli_fina, getdate())

				update DTE_RANG_FOLI set ulti_Asig = @v_foli_fina where corr_rafo = @p_corr_rafo and codi_empr = @p_codi_empr
			end
		END
        if (@p_codi_erro = 'N') and (@@ERROR = 0)
            COMMIT TRANSACTION
        else
            ROLLBACK TRANSACTION
END
GO

GO
--SqlScripter----[dbo].[prc_cate_repo_read].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_cate_repo_read]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_cate_repo_read] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_cate_repo_read]
AS
BEGIN
	SELECT '' as CODIGO, 'Seleccione' as VALOR
	union
	select code as CODIGO, code_desc as VALOR
	from sys_code
	where domain_code = '751'
END
GO

GO
--SqlScripter----[dbo].[PRC_CONS_EVEN_DTES].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_CONS_EVEN_DTES]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_CONS_EVEN_DTES] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_CONS_EVEN_DTES]
(@p_codi_emex varchar(30),
	 @p_codi_empr numeric(9),
	 @p_frec_envt numeric(3)) AS
BEGIN
	DECLARE 
		@v_tipo_docu numeric(3),
		@v_foli_docu numeric(18),
		@v_rutt_emis numeric(9),
		@v_digi_emis varchar(2),
		@v_rutt_rece numeric(9),
		@v_digi_rece varchar(2),
		@v_codi_erro numeric(4),
		@v_mens_erro varchar(80),
		@v_corr_qmsg numeric(20),
		@v_existe numeric(2)
	
	DECLARE cursor_even_dtes CURSOR FOR
    SELECT
		a.tipo_docu, a.foli_docu, 
		a.rutt_emis, a.digi_emis, 
		a.rutt_rece, a.digi_rece
    FROM  dte_enca_docu a, dte_envi_docu b
	WHERE a.codi_emex = @p_codi_emex
	AND   a.codi_empr = @p_codi_empr
	AND   a.tipo_docu in (33, 34, 43)
	AND   a.esta_docu in ('DOK', 'RPR', 'RLV')
	AND   a.codi_emex = b.codi_emex
	AND	  a.corr_envi = b.corr_envi
	AND   ((datediff(day, convert(datetime, b.fech_upld,120), GETDATE())) % @p_frec_envt) = 0
	AND   datediff(day, convert(datetime, b.fech_upld,120), GETDATE()) < 10
	AND   datediff(day, convert(datetime, b.fech_upld,120), GETDATE()) != 0
	AND   even_recl is null
	
	OPEN cursor_even_dtes
	FETCH NEXT FROM cursor_even_dtes 
	INTO @v_tipo_docu, @v_foli_docu, 
		 @v_rutt_emis, @v_digi_emis,
		 @v_rutt_rece, @v_digi_rece

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		set @v_existe = 0
		
		SELECT @v_existe=count(*) FROM dte_proc_evnt
		WHERE codi_emex = @p_codi_emex
		AND   rutt_emis = @v_rutt_emis
		AND   rutt_rece = @v_rutt_rece
		AND   tipo_docu = @v_tipo_docu
		AND   foli_docu = @v_foli_docu
		AND   evnt_sii  = 'CED'
		AND   esta_evnt = 'ING'
		
		IF @v_existe = 0
		BEGIN
		   	execute prc_recl  @p_codi_emex, @v_rutt_rece, @v_digi_rece,
							@v_rutt_emis, @v_digi_emis, @v_tipo_docu,
							@v_foli_docu, 'CED', @p_codi_empr,
							0,  @v_codi_erro output, @v_mens_erro output,
							@v_corr_qmsg output
		END
		
		FETCH NEXT FROM cursor_even_dtes 
		INTO @v_tipo_docu, @v_foli_docu, 
			 @v_rutt_emis, @v_digi_emis,
			 @v_rutt_rece, @v_digi_rece
	END
	
	CLOSE cursor_even_dtes
	DEALLOCATE cursor_even_dtes
	
END /*Fin procedimiento*/
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_boto_check_read].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_boto_check_read]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_boto_check_read] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_boto_check_read]
(
	@tsTipo as VARCHAR(4),	
	@tnPagina as INTEGER,	
	@tnRegPag as INTEGER, 
	@tsCondicion as VARCHAR(2048),
	@tsPar1 as VARCHAR(256), @tsPar2 as VARCHAR(256), 
	@tsPar3 as VARCHAR(256), @tsPar4 as VARCHAR(256), @tsPar5 as VARCHAR(256),
	@p_codi_usua VARCHAR(30), @p_codi_empr INTEGER, @p_codi_emex VARCHAR(30))
AS
	 
BEGIN
		BEGIN
			SELECT		PROC_BOTO AS CODIGO,
						UPPER(PROC_BOTO) AS VALOR
			FROM  dbn_list_boto
			WHERE CODI_REPO = @tsPar1
			AND   NOMB_BOTO = 'btnCheck'
			ORDER BY(PROC_BOTO);
		END
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_boto_create].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_boto_create]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_boto_create] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_boto_create]
@P_CODI_REPO VARCHAR(25),			@P_CODI_BOTO VARCHAR(15),
	@P_NOMB_BOTO VARCHAR(30),			@P_DESC_BOTO VARCHAR(128),
	@P_TIPO_BOTO VARCHAR(1),			@P_CODI_RESX VARCHAR(30),
	@P_CLAS_CSS VARCHAR(30),			@P_PAGE_BOTO VARCHAR(128),
	@P_PROC_BOTO VARCHAR(30),			@P_CODI_PAR1 VARCHAR(30),
	@P_CODI_PAR2 VARCHAR(30),			@P_CODI_PAR3 VARCHAR(30),			
	@P_CODI_PAR4 VARCHAR(30),			@P_CODI_PAR5 VARCHAR(30),			
	@P_IMAG_BOTO VARCHAR(40),			@P_ORDE_BOTO INT,
	@P_INDI_VISI VARCHAR(1),			@P_MODO_BOTO VARCHAR(30),
	@P_LIST_DETA varchar(35)
AS
BEGIN
		insert into DBN_LIST_BOTO (
							CODI_REPO,			CODI_BOTO,
							NOMB_BOTO,			DESC_BOTO,
							TIPO_BOTO,			CODI_RESX,
							CLAS_CSS,			PAGE_BOTO,
							PROC_BOTO,			CODI_PAR1,
							CODI_PAR2,			CODI_PAR3,			
							CODI_PAR4,			CODI_PAR5,			
							IMAG_BOTO,			ORDE_BOTO,
							INDI_VISI,			MODO_BOTO,
							LIST_DETA)
		VALUES(
							@P_CODI_REPO,		@P_CODI_BOTO,
							@P_NOMB_BOTO,		@P_DESC_BOTO,
							@P_TIPO_BOTO,		@P_CODI_RESX,
							@P_CLAS_CSS,		@P_PAGE_BOTO,
							@P_PROC_BOTO,		@P_CODI_PAR1,
							@P_CODI_PAR2,		@P_CODI_PAR3,
							@P_CODI_PAR4,		@P_CODI_PAR5,
							@P_IMAG_BOTO,		@P_ORDE_BOTO,
							@P_INDI_VISI,		@P_MODO_BOTO,
							@P_LIST_DETA);
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_boto_delete].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_boto_delete]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_boto_delete] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_boto_delete]
(@P_CODI_REPO varchar(30),
@P_CODI_BOTO varchar(30))
AS
BEGIN
	IF(@P_CODI_BOTO IS NULL)
	BEGIN
		DELETE 
			FROM DBN_LIST_BOTO 
			WHERE CODI_REPO = @P_CODI_REPO;
	END
	ELSE
	BEGIN
		DELETE 
			FROM DBN_LIST_BOTO 
			WHERE CODI_REPO = @P_CODI_REPO 
			AND CODI_BOTO = @P_CODI_BOTO;
	END
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_boto_read].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_boto_read]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_boto_read] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_boto_read]
(
	@tsTipo as Varchar(4),	
	@tnPagina as integer,	
	@tnRegPag as integer, 
	@tsCondicion as Varchar(128),
	@tsPar1 as Varchar(256), @tsPar2 as Varchar(256), 
	@tsPar3 as Varchar(256), @tsPar4 as Varchar(256), @tsPar5 as Varchar(256),
	@p_codi_usua varchar(30), @p_codi_empr int, @p_codi_emex varchar(30))
AS
/*
     Procedimiento para rescatar datos de la tabla USUA_EMPR
     CON EL 
     Parametros
        @tsTipo 
            C1: Parametro utilizado para cargar los botones en las grillas, segun el modo se le pase a la grilla
            C: Parametro Utilizado para mostrar los botones en la pagina de mantencion  del listador
            L: Query utilizada para el listador 
            M: Parametro Utilizado en la mantención del boton
        @tnPagina	: Numero de pagina a rescatar 
        @tnRegPag	: Numero de registros por pagina
        @tsCondicion : Condicion, clausula Where
        @tsPar1		: Parametro 1 - CODI_REPO
        @tsPar2		: Parametro 2 - CODI_BOTO
        @tsPar3		: Parametro 3 - MODO_BOTO
        @tsPar4		: Parametro 4 - 
        @tsPar5		: Parametro 5 - 
        @p_codi_usua    : Usuario
        @p_codi_empr    : Empresa
        @p_codi_emex    : Emex
     */

BEGIN
	declare @sql_dyn as integer
	declare @sql as nvarchar(2048)
	/*Este es para obtener los botones segun el modo al cual ingresan a listador*/
	IF(@tsTipo = 'C1')
		BEGIN
			SELECT 		CODI_REPO,			CODI_BOTO,				NOMB_BOTO,			DESC_BOTO,
						TIPO_BOTO,			CODI_RESX,				CLAS_CSS,			PAGE_BOTO,
						PROC_BOTO,			CODI_PAR1,				CODI_PAR2,			CODI_PAR3,			
						CODI_PAR4,			CODI_PAR5,				IMAG_BOTO,			ORDE_BOTO,
						INDI_VISI,			MODO_BOTO,				LIST_DETA
						FROM DBN_LIST_BOTO
						WHERE CODI_REPO = @tsPar1
						AND MODO_BOTO LIKE '%(' + @tsPar3 + ')%'
						ORDER BY(CONVERT(NUMERIC(2),ORDE_BOTO))
		END
	/*Es para obtener todos los botones de un reporte especifico*/
	ELSE IF(@tsTipo = 'C')
		BEGIN
			SELECT 		CODI_REPO,			CODI_BOTO,				NOMB_BOTO,			DESC_BOTO,
						TIPO_BOTO,			CODI_RESX,				CLAS_CSS,			PAGE_BOTO,
						PROC_BOTO,			CODI_PAR1,				CODI_PAR2,			CODI_PAR3,			
						CODI_PAR4,			CODI_PAR5,				IMAG_BOTO,			ORDE_BOTO,
						INDI_VISI,			MODO_BOTO,				LIST_DETA
						FROM DBN_LIST_BOTO
						WHERE CODI_REPO = @tsPar1
						ORDER BY ORDE_BOTO
		END
	/*Es para obtener el listador de un Reporte especifico*/
	ELSE IF(@tsTipo = 'L')
		BEGIN
			SET @sql = 	'SELECT	ROW_NUMBER() OVER(ORDER BY CONVERT(NUMERIC(2),ORDE_BOTO) ASC) AS REG, 
							CODI_REPO,			CODI_BOTO,				NOMB_BOTO,			DESC_BOTO,
							TIPO_BOTO,			CODI_RESX,				CLAS_CSS,			PAGE_BOTO,
							PROC_BOTO,			CODI_PAR1,				CODI_PAR2,			CODI_PAR3,			
							CODI_PAR4,			CODI_PAR5,				IMAG_BOTO,			ORDE_BOTO,
							INDI_VISI,			MODO_BOTO,				LIST_DETA
							FROM DBN_LIST_BOTO 
							WHERE CODI_REPO = '''+@tsPar1+''' '

			SET @sql = @sql 
			EXECUTE prc_list_dyn @sql, @tnPagina, @tnRegPag 
		END
	/*Es para obtener un boton en especifico*/
	ELSE IF(@tsTipo = 'M')
		BEGIN
			SELECT 	   CODI_REPO,			CODI_BOTO,			NOMB_BOTO,			DESC_BOTO,
					   TIPO_BOTO,			CODI_RESX,			CLAS_CSS,			PAGE_BOTO,
					   PROC_BOTO,			CODI_PAR1,			CODI_PAR2,			CODI_PAR3,			
					   CODI_PAR4,			CODI_PAR5,			IMAG_BOTO,			ORDE_BOTO,
					   INDI_VISI,			MODO_BOTO,			LIST_DETA
					   FROM DBN_LIST_BOTO
					   WHERE CODI_REPO = @tsPar1
					   AND	 CODI_BOTO = @tsPar2
					   ORDER BY ORDE_BOTO
		END
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_boto_update].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_boto_update]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_boto_update] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_boto_update]
@P_CODI_REPO VARCHAR(25),			
			@P_CODI_BOTO VARCHAR(15),
			@P_NOMB_BOTO VARCHAR(30),			
			@P_DESC_BOTO VARCHAR(128),
			@P_TIPO_BOTO VARCHAR(1),			
			@P_CODI_RESX VARCHAR(30),
			@P_CLAS_CSS VARCHAR(30),			
			@P_PAGE_BOTO VARCHAR(128),
			@P_PROC_BOTO VARCHAR(30),			
			@P_CODI_PAR1 VARCHAR(30),
			@P_CODI_PAR2 VARCHAR(30),			
			@P_CODI_PAR3 VARCHAR(30),			
			@P_CODI_PAR4 VARCHAR(30),			
			@P_CODI_PAR5 VARCHAR(30),			
			@P_IMAG_BOTO VARCHAR(40),
			@P_ORDE_BOTO VARCHAR(2),
			@P_INDI_VISI VARCHAR(1),
			@P_MODO_BOTO VARCHAR(30),
			@P_LIST_DETA varchar(35)
	
AS
BEGIN
	UPDATE DBN_LIST_BOTO SET
		   NOMB_BOTO = @P_NOMB_BOTO,			
		   DESC_BOTO = @P_DESC_BOTO,
		   TIPO_BOTO = @P_TIPO_BOTO,			
		   CODI_RESX = @P_CODI_RESX,
		   CLAS_CSS = @P_CLAS_CSS,			
		   PAGE_BOTO = @P_PAGE_BOTO,
		   PROC_BOTO = @P_PROC_BOTO,			
		   CODI_PAR1 = @P_CODI_PAR1,
		   CODI_PAR2 = @P_CODI_PAR2,			
		   CODI_PAR3 = @P_CODI_PAR3,			
		   CODI_PAR4 = @P_CODI_PAR4,			
		   CODI_PAR5 = @P_CODI_PAR5,			
		   IMAG_BOTO = @P_IMAG_BOTO,			
		   ORDE_BOTO = @P_ORDE_BOTO,
		   INDI_VISI = @P_INDI_VISI,
		   MODO_BOTO = @P_MODO_BOTO,
		   LIST_DETA = @P_LIST_DETA
		   WHERE CODI_REPO = @P_CODI_REPO
			AND	CODI_BOTO = @P_CODI_BOTO;
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_colu_create].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_colu_create]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_colu_create] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_colu_create]
@P_CODI_REPO VARCHAR(25),			
		@P_CODI_COLU VARCHAR(15), 
		@P_NOMB_COLU VARCHAR(30),			
		@P_DESC_COLU VARCHAR(128),
		@P_CODI_RESX VARCHAR(30),
		@P_CLAS_CSS VARCHAR(30),				
		@P_TIPO_COLU varchar(30),
		@P_ANCH_COLU VARCHAR(4),			
		@P_ALIN_COLU varchar(1),
		@P_FORM_COLU VARCHAR(20),			
		@P_INDI_VISI VARCHAR(1),
		@P_IMAG_COLU VARCHAR(30),			
		@P_JQRY_COLU VARCHAR(30),
		@P_ORDE_COLU VARCHAR(2),
		@P_TIPO_BUSQ VARCHAR(2),
		@P_INDI_BUSQ VARCHAR(1),
		@P_COLU_BUSQ VARCHAR(64),
		@P_VERD_BUSQ VARCHAR(1),
		@P_FALS_BUSQ VARCHAR(1),
		@P_CODI_LIVA VARCHAR(64)
AS
BEGIN
	INSERT INTO dbn_list_colu(
			CODI_REPO				,CODI_COLU,
			NOMB_COLU				,DESC_COLU,
			CLAS_CSS				,TIPO_COLU,
			ANCH_COLU				,ALIN_COLU,
			FORM_COLU				,INDI_VISI,
			IMAG_COLU				,JQRY_COLU,
			ORDE_COLU				,TIPO_BUSQ,
			INDI_BUSQ				,COLU_BUSQ,
			VERD_BUSQ				,FALS_BUSQ,
			CODI_LIVA				,CODI_RESX
			)			
     VALUES
			(@P_CODI_REPO,			@P_CODI_COLU, 
			@P_NOMB_COLU ,			@P_DESC_COLU,
			@P_CLAS_CSS ,			@P_TIPO_COLU ,
			@P_ANCH_COLU ,			@P_ALIN_COLU ,
			@P_FORM_COLU ,			@P_INDI_VISI ,
			@P_IMAG_COLU ,			@P_JQRY_COLU ,
			@P_ORDE_COLU ,			@P_TIPO_BUSQ ,
			@P_INDI_BUSQ ,			@P_COLU_BUSQ,
			@P_VERD_BUSQ			,@P_FALS_BUSQ,
			@P_CODI_LIVA,			@P_CODI_RESX);		
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_colu_create_auto].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_colu_create_auto]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_colu_create_auto] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_colu_create_auto]
@P_CODI_REPO VARCHAR(35),			
		@P_CODI_COLU VARCHAR(15),
		@P_ORDE_COLU int
AS
BEGIN
		INSERT INTO DBN_LIST_COLU(
				CODI_REPO				,CODI_COLU,			NOMB_COLU				,DESC_COLU,
				CLAS_CSS				,TIPO_COLU,			ANCH_COLU				,ALIN_COLU, 
				INDI_VISI				,CODI_RESX,			ORDE_COLU				,INDI_BUSQ)			
		SELECT	@P_CODI_REPO,			@P_CODI_COLU,		@P_CODI_COLU ,			@P_CODI_COLU,
				'Bounfield' ,			'texto',			'100' ,					'L',
				'1',					@P_CODI_COLU,		@P_ORDE_COLU,			0
		FROM  DBN_LIST_REPO R
		WHERE CODI_REPO = @P_CODI_REPO
		AND   NOT EXISTS (SELECT 1 FROM DBN_LIST_COLU C
						  WHERE C.CODI_REPO = R.CODI_REPO
						  AND   C.CODI_COLU = @P_CODI_COLU)
						  
						  
		UPDATE 	DBN_LIST_COLU
		SET   	NOMB_COLU = 'LIN',
				DESC_COLU = 'LINEA'
		WHERE   CODI_REPO = @P_CODI_REPO
		AND     CODI_COLU = 'REG'
		/*AND   NOT EXISTS (SELECT 1 FROM DBN_LIST_COLU C
						  WHERE C.CODI_REPO = R.CODI_REPO
						  AND   C.CODI_COLU = @P_CODI_COLU)	*/		  
						  
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_colu_delete].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_colu_delete]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_colu_delete] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_colu_delete]
(@P_CODI_REPO varchar(20),
@P_CODI_COLU varchar(20))
AS
BEGIN
	IF(@P_CODI_COLU IS NULL)
	BEGIN
		DELETE 
			FROM DBN_LIST_COLU 
			WHERE CODI_REPO = @P_CODI_REPO;
	END
	ELSE
	BEGIN
		DELETE 
			FROM DBN_LIST_COLU 
			WHERE CODI_REPO = @P_CODI_REPO 
			AND CODI_COLU = @P_CODI_COLU;	
	END
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_colu_read].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_colu_read]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_colu_read] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_colu_read]
(
	@tsTipo as Varchar(4),	
	@tnPagina as integer,	
	@tnRegPag as integer, 
	@tsCondicion as Varchar(128),
	@tsPar1 as Varchar(256), @tsPar2 as Varchar(256), 
	@tsPar3 as Varchar(256), @tsPar4 as Varchar(256), @tsPar5 as Varchar(256),
	@p_codi_usua varchar(30), @p_codi_empr int, @p_codi_emex varchar(30))
AS
BEGIN
	declare @sql_dyn as integer
	declare @sql as nvarchar(2048)
	/*Obtiene todos las columnas de un reporte*/
	IF(@tsTipo = 'C')
		BEGIN
			SELECT CODI_REPO,		CODI_COLU,
				   NOMB_COLU,		DESC_COLU,
				   CODI_RESX,		CLAS_CSS, 
				   TIPO_COLU,		ANCH_COLU,
				   ALIN_COLU,		FORM_COLU,
				   INDI_VISI,		IMAG_COLU,
				   JQRY_COLU,		ORDE_COLU,
				   TIPO_BUSQ,		INDI_BUSQ,
				   COLU_BUSQ,		VERD_BUSQ,
				   FALS_BUSQ,		CODI_LIVA
				   FROM DBN_LIST_COLU 
				   WHERE CODI_REPO = @tsPar1
				   ORDER BY(ORDE_COLU);
		END
	/*Obtiene todos las */
	ELSE IF(@tsTipo ='L')
		BEGIN
			SET @sql = 	'SELECT	ROW_NUMBER() OVER(ORDER BY CONVERT(NUMERIC(2),ORDE_COLU) ASC) AS REG, 
								   CODI_REPO,		CODI_COLU,
								   NOMB_COLU,		DESC_COLU,
								   CODI_RESX,		CLAS_CSS, 
								   TIPO_COLU,		ANCH_COLU,
								   ALIN_COLU,		FORM_COLU,
								   INDI_VISI,		IMAG_COLU,
								   JQRY_COLU,		ORDE_COLU,
								   INDI_BUSQ,		TIPO_BUSQ,
								   COLU_BUSQ,		VERD_BUSQ,
								   FALS_BUSQ,		CODI_LIVA
								   FROM DBN_LIST_COLU 
								   WHERE CODI_REPO = '''+@tsPar1+''' '

			SET @sql = @sql 

			EXECUTE prc_list_dyn @sql, @tnPagina, @tnRegPag 
		END
	/*Obtiene una columna en espefico, esto es para la mantencion de botones*/
	ELSE IF(@tsTipo = 'M')
		BEGIN
			SELECT CODI_REPO,		CODI_COLU,
				   NOMB_COLU,		DESC_COLU,
				   CODI_RESX,		CLAS_CSS, 
				   TIPO_COLU,		ANCH_COLU,
				   ALIN_COLU,		FORM_COLU,
				   INDI_VISI,		IMAG_COLU,
				   JQRY_COLU,		ORDE_COLU,
				   TIPO_BUSQ,		INDI_BUSQ,
				   COLU_BUSQ,		VERD_BUSQ,
				   FALS_BUSQ,		CODI_LIVA
				   FROM DBN_LIST_COLU 
				   WHERE CODI_REPO = @tsPar1
				   AND CODI_COLU = @tsPar2
				   ORDER BY(CONVERT(NUMERIC(2),ORDE_COLU));
		END
	ELSE IF(@tsTipo = 'V')
		BEGIN
			SELECT COUNT(CODI_COLU) FROM DBN_LIST_COLU WHERE CODI_COLU = @tsPar1;
		END
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_colu_update].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_colu_update]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_colu_update] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_colu_update]
@P_CODI_REPO VARCHAR(25),			
		@P_CODI_COLU VARCHAR(15), 
		@P_NOMB_COLU VARCHAR(30),			
		@P_DESC_COLU VARCHAR(128),
		@P_CODI_RESX VARCHAR(30),
		@P_CLAS_CSS VARCHAR(30),				
		@P_TIPO_COLU varchar(30),
		@P_ANCH_COLU VARCHAR(4),			
		@P_ALIN_COLU varchar(1),
		@P_FORM_COLU VARCHAR(20),			
		@P_INDI_VISI VARCHAR(1),
		@P_IMAG_COLU VARCHAR(30),			
		@P_JQRY_COLU VARCHAR(30),
		@P_ORDE_COLU VARCHAR(2),
		@P_TIPO_BUSQ VARCHAR(2),
		@P_INDI_BUSQ VARCHAR(1),
		@P_COLU_BUSQ VARCHAR(64),
		@P_VERD_BUSQ VARCHAR(1),
		@P_FALS_BUSQ VARCHAR(1),
		@P_CODI_LIVA VARCHAR(64)
AS
BEGIN

    UPDATE DBN_LIST_COLU SET
		NOMB_COLU =	@P_NOMB_COLU,
		DESC_COLU =	@P_DESC_COLU,
		CODI_RESX =	@P_CODI_RESX,
		CLAS_CSS  = @P_CLAS_CSS, 
		TIPO_COLU =	@P_TIPO_COLU,
		ANCH_COLU =	@P_ANCH_COLU,
		ALIN_COLU =	@P_ALIN_COLU,
		FORM_COLU =	@P_FORM_COLU,
		INDI_VISI =	@P_INDI_VISI,
		IMAG_COLU =	@P_IMAG_COLU,
		JQRY_COLU =	@P_JQRY_COLU,
		ORDE_COLU =	@P_ORDE_COLU,
		TIPO_BUSQ = @P_TIPO_BUSQ,
		INDI_BUSQ =	@P_INDI_BUSQ,
		COLU_BUSQ =	@P_COLU_BUSQ,
		VERD_BUSQ = @P_VERD_BUSQ,
		FALS_BUSQ = @P_FALS_BUSQ,
		CODI_LIVA = @P_CODI_LIVA
		WHERE	CODI_REPO =	@P_CODI_REPO
		AND		CODI_COLU = @P_CODI_COLU
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_repo_copi_repo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_repo_copi_repo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_repo_copi_repo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_repo_copi_repo]
(
	@P_REPO_ORIG varchar(35),
	@P_REPO_DEST varchar(35),
	@P_CODI_ERRO varchar(30) output,
	@P_MENS_ERRO varchar(512) output
)
AS
BEGIN
	declare @P_CANT int
	SELECT @P_CANT = COUNT(CODI_REPO) FROM dbn_list_repo where CODI_REPO = @P_REPO_DEST

	IF(@P_CANT = 0)
	BEGIN
	/*Seleccionamos los datos de la tabla dbn_list_repo y los insertamos en la tabla con el nuevo codigo de reporte*/
	INSERT INTO dbn_list_repo  SELECT @P_REPO_DEST, TITU_REPO, DESC_REPO, CODI_RESX, PROC_REPO,CODI_MODU,SCRP_SQLS,SCRP_SQLO,FILT_CKBB,PAGE_REPO,MODO,CATE_LIST, TIPO_REPO, SUBT_CNTX, MENS_ERRO FROM dbn_list_repo where CODI_REPO = @P_REPO_ORIG
	
	/*Seleccionamos los datos de la tabla dbn_list_boto y los insertamos en la tabla con el nuevo codigo de reporte*/
	INSERT INTO dbn_list_boto SELECT @P_REPO_DEST, CODI_BOTO, NOMB_BOTO, DESC_BOTO, TIPO_BOTO, CODI_RESX, CLAS_CSS, PAGE_BOTO,PROC_BOTO, CODI_PAR1, CODI_PAR2, CODI_PAR3, CODI_PAR4, CODI_PAR5, IMAG_BOTO, ORDE_BOTO, INDI_VISI, MODO_BOTO, LIST_DETA FROM dbn_list_boto WHERE CODI_REPO = @P_REPO_ORIG
	
	/*Seleccionamos los datos de la tabla dbn_list_colu y los insertamos en la tabla con el nuevo codigo de reporte*/
	INSERT INTO dbn_list_colu SELECT @P_REPO_DEST, CODI_COLU, NOMB_COLU, DESC_COLU, CODI_RESX, CLAS_CSS, TIPO_COLU, ANCH_COLU, ALIN_COLU, FORM_COLU,INDI_VISI,IMAG_COLU,JQRY_COLU,ORDE_COLU,TIPO_BUSQ,INDI_BUSQ,COLU_BUSQ,VERD_BUSQ,FALS_BUSQ,CODI_LIVA FROM dbn_list_colu WHERE CODI_REPO = @P_REPO_ORIG
	
	SET @P_CODI_ERRO = '0'
	SET @P_MENS_ERRO = 'La copia del reporte fue creada satisfactoriamente : '+@P_REPO_DEST
	END
	ELSE
	BEGIN
		SET @P_CODI_ERRO = '1'
		SET @P_MENS_ERRO = 'No se pudo copiar el reporte, por que ya existe un reporte con este nombre : ' +@P_REPO_DEST
	END
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_repo_create].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_repo_create]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_repo_create] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_repo_create]
@P_CODI_REPO VARCHAR(35),			@P_TITU_REPO VARCHAR(128), 
		@P_DESC_REPO VARCHAR(200),			@P_CODI_RESX VARCHAR(30),
		@P_PROC_REPO VARCHAR(30),			@P_CODI_MODU VARCHAR(30),
		@P_SCRP_SQLS TEXT,					@P_SCRP_SQLO TEXT,
		@P_FILT_CKBB VARCHAR(1),			@P_PAGE_REPO VARCHAR(128),
		@P_MODO VARCHAR(2),					@P_CATE_LIST VARCHAR(64),
		@P_TIPO_REPO VARCHAR(64),			@P_SUBT_CNTX VARCHAR(2048)
AS
BEGIN
	INSERT INTO dbn_list_repo(
				CODI_REPO				,TITU_REPO,
				DESC_REPO				,CODI_RESX,
				CODI_MODU				,PROC_REPO,
				SCRP_SQLS				,SCRP_SQLO,
				FILT_CKBB				,PAGE_REPO,
				MODO					,CATE_LIST,
				TIPO_REPO				,SUBT_CNTX)			
     VALUES(
				@P_CODI_REPO,			@P_TITU_REPO, 
				@P_DESC_REPO ,			@P_CODI_RESX,
				@P_PROC_REPO ,			@P_CODI_MODU ,
				@P_SCRP_SQLS ,			@P_SCRP_SQLO,
				@P_FILT_CKBB ,			@P_PAGE_REPO,
				@P_MODO,				@P_CATE_LIST,
				@P_TIPO_REPO,			@P_SUBT_CNTX);		
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_repo_delete].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_repo_delete]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_repo_delete] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_repo_delete]
@P_CODI_REPO varchar(35)
AS
BEGIN
	DELETE 
		FROM DBN_LIST_REPO 
		WHERE CODI_REPO = @P_CODI_REPO;
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_repo_erro_update].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_repo_erro_update]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_repo_erro_update] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_repo_erro_update]
(
		 @p_mens_erro VARCHAR(5000),
		 @p_codi_repo VARCHAR(256)
	)
AS	
BEGIN
		UPDATE DBN_LIST_REPO 
		SET mens_erro = @p_mens_erro
        WHERE CODI_REPO = @p_codi_repo

	
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_repo_read].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_repo_read]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_repo_read] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_repo_read]
(
	@tsTipo as Varchar(4),	
	@tnPagina as integer,	
	@tnRegPag as integer, 
	@tsCondicion as Varchar(128),
	@tsPar1 as Varchar(256), @tsPar2 as Varchar(256), 
	@tsPar3 as Varchar(256), @tsPar4 as Varchar(256), @tsPar5 as Varchar(256),
	@p_codi_usua varchar(30), @p_codi_empr int, @p_codi_emex varchar(30))
AS
BEGIN
	/*Tipo que se ocupa para los listadores*/
	IF(@tsTipo = 'C')
	BEGIN
		SELECT	CODI_REPO,			TITU_REPO, 
				DESC_REPO,			CODI_RESX, 
				PROC_REPO,			CODI_MODU,
				SCRP_SQLS,			SCRP_SQLO,
				FILT_CKBB,			PAGE_REPO,
				MODO,				CATE_LIST,
				TIPO_REPO,			SUBT_CNTX
				FROM DBN_LIST_REPO
				WHERE CODI_REPO = @tsPar1;
	END
	ELSE IF(@tsTipo = 'L')
	BEGIN
		SELECT	CODI_REPO,			TITU_REPO, 
				DESC_REPO,			CODI_RESX, 
				PROC_REPO,			CODI_MODU,
				SCRP_SQLS,			SCRP_SQLO,
				FILT_CKBB,			PAGE_REPO,
				MODO,				CATE_LIST,
				TIPO_REPO,			SUBT_CNTX
				FROM DBN_LIST_REPO;
	END
	/*Tipo para las listas de valores*/
	ELSE IF(@tsTipo = 'LV')
	BEGIN
		SELECT '' as CODIGO,
				'Seleccione' as VALOR
		UNION
		SELECT	CODI_REPO as CODIGO,
				CODI_REPO +' - '+ TITU_REPO AS VALOR 
		FROM	DBN_LIST_REPO
		ORDER BY CODIGO,VALOR
	END
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_list_repo_update].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_list_repo_update]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_list_repo_update] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_list_repo_update]
@P_CODI_REPO VARCHAR(35),			@P_TITU_REPO VARCHAR(128), 
		@P_DESC_REPO VARCHAR(200),			@P_CODI_RESX VARCHAR(30),
		@P_PROC_REPO VARCHAR(30),			@P_CODI_MODU VARCHAR(30),
		@P_SCRP_SQLS TEXT,					@P_SCRP_SQLO TEXT,
		@P_FILT_CKBB VARCHAR(1),			@P_PAGE_REPO VARCHAR(128),
		@P_MODO VARCHAR(2),					@P_CATE_LIST VARCHAR(64),
		@P_TIPO_REPO VARCHAR(64),			@P_SUBT_CNTX VARCHAR(2048)
AS
BEGIN
	UPDATE dbn_list_repo 
	SET TITU_REPO = @P_TITU_REPO,
		DESC_REPO = @P_DESC_REPO,
		CODI_RESX = @P_CODI_RESX,
		CODI_MODU = @P_CODI_MODU,			
		PROC_REPO = @P_PROC_REPO,
		SCRP_SQLS = @P_SCRP_SQLS,				
		SCRP_SQLO = @P_SCRP_SQLO,
		FILT_CKBB = @P_FILT_CKBB,
		PAGE_REPO = @P_PAGE_REPO,
		MODO = @P_MODO,
		CATE_LIST = @P_CATE_LIST,
		TIPO_REPO = @P_TIPO_REPO,
		SUBT_CNTX = @P_SUBT_CNTX
		WHERE CODI_REPO = @P_CODI_REPO;			
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_repo_rous_create].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_repo_rous_create]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_repo_rous_create] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_repo_rous_create]
@P_CODI_REPO VARCHAR(20),
@P_CODI_ROUS VARCHAR(30),
@P_CODI_MODU VARCHAR(30),
@P_EXPT_EXLS  VARCHAR(1)

AS
BEGIN
	INSERT INTO DBN_REPO_ROUS(CODI_MODU,CODI_REPO,CODI_ROUS,EXPT_EXLS) 
	VALUES (@P_CODI_MODU,@P_CODI_REPO,@P_CODI_ROUS, @P_EXPT_EXLS);
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_repo_rous_delete].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_repo_rous_delete]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_repo_rous_delete] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_repo_rous_delete]
@P_CODI_REPO varchar(30),
@P_CODI_MODU varchar(30),
@P_CODI_ROUS VARCHAR(30)
AS
BEGIN
	IF (@P_CODI_MODU IS NULL)
	BEGIN
		DELETE 
			FROM DBN_REPO_ROUS 
			WHERE CODI_REPO = @P_CODI_REPO;
	END
	ELSE IF(@P_CODI_MODU IS NOT NULL)
	BEGIN 
		DELETE 
			FROM DBN_REPO_ROUS 
			WHERE CODI_REPO = @P_CODI_REPO 
			AND CODI_MODU = @P_CODI_MODU 
			AND CODI_ROUS = @P_CODI_ROUS;
	END
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_repo_rous_read].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_repo_rous_read]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_repo_rous_read] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_repo_rous_read]
(
	@tsTipo as Varchar(4),	
	@tnPagina as integer,	
	@tnRegPag as integer, 
	@tsCondicion as Varchar(128),
	@tsPar1 as Varchar(256), @tsPar2 as Varchar(256), 
	@tsPar3 as Varchar(256), @tsPar4 as Varchar(256), @tsPar5 as Varchar(256),
	@p_codi_usua varchar(30), @p_codi_empr int, @p_codi_emex varchar(30))
AS
BEGIN
	declare @sql_dyn as integer
	declare @sql as nvarchar(2048)
	declare @p_codi_rous varchar(30)
	/*Obtiene los registros segun un codigo de rol*/
	IF(@tsTipo = 'C')
		BEGIN
			SELECT 	   	CODI_REPO,			CODI_MODU,
						CODI_ROUS, EXPT_EXLS
			FROM 		DBN_REPO_ROUS
			WHERE 		CODI_REPO = @tsPar1
			ORDER 		BY(CODI_MODU)
		END
	/*Muestra todos los registros de un codigo de reporte*/
	ELSE IF(@tsTipo = 'L')
		BEGIN
			SET @sql = 	'SELECT	ROW_NUMBER() OVER(ORDER BY rr.CODI_MODU ASC) AS REG, 
							rr.CODI_REPO,			rr.CODI_MODU,		rr.CODI_ROUS,
							lr.TITU_REPO,			lr.DESC_REPO,		lr.CATE_LIST,
							rr.EXPT_EXLS
							FROM	DBN_REPO_ROUS rr,
									DBN_LIST_REPO lr
							WHERE	rr.CODI_REPO = lr.codi_repo
							and		rr.CODI_ROUS in (select codi_rous 
													 from sys_usro 
													 where codi_usua = ''' + @p_codi_usua + ''') 
							and		lr.TIPO_REPO = ''Maestro'''

			SET @sql = @sql 
			EXECUTE prc_list_dyn @sql, @tnPagina, @tnRegPag 
		END
	/*Obtiene un registro en especifico*/
	ELSE IF(@tsTipo = 'M')
		BEGIN
			SELECT 	   CODI_REPO,			CODI_MODU,
					   CODI_ROUS, EXPT_EXLS
					   FROM DBN_REPO_ROUS
					   WHERE CODI_REPO = @tsPar1
					   AND CODI_MODU = @tsPar2
					   ORDER BY(CODI_MODU)
		END
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_repo_rous_read_busq].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_dbn_repo_rous_read_busq]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_repo_rous_read_busq] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_repo_rous_read_busq]
(
	@p_codi_rous varchar(30),
	@p_codi_repo varchar(30)
)
AS
BEGIN
	select 	object_brief, 	object_desc, 
			object_prog, 	par0,
			val0,			par1,
			val1, 			object_type
	from 	sys_object 
	where 	object_type in ('B','W')
	and		codi_modu = @p_codi_rous
	and		UPPER(object_desc) like '%'+UPPER(@p_codi_repo)+'%'
END
GO

GO
--SqlScripter----[dbo].[prc_dbn_vist_list].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[prc_dbn_vist_list]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_dbn_vist_list] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_dbn_vist_list]
(
	@tsTipo as Varchar(4),	
	@tnPagina as integer,	
	@tnRegPag as integer, 
	@tsCondicion as Varchar(128),
	@tsPar1 as Varchar(256), @tsPar2 as Varchar(256), 
	@tsPar3 as Varchar(256), @tsPar4 as Varchar(256), @tsPar5 as Varchar(256),
	@p_codi_usua varchar(30), @p_codi_empr int, @p_codi_emex varchar(30))
AS

BEGIN

	SELECT	CODI_REPO, CODI_ROUS, CODI_MODU, EXPT_EXLS 
	FROM	DBN_REPO_ROUS
	WHERE CODI_MODU = @tsPar1
	AND   CODI_ROUS = @tsPar2
	AND   CODI_REPO = @tsPar3

END
GO

GO
--SqlScripter----[dbo].[PRC_DOCU_LOB_DTE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_DOCU_LOB_DTE]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_DOCU_LOB_DTE] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_DOCU_LOB_DTE]
@CODI_EMPR NUMERIC(9),
									@TIPO_DOCU NUMERIC(3),
									@FOLI_DOCU NUMERIC(22),
									@TIPO_ARCH CHAR(12),
									@CLOB_DOCU TEXT,
									@CODI_EMEX CHAR(30),
									@CODI_ERRO VARCHAR(3) OUTPUT,
									@MENS_ERRO VARCHAR(500) OUTPUT AS
DECLARE 
@ptrval binary(16)

BEGIN
	SET @CODI_ERRO = 'N'
	SET @MENS_ERRO = 'Proceso insercion de xml de envios ok'
	
	SELECT @ptrval = TEXTPTR(CLOB_DOCU)
	FROM	DTE_DOCU_LOB with(nolock)
	WHERE	CODI_EMPR = @CODI_EMPR
	AND		TIPO_DOCU = @TIPO_DOCU
	AND		FOLI_DOCU = @FOLI_DOCU
	AND		CODI_EMEX = @CODI_EMEX
	AND		TIPO_ARCH = @TIPO_ARCH
	
	if (convert(varchar(5),substring(@ptrval,0,4)) != '')
	begin
		UPDATETEXT DTE_DOCU_LOB.CLOB_DOCU @ptrval null 0 @CLOB_DOCU
	end
	IF (@@ERROR <> 0)
	BEGIN
	  	SET @CODI_ERRO = 'S'
		SET @MENS_ERRO = 'Error: '+ convert(varchar(2000), @@ERROR)
	END		
END
GO

GO
--SqlScripter----[dbo].[PRC_DOCU_LOB_DTO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_DOCU_LOB_DTO]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_DOCU_LOB_DTO] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_DOCU_LOB_DTO]
@CODI_EMPR NUMERIC(9),
									@CORR_DOCU NUMERIC(22),
									@TIPO_ARCH CHAR(12),
									@CLOB_DOCU TEXT,
									@CODI_EMEX CHAR(30),
									@PRIMERO NUMERIC(1),
									@CODI_ERRO VARCHAR(3) OUTPUT,
									@MENS_ERRO VARCHAR(500) OUTPUT AS
DECLARE 
@ptrval binary(16)
BEGIN
	SET @CODI_ERRO = 'N'
	SET @MENS_ERRO = 'Proceso insercion de xml de recepcion ok'
	
	IF (@PRIMERO = 1)
	BEGIN
		DELETE FROM DTO_DOCU_LOB 
		WHERE CODI_EMEX = @CODI_EMEX
		AND CODI_EMPR = @CODI_EMPR 
		AND CORR_DOCU = @CORR_DOCU 
		AND TIPO_ARCH = @TIPO_ARCH;
		
		INSERT INTO DTO_DOCU_LOB (CODI_EMPR, CORR_DOCU, TIPO_ARCH, CLOB_DOCU, CODI_EMEX)
		VALUES (@CODI_EMPR, @CORR_DOCU, @TIPO_ARCH, '', @CODI_EMEX);
	END
	
	SELECT @ptrval = TEXTPTR(CLOB_DOCU)
	FROM	DTO_DOCU_LOB with(nolock)
	WHERE	CODI_EMPR = @CODI_EMPR
	AND		CORR_DOCU = @CORR_DOCU
	AND		TIPO_ARCH = @TIPO_ARCH
	AND		CODI_EMEX = @CODI_EMEX
	
	if (convert(varchar(5),substring(@ptrval,0,4)) != '')
	begin
		UPDATETEXT DTO_DOCU_LOB.CLOB_DOCU @ptrval null 0 @CLOB_DOCU
	end
	IF (@@ERROR <> 0)
	BEGIN
	  	SET @CODI_ERRO = 'S'
		SET @MENS_ERRO = 'Error: '+ convert(varchar(2000), @@ERROR)
	END		
END
GO

GO
--SqlScripter----[dbo].[PRC_ELIM_MOVI].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_ELIM_MOVI]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_ELIM_MOVI] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_ELIM_MOVI]
@corr_libr numeric(9), 
	   	  		   @peri_trib varchar(8), 
				   @tipo_libr varchar(3),
				   @corr_envi numeric(18),
				   @corr_envi2 numeric(9),
				   @codi_erro varchar(2) output,
				   @mens_erro varchar(250) output
AS

BEGIN

	SET @CODI_ERRO = 'N'
	SET @MENS_ERRO = 'Proceso Eliminar Movimientos Ejecutado OK'
	
	DELETE FROM LCE_TOTA_MOCO
	WHERE CORR_LIBR = @CORR_LIBR
	AND   PERI_TRIB = @PERI_TRIB
	AND   TIPO_LIBR = @TIPO_LIBR
	
	DELETE FROM LCE_TOTA_COMO
	WHERE CORR_LIBR = @CORR_LIBR
	AND   PERI_TRIB = @PERI_TRIB
	AND   TIPO_LIBR = @TIPO_LIBR
	
	DELETE FROM LCE_MOVI_CONT
	WHERE CORR_LIBR = @CORR_LIBR
	AND   PERI_TRIB = @PERI_TRIB
	AND   TIPO_LIBR = @TIPO_LIBR	
	
	DELETE FROM LCE_ENVI_LIBR
	WHERE CORR_ENVI = @CORR_ENVI
	OR    CORR_ENVI = @CORR_ENVI2
	
	IF (@@ERROR <> 0)
	BEGIN
	  	SET @CODI_ERRO = 'S'
		SET @MENS_ERRO = 'PRC_ELIM_MOVI Error: '+ convert(varchar, @@ERROR)
	END
	
END
GO

GO
--SqlScripter----[dbo].[PRC_ENTREGA_ASIG].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_ENTREGA_ASIG]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_ENTREGA_ASIG] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/* Procedure PRC_ENTREGA_ASIG
Entrega una asignaci¾n realizada recientemente, identificando una unidad POS
y los parametros referidos a la asignaci¾n, setea los parametros de control de errores
Autor: Hector Ferrada
OT : 411946
Fecha: 07/12/2007
*/

ALTER PROCEDURE [dbo].[PRC_ENTREGA_ASIG]
(@p_corr_asig numeric(12), -- correlativo de asignacion
	@p_codi_empr numeric(9), -- siguientes 4 parametros identifican la unidad POS
	@p_codi_ceco varchar(16),
	@p_codi_orig varchar(3),
	@p_codi_unid varchar(6),
	@p_str_asig varchar(1000), -- siguientes 2 parametros cadenas con la asignacion y el CAF
	@p_str_caff varchar(2000),
	@p_fech_asig datetime, -- fecha de la asignacion
	@p_corr_rafo numeric(18), -- correlativo de rango de folios usado
	@p_foli_desd numeric(10), -- siguientes 2 parametros folio desde y folio hasta asignado
	@p_foli_hast numeric(10),
	@p_codi_erro varchar(1) output,
	@p_mens_erro varchar(200) output)
as
BEGIN
		set @p_codi_erro = 'N'
		set @p_mens_erro = 'ENTRO'
		
		/* 
			AQUI IMPLEMENTE EL CODIGO DEL CUERPO DEL PROCEDIMIENTO
		*/

END
GO

GO
--SqlScripter----[dbo].[PRC_ENVI_LOB_DTE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_ENVI_LOB_DTE]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_ENVI_LOB_DTE] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_ENVI_LOB_DTE]
@CODI_EMPR NUMERIC(9),
									@CORR_ENVI NUMERIC(22),
									@TIPO_ARCH CHAR(12),
									@CLOB_DOCU TEXT,
									@CODI_EMEX CHAR(30),
									@PRIMERO NUMERIC(1),
									@CODI_ERRO VARCHAR(3) OUTPUT,
									@MENS_ERRO VARCHAR(500) OUTPUT AS
DECLARE 
	@ptrval binary(16)
BEGIN
	SET @CODI_ERRO = 'N'
	SET @MENS_ERRO = 'Proceso insercion de xml respuesta SII'
	
	IF @PRIMERO = 1
	BEGIN
		DELETE from dte_envi_lob 
		WHERE codi_emex = @CODI_EMEX
		AND codi_empr = @CODI_EMPR 
		AND corr_envi = @CORR_ENVI 
		AND tipo_arch = @TIPO_ARCH;
		
		INSERT INTO dte_envi_lob(CODI_EMPR,CORR_ENVI, TIPO_ARCH, CLOB_DOCU, CODI_EMEX) 
		VALUES (@CODI_EMPR, @CORR_ENVI, @TIPO_ARCH, '', @CODI_EMEX)				 
	END

	SELECT @ptrval = TEXTPTR(CLOB_DOCU)
	FROM dte_envi_lob with(nolock)
	WHERE CODI_EMPR = @CODI_EMPR 
	AND CORR_ENVI = @CORR_ENVI
	AND TIPO_ARCH = @TIPO_ARCH
	AND CODI_EMEX = @CODI_EMEX  
	
	IF (convert(varchar(5),substring(@ptrval,0,4)) != '')
	BEGIN
		UPDATETEXT dte_envi_lob.CLOB_DOCU @ptrval null 0 @CLOB_DOCU
	END

	IF (@@ERROR =  0)
	BEGIN
		SET @CODI_ERRO = 'S'
		SET @MENS_ERRO = 'Error '+ convert(varchar(2000), @@ERROR)
	END		
END
GO

GO
--SqlScripter----[dbo].[PRC_EVEN_DTES].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_EVEN_DTES]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_EVEN_DTES] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_EVEN_DTES]
AS
BEGIN
	DECLARE
		@v_codi_emex varchar(30),
		@v_codi_empr numeric(3),
		@v_frec_cons numeric(1)
		  
	DECLARE cursor_cons_empr CURSOR FOR
    SELECT
		a.codi_emex, a.codi_empr
    FROM  empr a, para_empr b
	WHERE b.codi_emex = a.codi_emex
	AND   a.codi_empr = b.codi_empr
	AND   b.codi_paem = 'PCED'
	AND   b.valo_paem = 'S'
	
	OPEN cursor_cons_empr
	FETCH NEXT FROM cursor_cons_empr 
	INTO @v_codi_emex, @v_codi_empr

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @v_frec_cons = 0
		
		SELECT @v_frec_cons = CONVERT(NUMERIC, valo_paem)
		FROM para_empr
		WHERE codi_emex = @v_codi_emex
		AND   codi_empr = @v_codi_empr
		AND   codi_paem = 'FCED'
		
		IF @v_frec_cons > 0
		BEGIN
			execute PRC_CONS_EVEN_DTES  @v_codi_emex, @v_codi_empr, @v_frec_cons
		END
		
		FETCH NEXT FROM cursor_cons_empr 
		INTO @v_codi_emex, @v_codi_empr
	END
	
	CLOSE cursor_cons_empr
	DEALLOCATE cursor_cons_empr
END /*Fin procedimiento*/
GO

GO
--SqlScripter----[dbo].[prc_gene_rang_foli_venc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_gene_rang_foli_venc]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_gene_rang_foli_venc] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:		Aaron Rojas
-- Create date: 2016-01-11
-- Description:	procedimiento que realiza por rangos los folios no utilizados
-- =============================================

ALTER PROCEDURE [dbo].[prc_gene_rang_foli_venc]
( @p_spid numeric(10),
  @p_codi_empr numeric(9)
)
AS
BEGIN
	declare @v_tipo_docu numeric(4),
		@v_foli_desd numeric(11),
		@v_foli_hast numeric(11),
		@v_cant_nous numeric(10),
		@v_corr_rafo numeric(10),
		@v_foli_inic numeric(10),
		@v_foli_actual numeric(11),
		@v_foli_final numeric(11),
		@v_count numeric(1)

	set @v_cant_nous=0
	set @v_corr_rafo=0
	set @v_foli_desd=0
	set @v_foli_hast=0
	set @v_tipo_docu=0
	set @v_foli_inic=0

	select @v_cant_nous = valo_paem
	from   para_empr WITH (NOLOCK)
	where  codi_empr = 1
	and	   codi_paem = 'EECV'

	declare cur_rang_venc cursor read_only for
	SELECT corr_rafo, foli_desd, foli_hast, tipo_dora
	from   dte_rang_foli
	where  codi_empr = 1
	and    (datediff(day,fech_venc,getdate())*-1) <= 30
	order by tipo_dora asc
	
	delete dte_rang_foli_temp where p_spid=@p_spid
	delete dte_rang_foli_temp where (datediff(day,fech_actu,getdate())*-1) <= 30
	
	OPEN cur_rang_venc
	FETCH NEXT FROM cur_rang_venc
	into @v_corr_rafo, @v_foli_desd, @v_foli_hast, @v_tipo_docu
	while @@FETCH_STATUS = 0
	BEGIN--1
		set @v_foli_actual=0
		set @v_foli_final=0
		set @v_foli_inic=0
		WHILE @v_foli_desd <= @v_foli_hast
		BEGIN--3
				if(@v_foli_inic=0)
					set @v_foli_inic = @v_foli_desd
				set @v_foli_actual = @v_foli_desd
				if(@v_tipo_docu in (39,41))
				begin
					select @v_count = COUNT(*)
					from   bel_enca_docu WITH (NOLOCK)
					where  CODI_EMPR= 1
					and    TIPO_DOCU= @v_tipo_docu
					and    FOLI_DOCU=@v_foli_desd
				end
				else
				begin
					select @v_count = COUNT(*)
					from   dte_enca_docu WITH (NOLOCK)
					where  CODI_EMPR= 1
					and    TIPO_DOCU= @v_tipo_docu
					and    FOLI_DOCU=@v_foli_desd
				end
				
				if(@v_count=0)
				BEGIN
					set @v_foli_final=0
					print('   ***No existe documento: '+convert(varchar,@v_foli_desd))
					print('   @v_foli_inic       : '+convert(varchar,@v_foli_inic))
					print('   @v_foli_actual     : '+convert(varchar,@v_foli_actual))
					if(@v_foli_hast = @v_foli_desd)
					BEGIN
						if(@v_foli_inic=@v_foli_hast)
							insert into dte_rang_foli_temp values(@p_spid, @v_corr_rafo, @v_tipo_docu, @v_foli_desd, @v_foli_desd, GETDATE())
						else
							insert into dte_rang_foli_temp values(@p_spid, @v_corr_rafo, @v_tipo_docu, @v_foli_inic, @v_foli_desd, GETDATE())
					END
				END
				ELSE
				BEGIN
					if(@v_foli_inic < @v_foli_desd)
					BEGIN
						set @v_foli_final = @v_foli_desd -1
						print('    @v_foli_final 2 : '+convert(varchar,@v_foli_final))
						insert into dte_rang_foli_temp values(@p_spid, @v_corr_rafo, @v_tipo_docu, @v_foli_inic, @v_foli_final, GETDATE())
					END
					set @v_foli_inic=0
				END
			set @v_foli_desd = @v_foli_desd + 1
		END--3
		FETCH NEXT FROM cur_rang_venc
		into @v_corr_rafo, @v_foli_desd, @v_foli_hast, @v_tipo_docu
	END--1
	CLOSE cur_rang_venc
	DEALLOCATE cur_rang_venc
END
GO

GO
--SqlScripter----[dbo].[prc_get_folio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_get_folio]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_get_folio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_get_folio]
(
		@p_codi_empr	 Numeric(3), 
		@p_tipo_docu	 Numeric(3), 
		@p_codi_ceco     VarChar(16), 
		@p_foli_docu     Numeric(10) OutPut,
		@p_existe	 VarChar(1)  OutPut,
		@p_mensaje	 VarChar(200) OutPut)
AS
BEGIN
DECLARE 
	@v_corr_asig  numeric(12,0),	
	@v_foli_desd  numeric(10,0),	
	@v_foli_hast  numeric(10,0),
	@v_corr_rafo  numeric(18,0),
	@v_ulti_foli  numeric(10,0),
	@v_cant_soli  numeric(10,0),
	@v_foli_ini   numeric(10,0),
	@v_foli_fin   numeric(10,0),
	@v_codi_unid  numeric(6,0)

	set @p_existe 	= 'S'	
	set @v_cant_soli=15

	/*Revisa si existe rango de Folio Valido y centro de costo*/
	select 	@v_foli_desd = foli_desd,	
		@v_foli_hast = foli_hast,
		@v_corr_rafo = corr_rafo,
		@v_ulti_foli = isnull(ulti_foli,foli_desd-1)
	from Dte_Rang_Foli
	where codi_empr=@p_codi_empr 
	and   tipo_dora=@p_tipo_docu
	and   esta_rafo='VAL'	
	and   corr_rafo=(select min(corr_rafo) 
			 from dte_rang_foli where codi_empr=@p_codi_empr 
				            and   tipo_dora=@p_tipo_docu
					    and   esta_rafo='VAL')


	IF @p_codi_ceco is null OR @p_codi_ceco ='0' OR @p_codi_ceco =''
	begin
		select @p_foli_docu=isnull(ulti_foli,foli_desd-1)+1
		from 	dte_Rang_Foli 
		where codi_empr=@p_codi_empr 
		and   tipo_dora=@p_tipo_docu
		and   esta_rafo='VAL'	
		AND   corr_rafo=@v_corr_rafo
		and   isnull(ulti_foli,0) + 1 <= foli_hast

		IF (@@rowcount = 0 )
		begin
			set @p_existe 	= 'N'	
			set @p_mensaje	='No existe folio para asignar'
		        return
        	end
		ELSE
			Update DTE_RANG_FOLI set Ulti_Foli = @p_foli_docu Where corr_rafo=@v_corr_rafo
			
	end
	ELSE
	begin
	
		select @p_foli_docu = ulti_usad + 1
		from Bel_Asig_Foli a,
		     Dte_Rang_Foli b
		where a.corr_rafo=b.corr_rafo
		and   a.codi_empr=@p_codi_empr
		and   b.tipo_dora=@p_tipo_docu
		and   esta_asig = 'ASI'
		and   a.foli_hast >= ulti_usad + 1

		if (@@rowcount = 0)
		begin
			/*Se saca el Bel_Asig_Foli*/
			select 	@v_corr_asig=isnull (max(corr_asig),1)+1
			from 	Bel_Asig_Foli
			
			/*Se saca el Bel_Unid_Cont*/
			select @v_codi_unid=isnull (max(codi_unid),1)+1	
			from Bel_Unid_Cont

			
			/* folio de inicio asignar*/ 
			set @v_foli_ini = @v_ulti_foli + 1

			/*folio de termino asignar*/
			if (@v_foli_hast - @v_ulti_foli < @v_cant_soli)
				set @v_foli_fin = @v_foli_ini + (@v_foli_hast - @v_ulti_foli)
				
			else
				set @v_foli_fin = @v_foli_ini + @v_cant_soli
			
			
			
			INSERT bel_unid_cont (Codi_unid, Nomb_unid, Codi_empr,
					      Codi_ceco, Cant_foli, Porc_repo,
					      Tipo_orig, Esta_unid)
				      VALUES (@v_codi_unid, 'Facture', @p_codi_empr,
					      @p_codi_ceco,@v_foli_fin - @v_foli_ini , 30, '0', 'ASI')
			
			
			/* insercion de registro en Bel_Asig_Foli */
			Insert Into BEL_ASIG_FOLI (corr_asig, codi_empr, codi_ceco, corr_rafo,
					   	   codi_unid, tipo_orig, esta_asig, foli_desd, 	
						   foli_hast, fech_asig)
			Values (@v_corr_asig, @p_codi_empr, @p_codi_ceco, @v_corr_rafo,
				@v_codi_unid,'0','ASI' , @v_foli_ini, @v_foli_fin, getdate());

			

			/*Actualiza el ultimo folio */
			Update BEL_ASIG_FOLI set ulti_usad = @v_foli_ini Where corr_rafo=@v_corr_rafo
						
			/*Actualiza el ultimo folio Asignado*/
			Update DTE_RANG_FOLI set Ulti_Foli = @v_foli_fin Where corr_rafo=@v_corr_rafo
		

			select @p_foli_docu=ulti_usad + 1
			from Bel_Asig_Foli a,
			     Dte_Rang_Foli b
			where a.corr_rafo=b.corr_rafo
			and   a.codi_empr=@p_codi_empr
			and   b.tipo_dora=@p_tipo_docu
			and   esta_asig = 'ASI'
			and   a.foli_hast >= ulti_usad + 1			

			
			IF (@@ERROR <> 0 )
			begin
				set @p_existe 	= 'N'	
				set @p_mensaje	='No existe folio para asignar'
	        		return
		        end
		end
		ELSE
		begin
			/*Actualiza el ultimo folio */
			Update BEL_ASIG_FOLI set ulti_usad = ulti_usad + 1 Where corr_rafo=@v_corr_rafo
					
		end
		
		
	end
	
	IF (@@ERROR <> 0 )
	begin
		set @p_existe 	= 'N'	
		set @p_mensaje	='No existe folio para asignar'
	        return
        end
	
END;
GO

GO
--SqlScripter----[dbo].[PRC_GET_MESSAGE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_GET_MESSAGE]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_GET_MESSAGE] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_GET_MESSAGE]
@pi_codi_appl	VARCHAR(40),
       @pi_rutt_empr	NUMERIC(8),
       @pi_digi_empr 	VARCHAR(1),
       @pi_corr_qmsg    NUMERIC(22),
       @pi_codi_erro    NUMERIC(5)     output,
       @pi_mens_erro    VARCHAR(80)    output,
       @pi_resp_msge    VARCHAR(8000)  output

AS
   DECLARE
       @v_estado     varchar(10),
       @v_mensaje    varchar(8000),
       @v_delete     varchar(1)

BEGIN
   set @pi_codi_erro = 0
   set @pi_mens_erro = 'Mensaje Procesado'
   set @pi_resp_msge = ''

   set @v_delete = 'N'

   if @pi_codi_appl != 'SUITE5' 
   begin
      set @pi_mens_erro = 'Id de Aplicacion Invalido'
      set @pi_codi_erro = -1
   end;

   if @pi_codi_erro = 0 
   BEGIN TRY

      select  @v_estado  = esta_qmsg,
              @v_mensaje = resp_qmsg
      from   dtec_queue_msge
      where  corr_qmsg = @pi_corr_qmsg
      and    rutt_empr = @pi_rutt_empr
      and    digi_empr = @pi_digi_empr
      and    appl_name = @pi_codi_appl
 
      if @@ROWCOUNT = 0
      begin
         set @pi_codi_erro = 1
         set @pi_mens_erro = 'No existe la solicitud consultada'
      end
      else
      begin
         if @v_estado = 'ING'
         begin
            set @pi_codi_erro = 2
            set @pi_mens_erro = 'La solicitud consultada no ha sido procesada'
         end

         if @v_estado = 'PRC'
         begin
            set @pi_codi_erro = 3
            set @pi_mens_erro = 'La solicitud consultada esta en proceso'
         end

         if @v_estado = 'AUT' or
            @v_estado = 'ERR' or
            @v_estado = 'NUL' or
            @v_estado = 'SRV'
         begin
            set @pi_codi_erro = -1
            set @pi_mens_erro = @v_mensaje

            set @v_delete = 'S'
         end

         if @v_estado = 'OK'
         begin
            set @pi_codi_erro = 0
            set @pi_resp_msge = @v_mensaje

            set @v_delete = 'S'
         end

         if @v_delete = 'S'
         begin
            begin transaction;

            delete from dtec_queue_msge
            where  corr_qmsg = @pi_corr_qmsg
            and    rutt_empr = @pi_rutt_empr
            and    digi_empr = @pi_digi_empr
            and    appl_name = @pi_codi_appl

            commit transaction;
         end

      end

   END TRY
   BEGIN CATCH
      set @pi_codi_erro = -1
      set @pi_mens_erro = 'Error al recuperar mensaje : ' + error_message();

      rollback transaction; 

      print @pi_mens_erro;
   END CATCH

END
GO

GO
--SqlScripter----[dbo].[prc_get_rang_folio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_get_rang_folio]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_get_rang_folio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_get_rang_folio]
(
		@p_codi_empr	 numeric(3), 
		@p_tipo_docu	 numeric(3), 
		@p_codi_ceco     varchar(10),
		@p_cant_soli	 numeric(3), 
		@p_foli_docu1    varchar(10)  output,
		@p_foli_docu2    varchar(10)  output,
		@p_existe	 varchar(1)   output,
		@p_mensaje	 varchar(256) output)
AS
BEGIN
DECLARE 
   @v_aux        numeric(8,0),
   @v_foli_docu  numeric(12,0),	
   @v_existe     varchar(1),	
   @v_mensaje    varchar(256)

   set @p_existe     = 'S'
   set @p_mensaje    = ' '
   set @p_foli_docu1 = 0
   set @p_foli_docu2 = 0
   set @v_aux        = 0
   
   while @v_aux < @p_cant_soli
   begin
     set @v_aux = @v_aux + 1
     exec prc_get_folio @p_codi_empr, @p_tipo_docu, @p_codi_ceco, @v_foli_docu output, @v_existe output, @v_mensaje output
     if (@v_existe = 'S' and isnull(@v_foli_docu,0) <> 0)
     begin
     	if (@v_aux = 1)
     	begin
     	   set @p_foli_docu1 = @v_foli_docu
     	end
     	set @p_foli_docu2 = @v_foli_docu
     end
   end

   if (@@ERROR <> 0 OR @p_foli_docu1 = 0)
   begin
	set @p_existe 	= 'N'	
	set @p_mensaje	='No existe folio para asignar'
	return
   end
end
GO

GO
--SqlScripter----[dbo].[prc_get_rol_read].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_get_rol_read]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_get_rol_read] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_get_rol_read]
@P_CODI_USUA VARCHAR(30)
AS
BEGIN
	select codi_rous 
	from sys_usro 
	where codi_modu in ('DBWEB','FACT','XBRL','DBAX','FLUJOE','BASE') 
	and codi_usua = @P_CODI_USUA;
END
GO

GO
--SqlScripter----[dbo].[prc_get_rous_read].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_get_rous_read]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_get_rous_read] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_get_rous_read]
(
  @P_CODI_MODU VARCHAR(30),
  @P_CODI_USUA VARCHAR(30)
)
AS

BEGIN
        SELECT codi_rous
        FROM  SYS_USRO
        WHERE codi_modu = @P_CODI_MODU
        AND   codi_usua = @P_CODI_USUA;
END;
GO

GO
--SqlScripter----[dbo].[PRC_LCV_COMPR_SM].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_LCV_COMPR_SM]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_LCV_COMPR_SM] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_LCV_COMPR_SM]
(@p_codi_empr numeric(9),
	@p_periodo varchar(8),
	@p_TipoLibro VARCHAR(10),
	@p_CodigoAutorizacion VARCHAR(20),
	@p_corr_ejec numeric(22) output,
	@p_codi_erro varchar(1) output,
	@p_mens_erro varchar(200) output)
as
BEGIN
--SP1 SE 5.2
declare
	@primer_dia varchar(10),
	@ultimo_dia varchar(10),
	@v_correlativo numeric(22),
	@v_rutt_empr numeric(11),
	@v_digi_empr varchar(1),
	@v_feho_firm varchar(20),
	@v_vers_licv varchar(10),
	@v_tipo_refe varchar(3),
	@v_foli_refe varchar(18),
	@v_codi_refe varchar(10),
	@v_fech_refe varchar(10),
	@v_iva_rtto  varchar(18),
	@v_iva_rtpa  varchar(18),
	@v_retIva 	varchar(18),
	@vm_iva_rtto 	varchar(18),
	@vm_iva_rtpa 	varchar(18),
	@vm_retIva 	varchar(18),
	@v_lugar	varchar(60),
	@lugar varchar(200),
	@valo_camb numeric(22,4),
	@pc_tipo_docu numeric(3), -- variable q se ocupa en los cursores
	@pc_foli_docu numeric(10) -- variable q se ocupa en los cursores	
	

	BEGIN TRANSACTION
	print('********************************************')
	set @lugar = 'Comienzo' 
	set @p_codi_erro = 'N'
	--Procesar encabezado
	set @v_correlativo = 0
	select @primer_dia = @p_periodo + '-01'
	select @ultimo_dia = convert(char(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,convert(datetime, @p_periodo+'-01', 120))+1,0)),120)
	
	set @lugar = 'recuoerando valor de la secuencia'
	--INSERT INTO seq_dte_lcv(SEQ_VALO) VALUES ('X')
	--SELECT @v_correlativo = @@IDENTITY
	select @v_correlativo = ISNULL(max(corr_licv),0)+1 from lcv_resu_libr
	print('correlativo libro: '+convert(varchar,@v_correlativo))
	print('antes delete lcv_deta_nore')
	DELETE FROM LCV_DETA_NORE WHERE CORR_LICV = @v_correlativo
	if (@@ERROR <> 0)
	begin
	  	set @p_codi_erro = 'S'
		set @p_mens_erro = 'Error. Al recuperar valor de secuencia'
		print(@lugar)
	end
	
	if @p_codi_erro = 'N' 
	begin
		set @lugar = 'recuperando datos de la empresa'
		select @v_rutt_empr=rutt_empr, @v_digi_empr=digi_empr
		from empr
		where codi_empr = @p_codi_empr;
		if (@@ERROR <> 0)
		begin
		  	set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error. Datos de la epresa no encontrados'
			print(@lugar)
		end		
	end

	if @p_codi_erro = 'N' 
	begin
		set @lugar='formando cadena fecha/hora'
		print(@lugar)
		select @v_feho_firm=convert(char(10), getdate(), 120)+'T'+convert(char(8),getdate(),8)
		print('feho_firm: '+@v_feho_firm)
		set @lugar='recuperando version'
		select @v_vers_licv=isnull(max(code_desc),' ')
		from   sys_code
		where  domain_code = 72 and code_aux = 'S'
		print('v_vers_licv :'+@v_vers_licv)
		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
		  	set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error al formar cadena de fecha/hora'
			print(@lugar)
		end	
	end;  
	
	if @p_codi_erro = 'N' 
	begin
		-- Insertar encabezado
		print('Insertando en la lcv_resu_libr')
		print('correlativo : '+convert(varchar,@v_correlativo))
		print('@p_codi_empr : '+convert(varchar,@p_codi_empr))
		print('@v_rutt_empr : '+convert(varchar,@v_rutt_empr))
		print('@v_digi_empr : '+convert(varchar,@v_digi_empr))
		print('@p_periodo : '+convert(varchar,@p_periodo))
		print('@p_TipoLibro : '+convert(varchar,@p_TipoLibro))
		print('@p_CodigoAutorizacion : '+convert(varchar,@p_CodigoAutorizacion))
		print('@v_feho_firm : '+convert(varchar,@v_feho_firm))
		print('@v_vers_licv : '+convert(varchar,@v_vers_licv))

		insert into lcv_resu_libr (CORR_LICV, CODI_EMPR, RUTT_EMIS, DIGI_EMIS,
					  CODI_PERI, TIPO_OPER, TIPO_LIBR, CODI_RECT, TIPO_SEGM,
					  NUME_SEGM, FEHO_FIRM, VERS_LICV, NUME_NOTI,ESTA_ENVI)
		values (@v_correlativo, @p_codi_empr, @v_rutt_empr, upper(@v_digi_empr),
		   		   @p_periodo, 'COMPRA', @p_TipoLibro, @p_CodigoAutorizacion, 'TOTAL',
					   NULL, @v_feho_firm, @v_vers_licv, NULL,'INI')
		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
		  	set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error al insertar encabezado'
			print(@lugar)
		end
	end
	--FIN Procesar encabezado
	



	-- FIN Procesar documentos electronicos
	if (@@ERROR <> 0)
	begin
		set @v_correlativo = null
		set @p_codi_erro = 'S'
		select @p_mens_erro = 'Error en ' + @lugar
		print(@lugar)
	end

	
	if (@p_codi_erro = 'N') and (@@ERROR = 0)
	begin
		set @p_corr_ejec = @v_correlativo
		COMMIT TRANSACTION
	end
	else
		ROLLBACK TRANSACTION

END
GO

GO
--SqlScripter----[dbo].[PRC_LCV_CUADRATURA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_LCV_CUADRATURA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_LCV_CUADRATURA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_LCV_CUADRATURA]
(@V_CODI_EMPR NUMERIC(9),
								@V_CORR_LIBR NUMERIC(9),
									@V_CODI_ERRO VARCHAR(1) OUTPUT,
									@V_MENS_ERRO VARCHAR(300) OUTPUT)
AS

BEGIN
DECLARE
	@D_CANT_DOCU NUMERIC(12),
	@D_CANT_ANUL NUMERIC(12),
	@D_MONT_EXEN NUMERIC(12),
	@D_MONT_NETO NUMERIC(12),
	@D_MONT_IVA  NUMERIC(12),
	@D_MONT_NORE NUMERIC(12),
	@D_MONT_TOTA NUMERIC(12)

DECLARE
	@T_TIPO_DOCU NUMERIC(3),
	@T_CANT_DOCU NUMERIC(12),
	@T_CANT_ANUL NUMERIC(12),
	@T_MONT_EXEN NUMERIC(12),
	@T_MONT_NETO NUMERIC(12),
	@T_MONT_IVA  NUMERIC(12),
	@T_MONT_NORE NUMERIC(12),
	@T_MONT_TOTA NUMERIC(12)
	
DECLARE CUR_TOTA CURSOR FOR 
	SELECT 	LCV.TIPO_DOCU			TIPO_DOCU,
			LCV.CANT_DOCU			CANT_DOCU,
			LCV.TOTA_ANUL			CANT_ANUL,
			LCV.MONT_EXEN			EXENTO,
			LCV.MONT_NETO			NETO,
			LCV.MONT_VAAG			IVA,			
			LCV.MONT_NRET			MONT_NO_RETE,				
			LCV.MONT_TOTA			TOTAL
		FROM  LCV_TOTA_LIBR LCV,
		      DTE_TIPO_DOCU TIP
		WHERE LCV.CODI_EMPR = @V_CODI_EMPR
		AND   LCV.CORR_LICV = @V_CORR_LIBR
		AND   TIP.TIPO_DOCU = LCV.TIPO_DOCU
		AND   ISNULL(TIP.DOCU_ELEC,'N') = 'N'
/*FIN DECLARE CUR_TOTA*/

SET @V_CODI_ERRO = 'N'
SET @V_MENS_ERRO = '-';

	OPEN CUR_TOTA FETCH NEXT FROM CUR_TOTA
		INTO @T_TIPO_DOCU,
			@T_CANT_DOCU,
			 @T_CANT_ANUL,
			 @T_MONT_EXEN,
			 @T_MONT_NETO,
			 @T_MONT_IVA,
			 @T_MONT_NORE,
			 @T_MONT_TOTA		
		WHILE @@FETCH_STATUS=0
			BEGIN
				SELECT 	@D_CANT_DOCU = COUNT(LCV.FOLI_DOCU),
					@D_CANT_ANUL = (SELECT COUNT(*)
						   FROM LCV_DETA_DOCU D
						  WHERE D.CODI_EMPR = LCV.CODI_EMPR
							AND D.CORR_LICV = LCV.CORR_LICV
						    AND D.TIPO_DOCU = LCV.TIPO_DOCU
							AND D.VIGE_DOCU = 'A'),
					@D_MONT_EXEN = SUM(LCV.MONT_EXEN),
					@D_MONT_NETO = SUM(LCV.MONT_NETO),
					@D_MONT_IVA = SUM(LCV.MONT_VAAG),							
					@D_MONT_NORE = SUM(LCV.MONT_NRET),							
					@D_MONT_TOTA = SUM(LCV.MONT_TOTA)					
				FROM  	LCV_DETA_DOCU LCV
				WHERE 	LCV.CODI_EMPR = @V_CODI_EMPR
				AND   	LCV.CORR_LICV = @V_CORR_LIBR
				AND   	LCV.TIPO_DOCU = @T_TIPO_DOCU
				GROUP BY LCV.CODI_EMPR,
					 LCV.CORR_LICV,
					 LCV.TIPO_DOCU
				
				IF(@T_CANT_DOCU != @D_CANT_DOCU)
				BEGIN
					SET @V_CODI_ERRO = 'S'
					SET @V_MENS_ERRO = 'Tpo Doc: '+CONVERT(VARCHAR(22),@T_TIPO_DOCU)+' - Cantidad de Documentos no Cuadra. Total: '+CONVERT(VARCHAR(22),@T_CANT_DOCU)+' - Detalle: '+CONVERT(VARCHAR(22),@D_CANT_DOCU)
					
				END
				
				IF(@T_CANT_ANUL != @D_CANT_ANUL)
				BEGIN
					SET @V_CODI_ERRO = 'S'
					SET @V_MENS_ERRO = 'Tpo Doc: '+CONVERT(VARCHAR(22),@T_TIPO_DOCU)+' - Cantidad de Documentos no Cuadra. Total: '+CONVERT(VARCHAR(22),@T_CANT_ANUL)+' - Detalle: '+CONVERT(VARCHAR(22),@D_CANT_ANUL)
				END
				
				IF(@T_MONT_EXEN != @D_MONT_EXEN)
				BEGIN
					SET @V_CODI_ERRO = 'S'
					SET @V_MENS_ERRO = 'Tpo Doc: '+CONVERT(VARCHAR(22),@T_TIPO_DOCU)+' - Cantidad de Documentos no Cuadra. Total: '+CONVERT(VARCHAR(22),@T_MONT_EXEN)+' - Detalle: '+CONVERT(VARCHAR(22),@D_MONT_EXEN)
				END
				
				IF(@T_MONT_NETO != @D_MONT_NETO)
				BEGIN
					SET @V_CODI_ERRO = 'S'
					SET @V_MENS_ERRO = 'Tpo Doc: '+CONVERT(VARCHAR(22),@T_TIPO_DOCU)+' - Cantidad de Documentos no Cuadra. Total: '+CONVERT(VARCHAR(22),@T_MONT_NETO)+' - Detalle: '+CONVERT(VARCHAR(22),@D_MONT_NETO)
				END
				
				IF(@T_MONT_IVA != @D_MONT_IVA)
				BEGIN
					SET @V_CODI_ERRO = 'S'
					SET @V_MENS_ERRO = 'Tpo Doc: '+CONVERT(VARCHAR(22),@T_TIPO_DOCU)+' - Cantidad de Documentos no Cuadra. Total: '+CONVERT(VARCHAR(22),@T_MONT_IVA)+' - Detalle: '+CONVERT(VARCHAR(22),@D_MONT_IVA)
				END
				
				IF(@T_MONT_NORE != @D_MONT_NORE)
				BEGIN
					SET @V_CODI_ERRO = 'S'
					SET @V_MENS_ERRO = 'Tpo Doc: '+CONVERT(VARCHAR(22),@T_TIPO_DOCU)+' - Cantidad de Documentos no Cuadra. Total: '+CONVERT(VARCHAR(22),@T_MONT_NORE)+' - Detalle: '+CONVERT(VARCHAR(22),@D_MONT_NORE)
				END
				
				IF(@T_MONT_TOTA != @D_MONT_TOTA)
				BEGIN
					SET @V_CODI_ERRO = 'S'
					SET @V_MENS_ERRO = 'Tpo Doc: '+CONVERT(VARCHAR(22),@T_TIPO_DOCU)+' - Cantidad de Documentos no Cuadra. Total: '+CONVERT(VARCHAR(22),@T_MONT_TOTA)+' - Detalle: '+CONVERT(VARCHAR(22),@D_MONT_TOTA)
				END
				
				IF(@V_CODI_ERRO = 'S')
				BEGIN
					CLOSE CUR_TOTA
					DEALLOCATE CUR_TOTA					
					RETURN
				END
				
				FETCH NEXT FROM CUR_TOTA
				INTO @T_TIPO_DOCU,
					@T_CANT_DOCU,
					 @T_CANT_ANUL,
					 @T_MONT_EXEN,
					 @T_MONT_NETO,
					 @T_MONT_IVA,
					 @T_MONT_NORE,
					 @T_MONT_TOTA
			END  --while cursor CUR_TOTA
	CLOSE CUR_TOTA
	DEALLOCATE CUR_TOTA	
END
GO

GO
--SqlScripter----[dbo].[PRC_LCV_Del_TotAju].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_LCV_Del_TotAju]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_LCV_Del_TotAju] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_LCV_Del_TotAju]
(@p_codi_empr numeric(9),
	@p_periodo varchar(8),
	@p_codi_erro varchar(1) output,
	@p_mens_erro varchar(200) output)
as
BEGIN
	
	declare
		@v_correlativo numeric(22)
	declare c_delete cursor for
		select corr_licv from lcv_resu_libr 
			where codi_empr = @p_codi_empr 
			  and codi_peri = @p_periodo 
			  and tipo_oper = 'VENTA'
			  and tipo_libr in ('MENSUAL', 'RECTIFICA')
			  and tipo_segm in ('TOTAL','AJUSTE')	  	

	BEGIN TRANSACTION
		set @p_codi_erro = 'N'
		OPEN c_delete
		FETCH NEXT FROM c_delete
		into @v_correlativo
		while @@FETCH_STATUS=0
		begin
			delete lcv_deta_docu where codi_empr = @p_codi_empr and corr_licv = @v_correlativo
			delete lcv_tota_docu where codi_empr = @p_codi_empr and corr_licv = @v_correlativo
			delete lcv_tota_libr where codi_empr = @p_codi_empr and corr_licv = @v_correlativo
			delete lcv_tota_impu where codi_empr = @p_codi_empr and corr_licv = @v_correlativo
			delete lcv_tota_segm where codi_empr = @p_codi_empr and corr_licv = @v_correlativo
			delete lcv_segm_impu where codi_empr = @p_codi_empr and corr_licv = @v_correlativo
			
			if (@@ERROR <> 0)
			begin
				set @p_codi_erro = 'S'
				set @p_mens_erro = 'Error no se pueden limpiar los libros con correlativo: '+ @v_correlativo
			end
			FETCH NEXT FROM c_delete
			into @v_correlativo
		end 
		CLOSE c_delete
		DEALLOCATE c_delete

		if (@p_codi_erro = 'N')
		begin
			delete lcv_resu_libr 
			where codi_empr = @p_codi_empr 
			  and codi_peri = @p_periodo 
			  and tipo_oper = 'VENTA'
			  and tipo_libr in ('MENSUAL', 'RECTIFICA')
			  and tipo_segm in ('TOTAL','AJUSTE')
		end

		if (@p_codi_erro = 'N') and (@@ERROR = 0)
			COMMIT TRANSACTION
		else
			ROLLBACK TRANSACTION
END
GO

GO
--SqlScripter----[dbo].[PRC_LCV_LIBR_AJUS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PRC_LCV_LIBR_AJUS]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_LCV_LIBR_AJUS] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_LCV_LIBR_AJUS]
(@p_codi_empr numeric(9),
	@p_periodo varchar(8),
	@p_TipoLibro VARCHAR(10),
	@p_CodigoAutorizacion VARCHAR(20),
	@p_corr_ejec numeric(22) output,
	@p_codi_erro varchar(1) output,
	@p_mens_erro varchar(200) output)
as
BEGIN

declare
	@primer_dia varchar(10),
	@ultimo_dia varchar(10),
	@v_correlativo numeric(22),
	@v_rutt_empr numeric(11),
	@v_digi_empr varchar(1),
	@v_feho_firm varchar(20),
	@v_vers_licv varchar(10),
	@v_tipo_refe varchar(3),
	@v_foli_refe varchar(18),
	@v_codi_refe varchar(10),
	@v_iva_rtto  varchar(18),
	@v_iva_rtpa  varchar(18),
	@v_retIva 	varchar(18),
	@vm_iva_rtto 	varchar(18),
	@vm_iva_rtpa 	varchar(18),
	@vm_retIva 	varchar(18),
	@v_lugar	varchar(60),
	@lugar varchar(200),
	@pc_tipo_docu numeric(3), -- variable q se ocupa en los cursores
	@pc_foli_docu numeric(10) -- variable q se ocupa en los cursores

declare ---variables del cursor c_dctos
	@vc_tipo_docu numeric(3), @vc_foli_docu numeric(10), @vc_rutt_rece numeric(9), @vc_digi_rece varchar(1),
	@vc_tasa_vaag numeric(5,2), @vc_foli_clie varchar(12), @vc_vent_serv  numeric(1), @vc_fech_emis varchar(10),
	@vc_codi_sucu numeric(9), @vc_nomb_rece varchar(100), @vc_mont_exen numeric(22,4), @vc_mont_neto numeric(18),
	@vc_tasa_vagg numeric(5,2), @vc_cred_es65 numeric(18), @vc_gara_enva numeric(18), @vc_mont_tota numeric(22,4),
	@vc_impu_vanr numeric(18), @vc_mont_nofa numeric(18), @vc_ivag_prop numeric(18), @vc_ivag_terc numeric(18),
	@vc_impu_vaag numeric(18)
declare c_dctos cursor for 
	select	a.TIPO_DOCU tipo_docu, a.FOLI_DOCU foli_docu, a.RUTT_RECE rutt_rece, a.DIGI_RECE digi_rece,
		a.TASA_VAAG tasa_vaag, a.FOLI_CLIE foli_clie, a.VENT_SERV vent_serv, a.FECH_EMIS fech_emis,
		a.CODI_SUCU codi_sucu, a.NOMB_RECE nomb_rece, a.MONT_EXEN mont_exen, a.MONT_NETO mont_neto,
		a.TASA_VAAG tasa_vagg, a.CRED_ES65 cred_es65, a.GARA_ENVA gara_enva, a.MONT_TOTA mont_tota,
		a.IMPU_VANR impu_vanr, a.MONT_NOFA mont_nofa, a.IVAG_PROP ivag_prop, a.IVAG_TERC ivag_terc,
		a.IMPU_VAAG impu_vaag
	from dte_enca_docu a, dte_esta_docu b
	where a.codi_empr = @p_codi_empr
	  and a.tipo_docu != 52
	  and a.fech_emis between @p_periodo + '-01' and convert(char(10),dateadd(mm,1,dateadd(dd, -1, convert(datetime, @p_periodo+'-01', 120))),120)
	  and a.esta_docu = b.esta_docu
	  and b.indi_libr = 'S'
	  and not exists
	  	  (select 1
		   from   lcv_deta_docu c, lcv_resu_libr d
		   where	a.codi_empr = c.codi_empr
		   	and  a.tipo_docu = c.tipo_docu
				and  a.foli_docu = c.foli_docu
				and  c.corr_licv = d.corr_licv
				and  d.tipo_oper = 'VENTA')  
	--Fin declaracion Cursor c_dctos

declare -- variables del cursor c_dManuales
	@cm_TIPO_DOCU numeric(3), @cm_FOLI_DOCU numeric(10), @cm_TIPO_OPER varchar(7), @cm_RUTT_ASOC numeric(9), @cm_DIGI_ASOC varchar(1),
   @cm_TASA_IMPU numeric(5,2), @cm_NUME_INTE numeric(10), @cm_VENT_SERV numeric(1), @cm_INDI_SICO numeric(1), @cm_FECH_DOCU varchar(10),
   @cm_CODI_SUCU numeric(10), @cm_NOMB_ASOC varchar(50), @cm_TIPO_REFE numeric(3), @cm_FOLI_REFE numeric(10), @cm_MONT_EXEN numeric(18),
   @cm_MONT_NETO numeric(18), @cm_MONT_VAAG numeric(18), @cm_MONT_VAFI numeric(18), @cm_MONT_USCO numeric(18), @cm_MONT_FUPO numeric(18),
	@cm_MONT_LE18 numeric(18), @cm_MONT_SICR numeric(18), @cm_IVAG_RTTO numeric(18), @cm_IVAG_RTPA numeric(18), @cm_MONT_CRED numeric(18),
   @cm_MONT_ENVA numeric(18), @cm_MONT_TOTA numeric(18), @cm_MONT_NRET numeric(18), @cm_MONT_NOFA numeric(18), @cm_MONT_PERI numeric(18),
   @cm_MONT_PANA numeric(18), @cm_MONT_PAIN numeric(18), @cm_VAAG_PROP numeric(18), @cm_VAAG_TERC numeric(18)
declare c_dManuales cursor for
  	select TIPO_DOCU, FOLI_DOCU, TIPO_OPER, RUTT_ASOC, DIGI_ASOC,
  		   TASA_IMPU, NUME_INTE, VENT_SERV, INDI_SICO, FECH_DOCU,
		   CODI_SUCU, NOMB_ASOC, TIPO_REFE, FOLI_REFE, MONT_EXEN,
		   MONT_NETO, MONT_VAAG, MONT_VAFI, MONT_USCO, MONT_FUPO,
		   MONT_LE18, MONT_SICR, IVAG_RTTO, IVAG_RTPA, MONT_CRED,
		   MONT_ENVA, MONT_TOTA, MONT_NRET, MONT_NOFA, MONT_PERI,
		   MONT_PANA, MONT_PAIN, VAAG_PROP, VAAG_TERC
	from   lcv_digi_docu a
   where  codi_empr = @p_codi_empr
		and  tipo_docu != 50
		and  fech_docu between @p_periodo + '-01' and convert(char(10),dateadd(mm,1,dateadd(dd, -1, convert(datetime, @p_periodo+'-01', 120))),120)
		and  not exists
	  	  (select 1
		   from   lcv_deta_docu c, lcv_resu_libr d
		   where  a.codi_empr = c.codi_empr
		     and  a.tipo_docu = c.tipo_docu
			 and  a.foli_docu = c.foli_docu
			 and  c.corr_licv = d.corr_licv
			 and  d.tipo_oper = 'VENTA')

-- Fin cursores
	BEGIN TRANSACTION
	set @lugar = 'Comienzo' 
	set @p_codi_erro = 'N'
	--Procesar encabezado
	set @v_correlativo = 0
	set @primer_dia = @p_periodo + '-01'
	select @ultimo_dia = convert(char(10),dateadd(mm,1,dateadd(dd, -1, convert(datetime, @p_periodo+'-01', 120))),120)
	
	set @lugar = 'recuoerando valor de la secuencia'
	--INSERT INTO seq_dte_lcv(SEQ_VALO) VALUES ('X')
	--SELECT @v_correlativo = @@IDENTITY
	select @v_correlativo = ISNULL(max(corr_licv),0)+1 from lcv_resu_libr
	if (@@ERROR <> 0)
	begin
	  	set @p_codi_erro = 'S'
		set @p_mens_erro = 'Error. Al recuperar valor de secuencia'
		print(@lugar)
	end
	
	if @p_codi_erro = 'N' 
	begin
		set @lugar = 'recuoerando datos de la empresa'
		select @v_rutt_empr=rutt_empr, @v_digi_empr=digi_empr
		from empr
		where codi_empr = @p_codi_empr;
		if (@@ERROR <> 0)
		begin
		  	set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error. Datos de la epresa no encontrados'
			print(@lugar)
		end		
	end

	if @p_codi_erro = 'N' 
	begin
		set @lugar='formando cadena fecha/hora'
		select @v_feho_firm=convert(char(10), getdate(), 120)+'T'+convert(char(8),getdate(),8)
		set @lugar='recuperando version'
		select @v_vers_licv=isnull(max(code_desc),' ')
		from   sys_code
		where  domain_code = 72 and code_aux = 'S'
		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
		  	set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error al formar cadena de feha/hora'
			print(@lugar)
		end	
	end;  
	
	if @p_codi_erro = 'N' 
	begin
		-- Insertar encabezado
		insert into lcv_resu_libr (CORR_LICV, CODI_EMPR, RUTT_EMIS, DIGI_EMIS,
					  CODI_PERI, TIPO_OPER, TIPO_LIBR, CODI_RECT, TIPO_SEGM,
					  NUME_SEGM, FEHO_FIRM, VERS_LICV, NUME_NOTI,
					  CODI_EMEX)
		values (@v_correlativo, @p_codi_empr, @v_rutt_empr, @v_digi_empr,
		   		   @p_periodo, 'VENTA', @p_TipoLibro, @p_CodigoAutorizacion, 'AJUSTE',
					   NULL, @v_feho_firm, @v_vers_licv, NULL,
					   NULL)
		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
		  	set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error al insertar encabezado'
			print(@lugar)
		end
	end
	--FIN Procesar encabezado
	
	if @p_codi_erro = 'N' -- if x1
	begin
		-- Procesar documentos electronicos
		set @v_lugar = 'Antes del for cursor c_dctos';
		OPEN c_dctos
		FETCH NEXT FROM c_dctos
		into @vc_tipo_docu ,@vc_foli_docu ,@vc_rutt_rece ,@vc_digi_rece,
			@vc_tasa_vaag ,@vc_foli_clie , @vc_vent_serv  ,@vc_fech_emis,
			@vc_codi_sucu , @vc_nomb_rece ,@vc_mont_exen ,@vc_mont_neto,
			@vc_tasa_vagg ,@vc_cred_es65 ,@vc_gara_enva ,@vc_mont_tota ,
			@vc_impu_vanr  ,@vc_mont_nofa ,@vc_ivag_prop ,@vc_ivag_terc,
			@vc_impu_vaag
		while @@FETCH_STATUS=0
		begin
			set @v_lugar = 'dentro cursor c_dctos';
			if @vc_tipo_docu  = 61 
			begin	--if x2
				set @v_lugar = 'dentro cursor c_dctos, (tipo_docu = 61)'			
				select top 1 @v_tipo_refe=tipo_refe, @v_foli_refe=foli_refe, @v_codi_refe=codi_refe
				from   dte_docu_refe
				where  codi_empr = @p_codi_empr and tipo_docu = 61 and foli_docu = @vc_foli_docu
			  --and rownum = 1
				set @v_lugar = 'en cursor c_dctos,(tipo_docu = 61) despues de referencias'
				if (@v_tipo_refe not in (33, 56) or @v_codi_refe <> 1)
				begin
					set @v_tipo_refe = null
					set @v_foli_refe = null
				end
				if (@@ERROR <> 0)
				begin
					set @v_correlativo = null
		  			set @p_codi_erro = 'S'
					set @p_mens_erro = 'Error en referencia electronica para el DTE: '+@vc_tipo_docu+' con folio: '+@vc_foli_docu
					print(@lugar)
				end
			end --if x2
			else
			begin
				if @vc_tipo_docu = 46
				begin
					set @v_lugar = 'en cursor c_dctos (tipo_docu 46)'
			   	set @v_retIva = @vc_impu_vaag - @vc_impu_vanr
					if @v_retIva = @vc_impu_vaag 
						set @v_iva_rtto = @v_retIva
					else
						set @v_iva_rtpa = @v_retIva
					set @v_lugar = 'en cursor c_dctos,(tipo_docu 46) despues if IVA'
				end
			end
		
			if @p_codi_erro = 'N'
			begin -- if x3
				set @v_lugar = 'en cursor c_dctos antes bloque insert deta_docu'
				insert into lcv_deta_docu (CODI_EMPR, CORR_LICV, TIPO_DOCU, FOLI_DOCU,
						   RUTT_ASOC, DIGI_ASOC, CODI_OPER,
						   TASA_IMPU, NUME_INTE, VENT_SERV,
						   FECH_DOCU, CODI_SUCU, NOMB_ASOC,
						   TIPO_REFE, FOLI_REFE, MONT_EXEN, MONT_NETO,
						   MONT_VAAG, IVA_RTTO, IVA_RTPA,
						   MONT_CRED, MONT_ENVA, MONT_TOTA, MONT_NRET,
						   MONT_NOFA, CODI_EMEX, VAAG_PROP, VAAG_TERC)
				values (@p_codi_empr, @v_correlativo, @vc_tipo_docu, @vc_foli_docu,
						   @vc_rutt_rece, @vc_digi_rece, 0,
						   @vc_tasa_vaag, @vc_foli_clie, @vc_vent_serv,
						   @vc_fech_emis, @vc_codi_sucu, @vc_nomb_rece,
						   @v_tipo_refe, @v_foli_refe, @vc_mont_exen, @vc_mont_neto,
						   @vc_impu_vaag, @v_iva_rtto, @v_iva_rtpa,
						   @vc_cred_es65, @vc_gara_enva, @vc_mont_tota, @vc_impu_vanr,
						   @vc_mont_nofa, null, @vc_ivag_prop, @vc_ivag_terc)
				if (@@ERROR <> 0)
				begin
					set @v_correlativo = null
					set @p_codi_erro = 'S'
					set @p_mens_erro = 'Error insertando doc elect ajuste folio: '+ @vc_foli_docu
					print(@lugar)
				end
			end -- if x3
		
			if @p_codi_erro = 'N'
			begin -- if x4 
				set @v_lugar = 'en cursor c_dctos antes cursor imp'
				--c_impuestos(vc_dcto.tipo_docu, vc_dcto.foli_docu) llamada oracle
				declare --variables del cursor c_impuestos
					@vi_codi_impu varchar(6), @vi_mont_impu numeric(18), @vi_tasa_impu numeric(5,2)
				declare c_impuestos cursor for
				  	select codi_impu, mont_impu, tasa_impu
					from dte_suma_impu
					where codi_empr = @p_codi_empr
					  and tipo_docu = @vc_tipo_docu
					  and foli_docu = @vc_foli_docu

				--set @pc_tipo_docu = @vc_tipo_docu
				--set @pc_foli_docu = @vc_foli_docu
				OPEN c_impuestos
				FETCH NEXT FROM c_impuestos
				into @vi_codi_impu, @vi_mont_impu, @vi_tasa_impu
				while @@FETCH_STATUS=0
				begin
				 	insert into lcv_tota_docu (CODI_EMPR, CORR_LICV, TIPO_DOCU, FOLI_DOCU,
			   					   RUTT_ASOC, CODI_IMPU, TAS_IMPU, MONT_IMPU,
									   CODI_EMEX, CODI_OPER)
				   values (@p_codi_empr, @v_correlativo, @vc_tipo_docu, @vc_foli_docu,
		  		   	   		   @vc_rutt_rece, @vi_codi_impu, @vi_tasa_impu, @vi_mont_impu,
									   null, 1)
					if (@@ERROR <> 0)
					begin
						set @v_correlativo = null
						set @p_codi_erro = 'S'
						set @p_mens_erro = 'Error insertando impts de doc elect folio: '+ @vc_foli_docu
						print(@lugar)
						CLOSE c_impuestos
						DEALLOCATE c_impuestos
					end
					FETCH NEXT FROM c_impuestos
					into @vi_codi_impu, @vi_mont_impu, @vi_tasa_impu
				end -- fin while
				CLOSE c_impuestos
				DEALLOCATE c_impuestos
				if (@@ERROR <> 0)
				begin
					set @v_correlativo = null
					set @p_codi_erro = 'S'
					set @p_mens_erro = 'Error al insertar impuestos de documentos electronicos'
					print(@lugar)
				end
			end -- if x4
		
			set @v_lugar = 'en cursor c_dctos antes de end loop'
			FETCH NEXT FROM c_dctos
			into @vc_tipo_docu ,@vc_foli_docu ,@vc_rutt_rece ,@vc_digi_rece,
				@vc_tasa_vaag ,@vc_foli_clie , @vc_vent_serv  ,@vc_fech_emis,
				@vc_codi_sucu , @vc_nomb_rece ,@vc_mont_exen ,@vc_mont_neto,
				@vc_tasa_vagg ,@vc_cred_es65 ,@vc_gara_enva ,@vc_mont_tota ,
				@vc_impu_vanr  ,@vc_mont_nofa ,@vc_ivag_prop ,@vc_ivag_terc,
				@vc_impu_vaag
		end  --while cursor c_dctos
		CLOSE c_dctos
	end -- if x1
	set @v_lugar = 'Fin cursor c_dctos'
	-- FIN Procesar documentos electronicos
	if (@@ERROR <> 0)
	begin
		set @v_correlativo = null
		set @p_codi_erro = 'S'
		set @p_mens_erro = 'Error en ' + @lugar
		print(@lugar)
	end

	if @p_codi_erro = 'N'-- if m1
	begin
	 	-- Procesar documentos manuales
		set @v_lugar = 'Antes del for cursor c_dManuales'
		OPEN c_dManuales
		FETCH NEXT FROM c_dManuales
		into @cm_TIPO_DOCU, @cm_FOLI_DOCU, @cm_TIPO_OPER, @cm_RUTT_ASOC, @cm_DIGI_ASOC,
			@cm_TASA_IMPU, @cm_NUME_INTE, @cm_VENT_SERV, @cm_INDI_SICO, @cm_FECH_DOCU,
			@cm_CODI_SUCU, @cm_NOMB_ASOC, @cm_TIPO_REFE, @cm_FOLI_REFE, @cm_MONT_EXEN,
			@cm_MONT_NETO, @cm_MONT_VAAG, @cm_MONT_VAFI, @cm_MONT_USCO, @cm_MONT_FUPO,
			@cm_MONT_LE18, @cm_MONT_SICR, @cm_IVAG_RTTO, @cm_IVAG_RTPA, @cm_MONT_CRED,
			@cm_MONT_ENVA, @cm_MONT_TOTA, @cm_MONT_NRET, @cm_MONT_NOFA, @cm_MONT_PERI,
			@cm_MONT_PANA, @cm_MONT_PAIN, @cm_VAAG_PROP, @cm_VAAG_TERC 
		while @@FETCH_STATUS=0
		begin
			set @v_lugar = 'en cursor c_dManuales, antes del if tipo_docu = 45'
			if @cm_TIPO_DOCU = 45
				set @vm_retIva = @cm_MONT_VAAG - @cm_MONT_NRET;
				if @vm_retIva = @cm_MONT_VAAG
					set @vm_iva_rtto = @vm_retIva;
				else
					set @vm_iva_rtpa = @vm_retIva;
			
			if @p_codi_erro = 'N' -- m2
			begin
				set @v_lugar = 'en cursor c_dManuales, antes del bloque insert deta_docu'
				insert into lcv_deta_docu (CODI_EMPR, CORR_LICV, TIPO_DOCU, FOLI_DOCU,
					   					   RUTT_ASOC, DIGI_ASOC, CODI_OPER,
										   TASA_IMPU, NUME_INTE, VENT_SERV,
										   INDI_SICO, FECH_DOCU, CODI_SUCU, NOMB_ASOC,
										   TIPO_REFE, FOLI_REFE, MONT_EXEN, MONT_NETO,
										   MONT_VAAG, MONT_VAFI, MONT_USCO, MONT_FUPL,
										   MONT_LE18, MONT_SICR, IVA_RTTO, IVA_RTPA,
										   MONT_CRED, MONT_ENVA, MONT_TOTA, MONT_NRET,
										   MONT_NOFA, MONT_PERI, MONT_PANA, MONT_PAIN,
										   VAAG_PROP, VAAG_TERC)
								   values (@p_codi_empr, @v_correlativo, @cm_TIPO_DOCU, @cm_FOLI_DOCU, 
											@cm_RUTT_ASOC, @cm_DIGI_ASOC, 1,
											@cm_TASA_IMPU, @cm_NUME_INTE, @cm_VENT_SERV, 
											@cm_INDI_SICO, @cm_FECH_DOCU,	@cm_CODI_SUCU, @cm_NOMB_ASOC, 
											@cm_TIPO_REFE, @cm_FOLI_REFE, @cm_MONT_EXEN,	@cm_MONT_NETO,
											@cm_MONT_VAAG, @cm_MONT_VAFI, @cm_MONT_USCO, @cm_MONT_FUPO,
											@cm_MONT_LE18, @cm_MONT_SICR, @cm_IVAG_RTTO, @cm_IVAG_RTPA,
											@cm_MONT_CRED,	@cm_MONT_ENVA, @cm_MONT_TOTA, @cm_MONT_NRET,
											@cm_MONT_NOFA, @cm_MONT_PERI,	@cm_MONT_PANA, @cm_MONT_PAIN,
											@cm_VAAG_PROP, @cm_VAAG_TERC)			
				if (@@ERROR <> 0)
				begin
					set @v_correlativo = null
					set @p_codi_erro = 'S'
					set @p_mens_erro = 'Error al insertar documentos manuales'
					print(@lugar)
				end
			end -- if m2

			if @p_codi_erro = 'N' -- m3
			begin
				set @v_lugar = 'en cursor c_dManuales, antes del bloque cursor imp'
				-- c_impuManu(vc_dm.tipo_docu, vc_dm.foli_docu) llamada oracle
				declare --variables del cursor c_impuManu
					@vim_codi_impu varchar(6), @vim_mont_impu numeric(18), @vim_tasa_impu numeric(5,2)
				declare c_impuManu cursor for
				  	select codi_impu, mont_impu, tasa_impu
					from lcv_digi_impu
					where codi_empr = @p_codi_empr
					  and tipo_docu = @cm_tipo_docu
					  and foli_docu = @cm_foli_docu
				--set @pc_tipo_docu = @cm_tipo_docu
				--set @pc_foli_docu = @cm_foli_docu
				OPEN c_impuManu
				FETCH NEXT FROM c_impuManu
				into @vim_codi_impu, @vim_mont_impu, @vim_tasa_impu
				while @@FETCH_STATUS=0
				begin
				 	insert into lcv_tota_docu (CODI_EMPR, CORR_LICV, TIPO_DOCU, FOLI_DOCU,
											RUTT_ASOC, CODI_IMPU, TAS_IMPU, MONT_IMPU,
											CODI_EMEX, CODI_OPER)
							values (@p_codi_empr, @v_correlativo, @cm_tipo_docu, @cm_foli_docu,
						   				@cm_rutt_asoc, @vim_codi_impu, @vim_tasa_impu, @vim_mont_impu,
											null, 1);
					if (@@ERROR <> 0)
					begin
						set @v_correlativo = null
						set @p_codi_erro = 'S'
						set @p_mens_erro = 'Error insertando impts de doc manual folio: '+ @cm_foli_docu
						print(@lugar)
					end
				FETCH NEXT FROM c_impuManu
				into @vim_codi_impu, @vim_mont_impu, @vim_tasa_impu
				end -- while cursor c_impuManu
				CLOSE c_impuManu
				DEALLOCATE c_impuManu
			end -- if m3
			set @v_lugar = 'en cursor c_dManuales, antes de end loop'
			FETCH NEXT FROM c_impuestos
			into @cm_TIPO_DOCU, @cm_FOLI_DOCU, @cm_TIPO_OPER, @cm_RUTT_ASOC, @cm_DIGI_ASOC,
				@cm_TASA_IMPU, @cm_NUME_INTE, @cm_VENT_SERV, @cm_INDI_SICO, @cm_FECH_DOCU,
				@cm_CODI_SUCU, @cm_NOMB_ASOC, @cm_TIPO_REFE, @cm_FOLI_REFE, @cm_MONT_EXEN,
				@cm_MONT_NETO, @cm_MONT_VAAG, @cm_MONT_VAFI, @cm_MONT_USCO, @cm_MONT_FUPO,
				@cm_MONT_LE18, @cm_MONT_SICR, @cm_IVAG_RTTO, @cm_IVAG_RTPA, @cm_MONT_CRED,
				@cm_MONT_ENVA, @cm_MONT_TOTA, @cm_MONT_NRET, @cm_MONT_NOFA, @cm_MONT_PERI,
				@cm_MONT_PANA, @cm_MONT_PAIN, @cm_VAAG_PROP, @cm_VAAG_TERC 
		end -- while c_dManuales
		CLOSE c_dManuales
		SET @v_lugar = 'Fin cursor c_dManuales'
		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
			set @p_codi_erro = 'S'
			SET @p_mens_erro = 'Error: ' + @v_lugar
			print(@lugar)
		end
	end -- if m1 Procesar dctos manuales

	if @p_codi_erro = 'N' -- if totalizador RESUMEN DE SEGMENTO
	begin
	 	-- Generar totalizadores
		-- Totalizar RESUMEN DE SEGMENTO
		insert into lcv_tota_segm (CORR_LICV, CODI_EMPR, TIPO_DOCU,
		   		  	   		  CANT_DOCU, MONT_EXEN, MONT_NETO,
									  MONT_VAAG,
									  MONT_LE18, IMPU_SICR, IVA_RTTO ,
									  IVA_RTPA, MONT_CRED, MONT_ENVA,
									  MONT_TOTA, MONT_NRET, MONT_NOFA, MONT_PERI,
									  MONT_PANA, MONT_PAIN, MONT_TAPU, MONT_TACI,
									  MONT_TAEL, IVA_FUPL,
									  VAAG_TERC, MONT_FIJO,
									  VAAG_PROP, MONT_VAFI)
							   select @v_correlativo, CODI_EMPR, TIPO_DOCU,
									  count(TIPO_DOCU), sum(MONT_EXEN), sum(MONT_NETO),
									  sum(MONT_VAAG),
									  sum(MONT_LE18), sum(MONT_SICR), sum(IVA_RTTO),
	   							  sum(IVA_RTPA), sum(MONT_CRED), sum(MONT_ENVA),
									  sum(MONT_TOTA), sum(MONT_NRET), sum(MONT_NOFA), sum(MONT_PERI),
									  sum(MONT_PANA), sum(MONT_PAIN), sum(MONT_TAPU), sum(MONT_TACI),
									  sum(MONT_TAEL), sum(MONT_FUPL),
									  sum(VAAG_TERC), sum(MONT_FIJO),
	   							  sum(VAAG_PROP), sum(MONT_VAFI)
									  from lcv_deta_docu
									  where CODI_EMPR=@p_codi_empr and CORR_LICV=@v_correlativo
									  group by CORR_LICV, CODI_EMPR, TIPO_DOCU
		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
			set @p_codi_erro = 'S'
			SET @p_mens_erro = 'Error al generar totalizadores de documentos (Ajustes)'
			print(@lugar)
		end
	end -- if totalizador RESUMEN DE SEGMENTO
	if @p_codi_erro = 'N'
	begin
		insert into lcv_segm_impu (CORR_LICV, CODI_EMPR, TIPO_DOCU,
		   		  	   				  CODI_IMPU, MONT_IMPU)
							   select @v_correlativo, CODI_EMPR, TIPO_DOCU,
							   		  CODI_IMPU, sum(MONT_IMPU)
									  from lcv_tota_docu
									  where CODI_EMPR=@p_codi_empr and CORR_LICV=@v_correlativo
									  group by CORR_LICV, CODI_EMPR, TIPO_DOCU, CODI_IMPU;
		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
			set @p_codi_erro = 'S'
			SET @p_mens_erro = 'Error al generar totalizadores de impuestos (Ajustes)'
			print(@lugar)
		end
	end 
	-- Fin Totalizar RESUMEN DE SEGMENTO

	-- Totalizar RESUMEN DEL PERIODO
	if @p_codi_erro = 'N'
	begin -- if resumen periodo
	   insert into lcv_tota_libr (CORR_LICV, CODI_EMPR, TIPO_DOCU,
		   		  	   				  CANT_DOCU, MONT_EXEN, MONT_NETO,
									  MONT_VAAG,
									  MONT_LE18, IMPU_SICR, IVA_RTTO ,
									  IVA_RTPA, MONT_CREC, MONT_ENVA,
									  MONT_TOTA, MONT_NRET, MONT_NOFA, MONT_PERI,
									  MONT_PANA, MONT_PAIN, MONT_TAPU, MONT_TACI,
									  MONT_TAEL, IVA_FUPL,
									  VAAG_TERC, MONT_FIJO,
									  VAAG_PROP, MONT_VAFI)
							   select @v_correlativo, CODI_EMPR, TIPO_DOCU,
									  count(TIPO_DOCU), sum(MONT_EXEN), sum(MONT_NETO),
									  sum(MONT_VAAG),
									  sum(MONT_LE18), sum(MONT_SICR), sum(IVA_RTTO),
	   							  sum(IVA_RTPA), sum(MONT_CRED), sum(MONT_ENVA),
									  sum(MONT_TOTA), sum(MONT_NRET), sum(MONT_NOFA), sum(MONT_PERI),
									  sum(MONT_PANA), sum(MONT_PAIN), sum(MONT_TAPU), sum(MONT_TACI),
									  sum(MONT_TAEL), sum(MONT_FUPL),
									  sum(VAAG_TERC), sum(MONT_FIJO),
	   							  sum(VAAG_PROP), sum(MONT_VAFI)
							   from lcv_deta_docu
							   where CODI_EMPR=@p_codi_empr and substring(FECH_DOCU,1,7)=@p_periodo
								  and CORR_LICV in
									  (select corr_licv from lcv_deta_docu
								 	   where CODI_EMPR=@p_codi_empr and substring(FECH_DOCU,1,7)=@p_periodo)
							   group by CORR_LICV, CODI_EMPR, TIPO_DOCU
		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
			set @p_codi_erro = 'S'
			SET @p_mens_erro = 'Error al generar totalizadores de documentos (Ajustes)'
			print(@lugar)
		end
	end -- if resumen periodo
	-- fin Totalizar RESUMEN DEL PERIODO

	if (@p_codi_erro = 'N') and (@@ERROR = 0)
	begin
     	 set @p_corr_ejec = @v_correlativo;
		 COMMIT TRANSACTION
	end
	else
		ROLLBACK TRANSACTION

	DEALLOCATE c_dctos
	DEALLOCATE c_dManuales
END
GO

GO
--SqlScripter----[dbo].[PRC_LCV_LIBR_TOTA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_LCV_LIBR_TOTA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_LCV_LIBR_TOTA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_LCV_LIBR_TOTA]
(@p_codi_empr numeric(9),
	@p_periodo varchar(8),
	@p_TipoLibro VARCHAR(10),
	@p_CodigoAutorizacion VARCHAR(20),
	@p_corr_ejec numeric(22) output,
	@p_codi_erro varchar(1) output,
	@p_mens_erro varchar(200) output)
as
BEGIN
	declare
	@primer_dia varchar(10),
	@ultimo_dia varchar(10),
	@v_correlativo numeric(22),
	@v_rutt_empr numeric(11),
	@v_digi_empr varchar(1),
	@v_feho_firm varchar(20),
	@v_vers_licv varchar(10),
	@v_tipo_refe varchar(3),
	@v_foli_refe varchar(18),
	@v_codi_refe varchar(10),
	@v_fech_refe varchar(10),
	@v_iva_rtto  varchar(18),
	@v_iva_rtpa  varchar(18),
	@v_retIva 	varchar(18),
	@vm_iva_rtto 	varchar(18),
	@vm_iva_rtpa 	varchar(18),
	@vm_retIva 	varchar(18),
	@v_lugar	varchar(60),
	@lugar varchar(200),
	@valo_camb numeric(22,4),
	@pc_tipo_docu numeric(3), -- variable q se ocupa en los cursores
	@pc_foli_docu numeric(10) -- variable q se ocupa en los cursores	
	
	declare ---variables del cursor c_dctos
	@vc_tipo_docu numeric(3), @vc_foli_docu numeric(10), @vc_rutt_rece numeric(9), @vc_digi_rece varchar(1),
	@vc_tasa_vaag numeric(5,2), @vc_foli_clie varchar(12), @vc_vent_serv  numeric(1), @vc_fech_emis varchar(10),
	@vc_codi_sucu numeric(9), @vc_nomb_rece varchar(100), @vc_mont_exen numeric(22,4), @vc_mont_neto numeric(18),
	@vc_tasa_vagg numeric(5,2), @vc_cred_es65 numeric(18), @vc_gara_enva numeric(18), @vc_mont_tota numeric(22,4),
	@vc_impu_vanr numeric(18), @vc_mont_nofa numeric(18), @vc_ivag_prop numeric(18), @vc_ivag_terc numeric(18),
	@vc_impu_vaag numeric(18),@vc_tipo_mone varchar(15), @vc_impu_norec numeric(18)
	--OBTIENE TODOS LOS DOCUMENTOS QUE ESTAN EN LA DTE_ENCA_DOCU Y FUERON ACEPTADOS POR EL SERVICIOS 
	--Y SU TIPO ES PARA LIBRO DE VENTA
	declare c_dctos cursor for 
	select	a.TIPO_DOCU tipo_docu, a.FOLI_DOCU foli_docu, a.RUTT_RECE rutt_rece, a.DIGI_RECE digi_rece,
		a.TASA_VAAG tasa_vaag, a.FOLI_CLIE foli_clie, a.VENT_SERV vent_serv, a.FECH_EMIS fech_emis,
		a.CODI_SUCU codi_sucu, substring(a.NOMB_RECE,0,50) nomb_rece, a.MONT_EXEN mont_exen, a.MONT_NETO mont_neto,
		a.TASA_VAAG tasa_vagg, a.CRED_ES65 cred_es65, a.GARA_ENVA gara_enva, a.MONT_TOTA mont_tota,
		a.IMPU_VANR impu_vanr, a.MONT_NOFA mont_nofa, a.IVAG_PROP ivag_prop, a.IVAG_TERC ivag_terc,
		a.IMPU_VAAG impu_vaag, a.TIPO_MONE tipo_mone
	from dte_enca_docu a, dte_esta_docu b
	where a.codi_empr = @p_codi_empr
	  and a.tipo_docu != 52
	  and a.esta_docu in ('DOK','RLV','RPR')
	  and a.fech_emis between @p_periodo+'-01' and convert(char(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,convert(datetime, @p_periodo+'-01', 120))+1,0)),120)
	  and a.esta_docu = b.esta_docu
	  and b.indi_libr = 'S'
	  and not exists(select 1 from bel_foli_anul c
				  where c.codi_empr = a.codi_empr
				  and c.foli_anul = a.foli_docu
				  and c.tipo_docu = a.tipo_docu)
	  
	--Fin declaracion Cursor cur_enca_docu

	declare -- variables del cursor c_dManuales
	@cm_TIPO_DOCU numeric(3), @cm_FOLI_DOCU numeric(10), @cm_TIPO_OPER varchar(7), @cm_RUTT_ASOC numeric(9), @cm_DIGI_ASOC varchar(1),
	@cm_TASA_IMPU numeric(5,2), @cm_NUME_INTE numeric(10), @cm_VENT_SERV numeric(1), @cm_INDI_SICO numeric(1), @cm_FECH_DOCU varchar(10),
	@cm_CODI_SUCU numeric(10), @cm_NOMB_ASOC varchar(50), @cm_TIPO_REFE numeric(3), @cm_FOLI_REFE numeric(10), @cm_MONT_EXEN numeric(18),
	@cm_MONT_NETO numeric(18), @cm_MONT_VAAG numeric(18), @cm_MONT_VAFI numeric(18), @cm_MONT_USCO numeric(18), @cm_MONT_FUPO numeric(18),
	@cm_MONT_LE18 numeric(18), @cm_MONT_SICR numeric(18), @cm_IVAG_RTTO numeric(18), @cm_IVAG_RTPA numeric(18), @cm_MONT_CRED numeric(18),
	@cm_MONT_ENVA numeric(18), @cm_MONT_TOTA numeric(18), @cm_MONT_NRET numeric(18), @cm_MONT_NOFA numeric(18), @cm_MONT_PERI numeric(18),
	@cm_MONT_PANA numeric(18), @cm_MONT_PAIN numeric(18), @cm_VAAG_PROP numeric(18), @cm_VAAG_TERC numeric(18), @cm_VIGE_DOCU VARCHAR(1)
	declare c_dManuales cursor for
	select 	TIPO_DOCU, FOLI_DOCU, TIPO_OPER, RUTT_ASOC, DIGI_ASOC,
			TASA_IMPU, NUME_INTE, VENT_SERV, INDI_SICO, FECH_DOCU,
			CODI_SUCU, NOMB_ASOC, TIPO_REFE, FOLI_REFE, MONT_EXEN,
			MONT_NETO, MONT_VAAG, MONT_VAFI, MONT_USCO, MONT_FUPO,
			MONT_LE18, MONT_SICR, IVAG_RTTO, IVAG_RTPA, MONT_CRED,
			MONT_ENVA, MONT_TOTA, MONT_NRET, MONT_NOFA, MONT_PERI,
			MONT_PANA, MONT_PAIN, VAAG_PROP, VAAG_TERC, VIGE_DOCU
	from	lcv_digi_docu
	where	codi_empr = @p_codi_empr
	and		tipo_docu not IN (50,52)
	and		fech_docu between @p_periodo+'-01' and convert(char(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,convert(datetime, @p_periodo+'-01', 120))+1,0)),120)
	--and  fech_docu between @primer_dia and @ultimo_dia

	declare --variable del cursor d_bfolianul
	@bel_cant_anul numeric(10), @bel_tipo_docu numeric(3)
	--CURSOR QUE OBTIENE LA CANTIDAD DE DOCUMENTOS POR TIPO DE DOCUMENTOS ANULADOS
	declare d_bfolianul cursor for
	select count(tipo_docu), tipo_docu 
	from bel_foli_anul
	where  codi_empr = @p_codi_empr 
	and  fech_anul between @p_periodo+'-01' and convert(char(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,convert(datetime, @p_periodo+'-01', 120))+1,0)),120)
	group by tipo_docu
	
	--CURSOR QUE OBTIENE TODOS LOS DOCUMENTOS ANULADOS de la BEL_FOLI_ANUL DETALLE
	declare @ct_tipo_docu numeric(3), @ct_foli_anul numeric(10), @ct_fech_anul varchar(10)
	declare ct_docu_anul cursor for
	select	tipo_docu, foli_anul, fech_anul
	from	bel_foli_anul
	where	codi_empr = @p_codi_empr
	and		tipo_docu not in(35,38,39,41)
	and		fech_anul between @p_periodo+'-01' and convert(char(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,convert(datetime, @p_periodo+'-01', 120))+1,0)),120)


	BEGIN TRANSACTION
	set @lugar = 'Comienzo' 
	set @p_codi_erro = 'N'
	--Procesar encabezado
	set @v_correlativo = 0
	select @primer_dia = @p_periodo + '-01'
	select @ultimo_dia = convert(char(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,convert(datetime, @p_periodo+'-01', 120))+1,0)),120)
	
	set @lugar = 'recuoerando valor de la secuencia'
	--INSERT INTO seq_dte_lcv(SEQ_VALO) VALUES ('X')
	--SELECT @v_correlativo = @@IDENTITY
	select @v_correlativo = ISNULL(max(corr_licv),0)+1 from lcv_resu_libr
	print(str(@v_correlativo))
	DELETE FROM LCV_DETA_NORE WHERE CORR_LICV = @v_correlativo
	if (@@ERROR <> 0)
	begin
	  	set @p_codi_erro = 'S'
		set @p_mens_erro = 'Error. Al recuperar valor de secuencia'
		print(@lugar)
	end
	
	if @p_codi_erro = 'N' 
	begin
		set @lugar = 'recuoerando datos de la empresa'
		select @v_rutt_empr=rutt_empr, @v_digi_empr=digi_empr
		from empr
		where codi_empr = @p_codi_empr;
		if (@@ERROR <> 0)
		begin
		  	set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error. Datos de la epresa no encontrados'
			print(@lugar)
		end		
	end

	if @p_codi_erro = 'N' 
	begin
		set @lugar='formando cadena fecha/hora'
		select @v_feho_firm=convert(char(10), getdate(), 120)+'T'+convert(char(8),getdate(),8)
		set @lugar='recuperando version'
		select @v_vers_licv=isnull(max(code_desc),' ')
		from   sys_code
		where  domain_code = 72 and code_aux = 'S'
		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
		  	set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error al formar cadena de fecha/hora'
			print(@lugar)
		end	
	end;  
	
	if @p_codi_erro = 'N' 
	begin
		--Insertar encabezado
		insert into lcv_resu_libr (	CORR_LICV,		CODI_EMPR, 		RUTT_EMIS, 		DIGI_EMIS,
									CODI_PERI, 		TIPO_OPER, 		TIPO_LIBR, 		CODI_RECT,
									TIPO_SEGM,		NUME_SEGM, 		FEHO_FIRM, 		VERS_LICV, 
									NUME_NOTI,		ESTA_ENVI)
						values	(	@v_correlativo,	@p_codi_empr, 	@v_rutt_empr, 	upper(@v_digi_empr),
									@p_periodo, 	'VENTA', 		@p_TipoLibro, 	@p_CodigoAutorizacion,
									'TOTAL',		NULL, 			@v_feho_firm, 	@v_vers_licv, 
									NULL,			'INI')
		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
		  	set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error al insertar encabezado'
			print(@lugar)
		end
	end
	--FIN Procesar encabezado
	
	IF @p_codi_erro = 'N'-- if ct_docu_anul
	BEGIN
	 	-- Procesar documentos manuales
		set @v_lugar = 'Antes del for cursor c_dManuales'
		OPEN ct_docu_anul
		FETCH NEXT FROM ct_docu_anul
		into @ct_tipo_docu , @ct_foli_anul, @ct_fech_anul
		while @@FETCH_STATUS=0
		begin
			set @v_lugar = 'en cursor ct_docu_anul'
			
			insert into lcv_deta_docu(	codi_empr,		corr_licv,		tipo_docu,		foli_docu,		vige_docu,	rutt_asoc, digi_asoc,	codi_oper)
							values	 (	@p_codi_empr,	@v_correlativo,	@ct_tipo_docu,	@ct_foli_anul,	'A',		66666666,	6,			0)

		FETCH NEXT FROM ct_docu_anul
		into @ct_tipo_docu , @ct_foli_anul, @ct_fech_anul
		END
		close ct_docu_anul
		DEALLOCATE ct_docu_anul
	END --if ct_docu_anul
	
	if @p_codi_erro = 'N' -- if x1
	begin
		-- Procesar documentos electronicos
		set @v_lugar = 'Antes del for cursor c_dctos';
		OPEN c_dctos
		FETCH NEXT FROM c_dctos
		into @vc_tipo_docu,	@vc_foli_docu,	@vc_rutt_rece,	@vc_digi_rece,
			@vc_tasa_vaag,	@vc_foli_clie,	@vc_vent_serv,	@vc_fech_emis,
			@vc_codi_sucu,	@vc_nomb_rece,	@vc_mont_exen,	@vc_mont_neto,
			@vc_tasa_vagg,	@vc_cred_es65,	@vc_gara_enva,	@vc_mont_tota,
			@vc_impu_vanr,	@vc_mont_nofa,	@vc_ivag_prop,	@vc_ivag_terc,
			@vc_impu_vaag,	@vc_tipo_mone 
		while @@FETCH_STATUS=0
		begin
			set @v_lugar = 'dentro cursor c_dctos';
			SET @vc_impu_norec = 0
			if @vc_tipo_docu in (56,61) 
			begin	--if x2			
				select top 1	@v_tipo_refe=tipo_refe, 
								@v_foli_refe=foli_refe, 
								@v_codi_refe=codi_refe
				from   	dte_docu_refe r, dte_tipo_docu t
				where  	r.tipo_refe = t.tipo_docu 
				and 	t.docu_elec = 'S'
				and  	r.codi_empr = @p_codi_empr 
				and 	r.tipo_docu = @vc_tipo_docu 
				and 	r.foli_docu = @vc_foli_docu
					
				set @v_lugar = 'en cursor c_dctos,(tipo_docu 56,61) despues de referencias'				
				if @vc_tipo_docu = 61
				begin
					select 	top 1 @v_fech_refe=fech_refe
					from   	dte_docu_refe r
					where  	r.codi_empr = @p_codi_empr 
					and 	r.tipo_docu = @vc_tipo_docu 
					and 	r.foli_docu = @vc_foli_docu

					if @v_fech_refe <=  convert(char(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,convert(datetime, @p_periodo+'-01', 120))-2,0)),120)
					begin
						--SET @vc_impu_norec=@vc_impu_vaag
						SET @cm_MONT_FUPO=@vc_impu_vaag
						SET @vc_impu_vaag=0
					end
				end
				
				set @v_lugar = 'en cursor c_dctos,(tipo_docu 56,61) Iva No recuperable'
				
				if @v_tipo_refe in (45, 46)
				begin
					set @v_retIva = @vc_impu_vaag - @vc_impu_vanr
					if @v_retIva = @vc_impu_vaag
						set @v_iva_rtto = @v_retIva
					else
						set @v_iva_rtpa = @v_retIva
				end
				else
				begin
					set @v_tipo_refe = null
					set @v_foli_refe = null
				end
				if (@@ERROR <> 0)
				begin
					set @v_correlativo = null
		  			set @p_codi_erro = 'S'
					select @p_mens_erro = 'Error en referencia electronica para el DTE: '+@vc_tipo_docu+' con folio: '+@vc_foli_docu
					print(@lugar)
				end
			end --if x2
			else
			begin
				if @vc_tipo_docu = 46
				begin
					set @v_lugar = 'en cursor c_dctos (tipo_docu 46)'
			   	set @v_retIva = @vc_impu_vaag - @vc_impu_vanr
					if @v_retIva = @vc_impu_vaag 
						set @v_iva_rtto = @v_retIva
					else
						set @v_iva_rtpa = @v_retIva
					set @v_lugar = 'en cursor c_dctos,(tipo_docu 46) despues if IVA'
				end			
				
			end
			
			if @vc_tipo_docu in (110,111,112) 
			begin
				set @v_lugar = 'en cursor c_dctos (tipo_docu 110,111,112)'
				if @vc_tipo_mone != 'PESO CL'and @vc_tipo_mone != ''
				begin	
					select 	@valo_camb= valo_camb 
					from 	camb_mone 
					where 	tipo_mone= @vc_tipo_mone 
					and 	convert(char(10),CONVERT(datetime,cast(CONVERT(datetime, fech_camb, 105) as VARCHAR),120),120) = @vc_fech_emis
					
					set @vc_mont_exen = round(@vc_mont_exen * @valo_camb,0)
					set @vc_mont_tota = round(@vc_mont_tota * @valo_camb,0)
				end
				if (@@ERROR <> 0)
				begin
					set @v_correlativo = null
		  			set @p_codi_erro = 'S'
					select @p_mens_erro = 'Error en calculo de tipo moneda para DTE: '+@vc_tipo_docu+' con folio: '+@vc_foli_docu
					print(@lugar)
				end
			end

			if @p_codi_erro = 'N'
			begin -- if x3
				set @v_lugar = 'en cursor c_dctos antes bloque insert deta_docu'
				insert into lcv_deta_docu (	CODI_EMPR, 		CORR_LICV, 			TIPO_DOCU, 		FOLI_DOCU,
											RUTT_ASOC, 		DIGI_ASOC, 			CODI_OPER,		
											TASA_IMPU, 		NUME_INTE, 			VENT_SERV,		
											FECH_DOCU, 		CODI_SUCU, 			NOMB_ASOC,		
											TIPO_REFE, 		FOLI_REFE, 			MONT_EXEN, 		MONT_NETO,
											MONT_VAAG, 		IVA_RTTO,  			IVA_RTPA,		
											MONT_CRED, 		MONT_ENVA, 			MONT_TOTA, 		MONT_NRET,
											MONT_NOFA, 		VAAG_PROP, 			VAAG_TERC)
								values (	@p_codi_empr,  	@v_correlativo, 	@vc_tipo_docu, @vc_foli_docu,
											@vc_rutt_rece, 	upper(@vc_digi_rece), 				0,
											@vc_tasa_vaag, 	@vc_foli_clie, 		@vc_vent_serv,
											@vc_fech_emis, 	@vc_codi_sucu, 		@vc_nomb_rece,
											@v_tipo_refe,  	@v_foli_refe,  		@vc_mont_exen, 	@vc_mont_neto,
											@vc_impu_vaag, 	@v_iva_rtto,   		@v_iva_rtpa,
											@vc_cred_es65, 	@vc_gara_enva, 		@vc_mont_tota, 	@vc_impu_vanr,
											@vc_mont_nofa, 	@vc_ivag_prop, 		@vc_ivag_terc)
				
				if (@vc_impu_norec > 0)
					insert into lcv_deta_nore (	CODI_EMPR, 		CORR_LICV, 		TIPO_DOCU, 		FOLI_DOCU, 		RUTT_ASOC,
												CODI_NORE, 		MONT_NORE)
									values 	(	@p_codi_empr, 	@v_correlativo,	@vc_tipo_docu, 	@vc_foli_docu, 	@vc_rutt_rece,
												2, @vc_impu_norec)
										
				if (@@ERROR <> 0)
				begin
					set @v_correlativo = null
					set @p_codi_erro = 'S'
					select @p_mens_erro = 'Error insertando doc elect folio: '+ @vc_foli_docu
					print(@lugar)
				end
			end -- if x3
		
			if @p_codi_erro = 'N'
			begin -- if x4 
				set @v_lugar = 'en cursor c_dctos antes cursor imp'
				--c_impuestos(vc_dcto.tipo_docu, vc_dcto.foli_docu) llamada oracle
				declare --variables del cursor c_impuestos
					@vi_codi_impu varchar(6), @vi_mont_impu numeric(18), @vi_tasa_impu numeric(5,2)
				declare c_impuestos cursor for
				  	select	codi_impu, mont_impu, tasa_impu
					from 	dte_suma_impu
					where 	codi_empr = @p_codi_empr
					and 	tipo_docu = @vc_tipo_docu
					and 	foli_docu = @vc_foli_docu
				--set @pc_tipo_docu = @vc_tipo_docu
				--set @pc_foli_docu = @vc_foli_docu
				OPEN c_impuestos
				FETCH NEXT FROM c_impuestos
				into @vi_codi_impu, @vi_mont_impu, @vi_tasa_impu
				while @@FETCH_STATUS=0
				begin
				 	insert into lcv_tota_docu (	CODI_EMPR, 		CORR_LICV, 		TIPO_DOCU, 		FOLI_DOCU,
												RUTT_ASOC, 		CODI_IMPU, 		TAS_IMPU,  		MONT_IMPU,
												CODI_OPER)
									values	(	@p_codi_empr,  	@v_correlativo,	@vc_tipo_docu, 	@vc_foli_docu,
												@vc_rutt_rece, 	@vi_codi_impu, 	@vi_tasa_impu, 	@vi_mont_impu,
												0)
					if (@@ERROR <> 0)
					begin
						set @v_correlativo = null
						set @p_codi_erro = 'S'
						select @p_mens_erro = 'Error insertando impts de doc elect folio: '+ @vc_foli_docu
						print(@lugar)
					end
					
					FETCH NEXT FROM c_impuestos
					into @vi_codi_impu, @vi_mont_impu, @vi_tasa_impu
				end -- fin while
				CLOSE c_impuestos
				DEALLOCATE c_impuestos	
				if (@@ERROR <> 0)
				begin
					set @v_correlativo = null
					set @p_codi_erro = 'S'
					set @p_mens_erro = 'Error al insertar impuestos de documentos electronicos'
					print(@lugar)
				end
			end -- if x4
		
			set @v_lugar = 'en cursor c_dctos antes de end loop'
			FETCH NEXT FROM c_dctos
			into @vc_tipo_docu ,@vc_foli_docu ,@vc_rutt_rece ,@vc_digi_rece,
				@vc_tasa_vaag ,@vc_foli_clie , @vc_vent_serv  ,@vc_fech_emis,
				@vc_codi_sucu , @vc_nomb_rece ,@vc_mont_exen ,@vc_mont_neto,
				@vc_tasa_vagg ,@vc_cred_es65 ,@vc_gara_enva ,@vc_mont_tota ,
				@vc_impu_vanr  ,@vc_mont_nofa ,@vc_ivag_prop ,@vc_ivag_terc,
				@vc_impu_vaag, @vc_tipo_mone
		end  --while cursor c_dctos
		CLOSE c_dctos
	end -- if x1
	set @v_lugar = 'Fin cursor c_dctos'
	-- FIN Procesar documentos electronicos
	if (@@ERROR <> 0)
	begin
		set @v_correlativo = null
		set @p_codi_erro = 'S'
		select @p_mens_erro = 'Error en ' + @lugar
		print(@lugar)
	end

	if @p_codi_erro = 'N'-- if m1
	begin
	 	-- Procesar documentos manuales
		set @v_lugar = 'Antes del for cursor c_dManuales'
		OPEN c_dManuales
		FETCH NEXT FROM c_dManuales
		into @cm_TIPO_DOCU, @cm_FOLI_DOCU, @cm_TIPO_OPER, @cm_RUTT_ASOC, @cm_DIGI_ASOC,
			@cm_TASA_IMPU, @cm_NUME_INTE, @cm_VENT_SERV, @cm_INDI_SICO, @cm_FECH_DOCU,
			@cm_CODI_SUCU, @cm_NOMB_ASOC, @cm_TIPO_REFE, @cm_FOLI_REFE, @cm_MONT_EXEN,
			@cm_MONT_NETO, @cm_MONT_VAAG, @cm_MONT_VAFI, @cm_MONT_USCO, @cm_MONT_FUPO,
			@cm_MONT_LE18, @cm_MONT_SICR, @cm_IVAG_RTTO, @cm_IVAG_RTPA, @cm_MONT_CRED,
			@cm_MONT_ENVA, @cm_MONT_TOTA, @cm_MONT_NRET, @cm_MONT_NOFA, @cm_MONT_PERI,
			@cm_MONT_PANA, @cm_MONT_PAIN, @cm_VAAG_PROP, @cm_VAAG_TERC, @cm_VIGE_DOCU 
		while @@FETCH_STATUS=0
		begin
			set @v_lugar = 'en cursor c_dManuales, antes del if tipo_docu = 45'
			if @cm_TIPO_DOCU = 45
				set @vm_retIva = @cm_MONT_VAAG - @cm_MONT_NRET;
				if @vm_retIva = @cm_MONT_VAAG
					set @vm_iva_rtto = @vm_retIva;
				else
					set @vm_iva_rtpa = @vm_retIva;
			
			if @p_codi_erro = 'N' -- m2
			begin
				set @v_lugar = 'en cursor c_dManuales, antes del bloque insert deta_docu'
				print(@lugar)
				insert into lcv_deta_docu (	CODI_EMPR, 		CORR_LICV, 				TIPO_DOCU, 		FOLI_DOCU,
											RUTT_ASOC, 		DIGI_ASOC, 				CODI_OPER,		
											TASA_IMPU, 		NUME_INTE, 				VENT_SERV,		
											INDI_SICO, 		FECH_DOCU, 				CODI_SUCU, 		NOMB_ASOC,
											TIPO_REFE, 		FOLI_REFE, 				MONT_EXEN, 		MONT_NETO,
											MONT_VAAG, 		MONT_VAFI, 				MONT_USCO, 		MONT_FUPL,
											MONT_LE18, 		MONT_SICR, 				IVA_RTTO,  		IVA_RTPA,
											MONT_CRED, 		MONT_ENVA, 				MONT_TOTA, 		MONT_NRET,
											MONT_NOFA, 		MONT_PERI, 				MONT_PANA, 		MONT_PAIN,
											VAAG_PROP, 		VAAG_TERC, 				VIGE_DOCU)
									values (@p_codi_empr, 	@v_correlativo, 		@cm_TIPO_DOCU, 	@cm_FOLI_DOCU,
											@cm_RUTT_ASOC,	upper(@cm_DIGI_ASOC), 	0,
											@cm_TASA_IMPU,	@cm_NUME_INTE, 			@cm_VENT_SERV, 
											@cm_INDI_SICO,	@cm_FECH_DOCU,			@cm_CODI_SUCU, 	@cm_NOMB_ASOC, 
											@cm_TIPO_REFE,	@cm_FOLI_REFE, 			@cm_MONT_EXEN,	@cm_MONT_NETO,
											@cm_MONT_VAAG,	@cm_MONT_VAFI, 			@cm_MONT_USCO, 	@cm_MONT_FUPO,
											@cm_MONT_LE18,	@cm_MONT_SICR, 			@cm_IVAG_RTTO, 	@cm_IVAG_RTPA,
											@cm_MONT_CRED,	@cm_MONT_ENVA, 			@cm_MONT_TOTA, 	@cm_MONT_NRET,
											@cm_MONT_NOFA,	@cm_MONT_PERI, 			@cm_MONT_PANA, 	@cm_MONT_PAIN,
											@cm_VAAG_PROP,	@cm_VAAG_TERC, 			@cm_VIGE_DOCU)		
				if (@@ERROR <> 0)
				begin
					set @v_correlativo = null
					set @p_codi_erro = 'S'
					set @p_mens_erro = 'Error al insertar documentos manuales'
					print(@lugar)
				end
			end -- if m2

			if @p_codi_erro = 'N' -- m3
			begin
				set @v_lugar = 'en cursor c_dManuales, antes del bloque cursor imp'
				print(@lugar)
				-- c_impuManu(vc_dm.tipo_docu, vc_dm.foli_docu) llamada oracle
				declare --variables del cursor c_impuManu
					@vim_codi_impu varchar(6), @vim_mont_impu numeric(18), @vim_tasa_impu numeric(5,2)
				declare c_impuManu cursor for
					select	codi_impu, mont_impu, tasa_impu
					from	lcv_digi_impu
					where	codi_empr = @p_codi_empr
					and 	tipo_docu = @cm_tipo_docu
					and 	foli_docu = @cm_foli_docu

				--set @pc_tipo_docu = @cm_tipo_docu
				--set @pc_foli_docu = @cm_foli_docu
				OPEN c_impuManu
				FETCH NEXT FROM c_impuManu
				into @vim_codi_impu, @vim_mont_impu, @vim_tasa_impu
				while @@FETCH_STATUS=0
				begin
					set @p_mens_erro = 'pp empresa:' + str(@p_codi_empr)+' periodo: '+@p_periodo
				 	insert into lcv_tota_docu (	CODI_EMPR, 		CORR_LICV, 		TIPO_DOCU, 		FOLI_DOCU,
												RUTT_ASOC, 		CODI_IMPU, 		TAS_IMPU,  		MONT_IMPU,
												CODI_OPER)
										values (@p_codi_empr,  	@v_correlativo,	@cm_tipo_docu, 	@cm_foli_docu,
												@cm_rutt_asoc, 	@vim_codi_impu,	@vim_tasa_impu,	@vim_mont_impu,
												0);
					if (@@ERROR <> 0)
					begin
						set @v_correlativo = null
						set @p_codi_erro = 'S'
						select @p_mens_erro = 'Error insertando impts de doc manual folio: '+ @cm_foli_docu
						print(@lugar)
					end
					FETCH NEXT FROM c_impuManu
					into @vim_codi_impu, @vim_mont_impu, @vim_tasa_impu
				end -- while cursor c_impuManu
				CLOSE c_impuManu
				DEALLOCATE c_impuManu
			end -- if m3
			set @v_lugar = 'en cursor c_dManuales, antes de end loop'
			
			FETCH NEXT FROM c_dManuales
			into @cm_TIPO_DOCU, @cm_FOLI_DOCU, @cm_TIPO_OPER, @cm_RUTT_ASOC, @cm_DIGI_ASOC,
				@cm_TASA_IMPU, @cm_NUME_INTE, @cm_VENT_SERV, @cm_INDI_SICO, @cm_FECH_DOCU,
				@cm_CODI_SUCU, @cm_NOMB_ASOC, @cm_TIPO_REFE, @cm_FOLI_REFE, @cm_MONT_EXEN,
				@cm_MONT_NETO, @cm_MONT_VAAG, @cm_MONT_VAFI, @cm_MONT_USCO, @cm_MONT_FUPO,
				@cm_MONT_LE18, @cm_MONT_SICR, @cm_IVAG_RTTO, @cm_IVAG_RTPA, @cm_MONT_CRED,
				@cm_MONT_ENVA, @cm_MONT_TOTA, @cm_MONT_NRET, @cm_MONT_NOFA, @cm_MONT_PERI,
				@cm_MONT_PANA, @cm_MONT_PAIN, @cm_VAAG_PROP, @cm_VAAG_TERC, @cm_VIGE_DOCU
		end -- while c_dManuales
		CLOSE c_dManuales
		SET @v_lugar = 'Fin cursor c_dManuales'
		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
			set @p_codi_erro = 'S'
			select @p_mens_erro = 'Error: ' + @v_lugar
			print(@lugar)
		end
	end -- if m1 Procesar dctos manuales*/

	-- Generar totalizador
	if @p_codi_erro = 'N'
	begin
		insert into lcv_tota_libr (	CORR_LICV, 			CODI_EMPR, 			TIPO_DOCU,
									CANT_DOCU, 			MONT_EXEN, 			MONT_NETO,
									TOTA_ANUL, 			MONT_VAAG,			
									MONT_LE18, 			IMPU_SICR, 			IVA_RTTO ,
									IVA_RTPA,  			MONT_CREC, 			MONT_ENVA,
									MONT_TOTA, 			MONT_NRET, 			MONT_NOFA,			MONT_PERI,
									MONT_PANA, 			MONT_PAIN, 			MONT_TAPU,			MONT_TACI,
									MONT_TAEL, 			IVA_FUPL,		
									VAAG_TERC, 			MONT_FIJO,		
									VAAG_PROP, 			MONT_VAFI)		
		select DISTINCT 			@v_correlativo, 	CODI_EMPR,			TIPO_DOCU,
									count(TIPO_DOCU),	sum(MONT_EXEN),		sum(MONT_NETO),
									COUNT(VIGE_DOCU),	sum(MONT_VAAG),
									sum(MONT_LE18),		sum(MONT_SICR),		sum(IVA_RTTO),
									sum(IVA_RTPA),		sum(MONT_CRED),		sum(MONT_ENVA),
									sum(MONT_TOTA),		sum(MONT_NRET),		sum(MONT_NOFA),		sum(MONT_PERI),
									sum(MONT_PANA),		sum(MONT_PAIN),		sum(MONT_TAPU),		sum(MONT_TACI),
									sum(MONT_TAEL),		sum(MONT_FUPL),
									sum(VAAG_TERC),		sum(MONT_FIJO),
									sum(VAAG_PROP),		sum(MONT_VAFI)
		from 	lcv_deta_docu
		where 	CODI_EMPR=@p_codi_empr
		and 	CORR_LICV=@v_correlativo
		group by CORR_LICV, CODI_EMPR, TIPO_DOCU  

		insert into lcv_tota_nore (CORR_LICV, CODI_EMPR, TIPO_DOCU, CODI_NORE, MONT_NORE, OPER_NORE)
		select	CORR_LICV, CODI_EMPR, TIPO_DOCU, CODI_NORE, sum(MONT_NORE), count(*)
		from	lcv_deta_nore
		where	CODI_EMPR=@p_codi_empr
		and 	CORR_LICV=@v_correlativo
		group by CORR_LICV, CODI_EMPR, TIPO_DOCU,CODI_NORE,CODI_OPER
		
		insert into lcv_tota_libr (	CORR_LICV, CODI_EMPR, TIPO_DOCU,
									CANT_DOCU, 
									MONT_EXEN, 
									MONT_NETO,
									MONT_VAAG,
									MONT_LE18, IMPU_SICR, IVA_RTTO ,
									IVA_RTPA, MONT_CREC, MONT_ENVA,
									MONT_TOTA, MONT_NRET, MONT_NOFA, MONT_PERI,
									MONT_PANA, MONT_PAIN, MONT_TAPU, MONT_TACI,
									MONT_TAEL, IVA_FUPL,
									VAAG_TERC, MONT_FIJO,
									VAAG_PROP, MONT_VAFI)
		SELECT @v_correlativo, CODI_EMPR, TIPO_DOCU,
			count(TIPO_DOCU), 
			sum(MONT_EXEN),
			case --MONT_NETO ini
			sum(isnull(mont_neto,0)) 
			when 0 then round((sum(isnull(mont_tota,0) - isnull(mont_exen,0)))/(1+(max(tasa_vaag)/100)),0) 
			else sum(isnull(mont_neto,0)) end,	--MONT_NETO fin
			case sum(isnull(mont_neto,0))		--MONT_VAAG ini
			when 0 then round(((sum(isnull(mont_tota,0) - isnull(mont_exen,0)))/(1+(max(tasa_vaag)/100)))*(max(tasa_vaag)/100),0)
			else round((sum(isnull(mont_neto,0) - isnull(mont_exen,0)))*(max(tasa_vaag)/100),0) end, --MONT_VAAG fin
			0, 0, 0,					--MONT_LE18, IMPU_SICR, IVA_RTTO 
			0, 0,0, 					--IVA_RTPA, MONT_CREC, MONT_ENVA,
			sum(MONT_TOTA),0,0,0,		--MONT_TOTA, MONT_NRET, MONT_NOFA, MONT_PERI,
			0,0,0,0,					--MONT_PANA, MONT_PAIN, MONT_TAPU, MONT_TACI,
			0,0,						--MONT_TAEL, IVA_FUPL,
			sum(isnull(vaag_terc,0)),0,	--VAAG_TERC, MONT_FIJO
			0,0							--VAAG_PROP, MONT_VAFI
		FROM BEL_ENCA_DOCU 
		WHERE codi_empr = @p_codi_empr 
			and fech_emis between @p_periodo+'-01' and convert(char(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,convert(datetime, @p_periodo+'-01', 120))+1,0)),120)
		GROUP BY  CODI_EMPR,TIPO_DOCU, TASA_VAAG
		
		--se ingresan las boletas con folio anulados
		OPEN d_bfolianul		
		Fetch Next From d_bfolianul
		Into @bel_cant_anul, @bel_tipo_docu
		while @@FETCH_STATUS=0
		begin
			print ('antes update lcv_tota_libr')
			UPDATE 	lcv_tota_libr 
			set 	tota_anul = @bel_cant_anul
			WHERE 	codi_empr = @p_codi_empr
			and 	TIPO_DOCU = @bel_tipo_docu
			and 	CORR_LICV = @v_correlativo
		
			Fetch Next From d_bfolianul
			Into @bel_cant_anul, @bel_tipo_docu

		end -- while cursor d_bfolianul
		CLOSE d_bfolianul
		DEALLOCATE d_bfolianul
		print ('*****')

 		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
			set @p_codi_erro = 'S'
			SET @p_mens_erro = 'Error al generar totalizadores de documentos'
			print(@lugar)
		end
	end

	if @p_codi_erro = 'N'
	begin
		insert into lcv_tota_impu (	CORR_LICV, 		CODI_EMPR,		TIPO_DOCU,
									CODI_IMPU, 		MONT_IMPU)
		select 						@v_correlativo,	CODI_EMPR,		TIPO_DOCU,
									CODI_IMPU, 		sum(MONT_IMPU)
		from 	lcv_tota_docu
		where 	CODI_EMPR=@p_codi_empr 
		and 	CORR_LICV = @v_correlativo
		group by CORR_LICV, CODI_EMPR, TIPO_DOCU, CODI_IMPU
		
		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
			set @p_codi_erro = 'S'
			SET @p_mens_erro = 'Error al generar totalizadores de impuestos'
			print(@lugar)
		end
	end
	
	-- FIN Generar totalizador
	if (@p_codi_erro = 'N') and (@@ERROR = 0)
	begin
		set @p_corr_ejec = @v_correlativo
		COMMIT TRANSACTION
	end
	else
		ROLLBACK TRANSACTION
	DEALLOCATE c_dctos
	DEALLOCATE c_dManuales
END
GO

GO
--SqlScripter----[dbo].[PRC_LCV_TRAS_MNAL].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_LCV_TRAS_MNAL]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_LCV_TRAS_MNAL] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_LCV_TRAS_MNAL]
(@p_codi_empr numeric(9),
	@p_periodo varchar(8),
	@p_tipo_oper VARCHAR(10),
	@p_codi_rect varchar(20),
	@p_tipo_libr varchar(20),
	@p_fact_prop numeric(10,6),
	@p_corr_ejec numeric(22) output,
	@p_codi_erro varchar(1) output,
	@p_mens_erro varchar(200) output)
AS
BEGIN --1
--SP1 SE 5.2
declare
	@primer_dia varchar(10),
	@ultimo_dia varchar(10),
	@v_correlativo numeric(22),
	@v_feho_firm varchar(20),
	@v_vers_licv varchar(10),
	@vm_iva_rtto varchar(18),
	@vm_iva_rtpa varchar(18),
	@vm_retIva varchar(18),
	@v_lugar varchar(60),
	@lugar varchar(200),
	@control int,
	@control2 int,
	@comp_rutt int,
	@comp_oper varchar(10),
	@comp_libr varchar(8),
	@comp_digi varchar(2),
	@comp_temp int

	declare -- variables del cursor c_dManuales, para el detalle del libro
	@cm_TIPO_DOCU numeric(3), @cm_FOLI_DOCU numeric(10), @cm_TIPO_OPER varchar(7), @cm_RUTT_ASOC varchar(9), @cm_DIGI_ASOC varchar(1),
	@cm_TASA_IMPU numeric(5,2), @cm_NUME_INTE varchar(10), @cm_VENT_SERV numeric(1), @cm_INDI_SICO numeric(1), @cm_FECH_DOCU varchar(10),
	@cm_CODI_SUCU numeric(10), @cm_NOMB_ASOC varchar(50), @cm_TIPO_REFE numeric(3), @cm_FOLI_REFE numeric(10), @cm_MONT_EXEN numeric(18),
	@cm_MONT_NETO numeric(18), @cm_MONT_VAAG numeric(18), @cm_MONT_VAFI numeric(18), @cm_MONT_USCO numeric(18), @cm_MONT_FUPO numeric(18),
	@cm_MONT_LE18 numeric(18), @cm_MONT_SICR numeric(18), @cm_IVAG_RTTO numeric(18), @cm_IVAG_RTPA numeric(18), @cm_MONT_CRED numeric(18),
	@cm_MONT_ENVA numeric(18), @cm_MONT_TOTA numeric(18), @cm_MONT_NRET numeric(18), @cm_MONT_NOFA numeric(18), @cm_MONT_PERI numeric(18),
	@cm_MONT_PANA numeric(18), @cm_MONT_PAIN numeric(18), @cm_VAAG_PROP numeric(18), @cm_VAAG_TERC numeric(18), @cm_VIGE_DOCU VARCHAR(1),
	@cm_MONT_TAPU numeric(18), @cm_MONT_TACI numeric(18),@cm_MONT_TAEL numeric(18), @cm_MONT_VEHI numeric(18), @cm_MONT_FIJO numeric(18),
	@cm_TIPO_IMPU NUMERIC(1),@cm_EMIS_DOCU numeric(10)
	declare c_carg_Manual cursor for
	select	TIPO_DOCU, FOLI_DOCU, TIPO_OPER, RUTT_CONT, DIGI_CONT,
		TASA_IMPU, NUME_INTE, VENT_SERV, INDI_SICO, FECH_DOCU,
		CODI_SUCU, NOMB_ASOC, TIPO_REFE, FOLI_REFE, MONT_EXEN,
		MONT_NETO, MONT_VAAG, MONT_VAFI, MONT_USCO, MONT_FUPL,
		MONT_LE18, MONT_SICR, IVAG_RTTO, IVAG_RTPA, MONT_CRED,
		MONT_ENVA, MONT_TOTA, MONT_NRET, MONT_NOFA, MONT_PERI,
		MONT_PANA, MONT_PAIN, VAAG_PROP, VAAG_TERC, VIGE_DOCU,
		MONT_TAPU, MONT_TACI, MONT_TAEL, MONT_VEHI, MONT_FIJO,
		TIPO_IMPU, EMIS_DOCU
		from lcv_deta_temp, empr b
		where peri_trib = @p_periodo and tipo_oper=@p_tipo_oper
		and rutt_asoc = b.rutt_empr and b.codi_empr=@p_codi_empr 
		and  tipo_docu not IN (35,38,39,41,50,52,105,919,920,922,924)

	declare
	@cnd_TIPO_DOCU varchar(3),  @cnd_CANT_TDCU int,			@cnd_MONT_EXEN numeric(18), @cnd_MONT_NETO numeric(18),
	@cnd_MONT_VAAG numeric(18), @cnd_MONT_LE18 numeric(18), @cnd_MONT_SICR numeric(18), @cnd_IVAG_RTTO numeric(18),
	@cnd_IVAG_RTPA numeric(18), @cnd_MONT_CRED numeric(18), @cnd_MONT_ENVA numeric(18), @cnd_MONT_TOTA numeric(18),
	@cnd_MONT_NRET numeric(18), @cnd_MONT_NOFA numeric(18), @cnd_MONT_PERI numeric(18), @cnd_MONT_PANA numeric(18),
	@cnd_MONT_PAIN numeric(18), @cnd_MONT_TAPU numeric(18), @cnd_MONT_TACI numeric(18), @cnd_MONT_TAEL numeric(18),
	@cnd_MONT_FUPl numeric(18), @cnd_VAAG_TERC numeric(18), @cnd_MONT_FIJO numeric(18), @cnd_VAAG_PROP numeric(18),
	@cnd_MONT_VAFI numeric(18), @cnd_MONT_VEHI numeric(18), @cnd_MONT_IVAC numeric(18)
	--Documentos para el resumen del libro
	declare c_noresum cursor for
	select DISTINCT  TIPO_DOCU, count(TIPO_DOCU) as cant_tipo, sum(MONT_EXEN) as mont_exen, sum(MONT_NETO) as mont_neto,
		sum(MONT_VAAG) as mont_vaag,sum(MONT_LE18)as mont_le18, sum(MONT_SICR) as mont_sicr,
		sum(IVAG_RTTO) as ivag_rtto,sum(IVAG_RTPA) as ivag_rtpa, sum(MONT_CRED) as mont_cred,
		sum(MONT_ENVA) as mont_enva,sum(MONT_TOTA) as mont_tota, sum(MONT_NRET) as mont_nret,
		sum(MONT_NOFA) as mont_nofa,sum(MONT_PERI) as mont_peri, sum(MONT_PANA) as mont_pana, 
		sum(MONT_PAIN) as mont_pain, sum(MONT_TAPU) as mont_tapu, sum(MONT_TACI) as mont_taci,
		sum(MONT_TAEL) as mont_tael, sum(MONT_FUPL) as mont_fupl, sum(VAAG_TERC) as vaag_terc, 
		sum(MONT_FIJO) as mont_fijo, sum(VAAG_PROP) as vaag_prop, sum(MONT_VAFI) as mont_vafi,
		sum(MONT_VEHI) as mont_vehi, sum(MONT_USCO) as mont_usco
		from lcv_deta_temp, empr b
		where peri_trib = @p_periodo and tipo_oper=@p_tipo_oper
		and rutt_asoc = b.rutt_empr and b.codi_empr=@p_codi_empr
		AND TIPO_DOCU not in (105,919,920,922,924)
		group by TIPO_DOCU


/* inicio de procedimiento */
		
BEGIN TRANSACTION
	
	set @lugar = 'Comienzo' 
	set @p_codi_erro = 'N'
	--Procesar encabezado
	set @v_correlativo = 0
	select @primer_dia = @p_periodo + '-01'
	select @ultimo_dia = convert(char(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,convert(datetime, @p_periodo+'-01', 120))+1,0)),120)
		
	select @comp_temp = count(*) 
	from lcv_deta_temp
	where peri_trib =@p_periodo and tipo_oper=@p_tipo_oper
				and rutt_asoc =(SELECT b.rutt_empr
				FROM empr b
				where   b.codi_empr=@p_codi_empr  ) 
		
		if @comp_temp = 0
		begin
		  	set @p_codi_erro = 'S'
			set @p_mens_erro = 'No se han encontrado registros'
			print(@lugar)
		end		
		

 /* obtiene  correlativo de libro */
	set @lugar = 'recuoerando valor de la secuencia'
	print(@lugar)
	--INSERT INTO seq_dte_lcv(SEQ_VALO) VALUES ('X')
	--SELECT @v_correlativo = @@IDENTITY
	select @v_correlativo = ISNULL(max(corr_licv),0)+1 from lcv_resu_libr
	
	DELETE FROM LCV_DETA_NORE WHERE CORR_LICV = @v_correlativo
	if (@@ERROR <> 0)
	begin
	  	set @p_codi_erro = 'S'
		set @p_mens_erro = 'Error. Al recuperar valor de secuencia'
		print(@lugar)
	end
	
	
	if @p_codi_erro = 'N' 
	begin
		set @lugar = 'recuperando datos de la empresa'
		print(@lugar)
		select @comp_rutt=rutt_empr, @comp_digi=digi_empr
		from empr
		where codi_empr = @p_codi_empr;
		if (@@ERROR <> 0)
		begin
		  	set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error. Datos de la epresa no encontrados'
			print(@lugar)
		end		
	end
	
	
	if @p_codi_erro = 'N' 
	begin
		set @lugar = 'comprobando datos caratula'
		print(@lugar)
		select DISTINCT @comp_oper= tipo_oper,@comp_libr=tipo_libr
		from lcv_deta_temp
		where peri_trib = @p_periodo and tipo_oper=@p_tipo_oper
		and rutt_asoc = @comp_rutt
		GROUP BY tipo_oper,tipo_libr
	end 
		print(@comp_rutt)
		print(@comp_oper)
		print(@comp_libr)

		

	if @p_codi_erro = 'N' 
	BEGIN --2
		set @lugar='formando cadena fecha/hora'
		print(@lugar)
		select @v_feho_firm=convert(char(10), getdate(), 120)+'T'+convert(char(8),getdate(),8)
		set @lugar='recuperando version'
		print(@lugar)
		select @v_vers_licv=isnull(max(code_desc),' ')
		from   sys_code
		where  domain_code = 72 and code_aux = 'S'
		if (@@ERROR <> 0)
		BEGIN
			set @v_correlativo = null
		  	set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error al formar cadena de fecha/hora'
			print(@lugar)
		END	
	END --2


	if (@p_codi_erro = 'N' and @comp_rutt<>0) 
	BEGIN --3
			set @lugar = 'Generando caratula' 
			print(@lugar)
			if(	@comp_oper <>'' and @comp_libr<>'')
			begin
				print('comprabacion correcta')
				insert into lcv_resu_libr (	CORR_LICV,		CODI_EMPR,		RUTT_EMIS, 		DIGI_EMIS,
											CODI_PERI,		TIPO_OPER,		TIPO_LIBR, 		TIPO_SEGM,	CODI_RECT,
											NUME_SEGM,		FEHO_FIRM,		VERS_LICV, 		NUME_NOTI,	ESTA_ENVI,	MENS_ENVI)
				values (					@v_correlativo,	@p_codi_empr, 	@comp_rutt, 	@comp_digi,
											@p_periodo, 	@comp_oper,		@p_tipo_libr, 	'TOTAL',	@p_codi_rect,
											NULL, 			@v_feho_firm, 	@v_vers_licv, 	NULL,		'INI',		'Libro Cargado')

				if (@@ERROR <> 0)
				BEGIN
					set @v_correlativo = null
					set @p_codi_erro = 'S'
					set @p_mens_erro = 'Error en generar caratula'
				END
			END   
			else
			begin
			set @v_correlativo = null
				set @p_codi_erro = 'S'
				set @p_mens_erro = 'Error en generar caratula'
			end
			-- fin cursor resu_libr - carga manual
	END --3

	-- Procesar documentos manuales
	if (@p_codi_erro = 'N' AND @comp_rutt<>0)
	BEGIN --4
		set @lugar = 'Antes del for cursor c_carg_Manual'
		print(@lugar)
		OPEN c_carg_Manual
		FETCH NEXT FROM c_carg_Manual
		into @cm_TIPO_DOCU, @cm_FOLI_DOCU, @cm_TIPO_OPER, @cm_RUTT_ASOC, @cm_DIGI_ASOC,
			@cm_TASA_IMPU, @cm_NUME_INTE, @cm_VENT_SERV, @cm_INDI_SICO, @cm_FECH_DOCU,
			@cm_CODI_SUCU, @cm_NOMB_ASOC, @cm_TIPO_REFE, @cm_FOLI_REFE, @cm_MONT_EXEN,
			@cm_MONT_NETO, @cm_MONT_VAAG, @cm_MONT_VAFI, @cm_MONT_USCO, @cm_MONT_FUPO,
			@cm_MONT_LE18, @cm_MONT_SICR, @cm_IVAG_RTTO, @cm_IVAG_RTPA, @cm_MONT_CRED,
			@cm_MONT_ENVA, @cm_MONT_TOTA, @cm_MONT_NRET, @cm_MONT_NOFA, @cm_MONT_PERI,
			@cm_MONT_PANA, @cm_MONT_PAIN, @cm_VAAG_PROP, @cm_VAAG_TERC, @cm_VIGE_DOCU ,
			@cm_MONT_TAPU, @cm_MONT_TACI, @cm_MONT_TAEL, @cm_MONT_VEHI, @cm_MONT_FIJO,
			@cm_TIPO_IMPU, @cm_EMIS_DOCU

		print(@@FETCH_STATUS)
		if(@@FETCH_STATUS=0)
		begin--begin fech_status
			while @@FETCH_STATUS=0
			BEGIN --w1
				set @lugar = 'en cursor c_dManuales, antes del if tipo_docu = 45'
				print(@lugar)
				if @cm_TIPO_DOCU = 45
				BEGIN --5
					set @vm_retIva = @cm_MONT_VAAG - @cm_MONT_NRET;
					if @vm_retIva = @cm_MONT_VAAG
						set @vm_iva_rtto = @vm_retIva;
					else
						set @vm_iva_rtpa = @vm_retIva;
				END --5
				set @lugar = 'en cursor c_dManuales, antes del bloque insert deta_docu'
				print(@lugar)
				insert into lcv_deta_docu (	CODI_EMPR, 		CORR_LICV, 			TIPO_DOCU, 			FOLI_DOCU,
											RUTT_ASOC, 		DIGI_ASOC, 			VIGE_DOCU, 			CODI_OPER,
											TIPO_IMPU, 		TASA_IMPU, 			NUME_INTE, 			VENT_SERV,
											INDI_SICO, 		FECH_DOCU, 			CODI_SUCU, 			NOMB_ASOC,
											TIPO_REFE, 		FOLI_REFE, 			MONT_EXEN, 			MONT_NETO,
											MONT_VAAG, 		MONT_VAFI, 			MONT_USCO, 			MONT_FUPL,
											MONT_LE18, 		MONT_SICR, 			IVA_RTTO,  			IVA_RTPA,
											MONT_CRED, 		MONT_ENVA, 			MONT_TOTA, 			MONT_NRET,
											MONT_NOFA, 		MONT_PERI, 			MONT_PANA, 			MONT_PAIN,
											MONT_TAPU, 		MONT_TACI, 			MONT_TAEL, 			MONT_VEHI,
											EMIS_DOCU,		MONT_FIJO,			VAAG_PROP, 			VAAG_TERC )
					values (				@p_codi_empr,	@v_correlativo, 	@cm_TIPO_DOCU,		@cm_FOLI_DOCU,
											@cm_RUTT_ASOC,	upper(@cm_DIGI_ASOC),@cm_VIGE_DOCU, 	0,
											@cm_TIPO_IMPU,	@cm_TASA_IMPU,		@cm_NUME_INTE, 		@cm_VENT_SERV, 
											@cm_INDI_SICO,	@cm_FECH_DOCU,		@cm_CODI_SUCU, 		@cm_NOMB_ASOC, 
											@cm_TIPO_REFE,	@cm_FOLI_REFE,		@cm_MONT_EXEN,		@cm_MONT_NETO,
											@cm_MONT_VAAG,	@cm_MONT_VAFI,		@cm_MONT_USCO, 		@cm_MONT_FUPO,
											@cm_MONT_LE18,	@cm_MONT_SICR,		@cm_IVAG_RTTO, 		@cm_IVAG_RTPA,
											@cm_MONT_CRED,	@cm_MONT_ENVA,		@cm_MONT_TOTA, 		@cm_MONT_NRET,
											@cm_MONT_NOFA,	@cm_MONT_PERI,		@cm_MONT_PANA, 		@cm_MONT_PAIN,
											@cm_MONT_TAPU,	@cm_MONT_TACI,		@cm_MONT_TAEL, 		@cm_MONT_VEHI,
											@cm_EMIS_DOCU,	@cm_MONT_FIJO,		@cm_VAAG_PROP, 		@cm_VAAG_TERC)
				if (@@ERROR <> 0)
				BEGIN
					set @v_correlativo = null
					set @p_codi_erro = 'S'
					set @p_mens_erro = 'Error en el traspaso de detalle temporal'
					print(@lugar)
				END

				select @control = count(*) from lcv_tota_temp 
				where foli_docu=@cm_FOLI_DOCU
				and tipo_docu=@cm_TIPO_DOCU
				and RUTT_CONT = @cm_RUTT_ASOC
				and TIPO_OPER= @p_tipo_oper

				if(@control=1)
				begin 
					print('tota' + STR(@cm_FOLI_DOCU))
					insert into lcv_tota_docu (	codi_empr, 		corr_licv, 		tipo_docu,	foli_docu, rutt_asoc, codi_impu, tas_impu, mont_impu, codi_oper) 
					select						@p_codi_empr,	@v_correlativo,	tipo_docu,	foli_docu, rutt_cont, codi_impu, tasa_impu, mont_impu, 0
					from	lcv_tota_temp
					where	foli_docu=@cm_FOLI_DOCU
					and		tipo_docu=@cm_TIPO_DOCU
					and		rutt_cont=@cm_RUTT_ASOC
					and		TIPO_OPER= @p_tipo_oper
				end


				select @control2 = count(*) from lcv_nore_temp 
				where foli_docu=@cm_FOLI_DOCU
				and tipo_docu=@cm_TIPO_DOCU
				and RUTT_CONT = @cm_RUTT_ASOC
				and TIPO_OPER= @p_tipo_oper
				
				if(@control2=1)
				begin 
					print('tota2')
					insert into lcv_deta_nore (	codi_empr,		corr_licv, 		tipo_docu,	foli_docu,	rutt_asoc,	codi_nore, mont_nore, codi_oper) 
										select  @p_codi_empr,	@v_correlativo,	tipo_docu,	foli_docu,	rutt_cont,	codi_nore, mont_nore, 0
										from 	lcv_nore_temp
										where 	foli_docu=@cm_FOLI_DOCU
										and 	tipo_docu=@cm_TIPO_DOCU
										and 	rutt_cont=@cm_RUTT_ASOC
										and 	TIPO_OPER= @p_tipo_oper
				end
				
				--delete from lcv_deta_temp where foli_docu=@cm_FOLI_DOCU and peri_trib = @p_periodo
				--delete from lcv_tota_temp where foli_docu=@cm_FOLI_DOCU and peri_trib = @p_periodo
				--delete from lcv_nore_temp where foli_docu=@cm_FOLI_DOCU and peri_trib = @p_periodo

				FETCH NEXT FROM c_carg_Manual
				into @cm_TIPO_DOCU, @cm_FOLI_DOCU, @cm_TIPO_OPER, @cm_RUTT_ASOC, @cm_DIGI_ASOC,
				@cm_TASA_IMPU, @cm_NUME_INTE, @cm_VENT_SERV, @cm_INDI_SICO, @cm_FECH_DOCU,
				@cm_CODI_SUCU, @cm_NOMB_ASOC, @cm_TIPO_REFE, @cm_FOLI_REFE, @cm_MONT_EXEN,
				@cm_MONT_NETO, @cm_MONT_VAAG, @cm_MONT_VAFI, @cm_MONT_USCO, @cm_MONT_FUPO,
				@cm_MONT_LE18, @cm_MONT_SICR, @cm_IVAG_RTTO, @cm_IVAG_RTPA, @cm_MONT_CRED,
				@cm_MONT_ENVA, @cm_MONT_TOTA, @cm_MONT_NRET, @cm_MONT_NOFA, @cm_MONT_PERI,
				@cm_MONT_PANA, @cm_MONT_PAIN, @cm_VAAG_PROP, @cm_VAAG_TERC, @cm_VIGE_DOCU ,
				@cm_MONT_TAPU, @cm_MONT_TACI, @cm_MONT_TAEL, @cm_MONT_VEHI, @cm_MONT_FIJO,
				@cm_TIPO_IMPU, @cm_EMIS_DOCU
			END -- w1 
			print('fin c_carg_Manual')
		end--begin fech_status
		else
		BEGIN
			set @v_correlativo = null
			set @p_codi_erro = 'S'
			set @p_mens_erro = 'no se puede realizar carga de documentos'
		END	
	CLOSE c_carg_Manual

		-- FIN TRASPASO TABLA MANUAL

	-- Generar totalizador
	if @p_codi_erro = 'N'
	BEGIN --9
		SET @lugar = 'generado resumen total'
		print(@lugar)
		print('insert lcv_tota_libr')

		OPEN c_noresum
		Fetch Next From c_noresum
		INTO @cnd_TIPO_DOCU, @cnd_CANT_TDCU,@cnd_MONT_EXEN, @cnd_MONT_NETO, 
		@cnd_MONT_VAAG, @cnd_MONT_LE18, @cnd_MONT_SICR, @cnd_IVAG_RTTO,
		@cnd_IVAG_RTPA, @cnd_MONT_CRED,@cnd_MONT_ENVA,@cnd_MONT_TOTA,
		@cnd_MONT_NRET,@cnd_MONT_NOFA,@cnd_MONT_PERI,@cnd_MONT_PANA,
		@cnd_MONT_PAIN,@cnd_MONT_TAPU, @cnd_MONT_TACI,@cnd_MONT_TAEL,
		@cnd_MONT_FUPl, @cnd_VAAG_TERC, @cnd_MONT_FIJO,@cnd_VAAG_PROP,
		@cnd_MONT_VAFI,  @cnd_MONT_VEHI, @cnd_MONT_IVAC
		
		print('cursor c_noresum')
		print( @@FETCH_STATUS)
		if(@@FETCH_STATUS=0)
		begin
			while @@FETCH_STATUS=0
			BEGIN -- w2
				insert into lcv_tota_libr (	CORR_LICV,			CODI_EMPR, 			TIPO_DOCU,
											CANT_DOCU,			MONT_EXEN, 			MONT_NETO,
											MONT_VAAG,
											MONT_LE18,			IMPU_SICR, 			IVA_RTTO ,
											IVA_RTPA,			MONT_CREC, 			MONT_ENVA,
											MONT_TOTA,			MONT_NRET, 			MONT_NOFA, 
											MONT_PERI,			MONT_PANA,			MONT_PAIN,
											MONT_TAPU, 			MONT_TACI,			MONT_TAEL,
											MONT_VEHI,			IVA_FUPL,			VAAG_TERC,
											MONT_FIJO,			VAAG_PROP,			MONT_VAFI,
											MONT_IVAC, 			FACT_PROP,			MONT_CRCO)
					VALUES (				@v_correlativo,		@p_codi_empr,		@cnd_TIPO_DOCU, 
											@cnd_CANT_TDCU,		@cnd_MONT_EXEN,		@cnd_MONT_NETO,
											@cnd_MONT_VAAG,
											@cnd_MONT_LE18,		@cnd_MONT_SICR, 	@cnd_IVAG_RTTO,
											@cnd_IVAG_RTPA,		@cnd_MONT_CRED,		@cnd_MONT_ENVA,	
											@cnd_MONT_TOTA,		@cnd_MONT_NRET,		@cnd_MONT_NOFA,
											@cnd_MONT_PERI,		@cnd_MONT_PANA,		@cnd_MONT_PAIN,
											@cnd_MONT_TAPU,		@cnd_MONT_TACI,		@cnd_MONT_TAEL,
											@cnd_MONT_VEHI,		@cnd_MONT_FUPl,		@cnd_VAAG_TERC,
											@cnd_MONT_FIJO,		@cnd_VAAG_PROP,		@cnd_MONT_VAFI,
											@cnd_MONT_IVAC,		@p_fact_prop,		ROUND(@p_fact_prop * @cnd_MONT_IVAC/100,0))
											
			Fetch Next From c_noresum
			INTO @cnd_TIPO_DOCU, @cnd_CANT_TDCU, @cnd_MONT_EXEN, @cnd_MONT_NETO, 
			@cnd_MONT_VAAG, @cnd_MONT_LE18, @cnd_MONT_SICR, @cnd_IVAG_RTTO,
			@cnd_IVAG_RTPA, @cnd_MONT_CRED,@cnd_MONT_ENVA,@cnd_MONT_TOTA,
			@cnd_MONT_NRET,@cnd_MONT_NOFA,@cnd_MONT_PERI,@cnd_MONT_PANA,
			@cnd_MONT_PAIN,@cnd_MONT_TAPU, @cnd_MONT_TACI,@cnd_MONT_TAEL,
			@cnd_MONT_FUPl, @cnd_VAAG_TERC, @cnd_MONT_FIJO,@cnd_VAAG_PROP,
			@cnd_MONT_VAFI,  @cnd_MONT_VEHI, @cnd_MONT_IVAC
		END -- w2
		end
		else
		BEGIN
			set @v_correlativo = null
			set @p_codi_erro = 'S'
			set @p_mens_erro = 'no se calcuar totales'
		END	
		CLOSE c_noresum

		print('insert lcv_tota_nore')

		insert into lcv_tota_nore (CORR_LICV, CODI_EMPR, TIPO_DOCU, CODI_NORE, MONT_NORE, OPER_NORE)
			select	CORR_LICV, CODI_EMPR, TIPO_DOCU, CODI_NORE, sum(MONT_NORE),count(*)
			from lcv_deta_nore
			where CODI_EMPR=@p_codi_empr and CORR_LICV=@v_correlativo
			group by CORR_LICV, CODI_EMPR, TIPO_DOCU,CODI_NORE
	
			if (@@ERROR <> 0)
					BEGIN
						set @v_correlativo = null
						set @p_codi_erro = 'S'
						set @p_mens_erro = 'Error en el traspaso de totales'
						print(@lugar)
					END
	
	
		print('insert lcv_tota_impu')

		insert into lcv_tota_impu  (CORR_LICV, CODI_EMPR, TIPO_DOCU, CODI_IMPU, FACT_ADIC,	MONT_IMPU)
							select	CORR_LICV, CODI_EMPR, TIPO_DOCU, CODI_IMPU, NULL, 		sum(MONT_IMPU)
							from lcv_tota_docu
							where CODI_EMPR=@p_codi_empr and CORR_LICV=@v_correlativo
							group by CORR_LICV, CODI_EMPR, TIPO_DOCU,CODI_IMPU,CODI_OPER


					/*				
					insert into lcv_tota_impu 
												(CORR_LICV, CODI_EMPR,TIPO_DOCU,CODI_IMPU,FACT_ADIC,MONT_IMPU)
										select	CORR_LICV, CODI_EMPR, TIPO_DOCU, CODI_IMPU, max(TAS_IMPU), sum(MONT_IMPU)
										from lcv_tota_docu
										where CODI_EMPR=@p_codi_empr and CORR_LICV=@v_correlativo
										group by CORR_LICV, CODI_EMPR, TIPO_DOCU,CODI_IMPU,CODI_OPER
					*/			
			if (@@ERROR <> 0)
			BEGIN
				set @v_correlativo = null
				set @p_codi_erro = 'S'
				set @p_mens_erro = 'Error en el traspaso de impuestos'
				print(@lugar)
			END
				print('fin c_nosesum')
			if @p_codi_erro = 'N'
			BEGIN --9
				SET @lugar = 'eliminado registro tabla temporales'
				print(@lugar)
				-- eliminar registro de la tabla que no se encuentran en resumen
				delete from lcv_tota_temp 
				where peri_trib =@p_periodo 
				and		tipo_oper=@p_tipo_oper
				AND		tipo_docu not IN (50,52,35,38,39,41,105,919,920,922,924)
				and		rutt_asoc =(SELECT b.rutt_empr
									FROM	empr b
									where	b.codi_empr=@p_codi_empr  ) 

				delete	from lcv_nore_temp 
				where	peri_trib =@p_periodo and tipo_oper=@p_tipo_oper
				AND 	tipo_docu not IN (50,52,35,38,39,41,105,919,920,922,924)
				and 	rutt_asoc =(SELECT b.rutt_empr
									FROM 	empr b
									where	b.codi_empr=@p_codi_empr  ) 

				delete 	from lcv_deta_temp 
				where 	peri_trib =@p_periodo 
				and 	tipo_oper=@p_tipo_oper
				AND 	tipo_docu not IN (50,52,35,38,39,41,105,919,920,922,924)
				and 	rutt_asoc =(SELECT b.rutt_empr
									FROM 	empr b
									where	b.codi_empr=@p_codi_empr  ) 

				if (@@ERROR <> 0)
				BEGIN
					set @v_correlativo = null
					set @p_codi_erro = 'S'
					set @p_mens_erro = 'Error al eliminar registros de tablas temporales'
					print(@lugar)
				END	
			end
		end
		-- FIN CURSOR c_noresum
		SET @lugar = 'Fin proceso de carga manual'
		print(@lugar)
		print('error')
		print(@@ERROR)
		set @p_mens_erro='proceso termina con exito'
		
		if (@@ERROR <> 0)
			BEGIN
				set @v_correlativo = null
				set @p_codi_erro = 'S'
				select @p_mens_erro = 'Error: ' + @v_lugar
		END
	END --4
	-- if m1 Procesar dctos manuales*/
	if (@p_codi_erro = 'N') and (@@ERROR = 0)
	BEGIN
		set @p_corr_ejec = @v_correlativo
		COMMIT TRANSACTION
	END
	else
	ROLLBACK TRANSACTION
	DEALLOCATE c_noresum
	DEALLOCATE c_carg_Manual
END --1
GO

GO
--SqlScripter----[dbo].[PRC_LGD_DELE_TOTAJU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PRC_LGD_DELE_TOTAJU]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_LGD_DELE_TOTAJU] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- =============================================
-- Author:		Mario Sandoval
-- Create date: 2009-08-11
-- Description:	Limpia de la base de datos los todos libro de Guia del tipo TOTAL o AJUSTE para el periodo y empresa dada
-- =============================================

ALTER PROCEDURE [dbo].[PRC_LGD_DELE_TOTAJU]
(@p_codi_empr numeric(9),
	@p_periodo_desd varchar(8),
	@p_periodo_hast varchar(8),
	@p_codi_erro varchar(1) output,
	@p_mens_erro varchar(200) output)
as
BEGIN
	
	declare
		@v_correlativo numeric(22)
	declare c_delete cursor for
		select corr_ligd from lgd_enca_ligd
			where codi_empr = @p_codi_empr 
			  and codi_peri between ISNULL(@p_periodo_desd,'1900-01') and ISNULL(@p_periodo_hast,'2200-12')
			  and tipo_libr = 'ESPECIAL'
			  and tipo_segm in ('TOTAL','PARCIAL', 'FINAL')	  	

	BEGIN TRANSACTION
		set @p_codi_erro = 'N'
		OPEN c_delete
		FETCH NEXT FROM c_delete
		into @v_correlativo
		while @@FETCH_STATUS=0
		begin
			delete lgd_deta_docu where codi_empr = @p_codi_empr and corr_ligd = @v_correlativo
			delete lgd_tras_segm where codi_empr = @p_codi_empr and corr_ligd = @v_correlativo
			delete lgd_tota_segm where codi_empr = @p_codi_empr and corr_ligd = @v_correlativo
			delete lgd_tras_peri where codi_empr = @p_codi_empr and corr_ligd = @v_correlativo
			delete lgd_tota_peri where codi_empr = @p_codi_empr and corr_ligd = @v_correlativo
						
			if (@@ERROR <> 0)
			begin
				set @p_codi_erro = 'S'
				set @p_mens_erro = 'Error no se pueden limpiar los libros con correlativo: '+ @v_correlativo
			end
			FETCH NEXT FROM c_delete
			into @v_correlativo
		end 
		CLOSE c_delete
		DEALLOCATE c_delete

		if (@p_codi_erro = 'N')
		begin
			delete lgd_enca_ligd
			where codi_empr = @p_codi_empr 
			  and codi_peri between ISNULL(@p_periodo_desd,'1900-01') and ISNULL(@p_periodo_hast,'2200-12')			  
			  and tipo_libr = 'ESPECIAL'
			  and tipo_segm in ('TOTAL','PARCIAL', 'FINAL')	
		end

		if (@p_codi_erro = 'N') and (@@ERROR = 0)
			COMMIT TRANSACTION
		else
			ROLLBACK TRANSACTION
END
GO

GO
--SqlScripter----[dbo].[PRC_LGD_LIBR_TOTAAJU].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PRC_LGD_LIBR_TOTAAJU]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_LGD_LIBR_TOTAAJU] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_LGD_LIBR_TOTAAJU]
(@p_codi_empr numeric(9),
	@p_periodo_desd varchar(8),
	@p_periodo_hast varchar(8),
	@p_nume_segm numeric(3),
	@p_foli_noti varchar(3),
	@p_tipo_segm varchar(7),
	@p_tipo_oper numeric(2),
	@p_rutt_rece numeric(18),
	@p_corr_ejec numeric(22) output,
	@p_codi_erro varchar(1) output,
	@p_mens_erro varchar(200) output)
AS
BEGIN --1
	declare
	@primer_dia varchar(10),
	@ultimo_dia varchar(10),
	@v_correlativo numeric(22),
	@v_rutt_empr numeric(11),
	@v_digi_empr varchar(1),
	@v_feho_firm varchar(20),
	@v_vers_licv varchar(10),
	@v_tipo_refe varchar(3),
	@v_foli_refe varchar(18),
	@v_fech_refe varchar(10),
	@v_iva_rtto  varchar(18),
	@v_iva_rtpa  varchar(18),
	@v_retIva 	varchar(18),
	@vm_iva_rtto 	varchar(18),
	@vm_iva_rtpa 	varchar(18),
	@vm_retIva 	varchar(18),
	@v_lugar	varchar(60),
	@lugar varchar(200),
	--@p_rutt_rece1 varchar(18),	
	--@p_rutt_rece2 varchar(18),
	@p_tipo_oper1 varchar(2),
	@p_tipo_oper2 varchar(2),
	@valo_camb numeric(22,4),
	--@p_periodo_hast1 varchar(8),
	--@p_periodo_desd1 varchar(8),
	@pc_tipo_docu numeric(3),
	@p_corr_cuen numeric(18), -- variable q se ocupa en los cursores
	@pc_foli_docu numeric(10) -- variable q se ocupa en los cursores
	--@v_codi_tras_segm numeric(22),
	--@v_codi_tras_peri numeric(22)

 

	declare ---variables del cursor c_dctos
		@vc_tipo_docu numeric(3), @vc_foli_docu numeric(10), @vc_rutt_rece numeric(9), @vc_digi_rece varchar(1),
		@vc_tasa_vaag numeric(5,2), @vc_foli_clie varchar(12), @vc_vent_serv  numeric(1), @vc_fech_emis varchar(10),
		@vc_codi_sucu numeric(9), @vc_nomb_rece varchar(100), @vc_mont_exen numeric(22,4), @vc_mont_neto numeric(18),
		@vc_tasa_vagg numeric(5,2), @vc_cred_es65 numeric(18), @vc_gara_enva numeric(18), @vc_mont_tota numeric(22,4),
		@vc_impu_vanr numeric(18), @vc_mont_nofa numeric(18), @vc_ivag_prop numeric(18), @vc_ivag_terc numeric(18),
		@vc_impu_vaag numeric(18),@vc_tipo_mone varchar(15), @vc_indi_vegd numeric(1,0)
	
	declare c_dctos cursor for 
		select	a.TIPO_DOCU tipo_docu, a.FOLI_DOCU foli_docu, a.RUTT_RECE rutt_rece, a.DIGI_RECE digi_rece,
				a.TASA_VAAG tasa_vaag, a.FOLI_CLIE foli_clie, a.VENT_SERV vent_serv, a.FECH_EMIS fech_emis,
				a.CODI_SUCU codi_sucu, a.NOMB_RECE nomb_rece, a.MONT_EXEN mont_exen, a.MONT_NETO mont_neto,
				a.TASA_VAAG tasa_vagg, a.CRED_ES65 cred_es65, a.GARA_ENVA gara_enva, a.MONT_TOTA mont_tota,
				a.IMPU_VANR impu_vanr, a.MONT_NOFA mont_nofa, a.IVAG_PROP ivag_prop, a.IVAG_TERC ivag_terc,
				a.IMPU_VAAG impu_vaag, a.TIPO_MONE tipo_mone, a.INDI_VEGD indi_vegd
		from dte_enca_docu a, dte_esta_docu b
		where a.codi_empr = @p_codi_empr
			and a.tipo_docu = 52
			and a.indi_vegd > 0
			and a.fech_emis between ISNULL(@p_periodo_desd,'1900-01')+'-01' and convert(char(10),dateadd(mm,1,dateadd(dd, -1, convert(datetime, ISNULL(@p_periodo_hast,'2200-12')+'-01', 120))),120)
			and a.esta_docu = b.esta_docu
			and b.indi_libr = 'S'	  
			and a.rutt_rece between ISNULL(@p_rutt_rece,'1111111') and ISNULL(@p_rutt_rece,'99999999')
			and a.indi_vegd between ISNULL(@p_tipo_oper,'1') and ISNULL(@p_tipo_oper, '7')


	BEGIN TRANSACTION
		set @lugar = 'Comienzo' 
		set @p_codi_erro = 'N'
		--Procesar encabezado
		set @v_correlativo = 0
		select @primer_dia = ISNULL(@p_periodo_desd,'1900-01') + '-01'
		select @ultimo_dia = convert(char(10),dateadd(mm,1,dateadd(dd, -1, convert(datetime, ISNULL(@p_periodo_hast, '2200-12')+'-01', 120))),120)
		set @lugar = 'recuperando valor de la secuencia'
		select @v_correlativo = ISNULL(max(corr_ligd),0)+1 from lgd_enca_ligd
		
		if (@@ERROR <> 0)
		begin
	  		set @p_codi_erro = 'S'
			set @p_mens_erro = 'Error. Al recuperar valor de secuencia'
			print(@lugar)
		end -- END @@ERROR <> 0

		if @p_codi_erro = 'N' 
		begin
			set @lugar = 'recuperando datos de la empresa'
			select @v_rutt_empr=rutt_empr, @v_digi_empr=digi_empr
			from empr
			where codi_empr = @p_codi_empr;
			if (@@ERROR <> 0)
			begin
		  		set @p_codi_erro = 'S'
				set @p_mens_erro = 'Error. Datos de la epresa no encontrados'
				print(@lugar)
			end		--END @@ERROR
		end -- END IF CODI ERROR = 'N'

		if @p_codi_erro = 'N' 
		begin
			set @lugar='formando cadena fecha/hora'
			select @v_feho_firm=convert(char(10), getdate(), 120)+'T'+convert(char(8),getdate(),8)
			
			set @lugar='recuperando version'
			select @v_vers_licv=isnull(max(code_desc),' ')
			from   sys_code
			where  domain_code = 72 and code_aux = 'S'

			if (@@ERROR <> 0)
			begin
				set @v_correlativo = null
		  		set @p_codi_erro = 'S'
				set @p_mens_erro = 'Error al formar cadena de feha/hora'
				print(@lugar)
			end	--END IF @@ERROR
		end;  -- END IF CODI ERROR = 'N'
	
		if @p_codi_erro = 'N' 
		begin
			-- Insertar encabezado
			IF @p_tipo_segm = 'PARCIAL'
			begin
			insert into lgd_enca_ligd(CORR_LIGD, CODI_EMPR, RUTT_EMIS, DIGI_EMIS,
						  CODI_PERI, TIPO_LIBR, TIPO_SEGM, NUME_SEGM,  
						  FOLI_NOTI, FEHO_FIRM)
			values (@v_correlativo, @p_codi_empr, @v_rutt_empr, upper(@v_digi_empr),
		   			ISNULL(@p_periodo_hast,'2200-12'), 'ESPECIAL', @p_tipo_segm, @p_nume_segm,
					@p_foli_noti, @v_feho_firm)
			if (@@ERROR <> 0)
			begin
				set @v_correlativo = null
		  		set @p_codi_erro = 'S'
				set @p_mens_erro = 'Error al insertar encabezado'
				print(@lugar)
			end  -- END IF @@ERROR      
			end -- end if tipo segmento parcial    


	IF @p_tipo_segm IN ('FINAL', 'TOTAL')
			begin
			insert into lgd_enca_ligd(CORR_LIGD, CODI_EMPR, RUTT_EMIS, DIGI_EMIS,
						  CODI_PERI, TIPO_LIBR, TIPO_SEGM,   
						  FOLI_NOTI, FEHO_FIRM)
			values (@v_correlativo, @p_codi_empr, @v_rutt_empr, upper(@v_digi_empr),
		   			ISNULL(@p_periodo_hast,'2200-12'), 'ESPECIAL', @p_tipo_segm, 
					@p_foli_noti, @v_feho_firm)
			if (@@ERROR <> 0)
			begin
				set @v_correlativo = null
		  		set @p_codi_erro = 'S'
				set @p_mens_erro = 'Error al insertar encabezado'
				print(@lugar)
			end  -- END IF @@ERROR      
			end -- end if tipo segmento FINAL O TOTAL  
                                                             
		end -- END IF CODI ERROR = 'N'
	
	--FIN Procesar encabezado

			if @p_codi_erro = 'N' -- x1
			begin
			-- Procesar documentos electronicos
			set @v_lugar = 'Antes del for cursor c_dctos';
			OPEN c_dctos
			FETCH NEXT FROM c_dctos
			into @vc_tipo_docu ,@vc_foli_docu ,@vc_rutt_rece ,@vc_digi_rece,
				@vc_tasa_vaag ,@vc_foli_clie , @vc_vent_serv  ,@vc_fech_emis,
				@vc_codi_sucu , @vc_nomb_rece ,@vc_mont_exen ,@vc_mont_neto,
				@vc_tasa_vagg ,@vc_cred_es65 ,@vc_gara_enva ,@vc_mont_tota ,
				@vc_impu_vanr  ,@vc_mont_nofa ,@vc_ivag_prop ,@vc_ivag_terc,
				@vc_impu_vaag, @vc_tipo_mone, @vc_indi_vegd
			while @@FETCH_STATUS=0
			begin
				set @v_lugar = 'dentro cursor c_dctos';
				select top 1 @v_tipo_refe=tipo_refe, @v_foli_refe=foli_refe, @v_fech_refe=fech_refe
				from   dte_docu_refe r, dte_tipo_docu t
				where  r.tipo_refe = t.tipo_docu and t.docu_elec = 'S'
						and  r.codi_empr = @p_codi_empr and r.tipo_docu = @vc_tipo_docu 
						and r.foli_docu = @vc_foli_docu
				set @v_lugar = 'en cursor c_dctos,(tipo_docu 56,61) despues de referencias'
			
				if @v_tipo_refe in (45, 46)
				begin
					set @v_retIva = @vc_impu_vaag - @vc_impu_vanr
					if @v_retIva = @vc_impu_vaag
					begin
						set @v_iva_rtto = @v_retIva
					end
					else
						set @v_iva_rtpa = @v_retIva
				end
				else
				begin
					set @v_tipo_refe = null
					set @v_foli_refe = null
				end
				if (@@ERROR <> 0)
				begin
					set @v_correlativo = null
	  				set @p_codi_erro = 'S'
					select @p_mens_erro = 'Error en referencia electronica para el DTE: '+@vc_tipo_docu+' con folio: '+@vc_foli_docu
					print(@lugar)
				end	

				if @vc_tipo_docu in (110,111,112) 
				begin
					set @v_lugar = 'en cursor c_dctos (tipo_docu 110,111,112)'
					if @vc_tipo_mone != 'PESO CL'and @vc_tipo_mone != ''
					begin	
						 select @valo_camb= valo_camb from camb_mone where tipo_mone= @vc_tipo_mone and fech_camb = @vc_fech_emis 
						
						set @vc_mont_exen = round(@vc_mont_exen * @valo_camb,0)
						set @vc_mont_tota = round(@vc_mont_tota * @valo_camb,0)
					end
					if (@@ERROR <> 0)
					begin
						set @v_correlativo = null
		  				set @p_codi_erro = 'S'
						select @p_mens_erro = 'Error en calculo de tipo moneda para DTE: '+@vc_tipo_docu+' con folio: '+@vc_foli_docu
						print(@lugar)
					end
				end	


			if @p_codi_erro = 'N'
			begin -- if x3
			set @v_lugar = 'en cursor c_dctos antes bloque insert deta_docu'
			insert into lgd_deta_docu(CORR_LIGD,CODI_EMPR , FOLI_DOCU, 
						VIGE_DOCU, TIPO_OPER, FECH_DOCU, RUTT_ASOC, DIGI_ASOC,
						NOMB_ASOC, MONT_NETO, TASA_VAAG, MONT_TOTA, MONT_MODI,							
						TIPO_REFE, FOLI_REFE, FECH_REFE)
			values (@v_correlativo, @p_codi_empr, @vc_foli_docu, 
					0,@vc_indi_vegd, @vc_fech_emis, @vc_rutt_rece, upper(@vc_digi_rece),
					substring(@vc_nomb_rece,0,50), @vc_mont_neto, @vc_tasa_vaag, @vc_mont_tota,
					0,@v_tipo_refe, @v_foli_refe,@v_fech_refe)
			end -- if x3

			set @v_lugar = 'en cursor c_dctos antes de end loop'

				FETCH NEXT FROM c_dctos
				into @vc_tipo_docu ,@vc_foli_docu ,@vc_rutt_rece ,@vc_digi_rece,
				@vc_tasa_vaag ,@vc_foli_clie , @vc_vent_serv  ,@vc_fech_emis,
				@vc_codi_sucu , @vc_nomb_rece ,@vc_mont_exen ,@vc_mont_neto,
				@vc_tasa_vagg ,@vc_cred_es65 ,@vc_gara_enva ,@vc_mont_tota ,
				@vc_impu_vanr  ,@vc_mont_nofa ,@vc_ivag_prop ,@vc_ivag_terc,
				@vc_impu_vaag, @vc_tipo_mone, @vc_indi_vegd
			end  --while cursor c_dctos
			CLOSE c_dctos
		end -- if x1
	set @v_lugar = 'Fin cursor c_dctos'
	-- FIN Procesar documentos electronicos
		if (@@ERROR <> 0)
		begin
			set @v_correlativo = null
			set @p_codi_erro = 'S'
			select @p_mens_erro = 'Error en ' + @lugar
			print(@lugar)
		end

		-- Generar totalizador
	if @p_codi_erro = 'N'
	begin
		if @p_tipo_segm = ('PARCIAL') 
		begin
			set @p_corr_cuen = (SELECT COUNT(CORR_LIGD)
			FROM LGD_DETA_DOCU
			WHERE CODI_EMPR=@p_codi_empr and CORR_LIGD=@v_correlativo and TIPO_OPER = 1)

			if @p_corr_cuen > 0
				begin
				insert into lgd_tota_segm(CORR_LIGD, CODI_EMPR, NUME_FOAN,
										  NUME_GANU, TOTA_GVTA, MONT_GVTA, MONT_MODI)
				SELECT CORR_LIGD, CODI_EMPR, 0, 
					   0, COUNT(CORR_LIGD), SUM(MONT_TOTA), 0
				FROM LGD_DETA_DOCU
				WHERE CODI_EMPR=@p_codi_empr and CORR_LIGD=@v_correlativo and TIPO_OPER = 1
				group by CORR_LIGD, CODI_EMPR
				end
			else
				begin
					insert into lgd_tota_segm(CORR_LIGD, CODI_EMPR, NUME_FOAN,
								  NUME_GANU, TOTA_GVTA, MONT_GVTA, MONT_MODI)
					SELECT CORR_LIGD, CODI_EMPR, 0, 
						   0, 0, 0, 0
					FROM LGD_DETA_DOCU
					WHERE CODI_EMPR=@p_codi_empr and CORR_LIGD=@v_correlativo and TIPO_OPER between 2 and 7
					group by CORR_LIGD, CODI_EMPR
				end
		

			if (@@ERROR <> 0)
			begin
				set @p_codi_erro = 'S'
				set @p_mens_erro = 'Error. Al recuperar valor de codi_tras segmento'
				print(@lugar)
			end	
		BEGIN TRY
	
			insert into lgd_tras_segm(CORR_LIGD, CODI_EMPR, CODI_TRAS, TIPO_TRAS, CANT_GUIA, MONT_GUIA, CODI_EMEX)
			SELECT CORR_LIGD, CODI_EMPR, TIPO_OPER, TIPO_OPER,  
				   COUNT(CORR_LIGD) as cant_guia, 
				   SUM(MONT_TOTA) as mont_guia, '' as codi_emex
			FROM LGD_DETA_DOCU
			WHERE CODI_EMPR=@p_codi_empr and CORR_LIGD=@v_correlativo and TIPO_OPER != 1
			GROUP BY CORR_LIGD, CODI_EMPR, TIPO_OPER
							  			
		END TRY
		BEGIN CATCH
		SELECT
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_MESSAGE() AS ErrorMessage
	
		END CATCH 
		END
	end
			if (@@ERROR <> 0)
			begin
				set @v_correlativo = null
				set @p_codi_erro = 'S'
				SET @p_mens_erro = 'Error al generar totalizadores de documentos'
				print(@lugar)
			end 
		
		if @p_codi_erro = 'N'
		begin
		if @p_tipo_segm in ('FINAL', 'TOTAL')
		begin
			set @p_corr_cuen = (SELECT COUNT(CORR_LIGD)
			FROM LGD_DETA_DOCU
			WHERE CODI_EMPR=@p_codi_empr and CORR_LIGD=@v_correlativo and TIPO_OPER = 1)

			if @p_corr_cuen > 0
				begin
					insert into lgd_tota_peri(CORR_LIGD, CODI_EMPR, NUME_FOAN,
								  NUME_GANU, TOTA_GVTA, MONT_GVTA, MONT_MODI)
					SELECT CORR_LIGD, CODI_EMPR, 0, 
						   0, COUNT(CORR_LIGD), SUM(MONT_TOTA), 0
					FROM LGD_DETA_DOCU
					WHERE CODI_EMPR=@p_codi_empr and CORR_LIGD=@v_correlativo and TIPO_OPER = 1
					group by CORR_LIGD, CODI_EMPR
				end
			else
				begin
					insert into lgd_tota_peri(CORR_LIGD, CODI_EMPR, NUME_FOAN,
								  NUME_GANU, TOTA_GVTA, MONT_GVTA, MONT_MODI)
					SELECT CORR_LIGD, CODI_EMPR, 0, 
						   0, 0, 0, 0
					FROM LGD_DETA_DOCU
					WHERE CODI_EMPR=@p_codi_empr and CORR_LIGD=@v_correlativo and  TIPO_OPER between 2 and 7
					group by CORR_LIGD, CODI_EMPR
				end
			if (@@ERROR <> 0)
			begin
				set @p_codi_erro = 'S'
				set @p_mens_erro = 'Error. Al recuperar valor de codi_tras periodo'
				print(@lugar)
			end	
		BEGIN TRY
			INSERT  INTO  lgd_tras_peri(CORR_LIGD, CODI_EMPR, CODI_TRAS,
							TIPO_TRAS, CANT_GUIA, MONT_GUIA, CODI_EMEX)
			SELECT	CORR_LIGD, CODI_EMPR,TIPO_OPER, tipo_oper,
					COUNT(CORR_LIGD) as cant_guia, 
					SUM(MONT_TOTA) as mont_guia, '' as codi_emex
			FROM LGD_DETA_DOCU
			WHERE CODI_EMPR=@p_codi_empr and CORR_LIGD=@v_correlativo and TIPO_OPER != 1
			GROUP BY CORR_LIGD, CODI_EMPR, TIPO_OPER
								
		END TRY
		BEGIN CATCH
				SELECT
					ERROR_PROCEDURE() AS ErrorProcedure,
					ERROR_MESSAGE() AS ErrorMessage
			
		END CATCH
		END
end
		
set @p_corr_ejec = @v_correlativo
	-- FIN Generar totalizador
	if (@p_codi_erro = 'N') and (@@ERROR = 0)
	begin
		set @p_corr_ejec = @v_correlativo
	if @p_tipo_segm = 'FINAL'
		begin
		delete lgd_deta_docu where corr_ligd = @v_correlativo
		end
		COMMIT TRANSACTION
	end
	ELSE
		ROLLBACK TRANSACTION
		DEALLOCATE c_dctos
			
		--DEALLOCATE c_dManuales	
	END	--
GO

GO
--SqlScripter----[dbo].[prc_libr_ajus].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[prc_libr_ajus]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_libr_ajus] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*drop procedure [dbo].[prc_libr_ajus]
go*/

/* Procedure PRC_LIBR_AJUS
	OT : 202325
	Fecha Creacion : 10/11/2005
	Autor : Diego Sanchez
	Genera libro de boleta AJUSTES para el FOLI_NOTI DADO
	Migrado desde oracle 04/05/2007 por hferrada
*/
ALTER PROCEDURE [dbo].[prc_libr_ajus]
(@P_CODI_EMPR varchar(9),
					 @P_CORRE_LIBE varchar(12),
					 @P_FOLI_NOTI varchar(10),
					 @P_FECH_DESD varchar(10),
					 @P_FECH_HAST varchar(10),
					 @P_CODI_ERRO varchar(1) output,
					 @P_MENS_ERRO varchar(200) output) as
begin
	set @P_CODI_ERRO = 'N'
	set @P_MENS_ERRO = ''

	--busca nuevo documentos no cargados en el detalle del libro, para la empresa y el foli_noti informdo
	print('busca nuevo documentos no cargados en el detalle del libro, para la empresa y el foli_noti informdo')
	Insert into LBE_DETA_LIBR
		(CODI_EMPR, CORR_LIBE, TIPO_DOCU, FOLI_DOCU, FOLI_ANUL, TIPO_SERV, FECH_EMIS, FECH_VENC,
		PERI_DESD, PERI_HAST, CODI_SUCU, RUTT_RECE, DIGI_RECE, CODI_INTE, MONT_EXEN, MONT_TOTA,
		MONT_NOFA, TOTA_PERI, SALD_ANTE, VALO_PAGA, MONT_NETO, TASA_VAAG, FOLI_NOTI)
		(select codi_empr, @p_corre_libe, tipo_docu, foli_docu,' ', indi_serv, fech_emis,
			fech_venc, pedi_desd, peri_hast,codi_sucu, rutt_rece, digi_rece, codi_inte,
			mont_exen, mont_tota, mont_nofa, tota_peri, sald_ante, valo_paga,
			mont_neto, tasa_vaag, @p_foli_noti
		from 	bel_enca_docu A
		where 	codi_empr = @P_CODI_EMPR 
		  and	fech_emis between @P_FECH_DESD and @P_FECH_HAST
		  and not exists (Select 1
					from LBE_DETA_LIBR C
					where A.codi_empr = C.codi_empr and A.tipo_docu = C.tipo_docu
					  and A.foli_docu = C.Foli_docu and C.Foli_Noti = @p_foli_noti)
		  and not exists (Select 1
					from Bel_foli_anul B
					where A.codi_empr = B.codi_empr
					  and A.tipo_docu = B.tipo_docu and A.foli_docu = B.Foli_Anul))


	-- agrega los datos de anulados
	print('agrega los datos de anulados')
	Insert into LBE_DETA_LIBR
		(CODI_EMPR, CORR_LIBE, TIPO_DOCU, FOLI_DOCU, FOLI_ANUL, TIPO_SERV, FECH_EMIS, FECH_VENC,
		PERI_DESD, PERI_HAST, CODI_SUCU, RUTT_RECE, DIGI_RECE, CODI_INTE, MONT_EXEN, MONT_TOTA,
		MONT_NOFA, TOTA_PERI, SALD_ANTE, VALO_PAGA, MONT_NETO, TASA_VAAG, FOLI_NOTI)
		(select codi_empr, @p_corre_libe, tipo_docu, foli_anul,'A',0, ' ',
			' ', ' ', ' ',0, 0, ' ', ' ',0, 0,0, 0, 0, 0,0,0, @p_foli_noti
		from 	bel_foli_anul A
		where 	codi_empr = @p_codi_empr
		  and	fech_anul between @P_FECH_DESD and @P_FECH_HAST
		  and not exists (Select 1
					from LBE_DETA_LIBR B
					where A.codi_empr = B.codi_empr and A.tipo_docu = B.tipo_docu
					  and A.foli_anul = B.Foli_docu and B.Foli_Noti = @p_foli_noti
					  and B.foli_anul = 'A'))

	-- genera el segmento
	print('genera el segmento')
	execute prc_resu_segm @P_CODI_EMPR, @P_CORRE_LIBE, @P_CODI_ERRO out, @P_MENS_ERRO out

	-- RESUMEN PERIODO
	print('RESUMEN PERIODO')
	insert into LBE_RESU_PERI
		(codi_empr, corr_libe, tipo_docu, cant_anul)
		(select codi_empr, @P_CORRE_LIBE, tipo_docu, 0
		from 	LBE_DETA_LIBR
		where 	codi_empr = @P_CODI_EMPR
		  and	foli_noti = @P_FOLI_NOTI
		group by codi_empr, tipo_docu)

	-- actualiza los anulados
	print('actualiza los anulados')
	update LBE_RESU_PERI 
	   set cant_anul = (select count(codi_empr)
				from LBE_DETA_LIBR b
				where foli_anul = 'A' and LBE_RESU_PERI.codi_empr = b.codi_empr
				  and foli_noti = @P_FOLI_NOTI and LBE_RESU_PERI.tipo_docu = b.tipo_docu)
	where codi_empr = @P_CODI_EMPR and corr_libe = @P_CORRE_LIBE

	insert into LBE_PERI_TISE
		(CODI_EMPR, CORR_LIBE, TIPO_DOCU, INDI_SERV, PERI_DEVE, TOTA_DOCU, TOTA_EXEN,
		 TOTA_NETO, TASA_IVAA, MONT_IVAA, MONT_TOTA, MONT_NOFA, TOTA_PERI, SALD_ANTE,
		 VALO_PAGA)
		(select codi_empr, @P_CORRE_LIBE, tipo_docu,tipo_serv, ' ',
			count(codi_empr), sum(isnull(mont_exen,0)),
			sum(isnull(mont_neto,0)), max(tasa_vaag),
			sum(mont_tota - mont_neto), sum(isnull(mont_tota,0)),
			sum(isnull(mont_nofa,0)), sum(isnull(tota_peri,0)),
			sum(isnull(sald_ante,0)), sum(isnull(valo_paga,0))
		from LBE_DETA_LIBR
		where codi_empr = @P_CODI_EMPR and foli_noti = @P_FOLI_NOTI
		  and foli_anul <> 'A' and tipo_serv <> 2
		group by codi_empr, tipo_docu, tipo_serv);

	-- Insertar en tabla LBE_PER_TISE los serv=2
	print('Insertar en tabla LBE_PER_TISE los serv=2')
	Insert into LBE_PERI_TISE
		(CODI_EMPR, CORR_LIBE, TIPO_DOCU, INDI_SERV, PERI_DEVE, TOTA_DOCU, TOTA_EXEN,
		 TOTA_NETO, TASA_IVAA, MONT_IVAA, MONT_TOTA, MONT_NOFA, TOTA_PERI, SALD_ANTE,
		 VALO_PAGA)
		(select codi_empr, @P_CORRE_LIBE, tipo_docu,tipo_serv, substring(fech_venc,1,7),
			count(codi_empr), sum(isnull(mont_exen,0)),
			sum(isnull(mont_neto,0)), max(tasa_vaag),
			sum( mont_tota - mont_neto ), sum(isnull(mont_tota,0)),
			sum(isnull(mont_nofa,0)), sum(isnull(tota_peri,0)),
			sum(isnull(sald_ante,0)), sum(isnull(valo_paga,0))
		from LBE_DETA_LIBR
		where codi_empr = @P_CODI_EMPR and foli_noti = @P_FOLI_NOTI
		  and foli_anul <> 'A' and tipo_serv = 2
		group by codi_empr, tipo_docu, tipo_serv, substring(fech_venc,1,7));
end
GO

GO
--SqlScripter----[dbo].[prc_libr_segm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[prc_libr_segm]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_libr_segm] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*drop procedure [dbo].[prc_libr_segm]
go*/

/* Procedure PRC_Resu_BOEL
	OT : 202325
	Fecha Creacion : 27/10/2005
	Autor : Diego Sanchez
	Genera libro de boleta segmento
	Recibe el codigo de emprea u el correlativo de libro de LBE_CARA_LIBR
	1- Crea el detalle en base a BEL_ENCA_DOCU
	2 - llama al procedimiento PRC_RESU_SEGM
	Migrado desde oracle 03/05/2007 por hferrada
*/
ALTER PROCEDURE [dbo].[prc_libr_segm]
(@P_CODI_EMPR varchar(9),
					 @P_CORRE_LIBE varchar(12),
					 @P_FOLI_NOTI varchar(10),
					 @P_FECH_DESD varchar(10),
					 @P_FECH_HAST varchar(10),
					 @P_CODI_ERRO varchar(1) output,
					 @P_MENS_ERRO varchar(200) output) as
begin
	set @P_CODI_ERRO = 'N'
	set @P_MENS_ERRO = ''
	-- crea el detalle del libro para la caratula 
	print('crea el detalle del libro para la caratula')
	Insert into LBE_DETA_LIBR
		(CODI_EMPR, CORR_LIBE, TIPO_DOCU, FOLI_DOCU, FOLI_ANUL, TIPO_SERV, FECH_EMIS, FECH_VENC,
		PERI_DESD, PERI_HAST, CODI_SUCU, RUTT_RECE, DIGI_RECE, CODI_INTE, MONT_EXEN, MONT_TOTA,
		MONT_NOFA, TOTA_PERI, SALD_ANTE, VALO_PAGA, MONT_NETO, TASA_VAAG, FOLI_NOTI)
		(select codi_empr, @p_corre_libe, tipo_docu, foli_docu,' ', indi_serv, fech_emis,
			fech_venc, pedi_desd, peri_hast,codi_sucu, rutt_rece, digi_rece, codi_inte,
			mont_exen, mont_tota, mont_nofa, tota_peri, sald_ante, valo_paga,
			mont_neto, tasa_vaag, @p_foli_noti
		from 	bel_enca_docu A
		where 	codi_empr = @P_CODI_EMPR
		  and	fech_emis between @P_FECH_DESD and @P_FECH_HAST
		  and	not exists (Select 1
					from Bel_foli_anul B
					where A.codi_empr = B.codi_empr
					  and A.tipo_docu = B.tipo_docu and A.foli_docu = B.Foli_Anul))

	-- agrega los datos de anulados
	print('agrega los datos de anulados')
	Insert into LBE_DETA_LIBR
		(CODI_EMPR, CORR_LIBE, TIPO_DOCU, FOLI_DOCU, FOLI_ANUL, TIPO_SERV, FECH_EMIS, FECH_VENC,
		PERI_DESD, PERI_HAST, CODI_SUCU, RUTT_RECE, DIGI_RECE, CODI_INTE, MONT_EXEN, MONT_TOTA,
		MONT_NOFA, TOTA_PERI, SALD_ANTE, VALO_PAGA, MONT_NETO, TASA_VAAG, FOLI_NOTI)
		(select codi_empr, @p_corre_libe, tipo_docu, foli_anul,'A',0, ' ',
			' ', ' ', ' ',0, 0, ' ', ' ',0, 0,0, 0, 0, 0,0,0, @p_foli_noti
		from 	bel_foli_anul
		where 	codi_empr = @p_codi_empr
		  and	fech_anul between @P_FECH_DESD and @P_FECH_HAST)

	--  Inserta lbe_segm_tise 
	print('Inserta lbe_segm_tise')
	execute prc_resu_segm @P_CODI_EMPR, @P_CORRE_LIBE, @P_CODI_ERRO out, @P_MENS_ERRO out
end
GO

GO
--SqlScripter----[dbo].[prc_libr_tota].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[prc_libr_tota]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_libr_tota] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*   objetivo : crear libro FINAL.sin segmentos
		se base en BEL_ENCA_DOCU
	Autor : Diego Sanchez
	Fecha : 27/10/2005
	OT : 202325 - Boleta Electronica 
	Migrado desde oracle 03/05/2007 por hferrada
*/
ALTER PROCEDURE [dbo].[prc_libr_tota]
(@P_CODI_EMPR varchar(9),
					@P_CORR_LIBE varchar(12),
					@P_FOLI_NOTI varchar(10),
					@P_PERI_DESD varchar(10),
					@P_PERI_HAST varchar(10),
					@P_CODI_ERRO varchar(1) output,
					@P_MENS_ERRO varchar(200) output) as
begin
declare
	@v_codi_error 	varchar(80),
	@v_mens 	varchar(80)

	set @P_CODI_ERRO = 'N'
	set @P_MENS_ERRO = ''

	-- crea el detalle del libro para la caratula 
	print('crea el detalle del libro para la caratula')
	Insert into LBE_DETA_LIBR
		(CODI_EMPR, CORR_LIBE, TIPO_DOCU, FOLI_DOCU, FOLI_ANUL, TIPO_SERV, FECH_EMIS, FECH_VENC,
		PERI_DESD, PERI_HAST, CODI_SUCU, RUTT_RECE, DIGI_RECE, CODI_INTE, MONT_EXEN, MONT_TOTA,
		MONT_NOFA, TOTA_PERI, SALD_ANTE, VALO_PAGA, MONT_NETO, TASA_VAAG, FOLI_NOTI)
		(select codi_empr, @p_corr_libe, tipo_docu, foli_docu,' ', indi_serv, fech_emis,
			fech_venc, pedi_desd, peri_hast,codi_sucu, rutt_rece, digi_rece, codi_inte,
			mont_exen, mont_tota, mont_nofa, tota_peri, sald_ante, valo_paga,
			mont_neto, tasa_vaag, @p_foli_noti
		from 	bel_enca_docu A
		where 	codi_empr = @P_CODI_EMPR
		  AND	fech_emis between @P_PERI_DESD + '-01' AND @P_PERI_HAST + '-31'
		  AND	Not Exists (Select 1
					from Bel_foli_anul B
					where A.codi_empr=B.codi_empr and
					A.tipo_docu=B.tipo_docu and A.foli_docu=B.Foli_Anul))

	-- agrega los datos de anulados  al detalle del libro
	print('agrega los datos de anulados  al detalle del libro')
	Insert into LBE_DETA_LIBR
		(CODI_EMPR, CORR_LIBE, TIPO_DOCU, FOLI_DOCU, FOLI_ANUL, TIPO_SERV, FECH_EMIS, FECH_VENC,
		PERI_DESD, PERI_HAST, CODI_SUCU, RUTT_RECE, DIGI_RECE, CODI_INTE, MONT_EXEN, MONT_TOTA,
		MONT_NOFA, TOTA_PERI, SALD_ANTE, VALO_PAGA, MONT_NETO, TASA_VAAG, FOLI_NOTI)
		(select codi_empr, @p_corr_libe, tipo_docu, foli_anul,'A',0, ' ',
			' ', ' ', ' ',0, 0, ' ', ' ',0, 0,0, 0, 0, 0,0,0, @p_foli_noti
		from bel_foli_anul
		where codi_empr = @p_codi_empr
		  and fech_anul between @P_PERI_DESD + '-01' AND @P_PERI_HAST + '-31')

	-- RESUMEN PERIODO 
	print('RESUMEN PERIODO')
	Insert into LBE_RESU_PERI (codi_empr, corr_libe, tipo_docu, cant_anul)
		(Select codi_empr, corr_libe, tipo_docu, 0
		from 	LBE_DETA_LIBR
		where 	codi_empr = @P_CODI_EMPR
		  and	corr_libe = @P_CORR_LIBE
		Group by codi_empr, corr_libe, tipo_docu)

	-- actualiza los anulados 
	print('actualiza los anulados')
	Update LBE_RESU_PERI
	set cant_anul =
		(Select count(codi_empr)
		from 	LBE_DETA_LIBR b
		where 	foli_anul = 'A' and LBE_RESU_PERI.codi_empr = b.codi_empr
		  and 	LBE_RESU_PERI.corr_libe = b.corr_libe
		  and 	LBE_RESU_PERI.tipo_docu = b.tipo_docu)
	where codi_empr = @p_codi_empr and corr_libe = @P_CORR_LIBE

	-- Insertar en tabla LBE_PERI_TISE los serv<> 2 desde lbe_deta_libr
	Insert into LBE_PERI_TISE
		(CODI_EMPR, CORR_LIBE, TIPO_DOCU, INDI_SERV, PERI_DEVE, TOTA_DOCU, TOTA_EXEN,
		 TOTA_NETO, TASA_IVAA, MONT_IVAA, MONT_TOTA, MONT_NOFA, TOTA_PERI, SALD_ANTE,
		 VALO_PAGA)
		(Select codi_empr, corr_libe, tipo_docu,tipo_serv, ' ',
			count(codi_empr), sum(isnull(mont_exen,0)),
			/*VALOR NETO*/
			case tipo_docu 
			when 41 then 0
			else
			      case 
				sum(mont_neto) 
			      when 0 
			         then round((sum(mont_tota - mont_exen))
			         /(1+(max(tasa_vaag)/100)),0) 
			      else sum(mont_neto) 
			      end
			end,
			/*TASA IVA*/
			max(tasa_vaag),
			/*VALOR IVA*/
			case tipo_docu 
			when 41 then 0
			else
			    sum(mont_tota  - mont_exen) - 
			    case 
				sum(mont_neto) 
			    when 0 
				then round((sum(mont_tota - mont_exen))
				/(1+(max(tasa_vaag)/100)),0) 
			    else sum(mont_neto) 
			    end
			end, 
			sum(isnull(mont_tota,0)),
			sum(isnull(mont_nofa,0)), sum(isnull(tota_peri,0)),
			sum(isnull(sald_ante,0)), sum(isnull(valo_paga,0))
		from LBE_DETA_LIBR
		where codi_empr = @P_CODI_EMPR And corr_libe = @P_CORR_LIBE
		  and foli_anul <> 'A' and tipo_serv <> 2
		Group by codi_empr, corr_libe, tipo_docu,tipo_serv)

	-- Insertar en tabla LBE_PERI_TISE los serv=2 desde lbe_deta_libr agrupando tb por periodo devengo */
	Insert into LBE_PERI_TISE
		(CODI_EMPR, CORR_LIBE, TIPO_DOCU, INDI_SERV, PERI_DEVE, TOTA_DOCU, TOTA_EXEN,
		 TOTA_NETO, TASA_IVAA, MONT_IVAA, MONT_TOTA, MONT_NOFA, TOTA_PERI, SALD_ANTE,
		 VALO_PAGA)
		(Select codi_empr, corr_libe, tipo_docu,tipo_serv, SUBSTRING(fech_venc,1,7),
				count(codi_empr), sum(isnull(mont_exen,0)),
				case tipo_docu 
				when 41 then 0
				else
				  case 
					sum(mont_neto) 
				  when 0 
					 then round((sum(mont_tota - mont_exen))
					 /(1+(max(tasa_vaag)/100)),0) 
				  else sum(mont_neto) 
				  end
				end,
				/*TASA IVA*/
				max(tasa_vaag),
				/*VALOR IVA*/
				case tipo_docu 
				when 41 then 0
				else
				    sum(mont_tota  - mont_exen) - 
				    case 
					sum(mont_neto) 
				    when 0 
					then round((sum(mont_tota - mont_exen))
					/(1+(max(tasa_vaag)/100)),0) 
				    else sum(mont_neto) 
				    end
				end, 
				sum(isnull(mont_tota,0)),
				sum(isnull(mont_nofa,0)), sum(isnull(tota_peri,0)),
				sum(isnull(sald_ante,0)), sum(isnull(valo_paga,0))
		from LBE_DETA_LIBR
		where codi_empr = @P_CODI_EMPR And corr_libe = @P_CORR_LIBE
		  and foli_anul <> 'A' and tipo_serv = 2
		Group by codi_empr, corr_libe, tipo_docu, tipo_serv, SUBSTRING(fech_venc,1,7));
END
GO

GO
--SqlScripter----[dbo].[prc_list_dyn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_list_dyn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_list_dyn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_list_dyn]
(
	@tsSql varchar(8000), 
	@tnPagina as integer,	
	@tnRegPag as integer
)
AS
	declare @lsSql1 as varchar(8000)
	declare @lsPagina as varchar(15)
	declare @lsRegPag as varchar(15)
	declare @lsSQLVar1 as varchar(4000)
	declare @lsSQLVar2 as varchar(4000)
BEGIN
	set @lsPagina = convert(varchar(15), @tnPagina)
	set @lsRegPag = convert(varchar(15), @tnRegPag)

	set @lsSql1 = 	'SELECT top ' + @lsRegPag + '
						(SELECT MAX(REG) FROM (' + @tsSql + ') REG_TMP ) TOT_REG, 
						(SELECT CONVERT(INTEGER, MAX(REG/' + @lsRegPag + '))  FROM (' + @tsSql + ') REG_TMP) PAG_MAX, * 
					FROM (' + @tsSql + ') REPO 
					WHERE REPO.REG BETWEEN ' + str((@tnPagina -1 ) * @tnRegPag + 1) + ' 
									   AND ' + str(@tnPagina * @tnRegPag );
									   
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,CHAR(10)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(10)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(10)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(13)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(13)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(13)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(10),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(10),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(10),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(13),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(13),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(13),CHAR(9))
	
	EXEC(@lsSQL1)
END
GO

GO
--SqlScripter----[dbo].[prc_list_prod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_list_prod]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_list_prod] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_list_prod]
(
@P_CODI_LV VARCHAR(10),
@P_CANT VARCHAR(2),
@P_CODI_PAR1 VARCHAR(64),
@P_CODI_PAR2 VARCHAR(64),
@P_CODI_PAR3 VARCHAR(64),
@P_CODI_PAR4 VARCHAR(64),
@P_CODI_PAR5 VARCHAR(64),
@P_CODI_USUA VARCHAR(30),
@P_CODI_EMPR INT,
@P_CODI_EMEX VARCHAR(30))
AS
BEGIN
	IF(@P_CODI_LV = 'USUA1')
	BEGIN
		SELECT TOP(CONVERT(INT,@P_CANT)) CODI_USUA as CODIGO, NOMB_USUA as VALOR
		from usua_sist
		where codi_usua like '%'+@P_CODI_PAR1+'%';
	END
END
GO

GO
--SqlScripter----[dbo].[prc_list_repo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_list_repo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_list_repo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_list_repo]
(
	@tsNombreProcedimiento VARCHAR(8000),
	@tsTipo as Varchar(4),	@tnPagina as integer,	@tnRegPag as integer, @tsCondicion as Varchar(2048),
	@tsPar1 as Varchar(256), @tsPar2 as Varchar(256), @tsPar3 as Varchar(256), @tsPar4 as Varchar(256), 
	@tsPar5 as Varchar(256), @p_codi_usua varchar(30), @p_codi_empr int, @p_codi_emex varchar(30))
AS
declare @sql as varchar(8000)
declare @lsPagina as varchar(15)
declare @lsRegPag as varchar(15)
BEGIN
		set @lsPagina = convert(varchar(15), @tnPagina)
		set @lsRegPag = convert(varchar(15), @tnRegPag)  
		
		SET @sql = @tsNombreProcedimiento +  isnull(@tsCondicion,'')
		if (@p_codi_emex is not null)
			SET @sql = replace(@sql,':P_CODI_EMEX',@p_codi_emex)
		if (@p_codi_empr is not null)
			SET @sql = replace(@sql,':P_CODI_EMPR',@p_codi_empr)
		if (@p_codi_usua is not null)
			SET @sql = replace(@sql,':P_CODI_USUA',@p_codi_usua)
		if (@tsPar1 is not null)
			SET @sql = replace(@sql,':P_PAR1',@tsPar1)
		if (@tsPar2 is not null)
			SET @sql = replace(@sql,':P_PAR2',@tsPar2)
		if (@tsPar3 is not null)
			SET @sql = replace(@sql,':P_PAR3',@tsPar3)
		if (@tsPar4 is not null)
			SET @sql = replace(@sql,':P_PAR4',@tsPar4)
		if (@tsPar5 is not null)
			SET @sql = replace(@sql,':P_PAR5',@tsPar5)

		EXECUTE prc_list_dyn @sql, @tnPagina, @tnRegPag
END
GO

GO
--SqlScripter----[dbo].[prc_list_valo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[prc_list_valo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_list_valo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_list_valo]
(
@P_CODI_LV VARCHAR(10),
@P_CANT VARCHAR(2),
@P_CODI_PAR1 VARCHAR(64),
@P_CODI_PAR2 VARCHAR(64),
@P_CODI_PAR3 VARCHAR(64),
@P_CODI_PAR4 VARCHAR(64),
@P_CODI_PAR5 VARCHAR(64),
@P_CODI_USUA VARCHAR(30),
@P_CODI_EMPR INT,
@P_CODI_EMEX VARCHAR(30))
AS
BEGIN
--SP1 SE 5.2
	IF(@P_CODI_LV = 'PERS')
		BEGIN
			IF(@P_CODI_PAR1 != '*')
			BEGIN
				SELECT TOP(CONVERT(INT,@P_CANT)) CODI_PERS as CODIGO, NOMB_PERS as VALOR
				FROM PERSONAS
				WHERE NOMB_PERS LIKE '%' + @P_CODI_PAR1 + '%';
			END
			ELSE
			BEGIN
				SELECT CODI_PERS as CODIGO, NOMB_PERS as VALOR
				FROM PERSONAS
			END
		END
	ELSE IF(@P_CODI_LV = 'USUA')
		BEGIN
		SELECT TOP(CONVERT(INT,@P_CANT)) CODI_USUA as CODIGO, NOMB_USUA as VALOR
			FROM USUA_SIST
			WHERE 1 = 1
			AND NOMB_USUA LIKE '%' + @P_CODI_PAR1 +  '%';
		END
	ELSE IF(@P_CODI_LV = 'EMPR')
		BEGIN
			SELECT TOP(CONVERT(INT,@P_CANT)) CODI_EMPR as CODIGO, NOMB_EMPR as VALOR
			FROM EMPR
			WHERE NOMB_EMPR LIKE '%' + @P_CODI_PAR1 +  '%';
		END
	ELSE IF(@P_CODI_LV = 'CATEGORIA')
		BEGIN
			SELECT TOP(CONVERT(INT,@P_CANT)) cate_list as CODIGO, cate_list as VALOR
			FROM dbn_list_repo
			WHERE cate_list LIKE '%' + @P_CODI_PAR1 +  '%' OR DESC_REPO LIKE '%'+@P_CODI_PAR1+'%';
		END
	ELSE IF(@P_CODI_LV = 'NOMBLIST')
		BEGIN
			SELECT TOP(CONVERT(INT,@P_CANT)) CODI_REPO as CODIGO, DESC_REPO as VALOR
			FROM dbn_list_repo
			WHERE DESC_REPO LIKE '%' + @P_CODI_PAR1 +  '%';
		END
	ELSE IF(@P_CODI_LV = 'ARCHIVO')
		BEGIN
          SELECT TOP(CONVERT(INT,@P_CANT)) a.nomb_arch as codigo,a.nomb_arch as valor
          from   dbq_arch a
          where  a.esta_arch='ERR'
          and    a.nomb_arch LIKE '%' + @P_CODI_PAR1 +  '%';
		END
	ELSE
		BEGIN
			EXECUTE prc_list_prod @P_CODI_LV, @P_CANT, @P_CODI_PAR1, @P_CODI_PAR2, @P_CODI_PAR3, @P_CODI_PAR4, @P_CODI_PAR5, @P_CODI_USUA, @P_CODI_EMPR, @P_CODI_EMEX
		END
END
GO

GO
--SqlScripter----[dbo].[prc_mant_list_read].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_mant_list_read]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_mant_list_read] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_mant_list_read]
(
	@tsTipo as Varchar(4),	
	@tnPagina as integer,	
	@tnRegPag as integer, 
	@tsCondicion as Varchar(128),
	@tsPar1 as Varchar(30), @tsPar2 as Varchar(30), 
	@tsPar3 as Varchar(30), @tsPar4 as Varchar(30), @tsPar5 as Varchar(30),
	@p_codi_usua varchar(30), @p_codi_empr int, @p_codi_emex varchar(30))
AS 
	/*
	 Procedimiento para rescatar datos de la tabla SYS_PARAM 
	 con los Parametros
		@tsTipo 
			S: Query utilizada para el mantenedor
			L: Query utilizada para el listador
			LV: Query utilizada para las listas de valor
		@tnPagina	: Numero de pagina a rescatar
		@tnRegPag	: Numero de registros por pagina
		@tsCondicion : Condicion, clausula Where
		@tsPar1		: Parametro 1 - PARAM_NAME
		@tsPar2		: Parametro 2
		@tsPar3		: Parametro 3
		@tsPar4		: Parametro 4
		@tsPar5		: Parametro 5
	 */
	declare @sql_dyn as integer
	declare @sql as nvarchar(2048)
BEGIN
	IF (@tsTipo = 'L')
	BEGIN
		SET @sql = 	'	SELECT	ROW_NUMBER() OVER(ORDER BY CODI_REPO ASC) AS REG, 
						LR.CODI_REPO		,LR.TITU_REPO		,LR.CODI_MODU		,LR.SCRP_SQLS,
						LR.DESC_REPO		,LR.CODI_RESX		,LR.PROC_REPO		,LR.SCRP_SQLO,
						LR.FILT_CKBB		,LR.PAGE_REPO		,LR.MODO			,syc.code_desc as CATE_LIST
						FROM DBN_LIST_REPO LR left join sys_code syc on LR.cate_list = syc.code
						WHERE 1 = 1 '

		SET @sql = @sql + isnull(@tsCondicion,'')

		EXECUTE prc_list_dyn @sql, @tnPagina, @tnRegPag 
	END
END
GO

GO
--SqlScripter----[dbo].[PRC_PUT_MESSAGE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_PUT_MESSAGE]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_PUT_MESSAGE] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_PUT_MESSAGE]
@pi_codi_appl	VARCHAR(40),
       @pi_rutt_empr	NUMERIC(8),
       @pi_digi_empr 	VARCHAR(1),
       @pi_name_msge	VARCHAR(20),
       @pi_name_addr	VARCHAR(20),
       @pi_curl_para	VARCHAR(2000),
       @pi_codi_erro    NUMERIC(5)   output,
       @pi_mens_erro    VARCHAR(80)  output,
       @pi_corr_qmsg    NUMERIC(22)  output

AS
   DECLARE
       @last_error      varchar(2);

   DECLARE
       @table_corr_qmsg table (new_corr_qmsg   numeric(22));

BEGIN
   set @last_error = 'N0'
   set @pi_corr_qmsg = null
   set @pi_codi_erro = 0
   set @pi_mens_erro = 'Procesado OK'

   BEGIN TRY
      if @pi_codi_appl != 'SUITE5' 
      begin
         set @pi_mens_erro = 'Id de Aplicacion Invalido'
         set @pi_codi_erro = -1
      end;

      if @pi_name_msge != 'MSG_INGREC' and
         @pi_name_msge != 'MSG_QRYCED' and
         @pi_name_msge != 'MSG_LISEVE' and
         @pi_name_msge != 'MSG_FCHRCP' and
         @pi_codi_erro  = 0
      begin
         set @pi_mens_erro = 'Tipo de Mensaje Invalido'
         set @pi_codi_erro = -1
      end;

      if @pi_name_addr != 'AD_INGREC' and
         @pi_name_addr != 'AD_QRYCED' and
         @pi_name_addr != 'AD_LISEVE' and
         @pi_name_addr != 'AD_FCHRCP' and
         @pi_codi_erro  = 0
      begin
         set @pi_mens_erro = 'Direccion de Mensaje Invalida'
         set @pi_codi_erro = -1
      end;
 
      if @pi_codi_erro = 0
      begin

         begin transaction;

         insert into dtec_queue_msge (name_msge, name_addr, rutt_empr, digi_empr, 
                appl_name, curl_para, esta_qmsg, tmst_regi, tmst_proc )
         output inserted.corr_qmsg
         into   @table_corr_qmsg
         values (@pi_name_msge, @pi_name_addr, @pi_rutt_empr, @pi_digi_empr, 
                 @pi_codi_appl, @pi_curl_para, 'ING', getdate(), getdate());
 

         commit transaction;
 
         select @pi_corr_qmsg = new_corr_qmsg
         from   @table_corr_qmsg;

         set @pi_codi_erro = 0
      end;

   END TRY
   BEGIN CATCH
      set @pi_codi_erro = -1
      set @pi_mens_erro = 'Error al agregar mensaje : ' + error_message();

      rollback transaction; 

      print @pi_mens_erro;
   END CATCH

END
GO

GO
--SqlScripter----[dbo].[PRC_PUT_PDF_DTO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_PUT_PDF_DTO]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_PUT_PDF_DTO] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_PUT_PDF_DTO]
@CODI_EMPR NUMERIC(9),
								@CORR_DOCU NUMERIC(22),
								@CODI_EMEX VARCHAR(30),
								@CODI_GRPO NUMERIC(20),
								@RUTT_EMIS NUMERIC(9) ,
								@CODI_ERRO VARCHAR(3) OUTPUT,
								@MENS_ERRO VARCHAR(500) OUTPUT AS
DECLARE 
@paramval int,
@cantpdf int,
@rowcountt int

BEGIN
	SET @CODI_ERRO = 'N'
	SET @MENS_ERRO = 'Proceso Insercion de PDF'
	SET @paramval = 0
	SET @cantpdf = 0

	SELECT @paramval = param_value
	FROM sys_param
	WHERE param_name = 'EGATE_PDFDTO'

	set @rowcountt = @@ROWCOUNT

	IF @rowcountt > 0 AND @paramval=1
	BEGIN
		SELECT @cantpdf=COUNT(1) 
		FROM DBQ_ARCH
		WHERE CODI_GRPO = @CODI_GRPO
		AND NOMB_ARCH LIKE '%.pdf'
		
		set @rowcountt = @@ROWCOUNT		
	
		IF @rowcountt > 0 AND @cantpdf=1			
		BEGIN
			INSERT INTO DTO_DOCU_LOB (codi_emex, codi_empr,corr_docu, tipo_arch, clob_docu)
				SELECT @CODI_EMEX, @CODI_EMPR, @CORR_DOCU, 'PDF', B.CLOB_ARCH
				FROM DBQ_ARCH AS A,	DBQ_ARCH_CLOB AS B
				WHERE A.CODI_ARCH = B.CODI_ARCH
				AND A.CODI_GRPO = @CODI_GRPO
				AND A.NOMB_ARCH LIKE '%.pdf'		 
		END
		ELSE IF @cantpdf>1			
		BEGIN
			INSERT INTO DTO_DOCU_LOB (codi_emex, codi_empr,corr_docu, tipo_arch, clob_docu)
				SELECT @CODI_EMEX, @CODI_EMPR, @CORR_DOCU, 'PDF', B.CLOB_ARCH
				FROM DBQ_ARCH AS A,	DBQ_ARCH_CLOB AS B
				WHERE A.CODI_ARCH = B.CODI_ARCH
				AND A.CODI_GRPO = @CODI_GRPO
				AND A.NOMB_ARCH LIKE '%'+LTRIM(RTRIM(STR(@RUTT_EMIS)))+'%33%'+LTRIM(RTRIM(STR(@CORR_DOCU)))+'.pdf'	 
		END

		IF (@@ERROR =  0)
		BEGIN
			SET @CODI_ERRO = 'S'
			SET @MENS_ERRO = 'Error '+ convert(varchar(2000), @@ERROR)
		END		
	END
END
GO

GO
--SqlScripter----[dbo].[prc_read_esta_proc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[prc_read_esta_proc]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_read_esta_proc] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_read_esta_proc]
(
	@tnPagina as integer,	
	@tnRegPag as integer,
	@tsCondicion as Varchar(128)
	)
AS 
	
	declare @sql_dyn as integer
	declare @sql as nvarchar(2048)
	
BEGIN
		
		BEGIN
			SET @sql ='SELECT ROW_NUMBER() OVER(ORDER BY a.codi_emex ASC) AS REG, 
				   a.codi_empr Empresa, a.codi_emex Emex, a.codi_dopr Codi_Dopr, a.codi_serv Servicio, a.tipo_docu Tipo, a.foli_docu Folio, a.tabl_orig Tab_Origen, a.ulti_erro Error
				   from qse_docu_serv a where 1 = 1 and a.esta_proc=''ERN'' '

			
			SET @sql = @sql + @tsCondicion

			EXECUTE dbo.prc_list_dyn @sql, @tnPagina, @tnRegPag 
		END
	
END
GO

GO
--SqlScripter----[dbo].[prc_read_esta_proc_esp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[prc_read_esta_proc_esp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_read_esta_proc_esp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_read_esta_proc_esp]
(
	@tnPagina as integer,	
	@tnRegPag as integer,
	@tsCondicion as Varchar(128)
	)
AS 
	
	declare @sql_dyn as integer
	declare @sql as nvarchar(2048)
	
BEGIN
		
		BEGIN
			SET @sql ='SELECT ROW_NUMBER() OVER(ORDER BY a.codi_emex ASC) AS REG, 
				   a.codi_empr Empresa, a.codi_emex Emex, a.codi_dopr Codi_Dopr, a.codi_serv Servicio, a.tipo_docu Tipo, a.foli_docu Folio, a.tabl_orig Tab_Origen, a.ulti_erro Error
				   from qse_docu_serv a where 1 = 1 and a.esta_proc=''ESP'' '

			
			SET @sql = @sql + @tsCondicion

			EXECUTE dbo.prc_list_dyn @sql, @tnPagina, @tnRegPag 
		END
	
END
GO

GO
--SqlScripter----[dbo].[prc_read_esta_proc_esp_filt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[prc_read_esta_proc_esp_filt]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_read_esta_proc_esp_filt] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_read_esta_proc_esp_filt]
(
	@tnPagina as integer,	
	@tnRegPag as integer,
	@tsCondicion as Varchar(128)
	)
AS 
	
	declare @sql_dyn as integer
	declare @sql as nvarchar(2048)
	
BEGIN
		
		BEGIN
			 
						 
			SET @sql = 	'SELECT	ROW_NUMBER() OVER(ORDER BY a.codi_emex ASC) AS REG, 
						a.codi_empr Empresa, a.codi_emex Emex, a.codi_dopr Codi_Dopr, a.codi_serv Servicio, a.tipo_docu Tipo, a.foli_docu Folio, a.tabl_orig Tab_Origen, a.ulti_erro Error			
						From QSE_DOCU_SERV a INNER JOIN dte_enca_docu b ON a.esta_proc = ''ESP''
						and a.codi_serv = ''dte_envi_clie''
						and b.codi_emex=a.codi_emex
						and b.codi_empr=a.codi_empr
						and b.tipo_docu=a.tipo_docu
						and b.foli_docu=a.foli_docu
						and exists (select c.cont_rutt from pers_publ c where c.cont_rutt = b.rutt_rece) '

			
			SET @sql = @sql + @tsCondicion

			EXECUTE dbo.prc_list_dyn @sql, @tnPagina, @tnRegPag 
		END
	
END
GO

GO
--SqlScripter----[dbo].[PRC_RECE_LOB_DTO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_RECE_LOB_DTO]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_RECE_LOB_DTO] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_RECE_LOB_DTO]
@CODI_EMPR NUMERIC(9),
									@CORR_RECE NUMERIC(22),
									@TIPO_ARCH CHAR(12),
									@CLOB_DOCU TEXT,
									@CODI_EMEX CHAR(30),
									@CODI_ERRO VARCHAR(3) OUTPUT,
									@MENS_ERRO VARCHAR(500) OUTPUT AS

DECLARE 
@ptrval binary(16),
@largoinicial int


BEGIN

	SET @CODI_ERRO = 'N'
	SET @MENS_ERRO = 'Proceso insercion de xml de recepción : OK'

	SELECT @largoinicial=isnull(datalength(CLOB_DOCU),0) 
	FROM dto_rece_lob  with(nolock)
	WHERE CODI_EMPR =@CODI_EMPR
	AND CORR_RECE = @CORR_RECE
	AND TIPO_ARCH=@TIPO_ARCH
	
	IF @@ROWCOUNT = 0 --Si no existe el registro en la dte_docu_lob lo crea
		SET @largoinicial=0

			IF @largoinicial=0
				BEGIN
					INSERT INTO dto_rece_lob(CODI_EMPR,CORR_RECE, TIPO_ARCH, CLOB_DOCU,CODI_EMEX) 
					VALUES (@CODI_EMPR, @CORR_RECE, @TIPO_ARCH, @CLOB_DOCU,@CODI_EMEX)				 
				END
			ELSE
			BEGIN
				SELECT @ptrval = TEXTPTR(CLOB_DOCU)
				FROM dto_rece_lob
				WHERE CODI_EMPR = @CODI_EMPR 
				AND CORR_RECE = @CORR_RECE
				AND TIPO_ARCH = @TIPO_ARCH 
				
				IF (convert(varchar(5),substring(@ptrval,0,4)) != '')
				BEGIN
					UPDATETEXT dto_rece_lob.CLOB_DOCU @ptrval null 0 @CLOB_DOCU
				END
			END
		IF (@@ERROR =  0)
		BEGIN
	  		SET @CODI_ERRO = 'S'
			SET @MENS_ERRO = 'Error '+ convert(varchar(2000), @@ERROR)
		END
		
END
GO

GO
--SqlScripter----[dbo].[prc_recl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[prc_recl]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_recl] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_recl]
@codi_emex    varchar(40),
  @rutt_empr    numeric(10), /*rutt_rece dto_eca_docu_p/dte_enca_docu*/
  @digi_empr    varchar(1),  /*digi_rece dto_eca_docu_p/dte_enca_docu*/
  @rutt_emis    numeric(10), /*rutt_emis dto_eca_docu_p/dte_enca_docu*/
  @digi_emis    varchar(1),  /*digi_emis dto_eca_docu_p/dte_enca_docu*/
  @tipo_docu    numeric(4),
  @foli_docu    numeric(10),
  @even_sii     varchar(4),
  @codi_empr	numeric(9, 0),
  @corr_docu	numeric(18, 0),
  @pi_codi_erro	numeric(4) output,
  @pi_mens_erro	varchar(80) output,
  @pi_corr_qmsg	numeric(20) output
as
    set nocount on;
    
    Declare @esta_evnt    varchar(4)
    Declare @id_auto_incremento varchar(4)
    DECLARE @codi_appl	varchar(10)
    DECLARE @name_msge	varchar(20)
    DECLARE @name_addr	varchar(20)
    DECLARE @curl_para	varchar(2000)
	
	SET @esta_evnt = 'ING'
	
	set @id_auto_incremento = (select COUNT(*)+1 from dte_proc_evnt)
		
	SET @codi_appl = 'SUITE5' -- valor por defecto 'SUITE5'

	SET @name_msge = (SELECT CAST( CASE 
									WHEN @even_sii IN ('ACD','ERM','RCD','RFP','RFT')
									THEN 'MSG_INGREC'
									WHEN @even_sii IN ('CCD') 
									THEN 'MSG_QRYCED'
									WHEN @even_sii IN ('CED')					
									THEN 'MSG_LISEVE'
									ELSE 'MSG_FCHRCP' /* 'FRS' */
									END AS varchar))
									
	SET @name_addr = (SELECT CAST( CASE 
									WHEN @even_sii IN ('ACD','ERM','RCD','RFP','RFT')
									THEN 'AD_INGREC'
									WHEN @even_sii IN ('CCD') 
									THEN 'AD_QRYCED'
									WHEN @even_sii IN ('CED')					
									THEN 'AD_LISEVE'
									ELSE 'AD_FCHRCP' /* 'FRS' */
									END AS varchar))
									
	SET @curl_para	= '{ "RUT_EMIS" : "' + (select convert(varchar(10),@rutt_emis)) 
					+ '", "DV_EMIS" : "' + @digi_emis 
					+ '", "TIPO_DOC" : "' + (select convert(varchar(4),@tipo_docu))
					+ '", "FOLIO" : "' + (select convert(varchar(10),@foli_docu))
					+ '", "ACCION" : "' + @even_sii
					+ '" }';
	
	if @even_sii IN ('CED', 'CCD')
	begin
		Execute  dbo.prc_put_message  @codi_appl, @rutt_emis, @digi_emis, @name_msge, @name_addr, @curl_para, @pi_codi_erro output, @pi_mens_erro output, @pi_corr_qmsg output
	end
	else
	begin
		Execute  dbo.prc_put_message  @codi_appl, @rutt_empr, @digi_empr, @name_msge, @name_addr, @curl_para, @pi_codi_erro output, @pi_mens_erro output, @pi_corr_qmsg output		
	end

	INSERT INTO dte_proc_evnt (corr_evnt, esta_evnt, fech_evnt, codi_emex, codi_empr, corr_docu, rutt_rece, digi_rece, rutt_emis, digi_emis, tipo_docu, foli_docu, evnt_sii, curl_para)
	VALUES (@pi_corr_qmsg, @esta_evnt, GETDATE(), @codi_emex, @codi_empr, @corr_docu, @rutt_empr, @digi_empr, @rutt_emis, @digi_emis, @tipo_docu, @foli_docu, @even_sii, @curl_para)
GO

GO
--SqlScripter----[dbo].[PRC_REP_DTO_SII].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_REP_DTO_SII]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_REP_DTO_SII] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_REP_DTO_SII]
(
    @p_nume_proc    INT,
    @p_rutt_rece    VARCHAR(30), 
    @p_digi_rece    VARCHAR(10),
    @p_rutt_emis    VARCHAR(27),
    @p_digi_emis    VARCHAR(30),
    @p_rece_desd    VARCHAR(10),
    @p_rece_hast    VARCHAR(10),
    @p_foli_desd    VARCHAR(30),
    @p_foli_hast    VARCHAR(30),
    @p_tipo_docu    INT,
    @p_esta_docu1   VARCHAR(4),
    @p_emis_desd    VARCHAR(30),
    @p_emis_hast    VARCHAR(30)    
)

AS
BEGIN
	DECLARE
	@p_rutt_rece1    VARCHAR(30),
	@p_tipo_docu1    NUMERIC,
	@p_tipo_docu2    NUMERIC,
	@p_foli_desd1    numeric,
	@p_foli_hast2    numeric,
	@d_rece_desd    datetime,
	@d_rece_hast    datetime,
	@p_emis_desd1    VARCHAR(30),
	@p_emis_hast2    VARCHAR(30),
	@p_total         VARCHAR(30),
	@p_rutt_emis1    VARCHAR(27),
	@p_rutt_emis2    VARCHAR(27),
	@p_rece_desd1    varchar(10),
	@p_rece_hast2    varchar(10),
	@p_codi_empr	numeric,
	@v_codi_empr	numeric,
	@v_rutt_emis 	varchar(10)
	
	set @v_codi_empr = convert(numeric,@p_rutt_rece)
	DELETE FROM temp_rep_dto_sii WHERE nume_proc = @p_nume_proc;  --fech_proc <= sysdate -1 AND 
	DELETE FROM temp_rep_dto_sii WHERE fech_proc < CONVERT(VARCHAR, GETDATE()); -- mantiene limpia la tabla borrando los registros anteriores al dia actual

	-- SETEA VALORES DEL FOLIO SI VIENEN EN CERO O VACIO Y LOS DEJA EN UN VALOR ESTANDAR O BIEN CONSERVA EL VALOR ORIGINAL
	IF (@p_foli_desd = '0') OR (@p_foli_desd = '') OR (@p_foli_desd is null)
		BEGIN
			SET @p_foli_desd1 = 1
		END
	ELSE
		BEGIN
			SET @p_foli_desd1 = convert(numeric,@p_foli_desd)
		END

	IF (@p_foli_hast = '0') OR (@p_foli_hast = '') OR (@p_foli_hast is null) 
		BEGIN
			SET @p_foli_hast2 = 999999999999999999
		END
	ELSE
		BEGIN
			SET @p_foli_hast2 = convert(numeric,@p_foli_hast)
		END

	-- SETEA FECHA DE RECEPCION SI VIENEN EN CERO O VACIO Y LOS DEJA EN UN VALOR ESTANDAR O BIEN CONSERVA EL VALOR ORIGINAL
	IF (@p_rece_desd = '0') or (@p_rece_desd = '')or (@p_rece_desd is null)
		BEGIN
			set @d_rece_desd = convert(datetime,'1900-01-01',120)
			set @p_rece_desd1 = '1900-01-01'
		END
	ELSE
		BEGIN
			set @d_rece_desd = convert(datetime,@p_rece_desd,120)
			set @p_rece_desd1 = @p_rece_desd
		END

	IF (@p_rece_hast = '0')  or (@p_rece_hast = '') or (@p_rece_hast is null) 
		BEGIN
			set @d_rece_hast = convert(datetime,'2200-01-01',120)
			set @p_rece_hast2 = '2200-01-01'
		END
	ELSE
		BEGIN
			set @d_rece_hast =  convert(datetime,@p_rece_hast,120)
			set @p_rece_hast2 = @p_rece_hast
		END

	-- SETEA FECHA DE EMISION SI VIENEN EN CERO O VACIO	Y LOS DEJA EN UN VALOR ESTANDAR O BIEN CONSERVA EL VALOR ORIGINAL
	IF(@p_emis_desd = '0') or (@p_emis_desd = '') or (@p_emis_desd is null)
		BEGIN
			SET @p_emis_desd1 = '1900-01-01'
		END
	ELSE
		BEGIN
			SET @p_emis_desd1=@p_emis_desd
		END

	IF (@p_emis_hast = '0') or  (@p_emis_hast = '')or (@p_emis_hast is null)
		BEGIN
			SET @p_emis_hast2 = '2200-01-01'
		END
	ELSE
		BEGIN
			SET @p_emis_hast2=@p_emis_hast
		END

	-- SETEA LOS TIPOS DE DOCUMENTOS SI VIENEN EN CERO O VACIO Y LOS DEJA EN UN VALOR ESTANDAR O BIEN CONSERVA EL VALOR ORIGINAL
	IF (@p_tipo_docu = 0) OR (@p_tipo_docu = '') OR (@p_tipo_docu is null)
		BEGIN 
			SET @p_tipo_docu1 = 1
			SET @p_tipo_docu2 = 999
		END
	ELSE
		BEGIN
			SET  @p_tipo_docu1 = @p_tipo_docu
			SET  @p_tipo_docu2 = @p_tipo_docu
		END

	-- SETEA RUT DEL EMISOR SI VIENE VACIO O VIENE CON CODIGO DE EMPRESA, LA BUSCA Y LA ASIGNA
	IF (@p_rutt_emis = 0) or (@p_rutt_emis = '') or (@p_rutt_emis is null)
		BEGIN
			SET @p_rutt_emis1 = '1'
			SET @p_rutt_emis2 = '9999999999'
		END
	ELSE
		BEGIN
			SELECT @v_rutt_emis =  ISNULL(rutt_pers,0) FROM personas WHERE codi_pers = @p_rutt_emis
			set @p_rutt_emis1 = @v_rutt_emis
			set @p_rutt_emis2 = @v_rutt_emis
		END

	print('*****************************');
	print('Variables del procedimiento');
	print(' p_nume_proc '+ convert(varchar,@p_nume_proc));
	print(' p_foli_desd1 '+ convert(varchar,@p_foli_desd1));
	print(' p_foli_hast2 '+ convert(varchar,@p_foli_hast2));
	print(' d_rece_desd '+ convert(varchar,@d_rece_desd,120));
	print(' d_rece_hast '+ convert(varchar,@d_rece_hast,120));
	print(' p_emis_desd1 '+ @p_emis_desd1);
	print(' p_emis_hast2 '+ @p_emis_hast2);
	print(' p_tipo_docu1 '+ convert(varchar,@p_tipo_docu1));
	print(' p_tipo_docu2 '+ convert(varchar,@p_tipo_docu2));
	print(' p_rutt_emis1 '+ convert(varchar,@p_rutt_emis1));
	print(' p_rutt_emis2 '+ convert(varchar,@p_rutt_emis2));
	print('*****************************');
			    
	-- DOCUMENTOS QUE ESTAN EN LA SUITE, PERO NO EN EL LISTADO DEL SII
	IF  (@p_esta_docu1 = 'NSII')  
	BEGIN		
		IF (@v_codi_empr <> '0') 
		BEGIN
 			SELECT @p_rutt_rece1 = ISNULL(rutt_empr,0), @p_codi_empr = isnull(codi_empr,0)  FROM empr WHERE codi_empr = @v_codi_empr -- BUSCA EN LA TABLA SI ESTÃ EL RUT DE LA EMPRESA DE ACUERDO AL CODIGO INGRESADO POR EL WEB
				
			print(' @p_rutt_rece1 '+ convert(varchar,@p_rutt_rece1));
			print(' @p_codi_empr '+ convert(varchar,@p_codi_empr));
			
			INSERT INTO temp_rep_dto_sii (nume_proc, fech_proc, rutt_rece, rutt_emis, razo_emis, tipo_docu, foli_docu, fech_emis, mont_tota_se, ESTA_DOCU,esta_docu1)
			(SELECT DISTINCT @p_nume_proc,(CONVERT(VARCHAR(10), GETDATE(), 120)),  p.rutt_rece +'-'+  p.digi_rece, p.rutt_emis +'-'+ p.digi_emis, p.nomb_emis, t.tipo_docu, convert(numeric,p.foli_docu), p.fech_emis, p.mont_tota,p.ESTA_DOCU,@p_esta_docu1
			FROM dto_enca_docu_p p   INNER JOIN dte_tipo_docu t ON t.tipo_docu = p.TIPO_DOCU
			WHERE p.codi_empr = @p_codi_empr
			AND p.tipo_docu BETWEEN @p_tipo_docu1 AND @p_tipo_docu2
			AND p.tipo_docu != 52
			AND p.foli_nume BETWEEN @p_foli_desd1 AND @p_foli_hast2
			AND p.rutt_emis BETWEEN @p_rutt_emis1 AND @p_rutt_emis2
			AND p.rutt_rece = @p_rutt_rece1
			AND p.fech_emis BETWEEN @p_emis_desd1 AND @p_emis_hast2
			AND p.fech_carg BETWEEN @d_rece_desd AND @d_rece_hast
			AND p.esta_docu IN ('INI',  'ERA')
			AND NOT EXISTS (SELECT 1 FROM rep_dto_sii r
							WHERE r.tipo_docu = p.tipo_docu
							AND r.foli_docu = p.foli_nume
							AND r.rutt_emis = p.rutt_emis
							and r.rutt_rece =  p.rutt_rece))
		END
		ELSE
		BEGIN
			INSERT INTO temp_rep_dto_sii (nume_proc, fech_proc, rutt_rece, rutt_emis, razo_emis, tipo_docu, foli_docu, fech_emis, mont_tota_se, esta_docu, esta_docu1)
			(SELECT DISTINCT @p_nume_proc,(CONVERT(VARCHAR(10), GETDATE(), 120)),  p.rutt_rece +'-'+  p.digi_rece, p.rutt_emis +'-'+ p.digi_emis, p.nomb_emis, t.tipo_docu, convert(numeric,p.foli_docu), p.fech_emis, p.mont_tota,p.ESTA_DOCU,@p_esta_docu1
			FROM dto_enca_docu_p p   INNER JOIN dte_tipo_docu t ON p.tipo_docu = t.TIPO_DOCU
			WHERE p.tipo_docu BETWEEN @p_tipo_docu1 AND @p_tipo_docu2
			AND p.foli_nume BETWEEN @p_foli_desd1 AND @p_foli_hast2
			AND p.rutt_emis BETWEEN @p_rutt_emis1 AND @p_rutt_emis2
			AND p.fech_emis between @p_emis_desd1 AND @p_emis_hast2
			AND p.fech_carg BETWEEN @d_rece_desd AND @d_rece_hast
			AND p.esta_docu IN ('INI',  'ERA')
			AND p.tipo_docu != 52
			AND NOT EXISTS (SELECT 1 FROM rep_dto_sii r
							WHERE r.tipo_docu = p.tipo_docu
							AND r.foli_docu = p.foli_nume
							AND r.rutt_emis = p.rutt_emis
							and r.rutt_rece =  p.rutt_rece))
 		END
	END
	     
-- DOCUMENTOS QUE ESTÃN EN EL SII, PERO NO EN LA SUITE
	IF @p_esta_docu1 = 'NORE'        
	BEGIN
		IF (@v_codi_empr != '0')           
		BEGIN	
 			SELECT @p_rutt_rece1 = ISNULL(rutt_empr,0), @p_codi_empr = codi_empr  FROM empr WHERE codi_empr = @v_codi_empr
                  
			INSERT INTO temp_rep_dto_sii (nume_proc, fech_proc, rutt_rece, rutt_emis, razo_emis, tipo_docu, foli_docu, fech_emis, fech_rece, mont_tota_sii, esta_docu1)
			(SELECT DISTINCT @p_nume_proc, CONVERT(VARCHAR(10), GETDATE(), 120), r.rutt_rece +'-'+  r.digi_rece, r.rutt_emis +'-'+ r.digi_emis, r.razo_emis, t.tipo_docu, r.foli_docu, r.fech_emis, substring(r.fech_rece,0,11) fech_rece, r.mont_tota, @p_esta_docu1
			 FROM  rep_dto_sii r  INNER JOIN dte_tipo_docu t ON t.TIPO_DOCU = r.TIPO_DOCU
			 WHERE r.rutt_rece = @p_rutt_rece1
			AND r.rutt_emis BETWEEN @p_rutt_emis1 AND @p_rutt_emis2
			AND r.fech_rece BETWEEN @p_rece_desd1 AND @p_rece_hast2
			AND r.fech_emis BETWEEN @p_emis_desd1 AND @p_emis_hast2
			AND r.tipo_docu BETWEEN @p_tipo_docu1 AND @p_tipo_docu2
			AND r.TIPO_DOCU != 52
			AND r.foli_docu BETWEEN @p_foli_desd1 AND @p_foli_hast2
			AND NOT EXISTS (SELECT 1 FROM dto_enca_docu_p p   
							WHERE p.codi_empr = @p_codi_empr
							AND p.tipo_docu = r.tipo_docu
							AND p.foli_nume = r.foli_docu
							AND p.esta_docu IN ('INI',  'ERA')
							AND p.rutt_rece =  r.rutt_rece
							AND p.rutt_emis = r.rutt_emis))
		END
		ELSE
		BEGIN
    		INSERT INTO temp_rep_dto_sii (nume_proc, fech_proc, rutt_rece, rutt_emis, razo_emis, tipo_docu, foli_docu, fech_emis, fech_rece, mont_tota_sii, esta_docu1)
			(SELECT DISTINCT @p_nume_proc, CONVERT(VARCHAR(10), GETDATE(), 120), r.rutt_rece +'-'+  r.digi_rece, r.rutt_emis +'-'+ r.digi_emis, r.razo_emis, t.tipo_docu, r.foli_docu, r.fech_emis, substring(r.fech_rece,0,11) fech_rece, r.mont_tota, @p_esta_docu1
			 FROM  rep_dto_sii r INNER JOIN dte_tipo_docu t ON t.TIPO_DOCU = r.TIPO_DOCU
			 WHERE r.rutt_emis BETWEEN @p_rutt_emis1 AND @p_rutt_emis2
			AND r.fech_rece BETWEEN @p_rece_desd1 AND @p_rece_hast2
			AND r.fech_emis BETWEEN @p_emis_desd1 AND @p_emis_hast2
			AND r.tipo_docu BETWEEN @p_tipo_docu1 AND @p_tipo_docu2
			AND r.TIPO_DOCU != 52
			AND r.foli_docu BETWEEN @p_foli_desd1 AND @p_foli_hast2
			AND NOT EXISTS (SELECT 1 FROM dto_enca_docu_p p   
							WHERE p.tipo_docu = r.tipo_docu
							AND p.foli_nume = r.foli_docu
							AND p.esta_docu IN ('INI',  'ERA')
							AND p.rutt_rece =  r.rutt_rece
							AND p.rutt_emis = r.rutt_emis))
		END
	END
	      
-- DOCUMENTOS QUE ESTÃN EN LA SUITE Y EN EL SII, PERO CON DIFERENCIA DE MONTOS TOTALES	     
	IF @p_esta_docu1 = 'DIF'    
	BEGIN
		IF (@v_codi_empr != '0') 
		BEGIN
 			SELECT @p_rutt_rece1 = ISNULL(rutt_empr,0), @p_codi_empr = codi_empr  FROM empr WHERE codi_empr = @v_codi_empr
			
			INSERT INTO temp_rep_dto_sii (nume_proc, fech_proc, rutt_rece, tipo_docu, foli_docu, rutt_emis, razo_emis, fech_emis, fech_rece, mont_neto, impu_vaag, mont_tota_se, mont_tota_sii, esta_docu, esta_docu1)
			(SELECT DISTINCT @p_nume_proc, CONVERT(VARCHAR(10), GETDATE(), 120), r.rutt_rece, t.tipo_docu, r.foli_docu, r.rutt_emis +'-'+  r.digi_emis, r.razo_emis, r.fech_emis, substring(r.fech_rece,0,11) as fech_reme,  d.mont_neto, d.impu_vaag, d.mont_tota, r.mont_tota, d.ESTA_DOCU, @p_esta_docu1
			FROM dto_enca_docu_p d, rep_dto_sii r INNER JOIN dte_tipo_docu t ON t.TIPO_DOCU = r.TIPO_DOCU
			WHERE r.rutt_rece = @p_rutt_rece1
			AND r.rutt_emis BETWEEN @p_rutt_emis1 AND @p_rutt_emis2
			AND r.fech_rece BETWEEN @p_rece_desd1 AND @p_rece_hast2
			AND r.fech_emis BETWEEN @p_emis_desd1 AND @p_emis_hast2
			AND r.tipo_docu BETWEEN @p_tipo_docu1 AND @p_tipo_docu2
			AND r.foli_docu BETWEEN @p_foli_desd1 AND @p_foli_hast2
			AND r.TIPO_DOCU != 52
			AND d.codi_empr = @p_codi_empr
			AND d.tipo_docu = r.tipo_docu
			AND d.foli_nume = r.foli_docu
			AND d.esta_docu IN ('INI',  'ERA')
			AND d.rutt_rece  = r.rutt_rece
			AND d.rutt_emis = r.rutt_emis
			AND r.mont_tota != convert(numeric,d.mont_tota))
		END
		ELSE
		BEGIN
			INSERT INTO temp_rep_dto_sii (nume_proc, fech_proc, rutt_rece, tipo_docu, foli_docu, rutt_emis, razo_emis, fech_emis, fech_rece, mont_neto, impu_vaag, mont_tota_se, mont_tota_sii, esta_docu,esta_docu1)
			(SELECT DISTINCT @p_nume_proc, CONVERT(VARCHAR(10), GETDATE(), 120), r.rutt_rece, t.tipo_docu, r.foli_docu, r.rutt_emis +'-'+  r.digi_emis, r.razo_emis, r.fech_emis, substring(r.fech_rece,0,11) as fech_reme,  d.mont_neto, d.impu_vaag, d.mont_tota, r.mont_tota, d.esta_docu, @p_esta_docu1
			FROM dto_enca_docu_p d, rep_dto_sii r INNER JOIN dte_tipo_docu t ON t.TIPO_DOCU = r.TIPO_DOCU
			WHERE r.rutt_emis BETWEEN @p_rutt_emis1 AND @p_rutt_emis2
			AND r.fech_rece BETWEEN @p_rece_desd1 AND @p_rece_hast2
			AND r.fech_emis BETWEEN @p_emis_desd1 AND @p_emis_hast2
			AND r.tipo_docu BETWEEN @p_tipo_docu1 AND @p_tipo_docu2
			AND r.foli_docu BETWEEN @p_foli_desd1 AND @p_foli_hast2
			AND r.TIPO_DOCU != 52
			AND d.tipo_docu = r.tipo_docu
			AND d.foli_nume = r.foli_docu
			AND d.esta_docu IN ('INI',  'ERA')
			AND d.rutt_rece  = r.rutt_rece
			AND d.rutt_emis = r.rutt_emis
			AND r.mont_tota != convert(numeric,d.mont_tota))
		END
	END

-- DOCUMENTOS QUE ESTAN EN LA SUITE Y EN EL SII Y QUE NO TIENEN DIFERENCIA DE NINGUNA INDOLE
	IF @p_esta_docu1 = 'OK'     
	BEGIN
		IF (@v_codi_empr != '0') 
		BEGIN
 			SELECT @p_rutt_rece1 = ISNULL(rutt_empr,0), @p_codi_empr = codi_empr  FROM empr WHERE codi_empr = @v_codi_empr
			
			print(' @p_rutt_rece1 '+ convert(varchar,@p_rutt_rece1));
			print(' @p_codi_empr '+ convert(varchar,@p_codi_empr));
			INSERT INTO temp_rep_dto_sii (nume_proc, fech_proc, rutt_rece, tipo_docu, foli_docu, rutt_emis, razo_emis, fech_emis, fech_rece, mont_neto, impu_vaag, mont_tota_se, mont_tota_sii, esta_docu, esta_docu1)
			(SELECT DISTINCT @p_nume_proc, CONVERT(VARCHAR(10), GETDATE(), 120), r.rutt_rece, t.tipo_docu, r.foli_docu, r.rutt_emis +'-'+  r.digi_emis, r.razo_emis, r.fech_emis, substring(r.fech_rece,0,11) as fech_reme,  d.mont_neto, d.impu_vaag, d.mont_tota, r.mont_tota, d.esta_docu, @p_esta_docu1
			FROM dto_enca_docu_p d, rep_dto_sii r INNER JOIN dte_tipo_docu t ON t.TIPO_DOCU = r.TIPO_DOCU
			WHERE r.rutt_rece = @p_rutt_rece1
			AND r.rutt_emis BETWEEN @p_rutt_emis1 AND @p_rutt_emis2
			AND r.fech_emis BETWEEN @p_emis_desd1 AND @p_emis_hast2
			AND r.fech_rece BETWEEN @p_rece_desd1 AND @p_rece_hast2
			AND r.tipo_docu BETWEEN @p_tipo_docu1 AND @p_tipo_docu2
			AND r.tipo_docu != 52
			AND r.foli_docu BETWEEN @p_foli_desd1 AND @p_foli_hast2
			AND d.codi_empr = @p_codi_empr
			AND d.tipo_docu = r.tipo_docu
			AND d.foli_nume = r.foli_docu
			AND d.rutt_rece  = r.rutt_rece
			AND d.rutt_emis = r.rutt_emis
			AND d.esta_docu in ('INI',  'ERA')
			AND r.mont_tota = convert(numeric,d.mont_tota))
		END
		ELSE
		BEGIN
			INSERT INTO temp_rep_dto_sii (nume_proc, fech_proc, rutt_rece, tipo_docu, foli_docu, rutt_emis, razo_emis, fech_emis, fech_rece, mont_neto, impu_vaag, mont_tota_se, mont_tota_sii, esta_docu, esta_docu1)
			(SELECT DISTINCT @p_nume_proc, CONVERT(VARCHAR(10), GETDATE(), 120), r.rutt_rece, t.tipo_docu, r.foli_docu, r.rutt_emis +'-'+  r.digi_emis, r.razo_emis, r.fech_emis, substring(r.fech_rece,0,11) as fech_reme,  d.mont_neto, d.impu_vaag, d.mont_tota, r.mont_tota, d.esta_docu, @p_esta_docu1
			FROM dto_enca_docu_p d, rep_dto_sii r INNER JOIN dte_tipo_docu t ON r.tipo_docu = t.tipo_docu 
			WHERE r.rutt_emis BETWEEN @p_rutt_emis1 AND @p_rutt_emis2
			AND r.fech_emis BETWEEN @p_emis_desd1 AND @p_emis_hast2
			AND r.fech_rece BETWEEN @p_rece_desd1 AND @p_rece_hast2
			AND r.tipo_docu BETWEEN @p_tipo_docu1 AND @p_tipo_docu2
			AND r.tipo_docu != 52
			AND r.foli_docu BETWEEN @p_foli_desd1 AND @p_foli_hast2
			AND d.tipo_docu = r.tipo_docu
			AND d.foli_nume = r.foli_docu
			AND d.rutt_rece  = r.rutt_rece
			AND d.rutt_emis = r.rutt_emis
			AND d.esta_docu in ('INI',  'ERA')
			AND r.mont_tota = convert(numeric,d.mont_tota))
		END    
	END
END
GO

GO
--SqlScripter----[dbo].[prc_resu_boel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_resu_boel]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_resu_boel] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/* Procedure PRC_Resu_BOEL
OT : 202325
Migrado desde Oracle por Héctor Ferrada
Fecha : 27/04/2005
Autor : Diego Sanchez
Genera consumo de boleta partiendo de la base BEL_ENCA_DOCU
para una empresa y periodo de fechas.
Si fecha no se envia asume la actual
Si Rut de quien envia no es pasado como parametro
busca en la base la persona por defecto para enviar-
*/
ALTER PROCEDURE [dbo].[prc_resu_boel]
(@p_codi_empr varchar(9),
@p_rutt_envi varchar(10),
@p_digi_envi varchar(1),
@p_fech_inic varchar(10),
@p_fech_fina varchar(10),
@lugar varchar(200) output,
@p_codi_erri varchar(1) output,
@p_mens_erro varchar(200) output)
as
BEGIN
begin transaction
	declare 
	@v_rutt_pers 	numeric(9),
	@v_dgto_pers 	varchar(1),
	@v_fech_inic 	varchar(10),
	@v_fech_fina 	varchar(10),
	@v_secu_envi 	numeric(3),
	@v_rutt_empr 	numeric(9),
	@v_digi_empr 	varchar(1),
	@v_corre_resu	numeric(9),
	@v_fech_reso 	varchar(30),
	@v_nume_reso 	varchar(10),
	@v_fol_ini 	numeric(10),
	@v_fol_actual 	numeric(10),
	@v_tipo_docu 	numeric(3),
	@v_cant_bol	numeric(9),
	@v_cant_not	numeric(9),
	@v_cant_tot	numeric(9),
	@fech_actual	varchar(10),
	@fech_actual2	varchar(10),
	@ced_tipo_docu  numeric(3), -- para cursor cur_enca_docu
	@ced_foli_docu	numeric(10), -- para cursor cur_enca_docu
	@cen_tipo_docu  numeric(3), -- para cursor cur_enca_nota
	@cen_foli_docu	numeric(10), -- para cursor cur_enca_nota
	@cfa_tipo_docu  numeric(3), -- para cursor cur_foli_anul
	@cfa_foli_anul	numeric(10), -- para cursor cur_foli_anul
	@resul	numeric(10)

begin
	set @p_codi_erri = 'N'
	set @p_mens_erro = ' '
	set @lugar = 'Comienzo'

	if @p_codi_empr is null 
	begin
		set @p_codi_erri = 'S'
		set @p_mens_erro = 'Falta parámetro codigo empresa'
		print(@lugar)
	end
	else
	begin
		if (@p_fech_inic is null) or (@p_fech_fina is null)
		begin
			set @lugar = 'Asigna GETDATE'
			print(@lugar)
			/*set @fech_actual = CONVERT(char(10), GETDATE(), 120) -- ISO, 101 = dd/mm/yyyy la pasamos a yyyy-mm-dd
			set @v_fech_inic = substring(@fech_actual,7,4)+'-'+substring(@fech_actual,4,2)+'-'+substring(@fech_actual,1,2)
			set @v_fech_fina = @v_fech_inic*/
			set @v_fech_inic = CONVERT(char(10), GETDATE(), 120)
			set @v_fech_fina = CONVERT(char(10), GETDATE(), 120)
			set @p_mens_erro = @v_fech_fina
		end
		else
		begin
			set @v_fech_inic = @p_fech_inic
			set @v_fech_fina = @p_fech_fina
			set @lugar='Asignando Fecha por parametros '
			print(@lugar)
		end

		-- comprueba si hay boleta generadas para la empresa y fecha 
		begin
			set @lugar = 'Comprobando si hay boleta generadas'
			print(@lugar)
			select 	@v_cant_bol = count(foli_docu)
			from 	BEL_ENCA_DOCU
			where 	codi_empr = @p_codi_empr and
			fech_emis between @v_fech_inic AND @v_fech_fina
			set @lugar = 'cantidad bol: '+convert(varchar(9),@v_cant_bol)		
			print(@lugar)
			set @lugar = 'Comprobando si hay notas de boleta generadas'
			print(@lugar)
			select 	@v_cant_not = count(a.foli_docu)
			from 	dte_enca_docu a, dte_docu_Refe b
			where 	a.codi_empr = @p_codi_empr and
			a.tipo_docu = 61 and
			a.codi_empr = b.codi_empr and
			a.tipo_docu = b.tipo_docu and
			a.foli_docu = b.foli_docu and
			a.fech_emis between @v_fech_inic AND @v_fech_fina and
			b.tipo_refe in (39,41)
			set @v_cant_tot = @v_cant_bol + @v_cant_not
			if (@@ERROR <> 0)
			begin
				set @p_codi_erri = 'S'
				set @p_mens_erro = 'No se ha podido eliminar dte_tido_envi. ERROR: ' + convert(varchar, @@ERROR)
				print(@lugar)
			end
		end -- bloque

		if @p_rutt_envi is null
		begin
			set @lugar = 'Buscando persona que envia'
			print(@lugar)
			select 	@v_rutt_pers = rutt_pers, @v_dgto_pers = dgto_pers
			from  	personas a, dte_auto_pers b
			where 	a.codi_pers = b.codi_pers and b.esta_auto = 'VIG'
			and	b.DEFE_AUTO = 1 AND b.TIPO_AUTO = 'ENV'
			and 	b.codi_empr = convert(numeric, @P_CODI_EMPR)
			if (@@rowcount = 0)
			begin
				set @p_codi_erri = 'S'
				set @p_mens_erro = 'No Encuentra persona autorizada'
				print(@lugar)
			end
		end
		else
		begin
			set @v_rutt_pers = @p_rutt_envi
			set @v_dgto_pers = @p_digi_envi
		end

		if @p_codi_erri<>'S'
		begin
			set @lugar = 'Determinando secuencia de envio'
			print(@lugar)
			-- determinar secuencia de envio 
			select 	@v_secu_envi = isnull(max(isnull(secu_envi,0)),0)
			from 	bel_cons_cara
			where 	codi_empr = @p_codi_empr and
			fech_inic = @v_fech_inic
			set @v_secu_envi = @v_secu_envi + 1
			set @lugar = 'Buscando Datos de Empresa : rut y digito'
			print(@lugar)
			-- determina datos de la empresa 
			begin
				select @v_rutt_empr = rutt_empr, @v_digi_empr = digi_empr
				from empr where codi_empr = @P_CODI_EMPR

				if (@@rowcount = 0)
				begin
					set @p_codi_erri = 'S'
					set @p_mens_erro = 'No Puede Obtener datos de la empresa'
					print(@lugar)
				end
			end
		end

		if @p_codi_erri<>'S'
		begin
			set @lugar = 'Buscando Datos de Empresa : Fecha Y nro de Resolucion '
			print(@lugar)
			-- fecha y numero de resolucion 
			Begin
				select 	@v_fech_reso = valo_paem
				from 	para_empr 
				where 	codi_empr = @P_CODI_EMPR
				and 	codi_paem = 'EGFR'
	
				select 	@v_nume_reso = valo_paem
				from 	para_empr 
				where 	codi_empr = @P_CODI_EMPR
				and 	codi_paem = 'EGNR'

				if (@@rowcount = 0)
				begin
					set @p_codi_erri = 'S'
					set @p_mens_erro = 'No Puede Obtener datos de resolucion Sii'
					print(@lugar)
				end
			end
		end


		if @p_codi_erri<>'S'
		begin
			set @lugar = 'Obteniendo correlativo de envio (sequence)'
			print(@lugar)

			-- correlativo de envio
			EXECUTE get_boel_resu @v_corre_resu out

			set @p_mens_erro = @v_corre_resu
			set @lugar = 'Insertando caratula de envio'
			print(@lugar)

			-- Insertar en Bel_Cons_cara 
			set @fech_actual2 = CONVERT(char(10), GETDATE(), 120) -- ISO, 101 = dd/mm/yyyy la pasamos a yyyy-mm-dd

			Insert into BEL_CONS_CARA (codi_empr, corr_cons, esta_envi, rutt_emis, digi_emis, rutt_envi,
			digi_envi, fech_reso, nume_resu, fech_inic, fech_fina, secu_envi, feho_envi)
			Values (@p_codi_empr, @v_corre_resu,'INI', @v_rutt_empr, @v_digi_empr, @v_rutt_pers,
			@v_dgto_pers, @v_fech_reso, @v_nume_reso, @v_fech_inic, @v_fech_fina, @v_secu_envi, @fech_actual2+'T'+CONVERT(char, getdate(), 108))

			set @lugar = 'Insertando Resumen por tipo de documento'
			print(@lugar)


			if @v_cant_tot >0
			begin
				-- Resumen por tipo de documento
				insert into BEL_CONS_RESU
				(codi_empr, corr_cons, tipo_docu, tota_neto,tota_ivag, tasa_ivag,tota_exen,mont_tota,cant_emit,cant_anul,cant_util)
				SELECT codi_empr, @v_corre_resu, tipo_docu, 
				case sum(isnull(mont_neto,0)) 
				when 0 
				then round((sum(isnull(mont_tota,0) - isnull(mont_exen,0)))
				/(1+(max(tasa_vaag)/100)),0) 
				else sum(isnull(mont_neto,0)) end,
				sum(isnull(mont_tota,0)-isnull(mont_exen,0)) - 
				case sum(isnull(mont_neto,0)) 
				when 0 
				then round((sum(isnull(mont_tota,0) - isnull(mont_exen,0)))/(1+(max(tasa_vaag)/100)),0) 
				else sum(isnull(mont_neto,0)) end, max(tasa_vaag), sum(mont_exen),
				sum(mont_tota), count(isnull(foli_docu,0)),0,0
				FROM BEL_ENCA_DOCU a
				WHERE codi_empr = @p_codi_empr
				AND fech_emis between @v_fech_inic AND @v_fech_fina
				AND foli_docu Not IN (select foli_anul from Bel_foli_anul b
				where a.codi_empr = b.codi_empr
				and a.tipo_docu = b.tipo_docu)
				GROUP BY a.codi_empr, a.tipo_docu
				UNION ALL
				SELECT a.codi_empr, @v_corre_resu, a.tipo_docu, sum(a.mont_neto),
				sum(a.impu_vaag), max(a.tasa_vaag), sum(a.mont_exen),
				sum(a.mont_tota), count(isnull(a.foli_docu,0)),0,0
				from dte_enca_docu a, dte_docu_Refe b
				where	a.codi_empr = @p_codi_empr and a.tipo_docu = 61
				and	a.codi_empr = b.codi_empr and a.tipo_docu = b.tipo_docu
				and	a.foli_docu = b.foli_docu
				and 	a.fech_emis between @v_fech_inic AND @v_fech_fina
				and	b.tipo_refe in (39,41)
				GROUP BY a.codi_empr, a.tipo_docu
				
				-- se toca esta parte por ot 1407354
				set @resul=0
				select @resul =count(*) from bel_cons_resu   where corr_cons =@v_corre_resu
				if @resul =0 
				Begin
					insert into bel_cons_resu  (codi_empr, corr_cons, tipo_docu, tota_neto,tota_ivag, tasa_ivag,tota_exen,mont_tota,cant_emit,cant_anul,cant_util)
					values(1,@v_corre_resu,39,0,0,0,0,0,0,0,0)
				END
				-- hasta aca						

				-- Total de anulados y no enviados.
				update BEL_CONS_RESU
				set cant_anul = (select count(foli_anul)
					from BEL_FOLI_ANUL  b
					where BEL_CONS_RESU.codi_empr = b.codi_empr
					and BEL_CONS_RESU.tipo_docu = b.tipo_docu
					and b.fech_anul between @V_FECH_INIC AND @V_FECH_FINA)
				where codi_empr = @P_CODI_EMPR and corr_cons = @v_corre_resu
				
				-- Total Utilizados en el periodo
				update BEL_CONS_RESU
				set cant_util = (select count(b.foli_docu) 
						from bel_enca_docu b
						where BEL_CONS_RESU.codi_empr = b.codi_empr
						and BEL_CONS_RESU.tipo_docu = b.tipo_docu
						and b.fech_emis between @V_FECH_INIC AND @V_FECH_FINA
						AND foli_docu Not IN (select foli_anul from Bel_foli_anul bel
											  where bel.codi_empr = b.codi_empr
											  and bel.tipo_docu = b.tipo_docu)
						UNION
						select count(a.foli_docu)
						from dte_enca_docu a, dte_docu_refe c
						where BEL_CONS_RESU.codi_empr = a.codi_empr
						and BEL_CONS_RESU.tipo_docu = a.tipo_docu
						and a.codi_empr = c.codi_empr 
						and a.tipo_docu = c.tipo_docu
						and a.foli_docu = c.foli_docu
						and c.tipo_refe in (39,41)
						and a.fech_emis between @V_FECH_INIC AND @V_FECH_FINA)
						+
						(select count(foli_anul)
						from BEL_FOLI_ANUL  b
						where BEL_CONS_RESU.codi_empr = b.codi_empr
						and BEL_CONS_RESU.tipo_docu = b.tipo_docu
						and b.fech_anul between @V_FECH_INIC AND @V_FECH_FINA)
				where codi_empr = @P_CODI_EMPR and corr_cons = @v_corre_resu

				-- RANGOS 
				set @lugar = 'Insertando Rangos de Consumo Utilizados para Boletas'
				print(@lugar)
				-- emitidos + anulados
				set @v_fol_ini = 0
				set @v_fol_actual = 0

				-- Cursores
				declare cur_enca_docu cursor for 
				select 	a.tipo_docu, a.foli_docu
				from 	Bel_Enca_Docu a
				where 	a.codi_empr=@p_codi_empr 
				and a.fech_emis between @p_fech_inic AND @p_fech_fina
				and a.foli_docu Not IN   (select bel.foli_anul from Bel_foli_anul bel
						  	where bel.codi_empr = a.codi_empr
							and bel.tipo_docu = a.tipo_docu)
				order by a.tipo_docu, a.foli_docu
				
				--Fin declaracion Cursor cur_enca_docu

				OPEN cur_enca_docu
				FETCH NEXT FROM cur_enca_docu
				into @ced_tipo_docu, @ced_foli_docu	
				while @@FETCH_STATUS=0
				begin
					set @lugar = 'en fetch cursor encadocu'
					print(@lugar)
					if @v_fol_ini = 0
					begin
						set @v_tipo_docu = @ced_tipo_docu
						set @v_fol_ini = @ced_foli_docu
						set @v_fol_actual = @ced_foli_docu
					end
					else
					begin
						if (@v_fol_actual + 1 = @ced_foli_docu) And (@v_tipo_docu = @ced_tipo_docu)
							set @v_fol_actual = @ced_foli_docu
						else
						begin
							-- graba registro por fin de continuidad 
							insert into bel_cons_rang Values(@p_codi_empr, @v_tipo_docu, @v_corre_resu,
							'UTIL',@v_fol_ini, @v_fol_actual)
							set @v_fol_ini = @ced_foli_docu
							set @v_fol_actual = @ced_foli_docu
							set @v_tipo_docu = @ced_tipo_docu
						end
					end
					FETCH NEXT FROM cur_enca_docu
					into @ced_tipo_docu, @ced_foli_docu
				end  --while cursor cur_enca_docu
				CLOSE cur_enca_docu
				DEALLOCATE cur_enca_docu

				if @v_fol_actual > 0
				begin
					-- graba el rango 
					--set @lugar = 'graba rango '+@p_codi_empr+' - '+@v_tipo_docu+' - '+@v_corre_resu
					insert into bel_cons_rang Values(@p_codi_empr, @v_tipo_docu, @v_corre_resu,
					'UTIL', @v_fol_ini, @v_fol_actual)
				end

				-- RANGOS 
				set @lugar = 'Insertando Rangos de Consumo Utilizados para Notas'
				print(@lugar)
				-- emitidos + anulados 
				set @v_fol_ini = 0
				set @v_fol_actual = 0

				-- declaracion Cursor cur_enca_nota
				declare cur_enca_nota cursor for 
				select 	a.tipo_docu, a.foli_docu
				from 	dte_enca_docu as a, dte_docu_Refe as b
				where 	a.codi_empr = b.codi_empr and
				a.tipo_docu = b.tipo_docu and
				a.foli_docu = b.foli_docu and
				a.codi_empr = @p_codi_empr and
				a.tipo_docu = 61 and
				a.fech_emis between @p_fech_inic AND @p_fech_fina and
				b.tipo_refe in (39,41)
				order by a.tipo_docu, a.foli_docu
				--Fin declaracion Cursor cur_enca_nota

				OPEN cur_enca_nota
				FETCH NEXT FROM cur_enca_nota
				into @cen_tipo_docu, @cen_foli_docu
				while @@FETCH_STATUS=0
				begin
					if @v_fol_ini = 0
					begin
						set @v_tipo_docu = @cen_tipo_docu
						set @v_fol_ini = @cen_foli_docu
						set @v_fol_actual = @cen_foli_docu
					end
					else
					begin
						if (@v_fol_actual + 1 = @cen_foli_docu) And (@v_tipo_docu = @cen_tipo_docu)
						begin
							set @v_fol_actual = @cen_foli_docu
						end
						else
						begin
							--graba registro por fin de continuidad
							insert into bel_cons_rang Values(@p_codi_empr, @v_tipo_docu, @v_corre_resu,
							'UTIL', @v_fol_ini, @v_fol_actual)
							set @v_fol_ini = @cen_foli_docu
							set @v_fol_actual = @cen_foli_docu
							set @v_tipo_docu = @cen_tipo_docu
						end
					end
					FETCH NEXT FROM cur_enca_nota
					into @cen_tipo_docu, @cen_foli_docu
				end  --while cursor cur_enca_nota
				CLOSE cur_enca_nota
				DEALLOCATE cur_enca_nota
				
				if @v_fol_actual > 0
				begin
					-- graba el rango 					
					insert into bel_cons_rang Values(@p_codi_empr, @v_tipo_docu, @v_corre_resu,
					'UTIL', @v_fol_ini, @v_fol_actual)
				end

				-- anulados
				set @lugar = 'Insertando Rangos de Anulados'
				print(@lugar)
				set @v_fol_ini = 0
				set @v_fol_actual = 0

				declare cur_foli_anul cursor for 
				select 	tipo_docu, foli_anul
				from 	Bel_Foli_Anul
				where  codi_empr = @p_codi_empr and fech_Anul between @p_fech_inic AND @p_fech_fina
				order by tipo_docu , foli_anul
				-- Fin declaracion Cursor cur_foli_anul
				-- Fin cursores

				OPEN cur_foli_anul
					FETCH NEXT FROM cur_foli_anul
					into @cfa_tipo_docu, @cfa_foli_anul
					while @@FETCH_STATUS=0
					begin
						if @v_fol_ini = 0
						begin
							set @v_tipo_docu = @cfa_tipo_docu
							set @v_fol_ini = @cfa_foli_anul
							set @v_fol_actual = @cfa_foli_anul
						end
						else
						begin	
							if (@v_fol_actual + 1 = @cfa_foli_anul) And (@v_tipo_docu = @cfa_tipo_docu)
							begin
								set @v_fol_actual = @cfa_foli_anul
							end
							else
							begin
								-- graba registro por fin de continuidad 
								insert into bel_cons_rang Values(@p_codi_empr, @v_tipo_docu, @v_corre_resu,
								'ANUL', @v_fol_ini, @v_fol_actual)
								set @v_fol_ini = @cfa_foli_anul
								set @v_fol_actual = @cfa_foli_anul
								set @v_tipo_docu = @cfa_tipo_docu
							end
						end
						FETCH NEXT FROM cur_foli_anul
						into @cfa_tipo_docu, @cfa_foli_anul
					end  --while cursor cur_foli_anul
				CLOSE cur_foli_anul
				DEALLOCATE cur_foli_anul			

				if @v_fol_actual > 0
				begin
					--graba el rango
					insert into bel_cons_rang Values(@p_codi_empr, @v_tipo_docu, @v_corre_resu,
					'ANUL', @v_fol_ini, @v_fol_actual)
				end
				if (@@ERROR <> 0)
				begin
					set @p_codi_erri = 'S'
					set @p_mens_erro = 'Error en '+ @lugar + convert(varchar, @@ERROR)
				end
			end
			else
			begin
				set @lugar = 'Insertando Tipo de Documento en Cons. Vacio'
				print(@lugar)
				insert into BEL_CONS_RESU (codi_empr, corr_cons, tipo_docu, tota_neto,tota_ivag, tasa_ivag, tota_exen, mont_tota, cant_emit, cant_anul, cant_util)
				VALUES (@p_codi_empr, @v_corre_resu,39,0,0,19,0,0,0,0,0)
				if (@@ERROR <> 0)
				begin
					rollback transaction
					set @p_codi_erri = 'S'
					set @p_mens_erro = 'Error en '+ @lugar + convert(varchar, @@ERROR)
				end
			end
		end -- si paso todos lo controles previos p_codi_err
	end -- else del: if @p_codi_empr is null
END
commit transaction
end
GO

GO
--SqlScripter----[dbo].[prc_resu_peri].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[prc_resu_peri]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_resu_peri] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*drop procedure [dbo].[prc_resu_peri]
go*/

/*   objetivo : crear libro FINAL.
		se base en segmentos generados
   Autor : Diego Sanchez
   Fecha : 27/10/2005
   OT 	: 202325 - Boleta Electronica 
   Migrado desde Oracle el 04/05/2007 por Hector Ferrada */
ALTER PROCEDURE [dbo].[prc_resu_peri]
(@P_CODI_EMPR 	varchar(9),
					@P_CORR_LIBE	varchar(12),
					@P_FOLI_NOTI	varchar(10),
					@P_CODI_ERRO	varchar(1) output,
					@P_MENS_ERRO	varchar(200) output)
as
begin
	set @P_CODI_ERRO = 'N'
	set @P_MENS_ERRO = ' '
	
	-- Insertar en LBE_RESU_PERI el acumulado de lbe_resu_segm
	print('Insertar en LBE_RESU_PERI el acumulado de lbe_resu_segm')
	insert into LBE_RESU_PERI (codi_empr, corr_libe, tipo_docu, cant_anul)
		(select @P_CODI_EMPR, @P_CORR_LIBE, tipo_docu , sum(cant_anul)
		from 	lbe_resu_segm A , lbe_cara_libr B
		where 	A.codi_empr = B.codi_empr and A.corr_libe = B.corr_libe
		  and	B.foli_noti = @P_FOLI_NOTI
		group by tipo_docu)

	-- Insertar en LBE_PERI_TISE el acumulado de lbr_segm_tise
	print('Insertar en LBE_PERI_TISE el acumulado de lbr_segm_tise')
	insert into LBE_PERI_TISE
		(CODI_EMPR, CORR_LIBE, TIPO_DOCU, INDI_SERV, PERI_DEVE, TOTA_DOCU, TOTA_EXEN,
		 TOTA_NETO, TASA_IVAA, MONT_IVAA, MONT_TOTA, MONT_NOFA, TOTA_PERI, SALD_ANTE,
		 VALO_PAGA)
		(select A.codi_empr, @P_corr_libe, tipo_docu, indi_serv, peri_deve,
			sum(tota_docu),sum(tota_exen),sum(mont_neto),max(tasa_vaag),
			sum(tota_vaag), sum(mont_tota), sum(mont_nofa), sum(mont_peri),
			sum(sald_ante), sum(valo_paga)
		from LBE_SEGM_TISE A , LBE_CARA_LIBR B
		where A.codi_empr = b.codi_empr and A.corr_libe = b.corr_libe
		  and B.Foli_noti = @P_FOLI_NOTI
		group by A.codi_empr, tipo_docu, indi_serv, peri_deve)
end
GO

GO
--SqlScripter----[dbo].[prc_resu_segm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[prc_resu_segm]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_resu_segm] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*drop procedure [dbo].[prc_resu_segm]
go*/

/* Procedure PRC_Resu_BOEL
	OT : 202325
	Fecha Creacion : 27/10/2005
	Autor : Diego Sanchez
	Genera Resumen de Segmento de Libros de Boletas
	Migrado desde oracle 03/05/2007 por hferrada
*/
ALTER PROCEDURE [dbo].[prc_resu_segm]
(@P_CODI_EMPR varchar(9),
					@P_CORR_LIBE varchar(12),
					@P_CODI_ERRO varchar(1) output,
					@P_MENS_ERRO varchar(200) output) as
BEGIN
	set @P_CODI_ERRO = 'N'
	set @P_MENS_ERRO = ''

	-- genera registro por cada tipo de documento
	print('genera registro por cada tipo de documento')
	Insert into LBE_RESU_SEGM (codi_empr, corr_libe, tipo_docu, cant_anul)
		(select codi_empr, corr_libe, tipo_docu, 0
		from LBE_DETA_LIBR
		where codi_empr = @P_CODI_EMPR and corr_libe = @P_CORR_LIBE
		Group by codi_empr, corr_libe, tipo_docu)

	-- actualiza los anulados
	print('actualiza los anulados')
	Update LBE_RESU_SEGM
	set cant_anul =	(Select count(codi_empr)
			from LBE_DETA_LIBR b
			where foli_anul='A' and LBE_RESU_SEGM.codi_empr = b.codi_empr
			  and LBE_RESU_SEGM.corr_libe = b.corr_libe
			  and LBE_RESU_SEGM.tipo_docu = b.tipo_docu)
	where codi_empr = @p_codi_empr and corr_libe = @P_CORR_LIBE


	-- Insertar en tabla LBE_SEGM_TISE los serv<> 2 desde lbe_deta_libr
	print('Insertar en tabla LBE_SEGM_TISE los serv<> 2 desde lbe_deta_libr')
	Insert into LBE_SEGM_TISE 
			(CODI_EMPR, CORR_LIBE, TIPO_DOCU, INDI_SERV, PERI_DEVE,
			TOTA_DOCU, TOTA_EXEN, MONT_TOTA, MONT_NOFA, MONT_PERI,
			SALD_ANTE, VALO_PAGA, MONT_NETO, TASA_VAAG, TOTA_VAAG)
		(Select codi_empr, corr_libe, tipo_docu, tipo_serv, ' ',
			count(codi_empr), sum(isnull(mont_exen,0)),
			sum(isnull(mont_tota,0)),sum(isnull(mont_nofa,0)),
			sum(isnull(tota_peri,0)), sum(isnull(sald_ante,0)),
			sum(isnull(valo_paga,0)), sum(isnull(mont_neto,0)),
			max(tasa_vaag),	sum( mont_tota - mont_neto)
		from LBE_DETA_LIBR
		where codi_empr = @P_CODI_EMPR and corr_libe = @P_CORR_LIBE
		  and foli_anul <> 'A' and tipo_serv <> 2
		group by codi_empr, corr_libe, tipo_docu, tipo_serv)

	-- Insertar en tabla LBE_SEGM_TISE los serv=2 desde lbe_deta_libr agrupando tb por periodo devengo 
	print('Insertar en tabla LBE_SEGM_TISE los serv=2 desde lbe_deta_libr agrupando tb por periodo devengo')
	Insert into LBE_SEGM_TISE
			(CODI_EMPR, CORR_LIBE, TIPO_DOCU, INDI_SERV, PERI_DEVE,
			TOTA_DOCU, TOTA_EXEN, MONT_TOTA, MONT_NOFA, MONT_PERI,
			SALD_ANTE, VALO_PAGA, MONT_NETO, TASA_VAAG, TOTA_VAAG)
		(Select codi_empr, corr_libe, tipo_docu, tipo_serv, substring(fech_venc,1,7),
			count(codi_empr), sum(isnull(mont_exen,0)),
			sum(isnull(mont_tota,0)),sum(isnull(mont_nofa,0)),
			sum(isnull(tota_peri,0)), sum(isnull(sald_ante,0)),
			sum(isnull(valo_paga,0)), sum(isnull(mont_neto,0)),
			max(tasa_vaag),	sum(mont_tota - mont_neto)
		from LBE_DETA_LIBR
		where codi_empr = @P_CODI_EMPR and corr_libe = @P_CORR_LIBE
		  and foli_anul <> 'A' and tipo_serv = 2
		group by codi_empr, corr_libe, tipo_docu, tipo_serv, substring(fech_venc,1,7))
END
GO

GO
--SqlScripter----[dbo].[prc_sys_module_read].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_sys_module_read]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_sys_module_read] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_sys_module_read]
(
	@tsTipo as VARCHAR(4),	
	@tnPagina as INTEGER,	
	@tnRegPag as INTEGER, 
	@tsCondicion as VARCHAR(2048),
	@tsPar1 as VARCHAR(256), @tsPar2 as VARCHAR(256), 
	@tsPar3 as VARCHAR(256), @tsPar4 as VARCHAR(256), @tsPar5 as VARCHAR(256),
	@p_codi_usua VARCHAR(30), @p_codi_empr INTEGER, @p_codi_emex VARCHAR(30))
AS
	/*
	 Procedimiento para rescatar datos de la tabla SYS_PARAM
     CON EL 
	 Parametros
		@tsTipo 
			S: Query utilizada para el mantenedor
			L: Query utilizada para el listador
			LV: Query utilizada para las listas de valor
		@tnPagina	: Numero de pagina a rescatar
		@tnRegPag	: Numero de registros por pagina
		@tsCondicion : Condicion, clausula Where
		@tsPar1		: Parametro 1 - PARAM_NAME
		@tsPar2		: Parametro 2
		@tsPar3		: Parametro 3
		@tsPar4		: Parametro 4
		@tsPar5		: Parametro 5
	 */
	declare @sql_dyn as INTEGER
	declare @sql as nVARCHAR(2048)
	 
BEGIN
	IF(@tsTipo = 'S')
		BEGIN
			SELECT		 CODI_MODU		,TIPO_OBJE,
						 RESU_MODU		,DESC_MODU,
						 VERS_MODU		,CODE_MODU,
						 CODI_MODU1
			FROM  SYS_MODULE
			WHERE CODI_MODU = @tsPar1;
		END
	ELSE IF(@tsTipo = 'L')
		BEGIN
			SET @sql = 	'SELECT	ROW_NUMBER() OVER(ORDER BY CODI_MODU ASC) AS REG, 
						 CODI_MODU		,TIPO_OBJE,
						 RESU_MODU		,DESC_MODU,
						 VERS_MODU		,CODE_MODU,
						 CODI_MODU1
						 FROM  SYS_MODULE
						 WHERE 1 = 1 '

			SET @sql = @sql + isnull(@tsCondicion,'')

			EXECUTE prc_list_dyn @sql, @tnPagina, @tnRegPag 
		END
	ELSE IF(@tsTipo = 'LV')
		BEGIN
			SELECT		CODI_MODU AS CODIGO,
						DESC_MODU AS VALOR
			FROM  SYS_MODULE
			ORDER BY(CODI_MODU);
		END
END
GO

GO
--SqlScripter----[dbo].[prc_sys_param_read].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_sys_param_read]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_sys_param_read] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_sys_param_read]
(
	@tsTipo as VARCHAR(4),	
	@tnPagina as INTEGER,	
	@tnRegPag as INTEGER, 
	@tsCondicion as VARCHAR(2048),
	@tsPar1 as VARCHAR(256), @tsPar2 as VARCHAR(256), 
	@tsPar3 as VARCHAR(256), @tsPar4 as VARCHAR(256), @tsPar5 as VARCHAR(256),
	@p_codi_usua VARCHAR(30), @p_codi_empr INTEGER, @p_codi_emex VARCHAR(30))
AS 
	/*
	 Procedimiento para rescatar datos de la tabla SYS_PARAM
     CON EL 
	 Parametros
		@tsTipo 
			S: Query utilizada para el mantenedor
			L: Query utilizada para el listador
			LV: Query utilizada para las listas de valor
		@tnPagina	: Numero de pagina a rescatar
		@tnRegPag	: Numero de registros por pagina
		@tsCondicion : Condicion, clausula Where
		@tsPar1		: Parametro 1 - PARAM_NAME
		@tsPar2		: Parametro 2
		@tsPar3		: Parametro 3
		@tsPar4		: Parametro 4
		@tsPar5		: Parametro 5
	 */
	declare @sql_dyn as INTEGER
	declare @sql as nVARCHAR(2048)
BEGIN
	IF (@tsTipo = 'S')
	BEGIN
		 SELECT	PARAM_NAME, 
			PARAM_VALUE, 
			CODI_MODU, 
			PARAM_DESC, 
			CASE PARAM_TYPE
				WHEN 'S' THEN 1
				ELSE 0
				END AS PARAM_TYPE, 
			OBJECT_TYPE, 
			PARAM_ORDER
		 FROM  SYS_PARAM
		 WHERE PARAM_NAME = @tsPar1
	END
	ELSE IF (@tsTipo = 'L')
	BEGIN
		SET @sql = 	'SELECT	ROW_NUMBER() OVER(ORDER BY PARAM_NAME ASC) AS REG, 
							PARAM_NAME, 
							PARAM_VALUE, 
							CODI_MODU, 
							PARAM_DESC,
							OBJECT_TYPE,
							PARAM_ORDER
					 FROM SYS_PARAM
					 WHERE 1 = 1 '

		SET @sql = @sql + isnull(@tsCondicion,'')

		EXECUTE prc_list_dyn @sql, @tnPagina, @tnRegPag 
	END
	ELSE IF (@tsTipo = 'LO')
	BEGIN
		WITH REGISTROS AS (
			 SELECT	ROW_NUMBER() OVER(ORDER BY PARAM_NAME ASC) AS REG,
				PARAM_NAME, 
				PARAM_VALUE, 
				CODI_MODU, 
				PARAM_DESC, 
				CASE PARAM_TYPE
					WHEN 'S' THEN 1
					ELSE 0
					END AS PARAM_TYPE, 
				OBJECT_TYPE, 
				PARAM_ORDER
			 FROM  SYS_PARAM
			 WHERE PARAM_NAME like '%' + isnull(@tsCondicion,'') + '%'
		)
	 
		SELECT  top (@tnRegPag) (SELECT MAX(REG) FROM REGISTROS) TOT_REG,(((SELECT MAX(REG) FROM REGISTROS) / @tnRegPag) + 1) PAG_MAX, *      
		FROM	REGISTROS
		WHERE	REG > ((@tnPagina-1) * @tnRegPag)
	END
	ELSE IF (@tsTipo = 'LV')
	BEGIN
		 SELECT		PARAM_NAME AS CODIGO, 
					PARAM_VALUE AS VALOR
		 FROM	SYS_PARAM
		 ORDER BY PARAM_NAME
	END
END
GO

GO
--SqlScripter----[dbo].[prc_sys_rous_read].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_sys_rous_read]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_sys_rous_read] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_sys_rous_read]
(
	@tsTipo as VARCHAR(4),	
	@tnPagina as INTEGER,	
	@tnRegPag as INTEGER, 
	@tsCondicion as VARCHAR(128),
	@tsPar1 as VARCHAR(256), @tsPar2 as VARCHAR(256), 
	@tsPar3 as VARCHAR(256), @tsPar4 as VARCHAR(256), @tsPar5 as VARCHAR(256),
	@p_codi_usua VARCHAR(30), @p_codi_empr INTEGER, @p_codi_emex VARCHAR(30))
AS 
	/*
	 Procedimiento para rescatar datos de la tabla SYS_PARAM
     CON EL 
	 Parametros
		@tsTipo 
			S: Query utilizada para el mantenedor
			L: Query utilizada para el listador
			LV: Query utilizada para las listas de valor
			LVA: Query utilizada para la Lista de valor del mantenedor de listador para privilegios
		@tnPagina	: Numero de pagina a rescatar
		@tnRegPag	: Numero de registros por pagina
		@tsCondicion : Condicion, clausula Where
		@tsPar1		: Parametro 1 - PARAM_NAME
		@tsPar2		: Parametro 2
		@tsPar3		: Parametro 3
		@tsPar4		: Parametro 4
		@tsPar5		: Parametro 5
	 */
	declare @sql_dyn as INTEGER
	declare @sql as nVARCHAR(2048)
	 
BEGIN
	IF (@tsTipo = 'S')
	BEGIN
		 SELECT		 codi_rous		,desc_rous,
					 sent_rous		,obje_type,
					 tabl_type		,codi_modu
		FROM  SYS_ROUS
		WHERE CODI_ROUS = @tsPar1
	END
	ELSE IF (@tsTipo = 'L')
	BEGIN
		SET @sql = 	'SELECT	ROW_NUMBER() OVER(ORDER BY codi_rous ASC) AS REG, 
							codi_rous,	desc_rous, 
							sent_rous,	obje_type, 
							tabl_type,	codi_modu
					 FROM SYS_ROUS
					 WHERE 1 = 1 '

		SET @sql = @sql + isnull(@tsCondicion,'')

		EXECUTE prc_list_dyn @sql, @tnPagina, @tnRegPag 
	END
	ELSE IF (@tsTipo = 'LO')
	BEGIN
		WITH REGISTROS AS (
			 SELECT	ROW_NUMBER() OVER(ORDER BY DESC_ROUS ASC) AS REG,
					 codi_rous		,desc_rous,
					 sent_rous		,obje_type,
					 tabl_type		,codi_modu
			 FROM  SYS_ROUS
			 WHERE CODI_ROUS like '%' + isnull(@tsCondicion,'') + '%'
		)
	 
		SELECT  top (@tnRegPag) (SELECT MAX(REG) FROM REGISTROS) TOT_REG, *      
		FROM	REGISTROS
		WHERE	REG > (@tnPagina * @tnRegPag) - @tnPagina
	END
	ELSE IF (@tsTipo = 'LV')
		BEGIN
			 SELECT	CODI_ROUS AS CODIGO, 
					DESC_ROUS AS VALOR
			 FROM	SYS_ROUS
			 ORDER BY DESC_ROUS
		END
	--Es para filtrar por modulo
	ELSE IF (@tsTipo = 'LVA')
		BEGIN
			 SELECT	CODI_ROUS AS CODIGO, 
					DESC_ROUS AS VALOR
			 FROM	SYS_ROUS
			 WHERE CODI_MODU = @tsPar1
			 ORDER BY DESC_ROUS
		END
END
GO

GO
--SqlScripter----[dbo].[PRC_TOTA_COMO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_TOTA_COMO]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_TOTA_COMO] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_TOTA_COMO]
@corr_libr numeric(9), 
	   	  		    @peri_trib varchar(8),
				    @tipo_libr varchar(3),
				    @codi_erro varchar(2) output,
				    @mens_erro varchar(250) output
AS

BEGIN

/*Declaracion de variables*/
DECLARE @CORR_COMO NUMERIC(10),
		@FECH_CONT VARCHAR(12),
		@CANT_COMO NUMERIC(22,4),
		@CANT_MOVI NUMERIC(22,4),
		@VALO_COMO NUMERIC(22,4)
		

/*Cursor para obtener los montos debe y haber por cuenta*/   
DECLARE CUR_MOVI_CONT CURSOR FOR
SELECT FECH_MOCO FECH_CONT,
	   count(distinct nume_moco) CANT_COMO,
	   count(tipo_moco) CANT_MOVI,
	   isnull(sum(debe_como),sum(habe_como)) VALO_COMO
FROM   LCE_MOVI_CONT
WHERE  CORR_LIBR = @CORR_LIBR
AND    PERI_TRIB = @PERI_TRIB
AND    TIPO_LIBR = @TIPO_LIBR
group by fech_moco

SET @CODI_ERRO = 'N'
SET @MENS_ERRO = 'Proceso Ejecutado OK'

OPEN CUR_MOVI_CONT
	FETCH NEXT FROM CUR_MOVI_CONT
		INTO @FECH_CONT,@CANT_COMO,@CANT_MOVI,@VALO_COMO	
		WHILE @@FETCH_STATUS=0
			BEGIN
				EXECUTE GET_CORR_COMO @CORR_COMO OUT
								
				INSERT INTO LCE_TOTA_COMO(CORR_COMO,CORR_LIBR,PERI_TRIB,TIPO_LIBR,
										  FECH_CONT,CANT_COMO,CANT_MOVI,VALO_COMO)
				VALUES (@CORR_COMO,@CORR_LIBR,@PERI_TRIB,@TIPO_LIBR,
					@FECH_CONT,@CANT_COMO,@CANT_MOVI,@VALO_COMO)
			FETCH NEXT FROM CUR_MOVI_CONT
				INTO @FECH_CONT,@CANT_COMO,@CANT_MOVI,@VALO_COMO	
			END
CLOSE CUR_MOVI_CONT
DEALLOCATE CUR_MOVI_CONT

if (@@ERROR <> 0)
	BEGIN
	  	SET @CODI_ERRO = 'S'
		set @MENS_ERRO = 'Error: '+ convert(varchar, @@ERROR)
	END
END
GO

GO
--SqlScripter----[dbo].[PRC_TOTA_LDIA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PRC_TOTA_LDIA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_TOTA_LDIA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_TOTA_LDIA]
@CODI_EMPR NUMERIC(9),
								   @CORR_LIBR NUMERIC(9), 
								   @PERI_DESD VARCHAR(8), 
								   @PERI_HAST VARCHAR(8), 
								   @TIPO_LIBR VARCHAR(3),
								   @COMP_DESD NUMERIC(12), 
								   @COMP_HAST NUMERIC(12), 
								   @CODI_CUCO VARCHAR(15),
								   @FECH_MOCO VARCHAR(10),
								   @SUMA_DEBE NUMERIC(22,4) OUTPUT,
								   @SUMA_HABE NUMERIC(22,4) OUTPUT,
								   @CODI_ERRO VARCHAR(2) OUTPUT,
								   @MENS_ERRO VARCHAR(250) OUTPUT
AS

BEGIN
	
	SET @CODI_ERRO = 'N'
	SET @MENS_ERRO = 'Proceso Totalizar Libro Diario Ejecutado OK'
	SET @SUMA_DEBE = 0
	SET @SUMA_HABE = 0
	
	IF(@COMP_DESD = 0 AND @FECH_MOCO = '*')
	BEGIN
		SELECT @SUMA_DEBE = ISNULL(SUM(MC.DEBE_COMO),0),
	       		@SUMA_HABE = ISNULL(SUM(MC.HABE_COMO),0)	
    		FROM   LCE_CARA_LIBR CL,
	       		LCE_MOVI_CONT MC
   		WHERE  CL.CODI_EMPR = @CODI_EMPR
    		AND    CL.TIPO_LIBR = @TIPO_LIBR
    		AND    MC.TIPO_LIBR = CL.TIPO_LIBR
		AND    CL.CORR_LIBR = (CASE @CORR_LIBR WHEN 0 THEN CL.CORR_LIBR ELSE @CORR_LIBR END)
		AND    CL.PERI_TRIB BETWEEN (CASE @PERI_DESD WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_DESD END) AND (CASE @PERI_HAST WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_HAST END)
		and    mc.peri_trib = cl.peri_trib
    		AND    MC.CODI_CUCO = (CASE @CODI_CUCO WHEN '*' THEN MC.CODI_CUCO ELSE @CODI_CUCO END)
	END
	ELSE IF(@COMP_DESD <> 0 AND @FECH_MOCO = '*')
	BEGIN
		SELECT @SUMA_DEBE = ISNULL(SUM(MC.DEBE_COMO),0),
	       		@SUMA_HABE = ISNULL(SUM(MC.HABE_COMO),0)	
    		FROM   LCE_CARA_LIBR CL,
	       		LCE_MOVI_CONT MC
    		WHERE  CL.CODI_EMPR = @CODI_EMPR
    		AND    CL.TIPO_LIBR = @TIPO_LIBR
    		AND    MC.TIPO_LIBR = CL.TIPO_LIBR
		AND    CL.CORR_LIBR = (CASE @CORR_LIBR WHEN 0 THEN CL.CORR_LIBR ELSE @CORR_LIBR END)
		AND    CL.PERI_TRIB BETWEEN (CASE @PERI_DESD WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_DESD END) AND (CASE @PERI_HAST WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_HAST END)
    		AND    MC.CODI_CUCO = (CASE @CODI_CUCO WHEN '*' THEN MC.CODI_CUCO ELSE @CODI_CUCO END)
		and    mc.peri_trib = cl.peri_trib
		AND    MC.NUME_MOCO BETWEEN @COMP_DESD AND @COMP_HAST 
	END
	ELSE IF(@COMP_DESD = 0 AND @FECH_MOCO <> '*')
	BEGIN
		SELECT @SUMA_DEBE = ISNULL(SUM(MC.DEBE_COMO),0),
	       		@SUMA_HABE = ISNULL(SUM(MC.HABE_COMO),0)	
    		FROM   LCE_CARA_LIBR CL,
	       		LCE_MOVI_CONT MC
    		WHERE  CL.CODI_EMPR = @CODI_EMPR
    		AND    CL.TIPO_LIBR = @TIPO_LIBR
    		AND    MC.TIPO_LIBR = CL.TIPO_LIBR
		AND    CL.CORR_LIBR = (CASE @CORR_LIBR WHEN 0 THEN CL.CORR_LIBR ELSE @CORR_LIBR END)
		AND    CL.PERI_TRIB BETWEEN (CASE @PERI_DESD WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_DESD END) AND (CASE @PERI_HAST WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_HAST END)
    		and    mc.peri_trib = cl.peri_trib
		AND    MC.CODI_CUCO = (CASE @CODI_CUCO WHEN '*' THEN MC.CODI_CUCO ELSE @CODI_CUCO END)
		AND    CONVERT(VARCHAR(10),MC.FECH_MOCO,120) = CONVERT(VARCHAR(10),MC.FECH_MOCO,120)
	END
	ELSE
	BEGIN
		SELECT @SUMA_DEBE = ISNULL(SUM(MC.DEBE_COMO),0),
	       		@SUMA_HABE = ISNULL(SUM(MC.HABE_COMO),0)	
    		FROM   LCE_CARA_LIBR CL,
	       		LCE_MOVI_CONT MC
    		WHERE  CL.CODI_EMPR = @CODI_EMPR
    			AND    CL.TIPO_LIBR = @TIPO_LIBR
    			AND    MC.TIPO_LIBR = CL.TIPO_LIBR
			AND    CL.CORR_LIBR = (CASE @CORR_LIBR WHEN 0 THEN CL.CORR_LIBR ELSE @CORR_LIBR END)
			AND    CL.PERI_TRIB BETWEEN (CASE @PERI_DESD WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_DESD END) AND (CASE @PERI_HAST WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_HAST END)
    			and    mc.peri_trib = cl.peri_trib
			AND    MC.CODI_CUCO = (CASE @CODI_CUCO WHEN '*' THEN MC.CODI_CUCO ELSE @CODI_CUCO END)
			AND    CONVERT(VARCHAR(10),MC.FECH_MOCO,120) = CONVERT(VARCHAR(10),MC.FECH_MOCO,120)
			AND    MC.NUME_MOCO BETWEEN @COMP_DESD AND @COMP_HAST
	END

	IF (@@ERROR <> 0)
	BEGIN
	  	SET @CODI_ERRO = 'S'
		SET @MENS_ERRO = 'PRC_TOTA_LDIA Error: '+ convert(varchar, @@ERROR)
	END
	
END
GO

GO
--SqlScripter----[dbo].[PRC_TOTA_LMAY].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PRC_TOTA_LMAY]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_TOTA_LMAY] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_TOTA_LMAY]
@CODI_EMPR NUMERIC(9),
								   @CORR_LIBR NUMERIC(9), 
								   @PERI_DESD VARCHAR(8), 
								   @PERI_HAST VARCHAR(8), 
								   @TIPO_LIBR VARCHAR(3),
								   @CODI_CUCO VARCHAR(15),
								   @FECH_MOCO VARCHAR(10),
								   @TIPO_COMO VARCHAR(3),
								   @NUME_COMO NUMERIC(9),
								   @SUMA_DEBE NUMERIC(22,4) OUTPUT,
								   @SUMA_HABE NUMERIC(22,4) OUTPUT,
								   @CODI_ERRO VARCHAR(2) OUTPUT,
								   @MENS_ERRO VARCHAR(250) OUTPUT
AS

BEGIN
	
	SET @CODI_ERRO = 'N'
	SET @MENS_ERRO = 'Proceso Totalizar Libro Mayor Ejecutado OK'
	SET @SUMA_DEBE = 0
	SET @SUMA_HABE = 0
	
	IF(@NUME_COMO = 0 AND @FECH_MOCO = '*')	
	BEGIN
		SELECT @SUMA_DEBE = ISNULL(SUM(MC.DEBE_COMO),0),
	       @SUMA_HABE = ISNULL(SUM(MC.HABE_COMO),0)	
    	FROM   LCE_CARA_LIBR CL,
	       LCE_MOVI_CONT MC
    	WHERE  CL.CODI_EMPR = @CODI_EMPR
    	AND    CL.TIPO_LIBR = @TIPO_LIBR    	
	AND    CL.CORR_LIBR = (CASE @CORR_LIBR WHEN 0 THEN CL.CORR_LIBR ELSE @CORR_LIBR END)
	AND    CL.PERI_TRIB BETWEEN (CASE @PERI_DESD WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_DESD END) AND (CASE @PERI_HAST WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_HAST END)
    	AND    MC.TIPO_LIBR = CL.TIPO_LIBR	
	and    mc.peri_trib = cl.peri_trib
	AND    MC.CODI_CUCO = (CASE @CODI_CUCO WHEN '*' THEN MC.CODI_CUCO ELSE @CODI_CUCO END)
    	AND    MC.TIPO_COMO = (CASE @TIPO_COMO WHEN '*' THEN MC.TIPO_COMO ELSE @TIPO_COMO END)
	END
	ELSE IF(@NUME_COMO <> 0 AND @FECH_MOCO = '*')
	BEGIN
	SELECT @SUMA_DEBE = ISNULL(SUM(MC.DEBE_COMO),0),
	       @SUMA_HABE = ISNULL(SUM(MC.HABE_COMO),0)	
    	FROM   LCE_CARA_LIBR CL,
	       LCE_MOVI_CONT MC
    	WHERE  CL.CODI_EMPR = @CODI_EMPR
    	AND    CL.TIPO_LIBR = @TIPO_LIBR    	
	AND    CL.CORR_LIBR = (CASE @CORR_LIBR WHEN 0 THEN CL.CORR_LIBR ELSE @CORR_LIBR END)
	AND    CL.PERI_TRIB BETWEEN (CASE @PERI_DESD WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_DESD END) AND (CASE @PERI_HAST WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_HAST END)
    	AND    MC.TIPO_LIBR = CL.TIPO_LIBR
	and    mc.peri_trib = cl.peri_trib
	AND    MC.CODI_CUCO = (CASE @CODI_CUCO WHEN '*' THEN MC.CODI_CUCO ELSE @CODI_CUCO END)
    	AND    MC.TIPO_COMO = (CASE @TIPO_COMO WHEN '*' THEN MC.TIPO_COMO ELSE @TIPO_COMO END)
	AND    MC.NUME_COMO = @NUME_COMO
	END
	ELSE IF(@NUME_COMO = 0 AND @FECH_MOCO <> '*')
	BEGIN
		SELECT @SUMA_DEBE = ISNULL(SUM(MC.DEBE_COMO),0),
	       @SUMA_HABE = ISNULL(SUM(MC.HABE_COMO),0)	
    	FROM   LCE_CARA_LIBR CL,
	       LCE_MOVI_CONT MC
    	WHERE  CL.CODI_EMPR = @CODI_EMPR
    	AND    CL.TIPO_LIBR = @TIPO_LIBR    	
	AND    CL.CORR_LIBR = (CASE @CORR_LIBR WHEN 0 THEN CL.CORR_LIBR ELSE @CORR_LIBR END)
	AND    CL.PERI_TRIB BETWEEN (CASE @PERI_DESD WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_DESD END) AND (CASE @PERI_HAST WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_HAST END)
    	AND    MC.TIPO_LIBR = CL.TIPO_LIBR
	and    mc.peri_trib = cl.peri_trib
	AND    MC.CODI_CUCO = (CASE @CODI_CUCO WHEN '*' THEN MC.CODI_CUCO ELSE @CODI_CUCO END)
    	AND    MC.TIPO_COMO = (CASE @TIPO_COMO WHEN '*' THEN MC.TIPO_COMO ELSE @TIPO_COMO END)
	AND    CONVERT(VARCHAR(10),MC.FECH_MOCO,120) = CONVERT(VARCHAR(10),MC.FECH_MOCO,120)
	END
	ELSE
	BEGIN
		SELECT @SUMA_DEBE = ISNULL(SUM(MC.DEBE_COMO),0),
	       @SUMA_HABE = ISNULL(SUM(MC.HABE_COMO),0)	
    	FROM   LCE_CARA_LIBR CL,
	       LCE_MOVI_CONT MC
    	WHERE  CL.CODI_EMPR = @CODI_EMPR
    	AND    CL.TIPO_LIBR = @TIPO_LIBR    	
	AND    CL.CORR_LIBR = (CASE @CORR_LIBR WHEN 0 THEN CL.CORR_LIBR ELSE @CORR_LIBR END)
	AND    CL.PERI_TRIB BETWEEN (CASE @PERI_DESD WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_DESD END) AND (CASE @PERI_HAST WHEN '*' THEN CL.PERI_TRIB ELSE @PERI_HAST END)
    	AND    MC.TIPO_LIBR = CL.TIPO_LIBR
	and    mc.peri_trib = cl.peri_trib
	AND    MC.CODI_CUCO = (CASE @CODI_CUCO WHEN '*' THEN MC.CODI_CUCO ELSE @CODI_CUCO END)
    	AND    MC.TIPO_COMO = (CASE @TIPO_COMO WHEN '*' THEN MC.TIPO_COMO ELSE @TIPO_COMO END)
	AND    CONVERT(VARCHAR(10),MC.FECH_MOCO,120) = CONVERT(VARCHAR(10),MC.FECH_MOCO,120)
	AND    MC.NUME_COMO = @NUME_COMO
	END
--AND    CONVERT(VARCHAR(10),MC.FECH_MOCO,120) = (CASE @FECH_MOCO WHEN '*' THEN CONVERT(VARCHAR(10),MC.FECH_MOCO,120) ELSE @FECH_MOCO END)
	
		
	IF (@@ERROR <> 0)
	BEGIN
	  	SET @CODI_ERRO = 'S'
		SET @MENS_ERRO = 'PRC_TOTA_LMAY Error: '+ convert(varchar, @@ERROR)
	END
	
END
GO

GO
--SqlScripter----[dbo].[PRC_TOTA_MOCO].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_TOTA_MOCO]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_TOTA_MOCO] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_TOTA_MOCO]
@corr_libr numeric(9), 
	   	  		   @peri_trib varchar(8), 
				   @tipo_libr varchar(3),
				   @codi_erro varchar(2) output,
				   @mens_erro varchar(250) output
AS

BEGIN

/*Declaracion de variables*/
DECLARE @CORR_MOCO NUMERIC(10),
		@CODI_CUCO VARCHAR(15),
		@FLAG_TICU VARCHAR(1),
		@MONT_DEBE NUMERIC(22,4),
		@MONT_HABE NUMERIC(22,4),
		@MONT_SALD NUMERIC(22,4),
		@CANT_MOVI NUMERIC(10)
		

/*Cursor para obtener todas las cuentas*/
DECLARE CUR_TOTA_MOCO CURSOR FOR
SELECT CODI_CUCO AS CODI_CUCO,
       FLAG_TICU AS FLAG_TICU,
       SUM(DEBE_COMO) AS MONT_DEBE,
       SUM(HABE_COMO) AS MONT_HABE,
       COUNT(CODI_CUCO) AS CANT_MOVI
  FROM LCE_MOVI_CONT	
 WHERE CORR_LIBR = @CORR_LIBR
   AND PERI_TRIB = @PERI_TRIB
   AND TIPO_LIBR = @TIPO_LIBR   
  and CODI_CUCO IN (SELECT DISTINCT(CODI_CUCO)
  FROM LCE_MOVI_CONT	
 WHERE CORR_LIBR = @CORR_LIBR
   AND PERI_TRIB = @PERI_TRIB
   AND TIPO_LIBR = @TIPO_LIBR)
GROUP BY CODI_CUCO,FLAG_TICU

SET @CODI_ERRO = 'N'
SET @MENS_ERRO = 'Proceso PRC_TOTA_MOCO Ejecutado OK'

OPEN CUR_TOTA_MOCO
	FETCH NEXT FROM CUR_TOTA_MOCO
		INTO @CODI_CUCO,@FLAG_TICU,@MONT_DEBE,@MONT_HABE,@CANT_MOVI	
		WHILE @@FETCH_STATUS=0
			BEGIN
				EXECUTE GET_CORR_MOCO @CORR_MOCO OUT
				
				IF @MONT_DEBE > @MONT_HABE
					SET @MONT_SALD = @MONT_DEBE - @MONT_HABE
				ELSE
					SET @MONT_SALD = @MONT_HABE - @MONT_DEBE
	
				INSERT INTO LCE_TOTA_MOCO(CORR_MOCO,CORR_LIBR,PERI_TRIB,TIPO_LIBR,
				CODI_CUCO,FLAG_TICU,CANT_MOVI,MONT_DEBE,MONT_HABE,MONT_SALD)
				VALUES(@CORR_MOCO,@CORR_LIBR,@PERI_TRIB,@TIPO_LIBR,@CODI_CUCO,
				@FLAG_TICU,@CANT_MOVI,@MONT_DEBE,@MONT_HABE,@MONT_SALD)			
			FETCH NEXT FROM CUR_TOTA_MOCO
				INTO @CODI_CUCO,@FLAG_TICU,@MONT_DEBE,@MONT_HABE,@CANT_MOVI
			END
CLOSE CUR_TOTA_MOCO
DEALLOCATE CUR_TOTA_MOCO
				
if (@@ERROR <> 0)
	BEGIN
	  	SET @CODI_ERRO = 'S'
		set @MENS_ERRO = 'Error: '+ convert(varchar, @@ERROR)
	END
END
GO

GO
--SqlScripter----[dbo].[PRC_VALO_CAM].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PRC_VALO_CAM]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_VALO_CAM] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_VALO_CAM]
AS
BEGIN

declare 
@p_tipo_mone varchar(15), 
@p_codi_empr numeric(9,0), 
@p_tipo_docu numeric(3,0),
@p_foli_docu numeric(10,0),
     @p_val9 varchar(300),
@p_valo_camb numeric(22,4)

--CURSOR busca los DTE con esta_docu = CAM
declare c_update_mone cursor for
		select a.codi_empr, a.tipo_docu, a.foli_docu, a.val9
		from dte_enca_docu a
		where a.esta_docu = 'CAM' and a.tipo_docu = 34
		

BEGIN TRANSACTION
			
           --operaciones sobre los montos y el estado del documento queda en ING
			OPEN c_update_mone
			FETCH NEXT FROM c_update_mone
			into @p_codi_empr, @p_tipo_docu, @p_foli_docu, @p_val9
			while @@FETCH_STATUS=0
			begin
			-------------------------------------------------------------------------------		
			if (@p_val9 != '')
			begin
			--buscar si encuentra el cambio de moneda para el dia, si es asi realizo la operacion, 
			--sino lo dejo como esta
			select @p_valo_camb = valo_camb, @p_tipo_mone = tipo_mone
			from camb_mone 
			where fech_camb in (select distinct(substring(Convert(varchar, getDate(),120),0,11))as fech_actual from dual)
			and tipo_mone=@p_val9
			group by valo_camb, tipo_mone
			print @p_valo_camb  
				
			update dte_enca_docu
			set	tipo_moom = @p_tipo_mone,
				tipo_camb = @p_valo_camb,
				neto_otmo = mont_neto,
				noaf_otmo = mont_exen,
				ivag_otmo = impu_vaag,
				mont_otmo = mont_tota,
				esta_docu = 'ING',
				mont_exen = mont_exen * @p_valo_camb,
				mont_neto = mont_neto * @p_valo_camb,
				impu_vaag = impu_vaag * @p_valo_camb,
				mont_tota = mont_tota * @p_valo_camb + mont_exen * @p_valo_camb
			where codi_empr = @p_codi_empr
			  and tipo_docu = @p_tipo_docu
			  and foli_docu = @p_foli_docu
		

			/*codi_mone = @p_tipo_mone, campo solo tiene 3 caracteres				
			ALTER TABLE dte_deta_prse
			ALTER COLUMN codi_mone varchar(15) NULL		
			estaba en varchar(3)*/ 

			update dte_deta_prse
			set prec_mono = prec_item,
				codi_mone = substring(@p_tipo_mone,1,3),
				prec_item = prec_item * @p_valo_camb,
				neto_item = neto_item * @p_valo_camb,
				fact_conv = @p_valo_camb,
				valo_mone = neto_item				
			where codi_empr = @p_codi_empr
			  and tipo_docu = @p_tipo_docu
			  and foli_docu = @p_foli_docu
			end
			-------------------------------------------------------------------------------
			if (@p_val9 = '' )
			begin
			update dte_enca_docu
			set	esta_docu = 'ING'
			where codi_empr = @p_codi_empr
			  and tipo_docu = @p_tipo_docu
			  and foli_docu = @p_foli_docu
			end
			-------------------------------------------------------------------------------
		 FETCH NEXT FROM c_update_mone
		 into @p_codi_empr, @p_tipo_docu, @p_foli_docu, @p_val9
	
         end --end while cursor
   
        CLOSE c_update_mone
		DEALLOCATE c_update_mone 

	 
	 

	if (@@ERROR = 0)
	begin
     	 COMMIT TRANSACTION
	end
	else
		ROLLBACK TRANSACTION

	

END
GO

GO
--SqlScripter----[dbo].[PrcAsigFolio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PrcAsigFolio]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PrcAsigFolio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PrcAsigFolio]
(
    @p_codi_empr Numeric(3), 
    @p_tipo_docu VarChar(3), 
    @p_codi_ceco VarChar(16), 
    @p_foli_docu Varchar(10) OutPut,
    @p_existe VarChar(1) OutPut,
    @p_mensaje VarChar(200) OutPut)
AS
BEGIN
DECLARE 
    @v_foli_desd numeric(10,0), 
    @v_foli_hast numeric(10,0),
    @v_corr_rafo numeric(18,0),
    @v_ulti_foli numeric(10,0),
    @v_cant_venc numeric(3,0)
 
    set @p_existe = 'S' 
    
    /* actualiza el esta_rafo a 'UTI', cuando el rango haya sido consumido por completo. */
    update dte_rang_foli set esta_rafo = 'UTI' where ulti_foli = foli_hast;
    
    /*Revisa si existe rango de Folio Valido y centro de costo*/
    update dte_rang_foli set ulti_foli=foli_desd-1 where ulti_foli is null

    select @v_foli_desd = a.foli_desd, 
           @v_foli_hast = a.foli_hast,
           @v_corr_rafo = a.corr_rafo,
           @v_ulti_foli = isnull(a.ulti_foli,0)
    from   dte_rang_foli a
    where  a.codi_empr=@p_codi_empr 
    and    a.tipo_dora=@p_tipo_docu
    and    a.esta_rafo='VAL' 
    and    a.corr_rafo=(select min(b.corr_rafo)
                        from   dte_rang_foli b where b.codi_empr=@p_codi_empr
                        and    b.tipo_dora=@p_tipo_docu
                        and    b.esta_rafo='VAL'
                        and    isnull(b.ulti_foli,b.foli_desd) < b.foli_hast)

    SELECT @v_cant_venc = ISNULL(VALO_PAEM,0)
    FROM   PARA_EMPR WITH (NOLOCK)
    WHERE  CODI_EMPR = @P_CODI_EMPR
    AND    CODI_PAEM = 'EECV'

    IF(@V_CANT_VENC >0 and @p_tipo_docu in (33,43,46,56,61))
    BEGIN
        SELECT count(*)
        FROM   DTE_RANG_FOLI a WITH (NOLOCK)
        WHERE  a.CODI_EMPR = @P_CODI_EMPR
        AND    a.TIPO_DORA = @P_TIPO_DOCU
        AND    a.ESTA_RAFO = 'DIG'
        AND    a.CORR_RAFO = @V_CORR_RAFO
        AND    ISNULL(a.ULTI_FOLI,0) + 1 <= a.FOLI_HAST
        and    (datediff(day,a.fech_venc,getdate())*-1) <= @v_cant_venc

        IF (@@ROWCOUNT = 0 )
        BEGIN
            SET @P_EXISTE = 'N' 
            SET @P_MENSAJE ='No se puede asignar folio, CAF vencido o próximo a vencer'
            ROLLBACK TRANSACTION
            RETURN
        END
    END

    begin
        select @p_foli_docu=isnull(a.ulti_foli,a.foli_desd)+1
        from   dte_rang_foli a
        where  a.codi_empr=@p_codi_empr 
        and    a.tipo_dora=@p_tipo_docu
        and    a.esta_rafo='VAL' 
        AND    a.corr_rafo=@v_corr_rafo
        and    isnull(a.ulti_foli,0) + 1 <= a.foli_hast
        and    (datediff(day,a.fech_venc,getdate())*-1)>=30

        IF (@@rowcount = 0 ) 
        begin
            set @p_existe = 'N' 
            set @p_mensaje ='No existe folio para asignar'
            return
        end
        ELSE
            update dte_rang_foli set ulti_foli=@p_foli_docu where corr_rafo=@v_corr_rafo
        end
        IF (@@ERROR <> 0 )
        begin
            set @p_existe = 'N' 
            set @p_mensaje ='No existe folio para asignar'
        return
    end
END;
GO

GO
--SqlScripter----[dbo].[PrcAsigFolioCafIngr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PrcAsigFolioCafIngr]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PrcAsigFolioCafIngr] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PrcAsigFolioCafIngr]
(
    @p_codi_empr Numeric(3),
    @p_tipo_docu VarChar(3),
    @p_codi_ceco VarChar(10),
    @p_fech_emis  VarChar(16),
    @p_foli_docu Varchar(10) OutPut,
    @p_existe VarChar(1) OutPut,
    @p_mensaje VarChar(200) OutPut)
AS
BEGIN
DECLARE 
    @v_corr_asig numeric(12,0),
    @v_foli_desd numeric(10,0),
    @v_foli_hast numeric(10,0),
    @v_corr_rafo numeric(18,0),
    @v_ulti_foli numeric(10,0),
    @v_cant_soli numeric(10,0),
    @v_foli_ini  numeric(10,0),
    @v_foli_fin  numeric(10,0),
    --@v_codi_unid numeric(6,0)
    @v_codi_unid  varchar(6),
    @v_caf_ingr  numeric(2),
    @v_rutt_emis numeric(11,0),
    @v_fecha_emis varchar(10),
    @v_comprobador numeric(10),
    @v_cant_venc numeric(3),
    @v_fech_venc datetime,
    @v_fech_emis datetime,
    @p_esta_rafo varchar(3),
    @p_folio numeric(10)
 
    set @p_existe = 'S' 
    set @v_cant_soli = 1000
    
    UPDATE DTE_RANG_FOLI
    SET ULTI_FOLI = FOLI_DESD - 1
    WHERE ULTI_FOLI IS NULL
    
    IF(@p_tipo_docu != '39' and @p_tipo_docu != '41')
    BEGIN
        BEGIN TRANSACTION
        BEGIN TRY
            /*Revisa si existe rango de Folio Valido y centro de costo*/
            SELECT @v_cant_venc = ISNULL(VALO_PAEM,0)
            FROM   PARA_EMPR WITH (NOLOCK)
            WHERE  CODI_EMPR = @p_codi_empr
            AND    CODI_PAEM = 'EECV'
            
            if @@rowcount=0
                set @v_cant_venc=0
        
            BEGIN
                select @v_fech_emis = convert(datetime, @p_fech_emis,120)
                if @@rowcount=0
                    select @v_fech_emis = getdate()
            END
            
            SELECT @V_CAF_INGR = PARAM_VALUE 
            FROM SYS_PARAM WITH (NOLOCK)
            WHERE PARAM_NAME = 'EGATE_CAF_INGR'
            iF(@@ROWCOUNT=0)
                set @v_caf_ingr=0
        
            IF (@V_CAF_INGR = 1)
            BEGIN
                SELECT @V_FOLI_DESD = RAN.FOLI_DESD,
                    @V_FOLI_HAST = RAN.FOLI_HAST,
                    @V_CORR_RAFO = RAN.CORR_RAFO,
                    @V_ULTI_FOLI = ISNULL(RAN.ULTI_FOLI,0)
                FROM DTE_RANG_FOLI RAN WITH (NOLOCK)
                WHERE RAN.CODI_EMPR=@P_CODI_EMPR
                AND RAN.TIPO_DORA=@P_TIPO_DOCU
                AND RAN.ESTA_RAFO='DIG'
                AND RAN.CAF_INGR = 1
                AND RAN.CORR_RAFO=( SELECT MIN(CORR_RAFO)
                                    FROM DTE_RANG_FOLI WITH (NOLOCK)
                                    WHERE CODI_EMPR=@P_CODI_EMPR 
                                    AND TIPO_DORA=@P_TIPO_DOCU
                                    AND ESTA_RAFO='DIG'
                                    AND ISNULL(ULTI_FOLI,FOLI_DESD) < FOLI_HAST)
                GROUP BY RAN.FOLI_DESD, RAN.FOLI_HAST, RAN.CORR_RAFO, RAN.ULTI_FOLI
             
                SELECT @P_FOLI_DOCU = ISNULL(ULTI_FOLI,FOLI_DESD)+1
                FROM DTE_RANG_FOLI WITH (NOLOCK)
                WHERE CODI_EMPR=@P_CODI_EMPR 
                AND TIPO_DORA=@P_TIPO_DOCU
                AND ESTA_RAFO='DIG'
                AND CORR_RAFO=@V_CORR_RAFO
                AND ISNULL(ULTI_FOLI,0) + 1 <= FOLI_HAST
                
                /* IF 1 */ 
                IF (@@ROWCOUNT = 0 )
                BEGIN
                    SET @P_EXISTE = 'N' 
                    SET @P_MENSAJE ='No existe folio para asignar'
                    ROLLBACK TRANSACTION
                    RETURN
                END
                ELSE
                BEGIN
                    if(@v_cant_venc > 0 and @p_tipo_docu in (33,43,46,56,61))
                    BEGIN
                        SELECT top 1 @v_fech_venc = fech_venc,
                                    @p_esta_rafo = esta_rafo
                        FROM   dte_rang_foli a WITH(NOLOCK)
                        WHERE  a.codi_empr = @p_codi_empr
                        AND    a.tipo_dora = @p_tipo_docu
                        AND    a.esta_rafo = 'DIG'
                        AND    a.CAF_INGR = 1
                        AND    @P_FOLI_DOCU between a.FOLI_DESD and a.FOLI_HAST
                        AND    datediff(day,@v_fech_emis,a.fech_venc) <= @v_cant_venc
                        
                        if @@rowcount>0
                        BEGIN
                            if(@v_fech_emis >= @v_fech_venc)
                            BEGIN
                                SET @P_EXISTE = 'N'
                                SET @P_MENSAJE = 'ECV - No se puede asignar folio, CAF vencido'
                                ROLLBACK TRANSACTION
                                return
                            END
                            else
                            BEGIN
                                SET @P_EXISTE = 'N'
                                SET @P_MENSAJE = 'EPV - No se puede asignar folio, próximo a vencer: '+ substring(convert(varchar,@v_fech_venc,120),1,10)
                                ROLLBACK TRANSACTION
                                return
                            END
                        END
                    END
                    UPDATE DTE_RANG_FOLI SET ULTI_FOLI = @P_FOLI_DOCU WHERE CORR_RAFO = @V_CORR_RAFO
                END/* FIN IF 1*/
        
                /* IF 2 */
                IF (@@ERROR <> 0 )
                BEGIN
                    SET @P_EXISTE = 'N' 
                    SET @P_MENSAJE = 'No existe folio para asignar'
                    ROLLBACK TRANSACTION
                    RETURN
                END
                ELSE
                BEGIN
                    SELECT    @V_RUTT_EMIS = RUTT_EMPR 
                    FROM    EMPR WITH (NOLOCK)
                    WHERE    CODI_EMPR = @P_CODI_EMPR
                    /* IF 3 */
                    IF(@V_RUTT_EMIS <> 0)
                    BEGIN
                        IF (@P_TIPO_DOCU not in (39,41))
                        BEGIN
                            SELECT @v_comprobador = COUNT(*) FROM DTE_ENCA_DOCU WHERE FOLI_DOCU = @P_FOLI_DOCU AND TIPO_DOCU = @P_TIPO_DOCU AND CODI_EMPR = @P_CODI_EMPR
                            /* IF 4 */
                            IF(@v_comprobador = 0)
                            BEGIN
                                INSERT INTO DTE_ENCA_DOCU(CODI_EMPR, RUTT_EMIS, RUTT_RECE, TIPO_DOCU, FOLI_DOCU, ESTA_DOCU, CORR_RAFO, FECH_EMIS, MONT_NETO, MONT_TOTA, DIGI_RECE, DIGI_EMIS, NOMB_RECE, giro_rece, dire_rece, comu_rece)
                                VALUES(@P_CODI_EMPR, @V_RUTT_EMIS, @V_RUTT_EMIS, @P_TIPO_DOCU, @P_FOLI_DOCU, 'PEN', @V_CORR_RAFO, '2011-01-01', 0 ,0, '0', '0', '---', 'giro_emis', 'Dire_rece', 'Comu_rece')
                            END
                            ELSE
                            BEGIN
                                SET @P_EXISTE = 'N' 
                                SET @P_MENSAJE ='El folio que intenta registrar, ya se encuentra utilizado. \n Contactar con el Administrador.'
                                ROLLBACK TRANSACTION
                                RETURN
                            END/* IF 4 */
                            IF (@@ROWCOUNT = 0) 
                            BEGIN
                                SET @P_EXISTE = 'N' 
                                SET @P_MENSAJE ='Se ha producido un error en la generación de cabecera.'
                                ROLLBACK TRANSACTION
                                RETURN
                            END
                            ELSE
                            BEGIN
                                COMMIT
                            END/* Fin IF 4 */
                        END
                        ELSE
                        BEGIN
                            COMMIT
                        END
                    END
                    ELSE
                    BEGIN
                        SET @P_EXISTE = 'N' 
                        SET @P_MENSAJE ='La empresa no tiene rut asociado.'
                        ROLLBACK TRANSACTION
                        RETURN
                    END/* FIN IF 3 */
                END/* FIN IF 2 */
            END
            ELSE
            BEGIN
                SET @P_EXISTE = 'N' 
                SET @P_MENSAJE = 'campo caf_ingr con valor 0'
                ROLLBACK TRANSACTION
                RETURN
            END/*FIN V_CAF_INGR=1*/ 
        END TRY
        BEGIN CATCH
            ROLLBACK TRANSACTION
            SET @P_EXISTE = 'N'
            SET @P_MENSAJE ='Se ha producido un error en la generación de Folio. ' + SUBSTRING(ERROR_MESSAGE(),1,1000)
        END CATCH 
    END
    ELSE
    BEGIN
        SET @P_EXISTE = 'N'
           SET @P_MENSAJE ='Tipo de documento no habilitado para este digitador.'    
    END/*IF TIPO_DOCU != 39 y 41*/
END
GO

GO
--SqlScripter----[dbo].[PrcLogErro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[PrcLogErro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PrcLogErro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PrcLogErro]
(
	@p_codi_empr numeric(9),
	@p_proc_erro varchar(50), 
	@p_msaj_erro varchar(150), 
	@p_bin_erro varchar(50),
	@p_mensaje varchar(200) OutPut)
AS
BEGIN
DECLARE 
	@v_corr_logg numeric(22,0), 
	@v_proc_erro varchar(50), 
	@v_msaj_erro varchar(150), 
	@v_fech_erro varchar(10),
	@v_hora_erro varchar(50),
	@v_binn_erro varchar(50),
	@v_codi_empr numeric(9,0),
	@v_arch_erro varchar(300)

BEGIN 
		select @v_corr_logg = isnull(max(corr_logg)+1,1) from log_erro
		select @v_fech_erro = convert(char(10), getdate(), 120)
		select @v_hora_erro = convert(char(5),getdate(),8)
	BEGIN
		insert into log_erro (corr_logg, proc_erro, msaj_erro,
							  fech_erro, hora_erro, binn_erro, 
							  codi_empr, arch_erro)
		values (@v_corr_logg, substring(@p_proc_erro,0,50), substring(@p_msaj_erro,0,150),
				@v_fech_erro, @v_hora_erro,  substring(@p_bin_erro,0,50),
				@p_codi_empr ,'-')
	END
	    if (@@ERROR = 0)
			begin
				
				
				set @p_mensaje ='Log registrado en base de datos.'
				return
			end
		else
			begin
					
				set @p_mensaje ='No se guardaron datos en tabla log_erro'
				return
			end
	
END
END
GO

GO
--SqlScripter----[dbo].[prd_dte_tipo_refe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prd_dte_tipo_refe]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prd_dte_tipo_refe] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prd_dte_tipo_refe]
@p_tipo_refe varchar(3),
        @p_existe   varchar(1) output,
        @p_mensaje  varchar(80) output
AS
declare @tipo varchar(3)
declare @numer numeric(3)
BEGIN
 if substring(@p_tipo_refe,1,1) IN ('0','1','2','3','4' ,'5', '6', '7','8', '9' )
  BEGIN 
	select @numer = convert(numeric,@p_tipo_refe)

	if @@ERROR <> 0
		 select  @tipo=tipo_docu 
		 from dte_tipo_docu
		 where tipo_docu = @numer and docu_refe = 'S';
	else
	begin
		set @p_existe = 'N'
  		set @p_mensaje = 'Tipo Valido'
  	end
  END
  set @p_existe = 'N'
  set @p_mensaje = 'Tipo Valido'
  if (@p_tipo_refe is null) or (rtrim(@p_tipo_refe) = ' ')
    begin
      set @p_mensaje = 'Tipo de Documento no valido'
      set @p_existe  ='S'
    end
END
GO

GO
--SqlScripter----[dbo].[put_email].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[put_email]') IS NULL EXEC('CREATE PROCEDURE [dbo].[put_email] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[put_email]
@P_MTOD_FROM  VARCHAR(400),
        @P_MTOD_TO  VARCHAR(400), @P_MTOD_CC VARCHAR(400),
        @P_MTOD_SUBJECT VARCHAR(2000),
        @P_MTOD_TEXT  VARCHAR(2000), @P_MTOD_ID numeric(18) output
   AS
begin
--SP1 SE 5.2
    insert into MTOD (  MTOD_FROM, MTOD_TO, MTOD_CC, 
            MTOD_SUBJECT,MTOD_TEXT, MTOD_ENVIO, MTOD_STAT)
    values (@P_MTOD_FROM, @P_MTOD_TO, @P_MTOD_CC,
            @P_MTOD_SUBJECT,@P_MTOD_TEXT, GETDATE(), 'P')
    SELECT @P_MTOD_ID=IDENT_CURRENT('mtod')
end
GO

GO
--SqlScripter----[dbo].[start_alarma].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[start_alarma]') IS NULL EXEC('CREATE PROCEDURE [dbo].[start_alarma] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[start_alarma]
AS
BEGIN
	declare
		@fecha datetime,
		@p_erro			varchar(1),
		@p_mens			varchar(200);

--SP1 SE 5.2
	set @p_erro='S';
	begin tran
	select @fecha=getdate()	
	execute alar_ejec_holding @fecha, @p_erro output, @p_mens output
	execute alar_ejec_empresa @fecha, @p_erro output, @p_mens output
	execute sys_alar_foli @fecha
	if @p_erro = 'S'
	begin
		commit tran;
	end
	else
	begin
		rollback tran;
	end
END
GO

GO
--SqlScripter----[dbo].[sys_alar_foli].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sys_alar_foli]') IS NULL EXEC('CREATE PROCEDURE [dbo].[sys_alar_foli] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[sys_alar_foli]
(@p_fech_alar datetime)
    -- Add the parameters for the stored procedure here
AS
BEGIN
print 'inicio procedimiento'
    declare cSysAlarEmpr cursor FOR
        select    sae.codi_emex, sae.codi_empr, sa.indi_alar, sa.comp_alar, sa.valo_alar,    sa.sqli_alar, sa.sqld_alar,    sa.codi_alar, sa.frec_alar
        from    sys_alar_empr sae,    sys_alar sa
        where    sa.codi_alar    =    sae.codi_alar and        sae.esta_alar    =    'ACTIVADA' and        sae.codi_alar    =    'STOCKFOLI';
    declare cTipoDocu cursor for 
        select tipo_docu , desc_tido from dte_tipo_docu where codi_emex = 'PROD_0000';

    declare @nTipoDocu int,                    @nFoliDesd int, 
            @nFoliHast int,                    @sCodiEmex varchar(30),
            @nCodiEmpr int,                    @nIndiAlar int,
            @sCompAlar varchar(3),            @nValoAlar int,
            @nMaxFoliDocu int,                @nCantFoliDesd int,
            @nCantFoliHast int,                @sQuery varchar(2000),
            @p_stat varchar(100),            @p_valo_alar1 varchar(100),
            @p_erro_alar varchar(200),        @p_stat_alar varchar(100),
            @sSqliAlar varchar(2000),        @sSqldAlar varchar(2000),
            @sCodiAlar varchar(100),        @sCodiUsua varchar(100),
            @p_nume_regi varchar(100),        @p_fesi_alar datetime,
            @p_erro_alar1    varchar(300),    @FECH_ALAR datetime,
            @FREC_ALAR varchar(100),        @existe varchar(100),
            @mensaje varchar(100),            @pDescTido varchar(200),
            @pSqliAlar varchar(2000),        @pSqldAlar varchar(2000),
            @s_erro_alar varchar(2)
    OPEN cSysAlarEmpr
        FETCH NEXT FROM cSysAlarEmpr INTO @sCodiEmex, @nCodiEmpr, @nIndiAlar, @sCompAlar, @nValoAlar, @sSqliAlar, @sSqldAlar, @sCodiAlar,@FREC_ALAR
        WHILE @@FETCH_STATUS = 0
            BEGIN

				UPDATE    SYS_ALAR_EMPR SET
						valo_alar = @nValoAlar,
						fesi_alar = @p_fesi_alar,
						fech_alar = @p_fech_alar,
						stat_alar = 'NORMAL',
						erro_alar = @s_erro_alar
				WHERE    codi_alar =    @sCodiAlar 
				AND        codi_emex = @sCodiEmex
				AND        codi_empr = @nCodiEmpr
                        
			
                OPEN cTipoDocu
                    FETCH NEXT FROM cTipoDocu INTO @nTipoDocu, @pDescTido
                    WHILE @@FETCH_STATUS = 0
                    BEGIN
                        print '************************Inicio Alarma por TipoDocu************************'
                        set @pSqliAlar = @sSqliAlar
                        set @pSqldAlar = @sSqldAlar
                        set @nValoAlar = 0
                        set @nCantFoliHast = 0
                        set @nCantFoliDesd = 0

                        print '*******************'
                        print 'TipoDocu: '+ convert(varchar,@nTipoDocu)
                        print 'CodiEmpr: '+ convert(varchar,@nCodiEmpr)
                        print 'CodiEmex: '+ convert(varchar,@sCodiEmex)
                        print '*******************'

                        --Select de rango de folio
                        select    @nCantFoliDesd = foli_desd, @nCantFoliHast = foli_hast
                        from    dte_rang_foli
                        where    codi_empr = @nCodiEmpr
                        and        foli_hast = (    select    max(foli_hast) 
                                                from    dte_rang_foli 
                                                where    tipo_dora = @nTipoDocu 
                                                and        codi_empr = @nCodiEmpr
                                                and        codi_emex = @sCodiEmex)
                        and        codi_emex = @sCodiEmex
                        and        tipo_dora = @nTipoDocu

                        --Folio maximo en DTE_ENCA_DOCU
                        select @nMaxFoliDocu = max(foli_docu)
                        from dte_enca_docu
                        where tipo_docu = @nTipoDocu
                        and codi_empr = @nCodiEmpr
                        and codi_emex = @sCodiEmex
                        --Valida que el folio no sea nulo
                        if(@nMaxFoliDocu is null)
                            set @nMaxFoliDocu = 0
                        --Valida que el folio hasta no sea nulo
                        if(@nCantFoliHast is null)
                            set @nCantFoliHast = 0

                        print '    @nMaxFoliDocu ' + convert(varchar,@nMaxFoliDocu)
                        print '    @nCantFoliHast ' + convert(varchar,@nCantFoliHast)
                        if(@nCantFoliHast = 0)
                            set @nValoAlar = 0
                        else
                            set @nValoAlar = (@nMaxFoliDocu * 100) / @nCantFoliHast
                        
                        if(@nCantFoliHast <> 0)
                            begin
                                print '    @nValoAlar ' + convert(varchar,@nValoAlar)
                                --set @sQuery = 'select count(*) from dual where ';
                                --set @sQuery = @sQuery + convert(varchar, @nValoAlar)+ @sCompAlar + convert(varchar, @nIndiAlar);
                                --print '    @sQuery: ' + @sQuery;
                        
                                ----ejecuta la query para obtener el valor
                                --execute alar_sql_dyn @sQuery, @p_valo_alar1 output, @p_stat output, @p_erro_alar output
                                --entrega la fecha siguiente
                                execute alar_fech_sigu @FECH_ALAR, @FREC_ALAR, @p_fesi_alar output, @existe output, @mensaje output    
                                set @sCodiUsua = '*'

                                if(@nValoAlar is null)-- or (@nValoAlar = '')
                                    begin
                                        print ('is null @nValoAlar'); 
                                        set @nValoAlar = 0 
                                    end
                                
                                if convert(int,@nValoAlar) <= @nIndiAlar
                                    begin
                                        set @p_stat_alar = 'NORMAL'
                                        set @s_erro_alar = 'S'
                                        print '            @nValoAlar '+convert(varchar,@nValoAlar)
                                        print '            @nIndiAlar '+convert(varchar,@nIndiAlar)
                                        print '            normal'

                                        if @pSqldAlar <> ''
                                            begin
                                                print '            Elimina Registros del TipoDocu: '+convert(varchar,@nTipoDocu)
                                                set @pSqldAlar = replace(@pSqldAlar, 'holding',@sCodiEmex);
                                                set @pSqldAlar = replace(@pSqldAlar, 'empresa',@nCodiEmpr);
                                                set @pSqldAlar = replace(@pSqldAlar, 'usuario',@sCodiUsua);
                                                set @pSqldAlar = replace(@pSqldAlar, 'alarma' ,@sCodiAlar);
                                                set @pSqldAlar = replace(@pSqldAlar, 'tipo_docu' ,@nTipoDocu);
                                                print '            '+@pSqldAlar
                                                execute alar_sql_dyn @pSqldAlar, @p_nume_regi output, @p_stat output, @p_erro_alar output
                                            end
                                    end
                                else --else p_valo_alar
                                    begin
                                        print '            else'
                                        set @p_stat_alar = 'ANORMAL'
                                        set @s_erro_alar = 'N'
                                        if @pSqldAlar <> ''
                                            begin
                                                print '            Elimina Registros del TipoDocu: '+convert(varchar,@nTipoDocu)
                                                set @pSqldAlar = replace(@pSqldAlar, 'holding',@sCodiEmex);
                                                set @pSqldAlar = replace(@pSqldAlar, 'empresa',@nCodiEmpr);
                                                set @pSqldAlar = replace(@pSqldAlar, 'usuario',@sCodiUsua);
                                                set @pSqldAlar = replace(@pSqldAlar, 'alarma' ,@sCodiAlar);
                                                set @pSqldAlar = replace(@pSqldAlar, 'tipo_docu' ,@nTipoDocu);
                                                print '            '+@pSqldAlar
                                                execute alar_sql_dyn @pSqldAlar, @p_nume_regi output, @p_stat output, @p_erro_alar output
                                            end
                                        if @pSqliAlar <> ''
                                            begin
                                                print '            Inserta Registros del TipoDocu: '+convert(varchar,@nTipoDocu)
                                                set @pSqliAlar = replace(@pSqliAlar, 'holding',@sCodiEmex);
                                                set @pSqliAlar = replace(@pSqliAlar, 1010,@nCodiEmpr);
                                                set @pSqliAlar = replace(@pSqliAlar, 'usuario',@sCodiUsua);
                                                set @pSqliAlar = replace(@pSqliAlar, 'cant_foli', @nValoAlar);
                                                set @pSqliAlar = replace(@pSqliAlar, 'tipo_docu', @nTipoDocu);
                                                set @pSqliAlar = replace(@pSqliAlar, 'desc_tido', @pDescTido);
                                                print '            '+@pSqliAlar
                                                execute alar_sql_dyn @pSqliAlar, @p_nume_regi output, @p_stat output, @p_erro_alar output
                                            end
											
										UPDATE    SYS_ALAR_EMPR SET
												valo_alar = @nValoAlar,
												fesi_alar = @p_fesi_alar,
												fech_alar = @p_fech_alar,
												stat_alar = @p_stat_alar,
												erro_alar = @s_erro_alar
										WHERE    codi_alar =    @sCodiAlar 
										AND        codi_emex = @sCodiEmex
										AND        codi_empr = @nCodiEmpr
											
                                    end --Termino else


                        end --fin @nCantFoliHast
                        
                        /* actualizo fecha de ejecución */
                        execute alar_fech_sigu @p_fech_alar, @FREC_ALAR, @p_fesi_alar output, @existe output, @mensaje output    
                        print '**************************Fin Alarma por TipoDocu*************************'
                        FETCH NEXT FROM cTipoDocu into @nTipoDocu, @pDescTido
                    END
                CLOSE cTipoDocu;

                FETCH NEXT FROM cSysAlarEmpr INTO @sCodiEmex, @nCodiEmpr, @nIndiAlar, @sCompAlar, @nValoAlar, @sSqliAlar, @sSqldAlar, @sCodiAlar,@FREC_ALAR
            END
    CLOSE cSysAlarEmpr;
    
    DEALLOCATE cTipoDocu;
    DEALLOCATE cSysAlarEmpr;
END
GO

GO
--SqlScripter----[dbo].[temp_usua].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[temp_usua]') IS NULL EXEC('CREATE PROCEDURE [dbo].[temp_usua] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[temp_usua]
AS
begin
insert into temp (usuario)
values (USER)
end
GO
