create table Author (
	Author_id integer primary key,
	name varchar(100),
	Nationality varchar(50)
);
insert into Author ( Author_id, name, Nationality)
	Values (1, 'George Orewell', 'British'),
	(2, 'Jane Austen', 'Britis'),
	(3, 'Mark Twain', 'American'),
	(4, 'J.K. Rowling', 'British'),
	(5, 'J:R:R Tolkien', 'British');

Create table publisher (
	Publisher_id integer primary key,
	name varchar(100),
	Country varchar(50)
);

insert into publisher (Publisher_id, Name, Country)
	values (1, 'Penguin Books', 'United Kingdom'),
	(2, 'Oxford University Press', 'United Kingdom'),
	(3, 'HarperCollins', 'United States');

select * from publisher;

create table Books (
	Book_id integer primary key,
	title varchar(100),
	Genre varchar(50),
	Publication_year integer,
	Publisher_ID integer,
	foreign key (publisher_ID) references Publisher(publisher_ID)
);

insert into books (Book_id, title, genre, Publication_year, Publisher_ID)
	values (1, '1984', 'Dystopian', 1949, 1),
	(2, 'Pride and Prejudice', 'Romance', 1813, 2),
	(3, 'Adventures of Huckleberry Finn', 'Adventure', 1884, 3),
	(4, 'Harry Potter and the Philosopher\`stone', 'Fantasy', 1997, 1),
	(5, 'The Hobbit', 'Fantasy', 1937, 1);
select * from Books;

create table Book_Author (
	Book_id integer,
	Author_id integer,
	foreign key (Book_id) references Books(Book_id),
	foreign key (Author_id) references Author(Author_id),
	primary key (book_id, Author_id)
	);

select * from Book_Author;

insert into book_Author (book_id, Author_id)
	values (1,1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(4,1),
	(5, 2);




