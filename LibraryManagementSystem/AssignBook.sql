USE LMS
GO

--Assign Book Table Created
CREATE TABLE AssignBook
(
StudentId INT NOT NULL REFERENCES StudentDetails(StudentId),
BookId INT NOT NULL REFERENCES BookDetails(BookId),
StudentName VARCHAR(100),
StudentAddress VARCHAR(100),
BookName VARCHAR(100),
BookAuthor VARCHAR(100),
AssignDate DATETIME DEFAULT(GETDATE()),
CONSTRAINT PK_AssignBook PRIMARY KEY(StudentId,BookId)
);

DROP TABLE AssignBook

SELECT * FROM AssignBook


CREATE PROCEDURE SP_Insert_BookAssign
@StudentId INT,
@BookId INT
AS
BEGIN
 DECLARE @Value INT
 SELECT @Value=BookCount FROM BookDetails where BookId=@BookId
 IF @Value>0
	 INSERT INTO AssignBook(StudentId,BookId) values(@StudentId,@BookId)
 ELSE
	PRINT 'Book Id should not be Zero'
END

EXEC SP_Insert_BookAssign 1001,1;
EXEC SP_Insert_BookAssign 1003,2;
EXEC SP_Insert_BookAssign 1002,0;


SELECT * FROM StudentDetails;
SELECT * FROM BookDetails;
SELECT * FROM AssignBook
SELECT * FROM ReturnBook
