CREATE DATABASE University
USE University

CREATE TABLE Students
(
 Id INT PRIMARY KEY IDENTITY,
 Name NVARCHAR(10) NOT NULL,
 Surname NVARCHAR(10) NOT NULL
)
ALTER TABLE Students
ADD GroupId INT FOREIGN KEY (GroupId)  REFERENCES Groups(Id)

CREATE TABLE Groups
(
 Id INT PRIMARY KEY IDENTITY,
 No NVARCHAR(10) NOT NULL UNIQUE
)

CREATE TABLE Subjects
(
 Id INT PRIMARY KEY IDENTITY,
 Name NVARCHAR(20) NOT NULL,
)

CREATE TABLE Exams
(
 Id INT PRIMARY KEY IDENTITY,
 Date DATETIME2 DEFAULT(GETDATE())
)
ALTER TABLE Exams
ADD SubjectId INT FOREIGN KEY (SubjectId)  REFERENCES Subjects(Id)

CREATE TABLE StudentExams
(
 Id INT PRIMARY KEY IDENTITY,
 StudentId INT CONSTRAINT st_check FOREIGN KEY REFERENCES Students(Id),
 ExamId INT CONSTRAINT ex_check FOREIGN KEY REFERENCES Exams(Id),
 Result TINYINT 
)

INSERT INTO Students(Name,Surname,GroupId)
VALUES
		('Altay','Bayindir',1),
		('Ferdi','Kadioglu',16),
		 ('Serdar','Aziz',4),
		 ('IrfanCan','Kahveci',17),
		('Serdar','Dursun',19),
		 ('Crespo','Miguel',27),
		 ('OsayiSamuel','Brigth',21)
SELECT * FROM Students



INSERT INTO Groups(No)
VALUES
		('Gk1'),
		('SLB16'),
		('STP4'),
		('SGK17'),
		('SNT19'),
		('MO27'),
		('SGB21')
SELECT * FROM Groups

INSERT INTO Subjects(Name)
VALUES
		('Kaleci'),
		('Defans'),
		('Defans'),
		('TopSurme'),
		('Hucum'),
		('TopKontrol'),
		('Defans')
SELECT * FROM Subjects 



INSERT INTO Exams(SubjectId,Date)
VALUES
(1,'2020-10-20'),
(1,'2020-10-21'),
(2,'2021-10-20'),
(2,'2022-10-20'),
(4,'2022-04-20'),
(2,'2022-04-21')

SELECT * FROM Exams
		 