﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_IssuesIds_withCoordAccess]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_IssuesIds_withCoordAccess] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_IssuesIds_withCoordAccess]
(		
		@IKCDU int,
		@tmp_table nvarchar(500) = '#TMP_ISSUES_WITH_ACCESS_IDS'
	)

AS

SET NOCOUNT ON
SET DATEFORMAT YMD

DECLARE @IKCAT INT
SELECT @IKCAT=CATEGORIA FROM USUARIOS WHERE CODIGO=@IKCDU


BEGIN TRY
	DROP TABLE #TMP_ISSUES  
END TRY
BEGIN CATCH
END CATCH

CREATE TABLE #TMP_ISSUES (CODIGONC INT)


IF @IKCAT=0   
BEGIN
	INSERT INTO #TMP_ISSUES(CODIGONC)
	SELECT CODIGO FROM NCMAINPROD WHERE 1=0
END
ELSE
BEGIN
		BEGIN TRY
			DROP TABLE #TMP_GROUPS
		END TRY
		BEGIN CATCH
		END CATCH

		BEGIN TRY
			DROP TABLE #TMP_SEC_LEVELS
		END TRY
		BEGIN CATCH
		END CATCH

		SELECT CODIGOGRUPO INTO #TMP_GROUPS FROM WEBGROUPMEMBERS WHERE CODIGOUSUARIO=@IKCDU

		SELECT CODIGOTIPONC, NIVELACCESO INTO #TMP_SEC_LEVELS FROM NCMODULESECURITYLEVELS WHERE CODIGOUSUARIO=@IKCDU

		INSERT INTO #TMP_SEC_LEVELS (CODIGOTIPONC, NIVELACCESO) 
			SELECT CODIGOTIPONC, MAX(NIVELACCESO)  FROM NCMODULESECURITYLEVELS WHERE CODIGOUSUARIO IN (SELECT CODIGOGRUPO FROM #TMP_GROUPS) AND NOT CODIGOTIPONC IN (SELECT CODIGOTIPONC FROM #TMP_SEC_LEVELS ) GROUP BY CODIGOTIPONC


		BEGIN TRY
			DROP TABLE #TMP_ISSUES_INVOLVED
		END TRY
		BEGIN CATCH
		END CATCH

		SELECT VISTA_ASUNTOSINVOLUCRADOS.CODIGO AS CODIGONC INTO #TMP_ISSUES_INVOLVED FROM VISTA_ASUNTOSINVOLUCRADOS WHERE CODIGOUSUARIO=@IKCDU AND VISTA_ASUNTOSINVOLUCRADOS.NIVEL=3
		INSERT INTO #TMP_ISSUES_INVOLVED (CODIGONC ) SELECT CODIGO FROM VISTA_ASUNTOSCOORDINADOS WHERE CODIGOUSUARIO=@IKCDU AND NOT CODIGO IN (SELECT CODIGONC FROM #TMP_ISSUES_INVOLVED )




	INSERT INTO #TMP_ISSUES(CODIGONC)
	SELECT NC.CODIGO FROM #TMP_SEC_LEVELS 
		JOIN NCMAINPROD NC ON NC.TIPO=#TMP_SEC_LEVELS.CODIGOTIPONC 
		LEFT JOIN #TMP_ISSUES_INVOLVED ON #TMP_ISSUES_INVOLVED.CODIGONC = NC.CODIGO
	WHERE 
		#TMP_SEC_LEVELS.NIVELACCESO > 0
		AND	((#TMP_SEC_LEVELS.NIVELACCESO>=2 AND NOT #TMP_ISSUES_INVOLVED.CODIGONC IS NULL) OR (#TMP_SEC_LEVELS.NIVELACCESO=5))
	ORDER BY CODIGOTIPONC, NIVELACCESO
END


EXEC ('INSERT INTO ' + @tmp_table + ' (CODIGONC ) SELECT CODIGONC FROM  #TMP_ISSUES')


RETURN
GO
