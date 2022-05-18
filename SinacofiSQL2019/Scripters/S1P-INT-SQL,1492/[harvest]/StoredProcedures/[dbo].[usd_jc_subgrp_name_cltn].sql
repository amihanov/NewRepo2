SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jc_subgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_subgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jc_subgrp_name_cltn    Script Date: 12/1/2005 11:50:01 PM ******/

ALTER PROCEDURE [dbo].[usd_jc_subgrp_name_cltn]
(@key_value as binary(16)) as
begin
select ljc.jcchild from usd_link_jc ljc, usd_job_cont jc
where ljc.jcchild = jc.objectid
and ljc.jcparent = @key_value
order by jc.name, (cast(jc.attributes as int) & 0x00000004)
end
GO
