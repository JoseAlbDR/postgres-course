SELECT
    COUNT(*),
    country
FROM
    users
GROUP BY
    country
HAVING
    COUNT(*) > 5
ORDER BY
	COUNT(*) DESC;
    
    

