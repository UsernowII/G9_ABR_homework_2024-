
-- LA SOLUCION DE TAREA 4 ESTA AL FINAL


--CREACION TABLA 1
create table AUTHOR(

	AUTHOR_ID integer primary key,
	NAME varchar(100),
	NATIONALITY varchar(50)
	
)

--DATOS TABLA 1
INSERT INTO AUTHOR (AUTHOR_ID, NAME, NATIONALITY)
	VALUES
	(1, 'George Orwell', 'British'), 
	(2, 'Jane Austen', 'British'),
	(3, 'Mark Twain', 'American' );
-- -------------------------------------------------------

	
--CREACION TABLA 2
create table BOOK(
	
	BOOK_ID integer primary key,
	TITLE varchar(100),
	GENRE varchar(50),
	PUBLICATION_YEAR integer,

	PUBLISHER_ID integer,
	foreign key (PUBLISHER_ID) 
	references PUBLISHER(PUBLISHER_ID)
	
)

--DATOS TABLA 2
INSERT INTO BOOK (BOOK_ID, TITLE, GENRE, PUBLICATION_YEAR, PUBLISHER_ID )
	VALUES
	(1, '1984', 'Dystopian', 1949, 1 ),
	(2, 'Pride and Prejudice', 'Romance', 1813, 2),
	(3, 'Adventures of Huckleberry Finn', 'Adventure', 1884, 1);
	

-- -------------------------------------------------------

--CREACION TABLA 3
create table PUBLISHER(
	
	PUBLISHER_ID integer primary key,
	NAME varchar(100),
	COUNTRY varchar (50)

)
	
--DATOS TABLA 3
INSERT INTO PUBLISHER (PUBLISHER_ID, NAME, COUNTRY)
	VALUES
	(1, 'Penguin Books', 'United Kingdom'), 
	(2, 'Oxford University Press', 'United Kingdom');
-- -------------------------------------------------------



--CREACION TABLA 4 RELACION
create table BOOK_AUTHOR(

	AUTHOR_ID integer,
	foreign key (AUTHOR_ID) 
	references AUTHOR(AUTHOR_ID),
	
	BOOK_ID integer,
	foreign key (BOOK_ID) 
	references BOOK(BOOK_ID)
	
)

--DATOS TABLA 4
INSERT INTO BOOK_AUTHOR (AUTHOR_ID, BOOK_ID)
	VALUES
	(1, 1),
	(2, 2),
	(3, 3);
-- -------------------------------------------------------


--        SOLUCION PARA TAREA 4
--PUNTO 1 Generar Reportes con SELECT

-- Reporte 1: Seleccionar todos los libros publicados por 'Penguin Books'.
SELECT * FROM BOOK WHERE PUBLISHER_ID = 
	(SELECT PUBLISHER_ID FROM PUBLISHER WHERE NAME = 'Penguin Books')
-- **********************************************************************
	

--Reporte 2: Seleccionar todos los libros publicados después del año 1950.
SELECT * FROM BOOK WHERE PUBLICATION_YEAR > 1950 OR PUBLICATION_YEAR > 1800
-- *************************************************************************


--Reporte 3: Seleccionar los nombres de los autores que han escrito libros 
--de género 'Fantasy' (CAMBIO A 'ROMANCE' PARA EJECUTAR) utilizando una subconsulta.
SELECT * FROM AUTHOR WHERE AUTHOR_ID =
	(SELECT BOOK_ID FROM BOOK WHERE GENRE = 'Romance')
-- **********************************************************************************


--Reporte 4: Seleccionar los títulos de los libros escritos por
--autores cuyo nombre contiene 'J.K.' (CAMBIO POR 'J' PARA TENER RESULTADOS) utilizando una subconsulta.
SELECT TITLE FROM BOOK WHERE BOOK_ID = 
	(SELECT AUTHOR_ID FROM AUTHOR WHERE NAME LIKE 'J%')
-- **********************************************************************************


--(Opcional) Reporte 5: Utilizando una subconsulta, seleccionar los 
--títulos de los libros escritos por autores británicos.
SELECT TITLE, GENRE, PUBLICATION_YEAR FROM BOOK WHERE BOOK_ID IN 
	(SELECT AUTHOR_ID FROM AUTHOR WHERE NATIONALITY = 'British')
-- **********************************************************************************


--PUNTO 2 Modificar Información con UPDATE

--Actualizar el género del libro '1984' a 'Science Fiction'.
UPDATE BOOK SET GENRE = 'Science Fiction' WHERE BOOK_ID = 
(SELECT BOOK_ID FROM BOOK WHERE TITLE = '1984' );

SELECT * FROM BOOK;
-- **********************************************************************************


--Cambiar la nacionalidad de 'Mark Twain' a 'Canadian'.
UPDATE AUTHOR SET NATIONALITY = 'Canadian' WHERE AUTHOR_ID =
(SELECT AUTHOR_ID FROM AUTHOR WHERE NAME =  'Mark Twain' )

SELECT * FROM AUTHOR;
-- **********************************************************************************

--Punto 3: Eliminar Información con DELETE

--Eliminar el libro 'Pride and Prejudice' de la base de datos.

DELETE FROM BOOK_AUTHOR WHERE BOOK_ID =
	(SELECT BOOK_ID FROM BOOK WHERE TITLE = 'Pride and Prejudice');

DELETE FROM BOOK WHERE TITLE = 'Pride and Prejudice';
SELECT * FROM BOOK;
-- **********************************************************************************


--Eliminar los autores que no han escrito ningún libro.	
DELETE FROM AUTHOR WHERE AUTHOR_ID NOT IN(
	SELECT DISTINCT BOOK_AUTHOR.AUTHOR_ID FROM BOOK_AUTHOR)

SELECT * FROM AUTHOR;
--(ACA SE ELIMINA EL AUTHOR QUE LE BORRAMOS EL LIBRO EN EL PASO ANTERIOR)
-- **********************************************************************************


































