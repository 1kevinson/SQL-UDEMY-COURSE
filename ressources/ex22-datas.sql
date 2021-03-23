/*
Dans votre base de données twitter_db,
Joindre les tables users et tweets, ensuite renvoyer le nom du user dont l'id est 40 et le contenu de ses tweets ( t_content et photo_url )
*/

SELECT username, t_content, photo_url
FROM users
JOIN tweets ON tweets.user_id = users.id
WHERE users.id = 40;