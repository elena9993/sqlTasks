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
	[�����] [int] NOT NULL,
	[���] [int] NOT NULL,
	[�������] [bit] NOT NULL,
	[�����] [varchar](250) NOT NULL,
	[ֳ��] [money] NOT NULL,
	[�������] [int] NOT NULL,
	[������] [varchar](50) NULL,
	[����] [date] NOT NULL,
	[�����] [int] NOT NULL,
	[��������_���] [int] NULL,
	[����_���] [int] NULL,
	[�����������_���] [int] NULL,
 CONSTRAINT [PK_BOOKS] PRIMARY KEY CLUSTERED 
(
	[�����] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[�����������]    Script Date: 20.04.2020 14:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[�����������](
	[���] [int] IDENTITY(1,1) NOT NULL,
	[�����] [varchar](250) NOT NULL,
 CONSTRAINT [PK_VIDAV] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[����]    Script Date: 20.04.2020 14:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[����](
	[���] [int] IDENTITY(1,1) NOT NULL,
	[�����] [varchar](250) NOT NULL,
 CONSTRAINT [PK_THEMA] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[��������]    Script Date: 20.04.2020 14:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[��������](
	[���] [int] IDENTITY(1,1) NOT NULL,
	[�����] [varchar](250) NOT NULL,
 CONSTRAINT [PK_CAT] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vbooks]    Script Date: 20.04.2020 14:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vbooks] as 
SELECT [books].[�����]
      ,[books].[���]
      ,[books].[�������]
      ,[books].[�����]
      ,[books].[ֳ��]
      ,[books].[�������]
      ,[books].[������]
      ,[books].[����]
      ,[books].[�����]
      ,[�����������].[�����] as [�����������]
      ,[����].[�����] as [����]
      ,[��������].[�����] as [��������]
  FROM [dbo].[books]  join [dbo].[�����������] on [books].[�����������_���] = [�����������].[���]
  join [dbo].[����] on [books].[����_���] = [����].[���]
  join [dbo].[��������] on [books].[��������_���] = [��������].[���]
GO
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (2, 5110, 0, N'���������� �������� �����������. ������������ ��', 15.5100, 400, N'70�100/16', CAST(N'2000-07-24' AS Date), 5000, 9, 1, 1)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (8, 4985, 0, N'����� �������������� ������������ � ������ �� �� 24 ����, 2-� ���.', 18.9000, 288, N'70�100/16', CAST(N'2000-07-07' AS Date), 5000, 9, 1, 3)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (9, 5141, 0, N'��������� ������ � ���������.', 37.8000, 384, N'70�100/16', CAST(N'2000-09-29' AS Date), 5000, 9, 1, 3)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (20, 5127, 1, N'������������� ���������- ����������� �����', 21490.0000, 256, N'70�100/16', CAST(N'2000-06-15' AS Date), 5000, 9, 1, 6)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (31, 5110, 0, N'���������� �������� �����������. ������������ ��', 15.5100, 400, N'70�100/16', CAST(N'2000-07-24' AS Date), 5000, 5, 1, 1)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (46, 5199, 0, N'������ IBM 2001. ', 44042.0000, 368, N'70�100/16', CAST(N'2000-02-12' AS Date), 5000, 5, 1, 5)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (50, 3851, 1, N'������ ���������� � ������������ ������������ ������', 26.0000, 480, N'84�108/16', CAST(N'1999-04-02' AS Date), 5000, 6, 1, 2)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (58, 3932, 0, N'��� ���������� ������������ ��������� � ������������� ��������', 23924.0000, 144, N'60�88/16', CAST(N'1999-09-06' AS Date), 5000, 7, 1, 4)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (59, 4713, 0, N'Plug- ins. ������������ ���������� ��� ����������� ��������', 15281.0000, 144, N'70�100/16', CAST(N'2000-02-22' AS Date), 5000, 7, 1, 4)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (175, 5217, 0, N'Windows ��. �������� ������ ��������', 16.5700, 320, N'70�100/16', CAST(N'2000-08-25' AS Date), 5000, 4, 2, 8)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (176, 4829, 0, N'Windows 2000 Professional ��� �� ����� � �D', 27.2500, 320, N'70�100/16', CAST(N'2000-04-28' AS Date), 5000, 4, 2, 9)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (188, 5170, 0, N'Linux ������� ������', 24.4300, 346, N'70�100/16', CAST(N'2000-09-29' AS Date), 5000, 2, 2, 4)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (191, 860, 0, N'������������ ������� UNIX', 18323.0000, 395, N'84�100\16', CAST(N'1997-05-05' AS Date), 5000, 3, 2, 1)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (203, 44, 0, N'������ �� ���������� ������� �� OS/2 Warp', 5.0000, 352, N'60�84/16', CAST(N'1996-03-20' AS Date), 5000, 8, 2, 2)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (206, 5176, 0, N'Windows ��. ������� ������������', 29190.0000, 306, N'', CAST(N'2000-10-10' AS Date), 5000, 8, 2, 7)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (209, 5462, 0, N'���� ���������������� �++. ������ � ����������', 29.0000, 656, N'84�108/16', CAST(N'2000-12-12' AS Date), 5000, 1, 3, 2)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (210, 4982, 0, N'���� ���������������� �. ������ � ����������', 29.0000, 432, N'84�108/16', CAST(N'2000-12-07' AS Date), 5000, 1, 3, 2)
INSERT [dbo].[books] ([�����], [���], [�������], [�����], [ֳ��], [�������], [������], [����], [�����], [��������_���], [����_���], [�����������_���]) VALUES (220, 4687, 0, N'����������� ������������� C++ .50 ������������ �� ��������� ����� �������� � ��������', 17.6000, 240, N'70�100/16', CAST(N'2000-03-02' AS Date), 5000, 1, 3, 4)
GO
SET IDENTITY_INSERT [dbo].[�����������] ON 

INSERT [dbo].[�����������] ([���], [�����]) VALUES (1, N'BHV �.-���������')
INSERT [dbo].[�����������] ([���], [�����]) VALUES (2, N'DiaSoft')
INSERT [dbo].[�����������] ([���], [�����]) VALUES (3, N'�������')
INSERT [dbo].[�����������] ([���], [�����]) VALUES (4, N'���')
INSERT [dbo].[�����������] ([���], [�����]) VALUES (5, N'��������')
INSERT [dbo].[�����������] ([���], [�����]) VALUES (6, N'�����')
INSERT [dbo].[�����������] ([���], [�����]) VALUES (7, N'������� ��������')
INSERT [dbo].[�����������] ([���], [�����]) VALUES (8, N'������')
INSERT [dbo].[�����������] ([���], [�����]) VALUES (9, N'����')
SET IDENTITY_INSERT [dbo].[�����������] OFF
GO
SET IDENTITY_INSERT [dbo].[��������] ON 

INSERT [dbo].[��������] ([���], [�����]) VALUES (1, N'C&C++')
INSERT [dbo].[��������] ([���], [�����]) VALUES (2, N'Linux')
INSERT [dbo].[��������] ([���], [�����]) VALUES (3, N'Unix')
INSERT [dbo].[��������] ([���], [�����]) VALUES (4, N'Windows 2000')
INSERT [dbo].[��������] ([���], [�����]) VALUES (5, N'������� ������ ��')
INSERT [dbo].[��������] ([���], [�����]) VALUES (6, N'������ � ������� ��')
INSERT [dbo].[��������] ([���], [�����]) VALUES (7, N'���� �����')
INSERT [dbo].[��������] ([���], [�����]) VALUES (8, N'���� ��������� �������')
INSERT [dbo].[��������] ([���], [�����]) VALUES (9, N'ϳ��������')
SET IDENTITY_INSERT [dbo].[��������] OFF
GO
SET IDENTITY_INSERT [dbo].[����] ON 

INSERT [dbo].[����] ([���], [�����]) VALUES (1, N'������������ �� � ������')
INSERT [dbo].[����] ([���], [�����]) VALUES (2, N'��������� �������')
INSERT [dbo].[����] ([���], [�����]) VALUES (3, N'�������������')
SET IDENTITY_INSERT [dbo].[����] OFF
GO
/****** Object:  Index [IND_BOOKS_DATE]    Script Date: 20.04.2020 14:33:03 ******/
CREATE NONCLUSTERED INDEX [IND_BOOKS_DATE] ON [dbo].[books]
(
	[����] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IND_BOOKS_NEW]    Script Date: 20.04.2020 14:33:03 ******/
CREATE NONCLUSTERED INDEX [IND_BOOKS_NEW] ON [dbo].[books]
(
	[�������] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_Cat] FOREIGN KEY([��������_���])
REFERENCES [dbo].[��������] ([���])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_Cat]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_Thema] FOREIGN KEY([����_���])
REFERENCES [dbo].[����] ([���])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_Thema]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_Vid] FOREIGN KEY([�����������_���])
REFERENCES [dbo].[�����������] ([���])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_Vid]
GO
USE [master]
GO
ALTER DATABASE [UNIBERDB5] SET  READ_WRITE 
GO
