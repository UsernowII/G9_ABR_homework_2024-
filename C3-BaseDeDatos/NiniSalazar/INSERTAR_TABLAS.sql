INSERT INTO author ( name, nationality)
	VALUES
	('William Shakespeare', 'Ingles' ),
	('Miguel de Cervante', 'Español' ),
	('Lewis Carroll', 'britanico' );

SELECT * FROM author;

INSERT INTO Publisher (Publisher_ID, Name, Country)
	VALUES
	(1, 'Penguin Books', 'United Kingdom' ),
	(2, 'Oxford University Press', 'United Kingdom');

SELECT * FROM publisher;

INSERT INTO Book(Title, Genre, Publication_Year, PublisherID)
	VALUES
	('1984', 'Dystopian', 1949,1),
	('Pride and Prejudice', 'Dystopian', 1813,2),
	('Adventures of Huckleberry Finn', 'Adventure', 1884, 1);

SELECT * FROM 	Book;


INSERT INTO Book_Author (id, AuthorID, BookID )
	VALUES
	(1, 2,4),
	(2,1,6);
SELECT * FROM Book_Author;
	