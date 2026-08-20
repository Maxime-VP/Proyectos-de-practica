#Having vs where

#La diferencia entre having y where es cuándo se aplica el condicional por el que estamos filtrando
#El where se aplica antes de agrupar, el having se aplica hasta después

select *
from parks_and_recreation.employee_demographics;

select gender, avg(age)
from parks_and_recreation.employee_demographics
#where avg(age) > 40, Esta línea está mal porque el average (las funciones de agregación) no puede emplearse hasta después de agrupar
group by gender;

#En el siguiente ejemplo sí se puede utilizar con having
select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender
having avg(age) > 40;


select occupation, avg(salary)
from parks_and_recreation.employee_salary
where occupation like "%manager%"
group by occupation
having avg(salary) > 50000;


