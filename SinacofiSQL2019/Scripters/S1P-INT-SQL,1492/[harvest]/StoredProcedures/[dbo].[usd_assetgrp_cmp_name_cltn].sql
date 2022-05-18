SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_assetgrp_cmp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_assetgrp_cmp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_assetgrp_cmp_name_cltn    Script Date: 12/1/2005 11:50:22 PM ******/

ALTER PROCEDURE [dbo].[usd_assetgrp_cmp_name_cltn]
(@key_value as binary(16)) as
begin
select gm.member_uuid from ca_group_member gm, usd_v_target c
where gm.member_uuid = c.objectid
and gm.group_uuid = @key_value
and (gm.member_type = 1 or gm.member_type = 4)
order by c.lanname
end
GO
