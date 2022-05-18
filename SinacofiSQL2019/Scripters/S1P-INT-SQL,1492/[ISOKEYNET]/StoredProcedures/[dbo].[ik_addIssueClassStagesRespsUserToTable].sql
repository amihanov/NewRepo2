﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_addIssueClassStagesRespsUserToTable]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_addIssueClassStagesRespsUserToTable] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_addIssueClassStagesRespsUserToTable]
(
@MODULEID int,
@tmp_table nvarchar(500)
)
AS

DECLARE @cols AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX)

select @cols = STUFF((SELECT ',' + QUOTENAME('RESP_USER_STAGE_' + CONVERT(nvarchar(10),NCDEFINICIONETAPAS.ETAPA)) 
                    FROM NCDEFINICIONETAPAS 
					WHERE TIPO=@MODULEID AND NCDEFINICIONETAPAS.L_EXCLUIDA=0
					group by NCDEFINICIONETAPAS.DESCRIPCIONCORTA,NCDEFINICIONETAPAS.ETAPA
                    order by NCDEFINICIONETAPAS.ETAPA
					
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')


DECLARE @colsINS nvarchar(max)
SET @colsINS = REPLACE(@cols,'],','] nvarchar(200),') + ' nvarchar(200)'


set @query = ' ALTER TABLE '+ @tmp_table +' ADD ' + @colsINS
execute(@query);


set @query = '	
			INSERT INTO '+ @tmp_table +'					
			SELECT CODIGONC,' + @cols + ' FROM 
             (
                SELECT 					
					VISTA_CARGOSUSUARIOS.USUARIO AS DESCRIPCION_USUARIO,
					''RESP_USER_STAGE_'' + CONVERT(nvarchar(10),NCETAPAS.ETAPA) +  '''' AS DESCRIPCIONCORTA,
					NCETAPAS.CODIGONC 					
				FROM NCETAPAS 
					LEFT JOIN VISTA_CARGOSUSUARIOS ON VISTA_CARGOSUSUARIOS.CODIGOCARGO=CODIGO_CARGO_RESPONSABLE 
				WHERE NCETAPAS.TIPO='+ CONVERT(nvarchar(20),@MODULEID) +'
            ) x
            PIVOT
            (
                MAX(DESCRIPCION_USUARIO)
                FOR DESCRIPCIONCORTA IN (' + @cols + ')
            ) p '


execute(@query);


RETURN
GO
