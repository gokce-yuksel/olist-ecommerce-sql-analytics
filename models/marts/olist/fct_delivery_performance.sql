-- fct_delivery_performance.sql
-- Teslimat süresi, gecikme ve review skorlarını analiz eden fact tablo

WITH orders AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        order_status,
        order_delivered_customer_ts,
        order_estimated_delivery_ts,
        delivery_days,
        is_late
    FROM {{ ref('fact_orders') }}
    WHERE order_status NOT IN ('canceled', 'unavailable')
),

reviews AS (
    SELECT
        order_id,
        review_score
    FROM {{ ref('stg_olist_order_reviews') }}
),

customers AS (
    SELECT
        customer_id,
        customer_city,
        customer_state
    FROM {{ ref('dim_customers') }}
),

final AS (
    SELECT
        o.order_id,
        o.customer_id,
        c.customer_city,
        c.customer_state,
        o.order_date,

        -- Delivery performance
        o.delivery_days,
        o.is_late,
        o.order_delivered_customer_ts,
        o.order_estimated_delivery_ts,

        -- Reviews
        r.review_score,

        -- Delivery impact metric
        CASE 
            WHEN o.is_late = 1 THEN 'Late Delivery'
            ELSE 'On-Time Delivery'
        END AS delivery_status
    FROM orders o
    LEFT JOIN reviews r ON o.order_id = r.order_id
    LEFT JOIN customers c ON o.customer_id = c.customer_id
)

SELECT * FROM final;
