-- MySQL Data Definition Schema
CREATE DATABASE IF NOT EXISTS twitter_db;

USE twitter_db;

CREATE TABLE IF NOT EXISTS users (
    id         INT PRIMARY KEY AUTO_INCREMENT,
    username   VARCHAR(30) NOT NULL,
    bio        VARCHAR(400) NOT NULL DEFAULT '',
    avatar     VARCHAR(200),
    phone      VARCHAR(25),
    email      VARCHAR(50),
    password   VARCHAR(40),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK(COALESCE(phone, email) IS NOT NULL)
);

CREATE TABLE IF NOT EXISTS tweets (
    id         INT PRIMARY KEY AUTO_INCREMENT,
    t_content  VARCHAR(240),
    photo_url  VARCHAR(200),
    user_id    INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_TweetUser FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS comments (
    id         INT PRIMARY KEY AUTO_INCREMENT,
    c_content    VARCHAR(240),
    user_id    INT NOT NULL,
    tweet_id    INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_UserComment FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT FK_TweetComment FOREIGN KEY (tweet_id) REFERENCES tweets (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS likes (
    id         INT PRIMARY KEY AUTO_INCREMENT,
    user_id    INT NOT NULL,
    tweet_id    INT,
    comment_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_UserLike FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT FK_TweetLike FOREIGN KEY (tweet_id) REFERENCES tweets (id) ON DELETE CASCADE,
    CONSTRAINT FK_CommentLike FOREIGN KEY (comment_id) REFERENCES comments (id) ON DELETE CASCADE,
    UNIQUE(user_id, tweet_id, comment_id)
);

CREATE TABLE IF NOT EXISTS tags (
    id         INT PRIMARY KEY AUTO_INCREMENT,
    user_id    INT NOT NULL,
    tweet_id    INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_UserTag FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT FK_TweetTag FOREIGN KEY (tweet_id) REFERENCES tweets (id) ON DELETE CASCADE,
    UNIQUE(user_id, tweet_id)
);

CREATE TABLE IF NOT EXISTS retweets (
    id         INT PRIMARY KEY AUTO_INCREMENT,
    user_id    INT NOT NULL,
    tweet_id   INT,
    comment_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_UserRetweet FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT FK_TweetRetweet FOREIGN KEY (tweet_id) REFERENCES tweets (id) ON DELETE CASCADE,
    CONSTRAINT FK_CommentRetweet FOREIGN KEY (comment_id) REFERENCES comments (id) ON DELETE CASCADE,
    UNIQUE(user_id, tweet_id, comment_id)
);

CREATE TABLE IF NOT EXISTS hashtags (
    id         INT PRIMARY KEY AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    title      VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS hashtags_tweets(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    hashtag_id    INT NOT NULL,
    tweet_id      INT NOT NULL,
    CONSTRAINT FK_HashtagsTweet FOREIGN KEY (hashtag_id) REFERENCES hashtags (id) ON DELETE CASCADE,
    CONSTRAINT FK_Tweet_HashtagsTweet FOREIGN KEY (tweet_id) REFERENCES tweets (id) ON DELETE CASCADE,
    UNIQUE(hashtag_id, tweet_id)
);

CREATE TABLE IF NOT EXISTS followers (
    id            INT PRIMARY KEY AUTO_INCREMENT,
    leader_id     INT NOT NULL,
    follower_id   INT NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_Leader FOREIGN KEY (leader_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT FK_Follower FOREIGN KEY (follower_id) REFERENCES users (id) ON DELETE CASCADE,
    UNIQUE(leader_id, follower_id)
);