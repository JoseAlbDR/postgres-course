select
    now(),
    CURRENT_DATE,
    CURRENT_TIME,
    date_part('hours', now()) as hours,
    date_part('minutes', now())as minutes,
    date_part('seconds', now())as seconds,
    date_part('days', now())as days,
    date_part('months', now())as months,
    date_part('years', now())as years;
    
select * from employees
where hire_date > '1998-02-05'
order by hire_date desc;

select
    max(hire_date) as newer,
    min(hire_date) as older
from
    employees;
    
select * from employees
where hire_date BETWEEN '1999-01-01' and now()
order by hire_date desc;

select
    max(hire_date),
--    max(hire_date) + interval '1 day' as day,
--    max(hire_date) + interval '1 month' as moth,
--    max(hire_date) + interval '1 year' as year,
--    max(hire_date) + interval '1 century' as century,
--    max(hire_date) + interval '1.1 years' + interval '1 day' as one_year_one_month_one_day,
    date_part('year', now()),
    MAKE_INTERVAL( YEARS := date_part('year', now())::integer ),
    max(hire_date) + MAKE_INTERVAL( YEARS:= 23)
from
    employees;
    
-- Fecha de contratacion y diferencia hasta eeste año (antiguedad)
select
    hire_date,
    MAKE_INTERVAL( YEARS := date_part('years', now())::integer - EXTRACT( YEARS from hire_date)::integer)
from
    employees
order by hire_date desc;


-- Sumar 24 años a todos los hire_date
update
    employees
set
    hire_date = hire_date + MAKE_INTERVAL(YEARS := 24);

select
    first_name,
    last_name,
    hire_date,
    CASE
        when hire_date > now() - INTERVAL '1 year' then 'Newbie'
        when hire_date > now() - INTERVAL '5 years' then 'Rookie'
        else 'Veteran'
    END as rango_antiguedad
from
    employees
order by hire_date desc;
