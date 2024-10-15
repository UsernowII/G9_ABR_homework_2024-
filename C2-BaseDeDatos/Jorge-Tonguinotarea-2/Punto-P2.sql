CREATE TABLE Proyecto (
    Project_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL
);

CREATE TABLE Empleado (
    Employee_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL
);

CREATE TABLE Proyecto_Empleado (
    Project_ID INT NOT NULL,
    Employee_ID INT NOT NULL,
    PRIMARY KEY (Project_ID, Employee_ID),
    FOREIGN KEY (Project_ID) REFERENCES Proyecto(Project_ID) ON DELETE CASCADE,--elimina registros huérfanos en Proyecto_Empleado al borrar un proyecto o empleado.
    FOREIGN KEY (Employee_ID) REFERENCES Empleado(Employee_ID) ON DELETE CASCADE
);
--Aqui relaciocimamos de muchoa a muchos a traves de una llave foranea
--y vemos la relacion que tien cada tabla.
lo reflejamos en la imagen Poryect_Employee