/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

SELECT * FROM gold.fact_sales;

-- Calculate total sales per month
-- and the running total of sales over time
SELECT order_date, total_sales,
		SUM(total_sales) OVER (PARTITION BY order_date ORDER BY order_date) AS running_total
FROM 
(
	SELECT DATETRUNC(MONTH, order_date) order_date, SUM(sales_amount) total_sales
	FROM gold.fact_sales
	WHERE order_date IS NOT NULL
	GROUP BY DATETRUNC(MONTH, order_date)) t;

-- running total and moving average price over the years
SELECT order_date, total_sales,
		SUM(total_sales) OVER (ORDER BY order_date) AS running_total,
		AVG(average_price) OVER (ORDER BY order_date) AS moving_average
FROM 
(
	SELECT DATETRUNC(YEAR, order_date) order_date, 
		SUM(sales_amount) total_sales,
		AVG(price) average_price
	FROM gold.fact_sales
	WHERE order_date IS NOT NULL
	GROUP BY DATETRUNC(YEAR, order_date)) t;
