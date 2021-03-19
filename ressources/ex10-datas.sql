/*
Dans la base de données ecommerce
Ecrivez une requête qui va renvoyer l'id d'un utilisateur et le nombre de commandes qu'il 
a effectué dans une colonne nommée 'numbers of orders'.
*/

SELECT customer_id, COUNT(*) AS 'number of orders'
FROM orders
GROUP BY customer_id;