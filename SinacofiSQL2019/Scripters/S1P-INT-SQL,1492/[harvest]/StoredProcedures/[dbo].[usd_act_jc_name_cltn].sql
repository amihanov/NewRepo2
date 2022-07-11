SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_act_jc_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_jc_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_act_jc_name_cltn    Script Date: 12/1/2005 11:49:52 PM ******/

ALTER PROCEDURE [dbo].[usd_act_jc_name_cltn]
(@key_value as binary(16)) as
begin
select ljca.jcont from usd_link_jc_act ljca, usd_job_cont jc
where ljca.jcont = jc.objectid
and ljca.activity = @key_value
order by jc.name, (cast(jc.attributes as int) & 0x00000004)
end
GO
