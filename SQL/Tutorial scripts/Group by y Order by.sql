# Group by y Order by

# Funciona para agrupar valores en "categorias"
# usa max(), min(), sum(), avg(), count()

#Grupo simple de genero
select gender
from employee_demographics
group by gender;


# El group by se usa con funciones para agregar como sum(), avg(), min(), max()
select gender, avg(age)
from employee_demographics
group by gender;

# Se pueden agrupar las tablas por varias columnas, en este ejemplo como Office Manager tiene dos sueldos distintos, aparecerá dos veces en la consulta, una por cada salary 
select occupation, salary
from employee_salary
group by occupation, salary;

select occupation, avg(salary) as "Average pay"
from employee_salary
group by occupation;

select occupation, sum(salary) as "Total spent on position"
from employee_salary
group by occupation;

select occupation, count(occupation) as "People on position"
from employee_salary
group by occupation;

#Todo junto
select occupation, avg(salary) as "Average pay", count(occupation) as "People on position", sum(salary) as "Total spent on position"
from employee_salary
group by occupation;

#------------------------------
#Order By

# order by ordena los resultados de forma ascendiente (default) o descendiente,
# usa asc (a-z, low-high) y desc (z-a. high-low)

select gender, age
from employee_demographics
order by gender;

# El orden del order by altera el resultado, aqui filtramos primero por género y luego por edad
select gender, age
from employee_demographics
order by gender, age;

# En el siguiente código el genero no importa a menos de que coincida la edad
select gender, age
from employee_demographics
order by age, gender;


#Podemos utilizar el número de columna para no escribirla, pero esto es una mala práctica ya que si el orden cambia se rompe la consulta.
select gender, age #gender es 1 y age 2
from employee_demographics
order by 1, 2;
