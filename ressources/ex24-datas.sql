/*
    Dans votre base de données twitter_db,
    créez une vue permettant de récupérer les 10 tweets les plus likés
*/

CREATE VIEW most_liked_tweets AS (
	SELECT t_content AS 'tweet content'
	FROM tweets
	JOIN (
		SELECT tweet_id, COUNT(*) AS likes
		FROM likes 
		GROUP BY tweet_id 
		ORDER BY likes DESC
		LIMIT 10
	) AS top_10_tweets ON top_10_tweets.tweet_id = tweets.id
);

SELECT * FROM most_liked_tweets;