-- Creare las tabla de Cursos
CREATE TABLE Courses (
    Course_ID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Description TEXT
);

-- Creare las tabla de Estudiantes
CREATE TABLE Students (
    Student_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

-- Creare las tabla de relación Curso_Estudiante
CREATE TABLE Course_Student (
    Course_ID INT REFERENCES Courses(Course_ID) ON DELETE CASCADE,
    Student_ID INT REFERENCES Students(Student_ID) ON DELETE CASCADE,
    PRIMARY KEY (Course_ID, Student_ID)
);
-- Se puede evidenciar que se un estudian puede tener muchos cursos,
-- o un curso muchos estudiantes, como tambien hay la relacion de muchos a muchos.

--se soporta con la imagen de Student-Course