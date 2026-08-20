#Joins

-- Los joins permiten juntar dos columnas siempre y cuando el contenido de ambas columnas coincidan
#Se pueden juntar dos columnas de distinto nombre siempre y cuando se tengan los mismos valores

#join por default es inner join sin embargo se puede especificar el tipo para que sea más legible
-- Los tipos de join: inner join, left join, right join, outer join, self join

# inner join solo deja los elementos cuando coinciden
-- left y right dejan todos los valores de una de las dos tablas y rellenan el de la otra tabla con las coincidencias o null cuando no las hay, 
# left deja la primera tabla entera y right la segunda
-- Outer join deja todos los elementos de ambas columnas y rellena las no coincidencias con valores nulos, se tiene que hacer con UNION de un left y right join
# Self join: une una tabla consigo misma, usa un alias distinto para poder maniobrar mejor con los datos

#Después de especificar el tipo de join se debe de especificar qué columnas comparar utilizando on
-- Se puede usar un alias para reducir la longitud de la consulta

select *
from parks_and_recreation.employee_demographics;

select *
from parks_and_recreation.employee_salary;

select *
from parks_and_recreation.employee_demographics
join parks_and_recreation.employee_salary
	on parks_and_recreation.employee_demographics.employee_id = parks_and_recreation.employee_salary.employee_id
;

#La siguiente consulta es igual que la anterior pero con el inner especificado y un alias para reducir la consulta
select *
from parks_and_recreation.employee_demographics as d
inner join parks_and_recreation.employee_salary as s
	on d.employee_id = s.employee_id
;

select *
from parks_and_recreation.employee_demographics as d
left join parks_and_recreation.employee_salary as s
	on d.employee_id = s.employee_id
;

select *
from parks_and_recreation.employee_demographics as d
right join parks_and_recreation.employee_salary as s
	on d.employee_id = s.employee_id
;

#Full outer join no existe en mysql, se puede lograr con la union (UNION) de un left join y un right join
SELECT *
FROM parks_and_recreation.employee_demographics AS d
LEFT JOIN parks_and_recreation.employee_salary AS s
    ON d.employee_id = s.employee_id
UNION
SELECT *
FROM parks_and_recreation.employee_demographics AS d
RIGHT JOIN parks_and_recreation.employee_salary AS s
    ON d.employee_id = s.employee_id;
    
    
#Se pueden consultar solo algunas de las columnas y el alias se puede usar desde select por el orden de ejecución
-- Las columnas deben de especificar de que tabla vienen
select dem.first_name, dem.age, sal.occupation
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
    
#Self join, es util para cuando quieres juntar valores de la misma tabla, como por ejemplo para un intercambio navideño
# Uso concat para combinar dos columnas
select concat(sal1.first_name, " ", sal1.last_name) as Gifter , concat(sal2.first_name , " ", sal2.last_name) as Gifted
from parks_and_recreation.employee_salary as sal1
join parks_and_recreation.employee_salary as sal2
	on sal1.employee_id +1 = sal2.employee_id
;

#Se pueden hacer multiples joins, no solamente entre dos tablas
select *
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
join parks_and_recreation.parks_departments as dep
	on sal.dept_id = dep.department_id
;