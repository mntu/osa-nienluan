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
	RoleId int foreign key references Roles(RoleId),
	Question ntext,
	Answer ntext,
	[Online] bit
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
	CateName nvarchar(20),
	Fee float
)
GO
--Products
CREATE TABLE Products
(
	ProId int identity primary key,
	ProName nvarchar(50),
	[Description] ntext,
	StartPrice money,
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
INSERT INTO Users VALUES('admin','admin@123','Administrator','admin@gmail.com','0972714115',N'đường 3-2, Q. Ninh Kiều, TPCT',null,1,N'Bạn sinh ra ở đâu',N'Thốt Nốt',0)
INSERT INTO Users VALUES('mntu','demo',N'Mai Nhựt Tự','mntu.it@gmail.com','0972714115',N'đường 3-2, Q. Ninh Kiều, TPCT',null,2,N'Bạn sinh ra ở đâu',N'Thốt Nốt',0)
INSERT INTO Users VALUES('tvhan','demo',N'Trần Võ Hoài An','anLT11714@gmail.com','01656012045',N'đường 3-2, Q. Ninh Kiều, TPCT',null,2,N'Bạn sinh ra ở đâu',N'Thốt Nốt',0)
GO
--Feedbacks
INSERT INTO FeedBacks(Title,Content,DatePosted,Username) VALUES(N'Demo',N'Content of Feedback demo',DEFAULT,'mntu')
INSERT INTO FeedBacks(Title,Content,DatePosted,Username) VALUES(N'Demo 1',N'Content of Feedback demo 1',DEFAULT,'mntu')
INSERT INTO FeedBacks(Title,Content,DatePosted,Username) VALUES(N'Demo 2',N'Content of Feedback demo 2',DEFAULT,'tvhan')
INSERT INTO FeedBacks(Title,Content,DatePosted,Username) VALUES(N'Demo 3',N'Content of Feedback demo 3',DEFAULT,'tvhan')
GO
--CardType
INSERT INTO CardTypes(TypeName) VALUES(N'VISA')
INSERT INTO CardTypes(TypeName) VALUES(N'Master Card')
INSERT INTO CardTypes(TypeName) VALUES(N'Discover')
INSERT INTO CardTypes(TypeName) VALUES(N'American Express')
--Credit Card
INSERT INTO CreditCards VALUES('1010-7280-0310-7210','31-Dec-2015','1','mntu')
INSERT INTO CreditCards VALUES('1010-7320-0410-2210','31-Dec-2015','2','mntu')
INSERT INTO CreditCards VALUES('1120-7320-4501-2320','31-Dec-2015','2','tvhan')
GO
--Categories
INSERT INTO Categories(CateName,Fee) VALUES(N'Điện Thoại',5)
INSERT INTO Categories(CateName,Fee) VALUES(N'Sim Số',3)
INSERT INTO Categories(CateName,Fee) VALUES(N'Máy Tính',5)
INSERT INTO Categories(CateName,Fee) VALUES(N'Linh Kiện Máy Tính',4)
INSERT INTO Categories(CateName,Fee) VALUES(N'Linh Kiện Điện Thoại',4)
INSERT INTO Categories(CateName,Fee) VALUES(N'Hàng Độc - Hàng Lạ',4)
INSERT INTO Categories(CateName,Fee) VALUES(N'Quần Áo',3)
INSERT INTO Categories(CateName,Fee) VALUES(N'Giầy Dép',3)
INSERT INTO Categories(CateName,Fee) VALUES(N'Linh Tinh',3)
GO