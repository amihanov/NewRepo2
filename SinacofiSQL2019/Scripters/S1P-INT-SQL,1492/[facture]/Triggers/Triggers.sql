
GO
--SqlScripter----[dbo].[dbnet_comandos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbnet_comandos]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[dbnet_comandos]')
GO
CREATE TRIGGER [dbo].[dbnet_comandos]
ON dbnet_server 
FOR INSERT
AS
declare 
@cmd varchar(250),
@par  varchar(250)
begin
	select @cmd=comando, @par=parametros from inserted
	exec dbnet_cmd @cmd,@par
end
GO

GO
--SqlScripter----[dbo].[dte_enca_docu_servicios].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_enca_docu_servicios]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[dte_enca_docu_servicios]')
GO
CREATE TRIGGER [dbo].[dte_enca_docu_servicios]
ON [dbo].[dte_enca_docu] for insert, update 
as
begin
declare
    @v_codi_serv  varchar(30),
    @v_esta_reto  varchar(30),
    @v_imprime    varchar(10),
    @v_esta_docu  varchar(3),
    @v_codi_empr  numeric(9),
    @v_tipo_docu  numeric(3),
    @v_foli_docu  numeric(10),
    @v_codi_emex  varchar(30), 
    @v_corr_envi  numeric(22),
    @v_esta_docu1 VARCHAR(3),
    @v_lote_docu  VARCHAR(10),
    @existe       numeric(6),
    @v_idCana       numeric(10),
    @v_existe_impr numeric(6),
    @v_nomb_cana  varchar(10),
    @v_impr_dest  varchar(100),
    @v_anula_impr varchar(1),
    @v_mens_esta  VARCHAR(200),
    @v_docu_elec  varchar(2),
    @v_corr_rafo  varchar(20),
    @v_ult_foli   varchar(10),
    @v_fech_emis  varchar(10),
    @mensaje    varchar(2000),
    @cod_error   varchar(10),
    @res         varchar(10),
    @v_esta_temp varchar(3),
    @v_valo_def_impr VARCHAR(1),
	@v_param_value VARCHAR(1)

    if (UPDATE(esta_docu))
    BEGIN
        select @v_esta_docu = esta_docu,
        @v_codi_empr = codi_empr,
        @v_tipo_docu = tipo_docu,
        @v_foli_docu = foli_docu,
        @v_corr_envi = corr_envi,
        @v_esta_docu1 = esta_docu1,
        @v_lote_docu =  lote_docu,
        @v_codi_emex =  codi_emex,
        @v_impr_dest = impr_dest,
        @v_mens_esta =  mens_esta,
        @v_fech_emis = fech_emis
        from inserted

        --Valida rango de Folios
        if @v_esta_docu in('ING','ERA')
        begin
            execute @res= dte_chec_rang_foli @v_codi_empr,@v_tipo_docu,
                            @v_corr_rafo output, @v_foli_docu, @v_fech_emis, @v_ult_foli output,
                            @cod_error output, @mensaje output
            if @cod_error = 'S'
            begin
                set @v_esta_temp = substring(@mensaje, 1, 3)
                print('---> @v_esta_temp:' + @v_esta_temp)
                
                if (@v_esta_temp ='ECV' or @v_esta_temp='EPV')
                    set @v_esta_docu=@v_esta_temp
            end
        end

        if @v_esta_docu in('ING','ERA')
        BEGIN
			select @v_valo_def_impr = param_value 
            FROM   sys_param WITH (NOLOCK)
            where  PARAM_NAME ='EGATE_DEF_IMPR'

            if isnull(@v_valo_def_impr,'0') = '1'
            BEGIN
                select @v_impr_dest=IMPR_DEST
                from   dte_def_impr WITH (NOLOCK)
                where  codi_empr = @v_codi_empr 
                and    tipo_docu = @v_tipo_docu;

                update dte_enca_docu 
                set    impr_dest = @v_impr_dest
                where  codi_empr = @v_codi_empr
                and    tipo_docu = @v_tipo_docu
                and    foli_docu = @v_foli_docu;
            END
			
			set @v_nomb_cana=''
            select @existe=count(codi_serv)
            from   qse_docu_serv WITH (NOLOCK)
            where  codi_emex=@v_codi_emex
            and    codi_empr=@v_codi_empr
            and    TIPO_DOCU=@v_tipo_docu
            AND    FOLI_DOCU=@v_foli_docu
            and    CODI_SERV='dte_gen_pdf'
            AND    ESTA_PROC='ING'

            /*si viene impresora sino por defecto*/
            if isnull(@v_impr_dest,'') = ''
            BEGIN
                select @v_impr_dest=valo_paem
                from para_empr WITH (NOLOCK)
                where codi_empr=@v_codi_empr
                and codi_paem='EGCI'
            END

            select TOP 1 @v_existe_impr=count(nomb_cana) 
            from   dbq_cana WITH (ROWLOCK)
            where  serv_cana = @v_impr_dest
            and    tran_cana = 'GNPDF'

			if @v_existe_impr = 0
			BEGIN					
				set @v_nomb_cana = 'IMPRESORA NUEVA'
			END
			ELSE
			BEGIN						 																		 
				select TOP 1 @v_nomb_cana=nomb_cana
				from   dbq_cana
				where  serv_cana= @v_impr_dest
				and    tran_cana = 'GNPDF'															
			END			
			
            set @v_anula_impr = '0';
            select @v_anula_impr = param_value 
            from   sys_param WITH(NOLOCK)
            where  param_name = 'EGATE_ANULA_IMPR';
			
            if (@existe=0)
            BEGIN
                insert into qse_docu_serv(CODI_SERV,     CODI_EMEX,         CODI_EMPR,
                                        TIPO_DOCU,       FOLI_DOCU,         ESTA_PROC ,
                                        TIME_PROC ,      CANT_PROC,         CODI_DOCU,
                                        TABL_ORIG,       VALO_PK1,          VALO_PK2,
                                        VALO_PK3,        VALO_PK4,          VALO_PK5,
                                        TABL_ESTA,       FLAG_DOCU)
                                values ('dte_gen_pdf',   @v_codi_emex,      @v_codi_empr,
                                        @v_tipo_docu,    @v_foli_docu,      'ING',
                                        GETDATE(),       0,                 'DTE',
                                        'DTE_ENCA_DOCU', @v_codi_emex,      @v_codi_empr,
                                        @v_tipo_docu,    @v_foli_docu,      @v_lote_docu, 
                                        @v_nomb_cana,    @v_anula_impr)
            END
        END

        select @v_docu_elec = isnull(docu_elec, 'N')
        from   dte_tipo_docu WITH (NOLOCK)
        where  tipo_docu = @v_tipo_docu

        if @v_esta_docu in('ING','ERA') and @v_docu_elec = 'S'
        BEGIN
            print '---> dte_gen_xml'
            set @v_codi_serv='dte_gen_xml'
            set @v_esta_reto='XML'
        END
		
		if @v_esta_docu in('REV')
		BEGIN
			/*verificar que exista folioERP*/
			 select @v_param_value=param_value
			 from sys_param
			 where param_name='FOLIO_EPR'

			if @v_param_value in ('1')
			BEGIN
				set @v_codi_serv='dte_veri_docu'
				set @v_esta_reto='FolioERP'
			END					
		END

        if @v_esta_docu in('XML') and @v_corr_envi is NULL and @v_docu_elec = 'S'
        BEGIN
            print '---> dte_envi_sii'
            set @v_codi_serv='dte_envi_sii'
            set @v_esta_reto='ESG'
        END

        if @v_esta_docu in('DOK','RLV','RPR') and @v_esta_docu1 is NULL and @v_docu_elec = 'S'
        BEGIN
            print '---> dte_envi_clie'
            set @v_codi_serv='dte_envi_clie'
            set @v_esta_reto='ECG'
        END

        if @v_esta_docu in ('ING') and @v_docu_elec = 'N'
        BEGIN
            update dte_enca_docu
            set esta_docu = 'DOK'
            where  codi_empr = @v_codi_empr
            and    tipo_docu = @v_tipo_docu
            and    foli_docu = @v_foli_docu
            and    codi_emex = @v_codi_emex

            print '---> dte_envi_clie - EPR'
            set @v_codi_serv='dte_envi_clie'
            set @v_esta_reto='EPR'
        END

        /*Para sacar de la Cola de Espera los Documentos que estan 
          aprobados por el SII*/
        if @v_esta_docu in('DOK','RLV','RPR')
        BEGIN
            delete from qse_docu_serv
            where  codi_emex=@v_codi_emex
            and    codi_empr=@v_codi_empr
            and    TIPO_DOCU=@v_tipo_docu
            AND    FOLI_DOCU=@v_foli_docu
            and    CODI_SERV='dte_envi_sii'
            AND    ESTA_PROC IN ('ESP','ERN','ERR')
        END

        if @v_esta_docu in('RCH')
        BEGIN
            Update qse_docu_serv
                   set esta_proc = 'ERN',
                   ulti_erro = @v_mens_esta
            where codi_emex=@v_codi_emex
            and codi_empr=@v_codi_empr
            and TIPO_DOCU=@v_tipo_docu
            AND  FOLI_DOCU=@v_foli_docu
            and CODI_SERV='dte_envi_sii'
            AND ESTA_PROC='ESP'
        END

        if LEN(@v_codi_serv) >0
        BEGIN
            select @existe=count(codi_serv) 
            from   qse_docu_serv WITH (NOLOCK)
            where  codi_emex=@v_codi_emex
            and    codi_empr=@v_codi_empr
            and    TIPO_DOCU=@v_tipo_docu
            AND    FOLI_DOCU=@v_foli_docu
            and    CODI_SERV=@v_codi_serv
            AND    ESTA_PROC='ING'

            if @existe=0
            BEGIN
                insert into qse_docu_serv(CODI_SERV ,      CODI_EMEX,    CODI_EMPR,
                                          TIPO_DOCU,       FOLI_DOCU,    ESTA_PROC,
                                          TIME_PROC ,      CANT_PROC ,   CODI_DOCU,
                                          TABL_ORIG,       VALO_PK1,     VALO_PK2,
                                          VALO_PK3,        VALO_PK4,     VALO_PK5,
                                          TABL_ESTA)
                                   values(@v_codi_serv,    @v_codi_emex, @v_codi_empr,
                                          @v_tipo_docu,    @v_foli_docu, 'ING',
                                          GETDATE(),       0,            'DTE',
                                          'DTE_ENCA_DOCU', @v_codi_emex, @v_codi_empr,
                                          @v_tipo_docu,    @v_foli_docu, @v_lote_docu,
                                          @v_esta_reto)
            END
        END
    END

    if UPDATE(esta_docu1)
    BEGIN
        select @v_esta_docu = esta_docu,
        @v_codi_empr = codi_empr,
        @v_tipo_docu = tipo_docu,
        @v_foli_docu = foli_docu,
        @v_corr_envi = corr_envi,
        @v_esta_docu1 = isnull(esta_docu1,'*'),
        @v_lote_docu =  lote_docu,
        @v_codi_emex =  codi_emex,
        @v_mens_esta =  mens_envi
        from inserted

        if @v_esta_docu1 in('DOK','ACC','ACD')
        BEGIN
            delete from qse_docu_serv 
            where codi_emex=@v_codi_emex
            and codi_empr=@v_codi_empr
            and TIPO_DOCU=@v_tipo_docu
            AND  FOLI_DOCU=@v_foli_docu
            and CODI_SERV='dte_envi_clie'
            AND ESTA_PROC IN ('ESP','ERN')
        END
        if @v_esta_docu1 in('ROC','FRM','ER2','ER3','ER4','ERR') 
        BEGIN
            Update qse_docu_serv set esta_proc ='ERN',
            Ulti_erro=@v_mens_esta
            where codi_emex=@v_codi_emex
            and codi_empr=@v_codi_empr
            and TIPO_DOCU=@v_tipo_docu
            AND  FOLI_DOCU=@v_foli_docu
            and CODI_SERV='dte_envi_clie'
            AND ESTA_PROC='ESP'
        END
    END
end
GO

GO
--SqlScripter----[dbo].[dto_enca_docu_preci_auto].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dto_enca_docu_preci_auto]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[dto_enca_docu_preci_auto]')
GO
CREATE TRIGGER [dbo].[dto_enca_docu_preci_auto]
ON [dbo].[dto_enca_docu_p] for INSERT--, UPDATE
AS  
DECLARE 
	@v_codi_serv varchar(30),
	@v_codi_serv1 varchar(30),
	@v_esta_reto varchar(30),
	@v_insertar numeric(1),
	@v_codi_esap VARCHAR(3),
	@v_codi_emex VARCHAR(30),
	@v_corr_docu NUMERIC(18),
	@v_corr_envi NUMERIC(22),
	@v_codi_empr NUMERIC(9),
	@v_tipo_docu NUMERIC(3),
	@v_foli_docu NUMERIC(10),
	@v_codi_reme varchar(10),
	@v_codi_docu varchar(100),
	@v_esta_docu VARCHAR(3),
	@v_usua_reme varchar (30)

--SP1 SE 5.2

BEGIN
	SELECT
		@v_codi_emex = codi_emex, 
		@v_corr_docu = corr_docu,
		@v_corr_envi = corr_envi, 
		@v_codi_empr = codi_empr, 
		@v_codi_esap = codi_esap,
		@v_tipo_docu = tipo_docu,
		@v_foli_docu = foli_docu,
		@v_esta_docu = esta_docu,
		@v_codi_reme = codi_reme,
		@v_usua_reme = usua_reme
		FROM  INSERTED
		
	-- CRM AUTOMATICO, SP1 SE 5.2
	IF UPDATE (esta_docu)
	BEGIN
	
		DECLARE  @p_valor varchar(10), @p_existe varchar(1), @p_mensaje varchar(256), @v_para_egre varchar(30)
		execute PARA_GET_VAL 'CRM_AUTO', @p_valor output, @p_existe output, @p_mensaje output
		
		if (isnull(@p_valor,'N') = 'S' and @v_codi_reme is null)
		BEGIN
			print 'CRM Automatico Activado'
			
			SELECT	@v_codi_emex = codi_emex, 
				@v_corr_docu = corr_docu,
				@v_corr_envi = corr_envi, 
				@v_codi_empr = codi_empr, 
				@v_esta_docu = esta_docu,
				@v_tipo_docu = tipo_docu,
				@v_foli_docu = foli_docu
			FROM  INSERTED
			
			execute PAEM_GET_VAL @v_codi_empr, 'ALL', 'EGRE', @v_para_egre output, @p_existe output, @p_mensaje output
			IF (@v_para_egre is NULL)
			BEGIN
				set @v_para_egre = 'Central';
			END
		
			if @v_tipo_docu in (33, 34, 43, 46, 52) AND @v_esta_docu in ('INI','ERA')
			begin
				SET @v_insertar=1
				SET @v_codi_serv1 = 'dto_resp_reci'
				SET @v_codi_docu='DTORE'
				
				update dto_enca_docu_p
				set    codi_reme = 'RME',
				       fech_reme = getdate(),
				       usua_reme = 'AUTO',
				       reci_rece = @v_para_egre
				where codi_emex = @v_codi_emex
				and   corr_docu = @v_corr_docu
				and   codi_reme is null;
				
				if @@rowcount = 0
				begin
					print 'Recibo ya realizado'
					SET @v_insertar=0
				end
				
				insert into qse_docu_serv(
					CODI_SERV,		CODI_EMEX,		CORR_REFE,		CODI_EMPR,
					TIPO_DOCU,		FOLI_DOCU,		ESTA_PROC,		TIME_PROC,	
					CANT_PROC,		CODI_DOCU,		TABL_ORIG,		VALO_PK1,	
					VALO_PK2,		VALO_PK3,		TABL_ESTA)
				values(
					@v_codi_serv1,	@v_codi_emex,	@v_corr_docu,	@v_codi_empr, 
					@v_tipo_docu,	@v_foli_docu,	'ING',			GETDATE(),
					0,				@v_codi_docu,	'DTO_ENCA_DOCU_P',@v_codi_emex, 
					@v_codi_empr,	@v_corr_envi,	@v_esta_reto)

			end
		END
	END 
END
GO

GO
--SqlScripter----[dbo].[dto_enca_docu_pservicios].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dto_enca_docu_pservicios]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[dto_enca_docu_pservicios]')
GO
CREATE TRIGGER [dbo].[dto_enca_docu_pservicios]
ON [dbo].[dto_enca_docu_p] for UPDATE
AS  
DECLARE 
	@v_codi_serv varchar(30),
	@v_codi_serv1 varchar(30),
	@v_esta_reto varchar(30),
	@v_insertar numeric(1),
	@v_codi_esap VARCHAR(3),
	@v_codi_emex VARCHAR(30),
	@v_corr_docu NUMERIC(18),
	@v_corr_envi NUMERIC(22),
	@v_codi_empr NUMERIC(9),
	@v_tipo_docu NUMERIC(3),
	@v_foli_docu NUMERIC(10),
	@v_codi_reme varchar(10),
	@v_codi_docu varchar(100),
	@v_esta_docu VARCHAR(3),
	@v_usua_reme varchar (30)
BEGIN
	SELECT
		@v_codi_emex = codi_emex, 
		@v_corr_docu = corr_docu,
		@v_corr_envi = corr_envi, 
		@v_codi_empr = codi_empr, 
		@v_codi_esap = codi_esap,
		@v_tipo_docu = tipo_docu,
		@v_foli_docu = foli_docu,
		@v_esta_docu = esta_docu,
		@v_codi_reme = codi_reme,
		@v_usua_reme = usua_reme
		FROM  INSERTED
		print('dto_enca_docupservicios')
	
	--SP1 SE 5.2
	IF UPDATE (codi_esap) 
	BEGIN 
		set @v_insertar=0
	  	if @v_codi_esap in ('APR','ARE','REC')  
		BEGIN
			print('nuevo registro para el dto_resp_come')
			SET @v_insertar=1
			SET @v_codi_serv='dto_resp_come'
			SET @v_codi_docu='DTOCO'
			SET @v_esta_reto=@v_codi_esap
		END
		IF(@v_insertar = 1)
		BEGIN
			insert into qse_docu_serv(
				CODI_SERV,		CODI_EMEX,		CORR_REFE,		CODI_EMPR,
				TIPO_DOCU,		FOLI_DOCU,		ESTA_PROC,		TIME_PROC,	
				CANT_PROC,		CODI_DOCU,		TABL_ORIG,		VALO_PK1,	
				VALO_PK2,		VALO_PK3,		VALO_PK4,		TABL_ESTA)
			values(
				@v_codi_serv,	@v_codi_emex,	@v_corr_docu,	@v_codi_empr, 
				@v_tipo_docu,	@v_foli_docu,	'ING',			GETDATE(),
				0,				@v_codi_docu,	'DTO_ENCA_DOCU_P',@v_codi_emex, 
				@v_codi_empr,	@v_corr_envi,	@v_codi_esap,	@v_esta_reto)
		END
	END
	
	IF UPDATE (codi_reme)
	BEGIN	
		set @v_insertar=0
		if (@v_codi_reme = 'RME' and @v_tipo_docu in (33, 34, 43, 46, 52) AND @v_esta_docu in ('INI','ERA') and isnull(@v_usua_reme,'*') <> 'AUTO' )
		begin
			print('nuevo registro para el dto_resp_reci')
			SET @v_insertar=1
			SET @v_codi_serv = 'dto_resp_reci'
			SET @v_codi_docu='DTORE'
		end
		if(@v_insertar = 1)
		BEGIN
			insert into qse_docu_serv(
				CODI_SERV,		CODI_EMEX,		CORR_REFE,		CODI_EMPR,
				TIPO_DOCU,		FOLI_DOCU,		ESTA_PROC,		TIME_PROC,	
				CANT_PROC,		CODI_DOCU,		TABL_ORIG,		VALO_PK1,	
				VALO_PK2,		VALO_PK3,		VALO_PK4,		TABL_ESTA)
			values(
				@v_codi_serv,	@v_codi_emex,	@v_corr_docu,	@v_codi_empr, 
				@v_tipo_docu,	@v_foli_docu,	'ING',			GETDATE(),
				0,				@v_codi_docu,	'DTO_ENCA_DOCU_P',@v_codi_emex, 
				@v_codi_empr,	@v_corr_envi,	@v_codi_reme,	@v_esta_reto)
		END
	END 
END
GO

GO
--SqlScripter----[dbo].[dto_rece_docu_servicios].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dto_rece_docu_servicios]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[dto_rece_docu_servicios]')
GO
CREATE TRIGGER [dbo].[dto_rece_docu_servicios]
ON dto_rece_docu for INSERT, update   
as
declare
	@v_codi_serv varchar(30),
	@v_esta_reto varchar(30),
	@v_largo numeric(10),
	@v_esta_envi VARCHAR(3),
	@v_codi_emex VARCHAR(30),
	@v_corr_envi NUMERIC(22),
	@v_codi_empr NUMERIC(9)
	
BEGIN 
IF UPDATE(esta_envi)
BEGIN
select
	@v_esta_envi = esta_envi,
	@v_codi_emex = codi_emex,
	@v_corr_envi = corr_envi,
	@v_codi_empr = codi_empr 
	from INSERTED


	if @v_esta_envi in('SCM','FRM','RRE','ACE')
	BEGIN
		set @v_codi_serv = 'dto_resp_tec'
		--set @v_esta_reto='RTG'
		set @v_esta_reto=@v_esta_envi
	END  

	Select @v_largo = LEN(@v_codi_serv)  from dual 

	if @v_largo >0 
		BEGIN
		INSERT INTO  qse_docu_serv  (CODI_SERV ,	CODI_EMEX, 	CORR_REFE, CODI_EMPR ,
				TIPO_DOCU,	FOLI_DOCU,	ESTA_PROC ,
				TIME_PROC,	CANT_PROC ,CODI_DOCU,
				TABL_ORIG, VALO_PK1,VALO_PK2,VALO_PK3,VALO_PK4, VALO_PK5, TABL_ESTA)
		VALUES  (@v_codi_serv, @v_codi_emex, @v_corr_envi,@v_codi_empr,
			   0,0,'ING', GETDATE(),0,'DTOTE', 'DTO_RECE_DOCU',@v_codi_emex, @v_codi_empr,
			   @v_corr_envi, ' ','DTO*',@v_esta_reto)
	END

  END	
END
GO

GO
--SqlScripter----[dbo].[sys_defp_inse].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[sys_defp_inse]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[sys_defp_inse]')
GO
CREATE TRIGGER [dbo].[sys_defp_inse]
ON SYS_DEFP for insert as 
BEGIN

DECLARE
	@corr_defp	varchar(30),
  @fech_defp	datetime,
  @esta_defp	varchar(1)
BEGIN

	begin
		select @corr_defp = corr_defp,
					 @fech_defp = fech_defp,
					 @esta_defp	= esta_defp
		from inserted
	end

	if (@fech_defp is null)
	begin
		set @fech_defp = GETDATE();
	end
	if (@esta_defp is NULL)
	begin
		set @esta_defp = 'P';
	end

  begin
	  update SYS_DEFP
		set fech_defp	=	@fech_defp,
				esta_defp	=	@esta_defp
	  where EXISTS (
									select *  from inserted
									where inserted.corr_defp = sys_defp.corr_defp
									)
   end


END
END
GO

GO
--SqlScripter----[dbo].[sys_fupr_inse].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sys_fupr_inse]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[sys_fupr_inse]')
GO
CREATE TRIGGER [dbo].[sys_fupr_inse]
ON sys_fupr for insert as 
BEGIN

DECLARE
	@nexval		numeric(10,0),
	@corr_fupr	varchar(30),
	@fech_fupr	datetime,
	@codi_peri	varchar(12),
	@freq_fupr	varchar(1),
	@esta_fupr	varchar(1),
	@val1				varchar(30),
	@val2				varchar(30),
	@val3				varchar(30),
	@val4				varchar(30),
	@val5				varchar(30),
	@val6				varchar(30),
	@codi_rous	varchar(30)
BEGIN

	exec get_next_x @nexval output

	begin
		select @corr_fupr = corr_fupr,
						@fech_fupr	= fech_fupr,
						@codi_peri	= codi_peri,
						@freq_fupr	= freq_fupr,
						@esta_fupr	= esta_fupr,
						@val1				= val1,
						@val2				= val2,
						@val3				= val3,
						@val4				= val4,
						@val5				= val5,
						@val6				= val6,
						@codi_rous	= codi_rous
		from inserted
	end

	if (@fech_fupr is null)
	begin
		set @fech_fupr=GETDATE();
	end

	if (@codi_peri is null)
	begin
		if @freq_fupr = 'A' or @freq_fupr = 'Q'
		begin
			set @codi_peri = @fech_fupr; /*YYYY*/
		end
		else if @freq_fupr = 'M'
		begin
			set @codi_peri = @fech_fupr; /*YYYYMM*/
		end
		else if @freq_fupr = 'D'
		begin
			set @codi_peri = @fech_fupr; /*YYYYMMDD*/
		end
	end

	if @esta_fupr is null
	begin
   set @esta_fupr = 'P';
	end

	if @val1 is null
	begin
	   set @val1 = '*';
	end
	if @val2 is null
	begin
	   set @val2 = '*';
	end
	if @val3 is null
	begin
	   set @val3 = '*';
	end
	if @val4 is null
	begin
	   set @val4 = '*';
	end
	if @val5 is null
	begin
	   set @val5 = '*';
	end
	if @val6 is null
	begin
	   set @val6 = '*';
	end
	
/*
	begin
		update sys_fupr set 
	end

*/

END
END
GO

GO
--SqlScripter----[dbo].[sys_obj_optmiza_menu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sys_obj_optmiza_menu]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[sys_obj_optmiza_menu]')
GO
CREATE TRIGGER [dbo].[sys_obj_optmiza_menu]
ON [dbo].[sys_object]
FOR UPDATE, DELETE
AS
DECLARE
   	@p_object_name  	varchar(30),
   	@p_object_name_a  	varchar(30),
	@p_object_type		varchar(1),
	@p_object_brief		varchar(100),
	@p_form_type		varchar(1),
	@p_object_desc		varchar(200),
	@p_object_code		varchar(30),
	@p_object_single	varchar(30),
	@p_object_rela		varchar(30),
	@p_object_prog		varchar(30),
	@p_object_order		varchar(30),
	@p_par0			varchar(30),
	@p_par1			varchar(30),
	@p_par2			varchar(30),
	@p_val0			varchar(30),
	@p_val1			varchar(30),
	@p_val2			varchar(30),
	@p_object_orun		varchar(60),
	@p_object_level		numeric(22,0),
	@p_del			numeric(1,0),
	@p_upd			numeric(1,0),
	@tipo			varchar(1),
	@p_rol0			varchar(1)


BEGIN
select @p_del=0;
select @p_upd=0;
select @tipo='';

	select 	@p_del=1 , 
		@p_object_name_a	= object_name,
		@tipo			= object_type,
		@p_rol0			= rol0
	from 	deleted 
	where 	codi_modu='DBWEB'


	select 	@p_upd			= 1 , 
		@p_object_name		= object_name ,
		@p_object_type		= object_type,
		@p_object_brief		= object_brief,
		@p_form_type		= form_type,
		@p_object_desc		= object_desc,
		@p_object_code		= object_code,
		@p_object_single	= object_single,
		@p_object_rela		= object_rela,
		@p_object_prog		= object_prog,
		@p_object_order		= object_order,
		@p_par0			= par0,
		@p_par1			= par1,
		@p_par2			= par2,
		@p_val0			= val0,
		@p_val1			= val1,
		@p_val2			= val2,
		@p_object_orun		= object_orun,
		@p_object_level		= object_level
	from	inserted 
	where 	codi_modu='DBWEB'
 
/*
I=1  and D=1 	ACCION = 'U'
I=1  and D!=1	ACCION = 'I'
I!=1 and D=1  	ACCION = 'D'
*/--  print 'p_rol0 : ' + @p_rol0 + ' object_name: '+@p_object_name_a;

 --    if(@p_rol0!='P')
 --     begin
        --   print 'D: '+str(@p_del)+'     I: '+ str(@p_upd); 
		/* Con @tipo!=L solo elimina items de menu */
 		/* sin @tipo!=L eliminara items de menu asociados y menus asociados a roles */
		

		if(@p_del=1 and @p_upd!=1 )--and @tipo!='L')  --delete
 		  begin
		 --  print 'Borrando : ' + @p_object_name_a;
	            	/*
			delete from sys_furo 
		    	where	 	codi_modu	=	'DBWEB'
				and	object_name 	=	@p_object_name_a;

			delete from sys_relation
			where		target_object 	like 	'%DBWEB%'
				and	source_object	=	@p_object_name_a;
			*/
		delete from sys_furo 
		where	 	codi_modu	=	'DBWEB'
				and	object_name 	in (select object_name from deleted)
		delete from sys_relation
			where		target_object 	like 	'%DBWEB%'
				and	source_object	in (select object_name from deleted)
     		  end

		if(@p_del=1 and @p_upd=1 and @tipo!='L') --update
 		 begin
		  -- print 'Actualizando : ' + @p_object_name_a;
			update sys_furo set
				object_name	=   @p_object_name,
				object_type 	=   @p_object_type,
				object_brief 	=   @p_object_brief,
				object_desc 	=   @p_object_desc,
				object_code 	=   @p_object_code,
				object_single 	=   @p_object_single,
				object_rela 	=   @p_object_rela,
				object_prog 	=   @p_object_prog,
				object_order 	=   @p_object_order,
				object_orun 	=   @p_object_orun,
				object_level 	=   @p_object_level,
				par0		=   @p_par0,
				val0		=   @p_val0,
				par1		=   @p_par1,
				val1		=   @p_val1
			where
				object_name	=   @p_object_name_a
			and	codi_modu	=	'DBWEB';

			/*update sys_relation set
				source_object	=	@p_object_name,
				source_desc	=	@p_object_desc,
				source_type	=	@p_object_type
			where
				source_object	=	@p_object_name_a 
			and	target_object 	like 	'%DBWEB%';*/
		 end
		end

--end
GO

GO
--SqlScripter----[dbo].[trg_actualiza_esta_rafo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[trg_actualiza_esta_rafo]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_actualiza_esta_rafo]')
GO
CREATE TRIGGER [dbo].[trg_actualiza_esta_rafo]
ON [dbo].[dte_rang_foli]
AFTER INSERT, UPDATE
as
BEGIN
	
	declare @t_foli_hast numeric(10)
	declare @t_ulti_foli numeric(10)
    	declare @t_corr_rafo numeric(18)

	select @t_foli_hast=foli_hast, @t_ulti_foli=ulti_foli, @t_corr_rafo=corr_rafo from Inserted
	if (@t_foli_hast = @t_ulti_foli)
	begin
		update dte_rang_foli set esta_rafo ='UTI' where corr_rafo=@t_corr_rafo
	end
END
GO

GO
--SqlScripter----[dbo].[trg_actualiza_fech_venc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_actualiza_fech_venc]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_actualiza_fech_venc]')
GO
-- =============================================
-- Author:      Aaron Rojas
-- Create date: 2016-12-29
-- Description: Actualiza fecha de vencimiento del CAF
-- =============================================

CREATE TRIGGER [dbo].[trg_actualiza_fech_venc]
ON dte_rang_foli
   AFTER INSERT, update
AS 
BEGIN
    declare @v_corr_rafo numeric(10),
            @v_codi_emex varchar(30),
            @v_fech_auto datetime,
            @v_fech_venc datetime,
			@v_cant_mes numeric(3)
    
    select  @v_corr_rafo=corr_rafo,
            @v_fech_venc=fech_venc,
            @v_fech_auto=fech_auto,
            @v_codi_emex=codi_emex
    from inserted
	
	set @v_cant_mes=0
	select @v_cant_mes = param_value
	from   sys_param with (nolock)
	where  param_name = 'EGATE_MES_VIGE_CAF'
	
    if(@@rowcount=0)
	BEGIN
		set @v_cant_mes=6
	END
    if(@v_fech_venc is null)
    BEGIN
        update    dte_rang_foli 
            set   fech_venc=CASE
								WHEN @v_fech_auto <= convert(datetime,'2016-01-01',120) THEN convert(datetime,'2017-06-30',120)
                                WHEN @v_fech_auto < convert(datetime,'2018-07-01',120) THEN convert(datetime,'2018-12-31',120)
                                WHEN @v_fech_auto >= convert(datetime,'2018-07-01',120) THEN DATEADD(MONTH,@v_cant_mes,@v_fech_auto)
                            END
            where corr_rafo=@v_corr_rafo
            and   codi_emex=@v_codi_emex
    END
END
GO

GO
--SqlScripter----[dbo].[trg_dte_desc_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_desc_item]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_desc_item]')
GO
CREATE TRIGGER [dbo].[trg_dte_desc_item]
ON dte_desc_item  for insert   AS
BEGIN 
  declare
  @res       	varchar (10),  @p_codi       varchar(5), 
  @hay_era   	varchar(2),    @hay_err      varchar(2), 
  @fecha     	varchar(10),   @mensaje      varchar(2000),
  @mensaje2  	varchar(2000), @cod_error    varchar(10), 
  @p_existe  	varchar(1),    @p_mensaje    varchar(80),   
  @p_salida  	varchar(80),   @p_ex         varchar(1),   
  @p_men     	varchar(80),   @p_codi_erro  varchar(12),
  @p_desc_erro  varchar(50),   @p_tipo_erro  varchar(10),
  @codi_empr 	varchar(10),   @tipo_docu    varchar(3),
  @foli_docu 	varchar(10),   @nume_line    varchar(3),
  @tipo_desc 	varchar(1),    @valo_desc    varchar(18),
  @codi_emex 	varchar(30),   @p_bole_elec  varchar(1),
  @descrip 	varchar(80),   @p_tipo_dnte  varchar(1),
  @p_indi_dnte	varchar(1)

BEGIN
    begin
      select @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
             @foli_docu=FOLI_DOCU, @nume_line=NUME_LINE,
             @tipo_desc=TIPO_DESC, @valo_desc=VALO_DESC
      from inserted
    end
    begin
     set  @mensaje2 =''
     set @descrip = 'TIPO_DOCU'
 
     execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                           @p_existe output, @p_mensaje output
     execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                   @p_bole_elec output, @p_tipo_dnte output, 
		   @cod_error output, @mensaje output
    end
  
 /***************************/
 /*Validacion DTEs no Boleta*/
 /***************************/
 if @p_bole_elec = 'N'
  begin 
   -- Tipo de de Valor : % o $
   begin
     execute @res= dte_tipo_desc @tipo_desc,
                     @cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 ='-20074 - TIPO_DESC -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20074'
              execute @res= dte_chec_erro @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end 
	       end
            end
      end        
   end
   
   --Sub-Descuento al Item 
   begin
     execute @res= dte_vali_desc @codi_empr, @tipo_docu,
                    @foli_docu,   @tipo_desc, @valo_desc,
                    @cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2+ ' -20050 - VALO_DESC -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20074'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end

	       end 
            end
      end        
   end
  end --if p_bole_elec = 'N'

  /***********************/
 /*Validacion para Boleta*/
 /************************/
 if @p_bole_elec = 'S'
   begin
      begin
       execute @res= dte_campo_bole 'TIPO_DESC', @tipo_desc, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
	      end
        end
      end

      begin
       execute @res= dte_campo_bole 'VALO_DESC', @valo_desc, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
	      end
        end
      end

   end --if p_bole_elec = 'S'

  begin
  update dte_desc_item set  MNSG_ERRO=isnull(MNSG_ERRO,'') +@mensaje2
  where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_desc_item.codi_empr
              and inserted.foli_docu =dte_desc_item.foli_docu
              and inserted.tipo_docu =dte_desc_item.tipo_docu)
   end
  END
END
GO

GO
--SqlScripter----[dbo].[trg_dte_desc_item_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_desc_item_p]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_desc_item_p]')
GO
CREATE TRIGGER [dbo].[trg_dte_desc_item_p]
ON dte_desc_item_p  for insert   AS
BEGIN 
  declare
  @res         varchar (10),  @p_codi      varchar(5), 
  @hay_era     varchar(2),    @hay_err     varchar(2), 
  @fecha       varchar(10),   @mensaje     varchar(2000),
  @mensaje2    varchar(2000), @cod_error   varchar(10), 
  @p_existe    varchar(1),    @p_mensaje   varchar(80),   
  @p_salida    varchar(80),   @p_ex        varchar(1),   
  @p_men       varchar(80),   @p_codi_erro varchar(12),
  @p_desc_erro varchar(50),   @p_tipo_erro varchar(10),
  @codi_empr   varchar(10),   @tipo_docu   varchar(3),
  @foli_docu   varchar(10),   @nume_line   varchar(3),
  @tipo_desc   varchar(1),    @valo_desc   varchar(18),
  @codi_emex   varchar(30),   @p_bole_elec  varchar(1),
  @descrip     varchar(80),   @p_tipo_dnte  varchar(1),
  @p_indi_dnte varchar(1)

BEGIN
    begin
      select @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
             @foli_docu=FOLI_DOCU, @nume_line=NUME_LINE,
             @tipo_desc=TIPO_DESC, @valo_desc=VALO_DESC
      from inserted
    end
    begin
      set  @mensaje2 =' '
      execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                            @p_existe output, @p_mensaje output
     execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                   @p_bole_elec output, @p_tipo_dnte output, 
		   @cod_error output, @mensaje output
    end

 /***************************/
 /*Validacion DTEs no Boleta*/
 /***************************/
 if @p_bole_elec = 'N'
  begin 
     -- Tipo de de Valor : % o $
     begin
     execute @res= dte_tipo_desc @tipo_desc,
                     @cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2+' -20074 - TIPO_DESC -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20074'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
     end

     --Sub-Descuento al Item 
     begin
     execute @res= dte_vali_desc @codi_empr, @tipo_docu,
                    @foli_docu,   @tipo_desc, @valo_desc,
                    @cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2+ ' -20050 - VALO_DESC -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20074'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
     end
  end

 /***********************/
 /*Validacion para Boleta*/
 /************************/
 if @p_bole_elec = 'S'
   begin
      begin
       execute @res= dte_campo_bole 'TIPO_DESC', @tipo_desc, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
	      end
        end
      end

      begin
       execute @res= dte_campo_bole 'VALO_DESC', @valo_desc, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
	      end
        end
      end
   end --if p_bole_elec = 'S'
 
 begin
  update dte_desc_item_p set  MNSG_ERRO=isnull(MNSG_ERRO,'') +@mensaje2
  where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_desc_item_p.codi_empr
            and inserted.foli_docu =dte_desc_item_p.foli_docu
            and inserted.tipo_docu =dte_desc_item_p.tipo_docu)
 end
 END
END
GO

GO
--SqlScripter----[dbo].[trg_dte_desc_reca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_desc_reca]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_desc_reca]')
GO
CREATE TRIGGER [dbo].[trg_dte_desc_reca]
ON dte_desc_reca  for insert   AS
BEGIN
 declare
   @res         varchar (10),  @p_codi      varchar(5),
   @hay_era     varchar(3),    @MNSG_ERRO   varchar(2000),
   @hay_err     varchar(2),    @fecha       varchar(10),
   @mensaje     varchar(2000), @mensaje2    varchar(2000),
   @cod_error   varchar(10),   @p_existe    varchar(1),
   @p_mensaje   varchar(80),   @p_salida    varchar(80),
   @p_ex        varchar(1),    @p_men       varchar(80),
   @p_codi_erro varchar(12),   @p_desc_erro varchar(50),
   @p_tipo_erro varchar (10),  @codi_empr   varchar(10),  
   @tipo_docu   varchar(3),    @foli_docu   varchar(10),  
   @nume_dere   varchar(3),    @tipo_dere   varchar(1),
   @tipo_valo   varchar(1),    @valo_dere   varchar(18), 
   @indi_exen   varchar(30),   @p_bole_elec varchar(1),    
   @descrip     varchar(80),   @p_tipo_dnte varchar(1),    
   @p_indi_dnte varchar(1)
BEGIN
 begin
  select 
    @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
    @foli_docu=FOLI_DOCU, @nume_dere=NUME_DERE,
    @tipo_dere=TIPO_DERE,@tipo_valo=TIPO_VALO,
    @valo_dere=VALO_DERE,@indi_exen=INDI_EXEN
   from inserted
 end
   begin
      set  @mensaje2 =''
      execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                          @p_existe output, @p_mensaje output
      execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                    @p_bole_elec output, @p_tipo_dnte output, 
		    @cod_error output, @mensaje output
   end

 /*****************************/
 /* Validacion DTEs no Boleta */
 /*****************************/
 if @p_bole_elec = 'N'
  begin
    --Tipo de Movimiento 
    begin
    execute @res= dte_dere_tipm @tipo_dere,
                     @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 ='-20063 -  TIPO_DERE -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20063'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                     raiserror (@mensaje2,16,1)
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
               end
            end
      end        
    end

    -- Tipo de de Valor : % o $
    begin
    execute @res= dte_tipo_desc @tipo_valo,
                     @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20064 -  TIPO_VALO -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20064'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                     raiserror (@mensaje2,16,1)
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
               end
            end
      end        
    end

    --Valor, que sea numerico
    begin
    execute @res= dte_nume_rut  @valo_dere,'x', 'N','N', 
                     @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20065 -  VALO_DERE -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20065'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                     raiserror (@mensaje2,16,1)
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
               end
            end
      end        
    end

    --Indicador de facturacion/Extencion 
    begin
    execute @res=dte_CHECK_DOMAIN '71',@indi_exen, 'N',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20077 -  INDI_EXEN -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20077'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                     raiserror (@mensaje2,16,1)
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
               end
            end
      end
    end
  end 
 begin
     update dte_desc_reca set  MNSG_ERRO=isnull(MNSG_ERRO,'') +@mensaje2
     where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_desc_reca.codi_empr
              and inserted.foli_docu =dte_desc_reca.foli_docu
              and inserted.tipo_docu =dte_desc_reca.tipo_docu)
 end
 END
END
GO

GO
--SqlScripter----[dbo].[trg_dte_desc_reca_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_desc_reca_p]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_desc_reca_p]')
GO
CREATE TRIGGER [dbo].[trg_dte_desc_reca_p]
ON dte_desc_reca_p  for insert   AS
BEGIN
 declare
   @res         varchar(10),   @p_codi      varchar(5),
   @hay_era     varchar(3),    @MNSG_ERRO   varchar(2000),
   @hay_err     varchar(2),    @fecha       varchar(10),
   @mensaje     varchar(2000), @mensaje2    varchar(2000),
   @cod_error   varchar(10),   @p_existe    varchar(1),
   @p_mensaje   varchar(80),   @p_salida    varchar(80),
   @p_ex        varchar(1),    @p_men 	    varchar(80),
   @p_codi_erro varchar(12),   @p_desc_erro varchar(50),
   @p_tipo_erro varchar(10),   @codi_empr   varchar(10),  
   @tipo_docu 	varchar(3),    @foli_docu   varchar(10),   
   @nume_dere 	varchar(3),    @tipo_dere   varchar(1),    
   @tipo_valo 	varchar(1),    @valo_dere   varchar(18),   
   @indi_exen 	varchar(30),   @p_bole_elec varchar(1),    
   @descrip     varchar(80),   @p_tipo_dnte varchar(1),    
   @p_indi_dnte varchar(1)
BEGIN
 begin
  select 
    @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
    @foli_docu=FOLI_DOCU, @nume_dere=NUME_DERE,
    @tipo_dere=TIPO_DERE,@tipo_valo=TIPO_VALO,
    @valo_dere=VALO_DERE,@indi_exen=INDI_EXEN
   from inserted
 end
   begin
      set  @mensaje2 =' '
      execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                          @p_existe output, @p_mensaje output
      execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                    @p_bole_elec output, @p_tipo_dnte output, 
		    @cod_error output, @mensaje output
   end

 /*****************************/
 /* Validacion DTEs no Boleta */
 /*****************************/
 if @p_bole_elec = 'N'
  begin
    --Tipo de Movimiento 
    begin
    execute @res= dte_dere_tipm @tipo_dere,
                     @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 ='-20063 -  TIPO_DERE -'
                      + @mensaje+CHAR(10) 
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL'             
            begin
              set @p_codi ='20063'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
               end
            end
      end        
    end

    -- Tipo de de Valor : % o $
    begin
    execute @res= dte_tipo_desc @tipo_valo,
                     @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20064 -  TIPO_VALO -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20064'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
               end
            end
      end        
    end

    --Valor, que sea numerico
    begin
    execute @res= dte_nume_rut  @valo_dere,'x', 'N','N', 
                     @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20065 -  VALO_DERE -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20065'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
               end
            end
      end        
    end

    --Indicador de facturacion/Extencion 
    begin
    execute @res=dte_CHECK_DOMAIN '71',@indi_exen, 'N',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20077 -  INDI_EXEN -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'                 
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20077'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
               end
            end
      end
    end 
  end
 
 begin
     update dte_desc_reca_p set  MNSG_ERRO=isnull(MNSG_ERRO,'') +@mensaje2
     where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_desc_reca_p.codi_empr
            and inserted.foli_docu =dte_desc_reca_p.foli_docu
            and inserted.tipo_docu =dte_desc_reca_p.tipo_docu)
 end
 END
END
GO

GO
--SqlScripter----[dbo].[trg_dte_deta_acec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_deta_acec]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_deta_acec]')
GO
CREATE TRIGGER [dbo].[trg_dte_deta_acec]
ON dte_deta_acec  for insert   AS
BEGIN   
  declare
  @res       	varchar (10),  	@p_codi        	varchar(5), 
  @hay_era   	varchar(2),    	@hay_err       	varchar(2), 
  @fecha     	varchar(10),   	@mensaje       	varchar(2000),
  @mensaje2  	varchar(2000), 	@cod_error     	varchar(10),
  @p_existe  	varchar(1),    	@p_mensaje     	varchar(80),
  @p_salida  	varchar(80),   	@p_men         	varchar(80),
  @p_codi_erro  varchar(12),	@p_desc_erro   	varchar(50),
  @p_tipo_erro  varchar (10),   @codi_empr     	varchar(10), 
  @tipo_docu 	varchar(3),     @foli_docu     	varchar(10), 
  @codi_acec 	varchar(6),     @corr_acec     	varchar(6), 
  @descrip 	varchar(80), 	@p_bole_elec   	varchar(1),
  @p_tipo_dnte	varchar(1),	@p_indi_dnte	varchar(1)
BEGIN
  begin
     select @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
            @foli_docu=FOLI_DOCU, @corr_acec=CORR_ACEC,
            @codi_acec=CODI_ACEC 
     from inserted
  end
  begin
      set  @mensaje2 =''
      set @descrip = 'TIPO_DOCU'
      execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                            @p_existe output, @p_mensaje output
      execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                    @p_bole_elec output, @p_tipo_dnte output,
		    @cod_error output, @mensaje output   
  end

 /***************************/
 /*Validacion DTEs no Boleta*/
 /***************************/
 if @p_bole_elec = 'N'
  -- valida Actividad economica 
  begin   
     execute @res= dte_acec_acti @codi_empr, @tipo_docu,
                    @foli_docu,   @codi_acec, @corr_acec,
                    @cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 ='-20072 - CODI_ACEC -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20072'
              execute @res= dte_chec_erro @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end        
  end

 /************************/
 /*Validacion para Boleta*/
 /************************/
 if @p_bole_elec = 'S'
  begin
   execute @res= dte_campo_bole 'CODI_ACEC', @codi_acec, 
	     'C', @cod_error output, @mensaje output
   if @cod_error='S'
     begin
      set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
      if @p_salida = 'TOTAL' 
        begin
          set  @hay_err = '1'
          raiserror (@mensaje2,16,1)
        end
      else
        if @p_salida  = 'PARCIAL' 
           begin
             set @p_codi ='20089'
             execute @res= dte_chec_erro @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
             if @p_tipo_erro ='ERR'   
                begin
                  set  @hay_err = '1'
                  raiserror (@mensaje2,16,1)
                end
             else
                begin
                  set  @hay_era = '1'
                end
	   end
     end
  end

 begin
    update dte_deta_acec set  MNSG_ERRO=isnull(MNSG_ERRO,'') +@mensaje2
    where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_deta_acec.codi_empr
              and inserted.foli_docu =dte_deta_acec.foli_docu
              and inserted.tipo_docu =dte_deta_acec.tipo_docu)
 end
 END
END
GO

GO
--SqlScripter----[dbo].[trg_dte_deta_acec_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_deta_acec_p]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_deta_acec_p]')
GO
CREATE TRIGGER [dbo].[trg_dte_deta_acec_p]
ON dte_deta_acec_p  for insert   AS
BEGIN   
  declare
  @res   	varchar(10),	@p_codi		varchar(5), 
  @hay_era 	varchar(2),     @hay_err   	varchar(2), 
  @fecha   	varchar(10),    @mensaje   	varchar(2000),
  @mensaje2  	varchar(2000),  @cod_error 	varchar(10),
  @p_existe 	varchar(1),     @p_mensaje 	varchar(80),
  @p_salida 	varchar(80),    @p_men 		varchar(80),    
  @p_codi_erro 	varchar(12), 	@p_desc_erro 	varchar(50),
  @p_tipo_erro 	varchar(10), 	@codi_empr 	varchar(10), 
  @tipo_docu 	varchar(3),    	@foli_docu 	varchar(10), 
  @codi_acec 	varchar(6),    	@corr_acec 	varchar(6),
  @descrip 	varchar(80), 	@p_bole_elec   	varchar(1),
  @p_tipo_dnte	varchar(1),	@p_indi_dnte 	varchar(1)
BEGIN
  begin
     select @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
            @foli_docu=FOLI_DOCU, @corr_acec=CORR_ACEC,
            @codi_acec=CODI_ACEC 
     from inserted
  end
  begin
      set  @mensaje2 =' '
      execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                            @p_existe output, @p_mensaje output
      execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                    @p_bole_elec output, @p_tipo_dnte output,
		    @cod_error output, @mensaje output   
  end

 /***************************/
 /*Validacion DTEs no Boleta*/
 /***************************/
 if @p_bole_elec = 'N'
   begin
     -- valida Actividad economica 
     begin   
     execute @res= dte_acec_acti @codi_empr, @tipo_docu,
                    @foli_docu,   @codi_acec, @corr_acec,
                    @cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 ='-20072 - CODI_ACEC -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20072'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
               end
            end
      end        
     end
   end

 /************************/
 /*Validacion para Boleta*/
 /************************/
 if @p_bole_elec = 'S'
  begin
   execute @res= dte_campo_bole 'CODI_ACEC', @codi_acec, 
	     'C', @cod_error output, @mensaje output
   if @cod_error='S'
     begin
      set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
      if @p_salida = 'TOTAL' 
        begin
          set  @hay_err = '1'
        end
      else
        if @p_salida  = 'PARCIAL' 
           begin
             set @p_codi ='20089'
             execute @res= dte_chec_erro @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
             if @p_tipo_erro ='ERR'   
                begin
                  set  @hay_err = '1'
                end
             else
                begin
                  set  @hay_era = '1'
                end
	   end
     end
  end

  begin
    update dte_deta_acec_p set  MNSG_ERRO=isnull(MNSG_ERRO,'') +@mensaje2
    where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_deta_acec_p.codi_empr
              and inserted.foli_docu =dte_deta_acec_p.foli_docu
              and inserted.tipo_docu =dte_deta_acec_p.tipo_docu)
   end
 END
END
GO

GO
--SqlScripter----[dbo].[trg_dte_deta_codi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_deta_codi]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_deta_codi]')
GO
CREATE TRIGGER [dbo].[trg_dte_deta_codi]
ON dte_deta_codi  for insert   AS
BEGIN 
 declare
  @res 		varchar (10), 	@p_codi 	varchar(5), 
  @hay_era 	varchar(2), 	@hay_err 	varchar(2), 
  @fecha 	varchar(10), 	@mensaje 	varchar(2000),
  @mensaje2 	varchar(2000), 	@cod_error 	varchar(10), 
  @p_existe  	varchar(1), 	@p_mensaje 	varchar(80), 
  @p_salida  	varchar(80), 	@p_codi_erro  	varchar(12),
  @p_desc_erro 	varchar(50),  	@p_tipo_erro  	varchar(10),
  @tipo_codi 	varchar(6), 	@codi_item 	varchar(35),
  @tipo_docu 	varchar(3), 	@descrip 	varchar(80),
  @p_bole_elec 	varchar(1),	@p_tipo_dnte	varchar(1),
  @p_indi_dnte	varchar(1)
 BEGIN
   begin
      select @tipo_docu=TIPO_DOCU, @tipo_codi=TIPO_CODI, 
             @codi_item=CODI_ITEM
      from inserted
   end
   begin
      set  @mensaje2 = ''
      set  @descrip  = 'TIPO_DOCU'
 
      execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                            @p_existe output, @p_mensaje output
      execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                    @p_bole_elec output, @p_tipo_dnte output,
 		    @cod_error output, @mensaje output
   end

   if @p_bole_elec = 'N'
    begin
     -- Tipo de Codigo 
     begin
     execute @res=dte_CHECK_DOMAIN '86',@tipo_codi, 'N',
                              @cod_error output, @mensaje output
     if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20045 - TIPO_CODI -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
               raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20045'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                 begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                 end
              	else
                 begin
                   set  @hay_era = '1'
                 end
	       end 
            end
      end
     end
   end --if p_bole_elec = 'N'

   begin
     update dte_deta_codi set  MNSG_ERRO=isnull(MNSG_ERRO,'')+@mensaje2
     where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_deta_codi.codi_empr
              and inserted.foli_docu =dte_deta_codi.foli_docu
              and inserted.tipo_docu =dte_deta_codi.tipo_docu)
   end
 END 
END
GO

GO
--SqlScripter----[dbo].[trg_dte_deta_codi_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_deta_codi_p]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_deta_codi_p]')
GO
CREATE TRIGGER [dbo].[trg_dte_deta_codi_p]
ON dte_deta_codi_p  for insert   AS
BEGIN 
 declare
  @res   	varchar (10),   @p_codi   	varchar(5), 
  @hay_era 	varchar(2),   	@hay_err   	varchar(2), 
  @fecha  	varchar(10), 	@mensaje 	varchar(2000),
  @mensaje2  	varchar(2000), 	@cod_error 	varchar(10), 
  @p_existe  	varchar(1),  	@p_mensaje 	varchar(80),   
  @p_salida  	varchar(80), 	@p_codi_erro 	varchar(12),
  @p_desc_erro  varchar(50),  	@p_tipo_erro  	varchar(10),
  @tipo_codi  	varchar(6), 	@codi_item 	varchar(35),
  @tipo_docu 	varchar(3), 	@descrip 	varchar(80),
  @p_bole_elec 	varchar(1),	@p_tipo_dnte	varchar(1),
  @p_indi_dnte 	varchar(1)
 BEGIN
    begin
      select @tipo_codi=TIPO_CODI
      from inserted
    end
   begin
      set  @mensaje2 =''
      execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                            @p_existe output, @p_mensaje output
      execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                    @p_bole_elec output, @p_tipo_dnte output,
 		    @cod_error output, @mensaje output
   end

   if @p_bole_elec = 'N'
    begin
     -- Tipo de Codigo 
     begin
     execute @res=dte_CHECK_DOMAIN '86',@tipo_codi, 'N',
                              @cod_error output, @mensaje output
     if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20045 - TIPO_CODI -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi = '20045'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
     end
    end
   begin
     update dte_deta_codi_p set  MNSG_ERRO=isnull(MNSG_ERRO,'')+@mensaje2
     where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_deta_codi_p.codi_empr
              and inserted.foli_docu =dte_deta_codi_p.foli_docu
              and inserted.tipo_docu =dte_deta_codi_p.tipo_docu)
   end
 END 
END
GO

GO
--SqlScripter----[dbo].[trg_dte_deta_prse].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[trg_dte_deta_prse]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_deta_prse]')
GO
CREATE TRIGGER [dbo].[trg_dte_deta_prse]
ON dte_deta_prse for insert AS
BEGIN
 declare
 @hay       	numeric(1), 	@hay_err  	varchar(3), 
 @hay_era 	varchar(3),	@fecha   	varchar(10),
 @mensaje  	varchar(2000),	@mensaje2  	varchar(2000),	
 @cod_error 	varchar(10),	@p_existe	varchar(1),
 @p_mensaje 	varchar(80),  	@p_salida 	varchar(80), 
 @p_ex  	varchar(1),	@p_men 		varchar(80),
 @p_codi_erro  	varchar(12), 	@p_desc_erro 	varchar(50),
 @p_tipo_erro 	varchar (10), 	@MNSG_ERRO  	varchar(2000),
 @res       	varchar (10), 	@p_codi    	varchar(5),
 @codi_empr 	varchar(20), 	@tipo_docu 	varchar(20), 
 @foli_docu 	varchar(20),	@nume_line 	varchar(20),
 @tipo_codi 	varchar(20),	@indi_exen 	varchar(20),
 @cant_refe 	varchar(20), 	@prec_refe 	varchar(20), 
 @cant_item 	varchar(20),	@fech_elab 	varchar(20),
 @fech_vepr 	varchar(20), 	@prec_item  	varchar(20), 
 @prec_mono 	varchar(20), 	@fact_conv 	varchar(20), 
 @desc_porc 	varchar(20),	@dcto_item 	varchar(20),
 @reca_porc 	varchar(20),	@reca_item 	varchar(20),
 @codi_impu 	varchar(20), 	@neto_item 	varchar(20), 
 @codi_item 	varchar(20),	@p_bole_elec 	varchar(1),
 @descrip 	varchar(80), 	@unid_refe 	varchar(20),
 @codi_mone 	varchar(20),	@p_tipo_dnte	varchar(1),
 @p_indi_dnte	varchar(1)
BEGIN
--SP1 SE 5.2
 begin
  select 
   @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
   @foli_docu=FOLI_DOCU, @nume_line=NUME_LINE, 
   @tipo_codi=TIPO_CODI, @indi_exen=INDI_EXEN, 
   @cant_refe=CANT_REFE, @prec_refe=PREC_REFE,
   @cant_item=CANT_ITEM, @fech_elab=FECH_ELAB, 
   @fech_vepr=FECH_VEPR, @prec_item=PREC_ITEM, 
   @prec_mono=PREC_MONO, @fact_conv=FACT_CONV,
   @desc_porc=DESC_PORC, @dcto_item=DCTO_ITEM, 
   @reca_porc=RECA_PORC, @reca_item=RECA_ITEM, 
   @codi_impu=CODI_IMPU, @neto_item=NETO_ITEM,
   @codi_item=CODI_ITEM, @unid_refe=UNID_REFE, 
   @codi_mone=CODI_MONE
  from inserted
 end

 begin
   set @mensaje2 = ''
   set @descrip = 'TIPO_DOCU'
 
   execute @res=PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output, 
                @p_existe output , @p_mensaje output
   
   execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                 @p_bole_elec output, @p_tipo_dnte output,
		 @cod_error output, @mensaje output
 end
 
 --Numero de Linea o Secuencial
 begin
    execute @res= dte_nume_rut @nume_line, 'x', 'N','S', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20044 - NUME_LINE -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20044'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end
 end
 
 --Tipo de Codigo - tambien en otra tabla
 begin
	execute @res=dte_CHECK_DOMAIN '86',@tipo_codi, 'N',@cod_error output, @mensaje output
	if @cod_error = 'S' 
	begin          
		set @mensaje2 =@mensaje2+ ' -20045 - TIPO_CODI -'+ @mensaje
		if  @p_salida = 'TOTAL' 
		begin
			set  @hay_err = '1'
			raiserror (@mensaje2,16,1)
		end
		else
			if  @p_salida  = 'PARCIAL' 
			begin
			set @p_codi ='20045'
			execute @res= dte_chec_erro  @p_codi,
			@p_desc_erro output, @p_tipo_erro output,
			@p_indi_dnte output, @p_existe output, @p_mensaje output
				if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
				begin
					if @p_tipo_erro ='ERR'   
					begin
						set  @hay_err = '1'
						raiserror (@mensaje2,16,1)
					end
					else
					begin
						set  @hay_era = '1'
					end
			end 
		end
	end
end

 --Indicador de Exencion 
 begin
    execute @res=dte_CHECK_DOMAIN '85',@indi_exen, 'N',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20046 - INDI_EXEN -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20046'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end
 end

 --Cantidad, que sea numero 
 begin
    execute @res= dte_nume_rut @cant_item, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20049 - CANT_ITEM -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20049'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end
 end

 --Precio Unitario del Item en Pesos, que sea numero 
 begin
    execute @res= dte_nume_rut @prec_item, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20053 - PREC_ITEM -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20053'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end
 end

 --Monto Item - Valor Neto por linea de Detalle 
 begin
    execute @res= dte_mont_item @codi_empr,@tipo_docu, 
                    @foli_docu, @nume_line,@neto_item,@prec_item, 
                    @cant_item,@dcto_item,@reca_item, 
                    @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20061 - NETO_ITEM  -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20061'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end
 end

 /*****************************/
 /* Validacion DTEs no Boleta */
 /*****************************/
 if @p_bole_elec = 'N'
  begin
    --Cantidad de Referencia, que sea numero 
    begin
    execute @res= dte_nume_rut @cant_refe, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20047 - CANT_REFE -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20047'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end
    end
    
    --Precio de Referencia - que sea numerico
    begin
    execute @res= dte_nume_rut @prec_refe, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20048 - PREC_REFE -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20048'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end
    end
   
    --Fecha de Elaboracion 
    /*begin
     execute @res=dte_vali_fech @fech_elab,'N',
                           @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20051 - FECH_ELAB -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20051'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end
    end
    --Fecha de Vencimiento 
    begin
     execute @res=dte_vali_fech @fech_vepr,'N',
                           @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20052 - FECH_VEPR -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20052'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end
    end*/

    --Precio Unitario en otra Moneda, que sea numero 
   begin
    execute @res= dte_nume_rut @prec_mono, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20054 - PREC_MONO -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20054'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end
    end

    --Factor de Conversion , que sea numero
    begin
    execute @res= dte_nume_rut @fact_conv, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20055 - FACT_CONV -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20055'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end 
	       end
            end
      end
    end

    --Descuento,  Porcentaje, que sea numero 
    begin
    execute @res= dte_nume_rut @desc_porc, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20056 - DESC_PORC -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20056'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end
    end

    --Recargo, Porcentaje,  que sea numerico
    begin
    execute @res= dte_nume_rut @reca_porc, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20058 - RECA_PORC  -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20058'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end 
	       end
            end
      end
    end

    --Descuento en $, monto, que sea numero  
    begin
    execute @res= dte_nume_rut @dcto_item, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20057 - DCTO_ITEM  -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20057'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end
    end

    --Recargo, monto, que sea numerico 
    begin
    execute @res= dte_nume_rut @reca_item, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20059 - RECA_ITEM  -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20059'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end
    end
  end -- p_bole_elec = 'N'
  
  /**********************/
  /* Validacion Boletas */
  /**********************/
  if @p_bole_elec = 'S'
   begin
      begin
       execute @res= dte_campo_bole 'CODI_IMPU', @codi_impu, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                   begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                   end
                 else
                   begin
                      set  @hay_era = '1'
                   end
  	      end
        end
      end

      begin
       execute @res= dte_campo_bole 'CANT_REFE', @cant_refe, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                   begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                   end
                 else
                   begin
                      set  @hay_era = '1'
                   end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'UNID_REFE', @unid_refe, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'PREC_REFE', @prec_refe, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'PREC_MONO', @prec_mono, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'CODI_MONE', @codi_mone, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'FACT_CONV', @fact_conv, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'DCTO_ITEM', @dcto_item, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'RECA_ITEM', @reca_item, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'DESC_PORC', @desc_porc, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'RECA_PORC', @reca_porc, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'FECH_ELAB', @fech_elab, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'FECH_VEPR', @fech_vepr, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

   end --If p_bole_elec = 'S'
 
 begin
    update dte_deta_prse set  MNSG_ERRO=isnull(MNSG_ERRO,'') + @mensaje2
    where EXISTS 
    (select *  from inserted
     where inserted.codi_empr =dte_deta_prse.codi_empr
     and inserted.foli_docu =dte_deta_prse.foli_docu
     and inserted.tipo_docu =dte_deta_prse.tipo_docu)
 end

END 
END
GO

GO
--SqlScripter----[dbo].[trg_dte_deta_prse_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_deta_prse_p]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_deta_prse_p]')
GO
CREATE TRIGGER [dbo].[trg_dte_deta_prse_p]
ON dte_deta_prse_p
    for insert AS
BEGIN
 declare
 @hay       	numeric(1), 	@hay_err  	varchar(3), 
 @hay_era 	varchar(3),   	@fecha   	varchar(10),  
 @mensaje  	varchar(2000), 	@mensaje2  	varchar(2000),
 @cod_error 	varchar(10),	@p_existe 	varchar(1),
 @p_mensaje 	varchar(80),  	@p_salida 	varchar(80), 
 @p_ex  	varchar(1),  	@p_men 		varchar(80),  
 @p_codi_erro  	varchar(12), 	@p_desc_erro 	varchar(50),
 @p_tipo_erro 	varchar(10), 	@MNSG_ERRO  	varchar(2000),
 @res       	varchar(10), 	@p_codi    	varchar(5),
 @codi_empr 	varchar(20), 	@tipo_docu 	varchar(20), 
 @foli_docu 	varchar(20), 	@nume_line 	varchar(20), 
 @tipo_codi 	varchar(20), 	@indi_exen 	varchar(20),
 @cant_refe 	varchar(20), 	@prec_refe 	varchar(20), 
 @cant_item 	varchar(20), 	@fech_elab 	varchar(20),
 @fech_vepr 	varchar(20), 	@prec_item  	varchar(20), 
 @prec_mono 	varchar(20), 	@fact_conv 	varchar(20),
 @desc_porc 	varchar(20), 	@dcto_item 	varchar(20),
 @reca_porc 	varchar(20), 	@reca_item 	varchar(20),
 @codi_impu 	varchar(20), 	@neto_item 	varchar(20),
 @codi_item 	varchar(20), 	@p_indi_dnte 	varchar(1),
 @p_bole_elec 	varchar(1), 	@descrip 	varchar(80), 	
 @unid_refe 	varchar(20), 	@codi_mone 	varchar(20),	
 @p_tipo_dnte	varchar(1)
BEGIN
select 
   @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
   @foli_docu=FOLI_DOCU, @nume_line=NUME_LINE, 
   @tipo_codi=TIPO_CODI, @indi_exen=INDI_EXEN, 
   @cant_refe=CANT_REFE, @prec_refe=PREC_REFE,
   @cant_item=CANT_ITEM, @fech_elab=FECH_ELAB, 
   @fech_vepr=FECH_VEPR, @prec_item=PREC_ITEM, 
   @prec_mono=PREC_MONO, @fact_conv=FACT_CONV,
   @desc_porc=DESC_PORC, @dcto_item=DCTO_ITEM, 
   @reca_porc=RECA_PORC, @reca_item=RECA_ITEM, 
   @codi_impu=CODI_IMPU, @neto_item=NETO_ITEM,
   @codi_item=CODI_ITEM, @unid_refe=UNID_REFE, 
   @codi_mone=CODI_MONE
from inserted
BEGIN
SET DATEFORMAT ymd
  set @mensaje2 =''
  set @descrip = 'TIPO_DOCU'
  begin
    execute @res=PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida, @p_existe, @p_mensaje
    execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                 @p_bole_elec output, @p_tipo_dnte output,
		 @cod_error output, @mensaje output
  end

  --Numero de Linea o Secuencial
  begin
    execute @res= dte_nume_rut @nume_line, 'x', 'N','S', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20044 - NUME_LINE -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20001'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                 begin
               	   if @p_tipo_erro ='ERR'   
                      begin
                        set  @hay_err = '1'
                      end
                   else
                      begin
                        set  @hay_era = '1'
                      end
                 end 
            end
      end        
  end

  --Tipo de Codigo - tambien en otra tabla
  begin
   execute @res=dte_CHECK_DOMAIN '86',@tipo_codi, 'N',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20045 - TIPO_CODI -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20045'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                begin 
		  if @p_tipo_erro ='ERR'   
                     begin
                       set  @hay_err = '1'
                     end
                  else
                     begin
                       set  @hay_era = '1'
                     end
		end  
            end
      end
  end

  --Indicador de Exencion 
  begin
    execute @res=dte_CHECK_DOMAIN '85',@indi_exen, 'N',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20046 - INDI_EXEN -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20046'
             execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
             if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
	       end 
            end
      end
  end

  --Cantidad, que sea numero 
  begin
    execute @res= dte_nume_rut @cant_item, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20049 - CANT_ITEM -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20049'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
               end 
            end
      end
  end

  --Precio Unitario del Item en Pesos, que sea numero 
  begin
    execute @res= dte_nume_rut @prec_item, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20053 - PREC_ITEM -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20053'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
	       end 
            end
      end
  end

  --Monto Item - Valor Neto por linea de Detalle 
  begin
    execute @res= dte_mont_item @codi_empr,@tipo_docu, 
                    @foli_docu, @nume_line,@neto_item,@prec_item, 
                    @cant_item,@dcto_item,@reca_item, 
                    @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20061 - NETO_ITEM  -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20061'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                  if @p_tipo_erro ='ERR'   
                     begin
                       set  @hay_err = '1'
                     end
                  else
                     begin
                       set  @hay_era = '1'
                     end 
               end
            end
      end
  end

  /*****************************/
 /* Validacion DTEs no Boleta */
 /*****************************/
 if @p_bole_elec = 'N'
  begin
    --Cantidad de Referencia, que sea numero 
    begin
    execute @res= dte_nume_rut @cant_refe, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20047 - CANT_REFE -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20047'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                  if @p_tipo_erro ='ERR'   
                     begin
                   	set  @hay_err = '1'
                     end
              	  else
                     begin
                   	set  @hay_era = '1'
                     end 
               end
            end
      end
    end

    --Precio de Referencia - que sea numerico
    begin
    execute @res= dte_nume_rut @prec_refe, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20048 - PREC_REFE -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20048'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                  if @p_tipo_erro ='ERR'   
                     begin
                   	set  @hay_err = '1'
                     end
              	  else
                     begin
                   	set  @hay_era = '1'
                     end 
               end 
            end
      end
    end

    --Fecha de Elaboracion 
    begin
    execute @res=dte_vali_fech @fech_elab,'N',
                           @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20051 - FECH_ELAB -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20051'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                  if @p_tipo_erro ='ERR'   
                     begin
                   	set  @hay_err = '1'
                     end
              	  else
                     begin
                   	set  @hay_era = '1'
                     end 
               end 
            end
      end
    end

    --Fecha de Vencimiento 
    begin
    execute @res=dte_vali_fech @fech_vepr,'N',
                           @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20052 - FECH_VEPR -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20052'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                  if @p_tipo_erro ='ERR'   
                     begin
                   	set  @hay_err = '1'
                     end
              	  else
                     begin
                   	set  @hay_era = '1'
                     end 
               end 
            end
      end
    end

    --Precio Unitario en otra Moneda, que sea numero 
    begin
    execute @res= dte_nume_rut @prec_mono, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20054 - PREC_MONO -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20054'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                  if @p_tipo_erro ='ERR'   
                     begin
                   	set  @hay_err = '1'
                     end
              	  else
                     begin
                   	set  @hay_era = '1'
                     end 
               end
            end
      end
    end

    --Factor de Conversion , que sea numero
    begin
    execute @res= dte_nume_rut @fact_conv, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20055 - FACT_CONV -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20055'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                  if @p_tipo_erro ='ERR'   
                     begin
                   	set  @hay_err = '1'
                     end
              	  else
                     begin
                   	set  @hay_era = '1'
                     end 
               end
            end
      end
    end

    --Descuento,  Porcentaje, que sea numero 
    begin
    execute @res= dte_nume_rut @desc_porc, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20056 - DESC_PORC -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20056'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                  if @p_tipo_erro ='ERR'   
                     begin
                   	set  @hay_err = '1'
                     end
              	  else
                     begin
                   	set  @hay_era = '1'
                     end 
               end
            end
      end
    end

    --Descuento en $, monto, que sea numero  
    begin
    execute @res= dte_nume_rut @dcto_item, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20057 - DCTO_ITEM  -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20057'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                  if @p_tipo_erro ='ERR'   
                     begin
                   	set  @hay_err = '1'
                     end
              	  else
                     begin
                   	set  @hay_era = '1'
                     end 
               end
            end
      end
    end

    --Recargo, Porcentaje,  que sea numerico
    begin
    execute @res= dte_nume_rut @reca_porc, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20058 - RECA_PORC  -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20058'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                  if @p_tipo_erro ='ERR'   
                     begin
	               set  @hay_err = '1'
                     end
              	  else
                     begin
                   	set  @hay_era = '1'
                     end 
               end
            end
      end
    end

    --Recargo, monto, que sea numerico 
    begin
    execute @res= dte_nume_rut @reca_item, 'x', 'N','N', 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20059 - RECA_ITEM  -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20059'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
                  if @p_tipo_erro ='ERR'   
                     begin
                   	set  @hay_err = '1'
                     end
              	  else
                     begin
                   	set  @hay_era = '1'
                     end 
               end
            end
      end
    end
  end

  /**********************/
  /* Validacion Boletas */
  /**********************/
  if @p_bole_elec = 'S'
   begin
      begin
       execute @res= dte_campo_bole 'CODI_IMPU', @codi_impu, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                   begin
                      set  @hay_err = '1'
                   end
                 else
                   begin
                      set  @hay_era = '1'
                   end
  	      end
        end
      end

      begin
       execute @res= dte_campo_bole 'CANT_REFE', @cant_refe, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                   begin
                      set  @hay_err = '1'
                   end
                 else
                   begin
                      set  @hay_era = '1'
                   end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'UNID_REFE', @unid_refe, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'PREC_REFE', @prec_refe, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'PREC_MONO', @prec_mono, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'CODI_MONE', @codi_mone, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'FACT_CONV', @fact_conv, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'DCTO_ITEM', @dcto_item, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'RECA_ITEM', @reca_item, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'DESC_PORC', @desc_porc, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'RECA_PORC', @reca_porc, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'FECH_ELAB', @fech_elab, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'FECH_VEPR', @fech_vepr, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end
   end --If p_bole_elec = 'S'
 END
 begin
  update dte_deta_prse_p set  MNSG_ERRO=isnull(MNSG_ERRO,'') +@mensaje2
         where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_deta_prse_p.codi_empr
              and inserted.foli_docu =dte_deta_prse_p.foli_docu
              and inserted.tipo_docu =dte_deta_prse_p.tipo_docu)
 end
END
END
GO

GO
--SqlScripter----[dbo].[trg_dte_docu_refe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_docu_refe]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_docu_refe]')
GO
CREATE TRIGGER [dbo].[trg_dte_docu_refe]
ON dte_docu_refe for insert   AS
BEGIN 
 declare
  @res   	varchar (10), 	@p_codi 	varchar(5), 
  @hay_era 	varchar(2), 	@hay_err	varchar(2),
  @fecha  	varchar(10), 	@mensaje 	varchar(2000),
  @mensaje2 	varchar(2000), 	@cod_error 	varchar(10), 
  @es_numero	varchar(2), 	@p_existe 	varchar(1),
  @p_mensaje 	varchar(80), 	@p_salida	varchar(80),
  @p_ex  	varchar(1), 	@p_men 		varchar(80),
  @p_codi_erro 	varchar(12), 	@p_desc_erro 	varchar(50),
  @p_tipo_erro 	varchar(10), 	@codi_empr 	varchar(10),
  @tipo_docu 	varchar(3), 	@foli_docu 	varchar(10),
  @nume_refe 	varchar(2), 	@descrip 	varchar(80),
  @tipo_refe 	varchar(3), 	@foli_refe 	varchar(18),
  @rutt_otro 	varchar(9), 	@digi_otro 	varchar(1),
  @fech_refe 	varchar(10), 	@indi_regl 	varchar(1),
  @codi_refe 	varchar(1), 	@corr_fact 	varchar(80),
  @p_bole_elec 	varchar(1), 	@p_tipo_dnte 	varchar(1),
  @p_indi_dnte 	varchar(1)
 BEGIN
   begin
    select 
      @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
      @foli_docu=FOLI_DOCU, @nume_refe=NUME_REFE,
      @tipo_refe=TIPO_REFE, @foli_refe=FOLI_REFE,
      @rutt_otro=RUTT_OTRO, @digi_otro=DIGI_OTRO,
      @fech_refe=FECH_REFE, @indi_regl=INDI_REGL,
      @codi_refe=CODI_REFE
    from inserted
   end
   begin
     set  @hay_err = 'N'
     set  @mensaje2 =''
     set  @descrip = 'TIPO_DOCU'
     
     execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                            @p_existe output, @p_mensaje output
     execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                   @p_bole_elec output, @p_tipo_dnte output, 
	 	   @cod_error output, @mensaje output
   end
   
   -- valida llave
   begin 
     execute @res= dte_refe_line @codi_empr,@tipo_docu,@foli_docu,
                   @nume_refe,@cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 = @mensaje2 + '-20066 - DOC. REFE -'
                      +@mensaje
	 if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20066'
              execute @res= dte_chec_erro @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end        
   end

 /*******************************/
 /*  Validacion DTEs no Boleta  */
 /*******************************/
 if @p_bole_elec = 'N'
  begin
   -- Codigo de Referencia 
   begin
   
   if ((@codi_refe is not null) and (@codi_refe != ' '))
    begin
     if @tipo_docu in (56,61)
      begin
      	execute @res=dte_CHECK_DOMAIN '74',@codi_refe, 'N',
                              @cod_error output, @mensaje output
      end
     else
      if @tipo_docu = '33'
        begin
            set @cod_error = 'S'  
            set @mensaje = 'Debe ser Nulo'
        end
  
     if @cod_error = 'S' 
       begin
         set @mensaje2 =@mensaje2 + '-20070 - CODI_REFE -'
                      + @mensaje          
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20070'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end 
	       end
            end
      end        
    end
   end

   -- Tipo de Documento de Referencia 
   if (@tipo_refe is not null) and (rtrim(@tipo_refe) <> '')
    begin
       set @cod_error = 'N'
       execute @res = prd_dte_tipo_refe @tipo_refe, 
 		      @cod_error output, @mensaje output
       if @cod_error = 'S' 
       begin          
         set @mensaje2 = @mensaje2 + '-20067 - TIPO_REFE -'
                         + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20067'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
       end        
   end
  
   --Indicador de Referencia Global
   begin
   if @indi_regl is not null 
    begin
      execute @res=dte_CHECK_DOMAIN '70',@indi_regl, 'N',
                              @cod_error output, @mensaje output
     if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2 + '-20078 - INDI_REGL -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20078'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end 
	       end
            end
      end        
    end
   end

   -- Folio, Correlativo de referencia
   begin
      execute @res= dte_foli_refe @foli_refe, @indi_regl,
                         @cod_error output, @mensaje output     
	     if @cod_error = 'S' 
	       begin          
	         set @mensaje2 =@mensaje2 + '-20079 - FOLI_REFE -'
	                      + @mensaje
	         if  @p_salida = 'TOTAL' 
	             begin
	                set  @hay_err = '1'
	                raiserror (@mensaje2,16,1)
	             end
	         else
	           if  @p_salida  = 'PARCIAL' 
	            begin
	             set @p_codi ='20079'
	              execute @res= dte_chec_erro  @p_codi,
	                           @p_desc_erro output, @p_tipo_erro output,
	                           @p_indi_dnte output, @p_existe output, @p_mensaje output
	              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
	               begin
	 		if @p_tipo_erro ='ERR'   
	                begin
	                   set  @hay_err = '1'
	                   raiserror (@mensaje2,16,1)
	                end
	              	else
	                begin
	                   set  @hay_era = '1'
	                end 
		       end
	            end
	      end     
   end
 
   -- RUT otro contribuyente 
   begin
   if @rutt_otro is not null 
    begin
      execute @res= dte_nume_rut @rutt_otro, @digi_otro,'S','N',
                         @cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2 + '-20068 - RUTT_OTRO -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20068'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end        
    end
   end

   -- Fecha de la Referencia  
   begin
   if (@fech_refe is not null) and (rtrim(@fech_refe) <> ' ')
    begin
     execute @res= dte_vali_fech @fech_refe, 'S',
                        @cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2 + '-20069 - FECH_REFE -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20069'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end 
	       end
            end
      end        
    end
   end
  end --if p_bole_elec = 'N'

 /****************************/
 /*  Validacion para Boleta  */
 /****************************/
 if @p_bole_elec = 'S'
  begin
      set @mensaje2 = ''
      begin
       execute @res= dte_campo_bole 'TIPO_REFE', @tipo_refe, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'FOLI_REFE', @foli_refe, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'RUTT_OTRO', @rutt_otro, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'DIGI_OTRO', @digi_otro, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'FECH_REFE', @fech_refe, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'INDI_REGL', @indi_regl, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end
  end

 /*begin
     update dte_docu_refe set  MNSG_ERRO=isnull(MNSG_ERRO,'')+@mensaje2
     where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_docu_refe.codi_empr
            and inserted.foli_docu =dte_docu_refe.foli_docu
            and inserted.tipo_docu =dte_docu_refe.tipo_docu)
 end*/
 END
END
GO

GO
--SqlScripter----[dbo].[trg_dte_docu_refe_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_docu_refe_p]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_docu_refe_p]')
GO
CREATE TRIGGER [dbo].[trg_dte_docu_refe_p]
ON dte_docu_refe_p for insert   AS
BEGIN 
 declare
  @res   	varchar (10), 	@p_codi 	varchar(5), 
  @hay_era 	varchar(2), 	@hay_err	varchar(2),
  @fecha  	varchar(10), 	@mensaje 	varchar(2000),
  @mensaje2 	varchar(2000), 	@cod_error 	varchar(10), 
  @es_numero 	varchar(2), 	@p_existe 	varchar(1),
  @p_mensaje 	varchar(80), 	@p_salida 	varchar(80),
  @p_ex  	varchar(1), 	@p_men 		varchar(80),
  @p_codi_erro 	varchar(12), 	@p_desc_erro 	varchar(50),
  @p_tipo_erro 	varchar(10), 	@codi_empr 	varchar(10),
  @tipo_docu 	varchar(3), 	@foli_docu 	varchar(10),
  @nume_refe 	varchar(2), 	@descrip 	varchar(80),
  @tipo_refe 	varchar(3), 	@foli_refe 	varchar(10),
  @rutt_otro 	varchar(9), 	@digi_otro 	varchar(1),
  @fech_refe 	varchar(10), 	@indi_regl 	varchar(1),
  @codi_refe 	varchar(1), 	@corr_fact 	varchar(80),
  @p_bole_elec 	varchar(1), 	@p_tipo_dnte 	varchar(1),
  @p_indi_dnte 	varchar(1)
 BEGIN
   begin
    select 
      @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
      @foli_docu=FOLI_DOCU, @nume_refe=NUME_REFE,
      @tipo_refe=TIPO_REFE, @foli_refe=FOLI_REFE,
      @rutt_otro=RUTT_OTRO, @digi_otro=DIGI_OTRO,
      @fech_refe=FECH_REFE, @indi_regl=INDI_REGL,
      @codi_refe=CODI_REFE
    from inserted
   end
   begin
     set  @hay_err = 'N'
     set  @mensaje2 =''
     set @descrip = 'TIPO_DOCU'
     execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
             @p_existe output, @p_mensaje output
     execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                  @p_bole_elec output, @p_tipo_dnte output, 
		  @cod_error output, @mensaje output
   end

   -- valida llave
   begin 
     execute @res= dte_refe_line @codi_empr,@tipo_docu,@foli_docu,
                   @nume_refe,@cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 = @mensaje2 + '-20066 - DOC. REFE -'
                      +@mensaje
	 if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20066'
              execute @res= dte_chec_erro @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end        
   end

 /*******************************/
 /*  Validacion DTEs no Boleta  */
 /*******************************/
 if @p_bole_elec = 'N'
  begin
   -- Codigo de Referencia 
   begin
   if (@codi_refe is not null)
    begin
     if @tipo_docu in (56,61)
      begin
      	execute @res=dte_CHECK_DOMAIN '74',@codi_refe, 'N',
                              @cod_error output, @mensaje output
      end
     else
      if @tipo_docu = '33'
        begin
            set @cod_error = 'S'  
            set @mensaje = 'Debe ser Nulo'
        end
  
     if @cod_error = 'S' 
       begin
         set @mensaje2 =@mensaje2 + '-20070 - CODI_REFE -'
                      + @mensaje          
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20070'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              	else
                begin
                   set  @hay_era = '1'
                end 
	       end
            end
      end        
    end
   end

   -- Tipo de Documento de Referencia 
   begin
   if (@tipo_refe is not null) and (rtrim(@tipo_refe) <> ' ')
    begin
       execute @res = prd_dte_tipo_refe @tipo_refe,
		@cod_error output, @mensaje output
       if @cod_error = 'S' 
       begin          
         set @mensaje2 = @mensaje2 + '-20067 - TIPO_REFE -'
                         + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20067'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
       end        
    end
   end
  
   --Indicador de Referencia Global
   begin
   if @indi_regl is not null 
    begin
      execute @res=dte_CHECK_DOMAIN '70',@indi_regl, 'N',
                              @cod_error output, @mensaje output
     if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2 + '-20078 - INDI_REGL -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20078'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              	else
                begin
                   set  @hay_era = '1'
                end 
	       end
            end
      end        
    end
   end

   -- Folio, Correlativo de referencia
   begin
      execute @res= dte_foli_refe @foli_refe, @indi_regl,
                         @cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2 + '-20079 - FOLI_REFE -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20079'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              	else
                begin
                   set  @hay_era = '1'
                end 
	       end
            end
      end        
   end
 
   -- RUT otro contribuyente */
   begin
   if @rutt_otro is not null 
    begin
      execute @res= dte_nume_rut @rutt_otro, @digi_otro,'S','N',
                         @cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2 + '-20068 - RUTT_OTRO -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20068'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end        
    end
   end

   -- Fecha de la Referencia  
   begin
   if (@fech_refe is not null) and (rtrim(@fech_refe) <> ' ')
    begin
     execute @res= dte_vali_fech @fech_refe, 'S',
                        @cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2 + '-20069 - FECH_REFE -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20069'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              	else
                begin
                   set  @hay_era = '1'
                end 
	       end
            end
      end        
    end
   end
  end --if p_bole_elec = 'N'

 /****************************/
 /*  Validacion para Boleta  */
 /****************************/
 if @p_bole_elec = 'S'
  begin
      set @mensaje2 = ''
      begin
       execute @res= dte_campo_bole 'TIPO_REFE', @tipo_refe, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'FOLI_REFE', @foli_refe, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'RUTT_OTRO', @rutt_otro, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'DIGI_OTRO', @digi_otro, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'FECH_REFE', @fech_refe, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'INDI_REGL', @indi_regl, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end
  end

 begin
    update dte_docu_refe_p set  MNSG_ERRO = isnull(MNSG_ERRO,'') + @mensaje2
    where EXISTS 
          (select *  from inserted
           where inserted.codi_empr =dte_docu_refe_p.codi_empr
           and inserted.foli_docu =dte_docu_refe_p.foli_docu
           and inserted.tipo_docu =dte_docu_refe_p.tipo_docu)
 end
 END
END
GO

GO
--SqlScripter----[dbo].[trg_dte_enca_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_enca_docu]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_enca_docu]')
GO
CREATE TRIGGER [dbo].[trg_dte_enca_docu]
ON [dbo].[dte_enca_docu]
    for insert, update AS
BEGIN
declare
    @hay_err     varchar(2),     @hay_era     varchar(2),
    @esta_docu   varchar(3),     @esta_docu_old varchar(3),
    @descrip     varchar(80),    @fecha       varchar(10),
    @mensaje     varchar(2000),  @cod_error   varchar(10),
    @p_existe    varchar(1),     @p_desc_erro varchar(50),
    @p_mensaje   varchar(80),    @p_salida    VARCHAR(80),
    @p_ex        varchar(1),     @p_men       varchar(80),
    @p_codi_erro varchar(12),    @mensaje2    varchar(2000),
    @p_tipo_erro varchar(12),    @MNSG_ERRO   varchar(2000),
    @p_codi      varchar(5),     @p_param     varchar(20),
    @p_param2    varchar(20),    @p_param3    varchar(20),
    @p_param4    varchar(20),    @res         varchar(10),
    @dire_arch   varchar(100),   @dire_arch_old varchar(100),
    @ult_foli    varchar(10),    @codi_empr   varchar(20),
    @tipo_docu   varchar(20),    @foli_docu   varchar(20),
    @corr_envi   varchar(22),    @vers_enca   varchar(20),
    @fech_emis   varchar(10),    @entr_bien   varchar(20),
    @vent_serv   varchar(20),    @indi_vegd   varchar(20),
    @form_pago   varchar(20),    @fech_canc   varchar(10),
    @mont_brut   varchar(20),    @moda_pago   varchar(20),
    @fech_venc   varchar(10),    @rutt_emis   varchar(20),
    @peri_desd   varchar(20),    @peri_hast   varchar(20),
    @digi_emis   varchar(20),    @nomb_emis   varchar(100),
    @giro_emis   varchar(20),    @nomb_sucu   varchar(20),
    @codi_sucu   varchar(20),    @dire_orig   varchar(60),
    @comu_orig   varchar(20),    @ciud_orig   varchar(20),
    @rutt_rece   varchar(20),    @digi_rece   varchar(20),
    @nomb_rece   varchar(20),    @giro_rece   varchar(40),
    @cont_rece   varchar(80),    @dire_rece   varchar(100),
    @comu_rece   varchar(20),    @ciud_rece   varchar(20),
    @rutt_sofa   varchar(20),    @digi_sofa   varchar(20),
    @info_tran   varchar(20),    @rutt_tran   varchar(20),
    @digi_tran   varchar(20),    @dire_dest   varchar(40),
    @comu_dest   varchar(20),    @ciud_dest   varchar(20),
    @mont_neto   varchar(20),    @mont_exen   varchar(20),
    @impu_vaag   varchar(20),    @impu_vanr   varchar(20),
    @cred_es65   varchar(20),    @gara_enva   varchar(20), 
    @mont_tota   varchar(20),    @mont_nofa   varchar(20),
    @valo_paga   varchar(20),    @codi_ceco   varchar(20),
    @corr_rafo   varchar(20),    @codi_tepa   varchar(20), 
    @dias_tepa   varchar(20),    @sald_ante   varchar(20),
    @tasa_vaag   varchar(20),    @codi_vend   varchar(20),
    @rutt_mand   varchar(20),    @digi_mand   varchar(20),
    @indi_nore   varchar(20),    @mont_base   varchar(20),
    @p_dire_arch varchar(100),   @p_dia_mes varchar(2),
    @p_dia_res   varchar(2),     @p_dia_ok    varchar(1),
    @p_bole_elec varchar(1),     @p_rutt_cero varchar(1),
    @codi_rece   varchar(40),    @p_tipo_dnte varchar(1),
    @p_indi_dnte varchar(1),     @numero      numeric(18),
    @p_aux_esta_defi varchar(3), @countDte    numeric(1),
    @v_esta_temp varchar(3),     @v_codi_emex varchar(30)

    SET DATEFORMAT ymd
    begin
        select 
            @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU, 
            @foli_docu=FOLI_DOCU, @esta_docu=ESTA_DOCU,
            @corr_envi=CORR_ENVI, @vers_enca=VERS_ENCA, 
            @fech_emis=FECH_EMIS, @entr_bien=ENTR_BIEN, 
            @vent_serv=VENT_SERV, @indi_vegd=INDI_VEGD, 
            @form_pago=FORM_PAGO, @fech_canc=FECH_CANC,
            @mont_brut=MONT_BRUT, @moda_pago=MODA_PAGO, 
            @fech_venc=FECH_VENC, @rutt_emis=RUTT_EMIS, 
            @peri_desd=PERI_DESD, @peri_hast=PERI_HAST,
            @digi_emis=DIGI_EMIS, @nomb_emis=NOMB_EMIS, 
            @giro_emis=GIRO_EMIS, @nomb_sucu=NOMB_SUCU, 
            @codi_sucu=CODI_SUCU, @dire_orig=DIRE_ORIG,
            @comu_orig=COMU_ORIG, @ciud_orig=CIUD_ORIG, 
            @rutt_rece=RUTT_RECE, @digi_rece=DIGI_RECE, 
            @nomb_rece=NOMB_RECE, @giro_rece=GIRO_RECE,
            @cont_rece=CONT_RECE, @dire_rece=DIRE_RECE, 
            @comu_rece=COMU_RECE, @ciud_rece=CIUD_RECE, 
            @rutt_sofa=RUTT_SOFA, @digi_sofa=DIGI_SOFA,
            @info_tran=INFO_TRAN, @rutt_tran=RUTT_TRAN, 
            @digi_tran=DIGI_TRAN, @dire_dest=DIRE_DEST, 
            @comu_dest=COMU_DEST, @ciud_dest=CIUD_DEST,
            @mont_neto=MONT_NETO, @mont_exen=MONT_EXEN, 
            @impu_vaag=IMPU_VAAG, @impu_vanr=IMPU_VANR, 
            @cred_es65=CRED_ES65, @gara_enva=GARA_ENVA,
            @mont_tota=MONT_TOTA, @mont_nofa=MONT_NOFA, 
            @valo_paga=VALO_PAGA, @codi_ceco=CODI_CECO, 
            @corr_rafo=CORR_RAFO, @codi_tepa=CODI_TEPA,
            @dias_tepa=DIAS_TEPA, @sald_ante=SALD_ANTE, 
            @tasa_vaag=TASA_VAAG, @mont_base=MONT_BASE, 
            @dire_arch=DIRE_ARCH, @codi_rece=CODI_RECE,
            @codi_vend=CODI_VEND, @rutt_mand=RUTT_MAND, 
            @digi_mand=DIGI_MAND, @indi_nore=INDI_NORE,
            @v_codi_emex=codi_emex
        from inserted
    end

    select @countDte = count(*) from deleted 
    --valida que cuando se inserte el registro, este no se valide los campos, si se actualiza a estado ini, este valide los campos
    --para que no se gatille cada vez que se actualiza el estado
    if(@countDte = 0 and @esta_docu<>'SCM' and @esta_docu <> 'PEN' and @esta_docu <> 'PRC') or (UPDATE(esta_docu) and @esta_docu = 'ING')
    begin
        set @hay_err = '0'
        set @hay_era = '0'
        set @mensaje2 =' '
        begin
            exec dbnet_set_emex @v_codi_emex

            execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,@p_existe output, @p_mensaje output
            --Recupera la direccion del archivo con la firma
            if  isnull(@dire_arch,'x')='x' or @dire_arch = ''
            begin
                execute PAEM_GET_VAL @codi_empr, 'ALL', 'EDS0', @p_dire_arch output, @p_existe output, @p_mensaje output
                if(@p_existe = 'N' or @p_dire_arch is null)
                begin
                    execute PARA_GET_VAL 'EGATE_DIRE_SALI', @p_dire_arch output, @cod_error output, @mensaje output
                end
                
                execute PARA_GET_VAL 'EGATE_DIRE_DIA',@p_dia_res output, @p_dia_ok output, @p_mensaje output
                if @p_dia_ok ='S' 
                begin
                    if @p_dia_res ='1'
                        set @p_dia_mes =  convert(char(2),DATEPART(dd, GETDATE()))
                    else
                        set @dire_arch = @p_dire_arch
                end
                else
                    set @dire_arch = @p_dire_arch
    
                --valida error de :DTE_DIRE_SALI
                if @cod_error = 'N' 
                begin
                    set @mensaje2 =@mensaje2 +' - 20083 -  DIRE SALI -'+ @mensaje
                    if  @p_salida = 'TOTAL' 
                        set  @hay_err = '1'
                    else if  @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20083'
                        execute @res= dte_chec_erro @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                        begin
                            if @p_tipo_erro ='ERR'
                                set  @hay_err = '1'
                            else
                                set  @hay_era = '1'
                        end
                    end
                end
            end -- if isnull no recupera dir
        end

        --Tipo Documento - valida en  DTE_TIPO_DOCU
        begin
            set @descrip = 'TIPO_DOCU'
            execute @res= dte_chec_tido_veel_esta @tipo_docu, @descrip output,
                            @p_bole_elec output, @p_tipo_dnte output,
                            @p_aux_esta_defi output,
                            @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin
                set @mensaje2 =@mensaje2+ ' -20005 - TIPO_DOCU -'+ @mensaje
                if  @p_salida = 'TOTAL'
                begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                end
                else if  @p_salida  = 'PARCIAL'
                begin
                    set @p_codi ='20005'
                    execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                        if @p_tipo_erro ='ERR'
                        begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                        end
                        else
                            set @hay_era = '1'
                    end
                end
            end
        end
    
        --Valida rango de Folios
        begin
            execute @res= dte_chec_rang_foli @codi_empr,@tipo_docu,
                            @corr_rafo output, @foli_docu, @fech_emis, @ult_foli output,
                            @cod_error output, @mensaje output
            if @cod_error = 'S'
            begin
                set @mensaje2 =@mensaje2+ ' -20001 -  Rango Folio -'+ @mensaje
                if @p_salida = 'TOTAL'
                begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                end
                else if @p_salida  = 'PARCIAL'
                begin
                    set @p_codi ='20001'
                    execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                        if @p_tipo_erro ='ERR'
                        begin
                            set  @hay_err = '1'
                            set @v_esta_temp = substring(@mensaje, 1, 3)
                            --raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                            set @v_esta_temp = substring(@mensaje, 1, 3)
                            set @hay_era = '1'
                        end
                    end
                end
            end
        end
    
        -- Estado del Documento 
        begin
            set @descrip = 'ESTA DOCU'
            execute @res= dte_chec_esta_docu @esta_docu, @descrip output,
            @cod_error output, @mensaje output
            if @cod_error = 'S' 
                begin
                set @mensaje2 =@mensaje2+ ' -20004 - ESTA_DOCU -'+@mensaje
                if  @p_salida = 'TOTAL'
                begin
                    set @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                end
                else
                if @p_salida  = 'PARCIAL'
                begin
                    set @p_codi ='20004'
                    execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                        if @p_tipo_erro ='ERR'
                        begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                        end
                        else
                            set  @hay_era = '1'
                    end
                end
            end
        end
    
        --Folio del Documento 
        begin 
            execute @res=dte_nume_rut @foli_docu, 'x', 'N','S',
                            @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin
                set @mensaje2 =@mensaje2+ ' -20006 - FOLI_DOCU -'+@mensaje
                if  @p_salida = 'TOTAL'
                begin
                    set @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                end
                else if  @p_salida  = 'PARCIAL'
                begin
                    set @p_codi ='20006'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                        if @p_tipo_erro ='ERR'
                        begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                        end
                        else
                            set  @hay_era = '1'
                    end
                end
            end
        end
    
        /*Fecha de Emision */
        begin
            if (@fech_emis is null) or (rtrim(@fech_emis) = ' ')  
            begin
            set @cod_error = 'S'
            set @mensaje = 'Fecha Emision Nula'
            end
            else
            begin
                execute @res=dte_vali_fech @fech_emis,'S',
                                @cod_error output, @mensaje output
            end
            if @cod_error = 'S' 
            begin
                set @mensaje2 =@mensaje2+ ' -20007 - FECH_EMIS -'+@mensaje
                if  @p_salida = 'TOTAL' 
                begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                end
                else if @p_salida = 'PARCIAL' 
                begin
                    set @p_codi ='20007'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                if(@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                begin
                    if @p_tipo_erro ='ERR'   
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                    else
                        set  @hay_era = '1'
                    end
                end
            end
        end
    
        --Indicador Venta Servicio Periodico
        begin
            if @p_bole_elec = 'S'
                execute @res = dte_CHECK_DOMAIN '80',@vent_serv, 'S',@cod_error output, @mensaje output
            else
                execute @res = dte_CHECK_DOMAIN '76',@vent_serv, 'N',@cod_error output, @mensaje output
    
            if @cod_error = 'S' 
            begin
                set @mensaje2 = @mensaje2 + ' -20010 - VENT_SERV -'+ @mensaje
                if @p_salida = 'TOTAL' 
                begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                end
                else if  @p_salida  = 'PARCIAL'
                begin
                    set @p_codi ='20010'
                    execute @res= dte_chec_erro @p_codi,@p_desc_erro output, @p_tipo_erro output,@p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                        if @p_tipo_erro ='ERR'
                        begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                        end
                        else
                            set  @hay_era = '1'
                    end
                end
            end
        end
    
        -- Indicador Montos Brutos  
        begin
            if @p_bole_elec = 'S'
                execute @res = dte_CHECK_DOMAIN '81',@mont_brut, 'N',@cod_error output, @mensaje output
            else
                execute @res = dte_CHECK_DOMAIN '75',@mont_brut, 'N',@cod_error output, @mensaje output
            
            if @cod_error = 'S' 
            begin          
                set @mensaje2 = @mensaje2 + ' -20011 - MONT_BRUT -'+@mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                begin
                    set @p_codi ='20011'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                        if @p_tipo_erro ='ERR'   
                        begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                        end
                        else
                        set  @hay_era = '1'
                    end 
                end
            end
        end
        
        --Periodo  Desde 
        begin
            execute @res=dte_fech_deha  @peri_desd, @peri_hast, 'D',
                                @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20014 - PERI_DESD -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                begin
                    set @p_codi ='20014'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                        if @p_tipo_erro ='ERR'   
                        begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                        end
                        else
                            set  @hay_era = '1'
                    end
                end
            end
        end
        
        --Periodo  Hasta
        begin
            execute @res=dte_fech_deha  @peri_desd, @peri_hast, 'D',@cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20015 - PERI_HAST -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                end
                else
                if  @p_salida  = 'PARCIAL' 
                begin
                    set @p_codi ='20015'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                        if @p_tipo_erro ='ERR'   
                        begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                        end
                        else
                            set  @hay_era = '1'
                    end
                end
            end
        end
        
        /*--Fecha de Vencimiento*/
        begin
        execute @res=dte_vali_fech @fech_venc,'S',
                                @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20019 - FECH_VENC -'+@mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                begin
                    set @p_codi ='20019'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                        if @p_tipo_erro ='ERR'   
                        begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                        end
                        else
                            set  @hay_era = '1'
                    end
                end
            end
        end
        
        --Rut, digito  del Emisor
        begin
            execute @res=dte_nume_rut @rutt_emis, @digi_emis, 'S','S',
                                    @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20020 - RUTT_EMIS - DIGI - -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20020'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
        
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end
                end 
                    end
            end        
        end
        
        -- Codigo de Sucursal,  solo se valida que sea numerico 
        begin
            execute @res=dte_codi_sucu @codi_empr, @codi_sucu,
                                    @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20023 - EMPR - CODI SUCU -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20023'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end               
                else
                        begin
                        set  @hay_era = '1'
                        end 
                end
                    end
            end
        end
        
        --Rut Receptor
        begin
            set @p_rutt_cero = null;
            if @p_bole_elec = 'N'      
            execute @res = dte_nume_rut @rutt_rece, @digi_rece, 'S','S',
                            @cod_error output, @mensaje output
            else
            begin
            if @rutt_rece <> 0 
                begin
            execute @res = dte_nume_rut @rutt_rece, @digi_rece , 'S', 'S', 
                    @cod_error output, @mensaje output
                end
            else
                begin
            set @digi_rece = '0'
            set @p_rutt_cero = 'S'
            end
            end
        
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20024 - RUTT_RECE - DIGI -'+
                            @mensaje
                if @p_salida = 'TOTAL' 
                begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
                end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20024'
                    execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end 
                end
                    end
            end        
        end
        
        --Nombre Receptor
        begin
            if (@nomb_rece is null) or (rtrim(@nomb_rece) = ' ')  
            begin          
                set @mensaje2 = @mensaje2 + ' -20084 - NOMBRE RECEPTOR NULO -'
                if  @p_salida = 'TOTAL' 
                    begin
                            set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20084'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end 
                    end
                    end
            end        
        end
        
        --Monto neto,valida rango y numerico
        begin
        execute @res=dte_monto_neto @mont_neto, 'S', 
                                    @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20031 - MONT_NETO -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20031'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end 
                end
                    end
            end
        end
        
        /*--Monto no Afecto o Exento desc y reca globales no estan insertados
        begin
            execute @res=dte_monto_exen @mont_exen, 'N',
                                    @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20032 - MONT_EXEN -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20032'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end 
                end
                    end
            end
        end*/
        
        --Monto Total
        begin
            set @cod_error = 'N'
            set @mensaje = ''    
        
            if (@mont_tota >= '0')
            begin
                set @cod_error = 'N'
                set @mensaje = ''    
            end
            else
            begin
                if(@tipo_docu != 43)
                begin
                    set @cod_error = 'S'
                    set @mensaje = 'Valor Negativo en Monto Total';
                end
            end          
            
            /*ecute @res=dte_nume_rut @mont_tota,'x', 'N','N',
                                    @cod_error output, @mensaje output*/
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20038 - MONT_TOTA -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20038'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end
                end 
                    end
            end        
        end
        
        --Monto No Facturable
        begin
        execute @res=dte_nume_rut @mont_nofa,'x', 'N','N',
                                    @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20039 - MONT_NOFA -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20039'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end 
                end
                    end
            end        
        end
        
        --Saldo Anterior
        begin
            execute @res=dte_nume_rut @sald_ante,'0','N','N',
                                @cod_error output, @mensaje output     
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20040 - VALO_PAGA -'
                            + @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20040'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,                            
                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end 
                end
                    end
            end
        end
        
        --Valor A pagar, que sea numero
        begin
            execute @res=dte_nume_rang @valo_paga, 'x', 'N',
                                    @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20040 - VALO_PAGA -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20040'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end 
                end
                    end
            end
        end
        
        /*****************************/
        /* Validacion DTEs no Boleta */
        /*****************************/
        if @p_bole_elec = 'N'
        begin 
        --Tipo De Despacho, tipo de documento 
            begin
            execute @res = dte_CHECK_DOMAIN '95',@entr_bien, 'N',
                            @cod_error output, @mensaje output
            if @cod_error = 'S' 
                begin          
                set @mensaje2 = @mensaje2+ ' -20008 - ENTR_BIEN -'+
                                @mensaje
                if  @p_salida = 'TOTAL' 
                begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                end
                else
                if @p_salida  = 'PARCIAL' 
                begin
                    set @p_codi ='20008'
                    execute @res= dte_chec_erro  @p_codi,
                            @p_desc_erro output, @p_tipo_erro output,
                            @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                        begin
                        if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end 
                        end
                    end
                end
            end --Tipo de Despacho
        
            -- Indicador De Venta con Guia de Despacho
            begin
            if @tipo_docu ='52' 
                begin
                execute @res = dte_CHECK_DOMAIN '96',@indi_vegd, 'N',
                                @cod_error output, @mensaje output
                if @cod_error = 'S' 
                    begin          
                        set @mensaje2 = @mensaje2+ ' -20009 - INDI_SEGD -'+
                                    @mensaje
                if @p_salida = 'TOTAL' 
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                    else
                        if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20009'
                        execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                        begin
                    if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                            end
                            else
                            begin
                            set  @hay_era = '1'
                            end 
                            end
                        end
                    end -- Cod Error
                end -- Tipo Docu
            end --Indicador de Venta
            
            -- Forma de Pago 
            begin
            execute @res=dte_CHECK_DOMAIN '94',@form_pago, 'N',
                                    @cod_error output, @mensaje output
                if @cod_error = 'S' 
                begin          
                    set @mensaje2 =@mensaje2+ ' -20012 - FORM_PAGO -'+
                                @mensaje
                    if  @p_salida = 'TOTAL' 
                        begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                        end
                    else
                    if  @p_salida  = 'PARCIAL' 
                        begin
                        set @p_codi ='20012'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                        begin
                    if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                            else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                        end
                end
            end -- Forma Pago
            
            /*-- Fecha de Cancelacion 
            begin
                execute @res=dte_vali_fech @fech_canc,'S',
                                    @cod_error output, @mensaje output
                if @cod_error = 'S' 
                begin          
                    set @mensaje2 =@mensaje2+ ' -20013 - FECH_CANC -'+
                                @mensaje
                    if  @p_salida = 'TOTAL' 
                        begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                        end
                    else
                    if  @p_salida  = 'PARCIAL' 
                        begin
                        set @p_codi ='20013'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                        begin
                    if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                            else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                        end
                end        
            end*/
            
            --Modalidad de Pago
            begin
            execute @res=dte_CHECK_DOMAIN '87',@moda_pago, 'N',
                                @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20016 - MODO_PAGO -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20016'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end
                end 
                    end
            end
            end
        
            --Termino de Pago, Cantidad en dias (>0)
            begin
            execute @res=  dte_nume_rang @dias_tepa,'1','N',
                                @cod_error output, @mensaje output 
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20017 - CODI_TEPA -'
                            + @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20017'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end 
                end
                    end
            end
            end -- Termino de Pago
        
            -- Rut de Solicitante de Factura
            begin
            if @rutt_rece != @rutt_sofa 
            begin
            execute @res = dte_nume_rut @rutt_sofa, @digi_sofa, 'S','N',
                            @cod_error output, @mensaje output
            if @cod_error = 'S' 
                begin          
                set @mensaje2 =@mensaje2+ ' -20025 - RUTT_SOFA - DIGI -'+
                                @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20025'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                        end
        
                        else
                        begin
                        set  @hay_era = '1'
                        end
                    end 
                    end
                end        
            end
            end -- Rut Solicitante Factura
        
            --Informaci¾n Transporte - patente
            begin
            execute @res=dte_info_tran @info_tran, @entr_bien, 'N', 
                                    @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 = @mensaje2+ ' -20026 - INFO_TRAN -'+
                                @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20026'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end
                end 
                    end
            end        
            end -- Informacion Transporte
        
            -- Rut de transportista
            begin
            execute @res=dte_nume_rut @rutt_tran, @digi_tran, 'S','N',
                                    @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20027 - RUTT_TRAN - DIGI -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                            set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20027'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end
                end 
                    end
            end        
            end -- Rut Transportista
        
            --Direccion de Destino
            begin
            execute @res=dte_tran_otro @dire_dest, @entr_bien, @dire_rece, 'N', 
                                    @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20028 - DIRE_DEST -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20028'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
        
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end
                end 
                    end
            end        
            end --Direccion de Destino
        
            --Comuna Destino
            begin
            execute @res=dte_tran_otro @comu_dest, @entr_bien, @comu_rece, 'N', 
                                    @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20029 - COMU_DEST -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20029'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end 
                end
                    end
            end
            end -- Comuna de Destino
        
            --Ciudad Destino
            begin
            execute @res=dte_tran_otro @ciud_dest, @entr_bien, @ciud_rece, 'N', 
                                    @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20030 - CIUD_DEST -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20030'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end 
                end
                    end
            end
            end -- Ciudad de Destino
        
            --IVA  
            begin
            execute @res= dte_calc_iva @impu_vaag,@tasa_vaag, @mont_neto, 
                            @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 = @mensaje2+ ' -20033 - IMPU_VAAG -'+
                                isnull(@mensaje,'')
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20033'
                        execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output               
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                        begin
                if @p_tipo_erro ='ERR'   
                        begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                            set  @hay_era = '1'
                        end
                end 
                    end
            end
            end --IVA
        
            --Credito Especial 65% Constructoras 
            begin
            execute @res= dte_cred_espe @cred_es65,@impu_vaag, '0.65', 'N',
                            @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 = @mensaje2 + ' -20036 - CRED_ES65 -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20036'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
                end
                else
                begin
                set  @hay_era = '1'
                end
                end 
                    end
            end
            end
            --Giro del Receptor
            execute @res= dte_dato_recep 'GIRO_RECE',@giro_rece, 
                    '1', @cod_error output, @mensaje output
            if @cod_error = 'S'
            begin
                set @mensaje2 = @mensaje2 + '- 20090 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                begin
                    set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                end
            else
                    if @p_salida  = 'PARCIAL' 
                    begin
                            set @p_codi ='20090'
                            execute @res= dte_chec_erro  @p_codi,
                                        @p_desc_erro output, @p_tipo_erro output,
                                        @p_indi_dnte output, @p_existe output, @p_mensaje output
                            if @p_tipo_erro ='ERR'   
                                begin
                                set  @hay_err = '1'
                                raiserror (@mensaje2,16,1)
                                end
                            else
                                begin
                                set  @hay_era = '1'
                                end 
                    end
            end
            --Direcion del Receptor
            execute @res= dte_dato_recep 'DIRE_RECE',@dire_rece, 
                    '1', @cod_error output, @mensaje output
            if @cod_error = 'S'
            begin
                set @mensaje2 = @mensaje2 + '- 20091 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                begin
                    set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                end
            else
                    if @p_salida  = 'PARCIAL' 
                    begin
                            set @p_codi ='20091'
                            execute @res= dte_chec_erro  @p_codi,
                                        @p_desc_erro output, @p_tipo_erro output,
                                        @p_indi_dnte output, @p_existe output, @p_mensaje output
                            if @p_tipo_erro ='ERR'   
                                begin
                                set  @hay_err = '1'
                                raiserror (@mensaje2,16,1)
                                end
                            else
                                begin
                                set  @hay_era = '1'
                                end 
                    end
            end
            --Comuna del Receptor
            execute @res= dte_dato_recep 'COMU_RECE',@comu_rece, 
                    '1', @cod_error output, @mensaje output
        
            if @cod_error = 'S'
            begin
                set @mensaje2 = @mensaje2 + '- 20092 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                begin
                    set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                end
            else
                    if @p_salida  = 'PARCIAL' 
                    begin
                            set @p_codi ='20092'
                            execute @res= dte_chec_erro  @p_codi,
                                        @p_desc_erro output, @p_tipo_erro output,
                                        @p_indi_dnte output, @p_existe output, @p_mensaje output
                            if @p_tipo_erro ='ERR'   
                                begin
                                set  @hay_err = '1'
                                raiserror (@mensaje2,16,1)
                                end
                            else
                                begin
                                set  @hay_era = '1'
                                end 
                    end
            end
            --Garantia por Deposito de Envases, solo valida si es  numerico
            begin
            execute @res=dte_nume_rang @gara_enva,'0','N',
                            @cod_error output, @mensaje output
            if @cod_error = 'S' 
            begin          
                set @mensaje2 =@mensaje2+ ' -20037 - GARA_ENVA -'+
                            @mensaje
                if  @p_salida = 'TOTAL' 
                    begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                    end
                else
                if  @p_salida  = 'PARCIAL' 
                    begin
                    set @p_codi ='20037'
                    execute @res= dte_chec_erro  @p_codi,
                                @p_desc_erro output, @p_tipo_erro output,
                                @p_indi_dnte output, @p_existe output, @p_mensaje output
                    if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
                if @p_tipo_erro ='ERR'   
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                        else
                        begin
                        set  @hay_era = '1'
                        end 
                end
                    end
            end
            end
        end --IF p_bole_elec = 'N'
     
    
        /************************************/
        /*Validacion para Boleta Electronica*/
        /************************************/
        if (@p_bole_elec = 'S')
        begin
            --Codigo Receptor, se valida solo cuando rutt_rece es 0
            if (@p_rutt_cero = 'S')
            begin
                if (@codi_rece is null) or (rtrim(@codi_rece) = ' ')
                begin
                    set @mensaje2 = @mensaje2 + ' -20085 CODI_RECE - Codigo Receptor Nulo '
                    if @p_salida = 'TOTAL' 
                        begin
                        set  @hay_err = '1'
                        raiserror (@mensaje2,16,1)
                        end
                    else
                        if @p_salida  = 'PARCIAL' 
                        begin
                        set @p_codi ='20085'
                        execute @res= dte_chec_erro  @p_codi,
                                        @p_desc_erro output, @p_tipo_erro output,
                                        @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                                set  @hay_err = '1'
                                raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                                set  @hay_era = '1'
                            end 
                        end
                end
            end
            
            --Direcccion del Receptor
            execute @res= dte_dato_recep 'DIRE_RECE',@dire_rece, 
                @vent_serv, @cod_error output, @mensaje output
            if @cod_error = 'S'
            begin
                set @mensaje2 = @mensaje2 + '- 20088 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20088'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
            end
        
            --Comuna del Receptor
            execute @res= dte_dato_recep 'COMU_RECE',@comu_rece, 
                @vent_serv, @cod_error output, @mensaje output
            if @cod_error = 'S'
            begin
                set @mensaje2 = @mensaje2 + '- 20088 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20088'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
            end
        
            --Ciudad del Receptor
            execute @res= dte_dato_recep 'CIUD_RECE',@ciud_rece, 
                @vent_serv, @cod_error output, @mensaje output
            if @cod_error = 'S'
            begin
                set @mensaje2 = @mensaje2 + '- 20088 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20088'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
            end
        
            begin
            execute @res= dte_campo_bole 'ENTR_BIEN', @entr_bien, 
                    'N', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'FORM_PAGO', @form_pago, 
                    'N', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'FECH_CANC', @fech_canc, 
                    'C', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'DIAS_TEPA', @dias_tepa, 
                    'N', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'CODI_TEPA', @codi_tepa, 
                    'C', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'MODA_PAGO', @moda_pago, 
                    'C', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'NOMB_SUCU', @nomb_sucu, 
                    'C', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'CODI_VEND', @codi_vend, 
                    'C', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'RUTT_MAND', @rutt_mand, 
                    'N', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'DIGI_MAND', @digi_mand, 
                    'C', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'GIRO_RECE', @giro_rece, 
                    'C', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'RUTT_SOFA', @rutt_sofa, 
                    'N', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 +  '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'DIGI_SOFA', @digi_sofa, 
                    'C', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'INFO_TRAN', @info_tran, 
                    'C', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'RUTT_TRAN', @rutt_tran, 
                    'N', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'DIGI_TRAN', @digi_tran, 
                    'C', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'DIRE_DEST', @dire_dest, 
                    'C', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'COMU_DEST', @comu_dest, 
                    'C', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'CIUD_DEST', @ciud_dest, 
                    'C', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'IMPU_VANR', @impu_vanr, 
                    'N', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'CRED_ES65', @cred_es65, 
                    'N', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'GARA_ENVA', @gara_enva, 
                    'N', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'INDI_VEGD', @indi_vegd, 
                    'N', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'INDI_NORE', @indi_nore, 
                    'N', @cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_tasa_bole 'TASA_VAAG', @tasa_vaag, @cod_error output, 
                            @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        
            begin
            execute @res= dte_campo_bole 'MONT_BASE',@mont_base,
                'N',@cod_error output, @mensaje output
            if @cod_error='S'
                begin
                set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
                if @p_salida = 'TOTAL' 
                    begin
                    set  @hay_err = '1'
                    raiserror (@mensaje2,16,1)
                    end
                else
                if @p_salida  = 'PARCIAL' 
                    begin
                        set @p_codi ='20089'
                        execute @res= dte_chec_erro  @p_codi,
                                    @p_desc_erro output, @p_tipo_erro output,
                                    @p_indi_dnte output, @p_existe output, @p_mensaje output
                        if @p_tipo_erro ='ERR'   
                            begin
                            set  @hay_err = '1'
                            raiserror (@mensaje2,16,1)
                            end
                        else
                            begin
                            set  @hay_era = '1'
                            end 
                    end
                end
            end
        end --If p_bole_elec = 'S'
        
        begin
            if @hay_err = '1'
                if(@v_esta_temp='EPV')
                    set @esta_docu='EPV'
                else if(@v_esta_temp='ECV')
                    set @esta_docu='ECV'
                else
                    set @esta_docu ='ERR'
            else
            begin
                /*
                    OT 1502529 - Cargar en X Estado aquellos documentos que deben completarse (Referencia y C¾digo de Pdto). 
                    Completar con Digitador.
                */
                select @esta_docu = 'PEN', @mensaje2 = ''
                from dbo.personas
                where codi_pers = @rutt_rece and isnull(modi_docu,'N') = 'S';
        
                if @esta_docu != 'PEN' and @esta_docu !='PRC'
                begin
                    if @hay_era = '1'
                    begin
                        if(@v_esta_temp='EPV')
                            set @esta_docu='EPV'
                        else if(@v_esta_temp='ECV')
                            set @esta_docu='ECV'
                        else
                            set @esta_docu ='ERA'
                    end
                end
                else
                begin
                    set @esta_docu ='ING'
                    set @mensaje2 = ''
                end
            end
        end 
        
        if @esta_docu <>'HIS' and @esta_docu <> 'ING'
        begin
            if @p_aux_esta_defi != 'ING' 
            begin
               set @esta_docu =@p_aux_esta_defi
            end
            begin
               print 'Mensaje '+ isnull(@mensaje2,'**')
               update dte_enca_docu set esta_docu = @esta_docu, 
                      MNSG_ERRO = isnull(MNSG_ERRO,'') + @mensaje2,
                      corr_rafo=@corr_rafo, dire_arch=@dire_arch
               where EXISTS 
                     (select *  from inserted
                      where inserted.codi_empr =dte_enca_docu.codi_empr
                      and inserted.foli_docu =dte_enca_docu.foli_docu
                      and inserted.tipo_docu =dte_enca_docu.tipo_docu)
            end
        end
    end --if @esta_docu<>'SCM' 
END
GO

GO
--SqlScripter----[dbo].[trg_dte_enca_docu_esta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_enca_docu_esta]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_enca_docu_esta]')
GO
CREATE TRIGGER [dbo].[trg_dte_enca_docu_esta]
ON dte_enca_docu 
FOR  UPDATE 
AS
BEGIN --INICIO
   declare
 @hay_err   varchar(3),  @hay_era  varchar(3),
 @esta_docu varchar(3),  @esta_docu_old varchar(3),
 @descrip   varchar(80), @fecha    varchar(10),@mensaje   varchar(2000),
 @cod_error varchar(10), @p_existe varchar(1), @p_desc_erro varchar(50),
 @p_mensaje varchar(80), @p_salida VARCHAR(80),@p_ex  varchar(1),
 @p_men     varchar(80), @p_codi_erro  varchar(12), @mensaje2 varchar(2000),
 @p_tipo_erro varchar(12),@MNSG_ERRO  varchar(2000),
 @p_codi    varchar(5),  @p_param   varchar(20), @p_param2   varchar(20),
 @p_param3  varchar(20), @p_param4  varchar(20), @res       varchar (10),
 @dire_arch varchar(100),@dire_arch_old varchar(100), @ult_foli varchar(10),
 @codi_empr varchar(20), @tipo_docu  varchar(20), @foli_docu varchar(20),
 @corr_envi varchar(22), @vers_enca varchar(20),  @fech_emis varchar(10), 
 @entr_bien varchar(20), @vent_serv varchar(20),  @indi_vegd varchar(20), 
 @form_pago varchar(20), @fech_canc varchar(10),
 @mont_brut varchar(20), @moda_pago varchar(20), @fech_venc varchar(10), 
 @rutt_emis varchar(20), @peri_desd varchar(20), @peri_hast varchar(20), 
 @digi_emis varchar(20), @nomb_emis varchar(100), @giro_emis varchar(20), 
 @nomb_sucu varchar(20), @codi_sucu varchar(20), @dire_orig varchar(60), 
 @comu_orig varchar(20), @ciud_orig varchar(20), @rutt_rece varchar(20),
 @digi_rece varchar(20), @nomb_rece varchar(20), @giro_rece varchar(40), 
 @cont_rece varchar(80), @dire_rece varchar(100), @comu_rece varchar(20),
 @ciud_rece varchar(20), @rutt_sofa varchar(20), @digi_sofa varchar(20), 
 @info_tran varchar(20), @rutt_tran varchar(20), @digi_tran varchar(20), 
 @dire_dest varchar(40), @comu_dest varchar(20), @ciud_dest varchar(20), 
 @mont_neto varchar(20), @mont_exen varchar(20), @impu_vaag varchar(20), 
 @impu_vanr varchar(20), @cred_es65 varchar(20), @gara_enva varchar(20), 
 @mont_tota varchar(20), @mont_nofa varchar(20), @valo_paga varchar(20), 
 @codi_ceco varchar(20), @corr_rafo varchar(20), @codi_tepa varchar(20), 
 @dias_tepa varchar(20), @sald_ante varchar(20), @tasa_vaag varchar(20), 
 @mont_base varchar(20),
 @p_dire_arch   varchar(30), @p_dia_mes  varchar(2),
 @p_dia_res     varchar(2),  @p_dia_ok   varchar(1),
 @p_codi_empr varchar(20), @p_tipo_docu  varchar(20), @p_foli_docu varchar(20),
 @p_esta_docu varchar(3)
print 'entrando a actualizar estado'
  IF UPDATE(esta_docu) 
    begin --UPDATE
	select @codi_empr=codi_empr, @tipo_docu=tipo_docu, @foli_docu=foli_docu, @esta_docu= esta_docu 
	from inserted
	print  @esta_docu
	
	-- Inserta encabezado a BD Historica
	if (@esta_docu='HIS')
	  begin --IF HIS
	     select @codi_empr=codi_empr, @tipo_docu=tipo_docu,
	            @foli_docu=foli_docu, @esta_docu= esta_docu, @corr_envi=corr_envi
	     from deleted
	
	     print 'insertando en la enca_docu_h'
	     insert into dte_enca_docu_h (
	      CODI_EMPR, TIPO_DOCU, FOLI_DOCU, ESTA_DOCU, MENS_ESTA, 
	      CORR_ENVI, MENS_ENVI, FECH_EMIS, ENTR_BIEN,  VENT_SERV, 
	      FORM_PAGO, FECH_CANC, DIAS_TEPA, CODI_TEPA,
	      MONT_BRUT, MODA_PAGO, FECH_VENC, RUTT_EMIS,
	      PERI_DESD, PERI_HAST, DIGI_EMIS, NOMB_EMIS, GIRO_EMIS,
	      NOMB_SUCU, CODI_SUCU, DIRE_ORIG, COMU_ORIG, CIUD_ORIG,
	      CODI_VEND, RUTT_MAND, DIGI_MAND, RUTT_RECE, DIGI_RECE, 
	      NOMB_RECE, CODI_RECE, GIRO_RECE, CONT_RECE, DIRE_RECE, 
	      COMU_RECE, CIUD_RECE, DIRE_POST, COMU_POST, CIUD_POST, 
	      RUTT_SOFA, DIGI_SOFA, INFO_TRAN, RUTT_TRAN, DIGI_TRAN,
	      DIRE_DEST, COMU_DEST, CIUD_DEST, MONT_NETO, MONT_EXEN,
	      IMPU_VAAG, IMPU_VANR, CRED_ES65, GARA_ENVA, MONT_TOTA,
	      MONT_NOFA, VALO_PAGA, SALD_ANTE, CODI_CECO, FEHO_FIRM,
	      INDI_VEGD, VERS_ENCA, CORR_RAFO, FEHO_TED,  FIRM_TED, 
	      USUA_IMPR, NUME_IMPR, FECH_IMPR, VIGE_DOCU, CODI_PERI,  
	      CORR_ENVI1, ESTA_DOCU1,  MNSG_ERRO, INDI_NORE, SUBT_VESE, 
	      DIRE_ARCH, IMPR_DEST, VAL1,   VAL2,   VAL3, 

	      VAL4,  VAL5, VAL6, VAL7, VAL8, VAL9, tasa_vaag, mont_base)
	    select 
	         del.CODI_EMPR, del.TIPO_DOCU,del.FOLI_DOCU, del.ESTA_DOCU, 
	         del.MENS_ESTA,  del.CORR_ENVI,del.MENS_ENVI, del.FECH_EMIS,
	         del.ENTR_BIEN,  del.VENT_SERV, del.FORM_PAGO, del.FECH_CANC, 
	         del.DIAS_TEPA,  del.CODI_TEPA, del.MONT_BRUT, 
	         del.MODA_PAGO,  del.FECH_VENC, del.RUTT_EMIS, del.PERI_DESD, 
	         del.PERI_HAST,  del.DIGI_EMIS, del.NOMB_EMIS, del.GIRO_EMIS, 
	         del.NOMB_SUCU,  del.CODI_SUCU, del.DIRE_ORIG, del.COMU_ORIG, 
	         del.CIUD_ORIG,  del.CODI_VEND, del.RUTT_MAND, del.DIGI_MAND,
	         del.RUTT_RECE,  del.DIGI_RECE, del.NOMB_RECE, del.CODI_RECE,
	         del.GIRO_RECE,  del.CONT_RECE, del.DIRE_RECE, 
	         del.COMU_RECE,  del.CIUD_RECE, del.DIRE_POST, del.COMU_POST,
	         del.CIUD_POST,  del.RUTT_SOFA, del.DIGI_SOFA, del.INFO_TRAN, 
	         del.RUTT_TRAN,  del.DIGI_TRAN, del.DIRE_DEST, del.COMU_DEST, 
	         del.CIUD_DEST,  del.MONT_NETO, del.MONT_EXEN, del.IMPU_VAAG, 
	         del.IMPU_VANR,  del.CRED_ES65, del.GARA_ENVA, del.MONT_TOTA, 
	         del.MONT_NOFA,  del.VALO_PAGA, del.SALD_ANTE, del.CODI_CECO, 
	         del.FEHO_FIRM,  del.INDI_VEGD, del.VERS_ENCA, del.CORR_RAFO,  
	         del.FEHO_TED,   del.FIRM_TED,  del.USUA_IMPR, del.NUME_IMPR,
	         del.FECH_IMPR,  del.VIGE_DOCU, del.CODI_PERI, del.CORR_ENVI1,
	         del.ESTA_DOCU1, del.MNSG_ERRO, del.INDI_NORE, del.SUBT_VESE, 
	         del.DIRE_ARCH,  del.IMPR_DEST, del.VAL1, del.VAL2,  del.VAL3,  
	         del.VAL4, del.VAL5, del.VAL6, del.VAL7,del.VAL8, del.VAL9,
	         del.tasa_vaag, del.mont_base
	    from deleted del
	    
	    print 'empresa en el trigger'
	    print @codi_empr

            DECLARE cursor_dtes CURSOR FOR
	       select codi_empr, tipo_docu, foli_docu 
	       from deleted
	    OPEN cursor_dtes
	    FETCH NEXT FROM cursor_dtes INTO @p_codi_empr,@p_tipo_docu, @p_foli_docu
	    WHILE (@@FETCH_STATUS = 0)
	    BEGIN
		execute @res= dte_inse_histo @p_codi_empr, @p_tipo_docu,
		        @p_foli_docu, cod_error, mensaje  
                FETCH NEXT FROM cursor_dtes INTO @p_codi_empr,@p_tipo_docu, @p_foli_docu
            END
	    CLOSE cursor_dtes
	    DEALLOCATE cursor_dtes

	    if @cod_error = 'S' 
	      begin  --IF ERROR S        
		 set @mensaje2 =@mensaje2+ ' -20082 - BD Historica -'+
		                @mensaje
		 if  @p_salida = 'TOTAL' 
		    begin
		       set  @hay_err = '1'
		       raiserror (@mensaje2,16,1)
		    end
		 else
		    if  @p_salida  = 'PARCIAL' 
		       begin
		         set @p_codi ='20082'
		         execute @res= dte_chec_erro  @p_codi,
		                 @p_desc_erro output, @p_tipo_erro output,
		                 @p_existe output, @p_mensaje output
		         if @p_tipo_erro ='ERR'   
		            begin
		               set  @hay_err = '1'
		               raiserror (@mensaje2,16,1)
		            end
		          else
		             begin
		               set  @hay_era = '1'
		             end 
		       end
	      end --FIN IF ERROR S        
	  end -- FIN IF HIS
	  
	-- **Recupera datos del correo  si cambia el estado
	   begin --7
	    DECLARE cursor_dtes_mail CURSOR FOR
	   	       select codi_empr, tipo_docu, foli_docu, esta_docu
	   	       from inserted
	   	    OPEN cursor_dtes_mail
	   	    FETCH NEXT FROM cursor_dtes_mail INTO @p_codi_empr,@p_tipo_docu, @p_foli_docu, @p_esta_docu
	   	    	
	   	    WHILE (@@FETCH_STATUS = 0)
	   	    BEGIN
	   	        execute @res= dte_datos_email @p_codi_empr, @p_tipo_docu, @p_esta_docu, 
	   	                      @p_foli_docu, 'X', @cod_error out, @mensaje  out
	   		FETCH NEXT FROM cursor_dtes_mail INTO @p_codi_empr,@p_tipo_docu, @p_foli_docu, @p_esta_docu
	   	    END
	   	    CLOSE cursor_dtes_mail
	     DEALLOCATE cursor_dtes_mail
	    
	    --execute @res= dte_datos_email @codi_empr, @tipo_docu, @esta_docu, 
	    --                @foli_docu, 'X', @cod_error out, @mensaje  out
	    if @cod_error = 'S' 
	      begin --8          
	        set @mensaje2 =@mensaje2+ ' -20081 - ESTA_DOCU -'+
	                       @mensaje
	         if  @p_salida = 'TOTAL' 
	             begin
	                set  @hay_err = '1'
	                raiserror (@mensaje2,16,1)
	             end
	         else
	           if  @p_salida  = 'PARCIAL' 
	            begin --9
	             set @p_codi ='20081'
	              execute @res= dte_chec_erro  @p_codi,
	                           @p_desc_erro output, @p_tipo_erro output,
	                           @p_existe output, @p_mensaje output
	              if @p_tipo_erro ='ERR'   
	                begin
	                   set  @hay_err = '1'
	                   raiserror (@mensaje2,16,1)
	                end
	              else
	                begin
	                  set  @hay_era = '1'
	                end 
	            end --9
	      end  --8
	   end --7
    end --FIN UPDATE
END --FIN INICIO
GO

GO
--SqlScripter----[dbo].[trg_dte_enca_docu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_enca_docu_p]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_enca_docu_p]')
GO
CREATE TRIGGER [dbo].[trg_dte_enca_docu_p]
ON dte_enca_docu_p
    for insert, update AS
BEGIN
   declare
 @hay_err      	varchar(3),    @hay_era       varchar(3),
 @esta_docu    	varchar(3),    @esta_docu_old varchar(3),
 @descrip      	varchar(80),   @fecha         varchar(10), 
 @mensaje      	varchar(2000), @cod_error     varchar(10), 
 @p_existe     	varchar(1),    @p_desc_erro   varchar(50),
 @p_mensaje    	varchar(80),   @p_salida      VARCHAR(80), 
 @p_ex         	varchar(1),    @p_men         varchar(80), 
 @p_codi_erro  	varchar(12),   @mensaje2      varchar(2000),
 @p_tipo_erro  	varchar (10),  @MNSG_ERRO     varchar(2000),
 @p_codi    	varchar(5),    @p_param       varchar(20), 
 @p_param2  	varchar(20),   @p_param3      varchar(20),  
 @p_param4  	varchar(20),   @res           varchar (10),
 @dire_arch 	varchar (100), @ult_foli      varchar(10),
 @codi_empr 	varchar(20),   @tipo_docu     varchar(20), 
 @foli_docu 	varchar(20),   @corr_envi     varchar(20), 
 @vers_enca 	varchar(20),   @fech_emis     varchar(20), 
 @entr_bien 	varchar(20),   @vent_serv     varchar(20), 
 @indi_vegd 	varchar(20),   @form_pago     varchar(20), 
 @fech_canc 	varchar(20),   @mont_brut     varchar(20), 
 @moda_pago 	varchar(20),   @fech_venc     varchar(20), 
 @rutt_emis 	varchar(20),   @peri_desd     varchar(20), 
 @peri_hast 	varchar(20),   @digi_emis     varchar(20), 
 @nomb_emis 	varchar(100),  @giro_emis     varchar(20), 
 @nomb_sucu 	varchar(20),   @codi_sucu     varchar(20), 
 @dire_orig 	varchar(60),   @comu_orig     varchar(20), 
 @ciud_orig 	varchar(20),   @rutt_rece     varchar(20), 
 @digi_rece 	varchar(20),   @nomb_rece     varchar(20), 
 @giro_rece 	varchar(20),   @cont_rece     varchar(20), 
 @dire_rece 	varchar(100),  @comu_rece     varchar(20), 
 @ciud_rece 	varchar(20),   @rutt_sofa     varchar(20), 
 @digi_sofa 	varchar(20),   @info_tran     varchar(20), 
 @rutt_tran	varchar(20),   @digi_tran     varchar(20), 
 @dire_dest 	varchar(20),   @comu_dest     varchar(20), 
 @ciud_dest 	varchar(20),   @mont_neto     varchar(20), 
 @mont_exen 	varchar(20),   @impu_vaag     varchar(20), 
 @impu_vanr 	varchar(20),   @cred_es65     varchar(20), 
 @gara_enva 	varchar(20),   @mont_tota     varchar(20), 
 @mont_nofa 	varchar(20),   @valo_paga     varchar(20), 
 @codi_ceco 	varchar(20),   @corr_rafo     varchar(20), 
 @codi_tepa 	varchar(20),   @dias_tepa     varchar(20), 
 @sald_ante	varchar(20),   @tasa_vaag     varchar(20), 
 @mont_base 	varchar(20),   @p_bole_elec   varchar(1), 
 @p_dire_arch 	varchar(100),   @p_dia_mes     varchar(2),
 @p_dia_res   	varchar(2),    @p_dia_ok      varchar(1),   
 @p_tipo_dnte 	varchar(1),    @p_indi_dnte   varchar(2), 
 @p_rutt_cero 	varchar(1),    @codi_rece     varchar(40),
 @codi_vend 	varchar(20),   @rutt_mand     varchar(20), 
 @digi_mand 	varchar(20),   @indi_nore     varchar(20)
BEGIN
 SET DATEFORMAT ymd
 begin
  select 
    @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU, @foli_docu=FOLI_DOCU, 
    @esta_docu=ESTA_DOCU, @corr_envi=CORR_ENVI, @vers_enca=VERS_ENCA, 
    @fech_emis=FECH_EMIS, @entr_bien=ENTR_BIEN, @vent_serv=VENT_SERV, 
    @indi_vegd=INDI_VEGD, @form_pago=FORM_PAGO, @fech_canc=FECH_CANC,
    @mont_brut=MONT_BRUT, @moda_pago=MODA_PAGO, @fech_venc=FECH_VENC,
    @rutt_emis=RUTT_EMIS, @peri_desd=PERI_DESD, @peri_hast=PERI_HAST,
    @digi_emis=DIGI_EMIS, @nomb_emis=NOMB_EMIS, @giro_emis=GIRO_EMIS,
    @nomb_sucu=NOMB_SUCU, @codi_sucu=CODI_SUCU, @dire_orig=DIRE_ORIG,
    @comu_orig=COMU_ORIG, @ciud_orig=CIUD_ORIG, @rutt_rece=RUTT_RECE,
    @digi_rece=DIGI_RECE, @nomb_rece=NOMB_RECE, @giro_rece=GIRO_RECE,
    @cont_rece=CONT_RECE, @dire_rece=DIRE_RECE, @comu_rece=COMU_RECE,
    @ciud_rece=CIUD_RECE, @rutt_sofa=RUTT_SOFA, @digi_sofa=DIGI_SOFA,
    @info_tran=INFO_TRAN, @rutt_tran=RUTT_TRAN, @digi_tran=DIGI_TRAN,
    @dire_dest=DIRE_DEST, @comu_dest=COMU_DEST, @ciud_dest=CIUD_DEST,
    @mont_neto=MONT_NETO, @mont_exen=MONT_EXEN, @impu_vaag=IMPU_VAAG,
    @impu_vanr=IMPU_VANR, @cred_es65=CRED_ES65, @gara_enva=GARA_ENVA,
    @mont_tota=MONT_TOTA, @mont_nofa=MONT_NOFA, @valo_paga=VALO_PAGA,
    @codi_ceco=CODI_CECO, @corr_rafo=CORR_RAFO, @codi_tepa=CODI_TEPA,
    @dias_tepa=DIAS_TEPA, @sald_ante=SALD_ANTE, @tasa_vaag=TASA_VAAG,
    @mont_base=MONT_BASE, @codi_rece=CODI_RECE, @codi_vend=CODI_VEND,
    @rutt_mand=RUTT_MAND, @digi_mand=DIGI_MAND, @indi_nore=INDI_NORE
  from inserted
 end
 begin
   select  @esta_docu_old=ESTA_DOCU
    from deleted
 end
 begin
     set  @hay_err = '0'
     set  @hay_era = '0'
     set  @mensaje2 =' '
    execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                          @p_existe output, @p_mensaje output
 end
 if @esta_docu<>@esta_docu_old
 begin
    IF UPDATE(esta_docu) 
      --Recupera datos del correo  si cambia el estado
      begin
      execute @res= dte_datos_email @codi_empr, @tipo_docu, @esta_docu, 
                    @foli_docu, 'P', cod_error, mensaje  
      if @cod_error = 'S' 
	 begin          
           set @mensaje2 = @mensaje2+ ' -20081 - ESTA_DOCU -'+
                           @mensaje
	   if @p_salida = 'TOTAL' 
              begin
                 set  @hay_err = '1'
              end
           else
              if @p_salida  = 'PARCIAL' 
                 begin
                    set @p_codi ='20081'
                     execute @res= dte_chec_erro @p_codi,
                                   @p_desc_erro output, @p_tipo_erro output,
                                   @p_indi_dnte output, @p_existe output, @p_mensaje output
                     if @p_tipo_erro ='ERR'   
                        begin
                          set  @hay_err = '1'
                        end
                     else
                        begin
                          set  @hay_era = '1'
                        end 
                 end
         end        
      end
 end
 else
 begin
    --Recuperea la direccion del archivo con la firma
    begin
    execute PARA_GET_VAL 'EGATE_DIRE_SALI', @p_dire_arch output,
              @cod_error output, @mensaje output
    execute PARA_GET_VAL 'EGATE_DIRE_DIA',@p_dia_res  output,
              @p_dia_ok output, @p_mensaje output
    if @p_dia_ok ='S' 
       begin 
         if @p_dia_res ='1' 
            begin
              set @p_dia_mes =  convert(char(2),DATEPART(dd, GETDATE()))
              set @dire_arch = @p_dire_arch+'\'+@p_dia_mes
            end
         else
            begin
              set @dire_arch = @p_dire_arch
            end
       end
    else
       begin
         set @dire_arch = @p_dire_arch
       end
      
    if @cod_error = 'N' 
       begin          
         set @mensaje2 =@mensaje2 +' -20083 -  DIRE_SALI -'+ @mensaje
         if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
         else
            if @p_salida  = 'PARCIAL' 
               begin
                 set @p_codi ='20083'
                 execute @res= dte_chec_erro  @p_codi,
                         @p_desc_erro output, @p_tipo_erro output,
                         @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
               end
       end 
    end
    
    --Tipo Documento - valida en  DTE_TIPO_DOCU
    begin
    set @descrip = 'TIPO_DOCU'
    execute @res= dte_chec_tido_veel @tipo_docu, @descrip output, 
		   @p_bole_elec output, @p_tipo_dnte output, 
                   @cod_error output, @mensaje output
    if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2+ ' -20005 - TIPO_DOCU -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if @p_salida  = 'PARCIAL' 
              begin
                set @p_codi ='20005'
                execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
                if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
              end
       end        
    end

    --Valida rango de Folios
    begin
    execute @res= dte_chec_rang_foli @codi_empr,@tipo_docu,
                  @corr_rafo output, @foli_docu, @ult_foli output, 
                  @cod_error output, @mensaje output     
    if @cod_error = 'S' 
       begin          
         set @mensaje2 = @mensaje2+ ' -20001 -  Rango Folio -'
                         + @mensaje
         if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
         else
            if @p_salida  = 'PARCIAL' 
               begin
                 set @p_codi ='20001'
                 execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                   end
                 else
                   begin
                     set  @hay_era = '1'
                   end 
               end
       end        
    end
    
    -- Estado del Documento 
    begin
    set @descrip = 'ESTA DOCU'

    execute @res= dte_chec_esta_docu @esta_docu, @descrip output,
                   @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20004 - ESTA_DOCU -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20004'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
    end
   
    --Folio del Documento 
    begin 
    execute @res=dte_nume_rut @foli_docu, 'x', 'N','S',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20006 - FOLI_DOCU -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20006'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
    end

    --Fecha de Emision 
    begin
    if (@fech_emis is null) or (rtrim(@fech_emis) = ' ')  
    begin
      set @cod_error = 'S'
      set @mensaje = 'Fecha Emision Nula'
    end
   else
    begin
     execute @res=dte_vali_fech @fech_emis,'S',
                  @cod_error output, @mensaje output
    end
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20007 - FECH_EMIS -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20007'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
    end

    --  Indicador Venta Servicio Periodico
    begin
    execute @res=dte_CHECK_DOMAIN '76',@vent_serv, 'N',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20010 - VENT_SERV -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
             end
         else
           if @p_salida  = 'PARCIAL' 
              begin
                set @p_codi ='20010'
                execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
                if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
              end
      end
    end

    -- Indicador Montos Brutos  
    begin
    execute @res=dte_CHECK_DOMAIN '75',@mont_brut, 'N',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20011 - MONT_BRUT -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20011'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
    end

    --Periodo  Desde 
    begin
    execute @res=dte_fech_deha  @peri_desd, @peri_hast, 'D',
                           @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20014 - PERI_DESD -'+
                       @mensaje
         if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
         else
           if @p_salida  = 'PARCIAL' 
              begin
                set @p_codi ='20014'
                execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
                if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
              end
      end        
    end

    --Periodo  Hasta
    begin
    execute @res=dte_fech_deha  @peri_desd, @peri_hast, 'D',
                           @cod_error output, @mensaje output
    if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2+ ' -20015 - PERI_HAST -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                  set  @hay_err = '1'
            end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20015'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
       end        
    end

    --Fecha de Vencimiento
    begin
    execute @res=dte_vali_fech @fech_venc,'S',
                           @cod_error output, @mensaje output
    if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2+ ' -20019 - FECH_VENC -'+
                       @mensaje
         if @p_salida = 'TOTAL' 
            begin
               set  @hay_err = '1'
            end
         else
            if @p_salida  = 'PARCIAL' 
               begin
                 set @p_codi ='20019'
                 execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
               end
       end        
    end

    --Rut, digito  del Emisor
    begin
    execute @res=dte_nume_rut @rutt_emis, @digi_emis, 'S','S',
                               @cod_error output, @mensaje output
    if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2+ ' -20020 - RUTT_EMIS - DIGI - -'+
                       @mensaje
         if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
         else
            if @p_salida  = 'PARCIAL' 
               begin
                 set @p_codi ='20020'
                 execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
               end
       end        
    end

    -- Codigo de Sucursal,  solo se valida que sea numerico 
    begin
    execute @res=dte_codi_sucu @codi_empr, @codi_sucu,
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2+ ' -20023 - EMPR - CODI SUCU -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20023'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
       end
    end

    --Rut Receptor
    begin
    execute @res=dte_nume_rut @rutt_rece, @digi_rece, 'S','S',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2+ ' -20024 - RUTT_RECE - DIGI -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                    set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20024'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
       end        
    end

    --Nombre Receptor
    begin
    if (@nomb_rece is null) or (rtrim(@nomb_rece) = ' ')  
       begin          
         set @mensaje2 = ' -20084 - NOMBRE RECEPTOR NULO -'
         if  @p_salida = 'TOTAL' 
             begin
               set  @hay_err = '1'
             end
         else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20084'
                 execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
                    begin
 		      if @p_tipo_erro ='ERR'   
                         begin
                           set  @hay_err = '1'
                         end
              	      else
                         begin
                          set  @hay_era = '1'
                         end 
 	            end
              end
       end        
    end

    --Monto neto,valida ranco y numerico
    begin
    execute @res=dte_monto_neto @mont_neto, 'S', 
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20031 - MONT_NETO -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
               set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20031'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
    end

    --Monto no Afecto o Exento desc y reca globales no estan insertados
    begin
    execute @res=dte_monto_exen @mont_exen, 'N',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20032 - MONT_EXEN -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                   set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20032'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
    end

    --Monto Total
    begin
    set @cod_error = 'N'
    set @mensaje = ''	
		
    if (@mont_tota >= 0)
    begin
	set @cod_error = 'N'
	set @mensaje = ''	
    end
    else
    begin
	set @cod_error = 'S'
	set @mensaje = 'Valor Negativo en Monto Total';
    end

    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20038 - MONT_TOTA -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                   set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20038'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
    end

    --Monto No Facturable
    begin
    execute @res=dte_nume_rut @mont_nofa,'x', 'N','N',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20039 - MONT_NOFA -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                   set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20039'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
    end

    --Saldo Anterior
    begin
    execute @res=dte_nume_rang @sald_ante,'0','N',
                          @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20040 - SALD_ANTE -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20040'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
    end
    
    --Valor A pagar, que sea numero
    begin
    execute @res=dte_nume_rut @valo_paga, 'x', 'N','N',
                            @cod_error output, @mensaje output
    if @cod_error = 'S' 
       begin          
         set @mensaje2 =@mensaje2+ ' -20040 - VALO_PAGA -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
             end
         else
          if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20040'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin

                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
           end
       end
    end

    /*****************************/
    /* Validacion DTEs no Boleta */
    /*****************************/
    if @p_bole_elec = 'N'
    begin
      --Tipo De Despacho, tipo de documento 
      begin
      execute @res=dte_CHECK_DOMAIN '95',@entr_bien, 'N',
                              @cod_error output, @mensaje output
      if @cod_error = 'S' 
         begin          
           set @mensaje2 =@mensaje2+ ' -20008 - ENTR_BIEN -'+
                          @mensaje
           if @p_salida = 'TOTAL' 
              begin
                set  @hay_err = '1'
              end
           else
             if @p_salida  = 'PARCIAL' 
                begin
                  set @p_codi ='20008'
                  execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
                  if @p_tipo_erro ='ERR'   
                     begin
                       set  @hay_err = '1'
                     end
                  else
                     begin
                       set  @hay_era = '1'
                     end 
                end
         end
      end

      -- Indicador De Venta con Guia de Despacho
      begin
      if @tipo_docu ='52' 
         begin
         execute @res=dte_CHECK_DOMAIN '96',@indi_vegd, 'N',
                              @cod_error output, @mensaje output
         if @cod_error = 'S' 
            begin          
              set @mensaje2 = @mensaje2+ ' -20009 - INDI_SEGD -'+
                              @mensaje
              if @p_salida = 'TOTAL' 
                 begin
                   set  @hay_err = '1'
                 end
              else
                if @p_salida  = 'PARCIAL' 
                   begin
                     set @p_codi ='20009'
                     execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
                     if @p_tipo_erro ='ERR'   
                        begin
                          set  @hay_err = '1'
                        end
                     else
                        begin
                          set  @hay_era = '1'
                        end 
                   end
            end
         end
      end

      -- Forma de Pago 
      begin
      execute @res=dte_CHECK_DOMAIN '94',@form_pago, 'N',
                         @cod_error output, @mensaje output
        if @cod_error = 'S' 
        begin          
         set @mensaje2 =@mensaje2+ ' -20012 - FORM_PAGO -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20012'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
        end
      end

      -- Fecha de Cancelacion 
      begin
      execute @res=dte_vali_fech @fech_canc,'S',
                           @cod_error output, @mensaje output
      if @cod_error = 'S' 
        begin          
         set @mensaje2 =@mensaje2+ ' -20013 - FECH_CANC -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                  set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20013'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
        end        
      end

      --Modalidad de Pago
      begin
      execute @res=dte_CHECK_DOMAIN '87',@moda_pago, 'N',
                         @cod_error output, @mensaje output
      if @cod_error = 'S' 
        begin          
         set @mensaje2 =@mensaje2+ ' -20016 - MODO_PAGO -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                   set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20016'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
        end
      end

      --Termino de Pago, Cantidad en dias (>0)
      begin
      execute @res=  dte_nume_rang @dias_tepa,'1','N',
                          @cod_error output, @mensaje output     
      if @cod_error = 'S' 
        begin          
         set @mensaje2 =@mensaje2+ ' -20017 - CODI_TEPA -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20017'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
        end
      end

      -- Rut de Solicitante de Factura
      begin
      if @rutt_rece != @rutt_sofa 
         begin
           execute @res=dte_nume_rut @rutt_sofa, @digi_sofa, 'S','N',
                              @cod_error output, @mensaje output
           if @cod_error = 'S' 
              begin          
                set @mensaje2 = @mensaje2+ ' -20025 - RUTT_SOFA - DIGI -'+
                                @mensaje
                if @p_salida = 'TOTAL' 
                   begin
                     set  @hay_err = '1'
                   end
                else
                  if @p_salida  = 'PARCIAL' 
                     begin
                       set @p_codi ='20025'
                       execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
                      if @p_tipo_erro ='ERR'   
                         begin
                   	   set  @hay_err = '1'
                	 end
                      else
                        begin
                           set  @hay_era = '1'
                        end 
                     end
              end        
         end
      end

      --Información Transporte - patente
      begin
      execute @res=dte_info_tran @info_tran, @entr_bien, 'N', 
                              @cod_error output, @mensaje output
      if @cod_error = 'S' 
        begin          
         set @mensaje2 =@mensaje2+ ' -20026 - INFO_TRAN -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20026'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
       end        
      end

      -- Rut de transportista
      begin
      execute @res=dte_nume_rut @rutt_tran, @digi_tran, 'S','N',
                              @cod_error output, @mensaje output
      if @cod_error = 'S' 
        begin          
         set @mensaje2 =@mensaje2+ ' -20027 - RUTT_TRAN - DIGI -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                    set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20027'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
        end        
      end

      --Direccion de Destino
      begin
      execute @res=dte_tran_otro @dire_dest, @entr_bien, @dire_rece, 'N', 
                               @cod_error output, @mensaje output
      if @cod_error = 'S' 
        begin          
         set @mensaje2 =@mensaje2+ ' -20028 - DIRE_DEST -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                   set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20028'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
        end        
      end

      --Comuna Destino
      begin
      execute @res=dte_tran_otro @comu_dest, @entr_bien, @comu_rece, 'N', 
                              @cod_error output, @mensaje output
      if @cod_error = 'S' 
        begin          
         set @mensaje2 =@mensaje2+ ' -20029 - COMU_DEST -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20029'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
        end
      end

      --Ciudad Destino
      begin
      execute @res=dte_tran_otro @ciud_dest, @entr_bien, @ciud_rece, 'N', 
                              @cod_error output, @mensaje output
      if @cod_error = 'S' 
        begin          
         set @mensaje2 =@mensaje2+ ' -20030 - CIUD_DEST -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                   set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20030'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
        end
      end

      --IVA  
      begin
      execute @res= dte_calc_iva @impu_vaag, @tasa_vaag, @mont_neto, 
                      @cod_error output, @mensaje output
      if @cod_error = 'S' 
        begin          
         set @mensaje2 =@mensaje2+ ' -20033 - IMPU_VAAG -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                  set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20033'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
        end
      end

      --Credito Especial 65% Constructoras 
      begin
      execute @res= dte_cred_espe @cred_es65,@impu_vaag, '0.65', 'N',
                      @cod_error output, @mensaje output
      if @cod_error = 'S' 
        begin          
         set @mensaje2 =@mensaje2+ ' -20036 - CRED_ES65 -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20036'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
        end
      end

      --Garantia por Deposito de Envases, solo valida si es  numerico
      begin
      execute @res=dte_nume_rang @gara_enva,'0','N',
                      @cod_error output, @mensaje output
      if @cod_error = 'S' 
        begin          
         set @mensaje2 =@mensaje2+ ' -20037 - GARA_ENVA -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                   set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20037'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
        end
      end
    end -- If p_bole_elec = 'N'

    /****************************************/
    /* Validacion para Boletas Electronicas */ 
    /****************************************/
    if (@p_bole_elec = 'S')
    begin
     --Codigo Receptor, se valida solo cuando rutt_rece es 0
     if (@p_rutt_cero = 'S')
       begin
         if (@codi_rece is null) or (rtrim(@codi_rece) = ' ')
           begin
     	      set @mensaje2 = @mensaje2 + ' -20085 CODI_RECE - Codigo Receptor Nulo '
              if @p_salida = 'TOTAL' 
                 begin
                   set  @hay_err = '1'
                 end
              else
                if @p_salida  = 'PARCIAL' 
                  begin
                   set @p_codi ='20085'
                   execute @res= dte_chec_erro  @p_codi,
                                 @p_desc_erro output, @p_tipo_erro output,
                                 @p_indi_dnte output, @p_existe output, @p_mensaje output
                   if @p_tipo_erro ='ERR'   
                      begin
                         set  @hay_err = '1'
                      end
                   else
                      begin
                         set  @hay_era = '1'
                      end 
                  end
           end
       end
     
     --Direcccion del Receptor
     execute @res= dte_dato_recep 'DIRE_RECE',@dire_rece, 
		   @vent_serv, @cod_error output, @mensaje output
     if @cod_error = 'S'
      begin
     	set @mensaje2 = @mensaje2 + '- 20088 - ' + @mensaje
        if @p_salida = 'TOTAL' 
           begin
             set  @hay_err = '1'
           end
         else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20088'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
      end

     --Comuna del Receptor
     execute @res= dte_dato_recep 'COMU_RECE',@comu_rece, 
		   @vent_serv, @cod_error output, @mensaje output
     if @cod_error = 'S'
      begin
     	set @mensaje2 = @mensaje2 + '- 20088 - ' + @mensaje
        if @p_salida = 'TOTAL' 
           begin
             set  @hay_err = '1'
           end
         else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20088'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
      end

     --Ciudad del Receptor
     execute @res= dte_dato_recep 'CIUD_RECE',@ciud_rece, 
		   @vent_serv, @cod_error output, @mensaje output
     if @cod_error = 'S'
      begin
     	set @mensaje2 = @mensaje2 + '- 20088 - ' + @mensaje
        if @p_salida = 'TOTAL' 
           begin
             set  @hay_err = '1'
           end
         else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20088'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
      end

      begin
       execute @res= dte_campo_bole 'ENTR_BIEN', @entr_bien, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'FORM_PAGO', @form_pago, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'FECH_CANC', @fech_canc, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'DIAS_TEPA', @dias_tepa, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'CODI_TEPA', @codi_tepa, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'MODA_PAGO', @moda_pago, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'NOMB_SUCU', @nomb_sucu, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'CODI_VEND', @codi_vend, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'RUTT_MAND', @rutt_mand, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'DIGI_MAND', @digi_mand, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'GIRO_RECE', @giro_rece, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'RUTT_SOFA', @rutt_sofa, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 +  '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'DIGI_SOFA', @digi_sofa, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'INFO_TRAN', @info_tran, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'RUTT_TRAN', @rutt_tran, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'DIGI_TRAN', @digi_tran, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'DIRE_DEST', @dire_dest, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'COMU_DEST', @comu_dest, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'CIUD_DEST', @ciud_dest, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'IMPU_VANR', @impu_vanr, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'CRED_ES65', @cred_es65, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'GARA_ENVA', @gara_enva, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'INDI_VEGD', @indi_vegd, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'INDI_NORE', @indi_nore, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_tasa_bole 'TASA_VAAG', @tasa_vaag, @cod_error output, 
                     @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'MONT_BASE',@mont_base,
		'N',@cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

    end
  
    begin
    if   @hay_err = '1'
       set @esta_docu ='ERR'
    else
       begin
        if @hay_era = '1'
           set @esta_docu ='ERA'
        else
        begin
           set @esta_docu ='ING'
           set @mensaje2 = '';
        end
       end
   end  
 end
 
 begin
   update dte_enca_docu_p set esta_docu = @esta_docu, 
          MNSG_ERRO=isnull(MNSG_ERRO,'') +@mensaje2,
          corr_rafo=@corr_rafo, dire_arch=@dire_arch
   where EXISTS 
         (select *  from inserted
          where inserted.codi_empr =dte_enca_docu_p.codi_empr
          and inserted.foli_docu =dte_enca_docu_p.foli_docu
          and inserted.tipo_docu =dte_enca_docu_p.tipo_docu)
 end 
 END
END
-- fin
GO

GO
--SqlScripter----[dbo].[trg_dte_envi_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_envi_docu]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_envi_docu]')
GO
CREATE TRIGGER [dbo].[trg_dte_envi_docu]
ON dte_envi_docu
	for insert, update  AS  
BEGIN--0
DECLARE 
	@mensaje   varchar(2000), 	@mensaje2  varchar(2000),
	@cod_error varchar(10),   	@hay_err   varchar(3),  
	@hay_era  varchar(3),     	@p_codi    varchar(5),  
	@p_param   varchar(20),   	@p_existe varchar(1),   
	@p_mensaje varchar(80),   	@p_salida varchar(80),
	@res       varchar (10),  	@p_codi_erro  varchar(12),
	@p_desc_erro   varchar(50),	@p_tipo_erro   varchar (10),
	@codi_empr varchar(20),		@corr_envi varchar(20),
	@esta_envi varchar(3),		@esta_envi_old varchar(3),
	@p_dire_arch varchar(100),	@dire_arch varchar(100),
	@p_dia_res varchar(1),		@p_dia_ok varchar(1),
	@p_dia_mes numeric(2),		@p_indi_dnte varchar(1)

BEGIN --1
	select 	@codi_empr=CODI_EMPR, 
	   	@esta_envi=ESTA_ENVI, @corr_envi=CORR_ENVI,
	   	@dire_arch= DIRE_ARCH           
	from  inserted

	select @esta_envi_old=ESTA_ENVI
	from  deleted

	set  @mensaje2 =' '
	execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
		@p_existe output, @p_mensaje output

	if @dire_arch is null 
	begin --2 

		execute PAEM_GET_VAL @codi_empr, 'ALL', 'EDS0', @p_dire_arch output,
			@p_existe output, @p_mensaje output
		if (@p_existe = 'N' or @p_dire_arch is null)
		begin
		    execute PARA_GET_VAL 'EGATE_DIRE_SALI', @p_dire_arch output,
			    @p_existe output, @mensaje output
		end

		if @p_existe = 'S' 
		begin --3

		    execute PARA_GET_VAL 'EGATE_DIRE_DIA',@p_dia_res  output,
					 @p_dia_ok output, @p_mensaje output

		    if @p_dia_ok ='S' 
		    begin  --4
			if @p_dia_res ='1' 
			begin --5
				set @p_dia_mes =  convert(char(2),DATEPART(dd, GETDATE()))
				set @dire_arch = @p_dire_arch + '\' + convert(char(2),@p_dia_mes)

			end --5
			else
			begin --6
				set @dire_arch = @p_dire_arch
			end --6
		    end --4
		    else
		    begin --7
			set @dire_arch = @p_dire_arch
		    end--7

		    update dte_envi_docu set dire_arch=@dire_arch
		    where corr_envi = @corr_envi
		end--3
		else
		begin --8         
		    raiserror (@mensaje2,16,1)
		end -- 8
	end --2
	
	
	/*************************************/
	if @esta_envi <> @esta_envi_old
	begin --1
	  --Recupera datos del correo  si cambia el estado
	  begin --2
	    execute @res= dte_envio_email  @codi_empr, @esta_envi, 
					   @corr_envi,  cod_error, mensaje  
	    if @cod_error = 'S' 
	    begin  --3
		    set @mensaje2 = @mensaje2+ ' -20081 - ESTA_ENVI -'+
				    @mensaje

		    if  @p_salida = 'TOTAL' 
		    begin--4
			set  @hay_err = '1'
			raiserror (@mensaje2,16,1)
		    end--4
		    else
			if  @p_salida  = 'PARCIAL' 
			begin--5
			    set @p_codi ='20081'
			    execute @res= dte_chec_erro  @p_codi, @p_desc_erro output, 
							 @p_tipo_erro output,@p_indi_dnte output, 
							 @p_existe output, @p_mensaje output

			    if @p_tipo_erro ='ERR'   
			    begin--6
			       set  @hay_err = '1'
			       raiserror (@mensaje2,16,1)
			    end--6
			    else
			    begin--7
			       set  @hay_era = '1'
			    end --7
			end--5
	    end --3
          end--2
	end--1

	/*************************************/

END --1
end--0
GO

GO
--SqlScripter----[dbo].[trg_dte_envi_docu_his].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[trg_dte_envi_docu_his]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_envi_docu_his]')
GO
CREATE TRIGGER [dbo].[trg_dte_envi_docu_his]
ON [dbo].[dte_envi_docu] 
FOR  UPDATE 
AS
BEGIN --1
 declare
   @esta_envi varchar(3), @codi_empr numeric(9), 
   @corr_envi numeric(22), @mensaje varchar(80), 
   @cod_error varchar(1), @res varchar(19),
   @p_codi_empr numeric(9), @p_corr_envi numeric(22)
 begin --1

 print 'entrando a actualizar estado'
 IF UPDATE(esta_envi) 
 begin --2
       print 'Antes de select...'
       select @codi_empr=codi_empr, 
            @esta_envi= esta_envi, 
            @corr_envi=corr_envi 
       from inserted
       print 'Despues de select...'
     
     -- Inserta encabezado a BD Historica
     if (@esta_envi='HIS')
     begin --3
       print 'Antes de select...'
       print 'Despues de select...'
     
       set @mensaje ='Envios cabeza '
       print 'Insertando historia...'
       insert into   DTE_ENVI_DOCU_H  (
          CODI_EMPR,CORR_ENVI,RUTT_EMIS,DIGI_EMIS,RUTT_ENVI,
          DIGI_ENVI,FEHO_ENVI,VERS_ENVI,ESTA_ENVI,MENS_ENVI,      
          RUTT_RECE,DIGI_RECE,NUME_RESO,FECH_RESO,CODI_PERS,      
          RUTT_PERS,DIGI_PERS,POSI_ENVI,BLOC_ENVI,NOMB_ARCH,      
          NUME_ATEN,NUME_ENVI,DIRE_ARCH )   
       select
          ed.CODI_EMPR,ed.CORR_ENVI,ed.RUTT_EMIS,ed.DIGI_EMIS,ed.RUTT_ENVI,
          ed.DIGI_ENVI,ed.FEHO_ENVI,ed.VERS_ENVI,ed.ESTA_ENVI,ed.MENS_ENVI,      
          ed.RUTT_RECE,ed.DIGI_RECE,ed.NUME_RESO,ed.FECH_RESO,ed.CODI_PERS,      
          ed.RUTT_PERS,ed.DIGI_PERS,ed.POSI_ENVI,ed.BLOC_ENVI,ed.NOMB_ARCH,      
          ed.NUME_ATEN,ed.NUME_ENVI,ed.DIRE_ARCH
       from  inserted ed

       DECLARE cursor_envios CURSOR FOR
       	   select codi_empr, corr_envi 
       	   from deleted
       OPEN cursor_envios
       FETCH NEXT FROM cursor_envios INTO @p_codi_empr,@p_corr_envi
       WHILE (@@FETCH_STATUS = 0)
       BEGIN
	   execute @res= dte_inse_histo_envi @p_codi_empr, @p_corr_envi,
                       @cod_error, @mensaje 
           FETCH NEXT FROM cursor_envios INTO @p_codi_empr,@p_corr_envi
       END
       CLOSE cursor_envios
       DEALLOCATE cursor_envios
       
       if @cod_error = 'S' 
       begin  --4       
           set @mensaje =' -20082 -' +  @mensaje
           raiserror (@mensaje,16,1)
       end --4        
     end --3
   end --2
  end --1
end --1
GO

GO
--SqlScripter----[dbo].[trg_dte_reca_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_reca_item]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_reca_item]')
GO
CREATE TRIGGER [dbo].[trg_dte_reca_item]
ON dte_reca_item  for insert   AS
  declare
  @res          varchar (10),  @p_codi       varchar(5), 
  @hay_era      varchar(2),    @hay_err      varchar(2), 
  @fecha        varchar(10),   @mensaje      varchar(2000),
  @mensaje2     varchar(2000), @cod_error    varchar(10),
  @p_existe     varchar(1),    @p_mensaje    varchar(80), 
  @p_salida     varchar(80),   @p_ex         varchar(1),
  @p_men        varchar(80),   @p_codi_erro  varchar(12),
  @p_desc_erro  varchar(50),   @p_tipo_erro  varchar(10),
  @codi_emex    varchar(30),   @codi_empr    varchar(10), 
  @tipo_docu    varchar(3),    @foli_docu    varchar(10), 
  @tipo_reca    varchar(1),    @valo_reca    varchar(18),
  @p_bole_elec  varchar(1),    @descrip      varchar(80),
  @p_tipo_dnte	varchar(1),    @p_indi_dnte  varchar(1)
 BEGIN
    begin
      select @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
             @foli_docu=FOLI_DOCU, @tipo_reca=TIPO_RECA,
             @valo_reca=VALO_RECA
        from inserted
    end
    begin
     set  @mensaje2 =''
     set @descrip = 'TIPO_DOCU'
    
     execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                           @p_existe output, @p_mensaje output
     execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
             @p_bole_elec output, @p_tipo_dnte output,
	     @cod_error output, @mensaje output
    end

 /*************************/
 /*Valicion DTEs no Boleta*/
 /*************************/
 if @p_bole_elec = 'N'
   begin
     -- Tipo de de Valor : % o $
     begin
     execute @res= dte_tipo_desc @tipo_reca,
                     @cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 ='-20074 - TIPO_RECA -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20074'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end        
     end

     -- Sub-Recargo al Item 
     begin
     execute @res= dte_vali_reca  @codi_empr, @tipo_docu,
                    @foli_docu,   @tipo_reca, @valo_reca,
                    @cod_error output, @mensaje output      
     if @cod_error = 'S' 
       begin          
         set @mensaje2 ='-20050 - VALO_RECA -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20050'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end        
     end
   end --if p_bole_elec = 'N'

 /**********************/
 /*Valicion para Boleta*/
 /**********************/
 if @p_bole_elec = 'S'
    begin
      begin
       execute @res= dte_campo_bole 'TIPO_RECA', @tipo_reca, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'VALO_RECA', @valo_reca, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end
     
    end --if p_bole_elec = 'S'

   begin
      update dte_reca_item set 
                 MNSG_ERRO=isnull(MNSG_ERRO,'') +@mensaje2
      where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_reca_item.codi_empr
              and inserted.foli_docu =dte_reca_item.foli_docu
              and inserted.tipo_docu =dte_reca_item.tipo_docu)
   end
 END
GO

GO
--SqlScripter----[dbo].[trg_dte_reca_item_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_reca_item_p]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_reca_item_p]')
GO
CREATE TRIGGER [dbo].[trg_dte_reca_item_p]
ON dte_reca_item_p  for insert   AS
  declare
  @res   	varchar(10),   @p_codi       varchar(5), 
  @hay_era 	varchar(2),    @hay_err      varchar(2), 
  @fecha  	varchar(10),   @mensaje      varchar(2000),
  @mensaje2  	varchar(2000), @cod_error    varchar(10),
  @p_existe  	varchar(1),    @p_mensaje    varchar(80), 
  @p_salida  	varchar(80),   @p_ex         varchar(1),        
  @p_men 	varchar(80),   @p_codi_erro  varchar(12),
  @p_desc_erro  varchar(50),   @p_tipo_erro  varchar(10),
  @codi_emex 	varchar(30),   @codi_empr    varchar(10), 
  @tipo_docu 	varchar(3),    @foli_docu    varchar(10), 
  @tipo_reca 	varchar(1),    @valo_reca    varchar(18), 
  @p_bole_elec  varchar(1),    @descrip      varchar(80),
  @p_tipo_dnte	varchar(1),    @p_indi_dnte  varchar(1)
BEGIN
   begin
      select @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
             @foli_docu=FOLI_DOCU, @tipo_reca=TIPO_RECA,
             @valo_reca=VALO_RECA
        from inserted
   end
   begin
     set  @mensaje2 =''
      execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                            @p_existe output, @p_mensaje output
     execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
             @p_bole_elec output, @p_tipo_dnte output,
	     @cod_error output, @mensaje output
   end

/*************************/
 /*Valicion DTEs no Boleta*/
 /*************************/
 if @p_bole_elec = 'N'
   begin
     -- Tipo de de Valor : % o $
     begin
     execute @res= dte_tipo_desc @tipo_reca,
                     @cod_error output, @mensaje output     
     if @cod_error = 'S' 
       begin          
         set @mensaje2 ='-20074 - TIPO_RECA -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20074'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
               end
            end
       end        
     end

     -- Sub-Recargo al Item 
     begin
     execute @res= dte_vali_reca  @codi_empr, @tipo_docu,
                    @foli_docu,   @tipo_reca, @valo_reca,
                    @cod_error output, @mensaje output      
     if @cod_error = 'S' 
       begin          
         set @mensaje2 ='-20050 - VALO_RECA -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20050'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end
               end 
            end
       end        
     end
   end

 /**********************/
 /*Valicion para Boleta*/
 /**********************/
 if @p_bole_elec = 'S'
    begin
      begin
       execute @res= dte_campo_bole 'TIPO_RECA', @tipo_reca, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'VALO_RECA', @valo_reca, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end   
    end --if p_bole_elec = 'S'
 begin
   update dte_reca_item_p set 
          MNSG_ERRO=isnull(MNSG_ERRO,'') +@mensaje2
   where EXISTS 
        (select *  from inserted
         where inserted.codi_empr =dte_reca_item_p.codi_empr
         and inserted.foli_docu =dte_reca_item_p.foli_docu
         and inserted.tipo_docu =dte_reca_item_p.tipo_docu)
 end
END
GO

GO
--SqlScripter----[dbo].[trg_dte_suma_impu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_suma_impu]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_suma_impu]')
GO
CREATE TRIGGER [dbo].[trg_dte_suma_impu]
ON dte_suma_impu  for insert   AS
BEGIN
  declare
   @res       varchar (10),  @p_codi    varchar(5),
   @hay_era   varchar(3),    @MNSG_ERRO  varchar(2000),
   @hay_err   varchar(2),    @fecha     varchar(10),
   @mensaje   varchar(2000), @mensaje2  varchar(2000),
   @cod_error varchar(10),   @p_existe  varchar(1),
   @p_mensaje varchar(80),   @p_salida  varchar(80),
   @p_ex      varchar(1),    @p_men     varchar(80),
   @p_codi_erro  varchar(12),  @p_desc_erro   varchar(50),
   @p_tipo_erro  varchar (10), @tasa_impu varchar(10),
   @codi_empr varchar(10), @tipo_docu varchar(3),
   @foli_docu varchar(10), @codi_impu varchar(6),
   @mont_impu varchar(18), @p_bole_elec varchar(1),
   @descrip   varchar(80), @p_tipo_dnte varchar(1),
   @p_indi_dnte varchar(1)

 BEGIN
  begin
    select @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
           @foli_docu=FOLI_DOCU, @codi_impu=CODI_IMPU,
           @mont_impu=MONT_IMPU, @tasa_impu=TASA_IMPU
     from inserted
  end
   begin
      set  @mensaje2 =''
      set @descrip = 'TIPO_DOCU'
      execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
              @p_existe output, @p_mensaje output
      execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                    @p_bole_elec output, @p_tipo_dnte output, 
		    @cod_error output, @mensaje output
   end

  /***************************/
  /*Validacion DTES no Boleta*/
  /***************************/
  if @p_bole_elec = 'N'
   begin
    -- valida Codigo de Otros Impuestos 
    begin
    execute @res=dte_codi_impu @codi_empr, @tipo_docu,
                     @foli_docu, @codi_impu,
                     @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+' -20073 - CODI_IMPU -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20073'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
 	       end 
            end
      end        
    end

    -- valida el Monto de Otros Impuestos 
    begin
    execute @res=dte_valo_impu @codi_empr, @tipo_docu,
                     @foli_docu, @mont_impu, '0.5','N',
                     @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+' -20080 - MONT_IMPU -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20080'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              	else
                begin
                   set  @hay_era = '1'
                end
	       end 
            end
      end        
    end
   end --if p_bole_elec = 'N'

 /************************/
 /*Validacion para Boleta*/
 /************************/
 if @p_bole_elec = 'S'
    begin
      begin
       execute @res= dte_campo_bole 'CODI_IMPU', @codi_impu, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'MONT_IMPU', @mont_impu, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_tasa_bole 'TASA_IMPU', @tasa_impu, 
		     @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end
    end --if p_bole_elec = 'S'
   
   begin
     update dte_suma_impu set  MNSG_ERRO=isnull(MNSG_ERRO,'')+@mensaje2
     where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_suma_impu.codi_empr
              and inserted.foli_docu =dte_suma_impu.foli_docu
              and inserted.tipo_docu =dte_suma_impu.tipo_docu)
   end
 END
END
GO

GO
--SqlScripter----[dbo].[trg_dte_suma_impu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_suma_impu_p]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_suma_impu_p]')
GO
CREATE TRIGGER [dbo].[trg_dte_suma_impu_p]
ON dte_suma_impu_p  for insert   AS
BEGIN
  declare
   @res       	varchar (10),  @p_codi       varchar(5),
   @hay_era   	varchar(3),    @MNSG_ERRO    varchar(2000),
   @hay_err   	varchar(2),    @fecha        varchar(10),
   @mensaje   	varchar(2000), @mensaje2     varchar(2000),
   @cod_error 	varchar(10),   @p_existe     varchar(1),
   @p_mensaje 	varchar(80),   @p_salida     varchar(80),
   @p_ex  	varchar(1),    @p_men        varchar(80),
   @p_codi_erro varchar(12),   @p_desc_erro  varchar(50),
   @p_tipo_erro varchar (10),  @codi_empr    varchar(10), 
   @tipo_docu 	varchar(3),    @foli_docu    varchar(10), 
   @codi_impu 	varchar(6),    @mont_impu    varchar(18),
   @p_bole_elec varchar(1),    @descrip      varchar(80), 
   @p_tipo_dnte varchar(1),    @p_indi_dnte  varchar(1),
   @tasa_impu   varchar(10)

 BEGIN
  begin
    select @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU,
           @foli_docu=FOLI_DOCU, @codi_impu=CODI_IMPU,
           @mont_impu=MONT_IMPU, @tasa_impu=TASA_IMPU
     from inserted
  end
  begin
      set  @mensaje2 =' '
      execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                          @p_existe output, @p_mensaje output
      execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                    @p_bole_elec output, @p_tipo_dnte output, 
		    @cod_error output, @mensaje output
  end

  /***************************/
  /*Validacion DTES no Boleta*/
  /***************************/
  if @p_bole_elec = 'N'
   begin
    -- valida Codigo de Otros Impuestos 
    begin
    execute @res=dte_codi_impu @codi_empr, @tipo_docu,
                     @foli_docu, @codi_impu,
                     @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+' -20073 - CODI_IMPU -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20073'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
               end
            end
      end        
    end

    -- valida el Monto de Otros Impuestos 
    begin
    execute @res = dte_valo_impu @codi_empr, @tipo_docu,
                   @foli_docu, @mont_impu, '0.5','N',
                   @cod_error output, @mensaje output     
    if @cod_error = 'S' 
      begin          
         set @mensaje2 = @mensaje2 + ' -20080 - MONT_IMPU -'
                         + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20080'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
               end
            end
      end        
    end
   end


 /************************/
 /*Validacion para Boleta*/
 /************************/
 if @p_bole_elec = 'S'
    begin
      begin
       execute @res= dte_campo_bole 'CODI_IMPU', @codi_impu, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'MONT_IMPU', @mont_impu, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_tasa_bole 'TASA_IMPU', @tasa_impu, 
		     @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end
    end --if p_bole_elec = 'S'

 begin
     update dte_suma_impu_p set 
               MNSG_ERRO=isnull(MNSG_ERRO,'')+@mensaje2
     where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_suma_impu_p.codi_empr
            and inserted.foli_docu =dte_suma_impu_p.foli_docu
            and inserted.tipo_docu =dte_suma_impu_p.tipo_docu)
 end
 END
END
GO

GO
--SqlScripter----[dbo].[trg_dte_vali_suca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_vali_suca]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_vali_suca]')
GO
CREATE TRIGGER [dbo].[trg_dte_vali_suca]
ON dte_suca_item  for  insert AS
BEGIN
 declare
   @res       varchar (10),  @p_codi    varchar(5),
   @hay_err  varchar(3),     @MNSG_ERRO  varchar(2000),
   @fecha     varchar(10),   @hay_era varchar(3),
   @mensaje   varchar(2000), @mensaje2  varchar(2000),
   @cod_error varchar(10),   @p_existe varchar(1),
   @p_mensaje varchar(80),   @p_salida varchar(80),
   @p_ex  varchar(1),        @p_men varchar(80),
   @p_codi_erro varchar(12), @p_desc_erro   varchar(50),
   @p_tipo_erro varchar (10),@codi_empr varchar(20),   
   @tipo_docu  varchar(3),   @foli_docu  varchar(10),  
   @nume_line varchar(4),    @corr_suca varchar(4),    
   @codi_suca varchar(20),   @suca_dist varchar(20), 
   @p_bole_elec varchar(1),  @descrip   varchar(80),
   @p_tipo_dnte varchar(1),  @p_indi_dnte varchar(1)
 BEGIN
   begin
    select @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU, @foli_docu=FOLI_DOCU,
           @nume_line=NUME_LINE, @corr_suca=CORR_suca, 
           @codi_suca=CODI_SUCA, @suca_dist=SUCA_DIST
    from inserted
   end
   begin
      set  @mensaje2 =''
      set @descrip = 'TIPO_DOCU'

      execute @res=PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida  output ,
                       @p_existe, @p_mensaje
      execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                    @p_bole_elec output, @p_tipo_dnte output, 
		    @cod_error output, @mensaje output
   end

 /*****************************/
 /* Validacion DTEs no Boleta */
 /*****************************/
 if @p_bole_elec = 'N'
  begin
     --Sub cantidad Distribuida
     begin
     execute @res= dte_subc_dist @codi_empr,@tipo_docu,@foli_docu, 
                  @nume_line, @CORR_SUCA,@codi_suca, @suca_dist, 
                  @cod_error output, @mensaje output  
     if @cod_error = 'S' 
      begin        
         set @mensaje2 ='-20050 - SUCA_DIST -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
               raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20050'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                 begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                 end
              	else
                 begin
                   set  @hay_era = '1'
                 end
	       end 
            end
      end
     end
   end --if p_bole_elec = 'N'

 /**************************/
 /* Validacion para Boleta */
 /**************************/
 if @p_bole_elec = 'S'
   begin
      begin
       execute @res= dte_campo_bole 'CODI_SUCA', @codi_suca, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'SUCA_DIST', @suca_dist, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
              raiserror (@mensaje2,16,1)
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

   end --if p_bole_elec = 'S'
     
   begin
     update dte_suca_item set  MNSG_ERRO=isnull(MNSG_ERRO,'') +@mensaje2
     where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_suca_item.codi_empr
              and inserted.foli_docu =dte_suca_item.foli_docu
              and inserted.tipo_docu =dte_suca_item.tipo_docu)
   end
 END
END
GO

GO
--SqlScripter----[dbo].[trg_dte_vali_suca_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dte_vali_suca_p]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dte_vali_suca_p]')
GO
CREATE TRIGGER [dbo].[trg_dte_vali_suca_p]
ON dte_suca_item_p  for  insert AS
BEGIN
 declare
   @res       	varchar(10),   @p_codi       varchar(5),
   @hay_err   	varchar(3),    @MNSG_ERRO    varchar(2000),
   @fecha     	varchar(10),   @hay_era      varchar(3),
   @mensaje   	varchar(2000), @mensaje2     varchar(2000),
   @cod_error 	varchar(10),   @p_existe     varchar(1),
   @p_mensaje   varchar(80),   @p_salida     varchar(80),
   @p_ex  	varchar(1),    @p_men        varchar(80),
   @p_codi_erro varchar(12),   @p_desc_erro  varchar(50),
   @p_tipo_erro varchar(10),   @codi_empr    varchar(20),
   @tipo_docu   varchar(3),    @foli_docu    varchar(10),
   @nume_line   varchar(4),    @corr_suca    varchar(4),
   @codi_suca   varchar(20),   @suca_dist    varchar(20),
   @p_bole_elec varchar(1),    @descrip      varchar(80),
   @p_tipo_dnte varchar(1),    @p_indi_dnte  varchar(1)
 BEGIN
   begin
    select @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU, 
	   @foli_docu=FOLI_DOCU, @nume_line=NUME_LINE, 
	   @corr_suca=CORR_suca, @codi_suca=CODI_SUCA, 
	   @suca_dist=SUCA_DIST
    from inserted
   end
   begin
      execute @res=PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida  output ,
                       @p_existe, @p_mensaje
      execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                    @p_bole_elec output, @p_tipo_dnte output, 
		    @cod_error output, @mensaje output
   end
 /*****************************/
 /* Validacion DTEs no Boleta */
 /*****************************/
 if @p_bole_elec = 'N'
  begin
     --Sub cantidad Distribuida
     begin
     execute @res= dte_subc_dist_p @codi_empr,@tipo_docu,@foli_docu, 
                   @nume_line, @CORR_SUCA,@codi_suca, @suca_dist, 
                   @cod_error output, @mensaje output  
     if @cod_error = 'S' 
      begin        
         set @mensaje2 ='-20050 - SUCA_DIST -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
              set @p_codi ='20050'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if (@p_tipo_dnte = 'N') OR (@p_tipo_dnte = 'S' AND @p_indi_dnte = 'S')
               begin
 		if @p_tipo_erro ='ERR'   
                   begin
                     set  @hay_err = '1'
                   end
                else
                   begin
                     set  @hay_era = '1'
                   end 
               end
            end
      end
     end
  end

 /**************************/
 /* Validacion para Boleta */
 /**************************/
 if @p_bole_elec = 'S'
   begin
      begin
       execute @res= dte_campo_bole 'CODI_SUCA', @codi_suca, 
		     'C', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end

      begin
       execute @res= dte_campo_bole 'SUCA_DIST', @suca_dist, 
		     'N', @cod_error output, @mensaje output
       if @cod_error='S'
        begin
     	  set @mensaje2 = @mensaje2 + '- 20089 - ' + @mensaje
          if @p_salida = 'TOTAL' 
            begin
              set  @hay_err = '1'
            end
          else
           if @p_salida  = 'PARCIAL' 
              begin
                 set @p_codi ='20089'
                 execute @res= dte_chec_erro  @p_codi,
                               @p_desc_erro output, @p_tipo_erro output,
                               @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                    end
                 else
                    begin
                      set  @hay_era = '1'
                    end 
              end
        end
      end
   end --if p_bole_elec = 'S'

 begin
     update dte_suca_item_p set  MNSG_ERRO=isnull(MNSG_ERRO,'') +@mensaje2
     where EXISTS 
           (select *  from inserted
            where inserted.codi_empr =dte_suca_item_p.codi_empr
              and inserted.foli_docu =dte_suca_item_p.foli_docu
              and inserted.tipo_docu =dte_suca_item_p.tipo_docu)
 end

 END
END
GO

GO
--SqlScripter----[dbo].[trg_dto_enca_docu_apro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dto_enca_docu_apro]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dto_enca_docu_apro]')
GO
CREATE TRIGGER [dbo].[trg_dto_enca_docu_apro]
ON dto_enca_docu_p for update as 
BEGIN

DECLARE
	@codi_empr numeric(9,0),
	@corr_docu numeric(18,0),
	@tipo_docu varchar(54),
	@foli_docu varchar(30),
	@codi_usua varchar(30),
	@mail_usua varchar(80),
	@mail_empr varchar(100),
	@rutt_emis varchar(27),
	@texto		 varchar(500),
	@existe		 varchar(1),
	@mensaje	 varchar(80),
	@mtod_id	 numeric(9,0)
BEGIN

	begin
		select @codi_empr = codi_empr,
					 @corr_docu = corr_docu,
					 @tipo_docu = tipo_docu,
					 @foli_docu = foli_docu,
					 @rutt_emis	=	rutt_emis,
					 @mail_usua = mail_usua_apro
		from inserted
	end

	if (@mail_usua is not null)
	begin
			select @texto = 'Consulte la opción de Aprobación de DTOs y modifique el campo Estado según corresponda:' + char(10) + char(10);
			select @texto = @texto + char(9) + 'Emisor: ' + @rutt_emis;
			select @texto = @texto + char(9) + 'Folio: ' + @foli_docu;
			select @texto = @texto + char(9) + 'Tipo: ' + @tipo_docu;
			execute paem_get_val @codi_empr,'ALL','EGME',@mail_empr output,@existe output, @mensaje output
			execute put_email @mail_empr, @mail_usua,'','Ud. tiene un nuevo Documento Electrónico por Revisar.', @texto, @mtod_id output
	end
END
END
GO

GO
--SqlScripter----[dbo].[trg_dto_enca_docu_his].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[trg_dto_enca_docu_his]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dto_enca_docu_his]')
GO
CREATE TRIGGER [dbo].[trg_dto_enca_docu_his]
ON [dbo].[dto_enca_docu_p] 
FOR  UPDATE 
AS 
BEGIN --1
 declare
 @mensaje   varchar(2000),  @cod_error varchar(10), 
 @mensaje2   varchar(2000), @corr_envi varchar(22),
 @codi_empr varchar(20),    @tipo_docu  varchar(20), 
 @foli_docu varchar(20),    @esta_docu varchar(3),
 @corr_docu varchar(20),    @res   varchar (10),
 @p_codi_empr varchar(20),  @p_tipo_docu  varchar(20), 
 @p_foli_docu varchar(20),  @p_corr_docu varchar(20)
 print 'entrando a actualizar estado'
 IF UPDATE(esta_docu) 
  begin --2
    select @codi_empr=codi_empr, 
         @tipo_docu=tipo_docu, 
         @foli_docu=foli_docu, 
         @esta_docu= esta_docu 
    from inserted
  
    print  @esta_docu
    -- Inserta encabezado a BD Historica
    if (@esta_docu='HIS')
       begin --3
	  select @codi_empr=codi_empr, @tipo_docu=tipo_docu,
	         @foli_docu=foli_docu, @esta_docu=esta_docu, 
		 @corr_envi=corr_envi, @corr_docu=corr_docu
	  from deleted
	
	  print 'Insertando encabezado'
          set @mensaje2 = 'Inserta Encabezado'
	  insert into dto_enca_docu_h (
	     CODI_EMPR, CORR_DOCU, TIPO_DOCU, FOLI_DOCU, ESTA_DOCU, 
	     MENS_ESTA, CORR_ENVI, MENS_ENVI, FECH_EMIS, ENTR_BIEN, 
	     VENT_SERV, FORM_PAGO, FECH_CANC, MONT_BRUT, MODA_PAGO, 
	     FECH_VENC, DIAS_TEPA, CODI_TEPA, RUTT_EMIS, PERI_DESD, 
	     PERI_HAST, DIGI_EMIS, NOMB_EMIS, GIRO_EMIS, NOMB_SUCU, 
	     CODI_SUCU, DIRE_ORIG, COMU_ORIG, CIUD_ORIG, CODI_VEND, 
	     RUTT_MAND, DIGI_MAND, RUTT_RECE, DIGI_RECE, NOMB_RECE, 
	     CODI_RECE, GIRO_RECE, CONT_RECE, DIRE_RECE, COMU_RECE, 
	     CIUD_RECE, DIRE_POST, COMU_POST, CIUD_POST, RUTT_SOFA, 
	     DIGI_SOFA, INFO_TRAN, RUTT_TRAN, DIGI_TRAN, DIRE_DEST, 
	     COMU_DEST, CIUD_DEST, MONT_NETO, MONT_EXEN, IMPU_VAAG, 
	     IMPU_VANR, CRED_ES65, GARA_ENVA, MONT_TOTA, MONT_NOFA, 
	     VALO_PAGA, SALD_ANTE, CODI_CECO, FEHO_FIRM, INDI_VEGD, 
	     VERS_ENCA, CORR_RAFO, FEHO_TED,  FIRM_TED,  FECH_CARG, 
	     NUME_IMPR, MNSG_ERRO, INDI_NORE, SUBT_VESE, DIRE_ARCH, 
	     TASA_VAAG, MONT_BASE, CODI_ESAP, FECH_ESAP, USUA_ESAP, 
	     RAZO_ESAP)
	  select 
	     CODI_EMPR, CORR_DOCU, TIPO_DOCU, FOLI_DOCU, ESTA_DOCU, 
	     MENS_ESTA, CORR_ENVI, MENS_ENVI, FECH_EMIS, ENTR_BIEN, 
	     VENT_SERV, FORM_PAGO, FECH_CANC, MONT_BRUT, MODA_PAGO, 
	     FECH_VENC, DIAS_TEPA, CODI_TEPA, RUTT_EMIS, PERI_DESD, 
	     PERI_HAST, DIGI_EMIS, NOMB_EMIS, GIRO_EMIS, NOMB_SUCU, 
	     CODI_SUCU, DIRE_ORIG, COMU_ORIG, CIUD_ORIG, CODI_VEND, 
	     RUTT_MAND, DIGI_MAND, RUTT_RECE, DIGI_RECE, NOMB_RECE, 
	     CODI_RECE, GIRO_RECE, CONT_RECE, DIRE_RECE, COMU_RECE, 
	     CIUD_RECE, DIRE_POST, COMU_POST, CIUD_POST, RUTT_SOFA, 
	     DIGI_SOFA, INFO_TRAN, RUTT_TRAN, DIGI_TRAN, DIRE_DEST, 
	     COMU_DEST, CIUD_DEST, MONT_NETO, MONT_EXEN, IMPU_VAAG, 
	     IMPU_VANR, CRED_ES65, GARA_ENVA, MONT_TOTA, MONT_NOFA, 
	     VALO_PAGA, SALD_ANTE, CODI_CECO, FEHO_FIRM, INDI_VEGD, 
	     VERS_ENCA, CORR_RAFO, FEHO_TED,  FIRM_TED,  FECH_CARG, 
	     NUME_IMPR, MNSG_ERRO, INDI_NORE, SUBT_VESE, DIRE_ARCH, 
	     TASA_VAAG, MONT_BASE, CODI_ESAP, FECH_ESAP, USUA_ESAP, 
	     RAZO_ESAP 
	  from deleted
          
	  print 'Llamando procedimiento'
          DECLARE cursor_dtos CURSOR FOR
	       select codi_empr, tipo_docu, foli_docu, corr_docu
	       from deleted
	  OPEN cursor_dtos
	  FETCH NEXT FROM cursor_dtos INTO @p_codi_empr,@p_tipo_docu, @p_foli_docu, @p_corr_docu
	  WHILE (@@FETCH_STATUS = 0)
	  BEGIN
              execute @res= dto_inse_histo @p_codi_empr, @p_tipo_docu,
                        @p_foli_docu, @p_corr_docu, @cod_error, @mensaje  
              FETCH NEXT FROM cursor_dtos INTO @p_codi_empr,@p_tipo_docu, @p_foli_docu, @p_corr_docu
          END
	  CLOSE cursor_dtos
	  DEALLOCATE cursor_dtos

          if @cod_error = 'S' 
          begin  --4        
            set @mensaje2 = '-20082 '+  @mensaje
            raiserror (@mensaje2,16,1)
          end --4        
       end --3
  end -- 2
end --1
GO

GO
--SqlScripter----[dbo].[trg_dto_enca_docu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[trg_dto_enca_docu_p]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dto_enca_docu_p]')
GO
CREATE TRIGGER [dbo].[trg_dto_enca_docu_p]
ON dto_enca_docu_p
	for insert AS
BEGIN
	declare
 @hay_err     varchar(3),  @hay_era   varchar(3),
 @esta_docu   varchar(3),  @esta_docu_old  varchar(3),
 @descrip     varchar(80), @fecha     varchar(10),
 @mensaje     varchar(2000), @cod_error varchar(10), 
 @p_existe    varchar(1),  @p_desc_erro varchar(50),
 @p_mensaje   varchar(80), @p_salida  VARCHAR(80),
 @p_ex        varchar(1),  @p_men     varchar(80), 
 @p_codi_erro varchar(12), @mensaje2  varchar(2000),
 @p_tipo_erro varchar(12), @MNSG_ERRO varchar(2000),
 @p_codi      varchar(5),  @p_param   varchar(20), 
 @p_param2    varchar(20), @p_param3  varchar(20), 
 @p_param4    varchar(20), @res       varchar (10),
 @dire_arch   varchar(100),@dire_arch_old varchar(100), 
 @ult_foli    varchar(10), @codi_empr varchar(20), 
 @tipo_docu   varchar(20), @foli_docu varchar(20),
 @corr_envi   varchar(22), @vers_enca varchar(20),  
 @fech_emis   varchar(10), @entr_bien varchar(20), 
 @vent_serv   varchar(20), @indi_vegd varchar(20), 
 @form_pago   varchar(20), @fech_canc varchar(10),
 @mont_brut   varchar(20), @moda_pago varchar(20), 
 @fech_venc   varchar(10), @rutt_emis varchar(20), 
 @peri_desd   varchar(20), @peri_hast varchar(20), 
 @digi_emis   varchar(20), @nomb_emis varchar(100), 
 @giro_emis   varchar(20), @nomb_sucu varchar(20), 
 @codi_sucu   varchar(20), @dire_orig varchar(60), 
 @comu_orig   varchar(20), @ciud_orig varchar(20), 
 @rutt_rece   varchar(20), @digi_rece varchar(20), 
 @nomb_rece   varchar(20), @giro_rece varchar(40), 
 @cont_rece   varchar(80), @dire_rece varchar(100), 
 @comu_rece   varchar(20), @ciud_rece varchar(20), 
 @rutt_sofa   varchar(20), @digi_sofa varchar(20), 
 @info_tran   varchar(20), @rutt_tran varchar(20), 
 @digi_tran   varchar(20), @dire_dest varchar(40), 
 @comu_dest   varchar(20), @ciud_dest varchar(20), 
 @mont_neto   varchar(20), @mont_exen varchar(20), 
 @impu_vaag   varchar(20), @impu_vanr varchar(20), 
 @cred_es65   varchar(20), @gara_enva varchar(20), 
 @mont_tota   varchar(20), @mont_nofa varchar(20), 
 @valo_paga   varchar(20), @codi_ceco varchar(20), 
 @corr_rafo   varchar(20), @codi_tepa varchar(20), 
 @dias_tepa   varchar(20), @sald_ante varchar(20), 
 @tasa_vaag   varchar(20), @mont_base varchar(20), 
 @p_dia_mes   varchar(2),  @p_dia_res varchar(2),  
 @p_dia_ok    varchar(1),  @p_rutt_empr numeric(8), 
 @p_digi_empr varchar(1),  @hay_espec varchar(3),
 @p_dire_arch varchar(100), @p_bole_elec varchar(1),
 @p_tipo_dnte varchar(1), @p_indi_dnte varchar(1),
 @reci_rece varchar(80), @p_reci_rece varchar(80),
 @texto		 varchar(500), 	@mail_empr varchar(100),
 @mtod_id	 numeric(9,0),  @mail_usua varchar(80),
 @codi_usua varchar(30), 	@corr_docu numeric(18,0)

BEGIN
--SP1 SE 5.2
SET DATEFORMAT ymd
begin
 select 
 @codi_empr=CODI_EMPR, @tipo_docu=TIPO_DOCU, @foli_docu=FOLI_DOCU, 
 @esta_docu=ESTA_DOCU, @corr_envi=CORR_ENVI, @vers_enca=VERS_ENCA, 
 @fech_emis=FECH_EMIS, @entr_bien=ENTR_BIEN, @vent_serv=VENT_SERV,
 @indi_vegd=INDI_VEGD, @form_pago=FORM_PAGO, @fech_canc=FECH_CANC,
 @mont_brut=MONT_BRUT, @moda_pago=MODA_PAGO, @fech_venc=FECH_VENC,
 @rutt_emis=RUTT_EMIS, @peri_desd=PERI_DESD, @peri_hast=PERI_HAST,
 @digi_emis=DIGI_EMIS, @nomb_emis=NOMB_EMIS, @giro_emis=GIRO_EMIS,
 @nomb_sucu=NOMB_SUCU, @codi_sucu=CODI_SUCU, @dire_orig=DIRE_ORIG,
 @comu_orig=COMU_ORIG, @ciud_orig=CIUD_ORIG, @rutt_rece=RUTT_RECE,
 @digi_rece=DIGI_RECE, @nomb_rece=NOMB_RECE, @giro_rece=GIRO_RECE,
 @cont_rece=CONT_RECE, @dire_rece=DIRE_RECE, @comu_rece=COMU_RECE,
 @ciud_rece=CIUD_RECE, @rutt_sofa=RUTT_SOFA, @digi_sofa=DIGI_SOFA,
 @info_tran=INFO_TRAN, @rutt_tran=RUTT_TRAN, @digi_tran=DIGI_TRAN,
 @dire_dest=DIRE_DEST, @comu_dest=COMU_DEST, @ciud_dest=CIUD_DEST,
 @mont_neto=MONT_NETO, @mont_exen=MONT_EXEN, @impu_vaag=IMPU_VAAG,
 @impu_vanr=IMPU_VANR, @cred_es65=CRED_ES65, @gara_enva=GARA_ENVA,
 @mont_tota=MONT_TOTA, @mont_nofa=MONT_NOFA, @valo_paga=VALO_PAGA,
 @codi_ceco=CODI_CECO, @corr_rafo=CORR_RAFO, @codi_tepa=CODI_TEPA,
 @dias_tepa=DIAS_TEPA, @sald_ante=SALD_ANTE, @tasa_vaag=TASA_VAAG,
 @mont_base=MONT_BASE, @dire_arch=DIRE_ARCH, @reci_rece=RECI_RECE,
 @corr_docu = CORR_DOCU
 from inserted
 end
 begin
     set  @hay_err = '0'
     set  @hay_era = '0'
     set  @hay_espec = '0'
     set  @mensaje2 =' '
     execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                          @p_existe output, @p_mensaje output
     if @esta_docu IN ('ERR','ER1','ER4') 
     begin
         set @hay_err = '1'                    
	 set @hay_espec = '1'    
     end                                                                                         

 
 end

 begin --1
    if  isnull(@dire_arch,'x')='x'
    begin--2
    

     execute PAEM_GET_VAL @codi_empr, 'ALL', 'EDS0', @p_dire_arch output,
                          @p_existe output, @p_mensaje output
     if (@p_existe = 'N' or @p_dire_arch is null)
	begin
	     execute PARA_GET_VAL 'EGATE_DIRE_ENTR', @p_dire_arch output,
                  @cod_error output, @mensaje output
	end




                  
       execute PARA_GET_VAL 'EGATE_DIRE_DIA',@p_dia_res  output,
                  @p_dia_ok output, @p_mensaje output
       if @p_dia_ok ='S' 
       begin--3.1 
           if @p_dia_res ='1' 
           begin --4.1
              set @p_dia_mes =  convert(char(2),DATEPART(dd, GETDATE()))
              set @dire_arch = @p_dire_arch+'\'+@p_dia_mes
           end--4.1
           else
           begin--4.2
              set @dire_arch = @p_dire_arch
           end--4.2
       end --3.1
       else
       begin--3.2
          set @dire_arch = @p_dire_arch
       end--3.2
       --** valida error de :DTE_DIRE_SALI
       if @cod_error = 'N' 
       begin--3.3          
           set @mensaje2 =@mensaje2 +' -20083 -  Dir. Firma -'+ @mensaje
           if  @p_salida = 'TOTAL' 
           begin--4.1
              set  @hay_err = '1'
           end--4.1
           else
           begin--4.2
              if  @p_salida  = 'PARCIAL' 
              begin--5.1
                 set @p_codi ='20083'
                 execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
                 if @p_tipo_erro ='ERR'   
                 begin--6.1
                     set  @hay_err = '1'
                 end--6.1
                 else
                 begin--6.2
                     set  @hay_era = '1'
                 end--6.2 
              end--5.1
           end--4.2 
       end--3.3 
    end--2
 end--1

 begin
  --Tipo Documento - valida en  DTE_TIPO_DOCU
  begin
    set @descrip = 'TIPO_DOCU'
    execute @res= dte_chec_tido_veel @tipo_docu, @descrip output,
                  @p_bole_elec output, @p_tipo_dnte output, 
		  @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20005 - TIPO_DOCU -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20005'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
  end
  
  --Folio del Documento 
  begin 
    execute @res=dte_nume_rut @foli_docu, 'x', 'N','S',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20006 - FOLI_DOCU -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20006'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
   end
/*--Fecha de Emision 
   begin
     execute @res=dte_vali_fech @fech_emis,'S',
                           @cod_error output, @mensaje output
     if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20007 - FECH_EMIS -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20007'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
   end
*/

--Tipo De Despacho, tipo de documento 
   begin
    execute @res=dte_CHECK_DOMAIN '95',@entr_bien, 'N',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20008 - ENTR_BIEN -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20008'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
   end
-- Indicador De Venta con Guia de Despacho
   begin
    if @tipo_docu ='52' 
     begin
     execute @res=dte_CHECK_DOMAIN '96',@indi_vegd, 'N',
                              @cod_error output, @mensaje output
     if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20009 - INDI_SEGD -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20009'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'

                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end

    end
   end
--  Indicador Venta Servicio Periodico
   begin
     execute @res=dte_CHECK_DOMAIN '76',@vent_serv, 'N',
                              @cod_error output, @mensaje output
     if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20010 - VENT_SERV -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
                 raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20010'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
   end
-- Indicador Montos Brutos  
  begin
    execute @res=dte_CHECK_DOMAIN '75',@mont_brut, 'N',
                              @cod_error output, @mensaje output
     if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20011 - MONT_BRUT -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
                 raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20011'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
  end
-- Forma de Pago 
  begin
   execute @res=dte_CHECK_DOMAIN '94',@form_pago, 'N',
                         @cod_error output, @mensaje output
     if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20012 - FORM_PAGO -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
                 raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20012'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
  end
/*-- Fecha de Cancelacion 
  begin
     execute @res=dte_vali_fech @fech_canc,'S',
                           @cod_error output, @mensaje output
     if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20013 - FECH_CANC -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                  set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20013'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
   end*/
--Periodo  Desde 
  begin
    execute @res=dte_fech_deha  @peri_desd, @peri_hast, 'D',
                           @cod_error output, @mensaje output
     if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20014 - PERI_DESD -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
                 raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20014'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 

            end
      end        
  end
--Periodo  Hasta
  begin
    execute @res=dte_fech_deha  @peri_desd, @peri_hast, 'D',
                           @cod_error output, @mensaje output
     if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20015 - PERI_HAST -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                  set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
            end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20015'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
  end
--Modalidad de Pago
  begin
     execute @res=dte_CHECK_DOMAIN '87',@moda_pago, 'N',
                         @cod_error output, @mensaje output
     if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20016 - MODO_PAGO -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20016'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
    end
--Termino de Pago, Cantidad en dias (>0)
  begin
    execute @res=  dte_nume_rang @dias_tepa,'1','N',
                          @cod_error output, @mensaje output 
    if @cod_error = 'S' 
      begin          
         set @mensaje2 =@mensaje2+ ' -20017 - CODI_TEPA -'
                      + @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
                 raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20017'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
  end
/*--Fecha de Vencimiento
  begin
   execute @res=dte_vali_fech @fech_venc,'S',
                           @cod_error output, @mensaje output
     if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20019 - FECH_VENC -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20019'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
  end

*/
--Rut, digito  del Emisor
  begin
     execute @res=dte_nume_rut @rutt_emis, @digi_emis, 'S','S',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin 
		set @hay_err = '1'         
		set @hay_espec = '1'
		set @esta_docu = 'ER2'
		set @mensaje2 =@mensaje2+ ' Error en RUT Emisor'
      end        
  end
-- Codigo de Sucursal,  solo se valida que sea numerico 
  begin
     execute @res=dte_codi_sucu @codi_empr, @codi_sucu,
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20023 - EMPR - CODI SUCU -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20023'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end               else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
  end
--Rut Receptor
begin
    execute @res=dte_nume_rut @rutt_rece, @digi_rece, 'S','S',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
    	set @hay_err = '1'         
		set @hay_espec = '1'
		set @esta_docu = 'ER3'
		set @mensaje2 =@mensaje2+ ' Error en RUT Receptor'
       end        
     else
	begin
	    execute @res=dto_vali_rece  @codi_empr ,  @rutt_rece ,                               

        
	           @cod_error output, @mensaje output
	
	    if @cod_error = 'S' 
	      begin          
	    	set @hay_err = '1'         
			set @hay_espec = '1'
			set @esta_docu = 'ER3'
			set @mensaje2 =@mensaje2+ ' Error en RUT Receptor'
	
	      end        
	  end

  end



-- Rut de Solicitante de Factura
  begin
     execute @res=dte_nume_rut @rutt_sofa, @digi_sofa, 'N','N',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20025 - RUTT_SOFA - DIGI -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                  set  @hay_err = '1'

                   raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20025'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
	end
  end
--Informaci¾n Transporte - patente
  begin
    execute @res=dte_info_tran @info_tran, @entr_bien, 'N', 
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20026 - INFO_TRAN -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
                 raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20026'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
  end
-- Rut de transportista
  begin
  
  
  
    execute @res=dte_nume_rut_tran @rutt_tran, @digi_tran, 'S','N',
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20027 - RUTT_TRAN - DIGI -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                    set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20027'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
            
            
      end  
      
     
      
      
      
            
  end
--Direccion de Destino
  begin
    execute @res=dte_tran_otro @dire_dest, @entr_bien, @dire_rece, 'N', 
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20028 - DIRE_DEST -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20028'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end        
  end
--Comuna Destino
  begin
    execute @res=dte_tran_otro @comu_dest, @entr_bien, @comu_rece, 'N', 
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20029 - COMU_DEST -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                 set  @hay_err = '1'
                 raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20029'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
  end
--Ciudad Destino
  begin
    execute @res=dte_tran_otro @ciud_dest, @entr_bien, @ciud_rece, 'N', 
                              @cod_error output, @mensaje output
    if @cod_error = 'S' 
      begin          
        set @mensaje2 =@mensaje2+ ' -20030 - CIUD_DEST -'+
                       @mensaje
         if  @p_salida = 'TOTAL' 
             begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
             end
         else
           if  @p_salida  = 'PARCIAL' 
            begin
             set @p_codi ='20030'
              execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
              if @p_tipo_erro ='ERR'   
                begin
                   set  @hay_err = '1'
                   raiserror (@mensaje2,16,1)
                end
              else
                begin
                   set  @hay_era = '1'
                end 
            end
      end
  end
--*************
	begin
		if @hay_err = '1'
		begin
			if @hay_espec = '0'
				set @esta_docu ='ERR'
		end
		else 
		begin
			if @hay_era = '1'
				set @esta_docu ='ERA'
			else
				set @esta_docu ='INI'

			if (@cont_rece is not null)
			begin

				select @codi_usua = max(codi_usua)
				from usua_sist
				where rtrim(upper(mail_usua)) = rtrim(upper(@cont_rece))

				if (@codi_usua is not null)
				begin
					set @mail_usua = @cont_rece
					update dto_enca_docu_p
					set codi_usua_apro = @codi_usua,
					mail_usua_apro = @cont_rece
					where  codi_empr = @codi_empr
					and		 corr_docu = @corr_docu
					and		 tipo_docu = @tipo_docu
					and		 foli_docu = @foli_docu
		
					if @@error <> 0
					begin
						rollback tran
						raiserror ('ERROR (trg_dto_enca_docu_p): No se puede actualizar mail de aprobacion en dto_enca_docu_p' , 10, 1)
					end
					else
					begin
						select @texto = 'Consulte la opci¾n de Aprobaci¾n de DTOs y modifique el campo Estado seg·n corresponda:' + char(10) + char(10);
						select @texto = @texto + char(9) + 'Emisor: ' + @rutt_emis;
						select @texto = @texto + char(9) + 'Folio: ' + @foli_docu;
						select @texto = @texto + char(9) + 'Tipo: ' + @tipo_docu;
						execute paem_get_val @codi_empr,'ALL','EGME',@mail_empr output,@p_existe output, @p_mensaje output
						execute put_email @mail_empr, @mail_usua,'','Ud. tiene un nuevo Documento Electr¾nico por revisar.', @texto, @mtod_id output
					end
				end
			end
		end
  end  
--**************
   
 begin
  if @esta_docu <>'HIS'
   begin
    update dto_enca_docu_p set esta_docu = @esta_docu, 
            MNSG_ERRO=isnull(MNSG_ERRO,'') +@mensaje2,
            corr_rafo=@corr_rafo, dire_arch=@dire_arch
     where EXISTS 
           (select *  from inserted
            where inserted.corr_docu =dto_enca_docu_p.corr_docu)
   end

  end 
  if  isnull(@reci_rece,'x')='x'
  begin
	execute @res=dto_cheq_reci_rece @codi_empr, @rutt_emis, @p_reci_rece output

	update dto_enca_docu_p set reci_rece = @p_reci_rece 
        where EXISTS 
           (select *  from inserted
            where inserted.corr_docu =dto_enca_docu_p.corr_docu)
  end	

END
END
END
GO

GO
--SqlScripter----[dbo].[trg_dto_enca_docu_recl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[trg_dto_enca_docu_recl]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dto_enca_docu_recl]')
GO
CREATE TRIGGER [dbo].[trg_dto_enca_docu_recl]
ON [dbo].[dto_enca_docu_p]
	for insert AS
BEGIN
	declare
		@esta_docu	varchar(3),
		@codi_emex	varchar(30),
		@codi_empr varchar(20),
		@tipo_docu	numeric(4),
		@foli_docu numeric(18),
		@corr_docu numeric(18),
		@rutt_emis numeric(10),
		@digi_emis	varchar(20),
		@rutt_rece numeric(10),
		@digi_rece	varchar(20),
		@even_sii	varchar(4),
		@codi_erro numeric(4),
		@msge_rtrn varchar(80),
		@pi_corr_qmsg	numeric(20)
		 
	begin
		SELECT 	@esta_docu = ESTA_DOCU,
				@codi_emex = CODI_EMEX,
				@codi_empr = CODI_EMPR,
				@tipo_docu = convert(numeric, TIPO_DOCU),
				@foli_docu = convert(numeric, FOLI_DOCU),
				@corr_docu = CORR_DOCU,
				@rutt_emis = convert(numeric, RUTT_EMIS),
				@digi_emis = DIGI_EMIS,
				@rutt_rece = convert(numeric, RUTT_RECE),
				@digi_rece = DIGI_RECE
		FROM INSERTED
		
		set @even_sii = 'FRS'
		IF  @esta_docu IN ('INI', 'ERA') AND @tipo_docu IN (33, 34, 43)
		BEGIN
			EXEC prc_recl @codi_emex, @rutt_rece, @digi_rece, @rutt_emis, @digi_emis, @tipo_docu, @foli_docu,
						 @even_sii, @codi_empr, @corr_docu, @codi_erro output, @msge_rtrn output, @pi_corr_qmsg output
		END
	end
END
GO

GO
--SqlScripter----[dbo].[trg_dto_rece_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[trg_dto_rece_docu]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dto_rece_docu]')
GO
CREATE TRIGGER [dbo].[trg_dto_rece_docu]
ON dto_rece_docu
    for insert, update  AS  
BEGIN
  declare 
   @mensaje     varchar(2000), @mensaje2      varchar(2000),
   @cod_error   varchar(10),   @hay_err       varchar(3),  
   @hay_era     varchar(3),    @p_codi        varchar(5),  
   @p_param     varchar(20),   @p_existe      varchar(1),   
   @p_mensaje   varchar(80),   @p_salida      varchar(80),
   @res         varchar(10),   @p_codi_erro   varchar(12),
   @p_desc_erro varchar(50),   @p_tipo_erro   varchar (10),
   @codi_empr   varchar(20),   @corr_envi     varchar(20),
   @esta_envi   varchar(3),    @esta_envi_old varchar(3),
   @p_dire_arch varchar(100),  @dire_arch     varchar(100),
   @p_dia_res   varchar(1),    @p_dia_ok      varchar(1),
   @p_dia_mes   numeric(2),    @p_indi_dnte   varchar(1)

 BEGIN
   select @codi_empr=CODI_EMPR, 
          @esta_envi=ESTA_ENVI, @corr_envi=CORR_ENVI, @dire_arch=dire_arch
   from  inserted
 
   select @esta_envi_old=ESTA_ENVI
   from  deleted

   set  @mensaje2 =' '
   execute PARA_GET_VAL 'EGATE_TIPO_VALI', @p_salida output,
                          @p_existe output, @p_mensaje output

   if @dire_arch is null 
    begin --2 



     execute PAEM_GET_VAL @codi_empr, 'ALL', 'EDS0', @p_dire_arch output,
                          @p_existe output, @p_mensaje output
     if (@p_existe = 'N' or @p_dire_arch is null)
	begin
	     execute PARA_GET_VAL 'EGATE_DIRE_ENTR', @p_dire_arch output,
                  @cod_error output, @mensaje output
	end


      if @cod_error = 'S' 
	 begin --3
           set @dire_arch = @p_dire_arch
	   update dto_rece_docu set dire_arch=@dire_arch
 	   where corr_envi = @corr_envi
	 end--3
      else
         begin --8         
           raiserror (@mensaje2,16,1)
         end -- 8
    end --2
    /*************************************/

   if @esta_envi <> @esta_envi_old
    begin 
       --Recupera datos del correo  si cambia el estado
       begin
       execute @res= dte_envio_email  @codi_empr, @esta_envi, 
                      @corr_envi,  cod_error, mensaje  
       if @cod_error = 'S' 
          begin          
            set @mensaje2 = @mensaje2+ ' -20081 - ESTA_ENVI -'+
                            @mensaje
            if @p_salida = 'TOTAL' 
              begin
                set  @hay_err = '1'
                raiserror (@mensaje2,16,1)
              end
            else
              if @p_salida  = 'PARCIAL' 
                begin
                  set @p_codi ='20081'
                  execute @res= dte_chec_erro  @p_codi,
                           @p_desc_erro output, @p_tipo_erro output,
                           @p_indi_dnte output, @p_existe output, @p_mensaje output
                  if @p_tipo_erro ='ERR'   
                    begin
                      set  @hay_err = '1'
                      raiserror (@mensaje2,16,1)
                    end
                  else
                    begin
                      set  @hay_era = '1'
                    end 
                end
          end        
       end
    end

 END
 END
GO

GO
--SqlScripter----[dbo].[trg_dto_rece_docu_his].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[trg_dto_rece_docu_his]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_dto_rece_docu_his]')
GO
CREATE TRIGGER [dbo].[trg_dto_rece_docu_his]
ON [dbo].[dto_rece_docu] 
FOR  UPDATE 
AS 
BEGIN --1
 declare
 @esta_envi varchar(3),  
 @codi_empr numeric(9), @corr_envi numeric(22), 
 @mensaje varchar(80), 
 @cod_error varchar(1), @res varchar(19),
 @p_codi_empr numeric(9), @p_corr_envi numeric(22) 
begin --1.1
print 'entrando a actualizar estado'
 IF UPDATE(esta_envi) 
   begin --2
       select @codi_empr=codi_empr, 
	@esta_envi= esta_envi, 
	@corr_envi=corr_envi
       from inserted
   -- Inserta encabezado a BD Historica
   if (@esta_envi='HIS')
     begin --3
       set @mensaje ='Envios cabeza '
       insert into   dto_RECE_DOCU_H  (
        codi_empr,corr_envi,rutt_emis,digi_emis,rutt_envi,
        digi_envi,feho_envi,vers_envi,esta_envi,mens_envi,
        rutt_rece,digi_rece,nume_reso,fech_reso,posi_envi,
        bloc_envi,nomb_arch,inde_envi, firm_envi, dire_arch )   
       select
        codi_empr,corr_envi,rutt_emis,digi_emis,rutt_envi,
        digi_envi,feho_envi,vers_envi,esta_envi,mens_envi,
        rutt_rece,digi_rece,nume_reso,fech_reso,posi_envi,
        bloc_envi,nomb_arch,inde_envi, firm_envi, dire_arch
       from  inserted

       DECLARE cursor_recep CURSOR FOR
	       select codi_empr, corr_envi
	       from deleted
       OPEN cursor_recep
       FETCH NEXT FROM cursor_recep INTO @p_codi_empr, @p_corr_envi
       WHILE (@@FETCH_STATUS = 0)
       BEGIN
           execute @res= dto_inse_histo_rece @p_codi_empr, @p_corr_envi,
                         @cod_error, @mensaje
           FETCH NEXT FROM cursor_recep INTO @p_codi_empr, @p_corr_envi
       END
       CLOSE cursor_recep
       DEALLOCATE cursor_recep
       
       if @cod_error = 'S' 
       begin  --4       
           set @mensaje =' -20082-' +  @mensaje
           raiserror (@mensaje,16,1)
       end --4        
      end --3
     end --2
  end --1.1
end --1
GO

GO
--SqlScripter----[dbo].[trg_foli_nume].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[trg_foli_nume]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[trg_foli_nume]')
GO
CREATE TRIGGER [dbo].[trg_foli_nume]
ON [dbo].[dto_enca_docu_p]
    for insert as
BEGIN
--SP1 SE 5.2
 declare
 @foli_docu 	varchar(16)
 
  begin

   select @foli_docu=foli_docu
   from inserted

   update dto_enca_docu_p set foli_nume = convert(numeric(30),@foli_docu) 
   where EXISTS 
           (select *  from inserted
            where inserted.corr_docu =dto_enca_docu_p.corr_docu)
  end
END
GO
