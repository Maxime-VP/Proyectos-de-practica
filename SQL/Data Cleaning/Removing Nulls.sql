# Removing Nulls and populating data

select * from world_layoffs.layoffs_staging_no_duplicates
limit 5;

select * from world_layoffs.layoffs_staging_no_duplicates
where total_laid_off is null
and percentage_laid_off is null;

select *
from world_layoffs.layoffs_staging_no_duplicates
where industry is null
or industry = "";

#Populate, airbnb tiene un registro sin industria y otro con la industria Travel, por ello podemos popular el valor vacio con la industria que sí existe
select *
from world_layoffs.layoffs_staging_no_duplicates
where company = "Airbnb";

# Comienza con un select que si funciona usaré para 
select *
from world_layoffs.layoffs_staging_no_duplicates d1
join world_layoffs.layoffs_staging_no_duplicates d2
	on d1.company = d2.company
    and d1.location = d2.location
where (d1.industry is null or d1.industry = "")
and (d2.industry is not null and d2.industry != "");

# Esto hace el cambio, cuidado con los "" y los null
update world_layoffs.layoffs_staging_no_duplicates d1
join world_layoffs.layoffs_staging_no_duplicates d2
	on d1.company = d2.company
    and d1.location = d2.location
set d1.industry = d2.industry
where (d1.industry is null or d1.industry = "")
and (d2.industry is not null and d2.industry != "");

#Otra estrategia es cambiar los "" a null
update world_layoffs.layoffs_staging_no_duplicates 
set industry = null
where industry = "";
# Esto cambiaría los valores vacios a nulos y facilitaría la otra query

-- Asi quedaría si cambiamos a null los valores ""
update world_layoffs.layoffs_staging_no_duplicates d1
join world_layoffs.layoffs_staging_no_duplicates d2
	on d1.company = d2.company
    and d1.location = d2.location
set d1.industry = d2.industry
where d1.industry is null
and d2.industry is not null;

select * from world_layoffs.layoffs_staging_no_duplicates
where industry is null or industry = "";

# La siguiente industria no tiene forma de rellenar la industria con base en otra fila
select * from world_layoffs.layoffs_staging_no_duplicates
where company like "Bally%";

select * from world_layoffs.layoffs_staging_no_duplicates;

# Para el resto de campos se pueden popular pero tendría que ser con base en investigación de información de internet
# En ocasiones es posible popular con cálculos de las columnas que tenemos, aunque no es posible en este caso


# Para eliminar columnas que no son necesarias 
alter table world_layoffs.layoffs_staging_no_duplicates
drop column row_num;

select * from world_layoffs.layoffs_staging_no_duplicates;

