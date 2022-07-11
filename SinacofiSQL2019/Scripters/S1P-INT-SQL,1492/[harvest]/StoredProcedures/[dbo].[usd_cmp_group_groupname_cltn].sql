SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_group_groupname_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_group_groupname_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_group_groupname_cltn    Script Date: 12/1/2005 11:49:57 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_group_groupname_cltn]
(@key_value as binary(16)) as
begin
select lccg.grp from usd_link_grp_cmp lccg, usd_cmp_grp cg
where lccg.grp = cg.objectid
and lccg.comp = @key_value
order by cg.name, (cast(cg.attributes as int) & 0x00000004)
end
GO
