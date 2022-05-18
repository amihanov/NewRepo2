SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_rsw_fold_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_rsw_fold_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_rsw_fold_name_cltn    Script Date: 12/1/2005 11:50:05 PM ******/

ALTER PROCEDURE [dbo].[usd_rsw_fold_name_cltn]
(@key_value as binary(16)) as
begin
select lswg.swg from usd_link_swg_sw lswg, usd_swfold swf
where lswg.swg = swf.objectid
and lswg.sw = @key_value
order by swf.name, (cast(swf.attributes as int) & 0x00000004)
end
GO
