-- database
DROP DATABASE IF EXISTS ig_clone;
CREATE DATABASE ig_clone;
USE ig_clone;

-- users table
CREATE TABLE users(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- photos tables
CREATE TABLE photos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

-- likes don't have ID because we don;t refer likes anywhere else
-- each user is allowed to like once for a given photo so we want
-- to have a unique combination of user_id and photo_id
CREATE TABLE likes(
    created_at TIMESTAMP DEFAULT NOW(),
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows(
    created_at TIMESTAMP DEFAULT NOW(),
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)
);

CREATE TABLE tags(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tag_content VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags(
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);


-- INSERT INTO users (username) VALUES
-- ('GorbiTheCat'),
-- ('CharlieBrown'),
-- ('Mimi');

-- INSERT INTO photos (image_url, user_id) VALUES
-- ('/asdfasd', 1),
-- ('/asdfasd98', 2),
-- ('/asdfasd300', 3 );

-- INSERT INTO comments(comment_text, user_id, photo_id) VALUES
-- ('Meow!', 1, 2),
-- ('Amazing shot!', 3, 2),
-- ('Msfgfsdeow!', 2, 1);

-- INSERT INTO likes(user_id, photo_id) VALUES
-- (1,1),
-- (2,1),
-- (1,2),
-- (3,3);

-- INSERT INTO follows(follower_id, followee_id) VALUES
-- (1,2),
-- (2,3),
-- (3,2);
-- Won't work because of primary key constaint
-- INSERT INTO likes(user_id, photo_id)VALUES
-- (3,3);

-- INSERT INTO tags(tag_content) VALUES
-- ('adorable'),
-- ('fun'),
-- ('sunrise ');

-- INSERT INTO photo_tags(photo_id, tag_id) VALUES
-- (1,2),
-- (1,3),
-- (3,2);

