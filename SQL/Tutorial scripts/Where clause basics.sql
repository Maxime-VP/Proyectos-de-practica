#WHERE clause

#Where sirve para especificar condiciones al select

select *
from employee_salary
# = pide que el valor dentro de la columna sea exáctamente igual a lo especificado
where first_name = "Leslie";

# podemos usar <=, =, >=, <, >, != ademas de =
select *
from employee_salary
where salary <= 50000;

select *
from employee_salary
where salary = 50000;

# Se puede utilizar en las fechas tambien, en este ejemplo usamos año, mes, día en formato yyyy-mm-dd
select *
from employee_demographics
where birth_date > "1985-01-01";

# Operadores logicos: como lo son AND OR y NOT nos permiten agregar condiciones

select *
from employee_demographics
where birth_date > "1985-01-01"
and gender = "male";

select *
from employee_demographics
where birth_date > "1985-01-01"
or not gender = "male";

# Se pueden usar parentesis para separar operadores logicos

select *
from employee_demographics
where (first_name = "Leslie" and age = 44) or age = 36;

#like statement: se utiliza para consultar columnas que contengan una secuencia
# se apoya de % y de _. "%" significa cualquier serie de caracteres (plural), "_" significa cualquier caracter individual

#Cualquier nombre que empiece con A
select *
from employee_demographics
where (first_name like "A%");

#Cualquier nombre que empiece con A-- donde - es cualquier caracter, esto fuerza a que sean exactamente 3 caracteres.
select *
from employee_demographics
where (first_name like "A__");

#Cualquier nombre que empiece con A y tenga al menos 4 letras (A---).
select *
from employee_demographics
where (first_name like "A___");

#Tambien puede usarse en fechas
select *
from employee_demographics
where (birth_date like "%03%");
