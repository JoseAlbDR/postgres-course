SELECT * FROM country;

create UNIQUE index "unique_country_name" on country(name);

SELECT * from country where continent = 'Africa';

create index "country_continent" on country(continent);