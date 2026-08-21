# Case Exercise

#Pay increase and bonus
-- si es igual a 50000 no aumenta nada
-- si es menor a 50000 aumenta un 7%
-- si es mayor a 50000 aumenta un 5%
-- si es de finanzas obtiene un 10% como bono


select *
from parks_and_recreation.parks_departments;

select first_name, last_name, salary, 
case
	when salary > 50000 then 1.05*salary
    when salary < 50000 then 1.07*salary
end as newSalary,
case
	when dept_id = 6 then .1*salary
end as bonus
from parks_and_recreation.employee_salary as sal; 

