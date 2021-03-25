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
SELECT name, price_weight_ratio
FROM (
    SELECT name, price/weight AS price_weight_ratio 
    FROM products
) AS p
WHERE price_weight_ratio > 5;


-- sous-requete avec JOIN
SELECT first_name 
FROM users 
JOIN (
    SELECT user_id 
    FROM orders
    WHERE product_id = 4
) AS o
ON o.user_id = users.id;

-- sous-requete avec la clause WHERE
SELECT id
FROM orders 
WHERE product_id IN (
    SELECT id 
    FROM products 
    WHERE price / weight > 50
);

-- L'operateur NOT IN
-- selectionner le nom des produits qui ne sont pas dans le même département que les produits
-- qui coûtent moins de 150
SELECT name
FROM products 
WHERE department NOT IN (
    SELECT department 
    FROM products 
    WHERE price < 150
);