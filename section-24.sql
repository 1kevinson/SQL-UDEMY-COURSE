-- Les vues

-- Les utilisateurs les plus populaires
-- Les utilisateurs qui ont été le plus de fois taggés et qui ont eu plus de 3 retweets sur leurs tweets
SELECT username, COUNT(*)
FROM users
JOIN (
    SELECT user_id FROM tags
    UNION ALL
    SELECT user_id 
    FROM tweets
    WHERE id IN (
        SELECT tweet_id
        FROM retweets
        GROUP BY tweet_id 
        HAVING COUNT(*) > 3
    )
) AS famous ON famous.user_id = users.id
GROUP BY username
ORDER BY COUNT(*) DESC
LIMIT 10;

-- Créer la vue famous users
CREATE VIEW famous_users AS (
    SELECT 'tags' AS type, created_at, user_id, tweet_id FROM tags
    UNION ALL 
    SELECT 'tweets' AS type, created_at, user_id, id AS tweet_id FROM tweets
    WHERE id IN (
        SELECT tweet_id
        FROM retweets
        GROUP BY tweet_id 
        HAVING COUNT(*) > 3
    )
);


-- recuperer les données de la vue
SELECT * FROM famous_users;

-- La vue des 15 tweets récents
CREATE VIEW recent_tweets AS (
    SELECT * FROM tweets
    ORDER BY created_at DESC
    LIMIT 15
);

-- Les utilisateurs qui ont crées les 15 tweets récents
SELECT DISTINCT username 
FROM recent_tweets 
JOIN users ON recent_tweets.user_id = users.id;

-- supprimer une vue
DROP VIEW recent_tweets;

-- Changer une vue
CREATE OR REPLACE VIEW recent_tweets AS (
    SELECT * FROM tweets
    ORDER BY created_at DESC
    LIMIT 10
);