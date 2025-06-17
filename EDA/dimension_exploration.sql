/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/


-- Explore the countries customers come from
SELECT DISTINCT country
FROM gold.dim_customers;

-- Explore the different categories of products
SELECT DISTINCT category, subcategory, product_name
FROM gold.dim_products
ORDER BY 1,2,3;