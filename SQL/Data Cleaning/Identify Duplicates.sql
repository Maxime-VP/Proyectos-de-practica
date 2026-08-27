# Data Cleaning

select *
from world_layoffs.layoffs;

create table world_layoffs.layoffs_staging
like world_layoffs.layoffs;

select * from world_layoffs.layoffs_staging;

insert into world_layoffs.layoffs_staging
select * from world_layoffs.layoffs;

select * from world_layoffs.layoffs_staging;

# Seleccionar las columnas duplicadas
#drop temporary table row_numbered_duplicates;
create temporary table row_numbered_duplicates (
		select *,  
		row_number() over (
        partition by company,location, industry, total_laid_off, percentage_laid_off, `date`, 
        stage, country, funds_raised_millions) as rn
		from world_layoffs.layoffs_staging
	);

#drop temporary table duplicates;
create temporary table duplicates (
	select * from row_numbered_duplicates
	where rn > 1
);

select * 
from duplicates;

select * 
from row_numbered_duplicates
where company = "Yahoo";

SET SQL_SAFE_UPDATES = 0;

# Remover duplicados
delete from row_numbered_duplicates
where rn > 1;

# La siguiente tabla ya no tiene duplicados
select *
from row_numbered_duplicates;

-- Forma mas correcta de hacerlo
create table world_layoffs.layoffs_staging_no_duplicates (
	`company` text,
    `location` text,
    `industry` text,
    `total_laid_off` int default null,
    `percentage_laid_off` text,
    `date` text,
    `stage` text,
    `country` text,
    `funds_raised_millions` int default null,
    `row_num` int
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

select *
from world_layoffs.layoffs_staging_no_duplicates;

insert into world_layoffs.layoffs_staging_no_duplicates
		select *,  
		row_number() over (
        partition by company,location, industry, total_laid_off, percentage_laid_off, `date`, 
        stage, country, funds_raised_millions) as rn
		from world_layoffs.layoffs_staging;

delete
from world_layoffs.layoffs_staging_no_duplicates
where row_num > 1;

select *
from world_layoffs.layoffs_staging_no_duplicates;


