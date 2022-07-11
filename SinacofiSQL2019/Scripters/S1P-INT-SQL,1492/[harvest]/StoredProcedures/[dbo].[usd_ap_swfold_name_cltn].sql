SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ap_swfold_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ap_swfold_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ap_swfold_name_cltn    Script Date: 12/1/2005 11:49:54 PM ******/

ALTER PROCEDURE [dbo].[usd_ap_swfold_name_cltn]
(@key_value as binary(16)) as
begin
select lapg.procgrp from usd_link_grp_proc lapg, usd_swfold swf
where lapg.procgrp = swf.objectid
and lapg.ap = @key_value
order by swf.name, (cast(swf.attributes as int) & 0x00000004)
end
GO
