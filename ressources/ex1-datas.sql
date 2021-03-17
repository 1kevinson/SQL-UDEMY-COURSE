CREATE DATABASE IF NOT EXISTS city;

USE city;

CREATE TABLE IF NOT EXISTS people (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  email VARCHAR(50),
  birth_date YEAR
);

INSERT INTO people (name, email, birth_date)
VALUES 
    ('Graig','graig@mmail.com',1981),
    ('Annabelle','annabelle@mmail.com',1982),
    ('Rose','rose@mmail.com',1983),
    ('Mathilde','mathilde@mmail.com',1984),
    ('Henry','henry@mmail.com',1985),
    ('Jack','jack@mmail.com',1986),
    ('Naruto','naruto@mmail.com',1987),
    ('Peter','peter@mmail.com',1988),
    ('Mathieu','mathieu@mmail.com',1989),
    ('Patrick','patrick@mmail.com',1990);

SELECT * FROM people;