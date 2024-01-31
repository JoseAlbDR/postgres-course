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


-- Quiero saber los idiomas oficiales que se hablan por continente

select * from continent;

select * from country;

select * from countrylanguage where isofficial = true;

select
	DISTINCT
	c.name as continent,
	 d.name as language,
    count(a.*) as total
from
    country a
    inner join countrylanguage b on a.code = b.countrycode
    inner join continent c on a.continent = c.code
    inner join language d on d.code = b.languagecode
where
    b.isofficial = true
group by
    b.language,
    d.name,
    c.name
order by
    c.name asc;

select
	DISTINCT
	count(b.languagecode) as total,
	 c.name as continent
from
    country a
    inner join countrylanguage b on a.code = b.countrycode
    inner join continent c on a.continent = c.code
where
    b.isofficial = true
group by
    c.name;
  


