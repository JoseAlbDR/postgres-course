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
    
SELECT * FROM users;

SELECT
    DISTINCT(country)
FROM
    users;
    
SELECT
    COUNT(email),
    SUBSTRING(email, POSITION('@' in email) + 1) as domain
FROM
    users
GROUP BY
    SUBSTRING(email, POSITION('@' in email) + 1)
HAVING
    count(email) > 1
ORDER BY
    COUNT(email) DESC;
    
select
    email
from
    users
where
    email like '%google.com';

