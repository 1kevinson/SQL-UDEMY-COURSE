-- Créeons notre 3e table

CREATE TABLE IF NOT EXISTS reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rating INT,
    reviewer_id INT,
    order_id INT,
    FOREIGN KEY (reviewer_id) REFERENCES customers (id), 
    FOREIGN KEY (order_id) REFERENCES orders (id)    
);

INSERT INTO reviews (rating, reviewer_id, order_id)
VALUES 
    (4,1,1),
    (5,1,4),
    (4,3,5),
    (2,5,1),
    (4,2,11),
    (4,2,9),
    (3,4,6),
    (5,5,10),
    (5,3,2),
    (1,6,7),
    (3,4,8);

-- Le nom des clients, la description des commandes et les notes qu'ils ont attribué à ces commandes
SELECT name, description, rating 
FROM reviews 
JOIN orders ON orders.id = reviews.order_id
JOIN customers ON customers.id = reviews.reviewer_id AND customers.id = orders.customer_id; 