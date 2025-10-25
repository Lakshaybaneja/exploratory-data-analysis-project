-- Which 5 Products generates the highest revenue?
select TOP 5
	dp.product_name,
	SUM(sales_amount) AS revenue_generated
from gold.fact_sales fs
LEFT JOIN gold.dim_products AS dp
ON fs.product_key=dp.product_key
GROUP BY dp.product_name
ORDER BY revenue_generated DESC 

-- What are the 5 worst performing products in terms of sales?
select TOP 5
	dp.product_name,
	SUM(sales_amount) AS revenue_generated
from gold.fact_sales fs
LEFT JOIN gold.dim_products AS dp
ON fs.product_key=dp.product_key
GROUP BY dp.product_name
ORDER BY revenue_generated

-- Find the top 10 customers who have generated the highest revenue
SELECT TOP 10
	dc.customer_key,
	dc.first_name,
	dc.last_name,
	SUM(fs.sales_amount) AS total_revenue
FROM gold.fact_sales fs
LEFT JOIN gold.dim_customers dc
ON fs.customer_key = dc.customer_key
GROUP BY
	dc.customer_key,
	dc.first_name,
	dc.last_name
	ORDER BY total_revenue DESC
	
-- Find 3 customers with fewestS orders placed
SELECT TOP 3
	dc.customer_key,
	dc.first_name,
	dc.last_name,
	COUNT(DISTINCT fs.order_number) AS total_orders
FROM gold.fact_sales fs
LEFT JOIN gold.dim_customers dc
ON fs.customer_key = dc.customer_key
GROUP BY
	dc.customer_key,
	dc.first_name,
	dc.last_name
	ORDER BY total_orders 
