# Exploratory Data Analysus

select *
from world_layoffs.layoffs_staging_no_duplicates;

select company, avg(percentage_laid_off)
from world_layoffs.layoffs_staging_no_duplicates
group by company;

select max(total_laid_off), max(percentage_laid_off)
from world_layoffs.layoffs_staging_no_duplicates;

select *
from world_layoffs.layoffs_staging_no_duplicates
where percentage_laid_off = 1
order by total_laid_off desc, funds_raised_millions desc;

select company, sum(total_laid_off)
from world_layoffs.layoffs_staging_no_duplicates
group by company
order by sum(total_laid_off) desc;

select min(`date`), max(`date`)
from world_layoffs.layoffs_staging_no_duplicates;

select industry, sum(total_laid_off)
from world_layoffs.layoffs_staging_no_duplicates
group by industry
order by sum(total_laid_off) desc;

select country, sum(total_laid_off)
from world_layoffs.layoffs_staging_no_duplicates
group by country
order by sum(total_laid_off) desc;

select year(`date`), sum(total_laid_off)
from world_layoffs.layoffs_staging_no_duplicates
group by year(`date`)
order by 1 desc;

select year(`date`), sum(total_laid_off)
from world_layoffs.layoffs_staging_no_duplicates
group by year(`date`)
order by 1 desc;

select stage, sum(total_laid_off)
from world_layoffs.layoffs_staging_no_duplicates
group by stage
order by 1 desc;

select month(`date`), year(`date`), sum(total_laid_off)
from world_layoffs.layoffs_staging_no_duplicates
group by month(`date`), year(`date`)
order by 2 desc, 1 desc;

with rollingTotal as (
select substring(`date`,1,7) as `Month`, sum(total_laid_off) as month_total
from world_layoffs.layoffs_staging_no_duplicates
where substring(`date`,1,7) is not null
group by `Month`
order by 1 asc
)
select `Month`, sum(month_total) over (order by `Month`) as rolling_total
from rollingTotal
order by `Month` desc;
 
with rollingTotalCountry as (
select country, substring(`date`,1,7) as `Month`, sum(total_laid_off) as month_total
from world_layoffs.layoffs_staging_no_duplicates
where substring(`date`,1,7) is not null
group by country, `Month`
order by country, 2 asc
)
select country, `Month`, sum(month_total) over (partition by country order by `Month`) as rolling_total
from rollingTotalCountry
group by country, `Month`
order by country, `Month` desc;

select company, year(`date`), sum(total_laid_off)
from world_layoffs.layoffs_staging_no_duplicates
group by company, year(`date`)
order by sum(total_laid_off) desc;

create temporary table rank_per_year 
(
with company_year (company, years, total_laid_off_company) as 
	(
	select company, year(`date`), sum(total_laid_off)
	from world_layoffs.layoffs_staging_no_duplicates
	group by company, year(`date`)
	)
select *, dense_rank() over (partition by years order by total_laid_off_company desc) as Ranking
from company_year
where years is not null
order by Ranking asc, years desc
);

select * from rank_per_year;

select * from rank_per_year
where years = 2020;