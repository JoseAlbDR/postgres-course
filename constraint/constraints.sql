alter table
    country
add
    CONSTRAINT continent_country CHECK(
        continent in (
            'Asia',
            'South America',
            'North America',
            'Oceania',
            'Antarctica',
            'Africa',
            'Europe'
        )
    );


alter table
    country
drop
    CONSTRAINT continent_country; 



ALTER TABLE "Adopters" ADD CONSTRAINT "account_user_role" CHECK ("role" IN ('admin', 'shelter', 'adopter'));

ALTER TABLE "Shelters" ADD CONSTRAINT "account_user_role" CHECK ("role" IN ('admin', 'shelter', 'adopter'));

ALTER TABLE "Admins" ADD CONSTRAINT "account_user_role" CHECK ("role" IN ('admin', 'shelter', 'adopter'));
