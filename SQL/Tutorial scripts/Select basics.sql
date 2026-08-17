#SELECT

# Se usa el hashtag para hacer comentarios

# Se usa select para decir la columna o columnas que se quieren extraer
# from nos dice de dónde (que tabla) sacamos dichas columnas

# El * signigica todas las columnas
select * 
from parks_and_recreation.employee_demographics;

#Para seleccionar más de una columna se emplea ",". Asimismo, podemos utilizar operaciones en las columnas directamente
# "as" nos permite darle un alias a alguna columna. En el ejemplo de abajo "age + 10" se vuelve solo "+10"
select first_name, age, age + 10 as "+10"
#Usamos database.table para especificar la tabla. En este caso la database es parks_and_recreation y la tabla es employee_demographics
from parks_and_recreation.employee_demographics;

# Se usa distinct para consultar solo los valores unicos de la tabla, en caso de gender 
select distinct gender
from parks_and_recreation.employee_demographics;

# Cuando se usa distinct con más de una columa se buscan combinaciones únicas de todas las tablas seleccionadas.
select distinct first_name, gender
from parks_and_recreation.employee_demographics;