SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_applic_itemname_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_applic_itemname_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_applic_itemname_cltn    Script Date: 12/1/2005 11:49:56 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_applic_itemname_cltn]
(@key_value as binary(16)) as
begin
select app.objectid from usd_applic app, usd_actproc acp, usd_rsw rsw
where app.actproc = acp.objectid
and acp.rsw= rsw.objectid
and app.target = @key_value
order by rsw.itemname
end
GO
