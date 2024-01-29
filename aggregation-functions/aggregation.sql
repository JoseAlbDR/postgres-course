SELECT
    COUNT(*) as total_users,
    MIN(followers) as min_followers,
    MAX(followers) as max_followers,
    ROUND(AVG(followers), 2) as avg_followers,
    (SUM(followers) / COUNT(*)) as avg_followers
FROM
    users;
    
