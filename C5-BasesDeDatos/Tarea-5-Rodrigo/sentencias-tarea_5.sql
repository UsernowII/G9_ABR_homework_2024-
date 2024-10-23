select * from publisher;
update Books
set genre = 'Dystopian'
where title = '1984';
select * from 
--Tarea-5 Punto_1

--Reporte 1: Usar INNER JOIN para seleccionar los títulos de los 
--libros junto con el nombre de su editorial.
select name as publisher_name, title as book_title
from publisher
inner join books on books.publisher_id = publisher.publisher_id;

--Reporte 2: Usar LEFT JOIN para seleccionar todos los autores y los títulos 
--de los libros que han escrito, incluyendo autores que no han escrito ningún libro.

select name as author_name, title as book_title
from author
left join book_author on author.author_id = book_author.author_id
left join books on book_author.book_id = books.book_id;

--Reporte 3: Usar RIGHT JOIN para seleccionar todos los libros y los nombres de los 
--autores que los han escrito, incluyendo libros que no tienen autores asociados.
select books.title as title_book, author.name as name_author from books
right join book_author on books.book_id = book_author.book_id
right join author on author.author_id = book_author.author_id;

--Reporte 4: Usar una combinación de INNER JOIN y LEFT JOIN para seleccionar todos los
--libros, sus autores, y la editorial, incluyendo libros que no tienen autores
--y aquellos sin editorial.

select b.title as book_title, a.name as author_name,  p.name as publisher_name 
from author as a
inner join book_author as ba on a.author_id = ba.author_id
left join books as b on ba.book_id = b.book_id
left join publisher as p on b.publisher_id = p.publisher_id;

--Reporte 5: Usar INNER JOIN para seleccionar todos los libros que han sido escritos 
--por más de un autor y mostrar el título del libro junto con los nombres de los autores.

select b.title as book_title, a.name as author_name
from author as a
inner join book_author as ba on a.author_id = ba.author_id
left join books as b on ba.book_id = b.book_id
where b.book_id in (
	select ba.book_id
	from book_author as ba
	group by book_id
	having count(ba.book_id) > 1 );

--Reporte 6 (Opcional): Usar INNER JOIN, LEFT JOIN, y GROUP BY para
--seleccionarla editorial que tiene más libros publicados, 
--junto con el número total de libros y los títulos de esos libros.

SELECT b.publisher_id, b.title, p.name
from books as b
inner join publisher as p on b.publisher_id = p.publisher_id
where p.publisher_id in (
 select count(publisher.name)
 from publisher
 group by publisher.publisher_id 
);








select name from publisher