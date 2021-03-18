SELECT name, description FROM customers
LEFT JOIN orders 
ON orders.customer_id  = customers.id;