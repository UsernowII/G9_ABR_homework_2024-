CREATE TABLE authors (
	author_id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	nationality VARCHAR(100)
)

CREATE TABLE publishers (
	publisher_id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	country VARCHAR(100)
)

CREATE TABLE books (
	book_id SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	genre VARCHAR(50),
	publication_year INT,
	publisher_id INT REFERENCES publishers(publisher_id)
)

CREATE TABLE book_author (
	book_id INTEGER REFERENCES books(book_id),
	author_id INTEGER REFERENCES authors(author_id)
)

INSERT INTO authors (name, nationality) 
VALUES
	('George Orwell', 'British'),
	('Jane Austen', 'British'),
	('Mark Twain', 'American')

INSERT INTO publishers (name, country)
VALUES
	('Penguin Books', 'United Kingdom'),
	('Oxford University Press', 'United Kingdom')

INSERT INTO books (title, genre, publication_year, publisher_id)
VALUES
	('1984','Dystopian','1949','1'),
	('Pride and Prejuice','Romance','1813','2'),
	('Adventures of Huckleberry Finn','Adventure','1884','1')

INSERT INTO book_author (book_id,author_id)
VALUES
	(1,1),
	(2,2),
	(3,3)

