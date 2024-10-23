-- tabla Author
CREATE TABLE Author (
	Author_ID SERIAl PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Nationality VARCHAR(50)
);

-- tabla Publisher
CREATE TABLE Publisher (
	Publisher_ID SERIAL PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Country VARCHAR(50)
);

-- tabla Book
CREATE TABLE Book (
	Book_ID INTEGER PRIMARY KEY,
	Title VARCHAR(100) NOT NULL,
	Genre VARCHAR(50),
	Publication_Year INTEGER,
	Publisher_ID INTEGER,
	FOREIGN KEY (Publisher_ID)
		REFERENCES Publisher(Publisher_ID)
);

-- tabla Book_Author (tabla de relación muchos a muchos)
CREATE TABLE Book_Author (
	Book_ID INTEGER,
	Author_ID INTEGER,
	PRIMARY KEY (Book_ID, Author_ID), -- Se establece PK
	FOREIGN KEY (Book_ID)
		REFERENCES Book(Book_ID),
	FOREIGN KEY (Author_ID)
		REFERENCES Author(Author_id)
);