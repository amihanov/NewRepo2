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
