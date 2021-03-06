USE [master]
GO
/****** Object:  Database [AceFlix]    Script Date: 22.05.2022 15:19:43 ******/
CREATE DATABASE [AceFlix]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AceFlix', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AceFlix.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AceFlix_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AceFlix_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AceFlix] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AceFlix].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AceFlix] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AceFlix] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AceFlix] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AceFlix] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AceFlix] SET ARITHABORT OFF 
GO
ALTER DATABASE [AceFlix] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AceFlix] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AceFlix] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AceFlix] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AceFlix] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AceFlix] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AceFlix] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AceFlix] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AceFlix] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AceFlix] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AceFlix] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AceFlix] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AceFlix] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AceFlix] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AceFlix] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AceFlix] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AceFlix] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AceFlix] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AceFlix] SET  MULTI_USER 
GO
ALTER DATABASE [AceFlix] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AceFlix] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AceFlix] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AceFlix] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AceFlix] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AceFlix] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AceFlix] SET QUERY_STORE = OFF
GO
USE [AceFlix]
GO
/****** Object:  Table [dbo].[Basrol]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basrol](
	[Basrol_ID] [int] IDENTITY(1,1) NOT NULL,
	[BasrolAdi] [nvarchar](50) NOT NULL,
	[BasrolSoyadi] [nvarchar](50) NOT NULL,
	[DoğumTarihi] [date] NOT NULL,
	[Cinsiyet] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Basrol_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BasrolDetay]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasrolDetay](
	[Film_ID] [int] NOT NULL,
	[Dizi_ID] [int] NOT NULL,
	[Basrol_ID] [int] NOT NULL,
 CONSTRAINT [PK_BasrolDetay] PRIMARY KEY CLUSTERED 
(
	[Film_ID] ASC,
	[Dizi_ID] ASC,
	[Basrol_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dizi]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dizi](
	[Dizi_ID] [int] IDENTITY(1,1) NOT NULL,
	[DiziAdi] [nvarchar](50) NOT NULL,
	[Kategori_ID] [int] NOT NULL,
	[DiziSüresi] [time](7) NOT NULL,
	[Açıklama] [nvarchar](1000) NOT NULL,
	[OrijinalDil_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Dizi_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiziDetay]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiziDetay](
	[DiziDetay_ID] [int] IDENTITY(1,1) NOT NULL,
	[IMDB_Puani] [int] NOT NULL,
	[Ülke] [nvarchar](50) NOT NULL,
	[CıkısTarihi] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DiziDetay_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film](
	[Film_ID] [int] IDENTITY(1,1) NOT NULL,
	[FilmAdi] [nvarchar](50) NOT NULL,
	[Kategori_ID] [int] NOT NULL,
	[FilmSüresi] [time](7) NOT NULL,
	[Açıklama] [nvarchar](1000) NOT NULL,
	[OrijinalDil_ID] [int] NOT NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[Film_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmDetay]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmDetay](
	[FilmDetay_ID] [int] IDENTITY(1,1) NOT NULL,
	[IMDB_Puani] [int] NOT NULL,
	[Film_Bütcesi] [decimal](14, 2) NOT NULL,
	[Ülke] [nvarchar](50) NOT NULL,
	[CıkısTarihi] [date] NOT NULL,
 CONSTRAINT [PK__FilmDeta__5B63DDE01C642CBA] PRIMARY KEY CLUSTERED 
(
	[FilmDetay_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fragman]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fragman](
	[Fragman_ID] [int] IDENTITY(1,1) NOT NULL,
	[Film_ID] [int] NOT NULL,
	[Dizi_ID] [int] NOT NULL,
	[FragmanTarihi] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Fragman_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[Kategori_ID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Kategori_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KategoriDetay]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KategoriDetay](
	[Film_ID] [int] NOT NULL,
	[Dizi_ID] [int] NOT NULL,
	[Kategori_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Film_ID] ASC,
	[Dizi_ID] ASC,
	[Kategori_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanıcı]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanıcı](
	[Kullanıcı_ID] [int] IDENTITY(1,1) NOT NULL,
	[KullanıcıAdi] [nvarchar](50) NOT NULL,
	[KullanıcıSoyadi] [nvarchar](50) NOT NULL,
	[DogumTarihi] [date] NOT NULL,
	[Adres] [nvarchar](250) NOT NULL,
	[Telefon] [nvarchar](11) NOT NULL,
	[Cinsiyet] [bit] NOT NULL,
	[Ülke] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Kullanıc__CF63E074E0DA578C] PRIMARY KEY CLUSTERED 
(
	[Kullanıcı_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullaniciGiris]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciGiris](
	[KullanıcıGiris_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[Sifre] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK__Kullanic__89C94B9EF6258EB7] PRIMARY KEY CLUSTERED 
(
	[KullanıcıGiris_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odemeler]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odemeler](
	[Odeme_ID] [int] IDENTITY(1,1) NOT NULL,
	[KartTipi] [bit] NOT NULL,
	[KartNo] [nvarchar](16) NOT NULL,
	[KartSonKullanmaTarihi] [date] NOT NULL,
	[KartÜzeriİsim] [nvarchar](50) NOT NULL,
	[KartCVC] [nvarchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Odeme_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrijinalDil]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrijinalDil](
	[OrijinalDil_ID] [int] IDENTITY(1,1) NOT NULL,
	[DilAdi] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrijinalDil_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oylama]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oylama](
	[Kullanıcı_ID] [int] IDENTITY(1,1) NOT NULL,
	[Dizi_ID] [int] NOT NULL,
	[Film_ID] [int] NOT NULL,
	[OylamaPuanı] [int] NOT NULL,
	[OylamaTarihi] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Kullanıcı_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oyuncular]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oyuncular](
	[Oyuncu_ID] [int] IDENTITY(1,1) NOT NULL,
	[OyuncuAdi] [nvarchar](50) NOT NULL,
	[OyuncuSoyadi] [nvarchar](50) NOT NULL,
	[Film_ID] [int] NOT NULL,
	[Dizi_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Oyuncu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ödüller]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ödüller](
	[Film_ID] [int] NOT NULL,
	[Dizi_ID] [int] NOT NULL,
	[OdülAdi] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Film_ID] ASC,
	[Dizi_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yönetmen]    Script Date: 22.05.2022 15:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yönetmen](
	[Yönetmen_ID] [int] IDENTITY(1,1) NOT NULL,
	[YönetmenAdi] [nvarchar](50) NOT NULL,
	[YönetmenSoyadi] [nvarchar](50) NOT NULL,
	[Film_ID] [int] NOT NULL,
	[Dizi_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Yönetmen_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Basrol] ON 

INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (1, N'Luke', N'Thackston', CAST(N'1993-11-11' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (2, N'Kurtis', N'Pafford', CAST(N'1984-03-19' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (3, N'Kevan', N'Fitzsymon', CAST(N'1974-08-23' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (4, N'Alana', N'Charopen', CAST(N'1993-08-29' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (5, N'Erin', N'Benedicte', CAST(N'1997-05-13' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (6, N'Melantha', N'Fogarty', CAST(N'1982-11-12' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (7, N'Georgia', N'Bandy', CAST(N'1997-12-09' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (8, N'Tally', N'Asling', CAST(N'1967-07-30' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (9, N'Jeremias', N'Rees', CAST(N'1976-08-18' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (10, N'Torie', N'Willisch', CAST(N'1993-07-28' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (11, N'Mella', N'Arkow', CAST(N'1989-03-13' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (12, N'Lilas', N'Colin', CAST(N'1969-05-01' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (13, N'Paxon', N'Meco', CAST(N'1965-06-18' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (14, N'Kelly', N'Linguard', CAST(N'1994-05-15' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (15, N'Modestia', N'Maureen', CAST(N'1996-01-11' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (16, N'Phillipe', N'Cranshaw', CAST(N'1993-04-06' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (17, N'Corbett', N'Gasquoine', CAST(N'1980-11-28' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (18, N'Tobias', N'Darragon', CAST(N'1999-01-12' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (19, N'Harlin', N'Conradsen', CAST(N'1980-04-24' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (20, N'Carlynne', N'McKibben', CAST(N'1989-01-31' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (21, N'Shay', N'Shellsheere', CAST(N'1992-05-11' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (22, N'Eve', N'Collidge', CAST(N'1974-09-29' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (23, N'Susann', N'Rochell', CAST(N'1989-08-29' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (24, N'Beatrice', N'Dilleway', CAST(N'1973-10-26' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (25, N'Sharl', N'Horsey', CAST(N'1993-05-25' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (26, N'Roseanna', N'Tomashov', CAST(N'1977-05-22' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (27, N'Meaghan', N'Dexter', CAST(N'1997-11-14' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (28, N'Aluino', N'Lowsely', CAST(N'1985-06-24' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (29, N'Ealasaid', N'Grisewood', CAST(N'1984-05-06' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (30, N'Gustavo', N'Hulson', CAST(N'1985-03-14' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (31, N'Emera', N'Greatrakes', CAST(N'1965-07-20' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (32, N'Isidro', N'Jeandet', CAST(N'1982-01-27' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (33, N'Rikki', N'Grogor', CAST(N'1974-06-10' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (34, N'Francene', N'Clemmey', CAST(N'1976-11-27' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (35, N'Rey', N'Crothers', CAST(N'1990-08-18' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (36, N'Baxter', N'Ickowicz', CAST(N'1975-09-02' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (37, N'Freemon', N'Manginot', CAST(N'1970-06-30' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (38, N'Damon', N'Kehoe', CAST(N'1997-06-06' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (39, N'Ericha', N'Faers', CAST(N'1965-09-06' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (40, N'Rayshell', N'Wickens', CAST(N'1999-08-27' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (41, N'Xever', N'Look', CAST(N'1995-02-09' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (42, N'Erma', N'Gerg', CAST(N'1982-07-17' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (43, N'Camile', N'Sizeland', CAST(N'1979-10-21' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (44, N'Ame', N'Marchello', CAST(N'1983-06-11' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (45, N'Karina', N'Beynon', CAST(N'1970-07-10' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (46, N'Janith', N'Slemming', CAST(N'1993-05-23' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (47, N'Weston', N'Kroger', CAST(N'1973-06-01' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (48, N'Thorn', N'Glison', CAST(N'1985-07-03' AS Date), 1)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (49, N'Thaddeus', N'Nardi', CAST(N'1998-09-16' AS Date), 0)
INSERT [dbo].[Basrol] ([Basrol_ID], [BasrolAdi], [BasrolSoyadi], [DoğumTarihi], [Cinsiyet]) VALUES (50, N'Garreth', N'Gilmore', CAST(N'1978-11-23' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Basrol] OFF
GO
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (1, 1, 1)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (2, 2, 2)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (3, 3, 3)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (4, 4, 4)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (5, 5, 5)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (6, 6, 6)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (7, 7, 7)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (8, 8, 8)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (9, 9, 9)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (10, 10, 10)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (11, 11, 11)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (12, 12, 12)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (13, 13, 13)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (14, 14, 14)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (15, 15, 15)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (16, 16, 16)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (17, 17, 17)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (18, 18, 18)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (19, 19, 19)
INSERT [dbo].[BasrolDetay] ([Film_ID], [Dizi_ID], [Basrol_ID]) VALUES (20, 20, 20)
GO
SET IDENTITY_INSERT [dbo].[Dizi] ON 

INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (1, N'Wyoming Renegades', 1, CAST(N'11:13:00' AS Time), N'Destruction of Ulnar Nerve, Percutaneous Endoscopic Approach', 1)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (2, N'', 2, CAST(N'05:17:00' AS Time), N'Bypass R Int Iliac Art to L Femor A w Synth Sub, Perc Endo', 2)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (3, N'Welcome to Dongmakgol', 3, CAST(N'08:05:00' AS Time), N'Restriction of Right Lacrimal Duct, Percutaneous Approach', 3)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (4, N'Borrowed Hearts', 4, CAST(N'11:54:00' AS Time), N'Removal of Drainage Device from Trachea, Via Opening', 4)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (5, N'Many Adventures of Winnie the Pooh, The', 5, CAST(N'15:57:00' AS Time), N'Restriction of Right Axillary Vein, Percutaneous Approach', 5)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (6, N'Aladdin', 6, CAST(N'16:40:00' AS Time), N'Reposition L Temporomandib Jt w Int Fix, Perc Endo', 6)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (7, N'Riders of Destiny', 7, CAST(N'21:04:00' AS Time), N'Removal of Spacer from Left Tarsal Joint, Perc Endo Approach', 7)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (8, N'Sgt. Kabukiman N.Y.P.D.', 8, CAST(N'04:32:00' AS Time), N'Control Bleeding in Left Lower Extremity, Perc Endo Approach', 8)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (9, N'Half a Loaf of Kung Fu', 9, CAST(N'05:47:00' AS Time), N'Drainage of R Low Extrem with Drain Dev, Perc Endo Approach', 9)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (10, N'Rabid', 10, CAST(N'16:55:00' AS Time), N'Destruction of Small Intestine, Perc Endo Approach', 10)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (11, N'CBGB', 11, CAST(N'08:31:00' AS Time), N'Drainage of Bi Sperm Cord with Drain Dev, Perc Endo Approach', 11)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (12, N'Sunny (Sseo-ni)', 12, CAST(N'16:26:00' AS Time), N'Bypass Left Axillary Artery to Lower Arm Vein, Open Approach', 12)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (13, N'Cyrano de Bergerac', 13, CAST(N'15:28:00' AS Time), N'Drainage of Oral Cavity and Throat, Percutaneous Approach', 13)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (14, N'Lilting', 14, CAST(N'07:36:00' AS Time), N'Excision of L Hand Subcu/Fascia, Perc Approach, Diagn', 14)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (15, N'Outlaw Blues', 15, CAST(N'00:44:00' AS Time), N'Revision of Int Fix in L Clavicle, Perc Approach', 15)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (16, N'Games People Play: New York', 16, CAST(N'20:46:00' AS Time), N'Insertion of Facet Stabl Dev into C-thor Jt, Perc Approach', 16)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (17, N'Riding the Bullet', 17, CAST(N'20:14:00' AS Time), N'Insert Infusion Dev in R Metacarpocarp Jt, Perc Endo', 17)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (18, N'RoboGeisha (Robo-geisha)', 18, CAST(N'18:56:00' AS Time), N'Excision of Right Axillary Vein, Perc Endo Approach', 18)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (19, N'Cardcaptor Sakura: The Sealed Card', 19, CAST(N'10:57:00' AS Time), N'Drainage of Right Ovary, Open Approach, Diagnostic', 19)
INSERT [dbo].[Dizi] ([Dizi_ID], [DiziAdi], [Kategori_ID], [DiziSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (20, N'Red River', 20, CAST(N'02:19:00' AS Time), N'Revision of Drainage Device in Right Ear, External Approach', 20)
SET IDENTITY_INSERT [dbo].[Dizi] OFF
GO
SET IDENTITY_INSERT [dbo].[DiziDetay] ON 

INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (1, 69, N'China', CAST(N'2011-05-03' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (2, 100, N'Nigeria', CAST(N'2002-08-28' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (3, 38, N'Portugal', CAST(N'2011-01-06' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (4, 61, N'Mexico', CAST(N'2002-07-06' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (5, 82, N'Kuwait', CAST(N'2010-09-18' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (6, 64, N'Uzbekistan', CAST(N'2005-12-12' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (7, 97, N'Nigeria', CAST(N'2011-10-03' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (8, 70, N'Indonesia', CAST(N'2006-03-23' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (9, 84, N'Russia', CAST(N'2011-02-02' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (10, 49, N'Brazil', CAST(N'2015-07-20' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (11, 29, N'Philippines', CAST(N'2008-05-18' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (12, 24, N'Japan', CAST(N'2006-02-06' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (13, 45, N'Poland', CAST(N'2000-11-21' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (14, 94, N'Thailand', CAST(N'2011-02-12' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (15, 71, N'China', CAST(N'2014-08-06' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (16, 92, N'Burkina Faso', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (17, 4, N'Indonesia', CAST(N'2020-05-29' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (18, 56, N'Argentina', CAST(N'2004-09-19' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (19, 37, N'Poland', CAST(N'2019-05-01' AS Date))
INSERT [dbo].[DiziDetay] ([DiziDetay_ID], [IMDB_Puani], [Ülke], [CıkısTarihi]) VALUES (20, 63, N'China', CAST(N'2007-08-04' AS Date))
SET IDENTITY_INSERT [dbo].[DiziDetay] OFF
GO
SET IDENTITY_INSERT [dbo].[Film] ON 

INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (1, N'Happinies', 1, CAST(N'10:58:00' AS Time), N'Dilation of Left Large Intestine, Percutaneous Endoscopic Approach', 1)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (2, N'Conjuring, The', 15, CAST(N'21:45:00' AS Time), N'Supplement Larynx with Nonautologous Tissue Substitute, Via Natural or Artificial Opening', 2)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (3, N'Dont Tell Anyone', 8, CAST(N'16:07:00' AS Time), N'Occlusion of Right Popliteal Artery with Intraluminal Device, Percutaneous Approach', 3)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (4, N'Fantastic Four, The', 7, CAST(N'20:41:00' AS Time), N'Transfer Chest Subcutaneous Tissue and Fascia with Skin and Subcutaneous Tissue, Open Approach', 4)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (5, N'Unspeakable Acts ', 5, CAST(N'04:58:00' AS Time), N'Insertion of Infusion Device into Vagina and Cul-de-sac, Via Natural or Artificial Opening Endoscopic', 5)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (6, N'Postman Always Rings Twice, The', 6, CAST(N'16:16:00' AS Time), N'Replacement of Face Skin with Autologous Tissue Substitute, Full Thickness, External Approach', 6)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (7, N'Days and Hours', 7, CAST(N'23:10:00' AS Time), N'Drainage of Left Lower Leg Tendon with Drainage Device, Percutaneous Approach', 7)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (8, N'Dracula', 8, CAST(N'20:28:00' AS Time), N'Excision of Skull, Percutaneous Approach, Diagnostic', 8)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (9, N'Hallam Foe', 9, CAST(N'06:18:00' AS Time), N'Resection of Upper Tooth, Multiple, Open Approach', 9)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (10, N'Count Three and Pray', 10, CAST(N'01:30:00' AS Time), N'Division of Right Upper Femur, Percutaneous Endoscopic Approach', 10)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (11, N'Twister', 11, CAST(N'08:18:00' AS Time), N'Reposition Superior Mesenteric Artery, Percutaneous Endoscopic Approach', 11)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (12, N'A Second Chance', 12, CAST(N'13:44:00' AS Time), N'Dilation of Right Subclavian Artery, Bifurcation, with Four or More Drug-eluting Intraluminal Devices, Percutaneous Approach', 12)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (13, N'Over Your Cities Grass Will Grow', 13, CAST(N'20:32:00' AS Time), N'Inspection of Right Tarsal Joint, Open Approach', 13)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (14, N'Beefcake', 14, CAST(N'08:19:00' AS Time), N'Replacement of Left Renal Artery with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach', 14)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (15, N'Adventures of Kitty', 15, CAST(N'06:41:00' AS Time), N'Reposition Right Greater Saphenous Vein, Open Approach', 15)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (16, N'Disaster Movie', 16, CAST(N'20:28:00' AS Time), N'Bypass Lower Esophagus to Cutaneous with Synthetic Substitute, Percutaneous Approach', 16)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (17, N'Winning Team, The', 17, CAST(N'11:07:00' AS Time), N'Removal of Spacer from Left Wrist Joint, Percutaneous Approach', 17)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (18, N'Loves of Pharaoh, The (Das Weib des Pharao)', 18, CAST(N'09:20:00' AS Time), N'Excision of Radial Nerve, Percutaneous Approach', 18)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (19, N'Hate ', 19, CAST(N'04:14:00' AS Time), N'Contact Radiation of Ureter', 19)
INSERT [dbo].[Film] ([Film_ID], [FilmAdi], [Kategori_ID], [FilmSüresi], [Açıklama], [OrijinalDil_ID]) VALUES (20, N'Johnny Express', 20, CAST(N'20:43:00' AS Time), N'Transfusion of Nonautologous Serum Albumin into Central Vein, Open Approach', 20)
SET IDENTITY_INSERT [dbo].[Film] OFF
GO
SET IDENTITY_INSERT [dbo].[FilmDetay] ON 

INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (1, 42, CAST(382889039.93 AS Decimal(14, 2)), N'Indonesia', CAST(N'1962-06-08' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (2, 89, CAST(354588006.41 AS Decimal(14, 2)), N'Luxembourg', CAST(N'1947-06-26' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (3, 97, CAST(60271358.33 AS Decimal(14, 2)), N'China', CAST(N'1965-11-08' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (4, 47, CAST(193141377.31 AS Decimal(14, 2)), N'Bulgaria', CAST(N'1968-10-18' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (5, 41, CAST(277109366.21 AS Decimal(14, 2)), N'Guatemala', CAST(N'1949-01-15' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (6, 16, CAST(211526920.29 AS Decimal(14, 2)), N'Bulgaria', CAST(N'1949-04-28' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (7, 83, CAST(69003153.43 AS Decimal(14, 2)), N'China', CAST(N'1993-08-23' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (8, 51, CAST(414832172.98 AS Decimal(14, 2)), N'China', CAST(N'1974-01-15' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (9, 61, CAST(337572390.65 AS Decimal(14, 2)), N'China', CAST(N'1946-07-04' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (10, 17, CAST(176814758.62 AS Decimal(14, 2)), N'China', CAST(N'1948-11-30' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (11, 21, CAST(87278565.52 AS Decimal(14, 2)), N'Japan', CAST(N'2012-11-19' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (12, 85, CAST(264181938.11 AS Decimal(14, 2)), N'Poland', CAST(N'1968-06-03' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (13, 41, CAST(209210941.95 AS Decimal(14, 2)), N'Japan', CAST(N'1988-05-23' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (14, 89, CAST(423463408.03 AS Decimal(14, 2)), N'Japan', CAST(N'1971-03-25' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (15, 69, CAST(237277200.38 AS Decimal(14, 2)), N'Vietnam', CAST(N'1996-10-05' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (16, 16, CAST(457440877.05 AS Decimal(14, 2)), N'Brazil', CAST(N'1991-04-22' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (17, 72, CAST(296371551.89 AS Decimal(14, 2)), N'Ukraine', CAST(N'2015-12-24' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (18, 90, CAST(94410740.29 AS Decimal(14, 2)), N'Peru', CAST(N'2003-10-14' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (19, 99, CAST(169323848.88 AS Decimal(14, 2)), N'Cameroon', CAST(N'1988-01-24' AS Date))
INSERT [dbo].[FilmDetay] ([FilmDetay_ID], [IMDB_Puani], [Film_Bütcesi], [Ülke], [CıkısTarihi]) VALUES (20, 71, CAST(17621268.03 AS Decimal(14, 2)), N'Palestinian Territory', CAST(N'1998-12-29' AS Date))
SET IDENTITY_INSERT [dbo].[FilmDetay] OFF
GO
SET IDENTITY_INSERT [dbo].[Fragman] ON 

INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (1, 1, 1, CAST(N'2021-10-17' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (2, 2, 2, CAST(N'2020-10-31' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (3, 3, 3, CAST(N'2001-08-01' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (4, 4, 4, CAST(N'2019-04-06' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (5, 5, 5, CAST(N'2020-05-29' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (6, 6, 6, CAST(N'2021-11-08' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (7, 7, 7, CAST(N'2009-12-20' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (8, 8, 8, CAST(N'2008-10-28' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (9, 9, 9, CAST(N'2000-07-21' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (10, 10, 10, CAST(N'2002-09-09' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (11, 11, 11, CAST(N'2004-06-28' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (12, 12, 12, CAST(N'2014-04-10' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (13, 13, 13, CAST(N'2015-02-27' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (14, 14, 14, CAST(N'2004-07-06' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (15, 15, 15, CAST(N'2016-07-12' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (16, 16, 16, CAST(N'2004-05-15' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (17, 17, 17, CAST(N'2013-12-23' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (18, 18, 18, CAST(N'2000-08-02' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (19, 19, 19, CAST(N'2010-08-07' AS Date))
INSERT [dbo].[Fragman] ([Fragman_ID], [Film_ID], [Dizi_ID], [FragmanTarihi]) VALUES (20, 20, 20, CAST(N'2003-05-08' AS Date))
SET IDENTITY_INSERT [dbo].[Fragman] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (1, N'Action|Thriller')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (2, N'Drama|Horror')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (3, N'Animation|Comedy|Drama|Fantasy')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (4, N'Crime|Drama')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (5, N'Drama|Mystery|Thriller')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (6, N'Action|Comedy')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (7, N'Comedy|Romance')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (8, N'Documentary')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (9, N'Sci-Fi')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (10, N'Comedy')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (11, N'Drama')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (12, N'Fantasy|Western')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (13, N'Action|Adventure|Thriller')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (14, N'Comedy|Horror')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (15, N'Documentary')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (16, N'Documentary')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (17, N'Animation|Children|Comedy')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (18, N'Documentary')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (19, N'Drama')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (20, N'Drama')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (21, N'Comedy')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (22, N'Comedy|Musical')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (23, N'Adventure|Animation|Children')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (24, N'Action|Adventure|Animation|Fantasy|Sci-Fi')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (25, N'Action|Adventure|Sci-Fi')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (26, N'Crime|Thriller')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (27, N'Comedy|Drama')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (28, N'Comedy')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (29, N'Comedy|Romance')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (30, N'Thriller')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (31, N'Drama')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (32, N'Drama')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (33, N'Action|Fantasy|Sci-Fi|Thriller')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (34, N'Action|Adventure|Crime|Drama|Romance|Thriller')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (35, N'Comedy')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (36, N'Comedy|Romance')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (37, N'Action|Horror|Sci-Fi')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (38, N'Comedy')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (39, N'Drama')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (40, N'Drama|Romance|War')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (41, N'Animation|Comedy|Drama|Mystery')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (42, N'Drama')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (43, N'Comedy|Crime')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (44, N'Action|Horror|Sci-Fi')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (45, N'Comedy')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (46, N'Romance')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (47, N'Adventure|Drama|War')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (48, N'Drama|Romance')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (49, N'Romance')
INSERT [dbo].[Kategori] ([Kategori_ID], [KategoriAdi]) VALUES (50, N'Adventure|Drama|War')
SET IDENTITY_INSERT [dbo].[Kategori] OFF
GO
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (1, 1, 1)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (2, 2, 2)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (3, 3, 3)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (4, 4, 4)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (5, 5, 5)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (6, 6, 6)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (7, 7, 7)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (8, 8, 8)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (9, 9, 9)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (10, 10, 10)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (11, 11, 11)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (12, 12, 12)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (13, 13, 13)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (14, 14, 14)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (15, 15, 15)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (16, 16, 16)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (17, 17, 17)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (18, 18, 18)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (19, 19, 19)
INSERT [dbo].[KategoriDetay] ([Film_ID], [Dizi_ID], [Kategori_ID]) VALUES (20, 20, 20)
GO
SET IDENTITY_INSERT [dbo].[Kullanıcı] ON 

INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (1, N'Mac', N'Orcott', CAST(N'1989-07-17' AS Date), N'Browning', N'65498496216', 1, N'Serbia')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (2, N'Constantino', N'Southern', CAST(N'1994-09-08' AS Date), N'High Crossing', N'641646203', 0, N'Croatia')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (3, N'Cordula', N'Mesant', CAST(N'1996-09-24' AS Date), N'Butternut', N'54654321321', 1, N'China')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (4, N'Rennie', N'Georges', CAST(N'1996-01-12' AS Date), N'East', N'6546546', 1, N'France')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (5, N'Normy', N'Petkovic', CAST(N'1994-04-19' AS Date), N'Hintze', N'32165465', 1, N'Poland')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (6, N'Courtnay', N'Dawnay', CAST(N'1985-12-11' AS Date), N'Dapin', N'654613203', 1, N'Finland')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (8, N'Fabe', N'Sidry', CAST(N'1983-01-10' AS Date), N'Dakota', N'65464162131', 0, N'Indonesia')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (9, N'Nikola', N'Starr', CAST(N'1986-02-19' AS Date), N'Burrows', N'54654321321', 1, N'Morocco')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (10, N'Twila', N'Foye', CAST(N'1973-02-02' AS Date), N'Anderson', N'65464162131', 1, N'Peru')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (11, N'Tiffi', N'Peerman', CAST(N'1979-03-21' AS Date), N'Hoard', N'32165465', 0, N'China')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (12, N'Sullivan', N'Pomery', CAST(N'1984-07-13' AS Date), N'Gulseth', N'32165465', 0, N'China')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (13, N'Karlotte', N'MacGrath', CAST(N'1976-06-21' AS Date), N'Northridge', N'32165465', 0, N'Austria')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (14, N'Fredra', N'Reddick', CAST(N'1996-06-21' AS Date), N'Red Cloud', N'54654321321', 1, N'Portugal')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (15, N'Randee', N'Bye', CAST(N'1995-06-29' AS Date), N'Continental', N'65464162131', 1, N'Portugal')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (16, N'Kirstyn', N'Jellyman', CAST(N'1991-12-12' AS Date), N'Anthes', N'54654321321', 1, N'Nigeria')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (17, N'Eleen', N'Di Maggio', CAST(N'1980-06-11' AS Date), N'Eastlawn', N'65464162131', 1, N'Philippines')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (18, N'Wyndham', N'Tulleth', CAST(N'1971-01-12' AS Date), N'Prentice', N'32165465', 1, N'China')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (19, N'Gaven', N'Deares', CAST(N'1985-05-21' AS Date), N'Homewood', N'54654321321', 1, N'Mexico')
INSERT [dbo].[Kullanıcı] ([Kullanıcı_ID], [KullanıcıAdi], [KullanıcıSoyadi], [DogumTarihi], [Adres], [Telefon], [Cinsiyet], [Ülke]) VALUES (20, N'Katina', N'Durrett', CAST(N'1996-08-27' AS Date), N'Oakridge', N'32165465', 1, N'Indonesia')
SET IDENTITY_INSERT [dbo].[Kullanıcı] OFF
GO
SET IDENTITY_INSERT [dbo].[KullaniciGiris] ON 

INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (1, N'tpeters0@vkontakte.ru', N'Lz2DSq1hgGU7')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (2, N'cwhitmore1@posterous.com', N'1JfCIsc')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (3, N'bbottini2@sfgate.com', N'MqANSO')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (4, N'asmallsman3@etsy.com', N'yfSbZjrWe9m')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (5, N'lcolston4@infoseek.co.jp', N'53HRwpB')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (6, N'wdorwood5@army.mil', N'UlZZza4f')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (7, N'mtesdale6@cargocollective.com', N'YNy9Ie1yI3u5')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (8, N'fharken7@mail.ru', N'OKVvnaz')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (9, N'glargent8@google.fr', N'6eoziWJ5do')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (10, N'mdaniel9@slideshare.net', N'BSpuKJzZ')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (11, N'vmuzzilloa@flavors.me', N'EUNvLWCTsig')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (12, N'sbaystonb@jiathis.com', N'7kcpYeqBWva3')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (13, N'mdepportc@bloglines.com', N'eCNZWN3Pt9b7')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (14, N'sderoeckd@dailymotion.com', N'pggoOJHuO8')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (15, N'mkerrye@nyu.edu', N'Z79XOTpIe3')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (16, N'kstonefewingsf@ibm.com', N'v0VmFpqcysgD')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (17, N'mhearnamang@shutterfly.com', N'T3WJ3FBIXwHA')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (18, N'bmunroh@paypal.com', N'8ItrOAFIZHN')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (19, N'aantaoi@google.fr', N'ggxXxL')
INSERT [dbo].[KullaniciGiris] ([KullanıcıGiris_ID], [Mail], [Sifre]) VALUES (20, N'cnorcliffej@bbc.co.uk', N'k0naSjOomGm')
SET IDENTITY_INSERT [dbo].[KullaniciGiris] OFF
GO
SET IDENTITY_INSERT [dbo].[Odemeler] ON 

INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (1, 0, N'4017959249988', CAST(N'2028-01-23' AS Date), N'Damon', N'459')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (2, 1, N'4288126455493674', CAST(N'2028-10-05' AS Date), N'Corney', N'790')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (3, 0, N'4981347675499735', CAST(N'2028-06-07' AS Date), N'Moss', N'983')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (4, 0, N'4958550416783056', CAST(N'2024-08-15' AS Date), N'Winfred', N'913')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (5, 0, N'4282955107759645', CAST(N'2026-05-28' AS Date), N'Cyb', N'227')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (6, 0, N'4017950013318', CAST(N'2029-04-14' AS Date), N'Skylar', N'448')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (7, 1, N'4041593559782161', CAST(N'2027-03-27' AS Date), N'Rossy', N'693')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (8, 0, N'4041371666546', CAST(N'2027-02-09' AS Date), N'Katya', N'599')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (9, 0, N'4080974107829781', CAST(N'2025-06-02' AS Date), N'Ricky', N'531')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (10, 1, N'4041592369011', CAST(N'2029-12-01' AS Date), N'Mady', N'239')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (11, 1, N'4017958956641', CAST(N'2028-07-04' AS Date), N'Sterne', N'569')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (12, 0, N'4017959631414653', CAST(N'2029-06-16' AS Date), N'Lauren', N'373')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (13, 1, N'4017956704237169', CAST(N'2026-11-11' AS Date), N'Druci', N'140')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (14, 1, N'4041374877553', CAST(N'2028-04-22' AS Date), N'Waite', N'321')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (15, 0, N'4022661883447', CAST(N'2024-05-12' AS Date), N'Netty', N'438')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (16, 1, N'4041591132675', CAST(N'2026-05-29' AS Date), N'Kimberly', N'194')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (17, 0, N'4017954875613', CAST(N'2028-06-26' AS Date), N'Fremont', N'595')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (18, 0, N'4017955956263', CAST(N'2023-04-19' AS Date), N'Star', N'968')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (19, 0, N'4017954371977', CAST(N'2026-10-05' AS Date), N'Margette', N'815')
INSERT [dbo].[Odemeler] ([Odeme_ID], [KartTipi], [KartNo], [KartSonKullanmaTarihi], [KartÜzeriİsim], [KartCVC]) VALUES (20, 0, N'4017952718889475', CAST(N'2028-12-22' AS Date), N'Brand', N'576')
SET IDENTITY_INSERT [dbo].[Odemeler] OFF
GO
SET IDENTITY_INSERT [dbo].[OrijinalDil] ON 

INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (1, N'Gujarati')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (2, N'Montenegrin')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (3, N'Tajik')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (4, N'Tetum')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (5, N'West Frisian')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (6, N'Estonian')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (7, N'French')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (8, N'Sotho')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (9, N'Tok Pisin')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (10, N'Hungarian')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (11, N'Papiamento')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (12, N'Icelandic')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (13, N'Irish Gaelic')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (14, N'Kannada')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (15, N'Thai')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (16, N'Oriya')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (17, N'Korean')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (18, N'Kannada')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (19, N'Pashto')
INSERT [dbo].[OrijinalDil] ([OrijinalDil_ID], [DilAdi]) VALUES (20, N'Belarusian')
SET IDENTITY_INSERT [dbo].[OrijinalDil] OFF
GO
SET IDENTITY_INSERT [dbo].[Oylama] ON 

INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (1, 1, 1, 95, CAST(N'2021-08-06' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (2, 2, 2, 54, CAST(N'2021-11-05' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (3, 3, 3, 29, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (4, 4, 4, 23, CAST(N'2021-04-10' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (5, 5, 5, 30, CAST(N'2021-08-16' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (6, 6, 6, 91, CAST(N'2021-08-04' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (7, 7, 7, 65, CAST(N'2021-08-03' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (8, 8, 8, 1, CAST(N'2021-10-11' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (9, 9, 9, 86, CAST(N'2021-09-16' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (10, 10, 10, 92, CAST(N'2021-04-09' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (11, 11, 11, 44, CAST(N'2022-01-07' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (12, 12, 12, 39, CAST(N'2022-01-03' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (13, 13, 13, 72, CAST(N'2021-12-23' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (14, 14, 14, 53, CAST(N'2021-08-04' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (15, 15, 15, 72, CAST(N'2021-05-30' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (16, 16, 16, 45, CAST(N'2021-10-04' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (17, 17, 17, 92, CAST(N'2021-05-17' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (18, 18, 18, 58, CAST(N'2021-04-29' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (19, 19, 19, 97, CAST(N'2021-09-28' AS Date))
INSERT [dbo].[Oylama] ([Kullanıcı_ID], [Dizi_ID], [Film_ID], [OylamaPuanı], [OylamaTarihi]) VALUES (20, 20, 20, 100, CAST(N'2022-01-29' AS Date))
SET IDENTITY_INSERT [dbo].[Oylama] OFF
GO
SET IDENTITY_INSERT [dbo].[Oyuncular] ON 

INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (1, N'Yulma', N'Winterbotham', 1, 1)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (2, N'Kory', N'Terren', 2, 2)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (3, N'Corene', N'Marney', 3, 3)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (4, N'Gabriello', N'Savil', 4, 4)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (5, N'Callida', N'Blomefield', 5, 5)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (6, N'Becki', N'Roncelli', 6, 6)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (7, N'Currie', N'Frosch', 7, 7)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (8, N'Leanora', N'Marling', 8, 8)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (9, N'Ambrose', N'Jaan', 9, 9)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (10, N'Haze', N'Clemendet', 10, 10)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (11, N'Conrad', N'Gunn', 11, 11)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (12, N'Ester', N'Belden', 12, 12)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (13, N'Tessie', N'Paylie', 13, 13)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (14, N'Bobette', N'Pirie', 14, 14)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (15, N'Marcelia', N'Cornbill', 15, 15)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (16, N'Jacklin', N'Paireman', 16, 16)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (17, N'Rebeca', N'Tocque', 17, 17)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (18, N'Bessie', N'Le Friec', 18, 18)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (19, N'Michaela', N'Baynon', 19, 19)
INSERT [dbo].[Oyuncular] ([Oyuncu_ID], [OyuncuAdi], [OyuncuSoyadi], [Film_ID], [Dizi_ID]) VALUES (20, N'Reggis', N'Cassel', 20, 20)
SET IDENTITY_INSERT [dbo].[Oyuncular] OFF
GO
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (1, 1, N'Oscar')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (2, 2, N'Emmy')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (3, 3, N'Emmy')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (4, 4, N'Public Utilities')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (5, 5, N'Oscar')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (6, 6, N'Consumer Durables')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (7, 7, N'Oscar')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (8, 8, N'Emmy')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (9, 9, N'Oscar')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (10, 10, N'Oscar')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (11, 11, N'Gold Butterfly')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (12, 12, N'Oscar')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (13, 13, N'Energy')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (14, 14, N'Gold Butterfly')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (15, 15, N'Emmy')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (16, 16, N'BAFTA')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (17, 17, N'Capital Goods')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (18, 18, N'Gold Butterfly')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (19, 19, N'Oscar')
INSERT [dbo].[Ödüller] ([Film_ID], [Dizi_ID], [OdülAdi]) VALUES (20, 20, N'Capital Goods')
GO
SET IDENTITY_INSERT [dbo].[Yönetmen] ON 

INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (1, N'Alexis', N'Barthram', 1, 1)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (2, N'Emmye', N'Durman', 2, 2)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (3, N'Michaella', N'Monkman', 3, 3)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (4, N'Gib', N'Assante', 4, 4)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (5, N'Belle', N'Cheeseman', 5, 5)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (6, N'Carolynn', N'McCalister', 6, 6)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (7, N'Tobey', N'Wase', 7, 7)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (8, N'Gwendolyn', N'Lethbury', 8, 8)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (9, N'Andriana', N'Hutton', 9, 9)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (10, N'Annetta', N'Guswell', 10, 10)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (11, N'Dyann', N'Skeffington', 11, 11)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (12, N'Katusha', N'Aucutt', 12, 12)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (13, N'Melita', N'Butchart', 13, 13)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (14, N'Raddy', N'Dewen', 14, 14)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (15, N'Chantalle', N'Risso', 15, 15)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (16, N'Murdock', N'O''Sirin', 16, 16)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (17, N'Waring', N'Stoffels', 17, 17)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (18, N'Norean', N'Canaan', 18, 18)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (19, N'Keri', N'Elcoat', 19, 19)
INSERT [dbo].[Yönetmen] ([Yönetmen_ID], [YönetmenAdi], [YönetmenSoyadi], [Film_ID], [Dizi_ID]) VALUES (20, N'Jedediah', N'Rex', 20, 20)
SET IDENTITY_INSERT [dbo].[Yönetmen] OFF
GO
ALTER TABLE [dbo].[BasrolDetay]  WITH CHECK ADD  CONSTRAINT [FK_BasrolDetay_Basrol] FOREIGN KEY([Basrol_ID])
REFERENCES [dbo].[Basrol] ([Basrol_ID])
GO
ALTER TABLE [dbo].[BasrolDetay] CHECK CONSTRAINT [FK_BasrolDetay_Basrol]
GO
ALTER TABLE [dbo].[BasrolDetay]  WITH CHECK ADD  CONSTRAINT [FK_BasrolDetay_Dizi] FOREIGN KEY([Dizi_ID])
REFERENCES [dbo].[Dizi] ([Dizi_ID])
GO
ALTER TABLE [dbo].[BasrolDetay] CHECK CONSTRAINT [FK_BasrolDetay_Dizi]
GO
ALTER TABLE [dbo].[BasrolDetay]  WITH CHECK ADD  CONSTRAINT [FK_BasrolDetay_Film] FOREIGN KEY([Film_ID])
REFERENCES [dbo].[Film] ([Film_ID])
GO
ALTER TABLE [dbo].[BasrolDetay] CHECK CONSTRAINT [FK_BasrolDetay_Film]
GO
ALTER TABLE [dbo].[Dizi]  WITH CHECK ADD  CONSTRAINT [FK_Dizi_OrijinalDil] FOREIGN KEY([OrijinalDil_ID])
REFERENCES [dbo].[OrijinalDil] ([OrijinalDil_ID])
GO
ALTER TABLE [dbo].[Dizi] CHECK CONSTRAINT [FK_Dizi_OrijinalDil]
GO
ALTER TABLE [dbo].[DiziDetay]  WITH CHECK ADD  CONSTRAINT [FK_DiziDetay_Dizi] FOREIGN KEY([DiziDetay_ID])
REFERENCES [dbo].[Dizi] ([Dizi_ID])
GO
ALTER TABLE [dbo].[DiziDetay] CHECK CONSTRAINT [FK_DiziDetay_Dizi]
GO
ALTER TABLE [dbo].[Film]  WITH CHECK ADD  CONSTRAINT [FK_Film_OrijinalDil] FOREIGN KEY([OrijinalDil_ID])
REFERENCES [dbo].[OrijinalDil] ([OrijinalDil_ID])
GO
ALTER TABLE [dbo].[Film] CHECK CONSTRAINT [FK_Film_OrijinalDil]
GO
ALTER TABLE [dbo].[FilmDetay]  WITH CHECK ADD  CONSTRAINT [FK_FilmDetay_Film] FOREIGN KEY([FilmDetay_ID])
REFERENCES [dbo].[Film] ([Film_ID])
GO
ALTER TABLE [dbo].[FilmDetay] CHECK CONSTRAINT [FK_FilmDetay_Film]
GO
ALTER TABLE [dbo].[Fragman]  WITH CHECK ADD  CONSTRAINT [FK_Fragman_Dizi] FOREIGN KEY([Dizi_ID])
REFERENCES [dbo].[Dizi] ([Dizi_ID])
GO
ALTER TABLE [dbo].[Fragman] CHECK CONSTRAINT [FK_Fragman_Dizi]
GO
ALTER TABLE [dbo].[Fragman]  WITH CHECK ADD  CONSTRAINT [FK_Fragman_Film] FOREIGN KEY([Film_ID])
REFERENCES [dbo].[Film] ([Film_ID])
GO
ALTER TABLE [dbo].[Fragman] CHECK CONSTRAINT [FK_Fragman_Film]
GO
ALTER TABLE [dbo].[KategoriDetay]  WITH CHECK ADD  CONSTRAINT [FK_KategoriDetay_Dizi] FOREIGN KEY([Dizi_ID])
REFERENCES [dbo].[Dizi] ([Dizi_ID])
GO
ALTER TABLE [dbo].[KategoriDetay] CHECK CONSTRAINT [FK_KategoriDetay_Dizi]
GO
ALTER TABLE [dbo].[KategoriDetay]  WITH CHECK ADD  CONSTRAINT [FK_KategoriDetay_Film] FOREIGN KEY([Film_ID])
REFERENCES [dbo].[Film] ([Film_ID])
GO
ALTER TABLE [dbo].[KategoriDetay] CHECK CONSTRAINT [FK_KategoriDetay_Film]
GO
ALTER TABLE [dbo].[KategoriDetay]  WITH CHECK ADD  CONSTRAINT [FK_KategoriDetay_Kategori] FOREIGN KEY([Kategori_ID])
REFERENCES [dbo].[Kategori] ([Kategori_ID])
GO
ALTER TABLE [dbo].[KategoriDetay] CHECK CONSTRAINT [FK_KategoriDetay_Kategori]
GO
ALTER TABLE [dbo].[Kullanıcı]  WITH CHECK ADD  CONSTRAINT [FK_Kullanıcı_KullaniciGiris] FOREIGN KEY([Kullanıcı_ID])
REFERENCES [dbo].[KullaniciGiris] ([KullanıcıGiris_ID])
GO
ALTER TABLE [dbo].[Kullanıcı] CHECK CONSTRAINT [FK_Kullanıcı_KullaniciGiris]
GO
ALTER TABLE [dbo].[Kullanıcı]  WITH CHECK ADD  CONSTRAINT [FK_Kullanıcı_Odemeler] FOREIGN KEY([Kullanıcı_ID])
REFERENCES [dbo].[Odemeler] ([Odeme_ID])
GO
ALTER TABLE [dbo].[Kullanıcı] CHECK CONSTRAINT [FK_Kullanıcı_Odemeler]
GO
ALTER TABLE [dbo].[Kullanıcı]  WITH CHECK ADD  CONSTRAINT [FK_Kullanıcı_Oylama] FOREIGN KEY([Kullanıcı_ID])
REFERENCES [dbo].[Oylama] ([Kullanıcı_ID])
GO
ALTER TABLE [dbo].[Kullanıcı] CHECK CONSTRAINT [FK_Kullanıcı_Oylama]
GO
ALTER TABLE [dbo].[Oylama]  WITH CHECK ADD  CONSTRAINT [FK_Oylama_Dizi] FOREIGN KEY([Dizi_ID])
REFERENCES [dbo].[Dizi] ([Dizi_ID])
GO
ALTER TABLE [dbo].[Oylama] CHECK CONSTRAINT [FK_Oylama_Dizi]
GO
ALTER TABLE [dbo].[Oylama]  WITH CHECK ADD  CONSTRAINT [FK_Oylama_Film] FOREIGN KEY([Film_ID])
REFERENCES [dbo].[Film] ([Film_ID])
GO
ALTER TABLE [dbo].[Oylama] CHECK CONSTRAINT [FK_Oylama_Film]
GO
ALTER TABLE [dbo].[Oyuncular]  WITH CHECK ADD  CONSTRAINT [FK_Oyuncular_Dizi] FOREIGN KEY([Dizi_ID])
REFERENCES [dbo].[Dizi] ([Dizi_ID])
GO
ALTER TABLE [dbo].[Oyuncular] CHECK CONSTRAINT [FK_Oyuncular_Dizi]
GO
ALTER TABLE [dbo].[Oyuncular]  WITH CHECK ADD  CONSTRAINT [FK_Oyuncular_Film] FOREIGN KEY([Film_ID])
REFERENCES [dbo].[Film] ([Film_ID])
GO
ALTER TABLE [dbo].[Oyuncular] CHECK CONSTRAINT [FK_Oyuncular_Film]
GO
ALTER TABLE [dbo].[Ödüller]  WITH CHECK ADD  CONSTRAINT [FK_Ödüller_Dizi] FOREIGN KEY([Dizi_ID])
REFERENCES [dbo].[Dizi] ([Dizi_ID])
GO
ALTER TABLE [dbo].[Ödüller] CHECK CONSTRAINT [FK_Ödüller_Dizi]
GO
ALTER TABLE [dbo].[Ödüller]  WITH CHECK ADD  CONSTRAINT [FK_Ödüller_Film] FOREIGN KEY([Film_ID])
REFERENCES [dbo].[Film] ([Film_ID])
GO
ALTER TABLE [dbo].[Ödüller] CHECK CONSTRAINT [FK_Ödüller_Film]
GO
ALTER TABLE [dbo].[Yönetmen]  WITH CHECK ADD  CONSTRAINT [FK_Yönetmen_Dizi] FOREIGN KEY([Dizi_ID])
REFERENCES [dbo].[Dizi] ([Dizi_ID])
GO
ALTER TABLE [dbo].[Yönetmen] CHECK CONSTRAINT [FK_Yönetmen_Dizi]
GO
ALTER TABLE [dbo].[Yönetmen]  WITH CHECK ADD  CONSTRAINT [FK_Yönetmen_Film] FOREIGN KEY([Film_ID])
REFERENCES [dbo].[Film] ([Film_ID])
GO
ALTER TABLE [dbo].[Yönetmen] CHECK CONSTRAINT [FK_Yönetmen_Film]
GO
USE [master]
GO
ALTER DATABASE [AceFlix] SET  READ_WRITE 
GO
