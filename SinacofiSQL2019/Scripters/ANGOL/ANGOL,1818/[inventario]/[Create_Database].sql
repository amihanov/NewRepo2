﻿USE master
GO

-- Drop Database inventario
IF EXISTS (select name from master.dbo.sysdatabases where name = N'$(db)')
BEGIN
	PRINT 'DROP DATABASE [$(db)]'

	ALTER DATABASE [$(db)] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
	ALTER DATABASE [$(db)] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE [$(db)]
END  
GO

CREATE DATABASE [$(db)] ON PRIMARY
( NAME = N'$(db)_PRIMARY', FILENAME = N'$(RutaPrimary)\$(db)\$(db)_PRIMARY.mdf', SIZE = 20MB, MAXSIZE = UNLIMITED, FILEGROWTH = 10MB)
LOG ON
( NAME = N'$(db)_LOG', FILENAME = N'$(RutaLog)\$(db)\$(db)_LOG.ldf', SIZE = 10MB , MAXSIZE = UNLIMITED, FILEGROWTH = 10MB)
COLLATE SQL_Latin1_General_CP1_CI_AS
GO

IF FULLTEXTSERVICEPROPERTY('isfulltextinstalled') = 1
BEGIN
   EXEC [$(db)].[dbo].[sp_fulltext_database] @action = 'disable'
END
--Settings
--ALTER DATABASE [$(db)] SET COMPATIBILITY_LEVEL = 100
ALTER DATABASE [$(db)] SET ANSI_NULL_DEFAULT OFF 
ALTER DATABASE [$(db)] SET ANSI_NULLS OFF 
ALTER DATABASE [$(db)] SET ANSI_PADDING OFF 
ALTER DATABASE [$(db)] SET ANSI_WARNINGS OFF 
ALTER DATABASE [$(db)] SET ARITHABORT OFF 
ALTER DATABASE [$(db)] SET AUTO_CLOSE OFF 
ALTER DATABASE [$(db)] SET AUTO_CREATE_STATISTICS ON 
ALTER DATABASE [$(db)] SET AUTO_SHRINK OFF 
ALTER DATABASE [$(db)] SET AUTO_UPDATE_STATISTICS ON 
ALTER DATABASE [$(db)] SET CURSOR_CLOSE_ON_COMMIT OFF 
ALTER DATABASE [$(db)] SET CURSOR_DEFAULT  GLOBAL 
ALTER DATABASE [$(db)] SET CONCAT_NULL_YIELDS_NULL OFF 
ALTER DATABASE [$(db)] SET NUMERIC_ROUNDABORT OFF 
ALTER DATABASE [$(db)] SET QUOTED_IDENTIFIER OFF 
ALTER DATABASE [$(db)] SET RECURSIVE_TRIGGERS OFF 
ALTER DATABASE [$(db)] SET DISABLE_BROKER 
ALTER DATABASE [$(db)] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
ALTER DATABASE [$(db)] SET DATE_CORRELATION_OPTIMIZATION OFF 
ALTER DATABASE [$(db)] SET TRUSTWORTHY OFF 
ALTER DATABASE [$(db)] SET ALLOW_SNAPSHOT_ISOLATION ON 
ALTER DATABASE [$(db)] SET PARAMETERIZATION SIMPLE 
ALTER DATABASE [$(db)] SET READ_COMMITTED_SNAPSHOT OFF 
ALTER DATABASE [$(db)] SET HONOR_BROKER_PRIORITY OFF 
ALTER DATABASE [$(db)] SET READ_WRITE 
ALTER DATABASE [$(db)] SET RECOVERY SIMPLE 
ALTER DATABASE [$(db)] SET MULTI_USER 
ALTER DATABASE [$(db)] SET PAGE_VERIFY CHECKSUM  
ALTER DATABASE [$(db)] SET DB_CHAINING ON
GO

