-- CREATE TABLE customers (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     first_name VARCHAR(100),
--     last_name VARCHAR(100),
--     email VARCHAR(100)
-- );

-- CREATE TABLE orders (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     order_date DATE,
--     amount DECIMAL(8,2),
--     customer_id INT,
--     FOREIGN KEY (customer_id) REFERENCES customers(id)
-- );

SELECT *
FROM
    orders
WHERE
    customer_id = (
        SELECT id
        FROM customers
        WHERE last_name='George'
    );


-- cross join (like cartesian product)
SELECT * FROM customers, orders; 


-- implicit inner join
SELECT
    first_name, last_name, order_date, amount
FROM
    customers, orders
WHERE
    customers.id = orders.customer_id;
    
    
-- explicit inner join
SELECT
    first_name, last_name, order_date, amount
FROM
    customers
JOIN
    orders ON customers.id = orders.customer_id;

SELECT
    first_name, last_name, order_date, amount
FROM
    orders
JOIN
    customers on customers.id = orders.customer_id
ORDER BY
    order_date;
    
    
-- biggest spenders
SELECT
    first_name,
    last_name,
    SUM(amount) AS 'total spent'
FROM
    orders
INNER JOIN
    customers ON orders.customer_id = customers.id
GROUP BY
    orders.customer_id
ORDER BY 3 DESC;


-- left join of lowest spenders
SELECT
    first_name,
    last_name,
    order_date,
    IFNULL(SUM(amount), 0) AS total_spent
FROM
    customers
LEFT JOIN
    orders ON customers.id = orders.customer_id
GROUP BY
    customers.id
ORDER BY
    4;
    
-- right join (no difference seen due to no orders w/o customers)
SELECT
    first_name, last_name, email, order_date, amount
FROM
    customers
RIGHT JOIN orders 
    ON customers.id = orders.customer_id;
    

-- if there were orphaned data, would show 'Missing User' instead of name
SELECT
    IFNULL(first_name, 'Missing') AS first,
    IFNULL(last_name, 'User') AS last,
    order_date, 
    SUM(amount) AS 'total spent'
FROM
    customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY
    last_name, first_name
ORDER BY
    last_name;
    
    
-- ON DELETE CASCADE: when a customer is deleted that has a corresponding
-- order, delete the order as well.

-- CREATE TABLE orders (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     order_date DATE,
--     amount DECIMAL(8,2),
--     customer_id INT,
--     FOREIGN KEY (customer_id) 
--         REFERENCES customers(id)
--         ON DELETE CASCADE
-- );


-- CREATE TABLE students (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     first_name VARCHAR(100)
-- );

-- CREATE TABLE papers (
--     title VARCHAR(100),
--     grade INT,
--     student_id INT,
--     FOREIGN KEY (student_id)
--         REFERENCES students(id)
--         ON DELETE CASCADE
-- );

-- INSERT INTO students (first_name) VALUES 
-- ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

-- INSERT INTO papers (student_id, title, grade ) VALUES
-- (1, 'My First Book Report', 60),
-- (1, 'My Second Book Report', 75),
-- (2, 'Russian Lit Through The Ages', 94),
-- (2, 'De Montaigne and The Art of The Essay', 98),
-- (4, 'Borges and Magical Realism', 89);

SELECT
    first_name, title, grade
FROM
    papers
INNER JOIN students
    ON students.id = papers.student_id
ORDER BY
    grade
DESC;


SELECT
    first_name, title, grade
FROM
    papers
RIGHT JOIN students
    ON students.id = papers.student_id;
    

SELECT
    first_name,
    IFNULL(title, 'MISSING') AS title,
    IFNULL(grade, 0) AS grade
FROM
    students
LEFT JOIN papers
    ON students.id = papers.student_id;
    
    
SELECT
    first_name,
    CASE
        WHEN AVG(grade) IS NULL THEN 0
        ELSE AVG(grade)
    END AS average
FROM
    students
LEFT JOIN papers
    ON students.id = papers.student_id
GROUP BY
    first_name
ORDER BY
    2
DESC;


SELECT
    first_name,
    CASE
        WHEN AVG(grade) IS NULL THEN 0
        ELSE AVG(grade)
    END AS average,
    CASE
        WHEN AVG(grade) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM
    students
LEFT JOIN papers
    ON students.id = papers.student_id
GROUP BY
    first_name
ORDER BY
    2
DESC;