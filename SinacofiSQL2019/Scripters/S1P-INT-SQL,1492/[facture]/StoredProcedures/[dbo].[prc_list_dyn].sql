SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[prc_list_dyn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[prc_list_dyn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[prc_list_dyn]
(
	@tsSql varchar(8000), 
	@tnPagina as integer,	
	@tnRegPag as integer
)
AS
	declare @lsSql1 as varchar(8000)
	declare @lsPagina as varchar(15)
	declare @lsRegPag as varchar(15)
	declare @lsSQLVar1 as varchar(4000)
	declare @lsSQLVar2 as varchar(4000)
BEGIN
	set @lsPagina = convert(varchar(15), @tnPagina)
	set @lsRegPag = convert(varchar(15), @tnRegPag)

	set @lsSql1 = 	'SELECT top ' + @lsRegPag + '
						(SELECT MAX(REG) FROM (' + @tsSql + ') REG_TMP ) TOT_REG, 
						(SELECT CONVERT(INTEGER, MAX(REG/' + @lsRegPag + '))  FROM (' + @tsSql + ') REG_TMP) PAG_MAX, * 
					FROM (' + @tsSql + ') REPO 
					WHERE REPO.REG BETWEEN ' + str((@tnPagina -1 ) * @tnRegPag + 1) + ' 
									   AND ' + str(@tnPagina * @tnRegPag );
									   
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,'  ',' ')
	set @lsSql1 = REPLACE(@lsSql1,CHAR(10)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(10)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(10)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(13)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(13)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(13)+ CHAR(9),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(10),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(10),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(10),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(13),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(13),CHAR(9))
	set @lsSql1 = REPLACE(@lsSql1,CHAR(9)+ CHAR(13),CHAR(9))
	
	EXEC(@lsSQL1)
END
GO
