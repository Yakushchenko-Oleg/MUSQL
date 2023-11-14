USE hr;

select
COUNT(first_name)
FROM employees
WHERE department_id = 60 
and salary > 
			(SELECT AVG(salary) 
            from employees); 