-- Punto 2 Modificar Información con UPDATE


-- Actualizar el género del libro '1984' a 'Science Fiction'.
UPDATE Books
SET Genre = 'Science Fiction'
WHERE Title = '1984';

-- Cambiar la nacionalidad de 'Mark Twain' a 'Canadian'.
UPDATE Authors 
SET Nationality = 'Canadian'
WHERE name = 'Mark Twain';



-- Punto 3: Eliminar Información con DELETE

-- Primero se elimina la relacion.
DELETE FROM Books_Authors
WHERE Book_ID = 2;  

-- Libro 'Pride and Prejudice' eliminado de la base de datos.
DELETE FROM Books
WHERE Title = 'Pride and Prejudice';

-- Autores que no han escrito ningún libro seran eliminados.
-- Se crea un nuevo autor y para el ejercicio.

INSERT INTO Authors (author_id, name, Nationality)
VALUES (6, 'New Author', 'Unknown');

SELECT Authors.name
FROM Authors
WHERE Authors.Author_id NOT IN (
    SELECT DISTINCT Books_Authors.Author_ID
    FROM Books_Authors
);

SELECT * FROM Authors WHERE name = 'New Author';

DELETE FROM Authors
WHERE name = 'New Author';

