-- LEAST
-- promotion d'un produit 
SELECT name, price, LEAST(400, 0.5 * price) AS selled_price
FROM products;


-- GREATEST
-- la plus grande valeur entre 20 et 1.5 * weight = frais de livraison
SELECT name, weight, GREATEST(20, 1.5 * weight) AS shipping_price
FROM products;

-- CASE
-- comparaison des prix
SELECT 
    name, 
    price,
    CASE 
        WHEN price > 600 THEN 'high'
        WHEN price > 300 THEN 'medium'
        ELSE 'cheap'
    END AS price_comparison
FROM products;
