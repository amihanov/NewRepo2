SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_act_grp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_grp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_act_grp_name_cltn    Script Date: 12/1/2005 11:50:22 PM ******/

ALTER PROCEDURE [dbo].[usd_act_grp_name_cltn]
(@key_value as binary(16)) as
begin
select lag.grp from usd_link_act_grp lag, usd_v_common_grp ag
where lag.grp = ag.objectid
and lag.act = @key_value
-- (ag.attributes & 0x00000004) ????? tbd 
order by ag.name 
end
GO
