--- Check cardinality: Number of order_items per order_id ---
--- Ensure there are no order_id entries with zero or unusually high order_items ---
SELECT o.order_id, COUNT(oi.item_id) AS item_count
FROM `bigquery-projet-data.local_bike.orders` o
LEFT JOIN `bigquery-projet-data.local_bike.order_items` oi
ON o.order_id = oi.order_id
GROUP BY o.order_id
ORDER BY item_count DESC;
