-- Lister tous les clients et leurs commandes respectives
SELECT * FROM customers 
JOIN orders ON customers.id = orders.customer_id;