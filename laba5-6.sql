USE [UNIBERDB]
GO

create table [�����������]
(
	[���] [int] IDENTITY(1,1),
	[�����] [varchar](250) NOT NULL,
    CONSTRAINT [PK_VIDAV] PRIMARY KEY CLUSTERED ([���] ASC)
) 
go

insert into [�����������]
SELECT distinct [�����������]   FROM [dbo].[books] 
go 

create table [����]
(
	[���] [int] IDENTITY(1,1),
	[�����] [varchar](250) NOT NULL,
    CONSTRAINT [PK_THEMA] PRIMARY KEY CLUSTERED ([���] ASC)
) 
go

insert into [����]
SELECT distinct [����]   FROM [dbo].[books] 
go 

create table [��������]
(
	[���] [int] IDENTITY(1,1),
	[�����] [varchar](250) NOT NULL,
    CONSTRAINT [PK_CAT] PRIMARY KEY CLUSTERED ([���] ASC)
) 
go

 ALTER TABLE [dbo].[books] ADD [��������_���][int]
 go
 ALTER TABLE [dbo].[books] ADD [����_���][int]
 go
 ALTER TABLE [dbo].[books] ADD [�����������_���][int]
 go


 ALTER TABLE [dbo].[books]
   ADD CONSTRAINT FK_Thema FOREIGN KEY (����_���)
      REFERENCES [����] ([���])
go
 ALTER TABLE [dbo].[books]
   ADD CONSTRAINT FK_Cat FOREIGN KEY (��������_���)
      REFERENCES [��������] ([���])
go


 ALTER TABLE [dbo].[books]
   ADD CONSTRAINT FK_Vid FOREIGN KEY (�����������_���)
      REFERENCES [�����������] ([���])
go

insert into [��������]
SELECT distinct [��������]   FROM [dbo].[books] 
go 



update [books]
SET 
    [books].[�����������_���] = [�����������].[���]
FROM 
    [books]
     JOIN  [�����������] ON  [books].[�����������] = [�����������].[�����]
go
update [books]
SET 
    [books].[����_���] = [����].[���]
FROM 
    [books]
     JOIN  [����] ON  [books].[����] = [����].[�����]
go
update [books]
SET 
    [books].[��������_���] = [��������].[���]
FROM 
    [books]
     JOIN  [��������] ON  [books].[��������] = [��������].[�����]
go

DROP  INDEX IND_BOOKS_VID on [books]
go
DROP  INDEX IND_BOOKS_TEMA on [books]
go
DROP  INDEX IND_BOOKS_CAT on [books]
go

ALTER TABLE [dbo].[books] DROP COLUMN [����]
go
ALTER TABLE [dbo].[books] DROP COLUMN [��������]
go
ALTER TABLE [dbo].[books] DROP COLUMN [�����������]
go

