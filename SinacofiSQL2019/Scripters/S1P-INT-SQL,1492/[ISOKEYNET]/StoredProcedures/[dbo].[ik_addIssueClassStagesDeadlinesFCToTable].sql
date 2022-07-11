﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_addIssueClassStagesDeadlinesFCToTable]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_addIssueClassStagesDeadlinesFCToTable] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_addIssueClassStagesDeadlinesFCToTable]
(
@MODULEID int,
@tmp_table nvarchar(500)
)
AS

SELECT 
CODIGONC, ETAPA, MAX(FECHALIMITE) AS FECHALIMITE_ETAPA
INTO #TEMP_FECHASLIMITE_ETAPAS
FROM NCTAREAS
JOIN NCMAINPROD ON NCMAINPROD.CODIGO = NCTAREAS.CODIGONC
WHERE NCTAREAS.L_CUMPLIDA=0 AND NCMAINPROD.TIPO=@MODULEID
GROUP BY CODIGONC, ETAPA


DECLARE @cols AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX)

select @cols = STUFF((SELECT ',' + QUOTENAME('FC_DEADLINE_STAGE_' + CONVERT(nvarchar(10),NCDEFINICIONETAPAS.ETAPA)) 
                    FROM NCDEFINICIONETAPAS 
					WHERE TIPO=@MODULEID AND NCDEFINICIONETAPAS.L_EXCLUIDA=0
					group by NCDEFINICIONETAPAS.DESCRIPCIONCORTA,NCDEFINICIONETAPAS.ETAPA
                    order by NCDEFINICIONETAPAS.ETAPA
					
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')


DECLARE @colsINS nvarchar(max)
SET @colsINS = REPLACE(@cols,'],','] nvarchar(10),') + ' nvarchar(10)'


set @query = ' ALTER TABLE '+ @tmp_table +' ADD ' + @colsINS
execute(@query);


set @query = '	
			INSERT INTO '+ @tmp_table +'					
			SELECT CODIGONC,' + @cols + ' FROM 
             (
                SELECT 
					CASE 
						WHEN SYSTEM_CUMPLIDA=1 THEN ''''
						WHEN FECHAVENCIMIENTO IS NULL THEN ''''
						WHEN datediff(day,getdate(),FECHAVENCIMIENTO) < 0 THEN ''red''
						WHEN datediff(day,#TEMP_FECHASLIMITE_ETAPAS.FECHALIMITE_ETAPA , FECHAVENCIMIENTO)< 0 THEN  ''yellow''
						ELSE ''''
					END AS BG_COLOR,					
					''FC_DEADLINE_STAGE_'' + CONVERT(nvarchar(10),NCETAPAS.ETAPA) +  '''' AS DESCRIPCIONCORTA,
					NCETAPAS.CODIGONC
				FROM NCETAPAS 
					LEFT JOIN #TEMP_FECHASLIMITE_ETAPAS ON #TEMP_FECHASLIMITE_ETAPAS.CODIGONC=NCETAPAS.CODIGONC AND NCETAPAS.ETAPA=#TEMP_FECHASLIMITE_ETAPAS.ETAPA
				WHERE TIPO='+ CONVERT(nvarchar(20),@MODULEID) +'
            ) x
            PIVOT
            (
                MAX(BG_COLOR)
                FOR DESCRIPCIONCORTA IN (' + @cols + ')
            ) p '


execute(@query);


RETURN
GO
