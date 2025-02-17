USE [master]
GO
/****** Object:  Database [BooksService]    Script Date: 08.11.2024 16:02:40 ******/
CREATE DATABASE [BooksService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BooksService', FILENAME = N'C:\Users\SveTilo\BooksService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BooksService_log', FILENAME = N'C:\Users\SveTilo\BooksService_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BooksService] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BooksService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BooksService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BooksService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BooksService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BooksService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BooksService] SET ARITHABORT OFF 
GO
ALTER DATABASE [BooksService] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BooksService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BooksService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BooksService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BooksService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BooksService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BooksService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BooksService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BooksService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BooksService] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BooksService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BooksService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BooksService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BooksService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BooksService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BooksService] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BooksService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BooksService] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BooksService] SET  MULTI_USER 
GO
ALTER DATABASE [BooksService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BooksService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BooksService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BooksService] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BooksService] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BooksService] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BooksService] SET QUERY_STORE = OFF
GO
USE [BooksService]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 08.11.2024 16:02:41 ******/
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
/****** Object:  Table [dbo].[Books]    Script Date: 08.11.2024 16:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NULL,
	[PublicationYear] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[AvailableCopies] [int] NULL,
	[Genre_id] [int] NOT NULL,
	[Readers_id] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 08.11.2024 16:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241101131414_Migrations', N'8.0.8')
GO
/****** Object:  Index [IX_Books_Genre_id]    Script Date: 08.11.2024 16:02:41 ******/
CREATE NONCLUSTERED INDEX [IX_Books_Genre_id] ON [dbo].[Books]
(
	[Genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Genres_Genre_id] FOREIGN KEY([Genre_id])
REFERENCES [dbo].[Genres] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Genres_Genre_id]
GO
USE [master]
GO
ALTER DATABASE [BooksService] SET  READ_WRITE 
GO
