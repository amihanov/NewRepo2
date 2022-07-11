SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_act_appl_cmpname_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_appl_cmpname_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_act_appl_cmpname_cltn    Script Date: 12/1/2005 11:50:21 PM ******/

ALTER PROCEDURE [dbo].[usd_act_appl_cmpname_cltn]
(@key_value as binary(16)) as
begin
select app.objectid from usd_applic app, usd_v_target cmp
where app.target = cmp.objectid
and activity = @key_value
order by cmp.lanname
end
GO
