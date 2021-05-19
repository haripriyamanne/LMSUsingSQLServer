USE LMS
--Created a Procedure to Insert a Book
CREATE PROCEDURE SP_Insert_Book
@BookId INT,   
@BookName VARCHAR(100),  
@BookAuthor VARCHAR(100),  
@BookCount INT 
AS
BEGIN
INSERT INTO BookDetails VALUES(@BookId,@BookName,@BookAuthor,@BookCount)
END

--Executing the Procedure
EXEC SP_Insert_Book 1,'JAVA','James Gosling',3;
EXEC SP_Insert_Book 2,'C Programming','Dennis Ritchie',4;
EXEC SP_Insert_Book 3,'Data Structures','Genre',1;

DROP PROCEDURE SP_Insert_Book


SELECT * FROM StudentDetails;
SELECT * FROM BookDetails;
SELECT * FROM AssignBook
SELECT * FROM ReturnBook
