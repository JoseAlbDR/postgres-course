

select * from continent where name like '%America%'
union
select * from continent where code in (1, 4);

select a.name as country, b.name as continent from country a, continent b 
where a.continent = b.code
order by b.name, a.name;


