CREATE TABLE dogs (
    name VARCHAR(30),
    gender CHAR(1)
);

INSERT INTO dogs(name, gender)
VALUES ('Spot', 'M'),
      ('Lady', 'F');

CREATE TABLE items (
    price DECIMAL(5, 2),
    name VARCHAR(50)
);

INSERT INTO items
VALUES (125.99, 'box of socks'),
      (3.99, 'cheese stick');

CREATE TABLE things (price FLOAT);

INSERT INTO things
VALUES (88.45),
        (8877.55),
        (8877665544.45);


CREATE TABLE people (
        name VARCHAR(100),
        birthdate DATE,
        birthtime TIME,
        birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Larry', '1953-12-24', '11:26:25', '1953-12-24 11:26:25');

SELECT CURDATE();

SELECT CURTIME();

SELECT NOW();

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('ZZ Top', CURDATE(), CURTIME(), NOW());

SELECT 
    birthdt,
    MONTH(birthdt) AS month,
    DAY(birthdt) AS day,
    YEAR(birthdt) AS year,
    DAYNAME(birthdt) AS dayname
FROM
    people;


SELECT
    CONCAT(
        MONTHNAME(birthdate),
        ' ',
        DAY(birthdate),
        'th ',
        YEAR(birthdate)
    ) AS 'pretty date'
FROM people;
        

SELECT
    DATE_FORMAT(birthdate, '%M %D, %Y') AS 'prettier date'
FROM
    people;
    
SELECT
    name,
    birthdate,
    DATEDIFF(CURDATE(), birthdate) AS 'days passed since birth'
FROM
    people
ORDER BY
    3;
    

SELECT
    name,
    birthdate,
    DAYNAME(DATE_ADD(birthdate, INTERVAL 1 DAY)) AS 'day after'
FROM
    people;
    

SELECT
    name,
    birthdate,
    DAYNAME(birthdate - INTERVAL 1 DAY) AS 'day before'
FROM
    people;
    
    
CREATE TABLE comments (
    content VARCHAR(140),
    created_at TIMESTAMP DEFAULT NOW()
    );
    
    
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
    -- could also use NOW() instead of CURRENT_TIMESTAMP
);

-- Good use case for CHAR: Days of the week (M/T/W/R/F/)

CREATE TABLE inventory (
    item_name VARCHAR(150),
    price DECIMAL(8, 2),
    quantity INT
);

-- Difference between DATETIME and TIMESTAMP: TIMESTAMP is meant for recently-
-- occurring events, say a social media post, as the date range is from January
-- 1970 to some point in 2038. DATETIME has date ranges starting in year 1000
-- and is twice as large (in bytes) as TIMESTAMP.

SELECT CURTIME() AS 'current time';

SELECT CURDATE() AS 'current date';

SELECT DAYOFWEEK(NOW()) AS 'number day of week';

SELECT DAYNAME(NOW()) AS 'name of current day';

SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y') AS 'display date';

SELECT DATE_FORMAT(NOW(), '%M %D at %l:%i') AS 'english date and time';

CREATE TABLE tweets (
    content VARCHAR(140),
    username VARCHAR(25),
    time_created TIMESTAMP DEFAULT NOW()
);
