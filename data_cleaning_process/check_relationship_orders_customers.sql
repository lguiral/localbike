--- Verify orders and customers Relationship ---
--- Ensure every customer_id in the orders table exists in the customers table ---
SELECT COUNT(*) AS invalid_orders
FROM `bigquery-projet-data.local_bike.orders` o
LEFT JOIN `bigquery-projet-data.local_bike.customers` c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
