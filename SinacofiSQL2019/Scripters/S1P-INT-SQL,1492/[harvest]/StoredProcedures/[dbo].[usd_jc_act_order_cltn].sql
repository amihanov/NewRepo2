SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jc_act_order_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_act_order_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jc_act_order_cltn    Script Date: 12/1/2005 11:50:00 PM ******/

ALTER PROCEDURE [dbo].[usd_jc_act_order_cltn]
(@key_value as binary(16)) as
begin
select ljca.activity from usd_link_jc_act ljca, usd_activity a
where ljca.activity = a.objectid
and ljca.jcont = @key_value
order by a.ordernumb
end
GO
