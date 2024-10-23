-- REPORTE 1:
    SELECT b.Title, p.Name AS Publisher FROM Book b
        INNER JOIN Publisher p ON b.Publisher_ID = p.Publisher_ID; 

-- REPORTE 2:
    SELECT a.Name, b.Title FROM Author a
        LEFT JOIN Book_Author ba ON a.Author_ID = ba.Author_ID
        LEFT JOIN Book b ON ba.Book_ID = b.Book_ID;

-- REPORTE 3:
    SELECT b.Title, a.Name FROM Book b
        RIGHT JOIN Book_Author ba ON b.Book_ID = ba.Book_ID
        RIGHT JOIN Author a ON ba.Author_ID = a.Author_ID;

-- REPORTE 4:
    SELECT b.Title, a.Name, p.Name AS Publisher FROM Book b
        LEFT JOIN Book_Author ba ON b.Book_ID = ba.Book_ID
        LEFT JOIN Author a ON ba.Author_ID = a.Author_ID
        LEFT JOIN Publisher p ON b.Publisher_ID = p.Publisher_ID;

-- REPORTE 5:
    SELECT b.Title, a.Name FROM Book b
        INNER JOIN Book_Author ba ON b.Book_ID = ba.Book_ID
        INNER JOIN Author a ON ba.Author_ID = a.Author_ID
    WHERE b.Book_ID IN (
        SELECT Book_ID
        FROM Book_Author
        GROUP BY Book_ID
        HAVING COUNT(Author_ID) > 1
    );

-- REPORTE 6:
    SELECT p.Name AS Publisher, COUNT(b.Book_ID) AS Total_Books, STRING_AGG(b.Title, ', ') AS Titles
    FROM Publisher p
        LEFT JOIN Book b ON p.Publisher_ID = b.Publisher_ID
    GROUP BY p.Name
    ORDER BY Total_Books DESC
    LIMIT 1;
