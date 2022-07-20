
GO
--SqlScripter----[dbo].[dbq_grp_arch_serv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbq_grp_arch_serv]') IS NULL EXEC('CREATE VIEW [dbo].[dbq_grp_arch_serv] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[dbq_grp_arch_serv]
(
codi_serv,
orig_grpo,
desc_serv,
cant_arch
) as
   SELECT   c.codi_serv codi_serv,
            REPLACE (c.orig_grpo, CHaR (13), '') orig_grpo,
            s.desc_serv desc_serv,
            COUNT (*) cant_arch
       FROM dbq_arch a, dbq_grpo c, dbn_servicio s
      WHERE c.codi_grpo = a.codi_grpo
        AND c.codi_serv = s.codi_serv
        AND a.esta_arch IN ('ERR', 'PRC')
		AND a.codi_serv IN ('dte_carg_dto','dbq_scan_arch','dte_resp_tec','dte_resp_reci','dte_resp_sii','lcv_resp_sii','bel_cons_sii')
   GROUP BY c.codi_serv, c.orig_grpo, s.desc_serv;
GO

GO
--SqlScripter----[dbo].[dte_rece_tran].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[dte_rece_tran]') IS NULL EXEC('CREATE VIEW [dbo].[dte_rece_tran] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[dte_rece_tran]
AS
(
select  corr_envi corr_tran,
 nomb_arch arch_tran,
 esta_envi esta_tran
from dto_rece_docu
where esta_envi IN ('TRI','TPR')
)
GO

GO
--SqlScripter----[dbo].[dto_moni_rece].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dto_moni_rece]') IS NULL EXEC('CREATE VIEW [dbo].[dto_moni_rece] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[dto_moni_rece]
AS
SELECT  A.CODI_EMPR,
	A.CORR_ENVI,
	A.RUTT_EMIS,
	A.DIGI_EMIS,
	A.ESTA_ENVI,
	A.FECH_RECE,
	A.RUTT_RECE,
	B.TIPO_DOCU,
	B.FOLI_DOCU,
	B.ESTA_DOCU,
	B.CODI_ESAP,
	B.RAZO_ESAP,
	B.FECH_ESAP,
	B.NOMB_EMIS, 
    B.MONT_TOTA,
	B.FECH_EMIS,
	B.CORR_DOCU,
	B.CODI_SUCU,
	B.INDI_CONTA,
	B.CODI_REME,
	B.USUA_REME,
	B.FOLI_NUME,
	B.FECH_REME,
    B.ESTA_TRAS,
    B.RECI_RECE,
    B.EVEN_RECL, /* OT 9376978 26-04-2017|AM */
    B.USUA_RECL,
    B.FECH_RECL,
    C.DESC_RECL,
    B.CSII_RECL,
    B.FECH_RECE_SII
FROM        dbo.dto_rece_docu AS A 
LEFT OUTER JOIN dbo.dto_enca_docu_p AS b 
ON A.codi_empr = b.codi_empr AND A.corr_envi = b.corr_envi
LEFT OUTER JOIN dte_esta_recl C 
ON B.EVEN_RECL = C.codi_recl
GO

GO
--SqlScripter----[dbo].[oficina].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[oficina]') IS NULL EXEC('CREATE VIEW [dbo].[oficina] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[oficina]
(CODI_EMPR,      CODI_OFIC,      NOMB_OFIC,      
	DIRE_OFIC,      CODI_CIUD,      CODI_PAIS,      
	FONO_OFIC,      FAXX_OFIC,      TELX_OFIC)
as select codi_empr,codi_ofic, desc_ofic,
          dire_ofic, CODI_CIUD,      CODI_PAIS,      
	FONO_OFIC,      FAXX_OFIC,      TELX_OFIC
from ofic_empr
GO

GO
--SqlScripter----[dbo].[sys_alar_alus].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sys_alar_alus]') IS NULL EXEC('CREATE VIEW [dbo].[sys_alar_alus] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[sys_alar_alus]
AS
	SELECT a.CODI_ALAR,
			a.DESC_ALAR,
			isnull(au.valo_alus,a.VALO_ALar) valo_alar,
			a.OBJECT_NAME,
			isnull(au.STAT_ALUS,a.stat_alar) stat_alar,
			feas_alar,
			a.esta_alar,
			au.codi_usua codi_usua,
			a.diav_alar,
			a.acci_alar,
			a.fech_alar,
			a.object_name1,
			a.comp_alar,
			a.indi_alar,
			a.frec_alar,
			a.prio_alar,
			a.feav_alar,
			a.codi_modu
	FROM SYS_ALAR a left join 
			 SYS_ALUS au on 
				a.codi_alar = au.codi_alar
				AND 'CALCULAR' = au.orig_alus
	WHERE a.esta_alar='ACTIVADA'
	AND  isnull(au.stat_alus,a.stat_alar)='ANORMAL'
GO

GO
--SqlScripter----[dbo].[SYS_ALUS_ALUS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[SYS_ALUS_ALUS]') IS NULL EXEC('CREATE VIEW [dbo].[SYS_ALUS_ALUS] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[SYS_ALUS_ALUS]
AS
SELECT a.CODI_ALAR,
			a.DESC_ALAR,
			isnull(au.valo_alus,au1.VALO_ALus) valo_alus,
			a.OBJECT_NAME,
			isnull(au.STAT_ALUS,au1.stat_alus) stat_alus,
			au1.feas_alus,
			au1.esta_alus,
			au.codi_usua codi_usua,
			au.diav_alus,
			a.acci_alar,
			au1.fech_alus,
			a.object_name1,
			a.comp_alAR COMP_ALUS,
			a.indi_alAR,
			au.INDI_ALUS,
			au.frec_alus,
			au.prio_alus,
			a.feav_alAR FEAV_ALUS,
			au1.codi_usua codi_usua1,
			a.codi_modu
	FROM SYS_ALAR a left join
			SYS_ALUS au on 
			a.codi_alar=au.codi_alar
			AND 'CALCULAR'= au.orig_alus,
			SYS_ALUS au1
	WHERE a.esta_alar='ACTIVADA'
			AND isnull(au.stat_alus,a.stat_alar)='ANORMAL'
			AND a.codi_alar=au1.codi_alar
			AND 'AVISAR'=au1.orig_alus
GO

GO
--SqlScripter----[dbo].[sys_module].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sys_module]') IS NULL EXEC('CREATE VIEW [dbo].[sys_module] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[sys_module]
AS
SELECT object_name as codi_modu,
object_type as tipo_obje,
object_brief as resu_modu,
object_desc as desc_modu,
object_single as vers_modu,
object_code as code_modu,
object_rela as codi_modu1
FROM sys_object WHERE object_type='U'
GO

GO
--SqlScripter----[dbo].[sys_param].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sys_param]') IS NULL EXEC('CREATE VIEW [dbo].[sys_param] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[sys_param]
AS
SELECT     object_name AS PARAM_NAME, object_type, codi_modu, object_brief AS PARAM_VALUE, object_desc AS PARAM_DESC, table_type AS param_type, 
                      object_order AS PARAM_ORDER
FROM         dbo.sys_object
WHERE     (object_type = 'O')
GO

GO
--SqlScripter----[dbo].[sys_rous].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[sys_rous]') IS NULL EXEC('CREATE VIEW [dbo].[sys_rous] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[sys_rous]
(
    codi_rous,
    desc_rous,
    sent_rous,
    obje_type,
    tabl_type,
    codi_modu ) 
 AS 
select object_name,
object_brief,
query_clause,
object_type,
table_type,
codi_modu
from sys_object
where object_type='L'
GO

GO
--SqlScripter----[dbo].[vw_area_geog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_area_geog]') IS NULL EXEC('CREATE VIEW [dbo].[vw_area_geog] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_area_geog]
AS
SELECT codi_arge,nomb_arge,tipo_arge,codi_arge1,genm_arge,genf_arge
FROM area_geog
GO

GO
--SqlScripter----[dbo].[vw_auto_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_auto_pers]') IS NULL EXEC('CREATE VIEW [dbo].[vw_auto_pers] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_auto_pers]
AS
SELECT CODI_PERS, TIPO_AUTO, FEIN_AUTO, FETE_AUTO, ESTA_AUTO, DEFE_AUTO,
(SELECT NOMB_PERS FROM PERSONAS WHERE EMPL_PERS = 'S' AND EMPR_PERS = 'N' AND CODI_PERS = DTE_AUTO_PERS.CODI_PERS) AS NOMB_PERS,
(SELECT CODE_DESC FROM SYS_CODE WHERE DOMAIN_CODE = 82 AND CODE = TIPO_AUTO) AS VAL_TIPO_AUTO,
(SELECT CODE_DESC FROM SYS_CODE WHERE DOMAIN_CODE = 78 AND CODE = ESTA_AUTO) AS VAL_ESTA_AUTO,
CODI_EMPR
FROM DTE_AUTO_PERS
GO

GO
--SqlScripter----[dbo].[vw_cara_peem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_cara_peem]') IS NULL EXEC('CREATE VIEW [dbo].[vw_cara_peem] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_cara_peem]
AS
SELECT codi_empr, codi_pers, fein_cape, fete_cape, codi_cage, codi_vacg,
(SELECT desc_cage from cara_gene where codi_cage = cara_peem.codi_cage) as val_desc_cage,
(SELECT desc_vacg from valo_cage where codi_vacg = cara_peem.codi_vacg and codi_cage = cara_peem.codi_cage) as val_desc_vacg
FROM cara_peem
GO

GO
--SqlScripter----[dbo].[vw_cara_peem2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_cara_peem2]') IS NULL EXEC('CREATE VIEW [dbo].[vw_cara_peem2] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_cara_peem2]
AS

SELECT     CODI_EMPR, CODI_PERS, CODI_CAGE, MAX(CODI_VACG) AS codi_vacg, MAX(VALO_CAPE) AS valo_cape
FROM         dbo.CARA_PEEM
WHERE     (GETDATE() BETWEEN FEIN_CAPE AND ISNULL(FETE_CAPE, CONVERT(datetime, '25001231', 112)))
GROUP BY CODI_EMPR, CODI_PERS, CODI_CAGE
GO

GO
--SqlScripter----[dbo].[vw_cara_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_cara_pers]') IS NULL EXEC('CREATE VIEW [dbo].[vw_cara_pers] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_cara_pers]
AS
SELECT codi_pers, fein_cape, fete_cape, codi_cage, codi_vacg,
(SELECT desc_cage from cara_gene where codi_cage = cara_pers.codi_cage) as val_desc_cage,
(SELECT desc_vacg from valo_cage where codi_vacg = cara_pers.codi_vacg and codi_cage = cara_pers.codi_cage) as val_desc_vacg
FROM cara_pers
GO

GO
--SqlScripter----[dbo].[vw_cara_pers2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_cara_pers2]') IS NULL EXEC('CREATE VIEW [dbo].[vw_cara_pers2] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_cara_pers2]
AS
SELECT     codi_pers, codi_cage, MAX(codi_vacg) AS codi_vacg, MAX(valo_cape) AS valo_cape
FROM         dbo.cara_pers
WHERE     (getdate() BETWEEN fein_cape AND isnull(fete_cape, CONVERT(datetime,'25001231', 112)))
GROUP BY codi_pers, codi_cage
GO

GO
--SqlScripter----[dbo].[vw_cont_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_cont_pers]') IS NULL EXEC('CREATE VIEW [dbo].[vw_cont_pers] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_cont_pers]
AS
SELECT codi_pers, codi_pers1, fono_pers, pref_pers, nomb_pers, dire_pers, codi_mail, codi_comu, come_pers, func_pers,
(SELECT nomb_arge from area_geog where tipo_arge = '05' and codi_arge = codi_comu) as val_codi_comu,
(SELECT code_desc from sys_code where domain_code = 209 and code = func_pers) as val_func_pers,
clie_pers
FROM personas
GO

GO
--SqlScripter----[dbo].[vw_cursor_prt_dte].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[vw_cursor_prt_dte]') IS NULL EXEC('CREATE VIEW [dbo].[vw_cursor_prt_dte] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
-- cursor_prt_dte

-- drop view vw_cursor_prt_dte;

/*
select	codi_empr,
		tipo_docu,
		foli_docu,
		nume_impr,
		nume_imme,
		tram_impr, 
		tram_imme
from vw_cursor_prt_dte;
*/


ALTER VIEW [dbo].[vw_cursor_prt_dte]
AS		
SELECT top(50)	a.codi_empr,
		a.tipo_docu,
		a.foli_docu,
		(isnull(b.nume_impr, 0) - isnull(a.nume_impr, 0)) nume_impr,
		(isnull(b.nume_imme, 0) - isnull(a.nume_imme, 0)) nume_imme,
		isnull(b.tram_impr,'N') tram_impr, 
		isnull(b.tram_imme,'N') tram_imme,
		a.cola_proc
FROM	dte_enca_docu a, dte_tipo_docu b,dte_esta_docu c 
WHERE	a.fech_emis >= convert(varchar(10), getdate() - Convert(numeric(4),(select isnull(param_value,'15') from sys_param where param_name = 'EGATE_DIAS_IMPR')), 120)
AND		a.esta_docu = c.esta_docu 
AND		c.indi_impr='S' 
AND		a.tipo_docu = b.tipo_docu
AND		((isnull(b.nume_impr, 0) > isnull(a.nume_impr,0)) OR (isnull(b.nume_imme, 0) > isnull(a.nume_imme,0)));
GO

GO
--SqlScripter----[dbo].[vw_cursor_prt_dte_clte].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[vw_cursor_prt_dte_clte]') IS NULL EXEC('CREATE VIEW [dbo].[vw_cursor_prt_dte_clte] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
-- cursor_prt_dte_clte

-- DROP VIEW vw_cursor_prt_dte_clte;

/*
select codi_empr,
		tipo_docu,
		foli_docu,
		rutt_rece,
		nume_impr,
		cant_impr,
		nume_imme,
		cant_imme,
		tram_impr,
		tram_imme
from vw_cursor_prt_dte_clte;
*/


ALTER VIEW [dbo].[vw_cursor_prt_dte_clte]
AS
SELECT	a.codi_empr,
				a.tipo_docu,
				a.foli_docu,
				a.rutt_rece,
				isnull(a.nume_impr, 0) nume_impr,
				(isnull(b.nume_impr, 0) - isnull(a.nume_impr, 0)) cant_impr,
				isnull(a.nume_imme, 0) nume_imme,
				(isnull(b.nume_imme, 0) - isnull(a.nume_imme, 0)) cant_imme,
				tram_impr,
				tram_imme,
				a.cola_proc
		FROM	dte_enca_docu a, dte_tipo_docu b, vw_cara_peem2 c
		WHERE	a.fech_emis >= convert(varchar(10), getdate() - Convert(numeric(4),(select isnull(param_value,'15') from sys_param where param_name = 'EGATE_DIAS_IMPR')), 120)
		AND	b.tipo_docu = a.tipo_docu
		AND	c.codi_pers=a.rutt_rece
		AND	c.codi_cage='EGATE_TIEN'
		AND	c.codi_vacg='REP'
		AND	c.codi_empr = a.codi_empr
		union	SELECT	a.codi_empr,
						a.tipo_docu,
						a.foli_docu,
						a.rutt_rece,
						isnull(a.nume_impr, 0) nume_impr,
						(isnull(b.nume_impr, 0) - isnull(a.nume_impr, 0)) cant_impr,
						isnull(a.nume_imme, 0) nume_imme,
						(isnull(b.nume_imme, 0) - isnull(a.nume_imme, 0)) cant_imme,
						tram_impr,
						tram_imme,
						a.cola_proc
				FROM	dte_enca_docu a, dte_tipo_docu b, vw_cara_pers2 c
				WHERE	a.fech_emis >= convert(varchar(10), getdate() - Convert(numeric(4),(select isnull(param_value,'15') from sys_param where param_name = 'EGATE_DIAS_IMPR')), 120)
				AND	b.tipo_docu = a.tipo_docu
				AND	c.codi_pers=a.rutt_rece
				AND	c.codi_cage='EGATE_TIEN'
				AND	c.codi_vacg='REP'
				AND	not exists
					(SELECT	1
					FROM	vw_cara_peem2 p
					WHERE 	a.codi_empr = p.codi_empr
					AND	c.codi_pers = p.codi_pers
					AND	p.codi_cage='EGATE_TIEN');
GO

GO
--SqlScripter----[dbo].[vw_cursorprtdteacci].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[vw_cursorprtdteacci]') IS NULL EXEC('CREATE VIEW [dbo].[vw_cursorprtdteacci] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
-- cursorprtdteacci

-- DROP VIEW vw_cursorprtdteacci;

/*	
SELECT	codi_empr,
        tipo_docu,
        foli_docu,
        codi_aced,
        logo_publ,
        nuim_soli,
        cant_copi,
		plan_docu 
FROM	vw_cursorprtdteacci
*/

ALTER VIEW [dbo].[vw_cursorprtdteacci]
AS
SELECT  a.codi_empr,
        a.tipo_docu,
        a.foli_docu,
        b.codi_aced,
        b.logo_publ,
        b.nuim_soli,
        b.nuim_soli - b.nuim_term cant_copi,
		b.plan_docu,
		a.cola_proc
FROM    dte_enca_docu a, dte_acci_docu b, dte_esta_docu c
WHERE   a.fech_emis >= convert(varchar(10), getdate() - Convert(numeric(4),(select isnull(param_value,'15') from sys_param where param_name = 'EGATE_DIAS_IMPR')), 120)
AND     a.esta_docu = c.esta_docu 
AND     c.indi_impr='S' 
AND     b.tipo_docu = a.tipo_docu
AND     b.foli_docu = a.foli_docu
AND     b.codi_empr = a.codi_empr
AND     b.nuim_soli > b.nuim_term;
GO

GO
--SqlScripter----[dbo].[vw_dte_acec_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_acec_empr]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_acec_empr] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_acec_empr]
AS
SELECT dae.codi_empr,dae.codi_acec,
(SELECT a.desc_acec FROM dte_acti_econ a WHERE (a.codi_acec not in 
(SELECT codi_acec_sup FROM dte_acti_econ WHERE codi_acec_sup IS not null)) 
and (a.codi_acec = dae.codi_acec)) AS desc_acec
FROM  dte_acec_empr dae
GO

GO
--SqlScripter----[dbo].[vw_dte_cert_pers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_cert_pers]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_cert_pers] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_cert_pers]
AS
SELECT dcp.codi_pers,
(SELECT nomb_pers from personas where codi_pers = dcp.codi_pers) AS nomb_pers,
dcp.codi_orce,
(SELECT doc.nomb_orce FROM dte_orga_cert doc WHERE doc.codi_orce = dcp.codi_orce) AS nomb_orce,
dcp.fein_cert,dcp.fete_cert,dcp.esta_cert,dcp.arch_cert
FROM dte_cert_pers dcp
GO

GO
--SqlScripter----[dbo].[vw_dte_cesi_crea].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_cesi_crea]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_cesi_crea] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_cesi_crea]
AS
select 	d.codi_empr,
	d.tipo_docu,
	t.desc_tido,
	d.foli_docu,
	d.rutt_rece,
	d.digi_rece,
	d.nomb_rece,
	d.fech_emis,
	d.mont_tota,
	d.fech_venc,
	'CREA' tipo
from dte_enca_docu d,
     dte_tipo_docu t
where t.tipo_docu = d.tipo_docu 
and   t.indi_cesi = 'S'
and   exists (	select 1 
		from dte_esta_docu e 
		where e.esta_docu=d.esta_docu
		and e.indi_cesi='S') 
and   exists (	select 1 
		from dte_esta_docu e 
		where e.esta_docu=d.esta_docu1 
		and e.indi_cesi='S') 
and   not exists (select 1 
		from dte_cesi_docu c
		where c.codi_empr=d.codi_empr 
		and c.tipo_docu=d.tipo_docu 
		and c.foli_docu=d.foli_docu)
GO

GO
--SqlScripter----[dbo].[vw_dte_cesi_mant].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_cesi_mant]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_cesi_mant] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_cesi_mant]
AS
select 	d.codi_empr,
	d.corr_cesi,
	d.tipo_docu,
	t.desc_tido,
	d.foli_docu,
	d.rutt_rece,
	d.digi_rece,
	d.nomb_rece,
	d.fech_emis,
	d.mont_cesi,
	d.fech_venc,
	'MANT' tipo
from dte_cesi_docu d,
     dte_tipo_docu t
where t.tipo_docu = d.tipo_docu
GO

GO
--SqlScripter----[dbo].[vw_dte_desc_reca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_desc_reca]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_desc_reca] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_desc_reca]
AS
SELECT codi_empr,tipo_docu,foli_docu,nume_dere,tipo_dere,glos_dere,tipo_valo,
(SELECT code_desc FROM sys_code WHERE (domain_code=84) AND (code = tipo_valo)) as val_tipo_valo,
indi_exen,
(SELECT code_desc FROM sys_code WHERE (domain_code=85) AND (code = indi_exen)) as val_indi_exen
FROM dte_desc_reca
GO

GO
--SqlScripter----[dbo].[vw_dte_desc_reca_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_desc_reca_p]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_desc_reca_p] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_desc_reca_p]
AS
SELECT codi_empr,tipo_docu,foli_docu,nume_dere,tipo_dere,glos_dere,tipo_valo,
(SELECT code_desc FROM sys_code WHERE (domain_code=84) AND (code = tipo_valo)) as val_tipo_valo,
indi_exen,
(SELECT code_desc FROM sys_code WHERE (domain_code=85) AND (code = indi_exen)) as val_indi_exen
FROM dte_desc_reca_p
GO

GO
--SqlScripter----[dbo].[vw_dte_deta_acec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_deta_acec]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_deta_acec] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_deta_acec]
AS
SELECT b.codi_empr,b.tipo_docu,b.foli_docu,b.codi_acec,
(SELECT desc_acec FROM dte_acti_econ a WHERE a.codi_acec = b.codi_acec) as desc_acec,
b.corr_acec FROM dte_deta_acec b
GO

GO
--SqlScripter----[dbo].[vw_dte_deta_acec_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_deta_acec_p]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_deta_acec_p] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_deta_acec_p]
AS
SELECT b.codi_empr,b.tipo_docu,b.foli_docu,b.codi_acec,
(SELECT desc_acec FROM dte_acti_econ a WHERE a.codi_acec = b.codi_acec) as desc_acec,
b.corr_acec FROM dte_deta_acec_p b
GO

GO
--SqlScripter----[dbo].[vw_dte_docu_refe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_docu_refe]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_docu_refe] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_docu_refe]
AS
SELECT codi_empr,tipo_docu,foli_docu,nume_refe,foli_refe,razo_refe,tipo_refe,
(SELECT code_desc FROM sys_code WHERE (domain_code=81) AND (code = tipo_refe)) as val_tipo_refe
FROM dte_docu_refe
GO

GO
--SqlScripter----[dbo].[vw_dte_docu_refe_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_docu_refe_p]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_docu_refe_p] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_docu_refe_p]
AS
SELECT codi_empr,tipo_docu,foli_docu,nume_refe,foli_refe,razo_refe,tipo_refe,
(SELECT code_desc FROM sys_code WHERE (domain_code=81) AND (code = tipo_refe)) as val_tipo_refe
FROM dte_docu_refe_p
GO

GO
--SqlScripter----[dbo].[vw_dte_enca_docu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_enca_docu_p]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_enca_docu_p] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_enca_docu_p]
AS
SELECT corr_envi,esta_docu,codi_empr,tipo_docu,foli_docu,fech_emis,
rutt_rece,digi_rece,nomb_rece,impu_vaag,mont_tota,
(SELECT desc_tido from dte_tipo_docu where tipo_docu=dte_enca_docu_p.tipo_docu 
and docu_elec = 'S') as val_tipo_docu
FROM dte_enca_docu_p
GO

GO
--SqlScripter----[dbo].[vw_dte_envi_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_envi_docu]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_envi_docu] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_envi_docu]
AS
SELECT codi_empr,corr_envi, rutt_emis, rutt_rece, rutt_envi, feho_envi, esta_envi,
(SELECT nomb_empr from empr where rutt_empr = dte_envi_docu.rutt_emis) as nomb_emis,
(SELECT top 1 nomb_pers from personas where rutt_pers = dte_envi_docu.rutt_envi) as nomb_envi,
(SELECT desc_esen from dte_esta_envi where esta_envi = dte_envi_docu.esta_envi) as val_esta_envi,
bole_elec
FROM dte_envi_docu
WHERE rutt_rece = (select top 1 param_value from sys_param where param_name = 'EGATE_RUTT_SII')
GO

GO
--SqlScripter----[dbo].[vw_dte_envi_docu_enco].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_envi_docu_enco]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_envi_docu_enco] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_envi_docu_enco]
AS
SELECT codi_empr,corr_envi, rutt_emis, rutt_rece, rutt_envi, feho_envi, esta_envi,
(SELECT nomb_empr from empr where rutt_empr = dte_envi_docu.rutt_emis) as nomb_emis,
(SELECT top 1 nomb_pers from personas where rutt_pers = dte_envi_docu.rutt_envi) as nomb_envi,
(SELECT desc_esen from dte_esta_envi where esta_envi = dte_envi_docu.esta_envi) as val_esta_envi,
bole_elec
FROM dte_envi_docu
WHERE rutt_rece <> (select top 1 param_value from sys_param where param_name = 'EGATE_RUTT_SII')
GO

GO
--SqlScripter----[dbo].[vw_dte_rang_foli].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_rang_foli]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_rang_foli] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_rang_foli]
AS
SELECT corr_rafo,codi_empr, tipo_dora, foli_desd, foli_hast, ulti_foli, fech_auto, codi_ofic, esta_rafo,
(SELECT desc_tido from dte_tipo_docu where docu_elec = 'S' and tipo_docu = dte_rang_foli.tipo_dora) as val_tipo_dora,
(SELECT desc_ofic from ofic_empr where codi_ofic = dte_rang_foli.codi_ofic and codi_empr = dte_rang_foli.codi_empr) as val_codi_ofic,
(SELECT code_desc from sys_codi where domain_code = 79 and code = dte_rang_foli.esta_rafo) as val_esta_rafo
FROM dte_rang_foli
GO

GO
--SqlScripter----[dbo].[vw_dte_suma_impu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_suma_impu]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_suma_impu] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_suma_impu]
AS
SELECT a.codi_empr,a.tipo_docu,a.foli_docu,a.codi_impu,
(SELECT nomb_impu FROM dte_tipo_impu b WHERE b.codi_impu = a.codi_impu) as val_codi_impu,
a.mont_impu,a.tasa_impu 
FROM dte_suma_impu a
GO

GO
--SqlScripter----[dbo].[vw_dte_suma_impu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_suma_impu_p]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_suma_impu_p] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_suma_impu_p]
AS
SELECT a.codi_empr,a.tipo_docu,a.foli_docu,a.codi_impu,
(SELECT nomb_impu FROM dte_tipo_impu b WHERE b.codi_impu = a.codi_impu) as val_codi_impu,
a.mont_impu,a.tasa_impu 
FROM dte_suma_impu_p a
GO

GO
--SqlScripter----[dbo].[vw_dte_tido_envi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dte_tido_envi]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dte_tido_envi] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dte_tido_envi]
AS
SELECT corr_envi, tipo_docu, cant_docu,
(SELECT desc_tido from dte_tipo_docu where tipo_docu = dte_tido_envi.tipo_docu) as val_tipo_docu
FROM dte_tido_envi
where tipo_docu <> 0
and cant_docu <> 0
GO

GO
--SqlScripter----[dbo].[vw_dto_apro_docu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dto_apro_docu_p]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dto_apro_docu_p] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dto_apro_docu_p]
AS
SELECT corr_docu,corr_envi,codi_esap,esta_docu,codi_empr,tipo_docu,foli_docu,fech_emis,
rutt_emis,digi_emis,nomb_emis,impu_vaag,mont_tota,
(SELECT desc_tido from dte_tipo_docu where tipo_docu=dto_enca_docu_p.tipo_docu 
and docu_elec = 'S') as val_tipo_docu
FROM dto_enca_docu_p
where ESTA_DOCU='ERA' OR ESTA_DOCU='INI' 
AND EXISTS (SELECT 1 FROM DTE_TIPO_DOCU WHERE DTE_TIPO_DOCU.TIPO_DOCU = DTO_ENCA_DOCU_P.TIPO_DOCU AND INDI_RECI = 'S')
GO

GO
--SqlScripter----[dbo].[vw_dto_desc_reca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dto_desc_reca]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dto_desc_reca] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dto_desc_reca]
AS
SELECT codi_empr,tipo_docu,foli_docu,nume_dere,tipo_dere,glos_dere,tipo_valo,
(SELECT code_desc FROM sys_code WHERE (domain_code=84) AND (code = tipo_valo)) as val_tipo_valo,
indi_exen,
(SELECT code_desc FROM sys_code WHERE (domain_code=85) AND (code = indi_exen)) as val_indi_exen
FROM dto_desc_reca
GO

GO
--SqlScripter----[dbo].[vw_dto_desc_reca_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dto_desc_reca_p]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dto_desc_reca_p] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dto_desc_reca_p]
AS
SELECT corr_docu,codi_empr,tipo_docu,foli_docu,nume_dere,tipo_dere,glos_dere,tipo_valo,
(SELECT code_desc FROM sys_code WHERE (domain_code=84) AND (code = tipo_valo)) as val_tipo_valo,
indi_exen,
(SELECT code_desc FROM sys_code WHERE (domain_code=85) AND (code = indi_exen)) as val_indi_exen
FROM dto_desc_reca_p
GO

GO
--SqlScripter----[dbo].[vw_dto_deta_acec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dto_deta_acec]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dto_deta_acec] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dto_deta_acec]
AS
SELECT b.codi_empr,b.tipo_docu,b.foli_docu,b.codi_acec,
(SELECT desc_acec FROM dte_acti_econ a WHERE a.codi_acec = b.codi_acec) as desc_acec,
b.corr_acec FROM dto_deta_acec b
GO

GO
--SqlScripter----[dbo].[vw_dto_deta_acec_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dto_deta_acec_p]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dto_deta_acec_p] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dto_deta_acec_p]
AS
SELECT b.corr_docu,b.codi_empr,b.tipo_docu,b.foli_docu,b.codi_acec,
(SELECT desc_acec FROM dte_acti_econ a WHERE a.codi_acec = b.codi_acec) as desc_acec,
b.corr_acec FROM dto_deta_acec_p b
GO

GO
--SqlScripter----[dbo].[vw_dto_docu_refe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dto_docu_refe]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dto_docu_refe] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dto_docu_refe]
AS
SELECT codi_empr,tipo_docu,foli_docu,nume_refe,foli_refe,razo_refe,tipo_refe,
(SELECT code_desc FROM sys_code WHERE (domain_code=81) AND (code = tipo_refe)) as val_tipo_refe
FROM dto_docu_refe
GO

GO
--SqlScripter----[dbo].[vw_dto_docu_refe_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dto_docu_refe_p]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dto_docu_refe_p] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dto_docu_refe_p]
AS
SELECT corr_docu,codi_empr,tipo_docu,foli_docu,nume_refe,foli_refe,razo_refe,tipo_refe,
(SELECT code_desc FROM sys_code WHERE (domain_code=81) AND (code = tipo_refe)) as val_tipo_refe
FROM dto_docu_refe_p
GO

GO
--SqlScripter----[dbo].[vw_dto_enca_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dto_enca_docu]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dto_enca_docu] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dto_enca_docu]
AS
SELECT corr_envi,esta_docu,codi_empr,tipo_docu,foli_docu,fech_emis,
rutt_rece,digi_rece,nomb_rece,impu_vaag,mont_tota,
(SELECT desc_tido from dte_tipo_docu where tipo_docu=dto_enca_docu.tipo_docu 
and docu_elec = 'S') as val_tipo_docu
FROM dto_enca_docu
GO

GO
--SqlScripter----[dbo].[vw_dto_rece_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dto_rece_docu]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dto_rece_docu] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dto_rece_docu]
AS
SELECT codi_empr,corr_envi,nomb_arch,rutt_emis,digi_emis,rutt_envi,
digi_envi,rutt_rece,digi_rece 
FROM dto_rece_docu
GO

GO
--SqlScripter----[dbo].[vw_dto_suma_impu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dto_suma_impu]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dto_suma_impu] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dto_suma_impu]
AS
SELECT a.codi_empr,a.tipo_docu,a.foli_docu,a.codi_impu,
(SELECT nomb_impu FROM dte_tipo_impu b WHERE b.codi_impu = a.codi_impu) as val_codi_impu,
a.mont_impu,a.tasa_impu 
FROM dto_suma_impu a
GO

GO
--SqlScripter----[dbo].[vw_dto_suma_impu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dto_suma_impu_p]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dto_suma_impu_p] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dto_suma_impu_p]
AS
SELECT a.corr_docu,a.codi_empr,a.tipo_docu,a.foli_docu,a.codi_impu,
(SELECT nomb_impu FROM dte_tipo_impu b WHERE b.codi_impu = a.codi_impu) as val_codi_impu,
a.mont_impu,a.tasa_impu 
FROM dto_suma_impu_p a
GO

GO
--SqlScripter----[dbo].[vw_dto_tido_rece].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_dto_tido_rece]') IS NULL EXEC('CREATE VIEW [dbo].[vw_dto_tido_rece] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_dto_tido_rece]
AS
SELECT b.corr_envi,b.tipo_docu,
(SELECT a.desc_tido FROM dte_tipo_docu a WHERE a.tipo_docu = b.tipo_docu) as desc_docu,
b.cant_docu,b.cant_info 
FROM dto_tido_rece b
GO

GO
--SqlScripter----[dbo].[vw_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_empr]') IS NULL EXEC('CREATE VIEW [dbo].[vw_empr] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_empr]
AS
SELECT e.codi_empr,(str(e.rutt_empr) + '-' + e.digi_empr) as rut_empr,e.nomb_empr,e.nfan_empr,e.dire_empr,
(SELECT p.nomb_pers FROM personas p WHERE e.codi_pers = p.codi_pers) AS pers_empr,
(SELECT ag.nomb_arge FROM area_geog ag WHERE e.codi_comu = ag.codi_arge and tipo_arge = '05') AS comu_empr,
(SELECT ag.nomb_arge FROM area_geog ag WHERE e.codi_ciud = ag.codi_arge and tipo_arge = '04') AS ciud_empr,
(SELECT sc.code_desc FROM sys_code sc WHERE e.giro_empr = sc.code and sc.domain_code = 741) AS giro_empr
FROM empr e
GO

GO
--SqlScripter----[dbo].[vw_lbe_enca_libr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_lbe_enca_libr]') IS NULL EXEC('CREATE VIEW [dbo].[vw_lbe_enca_libr] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_lbe_enca_libr]
AS
SELECT codi_empr,corr_libe,codi_soli,codi_peri,
tipo_libr,tipo_envi,nume_segm
FROM lbe_enca_libr
GO

GO
--SqlScripter----[dbo].[vw_lcv_segm_impu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_lcv_segm_impu]') IS NULL EXEC('CREATE VIEW [dbo].[vw_lcv_segm_impu] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_lcv_segm_impu]
AS
SELECT a.corr_licv,a.codi_empr,a.tipo_docu,a.codi_impu,
(SELECT nomb_impu FROM dte_tipo_impu WHERE codi_impu = a.codi_impu) AS desc_impu,
a.mont_impu
FROM lcv_segm_impu a
GO

GO
--SqlScripter----[dbo].[vw_lcv_segm_impu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_lcv_segm_impu_p]') IS NULL EXEC('CREATE VIEW [dbo].[vw_lcv_segm_impu_p] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_lcv_segm_impu_p]
AS
SELECT a.corr_licv,a.codi_empr,a.tipo_docu,a.codi_impu,
(SELECT nomb_impu FROM dte_tipo_impu WHERE codi_impu = a.codi_impu) AS desc_impu,
a.mont_impu
FROM lcv_segm_impu_p a
GO

GO
--SqlScripter----[dbo].[vw_lcv_tota_docu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_lcv_tota_docu]') IS NULL EXEC('CREATE VIEW [dbo].[vw_lcv_tota_docu] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_lcv_tota_docu]
AS
SELECT a.corr_licv,a.codi_empr,a.tipo_docu,a.foli_docu,a.rutt_asoc,a.codi_impu,
(SELECT nomb_impu FROM dte_tipo_impu WHERE codi_impu = a.codi_impu) AS desc_impu,
a.mont_impu,a.tas_impu
FROM lcv_tota_docu a
GO

GO
--SqlScripter----[dbo].[vw_lcv_tota_docu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_lcv_tota_docu_p]') IS NULL EXEC('CREATE VIEW [dbo].[vw_lcv_tota_docu_p] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_lcv_tota_docu_p]
AS
SELECT a.corr_licv,a.codi_empr,a.tipo_docu,a.foli_docu,a.rutt_asoc,a.codi_impu,
(SELECT nomb_impu FROM dte_tipo_impu WHERE codi_impu = a.codi_impu) AS desc_impu,
a.mont_impu,a.tas_impu
FROM lcv_tota_docu_p a
GO

GO
--SqlScripter----[dbo].[vw_lcv_tota_impu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_lcv_tota_impu]') IS NULL EXEC('CREATE VIEW [dbo].[vw_lcv_tota_impu] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_lcv_tota_impu]
AS
SELECT a.corr_licv,a.codi_empr,a.tipo_docu,a.codi_impu,
(SELECT nomb_impu FROM dte_tipo_impu WHERE codi_impu = a.codi_impu) AS desc_impu,
a.mont_impu,a.fact_adic,a.mont_cila
FROM lcv_tota_impu a
GO

GO
--SqlScripter----[dbo].[vw_lcv_tota_impu_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_lcv_tota_impu_p]') IS NULL EXEC('CREATE VIEW [dbo].[vw_lcv_tota_impu_p] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_lcv_tota_impu_p]
AS
SELECT a.corr_licv,a.codi_empr,a.tipo_docu,a.codi_impu,
(SELECT nomb_impu FROM dte_tipo_impu WHERE codi_impu = a.codi_impu) AS desc_impu,
a.mont_impu,a.fact_adic,a.mont_cila
FROM lcv_tota_impu_p a
GO

GO
--SqlScripter----[dbo].[vw_moneda].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_moneda]') IS NULL EXEC('CREATE VIEW [dbo].[vw_moneda] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_moneda]
AS
SELECT m.codi_mone,m.nume_mone,m.nomb_mone,m.codi_pais,
(select nomb_arge from area_geog where codi_arge = m.codi_pais and tipo_arge = '01') as nomb_pais,
m.roun_mone,m.fiso_mone
FROM  moneda m
GO

GO
--SqlScripter----[dbo].[vw_ofic_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_ofic_empr]') IS NULL EXEC('CREATE VIEW [dbo].[vw_ofic_empr] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_ofic_empr]
AS
SELECT oe.codi_empr,oe.codi_ofic,oe.desc_ofic,oe.codi_ceco,
(SELECT cc.nomb_ceco FROM cent_cost cc where oe.codi_ceco = cc.codi_ceco and oe.codi_empr = cc.codi_empr) as desc_codi_ceco,
codi_sii
FROM ofic_empr oe
GO

GO
--SqlScripter----[dbo].[vw_para_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_para_empr]') IS NULL EXEC('CREATE VIEW [dbo].[vw_para_empr] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_para_empr]
AS
SELECT codi_empr,codi_paem,desc_paem,valo_paem
FROM  para_empr
where tipo_como = 'ALL'
GO

GO
--SqlScripter----[dbo].[vw_personas].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_personas]') IS NULL EXEC('CREATE VIEW [dbo].[vw_personas] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_personas]
AS
SELECT codi_pers,rutt_pers,dgto_pers,nomb_pers,dire_pers,fono_pers,
codi_pais,codi_comu,codi_empr,empl_pers,empr_pers FROM personas
GO

GO
--SqlScripter----[dbo].[vw_sys_obje].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_sys_obje]') IS NULL EXEC('CREATE VIEW [dbo].[vw_sys_obje] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_sys_obje]
AS
SELECT object_name,object_type,object_brief,
object_desc,object_single,order_key 
FROM sys_object WHERE ((OBJECT_TYPE = 'E') OR 
(OBJECT_TYPE = 'X') OR (OBJECT_TYPE = '1'))
GO

GO
--SqlScripter----[dbo].[vw_sys_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_sys_object]') IS NULL EXEC('CREATE VIEW [dbo].[vw_sys_object] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_sys_object]
AS
SELECT object_name,object_type,object_brief,object_desc,object_single,
object_rela FROM sys_object WHERE object_type='U'
GO

GO
--SqlScripter----[dbo].[vw_sys_usro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_sys_usro]') IS NULL EXEC('CREATE VIEW [dbo].[vw_sys_usro] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_sys_usro]
AS
SELECT su.codi_usua,
(SELECT nomb_usua FROM usua_sist us WHERE us.codi_usua = su.codi_usua) AS nomb_usua,
su.codi_modu,su.codi_rous,
(SELECT desc_rous FROM sys_rous sr WHERE sr.codi_rous = su.codi_rous) AS desc_rous
FROM sys_usro su
GO

GO
--SqlScripter----[dbo].[vw_usua_empr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_usua_empr]') IS NULL EXEC('CREATE VIEW [dbo].[vw_usua_empr] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_usua_empr]
AS
SELECT codi_usua,
(select nomb_usua from usua_sist u where u.codi_usua = ue.codi_usua) as nomb_usua,
codi_empr,
(select nomb_empr from empr e where e.codi_empr = ue.codi_empr) as nomb_empr
FROM usua_empr ue
GO

GO
--SqlScripter----[dbo].[vw_usua_sist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[vw_usua_sist]') IS NULL EXEC('CREATE VIEW [dbo].[vw_usua_sist] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[vw_usua_sist]
AS
SELECT u.codi_usua,u.nomb_usua,u.codi_empr,
(SELECT e.nomb_empr FROM empr e WHERE e.codi_empr = u.codi_empr) as nomb_empr,
u.mail_usua
FROM usua_sist u
GO
