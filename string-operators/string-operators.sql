SELECT
    id,
    LOWER(name) as lower_name,
    UPPER(name) as upper_name,
    LENGTH(name) as name_length,
    POSITION('a' in name) as a_position,
    CONCAT(id, '-', name) as id_name,
    '*'||id||'-'||name||'*' as pipe,
    name
FROM
    users;
    

SELECT
    name,
    SUBSTRING(name, 0, POSITION(' ' in name)) as first_name,
    TRIM(SUBSTRING(name, POSITION(' ' in name), LENGTH(name))) as last_name,
    SUBSTRING(name, POSITION(' ' in name) + 1, LENGTH(name)) as last_name,
    SUBSTRING(name, POSITION(' ' in name) + 1) as last_name
FROM
    users;
    

SELECT * FROM users;

UPDATE
    users
SET
    first_name = (SUBSTRING(name, 0, POSITION(' ' in name))),
    last_name = (SUBSTRING(name, POSITION(' ' in name) + 1))