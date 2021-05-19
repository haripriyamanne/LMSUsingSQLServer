CREATE DATABASE LMS;

USE LMS;

--Created a Student Details Table
CREATE TABLE StudentDetails  
(  
	StudentId INT NOT NULL PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,  
    StudentAddress VARCHAR(100) NOT NULL,  
    StudentGender CHAR(1) CONSTRAINT "GenderCHK" NOT NULL,
	CONSTRAINT "GenderCHK" CHECK (StudentGender in ('M', 'F'))
)  

DROP TABLE StudentDetails

SELECT * FROM StudentDetails;

--Insert the Student Details
INSERT INTO StudentDetails VALUES(1001,'Hari','Bhimavaram','M')
INSERT INTO StudentDetails VALUES(1002,'Priya','Hyderabad','F')
INSERT INTO StudentDetails VALUES(1003,'Manne','Narsapur','F')

--Updated the Student Details
UPDATE StudentDetails
SET StudentName = 'Praveen',StudentGender='M'
WHERE StudentId =1003


--Created a Book Details Table
CREATE TABLE BookDetails  
(  
    BookId INT  NOT NULL,  
    BookName VARCHAR(100) NOT NULL,  
    BookAuthor VARCHAR(100) NOT NULL,  
    BookCount INT NOT NULL
	 PRIMARY KEY (BookId),
)  

DROP TABLE BookDetails

SELECT * FROM StudentDetails;
SELECT * FROM BookDetails
