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