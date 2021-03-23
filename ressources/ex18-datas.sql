/*
Dans la base de donnée ecommerce_app,
Ecrivez une requête qui renvoie le nom, le departement et le prix des produits
qui sont plus chers que les produits dans le departement 'Industrial'.
*/
-- v1
SELECT name, department, price
FROM products 
WHERE price > (
    SELECT MAX(price) 
    FROM products 
    WHERE department = 'Industrial'
);

-- v2
SELECT name, department, price
FROM products 
WHERE price > ALL (
    SELECT price
    FROM products 
    WHERE department = 'Industrial'
);