SELECT
    *
FROM
    users;
    
-- Nombre, apellido e IP, donde la última conexión se dió de 221.XXX.XXX.XXX
SELECT
    first_name,
    last_name,
    last_connection
FROM
    users
WHERE
    last_connection LIKE '221.%.%.%';
    
-- Nombre, apellido y seguidores(followers) de todos a los que lo siguen más de 4600 personas
SELECT
    first_name,
    last_name,
    followers
FROM
    users
WHERE
    followers > 4600
ORDER BY
    followers DESC;
    
    
SELECT
    COUNT(*)
FROM
    users
WHERE
    followers > 4600;
    

SELECT
    first_name,
    last_name,
    followers
FROM
    users
WHERE
--     followers > 4600
--     AND followers < 4700
	followers BETWEEN 4600 and 4700
ORDER BY
    followers ASC;