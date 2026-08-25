# Temporary tables

# Son similares a las CTE
# Sirven para almacenar temporalmente resultados de alguna consulta que se vaya a reutilizar
# Se eliminan al volver a acceder a SQL, solo duran lo que dure la sesión en la que fueron creados

#create temporary table
-- Puedes agregar valores con select o insert

create temporary table temp_table
(
first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(50)
);

select *
from temp_table;

-- Insertar valores:

insert into temp_table
values("Maxime", "Last Name", "1984");

select *
from temp_table;

# Eliminar la tabla
#drop table temp_table;


-- Forma alternativa

select *
from parks_and_recreation.employee_salary;

create temporary table salary_over_50k
select * from parks_and_recreation.employee_salary
where salary > 50000;

select *
from salary_over_50k;