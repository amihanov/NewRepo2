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
