

-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;

Select * from "language";


select
    DISTINCT
    b.language,
    b.languagecode,
    count(a.name) as total
from
    country a
    inner join countrylanguage b on a.code = b.countrycode
    inner join continent c on a.continent = c.code
where
    b.isofficial = true and c.name like ('%Europe%')
group by b.language, b.languagecode
order by total desc
limit 1;

-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa
-- (no hacer subquery, tomar el código anterior)
select
    *
from
    country a
    inner join countrylanguage b on a.code = b.countrycode
where
   	a.continent = 8 and b.isofficial = true and b.languagecode = 135;




