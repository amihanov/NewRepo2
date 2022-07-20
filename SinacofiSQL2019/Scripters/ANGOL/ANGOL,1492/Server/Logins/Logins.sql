
GO
--SqlScripter----[##MS_AgentSigningCertificate##].sql
GO
-- ##MS_AgentSigningCertificate##
BEGIN TRY
   CREATE LOGIN [##MS_AgentSigningCertificate##] WITH PASSWORD='##MS_AgentSigningCertificate##',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[##MS_PolicyEventProcessingLogin##].sql
GO
-- ##MS_PolicyEventProcessingLogin##
BEGIN TRY
   CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD='##MS_PolicyEventProcessingLogin##',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[##MS_PolicySigningCertificate##].sql
GO
-- ##MS_PolicySigningCertificate##
BEGIN TRY
   CREATE LOGIN [##MS_PolicySigningCertificate##] WITH PASSWORD='##MS_PolicySigningCertificate##',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = []
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[##MS_PolicyTsqlExecutionLogin##].sql
GO
-- ##MS_PolicyTsqlExecutionLogin##
BEGIN TRY
   CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD='##MS_PolicyTsqlExecutionLogin##',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[##MS_SmoExtendedSigningCertificate##].sql
GO
-- ##MS_SmoExtendedSigningCertificate##
BEGIN TRY
   CREATE LOGIN [##MS_SmoExtendedSigningCertificate##] WITH PASSWORD='##MS_SmoExtendedSigningCertificate##',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = []
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[##MS_SQLAuthenticatorCertificate##].sql
GO
-- ##MS_SQLAuthenticatorCertificate##
BEGIN TRY
   CREATE LOGIN [##MS_SQLAuthenticatorCertificate##] WITH PASSWORD='##MS_SQLAuthenticatorCertificate##',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = []
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[##MS_SQLReplicationSigningCertificate##].sql
GO
-- ##MS_SQLReplicationSigningCertificate##
BEGIN TRY
   CREATE LOGIN [##MS_SQLReplicationSigningCertificate##] WITH PASSWORD='##MS_SQLReplicationSigningCertificate##',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = []
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[##MS_SQLResourceSigningCertificate##].sql
GO
-- ##MS_SQLResourceSigningCertificate##
BEGIN TRY
   CREATE LOGIN [##MS_SQLResourceSigningCertificate##] WITH PASSWORD='##MS_SQLResourceSigningCertificate##',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = []
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[cblanco].sql
GO
-- cblanco
BEGIN TRY
   CREATE LOGIN [cblanco] WITH PASSWORD='cblanco',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[cvelasquez].sql
GO
-- cvelasquez
BEGIN TRY
   CREATE LOGIN [cvelasquez] WITH PASSWORD='cvelasquez',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ext_st01].sql
GO
-- ext_st01
BEGIN TRY
   CREATE LOGIN [ext_st01] WITH PASSWORD='ext_st01',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[harvest].sql
GO
-- harvest
BEGIN TRY
   CREATE LOGIN [harvest] WITH PASSWORD='harvest',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [harvest],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[Hostmonitor].sql
GO
-- Hostmonitor
BEGIN TRY
   CREATE LOGIN [Hostmonitor] WITH PASSWORD='Hostmonitor',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[jarce].sql
GO
-- jarce
BEGIN TRY
   CREATE LOGIN [jarce] WITH PASSWORD='jarce',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[jmelendez].sql
GO
-- jmelendez
BEGIN TRY
   CREATE LOGIN [jmelendez] WITH PASSWORD='jmelendez',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ltomoche].sql
GO
-- ltomoche
BEGIN TRY
   CREATE LOGIN [ltomoche] WITH PASSWORD='ltomoche',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[nhuenul].sql
GO
-- nhuenul
BEGIN TRY
   CREATE LOGIN [nhuenul] WITH PASSWORD='nhuenul',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[NT AUTHORITY_SYSTEM].sql
GO
-- NT AUTHORITY\SYSTEM
BEGIN TRY
   CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[NT Service_MSSQLSERVER].sql
GO
-- NT Service\MSSQLSERVER
BEGIN TRY
   CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[NT SERVICE_SQLSERVERAGENT].sql
GO
-- NT SERVICE\SQLSERVERAGENT
BEGIN TRY
   CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[NT SERVICE_SQLTELEMETRY].sql
GO
-- NT SERVICE\SQLTELEMETRY
BEGIN TRY
   CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[NT SERVICE_SQLWriter].sql
GO
-- NT SERVICE\SQLWriter
BEGIN TRY
   CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[NT SERVICE_Winmgmt].sql
GO
-- NT SERVICE\Winmgmt
BEGIN TRY
   CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_appexplotacion].sql
GO
-- ope_appexplotacion
BEGIN TRY
   CREATE LOGIN [ope_appexplotacion] WITH PASSWORD='ope_appexplotacion',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_appsbif ].sql
GO
-- ope_appsbif 
BEGIN TRY
   CREATE LOGIN [ope_appsbif ] WITH PASSWORD='ope_appsbif ',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_brokerft3].sql
GO
-- ope_brokerft3
BEGIN TRY
   CREATE LOGIN [ope_brokerft3] WITH PASSWORD='ope_brokerft3',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_credex].sql
GO
-- ope_credex
BEGIN TRY
   CREATE LOGIN [ope_credex] WITH PASSWORD='ope_credex',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ValidacionTributaria],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_credexweb].sql
GO
-- ope_credexweb
BEGIN TRY
   CREATE LOGIN [ope_credexweb] WITH PASSWORD='ope_credexweb',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ValidacionTributaria],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_dba].sql
GO
-- ope_dba
BEGIN TRY
   CREATE LOGIN [ope_dba] WITH PASSWORD='ope_dba',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_desa_admin].sql
GO
-- ope_desa_admin
BEGIN TRY
   CREATE LOGIN [ope_desa_admin] WITH PASSWORD='ope_desa_admin',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_docuays].sql
GO
-- ope_docuays
BEGIN TRY
   CREATE LOGIN [ope_docuays] WITH PASSWORD='ope_docuays',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [docuays],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_docusnap].sql
GO
-- ope_docusnap
BEGIN TRY
   CREATE LOGIN [ope_docusnap] WITH PASSWORD='ope_docusnap',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [docusnap],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_erp_v12].sql
GO
-- ope_erp_v12
BEGIN TRY
   CREATE LOGIN [ope_erp_v12] WITH PASSWORD='ope_erp_v12',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ERP_V12],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_facture].sql
GO
-- ope_facture
BEGIN TRY
   CREATE LOGIN [ope_facture] WITH PASSWORD='ope_facture',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [facture],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_fluig].sql
GO
-- ope_fluig
BEGIN TRY
   CREATE LOGIN [ope_fluig] WITH PASSWORD='ope_fluig',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [FluigDB],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_ft3].sql
GO
-- ope_ft3
BEGIN TRY
   CREATE LOGIN [ope_ft3] WITH PASSWORD='ope_ft3',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_ft3web].sql
GO
-- ope_ft3web
BEGIN TRY
   CREATE LOGIN [ope_ft3web] WITH PASSWORD='ope_ft3web',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_gesplat].sql
GO
-- ope_gesplat
BEGIN TRY
   CREATE LOGIN [ope_gesplat] WITH PASSWORD='ope_gesplat',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_harvest].sql
GO
-- ope_harvest
BEGIN TRY
   CREATE LOGIN [ope_harvest] WITH PASSWORD='ope_harvest',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [harvest],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_harvestmig].sql
GO
-- ope_harvestmig
BEGIN TRY
   CREATE LOGIN [ope_harvestmig] WITH PASSWORD='ope_harvestmig',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_hostmonitor].sql
GO
-- ope_hostmonitor
BEGIN TRY
   CREATE LOGIN [ope_hostmonitor] WITH PASSWORD='ope_hostmonitor',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_intercajas_test].sql
GO
-- ope_intercajas_test
BEGIN TRY
   CREATE LOGIN [ope_intercajas_test] WITH PASSWORD='ope_intercajas_test',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_intercajasdesarrollo].sql
GO
-- ope_intercajasdesarrollo
BEGIN TRY
   CREATE LOGIN [ope_intercajasdesarrollo] WITH PASSWORD='ope_intercajasdesarrollo',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_intercajasweb].sql
GO
-- ope_intercajasweb
BEGIN TRY
   CREATE LOGIN [ope_intercajasweb] WITH PASSWORD='ope_intercajasweb',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [intercajas],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_intercajaswebetapa2].sql
GO
-- ope_intercajaswebetapa2
BEGIN TRY
   CREATE LOGIN [ope_intercajaswebetapa2] WITH PASSWORD='ope_intercajaswebetapa2',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [intercajas],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_inventario].sql
GO
-- ope_inventario
BEGIN TRY
   CREATE LOGIN [ope_inventario] WITH PASSWORD='ope_inventario',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [inventario],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_limpieza].sql
GO
-- ope_limpieza
BEGIN TRY
   CREATE LOGIN [ope_limpieza] WITH PASSWORD='ope_limpieza',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_LoginFailed].sql
GO
-- ope_LoginFailed
BEGIN TRY
   CREATE LOGIN [ope_LoginFailed] WITH PASSWORD='ope_LoginFailed',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_mantencionBD].sql
GO
-- ope_mantencionBD
BEGIN TRY
   CREATE LOGIN [ope_mantencionBD] WITH PASSWORD='ope_mantencionBD',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_mantenimiento].sql
GO
-- ope_mantenimiento
BEGIN TRY
   CREATE LOGIN [ope_mantenimiento] WITH PASSWORD='ope_mantenimiento',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_monConsFt3].sql
GO
-- ope_monConsFt3
BEGIN TRY
   CREATE LOGIN [ope_monConsFt3] WITH PASSWORD='ope_monConsFt3',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_monitorft3].sql
GO
-- ope_monitorft3
BEGIN TRY
   CREATE LOGIN [ope_monitorft3] WITH PASSWORD='ope_monitorft3',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_optimisa].sql
GO
-- ope_optimisa
BEGIN TRY
   CREATE LOGIN [ope_optimisa] WITH PASSWORD='ope_optimisa',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_paso1].sql
GO
-- ope_paso1
BEGIN TRY
   CREATE LOGIN [ope_paso1] WITH PASSWORD='ope_paso1',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_prueba].sql
GO
-- ope_prueba
BEGIN TRY
   CREATE LOGIN [ope_prueba] WITH PASSWORD='ope_prueba',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_pwc_bd].sql
GO
-- ope_pwc_bd
BEGIN TRY
   CREATE LOGIN [ope_pwc_bd] WITH PASSWORD='ope_pwc_bd',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_pwc_domain].sql
GO
-- ope_pwc_domain
BEGIN TRY
   CREATE LOGIN [ope_pwc_domain] WITH PASSWORD='ope_pwc_domain',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [PWC_DOMAIN],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_pwc_ft3].sql
GO
-- ope_pwc_ft3
BEGIN TRY
   CREATE LOGIN [ope_pwc_ft3] WITH PASSWORD='ope_pwc_ft3',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_pwc_intercajas].sql
GO
-- ope_pwc_intercajas
BEGIN TRY
   CREATE LOGIN [ope_pwc_intercajas] WITH PASSWORD='ope_pwc_intercajas',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [intercajas],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_pwc_ream].sql
GO
-- ope_pwc_ream
BEGIN TRY
   CREATE LOGIN [ope_pwc_ream] WITH PASSWORD='ope_pwc_ream',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_pwc_repo].sql
GO
-- ope_pwc_repo
BEGIN TRY
   CREATE LOGIN [ope_pwc_repo] WITH PASSWORD='ope_pwc_repo',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [PWC_REPO],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_replica].sql
GO
-- ope_replica
BEGIN TRY
   CREATE LOGIN [ope_replica] WITH PASSWORD='ope_replica',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_rojo_db1].sql
GO
-- ope_rojo_db1
BEGIN TRY
   CREATE LOGIN [ope_rojo_db1] WITH PASSWORD='ope_rojo_db1',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_ruteador].sql
GO
-- ope_ruteador
BEGIN TRY
   CREATE LOGIN [ope_ruteador] WITH PASSWORD='ope_ruteador',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_sa].sql
GO
-- ope_sa
BEGIN TRY
   CREATE LOGIN [ope_sa] WITH PASSWORD='ope_sa',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_splunkbd].sql
GO
-- ope_splunkbd
BEGIN TRY
   CREATE LOGIN [ope_splunkbd] WITH PASSWORD='ope_splunkbd',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_TransformadorDSF].sql
GO
-- ope_TransformadorDSF
BEGIN TRY
   CREATE LOGIN [ope_TransformadorDSF] WITH PASSWORD='ope_TransformadorDSF',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ope_xemantics].sql
GO
-- ope_xemantics
BEGIN TRY
   CREATE LOGIN [ope_xemantics] WITH PASSWORD='ope_xemantics',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[oracle_02].sql
GO
-- oracle_02
BEGIN TRY
   CREATE LOGIN [oracle_02] WITH PASSWORD='oracle_02',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[oracle_03].sql
GO
-- oracle_03
BEGIN TRY
   CREATE LOGIN [oracle_03] WITH PASSWORD='oracle_03',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[oracle_04].sql
GO
-- oracle_04
BEGIN TRY
   CREATE LOGIN [oracle_04] WITH PASSWORD='oracle_04',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[rmancilla].sql
GO
-- rmancilla
BEGIN TRY
   CREATE LOGIN [rmancilla] WITH PASSWORD='rmancilla',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[rperez].sql
GO
-- rperez
BEGIN TRY
   CREATE LOGIN [rperez] WITH PASSWORD='rperez',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[ruribe].sql
GO
-- ruribe
BEGIN TRY
   CREATE LOGIN [ruribe] WITH PASSWORD='ruribe',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[sa].sql
GO
-- sa
BEGIN TRY
   CREATE LOGIN [sa] WITH PASSWORD='sa',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[Sermalu1].sql
GO
-- Sermalu1
BEGIN TRY
   CREATE LOGIN [Sermalu1] WITH PASSWORD='Sermalu1',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [Swsnew],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[Sermalu2].sql
GO
-- Sermalu2
BEGIN TRY
   CREATE LOGIN [Sermalu2] WITH PASSWORD='Sermalu2',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [Swsnew],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[Sermalu3].sql
GO
-- Sermalu3
BEGIN TRY
   CREATE LOGIN [Sermalu3] WITH PASSWORD='Sermalu3',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [Swsnew],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[SKYLAB_AdmPlataforma].sql
GO
-- SKYLAB\AdmPlataforma
BEGIN TRY
   CREATE LOGIN [SKYLAB\AdmPlataforma] FROM WINDOWS WITH
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[SKYLAB_nhuenul].sql
GO
-- SKYLAB\nhuenul
BEGIN TRY
   CREATE LOGIN [SKYLAB\nhuenul] FROM WINDOWS WITH
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[SKYLAB_rperez].sql
GO
-- SKYLAB\rperez
BEGIN TRY
   CREATE LOGIN [SKYLAB\rperez] FROM WINDOWS WITH
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[SKYLAB_svasquez].sql
GO
-- SKYLAB\svasquez
BEGIN TRY
   CREATE LOGIN [SKYLAB\svasquez] FROM WINDOWS WITH
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[SKYLAB_usr_rojo_s2].sql
GO
-- SKYLAB\usr_rojo_s2
BEGIN TRY
   CREATE LOGIN [SKYLAB\usr_rojo_s2] FROM WINDOWS WITH
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[SKYLAB_usr_rojo_s3].sql
GO
-- SKYLAB\usr_rojo_s3
BEGIN TRY
   CREATE LOGIN [SKYLAB\usr_rojo_s3] FROM WINDOWS WITH
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[SKYLAB_usr_rojo_s5].sql
GO
-- SKYLAB\usr_rojo_s5
BEGIN TRY
   CREATE LOGIN [SKYLAB\usr_rojo_s5] FROM WINDOWS WITH
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[SKYLAB_usr_xemantics_01].sql
GO
-- SKYLAB\usr_xemantics_01
BEGIN TRY
   CREATE LOGIN [SKYLAB\usr_xemantics_01] FROM WINDOWS WITH
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[snman].sql
GO
-- snman
BEGIN TRY
   CREATE LOGIN [snman] WITH PASSWORD='snman',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [Snman2000],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[svasquez].sql
GO
-- svasquez
BEGIN TRY
   CREATE LOGIN [svasquez] WITH PASSWORD='svasquez',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[svillalobos].sql
GO
-- svillalobos
BEGIN TRY
   CREATE LOGIN [svillalobos] WITH PASSWORD='svillalobos',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ft3],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[usr_pragma_01].sql
GO
-- usr_pragma_01
BEGIN TRY
   CREATE LOGIN [usr_pragma_01] WITH PASSWORD='usr_pragma_01',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [Swsnew],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[usr_pragma_02].sql
GO
-- usr_pragma_02
BEGIN TRY
   CREATE LOGIN [usr_pragma_02] WITH PASSWORD='usr_pragma_02',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [Swsnew],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[usr_pragma_03].sql
GO
-- usr_pragma_03
BEGIN TRY
   CREATE LOGIN [usr_pragma_03] WITH PASSWORD='usr_pragma_03',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [Swsnew],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[usr_rojo_db1].sql
GO
-- usr_rojo_db1
BEGIN TRY
   CREATE LOGIN [usr_rojo_db1] WITH PASSWORD='usr_rojo_db1',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[usr_soaint_01].sql
GO
-- usr_soaint_01
BEGIN TRY
   CREATE LOGIN [usr_soaint_01] WITH PASSWORD='usr_soaint_01',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [NonStop],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[usr_soaint_02].sql
GO
-- usr_soaint_02
BEGIN TRY
   CREATE LOGIN [usr_soaint_02] WITH PASSWORD='usr_soaint_02',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [NonStop],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[usr_soaint_03].sql
GO
-- usr_soaint_03
BEGIN TRY
   CREATE LOGIN [usr_soaint_03] WITH PASSWORD='usr_soaint_03',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [NonStop],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[usr_soaint_04].sql
GO
-- usr_soaint_04
BEGIN TRY
   CREATE LOGIN [usr_soaint_04] WITH PASSWORD='usr_soaint_04',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [NonStop],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[usr_soaint_05].sql
GO
-- usr_soaint_05
BEGIN TRY
   CREATE LOGIN [usr_soaint_05] WITH PASSWORD='usr_soaint_05',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [NonStop],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[usr_soaint_06].sql
GO
-- usr_soaint_06
BEGIN TRY
   CREATE LOGIN [usr_soaint_06] WITH PASSWORD='usr_soaint_06',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [NonStop],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[usuario].sql
GO
-- usuario
BEGIN TRY
   CREATE LOGIN [usuario] WITH PASSWORD='usuario',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [master],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[vsolar].sql
GO
-- vsolar
BEGIN TRY
   CREATE LOGIN [vsolar] WITH PASSWORD='vsolar',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [AdmDBA],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH

GO
--SqlScripter----[webuser].sql
GO
-- webuser
BEGIN TRY
   CREATE LOGIN [webuser] WITH PASSWORD='webuser',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [Swsnew],
          DEFAULT_LANGUAGE = [us_english]
END TRY
BEGIN CATCH
   DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE()

   IF ((ERROR_NUMBER() <> 15025) AND -- The server principal already exists
       (ERROR_NUMBER() <> 15401))   -- Windows NT user or group not found
       RAISERROR (@MSG,16,1)
   PRINT @MSG
END CATCH
