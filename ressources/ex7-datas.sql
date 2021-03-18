-- Données pour l'exercice 7
INSERT INTO customers (name, phone)
VALUES 
    ('Marcel', '0544326344'),
    ('Gregory', '0688323344'),
    ('Julie', '0625477896'),
    ('Hugues', '0655458896'),
    ('Agatha', '0748596232');


INSERT INTO orders (description, customer_id)
VALUES 
    ('Apple Watch 5',1),
    ('Harry potter le prince de sang mêlé : Livre',3),
    ('Macbook Air',4),
    ('PC Asus Rog',4),
    ("L\'histoire sans fin : le DVD",5),
    ('Macbook Pro',2),
    ('Camera 4k',6),
    ('Réfrigerateur',3);

-- Lister tous les clients et leurs commandes respectives
SELECT * 
FROM customers 
JOIN orders 
ON customers.id = orders.customer_id;

-- montrer aussi avec le AS pour renommer les tables
SELECT * 
FROM customers AS c
JOIN orders AS o 
ON c.id = o.customer_id;