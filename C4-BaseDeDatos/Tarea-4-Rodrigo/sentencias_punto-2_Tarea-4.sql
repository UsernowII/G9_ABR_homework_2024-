--PUNTO 2
select * from books;
--Actualizar el género del libro '1984' a 'Science Fiction'.

update books
	set genre = 'Science Fiction'
	where title = '1984';

--Cambiar la nacionalidad de 'Mark Twain' a 'Canadian'
select * from author;

update author
	set nationality = 'Canadian'
	where name = 'Mark Twain';