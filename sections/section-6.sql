-- agrégation et regroupement des données
SELECT user_id ,COUNT(id) AS 'number of comments'
FROM comments
GROUP BY user_id;

-- Aller plus loin avec le grouping 
-- le nombre de commentaires pour chaque photos
SELECT post_id, COUNT(*)
FROM comments 
GROUP BY post_id;

-- le nombre de commentaires pour chaque posts, pour les posts dont l'id < 4, 
-- et les posts qui ont plus de 20 commentaires

SELECT post_id ,COUNT(*)
FROM comments
WHERE post_id < 4
GROUP BY post_id 
HAVING COUNT(*) > 20;