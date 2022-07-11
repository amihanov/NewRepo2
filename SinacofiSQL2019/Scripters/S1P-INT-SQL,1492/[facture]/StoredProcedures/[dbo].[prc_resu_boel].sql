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
