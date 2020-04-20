USE [master]
GO
/****** Object:  Database [UNIBERDB5]    Script Date: 20.04.2020 14:33:00 ******/
CREATE DATABASE [UNIBERDB5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UNIBERDB5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UNIBERDB5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UNIBERDB5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UNIBERDB5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UNIBERDB5] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UNIBERDB5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UNIBERDB5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UNIBERDB5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UNIBERDB5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UNIBERDB5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UNIBERDB5] SET ARITHABORT OFF 
GO
ALTER DATABASE [UNIBERDB5] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UNIBERDB5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UNIBERDB5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UNIBERDB5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UNIBERDB5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UNIBERDB5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UNIBERDB5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UNIBERDB5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UNIBERDB5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UNIBERDB5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UNIBERDB5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UNIBERDB5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UNIBERDB5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UNIBERDB5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UNIBERDB5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UNIBERDB5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UNIBERDB5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UNIBERDB5] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UNIBERDB5] SET  MULTI_USER 
GO
ALTER DATABASE [UNIBERDB5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UNIBERDB5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UNIBERDB5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UNIBERDB5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UNIBERDB5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UNIBERDB5] SET QUERY_STORE = OFF
GO
USE [UNIBERDB5]
GO
/****** Object:  Table [dbo].[books]    Script Date: 20.04.2020 14:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[Номер] [int] NOT NULL,
	[Код] [int] NOT NULL,
	[Новинка] [bit] NOT NULL,
	[Назва] [varchar](250) NOT NULL,
	[Ціна] [money] NOT NULL,
	[Сторінки] [int] NOT NULL,
	[Формат] [varchar](50) NULL,
	[Дата] [date] NOT NULL,
	[Тираж] [int] NOT NULL,
	[Категорія_Код] [int] NULL,
	[Тема_Код] [int] NULL,
	[Видавництво_Код] [int] NULL,
 CONSTRAINT [PK_BOOKS] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Видавництво]    Script Date: 20.04.2020 14:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Видавництво](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Назва] [varchar](250) NOT NULL,
 CONSTRAINT [PK_VIDAV] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тема]    Script Date: 20.04.2020 14:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тема](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Назва] [varchar](250) NOT NULL,
 CONSTRAINT [PK_THEMA] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Категорія]    Script Date: 20.04.2020 14:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Категорія](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Назва] [varchar](250) NOT NULL,
 CONSTRAINT [PK_CAT] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vbooks]    Script Date: 20.04.2020 14:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vbooks] as 
SELECT [books].[Номер]
      ,[books].[Код]
      ,[books].[Новинка]
      ,[books].[Назва]
      ,[books].[Ціна]
      ,[books].[Сторінки]
      ,[books].[Формат]
      ,[books].[Дата]
      ,[books].[Тираж]
      ,[Видавництво].[Назва] as [Видавництво]
      ,[Тема].[Назва] as [Тема]
      ,[Категорія].[Назва] as [Категорія]
  FROM [dbo].[books]  join [dbo].[Видавництво] on [books].[Видавництво_Код] = [Видавництво].[Код]
  join [dbo].[Тема] on [books].[Тема_Код] = [Тема].[Код]
  join [dbo].[Категорія] on [books].[Категорія_Код] = [Категорія].[Код]
GO
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (2, 5110, 0, N'Аппаратные средства мультимедия. Видеосистема РС', 15.5100, 400, N'70х100/16', CAST(N'2000-07-24' AS Date), 5000, 9, 1, 1)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (8, 4985, 0, N'Освой самостоятельно модернизацию и ремонт ПК за 24 часа, 2-е изд.', 18.9000, 288, N'70х100/16', CAST(N'2000-07-07' AS Date), 5000, 9, 1, 3)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (9, 5141, 0, N'Структуры данных и алгоритмы.', 37.8000, 384, N'70х100/16', CAST(N'2000-09-29' AS Date), 5000, 9, 1, 3)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (20, 5127, 1, N'Автоматизация инженерно- графических работ', 21490.0000, 256, N'70х100/16', CAST(N'2000-06-15' AS Date), 5000, 9, 1, 6)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (31, 5110, 0, N'Аппаратные средства мультимедия. Видеосистема РС', 15.5100, 400, N'70х100/16', CAST(N'2000-07-24' AS Date), 5000, 5, 1, 1)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (46, 5199, 0, N'Железо IBM 2001. ', 44042.0000, 368, N'70х100/16', CAST(N'2000-02-12' AS Date), 5000, 5, 1, 5)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (50, 3851, 1, N'Защита информации и безопасность компьютерных систем', 26.0000, 480, N'84х108/16', CAST(N'1999-04-02' AS Date), 5000, 6, 1, 2)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (58, 3932, 0, N'Как превратить персональный компьютер в измерительный комплекс', 23924.0000, 144, N'60х88/16', CAST(N'1999-09-06' AS Date), 5000, 7, 1, 4)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (59, 4713, 0, N'Plug- ins. Встраиваемые приложения для музыкальных программ', 15281.0000, 144, N'70х100/16', CAST(N'2000-02-22' AS Date), 5000, 7, 1, 4)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (175, 5217, 0, N'Windows МЕ. Новейшие версии программ', 16.5700, 320, N'70х100/16', CAST(N'2000-08-25' AS Date), 5000, 4, 2, 8)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (176, 4829, 0, N'Windows 2000 Professional шаг за шагом с СD', 27.2500, 320, N'70х100/16', CAST(N'2000-04-28' AS Date), 5000, 4, 2, 9)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (188, 5170, 0, N'Linux Русские версии', 24.4300, 346, N'70х100/16', CAST(N'2000-09-29' AS Date), 5000, 2, 2, 4)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (191, 860, 0, N'Операционная система UNIX', 18323.0000, 395, N'84х100\16', CAST(N'1997-05-05' AS Date), 5000, 3, 2, 1)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (203, 44, 0, N'Ответы на актуальные вопросы по OS/2 Warp', 5.0000, 352, N'60х84/16', CAST(N'1996-03-20' AS Date), 5000, 8, 2, 2)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (206, 5176, 0, N'Windows Ме. Спутник пользователя', 29190.0000, 306, N'', CAST(N'2000-10-10' AS Date), 5000, 8, 2, 7)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (209, 5462, 0, N'Язык программирования С++. Лекции и упражнения', 29.0000, 656, N'84х108/16', CAST(N'2000-12-12' AS Date), 5000, 1, 3, 2)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (210, 4982, 0, N'Язык программирования С. Лекции и упражнения', 29.0000, 432, N'84х108/16', CAST(N'2000-12-07' AS Date), 5000, 1, 3, 2)
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Сторінки], [Формат], [Дата], [Тираж], [Категорія_Код], [Тема_Код], [Видавництво_Код]) VALUES (220, 4687, 0, N'Эффективное использование C++ .50 рекомендаций по улучшению ваших программ и проектов', 17.6000, 240, N'70х100/16', CAST(N'2000-03-02' AS Date), 5000, 1, 3, 4)
GO
SET IDENTITY_INSERT [dbo].[Видавництво] ON 

INSERT [dbo].[Видавництво] ([Код], [Назва]) VALUES (1, N'BHV С.-Петербург')
INSERT [dbo].[Видавництво] ([Код], [Назва]) VALUES (2, N'DiaSoft')
INSERT [dbo].[Видавництво] ([Код], [Назва]) VALUES (3, N'Вильямс')
INSERT [dbo].[Видавництво] ([Код], [Назва]) VALUES (4, N'ДМК')
INSERT [dbo].[Видавництво] ([Код], [Назва]) VALUES (5, N'МикроАрт')
INSERT [dbo].[Видавництво] ([Код], [Назва]) VALUES (6, N'Питер')
INSERT [dbo].[Видавництво] ([Код], [Назва]) VALUES (7, N'Русская редакция')
INSERT [dbo].[Видавництво] ([Код], [Назва]) VALUES (8, N'Триумф')
INSERT [dbo].[Видавництво] ([Код], [Назва]) VALUES (9, N'Эком')
SET IDENTITY_INSERT [dbo].[Видавництво] OFF
GO
SET IDENTITY_INSERT [dbo].[Категорія] ON 

INSERT [dbo].[Категорія] ([Код], [Назва]) VALUES (1, N'C&C++')
INSERT [dbo].[Категорія] ([Код], [Назва]) VALUES (2, N'Linux')
INSERT [dbo].[Категорія] ([Код], [Назва]) VALUES (3, N'Unix')
INSERT [dbo].[Категорія] ([Код], [Назва]) VALUES (4, N'Windows 2000')
INSERT [dbo].[Категорія] ([Код], [Назва]) VALUES (5, N'Апаратні засоби ПК')
INSERT [dbo].[Категорія] ([Код], [Назва]) VALUES (6, N'Захист і безпека ПК')
INSERT [dbo].[Категорія] ([Код], [Назва]) VALUES (7, N'Інші книги')
INSERT [dbo].[Категорія] ([Код], [Назва]) VALUES (8, N'Інші операційні системи')
INSERT [dbo].[Категорія] ([Код], [Назва]) VALUES (9, N'Підручники')
SET IDENTITY_INSERT [dbo].[Категорія] OFF
GO
SET IDENTITY_INSERT [dbo].[Тема] ON 

INSERT [dbo].[Тема] ([Код], [Назва]) VALUES (1, N'Використання ПК в цілому')
INSERT [dbo].[Тема] ([Код], [Назва]) VALUES (2, N'Операційні системи')
INSERT [dbo].[Тема] ([Код], [Назва]) VALUES (3, N'Програмування')
SET IDENTITY_INSERT [dbo].[Тема] OFF
GO
/****** Object:  Index [IND_BOOKS_DATE]    Script Date: 20.04.2020 14:33:03 ******/
CREATE NONCLUSTERED INDEX [IND_BOOKS_DATE] ON [dbo].[books]
(
	[Дата] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IND_BOOKS_NEW]    Script Date: 20.04.2020 14:33:03 ******/
CREATE NONCLUSTERED INDEX [IND_BOOKS_NEW] ON [dbo].[books]
(
	[Новинка] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_Cat] FOREIGN KEY([Категорія_Код])
REFERENCES [dbo].[Категорія] ([Код])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_Cat]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_Thema] FOREIGN KEY([Тема_Код])
REFERENCES [dbo].[Тема] ([Код])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_Thema]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_Vid] FOREIGN KEY([Видавництво_Код])
REFERENCES [dbo].[Видавництво] ([Код])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_Vid]
GO
USE [master]
GO
ALTER DATABASE [UNIBERDB5] SET  READ_WRITE 
GO
