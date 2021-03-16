-- Socia app database 
-- Posts, Comments, Users, Likes (expliain with twitter screenshots )

-- Les ID auto générés
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

INSERT INTO users (username)
VALUES 
    ('manthi90'),
    ('roosevelt65'),
    ('jacky43'),
    ('peterparker09');


CREATE TABLE IF NOT EXISTS posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(255) NOT NULL,
    user_id INT REFERENCES users (id); -- ON DELETE CASCADE
);

-- Créer des clés etrangères
INSERT INTO posts (content, user_id)
VALUES 
    ('lorem ipsum 1',3);

INSERT INTO posts (content, user_id)
VALUES 
    ('lorem ipsum 2',4),
    ('lorem ipsum 3',2),
    ('lorem ipsum 4',1),
    ('lorem ipsum 5',2),
    ('lorem ipsum 6',4),
    ('lorem ipsum 7',1);

-- Contrainte d'insertion clé étrangères
INSERT INTO posts (content, user_id)
VALUES 
    ('lorem ipsum 56R3r',6666);

-- Créer et utiliser des clés étrangères
----------------
-- EXERCICE 6 --
----------------
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
    FOREIGN KEY (customer_id) REFERENCES customer (id)
);

-- Tester en créeant 2 clients
INSERT INTO customers (name, phone)
VALUES 
    ('blake',0544323344),
    ('blade',0644323344);

INSERT INTO orders (description, customer_id)
VALUES 
    ('iphone',1),
    ('ipad',2),
    ('nintendo switch',1);

SELECT * FROM orders WHERE customer_id = 1;

DROP database ecommerce;

-- Ressources pour tester les contraintes liées à la suppression
