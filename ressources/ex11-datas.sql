/*
Dans la base de données ecommerce
Ecrivez une requête qui va renvoyer le nom d'un utilisateur et le nombre de commandes qu'il 
a effectué dans une colonne nommée 'numbers of orders'.
*/

SELECT name, COUNT(*) AS 'numbers of orders'
FROM orders
JOIN customers ON customers.id = orders.customer_id 
GROUP BY customer_id ;