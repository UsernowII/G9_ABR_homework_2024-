SELECT * FROM Authors;

--Reporte 1
-- Usar INNER JOINpara seleccionar los títulos de los libros junto con el nombre de su editorial.
SELECT Books.Title, Publishers.Name AS Publisher_Name
FROM Books
INNER JOIN Publishers ON Books.Publisher_ID = Publishers.Publisher_ID;

--Reporte 2
-- LEFT JOIN para seleccionar todos los autores y los títulos de los libros que han escrito, 
--incluyendo autores que no han escrito ningún libro.

SELECT Authors.name AS Author_Name, Books.Title
FROM Authors
LEFT JOIN Books_Authors ON Authors.Author_ID = Books_Authors.Author_ID
LEFT JOIN Books ON books_Authors.book_ID = Books.Book_ID;

--Reporte 3
-- RIGHT JOIN para seleccionar todos los libros y los nombres de los autores que han escrito libros, 
--incluyendo libros que no tienen autores asociados.

SELECT Books.Title, Authors.name AS Author_Name
FROM Books
RIGHT JOIN Books_Authors ON Books.Book_ID = Books_Authors.Book_ID
RIGHT JOIN Authors ON Books_Authors.Author_ID = Authors.Author_ID;

--Reporte 1
-- Usar INNER JOINpara seleccionar los títulos de los libros junto con el nombre de su editorial.
SELECT Books.Title, Publishers.Name AS Publisher_Name
FROM Books
INNER JOIN Publishers ON Books.Publisher_ID = Publishers.Publisher_ID;

--Reporte 2
-- LEFT JOIN para seleccionar todos los autores y los títulos de los libros que han escrito, 
--incluyendo autores que no han escrito ningún libro.

SELECT Authors.name AS Author_Name, Books.Title
FROM Authors
LEFT JOIN Books_Authors ON Authors.Author_ID = Books_Authors.Author_ID
LEFT JOIN Books ON books_Authors.book_ID = Books.Book_ID;

--Reporte 3
--Usar RIGHT JOINpara seleccionar todos los libros y los nombres de los autores que han escrito libros, 
--incluyendo libros que no tienen autores asociados.

SELECT Books.Title, Authors.name AS Author_Name
FROM Books
RIGHT JOIN Books_Authors ON Books.Book_ID = Books_Authors.Book_ID
RIGHT JOIN Authors ON Books_Authors.Author_ID = Authors.Author_ID;

--Reporte 4
-- Usar una combinación de INNER JOIN y LEFT JOIN para seleccionar todos los libros, sus autores, 
-- y la editorial, incluyendo libros que no tienen autores y aquellos sin editorial.

SELECT books.title, Authors.name AS Author_name, Publishers.name AS Publisher_Name
FROM Books
LEFT JOIN books_Authors ON Books.Book_ID = Books_Authors.Book_ID
LEFT JOIN Authors ON Books_Authors.Author_ID = Authors.Author_ID
LEFT JOIN Publishers ON Books.Publisher_ID = Publishers.Publisher_ID;

--Reporte 5
--INNER JOIN para seleccionar todos los libros que han sido escritos por más de un autor 
--y mostrar el título del libro junto con los nombres de los autores.

SELECT Books.Title, Authors.name AS Author_Name
FROM Books
INNER JOIN Books_Authors ON Books.Book_ID = Books_Authors.Book_ID
INNER JOIN Authors ON Books_Authors.Author_ID = Authors.Author_ID
WHERE Books.Book_ID IN (
    SELECT Book_ID
    FROM Books_Authors
    GROUP BY Book_ID
    HAVING COUNT(Author_ID) > 1
);

--Reporte 6
-- RETO
-- INNER JOIN, LEFT JOIN, y GROUP BYpara seleccionar la editorial que tiene más libros publicados, 
-- junto con el número total de libros y los títulos de esos libros.

SELECT Publishers.Name AS Publisher_Name, COUNT(Books.Book_ID) AS Total_Books, STRING_AGG(Books.Title, ', ') AS Book_Titles
FROM Publishers
LEFT JOIN Books ON Publishers.Publisher_ID = Books.Publisher_ID
GROUP BY Publishers.Name
ORDER BY Total_Books DESC
LIMIT 1;

-- para revicion no entiendo mucho esto












