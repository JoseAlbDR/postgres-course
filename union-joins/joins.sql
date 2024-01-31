select
    a.name as country,
    b.name as continent
from
    country a
    inner join continent b on a.continent = b.code
order by
    b.name;

ALTER SEQUENCE continent_code_seq RESTART with 8;

-- FULL OUTER JOIN Obtener registros nulos, por ejemplo, provincias donde no hay ninguna persona registrada
select
    a.name,
    a.continent as continentCode,
    b.name as continentName
from
    country a FULL
    outer join continent b on a.continent = b.code
order by
    a.name desc;

-- Continentes que no tienen registros en la tabla country, 
-- se puede usar para ver provincias que no tienen registros en la tabla users
select
    a.name,
    a.continent as continentCode,
    b.name as continentName
from
    country a
    right join continent b on a.continent = b.code
    where a.name is null or a.continent is null
order by
    a.name desc;

-- Listado de todos los continentes con cantidad de paises por continente
select
    count(a.code),
    b.name
from
    country a
    right join continent b on a.continent = b.code
group by
    b.name
order by count(*) asc;