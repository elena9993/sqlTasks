USE [master]
GO
/****** Object:  Database [UNIBERDB]    Script Date: 20.04.2020 14:34:30 ******/
CREATE DATABASE [UNIBERDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UNIBERDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UNIBERDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UNIBERDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UNIBERDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UNIBERDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UNIBERDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UNIBERDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UNIBERDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UNIBERDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UNIBERDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UNIBERDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UNIBERDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UNIBERDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UNIBERDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UNIBERDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UNIBERDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UNIBERDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UNIBERDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UNIBERDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UNIBERDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UNIBERDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UNIBERDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UNIBERDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UNIBERDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UNIBERDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UNIBERDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UNIBERDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UNIBERDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UNIBERDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UNIBERDB] SET  MULTI_USER 
GO
ALTER DATABASE [UNIBERDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UNIBERDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UNIBERDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UNIBERDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UNIBERDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UNIBERDB] SET QUERY_STORE = OFF
GO
USE [UNIBERDB]
GO
/****** Object:  Table [dbo].[books]    Script Date: 20.04.2020 14:34:31 ******/
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
	[Видавництво] [varchar](200) NOT NULL,
	[Сторінки] [int] NOT NULL,
	[Формат] [varchar](50) NULL,
	[Дата] [date] NOT NULL,
	[Тираж] [int] NOT NULL,
	[Тема] [varchar](250) NOT NULL,
	[Категорія] [varchar](150) NOT NULL,
 CONSTRAINT [PK_BOOKS] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (2, 5110, 0, N'Аппаратные средства мультимедия. Видеосистема РС', 15.5100, N'BHV С.-Петербург', 400, N'70х100/16', CAST(N'2000-07-24' AS Date), 5000, N'Використання ПК в цілому', N'Підручники')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (8, 4985, 0, N'Освой самостоятельно модернизацию и ремонт ПК за 24 часа, 2-е изд.', 18.9000, N'Вильямс', 288, N'70х100/16', CAST(N'2000-07-07' AS Date), 5000, N'Використання ПК в цілому', N'Підручники')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (9, 5141, 0, N'Структуры данных и алгоритмы.', 37.8000, N'Вильямс', 384, N'70х100/16', CAST(N'2000-09-29' AS Date), 5000, N'Використання ПК в цілому', N'Підручники')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (20, 5127, 1, N'Автоматизация инженерно- графических работ', 21490.0000, N'Питер', 256, N'70х100/16', CAST(N'2000-06-15' AS Date), 5000, N'Використання ПК в цілому', N'Підручники')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (31, 5110, 0, N'Аппаратные средства мультимедия. Видеосистема РС', 15.5100, N'BHV С.-Петербург', 400, N'70х100/16', CAST(N'2000-07-24' AS Date), 5000, N'Використання ПК в цілому', N'Апаратні засоби ПК')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (46, 5199, 0, N'Железо IBM 2001. ', 44042.0000, N'МикроАрт', 368, N'70х100/16', CAST(N'2000-02-12' AS Date), 5000, N'Використання ПК в цілому', N'Апаратні засоби ПК')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (50, 3851, 1, N'Защита информации и безопасность компьютерных систем', 26.0000, N'DiaSoft', 480, N'84х108/16', CAST(N'1999-04-02' AS Date), 5000, N'Використання ПК в цілому', N'Захист і безпека ПК')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (58, 3932, 0, N'Как превратить персональный компьютер в измерительный комплекс', 23924.0000, N'ДМК', 144, N'60х88/16', CAST(N'1999-09-06' AS Date), 5000, N'Використання ПК в цілому', N'Інші книги')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (59, 4713, 0, N'Plug- ins. Встраиваемые приложения для музыкальных программ', 15281.0000, N'ДМК', 144, N'70х100/16', CAST(N'2000-02-22' AS Date), 5000, N'Використання ПК в цілому', N'Інші книги')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (175, 5217, 0, N'Windows МЕ. Новейшие версии программ', 16.5700, N'Триумф', 320, N'70х100/16', CAST(N'2000-08-25' AS Date), 5000, N'Операційні системи', N'Windows 2000')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (176, 4829, 0, N'Windows 2000 Professional шаг за шагом с СD', 27.2500, N'Эком', 320, N'70х100/16', CAST(N'2000-04-28' AS Date), 5000, N'Операційні системи', N'Windows 2000')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (188, 5170, 0, N'Linux Русские версии', 24.4300, N'ДМК', 346, N'70х100/16', CAST(N'2000-09-29' AS Date), 5000, N'Операційні системи', N'Linux')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (191, 860, 0, N'Операционная система UNIX', 18323.0000, N'BHV С.-Петербург', 395, N'84х100\16', CAST(N'1997-05-05' AS Date), 5000, N'Операційні системи', N'Unix')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (203, 44, 0, N'Ответы на актуальные вопросы по OS/2 Warp', 5.0000, N'DiaSoft', 352, N'60х84/16', CAST(N'1996-03-20' AS Date), 5000, N'Операційні системи', N'Інші операційні системи')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (206, 5176, 0, N'Windows Ме. Спутник пользователя', 29190.0000, N'Русская редакция', 306, N'', CAST(N'2000-10-10' AS Date), 5000, N'Операційні системи', N'Інші операційні системи')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (209, 5462, 0, N'Язык программирования С++. Лекции и упражнения', 29.0000, N'DiaSoft', 656, N'84х108/16', CAST(N'2000-12-12' AS Date), 5000, N'Програмування', N'C&C++')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (210, 4982, 0, N'Язык программирования С. Лекции и упражнения', 29.0000, N'DiaSoft', 432, N'84х108/16', CAST(N'2000-12-07' AS Date), 5000, N'Програмування', N'C&C++')
INSERT [dbo].[books] ([Номер], [Код], [Новинка], [Назва], [Ціна], [Видавництво], [Сторінки], [Формат], [Дата], [Тираж], [Тема], [Категорія]) VALUES (220, 4687, 0, N'Эффективное использование C++ .50 рекомендаций по улучшению ваших программ и проектов', 17.6000, N'ДМК', 240, N'70х100/16', CAST(N'2000-03-02' AS Date), 5000, N'Програмування', N'C&C++')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IND_BOOKS_CAT]    Script Date: 20.04.2020 14:34:32 ******/
CREATE NONCLUSTERED INDEX [IND_BOOKS_CAT] ON [dbo].[books]
(
	[Категорія] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IND_BOOKS_DATE]    Script Date: 20.04.2020 14:34:32 ******/
CREATE NONCLUSTERED INDEX [IND_BOOKS_DATE] ON [dbo].[books]
(
	[Дата] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IND_BOOKS_NEW]    Script Date: 20.04.2020 14:34:32 ******/
CREATE NONCLUSTERED INDEX [IND_BOOKS_NEW] ON [dbo].[books]
(
	[Новинка] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IND_BOOKS_TEMA]    Script Date: 20.04.2020 14:34:32 ******/
CREATE NONCLUSTERED INDEX [IND_BOOKS_TEMA] ON [dbo].[books]
(
	[Тема] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IND_BOOKS_VID]    Script Date: 20.04.2020 14:34:32 ******/
CREATE NONCLUSTERED INDEX [IND_BOOKS_VID] ON [dbo].[books]
(
	[Видавництво] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [UNIBERDB] SET  READ_WRITE 
GO
