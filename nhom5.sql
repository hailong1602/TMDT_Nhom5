USE [master]
GO
/****** Object:  Database [blazingshop]    Script Date: 5/20/2022 9:53:33 PM ******/
CREATE DATABASE [blazingshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'blazingshop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\blazingshop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'blazingshop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\blazingshop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [blazingshop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [blazingshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [blazingshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [blazingshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [blazingshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [blazingshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [blazingshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [blazingshop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [blazingshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [blazingshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [blazingshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [blazingshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [blazingshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [blazingshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [blazingshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [blazingshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [blazingshop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [blazingshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [blazingshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [blazingshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [blazingshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [blazingshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [blazingshop] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [blazingshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [blazingshop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [blazingshop] SET  MULTI_USER 
GO
ALTER DATABASE [blazingshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [blazingshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [blazingshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [blazingshop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [blazingshop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [blazingshop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [blazingshop] SET QUERY_STORE = OFF
GO
USE [blazingshop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/20/2022 9:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/20/2022 9:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[Icon] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editions]    Script Date: 5/20/2022 9:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Editions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/20/2022 9:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[IsPublic] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateUpdated] [datetime2](7) NULL,
	[Views] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVariant]    Script Date: 5/20/2022 9:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariant](
	[ProductId] [int] NOT NULL,
	[EditionId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[OriginalPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ProductVariant] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[EditionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stats]    Script Date: 5/20/2022 9:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Visits] [int] NOT NULL,
	[LastVisit] [datetime2](7) NULL,
 CONSTRAINT [PK_Stats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/20/2022 9:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] NOT NULL,
	[username] [nchar](10) NOT NULL,
	[password] [nchar](10) NOT NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 5/20/2022 9:53:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVariant_EditionId]    Script Date: 5/20/2022 9:53:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductVariant_EditionId] ON [dbo].[ProductVariant]
(
	[EditionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariant_Editions_EditionId] FOREIGN KEY([EditionId])
REFERENCES [dbo].[Editions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK_ProductVariant_Editions_EditionId]
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariant_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK_ProductVariant_Products_ProductId]
GO
USE [master]
GO
ALTER DATABASE [blazingshop] SET  READ_WRITE 
GO
