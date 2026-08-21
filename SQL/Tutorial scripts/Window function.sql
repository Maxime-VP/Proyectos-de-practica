#Window functions

-- Nos permiten utilizar funciones de agregacion sin el group by y también hacer algo parecido a un groupby, pero manteniendo los valores originales.
# over()
# over(partition by "column")
# antes del over hay una función de agregación

-- Algunas ayudas son
# row_number() 				numero de fila (no hay repetidos)
# rank()					cuando dos o mas valores se repiten comparten el rango, el siguiente valor (si hay 2 segundo lugar, el siguiente será el 4to)
# dense_rank()				igual que rank pero cuando hay dos segundos lugares el siguiente será el tercero, aqui no se saltan rangos

#Normal groupby:
select gender, avg(salary) as Average_Salary
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender;

#Window function con partition: La partition es como si especificaramos un group by
select gender, salary, avg(salary) over(partition by gender) as gender_average_salary
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
#Window function sin partition
select gender, salary, avg(salary) over() as global_average_salary
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
#Rolling total
select dem.first_name, dem.last_name, gender, salary,
sum(salary) over(order by dem.employee_id) as Rolling_total
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
#Artificial id (oldest first)
-- Nota, si se hace un partition en este caso se podrían repetir los números
SELECT *,
       ROW_NUMBER() OVER (order by birth_date) AS new_id
FROM parks_and_recreation.employee_demographics;

select dem.first_name, dem.last_name, gender, salary,
       rank() over (partition by gender order by salary desc) as highest_paid_by_gender,
       rank() over (order by salary desc) as highest_paid_global
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
on dem.employee_id = sal.employee_id
order by gender, salary desc;


select dem.first_name, dem.last_name, gender, salary,
       dense_rank() OVER (partition by gender order by salary desc) as highest_paid_by_gender,
       dense_rank() OVER (order by salary desc) as highest_paid_global
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
on dem.employee_id = sal.employee_id
order by gender, salary desc;

select *,
       rank() OVER (order by birth_date) as new_id
from parks_and_recreation.employee_demographics;


