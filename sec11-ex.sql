SELECT
    title, released_year 
FROM
    books
WHERE
    released_year != 2017;
    
SELECT
    title, author_fname, author_lname
FROM
    books
WHERE
    title NOT LIKE '% Stories %';
    
SELECT
    title
FROM
    books
WHERE
    title NOT LIKE 'W%';
   

SELECT
    title, released_year
FROM
    books
WHERE
    released_year >= 2000
ORDER BY
    released_year DESC;
    
    
-- returns 0 for false, 1 for true
SELECT 99 > 97;
SELECT 99 > 100;
SELECT 'a' > 'b'; -- false
SELECT 'a' = 'A'; -- true (case insensitive)


SELECT title, released_year FROM books 
WHERE released_year < 2000;


SELECT
    title, author_fname, author_lname, released_year
FROM
    books
WHERE
    released_year >= 2010 AND author_lname='Eggers';
    
    
SELECT *
FROM
    books
WHERE
    author_lname = 'Eggers' AND
    released_year > 2010 AND
    title LIKE '%novel%';


SELECT
    title, author_lname, released_year
FROM
    books
WHERE
    title LIKE 'A%' OR 
    title LIKE 'B%' OR 
    title LIKE 'C%';
    
    
SELECT
    title, released_year
FROM
    books
WHERE
    released_year >= 2004 AND
    released_year <= 2015;
    
    
SELECT
    title, released_year
FROM
    books
WHERE
    released_year BETWEEN 2004 AND 2015;
    
    
SELECT
    title, released_year
FROM
    books
WHERE
    released_year NOT BETWEEN 2004 AND 2015
ORDER BY
    released_year;
    
    
SELECT
    CAST('2017-05-02' AS DATETIME);
    
    
SELECT
    name, birthdt
FROM
    people
WHERE
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
                    AND CAST('2000-01-01' AS DATETIME);
                    
                    
SELECT
    title, author_lname
FROM
    books
WHERE
    author_lname IN ('Lahiri', 'Carver', 'Smith');
    
    
SELECT
    title, author_fname, author_lname, released_year
FROM
    books
WHERE
    released_year >= 2000
    AND
    released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016)
ORDER BY
    released_year;
    
    
SELECT
    title, released_year
FROM
    books
WHERE
    released_year % 2 != 0;
    
    
SELECT
    title, released_year,
    CASE
        WHEN released_year < 2000 THEN '20th Century Lit'
        ELSE 'Modern Lit'
    END AS Era
FROM
    books;
    
    
SELECT
    title, stock_quantity,
    CASE
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS stock
FROM
    books;
    
    
SELECT
    title, released_year
FROM
    books
WHERE
    released_year < 1980;
    
    
SELECT
    title, author_lname
FROM
    books
WHERE
    author_lname IN ('Eggers', 'Chabon');


SELECT
    title, author_lname, released_year
FROM
    books
WHERE
    released_year > 2000
    AND author_lname='Lahiri';
    
    
SELECT
    title, pages
FROM
    books
WHERE
    pages BETWEEN 100 AND 200;
    
    
SELECT
    title, author_lname
FROM
    books
WHERE
    author_lname LIKE 'C%'
    OR author_lname LIKE 'S%';
    
    
SELECT
    title, 
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN TITLE IN 
        ('Just Kids', 'A Heartbreaking Work of Staggering Genius')
        THEN 'Memoir'
        ELSE 'Novel'
    END
    AS 'TYPE'
FROM
    books;
    
    
SELECT
    title,
    author_lname,
    CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS 'count'
FROM
    books
GROUP BY
    author_lname, author_fname;