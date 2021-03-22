-- Permet de sauvegarder une requête dans le serveur de BDD pour l'executer plutard
-- Par définition, une procédure stockée est un segment d'instructions SQL déclaratives stockées dans le serveur MySQL

/* Why we change the DELIMETER
 * use (;) in the body of the stored procedure and $$ after the END keyword to end the stored procedure.
 * because the default delimiter for MySQL is (;)
*/

-- Example 1
DELIMITER //

CREATE PROCEDURE GetAllProducts()

BEGIN
	SELECT * FROM products;
END //

DELIMITER ;

-- Call a stored procedure
CALL GetAllProducts()

-- Delete stored procedure
DROP PROCEDURE GetAllProducts;


-- Stored Procedure with In Parameter
-- Example 2
DELIMITER //

CREATE PROCEDURE GetOrderCountByStatus(
	IN orderStatus VARCHAR(50),
	OUT total INT
)

BEGIN
    -- DECLARE total INT DEFAULT 0;
	SELECT COUNT(orderNumber)
	INTO total
	FROM orders
	WHERE status = orderStatus;
END //

DELIMITER ;

-- Call a stored procedure
CALL GetOrderCountByStatus('in process', @total);

SELECT @total;

-- Delete stored procedure
DROP PROCEDURE GetOrderCountByStatus;

-- Show procedure status
SHOW PROCEDURE STATUS WHERE Db != 'sys';