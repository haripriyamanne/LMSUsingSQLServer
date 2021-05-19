USE LMS
 --Trigger to Update Details in AssignBook Table
CREATE TRIGGER TR_UpdateDetails_AssignBook on AssignBook
AFTER INSERT
AS
BEGIN
 DECLARE @BookName VARCHAR(100),@StudentName VARCHAR(100),@StudentAddress VARCHAR(100), @BookAuthor VARCHAR(100),@BookId INT,@StudentId INT
 SELECT @BookId=BookId FROM inserted
 SELECT @StudentId=StudentId FROM inserted
 SELECT @StudentAddress=StudentAddress FROM StudentDetails WHERE StudentId=@StudentId
 SELECT @BookName=BookName FROM BookDetails WHERE BookId=@BookId
 SELECT @BookAuthor=BookAuthor FROM BookDetails WHERE BookId=@BookId
 SELECT @StudentName=StudentName from StudentDetails where StudentId=@StudentId
 UPDATE AssignBook set StudentName=@StudentName,BookName=@BookName,BookAuthor=@BookAuthor,StudentAddress=@StudentAddress where StudentId=@StudentId and BookId=@BookId
END

DROP TRIGGER TR_UpdateDetails

SELECT * FROM StudentDetails;
SELECT * FROM BookDetails;
SELECT * FROM AssignBook