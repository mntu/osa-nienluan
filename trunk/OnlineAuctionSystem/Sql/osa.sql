--Online Auction System
--CREATE DATABASE
Use Master
Go
If Exists(Select * From sysdatabases Where Name = 'OnlineAuction')
	Drop Database OnlineAuction
GO
CREATE DATABASE OnlineAuction
GO
USE OnlineAuction
GO
----------------
--CREATE TABLE
--ROLES
CREATE TABLE Roles
(
	RoleId int identity primary key,
	RoleName nvarchar(20)
)
GO
--Users
CREATE TABLE Users
(
	Username varchar(20) primary key,
	[Password] varchar(20),
	Fullname nvarchar(30),
	Email varchar(50),
	Phone varchar(20),
	[Address] nvarchar(255),
	SubAddress nvarchar(255),
	RoleId int foreign key references Roles(RoleId) 
)
GO
--FeedBacks
CREATE TABLE FeedBacks
(
	FeedBackId int identity primary key,
	Title nvarchar(255),
	Content ntext,
	DatePosted datetime default(getdate()),
	Username varchar(20) foreign key references Users(Username)
)
GO
--CardTypes
CREATE TABLE CardTypes
(
	TypeId int identity primary key,
	TypeName nvarchar(20)
)
GO
--CreditCards
CREATE TABLE CreditCards
(
	CardNum varchar(20) primary key,
	[ExpireDate] datetime,
	CardType int foreign key references CardTypes(TypeId),
	Username varchar(20) foreign key references Users(Username)
)
GO
--Categories
CREATE TABLE Categories
(
	CateId int identity primary key,
	CateName nvarchar(20)
)
GO
--Products
CREATE TABLE Products
(
	ProId int identity primary key,
	ProName nvarchar(50),
	[Description] ntext,
	StartPrice money,
	ImageUrl varchar(255),
	Amount int,
	Duration int,
	DatePosted datetime default(getdate()),
	NumView bigint,
	[Status] bit,
	CateId int foreign key references Categories(CateId),
	Username varchar(20) foreign key references Users(Username)
)
GO
--Listings
CREATE TABLE Listings
(
	ProId int foreign key references Products(ProId),
	Username varchar(20) foreign key references Users(Username),
	TimePosted datetime default(getdate()),
	CurrentPrice money,
	[Status] bit,
	primary key (ProId,Username,TimePosted)
)
GO
--INSERT DATA
--Roles
INSERT INTO Roles(RoleName) values('admin')
INSERT INTO Roles(RoleName) values('member')
GO
--Users
INSERT INTO Users VALUES('admin','admin@123','Administrator','admin@gmail.com','0972714115',N'đường 3-2, Q. Ninh Kiều, TPCT',null,1)
INSERT INTO Users VALUES('mntu','demo',N'Mai Nhựt Tự','mntu.it@gmail.com','0972714115',N'đường 3-2, Q. Ninh Kiều, TPCT',null,2)
INSERT INTO Users VALUES('tvhan','demo',N'Trần Võ Hoài An','anLT11714@gmail.com','01656012045',N'đường 3-2, Q. Ninh Kiều, TPCT',null,2)
GO
--