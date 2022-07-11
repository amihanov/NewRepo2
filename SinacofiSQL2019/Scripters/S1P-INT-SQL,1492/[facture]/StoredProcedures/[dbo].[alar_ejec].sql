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
