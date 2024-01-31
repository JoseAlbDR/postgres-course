-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa


select
    count(a.continent) as Total,
    b.name as Continent
from
    country a
    inner join continent b on a.continent = b.code
where
    b.name not like ('%America')
group by
    b.name
union
select
    count(a.continent) as Total,
    'America' as Continent
from
    country a
    inner join continent b on a.continent = b.code
where
    b.name like ('%America')
order by Total asc;
-- Quiero que me muestren el pais con mas ciudades
-- Campos: total de ciudades y el nombre del pais
-- usar INNER JOIN



select
    count(*) as total,
    b.name as country
from
    city a
    inner join country b on a.countrycode = b.code
group by
    b.name
order by
    count(*) desc
limit
    1;


