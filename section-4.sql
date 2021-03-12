-- Socia app database 
-- Posts, Comments, Users, Likes

-- Les ID aauto générés
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

INSERT INTO users (username)
VALUES 
    ('manthi90'),
    ('roosevelt65'),
    ('jacky43'),
    ('peterparker09');


CREATE TABLE IF NOT EXISTS posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT FK_PostUser FOREIGN KEY (user_id) REFERENCES users (id); -- ON DELETE CASCADE
);

-- Créer des clés etrangères
INSERT INTO posts (content, user_id)
VALUES 
    ('lorem ipsum 1',3);

INSERT INTO posts (content, user_id)
VALUES 
    ('lorem ipsum 2',4),
    ('lorem ipsum 3',2),
    ('lorem ipsum 4',1),
    ('lorem ipsum 5',2),
    ('lorem ipsum 6',4),
    ('lorem ipsum 7',1);

-- Contrainte d'insertion clé étrangères
INSERT INTO posts (content, user_id)
VALUES 
    ('lorem ipsum 56R3r',6666);