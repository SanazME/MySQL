-- Reward the 5 longests users
SELECT username, created_at
FROM users
ORDER BY created_at asc
LIMIT 5;

-- Most popular registration date
SELECT count(*) AS counts, DAYNAME(created_at) AS day FROM users
GROUP BY day
ORDER BY counts desc;

-- Find inactive users without any posts
SELECT username FROM users
LEFT JOIN photos
ON photos.user_id = users.id
WHERE photos.created_at is NULL;

-- the most popular photo
SELECT photos.id,
       photos.image_url,
       count(*) AS total,
       users.username
FROM photos
INNER JOIN likes
ON likes.photo_id = photos.id
INNER JOIN users
ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY total desc
LIMIT 10;

-- how many times does an average user post?
-- total photos/total users
SELECT count(*) from photos;
SELECT count(*) from users;

SELECT count(*) / (SELECT count(*) from users) AS average from photos;
SELECT 
    (SELECT count(*) from photos) / (SELECT count(*) from users) AS average;

-- find 5 most common hashtags
SELECT 
    tags.tag_name,
    count(*) AS total
FROM tags
INNER JOIN photo_tags
ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY total desc
LIMIT 4;


-- user with the highest posts
SELECT  photos.user_id,
        users.username,
        count(*) AS total_posts
FROM photos
INNER JOIN users
ON photos.user_id = users.id
GROUP BY photos.user_id
ORDER BY total_posts desc
LIMIT 10;

-- Find users who have liked every single photos on the site
SELECT 
    users.username,
    users.id,
    count(*) AS total_like
from users 
inner join likes on
likes.user_id = users.id
GROUP by users.id
HAVING total_like = (SELECT count(*) from photos);

