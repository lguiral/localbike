--- Verify products and categories Relationship ---
--- Ensure every category_id in the products table exists in the categories table ---
SELECT COUNT(*) AS invalid_categories_in_products
FROM `bigquery-projet-data.local_bike.products` p
LEFT JOIN `bigquery-projet-data.local_bike.categories` c
ON p.category_id = c.category_id
WHERE c.category_id IS NULL;
