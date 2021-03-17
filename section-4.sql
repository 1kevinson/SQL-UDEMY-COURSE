-- Socia Network app database 
-- Posts, Comments, Users, Likes 

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

-- Inserer une premiere valeur
INSERT INTO posts (content, user_id)
VALUES 
    ('La météo est bizarre ce matin', 3);

-- Requêtes sur les données associées
-- Inserer des fakes datas;
INSERT INTO posts (content, user_id)
VALUES 
    ('contenu 15', 1),
    ('contenu 178', 1),
    ('contenu 147', 2),
    ('contenu 14', 3),
    ('contenu 11', 4),
    ('lorem ipsum ', 3);

SELECT * FROM posts
WHERE user_id = 1;

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
DROP TABLE IF EXISTS posts, users;

-- 1 --
-- recréer la table users et insérer les données dans users et posts ensuite -- 
CREATE TABLE IF NOT EXISTS posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(255) NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

DELETE FROM users WHERE id = 3;

-- 2 --
-- recréer la table users et insérer les données dans users et posts ensuite -- 
CREATE TABLE IF NOT EXISTS posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(255) NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE SET NULL
);

DELETE FROM users WHERE id = 1;
----------------------
-- EXERCICE 6 Start --
----------------------
-- Creer une relation One-to-Many entre un customer et des orders dans une BDD ecommerce
-- un client (customer) peut créer plusieurs commandes, mais une commande (order) ne peut être associée qu'à un seul client.
CREATE DATABASE IF NOT EXISTS ecommerce;

USE ecommerce;

CREATE TABLE IF NOT EXISTS customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone INT NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(200) NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);

-- Tester en créeant 2 clients 'Axel' et 'Benoit'
-- Axel devra avoir 2 commandes 'iPhone' et 'Nintendo Switch' 
-- Benoit quant à lui n'aura qu'une seule commande 'iPad'
INSERT INTO customers (name, phone)
VALUES 
    ('Axel',0544323344),
    ('Benoit',0644323344);

INSERT INTO orders (description, customer_id)
VALUES 
    ('iPhone',1),
    ('iPad',2),
    ('Nintendo Switch',1);

-- Afficher toutes les commandes d' Axel
SELECT * FROM orders WHERE customer_id = 1;

-- Supprimer la base de données ecommerce 
DROP database ecommerce;

----------------------
-- EXERCICE 6 End --
----------------------

-- Créer et utiliser des clés étrangères


-- Ressources pour tester les contraintes liées à la suppression
