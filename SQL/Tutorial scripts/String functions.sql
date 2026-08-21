-- String Functions

# SQL tiene varias funciones que sirven con strings:

-- length()
# Puede ser util por ejemplo para verificar que los números de teléfono de una base de datos sean ingresados correctamente.

select "cinco" as palabra, length("cinco") as longitud;

select first_name, length(first_name) as length
from parks_and_recreation.employee_demographics
order by length;

-- upper()
# Capitaliza palabras
select upper("a");

-- lower()
# Pone todo en minúsculas
select lower("A");

-- trim(), ltrim(), rtrim()
# Quita los espacios antes y después del texto. Tambien existe el Ltrim y Rtrim que quitan espacios antes o despues del texto
select trim("          Palabra          ") as trim, ltrim("          Palabra          ") as lefttrim, rtrim("          Palabra          ") as righttrim;

-- left,(,) right(,)
# Sirve para especificar el número de caracteres que queremos de la izq a la derecha o de la derecha a la izq
select left("Palabra", 4) as leftPal, right("Palabra", 4) as rightPal;

-- substring(,,)
# Es similar a left y right pero le puedes especificar de donde a donde seleccionar
select substring("Palabra",4,2); #Empieza en la 4ta posicion "a" y toma 2 caracteres

-- replace (,,)
#remplaza los valores seleccionados, se especifica qué cambiar por qué (origen, valor a cambiar, nuevo valor)
select first_name, Replace(first_name, "Leslie", "ZZZ")
from parks_and_recreation.employee_demographics as dem;

-- locate()
#Sirve para encontrar secuencias, muestra en qué núm de caracter se encuentra la secuencia especificada
select first_name, locate("a", first_name)
from parks_and_recreation.employee_demographics;

select first_name, locate("chris", first_name) as columna# Solo cuando encuentre chris
from parks_and_recreation.employee_demographics;

-- concat()
#Sirve para juntar más de una cadena o columna, puedes usar varios elementos 
select concat(first_name," ", last_name) as nombre_completo
from parks_and_recreation.employee_demographics;






