SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_servgrp_srv_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_servgrp_srv_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_servgrp_srv_name_cltn    Script Date: 12/1/2005 11:50:32 PM ******/

ALTER PROCEDURE [dbo].[usd_servgrp_srv_name_cltn]
(@key_value as binary(16)) as
begin
select c.objectid from ca_group_member gm, usd_v_target c, ca_server s
where gm.member_uuid = s.server_uuid
and c.objectid = s.dis_hw_uuid
and gm.group_uuid = @key_value
and gm.member_type = 7
order by c.lanname
end
GO
