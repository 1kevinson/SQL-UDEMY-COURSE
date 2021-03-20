/*
Ecrivez une requête qui permet de renvoyer les noms des produits dont le prix est superieur
au prix moyen (AVG) des produits.
*/

SELECT name
FROM products
WHERE price > (
    SELECT AVG(price) FROM products
);