SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_act_inst_instoid_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_inst_instoid_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_act_inst_instoid_cltn    Script Date: 12/1/2005 11:49:52 PM ******/

ALTER PROCEDURE [dbo].[usd_act_inst_instoid_cltn]
(@key_value as binary(16)) as
begin
select lai.installation from usd_link_act_inst lai
where lai.activity = @key_value
order by lai.installation
end
GO
