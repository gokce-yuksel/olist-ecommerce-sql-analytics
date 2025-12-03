-- fact_orders.sql
-- Her sipariş için ürün, ödeme ve teslimat bilgilerini birleştiren temel fact tablo

WITH orders AS (
    SELECT * FROM {{ ref('stg_olist_orders') }}
),

items AS (
    SELECT
        order_id,
        SUM(price) AS items_price,
        SUM(freight_value) AS freight_value,
        COUNT(*) AS items_count
    FROM {{ ref('stg_olist_order_items') }}
    GROUP BY order_id
),

payments AS (
    SELECT
        order_id,
        SUM(payment_value) AS total_payment_value,
        COUNT(*) AS payment_methods_count
    FROM {{ ref('stg_olist_order_payments') }}
    GROUP BY order_id
)

SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    DATE(o.order_purchase_ts) AS order_date,

    -- Revenue
    i.items_price,
    i.freight_value,
    (i.items_price + i.freight_value) AS order_revenue,

    -- Payment
    p.total_payment_value,

    -- Items
    i.items_count,

    -- Delivery info
    o.order_delivered_customer_ts,
    o.order_estimated_delivery_ts,

    -- Delivery Duration (days)
    DATE_DIFF(o.order_delivered_customer_ts, o.order_purchase_ts, DAY) AS delivery_days,

    -- Late Delivery Flag
    CASE
        WHEN o.order_delivered_customer_ts > o.order_estimated_delivery_ts THEN 1
        ELSE 0
    END AS is_late

FROM orders o
LEFT JOIN items i ON o.order_id = i.order_id
LEFT JOIN payments p ON o.order_id = p.order_id;
