create table Authors (
	author_id integer primary key,
	name varchar(100),
	Nationality varchar(50)
);

create table Books (
	book_id integer primary key,
	title varchar(100),
	genre varchar(50),
	publication_year integer
);

create table Publisher (
	publisher_id integer primary key,
	name varchar(100),
	country varchar(50),
	book_id integer references books(book_id)
);

drop table publisher;

Create table Book_Author (
	book_id integer references books(book_id),
	author_id integer references authors(author_id)
);



