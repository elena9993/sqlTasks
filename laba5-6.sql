USE [UNIBERDB]
GO

create table [Видавництво]
(
	[Код] [int] IDENTITY(1,1),
	[Назва] [varchar](250) NOT NULL,
    CONSTRAINT [PK_VIDAV] PRIMARY KEY CLUSTERED ([Код] ASC)
) 
go

insert into [Видавництво]
SELECT distinct [Видавництво]   FROM [dbo].[books] 
go 

create table [Тема]
(
	[Код] [int] IDENTITY(1,1),
	[Назва] [varchar](250) NOT NULL,
    CONSTRAINT [PK_THEMA] PRIMARY KEY CLUSTERED ([Код] ASC)
) 
go

insert into [Тема]
SELECT distinct [Тема]   FROM [dbo].[books] 
go 

create table [Категорія]
(
	[Код] [int] IDENTITY(1,1),
	[Назва] [varchar](250) NOT NULL,
    CONSTRAINT [PK_CAT] PRIMARY KEY CLUSTERED ([Код] ASC)
) 
go

 ALTER TABLE [dbo].[books] ADD [Категорія_Код][int]
 go
 ALTER TABLE [dbo].[books] ADD [Тема_Код][int]
 go
 ALTER TABLE [dbo].[books] ADD [Видавництво_Код][int]
 go


 ALTER TABLE [dbo].[books]
   ADD CONSTRAINT FK_Thema FOREIGN KEY (Тема_Код)
      REFERENCES [Тема] ([Код])
go
 ALTER TABLE [dbo].[books]
   ADD CONSTRAINT FK_Cat FOREIGN KEY (Категорія_Код)
      REFERENCES [Категорія] ([Код])
go


 ALTER TABLE [dbo].[books]
   ADD CONSTRAINT FK_Vid FOREIGN KEY (Видавництво_Код)
      REFERENCES [Видавництво] ([Код])
go

insert into [Категорія]
SELECT distinct [Категорія]   FROM [dbo].[books] 
go 



update [books]
SET 
    [books].[Видавництво_Код] = [Видавництво].[Код]
FROM 
    [books]
     JOIN  [Видавництво] ON  [books].[Видавництво] = [Видавництво].[Назва]
go
update [books]
SET 
    [books].[Тема_Код] = [Тема].[Код]
FROM 
    [books]
     JOIN  [Тема] ON  [books].[Тема] = [Тема].[Назва]
go
update [books]
SET 
    [books].[Категорія_Код] = [Категорія].[Код]
FROM 
    [books]
     JOIN  [Категорія] ON  [books].[Категорія] = [Категорія].[Назва]
go

DROP  INDEX IND_BOOKS_VID on [books]
go
DROP  INDEX IND_BOOKS_TEMA on [books]
go
DROP  INDEX IND_BOOKS_CAT on [books]
go

ALTER TABLE [dbo].[books] DROP COLUMN [Тема]
go
ALTER TABLE [dbo].[books] DROP COLUMN [Категорія]
go
ALTER TABLE [dbo].[books] DROP COLUMN [Видавництво]
go

