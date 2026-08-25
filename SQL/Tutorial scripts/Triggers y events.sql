# Triggers y events

# Trigger son acciones que se ejecutan cuando ocurre un evento, usualmente cuando se realizan cambios en alguna tabla
# Event son acciones que se ejecutan en un schedule (horario/calendario)

select *
from parks_and_recreation.employee_demographics;

select *
from parks_and_recreation.employee_salary;


DELIMITER $$
create trigger employee_insert
	after insert on employee_salary
    # for each row sirve para decir que por cada fila insertada
    for each row
begin
	insert into employee_demographics (employee_id, first_name, last_name)
    values (new.employee_id, new.first_name, new.last_name);
end $$
DELIMITER ;

insert into parks_and_recreation.employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
values(13, "Jean-Ralphio", "Superstein", "Entertainment 720 CEO", 1000000, null);

select *
from parks_and_recreation.employee_demographics;


-- Events

select *
from parks_and_recreation.employee_demographics;

select *
from parks_and_recreation.employee_demographics
where age >= 60;

DELIMITER $$
create event delete_retire_over_60
# every 1 month
# every 1 year
on schedule every 30 second
do
begin
	delete
    from parks_and_recreation.employee_demographics
    where age >= 60;
end $$
DELIMITER ;

SHOW VARIABLES LIKE "event%";

SHOW EVENTS;
drop event delete_retire_over_60;

