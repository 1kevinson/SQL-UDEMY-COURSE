/*
Dans la base de données ecommerce,
Ecrivez une requête qui va renvoyer le nom d'un utilisateur et le nombre de commandes qu'il 
a effectué dans une colonne nommée 'numbers of orders', seulement pour les utilisateurs ayant passé 
au moins 2 commandes.
*/

SELECT name, COUNT(*) 
FROM orders
JOIN customers ON customers.id = orders.customer_id 
GROUP BY customer_id 
HAVING COUNT(*) >= 2 ;