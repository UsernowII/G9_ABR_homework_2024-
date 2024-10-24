--Reporte 1: Usar INNER JOIN para seleccionar los títulos de los libros junto con el nombre de su editorial.
SELECT book.title, publisher.name 
FROM book 
INNER JOIN publisher
ON book.publisher_id = publihser.publisher_id

--Reporte 2: Usar LEFT JOIN para seleccionar todos los autores y los títulos de los libros que han escrito, incluyendo autores que no han escrito ningún libro.
SELECT author.name, book.title 
FROM author 
LEFT JOIN book_author ON author.author_id = book_author.author_id
LEFT JOIN book ON book_author.book_id = book.book_id

--Reporte 3: Usar RIGHT JOIN para seleccionar todos los libros y los nombres de los autores que los han escrito, incluyendo libros que no tienen autores asociados.
SELECT book.title, author.name
FROM book 
RIGHT JOIN book_author ON book.book_id = book_author.book_id
RIGHT JOIN author ON book_author.author_id = author.author_id

--Reporte 4: Usar una combinación de INNER JOIN y LEFT JOIN para seleccionar todos los libros, sus autores, y la editorial, incluyendo libros que no tienen autores y aquellos sin editorial.
SELECT book.title, author.name, publisher.name 
FROM book
INNER JOIN publisher ON book.publisher_id = publisher.publisher_id
LEFT JOIN book_author ON book.book_id = book_author.book_id
LEFT JOIN author ON book_author.author_id = author.author_id

--Reporte 5: Usar INNER JOIN para seleccionar todos los libros que han sido escritos por más de un autor y mostrar el título del libro junto con los nombres de los autores.
SELECT book.title, author.name
FROM book
INNER JOIN book_author ON book.book_id = book_author.book_id
INNER JOIN author ON book_author.author_id = author.author_id
WHERE book.book_id IN (
	SELECT book_id
	FROM book_author
	GROUP BY book_id
	HAVING COUNT(author_id) > 1
)

--Reporte 6 (Opcional): Usar INNER JOIN, LEFT JOIN, y GROUP BY para seleccionar la editorial que tiene más libros publicados, junto con el número total de libros y los títulos de esos libros.
WITH publisher_book_count AS (
    SELECT publisher.publisher_id, publisher.name, COUNT(book.book_id) AS total_books
    FROM book
    INNER JOIN publisher ON book.publisher_id = publisher.publisher_id
    GROUP BY publisher.publisher_id
)
SELECT publisher.name, COUNT(book.book_id) AS total_books, STRING_AGG(book.title, ', ') AS book_titles
FROM publisher_book_count
INNER JOIN book ON publisher_book_count.publisher_id = book.publisher_id
INNER JOIN publisher ON book.publisher_id = publisher.publisher_id
GROUP BY publisher.publisher_id
ORDER BY total_books DESC
LIMIT 1;