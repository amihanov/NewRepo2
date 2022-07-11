SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ls_distsw_namever_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ls_distsw_namever_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ls_distsw_namever_cltn    Script Date: 12/1/2005 11:50:03 PM ******/

ALTER PROCEDURE [dbo].[usd_ls_distsw_namever_cltn]
(@key_value as binary(16)) as
begin
select dsw.objectid from usd_distsw dsw, usd_rsw sw
where dsw.rsw = sw.objectid
and dsw.localsite = @key_value
order by sw.itemname, sw.itemversion
end
GO
