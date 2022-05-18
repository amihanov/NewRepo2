SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmpgrp_cmp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmpgrp_cmp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmpgrp_cmp_name_cltn    Script Date: 12/1/2005 11:50:24 PM ******/

ALTER PROCEDURE [dbo].[usd_cmpgrp_cmp_name_cltn]
(@key_value as binary(16)) as
begin
select lccg.comp from usd_link_grp_cmp lccg, usd_v_target c
where lccg.comp = c.objectid
and lccg.grp = @key_value
order by c.lanname
end
GO
