# Union

-- Una union nos permite combinar las filas de varias tablas
#Union une las dos tablas reduciendo duplicados a una sola fila, Union all deja los valores duplicados intactos

# Ron Swanson solo aparece en el employee_salary
select first_name, last_name
from parks_and_recreation.employee_demographics
union
select first_name, last_name
from parks_and_recreation.employee_salary;

#Union all no 
select first_name, last_name
from parks_and_recreation.employee_demographics
union all
select first_name, last_name
from parks_and_recreation.employee_salary
Order by first_name;



select concat(first_name, " ", last_name) as "Old", age
from parks_and_recreation.employee_demographics
where age > 50;

select concat(first_name, " ", last_name) as "Expensive", salary
from parks_and_recreation.employee_salary
where salary > 70000;

#Union
select concat(first_name, " ", last_name) as Full_name, "Old" as Label
from parks_and_recreation.employee_demographics
where age > 50
union
select concat(first_name, " ", last_name) as Full_name, "Expensive" as Label
from parks_and_recreation.employee_salary
where salary > 70000;

# Si se cumplen varios criterios, entonces se duplicarán los registros, cada uno con su etiqueta correspondiente
select concat(first_name, " ", last_name) as Full_name, "Old Man" as Label
from parks_and_recreation.employee_demographics
where age > 40 and gender = "Male"
union
select concat(first_name, " ", last_name) as Full_name, "Old Lady" as Label
from parks_and_recreation.employee_demographics
where age > 40 and gender = "Female"
union
select concat(first_name, " ", last_name) as Full_name, "Expensive" as Label
from parks_and_recreation.employee_salary
where salary > 70000
order by Full_name;

