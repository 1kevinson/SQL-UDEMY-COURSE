-- Permet de sauvegarder une requête dans le serveur de BDD pour l'executer plutard
-- Par définition, une procédure stockée est un segment d'instructions SQL déclaratives stockées dans le serveur MySQL

/* Why we change the DELIMETER
 * use (;) in the body of the stored procedure and $$ after the END keyword to end the stored procedure.
 * because the default delimiter for MySQL is (;)
*/

-- Example 1 --
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
-- Example 2 --
DELIMITER //

CREATE PROCEDURE GetProductByDepartment(
    IN department_name VARCHAR(50)
)

BEGIN
    SELECT *
    FROM products
    WHERE department = department_name;
END //

DELIMITER ;

-- Call a stored procedure
CALL GetProductByDepartment('Industrial');


-- Stored Procedure with OUT Parameter
-- Example 3 --
DELIMITER $$

CREATE PROCEDURE GetTotalOrderPaid(
    OUT total_orders_paid INT
)
BEGIN
    SELECT COUNT(*) 
    INTO total_orders_paid
    FROM orders 
    WHERE paid = 1;
END $$

DELIMITER ;

-- Call a stored procedure
CALL GetTotalOrderPaid(@total_orders_paid);

SELECT @total_orders_paid;

-- Show procedure status
SHOW PROCEDURE STATUS WHERE Db != 'sys';