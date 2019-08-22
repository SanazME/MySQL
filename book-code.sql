
SELECT
    Concat
    (
        substring(title, 1, 10), '...'
    ) as 'short title'
FROM books;
-- #########################################

SELECT
    replace
    (
        substring(title, 1, 10), 'e', 3
    ) AS 'short & cool title'
FROM books;

-- #########################################

SELECT
    CONCAT_WS
    (
        '-', title, reverse(author_fname)
    ) as 'weird title'
FROM books;

-- #############################

SELECT
    Concat
        (
            author_lname, ' is ', char_length(author_lname), ' characters long.'
        ) as 'Length of last name'
FROM books;

-- #################################

SELECT
    CONCAT('My favourite book is ', UPPER(title)) AS 'Favorite book'
FROM books;