-- Créer un index sur la colonne username
CREATE INDEX photo_idx ON tweets (photo_url);

-- supprimer un index
DROP INDEX photo_idx ON tweets;

SELECT photo_url FROM tweets;

-- with index: 0.049ms
-- without index: 0.049 * 2 || 0.049 * 3
EXPLAIN ANALYZE SELECT *
FROM tweets
WHERE photo_url = 'http://www.borer.net/';