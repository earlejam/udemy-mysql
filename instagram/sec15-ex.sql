-- Who are our five oldest users?
SELECT
    username, created_at
FROM
    users
ORDER BY
    created_at
LIMIT 5;


-- On what day of the week do most users register?
SELECT
    DAYNAME(created_at) AS day,
    COUNT(id) AS total
FROM
    users
GROUP BY
    day
ORDER BY
    total DESC;
    
    
-- Which users have never posted a photo?
SELECT
    username,
    IFNULL(COUNT(photos.id), 0) AS num_photos
FROM
    users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE
    photos.image_url IS NULL
GROUP BY
    users.id;
    
    
-- Who won the contest of having the photo with the most likes?
SELECT
    users.username,
    COUNT(*) AS num_likes
FROM    
    photos
INNER JOIN likes
    ON photos.id = likes.photo_id
INNER JOIN users
    ON users.id = photos.user_id
GROUP BY
    photos.id
ORDER BY
    num_likes DESC 
LIMIT 1;


-- How many times does our average user post?
SELECT
    COUNT(DISTINCT photos.id) / COUNT(DISTINCT users.id) AS avg
FROM
    users
LEFT JOIN photos
    ON users.id = photos.user_id;
    
    
-- What are the top 5 most commonly used hashtags?
SELECT
    tags.tag_name AS tag_name,
    COUNT(*) AS times_used
FROM
    photo_tags
INNER JOIN tags
    ON tags.id = photo_tags.tag_id
GROUP BY
    tags.id
ORDER BY
    times_used DESC
LIMIT 5;


-- Which users are bots, i.e. have liked every photo on the site?
-- count likes for each user, if same number as all pics then a bot
SELECT
    users.username AS bots
FROM
    likes
INNER JOIN users
    ON users.id = likes.user_id
GROUP BY
    users.id
HAVING 
    COUNT(*) = (SELECT COUNT(*) FROM photos);
