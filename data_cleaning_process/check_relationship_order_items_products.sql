--- Verify order_items and products Relationship ---
--- Ensure every product_id in the order_items table exists in the products table ---
SELECT COUNT(*) AS invalid_products_in_order_items
FROM `bigquery-projet-data.local_bike.order_items` oi
LEFT JOIN `bigquery-projet-data.local_bike.products` p
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;
