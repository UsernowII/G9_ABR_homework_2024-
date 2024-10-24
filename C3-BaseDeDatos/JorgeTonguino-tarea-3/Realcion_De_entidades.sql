-- Tabla Autor
CREATE TABLE Autor (
    Author_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Nationality VARCHAR(50)
);

-- Tabla Libro
CREATE TABLE Libro (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    Publication_Year INT
);

-- Tabla Editor
CREATE TABLE Editor (
    Publisher_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50)
);

-- Tabla de relación Book_Author
CREATE TABLE Book_Author (
    Book_ID INT NOT NULL,
    Author_ID INT NOT NULL,
    PRIMARY KEY (Book_ID, Author_ID),
    FOREIGN KEY (Book_ID) REFERENCES Libro(Book_ID) ON DELETE CASCADE,
    FOREIGN KEY (Author_ID) REFERENCES Autor(Author_ID) ON DELETE CASCADE
);

-- Incertar datos en las tablas con la siguiente sentencia INSERT INTO

-- Inserción de datos en la tabla Author
INSERT INTO Autor (Name, Nationality) VALUES
('George Orwell', 'británico'),
('Jane Austen', 'británico'),
('Mark Twain', 'americano');

-- Inserción de datos en la tabla Publisher
INSERT INTO Editor (Name, Country) VALUES
('Libros de pingüinos', 'Reino Unido'),
('Prensa de la Universidad de Oxford', 'Reino Unido');

-- Inserción de datos en la tabla Book
INSERT INTO Libro (Title, Genre, Publication_Year) VALUES
('1984', 'Distópico', 1949),
('Orgullo y prejuicio', 'romance', 1813),
('Las aventuras de Huckleberry Finn', 'Aventura', 1884);

-- Inserción de datos en la tabla Book_Author
INSERT INTO Book_Author (Bo
ok_ID, Author_ID) VALUES
(1, 1),
(2, 2),
(3, 3);