SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dte_dequeue_arch_grpo]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dte_dequeue_arch_grpo] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[dte_dequeue_arch_grpo]
@codiGrpo    varchar(30)
as
	set nocount on;

	SELECT CODI_ARCH, NOMB_ARCH, EXTE_ARCH, TIPO_ARCH, PK01_TABL, PK02_TABL
	from   dbq_arch with (readpast)
	where  codi_grpo = @codiGrpo
	order by codi_arch, tmst_regi_arch
GO
