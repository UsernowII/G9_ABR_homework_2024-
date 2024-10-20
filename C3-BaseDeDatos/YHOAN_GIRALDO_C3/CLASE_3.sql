
--CREACION TABLA 1
create table AUTHOR(

	AUTHOR_ID integer primary key,
	NAME varchar(100),
	NATIONALITY varchar(50)
	
)

--DATOS TABLA 1
INSERT INTO AUTHOR (AUTHOR_ID, NAME, NATIONALITY)
	VALUES
	(1, 'George Orwell', 'British'), 
	(2, 'Jane Austen', 'British'),
	(3, 'Mark Twain', 'American' );
-- -------------------------------------------------------

	
--CREACION TABLA 2
create table BOOK(
	
	BOOK_ID integer primary key,
	TITLE varchar(100),
	GENRE varchar(50),
	PUBLICATION_YEAR integer,

	PUBLISHER_ID integer,
	foreign key (PUBLISHER_ID) 
	references PUBLISHER(PUBLISHER_ID)
	
)

--DATOS TABLA 2
INSERT INTO BOOK (BOOK_ID, TITLE, GENRE, PUBLICATION_YEAR, PUBLISHER_ID )
	VALUES
	(1, '1984', 'Dystopian', 1949, 1 ),
	(2, 'Pride and Prejudice', 'Romance', 1813, 2),
	(3, 'Adventures of Huckleberry Finn', 'Adventure', 1884, 1);
-- -------------------------------------------------------


--CREACION TABLA 3
create table PUBLISHER(
	
	PUBLISHER_ID integer primary key,
	NAME varchar(100),
	COUNTRY varchar (50)

)
	
--DATOS TABLA 3
INSERT INTO PUBLISHER (PUBLISHER_ID, NAME, COUNTRY)
	VALUES
	(1, 'Penguin Books', 'United Kingdom'), 
	(2, 'Oxford University Press', 'United Kingdom');
-- -------------------------------------------------------


--CREACION TABLA 4 RELACION
create table BOOK_AUTHOR(

	AUTHOR_ID integer,
	foreign key (AUTHOR_ID) 
	references AUTHOR(AUTHOR_ID),
	
	BOOK_ID integer,
	foreign key (BOOK_ID) 
	references BOOK(BOOK_ID)
	
)

--DATOS TABLA 4
INSERT INTO BOOK_AUTHOR (AUTHOR_ID, BOOK_ID)
	VALUES
	(1, 1),
	(2, 2),
	(3, 3);
-- -------------------------------------------------------