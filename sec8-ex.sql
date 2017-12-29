SELECT DISTINCT
    CONCAT(author_fname, ' ', author_lname) AS 'full name'
FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;

SELECT author_lname FROM books ORDER BY author_lname;

SELECT title 
FROM books 
ORDER BY title DESC;

SELECT title, author_fname, author_lname
FROM books
ORDER BY 2;

SELECT title, author_fname, author_lname
FROM books
ORDER BY author_fname, author_lname;

SELECT title, author_lname, released_year
FROM books
ORDER BY released_year DESC LIMIT 5;

SELECT title, author_lname
FROM books
ORDER BY title LIMIT 3, 5;

SELECT title
FROM books
ORDER BY title LIMIT 3, 384293472935;

SELECT title
FROM books
WHERE title LIKE '%the%';

SELECT title, stock_quantity
FROM books
WHERE stock_quantity LIKE '___';

SELECT title, author_lname
FROM books
WHERE title LIKE '%\%%';

SELECT title
FROM books
WHERE title LIKE '%stories%';

SELECT 
    title, pages
FROM books
ORDER BY pages DESC LIMIT 1;

SELECT
    CONCAT(title, ' - ', released_year) AS summary
FROM books
ORDER BY released_year DESC 
LIMIT 3;


SELECT
    title, author_lname
FROM
    books
WHERE
    author_lname LIKE '% %';
    

SELECT
    title, released_year, stock_quantity
FROM
    books
ORDER BY stock_quantity
LIMIT 3;


SELECT
    title, author_lname
FROM
    books
ORDER BY
    author_lname, title;


SELECT
    UPPER(
        CONCAT('my favorite author is ', author_fname, ' ', author_lname, '!')
    ) AS yell
FROM 
    books
ORDER BY
    author_lname;