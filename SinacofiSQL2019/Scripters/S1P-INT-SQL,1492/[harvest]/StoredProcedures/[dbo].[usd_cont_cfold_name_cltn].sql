SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cont_cfold_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cont_cfold_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cont_cfold_name_cltn    Script Date: 12/1/2005 11:49:58 PM ******/

ALTER PROCEDURE [dbo].[usd_cont_cfold_name_cltn]
(@key_value as binary(16)) as
begin
select lcfc.contfold from usd_link_cfold_cont lcfc, usd_contfold cf
where lcfc.contfold = cf.objectid
and lcfc.cont = @key_value
order by cf.name
end
GO
