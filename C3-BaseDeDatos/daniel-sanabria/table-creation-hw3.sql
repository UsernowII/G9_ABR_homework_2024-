--DDL

CREATE TABLE IF NOT EXISTS Author(
	Author_ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	Name VARCHAR(100),
	Nationality VARCHAR(50)
); 

CREATE TABLE Publisher(
Publisher_ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
Name VARCHAR(100),
Country VARCHAR(50)
);

-- we add publisher_id that make reference to publisher table on row "publisher_ID"

CREATE TABLE Book(
	Book_ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	Title VARCHAR(100),
	Genre VARCHAR(50),
	Publication_Year Integer,
	Publisher_ID INTEGER REFERENCES Publisher(Publisher_ID)
);

CREATE TABLE Book_Author(
Book_ID INTEGER REFERENCES Book(Book_ID),
Author_ID INTEGER REFERENCES Author(Author_ID)
);