-- 1. Cuantos Post hay - 1050

select count(*) from posts;

-- 2. Cuantos Post publicados hay - 543

select count(*) from posts where published = true;

-- 3. Cual es el Post mas reciente
-- 544 - nisi commodo officia...2024-05-30 00:29:21.277

select * from posts order by created_at desc limit 1;

-- 4. Quiero los 10 usuarios con más post, cantidad de posts, id y nombre
/*
4	1553	Jessie Sexton
3	1400	Prince Fuentes
3	1830	Hull George
3	470	Traci Wood
3	441	Livingston Davis
3	1942	Inez Dennis
3	1665	Maggie Davidson
3	524	Lidia Sparks
3	436	Mccoy Boone
3	2034	Bonita Rowe
*/

select
    count(b.post_id),
    a.user_id,
    a.name
from
    users a
    inner join posts b on a.user_id = b.created_by
group by
    a.name,
    a.user_id
order by
    count(b.post_id) desc
limit
    10;
    
-- 5.Quiero los 5 post con m á s "Claps" sumando la columna "counter"
/*
692	sit excepteur ex ipsum magna fugiat laborum exercitation fugiat
646	do deserunt ea
542	do
504	ea est sunt magna consectetur tempor cupidatat
502	amet exercitation tempor laborum fugiat aliquip dolore
*/
select
    SUM(b.counter),
    title
from
    posts a
    inner join claps b on a.post_id = b.post_id 
group by title
order by
    SUM(b.counter) desc
limit
    5;
    
select
    SUM(counter),
    post_id
from
    claps
group by
    post_id
order by
    SUM(counter) desc
limit
    5;
    
-- 6.Top 5 de personas que han dado m á s claps (voto ú nico no acumulado) * count
/*
7	Lillian Hodge
6	Dominguez Carson
6	Marva Joyner
6	Lela Cardenas
6	Rose Owen
*/
select
    count(b.clap_id),
    a.name
from
    users a
    inner join claps b on a.user_id = b.user_id
group by
    a.name
order by
    count(b.clap_id) desc
limit
    5;

-- 7. Top 5 personas con votos acumulados (sumar counter)
/*
437	Rose Owen
394	Marva Joyner
386	Marquez Kennedy
379	Jenna Roth
364	Lillian Hodge
*/

select
    SUM(counter),
    a.name
from
    users a
    inner join claps b on a.user_id = b.user_id
group by
    a.name
order by
    SUM(counter) desc
limit
    5;
    
-- 8.Cuantos usuarios NO tienen listas de favoritos creada -- 329
select
    count(*)
from
    users a
    left join user_lists b on a.user_id = b.user_id
where
    b.user_id is null;


-- 9. Quiero el comentario con id #1
-- Y en el mismo resultado, quiero sus respuestas (visibles e invisibles)
-- Tip: union
/*
1	    648	1905	elit id...
3058	583	1797	tempor mollit...
4649	51	1842	laborum mollit...
4768	835	1447	nostrud nulla...
*/

select
    comment_id,
    post_id,
    user_id,
    content
from
    comments
where
    comment_id = 1
union
select
    b.comment_id,
    b.post_id,
    b.user_id,
    b.content
from
    comments a
    inner join comments b on a.comment_id = b.comment_parent_id
where
    a.comment_id = 1
order by comment_id;
-- * * 10.Avanzado
-- Investigar sobre el json_agg y json_build_object
-- Crear una ú nica linea de respuesta,con las respuestas
-- del comentario con id 1 (comment_parent_id = 1)
-- Mostrar el user_id y el contenido del comentario
-- Salida esperada:
/*
"[{""user"" : 1797, ""comment"" : ""tempor mollit aliqua dolore cupidatat dolor tempor""}, {""user"" : 1842, ""comment"" : ""laborum mollit amet aliqua enim eiusmod ut""}, {""user"" : 1447, ""comment"" : ""nostrud nulla duis enim duis reprehenderit laboris voluptate cupidatat""}]"
*/


select json_agg( JSON_BUILD_OBJECT('user', user_id, 'comment', content))
from
    comments
where
    comment_parent_id = 1;
    
    
-- * * 11.Avanzado -- Listar todos los comentarios principales (no respuestas) -- Y crear una columna adicional "replies" con las respuestas en formato JSON
select
    a.*,
    (
        select
            json_agg(sec.val) as replies
        from
            (
                select
                    JSON_BUILD_OBJECT('comment', b.content)
                from
                    comments
                where
                    b.comment_parent_id is not null
            ) as sec(val)
    )
from
    comments a
    inner join comments b on b.comment_parent_id = a.comment_id
where
    a.comment_parent_id is null
order by
    a.comment_id asc;
    
    
    
    