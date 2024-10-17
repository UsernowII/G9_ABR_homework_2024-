-- Insertar datos en la tabla Author
INSERT INTO Author (Name, Nationality)
	VALUES
		('George Orwell', 'British'),
		('Jane Austen', 'British'),
		('Mark Twain', 'American');

SELECT * FROM Author;

-- Insertar datos en la tabla Publisher
INSERT INTO Publisher (Name, Country) 
	VALUES
		('Penguin Books', 'United Kingdom'),
		('Oxford University Press', 'United Kingdom');

SELECT * FROM Publisher;

-- Insertar datos en la tabla Book
INSERT INTO Book (Book_ID, Title, Genre, Publication_Year, Publisher_ID)
	VALUES
		(1, '1984', 'Dystopian', 1949, 1),
		(2, 'Pride and Prejudice', 'Romance', 1813, 2),
		(3, 'Adventures of Huckleberry Finn', 'Adventure', 1884, 1);

SELECT * FROM Book;

-- Insertar datos en la tabla Book_Author
INSERT INTO Book_Author (Book_ID, Author_ID)
	VALUES
		(1, 1),
		(2, 2),
		(3, 3);

SELECT * FROM Book_Author;