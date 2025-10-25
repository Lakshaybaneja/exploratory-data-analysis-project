-- Find the date of the first and last order
-- How many years of sales are available
SELECT MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(year,MIN(order_date),MAX(order_date)) AS order_range
FROM 
gold.fact_sales

-- Find the youngest and the oldest customer
SELECT MAX(birthdate) AS youngest_customer,
DATEDIFF(year,MAX(birthdate),GETDATE()) AS youngest_customer_age,
MIN(birthdate) AS oldest_customer,
DATEDIFF(year,MIN(birthdate),GETDATE()) AS oldest_customer_age
FROM gold.dim_customers;
