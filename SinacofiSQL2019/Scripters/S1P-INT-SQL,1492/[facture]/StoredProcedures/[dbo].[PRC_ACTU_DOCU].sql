SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[PRC_ACTU_DOCU]') IS NULL EXEC('CREATE PROCEDURE [dbo].[PRC_ACTU_DOCU] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[PRC_ACTU_DOCU]
@P_CORR NUMeric,@P_WHERE VARCHAR,
						@P_CODI_ERRO varchar output,
						@P_MENS_ERRO varchar output
AS

/* objetivo : Actualizar todos los registro de DTE_ENCA_DOCU que cumplan con el where.
   Autor 	: Maximiliano Nu±ez S.
   Fecha 	: 01/06/2007
   OT 		: 325513 - Respaldo a historico y recuperacion */
   
declare @SENT_SQL varchar(1000)
declare @v_codi_erro varchar(1)
declare @v_mens_erro varchar(100)   
   
BEGIN		
	set @v_CODI_ERRO = 'N'
	set @v_MENS_ERRO = ' '	
	
	BEGIN
		BEGIN TRANSACTION		
			SELECT @SENT_SQL = 'UPDATE DTE_ENCA_DOCU SET CORR_EXTR = '+ convert(varchar,@P_CORR) +' WHERE '+@P_WHERE
			EXEC (@SENT_SQL)
			COMMIT
			IF @@TRANCOUNT > 0 
			begin
				ROLLBACK
				set @v_CODI_ERRO = 'S'
				set @v_MENS_ERRO = 'Error al actualizar en DTE_ENCA_DOCU.'
			end
		
	END
	set @p_codi_erro = @v_codi_erro
	set @p_mens_erro = @v_mens_erro
END
GO
