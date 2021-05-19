USE LMS
GO

CREATE TABLE ReturnBook
(
StudentId INT NOT NULL REFERENCES StudentDetails(StudentId),
BookId INT NOT NULL REFERENCES BookDetails(BookId),
StudentName VARCHAR(100),
StudentAddress VARCHAR(100),
BookName VARCHAR(100),
BookAuthor VARCHAR(100),
ReturnDate DATETIME DEFAULT(GETDATE()),
CONSTRAINT PK_ReturnBook PRIMARY KEY(BookId)
);

DROP TABLE ReturnBook;

SELECT * FROM ReturnBook

CREATE TRIGGER TR_UpdateDetails_ReturnBook on AssignBook
AFTER DELETE
AS
BEGIN
 DECLARE @BookName VARCHAR(100),@StudentName VARCHAR(100),@StudentAddress VARCHAR(100), @BookAuthor VARCHAR(100),@BookId INT,@StudentId INT
 SELECT @BookName=BookName,@StudentName =StudentName,@StudentAddress=StudentAddress, @BookAuthor =BookAuthor,@BookId =BookId,@StudentId =StudentId  FROM deleted
INSERT INTO ReturnBook(BookId,StudentId,StudentName,StudentAddress,BookName,BookAuthor) VALUES(@BookId,@StudentId,@StudentName,@StudentAddress,@BookName,@BookAuthor)
END

DROP TRIGGER TR_UpdateDetails


--Created a Procedure to Delete a Book in Assign Table
CREATE PROCEDURE SP_Delete_Book
@BookId INT 
AS
BEGIN
DELETE FROM AssignBook WHERE BookId=@BookId
END

EXEC  SP_Delete_Book 1
EXEC  SP_Delete_Book 2

DROP PROCEDURE SP_Delete_Book


SELECT * FROM StudentDetails;
SELECT * FROM BookDetails;
SELECT * FROM AssignBook
SELECT * FROM ReturnBook



