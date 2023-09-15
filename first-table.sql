create schema course;

create table course.users(
	name varchar(10) unique
);

insert
	into
	course.users (name)
values ('yusep');

insert
	into
	course.users (name)
values ('pepe');

insert
	into
	course.users
values ('natalia');

insert
	into
	course.users
values ('Pedro');

update
	course.users
set
	name = 'alberto'
where
	name = 'yusep';

select
	*
from
	course.users u
limit 2
offset 2;

select * from course.users u;

-- Comodin
select * from course.users u where name like '_edro';

-- Como *
select * from course.users u where name like '%a%';

-- Borra todo
delete from course.users ;

-- Borra tabla
drop table course.users;

-- Bprra todos los registros
truncate table course.users;
