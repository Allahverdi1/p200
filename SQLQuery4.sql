CREATE DATABASE FlowerShop
USE FlowerShop

CREATE TABLE Sliders
(
Id INT PRIMARY KEY IDENTITY,
Title NVARCHAR(200) NOT NULL,
Text NVARCHAR(200) NOT NULL,
Image NVARCHAR(100),
OrderCount INT
)

CREATE TABLE Categories
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(30) NOT NULL
)

CREATE TABLE Products
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20) NOT NULL,
Price DECIMAL(18,2) NOT NULL CONSTRAINT pro_pr_check CHECK (Price>=0),
CategoryId INT  CONSTRAINT pr_ct_chck FOREIGN KEY REFERENCES Categories(Id),
DiscountAmount DECIMAL(18,2) NOT NULL CONSTRAINT pro_dis_check CHECK (DiscountAmount>=0),
IsNew BIT,
Count INT,
[Desc] NVARCHAR(1500),
Code NVARCHAR(10),
CostPrice DECIMAL(18,2) NOT NULL CONSTRAINT pro_cstprice_chck CHECK (CostPrice>=0)
)

CREATE TABLE Tags
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20) NOT NULL
)

CREATE TABLE ProductTags
(
 Id INT PRIMARY KEY IDENTITY,
 TagId INT NOT NULL CONSTRAINT protg_tgId FOREIGN KEY REFERENCES Tags(Id),
 ProductId INT NOT NULL CONSTRAINT protg_proId FOREIGN KEY REFERENCES Products(Id)
)

CREATE TABLE ProductImages
(
Id INT PRIMARY KEY IDENTITY,
ProductId INT NOT NULL CONSTRAINT pro_productId FOREIGN KEY REFERENCES Products(Id),
Image NVARCHAR(100) NOT NULL
)

CREATE TABLE AdditionalInfoTypes
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(30) NOT NULL
)

CREATE TABLE AdditionalInfos
(
Id INT PRIMARY KEY IDENTITY,
ProductId INT NOT NULL CONSTRAINT add_proId FOREIGN KEY REFERENCES Products(Id),
AdditionalTypeId INT NOT NULL CONSTRAINT add_id FOREIGN KEY REFERENCES AdditionalInfoTypes(Id),
Value NVARCHAR(30) NOT NULL
)

CREATE TABLE Users
(
Id INT PRIMARY KEY IDENTITY,
Fullname NVARCHAR(35) NOT NULL,
Email NVARCHAR(100) NOT NULL,
Image NVARCHAR(100) NOT NULL,
PasswordHash NVARCHAR(100) NOT NULL,
Adress NVARCHAR(100) NOT NULL
)

CREATE TABLE Reviews
(
Id INT PRIMARY KEY IDENTITY,
ProductId INT NOT NULL CONSTRAINT rew_proid FOREIGN KEY REFERENCES Products(Id),
UserId INT NOT NULL CONSTRAINT rew_userId FOREIGN KEY REFERENCES Users(Id),
Name NVARCHAR(35) NOT NULL,
Email NVARCHAR(100) NOT NULL,
Text NVARCHAR(350) NOT NULL,
CreatedAt DATETIME2 DEFAULT(GETDATE())
)
 
 CREATE TABLE Orders
 (
 Id INT PRIMARY KEY IDENTITY,
 UserId INT NOT NULL CONSTRAINT order_userId FOREIGN KEY REFERENCES Users(Id),
 CreatedAt DATETIME2 DEFAULT(GETDATE()),
 DeliveriedAt DATETIME2 DEFAULT(GETDATE()),
 Status TINYINT NOT NULL,
 PaymentStatus TINYINT NOT NULL,
 TotalAmount DECIMAL(18,2) NOT NULL CONSTRAINT ord_totalAmount_check CHECK(TotalAmount>=0),
 Address NVARCHAR(100) NOT NULL,
 Email NVARCHAR(50) NOT NULL UNIQUE,
 Fullname NVARCHAR(100) NOT NULL
)

CREATE TABLE OrderItems
(
Id INT PRIMARY KEY IDENTITY,
ProductId INT NOT NULL CONSTRAINT orditems_product FOREIGN KEY REFERENCES Products(Id),
OrderId INT NOT NULL CONSTRAINT orditems_order FOREIGN KEY REFERENCES Orders(Id),
Count INT,
Price DECIMAL(18,2) NOT NULL CONSTRAINT orditems_price_check CHECK (Price>=0),
DiscountAmount DECIMAL(18,2) NOT NULL CONSTRAINT orditems_disAmount_check CHECK (DiscountAmount>=0),
CostPrice DECIMAL(18,2) NOT NULL CONSTRAINT orditems_costPrice_check CHECK (CostPrice>=0)
)

INSERT INTO Sliders
VALUES
('Title-1','Text-1','Image-1',1),
('Title-2','Text-2','Image-2',3),
('Title-3','Text-3','Image-3',4),
('Title-4','Text-4','Image-4',5),
('Title-5','Text-5','Image-5',6),
('Title-6','Text-6','Image-6',7)

SELECT * FROM Sliders

INSERT INTO Categories
VALUES
('Category-1'),
('Category-2'),
('Category-3'),
('Category-4'),
('Category-5'),
('Category-6')

SELECT * FROM Categories

INSERT INTO Products
VALUES
('Name-1',1000,1,100,7,5,'desc-1','code-1',900),
('Name-2',1500,2,200,8,6,'desc-2','code-2',1300),
('Name-3',1600,3,300,9,7,'desc-3','code-3',1300),
('Name-4',1700,4,400,10,8,'desc-4','code-4',1300),
('Name-5',1800,5,500,11,9,'desc-5','code-5',1300),
('Name-6',1900,6,600,12,10,'desc-6','code-6',1300)

SELECT * FROM Products

INSERT INTO Tags
VALUES
('Tag-1'),
('Tag-2'),
('Tag-3'),
('Tag-4'),
('Tag-5'),
('Tag-6')

SELECT * FROM Tags

INSERT INTO ProductTags
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6)

SELECT * FROM ProductTags

INSERT INTO ProductImages
VALUES
(1,'Shekil-1'),
(2,'Shekil-2'),
(3,'Shekil-3'),
(4,'Shekil-4'),
(5,'Shekil-5'),
(6,'Shekil-6')

SELECT * FROM ProductImages

INSERT INTO AdditionalInfoTypes
VALUES
('Type-1'),
('Type-2'),
('Type-3'),
('Type-4'),
('Type-5'),
('Type-6')

SELECT * FROM AdditionalInfoTypes

INSERT INTO AdditionalInfos
VALUES
(1,1,'Value-1'),
(2,2,'Value-2'),
(3,3,'Value-3'),
(4,4,'Value-4'),
(5,5,'Value-5'),
(6,6,'Value-6')

SELECT * FROM AdditionalInfos

INSERT INTO Users
VALUES
('Fullname-1','Email-1','Foto-1','Password-1','Address-1'),
('Fullname-2','Email-2','Foto-2','Password-2','Address-2'),
('Fullname-3','Email-3','Foto-3','Password-3','Address-3'),
('Fullname-4','Email-4','Foto-4','Password-4','Address-4'),
('Fullname-5','Email-5','Foto-5','Password-5','Address-5'),
('Fullname-6','Email-6','Foto-6','Password-6','Address-6')

SELECT * FROM Users

INSERT INTO Reviews
VALUES
(1,1,'Ad-1','mail-1','test-1','2020-03-20'),
(2,2,'Ad-2','mail-2','test-2','2022-03-21'),
(3,3,'Ad-3','mail-3','test-3','2023-03-22'),
(4,4,'Ad-4','mail-4','test-4','2024-03-23'),
(5,5,'Ad-5','mail-5','test-5','2025-03-24'),
(6,6,'Ad-6','mail-6','test-6','2026-03-25')

SELECT * FROM Reviews

INSERT INTO Orders
VALUES
(1,'2022-03-01','2022-03-08',15,7,1000,'Unvan-1','salam123@gmail.com','FullAd-1'),
(2,'2022-03-02','2022-03-09',11,3,1100,'Unvan-2','salam223@gmail.com','FullAd-2'),
(3,'2022-03-03','2022-03-10',13,8,1200,'Unvan-3','salam133@gmail.com','FullAd-3'),
(4,'2022-03-04','2022-03-11',19,5,1300,'Unvan-4','salam323@gmail.com','FullAd-4'),
(5,'2022-03-05','2022-03-12',16,2,1400,'Unvan-5','salam523@gmail.com','FullAd-5'),
(6,'2022-03-06','2022-03-13',17,9,1500,'Unvan-6','salam777@gmail.com','FullAd-6')

SELECT * FROM Orders

INSERT INTO OrderItems
VALUES
(1,1,7,777,111,666),
(2,2,2,222,1,221),
(3,3,8,555,222,333),
(4,4,11,999,222,777),
(5,5,27,444,100,3440),
(6,6,31,888,777,111)

SELECT * FROM OrderItems


SELECT * FROM Products
JOIN OrderItems ON Products.Count = OrderItems.Count

SELECT * FROM Sliders WHERE OrderCount=0

CREATE VIEW ALL_USERS
AS
(SELECT Users.Id,Users.Fullname,Users.Email,Users.



CREATE PROCEDURE USP_INSERT_USER
@Fullname NVARCHAR(150),
@Email NVARCHAR(140),
@Image NVARCHAR(120)
AS
INSERT INTO Users(Fullname,Email,Image)
VALUES
(@Fullname,@Email,@Image)

EXEC USP_INSERT_USER 'Allahverdi-Ehmedov','allahverdi123@gmail.com','shekil-7'

SELECT * FROM Users