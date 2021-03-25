-- Les CTE

/*
    Selectionnez les noms des utilisateurs qui ont été taggé dans un tweet,
    ainsi que les likes qu'ils ont crée avant le 8 août 2020.
*/

SELECT users.username, likes_and_tags.created_at
FROM users
JOIN (
    SELECT user_id, created_at FROM tags
    UNION ALL
    SELECT user_id, created_at FROM likes
) AS likes_and_tags ON likes_and_tags.user_id = users.id
WHERE likes_and_tags.created_at < '2020-08-08'
ORDER BY likes_and_tags.created_at DESC;


-- Query with CTE
WITH likes_and_tags AS (
    SELECT user_id, created_at FROM tags
    UNION ALL
    SELECT user_id, created_at FROM likes
)
SELECT users.username, likes_and_tags.created_at
FROM users
JOIN likes_and_tags ON likes_and_tags.user_id = users.id
WHERE likes_and_tags.created_at < '2020-08-08'
ORDER BY likes_and_tags.created_at DESC;
