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


