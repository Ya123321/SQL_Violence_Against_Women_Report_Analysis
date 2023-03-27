USE [master]
GO

/****** Object:  Database [violence_against_women]    Script Date: 27/03/2023 21:15:41 ******/
CREATE DATABASE [violence_against_women]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'violence_against_women', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\violence_against_women.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'violence_against_women_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\violence_against_women_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [violence_against_women] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [violence_against_women].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [violence_against_women] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [violence_against_women] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [violence_against_women] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [violence_against_women] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [violence_against_women] SET ARITHABORT OFF 
GO

ALTER DATABASE [violence_against_women] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [violence_against_women] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [violence_against_women] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [violence_against_women] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [violence_against_women] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [violence_against_women] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [violence_against_women] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [violence_against_women] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [violence_against_women] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [violence_against_women] SET  DISABLE_BROKER 
GO

ALTER DATABASE [violence_against_women] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [violence_against_women] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [violence_against_women] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [violence_against_women] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [violence_against_women] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [violence_against_women] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [violence_against_women] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [violence_against_women] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [violence_against_women] SET  MULTI_USER 
GO

ALTER DATABASE [violence_against_women] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [violence_against_women] SET DB_CHAINING OFF 
GO

ALTER DATABASE [violence_against_women] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [violence_against_women] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [violence_against_women] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [violence_against_women] SET  READ_WRITE 
GO


