-- Show distinct author names
SELECT DISTINCT concat_ws(' ',author_fname, author_lname) as 'distinct fullname'
FROM books;

-- An easy way without concat :
SELECT DISTINCT author_lname, author_fname
FROM books;
