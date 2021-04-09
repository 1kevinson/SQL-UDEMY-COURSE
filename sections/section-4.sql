-- Socia Network app database 
-- Posts, Comments, Users, Likes 

--------
-- Les IDs auto générés
--------
-- Créer la base de données de l'application de réseaux sociaux
CREATE DATABASE IF NOT EXISTS social_app;

-- Selectionner la base de données à utiliser
USE social_app;

-- Les ID auto générés
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- Inserer les données et observer les ID auto générés
INSERT INTO users (name)
VALUES 
    ('Suzanne'),
    ('Roosevelt'),
    ('Martin'),
    ('Gabriel');

-- Créer des clés étrangères
CREATE TABLE IF NOT EXISTS posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(255) NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Inserer des fakes datas;
INSERT INTO posts (content, user_id)
VALUES 
    ('contenu 15', 1),
    ('contenu 178', 1),
    ('contenu 147', 2),
    ('contenu 14', 3),
    ('contenu 11', 4),
    ('lorem ipsum ', 3);


--------
-- Requêtes sur les données associées
--------
SELECT id, content FROM posts
WHERE user_id = 3;

SELECT * 
FROM posts
JOIN users ON users.id = posts.user_id;

SELECT name, content 
FROM posts
JOIN users ON users.id = posts.user_id;

-- Contrainte d'insertion clé étrangères
INSERT INTO posts (content, user_id)
VALUES 
    ('lorem ipsum 56R3r',6666);

INSERT INTO posts (content, user_id)
VALUES 
    ('belle journée', 3);

INSERT INTO posts (content, user_id)
VALUES 
    ('pouet !', NULL);

-- Contrainte liées à la suppression
DROP TABLE IF EXISTS posts, users;""

-- 1 --
-- recréer les tables users, posts et insérer les données dans users et posts ensuite -- 
CREATE TABLE IF NOT EXISTS posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(255) NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

DELETE FROM users WHERE id = 3;

-- 2 --
-- recréer les tables users, posts et insérer les données dans users et posts ensuite -- 
CREATE TABLE IF NOT EXISTS posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(255) NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE SET NULL
);

DELETE FROM users WHERE id = 1;

