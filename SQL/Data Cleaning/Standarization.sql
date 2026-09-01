# Standardizing data
# Nota, estoy usando una tabla sin diplicados creada en el script de Identify Duplicates
# En un caso real, es más útil estandarizar antes de eliminar duplicados ya que algunas veces no se identifican las diferencias debido a la falta de standarización


select *
from world_layoffs.layoffs_staging_no_duplicates;

select distinct company, (Trim(company))
from world_layoffs.layoffs_staging_no_duplicates
order by company;

update world_layoffs.layoffs_staging_no_duplicates
set company = trim(company);

#Este es util para ver si hay nombres distintos que significan lo mismo
select distinct industry
from world_layoffs.layoffs_staging_no_duplicates
order by 1;

select distinct industry
from world_layoffs.layoffs_staging_no_duplicates
where industry like "crypto%";

update world_layoffs.layoffs_staging_no_duplicates
set industry = "Crypto"
where industry like "Crypto%";

select distinct industry
from world_layoffs.layoffs_staging_no_duplicates
where industry like "crypto%";

select distinct industry
from world_layoffs.layoffs_staging_no_duplicates;


# Lo mismo pero para location
select distinct country
from world_layoffs.layoffs_staging_no_duplicates
order by 1;
# Problema con "USA" y "USA."

select distinct country
from world_layoffs.layoffs_staging_no_duplicates
where country like "United States%";

	-- Forma de corregir puntos:
	select distinct country, trim(trailing "." from country)
	from world_layoffs.layoffs_staging_no_duplicates
	where country like "United States%";

update world_layoffs.layoffs_staging_no_duplicates
set country = trim(trailing "." from country)
where country like "United States%";
# Creo que no hace falta el where en este caso

# Comprobar cambios
	select distinct country
	from world_layoffs.layoffs_staging_no_duplicates
	where country like "United States%";
    
# Cambiar el formato de fecha, Cuidado las mayusculas y minusculas importan en "%m/%d/%Y"
	select `date`, str_to_date(`date`, "%m/%d/%Y")
	from world_layoffs.layoffs_staging_no_duplicates;

update world_layoffs.layoffs_staging_no_duplicates
set `date` = str_to_date(`date`, "%m/%d/%Y");

	select `date`
	from world_layoffs.layoffs_staging_no_duplicates
	order by `date`;

alter table world_layoffs.layoffs_staging_no_duplicates
modify column `date` DATE;
	select `date`
	from world_layoffs.layoffs_staging_no_duplicates
	order by `date`;
