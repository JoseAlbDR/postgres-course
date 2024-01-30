SELECT * FROM country;

create UNIQUE index "unique_country_name" on country(name);

SELECT * from country where continent = 'Africa';

create index "country_continent" on country(continent);

select * from city where name='Jinzhou' and countrycode = 'CHN' and district = 'Liaoning';

create unique index "unique_name_countrycode_district" on city(name, countrycode, district);

create index "index_district" on city(district);

