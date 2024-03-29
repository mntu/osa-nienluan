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
	Username varchar(20) foreign key references Users(Username) ON DELETE CASCADE ON UPDATE CASCADE
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
	CardType int foreign key references CardTypes(TypeId) ON UPDATE CASCADE,
	Username varchar(20) foreign key references Users(Username) ON DELETE CASCADE ON UPDATE CASCADE
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
	Fee float,
	NumView bigint,
	[Status] bit default(1),
	CateId int foreign key references Categories(CateId) ON UPDATE CASCADE,
	Username varchar(20) foreign key references Users(Username)
)
GO
--Listings
CREATE TABLE Listings
(
	ProId int foreign key references Products(ProId) ON DELETE CASCADE ON UPDATE CASCADE,
	Username varchar(20) foreign key references Users(Username) ON DELETE CASCADE ON UPDATE CASCADE,
	TimePosted datetime default(getdate()),
	CurrentPrice money,
	[Status] bit,
	primary key (ProId,Username,TimePosted)
)
GO
--Trgger DELETE Users
CREATE TRIGGER Del_Users ON Users
Instead of Delete
as
	delete from Products where Username=(select Username from deleted)
	delete from Users where Username=(select Username from deleted)
GO
--INSERT DATA
--Roles
INSERT INTO Roles(RoleName) values('admin')
INSERT INTO Roles(RoleName) values('member')
GO
--Users
INSERT INTO Users VALUES('admin','admin@123','Administrator','admin@gmail.com','0972714115',N'đường 3-2, Q. Ninh Kiều, TPCT',null,1,N'Bạn sinh ra ở đâu ?',N'Thốt Nốt',0)
INSERT INTO Users VALUES('mntu','demo',N'Mai Nhựt Tự','mntu.it@gmail.com','0972714115',N'đường 3-2, Q. Ninh Kiều, TPCT',null,2,N'Bạn sinh ra ở đâu ?',N'Thốt Nốt',0)
INSERT INTO Users VALUES('tvhan','demo',N'Trần Võ Hoài An','anLT11714@gmail.com','01656012045',N'đường 3-2, Q. Ninh Kiều, TPCT',null,2,N'Bạn sinh ra ở đâu ?',N'Thốt Nốt',0)
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
INSERT INTO Categories(CateName,Fee) VALUES(N'Laptop - PC',5)
INSERT INTO Categories(CateName,Fee) VALUES(N'Máy Tính Bảng',5)
INSERT INTO Categories(CateName,Fee) VALUES(N'Linh Kiện Máy Tính',4)
INSERT INTO Categories(CateName,Fee) VALUES(N'Linh Kiện Điện Thoại',4)
INSERT INTO Categories(CateName,Fee) VALUES(N'Hàng Độc - Hàng Lạ',3)
INSERT INTO Categories(CateName,Fee) VALUES(N'Quần Áo',3)
INSERT INTO Categories(CateName,Fee) VALUES(N'Giầy Dép',3)
INSERT INTO Categories(CateName,Fee) VALUES(N'Linh Tinh',3)
GO
--Products
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Giày cao gót ankle boots',N'Mô tả chi tiết Giày cao gót ankle boots đính mặt kim loại cá tính mạnh mẽ',699000,1,5,1,8,'mntu',7);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Túi Satchel thời trang',N'Mô tả chi tiết Túi Satchel cổ điển thời trang',199000,1,5,1,9,'mntu',7);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Váy ôm tôn dáng nữ tính',N'Mô tả chi tiết Váy ôm tôn dáng nữ tính',199000,1,5,1,7,'mntu',7);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Kính MP3 bộ nhớ 2GB',N'Mô tả chi tiết Kính MP3 bộ nhớ 2GB',199000,1,5,1,6,'mntu',7);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Ống zoom cho iphone 4',N'Mô tả chi tiết Ống zoom cho iphone 4',199000,1,3,1,5,'mntu',6.5);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Loa quả táo Apple có đèn 2.0',N'Mô tả chi tiết Loa quả táo Apple có đèn 2.0',99000,1,3,1,4,'mntu',6.5);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Sony Xperia S',N'Mô tả chi tiết Sony Xperia S',7000000,1,3,1,1,'mntu',7.5);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Samsung Galaxy S3',N'Mô tả chi tiết Samsung Galaxy S3',8500000,1,3,1,1,'mntu',7.5);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Iphone 5 64GB',N'Mô tả chi tiết Iphone 5 64GB',15000000,1,3,1,1,'mntu',7.5);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Macbook Pro (i5-2430M)',N'Mô tả chi tiết Macbook Pro MC313ZP/A (i5-2430M)',17000000,1,5,1,2,'mntu',9);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Dell BMW 14Z - 5423 (i7-3517U)',N'Mô tả chi tiết Dell BMW 14Z - 5423 (i7-3517U) YMRY22',15000000,1,5,1,2,'mntu',9);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'ASUS K45VM (i7-3610QE)',N'Mô tả chi tiết ASUS K45VM (i7-3610QE)',14599000,1,7,1,2,'mntu',10);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Apple iPad 3 32GB',N'Mô tả chi tiết Apple iPad 3 32GB',10999000,1,5,1,3,'mntu',9);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Apple iPad 4 34GB',N'Mô tả chi tiết Apple iPad 4 64GB',17999000,1,5,1,3,'mntu',9);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'SS Galaxy Note II',N'Mô tả chi tiết Samsung Galaxy Note II',13000000,1,3,1,3,'mntu',7.5);
INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,NumView,CateId,Username,Fee) VALUES(N'Sony Xperia Tablet S 3G',N'Mô tả chi tiết Sony Xperia Tablet S 3G',15000000,1,10,1,3,'mntu',12);
GO