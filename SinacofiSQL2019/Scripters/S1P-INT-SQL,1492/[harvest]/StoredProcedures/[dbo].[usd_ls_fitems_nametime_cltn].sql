SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ls_fitems_nametime_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ls_fitems_nametime_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ls_fitems_nametime_cltn    Script Date: 12/1/2005 11:50:03 PM ******/

ALTER PROCEDURE [dbo].[usd_ls_fitems_nametime_cltn]
(@key_value as binary(16)) as
begin
select fi.objectid from usd_fitem fi, usd_fio fio
where fi.fio = fio.objectid
and fi.localsite = @key_value
order by fio.finame, fi.fetchtime
end
GO
