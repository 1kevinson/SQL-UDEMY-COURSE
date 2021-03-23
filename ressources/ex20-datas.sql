/*
Creer une procédure qui prendra en parametre un nombre et renverra le nom, le departement et le prix 
des produits dont le prix est inférieur à ce nombre.
*/

DELIMITER //

CREATE PROCEDURE GetProductsInfosByPrice(
    IN price_tag INT
)

BEGIN
    SELECT name, department, price AS filtered_price
    FROM products
    WHERE price < price_tag;
END //

DELIMITER ;

-- Appeler la procédure stockée
 CALL GetProductsInfosByPrice(50);