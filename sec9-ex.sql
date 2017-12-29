SELECT 
    COUNT(DISTINCT author_fname)
FROM
    books;
    

SELECT
    COUNT(DISTINCT author_fname, author_lname) AS 'num authors'
FROM
    books;
    

SELECT
    COUNT(title) AS 'number titles with "the"'
FROM
    books
WHERE
    title LIKE '%the%';
    
    
SELECT
    author_fname
    , author_lname
    , COUNT(*) AS 'num books'
FROM
    books
GROUP BY author_lname, author_fname;


SELECT
    released_year
    , COUNT(*) AS 'num releases'
FROM
    books
GROUP BY
    released_year
ORDER BY
    released_year;
    
    
SELECT
    CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) were released.')
    AS description
FROM
    books
GROUP BY
    released_year
ORDER BY
    released_year;
    
    
SELECT
    MIN(released_year) AS 'oldest release'
FROM books;


SELECT
    MAX(pages) AS 'max pages'
FROM books;


SELECT
    title AS 'longest book'
    , pages
FROM
    books
ORDER BY pages DESC LIMIT 1;


SELECT * FROM books
WHERE
    pages = (
        SELECT MIN(pages) FROM books
    );
    
    
SELECT
    author_fname AS first
    , author_lname AS last
    , MIN(released_year) AS 'first book published in:'
FROM
    books
GROUP BY
    author_lname, author_fname
ORDER BY
    author_lname;
    
    
SELECT
    author_fname AS first
    , author_lname AS last
    , MAX(pages) AS 'longest book'
FROM
    books
GROUP BY
    author_lname, author_fname;
    

SELECT
    SUM(pages) AS 'total pages'
FROM 
    books;
    
    
SELECT
    CONCAT(author_fname, ' ', author_lname) AS author,
    SUM(pages) AS 'total pages written'
FROM
    books
GROUP BY
    author_lname, author_fname
ORDER BY
    SUM(pages) DESC;
    
    
SELECT
    AVG(released_year)
FROM
    books;
    
    
SELECT
    released_year AS year,
    AVG(stock_quantity) AS 'average qty'
FROM
    books
GROUP BY
    released_year
ORDER BY
    released_year;
    
    
SELECT
    COUNT(*) AS 'number of books'
FROM
    books;
    
    
SELECT
    released_year
    , COUNT(*) AS 'number of books'
FROM
    books
GROUP BY
    released_year
ORDER BY
    released_year;
    
    
SELECT
    SUM(stock_quantity) AS 'books in stock'
FROM
    books;
    
    
SELECT
    CONCAT(author_fname, ' ', author_lname) AS author,
    AVG(released_year) AS 'average released year'
FROM
    books
GROUP BY
    author_lname, author_fname
ORDER BY
    author_lname, author_fname;


SELECT
    CONCAT(author_fname, ' ', author_lname) AS 'author name',
    pages
FROM
    books
ORDER BY pages DESC LIMIT 1;


SELECT
    released_year AS year,
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM 
    books
GROUP BY
    released_year
ORDER BY
    released_year;
