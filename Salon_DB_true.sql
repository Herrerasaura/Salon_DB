USE [master]
GO
/****** Object:  Database [Salon]    Script Date: 19.12.2022 15:57:41 ******/
CREATE DATABASE [Salon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Salon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Salon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Salon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Salon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Salon] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Salon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Salon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Salon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Salon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Salon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Salon] SET ARITHABORT OFF 
GO
ALTER DATABASE [Salon] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Salon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Salon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Salon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Salon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Salon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Salon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Salon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Salon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Salon] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Salon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Salon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Salon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Salon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Salon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Salon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Salon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Salon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Salon] SET  MULTI_USER 
GO
ALTER DATABASE [Salon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Salon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Salon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Salon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Salon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Salon] SET QUERY_STORE = OFF
GO
USE [Salon]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ref]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ref](
	[clientid] [varchar](max) NULL,
	[serviceid] [varchar](max) NULL,
	[time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 19.12.2022 15:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (51, N'Кузьмина', N'Дэнна', N'Витальевна', CAST(N'1993-08-24' AS Date), CAST(N'2016-03-27T00:00:00.000' AS DateTime), N'nichoj@mac.com', N'7(9940)977-45-73 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (52, N'Мамонтова', N'Марфа', N'Мироновна', CAST(N'1984-10-19' AS Date), CAST(N'2018-02-27T00:00:00.000' AS DateTime), N'rfoley@verizon.net', N'7(38)095-64-18 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (53, N'Степанова', N'Амелия', N'Робертовна', CAST(N'1970-06-06' AS Date), CAST(N'2017-09-27T00:00:00.000' AS DateTime), N'rasca@hotmail.com', N'7(1217)441-28-42 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (54, N'Колесникова', N'Алина', N'Еремеевна', CAST(N'2001-04-19' AS Date), CAST(N'2017-01-18T00:00:00.000' AS DateTime), N'gfxguy@outlook.com', N'7(74)977-39-71 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (55, N'Морозов', N'Наум', N'Валерьянович', CAST(N'1985-07-04' AS Date), CAST(N'2016-05-02T00:00:00.000' AS DateTime), N'salesgeek@mac.com', N'7(636)050-96-13 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (56, N'Сысоева', N'Дарина', N'Ярославовна', CAST(N'1982-02-03' AS Date), CAST(N'2016-05-13T00:00:00.000' AS DateTime), N'treit@verizon.net', N'7(0698)387-96-04 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (57, N'Горбачёва', N'Никки', N'Еремеевна', CAST(N'1987-04-21' AS Date), CAST(N'2018-08-16T00:00:00.000' AS DateTime), N'chinthaka@att.net', N'7(94)789-69-20 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (58, N'Бирюкова', N'Инара', N'Улебовна', CAST(N'1978-07-21' AS Date), CAST(N'2017-10-01T00:00:00.000' AS DateTime), N'smpeters@hotmail.com', N'7(098)346-50-58 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (59, N'Киселёв', N'Устин', N'Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N'dalamb@verizon.net', N'7(83)334-52-76 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (60, N'Крюкова', N'Авигея', N'Святославовна', CAST(N'2000-08-10' AS Date), CAST(N'2018-01-03T00:00:00.000' AS DateTime), N'simone@gmail.com', N'7(499)318-88-53 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (61, N'Костина', N'Любава', N'Авксентьевна', CAST(N'1972-07-13' AS Date), CAST(N'2016-02-26T00:00:00.000' AS DateTime), N'gordonjcp@hotmail.com', N'7(6419)959-21-87 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (62, N'Попова', N'Харита', N'Якуновна', CAST(N'1997-12-16' AS Date), CAST(N'2016-07-05T00:00:00.000' AS DateTime), N'firstpr@verizon.net', N'7(335)386-81-06 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (63, N'Андреева', N'Патрисия', N'Валерьевна', CAST(N'1993-11-18' AS Date), CAST(N'2016-07-17T00:00:00.000' AS DateTime), N'jigsaw@aol.com', N'7(9648)953-81-26 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (64, N'Гусева', N'Роза', N'Дмитриевна', CAST(N'1999-02-13' AS Date), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N'martyloo@live.com', N'7(23)064-51-84 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (65, N'Быков', N'Трофим', N'Константинович', CAST(N'1994-12-20' AS Date), CAST(N'2016-04-17T00:00:00.000' AS DateTime), N'jguyer@aol.com', N'7(3414)460-12-05 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (66, N'Гусев', N'Яков', N'Авксентьевич', CAST(N'1995-12-10' AS Date), CAST(N'2017-11-20T00:00:00.000' AS DateTime), N'jdhedden@icloud.com', N'7(0972)781-11-37 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (67, N'Турова', N'Георгина', N'Семёновна', CAST(N'1974-05-28' AS Date), CAST(N'2018-02-22T00:00:00.000' AS DateTime), N'yruan@optonline.net', N'7(555)321-42-99 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (68, N'Трофимова', N'Альжбета', N'Якововна', CAST(N'1988-10-22' AS Date), CAST(N'2017-09-21T00:00:00.000' AS DateTime), N'gbacon@mac.com', N'7(1084)658-92-95 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (69, N'Баранова', N'Эльмира', N'Дмитриевна', CAST(N'1977-01-15' AS Date), CAST(N'2016-07-08T00:00:00.000' AS DateTime), N'jgmyers@comcast.net', N'7(9240)643-15-50 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (70, N'Федотов', N'Осип', N'Анатольевич', CAST(N'1971-04-13' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'breegster@hotmail.com', N'7(590)702-33-06 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (71, N'Борисов', N'Аввакум', N'Артемович', CAST(N'1974-04-25' AS Date), CAST(N'2017-03-11T00:00:00.000' AS DateTime), N'chlim@live.com', N'7(2296)930-08-88 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (72, N'Артемьева', N'Лиза', N'Максимовна', CAST(N'1996-05-17' AS Date), CAST(N'2018-10-07T00:00:00.000' AS DateTime), N'snunez@yahoo.ca', N'7(696)972-70-21 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (73, N'Воронова', N'Изабелла', N'Вячеславовна', CAST(N'1999-09-24' AS Date), CAST(N'2017-12-21T00:00:00.000' AS DateTime), N'kildjean@sbcglobal.net', N'7(17)433-44-98 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (74, N'Федотова', N'Сандра', N'Владленовна', CAST(N'1985-03-29' AS Date), CAST(N'2016-11-08T00:00:00.000' AS DateTime), N'penna@verizon.net', N'7(126)195-25-86 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (75, N'Ефремов', N'Витольд', N'Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'2018-04-09T00:00:00.000' AS DateTime), N'kwilliams@yahoo.ca', N'7(93)922-14-03 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (76, N'Ермакова', N'Алла', N'Мироновна', CAST(N'1976-01-22' AS Date), CAST(N'2017-02-09T00:00:00.000' AS DateTime), N'whimsy@aol.com', N'7(06)437-13-73 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (77, N'Шашкова', N'Гелла', N'Эдуардовна', CAST(N'1979-02-24' AS Date), CAST(N'2016-11-16T00:00:00.000' AS DateTime), N'jadavis@mac.com', N'7(57)446-21-04 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (78, N'Быкова', N'Тала', N'Георгьевна', CAST(N'2000-02-22' AS Date), CAST(N'2016-08-13T00:00:00.000' AS DateTime), N'ganter@optonline.net', N'7(13)915-53-53 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (79, N'Орлова', N'Влада', N'Мартыновна', CAST(N'1990-06-26' AS Date), CAST(N'2016-03-21T00:00:00.000' AS DateTime), N'rnelson@yahoo.ca', N'7(2506)433-38-35 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (80, N'Анисимова', N'Тамара', N'Витальевна', CAST(N'1988-06-16' AS Date), CAST(N'2016-02-25T00:00:00.000' AS DateTime), N'schwaang@mac.com', N'7(66)128-04-10 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (81, N'Архипова', N'Прасковья', N'Валерьевна', CAST(N'1979-01-09' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'cgcra@live.com', N'7(86)540-10-21 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (82, N'Новиков', N'Адриан', N'Аркадьевич', CAST(N'1974-01-15' AS Date), CAST(N'2018-11-23T00:00:00.000' AS DateTime), N'multiplx@verizon.net', N'7(70)572-33-62 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (83, N'Лазарева', N'Эльвина', N'Робертовна', CAST(N'1996-02-16' AS Date), CAST(N'2018-04-11T00:00:00.000' AS DateTime), N'ahuillet@comcast.net', N'7(5564)609-81-37 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (84, N'Афанасьева', N'Розалия', N'Макаровна', CAST(N'1977-05-01' AS Date), CAST(N'2017-09-06T00:00:00.000' AS DateTime), N'malattia@hotmail.com', N'7(0661)413-23-32 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (85, N'Устинова', N'Юнона', N'Валентиновна', CAST(N'1982-08-08' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N'kempsonc@live.com', N'7(33)367-13-07', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (86, N'Алексеева', N'Элина', N'Матвеевна', CAST(N'2002-05-07' AS Date), CAST(N'2018-03-28T00:00:00.000' AS DateTime), N'pthomsen@verizon.net', N'7(8086)245-64-81 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (87, N'Гущина', N'Янита', N'Федоровна', CAST(N'1999-03-02' AS Date), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N'lishoy@att.net', N'7(4544)716-68-96 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (88, N'Суворова', N'Божена', N'Анатольевна', CAST(N'1981-03-09' AS Date), CAST(N'2016-01-28T00:00:00.000' AS DateTime), N'attwood@aol.com', N'7(347)895-86-57 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (89, N'Горшкова', N'Марта', N'Иосифовна', CAST(N'2001-02-13' AS Date), CAST(N'2016-08-04T00:00:00.000' AS DateTime), N'gbacon@mac.com', N'7(544)650-59-03', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (90, N'Смирнов', N'Мартын', N'Арсеньевич', CAST(N'1996-06-25' AS Date), CAST(N'2017-02-07T00:00:00.000' AS DateTime), N'haddawy@live.com', N'7(6251)589-02-43 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (91, N'Корнилова', N'Анэля', N'Михайловна', CAST(N'1973-04-02' AS Date), CAST(N'2016-05-22T00:00:00.000' AS DateTime), N'jonathan@aol.com', N'7(20)980-01-60 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (92, N'Ефимова', N'Магда', N'Платоновна', CAST(N'1995-08-16' AS Date), CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'rbarreira@me.com', N'7(9261)386-15-92 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (93, N'Бурова', N'Светлана', N'Лукьевна', CAST(N'1979-01-04' AS Date), CAST(N'2016-10-13T00:00:00.000' AS DateTime), N'wsnyder@aol.com', N'7(358)173-82-21 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (94, N'Сидорова', N'Татьяна', N'Михайловна', CAST(N'1974-04-24' AS Date), CAST(N'2018-10-03T00:00:00.000' AS DateTime), N'tbeck@mac.com', N'7(51)732-91-79 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (95, N'Ершова', N'Номи', N'Андреевна', CAST(N'2001-09-13' AS Date), CAST(N'2016-06-30T00:00:00.000' AS DateTime), N'miltchev@mac.com', N'7(7757)315-90-99 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (96, N'Овчинникова', N'Лаура', N'Еремеевна', CAST(N'1992-04-03' AS Date), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N'carcus@yahoo.ca', N'7(85)829-33-79 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (97, N'Мишина', N'Иветта', N'Андреевна', CAST(N'2002-10-05' AS Date), CAST(N'2016-01-24T00:00:00.000' AS DateTime), N'aukjan@yahoo.com', N'7(3926)244-81-96 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (98, N'Колобова', N'Злата', N'Романовна', CAST(N'1994-08-25' AS Date), CAST(N'2016-12-03T00:00:00.000' AS DateTime), N'sinkou@aol.com', N'7(50)884-07-35 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (99, N'Селиверстов', N'Глеб', N'Максимович', CAST(N'1999-06-20' AS Date), CAST(N'2016-01-07T00:00:00.000' AS DateTime), N'jigsaw@sbcglobal.net', N'7(20)554-28-68 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (100, N'Дмитриева', N'Элина', N'Даниловна', CAST(N'1988-12-10' AS Date), CAST(N'2017-02-11T00:00:00.000' AS DateTime), N'vmalik@live.com', N'7(787)140-48-84 ', N'1', NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1, 79, 45, CAST(N'2019-04-27T13:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 88, 41, CAST(N'2019-05-31T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 68, 59, CAST(N'2019-09-20T17:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 84, 75, CAST(N'2019-10-17T17:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 57, 26, CAST(N'2019-07-12T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (6, 56, 39, CAST(N'2019-09-06T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (7, 81, 89, CAST(N'2019-09-28T18:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (8, 69, 67, CAST(N'2019-09-11T13:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (9, 60, 40, CAST(N'2019-06-21T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (10, 54, 29, CAST(N'2019-12-20T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (11, 69, 71, CAST(N'2019-03-19T12:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (12, 68, 79, CAST(N'2019-12-23T17:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (13, 84, 55, CAST(N'2019-01-17T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (14, 94, 1, CAST(N'2019-12-18T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (15, 64, 75, CAST(N'2019-01-22T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (16, 81, 12, CAST(N'2019-09-07T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (17, 84, 8, CAST(N'2019-01-01T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (18, 80, 39, CAST(N'2019-06-24T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (19, 51, 89, CAST(N'2019-04-28T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (20, 54, 55, CAST(N'2019-06-13T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (21, 95, 67, CAST(N'2019-12-25T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (22, 94, 86, CAST(N'2019-10-07T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (23, 100, 40, CAST(N'2019-05-22T15:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (24, 83, 71, CAST(N'2019-10-05T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (25, 72, 87, CAST(N'2019-01-27T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (26, 80, 30, CAST(N'2019-11-15T17:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (27, 69, 23, CAST(N'2019-05-06T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (28, 54, 37, CAST(N'2019-02-13T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (29, 63, 64, CAST(N'2019-05-20T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (30, 86, 5, CAST(N'2019-01-19T13:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (31, 78, 92, CAST(N'2019-06-07T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (32, 51, 59, CAST(N'2019-03-21T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (33, 79, 95, CAST(N'2019-08-04T12:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (34, 53, 24, CAST(N'2019-01-11T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (35, 56, 92, CAST(N'2019-05-26T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (36, 51, 29, CAST(N'2019-05-04T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (37, 74, 11, CAST(N'2019-07-23T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (38, 84, 72, CAST(N'2019-01-04T18:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (39, 52, 39, CAST(N'2019-10-12T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (40, 54, 30, CAST(N'2019-10-24T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (41, 84, 22, CAST(N'2019-05-29T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (42, 51, 78, CAST(N'2019-09-20T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (43, 52, 81, CAST(N'2019-05-07T15:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (44, 72, 70, CAST(N'2019-09-11T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (45, 91, 96, CAST(N'2019-11-26T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (46, 52, 86, CAST(N'2019-03-28T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (47, 53, 29, CAST(N'2019-01-17T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (48, 100, 26, CAST(N'2019-01-28T15:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (49, 67, 40, CAST(N'2019-06-22T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (50, 97, 21, CAST(N'2019-12-15T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (51, 91, 41, CAST(N'2019-06-07T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (52, 67, 96, CAST(N'2019-09-14T16:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (53, 61, 10, CAST(N'2019-11-04T12:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (54, 92, 91, CAST(N'2019-02-26T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (55, 87, 82, CAST(N'2019-09-13T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (56, 62, 86, CAST(N'2019-11-22T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (57, 88, 78, CAST(N'2019-12-09T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (58, 100, 5, CAST(N'2019-10-31T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (59, 57, 10, CAST(N'2019-08-31T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (60, 86, 37, CAST(N'2019-06-24T17:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (61, 85, 23, CAST(N'2019-11-29T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (62, 96, 10, CAST(N'2019-08-25T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (63, 72, 92, CAST(N'2019-11-13T11:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (64, 88, 26, CAST(N'2019-07-30T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (65, 95, 26, CAST(N'2019-05-25T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (66, 78, 55, CAST(N'2019-06-26T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (67, 98, 10, CAST(N'2019-11-06T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (68, 54, 37, CAST(N'2019-04-29T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (69, 96, 45, CAST(N'2019-10-21T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (70, 63, 14, CAST(N'2019-06-23T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (71, 76, 32, CAST(N'2019-11-09T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (72, 92, 42, CAST(N'2019-10-02T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (73, 68, 92, CAST(N'2019-06-07T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (74, 87, 82, CAST(N'2019-01-17T11:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (75, 100, 95, CAST(N'2019-01-11T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (76, 88, 71, CAST(N'2019-11-13T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (77, 85, 78, CAST(N'2019-10-10T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (78, 56, 40, CAST(N'2019-03-01T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (79, 78, 15, CAST(N'2019-07-21T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (80, 89, 30, CAST(N'2019-12-21T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (81, 91, 92, CAST(N'2019-10-01T12:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (82, 97, 67, CAST(N'2019-08-19T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (83, 61, 89, CAST(N'2019-03-01T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (84, 89, 23, CAST(N'2019-05-11T14:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (85, 54, 8, CAST(N'2019-12-21T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (86, 78, 64, CAST(N'2019-01-30T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (87, 73, 65, CAST(N'2019-03-09T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (88, 72, 37, CAST(N'2019-08-08T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (89, 88, 92, CAST(N'2019-03-04T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (90, 92, 79, CAST(N'2019-06-17T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (91, 63, 52, CAST(N'2019-02-11T09:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (92, 92, 79, CAST(N'2019-02-01T12:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (93, 96, 81, CAST(N'2019-12-11T09:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (94, 77, 81, CAST(N'2019-01-13T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (95, 64, 82, CAST(N'2019-03-23T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (96, 61, 14, CAST(N'2019-10-02T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (97, 80, 8, CAST(N'2019-01-20T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (98, 62, 82, CAST(N'2019-01-27T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (99, 96, 48, CAST(N'2019-05-19T08:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (100, 58, 75, CAST(N'2019-11-30T19:10:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'1', N'жеский')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'2', N'мужской')
GO
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Орлова', N'Оформление бровей', CAST(N'2019-04-27T13:50:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Суворова', N'Массаж ЖИВА', CAST(N'2019-05-31T08:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Трофимова', N'Детская стрижка', CAST(N'2019-09-20T17:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Афанасьева', N'Снятие лака', CAST(N'2019-10-17T17:50:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Горбачёва', N'Наращивание ресниц лисьего эффекта', CAST(N'2019-07-12T16:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Сысоева', N'Художественное оформление ресниц', CAST(N'2019-09-06T12:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Архипова', N'Моментальный лифтинг', CAST(N'2019-09-28T18:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Баранова', N'Озонотерапия', CAST(N'2019-09-11T13:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Крюкова', N'Эстетическая лазерная шлифовка кожи', CAST(N'2019-06-21T11:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Колесникова', N'Комбинированный маникюр', CAST(N'2019-12-20T13:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Баранова', N'Микротоковая терапия', CAST(N'2019-03-19T12:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Трофимова', N'Наращивание ногтей гелем', CAST(N'2019-12-23T17:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Афанасьева', N'Консультация врача-косметолога', CAST(N'2019-01-17T16:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Сидорова', N'Наращивание ресниц', CAST(N'2019-12-18T16:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Гусева', N'Снятие лака', CAST(N'2019-01-22T14:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Архипова', N'Удаление доброкачественных образований кожи', CAST(N'2019-09-07T18:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Афанасьева', N'Пирсинг', CAST(N'2019-01-01T08:50:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Анисимова', N'Художественное оформление ресниц', CAST(N'2019-06-24T16:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Кузьмина', N'Моментальный лифтинг', CAST(N'2019-04-28T08:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Колесникова', N'Консультация врача-косметолога', CAST(N'2019-06-13T15:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Ершова', N'Озонотерапия', CAST(N'2019-12-25T08:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Сидорова', N'Шугаринг', CAST(N'2019-10-07T14:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Дмитриева', N'Эстетическая лазерная шлифовка кожи', CAST(N'2019-05-22T15:50:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Лазарева', N'Микротоковая терапия', CAST(N'2019-10-05T13:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Артемьева', N'Укрепление ногтей гелем', CAST(N'2019-01-27T08:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Анисимова', N'Фонофорез лица', CAST(N'2019-11-15T17:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Баранова', N'Реконструкция и лечение волос и кожи головы', CAST(N'2019-05-06T16:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Колесникова', N'Коррекция нарощенных ресниц', CAST(N'2019-02-13T09:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Андреева', N'Покрытие ногтей', CAST(N'2019-05-20T14:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Алексеева', N'Мезотерапия', CAST(N'2019-01-19T13:50:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Быкова', N'ИК-сауна', CAST(N'2019-06-07T08:50:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Кузьмина', N'Детская стрижка', CAST(N'2019-03-21T11:50:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Орлова', N'Депиляция воском', CAST(N'2019-08-04T12:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Степанова', N'Классический маникюр', CAST(N'2019-01-11T19:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Сысоева', N'ИК-сауна', CAST(N'2019-05-26T08:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Кузьмина', N'Комбинированный маникюр', CAST(N'2019-05-04T16:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Федотова', N'Европейский маникюр', CAST(N'2019-07-23T13:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Афанасьева', N'Стрижка челки', CAST(N'2019-01-04T18:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Мамонтова', N'Художественное оформление ресниц', CAST(N'2019-10-12T19:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Колесникова', N'Фонофорез лица', CAST(N'2019-10-24T15:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Афанасьева', N'Лечебное покрытие ногтей', CAST(N'2019-05-29T14:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Кузьмина', N'Окрашивание бровей', CAST(N'2019-09-20T11:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Мамонтова', N'Инъекционные методики', CAST(N'2019-05-07T15:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Артемьева', N'Декорирование ресниц стразами', CAST(N'2019-09-11T14:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Корнилова', N'Полировка ногтей', CAST(N'2019-11-26T11:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Мамонтова', N'Шугаринг', CAST(N'2019-03-28T09:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Степанова', N'Комбинированный маникюр', CAST(N'2019-01-17T18:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Дмитриева', N'Наращивание ресниц лисьего эффекта', CAST(N'2019-01-28T15:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Турова', N'Эстетическая лазерная шлифовка кожи', CAST(N'2019-06-22T16:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Мишина', N'Спортивный массаж', CAST(N'2019-12-15T10:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Корнилова', N'Массаж ЖИВА', CAST(N'2019-06-07T12:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Турова', N'Полировка ногтей', CAST(N'2019-09-14T16:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Костина', N'Прессотерапия', CAST(N'2019-11-04T12:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Ефимова', N'Ультразвуковой пилинг', CAST(N'2019-02-26T15:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Гущина', N'Покраска ресниц', CAST(N'2019-09-13T11:50:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Попова', N'Шугаринг', CAST(N'2019-11-22T10:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Суворова', N'Окрашивание бровей', CAST(N'2019-12-09T09:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Дмитриева', N'Мезотерапия', CAST(N'2019-10-31T08:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Горбачёва', N'Прессотерапия', CAST(N'2019-08-31T11:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Алексеева', N'Коррекция нарощенных ресниц', CAST(N'2019-06-24T17:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Устинова', N'Реконструкция и лечение волос и кожи головы', CAST(N'2019-11-29T14:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Овчинникова', N'Прессотерапия', CAST(N'2019-08-25T19:50:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Артемьева', N'ИК-сауна', CAST(N'2019-11-13T11:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Суворова', N'Наращивание ресниц лисьего эффекта', CAST(N'2019-07-30T11:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Ершова', N'Наращивание ресниц лисьего эффекта', CAST(N'2019-05-25T19:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Быкова', N'Консультация врача-косметолога', CAST(N'2019-06-26T19:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Колобова', N'Прессотерапия', CAST(N'2019-11-06T11:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Колесникова', N'Коррекция нарощенных ресниц', CAST(N'2019-04-29T16:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Овчинникова', N'Оформление бровей', CAST(N'2019-10-21T19:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Андреева', N'Наращивание ресниц кукольного эффекта', CAST(N'2019-06-23T09:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Ермакова', N'Химический пилинг', CAST(N'2019-11-09T11:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Ефимова', N'Макияж', CAST(N'2019-10-02T19:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Трофимова', N'ИК-сауна', CAST(N'2019-06-07T19:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Гущина', N'Покраска ресниц', CAST(N'2019-01-17T11:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Дмитриева', N'Депиляция воском', CAST(N'2019-01-11T16:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Суворова', N'Микротоковая терапия', CAST(N'2019-11-13T09:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Устинова', N'Окрашивание бровей', CAST(N'2019-10-10T08:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Сысоева', N'Эстетическая лазерная шлифовка кожи', CAST(N'2019-03-01T16:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Быкова', N'Стрижка с покраской', CAST(N'2019-07-21T14:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Горшкова', N'Фонофорез лица', CAST(N'2019-12-21T13:40:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Корнилова', N'ИК-сауна', CAST(N'2019-10-01T12:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Мишина', N'Озонотерапия', CAST(N'2019-08-19T17:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Костина', N'Моментальный лифтинг', CAST(N'2019-03-01T15:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Горшкова', N'Реконструкция и лечение волос и кожи головы', CAST(N'2019-05-11T14:50:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Колесникова', N'Пирсинг', CAST(N'2019-12-21T19:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Быкова', N'Покрытие ногтей', CAST(N'2019-01-30T10:50:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Воронова', N'Гавайский массаж Ломи-Ломи', CAST(N'2019-03-09T16:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Артемьева', N'Коррекция нарощенных ресниц', CAST(N'2019-08-08T18:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Суворова', N'ИК-сауна', CAST(N'2019-03-04T14:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Ефимова', N'Наращивание ногтей гелем', CAST(N'2019-06-17T10:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Андреева', N'Полировка с маслом', CAST(N'2019-02-11T09:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Ефимова', N'Наращивание ногтей гелем', CAST(N'2019-02-01T12:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Овчинникова', N'Инъекционные методики', CAST(N'2019-12-11T09:50:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Шашкова', N'Инъекционные методики', CAST(N'2019-01-13T18:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Гусева', N'Покраска ресниц', CAST(N'2019-03-23T08:30:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Костина', N'Наращивание ресниц кукольного эффекта', CAST(N'2019-10-02T14:10:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Анисимова', N'Пирсинг', CAST(N'2019-01-20T09:20:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Попова', N'Покраска ресниц', CAST(N'2019-01-27T12:50:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Овчинникова', N'Татуаж', CAST(N'2019-05-19T08:00:00.000' AS DateTime))
INSERT [dbo].[Ref] ([clientid], [serviceid], [time]) VALUES (N'Бирюкова', N'Снятие лака', CAST(N'2019-11-30T19:10:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Наращивание ресниц', 1430.0000, 2400, NULL, 0.05, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Моделирование ресниц+тушь', 1390.0000, 2100, NULL, 0.1, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Ламинирование ресниц', 1740.0000, 3300, NULL, 0.25, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Русский спа массаж', 2540.0000, 3000, NULL, 0.2, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Мезотерапия', 2040.0000, 2400, NULL, 0.2, N' Услуги салона красоты\Мезотерапия.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Полуперманентная тушь', 2340.0000, 1800, NULL, 0, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N'Экспресс SPA', 2420.0000, 900, NULL, 0, N' Услуги салона красоты\Экспресс SPA.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N'Пирсинг', 1330.0000, 3300, NULL, 0, N' Услуги салона красоты\Прокол ушей пистолетом.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N'Массаж масляный', 1090.0000, 3000, NULL, 0, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N'Прессотерапия', 2350.0000, 2400, NULL, 0, N' Услуги салона красоты\Прессотерапия.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N'Европейский маникюр', 1990.0000, 3600, NULL, 0.05, N' Услуги салона красоты\Европейский маникюр.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N'Удаление доброкачественных образований кожи', 1910.0000, 900, NULL, 0, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N'Испанский массаж', 2190.0000, 2400, NULL, 0.25, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N'Наращивание ресниц кукольного эффекта', 2120.0000, 2100, NULL, 0, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N'Стрижка с покраской', 2300.0000, 1500, NULL, 0.1, N' Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N'Детокс спа', 1330.0000, 1800, NULL, 0, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N'Стоун-терапия', 2100.0000, 3000, NULL, 0.25, N' Услуги салона красоты\Стоун-терапия.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N'Радиоволновой лифтинг', 1590.0000, 3000, NULL, 0.15, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N'Химические завивки', 1090.0000, 3000, NULL, 0.2, N' Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N'Альгинатные маски', 2370.0000, 3300, NULL, 0, N' Услуги салона красоты\mask.jpeg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N'Спортивный массаж', 1650.0000, 1800, NULL, 0.15, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N'Лечебное покрытие ногтей', 1220.0000, 1800, NULL, 0, N' Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N'Реконструкция и лечение волос и кожи головы', 2360.0000, 3300, NULL, 0.15, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N'Классический маникюр', 1680.0000, 3300, NULL, 0.2, N' Услуги салона красоты\Классический маникюр.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N'Консультация врача', 2120.0000, 1800, NULL, 0, N' Услуги салона красоты\122454.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N'Наращивание ресниц лисьего эффекта', 1370.0000, 1800, NULL, 0.25, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N'Экспресс-педикюр', 2170.0000, 1200, NULL, 0.2, N' Услуги салона красоты\Экспресс-педикюр.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N'Гречишный массаж', 1520.0000, 2400, NULL, 0.15, N' Услуги салона красоты\Гречишный массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N'Комбинированный маникюр', 2390.0000, 3600, NULL, 0, N' Услуги салона красоты\Комбинированный маникюр.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N'Фонофорез лица', 1120.0000, 1200, NULL, 0.05, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N'Перманентный макияж (татуаж)', 1270.0000, 2400, NULL, 0.25, N' Услуги салона красоты\брови.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N'Химический пилинг', 1880.0000, 1500, NULL, 0.15, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N'Плазмолифтинг', 2450.0000, 900, NULL, 0.2, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N'Криолифтинг', 1090.0000, 900, NULL, 0, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N'Гликолевый поверхностный базовый пилинг', 2230.0000, 2100, NULL, 0.1, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N'Окрашивание ресниц', 1100.0000, 2100, NULL, 0, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N'Коррекция нарощенных ресниц', 1310.0000, 2700, NULL, 0.05, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N'Фракционное омоложение лазерной системой Palomar', 1140.0000, 2700, NULL, 0.05, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N'Художественное оформление ресниц', 2040.0000, 3000, NULL, 0, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N'Эстетическая лазерная шлифовка кожи', 1750.0000, 2400, NULL, 0.25, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N'Массаж ЖИВА', 2330.0000, 3300, NULL, 0.25, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N'Макияж', 2470.0000, 1800, NULL, 0.2, N' Услуги салона красоты\makeup.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N'Время вспять с коллагеном', 1850.0000, 2400, NULL, 0.1, N' Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N'Снятие ресниц', 1680.0000, 2700, NULL, 0.25, N' Услуги салона красоты\Снятие ресниц.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N'Оформление бровей', 2280.0000, 2100, NULL, 0, N' Услуги салона красоты\брови.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N'Стрижка бороды машинкой', 1750.0000, 2700, NULL, 0.1, N' Услуги салона красоты\man.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N'Маски для лица', 2250.0000, 1200, NULL, 0.1, N' Услуги салона красоты\mask.jpeg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N'Татуаж', 1330.0000, 3600, NULL, 0.2, N' Услуги салона красоты\брови.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N'Уход для проблемной и комбинированной кожи', 2440.0000, 3600, NULL, 0.15, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N'Прокол ушей пистолетом', 2040.0000, 1500, NULL, 0.05, N' Услуги салона красоты\Прокол ушей пистолетом.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (51, N'Ремонт одного ногтя', 2340.0000, 1800, NULL, 0.25, N' Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (52, N'Полировка с маслом', 1280.0000, 1200, NULL, 0, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (53, N'Омоложение зоны вокруг глаз', 2540.0000, 1800, NULL, 0.15, N' Услуги салона красоты\брови.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (54, N'Аппаратная косметология', 1180.0000, 3300, NULL, 0, N' Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (55, N'Консультация врача-косметолога', 2350.0000, 3600, NULL, 0.05, N' Услуги салона красоты\122454.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (56, N'Визаж', 1260.0000, 3000, NULL, 0, N' Услуги салона красоты\makeup.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (57, N'Демакияж', 1470.0000, 1200, NULL, 0.15, N' Услуги салона красоты\Демакияж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (58, N'Коррекция ресниц', 2010.0000, 1200, NULL, 0.1, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (59, N'Детская стрижка', 2330.0000, 2100, NULL, 0.2, N' Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (60, N'Мужская стрижка', 1690.0000, 3000, NULL, 0, N' Услуги салона красоты\man.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (61, N'Вечерняя прическа', 2020.0000, 900, NULL, 0.25, N' Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (62, N'Наращивание ресниц беличьего эффекта', 1010.0000, 1800, NULL, 0, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (63, N'Мезонити (Тредлифтинг)', 2140.0000, 1500, NULL, 0, N' Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (64, N'Покрытие ногтей', 2410.0000, 2400, NULL, 0.15, N' Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (65, N'Гавайский массаж Ломи-Ломи', 1040.0000, 2100, NULL, 0.15, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (66, N'Парафинотерапия', 1180.0000, 2100, NULL, 0.05, N' Услуги салона красоты\Парафинотерапия.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (67, N'Озонотерапия', 1740.0000, 2100, NULL, 0.2, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (68, N'Миндальный пилинг', 2430.0000, 2700, NULL, 0.15, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (69, N'Покрытие ногтей гель-лаком', 2100.0000, 900, NULL, 0.2, N' Услуги салона красоты\Покрытие ногтей гель-лаком.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (70, N'Декорирование ресниц стразами', 1920.0000, 3000, NULL, 0.15, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (71, N'Микротоковая терапия', 2410.0000, 2700, NULL, 0.05, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (72, N'Стрижка челки', 1930.0000, 2100, NULL, 0.1, N' Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (73, N'Лазерный пилинг', 1650.0000, 1200, NULL, 0.25, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (74, N'Массаж лица', 2370.0000, 3600, NULL, 0, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (75, N'Снятие лака', 1240.0000, 2100, NULL, 0, N' Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (76, N'Классический педикюр', 2040.0000, 2100, NULL, 0.25, N' Услуги салона красоты\Экспресс-педикюр.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (77, N'Классический массаж', 1120.0000, 2700, NULL, 0.15, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (78, N'Окрашивание бровей', 1120.0000, 3600, NULL, 0.1, N' Услуги салона красоты\Окрашивание бровей.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (79, N'Наращивание ногтей гелем', 1540.0000, 2400, NULL, 0.1, N' Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (80, N'Ботокс', 1820.0000, 3000, NULL, 0.15, N' Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (81, N'Инъекционные методики', 1660.0000, 2400, NULL, 0, N' Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (82, N'Покраска ресниц', 2400.0000, 1800, NULL, 0, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (83, N'Свадебная прическа', 2070.0000, 2700, NULL, 0, N' Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (84, N'Моделирование ресниц', 2140.0000, 2700, NULL, 0, N' Услуги салона красоты\Моделирование ресниц.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (85, N'Миостимуляция', 2380.0000, 3600, NULL, 0, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (86, N'Шугаринг', 1400.0000, 1800, NULL, 0, N' Услуги салона красоты\Шугаринг.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (87, N'Укрепление ногтей гелем', 1260.0000, 2700, NULL, 0, N' Услуги салона красоты\Укрепление ногтей гелем.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (88, N'Солярий', 1790.0000, 3000, NULL, 0.1, N' Услуги салона красоты\soliarij.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (89, N'Моментальный лифтинг', 2020.0000, 3000, NULL, 0, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (90, N'Детский маникюр', 1900.0000, 2100, NULL, 0, N' Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (91, N'Ультразвуковой пилинг', 1440.0000, 2700, NULL, 0.2, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (92, N'ИК-сауна', 1160.0000, 2700, NULL, 0.2, N' Услуги салона красоты\ИК-сауна.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (93, N'Контурная пластика', 1550.0000, 2100, NULL, 0.2, N' Услуги салона красоты\Контурная пластика.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (94, N'Декорирование нарощенных ресниц стразами', 1130.0000, 2700, NULL, 0, N' Услуги салона красоты\Декорирование нарощенных ресниц стразами.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (95, N'Депиляция воском', 2330.0000, 1800, NULL, 0.15, N' Услуги салона красоты\Депиляция воском.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (96, N'Полировка ногтей', 2310.0000, 3000, NULL, 0.15, N' Услуги салона красоты\Полировка ногтей.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (97, N'Фракционный лазер Palomar Emerge', 1720.0000, 1500, NULL, 0.25, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (98, N'Увлажнение с коллагеном', 2490.0000, 3300, NULL, 0, N' Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (99, N'Массаж оздоровительный', 1440.0000, 1200, NULL, 0, N' Услуги салона красоты\массаж.jpg')
GO
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (100, N'Общий массаж', 1970.0000, 2700, NULL, 0.25, N' Услуги салона красоты\массаж.jpg')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [Salon] SET  READ_WRITE 
GO
