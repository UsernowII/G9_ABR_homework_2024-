--Reporte 1: Seleccionar todos los libros publicados por 'Penguin Books'.

select * from books
where publisher_id = (
	select publisher_id from publisher
 where publisher.name = 'Penguin Books'
);

--Reporte 2: Seleccionar todos los libros publicados después del año 1950
select title as title_Book from books
where publication_year > 1950;

--Reporte 3: Seleccionar los nombres de los autores que han escrito libros 
--de género 'Fantasy' utilizando una subconsulta.

select name as name_Author from author
where author_id in (
	select Author_id from book_author
	where book_id in (
		select book_id from books
		where genre = 'Fantasy'));

--Reporte 4: Seleccionar los títulos de los libros escritos por autores cuyo 
--nombre contiene 'J.K.' utilizando una subconsulta.
select title as title_books from books
where book_id = (
	select book_id from book_author
	where author_id = (
		select author_id from author
		where name like 'J.K. %')
);

--(Opcional) Reporte 5: Utilizando una subconsulta, seleccionar los títulos de los
--libros escritos por autores británicos.
select title as title_Book from books
where book_id in (
	select book_id from book_author
	where author_id in (
		select author_id from author
		where nationality = 'British')
);








