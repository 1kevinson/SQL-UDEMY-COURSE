-- lister les noms et les prix des produits qui sont plus chers 
-- que tous les produits dans le departement Sports

SELECT name, price
FROM products
WHERE price > (
	SELECT MAX(price)
	FROM products
	WHERE department = 'Sports'
);

-- sous requete dans le SELECT (single value returned by subquerie)
SELECT name, price, (
	SELECT price FROM products WHERE id = 4
) AS ID_PRICE_4
FROM products
WHERE price > 800;

-- sous-requete dans le FROM (must have an Alias)
