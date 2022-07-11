SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cfold_cont_disttime_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cfold_cont_disttime_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cfold_cont_disttime_cltn    Script Date: 12/1/2005 11:49:55 PM ******/

ALTER PROCEDURE [dbo].[usd_cfold_cont_disttime_cltn]
(@key_value as binary(16)) as
begin
select lcfc.cont from usd_link_cfold_cont lcfc, usd_cont c
where lcfc.cont = c.objectid
and lcfc.contfold = @key_value
order by c.disttime
end
GO
