-- primer ejercicio de clase 1
CREATE TABLE Mascota (
    Pet_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Species VARCHAR(50) NOT NULL,
    Breed VARCHAR(50),
    Age INT CHECK (Age >= 0) 
);
-- se respalda en la foto pet

-- Se crea tabla de Libros
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Genre VARCHAR(100),
    Publication_Date DATE,
    Author_ID INT REFERENCES Authors(Author_ID) ON DELETE CASCADE
);

-- Se crea la tabla de Autores
CREATE TABLE Authors (
    Author_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Nationality VARCHAR(100)
);

-- Relación : Un autor puede escribir uno o más libros, y cada libro tiene un único autor.
-- Serlaciona en la imagen author-book