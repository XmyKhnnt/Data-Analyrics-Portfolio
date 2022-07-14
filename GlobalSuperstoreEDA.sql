
-- EDA on Global Superstore Sales
-- Exploratory Data Analysis
-- Dataset is from Kaggle


select *
from PortfolioProject_GlobalSuperstore..Orders$
order by 1


-- Counting the number of raws
select count(*) as Number_of_Raws
from PortfolioProject_GlobalSuperstore..Orders$


-- Undentifying if Order ID is a Unique value for primary key
select [order ID], count(*)
from PortfolioProject_GlobalSuperstore..Orders$
group by [Order ID]
having count(*) >1
-- Order ID cannot be used as a promary key because it is the same for every customer even if they have multple orders

-- Profit by customer name
select [Customer Name], sum(Profit)
from PortfolioProject_GlobalSuperstore..Orders$
group by [Customer Name] 


-- Item cannot be shipped before it was shipped.
-- Checking if order date is less than ship date

select *
from PortfolioProject_GlobalSuperstore..Orders$
where [Order Date]> [Ship Date]
-- No records is found. It means that everything is correct



--  Asking what are the distinct ship mode from the table
select distinct [Ship Mode]
from PortfolioProject_GlobalSuperstore..Orders$
--First Class
--Same Day
--Standard Class
--Second Class



-- Checking the maximum and minimum shipping days of every shipping mode 
-- Using sub query
select min(a.NumberOfDays) as MinimumDays, max(a.NumberOfDays) as MaximumDays
from (
select DATEDIFF(day, [order date], [ship date]) as NumberOfDays, *
from PortfolioProject_GlobalSuperstore..Orders$ ) as a
where [Ship Mode] = 'First Class'
--where [Ship Mode] = 'Same Day'
--where [Ship Mode] = 'Standard Class'
--where [Ship Mode] = 'Second class Class'



-- Checking how many orders in every order Id
select [Customer ID], [Order ID], COUNT(*)
from PortfolioProject_GlobalSuperstore..Orders$
group by [Customer ID], [Order ID]
order by 1


-- Checking orders per customer ID
select *
from PortfolioProject_GlobalSuperstore..Orders$
where [Order ID] = 'CA-2013-103982'