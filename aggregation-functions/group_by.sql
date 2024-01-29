SELECT
    COUNT(*) as total_users,
    MIN(followers) as min_followers,
    MAX(followers) as max_followers,
    ROUND(AVG(followers), 2) as avg_followers,
    (SUM(followers) / COUNT(*)) as avg_followers
FROM
    users;
    

SELECT * FROM users;

SELECT
    COUNT(*),
    followers
FROM
    users
WHERE
    followers = 4
    OR followers = 4999
GROUP BY
    followers;
    
    
SELECT
    COUNT(*),
    followers
FROM
    users
WHERE
    followers BETWEEN 4500 and 4999
GROUP BY
    followers
ORDER BY
	followers DESC;