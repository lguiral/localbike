--- Verify staffs and stores Relationship ---
--- Ensure every store_id in the staffs table exists in the stores table ---
SELECT COUNT(*) AS invalid_staffs
FROM `bigquery-projet-data.local_bike.staffs` stf
LEFT JOIN `bigquery-projet-data.local_bike.stores` s
ON stf.store_id = s.store_id
WHERE s.store_id IS NULL;
