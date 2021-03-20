/*
Selectionner le nom des produits qui coutent moins de 50€
et le nom des produits dont le poids est superieur à 27. 
*/

	SELECT name
	FROM products
	WHERE price < 50
UNION
	SELECT name
	FROM products
	WHERE weight > 27;