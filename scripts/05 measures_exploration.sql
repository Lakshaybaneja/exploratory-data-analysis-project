-- Find the total sales
SELECT SUM(sales_amount) AS total_sales
FROM gold.fact_sales;

-- Find how many items are sold
SELECT SUM(quantity) AS total_items_sold
FROM gold.fact_sales;

-- Find the average selling price
SELECT AVG(price) AS avg_selling_price
FROM gold.fact_sales;

-- Find the total number of orders
SELECT COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales;

-- Find the total number of products
SELECT COUNT(DISTINCT product_key) AS total_products
FROM gold.dim_products;

-- Find the total number of customers
SELECT COUNT( customer_key) AS total_customers
FROM gold.dim_customers;

-- Find the total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) AS total_customers
FROM gold.fact_sales;


--GENERATE A REPORT THAT SHOWS ALL KEY METRICS OF THE BUSINESS
SELECT 'Total_Sales' AS measure_name,SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL 
SELECT 'Total_Items' AS measure_name,SUM(quantity) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Avg_Selling_Pirce' AS measure_name,AVG(price) AS measure_value FROM gold.fact_sales
UNION ALL 
SELECT 'Total_Orders' AS measure_name,COUNT(DISTINCT order_number) AS measure_value FROM gold.fact_sales
UNION ALL 
SELECT 'Total_Products' AS measure_name,COUNT(DISTINCT product_key) AS measure_value FROM gold.dim_products
UNION ALL 
SELECT 'Total_Customers' AS measure_name,COUNT(customer_key) AS measure_value FROM gold.dim_customers

