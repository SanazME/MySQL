SELECT title , released_year
FROM books
ORDER BY released_year DESC
LIMIT
5;

-- Using Offset with limit
SELECT title
, released_year 
FROM books 
ORDER BY released_year 
DESC LIMIT 0, 5;

-- Going from limit 5 to the end of the table
SELECT title
FROM books LIMIT
5, 99999999999;
