SELECT
    CAST(order_id AS STRING) AS order_id,
    CAST(product_id AS STRING) AS product_id,
    CONCAT(CAST(order_id AS STRING), '-', CAST(product_id AS STRING)) AS order_item_id,
    CAST(quantity AS INT) AS quantity,
    CAST(list_price AS FLOAT64) AS list_price,
    CAST(discount AS FLOAT64) AS discount
FROM {{ source('local_bike', 'order_items') }}
WHERE order_id IS NOT NULL
    AND product_id IS NOT NULL
