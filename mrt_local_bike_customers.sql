SELECT
    c.order_date,
    c.customer_id,
    c.total_orders,
    o.total_revenue as total_spent,
    c.active_days,
    c.avg_revenue_per_order,
    c.last_order_date,
    c.first_order_date,
    COUNT(DISTINCT CASE WHEN o.order_status = "1" OR o.order_status = "2" THEN o_2.order_id END) /
    COUNT(DISTINCT o_2.order_id) AS repeat_customer_rate,
    CASE
        WHEN MAX(c.order_date) < DATE_SUB(o_2.shipped_date, INTERVAL 6 MONTH) THEN 1
        ELSE 0
    END AS churn_risk
FROM {{ ref('int_local_bike__orders') }} AS o
LEFT JOIN {{ ref('stg_local_bike__orders') }} AS o_2 ON o.customer_id = o_2.customer_id
LEFT JOIN {{ ref('int_local_bike__customers') }} AS c ON o.customer_id = c.customer_id
GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, o_2.shipped_date
ORDER BY total_spent DESC