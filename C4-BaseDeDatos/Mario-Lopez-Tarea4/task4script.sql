--Obtain books published by Penguin Books
select * from book where publisher_id = 1

-- Books where publication year is after 1950
select * from book where publication_year > 1950

--Select the names of authors who have written books in the 'Fantasy' genre using a subquery.
SELECT name FROM author 
WHERE author_id IN (
	SELECT author_id FROM book_author 
	WHERE book_id IN (
		SELECT book_id FROM book 
	WHERE genre = 'Fantasy'	
	)
);

--Select the titles of books wrote by authors who names contains 'J.K. usign a subquery.
SELECT title FROM book WHERE book_id IN (
	SELECT book_id FROM book_author WHERE author_id IN (
		SELECT author_id FROM author WHERE name LIKE '%J.K.%'
	)
)

--Using a subquery, sleecto the titles of the books wrote by british authors.
SELECT title FROM book WHERE book_id IN (
	SELECT book_id FROM book_author WHERE author_id IN (
		SELECT author_id FROM author WHERE nationality = 'British'
	)
)

--Update genre from the book '1984' to 'Science Fiction'
UPDATE book SET genre = 'Science Fiction' WHERE title = '1984'

--Change nationality of 'Mark Twain' to 'Canadian'
UPDATE author SET nationality = 'Canadian' WHERE name = 'Mark Twain'

--Delete the book 'Pride ad Prejuice' from the database
DELETE FROM book_author WHERE book_id = 2;
DELETE FROM book WHERE title = 'Pride and Prejudice';

--Delete author that does not have relation with ny book
DELETE FROM author WHERE author_id NOT IN (
	SELECT author_id FROM book_author
)