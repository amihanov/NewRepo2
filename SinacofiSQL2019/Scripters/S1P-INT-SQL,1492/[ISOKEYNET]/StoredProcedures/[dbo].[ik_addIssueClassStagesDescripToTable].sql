SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_addIssueClassStagesDescripToTable]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_addIssueClassStagesDescripToTable] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_addIssueClassStagesDescripToTable]
(
@MODULEID int,
@tmp_table nvarchar(500)
)
AS

DECLARE @cols AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX)

select @cols = STUFF((SELECT ',' + QUOTENAME('DESCRIPCION_STAGE_' + CONVERT(nvarchar(10),NCDEFINICIONETAPAS.ETAPA)) 
                    FROM NCDEFINICIONETAPAS 
					WHERE TIPO=@MODULEID AND NCDEFINICIONETAPAS.L_EXCLUIDA=0
					group by NCDEFINICIONETAPAS.DESCRIPCIONCORTA,NCDEFINICIONETAPAS.ETAPA
                    order by NCDEFINICIONETAPAS.ETAPA
					
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')


DECLARE @colsINS nvarchar(max)
SET @colsINS = REPLACE(@cols,'],','] NVARCHAR(MAX) NULL,') + ' NVARCHAR(MAX) NULL'


set @query = ' ALTER TABLE '+ @tmp_table +' ADD ' + @colsINS
execute(@query);

-- si hay mÃ¡s de 5 lineas en el campo, lo mete colapsado con botÃ³n para expandir
set @query = '	
			INSERT INTO '+ @tmp_table +'					
			SELECT CODIGONC,' + @cols + ' FROM 
             (
                SELECT 
					CASE WHEN LEN(CONVERT(VARCHAR(MAX),COMENTARIOSETAPA))-LEN(REPLACE(CONVERT(VARCHAR(MAX),COMENTARIOSETAPA),CHAR(13),''''))>5
					THEN
					''<span class="expandcolresp hiddenResp"><span class="cmd" >&nbsp;</span><span class="points"></span><span class="NAWhenHidden resps_html">'' + 
					REPLACE(CONVERT(nvarchar(max), NCETAPAS.COMENTARIOSETAPA),CHAR(13),''<br>'') 
					 + ''</span></span>''
					ELSE
					REPLACE(CONVERT(nvarchar(max), NCETAPAS.COMENTARIOSETAPA),CHAR(13),''<br>'') 
					END  AS COMENTARIOSETAPA,
					''DESCRIPCION_STAGE_'' + CONVERT(nvarchar(10),NCETAPAS.ETAPA) AS DESCRIPCIONCORTA,
					NCETAPAS.CODIGONC
				FROM NCETAPAS 
				WHERE TIPO='+ CONVERT(nvarchar(20),@MODULEID) +'
            ) x
            PIVOT
            (
                MAX(COMENTARIOSETAPA)
                FOR DESCRIPCIONCORTA IN (' + @cols + ')
            ) p '


execute(@query);

RETURN
GO
