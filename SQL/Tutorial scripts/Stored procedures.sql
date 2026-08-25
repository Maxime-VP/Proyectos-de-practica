# Stored procedures

# Permiten guardar código reutilizable de sql.
# Correra todo el código del procedimiento guardado

#create procedure
# call "procedure()"

-- Esta nota también incluye
# DELIMITER
# Parametro


create procedure large_salaries()
select * 
from parks_and_recreation.employee_salary
where salary >= 50000;

# en cualquier tab
call large_salaries();


# El procedure termina con el ;
# Para juntar varias consultas en nuestro procedimiento se sa un delimitador
# Se suele usar $$ como delimitador
# El delimitador default es ; Para cambiarlo usamos DELIMITER seguido del nuevo símbolo
# Al terminar lo mejor es cambiar el delimitador de regreso

-- El siguiente codigo crea un salaries 2 y luego hace una consulta fuera del procedimiento creado
create procedure large_salaries2()
select *
from parks_and_recreation.employee_salary
where salary >= 50000;
select *
from parks_and_recreation.employee_salary
where salary >= 10000;

#El siguiente codigo guarda ambas consultas en el procedimiento

# DELIMITER $$
# create procedure
# begin
# 	query/s
# end $$
# DELIMITER ; 

DELIMITER $$
create procedure large_salaries3()
begin
	select *
	from parks_and_recreation.employee_salary
	where salary >= 50000;
	select *
	from parks_and_recreation.employee_salary
	where salary >= 10000;
end $$
DELIMITER ;

call large_salaries3()





-- Parametros
# Podemos darle un parámetro a un stored procedure, por ejemplo para consultar un valor en particular
-- Debemos darle un nombre y tipo, esto fuerza el tipo en la entrada
# create procedure large_salaries4(entered_employee_id int)

-- Formas comunes de nombrar variables de entrada
# p_columna
# columna_param

DELIMITER $$
create procedure large_salaries4(entered_employee_id int)
begin
	select first_name, salary
	from parks_and_recreation.employee_salary
    where employee_id = entered_employee_id
    ;
end $$
DELIMITER ;

call large_salaries4(1);
call large_salaries4(2);

