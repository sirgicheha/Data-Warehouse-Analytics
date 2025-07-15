/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

SELECT * FROM gold.fact_sales;

-- Analyze sales performance over time
-- Using DATEPART to extract year and month for grouping
SELECT
	YEAR(order_date) order_year,
	MONTH(order_date) order_month,
	SUM(sales_amount) total_sales,
	COUNT(DISTINCT customer_key) total_customers,
	SUM(quantity) total_quantity
FROM gold.fact_sales
	WHERE order_date IS NOT NULL
	GROUP BY YEAR(order_date), MONTH(order_date)
	ORDER BY order_year, order_month;


-- Using DATENAME the sorting becomes an issue since it outputs a string; Same issue as using the format function
SELECT
	YEAR(order_date) order_year,
	DATENAME(MONTH, order_date) order_month,
	FORMAT(order_date, 'yyyy-MMM') order_date,
	SUM(sales_amount) total_sales,
	COUNT(DISTINCT customer_key) total_customers,
	SUM(quantity) total_quantity
FROM gold.fact_sales
	WHERE order_date IS NOT NULL
	GROUP BY YEAR(order_date), DATENAME(MONTH, order_date), FORMAT(order_date, 'yyyy-MMM')
	ORDER BY order_year;

-- Using DATETRUNC to group by month
-- This is more efficient and avoids string formatting issues
SELECT
	DATETRUNC(MONTH, order_date) order_date,
	SUM(sales_amount) total_sales,
	COUNT(DISTINCT customer_key) total_customers,
	SUM(quantity) total_quantity
FROM gold.fact_sales
	WHERE order_date IS NOT NULL
	GROUP BY DATETRUNC(MONTH, order_date)
	ORDER BY DATETRUNC(MONTH, order_date);