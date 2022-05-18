SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmpgrp_subgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmpgrp_subgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmpgrp_subgrp_name_cltn    Script Date: 12/1/2005 11:49:57 PM ******/

ALTER PROCEDURE [dbo].[usd_cmpgrp_subgrp_name_cltn]
(@key_value as binary(16)) as
begin
select lcg.grpchild from usd_link_cmpgrp lcg, usd_cmp_grp cg
where lcg.grpchild = cg.objectid
and lcg.grpparent = @key_value
order by cg.name, (cast(cg.attributes as int) & 0x00000004)
end
GO
