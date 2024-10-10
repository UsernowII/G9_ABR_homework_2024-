--Seleccionar todos los libros publicados por 'Penguin Books'. 
SELECT book_id, title FROM book
WHERE publisher_id IN (
	SELECT publisher_id from publisher
		WHERE name IN ('Penguin Books')
);
--Seleccionar todos los libros publicados después del año 1950.
SELECT * FROM book
WHERE publication_year > 1950
--Seleccionar los nombres de los autores que han escrito libros de género 
--'Fantasy' utilizando una subconsulta.
SELECT name FROM author
WHERE author_id IN(
	SELECT book_id FROM book
	WHERE genre = ('Fantasy') 
OR name='Jane Austen'
	);

--Seleccionar los títulos de los libros escritos por autores cuyo nombre 
--contiene 'J.K.' utilizando una subconsulta.

SELECT title FROM book
WHERE book_id IN (
	SELECT author_id FROM author
		WHERE name LIKE '%J.K.%'
);

-- seleccionar los títulos de los libros escritos por autores británicos.

SELECT title FROM book
WHERE book_id IN (
	SELECT author_id FROM author
		WHERE nationality = 'British'
); 
--Actualizar el género del libro '1984' a 'Science Fiction'.

UPDATE book
SET genre='Science Fiction'
WHERE title='1984';
SELECT * FROM book

--Cambiar la nacionalidad de 'Mark Twain' a 'Canadian'.
UPDATE author
SET Nationality='Canadian'
WHERE author_id=3;

SELECT name, nationality FROM author
WHERE author_id=3

--Eliminar el libro 'Pride and Prejudice' de la base de datos.

DELETE FROM book_author
WHERE book_id=2;
DELETE FROM book
WHERE book_id=2;

SELECT * FROM book

--Eliminar los autores que no han escrito ningún libro.

DELETE FROM book_author
WHERE book_id IS NULL
