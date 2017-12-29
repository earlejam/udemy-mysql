SELECT
    CONCAT (
        SUBSTR(title, 1, 10),
        '...'
    ) AS 'Short Title'
FROM books;

SELECT
    SUBSTR(REPLACE(title, 'e', '3'), 1, 10) AS 'Chopped Leet Speak'
FROM books;

SELECT
    REVERSE(REPLACE(title, 'a', '4'))
FROM books;

SELECT
    CONCAT(author_fname, ' is ', CHAR_LENGTH(author_fname), ' characters long.') 
    AS 'First Name Lengths'
FROM books;

SELECT UPPER(
  REVERSE('WHy does my cat look at me with such hatred?') AS question
);

-- I_like_cats

SELECT
    REPLACE(title, ' ', '->') AS title
FROM books;

SELECT
    author_fname as forwards, 
    REVERSE(author_fname) AS backwards
FROM books;

SELECT
    UPPER(
        CONCAT(author_fname, ' ', author_lname)
    ) AS 'full name in caps'
FROM books;

SELECT
    CONCAT(title, ' was released in ', released_year)
    AS blurb
FROM books;

SELECT
    title,
    CHAR_LENGTH(title) AS 'character count'
FROM books;

SELECT
    CONCAT(SUBSTR(title, 1, 10), '...') AS 'short title',
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM books;