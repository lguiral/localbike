--- Verify stocks and stores Relationship ---
--- Ensure every store_id in the stocks table exists in the stores table ---
SELECT COUNT(*) AS invalid_stocks
FROM `bigquery-projet-data.local_bike.stocks` s
LEFT JOIN `bigquery-projet-data.local_bike.stores` st
ON s.store_id = st.store_id
WHERE st.store_id IS NULL;
