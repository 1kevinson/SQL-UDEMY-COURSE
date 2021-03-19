-- agrégation et regroupement des données
SELECT user_id ,COUNT(id) AS 'number of comments'
FROM comments
GROUP BY user_id;

-- le nombre de commentaires pour chaque photos
SELECT post_id, COUNT(*)
FROM comments 
GROUP BY post_id;