CREATE DATABASE db_library

USE db_library

CREATE TABLE tbl_library_branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (100, 10),
	BranchName VARCHAR(50) NOT NULL,
	BranchAddress VARCHAR(50) NOT NULL
);
CREATE TABLE tbl_borrower (
	BorrowerCardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BorrowerName VARCHAR(50) NOT NULL,
	BorrowerAddress VARCHAR(50) NOT NULL,
	BorrowerPhone VARCHAR(50) NOT NULL
);
CREATE TABLE tbl_publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(50) NOT NULL,
	PublisherPhone VARCHAR(50) NOT NULL
);
CREATE TABLE tbl_books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (10000,1),
	BookTitle VARCHAR(50) NOT NULL,
	BookPublisherName VARCHAR(50) NOT NULL
);
CREATE TABLE tbl_book_copies (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES tbl_books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES tbl_library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	NumberOfCopies INT NOT NULL
);
CREATE TABLE tbl_book_loans (
	BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES tbl_books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES tbl_library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	BorrowerCardNo INT NOT NULL CONSTRAINT fk_BorrowerCardNo FOREIGN KEY REFERENCES tbl_borrower(BorrowerCardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);
CREATE TABLE tbl_book_authors (
	BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES tbl_books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

INSERT INTO tbl_library_branch (BranchName, BranchAddress)
VALUES ('Sharpstown', '100 Shrap Ln'),
		('Central', '200 Cent Ln'),
		('Godric Hollow', '300 Harry Ln'),
		('Diagon Alley', '400 Draco Ln');

INSERT INTO tbl_borrower (BorrowerName, BorrowerAddress, BorrowerPhone)
VALUES ('Harry Potter', 'Hogwarts-Gryffindor', '165-874-1688'),
		('Ron Weasley', 'Hogwarts-Gryffindor', '276-985-2799'),
		('Hermoine Granger', 'Hogwarts-Gryffindor', '387-096-3800'),
		('Severus Snape', 'Hogwarts-Slytherin', '498-107-4911'),
		('Ginny Weasley', 'Hogwarts-Gryffindor', '509-218-5022'),
		('Draco Malfoy', 'Hogwarts-Slytherin', '610-329-6133'),
		('Cedric Diggory', 'Hogwarts-Hufflepuff', '721-430-7244'),
		('Tom Riddle', 'Hogwarts-Slytherin', '832-541-8355');

INSERT INTO tbl_publisher (PublisherName, PublisherAddress, PublisherPhone)
VALUES ('Lion', '987 Gryffindor St', '215-545-2456'),
		('Raven', '654 Ravenclaw St', '104-434-1345'),
		('Badger', '321 Hufflepuff St', '993-323-0234'),
		('Snake', '10 Slytherin St', '882-212-9123');

INSERT INTO tbl_books (BookTitle, BookPublisherName)
VALUES ('The Lost Tribe', 'Lion'),
		('Carrie', 'Lion'),
		('The Shining', 'Lion'),
		('Doctor Sleep', 'Lion'),
		('Jurassic Park', 'Lion'),
		('The Lost World', 'Raven'),
		('The Sorcerers Stone', 'Raven'),
		('Chamber of Secrets', 'Raven'),
		('Prisoner of Azkaban', 'Raven'),
		('Goblet of Fire', 'Raven'),
		('Order of the Phoenix', 'Badger'),
		('Half Blood Prince', 'Badger'),
		('Deathly Hallows', 'Badger'),
		('Fantasic Beasts and Where to Find Them', 'Badger'),
		('Good Omens', 'Badger'),
		('Spiderman', 'Snake'),
		('Fantastic Four', 'Snake'),
		('Dragon Ball Z', 'Snake'),
		('Dragon Ball Super', 'Snake'),
		('Technology Basics Dictionary', 'Snake');

INSERT INTO tbl_book_copies(BookID, BranchID, NumberOfCopies)
VALUES (10000, 100, 2),
		(10001, 100, 2),
		(10002, 100, 2),
		(10003, 100, 2),
		(10004, 100, 2),
		(10005, 100, 2),
		(10006, 100, 2),
		(10007, 100, 2),
		(10008, 100, 2),
		(10009, 100, 2),
		(10001, 110, 2),
		(10003, 110, 2),
		(10005, 110, 2),
		(10007, 110, 2),
		(10009, 110, 2),
		(10011, 110, 2),
		(10013, 110, 2),
		(10015, 110, 2),
		(10017, 110, 2),
		(10019, 110, 2),
		(10000, 120, 2),
		(10002, 120, 2),
		(10004, 120, 2),
		(10006, 120, 2),
		(10008, 120, 2),
		(10010, 120, 2),
		(10012, 120, 2),
		(10014, 120, 2),
		(10016, 120, 2),
		(10018, 120, 2),
		(10010, 130, 2),
		(10011, 130, 2),
		(10012, 130, 2),
		(10013, 130, 2),
		(10014, 130, 2),
		(10015, 130, 2),
		(10016, 130, 2),
		(10017, 130, 2),
		(10018, 130, 2),
		(10019, 130, 2);

INSERT INTO tbl_book_loans(BookID, BranchID, BorrowerCardNo, DateOut, DateDue)
VALUES (10001, 110, 1, '2019-08-01', '2019-09-01'),
		(10000, 110, 1, '2019-08-01', '2019-09-01'),
		(10002, 110, 1, '2019-08-01', '2019-09-01'),
		(10003, 110, 1, '2019-08-01', '2019-09-01'),
		(10004, 110, 1, '2019-08-01', '2019-09-01'),
		(10005, 110, 1, '2019-08-01', '2019-09-01'),
		(10006, 110, 1, '2019-08-01', '2019-09-01'),
		(10007, 100, 2, '2019-08-03', '2019-09-03'),
		(10008, 100, 2, '2019-08-03', '2019-09-03'),
		(10009, 100, 2, '2019-08-03', '2019-09-03'),
		(10010, 100, 2, '2019-08-03', '2019-09-03'),
		(10011, 100, 2, '2019-08-03', '2019-09-03'),
		(10012, 100, 2, '2019-08-03', '2019-09-03'),
		(10013, 100, 2, '2019-08-03', '2019-09-03'),
		(10014, 120, 3, '2019-08-05', '2019-09-05'),
		(10015, 120, 3, '2019-08-05', '2019-09-05'),
		(10016, 120, 3, '2019-08-05', '2019-09-05'),
		(10017, 120, 3, '2019-08-05', '2019-09-05'),
		(10018, 120, 3, '2019-08-05', '2019-09-05'),
		(10019, 120, 3, '2019-08-05', '2019-09-05'),
		(10000, 120, 3, '2019-08-05', '2019-09-05'),
		(10002, 130, 4, '2019-08-07', '2019-09-07'),
		(10004, 130, 4, '2019-08-07', '2019-09-07'),
		(10006, 130, 4, '2019-08-07', '2019-09-07'),
		(10008, 130, 4, '2019-08-07', '2019-09-07'),
		(10010, 130, 4, '2019-08-07', '2019-09-07'),
		(10012, 130, 4, '2019-08-07', '2019-09-07'),
		(10014, 130, 4, '2019-08-07', '2019-09-07'),
		(10016, 100, 5, '2019-08-09', '2019-09-09'),
		(10018, 110, 5, '2019-08-09', '2019-09-09'),
		(10001, 120, 5, '2019-08-09', '2019-09-09'),
		(10003, 130, 5, '2019-08-09', '2019-09-09'),
		(10005, 100, 5, '2019-08-09', '2019-09-09'),
		(10007, 110, 5, '2019-08-09', '2019-09-09'),
		(10009, 120, 5, '2019-08-09', '2019-09-09'),
		(10011, 130, 6, '2019-08-11', '2019-09-11'),
		(10013, 130, 6, '2019-08-11', '2019-09-11'),
		(10015, 120, 6, '2019-08-11', '2019-09-11'),
		(10017, 110, 6, '2019-08-11', '2019-09-11'),
		(10019, 100, 6, '2019-08-11', '2019-09-11'),
		(10000, 130, 6, '2019-08-11', '2019-09-11'),
		(10003, 120, 6, '2019-08-11', '2019-09-11'),
		(10006, 100, 7, '2019-08-13', '2019-09-13'),
		(10009, 120, 7, '2019-08-13', '2019-09-13'),
		(10012, 100, 7, '2019-08-13', '2019-09-13'),
		(10015, 120, 7, '2019-08-13', '2019-09-13'),
		(10018, 100, 7, '2019-08-13', '2019-09-13'),
		(10002, 120, 7, '2019-08-13', '2019-09-13'),
		(10005, 100, 7, '2019-08-13', '2019-09-13'),
		(10008, 110, 8, '2019-08-15', '2019-09-15');

INSERT INTO tbl_book_authors(BookID, AuthorName)
VALUES ('10000', 'Mark Lee'),
		('10001', 'Stephen King'),
		('10002', 'Stephen King'),
		('10003', 'Stephen King'),
		('10004', 'Michael Crichton'),
		('10005', 'Michael Crichton'),
		('10006', 'Albus Dumbledore'),
		('10007', 'Albus Dumbledore'),
		('10008', 'Albus Dumbledore'),
		('10009', 'Albus Dumbledore'),
		('10010', 'Albus Dumbledore'),
		('10011', 'Albus Dumbledore'),
		('10012', 'Harry Potter'),
		('10013', 'Newt Scalamander'),
		('10014', 'Neil Gaiman'),
		('10015', 'Stan Lee'),
		('10016', 'Stan Lee'),
		('10017', 'Akira Toriyama'),
		('10018', 'Akira Toriyama'),
		('10019', 'The Tech Academy');

