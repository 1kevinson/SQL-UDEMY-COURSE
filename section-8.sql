-- rechercher les 5 produits avec les prix les plus chers
-- et les 5 produits avec les ratio prix/poids élevés
USE ecommerce_app;

-- UNION (enlève les lignes dupliquées)
(
    SELECT *
    FROM products
    ORDER BY price DESC
    LIMIT 5
)
UNION
(
    SELECT *
    FROM products 
    ORDER BY price / weight DESC 
    LIMIT 5
);

-- UNION ALL 
(
    SELECT *
    FROM products
    ORDER BY price DESC
    LIMIT 5
)
UNION ALL
(
    SELECT *
    FROM products 
    ORDER BY price / weight DESC 
    LIMIT 5
);


-- DISTINCT
