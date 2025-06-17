/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/


--- Find the dates of the first and last order as well as the timespan between them
SELECT MIN(order_date) first_order_date, 
		MAX(order_date) last_order_date,
		DATEDIFF(YEAR, MIN(order_date), MAX(order_date)) timespan_years
FROM gold.fact_sales

--- find youngest and oldest customers
SELECT customer_number, DATEDIFF(YEAR, birth_date, GETDATE()) AS age
FROM gold.dim_customers
WHERE DATEDIFF(YEAR, birth_date, GETDATE()) =   -- Oldest age
				(SELECT DATEDIFF(YEAR, MIN(birth_date), GETDATE())
				FROM gold.dim_customers)
	OR
		DATEDIFF(YEAR, birth_date, GETDATE()) =  -- Youngest age
				(SELECT DATEDIFF(YEAR, MAX(birth_date), GETDATE())
				FROM gold.dim_customers)
;
