-- Create a database and two tables for customer and order
CREATE DATABASE customers_orders;
USE customer_orders;

CREATE TABLE customers
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
    
CREATE TABLE orders (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT, 
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);


-- Find all orders by customer George
-- 1. subQuary
SELECT * FROM orders WHERE customer_id = 
(
    SELECT id FROM customers 
    WHERE first_name='Boy' AND last_name='George';
);

-- Joins

-- Cross join - taking every customer and joining it to every order
-- similar to multiplication
SELECT * from customers, orders;

-- Implicit Inner join
SELECT * FROM customers, orders WHERE customers.id = customer_id;

-- Explicit Inner Join
SELECT * FROM customers
JOIN orders
    ON customers.id = customer_id;

-- Explicit Inner Join - Fancies
SELECT first_name, last_name, order_date 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
ORDER BY order_date;
    

SELECT first_name, last_name, order_date, sum(amount) AS total_amount FROM customers
JOIN orders
ON customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY total_amount desc;

-- Left Join
SELECT * FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id


SELECT first_name, last_name, order_date, amount
FROM customers
LEFT JOIN orders
    ON customers.id = customer_id
GROUP BY customers.id
ORDER BY orders.amount desc;


SELECT 
    first_name,
    last_name,
    order_date,
    IFNULL(sum(amount), 0) AS total_amount
FROM customers
LEFT JOIN orders
    ON customers.id = customer_id
GROUP BY customers.id
ORDER BY total_amount desc;

-- RIGHT JOIN
SELECT * FROM customers
RIGHT JOIN orders 
ON customers.id = customer_id;

-- Right JOIn 2
-- to get total amount of all missing users
SELECT 
    IFNULL(first_name, 'MISSING') AS first,
    IFNULL(last_name, 'USER') AS last,
    amount,
    sum(amoutn) as total
FROM customers
RIGHT JOIN orders
ON orders.customer_id = customers.id
GROUP BY first_name, last_name

-- ON DELETE CASCADE
CREATE TABLE orders (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT, 
    FOREIGN KEY(customer_id) REFERENCES customers(id)
    ON DELETE CASCADE
);


