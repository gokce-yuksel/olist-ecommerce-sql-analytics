-- fct_product_performance.sql
-- Ürün performansı: satış adedi, gelir, ortalama fiyat, kategori, review skorları

WITH order_items AS (
    SELECT
        order_id,
        product_id,
        seller_id,
        price,
        freight_value
    FROM {{ ref('stg_olist_order_items') }}
),

orders AS (
    SELECT
        order_id,
        order_revenue,
        order_status,
        order_date
    FROM {{ ref('fact_orders') }}
    WHERE order_status NOT IN ('canceled', 'unavailable')
),

reviews AS (
    SELECT
        order_id,
        review_score
    FROM {{ ref('stg_olist_order_reviews') }}
),

combined AS (
    SELECT
        oi.product_id,
        oi.seller_id,
        o.order_id,
        o.order_revenue,
        oi.price,
        oi.freight_value,
        o.order_date,
        r.review_score
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    LEFT JOIN reviews r ON oi.order_id = r.order_id
),

product_agg AS (
    SELECT
        product_id,
        COUNT(order_id) AS total_orders,
        SUM(price) AS total_product_sales,
        SUM(freight_value) AS total_freight_cost,
        SUM(price + freight_value) AS total_revenue_contribution,
        AVG(price) AS avg_price,
        AVG(review_score) AS avg_review_score
    FROM combined
    GROUP BY product_id
)

SELECT
    p.product_id,
    dp.product_category_name,
    dp.product_category_name_english,
    dp.product_photos_qty,
    dp.product_weight_g,
    dp.product_length_cm,
    dp.product_height_cm,
    dp.product_width_cm,
    
    pa.total_orders,
    pa.total_product_sales,
    pa.total_freight_cost,
    pa.total_revenue_contribution,
    pa.avg_price,
    pa.avg_review_score,

    -- basit "product score" metriği
    ROUND(pa.total_orders * COALESCE(pa.avg_review_score, 3), 2) AS product_score

FROM product_agg pa
LEFT JOIN {{ ref('dim_products') }} dp 
    ON pa.product_id = dp.product_id;
