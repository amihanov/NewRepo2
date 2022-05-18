
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
--SqlScripter----[dperez].sql
GO
-- dperez
BEGIN TRY
   CREATE LOGIN [dperez] WITH PASSWORD='dperez',
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
--SqlScripter----[jarce].sql
GO
-- jarce
BEGIN TRY
   CREATE LOGIN [jarce] WITH PASSWORD='jarce',
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
--SqlScripter----[ocardenas].sql
GO
-- ocardenas
BEGIN TRY
   CREATE LOGIN [ocardenas] WITH PASSWORD='ocardenas',
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
--SqlScripter----[ope_appsbif].sql
GO
-- ope_appsbif
BEGIN TRY
   CREATE LOGIN [ope_appsbif] WITH PASSWORD='ope_appsbif',
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
--SqlScripter----[ope_intercajasBD].sql
GO
-- ope_intercajasBD
BEGIN TRY
   CREATE LOGIN [ope_intercajasBD] WITH PASSWORD='ope_intercajasBD',
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
--SqlScripter----[SKYLAB_Admplataforma].sql
GO
-- SKYLAB\Admplataforma
BEGIN TRY
   CREATE LOGIN [SKYLAB\Admplataforma] FROM WINDOWS WITH
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
--SqlScripter----[SKYLAB_ope_sql_neg].sql
GO
-- SKYLAB\ope_sql_neg
BEGIN TRY
   CREATE LOGIN [SKYLAB\ope_sql_neg] FROM WINDOWS WITH
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
