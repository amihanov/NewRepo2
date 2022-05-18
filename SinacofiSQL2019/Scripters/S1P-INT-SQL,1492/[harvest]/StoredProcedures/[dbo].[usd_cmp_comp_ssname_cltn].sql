SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_comp_ssname_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_comp_ssname_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_comp_ssname_cltn    Script Date: 12/1/2005 11:50:23 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_comp_ssname_cltn]
(@key_value as binary(16)) as
begin
select cmp.objectid from usd_v_target cmp
where cmp.objectid = cmp.ssid
and cmp.ssid = @key_value
order by cmp.lanname
end
GO
