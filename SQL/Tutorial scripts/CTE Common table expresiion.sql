# CTE: Common table expression

# Son similares a las subconsultas, es una consulta con nombre que puedes consultar después
# Permite cálculos un poco más complejos y son un poco más legibles que una subconsulta
# Solo pueden utilizarse inmediatamente después de ser consultadas.

# with "alias" as (
#    query
#)

-- para renombrar parámetros
# with "alias" ("alias_param1", "alias_param2", "alias_param_n") as (
#    query
#)

with CTE_example as (
select gender, avg(salary), max(salary) as gender_max_salary, min(salary) as gender_min_salary, count(salary) as total_employees_of_gender
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
on dem.employee_id = sal.employee_id
group by gender
)
select *
from parks_and_recreation.employee_demographics as dem
join CTE_example
on dem.gender = CTE_example.gender
;

#Con doble join

with CTE_example as (
select gender, avg(salary), max(salary), min(salary), count(salary)
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
on dem.employee_id = sal.employee_id
group by gender
)
select dem.*, sal.salary, CTE_example.*
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
on dem.employee_id = sal.employee_id
join CTE_example
on dem.gender = CTE_example.gender
;

# Multiples CTE
-- Este ejemplo es simple, solo es para ilustrar que pueden combinarse consultas más complejas
with cte_example as
(
select employee_id, gender, birth_date
from parks_and_recreation.employee_demographics
where birth_date > "1985-01-01"
),
cte_example2 as
(
select employee_id, salary
from parks_and_recreation.employee_salary
where salary > 50000
)
select *
from cte_example
join cte_example2
on cte_example.employee_id = cte_example2.employee_id;

#Otra forma de usar aliases en cte:
-- base
with CTE_example as (
select gender as genero, avg(salary) as salario_promedio, max(salary) as salario_maximo, min(salary) as salario_minimo, count(salary) as total_de_empleados
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
on dem.employee_id = sal.employee_id
group by genero
)
select *
from parks_and_recreation.employee_demographics as dem
join CTE_example
on dem.gender = CTE_example.genero
;

-- equivalente
with CTE_example (genero, salario_promedio, salario_maximo, salario_minimo, total_de_empleados) as (
select gender, avg(salary), max(salary), min(salary), count(salary)
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
on dem.employee_id = sal.employee_id
group by gender
)
select *
from parks_and_recreation.employee_demographics as dem
join CTE_example
on dem.gender = CTE_example.genero
;