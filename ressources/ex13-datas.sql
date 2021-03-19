/*
Dans la base de données ecommerce_app,
Écrivez une requête qui permet d'avoir le 2e et 3e produit les plus chers, des départements
Industrial, Garden et Toys confondus.
*/

SELECT *
FROM products
WHERE department IN ('Industrial', 'Garden', 'Toys')
ORDER BY price DESC
LIMIT 2
OFFSET 1;