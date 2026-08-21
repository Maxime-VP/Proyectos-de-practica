# Case functions

#practicamente un if, cuando se cumple una condicion ese valor se asigna. Es decir importa el orden de los condicionales

-- Estructura:
#case
#	when  then 
#end

#case
#	when "condition" then "valor"
#end as "alias"

select first_name,
last_name,
case
	when age <= 30 then "Young" 
end as Vitality
from parks_and_recreation.employee_demographics as dem;

select first_name,
last_name,
case
	when age <= 30 then "Young"
    when age > 60 then "Old"
    when age > 30 then "Normal"
end as Vitality
from parks_and_recreation.employee_demographics as dem;