
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
--SqlScripter----[NT SERVICE_MSSQL$PWCSQL].sql
GO
-- NT SERVICE\MSSQL$PWCSQL
BEGIN TRY
   CREATE LOGIN [NT SERVICE\MSSQL$PWCSQL] FROM WINDOWS WITH
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
--SqlScripter----[NT SERVICE_SQLAgent$PWCSQL].sql
GO
-- NT SERVICE\SQLAgent$PWCSQL
BEGIN TRY
   CREATE LOGIN [NT SERVICE\SQLAgent$PWCSQL] FROM WINDOWS WITH
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
--SqlScripter----[NT SERVICE_SQLTELEMETRY$PWCSQL].sql
GO
-- NT SERVICE\SQLTELEMETRY$PWCSQL
BEGIN TRY
   CREATE LOGIN [NT SERVICE\SQLTELEMETRY$PWCSQL] FROM WINDOWS WITH
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
