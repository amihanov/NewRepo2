SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_applic_actprocid_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_applic_actprocid_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_applic_actprocid_cltn    Script Date: 12/1/2005 11:49:56 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_applic_actprocid_cltn]
(@key_value as binary(16)) as
begin
select a.objectid from usd_applic a, usd_actproc ap
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
