/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/


-- Which 5 products generate the highest revenue
SELECT TOP (5) p.product_name, SUM(s.sales_amount) total_revenue
FROM gold.dim_products p
LEFT JOIN gold.fact_sales s
		ON p.product_key = s.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;


-- Alternatively using Rank/ row_number
-- Using RANK() to rank products by revenue
-- This will rank products based on their total revenue and return the top 5
SELECT *
FROM 
(
	SELECT p.product_name, SUM(s.sales_amount) total_revenue,
			RANK() OVER (ORDER BY SUM(s.sales_amount) DESC) AS ranked
	FROM gold.dim_products p
	LEFT JOIN gold.fact_sales s
			ON p.produc t_key = s.product_key
	GROUP BY p.product_name) t
WHERE ranked <= 5;

-- What are the 5 worst performing products in terms of sales
SELECT TOP (5) p.product_name, SUM(s.sales_amount) total_revenue
FROM gold.dim_products p
LEFT JOIN gold.fact_sales s
		ON p.product_key = s.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC;



-- Find the top 10 customers who have generated the highest revenue
SELECT TOP 10
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC;



-- The 3 customers with the fewest orders placed
SELECT TOP 3
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders ;