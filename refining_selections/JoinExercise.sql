-- Create two schemas
CREATE DATABASE school;
USE school;
SELECT database();

CREATE TABLE students
(
    id INT NOT NULL
    AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR
    (100)
);

CREATE TABLE papers(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    grade DECIMAL(5.2),
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id)
    ON DELETE CASCADE 
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);


-- Print this
--+------------+---------------------------------------+-------+
--| first_name | title                                 | grade |
--+------------+---------------------------------------+-------+
--| Samantha   | De Montaigne and The Art of The Essay |    98 |
--| Samantha   | Russian Lit Through The Ages          |    94 |
--| Carlos     | Borges and Magical Realism            |    89 |
--| Caleb      | My Second Book Report                 |    75 |
--| Caleb      | My First Book Report                  |    60 |
--+------------+---------------------------------------+-------+

SELECT first_name, title, AVG(grade) AS grade
FROM students
JOIN papers
ON papers.student_id = students.id
GROUP BY student_id;

SELECT first_name, title, grade
FROM students
JOIN papers
ON papers.student_id = students.id
ORDER BY grade desc;

-- Print this
-- +------------+---------------------------------------+-------+
--| first_name | title                                 | grade |
--+------------+---------------------------------------+-------+
--| Caleb      | My First Book Report                  |    60 |
--| Caleb      | My Second Book Report                 |    75 |
--| Samantha   | Russian Lit Through The Ages          |    94 |
--| Samantha   | De Montaigne and The Art of The Essay |    98 |
--| Raj        | NULL                                  |  NULL |
--| Carlos     | Borges and Magical Realism            |    89 |
--| Lisa       | NULL                                  |  NULL |
--+------------+---------------------------------------+-------+

SELECT first_name, title, grade
FROM students
LEFT JOIN papers
ON students.id = papers.student_id;

SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
FROM students
LEFT JOIN papers
ON students.id = papers.student_id;

-- Print students average grades
SELECT first_name, IFNULL(AVG(grade), 0) AS average
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average desc;

-- Print this
-- +------------+---------+----------------+
--| first_name | average | passing_status |
--+------------+---------+----------------+
--| Samantha   | 96.0000 | PASSING        |
--| Carlos     | 89.0000 | PASSING        |
--| Caleb      | 67.5000 | FAILING        |
--| Raj        | 0       | FAILING        |
--| Lisa       | 0       | FAILING        |
--+------------+---------+----------------+

SELECT first_name, IFNULL(AVG(grade), 0) AS average, 
CASE 
    WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'PASSING'
    ELSE 'FAILING'
END AS passing_status
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average desc;
