-- Utiliser un trigger pour suivre les variations de prix et ainsi prévoir les 
-- previsions de ventes sur différents produits

-- Créer une table d'audit
CREATE TABLE IF NOT EXISTS products_audit(
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    price_before INT NOT NULL,
    price_after INT NOT NULL,
    weight INT NOT NULL,
    change_date DATETIME NOT NULL
);

-- Créer le trigger pour tracker les changement de prix
-- Lancer avec la commande de tout le fichier de script
DELIMITER //

CREATE TRIGGER after_product_price_update
    AFTER UPDATE ON products
    FOR EACH ROW 
BEGIN 
    IF OLD.price <> NEW.price THEN
        INSERT INTO products_audit (product_id, name, department, price_before, price_after, weight, change_date)
        VALUES
            (OLD.id, OLD.name, OLD.department, OLD.price, NEW.price, OLD.weight, NOW());
    END IF;
END//
    
DELIMITER ;

-- Selectionner le premier produit
SELECT * FROM products WHERE id = 1;

-- Selectionner la table product audit
SELECT * FROM products_audit;

-- Update du poids 
UPDATE products SET weight = 32 WHERE id = 1;

-- Update du prix
UPDATE products SET price = 800 WHERE id = 1;

-- Update par erreur de tous les prix
UPDATE products SET price = 200;

SHOW triggers;

DROP TRIGGER before_employee_update;