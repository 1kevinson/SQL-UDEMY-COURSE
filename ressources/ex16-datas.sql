/*
Ecrire une requête qui renvoie le nom et le prix de chaque produit,
et renvoyer aussi dans une colonne le ratio entre prix du produit et
le prix maximum de tous les produits. (price / max price), et renommer
cette colonne price_ratio_max.
*/

SELECT name, price, price / (
	SELECT MAX(price) FROM products
) AS price_ratio_max
FROM products;