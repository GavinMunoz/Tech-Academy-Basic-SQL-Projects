/*Store Procedure 1*/
USE db_library
GO
CREATE PROC dbo.Count_Lost_Tribe_Sharpstown
AS

SELECT a1.NumberOfCopies FROM tbl_book_copies a1
INNER JOIN tbl_books a2 ON a1.BookID = a2.BookID
INNER JOIN tbl_library_branch a3 ON a1.BranchID = a3.BranchID
WHERE a2.BookTitle = 'The Lost Tribe' AND a3.BranchName = 'Sharpstown';


GO
EXEC dbo.Count_Lost_Tribe_Sharpstown

/*Store Procedure 2*/
USE db_library
GO
CREATE PROC dbo.Count_Lost_Tribe_All
AS

SELECT a3.BranchName, a1.NumberOfCopies FROM tbl_book_copies a1
INNER JOIN tbl_books a2 ON a1.BookID = a2.BookID
INNER JOIN tbl_library_branch a3 ON a1.BranchID = a3.BranchID
WHERE a2.BookTitle = 'The Lost Tribe';


GO
EXEC dbo.Count_Lost_Tribe_All

/*Store Procedure 3*/
USE db_library
GO
CREATE PROC dbo.No_Books
AS

SELECT a1.BorrowerName From tbl_borrower a1
FULL OUTER JOIN tbl_book_loans a2 ON a1.BorrowerCardNo = a2.BorrowerCardNo
WHERE a2.BookID IS NULL;


GO
EXEC dbo.No_Books

/*Store Procedure 4*/
USE db_library
GO
CREATE PROC dbo.Due_Today
AS

SELECT a3.BookTitle, a1.BorrowerName, a1.BorrowerAddress FROM tbl_borrower a1
INNER JOIN tbl_book_loans a2 ON a1.BorrowerCardNo = a2.BorrowerCardNo
INNER JOIN tbl_books a3 ON a2.BookID = a3.BookID
WHERE a2.DateDue = 
	CONVERT(varchar(10), DATEPART(year, GETDATE())) + '-' + 
	CONVERT(varchar(10), DATEPART(month, GETDATE())) + '-' + 
	CONVERT(varchar(10), DATEPART(day, GETDATE()));


GO
EXEC dbo.Due_Today

/*Store Procedure 5*/
USE db_library
GO
CREATE PROC dbo.Books_Out_All
AS

SELECT a2.BranchName, COUNT(a1.BranchID) AS BooksOnLoan FROM tbl_book_loans a1
INNER JOIN tbl_library_branch a2 ON a1.BranchID = a2.BranchID
GROUP BY a2.BranchName;

GO
EXEC dbo.Books_Out_All

/*Store Procedure 6*/
USE db_library
GO
CREATE PROC dbo.More_Than_Five
AS

SELECT a1.BorrowerName, a1.BorrowerAddress, COUNT(a2.BookID) AS BooksCheckedOut FROM tbl_borrower a1
INNER JOIN tbl_book_loans a2 ON a1.BorrowerCardNo = a2.BorrowerCardNo
GROUP BY a1.BorrowerName, a1.BorrowerAddress;

GO
EXEC dbo.More_Than_Five

/*Store Procedure 7*/
USE db_library
GO
CREATE PROC dbo.Stephen_King_Central
AS

SELECT a4.BookTitle, COUNT(a2.BookID) FROM tbl_book_authors a1
INNER JOIN tbl_book_copies a2 ON a1.BookID = a2.BookID
INNER JOIN tbl_library_branch a3 ON a2.BranchID = a3.BranchID
INNER JOIN tbl_books a4 ON a2.BookID = a4.BookID
WHERE a1.AuthorName = 'Stephen King' AND a3.BranchName = 'Central'
GROUP BY a4.BookTitle;

GO
EXEC dbo.Stephen_King_Central