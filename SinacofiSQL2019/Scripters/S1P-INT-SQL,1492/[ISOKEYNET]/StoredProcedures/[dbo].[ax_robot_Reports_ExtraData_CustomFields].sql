SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ax_robot_Reports_ExtraData_CustomFields]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ax_robot_Reports_ExtraData_CustomFields] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ax_robot_Reports_ExtraData_CustomFields]
@RPT_UID uniqueidentifier,
	@TEMP_TABLE nvarchar(200)
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @CUSTOM_FIELDS_XML xml;

     SELECT
          @CUSTOM_FIELDS_XML = ISNULL(CUSTOM_FIELDS_XML,'<dictionary></dictionary>')
        FROM
        ROBOTS_REPORTS_EXTRADATA
        WHERE ROBOTS_REPORTS_EXTRADATA.RPT_UID=@RPT_UID;
        
        SELECT 
	        Tab.Col.value('@name','nvarchar(100)') AS name ,
	        Tab.Col.value('.','nvarchar(max)') AS value 
        INTO #TEMP_DICTIONARY
        FROM @CUSTOM_FIELDS_XML.nodes('//dictionary/entry') Tab(Col);        
        
        
        DECLARE @cols AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX);
        select @cols = STUFF((SELECT ',' + QUOTENAME(#TEMP_DICTIONARY.name) 
                            FROM #TEMP_DICTIONARY
                    FOR XML PATH(''), TYPE
                    ).value('.', 'NVARCHAR(MAX)') 
                ,1,1,'');


      DECLARE @colsINS nvarchar(max);
      SET @colsINS = REPLACE(@cols,'],','] nvarchar(200),') + ' nvarchar(max)';
      
      SET @query = ' ALTER TABLE '+ @TEMP_TABLE +'  ADD ' + @colsINS ;
      execute(@query);

      set @query = '	
			      INSERT INTO '+ @TEMP_TABLE +' ('+ @cols +')
			      SELECT ' + @cols + '  FROM 
                    (
                      SELECT 
					      name, value
				      FROM #TEMP_DICTIONARY'+'
                  ) x
                  PIVOT
                  (
                      MAX(value)
                      FOR name IN (' + @cols + ')
                  ) p '


      execute(@query);
      

END
GO
