insert into authors ( author_id, name, nationality)
	values (1, 'George Orewel', 'british'),
	(2, 'Jane Austen', 'Brithis'),
	(3, 'Mark Twain', 'American');

select * from books;

alter table books 
	add publisher_id integer references publisher(publisher_id);

insert into publisher (publisher_id, name, country)
	values (1, 'penguin Books', 'United Kingdom'),
	(2, 'Oxford University', 'United Kingdom');

insert into Books ( book_id, title, genre, publication_year, publisher_id)
	values(1, '1984', 'Dystopian', 1949, 1),
	(2, 'Pride and Prejudice', 'Romance', 1813, 2),
	(3, 'Adventures of Huckleberry Finn', 'Adventure', 1984, 1);

insert into book_author (book_id, author_id)
	values (1,1),
			(2,2),
			(3,3);