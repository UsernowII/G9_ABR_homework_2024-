-- Libros publicados por 'Penguin Books'.
SELECT Books.*
FROM Books
JOIN Publishers ON Books.Publisher_ID = Publishers.Publisher_ID
WHERE Publishers.Name = 'Penguin Books';

-- libros publicados después del año 1950.
SELECT Books.*
FROM Books
WHERE Books.Publication_Year > 1950;

-- Nombres de autores que han escrito libros de género 'Fantasy' utilizando una subconsulta.
SELECT Authors.name
FROM Authors
WHERE Authors.Author_id IN (
    SELECT Books_Authors.Author_ID
    FROM Books_Authors
    WHERE Books_Authors.Book_ID IN (
        SELECT Books.Book_ID
        FROM Books
        WHERE Books.Genre = 'Fantasy'
    )
);

-- títulos de los libros escritos por autores cuyo nombre contiene 'J.K.' utilizando una subconsulta.
SELECT Books.Title
FROM Books
WHERE Books.Book_ID IN (
    SELECT Books_Authors.Book_ID
    FROM Books_Authors
    WHERE Books_Authors.Author_ID IN (
        SELECT Authors.Author_id
        FROM Authors
        WHERE Authors.name LIKE '%J.K.%'
    )
);

-- Títulos de los libros escritos por autores británicos.

SELECT Books.Title
FROM Books
WHERE Books.Book_ID IN (
    SELECT Books_Authors.Book_ID
    FROM Books_Authors
    WHERE Books_Authors.Author_ID IN (
        SELECT Authors.Author_id
        FROM Authors
        WHERE Authors.Nationality = 'British'
    )
);