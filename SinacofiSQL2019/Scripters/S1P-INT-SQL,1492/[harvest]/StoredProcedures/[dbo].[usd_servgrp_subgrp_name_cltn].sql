SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_servgrp_subgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_servgrp_subgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_servgrp_subgrp_name_cltn    Script Date: 12/1/2005 11:50:32 PM ******/

ALTER PROCEDURE [dbo].[usd_servgrp_subgrp_name_cltn]
(@key_value as binary(16)) as
begin
select gm.member_uuid from ca_group_member gm, usd_v_server_grp sg
where gm.member_uuid = sg.objectid
and gm.group_uuid = @key_value
and gm.member_type = 0
--(cg.attributes & 0x00000004)
order by sg.name
end
GO
