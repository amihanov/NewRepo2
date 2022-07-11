SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jcappgr_appl_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jcappgr_appl_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jcappgr_appl_nosort_cltn    Script Date: 12/1/2005 11:50:02 PM ******/

ALTER PROCEDURE [dbo].[usd_jcappgr_appl_nosort_cltn]
(@key_value as binary(16)) as
begin
select ap.objectid
from usd_applic ap, usd_activity ac
where ac.objectid = ap.activity
and ap.applicationgroup = @key_value 
order by ac.ordernumb
end
GO
