-- print out the current date (no time)
select date(now());
SELECT DATE(current_timestamp) AS 'current date';

-- print out the current day of the week (the number & day name)
SELECT dayofweek(current_timestamp);
SELECT dayname(current_timestamp);

-- print the current date using this format : mm/dd/yyyy
SELECT date_format(now(), '%m/%d/%Y');

-- Print out the current date and time using this format
-- January 3rd at 3:15
SELECT date_format(now(), '%M %D at %l:%i');

-- create a tweets table that stores:
-- username
-- tweet content
-- time it was created

create TABLE tweets
(
    username VARCHAR(10),
    tweet_content VARCHAR(100),
    created_at TIMESTAMP DEFAULT current_timestamp
);

INSERT INTO tweets
    (username, tweet_content)
VALUES('carrot', "carrot stuff!"),
    ('apple', "apple stuff!");

UPDATE tweets SET tweet_content = "New apple stuff" WHERE username = "apple";


-- 
SELECT title, released_year,
    CASE 
    WHEN released_year >= 2010 THEN 'Mod Lit'
    WHEN released_year <= 1999 THEN 'Before 2000 Lit'
    ELSE 'Other Lit' END
AS genre
FROM books;


SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***' END
    AS 'Stock'
FROM books;

-- Evaluate them
SELECT 10 != 10;
SELECT 15 > 14 && 99-5 <= 94;
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;

-- select all books writtern before 1980 ( non inclusive)
SELECT * from books where released_year < 1980;

-- select all book written by Eggers or chabon
SELECT * from books where author_lname in ('Eggers', 'Chabon');

-- select all books written by Lahiri published after 2000
SELECT * from books where author_lname = 'Lahiri' && released_year > 2000;

-- select all books with page count between 100 and 200
SELECT * from books WHERE pages BETWEEN 100 AND 200;

-- select all books where author_lanme starts with a 'C' or an 'S'
SELECT * from books WHERE author_lname LIKE 'C%' OR 
                          author_lname LIKE 'S%' 
                    ORDER BY author_lname;

SELECT * from books WHERE substring(author_lname, 1, 1) in ('C', 'S')
                    ORDER BY author_lname;


-- if the title contains stories -> 'short stories'
-- if Just Kids and A Heartbreaking Work -> 'Memoir'
-- everything else -> Novel
SELECT title, author_lname, 
CASE
WHEN title like '%stories%' THEN 'Short stories'
WHEN title LIKE 'Just Kids' OR  title LIKE 'A Heartbreaking Work%' THEN 'Memoir'
ELSE 'Novel' END
AS 'TYPE' 
FROM books;



-- 

SELECT title, author_lname, concat(count(*),  case when count(*) = 1 then ' book' else ' books' end) AS 'COUNT'
FROM books
GROUP BY author_lname, author_fname 
ORDER BY author_lname;