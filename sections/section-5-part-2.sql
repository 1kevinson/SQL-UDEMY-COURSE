
-- Posts and users
SELECT * 
FROM posts 
JOIN users ON posts.user_id = users.id;

-- Posts and comments
SELECT post_content , comment_content
FROM posts 
JOIN comments ON posts.id = comments.post_id;

-- 4 types of JOINS
-- Inner JOIN
SELECT * 
FROM posts 
JOIN users ON posts.user_id = users.id;

-- Left JOIN -- parler de l'ordre
INSERT INTO users (username) 
VALUES ('Arsene Kevin');

SELECT * 
FROM users 
LEFT JOIN posts ON posts.user_id = users.id;

-- Right JOIN -- parler de l'ordre
INSERT INTO posts (post_content, user_id) 
VALUES ('empty post',NULL);

SELECT * 
FROM users 
RIGHT JOIN posts
ON posts.user_id = users.id;

-- Full Join 
-- n'est plus supporté par MySQL mais nous verrons une alternative plutard dans cette formation

-- JOIN et WHERE
-- les utilisateurs qui commentent sur leur propre posts
SELECT *
FROM comments 
JOIN posts ON posts.id = comments.post_id 
WHERE comments.user_id = posts.user_id;

-- JOINS avec 3 tables
-- les utilisateurs qui commentent sur leur propre posts
SELECT comment_content , post_content, username 
FROM comments 
JOIN posts ON posts.id = comments.post_id 
JOIN users ON users.id = comments.user_id AND users.id = posts.user_id;