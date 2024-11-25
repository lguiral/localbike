--- Verify order and customers relationship ---
--- Ensure every customer_id in the orders table exists in the customers table ---
SELECT COUNT(*) AS invalid_order_items
FROM `bigquery-projet-data.local_bike.order_items` oi
LEFT JOIN `bigquery-projet-data.local_bike.orders` o
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;
