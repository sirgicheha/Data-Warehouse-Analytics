/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/


-- Find the Total Sales
SELECT SUM(sales_amount) total_sales
FROM gold.fact_sales;


-- Find how many items were sold
SELECT SUM(quantity) total_items_sold
FROM gold.fact_sales;


-- Find the average selling price
SELECT AVG(price) average_selling_price
FROM gold.fact_sales;


-- Find the total number of products
SELECT COUNT(*)
FROM gold.dim_products;


-- Find the total number of customers
SELECT COUNT(*)
FROM gold.dim_customers;


-- Find the total number of customers that have placed orders
SELECT COUNT(DISTINCT customer_key) total_customers
FROM gold.fact_sales;


-- Generate a report that shoows all key metrics of the business
SELECT 'Total Sales' as measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity' as measure_name, SUM(quantity) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Average Price' as measure_name, AVG(price) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders' as measure_name, COUNT(order_number) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Products' as measure_name, COUNT(DISTINCT product_name) AS measure_value FROM gold.dim_products
UNION ALL
SELECT 'Total Customers' as measure_name, COUNT(DISTINCT customer_key) AS measure_value FROM gold.dim_customers