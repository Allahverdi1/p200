CREATE DATABASE BlogSyte
USE BlogSyte

CREATE TABLE Users
(
 Id INT PRIMARY KEY IDENTITY,
 Name NVARCHAR (15) NOT NULL,
 Surname NVARCHAR(10) NOT NULL,
 Email NVARCHAR(20) NOT NULL CONSTRAINT em_chk CHECK (LEN ('Email')>4 AND LEN('Email') < 100)
 )

 CREATE TABLE Posts
 (
 Id INT PRIMARY KEY IDENTITY,
 LikeCount INT CONSTRAINT li_count_chk CHECK(LikeCount>10),
 CreatedAt DATETIME2 NOT NULL,
 Title NVARCHAR NOT NULL CONSTRAINT tit_chk CHECK(LEN('Title')>20 AND LEN('Title')< 100)
 )

 ALTER TABLE Users
 ALTER COLUMN Email NVARCHAR(100)
 INSERT INTO Users(Name,Surname,Email)
 VALUES
 (
 'Allahverdi',
 'Ehmedov',
 'ali123@gmail.com'
 )
 INSERT INTO Users(Name,Surname,Email)
 VALUES
 (
 'Kenan',
 'Elizade',
 'Kenan123@gmail.com'
 )
 INSERT INTO Users(Name,Surname,Email)
 VALUES
 (
 'Shukran',
 'Shirinov',
 'Shukran123@gmail.com'
 )
