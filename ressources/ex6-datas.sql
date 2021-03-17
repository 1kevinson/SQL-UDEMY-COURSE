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

DROP database ecommerce;
