
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
--SqlScripter----[atapia].sql
GO
-- atapia
BEGIN TRY
   CREATE LOGIN [atapia] WITH PASSWORD='atapia',
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
--SqlScripter----[ddelgado].sql
GO
-- ddelgado
BEGIN TRY
   CREATE LOGIN [ddelgado] WITH PASSWORD='ddelgado',
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
--SqlScripter----[devar03].sql
GO
-- devar03
BEGIN TRY
   CREATE LOGIN [devar03] WITH PASSWORD='devar03',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [NonStop_int],
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
--SqlScripter----[distributor_admin].sql
GO
-- distributor_admin
BEGIN TRY
   CREATE LOGIN [distributor_admin] WITH PASSWORD='distributor_admin',
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
--SqlScripter----[lnino].sql
GO
-- lnino
BEGIN TRY
   CREATE LOGIN [lnino] WITH PASSWORD='lnino',
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
--SqlScripter----[ope_ft3_pbs].sql
GO
-- ope_ft3_pbs
BEGIN TRY
   CREATE LOGIN [ope_ft3_pbs] WITH PASSWORD='ope_ft3_pbs',
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
--SqlScripter----[ope_gestionsis].sql
GO
-- ope_gestionsis
BEGIN TRY
   CREATE LOGIN [ope_gestionsis] WITH PASSWORD='ope_gestionsis',
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
--SqlScripter----[ope_gsis].sql
GO
-- ope_gsis
BEGIN TRY
   CREATE LOGIN [ope_gsis] WITH PASSWORD='ope_gsis',
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
--SqlScripter----[ope_hostmonitor].sql
GO
-- ope_hostmonitor
BEGIN TRY
   CREATE LOGIN [ope_hostmonitor] WITH PASSWORD='ope_hostmonitor',
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
--SqlScripter----[Ope_imperva_SqlServer].sql
GO
-- Ope_imperva_SqlServer
BEGIN TRY
   CREATE LOGIN [Ope_imperva_SqlServer] WITH PASSWORD='Ope_imperva_SqlServer',
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
--SqlScripter----[ope_intercajas_pbs].sql
GO
-- ope_intercajas_pbs
BEGIN TRY
   CREATE LOGIN [ope_intercajas_pbs] WITH PASSWORD='ope_intercajas_pbs',
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
--SqlScripter----[ope_intercajasdesarrollo].sql
GO
-- ope_intercajasdesarrollo
BEGIN TRY
   CREATE LOGIN [ope_intercajasdesarrollo] WITH PASSWORD='ope_intercajasdesarrollo',
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
--SqlScripter----[ope_isokey].sql
GO
-- ope_isokey
BEGIN TRY
   CREATE LOGIN [ope_isokey] WITH PASSWORD='ope_isokey',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [ISOKEYNET_TEST],
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
--SqlScripter----[ope_rational].sql
GO
-- ope_rational
BEGIN TRY
   CREATE LOGIN [ope_rational] WITH PASSWORD='ope_rational',
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
--SqlScripter----[ope_replica].sql
GO
-- ope_replica
BEGIN TRY
   CREATE LOGIN [ope_replica] WITH PASSWORD='ope_replica',
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
--SqlScripter----[ope_rojo_db1].sql
GO
-- ope_rojo_db1
BEGIN TRY
   CREATE LOGIN [ope_rojo_db1] WITH PASSWORD='ope_rojo_db1',
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
--SqlScripter----[ope_scenter].sql
GO
-- ope_scenter
BEGIN TRY
   CREATE LOGIN [ope_scenter] WITH PASSWORD='ope_scenter',
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
--SqlScripter----[ope_tenable].sql
GO
-- ope_tenable
BEGIN TRY
   CREATE LOGIN [ope_tenable] WITH PASSWORD='ope_tenable',
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
--SqlScripter----[ope_TransformadorDSF ].sql
GO
-- ope_TransformadorDSF 
BEGIN TRY
   CREATE LOGIN [ope_TransformadorDSF ] WITH PASSWORD='ope_TransformadorDSF ',
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
--SqlScripter----[ope_xemantics].sql
GO
-- ope_xemantics
BEGIN TRY
   CREATE LOGIN [ope_xemantics] WITH PASSWORD='ope_xemantics',
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
--SqlScripter----[plopez].sql
GO
-- plopez
BEGIN TRY
   CREATE LOGIN [plopez] WITH PASSWORD='plopez',
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
--SqlScripter----[Pru_Assessmentsys].sql
GO
-- Pru_Assessmentsys
BEGIN TRY
   CREATE LOGIN [Pru_Assessmentsys] WITH PASSWORD='Pru_Assessmentsys',
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
--SqlScripter----[pru_cyb_db].sql
GO
-- pru_cyb_db
BEGIN TRY
   CREATE LOGIN [pru_cyb_db] WITH PASSWORD='pru_cyb_db',
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
--SqlScripter----[pru_splunk].sql
GO
-- pru_splunk
BEGIN TRY
   CREATE LOGIN [pru_splunk] WITH PASSWORD='pru_splunk',
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
--SqlScripter----[SKYLAB_Pru_Assessmentsys].sql
GO
-- SKYLAB\Pru_Assessmentsys
BEGIN TRY
   CREATE LOGIN [SKYLAB\Pru_Assessmentsys] FROM WINDOWS WITH
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
--SqlScripter----[SKYLAB_RTCComponentUniversalServices].sql
GO
-- SKYLAB\RTCComponentUniversalServices
BEGIN TRY
   CREATE LOGIN [SKYLAB\RTCComponentUniversalServices] FROM WINDOWS WITH
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
--SqlScripter----[SKYLAB_RTCHSUniversalServices].sql
GO
-- SKYLAB\RTCHSUniversalServices
BEGIN TRY
   CREATE LOGIN [SKYLAB\RTCHSUniversalServices] FROM WINDOWS WITH
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
--SqlScripter----[SKYLAB_RTCUniversalConfigReplicator].sql
GO
-- SKYLAB\RTCUniversalConfigReplicator
BEGIN TRY
   CREATE LOGIN [SKYLAB\RTCUniversalConfigReplicator] FROM WINDOWS WITH
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
--SqlScripter----[SKYLAB_RTCUniversalReadOnlyAdmins].sql
GO
-- SKYLAB\RTCUniversalReadOnlyAdmins
BEGIN TRY
   CREATE LOGIN [SKYLAB\RTCUniversalReadOnlyAdmins] FROM WINDOWS WITH
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
--SqlScripter----[SKYLAB_RTCUniversalServerAdmins].sql
GO
-- SKYLAB\RTCUniversalServerAdmins
BEGIN TRY
   CREATE LOGIN [SKYLAB\RTCUniversalServerAdmins] FROM WINDOWS WITH
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
--SqlScripter----[soaint07].sql
GO
-- soaint07
BEGIN TRY
   CREATE LOGIN [soaint07] WITH PASSWORD='soaint07',
          CHECK_EXPIRATION = OFF,
          CHECK_POLICY = OFF,
          DEFAULT_DATABASE = [NonStop_ext],
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
--SqlScripter----[usr_rojo_db1].sql
GO
-- usr_rojo_db1
BEGIN TRY
   CREATE LOGIN [usr_rojo_db1] WITH PASSWORD='usr_rojo_db1',
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
--SqlScripter----[usuarioFW2].sql
GO
-- usuarioFW2
BEGIN TRY
   CREATE LOGIN [usuarioFW2] WITH PASSWORD='usuarioFW2',
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

GO
--SqlScripter----[yguerrero].sql
GO
-- yguerrero
BEGIN TRY
   CREATE LOGIN [yguerrero] WITH PASSWORD='yguerrero',
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
