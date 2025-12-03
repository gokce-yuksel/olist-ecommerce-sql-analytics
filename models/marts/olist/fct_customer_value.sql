-- fct_customer_value.sql
-- Müşteri davranışları, sipariş frekansı, AOV ve CLV hesaplamalarını içeren fact tablo

WITH orders AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        order_revenue
    FROM {{ ref('fact_orders') }}
    WHERE order_status NOT IN ('canceled', 'unavailable')
),

customer_agg AS (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders,
        SUM(order_revenue) AS total_revenue,
        AVG(order_revenue) AS avg_order_value,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS last_order_date,
        DATE_DIFF(MAX(order_date), MIN(order_date), DAY) AS active_days,
        CASE 
            WHEN COUNT(order_id) > 1 THEN
                DATE_DIFF(MAX(order_date), MIN(order_date), DAY) / (COUNT(order_id) - 1)
            ELSE NULL
        END AS avg_order_interval
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_id,
    ca.total_orders,
    ca.total_revenue,
    ca.avg_order_value,
    ca.first_order_date,
    ca.last_order_date,
    ca.active_days,
    ca.avg_order_interval,

    -- Simple CLV Approximation
    ROUND(ca.avg_order_value * (ca.total_orders / NULLIF(ca.active_days / 30, 0)), 2) AS simple_clv
FROM customer_agg ca
JOIN {{ ref('dim_customers') }} c
    ON ca.customer_id = c.customer_id;
