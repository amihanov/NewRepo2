SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_lsgrp_ls_siteid_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_lsgrp_ls_siteid_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_lsgrp_ls_siteid_cltn    Script Date: 12/1/2005 11:50:25 PM ******/

ALTER PROCEDURE [dbo].[usd_lsgrp_ls_siteid_cltn]
(@key_value as binary(16)) as
begin
select gm.member_uuid from ca_group_member gm, usd_v_ls ls
where gm.member_uuid = ls.objectid
and gm.group_uuid = @key_value
and gm.member_type = 5
order by ls.siteid
end
GO
