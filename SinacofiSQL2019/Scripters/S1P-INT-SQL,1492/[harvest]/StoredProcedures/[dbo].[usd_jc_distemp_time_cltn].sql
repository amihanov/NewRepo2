SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jc_distemp_time_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_distemp_time_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jc_distemp_time_cltn    Script Date: 12/1/2005 11:50:00 PM ******/

ALTER PROCEDURE [dbo].[usd_jc_distemp_time_cltn]
(@key_value as binary(16)) as
begin
select dt.objectid from usd_disttempl dt, usd_job_cont jc
where dt.template = jc.objectid
and jc.objectid = @key_value
order by dt.disttime
end
GO
