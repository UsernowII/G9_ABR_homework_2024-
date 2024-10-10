CREATE TABLE Author(
AuthorId INTEGER PRIMARY KEY,
Name VARCHAR(100),
Nationality VARCHAR(50)
);
CREATE TABLE Book(
BookId INTEGER PRIMARY KEY,
Title VARCHAR(100),
Genre VARCHAR(50),
PublicationYear INTEGER,
PublisherId INTEGER references Publisher(PublisherId)
);

CREATE TABLE Publisher(
PublisherId INTEGER PRIMARY KEY,
Name VARCHAR(100),
Country VARCHAR(50)
);

CREATE TABLE BookAuthor(
AuthorId INTEGER references Author(AuthorId),
BookId INTEGER references Book(BookId)
);
