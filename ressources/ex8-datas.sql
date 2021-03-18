-- V1
SELECT name, description 
FROM customers
LEFT JOIN orders 
ON orders.customer_id  = customers.id;

-- V2
SELECT name, description 
FROM orders
RIGHT JOIN customers 
ON orders.customer_id  = customers.id;