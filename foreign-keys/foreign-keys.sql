


SELECT DISTINCT continent from country;

CREATE TABLE continent (
	code SERIAL NOT NULL PRIMARY KEY,
	name text NOT NULL
);


INSERT INTO continent(name) SELECT DISTINCT continent FROM country;

SELECT * from continent;

SELECT * from country;



ALTER TABLE country ADD CONSTRAINT fk_continent FOREIGN KEY (continent) REFERENCES continent(name);

alter table
    country
drop
    CONSTRAINT continent_country; 
    
ALTER TABLE
	continent
ADD COLUMN code TEXT;

drop table country;
drop table countrylanguage;
drop table continent;
drop table city;

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.


select * from "country_backup";

insert into "country_backup" select * from country;

alter table country drop constraint country_continent_check;

select
    c.name,
    c.continent,
    (
        select
            code
        from
            continent b
        where
            b.name = c.continent
    )
from
    country c;


update country c
set continent =  (
        select
            code
        from
            continent b
        where
            b.name = c.continent
    );


select * from country;
select * from continent;

ALTER TABLE country
ALTER COLUMN continent TYPE int4
USING continent::integer;

alter table country add constraint fk_continent FOREIGN KEY (continent) REFERENCES continent(code);

select a.code, a.name, b.name as continent from country a inner join continent b on a.continent = b.code;

