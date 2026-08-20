# usar -- tambien sirve para comentar

#Limit & Aliasing

# Limit nos permite decirle a la consulta cuántos elementos queremos
-- En este ejemplo se seleccionan los 3 empleados más viejos
select *
from parks_and_recreation.employee_demographics
order by age desc
limit 3
;

# También podemos decirle cuantos no queremos agregando un parámetro al limit
-- en este se selecciona unicamente al 3er empleado más viejo
select *
from parks_and_recreation.employee_demographics
order by age desc
limit 2, 1
;

-- en este se selecciona unicamente al 2do y 3er empleado más viejo
select *
from parks_and_recreation.employee_demographics
order by age desc
limit 1, 2
;

# Aliasing es utilizar un alias o un nombre distinto para una columna utilizando "AS"
select gender, avg(age) as "Average Age"
from parks_and_recreation.employee_demographics
group by gender;

-- Se pueden utilizar los alias de diferentes formas, el AS incluso puede estar implícito o se puede no utilizar "" cuando el texto va junto
select gender, avg(age) as Average_Age
from parks_and_recreation.employee_demographics
group by gender;

select gender, avg(age) "Average Age"
from parks_and_recreation.employee_demographics
group by gender;

select gender, avg(age) Average_Age
from parks_and_recreation.employee_demographics
group by gender;
