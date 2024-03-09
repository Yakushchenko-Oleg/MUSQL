/*1. Напишите запрос, который выводит идентификатор сотрудника, его имя и фамилию, а также категорию зарплаты на основе следующих условий:
	Если зарплата меньше 5000, категория "Низкая".
	Если зарплата от 5000 до 10000, категория "Средняя".
	Если зарплата больше 10000, категория "Высокая".
*/
use hr;

select
	employee_id,
    first_name,
    last_name,
		case
			when salary < 5000 then "Низкая"
            when salary between 5000 and 9999 then "Средняя"
            when salary > 10000 then "Средняя"
		end as salary_category
from employees;

/* 2. Определение размера премии сотрудникам:
Напишите запрос, который выводит идентификатор сотрудника, его имя и фамилию, а также размер премии на основе следующих условий:
Если зарплата меньше 5000, премия составляет 10% от зарплаты.
Если зарплата от 5000 до 10000, премия составляет 15% от зарплаты.
Если зарплата больше 10000, премия составляет 20% от зарплаты.*/
select
	employee_id,
    first_name,
    last_name,
		case
			when salary < 5000 then salary*0.1
            when salary between 5000 and 9999 then salary*0.15
            when salary > 10000 then salary*0.3
		end as bonus
from employees;

/*3. Получить список стран с указанием их региона и обозначением страны "EU" для стран Европейского союза,
 "Non-EU" для остальных стран.*/
select
	country_name,
		case 
			when region_id = 1 then "EU"
            when not region_id = 1 then "Non-EU"
        end as region
from countries;
	
-- 4. Получить список стран с указанием количества символов в их названиях.
select
	country_name,
	length(country_name) as length_of_country_name
from countries;

-- 5. Получить список стран и их первые три символа в названии (сделал в верхнем регистре)
select
	country_name,
	upper(left(country_name, 3 )) as shot_country_name
from countries;

-- 6. Получить список сотрудников с заменой их email на "Confidential", если он содержит слово "sqltutorial"
select
    first_name,
    last_name,
		case
			when email like upper('%sqltutorial%') then 'Confidentia'
            else email
		end as salary_category
from employees;

-- 7. Получить список сотрудников и указать их email в нижнем регистре.
select
    first_name,
    last_name,
	lower(email)  as email
from employees;

-- 8. Получить список сотрудников(firstname, lastname) с указанием их должности(job_title).
select
    t1.first_name,
    t1.last_name,
	t2.job_title
from employees as t1
inner join jobs as t2
on t1.job_id = t2.job_id;

-- 9. Получить список отделов(department_name) и их названий с указанием местоположения(city).
select
	t1.department_name,
    t2.city
    from departments as t1
    inner join locations as t2;
    
-- 10. Получить список отделов(departmentname) и их менеджеров(firstname, last_name).
select
	t1.department_name,
    t2.first_name as managers_name,
    t2.last_name as managers_surname
    from departments as t1
    inner join employees as t2
    on t1.manager_id = t2.employee_id;
    
-- 11. Получить список сотрудников(firstname, lastname) с указанием их департамента(department_name), 
-- отсортированный по департаменту.
    select
    t2.first_name as managers_name,
    t2.last_name as managers_surname,
    t1.department_name
    from departments as t1
    inner join employees as t2
    on t1.manager_id = t2.employee_id
    order by t1.department_name;
    
-- 12. Получить список сотрудников(firstname, lastname)  и их менеджеров(firstname, lastname) 
	select
		t1.first_name,
        t1.last_name,
		t2.first_name as managers_name,
		t2.last_name as managers_surname
		from employees as t1
		left join employees as t2
		on t1.manager_id = t2.employee_id;
        
	-- 13. Получить список дапартаментов, где местоположение находится в США
	select
		t1.department_name
    from departments as t1
    inner join locations as t2
    on t1.location_id = t2.location_id
    inner join countries as t3
    on t2.country_id = t3.country_id 
    where  t3.country_name = 'United States of America';
