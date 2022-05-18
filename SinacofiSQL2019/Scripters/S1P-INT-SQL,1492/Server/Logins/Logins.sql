
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
--SqlScripter----[ope_dba].sql
GO
-- ope_dba
BEGIN TRY
   CREATE LOGIN [ope_dba] WITH PASSWORD='ope_dba',
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
--SqlScripter----[ope_docrel].sql
GO
-- ope_docrel
BEGIN TRY
   CREATE LOGIN [ope_docrel] WITH PASSWORD='ope_docrel',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [docrel],
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
--SqlScripter----[ope_isokey].sql
GO
-- ope_isokey
BEGIN TRY
   CREATE LOGIN [ope_isokey] WITH PASSWORD='ope_isokey',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ISOKEYNET],
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
--SqlScripter----[ope_monitoreonagios].sql
GO
-- ope_monitoreonagios
BEGIN TRY
   CREATE LOGIN [ope_monitoreonagios] WITH PASSWORD='ope_monitoreonagios',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [Monitor],
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
--SqlScripter----[ope_reporteharvest].sql
GO
-- ope_reporteharvest
BEGIN TRY
   CREATE LOGIN [ope_reporteharvest] WITH PASSWORD='ope_reporteharvest',
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
--SqlScripter----[sa].sql
GO
-- sa
BEGIN TRY
   CREATE LOGIN [sa] WITH PASSWORD='sa',
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
--SqlScripter----[SKYLAB_ope_clus_int].sql
GO
-- SKYLAB\ope_clus_int
BEGIN TRY
   CREATE LOGIN [SKYLAB\ope_clus_int] FROM WINDOWS WITH
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
--SqlScripter----[SKYLAB_ope_respaldo].sql
GO
-- SKYLAB\ope_respaldo
BEGIN TRY
   CREATE LOGIN [SKYLAB\ope_respaldo] FROM WINDOWS WITH
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
--SqlScripter----[SKYLAB_ope_sql_int].sql
GO
-- SKYLAB\ope_sql_int
BEGIN TRY
   CREATE LOGIN [SKYLAB\ope_sql_int] FROM WINDOWS WITH
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
