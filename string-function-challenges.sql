-- Reverse and upper case : "Why does my cat look at me with such hatred?"
SELECT reverse(upper("Why does my cat look at me with such hatred?"));

SELECT
    REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  );

-- replace spaces with -> in title in books table
SELECT replace(title, ' ', '->') as 'title'
from books;

-- #############
SELECT author_lname as forwards, reverse(author_lname) as backwards
FROM books;

-- print fullname of authors in caps
SELECT
    upper(concat_ws(' ', author_fname, author_lname)) as 'full name in caps'
FROM books;

-- the title was release in released year
SELECT
    concat(title, ' was released in ', released_year, '.') as blurb
FROM books;

-- print each title and the length of each title
SELECT title as 'title', char_length(title) as 'character count'
FROM books;

-- short title + author + quantity
SELECT
    concat(substring(title, 1,10), '...') as 'short title',
    concat(author_lname,',', author_fname) as 'author',
    concat(stock_quantity, ' in stock') as 'quantity'
FROM books;
