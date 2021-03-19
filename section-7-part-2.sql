-- ranger les produits par leur prix
SELECT *
FROM products
ORDER BY price; -- DESC

-- ranger les produits par leur prix et leur poids
SELECT *
FROM products
ORDER BY price, weight DESC;

-- OFFSET et LIMIT
-- les 5 produits les plus chers
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

-- le produit le plus cher
SELECT *
FROM products
ORDER BY price DESC
LIMIT 1;