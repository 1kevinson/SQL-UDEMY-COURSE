/*
Dans votre base de données twitter_db,
Selectionez et renvoyez dans une table, le nom de chaque utilisateur et le nombre de likes (dasn une colonne
nommée 'numbers of likes' ) qu'ils ont crées.
*/

SELECT username, COUNT(*) AS 'numbers of likes'
FROM likes 
JOIN users ON likes.user_id = users.id
GROUP BY username;