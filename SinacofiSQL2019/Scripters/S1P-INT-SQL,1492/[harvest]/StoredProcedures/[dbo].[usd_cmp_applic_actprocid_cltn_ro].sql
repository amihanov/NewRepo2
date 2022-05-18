SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_applic_actprocid_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_applic_actprocid_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_applic_actprocid_cltn_ro    Script Date: 12/1/2005 11:49:56 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_applic_actprocid_cltn_ro]
(@key_value as binary(16)) as
begin
select a.objectid, a.version, a.target, a.actproc, a.activity, 
a.installation, a.status, a.errorcause, a.errorparam, a.creationtime, 
a.activationtime, a.completiontime, a.administrator, a.applicationid, 
a.comment, a.task, a.percentsent, a.retentiontime, a.renewstatus, 
a.firstrenew, a.nextrenew, a.applicationgroup, a.userparams, a.uuid, 
a.racassoc, a.uninstallstate, a.permmask, a.starttime, a.uuid2
from usd_applic a, usd_actproc ap
where a.actproc = ap.objectid
and a.target = @key_value
and (
-- task&install and status!=execution_error and status!=already_installed and status!=manipulation_not_allowed 
(a.task = 0x00000001 and a.status != 10 and a.status != 15 and a.status != 16) or

-- task&deliver and status!=delivery_error and status!=already_delivered 
(a.task = 0x00000010 and a.status != 5 and a.status != 6)
)
-- not uninstalled 
and a.uninstallstate <> 2
order by ap.objectid
end
GO
