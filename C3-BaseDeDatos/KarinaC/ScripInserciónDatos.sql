INSERT INTO Author (AuthorId, Name,Nationality)
VALUES
(1, 'George Orwell', 'British'),
(2, 'Jane Austen ', 'British'),
(3, 'Mark Twain ', 'American');

SELECT * FROM Author

INSERT INTO Book (BookId, Title, Genre, PublicationYear, PublisherId)
VALUES
(9, 'Leer es resistir', 'Biografia', 2023,1),
(10, 'Pride and Prejudice ', 'Romance', 1813,1),
(11, 'Adventures of Huckleberry Finn', 'Adventure', 1884,2);

SELECT * FROM Book

INSERT INTO Publisher (PublisherId, Name,Country)
VALUES
(1, 'Penguin Books', 'United Kingdom '),
(2, 'Pride and Prejudice ', 'Oxford University Press');

SELECT * FROM Publisher

INSERT INTO BookAuthor (AuthorId, BookId)
VALUES
(1,1 ),
(1,2 ),
(2,1 ),
(2,2 );
SELECT * FROM BookAuthor


