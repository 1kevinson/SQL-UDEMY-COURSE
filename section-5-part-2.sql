-- Posts and users
SELECT * 
FROM posts 
JOIN users ON posts.user_id = users.id;

-- Posts and comments
SELECT post_content , comment_content
FROM posts 
JOIN comments ON posts.id = comments.post_id;

-- Données pour l'exercice 7
INSERT INTO customers (name, phone)
VALUES 
    ('Marcel', '0544326344'),
    ('Gregory', '0688323344'),
    ('Julie', '0625477896'),
    ('Agatha', '0748596232');


INSERT INTO orders (description, customer_id)
VALUES 
    ('Apple Watch 5',1),
    ('Harry potter le prince de sang mêlé : Livre',3),
    ('Macbook Air',4),
    ('PC Asus Rog',4),
    ('L\'histoire sans fin : le DVD',5),
    ('Macbook Pro',2),
    ('Camera 4k',6),
    ('Réfrigerateur',3);