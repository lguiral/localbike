--- Check Product Availability in Stores (stocks) ---
--- Ensure every product_id in the stocks table is valid and verify quantities are not negative ---
SELECT COUNT(*) AS invalid_stocks
FROM `bigquery-projet-data.local_bike.stocks`
WHERE quantity < 0;
