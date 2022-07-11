SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cfold_subgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cfold_subgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cfold_subgrp_name_cltn    Script Date: 12/1/2005 11:49:55 PM ******/

ALTER PROCEDURE [dbo].[usd_cfold_subgrp_name_cltn]
(@key_value as binary(16)) as
begin
select lcf.cfold_child from usd_link_contfold lcf, usd_contfold cf
where lcf.cfold_child = cf.objectid
and lcf.cfold_parent = @key_value
order by cf.name
end
GO
