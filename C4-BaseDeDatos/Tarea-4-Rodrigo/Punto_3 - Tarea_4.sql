--Punto 3

--Eliminar el libro 'Pride and Prejudice' de la base de datos
select * from books;

delete from books
where book_id = 2;
-- no sepude borrar porque tiene una relacion a travez de la columna
--publisher_id, y no se puede realizar un delete en cascada, puesto que
--la tabla no se creo con este atributo.
