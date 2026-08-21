-- Subqueries

# Puedes utilizar select adentro de otro select para hacer una subconsulta, a veces se apoya con IN

select *
from parks_and_recreation.employee_demographics;

select *
from parks_and_recreation.employee_salary;

select *
from parks_and_recreation.employee_demographics
where employee_id IN (
					select employee_id
					from parks_and_recreation.employee_salary
					where dept_id = 1
);

#Empleados que ganan más que el promedio
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary > (
    SELECT AVG(salary)
    FROM parks_and_recreation.employee_salary
);

select gender, avg(age), max(age), min(age), count(age)
from parks_and_recreation.employee_demographics as dem
group by gender;

SELECT avg(max_age)
FROM 
		(select gender, avg(age), max(age) as max_age, min(age), count(age)
		from parks_and_recreation.employee_demographics as dem
		group by gender) as AGG_TABLE
; 
