-- Creer un trigger qui permet de stocker dans une table nommée users_audit,
-- les utilisateurs supprimés

-- table 
CREATE TABLE users_audit (
  id int PRIMARY KEY AUTO_INCREMENT,
  user_id int NOT NULL,
  name varchar(50) NOT NULL,
  delete_at DATETIME NOT NULL
);

-- trigger
DELIMITER $$

CREATE TRIGGER after_delete_user
    AFTER DELETE ON users
    FOR EACH ROW 
BEGIN 
    INSERT INTO users_audit (user_id, name, delete_at)
    VALUES
        (OLD.id, CONCAT(OLD.last_name, ' ', OLD.first_name), NOW());
END$$

DELIMITER ;

-- Delete user
DELETE FROM users WHERE id = 2;

-- show data in audit table
SELECT * FROM users_audit;