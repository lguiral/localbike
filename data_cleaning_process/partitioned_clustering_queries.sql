--- Partitioning & Clustering Recommendations ---
--- orders ---
--- Partition by order_date to optimize time-based queries (e.g., revenue over time, order trends) ---
--- Cluster by store_id and customer_id for location-specific or customer-specific sales analysis ---
CREATE TABLE `bigquery-projet-data.local_bike.orders_partitioned_clustered`
PARTITION BY partition_date -- Partition by order_date
CLUSTER BY store_id, customer_id -- Cluster by store_id and customer_id
AS (
SELECT
    *,
    DATE(order_date) AS partition_date
FROM `bigquery-projet-data.local_bike.orders`)


--- order_items ---
--- BigQuery does not allow partitioning with non-timestamp or non-date columns ---
--- No partitioning for the order_items table ---
--- Cluster by product_id to speed up queries involving product performance ---
CREATE TABLE `bigquery-projet-data.local_bike.order_items_partitioned_clustered`
CLUSTER BY product_id -- Cluster by product_id
AS (
SELECT
    *
FROM `bigquery-projet-data.local_bike.order_items`)

--- stocks ---
--- No partitioning for the stocks table ---
--- Cluster by product_id for queries tracking specific product availability ---
CREATE TABLE `bigquery-projet-data.local_bike.stocks_partitioned_clustered`
CLUSTER BY product_id -- Cluster by product_id
AS (
SELECT
    *
FROM `bigquery-projet-data.local_bike.stocks`)


