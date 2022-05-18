SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_assetgrp_jc_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_assetgrp_jc_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_assetgrp_jc_name_cltn    Script Date: 12/1/2005 11:49:54 PM ******/


ALTER PROCEDURE [dbo].[usd_assetgrp_jc_name_cltn]
(@key_value as binary(16)) as
begin
select j.objectid from usd_job_cont j
where j.qtemplfold = @key_value
order by j.name, (cast(j.attributes as int) & 0x00000004)
end
GO
