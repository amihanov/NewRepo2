﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_usrIns_ModulesByPermissions]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_usrIns_ModulesByPermissions] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_usrIns_ModulesByPermissions]
@CODIGOUSUARIO INT, @NIVELACCESO INT 
AS
BEGIN

-- EXEC ('SET NOCOUNT ON')

   IF (@NIVELACCESO = -1)
      select DISTINCT  M.MODULEID,M.DESCRIPTION,G.SMALLGIF FROM XML_MODULE_DEFINITIONS M
      JOIN XML_MODULEGROUP_DEFINITIONS G ON G.MODULEGROUPID = M.MODULEGROUPID
      JOIN NCMODULESECURITYLEVELS P ON P.CODIGOTIPONC = M.MODULEID
      WHERE CODIGOUSUARIO = @CODIGOUSUARIO
      ORDER BY M.DESCRIPTION
   ELSE
      select DISTINCT  M.MODULEID,M.DESCRIPTION,G.SMALLGIF FROM XML_MODULE_DEFINITIONS M
      JOIN XML_MODULEGROUP_DEFINITIONS G ON G.MODULEGROUPID = M.MODULEGROUPID
      JOIN NCMODULESECURITYLEVELS P ON P.CODIGOTIPONC = M.MODULEID
      WHERE NIVELACCESO = @NIVELACCESO and CODIGOUSUARIO = @CODIGOUSUARIO
      ORDER BY M.DESCRIPTION




END
GO