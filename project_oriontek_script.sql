USE [master]
GO
/****** Object:  Database [project_oriontek]    Script Date: 15/06/2021 20:21:45 ******/
CREATE DATABASE [project_oriontek]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project_oriontek', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\project_oriontek.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'project_oriontek_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\project_oriontek_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [project_oriontek] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project_oriontek].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project_oriontek] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project_oriontek] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project_oriontek] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project_oriontek] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project_oriontek] SET ARITHABORT OFF 
GO
ALTER DATABASE [project_oriontek] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [project_oriontek] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project_oriontek] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project_oriontek] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project_oriontek] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project_oriontek] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project_oriontek] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project_oriontek] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project_oriontek] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project_oriontek] SET  ENABLE_BROKER 
GO
ALTER DATABASE [project_oriontek] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project_oriontek] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project_oriontek] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project_oriontek] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project_oriontek] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project_oriontek] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project_oriontek] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project_oriontek] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [project_oriontek] SET  MULTI_USER 
GO
ALTER DATABASE [project_oriontek] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project_oriontek] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project_oriontek] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project_oriontek] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [project_oriontek] SET DELAYED_DURABILITY = DISABLED 
GO
USE [project_oriontek]
GO
/****** Object:  Table [dbo].[client]    Script Date: 15/06/2021 20:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Number] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[directions]    Script Date: 15/06/2021 20:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[directions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[direction] [varchar](50) NULL,
	[Id_client] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[client] ON 

INSERT [dbo].[client] ([Id], [Name], [LastName], [Number]) VALUES (2, N'Juan', N'Perez', N'8095689235')
INSERT [dbo].[client] ([Id], [Name], [LastName], [Number]) VALUES (7, N'pedro', N'Corripio', N'8258465238')
INSERT [dbo].[client] ([Id], [Name], [LastName], [Number]) VALUES (8, N'Angel', N'romero', N'8096532698')
SET IDENTITY_INSERT [dbo].[client] OFF
SET IDENTITY_INSERT [dbo].[directions] ON 

INSERT [dbo].[directions] ([Id], [direction], [Id_client]) VALUES (3, N'Calle 26', 2)
SET IDENTITY_INSERT [dbo].[directions] OFF
ALTER TABLE [dbo].[directions]  WITH CHECK ADD FOREIGN KEY([Id_client])
REFERENCES [dbo].[client] ([Id])
GO
USE [master]
GO
ALTER DATABASE [project_oriontek] SET  READ_WRITE 
GO
