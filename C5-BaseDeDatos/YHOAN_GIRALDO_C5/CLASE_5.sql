--TAREA 5 (SOLUCION AL FINAL)

-- Crear tabla Author
CREATE TABLE Author (
    Author_ID INTEGER PRIMARY KEY,
    Name VARCHAR(100),
    Nationality VARCHAR(50)
);

-- Insertar datos en Author
INSERT INTO Author (Author_ID, Name, Nationality) VALUES
(1, 'George Orwell', 'British'),
(2, 'Jane Austen', 'British'),
(3, 'Mark Twain', 'American'),
(4, 'J.K. Rowling', 'British'),
(5, 'J.R.R. Tolkien', 'British');

-- Crear tabla Publisher
CREATE TABLE Publisher (
    Publisher_ID INTEGER PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50)
);

-- Insertar datos en Publisher
INSERT INTO Publisher (Publisher_ID, Name, Country) VALUES
(1, 'Penguin Books', 'United Kingdom'),
(2, 'Oxford University Press', 'United Kingdom'),
(3, 'HarperCollins', 'United States');

-- Crear tabla Book
CREATE TABLE Book (
    Book_ID INTEGER PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    Publication_Year INTEGER,
    Publisher_ID INTEGER,
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID)
);

-- Insertar datos en Book
INSERT INTO Book (Book_ID, Title, Genre, Publication_Year, Publisher_ID) VALUES
(1, '1984', 'Dystopian', 1949, 1),
(2, 'Pride and Prejudice', 'Romance', 1813, 2),
(3, 'Adventures of Huckleberry Finn', 'Adventure', 1884, 3),
(4, 'Harry Potter and the Philosopher''s Stone', 'Fantasy', 1997, 1),
(5, 'The Hobbit', 'Fantasy', 1937, 1);

-- Crear tabla Book_Author (relación muchos a muchos entre Book y Author)
CREATE TABLE Book_Author (
    Book_ID INTEGER,
    Author_ID INTEGER,
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID),
    PRIMARY KEY (Book_ID, Author_ID)
);

-- Insertar datos en Book_Author
INSERT INTO Book_Author (Book_ID, Author_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(4, 1), -- George Orwell también es coautor de "Harry Potter and the Philosopher's Stone"
(5, 2); -- Jane Austen también es coautora de "The Hobbit"
-- **************************************************************************************

--Punto 1: Generar Reportes con JOINs


--Reporte 1: Usar INNER JOIN para seleccionar los títulos 
--de los libros junto con el nombre de su editorial.
SELECT Book.Title, Publisher.Name FROM Book
INNER JOIN Publisher ON Book.Publisher_ID = Publisher.Publisher_ID;
-- **************************************************************************


--Reporte 2: Usar LEFT JOIN para seleccionar todos los autores y los títulos de 
--los libros que han escrito, incluyendo autores que no han escrito ningún libro.
SELECT Author.Name, Book.Title FROM Author
LEFT JOIN Book_Author ON Author.Author_ID = Book_Author.Author_ID
LEFT JOIN Book ON Book_Author.Book_ID = Book.Book_ID;
-- **************************************************************************


--Reporte 3: Usar RIGHT JOIN para seleccionar todos los libros y los nombres de 
--los autores que los han escrito, incluyendo libros que no tienen autores asociados.
SELECT Book.Title, Author.Name FROM Book
RIGHT JOIN Book_Author ON Book.Book_ID = Book_Author.Book_ID
RIGHT JOIN Author ON Book_Author.Author_ID = Author.Author_ID
-- **************************************************************************


--Reporte 4: Usar una combinación de INNER JOIN y LEFT JOIN para seleccionar todos los libros, 
--sus autores, y la editorial, incluyendo libros que no tienen autores y aquellos sin editorial.
SELECT Book.Title, Author.Name, Publisher.Name FROM Book
INNER JOIN Book_Author ON Book.Book_ID = Book_Author.Book_ID
LEFT JOIN Author ON Book_Author.Author_ID = Author.Author_ID
LEFT JOIN Publisher ON Book.Publisher_ID = Publisher.Publisher_ID;
-- **************************************************************************


--Reporte 5: Usar INNER JOIN para seleccionar todos los libros que han sido escritos 
--por más de un autor y mostrar el título del libro junto con los nombres de los autores.
SELECT Book.Title, STRING_AGG(Author.Name, ', ')
FROM Book
INNER JOIN Book_Author ON Book.Book_ID = Book_Author.Book_ID
INNER JOIN Author ON Book_Author.Author_ID = Author.Author_ID
GROUP BY Book.Book_ID
HAVING 
    COUNT(Book_Author.Author_ID) > 1;
-- **************************************************************************
	





