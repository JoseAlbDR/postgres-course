

-- 1. Ver todos los registros
SELECT * from users;

-- 2. Ver el registro cuyo id sea igual a 10
SELECT * from users where id = 10;

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)
SELECT * from users where name LIKE 'Jim %';

-- 4. Todos los registros cuyo segundo nombre es Alexander
SELECT * from users where name LIKE '%Alexander';

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
UPDATE users set name = 'Alberto Delgado' WHERE id = 1;

-- 6. Borrar el último registro de la tabla
DELETE FROM users where id = (SELECT COUNT(id) from users);