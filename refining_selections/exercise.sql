-- select all story collections titles that contain 'stories'
SELECT title
FROM books
WHERE title LIKE '%stories%';

-- Find the longest book, print out the title and page count
SELECT title, pages
FROM books
ORDER BY pages DESC LIMIT 1;


-- print a summary containing the title and released_year for the 3 most recent books
SELECT CONCAT
(title, ' - ', released_year) as summary
FROM books
ORDER BY released_year DESC
LIMIT 3;

-- Find all books with an author_lname that contains a space " "
SELECT title
, author_lname
FROM books
WHERE author_lname LIKE '% %';

-- Find the 3 Books with the lowest stock, select title, year and stock
SELECT title, released_year, stock_quantity
FROM books
ORDER BY stock_quantity
LIMIT 3;

-- Print title and author_lname, sorted first by author_lname and then by title
SELECT title
, author_lname FROM books ORDER BY author_lname, title;

SELECT title
, author_lname
FROM books
ORDER BY 2, 1;

-- Sorted Alphabetically By Last Name
SELECT concat('MY FAVOURITE AUTHOR IS ', UPPER(author_fname), ' ', UPPER(author_lname), '!'
) as yell
FROM books
ORDER BY author_lname;

-- Find a year each author published their first book
SELECT author_fname as 'first name', author_lname as 'last name', min(released_year) as 'released year'
FROM books
GROUP BY author_fname, author_lname;

-- Find the longerst page count for each author
SELECT concat(author_fname, ' ',author_lname) as author, title, max(pages) as 'Max pages'
FROM books
GROUP BY author_fname, author_lname;

-- Sum all pages each author has written
SELECT author_fname, author_lname, sum(pages)
FROM books
GROUP BY author_fname, author_lname;

-- Average the released year across all books
SELECT avg(released_year)
FROM books;

-- calculate the average stock quantity for books released in the same year
SELECT released_year, avg(stock_quantity)
FROM books
GROUP BY released_year;

-- Print the number of books in the database
SELECT count(*)
FROM books;

-- print out how many books released each year
SELECT released_year, count(*) AS "number of books"
FROM books
GROUP BY released_year;

-- print out the total number of books in stock
SELECT concat('total number of books in stock: ', sum(stock_quantity))
FROM books;

-- find the average released year for each author
SELECT author_fname, author_lname, avg(released_year)
FROM books
GROUP BY author_fname, author_lname;

-- find the full name of the author who wrote the longest book
SELECT concat(author_fname, ' ', author_lname) as 'full name', pages
FROM books
ORDER BY pages desc
LIMIT 1;

-- print out the number of books and the average pages for each year
SELECT
  released_year,
  COUNT(*),
  AVG(pages)
FROM books
GROUP BY released_year
ORDER BY released_year DESC;

