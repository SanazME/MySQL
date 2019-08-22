-- order by fname indescending order
SELECT title, author_fname, author_lname
from books
ORDER BY 2 DESC;

SELECT title, author_fname, author_lname
from books
ORDER BY author_lname, author_fname;
-- for the authors with the same last name, first order based on the lastname and then first name


 
