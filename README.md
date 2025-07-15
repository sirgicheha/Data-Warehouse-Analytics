# Data Warehouse Analytics

This project contains a collection of SQL scripts and resources for exploring, analyzing, and reporting on data stored in a data warehouse environment. The focus is on providing practical queries and templates for common analytics tasks, including exploratory data analysis (EDA), ranking, magnitude analysis, and dimensional exploration.

> **Note:**  
> This project is a follow-up to a previous data warehouse project. It assumes that the data warehouse (including tables such as `gold.dim_customers`, `gold.dim_products`, and `gold.fact_sales`) has already been created and populated.  
> You can find the original data warehouse project on GitHub here: [Data Warehouse Project](https://github.com/sirgicheha/SQL-Data-Warehouse-Project).  
> The scripts in this repository are designed for analytics and reporting on top of the existing warehouse, not for defining or loading the warehouse schema itself.

## Folder Structure

- **EDA**  
  Contains SQL scripts for:
  - Database structure exploration
  - Date range and temporal analysis
  - Dimension table exploration
  - Magnitude and distribution analysis
  - Key business measures and metrics
  - Ranking and performance analysis

- **Analytics**  
 Contains SQL scripts for:
 - Change over time analysis
 - Cumulative analysis
 - Part to Whole Analysis
 - Performance Analysis
 - Data Segmentation Analysis
 - Customer and Product Reports

## Key Features

- **Database Exploration:**  
  Inspect tables, columns, and metadata using `INFORMATION_SCHEMA`.

- **Dimension & Date Analysis:**  
  Explore customer demographics, product categories, and date ranges.

- **Magnitude & Measures:**  
  Aggregate sales, customer counts, product counts, and other business metrics.

- **Ranking Analysis:**  
  Identify top and bottom performers among products and customers using window functions and ranking queries.

- **Change over time Analysis**
    Tracks trends, growth, and changes in key metrics over time. 

- **Cumulative Analysis**
    Tracks performance over time cumulatively for growth analysis or identifying long-term trends.

- **Performance Analysis**
    Measures the performance of products, customers, or regions over time for benchmarking and identifying high-performing entities.

- **Data Segmentation**
    Groups data into meaningful categories for targeted insights for customer segmentation, product categorization, or regional analysis.

- **Part to Whole Analysis**
    Compares performance or metrics across dimensions or time periods to evaluate differences between categories.

- **Customer Report**
    This report consolidates key customer metrics and behaviors

- **Products Report**
    This report consolidates key product metrics and behaviors.
## Usage

1. Open the SQL scripts in your preferred SQL editor.
2. Run the queries against your data warehouse (ensure the schema matches the references in the scripts).
3. Modify or extend the scripts as needed for your specific analytics requirements.

## Requirements

- SQL Server or compatible database supporting window functions and standard SQL syntax.
- Data warehouse with tables: `dim_customers`, `dim_products`, `fact_sales` (under the `gold` schema).

---