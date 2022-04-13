CREATE DATABASE Kitabxana
USE Kitabxana

CREATE TABLE Books
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(100) NOT NULL CHECK (LEN(Name)<2),
AuthorId INT CONSTRAINT author_id FOREIGN KEY REFERENCES Authors(Id),
PageCount INT NOT NULL CHECK (LEN(PageCount) > 9)
)

CREATE TABLE Authors
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(15) NOT NULL,
Surname NVARCHAR(15) NOT NULL
)



INSERT INTO Authors(A.Name,Surname)
VALUES
('Zulfi','Livaneli'),
('Qaraqan','Bilmirem'),
('Fyodor','Dostoyevski'),
('Ali','Nino'),
('Allahverdi','Akhmedov')

SELECT * FROM Authors





INSERT INTO Books(Name,AuthorId,PageCount)
VALUES
('Serenad',1,510),
('Sheytanin Kitabi',2,110),
('Ciyanet ve Ceza',3,230),
('Ali ve Nino',4,150),
('Paranormal olaylar',5,288)

CREATE VIEW ALL_DAT
AS
(SELECT B.Id,B.Name AS 'BookName',B.PageCount,A.Name AS 'AuthorName',A.Surname AS 'AuthorSurname' FROM Books AS B
JOIN Authors AS A ON A.Id = B.AuthorId)