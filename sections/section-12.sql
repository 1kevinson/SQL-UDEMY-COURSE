-- Validation
CREATE DATABASE IF NOT EXISTS validation_db;

USE validation_db;

CREATE TABLE IF NOT EXISTS products (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(40),
  department VARCHAR(40),
  price INT,
  weight INT 
);

-- Insert all values
INSERT INTO products (name, department, price, weight)
VALUES 
    ('hoodie', 'Clothes', 35, 1);
    
-- Insert with NULL price   
INSERT INTO products (name, department, weight)
VALUES 
    ('panties', 'Clothes', 2);
   
UPDATE products SET price = 20 WHERE price IS NULL;
   
ALTER TABLE products 
CHANGE price 
	   price INT NOT NULL;

-- Afficher les contraintes sur la table products
DESC products;

-- SET DEFAULT VALUE for price column
ALTER TABLE products 
CHANGE price 
	   price INT DEFAULT 0;
	   
-- ADD UNIQUE constraint on name column
ALTER TABLE products 
ADD CONSTRAINT uc_name
UNIQUE(name);

-- Remove a UNIQUE constraint
ALTER TABLE products
DROP CONSTRAINT uc_name;

-- ADD UNIQUE constraint on name and department columns
ALTER TABLE products 
ADD CONSTRAINT uc_name_department
UNIQUE(name, department);

-- Test 2 Columns UNIQUENESS
INSERT INTO products (name, department, price, weight)
VALUES 
    ('jeans', 'Houseware', 35, 1);

-- Add CHECK constraint on products table
-- show constraint in DDL tab in product table
ALTER TABLE products 
ADD CONSTRAINT check_price
CHECK (price >= 0);

-- Test check_price constraint
INSERT INTO products (name, department, price, weight)
VALUES 
    ('hoodie', 'Clothes', -35, 1);
   
-- Check over multiple columns
CREATE TABLE IF NOT EXISTS orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(40) NOT NULL,
	created_at TIMESTAMP NOT NULL,
	delivered_at TIMESTAMP NOT NULL,
	CHECK (created_at < delivered_at)
);

-- Verify inserting good datas
INSERT INTO orders (name, created_at, delivered_at) 
VALUES 
	( 'pants','2008-01-01 11:30:00','2008-01-10 15:00:00');

-- Verify inserting wrong datas
INSERT INTO orders (name, created_at, delivered_at) 
VALUES 
	( 'pants','2008-01-01 11:30:00','2007-01-10 15:00:00');


   